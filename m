Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E1C2C27C41
	for <linux-riscv@archiver.kernel.org>; Wed, 16 Aug 2023 22:05:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GT6mOuQnnFyE+/TynGwdplR6XgqShi/Iz7i3L/os0eA=; b=3LaP2EWbg/wY+vYrTKtbSH2TXJ
	GIGtQdfEcQpnh8QBgFUkloN4Fwbq3puIaIWwH34oEbsflEhqUqAD1VKY7qmKpQAGTZGw4EwWv0Ac+
	t3IJzXoNw5sMixSh7GU9DtedcsBBFbx1xhK9q1KHV0he0+XeaV1bNHe8TYSFZf5YBWuLaDPr/xu7L
	xrs7bckp5/FbsxabRAKkzzgRI1loDUMTUdFUmXgO//g5Kms5quZNeuTvmmq0lvNfJZVWutQ1rW2ZL
	ffFlTGHB55eLfp35iYh8Jkkic5yvsQkUSO1XtTWXlOYkhgyAiFE/4K0XNTg34+HcVj5QRdra2ITvw
	DLzvxmQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qWOdZ-0054vn-19;
	Wed, 16 Aug 2023 22:05:09 +0000
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qWOdW-0054uF-0q
	for linux-riscv@lists.infradead.org;
	Wed, 16 Aug 2023 22:05:07 +0000
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-1bde4403296so46315ad.0
        for <linux-riscv@lists.infradead.org>; Wed, 16 Aug 2023 15:05:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1692223502; x=1692828302;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=bBPTE28cAPKLWrgM2uUfeQITqXrIuPWTV58S91B8OJI=;
        b=vcF4yOPHfczBQYINY7p/sgfRsPapUuPOGiBbhWqQBEvOuthgZKjD4Qrc9YF8UQB7/q
         drD+D9rbfpd+7gugaFmaX0+38sAdlW7k8huZB13sEHUiXw/KBOboAOYQdaHK2kBRwebH
         kLAnbDdo5d5KTt2j/oPwMvE7ifJC209z/eNf7O6naxG1wOmO1rbPTIyCgQMWZVeMRRDD
         Sl6PXrPh5fGRikUQNbIRUvZfuxumaQcXPmBj40bKRPYqPKa+lUI5zwNAmgRP2P8z9OnT
         rdbZiKNvsVPkZq2IsNwU+RlLfDEZB37ClSv35srOVxcJ1u65ObX7u95ewKJJDVxnFvkZ
         UkOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692223502; x=1692828302;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bBPTE28cAPKLWrgM2uUfeQITqXrIuPWTV58S91B8OJI=;
        b=QlkcT7LNfXJKkeMDCh4vgFrpN3ZMBQCAWzh1aLd8GhP7Y+Ik8uXaEnCAOpSSUPQdBu
         4LQupJKgFN4JvwcdAa9+7cdxUgnR1c3L7cBtbDcvFtOJeBy+yV1cHpJJhDcGmvg5lcko
         BdsVH6vDNzp2s5cSgaymzcgok6UVQg8RAsVOvWSLVMvV6zXOszfQTIRW2lJ2SZeA1w44
         bt0YBGM943ayNGtW7TvsgFePY9Y3gp9tweGYv6seKE0ECEe5lq9jB3pjHru1YjR5W19a
         n8bSfsuyDhnBuLBv/UGtZNNzOZH3NOMGi51YRosVy5LLK+E0w2zdhnSPN5rbx+g3I62w
         Tbww==
X-Gm-Message-State: AOJu0Yy3D768O3yjMALb/3UYtyrchP85/wNXggZ7FuJ5beltPeM7nLbA
	WPxSIONOf7Gu47E5giTMXqtXuA==
X-Google-Smtp-Source: AGHT+IEuOUCO/H139rrEjwSPDvyEtzzmsDP4BDaEKor0UvpvxGlepYgrvvJV8S5/Zv9LowbS4wuvqg==
X-Received: by 2002:a17:902:d2c4:b0:1b8:698e:ac2f with SMTP id n4-20020a170902d2c400b001b8698eac2fmr44043plc.21.1692223501659;
        Wed, 16 Aug 2023 15:05:01 -0700 (PDT)
