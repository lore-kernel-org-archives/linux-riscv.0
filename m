Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65CF7C433F5
	for <linux-riscv@archiver.kernel.org>; Tue, 22 Mar 2022 01:49:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EA02xZeKX+eDCZz/VznT45prBuQ9GpENQv0+HeozyZA=; b=jgavu3as3kDg4F
	xKbWIby/wfffTyvIgBuUEWDdQBjX2FtfCZ23WfcGXCzi/KEg2YBL6lG9qJD8FEkrhXp8vj2tOMqZZ
	P2V3cAy3ORUKIqu6PAx5VhT1CuQyb++tEQUMJ0KWGdN5nebKXsqmZrf+9lx89WQ6KUyU6uZDhqwGU
	mqbTi7F6BjiYBAJSzuV/8cn04SdDNWQcx/FFnbnkkLdRGFqk01hmJc//Z5ma62aa6tJK6lWNeEvY8
	yIr9SGI0BgVcOsdwArlfzIhXMcjclyGGSy7t+iBa8t50pxiUxFXm05ewEtXf/4wvmCT8x1F8M3KVO
	qW2MRACW0+yMcrI+SV+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nWTeI-009dTM-No; Tue, 22 Mar 2022 01:49:26 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nWTeE-009dSN-RS
 for linux-riscv@lists.infradead.org; Tue, 22 Mar 2022 01:49:25 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 26B60B81AFE;
 Tue, 22 Mar 2022 01:49:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7D7A3C340E8;
 Tue, 22 Mar 2022 01:49:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1647913759;
 bh=ddTucoDObbko3r4dIUh3A+Wyax31f7BdaGshebkC8ak=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=vKS5FvHjypP7+oJU8VJ14xcilm7aYOXpmyBeLBmAH286j/eeSjrthKWCl25Zbex89
 a6GKYtJXzFMK+KIUMk5ZBKMAFLpOa7+ti+XarxoocpWXsIV8ukU9iJykHePX9BveSk
 Ys1ebK1KcjmbhfykfeMYl3he4JrKtNQoeOxricTKyRMcGnab2jhXjS9VSxqR0v+Ldp
 pnsBMh5sH9axv+mpcDXKuwJ+vM08aYb2My7MVG2YXIcP3PJhXEwsxkaRrT0x9CwA+p
 XZjYSBBQmJTLbjJktpXLNbHAAbYDjNfRE5WtmoUZvKOTt+P3R3Lb6JkvESNOjQjWG9
 L7HUDpcVyJJ3w==
Date: Mon, 21 Mar 2022 18:49:12 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Fangrui Song <maskray@google.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 llvm@lists.linux.dev
Subject: Re: [PATCH v2] riscv module: remove (NOLOAD)
Message-ID: <YjkrGAqx9nl/PtWh@dev-arch.thelio-3990X>
References: <mhng-7fe2c5d9-a8e6-4123-ac5c-0c9190792520@palmer-ri-x1c9>
 <20220322012617.3517297-1-maskray@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220322012617.3517297-1-maskray@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220321_184923_049040_7F10F762 
X-CRM114-Status: GOOD (  20.51  )
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

On Mon, Mar 21, 2022 at 06:26:17PM -0700, Fangrui Song wrote:
> On ELF, (NOLOAD) sets the section type to SHT_NOBITS[1]. It is conceptually
> inappropriate for .plt, .got, and .got.plt sections which are always
> SHT_PROGBITS.
> 
> In GNU ld, if PLT entries are needed, .plt will be SHT_PROGBITS anyway
> and (NOLOAD) will be essentially ignored. In ld.lld, since
> https://reviews.llvm.org/D118840 ("[ELF] Support (TYPE=<value>) to
> customize the output section type"), ld.lld will report a `section type
> mismatch` error (later changed to a warning). Just remove (NOLOAD) to
> fix the warning.
> 
> [1] https://lld.llvm.org/ELF/linker_script.html As of today, "The
> section should be marked as not loadable" on
> https://sourceware.org/binutils/docs/ld/Output-Section-Type.html is
> outdated for ELF.
> 
> Link: https://github.com/ClangBuiltLinux/linux/issues/1597
> Fixes: ab1ef68e5401 ("RISC-V: Add sections of PLT and GOT for kernel module")
> Reported-by: Nathan Chancellor <nathan@kernel.org>
> Signed-off-by: Fangrui Song <maskray@google.com>

Thank you for the resend! I think the Fixes: tag you chose is more
accurate than Palmer's suggested one. Same tags as v1, if Palmer would
not mind taking them while applying:

Cc: stable@vger.kernel.org
Reviewed-by: Nathan Chancellor <nathan@kernel.org>
Tested-by: Nathan Chancellor <nathan@kernel.org>

> ---
>  arch/riscv/include/asm/module.lds.h | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/arch/riscv/include/asm/module.lds.h b/arch/riscv/include/asm/module.lds.h
> index 4254ff2ff049..1075beae1ac6 100644
> --- a/arch/riscv/include/asm/module.lds.h
> +++ b/arch/riscv/include/asm/module.lds.h
> @@ -2,8 +2,8 @@
>  /* Copyright (C) 2017 Andes Technology Corporation */
>  #ifdef CONFIG_MODULE_SECTIONS
>  SECTIONS {
> -	.plt (NOLOAD) : { BYTE(0) }
> -	.got (NOLOAD) : { BYTE(0) }
> -	.got.plt (NOLOAD) : { BYTE(0) }
> +	.plt : { BYTE(0) }
> +	.got : { BYTE(0) }
> +	.got.plt : { BYTE(0) }
>  }
>  #endif
> -- 
> 2.35.1.894.gb6a874cedc-goog
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
