;// MIT License
;//
;// Developer: Kevin Thomas
;//
;// Copyright (c) 2021 My Techno Talent, LLC
;//
;// Permission is hereby granted, free of charge, to any person obtaining a copy
;// of this software and associated documentation files (the "Software"), to deal
;// in the Software without restriction, including without limitation the rights
;// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
;// copies of the Software, and to permit persons to whom the Software is
;// furnished to do so, subject to the following conditions:
;//
;// The above copyright notice and this permission notice shall be included in all
;// copies or substantial portions of the Software.
;//
;// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
;// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
;// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
;// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
;// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
;// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
;// SOFTWARE.

                        AREA    PA0ButtonHandlerProg,CODE,READONLY,ALIGN=2
                        GET     STM32F401CCUx_Driver.s
                        ENTRY
                        EXPORT  __main                   
__main
                        bl      ConfigPortA
                        bl      ConfigPortC
MainLoop    
                        bl      PA0ButtonHandler
                        bl      MainLoop
PA0ButtonHandler                    
                        push    {lr}
                        bl      PortCBitReset13
                        ldr     r0,=GPIOA_IDR    
                        ldr     r1,[r0]
                        and     r1,#GPIOA_IDR0_1
                        cmp     r1,#0
                        beq     PortCBitSet13
                        pop     {pc}

                        ALIGN
                        END