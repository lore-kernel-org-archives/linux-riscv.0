Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E81ADC433EF
	for <linux-riscv@archiver.kernel.org>; Fri,  8 Apr 2022 16:45:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=M/c1iJXwa2qeRRGlGRzCTwhVTk8R+LYM9V0TuY6aEuo=; b=4adUGaRaxFKcVM
	8HNO53z9Kzt0WCP0nHgHWJ0Hfo19hI8OjXvUlfyPmMk+Ve/AAIjgcnt03fGT++az7LmSP25OEdQpO
	TSSlJ90FCHhB7KnU7vqB1lVcGMOo9zIlJ44kHuiJqwOHS3nnh4dqvSFozlAUnM7vYFshu1dV0LM5u
	ZMpLjjXz3bH5h7GoL3doHRIuLS1P6SZ1ILWPLe+8/SFhzearT6B8LrUadTjWN5tUlZrBb3sYmlsil
	MlLx3VNTgvPWVpo539WTnsSMAER14w57C712POVIvFAKt2gMeDmhjJQY9czSpDeXeEf6cHw7rBFuT
	e8A8wMweTuEbOehYsPsg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ncrk2-000c9x-20; Fri, 08 Apr 2022 16:45:46 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ncrjy-000c7Q-Dp
 for linux-riscv@lists.infradead.org; Fri, 08 Apr 2022 16:45:44 +0000
Received: by mail-wm1-x330.google.com with SMTP id q20so5919478wmq.1
 for <linux-riscv@lists.infradead.org>; Fri, 08 Apr 2022 09:45:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=hsR6O4eaICB82MEVDSEX7922LD8DveH/xZVqwX1N9p0=;
 b=FNc8Ik0xlX5AtoqvO7t5QzfYSYm1tFKhUPWfqGcvpLN+Iyb4AuBPU8dKAKeuMDmvNK
 E4soatlGoTsa9KvwA9Pqf45pnAjIn3y8YY1lYMlcgPxjoPwolUV5Q4BUovjz8R2l6KbT
 AvR1xvgJSMujYhLH0ymY6iyI6rb9NPFeZLvVvv0PV66LEgNOKH9XHwdU3GIyJKsOxHt/
 AQ/mZb1a1PnEBNSVf2bi5y9fzro7k26lx6uqUlnT0PgXN5hsuK0M4A31BM4dBXAzcM7T
 XLdLn2BnVzj0+R8iMjaRntnmYFqEViBr1x+Q547ktC3WXzpdGmFVKLU67VHn6BUIGN+5
 /l3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=hsR6O4eaICB82MEVDSEX7922LD8DveH/xZVqwX1N9p0=;
 b=oyHGTaWuylOnD9VenJUlI+3xMipH/JBdJNKUvQwvDTC6zku5Mh3ZllIg/mkL1s1HSO
 MEro7JTyoEPNvZS/j4fWN68MmdN615Lbz+kWmbqsGOwaFpUsK2u0RUrVhb+c0XjqDlo5
 40NyPMYyOwV4mEwismViW0KqnJcZOJXWvoZsjz4pPGlAR/l0gPaNwImpgxgDTIbkKj3s
 YinxmA3AtThEe/eZnCg14r4c6eKqp4BuiuREW+7UR+BBSgUZrFzTZRUJsGYJ2VvwIQXa
 qphx5oazUsCe3ECC1Rzekz9xmIKcmw+e5WUeZ4cDhn7tQfK4eA8WZkWjX7EaThJWGJKt
 fvaw==
X-Gm-Message-State: AOAM5327hp/IpZ8k27jyBEMR/2xhB6wJ2GG7MAU+XBWfbVJn+ZAsVbdh
 yci5lJzFoPThURFUdFyE4tP2H8Ur3KWB2T4555KVTA==
