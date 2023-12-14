Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0687DC4332F
	for <linux-riscv@archiver.kernel.org>; Thu, 14 Dec 2023 00:12:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9UDcu/YZWXTGj+pwh9nVCwq5Mb3+vV9IBd2/9VxT0AM=; b=EebGIrvUt3ErgH
	bqLYPoBF/jQkxsUR9mjD2SFWAm4sLOhHazJZQ6GNZ+ShjTB8Eb9eiPusD9ou40gSPZZx7sVcqWYvI
	yN4A8QG9c09gsiOGRSCBE6kEk5fTAuuV70bNg/I8rEE5n7ruJ1j8W1ERJlPIySxJl2gT9KHy9JRHQ
	GK0QuejmOyD/1zGw4syhMkTwoJLO+fwQSHrkfAUqP/qQQcV9msqB0nAwiiGB0EnXHaRl7W9iUF0mw
	JKDqoRhNwSmYH04OcisCZwpKoT4jln1fucVWz5HxOQbSWcJF1V4gqobi6uNCQ2a89pl1GFDZO6GsB
	YtIKXq2AJGHtY3KcmsGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rDZL5-00GJx2-2n;
	Thu, 14 Dec 2023 00:12:31 +0000
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rDZL1-00GJwb-05
	for linux-riscv@lists.infradead.org;
	Thu, 14 Dec 2023 00:12:29 +0000
Received: by mail-pf1-x42c.google.com with SMTP id d2e1a72fcca58-6cebbf51742so69533b3a.1
        for <linux-riscv@lists.infradead.org>; Wed, 13 Dec 2023 16:12:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1702512744; x=1703117544; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=viMe9kglal5ScjZ1n6jPL3FjIe+JldVfUhvBnQIbEiw=;
        b=BNNVp25+Fc/WA8/ekfpCLelxmZVzEN75LaX1ZkK0UyUolU1rTivCRCchfGa5CY0gZx
         tYrttAaNhho7DHWETlrm1SIkyNOVINpw7U9Z4Mrf/75tshEPgIrZ1z7Bn+vjPS09Cq6y
         nc5Ta4gmWHdd4xO7acrQZhJOUSvYvSJXnZSs401UrThcKGhZKvSLvERdGj/H7Vw8SCi4
         X3DWLSZnQgGuAxUO5zkW/6PLxVNWfA47dwNUcvY1zCyAbUbaJf7sIEM4hPqpUzH9a+om
         pNEysTWWrKAMq76mobmLYffKl0pVnni4PtrFaHdPaicwoMlpqTY1H+F0GBJhhauzJszb
         Mg+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702512744; x=1703117544;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=viMe9kglal5ScjZ1n6jPL3FjIe+JldVfUhvBnQIbEiw=;
        b=HrWLz7ycVEi3yF3kALYEtOnlLaQ3aM1g1KRleq1yRsZD56JU2sy55oRvGsyTB9x/Ry
         XwxgEWffkKB263yXZrZC7RHc3raFZne+arxut/of8CVklz3MTwgv9uijnO6+IPdgwKSi
         9V63pfwUbEV6fbZ/3+uqmQ7+kGlWEVsk3J1G35ytNBRUFy/4VRWd4xcRniKBUuQJURS0
         wwFUA4RYupAF3FvJF5dLvg1vwvBzmQFQ8OGlYe6/dO3XBHj//R5xi0QwA5fKDUC7qAIL
         0gEZS5fZS8rKRU539RBj3ng54dzwom1urloDLffyWkwaqop+AI00SaSuPmtNPCy/QabH
         7kwA==
X-Gm-Message-State: AOJu0YzO2XkVRWu+1QitEZ+lz7aKF0xTJRHb8Gq0RILpoxzNDd9R0E2z
	nLnBOPK4uBOwJp54VpBJalWJBQ==
X-Google-Smtp-Source: AGHT+IEeZevrL+CP3o0k1tCx3qTiITpwRbjE02mFHTMHU0lILBn9xW4aeM0+zn8YH8RqAwIzSvOtZw==
X-Received: by 2002:a05:6a00:2da1:b0:6ce:2731:47b7 with SMTP id fb33-20020a056a002da100b006ce273147b7mr10780615pfb.23.1702512743782;
        Wed, 13 Dec 2023 16:12:23 -0800 (PST)
Received: from ghost ([12.44.203.122])
        by smtp.gmail.com with ESMTPSA id y4-20020a62f244000000b006ce809948adsm10397431pfl.30.2023.12.13.16.12.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Dec 2023 16:12:23 -0800 (PST)
Date: Wed, 13 Dec 2023 16:12:20 -0800
From: Charlie Jenkins <charlie@rivosinc.com>
To: Nathan Chancellor <nathan@kernel.org>
Cc: paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
	conor@kernel.org, maskray@google.com, ndesaulniers@google.com,
	linux-riscv@lists.infradead.org, llvm@lists.linux.dev,
	patches@lists.linux.dev
