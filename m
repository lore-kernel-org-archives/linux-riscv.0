Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C52FC54EE9
	for <linux-riscv@archiver.kernel.org>; Tue, 13 Sep 2022 12:00:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JX3Y41n+QZ2dygPBRuerwGHC+pYtoEKxnoEeuJGj6G0=; b=HyoVavvZGxp8G5
	mgg9u+xvlfP1IVi+WXgDk5KNzWUjI/jlBKzLt3CIQOpxpT2d0XZJURi2jJleC6Jo6zEVPkNRAhsye
	tCMOZ2mBmkPrPYcSZGEuvPGsIrwzyeWvjdyJxtps/8Ic0gH3uAKIFmeN9Mdt4zxom2waicvYI86Qf
	UoLDVzj427ojcg2+XdEmu9LdwK9NL+hTk05FelMB3MZCK7keSCIML6hzMfXKdSoniHvl8QqKyOH+N
	xCv/FcfTbF/CX6ES/h8ZDiSmbxMBP6Pl4Ytf/khUrVMWtCiXcO0Q9UHi5z9EYtkQ0FNwuaDbEg0h9
	am1TG9X4uZfgUMGD312Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oY4aY-009U6I-Uw; Tue, 13 Sep 2022 12:00:26 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oY4aW-009U5f-Mx
	for linux-riscv@lists.infradead.org; Tue, 13 Sep 2022 12:00:25 +0000
Received: from [185.122.133.20] (helo=phil.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1oY4aH-0004d9-8j; Tue, 13 Sep 2022 14:00:09 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: linux-kernel@vger.kernel.org, Randy Dunlap <rdunlap@infradead.org>
Cc: Randy Dunlap <rdunlap@infradead.org>, Wei Fu <wefu@redhat.com>, Liu Shaohua <liush@allwinnertech.com>, Guo Ren <guoren@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, linux-riscv@lists.infradead.org
Subject: Re: [PATCH] riscv: fix RISCV_ISA_SVPBMT kconfig dependency warning
Date: Tue, 13 Sep 2022 14:00:08 +0200
Message-ID: <3122575.5fSG56mABF@phil>
In-Reply-To: <20220709014929.14221-1-rdunlap@infradead.org>
References: <20220709014929.14221-1-rdunlap@infradead.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220913_050024_755585_FB52EE7E 
X-CRM114-Status: GOOD (  13.70  )
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

Hi Palmer,

Am Samstag, 9. Juli 2022, 03:49:29 CEST schrieb Randy Dunlap:
> RISCV_ISA_SVPBMT selects RISCV_ALTERNATIVE which depends on !XIP_KERNEL.
> Therefore RISCV_ISA_SVPBMT should also depend on !XIP_KERNEL so
> quieten this kconfig warning:
> 
> WARNING: unmet direct dependencies detected for RISCV_ALTERNATIVE
>   Depends on [n]: !XIP_KERNEL [=y]
>   Selected by [y]:
>   - RISCV_ISA_SVPBMT [=y] && 64BIT [=y] && MMU [=y]
> 
> Fixes: ff689fd21cb1 ("riscv: add RISC-V Svpbmt extension support")
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>

I think this should also be applied as fix?

Thanks
Heiko


> Cc: Wei Fu <wefu@redhat.com>
> Cc: Liu Shaohua <liush@allwinnertech.com>
> Cc: Guo Ren <guoren@kernel.org>
> Cc: Heiko Stuebner <heiko@sntech.de>
> Cc: Paul Walmsley <paul.walmsley@sifive.com>
> Cc: Palmer Dabbelt <palmer@dabbelt.com>
> Cc: Albert Ou <aou@eecs.berkeley.edu>
> Cc: linux-riscv@lists.infradead.org
> ---
>  arch/riscv/Kconfig |    1 +
>  1 file changed, 1 insertion(+)
> 
> --- a/arch/riscv/Kconfig
> +++ b/arch/riscv/Kconfig
> @@ -362,6 +362,7 @@ config RISCV_ISA_C
>  config RISCV_ISA_SVPBMT
>  	bool "SVPBMT extension support"
>  	depends on 64BIT && MMU
> +	depends on !XIP_KERNEL
>  	select RISCV_ALTERNATIVE
>  	default y
>  	help
> 





_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
