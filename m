Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73085C433F5
	for <linux-riscv@archiver.kernel.org>; Mon, 11 Apr 2022 22:19:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1JfVGQyjD/BU6/M34jE+dz+dCNDipsMArGJOyTnnuvU=; b=zMhl2Pb+WIJprn
	Znn4GxgywXpqIi+dljiWLlLAqmeo8Y8sTGwOtMU43I/s5BnBpCfCK2oCc/ahVWm9B1GJnrvBqzLeR
	WR8emoWD5NkYZkTJZy8KElRo4z3VC8+GN4M5LNAKt9rn7h15SjteOtGWvR47N8ptFam9arWcGGR5S
	GuGzPaeovPnfAHViiPU5XfisfXAsbd28LOS2Zw5aZoLu9fQIIyjtarj4+pFL2lqj6gEoCvzOGChmy
	UHrIT44LXNj3AGYZwRd8sBqKgeLdFYjYVtWv6Wm5z+5Zg8wtkqyfOTFP83ovyI0gjVKiMOIPOTNDC
	2cb6jdqnSnXGNcjhaMKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ne2NP-00Af4I-50; Mon, 11 Apr 2022 22:19:15 +0000
Received: from mail-yb1-xb36.google.com ([2607:f8b0:4864:20::b36])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ne2NM-00Af3G-5Y
 for linux-riscv@lists.infradead.org; Mon, 11 Apr 2022 22:19:14 +0000
Received: by mail-yb1-xb36.google.com with SMTP id x200so6278851ybe.13
 for <linux-riscv@lists.infradead.org>; Mon, 11 Apr 2022 15:19:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=atishpatra.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=g9meaVk2eU1Ub1J/lh8wpOzsDGLcFnkv//kNBJa8QEk=;
 b=B7UMhev78NYH9YuneasYHK3IzX9KrUAa7GGU2PEGUPfHn5SIGyfMYdkalMGitGaDW+
 9zVhjvWnNRDTOFmmEDfHWrVhYgaFTSqRVXav13yTykadccac6yTPeY3Ag/fzLUT2n3mx
 +iPa75DAlbyb5saxZcXHPjAHg+xHtZTpokeRQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=g9meaVk2eU1Ub1J/lh8wpOzsDGLcFnkv//kNBJa8QEk=;
 b=ZHq4BkCMgZQMFe7y4SAtZ33NW82QBCK7JokzY9fCmwUnWKJQ1JLFwf0vvGvXVc2mk+
 rYlDwdohTQ4+UbRFumrlH2yJATnCCaFB82U5Q95Lhs7wY2Yt8iKXnXMmqOVik86cDsPD
 magESTtUUquT9oeXo1NKEiH/mVnzqikdQxZ5ml/dLu98LjO5wQ4Av2HjCZ7kbzrdwpf7
 LwPgZ+sAjLgq2JyxO9K9Dm30QyhOkbc1Qq7/HLp/MTRXxCE3ywy9gjXwqlljzQp+iY+W
 v6TfsmXe/8MPG7Xm/XzjnKObmcptf2iIAui9IB1HVD0fwLrhhFchJ/afAK6eAZtpNsh/
 5iMQ==
X-Gm-Message-State: AOAM531wCA1B8u3PtdP74sHlZaSkXo+lS9HG6+QqjWQ3fIm689K7TDB9
 OSy4WqCnq9intx61zpjG72nFqnlV1rQZ6B52Huk+
X-Google-Smtp-Source: ABdhPJz3ewEbsMRLR8QG8tn8aHMoHRDhURqXevWUL4e9Co13fWrYNcAp15z54+WjrA5pEnSP9/rc0a1KOOjfae6qbuI=
X-Received: by 2002:a25:7102:0:b0:63d:91db:c29d with SMTP id
 m2-20020a257102000000b0063d91dbc29dmr23903612ybc.405.1649715549799; Mon, 11
 Apr 2022 15:19:09 -0700 (PDT)