Subject: Re: [PATCH v2 3/3] lib/Kconfig.debug: Update AS_HAS_NON_CONST_LEB128
 comment and name
Message-ID: <ZXpIZGE9e6F2d5Hk@ghost>
References: <20231205-riscv-restrict-dwarf5-llvm-v2-0-aedf00a382ac@kernel.org>
 <20231205-riscv-restrict-dwarf5-llvm-v2-3-aedf00a382ac@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231205-riscv-restrict-dwarf5-llvm-v2-3-aedf00a382ac@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231213_161227_420715_277BF006 
X-CRM114-Status: GOOD (  23.66  )
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

On Tue, Dec 05, 2023 at 04:53:52PM -0700, Nathan Chancellor wrote:
> Fangrui noted that the comment around CONFIG_AS_HAS_NON_CONST_LEB128
> could be made more accurate because explicit .sleb128 directives are not
> emitted, only .uleb128 directives are. Rename the symbol to
> CONFIG_AS_HAS_NON_CONST_ULEB128 as a result.
> 
> Further clarifications include replacing "symbol deltas" with the more
> accurate "label differences", noting that this issue has been resolved
> in newer binutils (2.41+), and it only occurs when a port uses RISC-V
> style linker relaxation.
> 
> Suggested-by: Fangrui Song <maskray@google.com>
> Signed-off-by: Nathan Chancellor <nathan@kernel.org>
> ---
>  lib/Kconfig.debug | 11 ++++++-----
>  1 file changed, 6 insertions(+), 5 deletions(-)
> 
> diff --git a/lib/Kconfig.debug b/lib/Kconfig.debug
> index a0ebce05a368..76c2cc697573 100644
> --- a/lib/Kconfig.debug
> +++ b/lib/Kconfig.debug
> @@ -231,9 +231,10 @@ config DEBUG_INFO
>  	  in the "Debug information" choice below, indicating that debug
>  	  information will be generated for build targets.
>  
> -# Clang is known to generate .{s,u}leb128 with symbol deltas with DWARF5, which
> -# some targets may not support: https://sourceware.org/bugzilla/show_bug.cgi?id=27215
> -config AS_HAS_NON_CONST_LEB128
> +# Clang generates .uleb128 with label differences for DWARF v5, a feature that
> +# older binutils ports do not support when utilizing RISC-V style linker
> +# relaxation: https://sourceware.org/bugzilla/show_bug.cgi?id=27215
> +config AS_HAS_NON_CONST_ULEB128
>  	def_bool $(as-instr,.uleb128 .Lexpr_end4 - .Lexpr_start3\n.Lexpr_start3:\n.Lexpr_end4:)

This seems like a good change. However the wording in your commit
message seems misleading. This config only ever checked for .uleb128
with a label difference and would assume that sleb128 with label
differences were supported. This seems more like a "bug" in the config
name that this is fixing. My interpretation is that your commit
describes why this issue was never caught (because sleb128 is not
emitted), but not the root of why this change is necessary (because
non-const sleb128 is not necessarily supported if non-const uleb128 is).
Anyways, it's just a commit message so not something that is important
to change.

Reviewed-by: Charlie Jenkins <charlie@rivosinc.com>

>  
>  choice
> @@ -258,7 +259,7 @@ config DEBUG_INFO_NONE
>  config DEBUG_INFO_DWARF_TOOLCHAIN_DEFAULT
>  	bool "Rely on the toolchain's implicit default DWARF version"
>  	select DEBUG_INFO
> -	depends on !CC_IS_CLANG || AS_IS_LLVM || CLANG_VERSION < 140000 || (AS_IS_GNU && AS_VERSION >= 23502 && AS_HAS_NON_CONST_LEB128)
> +	depends on !CC_IS_CLANG || AS_IS_LLVM || CLANG_VERSION < 140000 || (AS_IS_GNU && AS_VERSION >= 23502 && AS_HAS_NON_CONST_ULEB128)
>  	help
>  	  The implicit default version of DWARF debug info produced by a
>  	  toolchain changes over time.
> @@ -283,7 +284,7 @@ config DEBUG_INFO_DWARF5
>  	bool "Generate DWARF Version 5 debuginfo"
>  	select DEBUG_INFO
>  	depends on !ARCH_HAS_BROKEN_DWARF5
> -	depends on !CC_IS_CLANG || AS_IS_LLVM || (AS_IS_GNU && AS_VERSION >= 23502 && AS_HAS_NON_CONST_LEB128)
> +	depends on !CC_IS_CLANG || AS_IS_LLVM || (AS_IS_GNU && AS_VERSION >= 23502 && AS_HAS_NON_CONST_ULEB128)
>  	help
>  	  Generate DWARF v5 debug info. Requires binutils 2.35.2, gcc 5.0+ (gcc
>  	  5.0+ accepts the -gdwarf-5 flag but only had partial support for some
> 
> -- 
> 2.43.0
> 
> 
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
