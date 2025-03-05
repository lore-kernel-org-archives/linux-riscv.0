Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9103FC28B22
	for <linux-riscv@archiver.kernel.org>; Wed,  5 Mar 2025 12:48:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WCwkT9vqpLVDOGkEfcnsm9mitewi5kKKfeNohjtGa0g=; b=DTkoh0a7wD2oFO
	YDaadfJbid+DGF9LM7eddzRrz5aFVudgZeEId+gpKAKvXZhTnHbY4eMdgdSmtre2a9y+UkJKgSGgw
	NyjIoaAAOCRx5Rcw2mzwq4VkXQKqx8gFkjBf8hWDyKfKZQQv+fzpPjLuWtAo4eA441wfZ5mzffmbE
	2lRl67aj/NflQzDtrBDOqfKlTqX3LdaGwkj0SbZFu8pCHB2cMS/e/65HMNsSG3v9Ev3DRS6MCj1ev
	CHN61VQVlbRRvbSLLOx0r7sEIzIFmpkaHfQmpBX1O2fQjJfzWqyG5woyXIpd80e3KLiqnL46efKSD
	H7O0YgSPZ9pL+4Odjsjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpoB1-000000084M9-0gjn;
	Wed, 05 Mar 2025 12:48:43 +0000
Received: from woodpecker.gentoo.org ([140.211.166.183] helo=smtp.gentoo.org)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpm5g-00000007hnl-3Vcn
	for linux-riscv@lists.infradead.org;
	Wed, 05 Mar 2025 10:35:06 +0000
Received: from localhost (unknown [116.232.55.252])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dlan)
	by smtp.gentoo.org (Postfix) with ESMTPSA id 6202733C1EB;
	Wed, 05 Mar 2025 10:35:02 +0000 (UTC)
Date: Wed, 5 Mar 2025 10:34:58 +0000
From: Yixun Lan <dlan@gentoo.org>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [PATCH] pinctrl: spacemit: destroy mutex at driver detach
Message-ID: <20250305103458-GYA63227@gentoo>
References: <20250305102710.52762-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250305102710.52762-1-brgl@bgdev.pl>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250305_023504_895166_B1AAC708 
X-CRM114-Status: GOOD (  14.02  )
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

On 11:27 Wed 05 Mar     , Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> 
> The mutex initialized in probe() is never cleaned up. Use
> devm_mutex_init() to destroy it automatically.
> 
Reviewed-by: Yixun Lan <dlan@gentoo.org>

> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> ---
>  drivers/pinctrl/spacemit/pinctrl-k1.c | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/pinctrl/spacemit/pinctrl-k1.c b/drivers/pinctrl/spacemit/pinctrl-k1.c
> index 59fd555ff38d..67e867b04a02 100644
> --- a/drivers/pinctrl/spacemit/pinctrl-k1.c
> +++ b/drivers/pinctrl/spacemit/pinctrl-k1.c
> @@ -9,6 +9,7 @@
>  #include <linux/seq_file.h>
>  #include <linux/spinlock.h>
>  #include <linux/module.h>
> +#include <linux/mutex.h>
>  
>  #include <linux/pinctrl/pinconf-generic.h>
>  #include <linux/pinctrl/pinconf.h>
> @@ -749,7 +750,10 @@ static int spacemit_pinctrl_probe(struct platform_device *pdev)
>  	pctrl->data = pctrl_data;
>  	pctrl->dev = dev;
>  	raw_spin_lock_init(&pctrl->lock);
> -	mutex_init(&pctrl->mutex);
> +
> +	ret = devm_mutex_init(dev, &pctrl->mutex);
> +	if (ret)
> +		return ret;
>  
>  	platform_set_drvdata(pdev, pctrl);
>  
> -- 
> 2.45.2
> 

-- 
Yixun Lan (dlan)
Gentoo Linux Developer
GPG Key ID AABEFD55

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
