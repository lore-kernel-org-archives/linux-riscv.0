Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1298C47088
	for <linux-riscv@archiver.kernel.org>; Fri,  2 Dec 2022 17:57:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=QkFZBtbt5FE2FtPG6H0pkzCR8TYLP5OH/DC5fZYKmm8=; b=UVS7csrx2XlialXvuy1N0RWHwO
	KI8tfNL7uVTVpqg7WD5PCfSCPJ9+LfaI/iRekTPzEEooZlZg1uJxtP+WhzCh1iGVXlDvzNctOe1Cv
	ihwnUwaHtUFDapw3kiTkcoOVdhdTq5BTWp1zE1Ra8VWw1qQO3c8Pg0Fei/Q/Ql4YHwW9R3iI9UzPu
	3FDF3KKryIlRch7dSlDvzjNzuZ3oXh6/nwIOiGRGfeZR/oi0OYsLq7GNX7FuDrIIWfbUeNZr8hLBS
	26Oyjmk+fBehADaX4Ap2VBCXybBCY/cGGoB+YG54AaYuybaUf+F9dQWob+3MfBvuInUJkc/Tv4jjM
	IKanHaeg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p1AHZ-000ThV-T2; Fri, 02 Dec 2022 17:57:05 +0000
Received: from mail-pg1-x531.google.com ([2607:f8b0:4864:20::531])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p1AHW-000Tbc-GI
	for linux-riscv@lists.infradead.org; Fri, 02 Dec 2022 17:57:04 +0000
Received: by mail-pg1-x531.google.com with SMTP id q1so4950559pgl.11
        for <linux-riscv@lists.infradead.org>; Fri, 02 Dec 2022 09:56:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fScTfgURmwWT7H6zKPrxCgIY6rjNdptOvR99AIwlkJg=;
        b=qb6MUvwgM++qnYXsfWIMcG9mXhaGG+7+W1fGbdBit0a6xA/KVfOeb0AjU4ykvOVMiE
         F/4LeYBBOxx7tr90Hg3fFY+tVhWWKzQfFcgnR9USKBMhG6/HeAwJYgGBzpFscpdhRoxy
         eLI7faRS9qoVUi6eRfdJ9Ip/4/x6Gb9giuxyuyAapHWfIQAsfoAoikO/quYMHq94fzgj
         HFY+5Il1GRVaAUWc+k+Ev8DXlXAXTOS0xSgGiq7k1yhVeYkNct8C6uOB97oG1XKnL8dQ
         U9D3yFpqWxlmwu332bMtPAFiStjDXK/9KHKn7pC5k5PQdlXGZiYHAOAWTMX+D+VBJy4D
         MOKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fScTfgURmwWT7H6zKPrxCgIY6rjNdptOvR99AIwlkJg=;
        b=UyHJVOofg1+yzyUFw46E/MM32dUjdrmU1pu3xBPMtFt1AcTsmFksbyVJ/N2iR7HufB
         US9DMrE0b4n7DWVvDBNZoQ0eHjBDMJopTXm4a0+vtLmSqO3hy3fNDd2D/daw+Vx1Y4uD
         ovVtsOo5H8BqXCUkEv6Lur9hn0NhV0GRzW0tu9wG7V4D7a8Nm7bRyt/ywnOJojGUJurf
         6EPNC84nrxDIPrx61jfiMTEwuyUY2PTBBDEW3Yeo9Lx8stdPaVhMO+JOns4DbwYo1t+h
         rLGp6NMpK9FNCZDAMR8+6XO1hjbeXSasD52GZFNHMUEmREybfc+EwNcJAYjiqYp9+S1A
         fdmg==
X-Gm-Message-State: ANoB5pl0CZDZMLN13vrpc/nx34cctw74wSdaH5wUeNIAsoV6Fbk6Qry3
	6s4+xVF1a+WBTWSmRkDKS1xkYA==
X-Google-Smtp-Source: AA0mqf7BpcQXuIBwLb9SatLFLu0m0DKBXhr2dsQifXx6G9te8219mc7G41HgJyuAzCPt6gBvjrti9A==
X-Received: by 2002:a63:d356:0:b0:477:1a2:390e with SMTP id u22-20020a63d356000000b0047701a2390emr64563485pgi.83.1670003814551;
        Fri, 02 Dec 2022 09:56:54 -0800 (PST)
Received: from localhost ([50.221.140.188])
        by smtp.gmail.com with ESMTPSA id mt12-20020a17090b230c00b002135e8074b1sm6920965pjb.55.2022.12.02.09.56.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Dec 2022 09:56:54 -0800 (PST)
Date: Fri, 02 Dec 2022 09:56:54 -0800 (PST)
X-Google-Original-Date: Fri, 02 Dec 2022 09:56:41 PST (-0800)
Subject: Re: [PATCH v2 1/5] kbuild: add test-{le,ge,lt,gt} macros
In-Reply-To: <20221123151828.509565-1-masahiroy@kernel.org>
CC: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, masahiroy@kernel.org,
  aou@eecs.berkeley.edu, bp@alien8.de, dave.hansen@linux.intel.com, hpa@zytor.com, mingo@redhat.com,
  nathan@kernel.org, ndesaulniers@google.com, nicolas@fjasle.eu,
  Paul Walmsley <paul.walmsley@sifive.com>, tglx@linutronix.de, trix@redhat.com, linux-riscv@lists.infradead.org,
  llvm@lists.linux.dev, x86@kernel.org
