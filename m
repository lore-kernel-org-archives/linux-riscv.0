Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B291C3601E
	for <linux-riscv@archiver.kernel.org>; Thu,  3 Apr 2025 06:42:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IbPQKDIuTzUQVz1mWTv6zAPZz72MhIYL36r9hck/urA=; b=WnCpGOZHY25MRk
	fH/zAnDfMdxsVc8NWRjGa2lKeWo1p67nf7Cp5chlEkLEQGKWnM1wKjV+KRw9bGRA8x8u2sMMy+Emc
	GXSz0FeCr2VF4DunbWnITFLdMIPhKRECs7lWmilTrgb9VwKPa78tE8FQfLGuVnJucTHmJ+GOrnagA
	bIWnCj9p0bBlugsno/Q9h7EFEf+mN9emygl/BeD2UWWDLBxi5EOLZYo2TxXOYAm37fyK1m1zdA5Xs
	P5DGik1exHmBSJhMcBkFrsnz2MG4PqLvcvo0SjiEoyp+lRPgJvsfiZmx5mZmTM61Ojvg3UNeFaxQG
	g11375Cecf2Bz6TQWBsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0EHN-00000007xZj-0MCL;
	Thu, 03 Apr 2025 06:42:21 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0EE2-00000007x7J-0Dey
	for linux-riscv@lists.infradead.org;
	Thu, 03 Apr 2025 06:38:55 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id CA4BFA463A4
	for <linux-riscv@lists.infradead.org>; Thu,  3 Apr 2025 06:33:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2C90EC4CEEC
	for <linux-riscv@lists.infradead.org>; Thu,  3 Apr 2025 06:38:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743662332;
	bh=2/tAIarhHMgZpqgml0rAXbaj403ah+N1dDuDl5YUD4g=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=jjcG3lq1WkVbTto5R6Sr0OQQAtu+hmbuYvbwt/TWvMAr2jk3HFuXk7vvaRqZ1NjCy
	 rFwRBDVcphMkMwnBb+/1x37s/eGqUNjdl8SL9LhRY0gimuLuQLIfCTExGcZXe1doJV
	 A2Atovl9RzyOD8Q41JU2PbIc5s6OH/7994AUW/P7GnFcBgxxf0QQC+iisJu4qRGyan
	 f2ir04R+NLdjQWg1Bz4Dg0uXN5nXOvdlvqfV5MBTcekIVentKU7+DdG84NY66TROVG
	 SvnQOI/SEnnbO0AzNPVxJpwjWTp/lxwzVsPv9bNeyQ9wE4xf494VG6s3/Wl5Ycay6T
	 j0ycWugI+HlFQ==
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-549967c72bcso624165e87.3
        for <linux-riscv@lists.infradead.org>; Wed, 02 Apr 2025 23:38:52 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVMM3L8JWEu87D6EKjJ2e+J1nyNd2cUj5FWwX3+l/2Ru5cWNP84v3Lubvbnw3+E2iLqwt5+zmLAbeUEMg==@lists.infradead.org
X-Gm-Message-State: AOJu0Yz97Ya2S31NmbEPTJlulURW50xF+L6Rrsb0DteegmNVCNb9NIkW
	7+kJuR+cbztvpm24UEaO57ZaB08K05QzzDxIfp/YPTUVzgZ6qTsdZTBJX7q1xYbm5I2zjND0GrZ
	gWQQwPqanaoHNm7qklgf65vNsp9o=
X-Google-Smtp-Source: AGHT+IE4yQD8rhYnVSRXOnS3Y6pofP5obI3okmQ0iC4wJLgbKdsBb0CIGQU6+0Kd5+8+3okm+rb8AazhaZjHp1lAMRE=
X-Received: by 2002:a05:6512:1149:b0:545:3031:40aa with SMTP id
 2adb3069b0e04-54b10db738dmr6083399e87.9.1743662330387; Wed, 02 Apr 2025
 23:38:50 -0700 (PDT)
MIME-Version: 1.0
References: <20250328075536.238782-1-alexghiti@rivosinc.com>
In-Reply-To: <20250328075536.238782-1-alexghiti@rivosinc.com>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Thu, 3 Apr 2025 09:38:39 +0300
X-Gmail-Original-Message-ID: <CAMj1kXGaUZZoKUMEJtv4Fvckub_kRcHBZbpMxet-skqOLD7SNw@mail.gmail.com>
X-Gm-Features: AQ5f1JokvVmdXrd19nwvBkB35c-v0phYNi9QPm4nTBBdR2jkB4tn0Cxxj2EhIIw
Message-ID: <CAMj1kXGaUZZoKUMEJtv4Fvckub_kRcHBZbpMxet-skqOLD7SNw@mail.gmail.com>
Subject: Re: [PATCH] scripts: Introduce ARCH_WANTS_RELA_DYN to avoid stripping
 .rela.dyn section
