Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25E17C433F5
	for <linux-riscv@archiver.kernel.org>; Sat, 23 Apr 2022 05:21:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=guU8Meusl/vSnwnDDmYZc5FBgWmtdYv9lHmDA3wvOYo=; b=nwPHd6w3z9CH1V
	juRIf48ewmbn2i4YFPYief+ErURsQOoXYMgbqD9bHfMgFTreltQZOkmjnWTn9iEEkYlkZtod03soh
	XEFPs4zwj8N2DQOzz/jIntkcj3rFxrFqYzMzJEsIDmEaapqn8NtmJM4zDngm15G/afvhAN1Q7dRa3
	jhFX7iu44b5HDGiF18w1GitDY6pJGBjCYX7JPEuItY8Mnbs8Fzs+GcfNVep9LcrIcDxBJt+3TyF2H
	pGOdeXFjCpn7i4kbjwvLjQRQfh/vS4Fan4W1P3qai/VSiDHnp5DHXTB4SwhyzRLMHhrNMjSNLqoo2
	DgJ79/GZzU5t9xVAsWMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ni8DI-003TUg-CG; Sat, 23 Apr 2022 05:21:44 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ni8DF-003TT3-MX
 for linux-riscv@lists.infradead.org; Sat, 23 Apr 2022 05:21:43 +0000
Received: by mail-wm1-x329.google.com with SMTP id y21so6206449wmi.2
 for <linux-riscv@lists.infradead.org>; Fri, 22 Apr 2022 22:21:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=sbU8RRqvuKwLWG8J3BfpPsUyUgY2ByjD6sNT/NW9Qas=;
 b=B6wZBHSzUPdCcDLRt1WF1wSVUZ6IaPZJKGzRkGxcMgrYRTCyx7oSwk7DfdsA3pIH0/
 3L/eQ8eCefAuJK0ZDUAcwKkxBObXj+j74XX2+U401kaeQ8NEUVwctEUF0ORbQx01jUtF
 lWQ+vcl0M/AV6JkP/osjzHeMq8XbkJX5EMKF0NUF4yrSw+6jnZbRZ090GCI3c0teQ1pW
 sp8FdQOPq969THiLOqq0bUDuzvxKY5guY3vvvPNRUzi1QBR+2pfwyt/kAvH9k0BZjNwO
 9qoFuOcNsY9/WEXcJwGkVg9bb9iW458LYRNr4pr9LIhMCmUeBudX6sG/Kphcpldtz6hY
 rsrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=sbU8RRqvuKwLWG8J3BfpPsUyUgY2ByjD6sNT/NW9Qas=;
 b=LYay+7EIwFsO+vjHuSEy7ZMJbAPY0lEcjcS4oGgUXYddBlCNSD/7jI22DANx8jz1/Y
 P2E/A6FTCyJRoWhzM7EvQ2M4uMsnWYHvNwOba8/7dO3y/KqveRJMfPYi8sQSCVtTApx9
 On29gY8YyD2InGwN8ycSj5BJDyqj9isxCavKiyPK3L7KOKi8JLItKnzN331D58lOJOCn
 4KmUnn9/yqAVWzYiGbWaH2rdaq5rDZ3jnd0QUYOVvxlLUywO8pTHPr4tIjnwK/g+hDDK
 wFY3sAjIyXFI56Lls82vBUwmoctUngSQBvGHC4ijML0Ld7DPYNrlqWfOLK7VyAGIwEor
 16hQ==
X-Gm-Message-State: AOAM531gP5++h5AKC6RtNVPqjys1cEwdgejuLwqPz7v+jHH9NcJxDc98
 OYwFoXDviGnVg5JFTFGgJwe7FifBj0Vt5Wa65Opz3ohyIMYUXUIc
X-Google-Smtp-Source: ABdhPJxnpi9iklJash3oBnOjkGhS8EaN+Bz6xw+hWOgd0DstcjPeFSZjE122Tq7X7+gHuxZSEmIi2G1jabwClBKyMmI=
X-Received: by 2002:a05:600c:1d15:b0:393:e534:eb93 with SMTP id
 l21-20020a05600c1d1500b00393e534eb93mr816388wms.137.1650691298392; Fri, 22
 Apr 2022 22:21:38 -0700 (PDT)
