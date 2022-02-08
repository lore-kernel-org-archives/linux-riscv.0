Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E68B6C433F5
	for <linux-riscv@archiver.kernel.org>; Tue,  8 Feb 2022 13:30:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OtgO752V7WFP4SntPRo9p6cdMT+sA4rEoLLiQiyKFFM=; b=TYraultPLlbBJb
	Fj4z2vp3PCx+6FTa8aPnFqQ5aCKUAtNY6R/qHP+xl1GdnertNiaWylsM6jt+8dYdot8LxAZ4JT8TY
	ATdK9soXzJnBQ4/dim8VkZk9H4Ta2NiSCA+Ui3ey1vJWLIQMXLgtqnZQ6eMpCU6BWGEUNB3HpxbdL
	3KCGFGsyph8IACuPOSpF4EnLUMtO289s4mn86RiMRXMWhh7ZpRA0aZyBLGpL88viQ/3QaLijvJYkE
	pa1utwgvwA4xcPuCiSDnH+150gItHshkTssLeHjE46Ih8DPdwPDDiRQao89ONsoG6HCtQ8uTACjOB
	u+/uMg9adRnNlTbwXn6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nHQZR-00E7Ge-2v; Tue, 08 Feb 2022 13:30:13 +0000
Received: from mail-lf1-x12f.google.com ([2a00:1450:4864:20::12f])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nHQV5-00E5eZ-6Y
 for linux-riscv@lists.infradead.org; Tue, 08 Feb 2022 13:25:45 +0000
Received: by mail-lf1-x12f.google.com with SMTP id b9so33239695lfq.6
 for <linux-riscv@lists.infradead.org>; Tue, 08 Feb 2022 05:25:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=lny4ffeOmlAWmAhhC6w2MPb+qvylm9VN3ou4FJF3FSg=;
 b=VirhubwIxhdEGMhodDk5heZJzVB9TwaU53Glaxv1T4m4hj3BRsGW2kAYXgr501KNYy
 9h9t+PsxWqNPSyOif6GQN20ZewpkPxf/xFcEzZGF7Q6WbFh0z7HNmbCa6z8pPPKrb4dY
 ANRn72yJKENQLCGcDrBQ1D1wIk91MmGbUaTUspgG4bCZsSm+CEdCnniT8aIjZBXTuxiv
 J7PIUbhaeadIMiFCxXevHGKKD/0Wy3ivoFI42MafrI56DnwyWi6ECtx55hwIZTdIf7oO
 rfRbSIfoqGLiJ8wiMWeFI7DCasHclVX0qEhnbrIxRhuuynv67lKAVDZi4OixMwH5m8Dq
 YzaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=lny4ffeOmlAWmAhhC6w2MPb+qvylm9VN3ou4FJF3FSg=;
 b=NOgDvZ12Rwrmz93V+p4A0KJ2ogaCFqU4XoUe3Nimev8pPeOTEqqTpyxJYwG8colZgv
 MEW4E5UWeG0TfFIRLkerNNocUqtR+5JjTVasDmqGNlIj6+ds/XCVzmh8dzfgqAoncErN
 z8UD/GM7KZSxlCJ5YhQIF3z+h/rPcjHJc4lq2IIPwKChL21SyY07jNHjRGByj9LBJEol
 Ln9MhyX6MKPESzOgXoVA9/MOGSZNu54uI+EQG9KdISeA+FCvz2HYoHIuSf58Xwoa7jsw
 B1LzOg66MQ79K65/X/zXtBNKPuQIyumt8VY71WWq5YRVrSxqtCFGjyKBXAyJBlpkHsjA
 0KaQ==
X-Gm-Message-State: AOAM533/QMka6cxw9u6m5BzFU2xgaQDUFjl6Fnli8DUsBt+zOjQSPQKP
 B9FogPO7CCWyKHIPROeYqHpVMjqV5y7k5z1nDOgjpw==
