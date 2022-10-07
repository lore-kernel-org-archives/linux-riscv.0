Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2054C433FE
	for <linux-riscv@archiver.kernel.org>; Fri,  7 Oct 2022 09:38:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vJlJoB2Go5WNhfe7lJx6dn8BhRjwyV8nOtq1aozMi98=; b=ndP9HM4LuV0GlB
	UjiFOthekJIv5aSn1S1aWXNte5OgWr7O64yZvBMeEojSm3+NWVIjlD6I5pVEGUXDMUnKNGSYysk2W
	bOp9KCs3fvIJkwZtpQMOpWyXoY+tO0yn5onk5dZsbC1iyFsc3giWMLcAbut8n58ErZFYxPGyIh1fa
	WQhePT/PRT08UeG7h++u2z7NUJbDVlI5BQiWVqtYee17R16t522CXC21kNnxW2wT6XyTYYuBgRYIq
	Gmxa1ykhG1PZd7EM+gXk6wcDKXYmwGRRuHwGhFuTNPmrlbkdUTBPnxkQFtMxc+nMC84jJXNpSTyGA
	G576WvGaApID0a1syw6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ogjo5-008MNl-I3; Fri, 07 Oct 2022 09:38:13 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ogjo2-008MLM-SO
	for linux-riscv@lists.infradead.org; Fri, 07 Oct 2022 09:38:12 +0000
Received: from ip5b412258.dynamic.kabel-deutschland.de ([91.65.34.88] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1ogjo0-0006Ah-NY; Fri, 07 Oct 2022 11:38:08 +0200
From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, linux-riscv@lists.infradead.org
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, Jisheng Zhang <jszhang@kernel.org>
Subject: Re: [PATCH 2/8] riscv: cpufeature: detect RISCV_ALTERNATIVES_EARLY_BOOT earlier
Date: Fri, 07 Oct 2022 11:38:08 +0200
Message-ID: <2057655.bB369e8A3T@diego>
In-Reply-To: <20221006070818.3616-3-jszhang@kernel.org>
References: <20221006070818.3616-1-jszhang@kernel.org> <20221006070818.3616-3-jszhang@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221007_023810_958786_151B8E0B 
X-CRM114-Status: GOOD (  15.27  )
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

Am Donnerstag, 6. Oktober 2022, 09:08:12 CEST schrieb Jisheng Zhang:
> Now, the riscv_cpufeature_patch_func() do nothing in the stage of
> RISCV_ALTERNATIVES_EARLY_BOOT. We can move the detection of "early
> boot" stage earlier.
> 
> In following patch, we will make riscv_cpufeature_patch_func() scans
> all ISA extensions.
> 
> Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
> ---
>  arch/riscv/kernel/cpufeature.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
> index 03611b3ef45e..afa54635c180 100644
> --- a/arch/riscv/kernel/cpufeature.c
> +++ b/arch/riscv/kernel/cpufeature.c
> @@ -307,6 +307,9 @@ void __init_or_module riscv_cpufeature_patch_func(struct alt_entry *begin,
>  	struct alt_entry *alt;
>  	u32 tmp;
>  
> +	if (stage == RISCV_ALTERNATIVES_EARLY_BOOT)
> +		return;
> +

This will work as long as no extension needs early patching,
but we can cross that bridge when this happens :-)

Reviewed-by: Heiko Stuebner <heiko@sntech.de>

>  	for (alt = begin; alt < end; alt++) {
>  		if (alt->vendor_id != 0)
>  			continue;
> 





_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
