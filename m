Return-Path: <SRS0=IZ/x=PV=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CC20FC433EF
	for <linux-riscv@archiver.kernel.org>; Tue,  2 Nov 2021 16:49:12 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 96B3960EBB
	for <linux-riscv@archiver.kernel.org>; Tue,  2 Nov 2021 16:49:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 96B3960EBB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7hZFUbs5PDcbyhG2UzRpb7zzr8yRIHi8WDDlGT7peGY=; b=UdQO5iKn5YiHor
	2WCaQn2kR8B145VB5SWERR92dJomwF6ENQyFN5eIFTxsC4ChOrrFkoNAF4f4IhJBmn0lFvAXffn8v
	NZCxO6hcG1fvUpTmxKgOrmDF/r7qhcz0Lsv2vBG+gWcHAj5okEsbRExe/jP+omvpNVsqmo1aULUQJ
	xorDFvJaghnyPsQg8CRkCKh1ylUG0OQdedAflYJFfiCVS1Fo302grplTYq+87b13WxlLfpz+nDlN5
	8n2WlIWgYoSAunJItQqnz8+jZ/2S7E6pHvlxcXhUwgqKV2kLEsfH4Cx+FMDQ8y4KqEMp91rnBUFw6
	x+3FxbSJxEo2/sUVMwCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mhwy5-002MWJ-0l; Tue, 02 Nov 2021 16:49:01 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mhwxe-002MLR-5S
 for linux-riscv@lists.infradead.org; Tue, 02 Nov 2021 16:48:35 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 4CE796112D;
 Tue,  2 Nov 2021 16:48:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1635871713;
 bh=7ILamZGe9w+I3NxSwD0YsX5zvTJuLuPf8sWfHLzgVXw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=d4q1/o678ZngzUTXAkN205OWRP72Ndz9WH/ZNZdVqxRSNVl6zOdjkD9xewDnfjWH9
 rAf9wIKqo4DuQoRO/AlOqrzaupc+jwSXduLWQvXbwnXefXdFPauzb3QFySrsQVfnhJ
 7BkqTbzl2p92Xw0AAebJCl+LgPq9Et8W4no7aNDtd/FtrvjsXWIQJAhJPT0B354S2D
 +gX92juzprvtkU1Ik7wOcaamGCD9KwWdeGkHCb8WPgeM3tnSS5YITDGd+XyCNN8nC6
 q3zJchHbwe1aZ0x0XkLOT0rXHPYRuCvAABBqwxPNnR3LlU2aLocqoK89cEfxLBvXDh
 A7bziBKyg4Fdw==
Date: Tue, 2 Nov 2021 09:48:28 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Andreas Schwab <schwab@suse.de>
Cc: linux-riscv@lists.infradead.org, Saleem Abdulrasool <abdulras@google.com>,
 linux-kernel@vger.kernel.org, Palmer Dabbelt <palmer@dabbelt.com>,
 Nick Desaulniers <ndesaulniers@google.com>,
 Bill Wendling <morbo@google.com>, clang-built-linux@googlegroups.com
Subject: Re: [PATCH] riscv: fix building external modules
Message-ID: <YYFr3F89YWfUDJxm@archlinux-ax161>
References: <20210804173214.1027994-1-abdulras@google.com>
 <mvma6imr1ww.fsf@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <mvma6imr1ww.fsf@suse.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211102_094834_255291_B379FA1C 
X-CRM114-Status: GOOD (  14.65  )
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

On Tue, Nov 02, 2021 at 04:51:43PM +0100, Andreas Schwab wrote:
> When building external modules, vdso_prepare should not be run.  If the
> kernel sources are read-only, it will fail.
> 
> Fixes: fde9c59aebaf ("riscv: explicitly use symbol offsets for VDSO")
> Signed-off-by: Andreas Schwab <schwab@suse.de>

Reviewed-by: Nathan Chancellor <nathan@kernel.org>
Tested-by: Nathan Chancellor <nathan@kernel.org>

> ---
>  arch/riscv/Makefile | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/arch/riscv/Makefile b/arch/riscv/Makefile
> index 0eb4568fbd29..41f3a75fe2ec 100644
> --- a/arch/riscv/Makefile
> +++ b/arch/riscv/Makefile
> @@ -108,11 +108,13 @@ PHONY += vdso_install
>  vdso_install:
>  	$(Q)$(MAKE) $(build)=arch/riscv/kernel/vdso $@
>  
> +ifeq ($(KBUILD_EXTMOD),)
>  ifeq ($(CONFIG_MMU),y)
>  prepare: vdso_prepare
>  vdso_prepare: prepare0
>  	$(Q)$(MAKE) $(build)=arch/riscv/kernel/vdso include/generated/vdso-offsets.h
>  endif
> +endif
>  
>  ifneq ($(CONFIG_XIP_KERNEL),y)
>  ifeq ($(CONFIG_RISCV_M_MODE)$(CONFIG_SOC_CANAAN),yy)
> -- 
> 2.33.1
> 
> 
> -- 
> Andreas Schwab, SUSE Labs, schwab@suse.de
> GPG Key fingerprint = 0196 BAD8 1CE9 1970 F4BE  1748 E4D4 88E3 0EEA B9D7
> "And now for something completely different."
> 
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
