Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69BE3E63F3D
	for <linux-riscv@archiver.kernel.org>; Mon, 16 Feb 2026 09:01:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=r6DiGi60qUtCotBTlKmE+vwAfucUKXgtssN8TXbX7NI=; b=kHudU0pvZgqk+7
	cM3F+ksY35G7mMvffpDFbnU0jDmJg2NIsIOtAAbHsxIMc3EU8wQFqlUB0YhbagT9cpCY/9zH97uKX
	QdMF4SAOCWtCnRnjvXw8sW4inZusYIp1kwXDDpW4JVH/jrdFdSwJW1ZgbB4BrL4vbGVrMF5yLfaGp
	FzufVryNJZegLldwMeZhrwpa7uF3ve6dstAg32vKacqgYg5AYCrTkB1hH1TT2+cVRvBxMFWwAN0TH
	FaXDXJ1TedQucDKwRt1zdHnh2q32rzNTn9oivFvMb/guj4YWJDnC2IXa/XA776nlmqBBbiUlkf4c+
	FqtHgHKD5GdEDzIkyTxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vruTr-00000006DBM-2cYt;
	Mon, 16 Feb 2026 09:01:23 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vruTl-00000006DAT-38Om
	for linux-riscv@lists.infradead.org;
	Mon, 16 Feb 2026 09:01:21 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-4806b88d8c9so3831665e9.2
        for <linux-riscv@lists.infradead.org>; Mon, 16 Feb 2026 01:01:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771232476; x=1771837276; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=qHnHPcuynIqTUxCpCO7mrbWmUqF4Rxqiy/wTilKTles=;
        b=YPsd3GCdL0uBUTU70dXzIX+p+Fj7hCSunBpzAt9Ca2+XJxeMpOG5SQP0O1ZjGE8JkW
         dq2NRIf8NHjU4Bi9SwKHiZg5pr96+O1pfclqOr5OaAC1SsC+3kRu3/lHHNfdz6ja5rB5
         3TjtiTU9TAlmCZYFx7uzKqvwc3inptEW6AlTMoLcvt9fs6TvqUZX5n4wlYWO0AsXzwB+
         w3fhuBkQwbukIURE5eLkgbrn8vb6BrTl8/R1Zdd2/VpZjblA9CKUWnZtwarC1rigzLui
         INeF1hQ6mNrMt5a7dFtXaqGUaFrwCAO6Y3OJP0zqZ6Q6kefaumKyh9uw9XAR+dX9tnPr
         C6bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771232476; x=1771837276;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qHnHPcuynIqTUxCpCO7mrbWmUqF4Rxqiy/wTilKTles=;
        b=vTn6dcFd3FrfjiXEYV0rj7jMLoahG6amUNX7R27JKkY6NaAU6yOtN+BmciW7awK2H8
         Cu1En0Fs4kFQhfZRbnsNDmVQb1GYrFd3mpDVRpgtI2An/GADzAzuuB93GoH5d1vF1frf
         mHZ8m1KYZwnqhJLO4MNS+n06OCtAF7++PKxrpkxGqEwMBIpiOPXiUutMw8FuT6pctuZr
         Lq1U91cgge8HUoiHq9FBEBJWJ/CT2jUF7ueonLkfuFHjYjxA5N5wuhXOZI7UGJa5ZYz9
         Nrh8KeAXeel9ZzYcNCUi6xnP7bk77UroLksFqINmalK/YolpidHZ8GXbN5cR4z6zvZ1U
         E1/g==
X-Forwarded-Encrypted: i=1; AJvYcCWLOc2DoV75PLH+3RJfIAbJBSs8PXfhElH65IunkuWH2NnFUtaSUnJ97R+osDliwJrrvjoFq+4Qs5l8eQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YyL2vd854Y1W1D7FE9C8wEYiaXZLHcZQT/B2fRwjF143mkHyoLo
	/gHY2fReBbQiDNeuaB/2CepepI2ydD2dlqhnYO0o2Ib0ZYmZvBJJ3iXa
X-Gm-Gg: AZuq6aK7Jnqip35aovgxBuN+0ND1/ydOgHNAhNMVQqTtldP6sE/mHeseM1YAWx8E4Do
	w9wN7R1yU1lmKPVgrrJ+17kRKzTZbisksVQTw1VmUqvuqxQ4LAHE8e5GHP44iqRBunLBG4+zPXp
	8R1y8G4MmzvOvrjeteZCMvgNqoBBIhBgaBW8Rm/yEutsgA29EaTRzvPVKCerTBMNyRXQ2MHaeXf
	KUjYTm89YULZ21AAOVu2w0apuMTWyB4mfrt9yJq9Rk95lE6wXWigER5tj/UyMFqdlkLZk0fT8ds
	nkTMU7tgaRN3+As7Ta+x885M9HRCQ8dzT1aDnUZtGP3wS8qWADX0YsLk1dQOOYIbsTo4s4XEnOb
	MFil58snmLqTn65zx1/AMg2KLGyrjdPDWb9i8v9Y7tTGZnrRZU9G+USiKSzZh2aWkgE/l1OUHKu
	ftDg4KdPabbl270Q==