From: Palmer Dabbelt <palmer@dabbelt.com>
To: masahiroy@kernel.org
Message-ID: <mhng-0ed46e51-0907-46b5-9dc8-90a3fd3762c6@palmer-ri-x1c9a>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221202_095702_573425_D3C905FF 
X-CRM114-Status: GOOD (  26.37  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Wed, 23 Nov 2022 07:18:24 PST (-0800), masahiroy@kernel.org wrote:
> Because GNU Make is only able to handle strings, it is very hard to
> perform arighmetic in Makefiles.
>
> When we compare two integers, we invokes shell. One example is in the
> top Makefile:
>
>   ifeq ($(shell test $(CONFIG_LLD_VERSION) -lt 130000; echo $$?),0)
>
> This is more expensive than using built-in functions since it forks a
> process.
>
> If we know the two have the same number of digits, we can do better.
>
> This commit adds four macros, test-le, test-ge, test-lt, test-gt.
>
> $(call test-lt, A, B) is evaluated to 'y' if A is less than B, or
> empty otherwise. This will replace $(call shell test A -lt B).
>
> Again, the limitation is that A and B must have the same number of
> digits because these macros are based on $(sort ) function.
>
>   $(call test-lt, 1, 9)    -->  y        (Works!)
>   $(call test-lt, 10, 9)   -->  y        (Not work...)
>
> To make the latter work, you need to add '0' prefix to align the number
> of digits:
>
>   $(call test-lt, 10, 09)  -->  empty    (Works!)
>
> Actually, we can live with this limitation in many places. As for the
> example above, we know $(CONFIG_LLD_VERSION) is 6-digits because the
> minimal supported version of LLVM is 11.0.0.
>
> So, the shell invocation can be replaced with more efficient code:
>
>   ifeq ($(call test-lt, $(CONFIG_LLD_VERSION), 130000),y)
>
> Of course, this assumption will break when LLVM 100 is released, but it
> will be far in the future.
>
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> ---
>
> (no changes since v1)
>
>  Makefile               |  2 +-
>  arch/riscv/Makefile    |  2 +-
>  arch/x86/Makefile      |  2 +-
>  scripts/Kbuild.include | 10 ++++++++++
>  4 files changed, 13 insertions(+), 3 deletions(-)
>
> diff --git a/Makefile b/Makefile
> index 6f846b1f2618..eb80332f7b51 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -986,7 +986,7 @@ KBUILD_LDFLAGS += -mllvm -import-instr-limit=5
>  # Check for frame size exceeding threshold during prolog/epilog insertion
>  # when using lld < 13.0.0.
>  ifneq ($(CONFIG_FRAME_WARN),0)
> -ifeq ($(shell test $(CONFIG_LLD_VERSION) -lt 130000; echo $$?),0)
> +ifeq ($(call test-lt, $(CONFIG_LLD_VERSION), 130000),y)
>  KBUILD_LDFLAGS	+= -plugin-opt=-warn-stack-size=$(CONFIG_FRAME_WARN)
>  endif
>  endif
> diff --git a/arch/riscv/Makefile b/arch/riscv/Makefile
> index 0d13b597cb55..faf2c2177094 100644
> --- a/arch/riscv/Makefile
> +++ b/arch/riscv/Makefile
> @@ -37,7 +37,7 @@ else
>  endif
>
>  ifeq ($(CONFIG_LD_IS_LLD),y)
> -ifeq ($(shell test $(CONFIG_LLD_VERSION) -lt 150000; echo $$?),0)
> +ifeq ($(call test-lt, $(CONFIG_LLD_VERSION), 150000),y)
>  	KBUILD_CFLAGS += -mno-relax
>  	KBUILD_AFLAGS += -mno-relax
>  ifndef CONFIG_AS_IS_LLVM

Acked-by: Palmer Dabbelt <palmer@rivosinc.com> # RISC-V

> diff --git a/arch/x86/Makefile b/arch/x86/Makefile
> index 415a5d138de4..e72c7a49cd59 100644
> --- a/arch/x86/Makefile
> +++ b/arch/x86/Makefile
> @@ -211,7 +211,7 @@ endif
>  KBUILD_LDFLAGS += -m elf_$(UTS_MACHINE)
>
>  ifdef CONFIG_LTO_CLANG
> -ifeq ($(shell test $(CONFIG_LLD_VERSION) -lt 130000; echo $$?),0)
> +ifeq ($(call test-lt, $(CONFIG_LLD_VERSION), 130000),y)
>  KBUILD_LDFLAGS	+= -plugin-opt=-stack-alignment=$(if $(CONFIG_X86_32),4,8)
>  endif
>  endif
> diff --git a/scripts/Kbuild.include b/scripts/Kbuild.include
> index cbe28744637b..9996f34327cb 100644
> --- a/scripts/Kbuild.include
> +++ b/scripts/Kbuild.include
> @@ -11,6 +11,16 @@ space   := $(empty) $(empty)
>  space_escape := _-_SPACE_-_
>  pound := \#
>
> +###
> +# Comparison macros.
> +# Usage: $(call test-le, A, B)
> +# works like shell's "test A -le B", but A and B must have the same number of
> +# digits since it is just ASCII sort.
> +test-le = $(if $(filter $1, $(firstword $(sort $1 $2))),y)
> +test-ge = $(call test-le, $2, $1)
> +test-lt = $(if $(filter-out $2, $(firstword $(sort $1 $2))),y)
> +test-gt = $(call test-lt, $2, $1)
> +
>  ###
>  # Name of target with a '.' as filename prefix. foo/bar.o => foo/.bar.o
>  dot-target = $(dir $@).$(notdir $@)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
