Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06043D42BA2
	for <linux-riscv@archiver.kernel.org>; Tue, 12 Nov 2024 15:52:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Tn3PVOciszz+Xl1X1dSlHHWqcIm4DDvtnEkdXmKL5NM=; b=JZxudF7fo//Bz6
	dt0ny+ym4NMmjYq87R9FqWj2m9ppcmfzXe1egeujYhl4urwlB5dT4fb9aklW8cXBqqxN4MjDbC67p
	zZOMs2j29syTyq9CQTZv71Lbb1pMdeH4oEWTZls/G355QzF1TkJ4ju+iSGWyouCi3+Vv8kHiZTy55
	d6ulI7RhlWyp4mDUntFPtI3SAKgKama0x4mJ1XJ6fKzrPM6Xa+aqlF6SFRZN7smBpg5BqwUlY8Mt2
	iQiGohMPWxXvGPOIdBz/SBBfUj3nPHsR4C046hkzwQJsV05jDE4m3s1Vxw68Ne4CLff07XIotALOn
	2BmFC0UZyq72cEgo2APg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tAtCB-00000004198-3PLC;
	Tue, 12 Nov 2024 15:52:47 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tAtC8-0000000417k-05rh
	for linux-riscv@lists.infradead.org;
	Tue, 12 Nov 2024 15:52:45 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 8CB3A5C57D6;
	Tue, 12 Nov 2024 15:51:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 696A3C4CECD;
	Tue, 12 Nov 2024 15:52:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731426762;
	bh=UUY+nywhlA43k/CT1WVs+YWMQzL1KhT46qsg2zq7Pt8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=q/j+Kb/2M4dJzUGNMWXrPoEFn6ylMpxOwLOCsnnO/sLBVKjbq9TXkyz0e9ZClH9II
	 6UM16398+R2QDuW9Y5JtGYBnLqZdDZwS9JH1QDFFKWKjmFdrZK2VF84iGrhUvvnGBs
	 GNMHUTZmJHCAaSLQhxDCkh5FU6JEFRxkJaWmS/ZMYXkgYYAqcPIkH1E0ukZQs8g4eB
	 ORBrbraQB/3fALkdHuYs+6ebYpf2U8PzL27LJddgQ2zeRFJ8cdIDoJralEGss4PkT5
	 RoyQrdi/+0pisr8Dd4GGKlSNk8HtBMVjfG+tPtP/bW2eKKiD5NHnBCX9pgoCREwx5c
	 JP5x2UI+Y81ew==
Date: Tue, 12 Nov 2024 09:52:40 -0600
From: Rob Herring <robh@kernel.org>
To: Chen Wang <unicornxw@gmail.com>
Cc: u.kleine-koenig@baylibre.com, aou@eecs.berkeley.edu, arnd@arndb.de,
	unicorn_wang@outlook.com, conor+dt@kernel.org, guoren@kernel.org,
	inochiama@outlook.com, krzk+dt@kernel.org, palmer@dabbelt.com,
	paul.walmsley@sifive.com, tglx@linutronix.de,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org, chao.wei@sophgo.com,
	xiaoguang.xing@sophgo.com, fengchun.li@sophgo.com
Subject: Re: [PATCH 1/3] dt-bindings: interrupt-controller: Add Sophgo SG2042
 MSI
Message-ID: <20241112155240.GA956207-robh@kernel.org>
References: <cover.1731296803.git.unicorn_wang@outlook.com>
 <5186bb9c7feebb87136eb5e5e117fb1142dba4c2.1731296803.git.unicorn_wang@outlook.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <5186bb9c7feebb87136eb5e5e117fb1142dba4c2.1731296803.git.unicorn_wang@outlook.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241112_075244_472318_E87C964F 
X-CRM114-Status: GOOD (  16.08  )
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

On Mon, Nov 11, 2024 at 12:01:36PM +0800, Chen Wang wrote:
> From: Chen Wang <unicorn_wang@outlook.com>
> 
> Add binding for Sophgo SG2042 MSI controller.
> 
> Signed-off-by: Chen Wang <unicorn_wang@outlook.com>
> ---
>  .../sophgo,sg2042-msi.yaml                    | 78 +++++++++++++++++++
>  1 file changed, 78 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/interrupt-controller/sophgo,sg2042-msi.yaml
> 
> diff --git a/Documentation/devicetree/bindings/interrupt-controller/sophgo,sg2042-msi.yaml b/Documentation/devicetree/bindings/interrupt-controller/sophgo,sg2042-msi.yaml
> new file mode 100644
> index 000000000000..9fe99b74c211
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/interrupt-controller/sophgo,sg2042-msi.yaml
> @@ -0,0 +1,78 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/interrupt-controller/sophgo,sg2042-msi.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Sophgo SG2042 MSI Controller
> +
> +maintainers:
> +  - Chen Wang <unicorn_wang@outlook.com>
> +
> +description:
> +  This interrupt controller is in Sophgo SG2042 for transforming interrupts from
> +  PCIe MSI to PLIC interrupts.
> +
> +allOf:
> +  - $ref: /schemas/interrupts.yaml#
> +  - $ref: /schemas/interrupt-controller/msi-controller.yaml#
> +
> +properties:
> +  compatible:
> +    const: sophgo,sg2042-msi
> +
> +  reg:
> +    items:
> +      - description: clear register
> +
> +  reg-names:
> +    items:
> +      - const: clr
> +
> +  sophgo,msi-doorbell-addr:
> +    description:
> +      u64 value of the MSI doorbell address
> +    $ref: /schemas/types.yaml#/definitions/uint64

Why not use a 'reg' entry?

In any case, this should be a translatable address (i.e. honor 
#address-cells/#size-cells and ranges).

> +
> +  sophgo,msi-base-vec:
> +    description:
> +      u32 value of the base of parent PLIC vector allocated
> +      to MSI.
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    minimum: 64
> +    maximum: 95
> +
> +  sophgo,msi-num-vecs:
> +    description:
> +      u32 value of the number of parent PLIC vectors allocated
> +      to MSI.
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    minimum: 1
> +    maximum: 32

Use 'msi-ranges' for these.

> +
> +  msi-controller: true
> +
> +required:
> +  - compatible
> +  - reg
> +  - reg-names
> +  - msi-controller
> +  - sophgo,msi-doorbell-addr
> +  - sophgo,msi-base-vec
> +  - sophgo,msi-num-vecs
> +
> +additionalProperties: true
> +
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/irq.h>
> +    msi: msi-controller@30000000 {
> +      compatible = "sophgo,sg2042-msi";
> +      reg = <0x30000000 0x4>;
> +      reg-names = "clr";
> +      msi-controller;
> +      sophgo,msi-doorbell-addr = <0x00000070 0x30010300>;
> +      sophgo,msi-base-vec = <64>;
> +      sophgo,msi-num-vecs = <32>;
> +      interrupt-parent = <&plic>;
> +    };
> -- 
> 2.34.1
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
