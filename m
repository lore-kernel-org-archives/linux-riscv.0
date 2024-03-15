Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A92CC54E67
	for <linux-riscv@archiver.kernel.org>; Fri, 15 Mar 2024 16:36:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OTwlRX6cKrgI7nEx8ttnlDdRb4m+x9kOzWCc9R4GFJg=; b=Wz94JCZP2+e0ck
	EFOFqjYFPCWJXZbFSusOLWGH/dEcD6PSSElIWthnmOinHttwz3W4LDPB7uqHvVunWRn/iFOHkOBIK
	WP7mkbg8ew1oVVqLQgYHLw9omKSkGx46Vgdhi+ij+sJRSt3lV2/CEq2qnI0xw59vIz63SUuy3yM5b
	QVFpKHHBk0JNeEmjAj7UJEJ+WztexPUvS5TK3S4FxT/1SSdzUBVfiNdzJoJ9wktXtlkxzjDGlFujm
	z4g/U7sd3dgSFURZxXWiNWdeTFOWCe5rsKWVehBOmWemV4AcFTR++l8ZWvKXX7Y0g+zPwmlpXHalb
	2pvqcLRHnsBBLuL2W9jw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rlAXY-00000000ov9-0c8g;
	Fri, 15 Mar 2024 16:36:16 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rlAXU-00000000ouV-3QkD
	for linux-riscv@lists.infradead.org;
	Fri, 15 Mar 2024 16:36:14 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 68DE5CE210F;
	Fri, 15 Mar 2024 16:36:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 70F74C433F1;
	Fri, 15 Mar 2024 16:36:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1710520569;
	bh=5szkVEXe0ekaYiJWoeSLGaHsidYU+VV3wwTnpAmCoFs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Z5gZGKH4u/iN1Yqk/CcmFVJsWIdVx4yRHC1F9Og9J1iru3arWK5PhESTZvEuiGzP1
	 DL07X+Jxl7H8PxRz4Wy1FbvMdrG1g/mi3vczhVQ6mCT0Nfbh/RBiEQW5gQQ4VcCKAA
	 MtP/TXEoxpQG5XO870KxWKn/CO4+waojEqfpW9kFaonMbEj6QXFSj+kISsNGt0LJ6E
	 joxqWbJm//5lI/RtUp20LA8KoQ82hhIn7DGxi6miGwCXBgZYNpIiSMlv8vYlbSQk2g
	 V21mBUNo+FYllTyrQUSoaJbBD1gau2Slnk/Vhpy6rBMNGFs1zrW1YFO1rl7qvfL7gB
	 AWmBd4bsSERVQ==
Date: Fri, 15 Mar 2024 10:36:07 -0600
From: Rob Herring <robh@kernel.org>
To: Joshua Yeong <joshua.yeong@starfivetech.com>
Subject: Re: [PATCH 4/4] dt-bindings: cache: Add docs for StarFive
 StarLink-500 cache controller
Message-ID: <20240315163607.GA1444248-robh@kernel.org>
References: <20240314061205.26143-1-joshua.yeong@starfivetech.com>
 <20240314061205.26143-5-joshua.yeong@starfivetech.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240314061205.26143-5-joshua.yeong@starfivetech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240315_093613_248484_47443DBF 
X-CRM114-Status: GOOD (  16.59  )
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
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, aou@eecs.berkeley.edu, alexghiti@rivosinc.com, geert+renesas@glider.be, leyfoon.tan@starfivetech.com, heiko@sntech.de, prabhakar.mahadev-lad.rj@bp.renesas.com, conor@kernel.org, linux-kernel@vger.kernel.org, krzysztof.kozlowski+dt@linaro.org, jeeheng.sia@starfivetech.com, conor.dooley@microchip.com, evan@rivosinc.com, palmer@dabbelt.com, jszhang@kernel.org, paul.walmsley@sifive.com, guoren@kernel.org, linux-riscv@lists.infradead.org, ajones@ventanamicro.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Thu, Mar 14, 2024 at 02:12:05PM +0800, Joshua Yeong wrote:
> Add DT binding documentation used by StarFive's
> Starlink-500 cache controller.
> 
> Signed-off-by: Joshua Yeong <joshua.yeong@starfivetech.com>
> ---
>  .../cache/starfive,starlink-500-cache.yaml    | 62 +++++++++++++++++++
>  1 file changed, 62 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/cache/starfive,starlink-500-cache.yaml
> 
> diff --git a/Documentation/devicetree/bindings/cache/starfive,starlink-500-cache.yaml b/Documentation/devicetree/bindings/cache/starfive,starlink-500-cache.yaml
> new file mode 100644
> index 000000000000..97ddf7db39e9
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/cache/starfive,starlink-500-cache.yaml
> @@ -0,0 +1,62 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/cache/starfive,starlink-500-cache.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: StarFive StarLink-500 Cache Controller
> +
> +maintainers:
> +  - Joshua Yeong <joshua.yeong@starfivetech.com>
> +
> +description:
> +  StarFive's StarLink-500 controller manages cache shared between clusters of
> +  CPU cores. The cache driver provides mechanism to perform invalidate and write
> +  back functionality to the shared memory.

What a driver does is not relevant to the binding. You could describe 
what the registers control though.

> +
> +allOf:
> +  - $ref: /schemas/cache-controller.yaml#
> +
> +# We need a select here so we don't match all nodes with 'cache'
> +select:
> +  properties:
> +    compatible:
> +      contains:
> +        enum:
> +          - starfive,starlink-500-cache
> +
> +  required:
> +    - compatible
> +
> +properties:
> +  compatible:
> +    items:
> +      - const: starfive,starlink-500-cache
> +      - const: cache
> +
> +  reg:
> +    maxItems: 1
> +
> +  cache-size: true
> +  cache-sets: true
> +  cache-block-size: true
> +  cache-level: true
> +  cache-unified: true

Drop these and...

> +
> +additionalProperties: false

... use 'unevaluatedProperties' instead.

> +
> +required:
> +  - compatible
> +  - reg

cache-unified should be required as I imagine the cache is always 
unified. Perhaps other properties too (cache-level already is)?

> +
> +examples:
> +  - |
> +      cache-controller@15000000 {
> +        compatible = "starfive,starlink-500-cache", "cache";
> +        reg = <0x15000000 0x278>;
> +        cache-block-size = <64>;
> +        cache-level = <3>;
> +        cache-sets = <8192>;
> +        cache-size = <0x400000>;
> +        cache-unified;
> +      };
> -- 
> 2.25.1
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
