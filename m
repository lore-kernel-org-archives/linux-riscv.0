Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E97FDC433FE
	for <linux-riscv@archiver.kernel.org>; Sun, 13 Nov 2022 17:16:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vVjgUv3DaL0sDG7ZOohhj0UOVH/6UUoXsQVR47D91pk=; b=Zf+bc2hIcgX+Dr
	1aOAmOdymTg4d0T//jzUa2GgIDt+FAPn8/f8Z/ULSZs3uvFCinj2SH4IPxYyXtZhsWAHT9kHUDPVk
	N0E1QSwkrXiLwVb3bHZjMW8ID2OGhjqgRidf4IEx6rkRj5/RdHEYAOXvbryeSXAAB9GZ8Dtp1vHjM
	N7HGuuE84B8icT/th6/nq3aAbVrOqV8XHGg06kZ51p0aGH27xwUaktgZa2iTjzZYf7oiTP+s/H9hW
	dBTrCJUuppgsfVUdJ2v0LLdW0S2YQAtJpq4hmBrbSM9MH5trdxtimduIduJFHNLX7UeZav/mVXLFp
	mlEs/JTAVNT5UL4Lp4EA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ouGak-00Cbxo-Fx; Sun, 13 Nov 2022 17:16:22 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ouGah-00Cbwg-LT
	for linux-riscv@lists.infradead.org; Sun, 13 Nov 2022 17:16:21 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sin.source.kernel.org (Postfix) with ESMTPS id 34BEBCE0B30;
	Sun, 13 Nov 2022 17:16:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 95374C433C1;
	Sun, 13 Nov 2022 17:16:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1668359774;
	bh=z8zuMc3C8+0sh/HqHXHE65kV2rysHKCWcwtIkQseDe4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=cX+Wihr87tECA4kBz6ldppFeL1cM2lsB5ZTzT/D+znaIPDcYIbZilxqBIWte6PSNB
	 sq03zzxCyQ9Q40Dh0P1OLWamVBSfcJ+PY3qfqV4UfXCQNCYov1O3QPkewD6wjY49Bt
	 LrQvLDf78j9RK+W1DulffYSssqosvEEbCy+p3TUe9hrZe86BHjb4b4HdrYr3TjR6nD
	 ydYTqDF9qr6HJCW18+tNtYPT7WWT3isjjbTYTbxjJdlGRPtadCPmv+79bGMFux/oNm
	 Gh4wROmI4yk7Nqvd6e6oJAqCkB53j8KlY7n7rW/QsBCGbmLf6wTrJI/Rzixe9UTWO9
	 QXNQcDsaBK3Zg==
Date: Sun, 13 Nov 2022 17:16:10 +0000
From: Conor Dooley <conor@kernel.org>
To: Heiko Stuebner <heiko@sntech.de>
Cc: linux-riscv@lists.infradead.org, palmer@dabbelt.com,
	christoph.muellner@vrull.eu, prabhakar.csengg@gmail.com,
	philipp.tomsich@vrull.eu, ajones@ventanamicro.com,
	emil.renner.berthing@canonical.com,
	Heiko Stuebner <heiko.stuebner@vrull.eu>
Subject: Re: [PATCH 1/7] efi/riscv: libstub: mark when compiling libstub
Message-ID: <Y3EmWsGanb4jf35F@spud>
References: <20221110164924.529386-1-heiko@sntech.de>
 <20221110164924.529386-2-heiko@sntech.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221110164924.529386-2-heiko@sntech.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221113_091619_916790_36FD5D2A 
X-CRM114-Status: GOOD (  19.88  )
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

On Thu, Nov 10, 2022 at 05:49:18PM +0100, Heiko Stuebner wrote:
> From: Heiko Stuebner <heiko.stuebner@vrull.eu>
> 
> We want to runtime-optimize some core functions (str*, mem*)
> but not have this leak into libstub. Instead libstub
> for the short while it's running should just use the generic

Totally pedantic reword, mostly b/c I am an eejit and confused myself
the first time reading this:

"Instead, libstub, for the short while it's running, should just use
the generic implementation."

> implementation.
> 
> To be able to determine whether functions are getting compiled
> as part of libstub or not, add a compile-flag we can check
> via #ifdef.

Exempting the stub makes sense to me given when it runs. What's the
actual downside of not exempting it though?

> Signed-off-by: Heiko Stuebner <heiko.stuebner@vrull.eu>
> ---
>  drivers/firmware/efi/libstub/Makefile | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/firmware/efi/libstub/Makefile b/drivers/firmware/efi/libstub/Makefile
> index b1601aad7e1a..39c8e3da1937 100644
> --- a/drivers/firmware/efi/libstub/Makefile
> +++ b/drivers/firmware/efi/libstub/Makefile
> @@ -25,7 +25,7 @@ cflags-$(CONFIG_ARM)		:= $(subst $(CC_FLAGS_FTRACE),,$(KBUILD_CFLAGS)) \
>  				   -fno-builtin -fpic \
>  				   $(call cc-option,-mno-single-pic-base)
>  cflags-$(CONFIG_RISCV)		:= $(subst $(CC_FLAGS_FTRACE),,$(KBUILD_CFLAGS)) \
> -				   -fpic
> +				   -fpic -DRISCV_EFISTUB
>  cflags-$(CONFIG_LOONGARCH)	:= $(subst $(CC_FLAGS_FTRACE),,$(KBUILD_CFLAGS)) \
>  				   -fpie
>  
> -- 
> 2.35.1
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
