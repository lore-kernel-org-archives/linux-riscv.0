Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90580CA0EDC
	for <linux-riscv@archiver.kernel.org>; Thu, 14 Aug 2025 14:31:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QpmN+OAlVwu8Ajam6+tRknZdUPZC8frYeEfWmwKHMeE=; b=Cl2ZG8WbF2+90r
	svtKCd1YaUzXMsL7MoDiAV0G17airnojHuIwnggn9w8Pm0LQbTA+72Bgh6QquPDSa7yTlTke7S75V
	4CZSFKu0GLGtWjTQy0fm94NsRiqOq8RbPffRi23rAGzkuwUPZtTED2pokfAc0951XeODriHx+NPQs
	QUeE5fvBN0Z8uICbLWaJcRhQsqYFeQ9Xi9AND5WUwobUgfyzeN76RNuJyuoB6ZQCz9uiuoSZcbs21
	G1EFDHi4i/hbUEQtUIW9Qb2CZuDJ1oEyGfUqbzRulyWzyGNx8sGNl4fjiQaQsVaHrKpVcXu/yPv1m
	/h1gOHeR/UvSx2Oy61+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umYzO-0000000HGY3-3QIj;
	Thu, 14 Aug 2025 14:31:34 +0000
Received: from mail-yw1-x1132.google.com ([2607:f8b0:4864:20::1132])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umWau-0000000GnDV-1hlw
	for linux-riscv@lists.infradead.org;
	Thu, 14 Aug 2025 11:58:09 +0000
Received: by mail-yw1-x1132.google.com with SMTP id 00721157ae682-71d603b674aso8213087b3.1
        for <linux-riscv@lists.infradead.org>; Thu, 14 Aug 2025 04:58:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755172687; x=1755777487; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=RfBiimQKnptcOi9Y6BqGndb9+ezdhVP1QDAMPCX2CfE=;
        b=ly1p5C6dRClpSUDdv/v4ZpNrU//2CEHoaHo0D0+mhMUxCsL7h249U1bCgOfQ87RF3M
         HuZm+Jq4mLn9glbIpHPzyyBzsAbBwzzH9m7N2xfeOacDEV7Zjr4Z+XE2WEnYf8gN2YWq
         06YW9QxHlKNlzY5eLLdGHb5eXFa/YynGPDwkoLPI57dfXd9ksTLh67nu+gEitGX2lz0r
         btcYd32r53KvEN+y/JMh25NE5x6oHfsrt9RMJS1xsUfFJGgq5Xoa5UYEEmaStrvHZsiO
         oIVKYS9M+bDtaSu1U6PSMQEgtaV6j5oFZMXwQJ1O9KkQx5xsq43+GKGETRtX9qe/08qi
         VEKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755172687; x=1755777487;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RfBiimQKnptcOi9Y6BqGndb9+ezdhVP1QDAMPCX2CfE=;
        b=I/ROUrpiRDe1Hm1YMmd2Mk/TrCVZMoSujRSbVkfgBnrGveAlTpgtpjg8RQKjkGlYHV
         TWGkO6o2dr6rkyIXiO6GX6f/qK/p3N0JOJEQ20JJRz/h4PsmgjKNjYIt4R8qh8Op+KeJ
         3MvxOaDmfc6qSH903a5rVaFcr6S/KM44sQiIQr8fEn7vvrhV43R9VsD06WN2cSRMeyrT
         fSURCENM9Aygaxz7CVuz5/ewueVuv0wcTY/HhYr9Om5Tgo2qrPZRbcbRGaiSltDebs81
         owRHFvINghMm0fRRKRe9WOyPI8CE0Uu42l8RZCWLqRFwkIdSogPGwl3ryHh8CfxCaGZy
         UWSA==
X-Gm-Message-State: AOJu0YwiEWNnOhT5GMF52emSGl3LPcRnBVehTwjirn0DALddgtGoe7VG
	SmVWfWcZLgth+3rpICWy84kXHeCHBe0UnZ/DFeU5oN26p5xqO0CIChu3OwjVkw1RrZwq06GSa52
	VOTFG/2xAky7pMxcZkKW3aw64EIcGR2M=
