Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F27E1C433EF
	for <linux-riscv@archiver.kernel.org>; Fri, 10 Jun 2022 09:43:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=i72OySnXKiJdCI0eOHOb8dqMacPi8NLtm+brDP7PeKM=; b=TB1854UwHoRCaf
	e5jXkmbEet2kBlR+eBrUo3d/EsarSmJRRENSsMMSgm9xo8h1Xgr/O3xQjMw2XDb/paQ6zfuqeewyj
	q7829Q40z7pPkBeLi5z6OGUYDYxw3LSfKfCDvP6KWGy6Go5llIW1+hUd6xpapxWTfrskjpI6P3hN+
	dCtq/vHvhxOOjvldMj6EAQCXh7nnd0JzYK/0Yx9puQ7YFCGrfHjvcTfd0hcdHYfWuxNz4MuEfKprI
	9bT4yx34WjXXbI3WeI0iehcYnLo+ApVdxrATMw1Hkgyfu7swMfyTvs9uAGLO+xJYWOrrPdeCdqWjc
	VgAMElQc9Dy3EzPnON/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nzbAZ-007HGr-Ns; Fri, 10 Jun 2022 09:43:08 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nzb2u-007DJo-GB; Fri, 10 Jun 2022 09:35:14 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id C2B8BB8083A;
	Fri, 10 Jun 2022 09:35:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 79D69C3411D;
	Fri, 10 Jun 2022 09:35:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1654853709;
	bh=zLrmMpmoA8CObQY3AeLB7ra8RuQzI8MOQWc6jjj9U3M=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=ly5hAIkgez3ocC+l+mQGgX4lzFeu4ZoxAtzBiJYdYYFXw+AchwN1lMwZlqgzok9sE
	 DWVxhIPCrQRsiAp2gVDgqOaEBbC0cu4gFIGWjikw+zzzn9gJZra78AO16jpt9EvKkd
	 yNXNqU1PuYG8MkqBBfBVTEsi/sxdmHA/t/AgqzJqugBnQtP+4TVNfRYumbPzXbapDL
	 eFp6tWtErp/kO8gHnkEH7IRnrI0a7wcl0v/y+JrFnSIrV+QGrZ2YLYOpKXOPfWtGNx
	 2mqImN+ln400cLTRHVbAGhyMeAalLmSrg+FeprjezxMT3j3t0mPseCjrmzeRdH2MLq
	 7bze2SH3fykOg==
Received: by mail-oa1-f51.google.com with SMTP id 586e51a60fabf-fe51318ccfso2640250fac.0;
        Fri, 10 Jun 2022 02:35:09 -0700 (PDT)
X-Gm-Message-State: AOAM530xZN/FLwRvvWSwNbB714ZBOO9ZdvLUCEFj1vl/Ui728ff5X9lC
	7r/5bHPT4HgnssXHEPsLXG6L2SpAbClt9uT8rSA=
X-Google-Smtp-Source: ABdhPJwtUww0eZw3o6xn5UGKNTcbExnHhigXRS8/EaLgckNAAkrH62R+XKUB/ZgL6kPVZjHCyNbogaEQ+dpljNgoFYo=
X-Received: by 2002:a05:6871:5c8:b0:f3:3c1c:126f with SMTP id
 v8-20020a05687105c800b000f33c1c126fmr4199738oan.126.1654853698407; Fri, 10
 Jun 2022 02:34:58 -0700 (PDT)
MIME-Version: 1.0
References: <20220607093805.1354256-1-mawupeng1@huawei.com>
 <20220607093805.1354256-3-mawupeng1@huawei.com> <bfa0b919-fbc1-056c-4ed9-e940edfb6125@huawei.com>
In-Reply-To: <bfa0b919-fbc1-056c-4ed9-e940edfb6125@huawei.com>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Fri, 10 Jun 2022 11:34:46 +0200
X-Gmail-Original-Message-ID: <CAMj1kXGku3Y5d6Z+AAFkEauMWFY6LYpQAybqkXiQdRCMpS5tbw@mail.gmail.com>
Message-ID: <CAMj1kXGku3Y5d6Z+AAFkEauMWFY6LYpQAybqkXiQdRCMpS5tbw@mail.gmail.com>
Subject: Re: [PATCH v3 2/6] arm64/mirror: arm64 enabling - find mirrored
 memory ranges
