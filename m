Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD765C433EF
	for <linux-riscv@archiver.kernel.org>; Sat, 23 Apr 2022 00:17:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ex2OLCJzYIQ5ho7YpuO3UvKFME7YYS+ol4Y2ZvdrrFE=; b=dE8nKFQtFnIYr/
	+oPx0VFZCzsW9Y2vyf5bdAYa4F+h3XYA1MyPZ3sBJpuu3I3zt88O4J+CDEnxqtWr0yONvUc1E19zn
	qB7FJtS0MyMQOshYeVgOScZRClgeDPzG3805QHuBiEvuIwSnXV752vBiy5tGZTy8bBdfSACWBhSJM
	3c28cZzzx6oyXJQlV3RhPIT4ALux3bygE75TlUyViy2KkP2esib+9CrsBYE+oeIHmLPDw2oeb+fP4
	QJHXsCPVDrNPWL8nVMh38ZUAugSJJREM8AypwHC7s4bw5Y2DUr+1zoenb8Dpq3WMkkw2W9I/A4TGt
	GvamXUS70PTCalY15K0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ni3SX-002zrI-LT; Sat, 23 Apr 2022 00:17:09 +0000
Received: from mail-yw1-x1132.google.com ([2607:f8b0:4864:20::1132])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ni3SU-002zqr-3H
 for linux-riscv@lists.infradead.org; Sat, 23 Apr 2022 00:17:07 +0000
Received: by mail-yw1-x1132.google.com with SMTP id
 00721157ae682-2f7bb893309so21020957b3.12
 for <linux-riscv@lists.infradead.org>; Fri, 22 Apr 2022 17:17:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=atishpatra.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=MoSOk7aiSsrTsFED04ppyU9PqkK13gebDi+J9ftgEjs=;
 b=ZOQ5EjKoIj6frB25e/g+fvJ1PDdhmnKNWUV6ChlD92WFm3A3X/bhOBJx6Y0lGxzAxX
 bC55qm14OQ6BI71mEOhg/9I481wslmOus55fjNPH+2cN9lvEOg7rwSW30zZvpXhoB3sS
 8kB6MY6EjYEDHMbp+1MaRQMa2z1AfztCpS99k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=MoSOk7aiSsrTsFED04ppyU9PqkK13gebDi+J9ftgEjs=;
 b=SsEUA447WymTMdam+RrlOuIY62grAM/thvtm43FHCXlEYiWfLzfaXBkybJXa8+bpXt
 98X0lo/lUQWBOZGA0AiiAtW97S/c+DWjvsS0bzYEUihFPpbRe6DUnOt+ba8ObBz0ZF4F
 7gDpdy3tA55D4H5OWmYy5RnN66KGfPquV4xjotxXn2OXhceU5aE/sR7WGSGX+eKUTM4F
 9q9v30ScZDoXiOSqO0F0WBE3SYeSP3G7T1TzKw3DbfVaeiags9m+eWFDd9/QGssQeC6f
 qJ2/bjXlxbgf2L6ueBsF8LXXjw4TY1DoyckB5l3UGOnAUDHzwfN+MI6V+GrVE/RGC4ZJ
 r7lA==
X-Gm-Message-State: AOAM533FsCyH1KiCCDN1nGXqUg+fUjWA3GCe8rCchyKaM5rYTiHRs0Dv
 I8YyPWZe6n8MOuDGZIxaIo5+wRsYnkwmVXVa6803
X-Google-Smtp-Source: ABdhPJw9bzlBvX7MnRZTUkY+yabryAq+Aj4BLIPm1GIu7cklg4UTowuZEcE85B6lKf5JpX4IRCuMrhLOUP2TYJYMQ2A=
X-Received: by 2002:a81:1f84:0:b0:2f4:d37b:a25f with SMTP id
 f126-20020a811f84000000b002f4d37ba25fmr7567853ywf.443.1650673022196; Fri, 22
 Apr 2022 17:17:02 -0700 (PDT)
MIME-Version: 1.0
References: <20220420112408.155561-1-apatel@ventanamicro.com>
 <3fa5215b-84c3-5e4c-cb53-6c05d05e4350@canonical.com>
In-Reply-To: <3fa5215b-84c3-5e4c-cb53-6c05d05e4350@canonical.com>
From: Atish Patra <atishp@atishpatra.org>
Date: Fri, 22 Apr 2022 17:16:51 -0700
Message-ID: <CAOnJCUJrN4frY_OdQzO-yr5CrDLvj=ge9KY2d=XnGvAF-uQNvQ@mail.gmail.com>
Subject: Re: [PATCH v3] RISC-V: Increase range and default value of NR_CPUS
To: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
Cc: Anup Patel <apatel@ventanamicro.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Paul Walmsley <paul.walmsley@sifive.com>, Arnd Bergmann <arnd@arndb.de>, 
 Alistair Francis <Alistair.Francis@wdc.com>,
 Anup Patel <anup@brainfault.org>, 
 linux-riscv <linux-riscv@lists.infradead.org>, 
 "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220422_171706_268391_25D98DF9 
X-CRM114-Status: GOOD (  21.11  )
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