X-Google-Smtp-Source: ABdhPJyJ6T3HU6OfDNL2sbGfrmpzh/eSy47DFkiQaOugIQYubbrvneRYk88T5Q0+nDcL0tq7IldBBWoSHcjwbnS8SMA=
X-Received: by 2002:a05:6512:33c8:: with SMTP id
 d8mr2975541lfg.41.1644326739962; 
 Tue, 08 Feb 2022 05:25:39 -0800 (PST)
MIME-Version: 1.0
References: <20220126114452.692512-1-apatel@ventanamicro.com>
 <20220126114452.692512-9-apatel@ventanamicro.com>
 <CAJF2gTQsSn1KBgX2bg2LiSUbCmbGD3oF5KcmK5gq2Dd49BWDBQ@mail.gmail.com>
 <CAAhSdy3Dkv6ga0ZMp5rMFa8nV9EDHgOMBwuJ4z4-w52T8EaUag@mail.gmail.com>
 <CAJF2gTSLmBcgUUE3VGsEq0JCWV74Yy-pkduS66rk=VPVwxk59g@mail.gmail.com>
In-Reply-To: <CAJF2gTSLmBcgUUE3VGsEq0JCWV74Yy-pkduS66rk=VPVwxk59g@mail.gmail.com>
From: Anup Patel <apatel@ventanamicro.com>
Date: Tue, 8 Feb 2022 18:55:28 +0530
Message-ID: <CAK9=C2WqczG=tH1u9zcLt7Em+fPD1ZZwtDhf1yHJ70-o-HL8OQ@mail.gmail.com>
Subject: Re: [PATCH v10 8/8] RISC-V: Enable RISC-V SBI CPU Idle driver for
 QEMU virt machine
To: Guo Ren <guoren@kernel.org>
Cc: Anup Patel <anup@brainfault.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Paul Walmsley <paul.walmsley@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Ulf Hansson <ulf.hansson@linaro.org>, 
 "Rafael J . Wysocki" <rjw@rjwysocki.net>, Pavel Machek <pavel@ucw.cz>,
 Rob Herring <robh+dt@kernel.org>, 
 Sandeep Tripathy <milun.tripathy@gmail.com>,
 Atish Patra <atishp@atishpatra.org>, 
 Alistair Francis <Alistair.Francis@wdc.com>, Liush <liush@allwinnertech.com>, 
 devicetree <devicetree@vger.kernel.org>,
 linux-riscv <linux-riscv@lists.infradead.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
 "open list:THERMAL" <linux-pm@vger.kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>, 
 kvm-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220208_052543_337707_045251E1 
