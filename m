Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46999C433F5
	for <linux-riscv@archiver.kernel.org>; Wed,  6 Apr 2022 23:00:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KcGlx4sDvVdGcAkVgtS+WaVFzrcfBhHdgbTp/7hWqxE=; b=ROelmU4x6Dv0tL
	wdYarq8fVlO/Lf4TmzUzutdfHD0kCTpRkTYlwaBrmSxudBYLuDZt1vxNWXOLNoLgNk5oTt7P3INr4
	JPFAq/oiyxAQ064Is7ncqaciyl5OhnYkB7D+iqvQhuUA++K2EF2gtcVLVGIxOSFJ8/uS2+A3uoxRC
	x7Y76sod8Dj+KIYQCrliZ8WPi5FsnutBRVUpI/JRDqzYRcPKUPVYhYu/qOvwp9EuaMgDdj5vP5q3m
	ORMXI7wtFQvCRT2kJbdCUDk99sKB6Uljvf5zWuOF3SJH011ElKmxuNMp5jSkyRCYhgsrudfQwKPaY
	iEI45hAT/tepy7ZFX6XA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ncEdn-008BLn-F1; Wed, 06 Apr 2022 23:00:43 +0000
Received: from mail-yb1-xb29.google.com ([2607:f8b0:4864:20::b29])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ncEdj-008BKh-OS
 for linux-riscv@lists.infradead.org; Wed, 06 Apr 2022 23:00:41 +0000
Received: by mail-yb1-xb29.google.com with SMTP id l36so6593665ybj.12
 for <linux-riscv@lists.infradead.org>; Wed, 06 Apr 2022 16:00:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=atishpatra.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=REjKncLjp1nMKQiEVjK+/uhj8//u0cu6B7KXtRM9r0I=;
 b=MJPDFk9xgUfUcoxyHGRS04ucddscvQEz6AdsQIvm761bw9DkU77tscCfmzvO8eMGEw
 hPOQ+KzEf58oJ57iItjoMirP1fti/p1Zxx2SlFFhcSxaO0Meql0WcuaIGuIZdl2rJT++
 TEh4SJH8up9i4QL7p/UZQZJBUXXvb6rk2R/jE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=REjKncLjp1nMKQiEVjK+/uhj8//u0cu6B7KXtRM9r0I=;
 b=yAx0/P8szucPlEYn6f10PkYso2MoInWbTPkvDzVg8wZq9RwZQg3zgGSPLE7XeeWTDc
 SqnQftl+0YKhcWiXbTRcOyt2fkoESLKQg+hJNsWumlp9nqVJAHGZ7RgfXVQbbb/T5h48
 KVciy7KMXuDnSVyGPofw8KjEiMewwC9SJt86Ibib9ZRcb0EslMnbqKaYWeI49xtE0dms
 1a96RKPBmh8QGOx1qslKn7leNEb9DYH1lMEel8HwfFBq+t2SGZu2bztXDNXr5cNYxY+E
 +Ts8sSndUol0VK5psi2Y1lArF6Zix8i5bB09K9az1PNW+fWBGDDyBw7iBLd/yn2wFLV6
 UnkA==
X-Gm-Message-State: AOAM533zMfZgVkRfeufE/Ym+XY7eyt+lD+iuDI33xRqoomzpkbXu48Qc
 a4ND/A6ItciBZ0+/7B/GxO3D+emAbikB0+TL+jYb
X-Google-Smtp-Source: ABdhPJx7Chr0rGxiUnrjypds2chKs2NOIkH2YmsqX59fMJZsjyQFVpluGZPATnKXNHyatQVrQDsVUDosstbC6rqlzeI=
X-Received: by 2002:a5b:803:0:b0:633:749f:9acd with SMTP id
 x3-20020a5b0803000000b00633749f9acdmr8257311ybp.236.1649286037416; Wed, 06
 Apr 2022 16:00:37 -0700 (PDT)
MIME-Version: 1.0
References: <mhng-9cbb2a46-8bcb-4bfe-b927-0ed469dbd3a6@palmer-mbp2014>
 <cd8d6641-4a29-7deb-49ae-a80baab0344f@canonical.com>
In-Reply-To: <cd8d6641-4a29-7deb-49ae-a80baab0344f@canonical.com>
From: Atish Patra <atishp@atishpatra.org>
Date: Wed, 6 Apr 2022 16:00:26 -0700
Message-ID: <CAOnJCUKDWBhphwvOc=waPiwFr5nT7otohJKr-yhoLYM=UBubQA@mail.gmail.com>
Subject: Re: [PATCH v2] RISC-V: Increase range and default value of NR_CPUS
To: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Arnd Bergmann <arnd@arndb.de>, Alistair Francis <Alistair.Francis@wdc.com>, 
 Anup Patel <anup@brainfault.org>, linux-riscv <linux-riscv@lists.infradead.org>,
 "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>,
 Anup Patel <apatel@ventanamicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220406_160040_086668_7F6854D3 
X-CRM114-Status: GOOD (  39.87  )
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

On Wed, Apr 6, 2022 at 2:55 AM Heinrich Schuchardt
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
>

Yes. In addition to that, we should disable RISCV_BOOT_SPINWAIT as well
so that you don't end up in  case where -smp argument in Qemu < NR_CPUs

Palmer already has a patch for that.
https://git.kernel.org/pub/scm/linux/kernel/git/palmer/linux.git/commit/?h=riscv-spinwait

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
>
> U-Boot v2022.04 qemu-riscv64_smode_defconfig has a value of
> CONFIG_SYS_MALLOC_F_LEN that is to low. This leads to a boot failure for
> more than 16 harts. A patch to correct this is pending:
> [PATCH v2 1/1] riscv: alloc space exhausted
> https://lore.kernel.org/u-boot/CAN5B=eKt=tFLZ2z3aNHJqsnJzpdA0oikcrC2i1_=ZDD=f+M0jA@mail.gmail.com/T/#t
>
> With QEMU 7.0 and the U-Boot fix booting into a 5.17 defconfig kernel
> with 64 virtual cores worked fine for me.
>

For me, OpenSBI -> Linux path works for 128 harts for bunch of configs from here

https://github.com/palmer-dabbelt/riscv-systems-ci/tree/master/configs/linux

with RISCV_BOOT_SPINWAIT disabled.

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


-- 
Regards,
Atish

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