On Thu, Apr 21, 2022 at 12:05 AM Heinrich Schuchardt
<heinrich.schuchardt@canonical.com> wrote:
>
>
>
> On 4/20/22 13:24, Anup Patel wrote:
> > Currently, the range and default value of NR_CPUS is too restrictive
> > for high-end RISC-V systems with large number of HARTs. The latest
> > QEMU virt machine supports upto 512 CPUs so the current NR_CPUS is
> > restrictive for QEMU as well. Other major architectures (such as
> > ARM64, x86_64, MIPS, etc) have a much higher range and default
> > value of NR_CPUS.
> >
> > This patch increases NR_CPUS range to 2-512 and default value to
> > XLEN (i.e. 32 for RV32 and 64 for RV64).
> >
> > Signed-off-by: Anup Patel <apatel@ventanamicro.com>
>

This works upto 207 harts in upstream Qemu + OpenSBI. Beyond that,
firmware size becomes > 2MB and PMP protection
kicks in for the kernel boot address (0x80200000)

Here is the OpenSBI boot prints for 256 harts with some hacks around
sanitize_domain to disable sbi_domain_check_addr

Platform Name             : riscv-virtio,qemu
Platform Features         : medeleg
Platform HART Count       : 208
Platform IPI Device       : aclint-mswi
Platform Timer Device     : aclint-mtimer @ 10000000Hz
Platform Console Device   : uart8250
Platform HSM Device       : ---
Platform Reboot Device    : sifive_test
Platform Shutdown Device  : sifive_test
Firmware Base             : 0x80000000
Firmware Size             : 2052 KB ---------->>> Firmware size is
greater than 2MB where
Runtime SBI Version       : 0.3

Domain0 Name              : root
Domain0 Boot HART         : 122
Domain0 HARTs             :
0*,1*,2*,3*,4*,5*,6*,7*,8*,9*,10*,11*,12*,13*,14*,15*,16*,17*,18*,19*,20*,21*,22*,23*,24*,25*,26*,27*,28*,29*,30*,31*,32*,33*,34*,35*,36*,37*,38*,39*,40*,41*,42*,43*,44*,45*,46*,47*,48*,49*,50*,51*,52*,53*,54*,55*,56*,57*,58*,59*,60*,61*,62*,63*,64*,65*,66*,67*,68*,69*,70*,71*,72*,73*,74*,75*,76*,77*,78*,79*,80*,81*,82*,83*,84*,85*,86*,87*,88*,89*,90*,91*,92*,93*,94*,95*,96*,97*,98*,99*,100*,101*,102*,103*,104*,105*,106*,107*,108*,109*,110*,111*,112*,113*,114*,115*,116*,117*,118*,119*,120*,121*,122*,123*,124*,125*,126*,127*,128*,129*,130*,131*,132*,133*,134*,135*,136*,137*,138*,139*,140*,141*,142*,143*,144*,145*,146*,147*,148*,149*,150*,151*,152*,153*,154*,155*,156*,157*,158*,159*,160*,161*,162*,163*,164*,165*,166*,167*,168*,169*,170*,171*,172*,173*,174*,175*,176*,177*,178*,179*,180*,181*,182*,183*,184*,185*,186*,187*,188*,189*,190*,191*,192*,193*,194*,195*,196*,197*,198*,199*,200*,201*,202*,203*,204*,205*,206*,207*
Domain0 Region00          : 0x0000000002000000-0x000000000200ffff (I)
Domain0 Region01          : 0x0000000080000000-0x00000000803fffff ()
Domain0 Region02          : 0x0000000000000000-0xffffffffffffffff (R,W,X)
Domain0 Next Address      : 0x0000000080200000
Domain0 Next Arg1         : 0x00000000bf000000
Domain0 Next Mode         : S-mode
Domain0 SysReset          : yes

Boot HART ID              : 122
Boot HART Domain          : root
Boot HART ISA             : rv64imafdcsuh
Boot HART Features        : scounteren,mcounteren,time
Boot HART PMP Count       : 16
Boot HART PMP Granularity : 4
Boot HART PMP Address Bits: 54
Boot HART MHPM Count      : 0
Boot HART MIDELEG         : 0x0000000000001666
Boot HART MEDELEG         : 0x0000000000f0b509


> Reviewed-by: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
>
> > ---
> > Changes since v2:
> >   - Rebased on Linux-5.18-rc3
> >   - Use a different range when SBI v0.1 is enabled
> > Changes since v1:
> >   - Updated NR_CPUS range to 2-512 which reflects maximum number of
> >     CPUs supported by QEMU virt machine.
> > ---
> >   arch/riscv/Kconfig | 9 ++++++---
> >   1 file changed, 6 insertions(+), 3 deletions(-)
> >
> > diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> > index 00fd9c548f26..1823f281069f 100644
> > --- a/arch/riscv/Kconfig
> > +++ b/arch/riscv/Kconfig
> > @@ -275,10 +275,13 @@ config SMP
> >         If you don't know what to do here, say N.
> >
> >   config NR_CPUS
> > -     int "Maximum number of CPUs (2-32)"
> > -     range 2 32
> > +     int "Maximum number of CPUs (2-512)"
> >       depends on SMP
> > -     default "8"
> > +     range 2 512 if !SBI_V01
> > +     range 2 32 if SBI_V01 && 32BIT
> > +     range 2 64 if SBI_V01 && 64BIT
> > +     default "32" if 32BIT
> > +     default "64" if 64BIT
> >
> >   config HOTPLUG_CPU
> >       bool "Support for hot-pluggable CPUs"



-- 
Regards,
Atish

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
