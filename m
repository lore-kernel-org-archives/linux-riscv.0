Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 249BFC02187
	for <linux-riscv@archiver.kernel.org>; Sun, 19 Jan 2025 17:15:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hfradNudwYZuwAJCSaSz9mNXchnRFPTNlC9FTMMSMxA=; b=d4HzqARgLl5+JM
	2+cK4klgp0yfstitwwXb+oUWlpW2syEg7Gpxb5FXz3LwcmVKEUrU6CP/eEc17LN2JFKzRfJWSj4h9
	fpXNbPxwqph4vw5SGycKI4VHP9IP7R0sS8p7RgQ+mTVkkopvO966HqLGC5CPtcZItk1Q//1LErCC9
	a/XPqgw5u4ez9l2mxwM98jHXZ14odyxV3WC6yMlhytZexw0lyHBr1Mzsgi/ZQDnKTjwXgNhHmOCPT
	ieJsNtKFBZhbtfKRLlvclhp2IoCfkyahYBQ6Mxt6/p9G+GUGB5x7Wm6d89kpMlrCEcW3wd3gmkK6p
	RaWhb38Bh6tboAFK3MBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tZYtg-00000004AdK-393S;
	Sun, 19 Jan 2025 17:15:40 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tZYtd-00000004Acz-3KzX
	for linux-riscv@lists.infradead.org;
	Sun, 19 Jan 2025 17:15:39 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 91112A40077
	for <linux-riscv@lists.infradead.org>; Sun, 19 Jan 2025 17:13:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EDF5DC4CEE6
	for <linux-riscv@lists.infradead.org>; Sun, 19 Jan 2025 17:15:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1737306936;
	bh=Di4UFK/tpZT8+N85V7hdgzEPZmwUbG7U4GIf9VtxO4I=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=bFrED5Nqjf4pirNf8wmlXj5S93iFQdCcnT9E8+6LzJDpQl8LcZVU2Ekl9qE6zwDUq
	 yB+L0acuQae9HLbKL+JeBL8IGYA8/cn000Tr4VVwM/IC01j+t9qU/uYg1M7PwBQEAS
	 jR0IBtvAMWQQqXHKMVPzLMaF40eMfyqVGBsYNMot5bs0HvgAIuQoXp5twUXp2syvSG
	 srF2Hknjq5auyqxkwlXdGJzx4z0E+ery2yhRumrZlgA3BcuzwdteDZdHriFNVnsAYy
	 xWoQYGEBO2anqsBg2a68XVR159v1GXT4IJKMC4PX3IWdCO5avSttqgY1kjw0umRPaf
	 fydNTxHWuWQew==
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-3003c0c43c0so39242321fa.1
        for <linux-riscv@lists.infradead.org>; Sun, 19 Jan 2025 09:15:35 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCX/qvdnSeC0qqH8VcBy0Io41/qG5PS4J+C3yxQcBNftUNkbXQnlhIaVMHnv2Rlx1vIWctOI8Z0G/6yFAQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YzyAsDB8EPDO4dv327ibAdxbhnNajtbjLgHm9D0MQPg/UQQM9FH
	YgIE5sZXLVO2eDA9QCgi01IUhMAxk2uLNyTYOIuitZZkeHC6kRAys2XHs4sQzZSRQwFV6VrtpwA
	CeUBZTpyXuUW0PFwDA/wlMCW1Oxk=
X-Google-Smtp-Source: AGHT+IGr4L2jHUMsDzfNAtLulKH70pYOVCMgNTSvVBpAMXbcnlvC+dHc5ISQezZZpgy6NtG0ZfBs8RijEw/Q1AjhHYM=
X-Received: by 2002:a05:651c:1198:b0:300:3a15:8f04 with SMTP id
 38308e7fff4ca-3072ca74fa0mr26473651fa.15.1737306934250; Sun, 19 Jan 2025
 09:15:34 -0800 (PST)