MIME-Version: 1.0
References: <20220420112408.155561-1-apatel@ventanamicro.com>
 <3fa5215b-84c3-5e4c-cb53-6c05d05e4350@canonical.com>
 <CAOnJCUJrN4frY_OdQzO-yr5CrDLvj=ge9KY2d=XnGvAF-uQNvQ@mail.gmail.com>
 <CAOnJCUK5q0k1qKD0fM4NtbP6KAGcaBBknkCKLBXxcC=EPGVu1Q@mail.gmail.com>
In-Reply-To: <CAOnJCUK5q0k1qKD0fM4NtbP6KAGcaBBknkCKLBXxcC=EPGVu1Q@mail.gmail.com>
From: Anup Patel <anup@brainfault.org>
Date: Sat, 23 Apr 2022 10:51:26 +0530
Message-ID: <CAAhSdy3gO6a47fsO=UEp=k6KtMjzuNG_9pGnOky5LwGBmwL4rw@mail.gmail.com>
Subject: Re: [PATCH v3] RISC-V: Increase range and default value of NR_CPUS
To: Atish Patra <atishp@atishpatra.org>
Cc: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>,
 Anup Patel <apatel@ventanamicro.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
 Arnd Bergmann <arnd@arndb.de>, Alistair Francis <Alistair.Francis@wdc.com>, 
 linux-riscv <linux-riscv@lists.infradead.org>, 
 "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220422_222141_998050_52A9EF5E 
X-CRM114-Status: GOOD (  34.98  )
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

+Alistair

On Sat, Apr 23, 2022 at 7:19 AM Atish Patra <atishp@atishpatra.org> wrote:
>
> On Fri, Apr 22, 2022 at 5:16 PM Atish Patra <atishp@atishpatra.org> wrote:
> >
> > On Thu, Apr 21, 2022 at 12:05 AM Heinrich Schuchardt
> > <heinrich.schuchardt@canonical.com> wrote:
> > >
> > >
> > >
> > > On 4/20/22 13:24, Anup Patel wrote:
> > > > Currently, the range and default value of NR_CPUS is too restrictive
> > > > for high-end RISC-V systems with large number of HARTs. The latest
> > > > QEMU virt machine supports upto 512 CPUs so the current NR_CPUS is
> > > > restrictive for QEMU as well. Other major architectures (such as
> > > > ARM64, x86_64, MIPS, etc) have a much higher range and default
> > > > value of NR_CPUS.
> > > >
> > > > This patch increases NR_CPUS range to 2-512 and default value to
> > > > XLEN (i.e. 32 for RV32 and 64 for RV64).
> > > >
> > > > Signed-off-by: Anup Patel <apatel@ventanamicro.com>
> > >
> >
> > This works upto 207 harts in upstream Qemu + OpenSBI. Beyond that,
> > firmware size becomes > 2MB and PMP protection
> > kicks in for the kernel boot address (0x80200000)
> >
>
> Just wanted to clarify that this is as per the current configuration
> in OpenSBI. The boot address
> is configured to be 0x80000000 for the generic platform. Thus, it can
> support a maximum of 207 harts.
>
> If anybody wishes to boot more than that, the boot address should be
> changed to a valid DRAM address such that
> it doesn't step on kernel/DT or other resident boot loaders (e.g. U-Boot).
>
> It should be changed per platform (if supporting more than 128 harts)
> rather than changing
> to a common address for all platforms.

The OpenSBI limit of 128 harts was carefully chosen considering the
fact that QEMU by default loads OpenSBI at start of DRAM and kernel
at 2M (for RV64) or 4M (for RV32) offset. This means for RV64 if
OpenSBI is loaded at the start of DRAM then we only have 2M space
for OpenSBI hence the 128 harts limit.

To use more than 128 harts with OpenSBI, we will have to load it
somewhere else (probably in the middle of DRAM) but this will be a
platform specific choice. If a separate LOADER booting stage (e.g.
U-Boot SPL) is available on a platform then it can load OpenSBI
at desired platform specific location.

Overall, this is indeed a platform configuration issue. We will continue
to optimize OpenSBI to support more harts with less RAM usage but
this is a separate topic.

Regards,
Anup

