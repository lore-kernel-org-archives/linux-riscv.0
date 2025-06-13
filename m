Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37B55C61DB2
	for <linux-riscv@archiver.kernel.org>; Fri, 13 Jun 2025 09:44:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=leentNWWxmJlAaC6ZmZeW8FvNobptRRRQm4syRmn6n4=; b=AtGntIjlBCig6X
	IVh5sATpfnY+gBdfPrAa0i4+nxvGe4sfzELq3Zp0wLIcsRLfj8qSzUy8dc314pASt2GdQyoGy3j6E
	Ocf3Nz4pVaDRWoxaZfNno32hJZrxeU2JtITDIfFG8UTJ7qn/35daHME6wacR9LooI6sabZD9G+l7o
	EuTBuW90PD0s/7YTCVYj77idqR+npzt0r70D+9sSOITdqP9H0qqhInsigkUKuRkm9YToLc9Rp+8di
	RBvuRCrdA/kWSf0Ayw29LIz4PVVFAgBlOY9TOKf1z3v+biIRSRqppX9p9XmD/2NKCaugks9z+nA+j
	6OLxyDudtLBlYm/GzTnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQ0xZ-0000000Fx7a-0x3q;
	Fri, 13 Jun 2025 09:44:29 +0000
Received: from woodpecker.gentoo.org ([2001:470:ea4a:1:5054:ff:fec7:86e4] helo=smtp.gentoo.org)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQ0n6-0000000FvMN-0lLi
	for linux-riscv@lists.infradead.org;
	Fri, 13 Jun 2025 09:33:41 +0000
Received: from localhost (unknown [116.232.48.232])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dlan)
	by smtp.gentoo.org (Postfix) with ESMTPSA id 6409A342371;
	Fri, 13 Jun 2025 09:33:37 +0000 (UTC)
Date: Fri, 13 Jun 2025 09:33:33 +0000
From: Yixun Lan <dlan@gentoo.org>
To: Vivian Wang <wangruikang@iscas.ac.cn>
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Alex Elder <elder@riscstar.com>, Vivian Wang <uwu@dram.page>,
	linux-gpio@vger.kernel.org, linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] gpio: spacemit: Add missing MODULE_DEVICE_TABLE
Message-ID: <20250613093333-GYA135173@gentoo>
References: <20250613-k1-gpio-of-table-v1-1-9015da8fdfdb@iscas.ac.cn>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250613-k1-gpio-of-table-v1-1-9015da8fdfdb@iscas.ac.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250613_023340_254214_5E4CD961 
X-CRM114-Status: GOOD (  18.44  )
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

Hi Vivian,

On 17:25 Fri 13 Jun     , Vivian Wang wrote:
> The gpio-spacemit-k1 driver can be compiled as a module. Add missing
> MODULE_DEVICE_TABLE so it can be matched by modalias and automatically
> loaded by udev.
> 
> Fixes: d00553240ef8 ("gpio: spacemit: add support for K1 SoC")
> Signed-off-by: Vivian Wang <wangruikang@iscas.ac.cn>
LGTM

Reviewed-by: Yixun Lan <dlan@gentoo.org>

> ---
> This patch is available at:
> 
> https://github.com/dramforever/linux/tree/k1/gpio-of-table/v1
> ---
>  drivers/gpio/gpio-spacemit-k1.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/gpio/gpio-spacemit-k1.c b/drivers/gpio/gpio-spacemit-k1.c
> index f027066365ff8741f99da076d1e7b6339a6c1a22..3cc75c701ec40194e602b80d3f96f23204ce3b4d 100644
> --- a/drivers/gpio/gpio-spacemit-k1.c
> +++ b/drivers/gpio/gpio-spacemit-k1.c
> @@ -278,6 +278,7 @@ static const struct of_device_id spacemit_gpio_dt_ids[] = {
>  	{ .compatible = "spacemit,k1-gpio" },
>  	{ /* sentinel */ }
>  };
> +MODULE_DEVICE_TABLE(of, spacemit_gpio_dt_ids);
>  
>  static struct platform_driver spacemit_gpio_driver = {
>  	.probe		= spacemit_gpio_probe,
> 
> ---
> base-commit: 19272b37aa4f83ca52bdf9c16d5d81bdd1354494
> change-id: 20250613-k1-gpio-of-table-222b4b76b453
> 
> Best regards,
> -- 
> Vivian "dramforever" Wang
> 

-- 
Yixun Lan (dlan)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
