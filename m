Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B93AC3DA7A
	for <linux-riscv@archiver.kernel.org>; Mon,  2 Jan 2023 10:06:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Jvu1rQeinpCrJXLPLgRTKYIViMK+kuMbvosSj7Hg4mA=; b=RCeu28JofZnKZL
	tEiwP6RZKqVv+mwpGNgsC1KigxG3pYU/Tt8Es7zTblEOcxeSlXXiPqm4AHCcxN3nvIpOpA57p2JF/
	koehdAX/SDEf5f+5aV6X11wvvM3HzYbSsnIYu/BquZfEPDeJbOTEYMRPZ++tpAGpAKUaSl/mrOpwu
	Hvu3evBEb4rikXmzheFN+yVi9wJxhTiJFd/yZTG/Q+7S2boMX+qMleaiB/OMi60tLZEp0en1h46ZF
	TlMPKyFFYFF7MD/t0lWmFb6upl0LdjK3l6dAJe4MFWHez2MhAYAzIeEqVzaIKey9eTL6COApNL9XA
	XX0XBvNZvH4qud0Y/Z2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pCHi0-00AELt-NA; Mon, 02 Jan 2023 10:06:20 +0000
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pCHhC-00ADv1-GY
	for linux-riscv@lists.infradead.org; Mon, 02 Jan 2023 10:05:33 +0000
Received: by mail-ed1-x532.google.com with SMTP id c17so39285871edj.13
        for <linux-riscv@lists.infradead.org>; Mon, 02 Jan 2023 02:05:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=e9DCTB5Dm2pkFs6CSTyKZLl1xWQvMdJFV8QOYePkMmc=;
        b=b+OJbReIPVeZKxutNL/Ola0tNRzwQseF5QunIE0o10+Ll8f6gKLTnW4VYHRAJ65TEF
         ueNs1zvDPZTHKuI2hmwIeQO0ZOSecFzObBRgZyf9++q6ZYAwUWJDyFaQNF8ssIrLWv+s
         qnhHLzvXDSLRfuVRQtvevHtbi3GMOHaM3E7Mwb8cNxiCQOBei7JLb/aPGjzPqjucmRj3
         F13uSiU2Sz0m/TO4ECvVeodw1n1ABxzgDKHjySTDLaCw/a5FDDpt/YqdyYGXTr5Lb3dH
         Y7IHPhvQMQPArHvErxkLzjl5E2GUAEtzUWXkdr8584aB3HAOrZ0+SZbbFlCGF5B1O4dX
         Y4rA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=e9DCTB5Dm2pkFs6CSTyKZLl1xWQvMdJFV8QOYePkMmc=;
        b=VP+wVeaz1YbgB0Vrj1zIZwgsp3BXRGWiQ7S81B9imm31PwjBWPrE8Plzogrn6F9EDH
         gZThyU+30mI8oYTJhU5J4PgfZLASCXovSXDOexrjo0NgBtTdI64aX7ogklg2LrG4xkzT
         auVh+P7v2SOTrrxJQCA1c3unTiAFz0kRruDEIqkvPz2/neHDSkHyjI/+sACrV34yhdic
         f/3mYssL2mZKEwnFWoXNl7xfWboMu6IRMdVpZEcvpx7WtBwqAYfU3szj3v+H9Eg84KFz
         WlcHvwk+bJw9zA/2w+Rlj8EOBnLrgnAo9SEaVEqUL8uKayoDN/9gKMKh1/+Pq9T2hvPD
         /A5A==
X-Gm-Message-State: AFqh2krb7CD77mnvi7ehhLb/svhXZdo5BRd0SykpShK+4d1tEqWDDTjN
	3tldr7zYaD2Vv8Gc8cYG847SNGPvNOhxLwJ+akcwXw==
X-Google-Smtp-Source: AMrXdXutBl5gu8eTZ2szcpSPfsr6smT0M6Rt7kVdaTvHuuYxPL3DpDNJ24bpZ7CrLDEWJdUaE38DDnrELD7nyO4oPxo=
X-Received: by 2002:a05:6402:1f11:b0:479:aa95:bb9c with SMTP id
 b17-20020a0564021f1100b00479aa95bb9cmr3358085edb.150.1672653926887; Mon, 02
 Jan 2023 02:05:26 -0800 (PST)
