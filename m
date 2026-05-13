Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F7FACD37B6
	for <linux-riscv@archiver.kernel.org>; Wed, 13 May 2026 08:02:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=i9mEt242Lp0DtffpHujvT/uE2caIFvufJzAUr30+eio=; b=RW69fBG2MOgmuj
	luY5OjySDxLMqUwwLpsC2WDq5YZAAF6wqTXESpndV+NIX6HoZ/gQJP/AxmjRrrKVvgvw7LP2rBQXU
	Lhk/JXn/0HCydlKIF0DSt0dSxIR9Ee/mSPK6yTncOA1apgaR1HY+E86dRudTBJdZFxoTSe5TJ1lUZ
	p4+PaUjiPcJs8DqAdEj1j0AxucHs1bxJVJzI4napM63ZtzD0VpVdDEz7IZp4CudX09Ka/u0FBNMR/
	tVSY8bIOcKFbZnSpNoxS9DpKqS0i1AuqvyLujS0I2ddNLoIh418aYpG+MIrqb7fVNNub48JF4fJUg
	3MS+VqiEcQ3dCNGTXNtw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wN4Y9-00000001fat-2JxO;
	Wed, 13 May 2026 08:02:37 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wN4Y7-00000001faQ-2mE2
	for linux-riscv@lists.infradead.org;
	Wed, 13 May 2026 08:02:35 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id C104E600CB;
	Wed, 13 May 2026 08:02:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 25BEFC2BCB7;
	Wed, 13 May 2026 08:02:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778659354;
	bh=LJ+OZyd1KVqzqQx0da6hI3yv+DimVEexTWPbxsJi33Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qj7+jGEpuj4CoThb4qZRIfcDLV0hkXt0EX9NQUpYWjAzsxvDvOSmgB6MD14YNlSsG
	 oEO1l34Bq4X9nW6U1dmdkrTMl/R2Gy4Eom0NAlpEGy+wCA/p7LtEwkzzM1vNPnL8WN
	 TCtcwr5b2vMXrerRXp/b44N/icVNVZpqRv4Wysmc6ZmO7RSJIn8F6vy7C0QsKbTqVr
	 w2uDGfzBtQZKmAfBMYFtmTJrek4Q3wQYIvTPaLknQeTrZMXBoAPpHLHp9oFP8tCrbk
	 cHaMPKXB/JXOv2U+luKbEu02L/xZEHt4Gt6Zfi0AD9SgGR7r34aizYSKTQJ0RLTYS/
	 2cHm0Jz7A+UzQ==
Date: Wed, 13 May 2026 08:02:32 +0000
From: Yixun Lan <dlan@kernel.org>
To: Andre Heider <a.heider@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Yixun Lan <dlan@gentoo.org>, devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/6] riscv: dts: spacemit: k1-musepi-pro: add PMIC and
 power infrastructure
Message-ID: <20260513080232-GKA3644607@kernel.org>
References: <20260513071958.29574-1-a.heider@gmail.com>
 <20260513071958.29574-2-a.heider@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260513071958.29574-2-a.heider@gmail.com>
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

Hi Andre,

On 09:19 Wed 13 May     , Andre Heider wrote:
> Enable i2c8 and add the connected SpacemiT P1 PMIC with its related regulators
> for the board's power infrastructure and voltage regulation support.
> 
> Signed-off-by: Andre Heider <a.heider@gmail.com>
> ---
>  .../riscv/boot/dts/spacemit/k1-musepi-pro.dts | 134 ++++++++++++++++++
>  1 file changed, 134 insertions(+)
> 
> diff --git a/arch/riscv/boot/dts/spacemit/k1-musepi-pro.dts b/arch/riscv/boot/dts/spacemit/k1-musepi-pro.dts
> index 29e333b670cf0..e0b585c50014b 100644
> --- a/arch/riscv/boot/dts/spacemit/k1-musepi-pro.dts
> +++ b/arch/riscv/boot/dts/spacemit/k1-musepi-pro.dts
> @@ -17,6 +17,7 @@ / {
>  	aliases {
>  		ethernet0 = &eth0;
>  		serial0 = &uart0;
> +		i2c8 = &i2c8;
>  	};
>  
>  	chosen {
> @@ -33,6 +34,15 @@ led1 {
>  			default-state = "on";
>  		};
>  	};
> +
..
> +	reg_vcc_4v0: regulator-vcc-4v0 {
I prefer to keep this name same as other boards, so let's change it
to reg_vcc_4v ..

> +		compatible = "regulator-fixed";
> +		regulator-name = "VCC4V0";
> +		regulator-min-microvolt = <4000000>;
> +		regulator-max-microvolt = <4000000>;
> +		regulator-boot-on;
> +		regulator-always-on;
> +	};
>  };

-- 
Yixun Lan (dlan)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
