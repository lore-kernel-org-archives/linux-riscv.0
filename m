Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 262AAC433FE
	for <linux-riscv@archiver.kernel.org>; Wed,  6 Apr 2022 10:36:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EP91FMMQlZYV2eA32BSC2BdS0X38TqzEtR0c/RbNWAY=; b=XA8vu1olDdIrgD
	K99oJropXKNu+9qsivxsmWCm3HoJEGW0FOesNVDEwXmkErZ4MWrAI6lCHzChhoY8YRnmNUh4b67ET
	7Xbz5XBCM/lkUG8t2prUsJMevryZDB/ys6NZDV3XpmvklROV/lGZTIGYsjXA3GNBpk2N/ObE5/aGe
	1ShTpa3V7KcNYBaIrrBrU3096IHKSM4AmK9qXarr6Si6DBOfqxsECvOTNucPXHjaqSAbX7YecC619
	+JJUH1JtSOGOasvZyUEogAjCqnxihOlSWhVur1CHR0e6v2n2BOLcXYk+7X8Rk56ckRbb9AOv7lTym
	yOG3wsvxbG5gMpAZr5ww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nc31X-005Qlt-Vl; Wed, 06 Apr 2022 10:36:28 +0000
Received: from mail-lf1-x131.google.com ([2a00:1450:4864:20::131])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nc2cC-005GHX-9v
 for linux-riscv@lists.infradead.org; Wed, 06 Apr 2022 10:10:18 +0000
Received: by mail-lf1-x131.google.com with SMTP id h7so3252326lfl.2
 for <linux-riscv@lists.infradead.org>; Wed, 06 Apr 2022 03:10:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=q5bDixyu2P+1amMqXVInPRQZcEo1D+KNKXvuVBZxtRQ=;
 b=OAKVuoE8oiVQ4UPGV07GOSeUOsXTrgaJRg7NWGdn7EbTAlaFUO1pkDW2WiLN3fiwBZ
 6ol1TcyZnld8fKDdQMPzHG6sMXb4L17Z3i+HSVZKoEhe0JhYHDBZAg3Ds8PWOqeFN8te
 mU4w5+5R52iiY+9uwvnHVdXDTwsVPWp3pryhsJSOhDCk1TftYIVSbp5OS3pXslJ7JIFL
 8g8T48WPe0jThVfCVYYcXR0IebOR4rDs5+vDRJDbBRkzB11UhGchhHwjylruuwFwOolO
 LY14zHVmw/F6nrj9qYMu+V+RKnkijG6QDsrKcSLHNKdApUeZ3wcDcjih57jBwz25xuym
 OxYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=q5bDixyu2P+1amMqXVInPRQZcEo1D+KNKXvuVBZxtRQ=;
 b=nI1lKeXMoRR40lJZf0b/R6u/I5kuqCfX67rb02loC0C2oCkhRDVNByaKD2wE5wQ8Dt
 4DC/Zvt3cYh3xhJMEmHDBtKXsA7S3D+jk9WXNtTDTW8Qlas+Nla+LYR9hC0x+Gaxd/hY
 pUh1+CGFeMMezCk8vmLazuSzvh31ErxuDzYNQyLSuIlVFBclVKQ9x2/1lEOwkKdvRvo9
 oUYvRSw5So7etXJNCrl/t4dgnDx5w4cv4wliDaZK70PK2QNPVSqLuXf9JpRQ5Yk/doOi
 3cJ3nDlXVa4uogE7tQbUXEji2LbQ+5n+M+yb/58bUH7MQua2KP+0UJ6EsYDv01otCO/2
 Cg0w==
X-Gm-Message-State: AOAM533tjsXl1nVsJEJM409ACQNDCgKJlL28yGqa3W4dJ5oc/+VQSUlh
 URUGZwpyMruFRzaOGwrjmnlN2b6BYNYeYJVVyhw9T5tNiqubaA==
X-Google-Smtp-Source: ABdhPJx7JE7Jpx1P7bpAdpKWrnifJThRxU1P01A3vMAYKwbWmoTYyvmJ+YWHcdrtf108eXEmPOyLNj3/+iSw9OAtOWo=
X-Received: by 2002:a05:6512:e89:b0:44a:86e0:2294 with SMTP id
 bi9-20020a0565120e8900b0044a86e02294mr5737802lfb.130.1649239812934; Wed, 06
 Apr 2022 03:10:12 -0700 (PDT)
MIME-Version: 1.0
References: <mhng-9cbb2a46-8bcb-4bfe-b927-0ed469dbd3a6@palmer-mbp2014>
 <cd8d6641-4a29-7deb-49ae-a80baab0344f@canonical.com>
In-Reply-To: <cd8d6641-4a29-7deb-49ae-a80baab0344f@canonical.com>
From: Anup Patel <apatel@ventanamicro.com>
Date: Wed, 6 Apr 2022 15:40:01 +0530
Message-ID: <CAK9=C2Xh_DQ3ybj7nAE-LNrSc9sPy0H8jq_FU09io+wE_yypRg@mail.gmail.com>
Subject: Re: [PATCH v2] RISC-V: Increase range and default value of NR_CPUS
To: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Arnd Bergmann <arnd@arndb.de>, Atish Patra <atishp@atishpatra.org>, 
 Alistair Francis <Alistair.Francis@wdc.com>, Anup Patel <anup@brainfault.org>, 
 linux-riscv <linux-riscv@lists.infradead.org>, 
 "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220406_031016_375807_1F81DAE2 
