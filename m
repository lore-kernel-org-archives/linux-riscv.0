Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57543EE0ADA
	for <linux-riscv@archiver.kernel.org>; Sat,  7 Feb 2026 11:56:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=c2jM24c1UX0XVDzJJcfp54x6i9hk6mLL3qsNI9GQ2Ek=; b=oSVHHmeRljMXup
	Lw5nevGKu21/fWT9H2G3nLyryTi1UdnxXnCfHgyJqC6ZA0xSbERMG26mp5qtl7OcHzdomMkozJstx
	2zgtrnVnQKzeTVQ/yF6WseYRrj8GlQIuXeOj0+nq01s6ZBFcMZjk7jQ6f2pvGbWotAVva3fw5O0HN
	0s+9ZjFDCe7AHK+nkKqGxaUi5+xJwe5eG/SEKLesMFnhWzpePRtDYcotdmANAlfGLnULOnpx0kDxy
	poG9Y5FB7hV24ZFgn8C3fU/aoc4A06Y2K5cgmKIwULuFTRxCc9ZQQR2W7DpDAiXrkhi0+jXtKFZyK
	O7kT7tPFWz90GM8px/2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vogv6-0000000CPnV-39yV;
	Sat, 07 Feb 2026 11:56:12 +0000
Received: from woodpecker.gentoo.org ([2001:470:ea4a:1:5054:ff:fec7:86e4] helo=smtp.gentoo.org)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vogv3-0000000CPn2-2RCn;
	Sat, 07 Feb 2026 11:56:11 +0000
Received: from localhost (unknown [116.232.48.232])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dlan)
	by smtp.gentoo.org (Postfix) with ESMTPSA id D436D341F0D;
	Sat, 07 Feb 2026 11:56:03 +0000 (UTC)
Date: Sat, 7 Feb 2026 19:55:51 +0800
From: Yixun Lan <dlan@gentoo.org>
To: Chukun Pan <amadeus@jmu.edu.cn>
Cc: Yixun Lan <dlan@kernel.org>, Vinod Koul <vkoul@kernel.org>,
	Ze Huang <huang.ze@linux.dev>, Rob Herring <robh@kernel.org>,
	Mark Brown <broonie@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	linux-riscv@lists.infradead.org, linux-phy@lists.infradead.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	spacemit@lists.linux.dev
Subject: Re: [PATCH 1/2] dt-bindings: phy: spacemit: add regulator support to
 K1 USB2 PHY
Message-ID: <20260207115551-GYA130548@gentoo.org>
References: <20260206100009.873182-1-amadeus@jmu.edu.cn>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260206100009.873182-1-amadeus@jmu.edu.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260207_035609_662777_5C3E1D3F 
X-CRM114-Status: GOOD (  12.88  )
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

Hi Chukun,

On 18:00 Fri 06 Feb     , Chukun Pan wrote:
> Add an optional phy-supply property to describe the regulator
> supplying for USB VBUS.
> 
No, the phy itself doesn't require regulator supply

We previously had a discussion about this, and I personally agree it 
should be handled at USB port level, see Ze's comment

https://lore.kernel.org/all/aWJAT3n_KcND8bOz@monica.localdomain/

> Signed-off-by: Chukun Pan <amadeus@jmu.edu.cn>
> ---
>  Documentation/devicetree/bindings/phy/spacemit,usb2-phy.yaml | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/phy/spacemit,usb2-phy.yaml b/Documentation/devicetree/bindings/phy/spacemit,usb2-phy.yaml
> index 43eaca90d88c..74a1cd5bcdbe 100644
> --- a/Documentation/devicetree/bindings/phy/spacemit,usb2-phy.yaml
> +++ b/Documentation/devicetree/bindings/phy/spacemit,usb2-phy.yaml
> @@ -19,6 +19,10 @@ properties:
>    clocks:
>      maxItems: 1
>  
> +  phy-supply:
> +    description:
> +      Phandle to a regulator that provides power to VBUS.
> +
>    "#phy-cells":
>      const: 0
>  
> -- 
> 2.34.1
> 

-- 
Yixun Lan (dlan)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
