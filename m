From: anup@brainfault.org (Anup Patel)
Date: Thu, 5 Jul 2018 07:47:18 +0530
Subject: [RFC PATCH 2/2] riscv: Introduce per cpu based local timer
 interrupt
In-Reply-To: <aeb8586e-8732-8d86-8750-b66807cbd601@wdc.com>
References: <1530295283-191270-1-git-send-email-atish.patra@wdc.com>
 <1530295283-191270-3-git-send-email-atish.patra@wdc.com>
 <56682a4c-c83f-c10b-0979-330f92cb3ccf@arm.com>
 <028fb362-0f4e-25b5-b707-7cc3653cbc05@wdc.com>
 <5c65bc1b-a64c-e93c-84e6-5a576617f64f@arm.com>
 <aeb8586e-8732-8d86-8750-b66807cbd601@wdc.com>
Message-ID: <CAAhSdy2A9Z_BtzYR8H-AgJu2DNyrY-7gcBfKTjkwssist9oqXQ@mail.gmail.com>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

Hi Atish,

>
> We have different interrupt number(Linux IRQ number) because of per cpu
> based interrupt controller called as Hart Level Interrupt Controller (HLIC).
> Some more details are on this patch.
>
> https://lkml.org/lkml/2018/6/22/914
>
> Thus, each HLIC registers it's own irq domain. Each timer interrupt in DT
> defines that CPU's HLIC as it's interrupt parent. Here is an example of DT.
>
>
> +       L3: cpus {
> +               #address-cells = <1>;
> +               ..
> +               ..
> +               L9: cpu at 0 {
> +               ..
> +               ..
> +                       L10: interrupt-controller {
> +                               ..
> +                               ..
> +                               compatible = "riscv,cpu-intc";
> +                               interrupt-controller;
> +                       }
> +                       timer {
> +                            interrupts = <5>;
> +                            interrupt-parent = <&L10>;
> +                            compatible = "riscv,local-timer";
> +                       }
> +               }
>
> Is this design not acceptable or breaks something?

I think its more about fully utilising the capabilities of
Linux IRQ subsystem.

The Linux IRQ subsystem has capability of handling
per-CPU IRQs.

The best matching case in ARM world (with your use-case)
is the RPi3 board where we have local IRQCHIP for each
CPU as-well-as timer in each CPU. (Very similar to
RISC-V systems).

Refer, arch/arm/boot/dts/bcm2837.dtsi

I think it would be best to have only one DT node
for per-CPU local INTC and per-CPU timer.

Regards,
Anup