MIME-Version: 1.0
References: <20221111044207.1478350-1-apatel@ventanamicro.com> <CAOnJCULbRSSjYvQP_2bysj1jd0_ywNjQ+gH7eteU7uJWZZ2KiQ@mail.gmail.com>
In-Reply-To: <CAOnJCULbRSSjYvQP_2bysj1jd0_ywNjQ+gH7eteU7uJWZZ2KiQ@mail.gmail.com>
From: Anup Patel <anup@brainfault.org>
Date: Mon, 2 Jan 2023 15:35:15 +0530
Message-ID: <CAAhSdy3SArqEEGeMNyVFk1MAAXSCXfav9_JRN236PWxKE3UR5Q@mail.gmail.com>
Subject: Re: [PATCH 0/9] Linux RISC-V AIA Support
To: Atish Patra <atishp@atishpatra.org>
Cc: Anup Patel <apatel@ventanamicro.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Thomas Gleixner <tglx@linutronix.de>, 
	Marc Zyngier <maz@kernel.org>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	Alistair Francis <Alistair.Francis@wdc.com>, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230102_020530_947540_8F78BCBA 
X-CRM114-Status: GOOD (  25.07  )
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

On Fri, Nov 11, 2022 at 2:37 PM Atish Patra <atishp@atishpatra.org> wrote:
>
> On Thu, Nov 10, 2022 at 8:42 PM Anup Patel <apatel@ventanamicro.com> wrote:
> >
> > The RISC-V AIA specification is now frozen as-per the RISC-V international
> > process. The latest frozen specifcation can be found at:
> > https://github.com/riscv/riscv-aia/releases/download/1.0-RC1/riscv-interrupts-1.0-RC1.pdf
> >
> > At a high-level, the AIA specification adds three things:
> > 1) AIA CSRs
> >    - Improved local interrupt support
> > 2) Incoming Message Signaled Interrupt Controller (IMSIC)
> >    - Per-HART MSI controller
> >    - Support MSI virtualization
> >    - Support IPI along with virtualization
> > 3) Advanced Platform-Level Interrupt Controller (APLIC)
> >    - Wired interrupt controller
> >    - In MSI-mode, converts wired interrupt into MSIs (i.e. MSI generator)
> >    - In Direct-mode, injects external interrupts directly into HARTs
> >
> > For an overview of the AIA specification, refer the recent AIA virtualization
> > talk at KVM Forum 2022:
> > https://static.sched.com/hosted_files/kvmforum2022/a1/AIA_Virtualization_in_KVM_RISCV_final.pdf
> > https://www.youtube.com/watch?v=r071dL8Z0yo
> >
> > This series adds required Linux irqchip drivers for AIA and it depends on
> > the recent "RISC-V IPI Improvements".
> > (Refer, https://lore.kernel.org/lkml/20221101143400.690000-1-apatel@ventanamicro.com/t/)
> >
> > To test this series, use QEMU v7.1 (or higher) and OpenSBI v1.1 (or higher).
> >
> > These patches can also be found in the riscv_aia_v1 branch at:
> > https://github.com/avpatel/linux.git
> >
> > Anup Patel (9):
> >   RISC-V: Add AIA related CSR defines
> >   RISC-V: Detect AIA CSRs from ISA string
> >   irqchip/riscv-intc: Add support for RISC-V AIA
> >   dt-bindings: Add RISC-V incoming MSI controller bindings
> >   irqchip: Add RISC-V incoming MSI controller driver
> >   dt-bindings: Add RISC-V advanced PLIC bindings
> >   irqchip: Add RISC-V advanced PLIC driver
> >   RISC-V: Select APLIC and IMSIC drivers for QEMU virt machine
> >   MAINTAINERS: Add entry for RISC-V AIA drivers
> >
> >  .../interrupt-controller/riscv,aplic.yaml     |  136 ++
> >  .../interrupt-controller/riscv,imsic.yaml     |  174 +++
> >  MAINTAINERS                                   |   12 +
> >  arch/riscv/Kconfig.socs                       |    2 +
> >  arch/riscv/include/asm/csr.h                  |   92 ++
> >  arch/riscv/include/asm/hwcap.h                |    8 +
> >  arch/riscv/kernel/cpu.c                       |    2 +
> >  arch/riscv/kernel/cpufeature.c                |    2 +
> >  drivers/irqchip/Kconfig                       |   32 +-
> >  drivers/irqchip/Makefile                      |    2 +
> >  drivers/irqchip/irq-riscv-aplic.c             |  656 +++++++++
> >  drivers/irqchip/irq-riscv-imsic.c             | 1207 +++++++++++++++++
> >  drivers/irqchip/irq-riscv-intc.c              |   37 +-
> >  include/linux/irqchip/riscv-aplic.h           |  117 ++
> >  include/linux/irqchip/riscv-imsic.h           |   92 ++
> >  15 files changed, 2564 insertions(+), 7 deletions(-)
> >  create mode 100644 Documentation/devicetree/bindings/interrupt-controller/riscv,aplic.yaml
> >  create mode 100644 Documentation/devicetree/bindings/interrupt-controller/riscv,imsic.yaml
> >  create mode 100644 drivers/irqchip/irq-riscv-aplic.c
> >  create mode 100644 drivers/irqchip/irq-riscv-imsic.c
> >  create mode 100644 include/linux/irqchip/riscv-aplic.h
> >  create mode 100644 include/linux/irqchip/riscv-imsic.h
> >
> > --
> > 2.34.1
> >
>
> I am seeing the following boot failure with your branch and upstream
> qemu (tag: v7.2.0-rc0).
> It seems IPIs are probably not getting delivered after a point. I saw
> that IPIs are delivered in the same path earlier (via gdb).
>
> [    0.990152] NET: Registered PF_INET6 protocol family
> [    1.004885] Segment Routing with IPv6
> [    1.005385] In-situ OAM (IOAM) with IPv6
> [    1.006371] sit: IPv6, IPv4 and MPLS over IPv4 tunneling driver
> [    1.011609] NET: Registered PF_PACKET protocol family
> [    1.014877] 9pnet: Installing 9P2000 support
> [    1.015603] Key type dns_resolver registered
> [    1.026396] debug_vm_pgtable: [debug_vm_pgtable         ]:
> Validating architecture page table helpers
> [    1.144097] EXT4-fs (vda2): recovery complete
> [    1.146345] EXT4-fs (vda2): mounted filesystem with ordered data
> mode. Quota mode: disabled.
> [    1.147020] VFS: Mounted root (ext4 filesystem) on device 254:2.
> [    1.152238] devtmpfs: mounted
> [    1.183914] Freeing unused kernel image (initmem) memory: 2176K
> [    1.185898] Run /sbin/init as init process
> [   29.412287] rcu: INFO: rcu_sched self-detected stall on CPU
> [   29.412992] rcu:     3-....: (5250 ticks this GP)
> idle=fc3c/1/0x4000000000000002 softirq=78/78 fqs=2230
> [   29.413427]  (t=5251 jiffies g=-1047 q=3 ncpus=8)
> [   29.414199] CPU: 3 PID: 1 Comm: init Not tainted
> 6.1.0-rc4-00024-g5b711f2d7b91 #198
> [   29.414578] Hardware name: riscv-virtio,qemu (DT)
> [   29.414896] epc : smp_call_function_many_cond+0x138/0x372
> [   29.415157]  ra : smp_call_function_many_cond+0x154/0x372
> [   29.415318] epc : ffffffff8008d2e6 ra : ffffffff8008d302 sp :
> ff2000000004bb40
> [   29.415512]  gp : ffffffff812e9eb0 tp : ff600000016d8000 t0 :
> ff6000007ed88610
> [   29.415686]  t1 : 00000000000000ff t2 : 0000000000000002 s0 :
> ff2000000004bc00
> [   29.415837]  s1 : ff6000007ed85448 a0 : 0000000000000007 a1 :
> 00000000000000f7
> [   29.416008]  a2 : 0000000000000000 a3 : 0000000000000000 a4 :
> ff6000007edd1780
> [   29.416188]  a5 : 0000000000000001 a6 : ffffffff812eb1c0 a7 :
> ff600000016d8000
> [   29.416613]  s2 : ffffffff81323c30 s3 : ffffffff812e9964 s4 :
> 0000000000000000
> [   29.416810]  s5 : 0000000000000000 s6 : ff6000007ed85440 s7 :
> 0000000000000038
> [   29.416997]  s8 : 0000000000000003 s9 : ffffffff81323c30 s10:
> ff6000007ed85448
> [   29.417159]  s11: 0000000000000008 t3 : 00ffffffad08a000 t4 :
> ff60000001613e0c
> [   29.417331]  t5 : 0000000000000000 t6 : 00ffffffad177fff
> [   29.417482] status: 0000000200000120 badaddr: 0000000000000000
> cause: 8000000000000005
> [   29.417939] [<ffffffff8008d590>] on_each_cpu_cond_mask+0x20/0x32
> [   29.418179] [<ffffffff80008d32>] flush_icache_all+0x38/0x40
> [   29.418324] [<ffffffff80008eb2>] flush_icache_pte+0x4a/0x7a
> [   29.418442] [<ffffffff80139e00>] do_set_pte+0x132/0x192
> [   29.418594] [<ffffffff8010b42e>] filemap_map_pages+0x178/0x3a0
> [   29.418738] [<ffffffff8013ad00>] __handle_mm_fault+0x992/0xbac
> [   29.418876] [<ffffffff8013afde>] handle_mm_fault+0xc4/0x1d4
> [   29.419010] [<ffffffff80008372>] do_page_fault+0x120/0x326
> [   29.419145] [<ffffffff800033e6>] ret_from_exception+0x0/0xc

This has been addressed in the RISC-V IPI improvement series.

Regards,
Anup

>
>
>
> --
> Regards,
> Atish

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
