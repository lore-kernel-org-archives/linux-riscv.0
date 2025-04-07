Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A411CC36002
	for <linux-riscv@archiver.kernel.org>; Mon,  7 Apr 2025 02:05:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=J9LbDvZJnDYO5CyxIxj0U1KS35fUavHyF9l7PqdjI2s=; b=JXrUugp5YSNmMe
	6wT2qBevJaP0Mrv3fEMm+oAyPmroJe9rZvDq4XPdnOHCzSI0fFGRGBFrekCf5058r8YEn0s9wU3W9
	2SBM8z1If2nk2Ax6JQjG6Z2zPZjaGrwxRNJyxkdi0ZMDKWFR/RdLCdVGhmM1SwS3iQHpvMZMOHUIK
	P77XHAYe11L9XkPjjdSX0FNSc/xeNiYWjvnvgytsUEx6dT6Tv2j470WsgSGahndFse6RIjtNkY1D0
	D281TobqOm9aAyVxe55wresjFEpoXlzeQPqwo++curvD8jmV6EOQweGSaPYjgceLxG+XMNdVpkeyQ
	7lI31PG8OUsq8OlJuocg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1brg-0000000G9v3-3rlh;
	Mon, 07 Apr 2025 02:05:32 +0000
Received: from smtp.gentoo.org ([2001:470:ea4a:1:5054:ff:fec7:86e4])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1bre-0000000G9uN-1m2z
	for linux-riscv@lists.infradead.org;
	Mon, 07 Apr 2025 02:05:31 +0000
Received: from localhost (unknown [116.232.27.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dlan)
	by smtp.gentoo.org (Postfix) with ESMTPSA id 87F92340CBB;
	Mon, 07 Apr 2025 02:05:27 +0000 (UTC)
Date: Mon, 7 Apr 2025 02:05:17 +0000
From: Yixun Lan <dlan@gentoo.org>
To: Inochi Amaoto <inochiama@gmail.com>
Cc: Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen Wang <unicorn_wang@outlook.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Samuel Holland <samuel.holland@sifive.com>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Thomas Bonnefille <thomas.bonnefille@bootlin.com>,
	ghost <2990955050@qq.com>,
	Jarkko Nikula <jarkko.nikula@linux.intel.com>,
	Jisheng Zhang <jszhang@kernel.org>, Chao Wei <chao.wei@sophgo.com>,
	linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
	sophgo@lists.linux.dev, linux-kernel@vger.kernel.org,
	linux-i2c@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-mmc@vger.kernel.org, Longbin Li <looong.bin@gmail.com>
Subject: Re: [PATCH 5/9] dt-bindings: hwmon: Add Sophgo SG2044 external
 hardware monitor support
Message-ID: <20250407020517-GYA13159@gentoo>
References: <20250407010616.749833-1-inochiama@gmail.com>
 <20250407010616.749833-6-inochiama@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250407010616.749833-6-inochiama@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250406_190530_493760_63B6E6AC 
X-CRM114-Status: GOOD (  17.05  )
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

Hi Inochi:

On 09:06 Mon 07 Apr     , Inochi Amaoto wrote:
> The MCU device on SG2044 exposes the same interface as SG2042, which is
> already supported by the kernel.
> 
> Add compatible string for monitor device of SG2044.
> 
> Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
> ---
>  .../devicetree/bindings/hwmon/sophgo,sg2042-hwmon-mcu.yaml  | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/hwmon/sophgo,sg2042-hwmon-mcu.yaml b/Documentation/devicetree/bindings/hwmon/sophgo,sg2042-hwmon-mcu.yaml
> index f0667ac41d75..b76805d39427 100644
> --- a/Documentation/devicetree/bindings/hwmon/sophgo,sg2042-hwmon-mcu.yaml
> +++ b/Documentation/devicetree/bindings/hwmon/sophgo,sg2042-hwmon-mcu.yaml
> @@ -11,7 +11,11 @@ maintainers:
>  
>  properties:
>    compatible:
> -    const: sophgo,sg2042-hwmon-mcu
> +    oneOf:
> +      - items:
> +          - const: sophgo,sg2044-hwmon-mcu
> +          - const: sophgo,sg2042-hwmon-mcu
> +      - const: sophgo,sg2042-hwmon-mcu

the compatible added here but not used in dts (or driver), e.g 9/9 patch
I'd personally prefer to add it when actually being used
(so it can be validated in the real use cases..)

another concern is whether better to just use 'enum'? (maybe not)
but I got your idea to fallback to compatible of sophgo,sg2042-hwmon-mcu..

same with mmc, i2c..

>  
>    reg:
>      maxItems: 1
> -- 
> 2.49.0
> 

-- 
Yixun Lan (dlan)
Gentoo Linux Developer
GPG Key ID AABEFD55

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