X-Gm-Gg: ASbGncujNJ6H+tPcpNvAzHdpgDUGBNzRmDFj8wGr5SqxSzjsNvWJZs6ltvAoR4jV2la
	2U6k4ZJhB4vqvaUOxZ81AldFd8NoojuvKN9eV0VsgCG4HjolHdCmdF5pHlvPGMz7wbyxcvQMVsS
	BPeYpcSowW5C0sae7juJWkyjmnYTMxhCWswdjX5y+Q3hz83XNKkzk/256xeerYxm6D6wb9Dd9Kk
	OhvsPlsTpi7Egxykvt0Rchx8puB8zupC3MLoXhPqBzX0kistg==
X-Google-Smtp-Source: AGHT+IFdab1E3jQ/LymO+f9u0MTyI00hES/yt1AEcB0fU/LT1TNp5XHpUfzrid4KiO4lsokwEx8K6dulctAHKUQ1LC8=
X-Received: by 2002:a05:6902:6184:b0:e8e:288d:1f5a with SMTP id
 3f1490d57ef6-e931e2103ddmr2986524276.27.1755172687282; Thu, 14 Aug 2025
 04:58:07 -0700 (PDT)
MIME-Version: 1.0
References: <CAAbFZ0iFJbpqxqTUYhB+tUZSiL1qQJ=PeABCCjkeSpf4_TNiyQ@mail.gmail.com>
 <20250813180545.110666-1-parisoplop@gmail.com> <bb580c80-5c6d-43f8-808a-e0d713f0be0c@ghiti.fr>
 <CAAbFZ0hK7uAm_jXoThK+tLsGzBrLSNr1=Gv8=H21D7DyODWB6g@mail.gmail.com> <18ea9e1c-ebf9-4a5e-8880-d1af9ea07138@ghiti.fr>
In-Reply-To: <18ea9e1c-ebf9-4a5e-8880-d1af9ea07138@ghiti.fr>
From: Paris Oplopoios <parisoplop@gmail.com>
Date: Thu, 14 Aug 2025 14:57:56 +0300
X-Gm-Features: Ac12FXy61mlZwQTTVZtoY2EiYtQejBvCHdnvxNwfg3yPROxAmmBxoKP-YZ1ys4w
Message-ID: <CAAbFZ0j0UL0E08NCFgHRwL83CbWiKTnmaaMm414Oofi12HxLgA@mail.gmail.com>
Subject: Re: [PATCH v2] riscv: hwprobe: allow querying available
 RISCV_HWPROBE_KEY_IMA_EXT_0 bits
To: Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-riscv@lists.infradead.org, paul.walmsley@sifive.com, 
	palmer@dabbelt.com, aou@eecs.berkeley.edu
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250814_045808_449610_57AFDBDE 
X-CRM114-Status: GOOD (  53.28  )
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

> What about parsing the isa string?

Yes, parsing the ISA string would work. But if we're going
to do that, we might as well not use hwprobe at all. In my
opinion, using the syscall is much easier to implement and maintain.


> And do you have a real usecase in
> mind? I mean which project would benefit from this?

Yes, I want this feature for an x86-on-RISC-V userspace emulator
called felix86. We do runtime extension detection for our JIT.
Currently, for any extension that defines instructions we use the SIGILL
method previously described, because there's no way to tell with just
a hwprobe call whether a 0 bit means extension not present or kernel
too old. But we can't do this for all extensions, some don't define
instructions.

The end goal would be being able to detect an extension using hwprobe, and if
it's not detectable, notifying the user that we can't detect it and
they can mark
it as enabled in the emulator's config file.

