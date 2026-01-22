Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E956D3EE89
	for <linux-riscv@archiver.kernel.org>; Thu, 22 Jan 2026 16:11:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=J6OmwfjEF/WWSkIkclZ7hvs5i5rYXp/GvoHvgCNEHrE=; b=yoPjdmySndyZim
	h24cWMzn/KO1AcM5Cz3V1Fk1/Nu26AkNLqJ9ZpGIhVQEsgb4tiU5emaiF/Ss7ro6sLE3uI0Ajgp67
	JJrYopgBXro2u08yA3MzFnYZI+A90w4BWuO+yt7Kw9kKKG1wTRGl72lWwN7F3IAHNqUZhF4QdPixc
	W1/NqpH3suxS4tjcxNn6yxhQWBLyKi5LF2fx5PZIdUpRldwHm7FFRfrfClmZw7MMgeQt8Lmgf15ri
	eUominGlZIvNWpsUDgPRn1yTIM3plkQkdWlZZs1I/cHCnZxULmK8/fN2rJTAZXHvqWe0HcuvWLQ8K
	IjdXbk46aobB12oja/4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vixGz-00000007OPP-2nw7;
	Thu, 22 Jan 2026 16:11:05 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vixGx-00000007OOx-06y3
	for linux-riscv@lists.infradead.org;
	Thu, 22 Jan 2026 16:11:04 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id D5C134171E;
	Thu, 22 Jan 2026 16:11:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8F05DC116C6;
	Thu, 22 Jan 2026 16:11:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769098261;
	bh=uoqbFu6fxFkaCay7ZwtoJ4iqA5ISMgbyw8FPHXxPkkw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=nxrbaC9Mmy9pTQ41SpNxEXBFfoMqh0SU9nEyyy1ejW4wVjwlSFOwDN+3/LjwzKuIa
	 ErzfhrUSqImoma0lpuss7mDupHosQJlVXM2LUZxiA4IetsGFJ5jJP3wnsp/WhHDBi2
	 tQpusZm0xJi0/Vn4V0x9JRmByGKcxJXKrtE0T70UTrm+JIC1X3XEtYUA/4ZsWTdeIj
	 xsYpauoh/sQVwLyHF25GTGE2F6v79kB7L+XvbRXaLK2yyZj1cNnrtTyZIKRjEVy2CI
	 gaXrAEskKAqaFm6HYwNxYjlg8YPzEvoaUSp7AUGX6L+GDFor81cpJM2ZEoTMwYe+HR
	 tDXw3TtE5p10Q==
Date: Thu, 22 Jan 2026 10:11:00 -0600
From: Rob Herring <robh@kernel.org>
To: Guodong Xu <guodong@riscstar.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
	Yixun Lan <dlan@gentoo.org>, Alex Elder <elder@riscstar.com>,
	Lee Jones <lee@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Troy Mitchell <troy.mitchell@linux.spacemit.com>,
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev, devicetree@vger.kernel.org
Subject: Re: [PATCH 2/4] dt-bindings: mfd: spacemit,p1: Add individual
 regulator supply properties
Message-ID: <20260122161100.GA2223008-robh@kernel.org>
References: <20260122-spacemit-p1-v1-0-309be27fbff9@riscstar.com>
 <20260122-spacemit-p1-v1-2-309be27fbff9@riscstar.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260122-spacemit-p1-v1-2-309be27fbff9@riscstar.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260122_081103_100716_F49B32F5 
X-CRM114-Status: GOOD (  16.03  )
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

On Thu, Jan 22, 2026 at 05:43:43PM +0800, Guodong Xu wrote:
> Add supply properties that match the P1 PMIC's actual hardware topology
> where each buck converter has its own VIN pin and LDO groups share
> common input pins. Supply names are defined according to the pinout
> names in the P1 datasheet.
> 
> This allows different boards to describe their actual
> power tree connections in devicetree rather than hardcoding supply
> relationships in the driver.
> 
> Signed-off-by: Guodong Xu <guodong@riscstar.com>
> ---
>  .../devicetree/bindings/mfd/spacemit,p1.yaml       | 58 +++++++++++++++++++++-
>  1 file changed, 56 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/mfd/spacemit,p1.yaml b/Documentation/devicetree/bindings/mfd/spacemit,p1.yaml
> index c6593ac6ef6adb72fc48af570dc13fc9edf77ccb..abdc93b9a67b1872c8fe6955abd950622a0b69e8 100644
> --- a/Documentation/devicetree/bindings/mfd/spacemit,p1.yaml
> +++ b/Documentation/devicetree/bindings/mfd/spacemit,p1.yaml
> @@ -27,8 +27,41 @@ properties:
>    interrupts:
>      maxItems: 1
>  
> -  vin-supply:
> -    description: Input supply phandle.
> +  vin1-supply:
> +    description:
> +      Power supply for BUCK1. Required if BUCK1 is defined.
> +
> +  vin2-supply:
> +    description:
> +      Power supply for BUCK2. Required if BUCK2 is defined.
> +
> +  vin3-supply:
> +    description:
> +      Power supply for BUCK3. Required if BUCK3 is defined.
> +
> +  vin4-supply:
> +    description:
> +      Power supply for BUCK4. Required if BUCK4 is defined.
> +
> +  vin5-supply:
> +    description:
> +      Power supply for BUCK5. Required if BUCK5 is defined.
> +
> +  vin6-supply:
> +    description:
> +      Power supply for BUCK6. Required if BUCK6 is defined.
> +
> +  aldoin-supply:
> +    description:
> +      Power supply for ALDO1-4. Required if any are defined.
> +
> +  dldoin1-supply:
> +    description:
> +      Power supply for DLDO1-4. Required if any are defined.
> +
> +  dldoin2-supply:
> +    description:
> +      Power supply for DLDO5-7. Required if any are defined.
>  
>    regulators:
>      type: object
> @@ -50,6 +83,15 @@ unevaluatedProperties: false
>  
>  examples:
>    - |
> +    / {
> +        reg_vcc_5v: regulator-vcc-5v {
> +            compatible = "regulator-fixed";
> +            regulator-name = "vcc_5v";
> +            regulator-min-microvolt = <5000000>;
> +            regulator-max-microvolt = <5000000>;
> +        };
> +    };

Don't put providers into the examples of consumers.

Rob

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
