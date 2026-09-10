Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0DE5FC79FB9
	for <linux-riscv@archiver.kernel.org>; Thu, 10 Sep 2026 06:53:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LEqZqEGQVhEUGUEofIEOM9qmJtAKsSwHkRGTSALrqDY=; b=IDVtj/g14+EOy5
	ozcIrwLctcrSsjyiFZbJqtcS4esszTdwVSId9m+kI3RwZ4Ht1Hf+gMj8rXLZsCFKqJvPQgfv7a/6R
	v6NxenQtcYFMUkT/0C38+IQqBLjwQo3bg/9wtqEywkTNy9c8NU827Uj9XofMwGfCf7M7Ca04JvPTV
	246U7eIvWShgCQX4zhQqbuKLLiZTyQA1hiZtxh/N6cRwZ5fJNDrLTaypbXmbf1GAQMbHSKsLHw3Xr
	PE0d/bZrtz3mST4JWr3EACVhvecr4FgsZsFL+nHRzeOQO/HeoGIFiSCYTa3CoFZ3m0laKLTCNZA+t
	5mHMw/Comv/aAf0qb2ZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4Yed-0000000DZSY-3p8V;
	Thu, 10 Sep 2026 06:53:03 +0000
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4YeZ-0000000DZRd-1aK7
	for linux-riscv@lists.infradead.org;
	Thu, 10 Sep 2026 06:53:02 +0000
Received: by mail-pj1-x1036.google.com with SMTP id 98e67ed59e1d1-3856d6fbcb3so5671786a91.2
        for <linux-riscv@lists.infradead.org>; Wed, 09 Sep 2026 23:52:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789023178; x=1789627978; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=UNeh3lUekONIP+bceTcz/qzQUFIH9IGvapVm9Sqamho=;
        b=UP3v5y+Tz496z0e9Y1ElEThgJquY6IF9dMmbF2q1zAGPyxj/ayWTQAZMAyMBnl9vlU
         OAvDUhm56q/zF5t1xC5Q54rM6uULtBIPF+1qup9GxvitRxzxGPaoJulZm/opH5U1wFpp
         wghfmSn+pBuM/XDUqM5NYzXgm8MKWneif+GSOServ9lX/kls2Q1hMdDUvocizEN7EDO5
         n9Qv6zgNvapni3PY8y4waiBCLlY7TXkE41Wwvam75wSIKQbj5wzgc6r3U/+OdUfckXGK
         7H0sPu33Nl8OIBeRUyE+v7ZqIxzJ4bOFq6deGmdnGRZjssk/CPO5DowFx8By7ciijD69
         lQYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789023178; x=1789627978;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=UNeh3lUekONIP+bceTcz/qzQUFIH9IGvapVm9Sqamho=;
        b=lUXsZdr51eFt39lbHoroi3DIy8Pn5uwP7QFx1FtjDOPx0Ycz+txA2mIcneVBiGjNx8
         N/ft0pRnoLsye4A9smEUlCzselZAU5n8tVGYthDMSwsmz3Opt3CaW0wJSfrWPAGd9Y7o
         6DKKnO7JwCEkgKhEVofnTyfeukcd37DdRR4CiH1dE6bivh2Ir/fccfw13vDg+Z7YqS3S
         1pQ1yOo++Nm56VRTVz4Yo33jiqFeitEWMoQHb/YHrKbOx8xqF2FAJNkHfdbCg/GUdHB8
         8nrL5KSbIrcZArgx6aIK4ZUU+BfrVVhgtw9fnLO9VsmKK2uN3yUPKP9BITmv+j+6JGpb
         i9EA==
X-Forwarded-Encrypted: i=1; AKwUvBwYidbYWywYOSyyh/X9Ei3f5f0b6svBoePwm2VG2qzrirQ8bhj1If8o1ac4/eFO+0UGYjJaumOx838eRg==@lists.infradead.org
X-Gm-Message-State: AFuF++kwKEmp7YS8K33tSCcN91aq5XvZpFR8fNUiqr53SxV6rxUVRhgu
	jdVsOROyI8n5DngkJnRPQso9iY32a5RGFP5ZsYhbGXpY3miZO/3gq5XE
X-Gm-Gg: AYBFou013SxpMn7jwXvVEUJzeKxLBQg7A0RwFatfS1vZPta4hTv176TlnaWOLo+XchQ
	wmwoD8qKdQLitQrFUt4YssTqiEhs6dzCl0wqqkhdMwHvYUO94D3e27+tiaIqw7SXlVGL49Bi+HV
	LemLm8+bzA+zsQP9hNS9GTkvssqZqqljjPgrW3ksrLsXfBXACKdPk2nx6iJpmhYPjegponfjH01
	2Xux40W4N9MeFpmBuffnk5YY/fEi02QSWJLM0BkeH0m/15sEv6Wu5FAlk4kr/HNB9jmkQJ5A/nV
	H7CqjwB9hlLFtuij4Dfv4NxEORyNXnC4/10w2OflvLsU4BqeIhzdtOFFPbOo51TnMWmY+7so8jA
	S8Wp9mRzDMTPo5nqAeS8IYDj3tTEGecN/E8II17HkQlzU3s+OxRuAshfZBhxIIW/RuDA/S6uJLk
	TtKPDq1VzDjy4Fu+INEzUUvtNKFqPo3u0La2+asn1/cAz1v4r2BS7FU7oLnRx27OCEqs6JD1shD
	qup3Uqv693uMzEOStvcme0aJjJ7UuTH08KIPNSE0J0=
X-Received: by 2002:a17:90b:3d92:b0:398:bf7e:b267 with SMTP id 98e67ed59e1d1-39b2614df9dmr61606265a91.2.1789023178292;
        Wed, 09 Sep 2026 23:52:58 -0700 (PDT)