To: Kefeng Wang <wangkefeng.wang@huawei.com>
Cc: Wupeng Ma <mawupeng1@huawei.com>, Jonathan Corbet <corbet@lwn.net>, Will Deacon <will@kernel.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Thomas Gleixner <tglx@linutronix.de>, 
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, X86 ML <x86@kernel.org>, 
	"H. Peter Anvin" <hpa@zytor.com>, Darren Hart <dvhart@infradead.org>, 
	Andy Shevchenko <andy@infradead.org>, Mike Rapoport <rppt@kernel.org>, 
	Andrew Morton <akpm@linux-foundation.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	"Paul E. McKenney" <paulmck@kernel.org>, Kees Cook <keescook@chromium.org>, songmuchun@bytedance.com, 
	Randy Dunlap <rdunlap@infradead.org>, damien.lemoal@opensource.wdc.com, 
	Stephen Boyd <swboyd@chromium.org>, Wei Liu <wei.liu@kernel.org>, 
	Robin Murphy <robin.murphy@arm.com>, David Hildenbrand <david@redhat.com>, 
	Anshuman Khandual <anshuman.khandual@arm.com>, Zhen Lei <thunder.leizhen@huawei.com>, 
	gpiccoli@igalia.com, Huacai Chen <chenhuacai@kernel.org>, 
	Geert Uytterhoeven <geert@linux-m68k.org>, vijayb@linux.microsoft.com, 
	Linux Doc Mailing List <linux-doc@vger.kernel.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux ARM <linux-arm-kernel@lists.infradead.org>, 
	linux-efi <linux-efi@vger.kernel.org>, platform-driver-x86@vger.kernel.org, 
	Linux Memory Management List <linux-mm@kvack.org>, linux-riscv <linux-riscv@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220610_023512_845012_FB1B35B1 
X-CRM114-Status: GOOD (  28.80  )
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

On Fri, 10 Jun 2022 at 11:27, Kefeng Wang <wangkefeng.wang@huawei.com> wrote:
>
>
> On 2022/6/7 17:38, Wupeng Ma wrote:
> > From: Ma Wupeng <mawupeng1@huawei.com>
> >
> > Commit b05b9f5f9dcf ("x86, mirror: x86 enabling - find mirrored memory ranges")
> > introduced mirrored memory support for x86 and this could be used on arm64.
> >
> > Since we only support this feature on arm64, efi_find_mirror() won't be placed
> > into efi_init(), which is used by riscv/arm/arm64, it is added in setup_arch()
> > to scan the memory map and mark mirrored memory in memblock.
>
> Move into efi_init() looks better, it won't bring negative effects on
> arm/riscv.
>
> but let's maintainer to make a decision.
>
> Reviewed-by: Kefeng Wang <wangkefeng.wang@huawei.com>
>

I don't disagree with that in principle, but x86 calls the efi fake
memmap stuff between efi_init() and efi_find_mirror(), and I already
indicated that I don't want to enable fake memmap on !X86.

But I do think there is some room for improvement here: we could move
things like efi_mokvar_table_init() and efi_esrt_init() into
efi_init() as well, and make efi_fake_memmap() do nothing on !X86 so
we can move it into efi_init() too.

> >
> > Signed-off-by: Ma Wupeng <mawupeng1@huawei.com>
> > ---
> >   Documentation/admin-guide/kernel-parameters.txt | 2 +-
> >   arch/arm64/kernel/setup.c                       | 1 +
> >   2 files changed, 2 insertions(+), 1 deletion(-)
> >
> > diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
> > index 8090130b544b..e3537646b6f7 100644
> > --- a/Documentation/admin-guide/kernel-parameters.txt
> > +++ b/Documentation/admin-guide/kernel-parameters.txt
> > @@ -2301,7 +2301,7 @@
> >
> >       keepinitrd      [HW,ARM]
> >
> > -     kernelcore=     [KNL,X86,IA-64,PPC]
> > +     kernelcore=     [KNL,X86,IA-64,PPC,ARM64]
> >                       Format: nn[KMGTPE] | nn% | "mirror"
> >                       This parameter specifies the amount of memory usable by
> >                       the kernel for non-movable allocations.  The requested
> > diff --git a/arch/arm64/kernel/setup.c b/arch/arm64/kernel/setup.c
> > index cf3a759f10d4..6e9acd7ecf0f 100644
> > --- a/arch/arm64/kernel/setup.c
> > +++ b/arch/arm64/kernel/setup.c
> > @@ -328,6 +328,7 @@ void __init __no_sanitize_address setup_arch(char **cmdline_p)
> >
> >       xen_early_init();
> >       efi_init();
> > +     efi_find_mirror();
> >
> >       if (!efi_enabled(EFI_BOOT) && ((u64)_text % MIN_KIMG_ALIGN) != 0)
> >            pr_warn(FW_BUG "Kernel image misaligned at boot, please fix your bootloader!");

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
