Return-Path: <SRS0=Il0f=OB=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9037CC433F5
	for <linux-riscv@archiver.kernel.org>; Sat, 11 Sep 2021 00:09:49 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3185C61153
	for <linux-riscv@archiver.kernel.org>; Sat, 11 Sep 2021 00:09:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 3185C61153
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8UCe7lrhbxQ4bPLGTH/yzuRPPWAPu4BcRlkLB8GrecU=; b=vtZWmRifcJPvfP
	mry8N9yn5Pizo+5xZIJMefJDS5UlqRs8HTUAatKLjV/X+PrkHf3wiRutqTn41LZucTN1I6WJsp5Dh
	FqmjKmXr/YsbQKbQ5V+lUwBhX6jt+WQ9S8lNVIEzAMKqvyhzl21538Ld06X79F5k5vYILhtsG/FHj
	peOu9BdU4OpCt3yuWYTdfzq2bb6vqbajiJv8X0VGmNxN+5kMSuoQa9cjZ1kBkIIXZQeWQ/X1VK7pX
	mTBtvklAFeXc0P5sEh0RCwyXqjwZiMaqjAQO9uTbdknGsPNcxwvDe6J0gJY8K09o5afdUdmKfX6Qd
	ENLTRMlINXEGWCss5WoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mOqaB-00E2qF-Mt; Sat, 11 Sep 2021 00:09:23 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mOqa8-00E2pY-CN
 for linux-riscv@lists.infradead.org; Sat, 11 Sep 2021 00:09:21 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 518C4611BF;
 Sat, 11 Sep 2021 00:09:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1631318959;
 bh=0YuBUzN72gkNDxmeZ5kJyvvvXFpC+53qFp+/zstmt9g=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=hmv5TRqSAS/BsSeUTEibp7up/z8FC7Zncd+zxhBvJXZt+59mJpA9lnYFUMKStarVU
 v9n6xzm0pz5TFMy2lLdAD56pxskSpwmyD/Qwk2x+0MsLPMkyWrsotNexrlUUx9sMTO
 QSXID0uMhcQaIcwYyLnChGlGf/5R6mim7v+zsF7QXsJEp++tdi4WOnL1w/6KKqOrjm
 qsL7W0FvrIpKokD0DvJUHnYFgYO7R2AGXcQLtj7If5DoSexiavFxZ5n+J9GyJ9qmJ9
 Q35lu2pPDxaoTktyiqVGVW86G2k5MwHRlFUzHFd4/eCIXkbEFVS7wtHRouXbvGH2zU
 1IASjekyXc0Bg==
Date: Fri, 10 Sep 2021 17:09:14 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Nick Desaulniers <ndesaulniers@google.com>
Cc: Andrew Morton <akpm@linux-foundation.org>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 Rasmus Villemoes <linux@rasmusvillemoes.dk>,
 Masahiro Yamada <masahiroy@kernel.org>,
 Joe Perches <joe@perches.com>, Arnd Bergmann <arnd@kernel.org>,
 Stephen Rothwell <sfr@canb.auug.org.au>, llvm@lists.linux.dev,
 linux-kernel@vger.kernel.org, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>, linux-riscv@lists.infradead.org
Subject: Re: [PATCH 05/10] riscv: remove Kconfig check for GCC version for
 ARCH_RV64I
Message-ID: <YTvzqrrN8xfYalt5@archlinux-ax161>
References: <20210910234047.1019925-1-ndesaulniers@google.com>
 <20210910234047.1019925-6-ndesaulniers@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210910234047.1019925-6-ndesaulniers@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210910_170920_483376_B55C6420 
X-CRM114-Status: GOOD (  14.94  )
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

On Fri, Sep 10, 2021 at 04:40:42PM -0700, Nick Desaulniers wrote:
> The minimum supported version of GCC is now 5.1. The check wasn't
> correct as written anyways since GCC_VERSION is 0 when CC=clang.
> 
> Cc: Paul Walmsley <paul.walmsley@sifive.com>
> Cc: Palmer Dabbelt <palmer@dabbelt.com>
> Cc: Albert Ou <aou@eecs.berkeley.edu>
> Cc: linux-riscv@lists.infradead.org
> Signed-off-by: Nick Desaulniers <ndesaulniers@google.com>

Indeed, I meant to clean this up a while ago but forgot :/

Reviewed-by: Nathan Chancellor <nathan@kernel.org>

> ---
>  arch/riscv/Kconfig | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> index c79955655fa4..5fc1d0cc82e1 100644
> --- a/arch/riscv/Kconfig
> +++ b/arch/riscv/Kconfig
> @@ -235,7 +235,7 @@ config ARCH_RV32I
>  config ARCH_RV64I
>  	bool "RV64I"
>  	select 64BIT
> -	select ARCH_SUPPORTS_INT128 if CC_HAS_INT128 && GCC_VERSION >= 50000
> +	select ARCH_SUPPORTS_INT128 if CC_HAS_INT128
>  	select HAVE_DYNAMIC_FTRACE if !XIP_KERNEL && MMU && $(cc-option,-fpatchable-function-entry=8)
>  	select HAVE_DYNAMIC_FTRACE_WITH_REGS if HAVE_DYNAMIC_FTRACE
>  	select HAVE_FTRACE_MCOUNT_RECORD if !XIP_KERNEL
> -- 
> 2.33.0.309.g3052b89438-goog
> 
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
