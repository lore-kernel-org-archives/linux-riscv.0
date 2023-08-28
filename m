Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C10BC83F11
	for <linux-riscv@archiver.kernel.org>; Mon, 28 Aug 2023 10:28:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ba2aifNbzVqCFqmt3LkSnx9dGqntyxcMSc0mwGKaBNw=; b=l7P1cEXMiUvq81
	73NLdhkdfQUifk1UKCpsTEKu6/QlsY9xoowIZgJn2/T/94sDNmNHt9Y9f5LpFBkCwTna5cqkc2NHF
	S9gj7ZSNGZBUG7hItexzM5ZewLimzarIYW7S/Lvjri6CS5tUG/fccU8FhMiOiOT5y9Osd37+cQnUV
	20GgRX7SKzUd9Vj1+a5SFeSDN3kD/JbGjcC2C2nGK1PEdbka0YEeIT1x8CsS6woshAHiyUs4cPChZ
	9CzzuKNY+UupOvYOs6Tj4DDAq66yE74Nk0RzadcugjnmoNOcsD40x6r7i44b5Yq/3E7k7RJCK8bvq
	xi4jzJvnVIzDq5g0SHjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qaZTw-009R1Z-1U;
	Mon, 28 Aug 2023 10:28:28 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qaZTt-009R1A-1B
	for linux-riscv@lists.infradead.org;
	Mon, 28 Aug 2023 10:28:26 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 3149563BA6
	for <linux-riscv@lists.infradead.org>; Mon, 28 Aug 2023 10:28:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 95D23C433CA
	for <linux-riscv@lists.infradead.org>; Mon, 28 Aug 2023 10:28:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1693218503;
	bh=n4XE7nxHzlz8l0Qrwy0GwtxS3jAaS4ZgOwDJ7QBRvMM=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=ET27Az6rATIIp9xTqGzMsJiDJ4oiH1GvmgM9gOR9s7J7H7cSv76GEx9ldL7/JMQeO
	 ExJldwFcv2I95wkwSkTCX7rer3fUFVuTfJjpM+pfFx+kA+W49ib0+hEQ/xRSA1uiSN
	 IFBsegGUQAfMXrsI1hRWSquPpQ1JvwD6v4bQ1Vn3S7tut/kKpRC/MSCC74Q5Afa18o
	 V2XtmMvpkRswzCkC0T4THDncHwjfqCM61zy7StNNcVmkyqZ5a434c6oeXOBFge5W24
	 //TQnh34uEheMdhBvcx38ooqHUscmeT6YfANwhePuUO8jKgXABX5PMtVHRElaHRdOd
	 Deq/GSrJUlr5A==
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-2bc63e0d8cdso44555441fa.2
        for <linux-riscv@lists.infradead.org>; Mon, 28 Aug 2023 03:28:23 -0700 (PDT)
X-Gm-Message-State: AOJu0YwqUobkzbz4cmy3iXckuGPRtPbtUwOLfjZ4AjqBvozzj3k6Hu+v
	L0w3GJPntkTb2SSY64O3doawdES/yXpwMGTbQvk=
X-Google-Smtp-Source: AGHT+IFkiw41hE2snmkem3YKEjAH2DwCq9IQe+ZWejBMSWZ61AhN8HbfynocOGTt6GHuZjv5/B8zMOj3BCjAwiJPErw=
X-Received: by 2002:a05:6512:220c:b0:4f4:b13a:d683 with SMTP id
 h12-20020a056512220c00b004f4b13ad683mr22435552lfu.69.1693218501656; Mon, 28
 Aug 2023 03:28:21 -0700 (PDT)
MIME-Version: 1.0
References: <20230806024715.3061589-1-xiao.w.wang@intel.com>
 <CAMj1kXHicVpT7PDSB=BgYEuhBxgufHqd9X8ZCg19k0_U+rjvEg@mail.gmail.com>
 <DM8PR11MB5751DA69DEEAAC9B06623E0BB80FA@DM8PR11MB5751.namprd11.prod.outlook.com>
 <DM8PR11MB575198187CB962EBE663B7F0B8E1A@DM8PR11MB5751.namprd11.prod.outlook.com>
In-Reply-To: <DM8PR11MB575198187CB962EBE663B7F0B8E1A@DM8PR11MB5751.namprd11.prod.outlook.com>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Mon, 28 Aug 2023 12:28:09 +0200
X-Gmail-Original-Message-ID: <CAMj1kXGCGVhA=bc+2gNZwb7s_H4K6yk54J04pUQ1XPW+8-2COA@mail.gmail.com>
Message-ID: <CAMj1kXGCGVhA=bc+2gNZwb7s_H4K6yk54J04pUQ1XPW+8-2COA@mail.gmail.com>
Subject: Re: [PATCH] RISC-V: Optimize bitops with Zbb extension
To: "Wang, Xiao W" <xiao.w.wang@intel.com>
Cc: "paul.walmsley@sifive.com" <paul.walmsley@sifive.com>, "palmer@dabbelt.com" <palmer@dabbelt.com>, 
	"aou@eecs.berkeley.edu" <aou@eecs.berkeley.edu>, "anup@brainfault.org" <anup@brainfault.org>, 
	"Li, Haicheng" <haicheng.li@intel.com>, 
	"linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>, 
	"linux-efi@vger.kernel.org" <linux-efi@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230828_032825_515808_C1678C33 
