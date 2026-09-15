Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7310C88E53
	for <linux-riscv@archiver.kernel.org>; Tue, 15 Sep 2026 09:04:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=G4pHhw639qG2C5Kgc53HOfMCGnX48JIWRCf+fAX0p/k=; b=x39lzhy9qIchfq
	Ho7Eu8K8Iy/8X5ait9osAr/n6THqu3Ff5vVOvm7s+MpCQkz9qqdnel6sEr7ZhHaS3MiZcsPtebUW3
	chKpdioLteg3cG9400orLbcFFSuNYu7Y3be47PwLfI7ZLsTbGN4sk4DZseWCer25tARfjSDfYv6at
	KIhI2v6X0KfloFp2JLMtaczUlwvYTiztHIhxmlHFzcwVEzdmWOrZtfKOqqoj2yeEiN18WHzcimqzm
	Ki3n7b5D5mlQfRGP9MIWK965AK1OhhD7j6BYlCe6AwpZhX7jbqpeMOeJmidkPGHUX+M8/xwF/cboC
	61LND1nIr5XGWSco1PsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6P5h-00000005jXA-2sGi;
	Tue, 15 Sep 2026 09:04:37 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6P5g-00000005jWp-2hRR
	for linux-riscv@lists.infradead.org;
	Tue, 15 Sep 2026 09:04:36 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 0EA74432AD;
	Tue, 15 Sep 2026 09:04:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6CACD1F000FF;
	Tue, 15 Sep 2026 09:04:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789463075;
	bh=zthCAJeSZpEWPywmDOQWxavC456glJ2WFVFFKTOL7DI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=RtmCRRAb0iFKzgb5tVG5KbJPE3N6ACkkgtVipfBxrrxmkoMSm8j7V+eoz0JHfsAHE
	 pkSvL8oei6rjfNcYglnAMRlAq8oKUvWELGIyVYNB1k6G2wAXv8/TFiWLmSlgvdhT/k
	 9HGg3xxik7+XXJQIe7dX/88QUeOCBuEqsnSxJuSVw1frBVSdSRP9nL4EDQTDp/7xCs
	 48HS/twhh9xHhd1IpQVAtZnmREbtJNUJoXCVbk/TOEUnoL8Io4CvLdY6slPLXpcfcR
	 DfWUs8mkVwVFYIsVxevsOSQ+GYKrs8bXVRGzUUl41h0DZLd22nT6Q4CCPhoz657mlO
	 bs5UPlNikpRpA==
Date: Tue, 15 Sep 2026 09:04:33 +0000
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
Subject: Re: [PATCH v5 5/6] riscv: dts: spacemit: Add K3 I2C6 pinctrl state
Message-ID: <20260915090433-GKA266329@kernel.org>
References: <20260914-ctl2301-v5-0-b44b81cd2c3c@linux.dev>
 <20260914-ctl2301-v5-5-522def70acb4@linux.dev>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260914-ctl2301-v5-5-522def70acb4@linux.dev>
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
> Add the K3 I2C6 pinctrl state used by boards that route I2C6 to pads 7
> and 8. Use a 25 mA drive strength, which is supported for both K3 IO
> voltage domains, and leave board-specific IO voltage selection to board
> files.
> 
> Signed-off-by: Troy Mitchell <troy.mitchell@linux.dev>
> ---
>  arch/riscv/boot/dts/spacemit/k3-pinctrl.dtsi | 11 +++++++++++
>  1 file changed, 11 insertions(+)
> 
Reviewed-by: Yixun Lan <dlan@kernel.org>

> diff --git a/arch/riscv/boot/dts/spacemit/k3-pinctrl.dtsi b/arch/riscv/boot/dts/spacemit/k3-pinctrl.dtsi
> index 6482d24be1394..cb4f4f4e33aff 100644
> --- a/arch/riscv/boot/dts/spacemit/k3-pinctrl.dtsi
> +++ b/arch/riscv/boot/dts/spacemit/k3-pinctrl.dtsi
> @@ -101,6 +101,17 @@ i2c2-1-pins {
>  		};
>  	};
>  
> +	/omit-if-no-ref/
> +	i2c6_1_cfg: i2c6-1-cfg {
> +		i2c6-1-pins {
> +			pinmux = <K3_PADCONF(7, 6)>,	/* i2c6 scl */
> +				 <K3_PADCONF(8, 6)>;	/* i2c6 sda */
> +
> +			bias-pull-up = <0>;
> +			drive-strength = <25>;
> +		};
> +	};
> +
>  	/omit-if-no-ref/
>  	i2c8_cfg: i2c8-cfg {
>  		i2c8-pins {
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
