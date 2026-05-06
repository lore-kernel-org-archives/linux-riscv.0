Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64BB3CD342C
	for <linux-riscv@archiver.kernel.org>; Wed,  6 May 2026 15:03:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YJ4XFZiJfWyC7x9t87P0mznY21+adRGLCfh1j8wEfn8=; b=fMG8mKEPxSCaN6+VFodU+XjdGI
	7QPvovtWJgzr0J7tGpl+FIjGUI5PQ+TYqyWYh1NWg5T9F1IZenLSU4F2pY5FLv/Zh9XbSCpG3ILDH
	Awi7gTL0EyK83Hmhg+Mhxpdc0zJA+knK3XanS/qfTiOSHrXxv8dS8QBEWsSP9WXheEAvXgsR477tj
	uWa0EjhOAmEhM6NAlNF29GazLZWhPzCt6jj+qhUSt7O3bKmWzgvV1m+s4aqXh0S4ekGKup1IXQYrU
	xE2B8LXm4PooPhUro4OoYddi9QWgNDl+i2J5OqzO6DCylr5YmIgfqePv5Db0ug1JjwcSN8z9o3fmI
	hj8fpz2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKdma-00000001Dzn-142q;
	Wed, 06 May 2026 15:03:28 +0000
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKdmZ-00000001Dyz-1jYB
	for linux-riscv@lists.infradead.org;
	Wed, 06 May 2026 15:03:27 +0000
Received: by mail-ej1-x634.google.com with SMTP id a640c23a62f3a-bc2a455fd55so474492766b.2
        for <linux-riscv@lists.infradead.org>; Wed, 06 May 2026 08:03:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1778079805; x=1778684605; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=J2mDJXIFYlupSX9LmHl3D1F2SQl0bbq2hvtOpkX4whw=;
        b=CskY9TXJ0i8CueA6Y+Aiig/p3JgCGjQ3uWbemVFWz03IMBWOQBokQb1cM8RbU3JkZS
         KhoWjvWQdOGUS8KpgCUDHCI4PNM2TEwDiglcBFXZqfyUrn9jVmbT0APQfJsuCJKolyCC
         GzqZYNgoDrdqYtqFJyTzmKJLaIi0j/WaViiLA+aaw0KcBQKdHGqIP06AEZt/660pRicN
         4v5gGWvD2IJKyltbVrP2+wT7vF9Da21cn9+HasBYcBCZGy8GiJheXSr/WS8al6755Qk4
         nRgeMnPU0z4lMEpHTNUVe7If2dectbGaIcbehbfSCxZEiIwcNUZOamDMCXyDOMnFk9v+
         DDpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778079805; x=1778684605;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=J2mDJXIFYlupSX9LmHl3D1F2SQl0bbq2hvtOpkX4whw=;
        b=gGw5IPSyXXximVxTxx/aRT3zv6MglvEbYU4PaAaqI3KZPEBxR/YcV7WoVeiU/l31VS
         MlK87tdQPSa7TzjATC/YauA1yN1yQy+U+th8qWUzEil6TzDWB0M/ed1LTXWxiurrbh9c
         ODmO85J5dBqfY3VZt5YzGMj8vNeQsoBhuOrDGBgB5cBCkCj/nsY2+o3OCPIGy1qmj4ao
         Y86ahS/igWJI3WtFjxuPEXfUSAZJ2olFbK2FGRdpXQ5nGtGlktBSiA3mnkKF2jtmIH9Q
         Sj+TF/nCUBqwUhGMglIHBbafqVZlMcGwmT57Az0OtfZCCasyxwIWQB95kjkTgnmAAiE4
         tuyQ==
X-Forwarded-Encrypted: i=1; AFNElJ+dvcKGSO4nbEMxcoob8W2NKkmmK3jwsBhhIqbUdMHP7lxGSuISjO+WyxupmxQ5EqsWybYyGMzW1N1iRQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YzkojxKyIDEHk+5O4eCRfa1qp4eOGF0okwTOsfPC94f5g66lUJY
	16hXxSl9NTIaY2PO7wERThEk5vb+LG2S3Ew73+fwKyPlaB2n0ZEgkt4gsa66TH0HjWo=