MIME-Version: 1.0
References: <mhng-9cbb2a46-8bcb-4bfe-b927-0ed469dbd3a6@palmer-mbp2014>
 <cd8d6641-4a29-7deb-49ae-a80baab0344f@canonical.com>
 <CAK9=C2Xh_DQ3ybj7nAE-LNrSc9sPy0H8jq_FU09io+wE_yypRg@mail.gmail.com>
 <b907f6c8-968b-7e1e-bc83-1d54c7e0b448@canonical.com>
 <CAAhSdy1ovEziSSu6x2kESYTbimDLXCHmmOqMLyGKzsj1DHLrLg@mail.gmail.com>
In-Reply-To: <CAAhSdy1ovEziSSu6x2kESYTbimDLXCHmmOqMLyGKzsj1DHLrLg@mail.gmail.com>
From: Atish Patra <atishp@atishpatra.org>
Date: Mon, 11 Apr 2022 15:18:59 -0700
Message-ID: <CAOnJCUJWVERXCW02LfMBBMQNSPgNoNHExm8PeaUnongXgHkBAA@mail.gmail.com>
Subject: Re: [PATCH v2] RISC-V: Increase range and default value of NR_CPUS
To: Anup Patel <anup@brainfault.org>
Cc: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>,
 Anup Patel <apatel@ventanamicro.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
 Arnd Bergmann <arnd@arndb.de>, Alistair Francis <Alistair.Francis@wdc.com>, 
 linux-riscv <linux-riscv@lists.infradead.org>, 
 "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220411_151912_432999_3F9461B2 
X-CRM114-Status: GOOD (  46.08  )
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

On Fri, Apr 8, 2022 at 9:45 AM Anup Patel <anup@brainfault.org> wrote:
>
> On Fri, Apr 8, 2022 at 10:08 PM Heinrich Schuchardt
> <heinrich.schuchardt@canonical.com> wrote:
> >
> > On 4/6/22 12:10, Anup Patel wrote:
> > > On Wed, Apr 6, 2022 at 3:25 PM Heinrich Schuchardt
> > > <heinrich.schuchardt@canonical.com> wrote:
> > >>
> > >> On 3/31/22 21:42, Palmer Dabbelt wrote:
> > >>> On Sat, 19 Mar 2022 05:12:06 PDT (-0700), apatel@ventanamicro.com wrote:
> > >>>> Currently, the range and default value of NR_CPUS is too restrictive
> > >>>> for high-end RISC-V systems with large number of HARTs. The latest
> > >>>> QEMU virt machine supports upto 512 CPUs so the current NR_CPUS is
> > >>>> restrictive for QEMU as well. Other major architectures (such as
> > >>>> ARM64, x86_64, MIPS, etc) have a much higher range and default
> > >>>> value of NR_CPUS.
> > >>>>
> > >>>> This patch increases NR_CPUS range to 2-512 and default value to
> > >>>> XLEN (i.e. 32 for RV32 and 64 for RV64).
> > >>>>
> > >>>> Signed-off-by: Anup Patel <apatel@ventanamicro.com>
> > >>>> ---
> > >>>> Changes since v1:
> > >>>>   - Updated NR_CPUS range to 2-512 which reflects maximum number of
> > >>>>     CPUs supported by QEMU virt machine.
> > >>>> ---
> > >>>>   arch/riscv/Kconfig | 7 ++++---
> > >>>>   1 file changed, 4 insertions(+), 3 deletions(-)
> > >>>>
> > >>>> diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> > >>>> index 5adcbd9b5e88..423ac17f598c 100644
> > >>>> --- a/arch/riscv/Kconfig
> > >>>> +++ b/arch/riscv/Kconfig
> > >>>> @@ -274,10 +274,11 @@ config SMP
> > >>>>         If you don't know what to do here, say N.
> > >>>>
> > >>>>   config NR_CPUS
> > >>>> -    int "Maximum number of CPUs (2-32)"
> > >>>> -    range 2 32
> > >>>> +    int "Maximum number of CPUs (2-512)"
> > >>>> +    range 2 512
> > >>
> > >> For SBI_V01=y there seems to be a hard constraint to XLEN bits.
> > >> See __sbi_v01_cpumask_to_hartmask() in rch/riscv/kernel/sbi.c.
> > >>
> > >> So shouldn't this be something like:
> > >>
> > >> range 2 512 !SBI_V01
> > >> range 2 32 SBI_V01 && 32BIT
> > >> range 2 64 SBI_V01 && 64BIT
> > >
> > > This is just making it unnecessarily complicated for supporting
> > > SBI v0.1
> > >
> > > How about removing SBI v0.1 support and the spin-wait CPU
> > > operations from arch/riscv ?
> >
> > The SBI v0.1 specification was only a draft. Only the v1.0 version has
> > ever been ratified.
> >
> > It would be good to remove this legacy code from Linux and U-Boot.
> >
> > By the way, why does upstream OpenSBI claim to be conformant to SBI v0.3
> > and not to v1.0?
>
> The ratification process for SBI v1.0 was in early stages when OpenSBI v1.0
> was being released so we decided to keep the SBI v0.3 spec version. The
> next OpenSBI v1.1 release (due in June 2022) will change to SBI v1.0
>