Received: from li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com ([129.41.58.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39d7e77498csm2694423a91.3.2026.09.09.23.52.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 23:52:57 -0700 (PDT)
Date: Thu, 10 Sep 2026 12:22:33 +0530
From: Mukesh Kumar Chaurasiya <mkchauras@gmail.com>
To: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, Andy Lutomirski <luto@kernel.org>, 
	Vincenzo Frascino <vincenzo.frascino@arm.com>, Kees Cook <kees@kernel.org>, Ingo Molnar <mingo@redhat.com>, 
	Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Richard Weinberger <richard@nod.at>, 
	Anton Ivanov <anton.ivanov@cambridgegreys.com>, Johannes Berg <johannes@sipsolutions.net>, 
	Russell King <linux@armlinux.org.uk>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Madhavan Srinivasan <maddy@linux.ibm.com>, 
	Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
	Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>, 
	Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, 
	Alexander Gordeev <agordeev@linux.ibm.com>, Christian Borntraeger <borntraeger@linux.ibm.com>, 
	Sven Schnelle <svens@linux.ibm.com>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
	Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?utf-8?B?QmrDtnJu?= Roy Baron <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
	Thomas Gleixner <tglx@kernel.org>, Christophe Leroy <chleroy@kernel.org>, 
	Boqun Feng <boqun@kernel.org>, Nicolas Schier <nsc@kernel.org>, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev, linux-mm@kvack.org, 
	linux-um@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linuxppc-dev@lists.ozlabs.org, loongarch@lists.linux.dev, linux-s390@vger.kernel.org, 
	linux-mips@vger.kernel.org, rust-for-linux@vger.kernel.org, linux-kbuild@vger.kernel.org, 
	Jan Stancek <jstancek@redhat.com>, Arnaldo Carvalho de Melo <acme@redhat.com>, 
	Alexandre Ghiti <alexghiti@rivosinc.com>
Subject: Re: [PATCH v5 12/24] vdso: Add the vdsocheck tool
Message-ID: <aqJS61DbuUI3xoY3@li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com>
References: <20260908-vdso-absolute-reloc-v5-0-3a93791af1cf@linutronix.de>
 <20260908-vdso-absolute-reloc-v5-12-3a93791af1cf@linutronix.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260908-vdso-absolute-reloc-v5-12-3a93791af1cf@linutronix.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260909_235259_413708_C7CA0C2D 
X-CRM114-Status: GOOD (  23.06  )
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Tue, Sep 08, 2026 at 08:33:46AM +0200, Thomas Wei=DFschuh wrote:
> All vDSO code needs to be completely position independent. Symbol
> references are marked as hidden so the compiler emits PC-relative
> relocations. However there are cases where the compiler may still
> emit absolute relocations, as they are valid in regular PIC DSO code.
> These would be resolved by the linker and will break at runtime.
> This has been observed on arm64, see commit 0c314cda9325 ("arm64: vdso:
> Work around invalid absolute relocations from GCC")
> =

> Introduce a tool to check for absolute relocations during the build,
> as the current inline-shell logic is not expressive enough.
> The check is done on the object files as the relocations will not exist
> anymore in the final DSO. As there is no extension point for the
> compilation of each object file, perform the validation in vdso_check.
> =

> Signed-off-by: Thomas Wei=DFschuh <thomas.weissschuh@linutronix.de>
> ---
>  Makefile                    |  19 ++
>  lib/vdso/Kconfig            |   5 +
>  lib/vdso/Makefile           |   2 +
>  lib/vdso/Makefile.include   |  14 ++
>  lib/vdso/check/.gitignore   |   3 +
>  lib/vdso/check/Makefile     |  34 +++
>  lib/vdso/check/elf.rs       | 498 ++++++++++++++++++++++++++++++++++++++=
++++++
>  lib/vdso/check/vdsocheck.rs | 154 ++++++++++++++
>  8 files changed, 729 insertions(+)
> =

> diff --git a/Makefile b/Makefile
> index 4ad67b737af7..e6e0dd7818ef 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -1559,6 +1559,25 @@ vdso_install: export INSTALL_FILES =3D $(vdso-inst=
all-y)
>  vdso_install:
>  	$(Q)$(MAKE) -f $(srctree)/scripts/Makefile.vdsoinst
>  =

> +# ----------------------------------------------------------------------=
-----
> +# vDSO check
> +
> +ifdef CONFIG_RUST_IS_AVAILABLE
> +ifdef CONFIG_VDSO_CHECK
> +
> +# Build the checker early.
> +prepare: vdsocheck
> +
> +# If the architecture builds the vDSO early, make sure to be earlier.
> +PHONY +=3D vdso_prepare
> +vdso_prepare: vdsocheck
> +
> +PHONY +=3D vdsocheck
> +vdsocheck:
> +	$(Q)$(MAKE) $(build)=3Dlib/vdso/check $@
> +endif
> +endif
> +
>  # ----------------------------------------------------------------------=
-----
>  # Tools
>  =

> diff --git a/lib/vdso/Kconfig b/lib/vdso/Kconfig
> index 597f5f0f9681..112b42a5aeb1 100644
> --- a/lib/vdso/Kconfig
> +++ b/lib/vdso/Kconfig
> @@ -23,3 +23,8 @@ config VDSO_GETRANDOM
>  	select VDSO_DATASTORE
>  	help
>  	  Selected by architectures that support vDSO getrandom().
> +
> +config VDSO_CHECK
> +	bool
> +	help
> +	  Selected for architectures that are supported by the 'vdsocheck' prog=
am.
	s/progam/program

Regards,
Mukesh

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
