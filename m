Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97EE3C88E73
	for <linux-riscv@archiver.kernel.org>; Tue, 15 Sep 2026 09:05:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ty0Mb4gCr1JukFYI/bjXSCUnj0buJrJFbjZiuYoHqxA=; b=tqtIStufBoXrfJ
	s3SrLxBBPxHkE/eO5MtBf7HUnm312XSv+H8pDYN1jp1O+sq/3kfw88G/dWsN+v19DPjzy9wnXlIFe
	7xA5xh8B+LivaSJpr+O7t5YMo04Fnjz40+hpVU5izyegfYOfg+4FqD4b2jwOe2P5Rhtd0SS7pERPb
	5oH1XlJcJHIfaiCH9I5mmjGNO9z0ZYcFqfO0XgQ6ahmV82LGr4zUaAJQpT1x2gFbd9c/dYvbrTXo5
	s3uFYjbTaEeXrKRqfs6Bb1qODbAkySeH45djqWkEphS+/v6Og7oDj9tCik57IcgOSUC8PwC6iTwsS
	GspsXfR0CFLarY71/3Uw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6P6I-00000005jiA-3y18;
	Tue, 15 Sep 2026 09:05:14 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6P6H-00000005jhn-0olN
	for linux-riscv@lists.infradead.org;
	Tue, 15 Sep 2026 09:05:13 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id BE74344415;
	Tue, 15 Sep 2026 09:05:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1876F1F000FF;
	Tue, 15 Sep 2026 09:05:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789463112;
	bh=DJ0y64alg7jGYdmLdKrHS632yEcH2PEJo6faH44x4cU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=JOmntclhVD5AGN4cYEQa6rgCkMfFEXrRaYFqUBZbQ8f4ogIEybqKN4tGn8UpWi49/
	 YsUNjkl0/8sAv4SUgDrSMUckib1MqTiVA24YdqbSyZEB8jEHdn+ui+P21Ob478ONXE
	 cK5c+CW4I0nqFreZIMp8bm/qa1lyZFQC4Bt2l2eIBntnBNtzF0R4UJDy/koOM0JkBH
	 x5cLquISXKUrmsQ599V6spaFG3prgfqiqRuoHlNlMbNmoPZBDxPYrnlkrU9gIrOG4l
	 lAtt7U+RYboJicMyBeVofxR613HxXjxqr0iqPZ1GJDzDpJr92EFGWE0q5Pqa0O+W7v
	 EJC29/N/KFu6Q==
Date: Tue, 15 Sep 2026 09:05:10 +0000
From: Yixun Lan <dlan@kernel.org>
To: Troy Mitchell <troy.mitchell@linux.dev>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Guenter Roeck <linux@roeck-us.net>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
	linux-doc@vger.kernel.org
Subject: Re: [PATCH v5 6/6] riscv: dts: spacemit: Add CTF2301 on K3 CoM260
Message-ID: <20260915090510-GKB266329@kernel.org>
References: <20260914-ctl2301-v5-0-b44b81cd2c3c@linux.dev>
 <20260914-ctl2301-v5-6-522def70acb4@linux.dev>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260914-ctl2301-v5-6-522def70acb4@linux.dev>
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

Hi Troy,


On 16:18 Mon 14 Sep     , Troy Mitchell wrote:
> Enable I2C6 on the K3 CoM260 module and describe the Sensylink
> CTF2301 temperature sensor and fan controller at address 0x4c.
> 
> Override the I2C6 pin power source at board level because the IO rail
> voltage is board-specific.
> 
> Signed-off-by: Troy Mitchell <troy.mitchell@linux.dev>
> ---
>  arch/riscv/boot/dts/spacemit/k3-com260.dtsi | 17 +++++++++++++++++
>  1 file changed, 17 insertions(+)
> 

Reviewed-by: Yixun Lan <dlan@kernel.org>

> diff --git a/arch/riscv/boot/dts/spacemit/k3-com260.dtsi b/arch/riscv/boot/dts/spacemit/k3-com260.dtsi
> index 37627963a6492..92dea86397798 100644
> --- a/arch/riscv/boot/dts/spacemit/k3-com260.dtsi
> +++ b/arch/riscv/boot/dts/spacemit/k3-com260.dtsi
> @@ -58,6 +58,23 @@ serial-number {
>  	};
>  };
>  
> +&i2c6_1_cfg {
> +	i2c6-1-pins {
> +		power-source = <3300>;
> +	};
> +};
> +
> +&i2c6 {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&i2c6_1_cfg>;
> +	status = "okay";
> +
> +	temperature-sensor@4c {
> +		compatible = "sensylink,ctf2301";
> +		reg = <0x4c>;
> +	};
> +};
> +
>  &i2c8 {
>  	pinctrl-names = "default";
>  	pinctrl-0 = <&i2c8_cfg>;
> 
> -- 
> 2.55.0
> 

-- 
Yixun Lan (dlan)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