X-Gm-Gg: AeBDiet0EBwc+XH3WtNpbegH/SK1PfKtxsvyTFpmf5+yjA7xYmS9AKXCnWq6MUy1+vi
	Ji/2xh/fwBO/2GhcUTD+LsYXC1r99N9JAavQHyBoMHF9optfrWlb5Vs28wFnPHox8XUA8YtrrLX
	JO/myGCRldEPKgfY9pzN+CNI53vLIORrojYCQoalEEbSjDPaxIKzTAY1SRiVMMJp8FDuTK8woJ/
	Ucl2kcvHMt6MQZ5qjvakCwqMMd2TMeq3+36xN3fH05GC0XVe0GHsidhYaAzjZUiukDZTTlKRUoE
	Mya3/4FJ1PifmLUVxEBWwwSsK3fOIFigF9oxw4DK51kmS8Gf6CbtDI/SoDA+ehyrUYWvZIKJ5QX
	g6E/d7GBg+jGnxw68T+gIccmYCXycv7DRUnHchP018OdEcsmJ04QwC9UDmHoMLerE3SaZOYA4U9
	KPWpWX3Z0ce3B9GEKJ7Tn35IYw7P5BmelSf8kSZsx7P1gAVHuowPKUdKUSkS/7oPGqMoEXs17Zt
	jrzml3r6v4OL22szA==
X-Received: by 2002:a17:907:fd8a:b0:bba:3bd7:17c7 with SMTP id a640c23a62f3a-bc56ac3654amr180224366b.7.1778079805146;
        Wed, 06 May 2026 08:03:25 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:106d:1080:5798:67fd:c866:b378? ([2a01:e0a:106d:1080:5798:67fd:c866:b378])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45052953383sm12652260f8f.13.2026.05.06.08.03.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 May 2026 08:03:24 -0700 (PDT)
Message-ID: <e2427d64-c7dd-4184-8824-f79cf15773d5@linaro.org>
Date: Wed, 6 May 2026 17:03:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v4 2/2] phy: k1-usb: k3: add USB2 PHY support
To: Yixun Lan <dlan@kernel.org>, Vinod Koul <vkoul@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Ze Huang <huang.ze@linux.dev>
Cc: Junzhong Pan <panjunzhong@linux.spacemit.com>,
 linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
 linux-kernel@vger.kernel.org, Yao Zi <me@ziyao.cc>
References: <20260305-11-k3-usb2-phy-v4-0-15554fb933bc@kernel.org>
 <20260305-11-k3-usb2-phy-v4-2-15554fb933bc@kernel.org>