Yes. We are in the final stages of the official ratification of SBI
v1.0. Once that ratified version is released,
OpenSBI will be upgraded to support that.

> Regards,
> Anup
>
> >
> > include/sbi/sbi_ecall.h:16:
> >
> > #define SBI_ECALL_VERSION_MAJOR 0
> > #define SBI_ECALL_VERSION_MINOR 3
> >
> > Best regards
> >
> > Heinrich
> >
> > >
> > >>
> > >>>>       depends on SMP
> > >>>> -    default "8"
> > >>>> +    default "32" if 32BIT
> > >>>> +    default "64" if 64BIT
> > >>>>
> > >>>>   config HOTPLUG_CPU
> > >>>>       bool "Support for hot-pluggable CPUs"
> > >>>
> > >>> I'm getting all sorts of boot issues with more than 32 CPUs, even on the
> > >>> latest QEMU master.  I'm not opposed to increasing the CPU count in
> > >>> theory, but if we're going to have a setting that goes up to a huge
> > >>> number it needs to at least boot.  I've got 64 host threads, so it
> > >>> shouldn't just be a scheduling thing.
> > >>
> > >> Currently high performing hardware for RISC-V is missing. So it makes
> > >> sense to build software via QEMU on x86_64 or arm64 with as many
> > >> hardware threads as available (128 is not uncommon).
> > >>
> > >> OpenSBI currently is limited to 128 threads:
> > >> include/sbi/sbi_hartmask.h:22:
> > >> #define SBI_HARTMASK_MAX_BITS 128
> > >> This is just an arbitrary value we can be modified.
> > >
> > > Yes, this limit will be gradually increased with some improvements
> > > to optimize runtime memory used by OpenSBI.
> > >
> > >>
> > >> U-Boot v2022.04 qemu-riscv64_smode_defconfig has a value of
> > >> CONFIG_SYS_MALLOC_F_LEN that is to low. This leads to a boot failure for
> > >> more than 16 harts. A patch to correct this is pending:
> > >> [PATCH v2 1/1] riscv: alloc space exhausted
> > >> https://lore.kernel.org/u-boot/CAN5B=eKt=tFLZ2z3aNHJqsnJzpdA0oikcrC2i1_=ZDD=f+M0jA@mail.gmail.com/T/#t
> > >>
> > >> With QEMU 7.0 and the U-Boot fix booting into a 5.17 defconfig kernel
> > >> with 64 virtual cores worked fine for me.
> > >
> > > Thanks for trying this patch.
> > >
> > > Regards,
> > > Anup
> > >
> > >>
> > >> Best regards
> > >>
> > >> Heinrich
> > >>
> > >>>
> > >>> If there was some hardware that actually boots on these I'd be happy to
> > >>> take it, but given that it's just QEMU I'd prefer to sort out the bugs
> > >>> first.  It's probably just latent bugs somewhere, but allowing users to
> > >>> turn on configs we know don't work just seems like the wrong way to go.
> > >>>



-- 
Regards,
Atish

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
