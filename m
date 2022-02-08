Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6DDF7C433EF
	for <linux-riscv@archiver.kernel.org>; Tue,  8 Feb 2022 08:54:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WPmV2lmSZTS5b+xIPvanJ+nwXi4XY1uqPYVzPXfI360=; b=AZMGm1VmF8KsMF
	kNdjHIk1cN4YB0pbJyl/x5QiAvHEifnaTnrC6eVoDsXgyG+UfyG8EGyRcI5UFL2XVoWJVs3s6j7N6
	+v/9pUkCBxR8h9WySdWqsnnxzDeYG60ZHCH4RdR1CPpvIY317Evk6CjK6hMTGZIw6sJl731jaPeut
	sBvXUqlmpGjTdZBBNcwRl1+xu4kxzjvEYp1fWgeX3DxwvLzty/XLXbiVAuqiYOLvYsufF3cIau3O0
	cwaFj6Fv26ODhhaf/B+Vaysr4JeIgOi42P5BPL1VDYN16oTheHzM3cQ5rMvyWvsYCL3nI0Ab72Z8s
	EZ/Ijbfmsjnt1Fa0Fe+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nHMGT-00D6K9-7Y; Tue, 08 Feb 2022 08:54:21 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nHMGP-00D6I2-L5
 for linux-riscv@lists.infradead.org; Tue, 08 Feb 2022 08:54:19 +0000
Received: by mail-wr1-x429.google.com with SMTP id i15so6976429wrb.3
 for <linux-riscv@lists.infradead.org>; Tue, 08 Feb 2022 00:54:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ad/AIeKw/gggP6Br2uoykBbNKFVMSxSNAtQyiBt1RW0=;
 b=5KxMGJIrZxz0UdJJ4KFG3h5rV0PZviBM1D2ZlImvgl2AYSR7uVDIp9FOmugYxXR0jd
 /uG/+J603tKg3P37pGqHHlbr3fFTWLeZiT1w6+erAhedOqoJk8L3BOwALYuFUkgt9rFv
 jQiGMsXhV5QujyODOTCAMmYW8e/ggOnHL5d6jTVn1If8szV5+b8LHzdFdowkrSUMEWah
 jPTmEQXdKOuovazsDjAlCKdIyJVrK45UjaRmuw4mwTheKA34Yrm9QDVifKZ9hcVLF1Go
 vZJYetHiq9fRPxQVsdpQnn9p5KE/Ol1buMRKZZWhAVmq4hbRovF1sdC/5fDZhn2tpOSm
 5hLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ad/AIeKw/gggP6Br2uoykBbNKFVMSxSNAtQyiBt1RW0=;
 b=xuJuIoNOcylBkgwzJ5pCrxHIqAcc+MtqRjDScEt/XOw1g6yhnMRpc3aId4E11LWw0Q
 JW6uMFN0xEvbKHql0pX56T8MrRC6o9foUehMPpX7C9MgAB7mYVnp1lJnMGJoU9JXw76a
 ATz2gtsNRCUKtsxkhcyY+gbba5PQ412tuAhCPLDjuFkp5nFsN4o74mwwnf5NFmGAdmgt
 7Irwk3aNFeOsIMSCkl/198Rgq1YHVCvxSOhn7yAupcH1ceQJbkAug3+DS+Szjd+FWQBG
 BR2z7DOP0vHjVtPXNWXzK1osd2l+BJzFIH6Re03F0TaxRPZWbqyyy0CqpoOavM/XlUKD
 c9Gw==
X-Gm-Message-State: AOAM532Cxxg7O8SZWcYvzTY5EGrhBuSqjM4NUQqvUgmGRmD8bzYQKkbX
 GHhTLN5+IkACSY7likE9ygMBqqI6lA6B5LDwts4iQA==
X-Google-Smtp-Source: ABdhPJzgSop4y+Hsg6mK+sVfvqbbliyC19eTL7sLF/m+UVhe/JN/7WOPjVFLYB6Xxfkqx+mpiM4ybuPoWNgcPTqKJbA=
X-Received: by 2002:adf:bc44:: with SMTP id a4mr2655518wrh.346.1644310456139; 
 Tue, 08 Feb 2022 00:54:16 -0800 (PST)
MIME-Version: 1.0
References: <20220126114452.692512-1-apatel@ventanamicro.com>
 <20220126114452.692512-9-apatel@ventanamicro.com>
 <CAJF2gTQsSn1KBgX2bg2LiSUbCmbGD3oF5KcmK5gq2Dd49BWDBQ@mail.gmail.com>
In-Reply-To: <CAJF2gTQsSn1KBgX2bg2LiSUbCmbGD3oF5KcmK5gq2Dd49BWDBQ@mail.gmail.com>
From: Anup Patel <anup@brainfault.org>
Date: Tue, 8 Feb 2022 14:24:04 +0530
Message-ID: <CAAhSdy3Dkv6ga0ZMp5rMFa8nV9EDHgOMBwuJ4z4-w52T8EaUag@mail.gmail.com>
Subject: Re: [PATCH v10 8/8] RISC-V: Enable RISC-V SBI CPU Idle driver for
 QEMU virt machine