Content-Language: en-US, fr
Autocrypt: addr=neil.armstrong@linaro.org; keydata=
 xsBNBE1ZBs8BCAD78xVLsXPwV/2qQx2FaO/7mhWL0Qodw8UcQJnkrWmgTFRobtTWxuRx8WWP
 GTjuhvbleoQ5Cxjr+v+1ARGCH46MxFP5DwauzPekwJUD5QKZlaw/bURTLmS2id5wWi3lqVH4
 BVF2WzvGyyeV1o4RTCYDnZ9VLLylJ9bneEaIs/7cjCEbipGGFlfIML3sfqnIvMAxIMZrvcl9
 qPV2k+KQ7q+aXavU5W+yLNn7QtXUB530Zlk/d2ETgzQ5FLYYnUDAaRl+8JUTjc0CNOTpCeik
 80TZcE6f8M76Xa6yU8VcNko94Ck7iB4vj70q76P/J7kt98hklrr85/3NU3oti3nrIHmHABEB
 AAHNKk5laWwgQXJtc3Ryb25nIDxuZWlsLmFybXN0cm9uZ0BsaW5hcm8ub3JnPsLAkQQTAQoA
 OwIbIwULCQgHAwUVCgkICwUWAgMBAAIeAQIXgBYhBInsPQWERiF0UPIoSBaat7Gkz/iuBQJk
 Q5wSAhkBAAoJEBaat7Gkz/iuyhMIANiD94qDtUTJRfEW6GwXmtKWwl/mvqQtaTtZID2dos04
 YqBbshiJbejgVJjy+HODcNUIKBB3PSLaln4ltdsV73SBcwUNdzebfKspAQunCM22Mn6FBIxQ
 GizsMLcP/0FX4en9NaKGfK6ZdKK6kN1GR9YffMJd2P08EO8mHowmSRe/ExAODhAs9W7XXExw
 UNCY4pVJyRPpEhv373vvff60bHxc1k/FF9WaPscMt7hlkbFLUs85kHtQAmr8pV5Hy9ezsSRa
 GzJmiVclkPc2BY592IGBXRDQ38urXeM4nfhhvqA50b/nAEXc6FzqgXqDkEIwR66/Gbp0t3+r
 yQzpKRyQif3OwE0ETVkGzwEIALyKDN/OGURaHBVzwjgYq+ZtifvekdrSNl8TIDH8g1xicBYp
 QTbPn6bbSZbdvfeQPNCcD4/EhXZuhQXMcoJsQQQnO4vwVULmPGgtGf8PVc7dxKOeta+qUh6+
 SRh3vIcAUFHDT3f/Zdspz+e2E0hPV2hiSvICLk11qO6cyJE13zeNFoeY3ggrKY+IzbFomIZY
 4yG6xI99NIPEVE9lNBXBKIlewIyVlkOaYvJWSV+p5gdJXOvScNN1epm5YHmf9aE2ZjnqZGoM
 Mtsyw18YoX9BqMFInxqYQQ3j/HpVgTSvmo5ea5qQDDUaCsaTf8UeDcwYOtgI8iL4oHcsGtUX
 oUk33HEAEQEAAcLAXwQYAQIACQUCTVkGzwIbDAAKCRAWmrexpM/4rrXiB/sGbkQ6itMrAIfn
 M7IbRuiSZS1unlySUVYu3SD6YBYnNi3G5EpbwfBNuT3H8//rVvtOFK4OD8cRYkxXRQmTvqa3
 3eDIHu/zr1HMKErm+2SD6PO9umRef8V82o2oaCLvf4WeIssFjwB0b6a12opuRP7yo3E3gTCS
 KmbUuLv1CtxKQF+fUV1cVaTPMyT25Od+RC1K+iOR0F54oUJvJeq7fUzbn/KdlhA8XPGzwGRy
 4zcsPWvwnXgfe5tk680fEKZVwOZKIEuJC3v+/yZpQzDvGYJvbyix0lHnrCzq43WefRHI5XTT
 QbM0WUIBIcGmq38+OgUsMYu4NzLu7uZFAcmp6h8g