X-CRM114-Status: GOOD (  31.27  )
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

On Sun, 27 Aug 2023 at 11:26, Wang, Xiao W <xiao.w.wang@intel.com> wrote:
>
> Hi,
>
> A gentle ping.
> Any other comments or suggestions for this patch? Or maybe we would review it in the Linux 6.7 development cycle?
>

This is going to be 6.7 material at the earliest in any case.

I am fine with the change as far as the EFI code is concerned, but I'd
suggest dropping EFI_ from the macro name, as it could be #define'd
for other reasons too.


>
> > -----Original Message-----
> > From: Wang, Xiao W
> > Sent: Sunday, August 6, 2023 6:24 PM
> > To: Ard Biesheuvel <ardb@kernel.org>
> > Cc: paul.walmsley@sifive.com; palmer@dabbelt.com;
> > aou@eecs.berkeley.edu; anup@brainfault.org; Li, Haicheng
> > <haicheng.li@intel.com>; linux-riscv@lists.infradead.org; linux-
> > efi@vger.kernel.org; linux-kernel@vger.kernel.org
> > Subject: RE: [PATCH] RISC-V: Optimize bitops with Zbb extension
> >
> > Hi,
> >
> > > -----Original Message-----
> > > From: Ard Biesheuvel <ardb@kernel.org>
> > > Sent: Sunday, August 6, 2023 5:39 PM
> > > To: Wang, Xiao W <xiao.w.wang@intel.com>
> > > Cc: paul.walmsley@sifive.com; palmer@dabbelt.com;
> > > aou@eecs.berkeley.edu; anup@brainfault.org; Li, Haicheng
> > > <haicheng.li@intel.com>; linux-riscv@lists.infradead.org; linux-
> > > efi@vger.kernel.org; linux-kernel@vger.kernel.org
> > > Subject: Re: [PATCH] RISC-V: Optimize bitops with Zbb extension
> > >
> > > On Sun, 6 Aug 2023 at 04:39, Xiao Wang <xiao.w.wang@intel.com> wrote:
> > > >
> > > > This patch leverages the alternative mechanism to dynamically optimize
> > > > bitops (including __ffs, __fls, ffs, fls) with Zbb instructions. When
> > > > Zbb ext is not supported by the runtime CPU, legacy implementation is
> > > > used. If Zbb is supported, then the optimized variants will be selected
> > > > via alternative patching.
> > > >
> > > > The legacy bitops support is taken from the generic C implementation as
> > > > fallback.
> > > >
> > > > If the parameter is a build-time constant, we leverage compiler builtin to
> > > > calculate the result directly, this approach is inspired by x86 bitops
> > > > implementation.
> > > >
> > > > EFI stub runs before the kernel, so alternative mechanism should not be
> > > > used there, this patch introduces a macro EFI_NO_ALTERNATIVE for this
> > > > purpose.
> > > >
> > >
> > > Why? The unpatched sequences work fine, no?
> >
> > It works. But there would be build warning: orphan section `.init.alternative'
> > from `./drivers/firmware/efi/libstub/gop.stub.o' being placed in section
> > `.init.alternative'. Besides, w/o this MACRO, the optimized variant would
> > never be used at runtime, so this patch choose to disable alternative.
> >
> > BRs,
> > Xiao
> >
> > >
> > >
> > > > Signed-off-by: Xiao Wang <xiao.w.wang@intel.com>
> > > > ---
> > > >  arch/riscv/include/asm/bitops.h       | 266
> > +++++++++++++++++++++++++-
> > > >  drivers/firmware/efi/libstub/Makefile |   2 +-
> > > >  2 files changed, 264 insertions(+), 4 deletions(-)
> > > >
> > > > diff --git a/arch/riscv/include/asm/bitops.h
> > > b/arch/riscv/include/asm/bitops.h
> > > > index 3540b690944b..f727f6489cd5 100644
> > > > --- a/arch/riscv/include/asm/bitops.h
> > > > +++ b/arch/riscv/include/asm/bitops.h
> > > > @@ -15,13 +15,273 @@
> > > >  #include <asm/barrier.h>
> > > >  #include <asm/bitsperlong.h>
> > > >
> > > > +#if !defined(CONFIG_RISCV_ISA_ZBB) || defined(EFI_NO_ALTERNATIVE)
> > > >  #include <asm-generic/bitops/__ffs.h>
> > > > -#include <asm-generic/bitops/ffz.h>
> > > > -#include <asm-generic/bitops/fls.h>
> > > >  #include <asm-generic/bitops/__fls.h>
> > > > +#include <asm-generic/bitops/ffs.h>
> > > > +#include <asm-generic/bitops/fls.h>
> > > > +
> > > > +#else
> > > > +#include <asm/alternative-macros.h>
> > > > +#include <asm/hwcap.h>
> > > > +
> > > > +#if (BITS_PER_LONG == 64)
> > > > +#define CTZW   "ctzw "
> > > > +#define CLZW   "clzw "
> > > > +#elif (BITS_PER_LONG == 32)
> > > > +#define CTZW   "ctz "
> > > > +#define CLZW   "clz "
> > > > +#else
> > > > +#error "Unexpected BITS_PER_LONG"
> > > > +#endif
> > [...]

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