Received: from google.com ([2620:15c:2d3:205:abd7:243d:5e17:457d])
        by smtp.gmail.com with ESMTPSA id iw12-20020a170903044c00b001b9d7c8f44dsm13592911plb.182.2023.08.16.15.05.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Aug 2023 15:05:01 -0700 (PDT)
Date: Wed, 16 Aug 2023 15:04:57 -0700
From: Fangrui Song <maskray@google.com>
To: Nathan Chancellor <nathan@kernel.org>
Cc: paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
	akpm@linux-foundation.org, conor@kernel.org,
	ndesaulniers@google.com, trix@redhat.com,
	linux-riscv@lists.infradead.org, llvm@lists.linux.dev,
	patches@lists.linux.dev, kernel test robot <lkp@intel.com>
Subject: Re: [PATCH] lib/Kconfig.debug: Restrict DEBUG_INFO_SPLIT for RISC-V
Message-ID: <20230816220457.kqzlbiibeomvki4y@google.com>
References: <20230816-riscv-debug_info_split-v1-1-d1019d6ccc11@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230816-riscv-debug_info_split-v1-1-d1019d6ccc11@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230816_150506_304470_46D8234D 
X-CRM114-Status: GOOD (  13.43  )
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

On 2023-08-16, Nathan Chancellor wrote:
>When building for ARCH=riscv using LLVM < 14, there is an error with
>CONFIG_DEBUG_INFO_SPLIT=y:
>
>  error: A dwo section may not contain relocations
>
>This was worked around in LLVM 15 by disallowing '-gsplit-dwarf' with
>'-mrelax' (the default), so CONFIG_DEBUG_INFO_SPLIT is not selectable
>with newer versions of LLVM:
>
>  $ clang --target=riscv64-linux-gnu -gsplit-dwarf -c -o /dev/null -x c /dev/null
>  clang: error: -gsplit-dwarf is unsupported with RISC-V linker relaxation (-mrelax)
>
>GCC silently had a similar issue that was resolved with GCC 12.x.
>Restrict CONFIG_DEBUG_INFO_SPLIT for RISC-V when using LLVM or GCC <
>12.x to avoid these known issues.
>
>Link: https://github.com/ClangBuiltLinux/linux/issues/1914
>Link: https://gcc.gnu.org/bugzilla/show_bug.cgi?id=99090
>Reported-by: kernel test robot <lkp@intel.com>
>Closes: https://lore.kernel.org/all/202308090204.9yZffBWo-lkp@intel.com/
>Signed-off-by: Nathan Chancellor <nathan@kernel.org>
>---
>Since this only impacts RISC-V, it seems reasonable that this would go
>in via their tree but I have added Andrew in case he wants to take it.
>---
> lib/Kconfig.debug | 5 +++++
> 1 file changed, 5 insertions(+)
>
>diff --git a/lib/Kconfig.debug b/lib/Kconfig.debug
>index d6798513a8c2..bd51274f4771 100644
>--- a/lib/Kconfig.debug
>+++ b/lib/Kconfig.debug
>@@ -355,6 +355,11 @@ endchoice # "Compressed Debug information"
> config DEBUG_INFO_SPLIT
> 	bool "Produce split debuginfo in .dwo files"
> 	depends on $(cc-option,-gsplit-dwarf)
>+	# RISC-V linker relaxation + -gsplit-dwarf has issues with LLVM and GCC
>+	# prior to 12.x:
>+	# https://github.com/llvm/llvm-project/issues/56642
>+	# https://gcc.gnu.org/bugzilla/show_bug.cgi?id=99090
>+	depends on !RISCV || GCC_VERSION >= 120000
> 	help
> 	  Generate debug info into separate .dwo files. This significantly
> 	  reduces the build directory size for builds with DEBUG_INFO,
>
>---
>base-commit: 2ccdd1b13c591d306f0401d98dedc4bdcd02b421
>change-id: 20230816-riscv-debug_info_split-0713571a1ac2
>
>Best regards,
>-- 
>Nathan Chancellor <nathan@kernel.org>
>

LGTM as the author of the Clang mitigation
(https://github.com/llvm/llvm-project/issues/56642) and several recent
LLVM assembler side linker relaxation improvement (I continue updating
https://maskray.me/blog/2021-03-14-the-dark-side-of-riscv-linker-relaxation
about the complication of linker relaxation).

Reviewed-by: Fangrui Song <maskray@google.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