Organization: Linaro
In-Reply-To: <20260305-11-k3-usb2-phy-v4-2-15554fb933bc@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260506_080327_493298_C4495DE5 
X-CRM114-Status: GOOD (  19.67  )
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
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On 3/5/26 02:00, Yixun Lan wrote:
> Add USB2 PHY support for SpacemiT K3 SoC.
> 
> Register layout of handling USB disconnect operation has been changed,
> So introducing a platform data to distinguish the different SoCs.
> 
> Reviewed-by: Yao Zi <me@ziyao.cc>
> Signed-off-by: Yixun Lan <dlan@kernel.org>
> ---
>   drivers/phy/spacemit/phy-k1-usb2.c | 34 +++++++++++++++++++++++++++++-----
>   1 file changed, 29 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/phy/spacemit/phy-k1-usb2.c b/drivers/phy/spacemit/phy-k1-usb2.c
> index 9215d0b223b2..87b943d9111f 100644
> --- a/drivers/phy/spacemit/phy-k1-usb2.c
> +++ b/drivers/phy/spacemit/phy-k1-usb2.c
> @@ -51,6 +51,9 @@
>   #define PHY_K1_HS_HOST_DISC		0x40
>   #define  PHY_K1_HS_HOST_DISC_CLR		BIT(0)
>   
> +#define PHY_K3_HS_HOST_DISC		0x20
> +#define  PHY_K3_HS_HOST_DISC_CLR		BIT(8)
> +
>   #define PHY_PLL_DIV_CFG			0x98
>   #define  PHY_FDIV_FRACT_8_15		GENMASK(7, 0)
>   #define  PHY_FDIV_FRACT_16_19		GENMASK(11, 8)
> @@ -145,7 +148,7 @@ static int spacemit_usb2phy_exit(struct phy *phy)
>   	return 0;
>   }
>   
> -static int spacemit_usb2phy_disconnect(struct phy *phy, int port)
> +static int spacemit_k1_usb2phy_disconnect(struct phy *phy, int port)
>   {
>   	struct spacemit_usb2phy *sphy = phy_get_drvdata(phy);
>   
> @@ -155,10 +158,27 @@ static int spacemit_usb2phy_disconnect(struct phy *phy, int port)
>   	return 0;
>   }
>   
> -static const struct phy_ops spacemit_usb2phy_ops = {
> +static int spacemit_k3_usb2phy_disconnect(struct phy *phy, int port)
> +{
> +	struct spacemit_usb2phy *sphy = phy_get_drvdata(phy);
> +
> +	regmap_update_bits(sphy->regmap_base, PHY_K3_HS_HOST_DISC,
> +			   PHY_K3_HS_HOST_DISC_CLR, PHY_K3_HS_HOST_DISC_CLR);
> +
> +	return 0;
> +}
> +
> +static const struct phy_ops spacemit_k1_usb2phy_ops = {
>   	.init = spacemit_usb2phy_init,
>   	.exit = spacemit_usb2phy_exit,
> -	.disconnect = spacemit_usb2phy_disconnect,
> +	.disconnect = spacemit_k1_usb2phy_disconnect,
> +	.owner = THIS_MODULE,
> +};
> +
> +static const struct phy_ops spacemit_k3_usb2phy_ops = {
> +	.init = spacemit_usb2phy_init,
> +	.exit = spacemit_usb2phy_exit,
> +	.disconnect = spacemit_k3_usb2phy_disconnect,
>   	.owner = THIS_MODULE,
>   };
>   
> @@ -167,12 +187,15 @@ static int spacemit_usb2phy_probe(struct platform_device *pdev)
>   	struct phy_provider *phy_provider;
>   	struct device *dev = &pdev->dev;
>   	struct spacemit_usb2phy *sphy;
> +	const struct phy_ops *ops;
>   	void __iomem *base;
>   
>   	sphy = devm_kzalloc(dev, sizeof(*sphy), GFP_KERNEL);
>   	if (!sphy)
>   		return -ENOMEM;
>   
> +	ops = device_get_match_data(dev);
> +
>   	sphy->clk = devm_clk_get_prepared(&pdev->dev, NULL);
>   	if (IS_ERR(sphy->clk))
>   		return dev_err_probe(dev, PTR_ERR(sphy->clk), "Failed to get clock\n");
> @@ -185,7 +208,7 @@ static int spacemit_usb2phy_probe(struct platform_device *pdev)
>   	if (IS_ERR(sphy->regmap_base))
>   		return dev_err_probe(dev, PTR_ERR(sphy->regmap_base), "Failed to init regmap\n");
>   
> -	sphy->phy = devm_phy_create(dev, NULL, &spacemit_usb2phy_ops);
> +	sphy->phy = devm_phy_create(dev, NULL, ops);
>   	if (IS_ERR(sphy->phy))
>   		return dev_err_probe(dev, PTR_ERR(sphy->phy), "Failed to create phy\n");
>   
> @@ -196,7 +219,8 @@ static int spacemit_usb2phy_probe(struct platform_device *pdev)
>   }
>   
>   static const struct of_device_id spacemit_usb2phy_dt_match[] = {
> -	{ .compatible = "spacemit,k1-usb2-phy", },
> +	{ .compatible = "spacemit,k1-usb2-phy", .data = &spacemit_k1_usb2phy_ops },
> +	{ .compatible = "spacemit,k3-usb2-phy", .data = &spacemit_k3_usb2phy_ops },
>   	{ /* sentinel */ }
>   };
>   MODULE_DEVICE_TABLE(of, spacemit_usb2phy_dt_match);
> 

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

Thanks,
Neil

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