MIME-Version: 1.0
References: <20250113155306.1922992-2-ardb+git@google.com> <Z4mB-I5jeGithAQX@ghost>
In-Reply-To: <Z4mB-I5jeGithAQX@ghost>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Sun, 19 Jan 2025 18:15:22 +0100
X-Gmail-Original-Message-ID: <CAMj1kXE4DJnwFejNWQu784GvyJO=aGNrzuLjSxiowX_e7nW8QA@mail.gmail.com>
X-Gm-Features: AbW1kvarTqlSljQ0HcmXnP7VsdnphtVke3R0NZBLnr3k2eZnMIXoHb1qDsjcPk8
Message-ID: <CAMj1kXE4DJnwFejNWQu784GvyJO=aGNrzuLjSxiowX_e7nW8QA@mail.gmail.com>
Subject: Re: [PATCH v3] kbuild: Strip runtime const RELA sections correctly
To: Charlie Jenkins <charlie@rivosinc.com>
Cc: Ard Biesheuvel <ardb+git@google.com>, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Linus Torvalds <torvalds@linux-foundation.org>, 
	Masahiro Yamada <masahiroy@kernel.org>, Alexandre Ghiti <alexghiti@rivosinc.com>, 
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org, 
	Ron Economos <re@w6rz.net>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250119_091538_068057_74EF0ED2 
X-CRM114-Status: GOOD (  24.56  )
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

On Thu, 16 Jan 2025 at 23:02, Charlie Jenkins <charlie@rivosinc.com> wrote:
>
> On Mon, Jan 13, 2025 at 04:53:07PM +0100, Ard Biesheuvel wrote:
> > From: Ard Biesheuvel <ardb@kernel.org>
> >
> > Due to the fact that runtime const ELF sections are named without a
> > leading period or double underscore, the RSTRIP logic that removes the
> > static RELA sections from vmlinux fails to identify them. This results
> > in a situation like below, where some sections that were supposed to get
> > removed are left behind.
> >
> >   [Nr] Name                              Type            Address          Off     Size   ES Flg Lk Inf Al
> >
> >   [58] runtime_shift_d_hash_shift        PROGBITS        ffffffff83500f50 2900f50 000014 00   A  0   0  1
> >   [59] .relaruntime_shift_d_hash_shift   RELA            0000000000000000 55b6f00 000078 18   I 70  58  8
> >   [60] runtime_ptr_dentry_hashtable      PROGBITS        ffffffff83500f68 2900f68 000014 00   A  0   0  1
> >   [61] .relaruntime_ptr_dentry_hashtable RELA            0000000000000000 55b6f78 000078 18   I 70  60  8
> >   [62] runtime_ptr_USER_PTR_MAX          PROGBITS        ffffffff83500f80 2900f80 000238 00   A  0   0  1
> >   [63] .relaruntime_ptr_USER_PTR_MAX     RELA            0000000000000000 55b6ff0 000d50 18   I 70  62  8
> >
> > So tweak the match expression to strip all sections starting with .rel.
> > While at it, consolidate the logic used by RISC-V, s390 and x86 into a
> > single shared Makefile library command.
> >
> > Cc: Linus Torvalds <torvalds@linux-foundation.org>
> > Cc: Masahiro Yamada <masahiroy@kernel.org>
> > Cc: linux-riscv@lists.infradead.org
> > Cc: linux-s390@vger.kernel.org
> > Cc: Ron Economos <re@w6rz.net>
> > Link: https://lore.kernel.org/all/CAHk-=wjk3ynjomNvFN8jf9A1k=qSc=JFF591W00uXj-qqNUxPQ@mail.gmail.com/
> > Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
> > ---
> > v3: put back missing 'endif' to fix the RISC-V build
> > v2: add missing include of scripts/Makefile.lib
> >
> >  arch/riscv/Makefile.postlink |  8 ++------
> >  arch/s390/Makefile.postlink  |  6 +-----
> >  arch/x86/Makefile.postlink   |  6 +-----
> >  scripts/Makefile.lib         |  3 +++
> >  4 files changed, 7 insertions(+), 18 deletions(-)
> >
> > diff --git a/arch/riscv/Makefile.postlink b/arch/riscv/Makefile.postlink
> > index 829b9abc91f6..750d2784f69e 100644
> > --- a/arch/riscv/Makefile.postlink
> > +++ b/arch/riscv/Makefile.postlink
>
> When I compile x86 as relocatable I see the problem that you are fixing
> here, but I don't see it on riscv.

That is because riscv does not yet support optimized runtime
constants. Only arm64, s390 and x86 implement this today but I'd
expect other architectures to follow suit.

> It's probably better to keep around
> this code for riscv, but I don't think it even needs this stripping? I
> am adding Alex since he added this for riscv.
>

If vmlinux is linked with --emit-relocs, the stripping is probably
necessary, or you get a lot of metadata in vmlinux that is not needed
for debugging.

> Anyways this works as expected:
>
> Reviewed-by: Charlie Jenkins <charlie@rivosinc.com>
> Tested-by: Charlie Jenkins <charlie@rivosinc.com>
>

Thanks.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
