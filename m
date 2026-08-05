Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82CB5C55ABA
	for <linux-riscv@archiver.kernel.org>; Wed,  5 Aug 2026 13:41:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wFW9wLVw9Ax1V1bGf/m41vsvoOQcyZ0OOpMYNQD3eTc=; b=XLETaofqnFRXzg
	iLwGuXNtVuXVX7fUS4y1/+TkKOM2RCJredqEWRnnThV7G2+VuMOWKLaNu7qGzGlDHAvvz23hJfdE4
	duZFV5JI/mG2tXsRyM01oCKB2Mad9Z60Q+dv+er7UKv1sxdbikO/5PtTuNR2y/iL5ZiN3Lhn6a7WP
	Y0QWDChE1qoHxjQSV/5BSTkh3SCS3qr7yr543l3o8qHof3P+d9r1di9PDo2oXZx9fD6pM7n3qKa/N
	ORfefJEtlLwI0DCOJmmewuHM+/OaOD7TYPwL5wh2Om6AJvPF9N4cGt+LHhHhrGRU0IZ0dApcA2UX/
	iusWOZpolJJ3PfY9c0Cg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrbs5-000000040YD-26Pp;
	Wed, 05 Aug 2026 13:41:25 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrbs3-000000040Y6-3eIm
	for linux-riscv@lists.infradead.org;
	Wed, 05 Aug 2026 13:41:23 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 6024F42E93;
	Wed,  5 Aug 2026 13:41:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B3F981F000E9;
	Wed,  5 Aug 2026 13:41:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785937283;
	bh=RYj/wJsPNPiCwZB0BrZVoozSYFvU01Oky1FUJmpEOEk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=myDkPRoTj2iEmDN0EN80Dhd2MtCtolJTdeQ3rYzTWgEVxImBGxK21O/DJ/VN9BW4G
	 KGK3uYrSjc4UYtX6ufpH3cU7ZSmW5TTPFoASV1YT7w+ZA0rKTbx4G86AHM6DP4iARW
	 T0nNLDnApmF5gmZ4h8dnfzZKuAuTjmYxPzn+8ncGJthjZdSjRUkQfLDYpxbDN+uyav
	 7j0eqpcRzTMEvCFmY1tnIst6DnjHaiFcqyJ1f1Yo6cc6gbilYP4EhiO1cpElCRNdg5
	 nXmZHXgRcPoMdRQENZXcBFuN982usyC/ltA+I06QVnnukOJvwfHRu1YvHJ7GtjW9m5
	 vhfTthGpjDfog==
Date: Wed, 5 Aug 2026 13:41:19 +0000
From: Yixun Lan <dlan@kernel.org>
To: Troy Mitchell <troy.mitchell@linux.dev>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Guenter Roeck <linux@roeck-us.net>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
	linux-doc@vger.kernel.org
Subject: Re: [PATCH v3 6/6] riscv: dts: spacemit: Add CTF2301 on K3 CoM260
Message-ID: <20260805134119-GKJ77474@kernel.org>
References: <20260805-ctl2301-v3-0-fd4b8ffb5b0d@linux.dev>
 <20260805-ctl2301-v3-6-b86c75d1c552@linux.dev>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260805-ctl2301-v3-6-b86c75d1c552@linux.dev>
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

hi Troy,

On 02:00 Wed 05 Aug     , Troy Mitchell wrote:
> Enable I2C6 on the K3 CoM260 module and describe the Sensylink
> CTF2301 temperature sensor and fan controller at address 0x4c.
> 
> Set the I2C6 pin power source in the board-level pinctrl node
> because the IO rail voltage is board-specific.
> 
> Signed-off-by: Troy Mitchell <troy.mitchell@linux.dev>
> ---
>  arch/riscv/boot/dts/spacemit/k3-com260.dtsi | 19 +++++++++++++++++++
>  1 file changed, 19 insertions(+)
> 
> diff --git a/arch/riscv/boot/dts/spacemit/k3-com260.dtsi b/arch/riscv/boot/dts/spacemit/k3-com260.dtsi
> index a38d7b738258..95a60fbb411f 100644
> --- a/arch/riscv/boot/dts/spacemit/k3-com260.dtsi
> +++ b/arch/riscv/boot/dts/spacemit/k3-com260.dtsi
> @@ -26,6 +26,25 @@ reg_5v_sys: regulator-5v-sys {
>  	};
>  };
>  
..
> +&pinctrl {
> +	i2c6-1-cfg {
I'd prefer to use the reference, keep it short & close to where it's used

 &i2c6_1_cfg

> +		i2c6-1-pins {
> +			power-source = <3300>;
> +		};
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