To: Guo Ren <guoren@kernel.org>
Cc: Anup Patel <apatel@ventanamicro.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
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
X-CRM114-CacheID: sfid-20220208_005417_730791_439122EB 
X-CRM114-Status: UNSURE (   9.21  )
X-CRM114-Notice: Please train this message.
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

On Tue, Feb 8, 2022 at 12:16 PM Guo Ren <guoren@kernel.org> wrote:
>
> Another question:
>
> Have you put "idle-states {" in qemu's DTS? or how do you test your patches?

I usually do the following:
1) Dump QEMU virt machine DTB
2) Convert QEMU virt machine DTB into DTS
3) Add "idle-states" in QEMU virt machine DTS
4) Create QEMU virt machine DTB with "idle-states"
5) Use the new QEMU virt machine DTB for testing this series.

Here's one of the DTS files which I used for testing on QEMU virt machine:

/dts-v1/;

/ {
    #address-cells = <0x02>;
    #size-cells = <0x02>;
    compatible = "riscv-virtio";
    model = "riscv-virtio,qemu";

    chosen {
        linux,initrd-end = <0x8855d200>;
        linux,initrd-start = <0x88200000>;
        bootargs = "root=/dev/ram rw console=ttyS0 earlycon";
        stdout-path = "/soc/uart@10000000";
    };

    memory@80000000 {
        device_type = "memory";
        reg = <0x00 0x80000000 0x00 0x10000000>;
    };

    cpus {
        #address-cells = <0x01>;
        #size-cells = <0x00>;
        timebase-frequency = <0x989680>;

        cpu@0 {
            phandle = <0x07>;
            device_type = "cpu";
            reg = <0x00>;
            status = "okay";
            compatible = "riscv";
            riscv,isa = "rv64imafdcsu";
            mmu-type = "riscv,sv48";
            cpu-idle-states = <&CPU_NONRET_DEF>;

            interrupt-controller {
                #interrupt-cells = <0x01>;
                interrupt-controller;
                compatible = "riscv,cpu-intc";
                phandle = <0x08>;
            };
        };

        cpu@1 {
            phandle = <0x05>;
            device_type = "cpu";
            reg = <0x01>;
            status = "okay";
            compatible = "riscv";
            riscv,isa = "rv64imafdcsu";
            mmu-type = "riscv,sv48";
            cpu-idle-states = <&CPU_RET_DEF>;

            interrupt-controller {
                #interrupt-cells = <0x01>;
                interrupt-controller;
                compatible = "riscv,cpu-intc";
                phandle = <0x06>;
            };
        };

        cpu@2 {
            phandle = <0x03>;
            device_type = "cpu";
            reg = <0x02>;
            status = "okay";
            compatible = "riscv";
            riscv,isa = "rv64imafdcsu";
            mmu-type = "riscv,sv48";
            cpu-idle-states = <&CPU_NONRET_DEF>;

            interrupt-controller {
                #interrupt-cells = <0x01>;
                interrupt-controller;
                compatible = "riscv,cpu-intc";
                phandle = <0x04>;
            };
        };

        cpu@3 {
            phandle = <0x01>;
            device_type = "cpu";
            reg = <0x03>;
            status = "okay";
            compatible = "riscv";
            riscv,isa = "rv64imafdcsu";
            mmu-type = "riscv,sv48";
            cpu-idle-states = <&CPU_RET_DEF>;

            interrupt-controller {
                #interrupt-cells = <0x01>;
                interrupt-controller;
                compatible = "riscv,cpu-intc";
                phandle = <0x02>;
            };
        };

        cpu-map {

            cluster0 {

                core0 {
                    cpu = <0x07>;
                };

                core1 {
                    cpu = <0x05>;
                };

                core2 {
                    cpu = <0x03>;
                };

                core3 {
                    cpu = <0x01>;
                };
            };
        };

        idle-states {
            CPU_RET_DEF: cpu-retentive-default {
                compatible = "riscv,idle-state";
                riscv,sbi-suspend-param = <0x00000000>;
                entry-latency-us = <10>;
                exit-latency-us = <10>;
                min-residency-us = <100>;
            };

            CPU_NONRET_DEF: cpu-nonretentive-default {
                compatible = "riscv,idle-state";
                riscv,sbi-suspend-param = <0x80000000>;
                entry-latency-us = <100>;
                exit-latency-us = <100>;
                min-residency-us = <1000>;
            };
        };
    };

    soc {
        #address-cells = <0x02>;
        #size-cells = <0x02>;
        compatible = "simple-bus";
        ranges;

        flash@20000000 {
            bank-width = <0x04>;
            reg = <0x00 0x20000000 0x00 0x2000000 0x00 0x22000000 0x00
0x2000000>;
            compatible = "cfi-flash";
        };

        rtc@101000 {
            interrupts = <0x0b>;
            interrupt-parent = <0x09>;
            reg = <0x00 0x101000 0x00 0x1000>;
            compatible = "google,goldfish-rtc";
        };

        uart@10000000 {
            interrupts = <0x0a>;
            interrupt-parent = <0x09>;
            clock-frequency = <0x384000>;
            reg = <0x00 0x10000000 0x00 0x100>;
            compatible = "ns16550a";
        };

        poweroff {
            value = <0x5555>;
            offset = <0x00>;
            regmap = <0x0a>;
            compatible = "syscon-poweroff";
        };

        reboot {
            value = <0x7777>;
            offset = <0x00>;
            regmap = <0x0a>;
            compatible = "syscon-reboot";
        };

        test@100000 {
            phandle = <0x0a>;
            reg = <0x00 0x100000 0x00 0x1000>;
            compatible = "sifive,test1\0sifive,test0\0syscon";
        };

        pci@30000000 {
            interrupt-map-mask = <0x1800 0x00 0x00 0x07>;
            interrupt-map = <0x00 0x00 0x00 0x01 0x09 0x20 0x00 0x00
0x00 0x02 0x09 0x21 0x00 0x00 0x00 0x03 0x09 0x22 0x00 0x00 0x00 0x04
0x09 0x23 0x800 0x00 0x00 0x01 0x09 0x21 0x800 0x00 0x00 0x02 0x09
0x22 0x800 0x00 0x00 0x03 0x09 0x23 0x800 0x00 0x00 0x04 0x09 0x20
0x1000 0x00 0x00 0x01 0x09 0x22 0x1000 0x00 0x00 0x02 0x09 0x23 0x1000
0x00 0x00 0x03 0x09 0x20 0x1000 0x00 0x00 0x04 0x09 0x21 0x1800 0x00
0x00 0x01 0x09 0x23 0x1800 0x00 0x00 0x02 0x09 0x20 0x1800 0x00 0x00
0x03 0x09 0x21 0x1800 0x00 0x00 0x04 0x09 0x22>;
            ranges = <0x1000000 0x00 0x00 0x00 0x3000000 0x00 0x10000
0x2000000 0x00 0x40000000 0x00 0x40000000 0x00 0x40000000>;
            reg = <0x00 0x30000000 0x00 0x10000000>;
            dma-coherent;
            bus-range = <0x00 0xff>;
            linux,pci-domain = <0x00>;
            device_type = "pci";
            compatible = "pci-host-ecam-generic";
            #size-cells = <0x02>;
            #interrupt-cells = <0x01>;
            #address-cells = <0x03>;
        };

        virtio_mmio@10008000 {
            interrupts = <0x08>;
            interrupt-parent = <0x09>;
            reg = <0x00 0x10008000 0x00 0x1000>;
            compatible = "virtio,mmio";
        };

        virtio_mmio@10007000 {
            interrupts = <0x07>;
            interrupt-parent = <0x09>;
            reg = <0x00 0x10007000 0x00 0x1000>;
            compatible = "virtio,mmio";
        };

        virtio_mmio@10006000 {
            interrupts = <0x06>;
            interrupt-parent = <0x09>;
            reg = <0x00 0x10006000 0x00 0x1000>;
            compatible = "virtio,mmio";
        };

        virtio_mmio@10005000 {
            interrupts = <0x05>;
            interrupt-parent = <0x09>;
            reg = <0x00 0x10005000 0x00 0x1000>;
            compatible = "virtio,mmio";
        };

        virtio_mmio@10004000 {
            interrupts = <0x04>;
            interrupt-parent = <0x09>;
            reg = <0x00 0x10004000 0x00 0x1000>;
            compatible = "virtio,mmio";
        };

        virtio_mmio@10003000 {
            interrupts = <0x03>;
            interrupt-parent = <0x09>;
            reg = <0x00 0x10003000 0x00 0x1000>;
            compatible = "virtio,mmio";
        };

        virtio_mmio@10002000 {
            interrupts = <0x02>;
            interrupt-parent = <0x09>;
            reg = <0x00 0x10002000 0x00 0x1000>;
            compatible = "virtio,mmio";
        };

        virtio_mmio@10001000 {
            interrupts = <0x01>;
            interrupt-parent = <0x09>;
            reg = <0x00 0x10001000 0x00 0x1000>;
            compatible = "virtio,mmio";
        };

        plic@c000000 {
            phandle = <0x09>;
            riscv,ndev = <0x35>;
            reg = <0x00 0xc000000 0x00 0x210000>;
            interrupts-extended = <0x08 0x0b 0x08 0x09 0x06 0x0b 0x06
0x09 0x04 0x0b 0x04 0x09 0x02 0x0b 0x02 0x09>;
            interrupt-controller;
            compatible = "riscv,plic0";
            #interrupt-cells = <0x01>;
            #address-cells = <0x00>;
        };

        clint@2000000 {
            interrupts-extended = <0x08 0x03 0x08 0x07 0x06 0x03 0x06
0x07 0x04 0x03 0x04 0x07 0x02 0x03 0x02 0x07>;
            reg = <0x00 0x2000000 0x00 0x10000>;
            compatible = "riscv,clint0";
        };
    };
};

Regards,
Anup

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
