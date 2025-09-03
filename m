Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99F3ECA1014
	for <linux-riscv@archiver.kernel.org>; Wed,  3 Sep 2025 11:15:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2uK/X5nPi19o1jgEChQwaC0NYF6Cl/V5WLm/ciDks9k=; b=eoUxzC9MCUSaxY
	A/zISflp3UotHxuMn+t+Ej51cE/jzEF2WOn5iHbrmIHmJNdrEmzsIUTo/jaA2fN44zAwPQsflEH4v
	Y1aYtu8sQy9q0KUFZ7OeSI+mycVvCojE1EUNUV5E2rcbw3JUB+vxw824eyEo0j/CE3Ipjk9DWQof3
	kPe/lN/qcqwxF/F52t6WIsLmlxOxGLjjXX3b4z9JDJCxk15C2jjWzQu8fDJ7yZ06yajb71gqY6Fym
	bg0THSWaP8muk/omBcgKTmGxGSpAWCtnlZ2lrutZw13LEYOwoGKo19XVuAowPg6wa8fcRAnUizxA7
	qTIDePm8WYRQiBF2hEFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utlSE-00000006CIC-3CfC;
	Wed, 03 Sep 2025 11:15:06 +0000
Received: from mail.gentoo.org ([2001:470:ea4a:1:5054:ff:fec7:86e4] helo=smtp.gentoo.org)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utkZc-000000064uz-08Ge
	for linux-riscv@lists.infradead.org;
	Wed, 03 Sep 2025 10:18:41 +0000
Received: from localhost (unknown [116.232.18.168])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dlan)
	by smtp.gentoo.org (Postfix) with ESMTPSA id 8860B340DCC;
	Wed, 03 Sep 2025 10:18:37 +0000 (UTC)
Date: Wed, 3 Sep 2025 18:18:33 +0800
From: Yixun Lan <dlan@gentoo.org>
To: Hendrik Hamerlinck <hendrik.hamerlinck@hammernet.be>
Cc: linus.walleij@linaro.org, skhan@linuxfoundation.org,
	linux-kernel-mentees@lists.linux.dev, linux-gpio@vger.kernel.org,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] pinctrl: spacemit: fix typo in PRI_TDI pin name
Message-ID: <20250903101833-GYB1155728@gentoo.org>
References: <20250903100104.360637-1-hendrik.hamerlinck@hammernet.be>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250903100104.360637-1-hendrik.hamerlinck@hammernet.be>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250903_031840_097000_21E79A3F 
X-CRM114-Status: GOOD (  13.78  )
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

Hi Hendrik,
On 12:01 Wed 03 Sep     , Hendrik Hamerlinck wrote:
> The datasheet lists this signal as PRI_TDI, not PRI_DTI.
> Fix the pin name to match the documentation and JTAG naming
> convention (TDI = Test Data In).
> 
> Signed-off-by: Hendrik Hamerlinck <hendrik.hamerlinck@hammernet.be>

Reviewed-by: Yixun Lan <dlan@gentoo.org>
> ---
>  drivers/pinctrl/spacemit/pinctrl-k1.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/pinctrl/spacemit/pinctrl-k1.c b/drivers/pinctrl/spacemit/pinctrl-k1.c
> index 9996b1c4a07e..a3f433b611f7 100644
> --- a/drivers/pinctrl/spacemit/pinctrl-k1.c
> +++ b/drivers/pinctrl/spacemit/pinctrl-k1.c
> @@ -847,7 +847,7 @@ static const struct pinctrl_pin_desc k1_pin_desc[] = {
>  	PINCTRL_PIN(67, "GPIO_67"),
>  	PINCTRL_PIN(68, "GPIO_68"),
>  	PINCTRL_PIN(69, "GPIO_69"),
> -	PINCTRL_PIN(70, "GPIO_70/PRI_DTI"),
> +	PINCTRL_PIN(70, "GPIO_70/PRI_TDI"),
>  	PINCTRL_PIN(71, "GPIO_71/PRI_TMS"),
>  	PINCTRL_PIN(72, "GPIO_72/PRI_TCK"),
>  	PINCTRL_PIN(73, "GPIO_73/PRI_TDO"),
> -- 
> 2.43.0
> 

-- 
Yixun Lan (dlan)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
