Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89DF2CD1284
	for <linux-riscv@archiver.kernel.org>; Thu,  4 Apr 2024 15:33:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UL++nkqzhjxlrXvA8YsIrn6Ng8lHX9vM6IAgj6ypuL8=; b=EOPlkw4IJmfO2W
	ObQtAHmAxX4pZbYRgEazj/sOhtGbf1g0rLq6i4+c0d5hePS4abl9jitUVbnbocyGNIqLaNhXrIBky
	bEutxPXNXJj90eshQ7WO8Z8XU8jPADrEN4NkjpBpFSGXWWFyEiV3oLNNAL8hZnOoBmm3Y0t8CH1e3
	uAwX/TYMfeQ+yMlUccLGmeUstlA5uorTCTILb6BdkGN6fCP51t7+p1xf9etBm3oYAzyPdrRl/VlA7
	1gzw3y6F5iJ6WtvTUacCAkjXsKhaQJ37pu4XPuE3p0qEcY6DuB+i1YjzTjp08W9UDNUHJR7x6hn0T
	//h4diQaA6wBx9CXOk+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rsP5Q-00000003FlI-0YUN;
	Thu, 04 Apr 2024 15:33:08 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rsP5M-00000003Fk5-3C7c
	for linux-riscv@lists.infradead.org;
	Thu, 04 Apr 2024 15:33:06 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 10975CE32D6;
	Thu,  4 Apr 2024 15:33:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 96471C433F1;
	Thu,  4 Apr 2024 15:33:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1712244781;
	bh=+ihKIoYDSDX/L3rUTACaGuGGhf6TLUZ/+4aywDsnmIM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PQLRQoQ8m3JLC2Td7LqTr9Gyx8iw2LqCI4y/rdO3jtZZbS+Jx+i1K/p9KSnZBmeME
	 +c29ns5saD6bgCr/l+2SX/f4nFyiiSIxm/5E9rcRe8PW0ZE7NZpGIwjxhx5E89VL15
	 82t9Vd7JFQgbffAMgIwa0aZMPBP883Z6LDkVPEtCDYG8PJHV9dhQXrPGeZxtYv/B+S
	 TdPsbPup6lVeq9b/AlKD3BSDhXEVHVqOEnkLN8LdjH60jD/0MagUPdIpfuABSjbPKn
	 Ca++IKiyI5MdVDhXG+zD+xnTEBgDZk67+RLYMxMdw2G32RjOdiVttZUzTgVOGqjsQP
	 tS4iFvBCBEjKg==
Date: Thu, 4 Apr 2024 08:32:58 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Conor Dooley <conor@kernel.org>
Cc: linux-riscv@lists.infradead.org,
	Conor Dooley <conor.dooley@microchip.com>, stable@vger.kernel.org,
	Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Wedson Almeida Filho <wedsonaf@gmail.com>,
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org,
	Sami Tolvanen <samitolvanen@google.com>,
	Kees Cook <keescook@chromium.org>, llvm@lists.linux.dev
Subject: Re: [PATCH v3] rust: make mutually exclusive with CFI_CLANG
Message-ID: <20240404153258.GA852748@dev-arch.thelio-3990X>
References: <20240404-providing-emporium-e652e359c711@spud>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240404-providing-emporium-e652e359c711@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240404_083305_286296_8CA5ECCB 
X-CRM114-Status: GOOD (  23.54  )
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

On Thu, Apr 04, 2024 at 03:17:02PM +0100, Conor Dooley wrote:
> From: Conor Dooley <conor.dooley@microchip.com>
> 
> On RISC-V and arm64, and presumably x86, if CFI_CLANG is enabled,
> loading a rust module will trigger a kernel panic. Support for
> sanitisers, including kcfi (CFI_CLANG), is in the works, but for now
> they're nightly-only options in rustc. Make RUST depend on !CFI_CLANG
> to prevent configuring a kernel without symmetrical support for kfi.
> 
> Fixes: 2f7ab1267dc9 ("Kbuild: add Rust support")
> cc: stable@vger.kernel.org
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>

Acked-by: Nathan Chancellor <nathan@kernel.org>

It seems like this won't be forgotten about but if there is not already
an issue open for this somewhere, it would be good to have one, since we
obviously want this for both C and Rust code.

As a general meta comment not directed at anyone in particualr, I think
these 'depends on !' should all have some sort of comment or description
as to why they are disabled. I can infer from most of them but it would
still be good to be explicit, especially since someone might want to
work on fixing the ones that are due to missing support and such.

> ---
> Sending this one on its own, there's no explicit dep on this for the
> riscv enabling patch, v3 to continue the numbering from there. Nothing
> has changed since v2.
> 
> CC: Miguel Ojeda <ojeda@kernel.org>
> CC: Alex Gaynor <alex.gaynor@gmail.com>
> CC: Wedson Almeida Filho <wedsonaf@gmail.com>
> CC: linux-kernel@vger.kernel.org (open list)
> CC: rust-for-linux@vger.kernel.org
> CC: Sami Tolvanen <samitolvanen@google.com>
> CC: Kees Cook <keescook@chromium.org>
> CC: Nathan Chancellor <nathan@kernel.org>
> CC: llvm@lists.linux.dev
> ---
>  init/Kconfig | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/init/Kconfig b/init/Kconfig
> index aa02aec6aa7d..ad9a2da27dc9 100644
> --- a/init/Kconfig
> +++ b/init/Kconfig
> @@ -1899,6 +1899,7 @@ config RUST
>  	bool "Rust support"
>  	depends on HAVE_RUST
>  	depends on RUST_IS_AVAILABLE
> +	depends on !CFI_CLANG
>  	depends on !MODVERSIONS
>  	depends on !GCC_PLUGINS
>  	depends on !RANDSTRUCT
> -- 
> 2.43.0
> 
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
