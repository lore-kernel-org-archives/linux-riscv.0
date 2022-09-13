Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42141C6FA82
	for <linux-riscv@archiver.kernel.org>; Tue, 13 Sep 2022 11:39:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fREu9ePoKzt9i/aXHPllXDm0hv6+F16leIVhpPWhBN0=; b=T+z+Ci9f+xq7pe
	4xsr67aZ9p2OTjRMUyFKzOSMeyMsaWagBaJo12upgGkbxkYE2LfSklwE+Y30FAB8qGhJeRbPWUiJY
	FtexTdX1kYuYh1qQIp9HtwMp0G6Tv6obWUwooTp+nQD/4dFuL/ivr7QL/hrX0/Zen0ft/l0/TkDac
	pBZbUAO+PetkMJhzWlCXM9TLsIaA34aBAu3xKldBYyjR4s3QP0bOCrM84ZJ8TkMtMvjq89iz2lVKI
	bR8owLzMfHUrg3R7eFr6/zRXM5t2qRbLgxI7heBqskqn7oQ4m8clvQSmVk2XsGBgjMBv3F1fpc3gQ
	4IW/7606xGbdLOpwl5+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oY4Fi-008v8Y-0W; Tue, 13 Sep 2022 11:38:54 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oY4Ff-008uOR-I2
	for linux-riscv@lists.infradead.org; Tue, 13 Sep 2022 11:38:52 +0000
Received: from [185.122.133.20] (helo=phil.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1oY4FR-0004VS-Mb; Tue, 13 Sep 2022 13:38:37 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu
Cc: samuel@sholland.org, guoren@kernel.org, linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, kernel test robot <lkp@intel.com>
Subject: Re: [PATCH] riscv: make t-head erratas depend on MMU
Date: Tue, 13 Sep 2022 13:38:36 +0200
Message-ID: <3452718.iIbC2pHGDl@phil>
In-Reply-To: <20220907154932.2858518-1-heiko@sntech.de>
References: <20220907154932.2858518-1-heiko@sntech.de>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220913_043851_657595_0CE399C1 
X-CRM114-Status: GOOD (  16.43  )
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

Am Mittwoch, 7. September 2022, 17:49:32 CEST schrieb Heiko Stuebner:
> Both basic extensions of SVPBMT and ZICBOM depend on CONFIG_MMU.
> Make the T-Head errata implementations of the similar functionality
> also depend on it to prevent build errors.
> 
> Fixes: a35707c3d850 ("riscv: add memory-type errata for T-Head")
> Fixes: d20ec7529236 ("riscv: implement cache-management errata for T-Head SoCs")
> Reported-by: kernel test robot <lkp@intel.com>
> Signed-off-by: Heiko Stuebner <heiko@sntech.de>

could you take a look at this too please?

As it would make the lkp robot happy :-)


Thanks
Heiko

> ---
>  arch/riscv/Kconfig.erratas | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/riscv/Kconfig.erratas b/arch/riscv/Kconfig.erratas
> index 6850e9389930..f3623df23b5f 100644
> --- a/arch/riscv/Kconfig.erratas
> +++ b/arch/riscv/Kconfig.erratas
> @@ -46,7 +46,7 @@ config ERRATA_THEAD
>  
>  config ERRATA_THEAD_PBMT
>  	bool "Apply T-Head memory type errata"
> -	depends on ERRATA_THEAD && 64BIT
> +	depends on ERRATA_THEAD && 64BIT && MMU
>  	select RISCV_ALTERNATIVE_EARLY
>  	default y
>  	help
> @@ -57,7 +57,7 @@ config ERRATA_THEAD_PBMT
>  
>  config ERRATA_THEAD_CMO
>  	bool "Apply T-Head cache management errata"
> -	depends on ERRATA_THEAD
> +	depends on ERRATA_THEAD && MMU
>  	select RISCV_DMA_NONCOHERENT
>  	default y
>  	help
> 





_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
