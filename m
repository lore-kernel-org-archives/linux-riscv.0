Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6017C4332F
	for <linux-riscv@archiver.kernel.org>; Mon, 17 Oct 2022 15:49:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eMvbTbKnZhQ/gzMINaC8RBm9duurMC6ZrBrFYZtp24k=; b=z8Ap4jcZaR5eTD
	sdTBT869NOinCsL8p6bdJ7I2JmlRQoVU84dNaSnGDy4ZC4DiRG4TYWGJ4TvkiFSjRoy5m+POpxILr
	jYILFfJykJz2jkQwgPhPOZYq8clBWDYHHRnMJG9FRe3YmQHKMmO2AmKxAiut/fJYjDH7jSV6qApkI
	ZkYc440EGe1GvrDDwYU2WnTBWRfr4oBC1Qt+krq4L5BfHAaJy2waNxNVtlsezMHsGMHm5vzjm1x/E
	tjB6WexqefN62w1QmoBP11foWH7dee48EOoffUvjj0WOoJLqAQeXw6mSiIS2yOamOF+CuYbn4+QW3
	Tw4V9TXk6bEiwu8zhsvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1okSN3-00DRzE-C8; Mon, 17 Oct 2022 15:49:41 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1okSMz-00DRuf-GP
	for linux-riscv@lists.infradead.org; Mon, 17 Oct 2022 15:49:39 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 262DEB819A4;
	Mon, 17 Oct 2022 15:49:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A3ED4C433C1;
	Mon, 17 Oct 2022 15:49:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1666021774;
	bh=MqVqLQZ4tUx3bRzkC0PKqp7iZIaWBT992TZDgPbTCvU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=D3tfZqrE+Deib1CyDWQWUCvw2+hMET3M3bR9BxpvtUcFeX7TgM1oU1gdPVgLlM8iF
	 dz9zbSox13sVh8OiOQ9vp89xNrJcQmwUyQfTBAiipCK9t0EdsWZSm4Xrp5duWg0fJB
	 TcmWkDEuCvlSbGTCBs9N4JnT0Xwf9V3Wo6qFlCpPwLUgtHoEwcV0Vuf8sfY8UD9iV3
	 RnGEoU5TaJZS+FDSq27sAAersK81/kzKckx8unlgJBvYepMyk6ekap0WJIwsz8dc86
	 vUgeapDmbQm3kzV7SK72AYMKmVgi/s4iROHb7RXAkJm7Q5Qm2xg3j4q1HbWI/taoYj
	 3L+rPoocILL8w==
Date: Mon, 17 Oct 2022 16:49:30 +0100
From: Conor Dooley <conor@kernel.org>
To: Yang Yingliang <yangyingliang@huawei.com>
Cc: linux-riscv@lists.infradead.org, yash.shah@sifive.com,
	palmer@dabbelt.com, paul.walmsley@sifive.com
Subject: Re: [PATCH 2/2] soc: sifive: ccache: fix missing free_irq() in error
 path in sifive_ccache_init()
Message-ID: <Y015irop2kUQ1yjG@spud>
References: <20221017084411.3557098-1-yangyingliang@huawei.com>
 <20221017084411.3557098-2-yangyingliang@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221017084411.3557098-2-yangyingliang@huawei.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221017_084937_718260_F2A8BF7B 
X-CRM114-Status: GOOD (  18.31  )
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

Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

On Mon, Oct 17, 2022 at 04:44:11PM +0800, Yang Yingliang wrote:
> Add missing free_irq() before return error from sifive_ccache_init().
> 
> Fixes: a967a289f169 ("RISC-V: sifive_l2_cache: Add L2 cache controller driver for SiFive SoCs")
> Signed-off-by: Yang Yingliang <yangyingliang@huawei.com>
> ---
>  drivers/soc/sifive/sifive_ccache.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/soc/sifive/sifive_ccache.c b/drivers/soc/sifive/sifive_ccache.c
> index 25019c16d8ae..98269d056728 100644
> --- a/drivers/soc/sifive/sifive_ccache.c
> +++ b/drivers/soc/sifive/sifive_ccache.c
> @@ -240,7 +240,7 @@ static int __init sifive_ccache_init(void)
>  				 NULL);
>  		if (rc) {
>  			pr_err("Could not request IRQ %d\n", g_irq[i]);
> -			goto err_unmap;
> +			goto err_free_irq;
>  		}
>  	}
>  
> @@ -254,6 +254,9 @@ static int __init sifive_ccache_init(void)
>  #endif
>  	return 0;
>  
> +err_free_irq:
> +	while (--i >= 0)
> +		free_irq(g_irq[i], NULL);
>  err_unmap:
>  	iounmap(ccache_base);
>  	return rc;
> -- 
> 2.25.1
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
