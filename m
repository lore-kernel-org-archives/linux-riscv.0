Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 504D1606A31C
	for <linux-riscv@archiver.kernel.org>; Mon, 16 Nov 2026 15:25:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=k/conno7;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Qt41inug
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:References:In-Reply-To:
	Message-Id:Cc:To:From:Date:MIME-Version:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Unsubscribe-Post:List-Owner;
	bh=Ms2BBuOFdih9QhUZr0jFDf3yMEtOEV4IxxXr6LM6bks=; b=k/conno7cS0afadeo3/TBLsGPO
	0D8BT/y+gBs53o3a2llg7MMAxzjU881BbO9TiBi8pxUTH6Oglds/8shSA/vd8XHnjsOROUWgBv41U
	gfe8hr2SuyqrYxo9xrwPvuHVUbaVutzQj3Jbe8rhTAbyZt3gNejYAsp7d0uU1AjdD2wZQKvdhXOEq
	hYd8ZCtQhjnrQPpDSfqD+BIwmIDbeyeEeaMGp04tdKnxpkBX9pG4Uic8ZEhjyuAB8ro0fUna/7REp
	Ogt/Giy37eRDm5pWGf+BAq5SxuCI/Gdo8XBXfCii2ni+tdJJWXib/s9j+KGe6AVUncI4mPMY2Zdvo
	m/mHTkUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSyZl-000000032Sv-1pIF;
	Mon, 16 Nov 2026 15:24:57 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSyZj-000000032Rx-2sPm
	for linux-riscv@lists.infradead.org;
	Mon, 16 Nov 2026 15:24:55 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 1EF8E43500;
	Mon, 16 Nov 2026 15:24:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 84FEA1F000C4;
	Mon, 16 Nov 2026 15:24:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794842695;
	bh=SQgNNYZctf5FpA2M4txN7IOuCvrxTiw8LIVi0N2ihsA=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject;
	b=Qt41inugyO+YMMl+IUPN+c1C6axnYoaybvU/HaNjMu8DPANuNg8xmyS2YQlzZPcUv
	 lrDYjV3nTD63X8kTDCQXWwDT5HOk0908C3nrRAsU8Oiu47LlBB4UTmnxaMriczGpch
	 jr5urR8w5ansJDfsKRg5ihzrAj6MQlztfTtiFxVCP6iArxh8yqAkFw2JTknN+5h6+q
	 +0FPGSmjR/EJp0cMVYMSrBO6NctvE5/Mrk0n1zu0WkpgXMi8c/rwwGHye4Szn/r97K
	 aRZfN8Ftk6tNypMyw/r4T70O8eR8pfwZB5q9EXo+MeOs3cbjPkv/Cz0aQSt87u1k1j
	 No732BTyUsVCQ==
Received: from ams-compute-02.internal (ams-compute-02.internal [10.64.2.62])
	by mailfauth.ams.internal (Postfix) with ESMTP id B58C5198003A;
	Mon, 16 Nov 2026 10:24:52 -0500 (EST)
Received: from ams-imap-11 ([10.64.2.31])
  by ams-compute-02.internal (MEProxy); Mon, 16 Nov 2026 10:24:52 -0500
X-ME-Sender: <xms:QiD7agEY-JiZDGhi0B6_9iLlA2jpbvAwi5Lp6kC3AWaATtWQAqlF8Q>
    <xme:QiD7akLyreEfmFrfplJFJvfCXpsNpOHrMQ_laM_sg7CN01LX5nDHp3D054tZzCUB2
    4u5-Xvnhq9IlenYaeQfHpZYojFmS7_F4IYaGBowpFUq1REm5YzHRtwyJQ>
X-ME-Proxy-Cause: dmFkZTEbARYhAcVj2tNtGW1XrhC903+yf86yrDn1pfQdR4yNTrf/tWqOeorYHciIQjODhw
    n1ctFZKCvIpNgwwfxks76ycfBuiFhVW4YABKWjMNSbl7GEIDsqjKdwAZqzNUs8WJfMmnq5
    9OlpiJx1Xl+yylI68XhfMx8PYGszQD0MOthC5h/olPTzjDEq8lu3WVZ3qZtm9iYM4jOAc8
    jWKP952ufRjp4+bnR91GQpi7idMeMoMID6N7IaNZT+GRiH+gQv+LJsBcAxX+6LJHpuqWeV
    Hty1chFdNVDwAqPypttpBdVoRC/zX0Orxg48i3lQXpXZp0/LC9T5FDIEVI2zQQzGHUGsXt
    v1Ey64Zoof1zRQbwyqglPQDu1jFQne9Ixo7tKA07pGg4Y//jMqwfJvz7SgPFKMMnOKcJ91
    NFC6WN+Wc67YX1NFQoBsYMGPEKMnowanzvt+j1IAq8JrM+V7mQljIs247Jv59Ua8AeyaB1
    ZO54exQ++bPornqPYzqVZW46hR6cbwpRiHPYGySNLRC5rSuf6Uyg79JJiT6+O6z4HaolbR
    zop+sSSKwdax1XO5xRRAqQ9PoEPn55FLSE12jiELLpmB6QavEWsNHLJ6RAIxqmFi8m8UuC
    Fz56GWkNtfk8ZSrPZUgl1eUhovVBKSudgOSaofT2VCd4dOobdmHkeTOpy5Pw