X-CRM114-Status: GOOD (  39.90  )
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

On Wed, Apr 6, 2022 at 3:25 PM Heinrich Schuchardt
<heinrich.schuchardt@canonical.com> wrote:
>
> On 3/31/22 21:42, Palmer Dabbelt wrote:
> > On Sat, 19 Mar 2022 05:12:06 PDT (-0700), apatel@ventanamicro.com wrote:
> >> Currently, the range and default value of NR_CPUS is too restrictive
> >> for high-end RISC-V systems with large number of HARTs. The latest
> >> QEMU virt machine supports upto 512 CPUs so the current NR_CPUS is
> >> restrictive for QEMU as well. Other major architectures (such as
> >> ARM64, x86_64, MIPS, etc) have a much higher range and default
> >> value of NR_CPUS.
> >>
> >> This patch increases NR_CPUS range to 2-512 and default value to
> >> XLEN (i.e. 32 for RV32 and 64 for RV64).
> >>
> >> Signed-off-by: Anup Patel <apatel@ventanamicro.com>
> >> ---
> >> Changes since v1:
> >>  - Updated NR_CPUS range to 2-512 which reflects maximum number of
> >>    CPUs supported by QEMU virt machine.
> >> ---
> >>  arch/riscv/Kconfig | 7 ++++---
> >>  1 file changed, 4 insertions(+), 3 deletions(-)
> >>
> >> diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> >> index 5adcbd9b5e88..423ac17f598c 100644
> >> --- a/arch/riscv/Kconfig
> >> +++ b/arch/riscv/Kconfig
> >> @@ -274,10 +274,11 @@ config SMP
> >>        If you don't know what to do here, say N.
> >>
> >>  config NR_CPUS
> >> -    int "Maximum number of CPUs (2-32)"
> >> -    range 2 32
> >> +    int "Maximum number of CPUs (2-512)"
> >> +    range 2 512
>
> For SBI_V01=y there seems to be a hard constraint to XLEN bits.
> See __sbi_v01_cpumask_to_hartmask() in rch/riscv/kernel/sbi.c.
>
> So shouldn't this be something like:
>
> range 2 512 !SBI_V01
> range 2 32 SBI_V01 && 32BIT
> range 2 64 SBI_V01 && 64BIT

This is just making it unnecessarily complicated for supporting
SBI v0.1

How about removing SBI v0.1 support and the spin-wait CPU
operations from arch/riscv ?

>
> >>      depends on SMP
> >> -    default "8"
> >> +    default "32" if 32BIT
> >> +    default "64" if 64BIT
> >>
> >>  config HOTPLUG_CPU
> >>      bool "Support for hot-pluggable CPUs"
> >
> > I'm getting all sorts of boot issues with more than 32 CPUs, even on the
> > latest QEMU master.  I'm not opposed to increasing the CPU count in
> > theory, but if we're going to have a setting that goes up to a huge
> > number it needs to at least boot.  I've got 64 host threads, so it
> > shouldn't just be a scheduling thing.
>
> Currently high performing hardware for RISC-V is missing. So it makes
> sense to build software via QEMU on x86_64 or arm64 with as many
> hardware threads as available (128 is not uncommon).
>
> OpenSBI currently is limited to 128 threads:
> include/sbi/sbi_hartmask.h:22:
> #define SBI_HARTMASK_MAX_BITS 128
> This is just an arbitrary value we can be modified.

Yes, this limit will be gradually increased with some improvements
to optimize runtime memory used by OpenSBI.

>
> U-Boot v2022.04 qemu-riscv64_smode_defconfig has a value of
> CONFIG_SYS_MALLOC_F_LEN that is to low. This leads to a boot failure for
> more than 16 harts. A patch to correct this is pending:
> [PATCH v2 1/1] riscv: alloc space exhausted
> https://lore.kernel.org/u-boot/CAN5B=eKt=tFLZ2z3aNHJqsnJzpdA0oikcrC2i1_=ZDD=f+M0jA@mail.gmail.com/T/#t
>
> With QEMU 7.0 and the U-Boot fix booting into a 5.17 defconfig kernel
> with 64 virtual cores worked fine for me.

Thanks for trying this patch.

Regards,
Anup

>
> Best regards
>
> Heinrich
>
> >
> > If there was some hardware that actually boots on these I'd be happy to
> > take it, but given that it's just QEMU I'd prefer to sort out the bugs
> > first.  It's probably just latent bugs somewhere, but allowing users to
> > turn on configs we know don't work just seems like the wrong way to go.
> >
> > _______________________________________________
> > linux-riscv mailing list
> > linux-riscv@lists.infradead.org
> > http://lists.infradead.org/mailman/listinfo/linux-riscv
> >
>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