X-Google-Smtp-Source: ABdhPJzglzfwkwV1bsPSu0gplUQ3D3k4WOJBKUIVsafnJiQlstnKUiizZCpvp5Vh3HAPd9PWbPlDHgYSbikkg2K1eSc=
X-Received: by 2002:a05:600c:1d04:b0:38c:ba2f:88ba with SMTP id
 l4-20020a05600c1d0400b0038cba2f88bamr17835133wms.137.1649436337643; Fri, 08
 Apr 2022 09:45:37 -0700 (PDT)
MIME-Version: 1.0
References: <mhng-9cbb2a46-8bcb-4bfe-b927-0ed469dbd3a6@palmer-mbp2014>
 <cd8d6641-4a29-7deb-49ae-a80baab0344f@canonical.com>
 <CAK9=C2Xh_DQ3ybj7nAE-LNrSc9sPy0H8jq_FU09io+wE_yypRg@mail.gmail.com>
 <b907f6c8-968b-7e1e-bc83-1d54c7e0b448@canonical.com>
In-Reply-To: <b907f6c8-968b-7e1e-bc83-1d54c7e0b448@canonical.com>
From: Anup Patel <anup@brainfault.org>
Date: Fri, 8 Apr 2022 22:15:25 +0530
Message-ID: <CAAhSdy1ovEziSSu6x2kESYTbimDLXCHmmOqMLyGKzsj1DHLrLg@mail.gmail.com>
Subject: Re: [PATCH v2] RISC-V: Increase range and default value of NR_CPUS
To: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
Cc: Anup Patel <apatel@ventanamicro.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Paul Walmsley <paul.walmsley@sifive.com>, Arnd Bergmann <arnd@arndb.de>, 
 Atish Patra <atishp@atishpatra.org>,
 Alistair Francis <Alistair.Francis@wdc.com>, 
 linux-riscv <linux-riscv@lists.infradead.org>, 
 "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220408_094542_750505_9659F08C 
X-CRM114-Status: GOOD (  43.40  )
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

On Fri, Apr 8, 2022 at 10:08 PM Heinrich Schuchardt
<heinrich.schuchardt@canonical.com> wrote:
>
> On 4/6/22 12:10, Anup Patel wrote:
> > On Wed, Apr 6, 2022 at 3:25 PM Heinrich Schuchardt
> > <heinrich.schuchardt@canonical.com> wrote:
> >>
> >> On 3/31/22 21:42, Palmer Dabbelt wrote:
> >>> On Sat, 19 Mar 2022 05:12:06 PDT (-0700), apatel@ventanamicro.com wrote:
> >>>> Currently, the range and default value of NR_CPUS is too restrictive
> >>>> for high-end RISC-V systems with large number of HARTs. The latest
> >>>> QEMU virt machine supports upto 512 CPUs so the current NR_CPUS is
> >>>> restrictive for QEMU as well. Other major architectures (such as
> >>>> ARM64, x86_64, MIPS, etc) have a much higher range and default
> >>>> value of NR_CPUS.
> >>>>
> >>>> This patch increases NR_CPUS range to 2-512 and default value to
> >>>> XLEN (i.e. 32 for RV32 and 64 for RV64).
> >>>>
> >>>> Signed-off-by: Anup Patel <apatel@ventanamicro.com>
> >>>> ---
> >>>> Changes since v1:
> >>>>   - Updated NR_CPUS range to 2-512 which reflects maximum number of
> >>>>     CPUs supported by QEMU virt machine.
> >>>> ---
> >>>>   arch/riscv/Kconfig | 7 ++++---
> >>>>   1 file changed, 4 insertions(+), 3 deletions(-)
> >>>>
> >>>> diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> >>>> index 5adcbd9b5e88..423ac17f598c 100644
> >>>> --- a/arch/riscv/Kconfig
> >>>> +++ b/arch/riscv/Kconfig
> >>>> @@ -274,10 +274,11 @@ config SMP
> >>>>         If you don't know what to do here, say N.
> >>>>
> >>>>   config NR_CPUS
> >>>> -    int "Maximum number of CPUs (2-32)"
> >>>> -    range 2 32
> >>>> +    int "Maximum number of CPUs (2-512)"
> >>>> +    range 2 512
> >>
> >> For SBI_V01=y there seems to be a hard constraint to XLEN bits.
> >> See __sbi_v01_cpumask_to_hartmask() in rch/riscv/kernel/sbi.c.
> >>
> >> So shouldn't this be something like:
> >>
> >> range 2 512 !SBI_V01
> >> range 2 32 SBI_V01 && 32BIT
> >> range 2 64 SBI_V01 && 64BIT
> >
> > This is just making it unnecessarily complicated for supporting
> > SBI v0.1
> >
> > How about removing SBI v0.1 support and the spin-wait CPU
> > operations from arch/riscv ?
>
> The SBI v0.1 specification was only a draft. Only the v1.0 version has
> ever been ratified.
>
> It would be good to remove this legacy code from Linux and U-Boot.
>
> By the way, why does upstream OpenSBI claim to be conformant to SBI v0.3
> and not to v1.0?