X-Received: by 2002:a05:600c:4448:b0:47b:d992:601e with SMTP id 5b1f17b1804b1-48370e2b6bemr118797125e9.2.1771232475530;
        Mon, 16 Feb 2026 01:01:15 -0800 (PST)
Received: from skbuf ([2a02:2f04:d501:d900:68e2:cc27:74c:c083])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48370a78c89sm249517325e9.5.2026.02.16.01.01.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Feb 2026 01:01:14 -0800 (PST)
Date: Mon, 16 Feb 2026 11:01:12 +0200
From: Vladimir Oltean <olteanv@gmail.com>
To: Yixun Lan <dlan@kernel.org>
Cc: Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Ze Huang <huang.ze@linux.dev>,
	Junzhong Pan <panjunzhong@linux.spacemit.com>,
	linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/3] phy: k1-usb: add disconnect function support
Message-ID: <20260216090112.n5jjpui3luqsybb5@skbuf>
References: <20260214-11-k3-usb2-phy-v2-0-6ed31e031ab4@kernel.org>
 <20260214-11-k3-usb2-phy-v2-2-6ed31e031ab4@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260214-11-k3-usb2-phy-v2-2-6ed31e031ab4@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260216_010117_908848_C0DFC8E5 
X-CRM114-Status: GOOD (  23.30  )
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

Hello Yixun,

On Sat, Feb 14, 2026 at 08:29:15PM +0800, Yixun Lan wrote:
> A disconnect status BIT of USB2 PHY need to be cleared, otherwise
> it will fail to work properly during next connection when devices
> connect to roothub directly.
> 
> Fixes: fe4bc1a08638 ("phy: spacemit: support K1 USB2.0 PHY controller")
> Signed-off-by: Yixun Lan <dlan@kernel.org>
> ---
>  drivers/phy/spacemit/phy-k1-usb2.c | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
> 
> diff --git a/drivers/phy/spacemit/phy-k1-usb2.c b/drivers/phy/spacemit/phy-k1-usb2.c
> index 342061380012..959bf79c7a72 100644
> --- a/drivers/phy/spacemit/phy-k1-usb2.c
> +++ b/drivers/phy/spacemit/phy-k1-usb2.c
> @@ -48,6 +48,9 @@
>  #define  PHY_CLK_HSTXP_EN		BIT(3)		/* clock hstxp enable */
>  #define  PHY_HSTXP_MODE			BIT(4)		/* 0: force en_txp to be 1; 1: no force */
>  
> +#define PHY_K1_HS_HOST_DISC		0x40
> +#define  PHY_K1_HS_HOST_DISC_CLR		BIT(0)
> +
>  #define PHY_PLL_DIV_CFG			0x98
>  #define  PHY_FDIV_FRACT_8_15		GENMASK(7, 0)
>  #define  PHY_FDIV_FRACT_16_19		GENMASK(11, 8)
> @@ -142,9 +145,20 @@ static int spacemit_usb2phy_exit(struct phy *phy)
>  	return 0;
>  }
>  
> +static int spacemit_usb2phy_disconnect(struct phy *phy, int port)
> +{
> +	struct spacemit_usb2phy *sphy = phy_get_drvdata(phy);
> +
> +	regmap_update_bits(sphy->regmap_base, PHY_K1_HS_HOST_DISC,
> +					   PHY_K1_HS_HOST_DISC_CLR, PHY_K1_HS_HOST_DISC_CLR);

Please align function arguments to the open parenthesis.

Since we are in the merge window, it is likely that new features will
not be picked up at this stage.

But this seems to be a fix for existing SpacemiT K1 support, currently
in the linux-phy/next branch. The linux-phy pull request hasn't been
sent yet, so if you can resend just this patch and we can get an ACK for
it in time, perhaps it can be included for v7.0.

The K3 support should be resent after the merge window.

> +
> +	return 0;
> +}
> +
>  static const struct phy_ops spacemit_usb2phy_ops = {
>  	.init = spacemit_usb2phy_init,
>  	.exit = spacemit_usb2phy_exit,
> +	.disconnect = spacemit_usb2phy_disconnect,
>  	.owner = THIS_MODULE,
>  };
>  
> 
> -- 
> 2.52.0
> 
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
