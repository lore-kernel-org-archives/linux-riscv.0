Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6C1BC83F14
	for <linux-riscv@archiver.kernel.org>; Wed, 30 Aug 2023 13:22:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=jx4b0k4pzRuU357cd09eLtr2dgNXmm1JEqj3ielIyzA=; b=rlWHLMSsIq3qqquAuuDtjvyEha
	ksDp6XOO+wUpQp/xWyVaZTD6W6YpU7VdHW7VCMG9kgW/t/thvEFgKwbZXD1DcyfysM5Y+LAYkV6Lc
	5pFFlF/esWd+FqAQTG8cgJL0NKLqZ66KBfnNGwQr/0oX4i91P+ytHqq9E1c2JPiywxFnBo8essh0i
	F27cOo2YaWSaA2auHaI2lIkpThHsNlVr3YxQq8AdXm5NnnZNQXQdTjzbeqFyy+sbLLUQn5srudl24
	BihTuMy62YuKSOv1mVBkCSprexurBQRFwm9iLz8suWiO8AqSFo4u+ZcraeMfpI7N2jpXX3eymo+FO
	XB8bgRmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qbL9q-00DYhW-1X;
	Wed, 30 Aug 2023 13:22:54 +0000
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qbL9n-00DYfd-0B
	for linux-riscv@lists.infradead.org;
	Wed, 30 Aug 2023 13:22:52 +0000
Received: by mail-pf1-x42f.google.com with SMTP id d2e1a72fcca58-68a3e943762so4772193b3a.1
        for <linux-riscv@lists.infradead.org>; Wed, 30 Aug 2023 06:22:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20221208.gappssmtp.com; s=20221208; t=1693401768; x=1694006568; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=O4GvqqXYslqNFsd5EWHg4Ea3OLy5rZ2/lST17BJAYmg=;
        b=Cov50LsXNruSqd41KsRyAaphtrKQCG3k0L4bl3rcDNJObOqBKv0cy3vG49d3wa7j9M
         J+fjS/xVBdnzmveZiyrMRXlrvtLMYTVmJm6BKDnbDncwKuXGqh383n+x3Hkx2bVNy7Ld
         yEe4XVLzd8Z1CnSvhj4qwCVjnlBiapCKMUoLKgX4bjxlROEyNtjLGeG+ykwlCA8aXogL
         gecMn7GBQW408oR7fDmwGQfwR9vJ5w4gJo2847UGy7wIycW9iuleZhs6wUo3p36zcKVT
         V86RFaKVZRVaffcAzHU3ZEk2c1Rr7ALwmfEVastfApJpgaxPKc60maOpO1E+iljSPxhW
         2p8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693401768; x=1694006568;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=O4GvqqXYslqNFsd5EWHg4Ea3OLy5rZ2/lST17BJAYmg=;
        b=Oh98vsNqM/5yfLVJu5qNaWKhDiukxqhxiUbb0Vli5ULLy7DfUkjj6HJiH5ZT10xewr
         skRUru9BiDlwI5tZ/3f9Xva2uane8hwdMEvei29ip8LQh+/PAsTYtg1JcqMnEsHaQF3N
         reE5tf/+HlBBX8qgf2VSeGd1V0xAutv5nt4lIJnOvx5q+B9QZPt4gpRGZULMhu61ykDz
         3eKFcB419baH3znGQ7dsBWrrbk32y7D+cFm0bNTK9Ovb0zKyHFKZwfH91U/7gDHQaRj6
         2pDnwc5kQ1DVn9x8yqtH+mtUH9NhMuV+1eskyO6qS1w9SkCe1IFM4RWlMYRxW9X+GBys
         IxHw==
X-Gm-Message-State: AOJu0YwwWrXvHjmHcwuZvTRY0iOnRduuQ/5vyJ51npK5u9Nb0e1VOhgf
	bu4JXCJ0i3dag6XjV+gZqDyBAmoV4XH2yfQgr10=
X-Google-Smtp-Source: AGHT+IGTDa/l85FPKn1KhDFFtCyRdxWCBsUqIzaTeH5C54h6kus9MG641S9d7bLWS9D1W4VHOQfhMA==
X-Received: by 2002:a05:6a00:1ac8:b0:68a:457f:d418 with SMTP id f8-20020a056a001ac800b0068a457fd418mr2423568pfv.3.1693401767603;
        Wed, 30 Aug 2023 06:22:47 -0700 (PDT)