X-ME-Proxy: <xmx:RCD7akrMrXupD8FQyeUv4p4MBUtGe2n33pRC-QbUqmLeau5dHckDEA>
    <xmx:RCD7aptyK92WiL5JwIiB39MeemjW7zchtnzPxoG2-STsTw1_Jl3BZA>
    <xmx:RCD7avbL59hwtOOiGG6Yb4PFZVCkx94IDK9otSkIiqNjwPBYh8kwhA>
    <xmx:RCD7aob5oWtC4PVSkETmnsBQ4QgQ7o4KdRqr0xq5VoWRBoI34UE5xg>
    <xmx:RCD7aokw7L0jODpoPFIDy95IAX0kcvr4LjdejwM-17SvAb_kWTxiLIUC>
Feedback-ID: ice86485a:Fastmail
Received: by mailuser.ams.internal (Postfix, from userid 501)
	id AD507F80093; Mon, 16 Nov 2026 10:24:50 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Date: Mon, 16 Nov 2026 16:24:29 +0100
From: "Ard Biesheuvel" <ardb@kernel.org>
To: "Ard Biesheuvel" <ardb+git@google.com>,
 linux-arm-kernel@lists.infradead.org
Cc: "Paul Walmsley" <pjw@kernel.org>, "Palmer Dabbelt" <palmer@dabbelt.com>,
 "Albert Ou" <aou@eecs.berkeley.edu>, "Alexandre Ghiti" <alex@ghiti.fr>,
 linux-riscv@lists.infradead.org
Message-Id: <103cdf04-1da6-40e7-b987-37f88a03e6b7@app.fastmail.com>
In-Reply-To: <20261111164345.4059964-8-ardb+git@google.com>
References: <20261111164345.4059964-5-ardb+git@google.com>
 <20261111164345.4059964-8-ardb+git@google.com>
Subject: Re: [PATCH 3/3] riscv: Rename __init_text_end to __inittext_end like other
 archs
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1



On Wed, 11 Nov 2026, at 17:43, Ard Biesheuvel wrote:
> From: Ard Biesheuvel <ardb@kernel.org>
>
> Align RISC-V with arm64, LoongArch and x86, and drop the underscore
> between 'init' and 'text' in the section markers. This allows the value
> to be captured by generic EFI stub code that can be shared between all
> those architectures.
>
> Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
> ---
>  arch/riscv/include/asm/sections.h         | 2 +-
>  arch/riscv/kernel/image-vars.h            | 2 +-
>  arch/riscv/kernel/vmlinux.lds.S           | 4 ++--
>  drivers/firmware/efi/libstub/riscv-stub.c | 2 +-
>  4 files changed, 5 insertions(+), 5 deletions(-)
>
> diff --git a/arch/riscv/include/asm/sections.h 
> b/arch/riscv/include/asm/sections.h
> index a393d5035c54..4a882a28f414 100644
> --- a/arch/riscv/include/asm/sections.h
> +++ b/arch/riscv/include/asm/sections.h
> @@ -11,7 +11,7 @@
>  extern char _start[];
>  extern char _start_kernel[];
>  extern char __init_data_begin[], __init_data_end[];
> -extern char __init_text_begin[], __init_text_end[];
> +extern char __inittext_begin[], __inittext_end[];
>  extern char __alt_start[], __alt_end[];
>  extern char __exittext_begin[], __exittext_end[];
> 
> diff --git a/arch/riscv/kernel/image-vars.h b/arch/riscv/kernel/image-vars.h
> index 7b44b94f1283..bf703eba3fa5 100644
> --- a/arch/riscv/kernel/image-vars.h
> +++ b/arch/riscv/kernel/image-vars.h
> @@ -27,7 +27,7 @@ __efistub__start		= _start;
>  __efistub__start_kernel		= _start_kernel;
>  __efistub__end			= _end;
>  __efistub__edata		= _edata;
> -__efistub___init_text_end	= __init_text_end;
> +__efistub___inittext_end	= __inittext_end;
>  #if defined(CONFIG_EFI_EARLYCON) || defined(CONFIG_SYSFB)
>  __efistub_sysfb_primary_display	= sysfb_primary_display;
>  #endif
> diff --git a/arch/riscv/kernel/vmlinux.lds.S b/arch/riscv/kernel/vmlinux.lds.S
> index 9849a3e4d102..ba939c7365b2 100644
> --- a/arch/riscv/kernel/vmlinux.lds.S
> +++ b/arch/riscv/kernel/vmlinux.lds.S
> @@ -46,7 +46,7 @@ SECTIONS
> 
>  	. = ALIGN(SECTION_ALIGN);
>  	__init_begin = .;
> -	__init_text_begin = .;
> +	__inittext_begin = .;
>  	.init.text : AT(ADDR(.init.text) - LOAD_OFFSET) ALIGN(SECTION_ALIGN) { \
>  		_sinittext = .;						\
>  		INIT_TEXT						\
> @@ -72,7 +72,7 @@ SECTIONS
>  	}
>  	__exittext_end = .;
> 
> -	__init_text_end = .;
> +	__inittext_end = .;
>  	. = ALIGN(SECTION_ALIGN);
>  #ifdef CONFIG_EFI
>  	. = ALIGN(PECOFF_SECTION_ALIGNMENT);

This hunk should also move __inittext_end after the following
#endif so that the symbol ends up page aligned.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