The ratification process for SBI v1.0 was in early stages when OpenSBI v1.0
was being released so we decided to keep the SBI v0.3 spec version. The
next OpenSBI v1.1 release (due in June 2022) will change to SBI v1.0

Regards,
Anup

>
> include/sbi/sbi_ecall.h:16:
>
> #define SBI_ECALL_VERSION_MAJOR 0
> #define SBI_ECALL_VERSION_MINOR 3
>
> Best regards
>
> Heinrich
>
> >
> >>
> >>>>       depends on SMP
> >>>> -    default "8"
> >>>> +    default "32" if 32BIT
> >>>> +    default "64" if 64BIT
> >>>>
> >>>>   config HOTPLUG_CPU
> >>>>       bool "Support for hot-pluggable CPUs"
> >>>
> >>> I'm getting all sorts of boot issues with more than 32 CPUs, even on the
> >>> latest QEMU master.  I'm not opposed to increasing the CPU count in
> >>> theory, but if we're going to have a setting that goes up to a huge
> >>> number it needs to at least boot.  I've got 64 host threads, so it
> >>> shouldn't just be a scheduling thing.
> >>
> >> Currently high performing hardware for RISC-V is missing. So it makes
> >> sense to build software via QEMU on x86_64 or arm64 with as many
> >> hardware threads as available (128 is not uncommon).
> >>
> >> OpenSBI currently is limited to 128 threads:
> >> include/sbi/sbi_hartmask.h:22:
> >> #define SBI_HARTMASK_MAX_BITS 128
> >> This is just an arbitrary value we can be modified.
> >
> > Yes, this limit will be gradually increased with some improvements
> > to optimize runtime memory used by OpenSBI.
> >
> >>
> >> U-Boot v2022.04 qemu-riscv64_smode_defconfig has a value of
> >> CONFIG_SYS_MALLOC_F_LEN that is to low. This leads to a boot failure for
> >> more than 16 harts. A patch to correct this is pending:
> >> [PATCH v2 1/1] riscv: alloc space exhausted
> >> https://lore.kernel.org/u-boot/CAN5B=eKt=tFLZ2z3aNHJqsnJzpdA0oikcrC2i1_=ZDD=f+M0jA@mail.gmail.com/T/#t
> >>
> >> With QEMU 7.0 and the U-Boot fix booting into a 5.17 defconfig kernel
> >> with 64 virtual cores worked fine for me.
> >
> > Thanks for trying this patch.
> >
> > Regards,
> > Anup
> >
> >>
> >> Best regards
> >>
> >> Heinrich
> >>
> >>>
> >>> If there was some hardware that actually boots on these I'd be happy to
> >>> take it, but given that it's just QEMU I'd prefer to sort out the bugs
> >>> first.  It's probably just latent bugs somewhere, but allowing users to
> >>> turn on configs we know don't work just seems like the wrong way to go.
> >>>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