>
> > Here is the OpenSBI boot prints for 256 harts with some hacks around
> > sanitize_domain to disable sbi_domain_check_addr
> >
> > Platform Name             : riscv-virtio,qemu
> > Platform Features         : medeleg
> > Platform HART Count       : 208
> > Platform IPI Device       : aclint-mswi
> > Platform Timer Device     : aclint-mtimer @ 10000000Hz
> > Platform Console Device   : uart8250
> > Platform HSM Device       : ---
> > Platform Reboot Device    : sifive_test
> > Platform Shutdown Device  : sifive_test
> > Firmware Base             : 0x80000000
> > Firmware Size             : 2052 KB ---------->>> Firmware size is
> > greater than 2MB where
> > Runtime SBI Version       : 0.3
> >
> > Domain0 Name              : root
> > Domain0 Boot HART         : 122
> > Domain0 HARTs             :
> > 0*,1*,2*,3*,4*,5*,6*,7*,8*,9*,10*,11*,12*,13*,14*,15*,16*,17*,18*,19*,20*,21*,22*,23*,24*,25*,26*,27*,28*,29*,30*,31*,32*,33*,34*,35*,36*,37*,38*,39*,40*,41*,42*,43*,44*,45*,46*,47*,48*,49*,50*,51*,52*,53*,54*,55*,56*,57*,58*,59*,60*,61*,62*,63*,64*,65*,66*,67*,68*,69*,70*,71*,72*,73*,74*,75*,76*,77*,78*,79*,80*,81*,82*,83*,84*,85*,86*,87*,88*,89*,90*,91*,92*,93*,94*,95*,96*,97*,98*,99*,100*,101*,102*,103*,104*,105*,106*,107*,108*,109*,110*,111*,112*,113*,114*,115*,116*,117*,118*,119*,120*,121*,122*,123*,124*,125*,126*,127*,128*,129*,130*,131*,132*,133*,134*,135*,136*,137*,138*,139*,140*,141*,142*,143*,144*,145*,146*,147*,148*,149*,150*,151*,152*,153*,154*,155*,156*,157*,158*,159*,160*,161*,162*,163*,164*,165*,166*,167*,168*,169*,170*,171*,172*,173*,174*,175*,176*,177*,178*,179*,180*,181*,182*,183*,184*,185*,186*,187*,188*,189*,190*,191*,192*,193*,194*,195*,196*,197*,198*,199*,200*,201*,202*,203*,204*,205*,206*,207*
> > Domain0 Region00          : 0x0000000002000000-0x000000000200ffff (I)
> > Domain0 Region01          : 0x0000000080000000-0x00000000803fffff ()
> > Domain0 Region02          : 0x0000000000000000-0xffffffffffffffff (R,W,X)
> > Domain0 Next Address      : 0x0000000080200000
> > Domain0 Next Arg1         : 0x00000000bf000000
> > Domain0 Next Mode         : S-mode
> > Domain0 SysReset          : yes
> >
> > Boot HART ID              : 122
> > Boot HART Domain          : root
> > Boot HART ISA             : rv64imafdcsuh
> > Boot HART Features        : scounteren,mcounteren,time
> > Boot HART PMP Count       : 16
> > Boot HART PMP Granularity : 4
> > Boot HART PMP Address Bits: 54
> > Boot HART MHPM Count      : 0
> > Boot HART MIDELEG         : 0x0000000000001666
> > Boot HART MEDELEG         : 0x0000000000f0b509
> >
> >
> > > Reviewed-by: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
> > >
> > > > ---
> > > > Changes since v2:
> > > >   - Rebased on Linux-5.18-rc3
> > > >   - Use a different range when SBI v0.1 is enabled
> > > > Changes since v1:
> > > >   - Updated NR_CPUS range to 2-512 which reflects maximum number of
> > > >     CPUs supported by QEMU virt machine.
> > > > ---
> > > >   arch/riscv/Kconfig | 9 ++++++---
> > > >   1 file changed, 6 insertions(+), 3 deletions(-)
> > > >
> > > > diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> > > > index 00fd9c548f26..1823f281069f 100644
> > > > --- a/arch/riscv/Kconfig
> > > > +++ b/arch/riscv/Kconfig
> > > > @@ -275,10 +275,13 @@ config SMP
> > > >         If you don't know what to do here, say N.
> > > >
> > > >   config NR_CPUS
> > > > -     int "Maximum number of CPUs (2-32)"
> > > > -     range 2 32
> > > > +     int "Maximum number of CPUs (2-512)"
> > > >       depends on SMP
> > > > -     default "8"
> > > > +     range 2 512 if !SBI_V01
> > > > +     range 2 32 if SBI_V01 && 32BIT
> > > > +     range 2 64 if SBI_V01 && 64BIT
> > > > +     default "32" if 32BIT
> > > > +     default "64" if 64BIT
> > > >
> > > >   config HOTPLUG_CPU
> > > >       bool "Support for hot-pluggable CPUs"
> >
> >
> >
> > --
> > Regards,
> > Atish
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