X-CRM114-Status: GOOD (  24.30  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Tue, Feb 8, 2022 at 3:47 PM Guo Ren <guoren@kernel.org> wrote:
>
> On Tue, Feb 8, 2022 at 4:54 PM Anup Patel <anup@brainfault.org> wrote:
> >
> > On Tue, Feb 8, 2022 at 12:16 PM Guo Ren <guoren@kernel.org> wrote:
> > >
> > > Another question:
> > >
> > > Have you put "idle-states {" in qemu's DTS? or how do you test your patches?
> >
> > I usually do the following:
> > 1) Dump QEMU virt machine DTB
> > 2) Convert QEMU virt machine DTB into DTS
> > 3) Add "idle-states" in QEMU virt machine DTS
> > 4) Create QEMU virt machine DTB with "idle-states"
> > 5) Use the new QEMU virt machine DTB for testing this series.
> >
> > Here's one of the DTS files which I used for testing on QEMU virt machine:
> >
> > /dts-v1/;
> >
> > / {
> >     #address-cells = <0x02>;
> >     #size-cells = <0x02>;
> >     compatible = "riscv-virtio";
> >     model = "riscv-virtio,qemu";
> >
> >     chosen {
> >         linux,initrd-end = <0x8855d200>;
> >         linux,initrd-start = <0x88200000>;
> >         bootargs = "root=/dev/ram rw console=ttyS0 earlycon";
> >         stdout-path = "/soc/uart@10000000";
> >     };
> >
> >     memory@80000000 {
> >         device_type = "memory";
> >         reg = <0x00 0x80000000 0x00 0x10000000>;
> >     };
> >
> >     cpus {
> >         #address-cells = <0x01>;
> >         #size-cells = <0x00>;
> >         timebase-frequency = <0x989680>;
> >
> >         cpu@0 {
> >             phandle = <0x07>;
> >             device_type = "cpu";
> >             reg = <0x00>;
> >             status = "okay";
> >             compatible = "riscv";
> >             riscv,isa = "rv64imafdcsu";
> >             mmu-type = "riscv,sv48";
> >             cpu-idle-states = <&CPU_NONRET_DEF>;
> >
> >             interrupt-controller {
> >                 #interrupt-cells = <0x01>;
> >                 interrupt-controller;
> >                 compatible = "riscv,cpu-intc";
> >                 phandle = <0x08>;
> >             };
> >         };
> >
> >         cpu@1 {
> >             phandle = <0x05>;
> >             device_type = "cpu";
> >             reg = <0x01>;
> >             status = "okay";
> >             compatible = "riscv";
> >             riscv,isa = "rv64imafdcsu";
> >             mmu-type = "riscv,sv48";
> >             cpu-idle-states = <&CPU_RET_DEF>;
> >
> >             interrupt-controller {
> >                 #interrupt-cells = <0x01>;
> >                 interrupt-controller;
> >                 compatible = "riscv,cpu-intc";
> >                 phandle = <0x06>;
> >             };
> >         };
> >
> >         cpu@2 {
> >             phandle = <0x03>;
> >             device_type = "cpu";
> >             reg = <0x02>;
> >             status = "okay";
> >             compatible = "riscv";
> >             riscv,isa = "rv64imafdcsu";
> >             mmu-type = "riscv,sv48";
> >             cpu-idle-states = <&CPU_NONRET_DEF>;
> >
> >             interrupt-controller {
> >                 #interrupt-cells = <0x01>;
> >                 interrupt-controller;
> >                 compatible = "riscv,cpu-intc";
> >                 phandle = <0x04>;
> >             };
> >         };
> >
> >         cpu@3 {
> >             phandle = <0x01>;
> >             device_type = "cpu";
> >             reg = <0x03>;
> >             status = "okay";
> >             compatible = "riscv";
> >             riscv,isa = "rv64imafdcsu";
> >             mmu-type = "riscv,sv48";
> >             cpu-idle-states = <&CPU_RET_DEF>;
> >
> >             interrupt-controller {
> >                 #interrupt-cells = <0x01>;
> >                 interrupt-controller;
> >                 compatible = "riscv,cpu-intc";
> >                 phandle = <0x02>;
> >             };
> >         };
> >
> >         cpu-map {
> >
> >             cluster0 {
> >
> >                 core0 {
> >                     cpu = <0x07>;
> >                 };
> >
> >                 core1 {
> >                     cpu = <0x05>;
> >                 };
> >
> >                 core2 {
> >                     cpu = <0x03>;
> >                 };
> >
> >                 core3 {
> >                     cpu = <0x01>;
> >                 };
> >             };
> >         };
> >
> >         idle-states {
> >             CPU_RET_DEF: cpu-retentive-default {
> >                 compatible = "riscv,idle-state";
> >                 riscv,sbi-suspend-param = <0x00000000>;
> >                 entry-latency-us = <10>;
> >                 exit-latency-us = <10>;
> >                 min-residency-us = <100>;
> >             };
> >
> >             CPU_NONRET_DEF: cpu-nonretentive-default {
> >                 compatible = "riscv,idle-state";
> >                 riscv,sbi-suspend-param = <0x80000000>;
> >                 entry-latency-us = <100>;
> >                 exit-latency-us = <100>;
> >                 min-residency-us = <1000>;
> >             };
> >         };
> >     };
> >
> >     soc {
> >         #address-cells = <0x02>;
> >         #size-cells = <0x02>;
> >         compatible = "simple-bus";
> >         ranges;
> >
> >         flash@20000000 {
> >             bank-width = <0x04>;
> >             reg = <0x00 0x20000000 0x00 0x2000000 0x00 0x22000000 0x00
> > 0x2000000>;
> >             compatible = "cfi-flash";
> >         };
> >
> >         rtc@101000 {
> >             interrupts = <0x0b>;
> >             interrupt-parent = <0x09>;
> >             reg = <0x00 0x101000 0x00 0x1000>;
> >             compatible = "google,goldfish-rtc";
> >         };
> >
> >         uart@10000000 {
> >             interrupts = <0x0a>;
> >             interrupt-parent = <0x09>;
> >             clock-frequency = <0x384000>;
> >             reg = <0x00 0x10000000 0x00 0x100>;
> >             compatible = "ns16550a";
> >         };
> >
> >         poweroff {
> >             value = <0x5555>;
> >             offset = <0x00>;
> >             regmap = <0x0a>;
> >             compatible = "syscon-poweroff";
> >         };
> >
> >         reboot {
> >             value = <0x7777>;
> >             offset = <0x00>;
> >             regmap = <0x0a>;
> >             compatible = "syscon-reboot";
> >         };
> >
> >         test@100000 {
> >             phandle = <0x0a>;
> >             reg = <0x00 0x100000 0x00 0x1000>;
> >             compatible = "sifive,test1\0sifive,test0\0syscon";
> >         };
> >
> >         pci@30000000 {
> >             interrupt-map-mask = <0x1800 0x00 0x00 0x07>;
> >             interrupt-map = <0x00 0x00 0x00 0x01 0x09 0x20 0x00 0x00
> > 0x00 0x02 0x09 0x21 0x00 0x00 0x00 0x03 0x09 0x22 0x00 0x00 0x00 0x04
> > 0x09 0x23 0x800 0x00 0x00 0x01 0x09 0x21 0x800 0x00 0x00 0x02 0x09
> > 0x22 0x800 0x00 0x00 0x03 0x09 0x23 0x800 0x00 0x00 0x04 0x09 0x20
> > 0x1000 0x00 0x00 0x01 0x09 0x22 0x1000 0x00 0x00 0x02 0x09 0x23 0x1000
> > 0x00 0x00 0x03 0x09 0x20 0x1000 0x00 0x00 0x04 0x09 0x21 0x1800 0x00
> > 0x00 0x01 0x09 0x23 0x1800 0x00 0x00 0x02 0x09 0x20 0x1800 0x00 0x00
> > 0x03 0x09 0x21 0x1800 0x00 0x00 0x04 0x09 0x22>;
> >             ranges = <0x1000000 0x00 0x00 0x00 0x3000000 0x00 0x10000
> > 0x2000000 0x00 0x40000000 0x00 0x40000000 0x00 0x40000000>;
> >             reg = <0x00 0x30000000 0x00 0x10000000>;
> >             dma-coherent;
> >             bus-range = <0x00 0xff>;
> >             linux,pci-domain = <0x00>;
> >             device_type = "pci";
> >             compatible = "pci-host-ecam-generic";
> >             #size-cells = <0x02>;
> >             #interrupt-cells = <0x01>;
> >             #address-cells = <0x03>;
> >         };
> >
> >         virtio_mmio@10008000 {
> >             interrupts = <0x08>;
> >             interrupt-parent = <0x09>;
> >             reg = <0x00 0x10008000 0x00 0x1000>;
> >             compatible = "virtio,mmio";
> >         };
> >
> >         virtio_mmio@10007000 {
> >             interrupts = <0x07>;
> >             interrupt-parent = <0x09>;
> >             reg = <0x00 0x10007000 0x00 0x1000>;
> >             compatible = "virtio,mmio";
> >         };
> >
> >         virtio_mmio@10006000 {
> >             interrupts = <0x06>;
> >             interrupt-parent = <0x09>;
> >             reg = <0x00 0x10006000 0x00 0x1000>;
> >             compatible = "virtio,mmio";
> >         };
> >
> >         virtio_mmio@10005000 {
> >             interrupts = <0x05>;
> >             interrupt-parent = <0x09>;
> >             reg = <0x00 0x10005000 0x00 0x1000>;
> >             compatible = "virtio,mmio";
> >         };
> >
> >         virtio_mmio@10004000 {
> >             interrupts = <0x04>;
> >             interrupt-parent = <0x09>;
> >             reg = <0x00 0x10004000 0x00 0x1000>;
> >             compatible = "virtio,mmio";
> >         };
> >
> >         virtio_mmio@10003000 {
> >             interrupts = <0x03>;
> >             interrupt-parent = <0x09>;
> >             reg = <0x00 0x10003000 0x00 0x1000>;
> >             compatible = "virtio,mmio";
> >         };
> >
> >         virtio_mmio@10002000 {
> >             interrupts = <0x02>;
> >             interrupt-parent = <0x09>;
> >             reg = <0x00 0x10002000 0x00 0x1000>;
> >             compatible = "virtio,mmio";
> >         };
> >
> >         virtio_mmio@10001000 {
> >             interrupts = <0x01>;
> >             interrupt-parent = <0x09>;
> >             reg = <0x00 0x10001000 0x00 0x1000>;
> >             compatible = "virtio,mmio";
> >         };
> >
> >         plic@c000000 {
> >             phandle = <0x09>;
> >             riscv,ndev = <0x35>;
> >             reg = <0x00 0xc000000 0x00 0x210000>;
> >             interrupts-extended = <0x08 0x0b 0x08 0x09 0x06 0x0b 0x06
> > 0x09 0x04 0x0b 0x04 0x09 0x02 0x0b 0x02 0x09>;
> >             interrupt-controller;
> >             compatible = "riscv,plic0";
> >             #interrupt-cells = <0x01>;
> >             #address-cells = <0x00>;
> >         };
> >
> >         clint@2000000 {
> >             interrupts-extended = <0x08 0x03 0x08 0x07 0x06 0x03 0x06
> > 0x07 0x04 0x03 0x04 0x07 0x02 0x03 0x02 0x07>;
> >             reg = <0x00 0x2000000 0x00 0x10000>;
> >             compatible = "riscv,clint0";
> >         };
> >     };
> > };
>
> Thx Anup, but it still couldn't work for testing suspend.
>
> # echo mem > /sys/power/state
> sh: write error: Function not implemented
>
> Why there is no ARCH_SUSPEND_POSSIBLE in the patch series?

You are referring to system-level suspend to RAM support whereas
this series adds CPU idle power management support.

Adding system-level suspend to RAM will be a separate series
and it will re-use the non-retentive suspend infrastructure added
by this series.

Regards,
Anup

>
> ref arm64's:
> commit 166936bace056dfc11452d794209f39a5e9b0fb4
> Author: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
> Date:   Thu Nov 7 18:37:14 2013 +0000
>
>     arm64: kernel: add PM build infrastructure
>
>     This patch adds the required makefile and kconfig entries to enable PM
>     for arm64 systems.
>
>     The kernel relies on the cpu_{suspend}/{resume} infrastructure to
>     properly save the context for a CPU and put it to sleep, hence this
>     patch adds the config option required to enable cpu_{suspend}/{resume}
>     API.
>
>     In order to rely on the CPU PM implementation for saving and restoring
>     of CPU subsystems like GIC and PMU, the arch Kconfig must be also
>     augmented to select the CONFIG_CPU_PM option when SUSPEND or CPU_IDLE
>     kernel implementations are selected.
>
> >
> > Regards,
> > Anup
>
>
>
> --
> Best Regards
>  Guo Ren
>
> ML: https://lore.kernel.org/linux-csky/

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