On Thu, 14 Aug 2025 at 14:22, Alexandre Ghiti <alex@ghiti.fr> wrote:
>
> On 8/14/25 12:32, Paris Oplopoios wrote:
> > Hello Alexandre,
> >
> >> trying to figure out if an extension is available will likely result in a SIGILL, so that will kill your application
> > SIGILL can be captured with a signal handler and extension support can
> > be checked this way. Not all extensions can be detected using this
> > method, and it's much more straightforward to ask the kernel.
> >
> >> Why don't you check the kernel config or even the hwprobe.h header? Since basically here, you use a syscall to return an information that is visible already from userspace.
> > To give an example, imagine a new extension Znew comes out, it
> > occupies the bit 1<<59. Let's say my kernel version was built with
> > support for detecting it and yours wasn't, but we both have the same
> > hardware. I compile a binary of a program that wants to do runtime
> > extension detection and I want to distribute it.
> >
> > If I use the config or the hwprobe.h header during compilation time,
> > the compiled binary is assuming that both mine and your system have
> > this new bit. So when my program tries to detect it, it will find it
> > on my hardware but not yours. That's because my kernel was built to
> > support this bit in hwprobe but yours wasn't.
> >
> > But in reality your hardware does have the extension. However, how
> > will my program differentiate from "doesn't have an extension" and
> > "kernel version not new enough"? Maybe I'd like to know that the
> > kernel doesn't have the bit, and notify the user with an "update your
> > kernel" message. Maybe I'd like to do the fallback SIGILL extension
> > detection instead.
>
>
> What about parsing the isa string? And do you have a real usecase in
> mind? I mean which project would benefit from this?
>
>
> >
> > PS: I'm assuming you meant checking config/hwprobe.h at compilation
> > time. If you meant parsing it at runtime, that simply wouldn't be
> > possible on all environments (think chroots).
> >
> > On Thu, 14 Aug 2025 at 12:37, Alexandre Ghiti <alex@ghiti.fr> wrote:
> >> Hi Paris,
> >>
> >> On 8/13/25 20:05, offtkp wrote:
> >>> When probing for extensions using RISCV_HWPROBE_KEY_IMA_EXT_0, a missing
> >>> bit in the resulting bitmask means the extension is not available or the
> >>> kernel is not recent enough to support the bit. Currently, there's no
> >>> way to differentiate between the two.
> >>>
> >>> This adds a new riscv_hwprobe key, RISCV_HWPROBE_KEY_IMA_EXT_0_AVAIL,
> >>> which returns a bitmask of all the queryable extensions supported by the
> >>> kernel in RISCV_HWPROBE_KEY_IMA_EXT_0. This can allow programs to use a
> >>> fallback extension detection method when the bit they want to query is
> >>> not available in the kernel they are running on.
> >>
> >> Admittedly, I'm not convinced this is necessary. As you showed in your
> >> v1, trying to figure out if an extension is available will likely result
> >> in a SIGILL, so that will kill your application. Why don't you check the
> >> kernel config or even the hwprobe.h header? Since basically here, you
> >> use a syscall to return an information that is visible already from
> >> userspace.
> >>
> >> But maybe I'm missing an interesting usecase, just let me know.
> >>
> >> Thanks,
> >>
> >> Alex
> >>
> >>
> >>> Signed-off-by: offtkp <parisoplop@gmail.com>
> >>> ---
> >>> Changes in v2:
> >>> - convert spaces to tabs
> >>> - use git format-patch to create diff
> >>>
> >>>    Documentation/arch/riscv/hwprobe.rst  | 5 ++++-
> >>>    arch/riscv/include/asm/hwprobe.h      | 3 ++-
> >>>    arch/riscv/include/uapi/asm/hwprobe.h | 2 ++
> >>>    arch/riscv/kernel/sys_hwprobe.c       | 4 ++++
> >>>    4 files changed, 12 insertions(+), 2 deletions(-)
> >>>
> >>> diff --git a/Documentation/arch/riscv/hwprobe.rst b/Documentation/arch/riscv/hwprobe.rst
> >>> index 2aa9be272d5d..6d77def0a46e 100644
> >>> --- a/Documentation/arch/riscv/hwprobe.rst
> >>> +++ b/Documentation/arch/riscv/hwprobe.rst
> >>> @@ -360,4 +360,7 @@ The following keys are defined:
> >>>
> >>>        * :c:macro:`RISCV_HWPROBE_VENDOR_EXT_XSFVFWMACCQQQ`: The Xsfvfwmaccqqq
> >>>            vendor extension is supported in version 1.0 of Matrix Multiply Accumulate
> >>> -     Instruction Extensions Specification.
> >>> \ No newline at end of file
> >>> +     Instruction Extensions Specification.
> >>> +
> >>> +* :c:macro:`RISCV_HWPROBE_KEY_IMA_EXT_0_AVAIL`: A bitmask containing the extensions
> >>> +  that can be probed using the :c:macro:`RISCV_HWPROBE_KEY_IMA_EXT_0` key.
> >>> \ No newline at end of file
> >>> diff --git a/arch/riscv/include/asm/hwprobe.h b/arch/riscv/include/asm/hwprobe.h
> >>> index 7fe0a379474a..501d49b7a02a 100644
> >>> --- a/arch/riscv/include/asm/hwprobe.h
> >>> +++ b/arch/riscv/include/asm/hwprobe.h
> >>> @@ -8,7 +8,8 @@
> >>>
> >>>    #include <uapi/asm/hwprobe.h>
> >>>
> >>> -#define RISCV_HWPROBE_MAX_KEY 13
> >>> +#define RISCV_HWPROBE_MAX_KEY 14
> >>> +#define RISCV_HWPROBE_KEY_IMA_EXT_0_AVAIL_VALUE      ((1ULL << 59) - 1)
> >>>
> >>>    static inline bool riscv_hwprobe_key_is_valid(__s64 key)
> >>>    {
> >>> diff --git a/arch/riscv/include/uapi/asm/hwprobe.h b/arch/riscv/include/uapi/asm/hwprobe.h
> >>> index aaf6ad970499..a3b92df4dc05 100644
> >>> --- a/arch/riscv/include/uapi/asm/hwprobe.h
> >>> +++ b/arch/riscv/include/uapi/asm/hwprobe.h
> >>> @@ -82,6 +82,7 @@ struct riscv_hwprobe {
> >>>    #define             RISCV_HWPROBE_EXT_ZAAMO         (1ULL << 56)
> >>>    #define             RISCV_HWPROBE_EXT_ZALRSC        (1ULL << 57)
> >>>    #define             RISCV_HWPROBE_EXT_ZABHA         (1ULL << 58)
> >>> +/* Change RISCV_HWPROBE_KEY_IMA_EXT_0_AVAIL_VALUE when adding items. */
> >>>    #define RISCV_HWPROBE_KEY_CPUPERF_0 5
> >>>    #define             RISCV_HWPROBE_MISALIGNED_UNKNOWN        (0 << 0)
> >>>    #define             RISCV_HWPROBE_MISALIGNED_EMULATED       (1 << 0)
> >>> @@ -106,6 +107,7 @@ struct riscv_hwprobe {
> >>>    #define RISCV_HWPROBE_KEY_VENDOR_EXT_THEAD_0        11
> >>>    #define RISCV_HWPROBE_KEY_ZICBOM_BLOCK_SIZE 12
> >>>    #define RISCV_HWPROBE_KEY_VENDOR_EXT_SIFIVE_0       13
> >>> +#define RISCV_HWPROBE_KEY_IMA_EXT_0_AVAIL 14
> >>>    /* Increase RISCV_HWPROBE_MAX_KEY when adding items. */
> >>>
> >>>    /* Flags */
> >>> diff --git a/arch/riscv/kernel/sys_hwprobe.c b/arch/riscv/kernel/sys_hwprobe.c
> >>> index 0b170e18a2be..40e7fa5f85f3 100644
> >>> --- a/arch/riscv/kernel/sys_hwprobe.c
> >>> +++ b/arch/riscv/kernel/sys_hwprobe.c
> >>> @@ -310,6 +310,10 @@ static void hwprobe_one_pair(struct riscv_hwprobe *pair,
> >>>                hwprobe_isa_vendor_ext_thead_0(pair, cpus);
> >>>                break;
> >>>
> >>> +     case RISCV_HWPROBE_KEY_IMA_EXT_0_AVAIL:
> >>> +             pair->value = RISCV_HWPROBE_KEY_IMA_EXT_0_AVAIL_VALUE;
> >>> +             break;
> >>> +
> >>>        /*
> >>>         * For forward compatibility, unknown keys don't fail the whole
> >>>         * call, but get their element key set to -1 and value set to 0
> >>>
> >>> _______________________________________________
> >>> linux-riscv mailing list
> >>> linux-riscv@lists.infradead.org
> >>> http://lists.infradead.org/mailman/listinfo/linux-riscv

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