To: Alexandre Ghiti <alexghiti@rivosinc.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Alexandre Ghiti <alex@ghiti.fr>, =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@rivosinc.com>, 
	Masahiro Yamada <masahiroy@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nicolas Schier <nicolas@fjasle.eu>, Charlie Jenkins <charlie@rivosinc.com>, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-kbuild@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250402_233854_237958_B02737E1 
X-CRM114-Status: GOOD (  19.85  )
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

On Fri, 28 Mar 2025 at 08:55, Alexandre Ghiti <alexghiti@rivosinc.com> wrote:
>
> riscv uses the .rela.dyn section to relocate the kernel at runtime but
> that section is stripped from vmlinux. That prevents kexec to
> successfully load vmlinux since it does not contain the relocations info
> needed.
>
> Fix this by introducing a new config ARCH_WANTS_RELA_DYN that prevents
> .rela.dyn to be stripped.
>
> Fixes: 71d815bf5dfd ("kbuild: Strip runtime const RELA sections correctly")
> Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>

Apologies for the breakage.



> ---
>  arch/Kconfig         | 7 +++++++
>  arch/riscv/Kconfig   | 1 +
>  scripts/Makefile.lib | 4 +++-
>  3 files changed, 11 insertions(+), 1 deletion(-)
>
> diff --git a/arch/Kconfig b/arch/Kconfig
> index b8a4ff365582..d93f50ecb8f9 100644
> --- a/arch/Kconfig
> +++ b/arch/Kconfig
> @@ -1544,6 +1544,13 @@ config HAVE_ARCH_PREL32_RELOCATIONS
>           architectures, and don't require runtime relocation on relocatable
>           kernels.
>
> +config ARCH_WANTS_RELA_DYN

I don't think we need this - just preserve .rela.dyn in all cases.

> +       bool
> +       depends on RELOCATABLE
> +       help
> +         This prevents the .rela.dyn section to be stripped from vmlinux since
> +         it is needed to relocate the kernel at runtime.
> +
>  config ARCH_USE_MEMREMAP_PROT
>         bool
>
> diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> index 7612c52e9b1e..d58053efa4e4 100644
> --- a/arch/riscv/Kconfig
> +++ b/arch/riscv/Kconfig
> @@ -84,6 +84,7 @@ config RISCV
>         select ARCH_WANT_OPTIMIZE_DAX_VMEMMAP
>         select ARCH_WANT_OPTIMIZE_HUGETLB_VMEMMAP
>         select ARCH_WANTS_NO_INSTR
> +       select ARCH_WANTS_RELA_DYN if RELOCATABLE
>         select ARCH_WANTS_THP_SWAP if HAVE_ARCH_TRANSPARENT_HUGEPAGE
>         select ARCH_WEAK_RELEASE_ACQUIRE if ARCH_USE_QUEUED_SPINLOCKS
>         select BINFMT_FLAT_NO_DATA_START_OFFSET if !MMU
> diff --git a/scripts/Makefile.lib b/scripts/Makefile.lib
> index cad20f0e66ee..e59210a9fde0 100644
> --- a/scripts/Makefile.lib
> +++ b/scripts/Makefile.lib
> @@ -376,8 +376,10 @@ quiet_cmd_ar = AR      $@
>  quiet_cmd_objcopy = OBJCOPY $@
>  cmd_objcopy = $(OBJCOPY) $(OBJCOPYFLAGS) $(OBJCOPYFLAGS_$(@F)) $< $@
>
> +objcopy-args-$(CONFIG_ARCH_WANTS_RELA_DYN) += --remove-section=!.rela.dyn
> +
>  quiet_cmd_strip_relocs = RSTRIP  $@
> -cmd_strip_relocs = $(OBJCOPY) --remove-section='.rel*' $@
> +cmd_strip_relocs = $(OBJCOPY) --remove-section='.rel*' $(objcopy-args-y) $@
>
>  # Gzip
>  # ---------------------------------------------------------------------------
> --
> 2.39.2
>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