Received: from localhost ([135.180.227.0])
        by smtp.gmail.com with ESMTPSA id k8-20020aa792c8000000b006871fdde2c7sm9982010pfa.110.2023.08.30.06.22.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Aug 2023 06:22:45 -0700 (PDT)
Date: Wed, 30 Aug 2023 06:22:45 -0700 (PDT)
X-Google-Original-Date: Wed, 30 Aug 2023 06:22:40 PDT (-0700)
Subject: Re: [PATCH] lib/Kconfig.debug: Restrict DEBUG_INFO_SPLIT for RISC-V
In-Reply-To: <20230816-riscv-debug_info_split-v1-1-d1019d6ccc11@kernel.org>
CC: Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu,
  akpm@linux-foundation.org, Conor Dooley <conor@kernel.org>, ndesaulniers@google.com, trix@redhat.com,
  linux-riscv@lists.infradead.org, llvm@lists.linux.dev, patches@lists.linux.dev, lkp@intel.com,
  nathan@kernel.org
From: Palmer Dabbelt <palmer@dabbelt.com>
To: nathan@kernel.org, keescook@chromium.org, akpm@linux-foundation.org
Message-ID: <mhng-747958b0-514c-4fc8-ac37-0769562ba385@palmer-ri-x1c9>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230830_062251_276867_A18F8C2D 
X-CRM114-Status: GOOD (  23.75  )
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

On Wed, 16 Aug 2023 10:35:43 PDT (-0700), nathan@kernel.org wrote:
> When building for ARCH=riscv using LLVM < 14, there is an error with
> CONFIG_DEBUG_INFO_SPLIT=y:
>
>   error: A dwo section may not contain relocations
>
> This was worked around in LLVM 15 by disallowing '-gsplit-dwarf' with
> '-mrelax' (the default), so CONFIG_DEBUG_INFO_SPLIT is not selectable
> with newer versions of LLVM:
>
>   $ clang --target=riscv64-linux-gnu -gsplit-dwarf -c -o /dev/null -x c /dev/null
>   clang: error: -gsplit-dwarf is unsupported with RISC-V linker relaxation (-mrelax)
>
> GCC silently had a similar issue that was resolved with GCC 12.x.
> Restrict CONFIG_DEBUG_INFO_SPLIT for RISC-V when using LLVM or GCC <
> 12.x to avoid these known issues.
>
> Link: https://github.com/ClangBuiltLinux/linux/issues/1914
> Link: https://gcc.gnu.org/bugzilla/show_bug.cgi?id=99090
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/all/202308090204.9yZffBWo-lkp@intel.com/
> Signed-off-by: Nathan Chancellor <nathan@kernel.org>
> ---
> Since this only impacts RISC-V, it seems reasonable that this would go
> in via their tree but I have added Andrew in case he wants to take it.
> ---
>  lib/Kconfig.debug | 5 +++++
>  1 file changed, 5 insertions(+)
>
> diff --git a/lib/Kconfig.debug b/lib/Kconfig.debug
> index d6798513a8c2..bd51274f4771 100644
> --- a/lib/Kconfig.debug
> +++ b/lib/Kconfig.debug
> @@ -355,6 +355,11 @@ endchoice # "Compressed Debug information"
>  config DEBUG_INFO_SPLIT
>  	bool "Produce split debuginfo in .dwo files"
>  	depends on $(cc-option,-gsplit-dwarf)
> +	# RISC-V linker relaxation + -gsplit-dwarf has issues with LLVM and GCC
> +	# prior to 12.x:
> +	# https://github.com/llvm/llvm-project/issues/56642
> +	# https://gcc.gnu.org/bugzilla/show_bug.cgi?id=99090
> +	depends on !RISCV || GCC_VERSION >= 120000
>  	help
>  	  Generate debug info into separate .dwo files. This significantly
>  	  reduces the build directory size for builds with DEBUG_INFO,

Reviewed-by: Palmer Dabbelt <palmer@rivosinc.com>
Acked-by: Palmer Dabbelt <palmer@rivosinc.com>

Not sure who's taking stuff for lib/Kconfig.debug, I can take it via the 
RISC-V tree if folks are OK with it.  Kees and Andrew were the last to 
touch it.

>
> ---
> base-commit: 2ccdd1b13c591d306f0401d98dedc4bdcd02b421
> change-id: 20230816-riscv-debug_info_split-0713571a1ac2
>
> Best regards,

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
