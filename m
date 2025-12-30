Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CABD3E9411C
	for <linux-riscv@archiver.kernel.org>; Tue, 30 Dec 2025 07:36:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XJlScckrf0ewf7lT3FzJuEEWZqlxCjUvd+RhipJwBZk=; b=tZHer8kuMn7IKX
	3UJ7D1HCEJ30i2wr4iSQI2IXFmGsXAMZeNY6T4AzEMmDxaxszRyRD6KLjY9+WyJp0bwTdwqFMu1g0
	4GKOIf7nb95N0rD0jI76wHFmrI15ymuhbNznRgAvTCzQ12gf6UMJCBd2S8OGnPcoO1OaTr/xG6miq
	+o7PErheBYrvaPYwHFkzIRmvIg4/JTXiImF5uVyJn6VFYKWpS/m7TD+ayLPyOARAVAeY8NOpV1B0p
	uzanknobfgMSfwRX+M7722vPPe17OnQOU8G1fDxnHc3Y8l+oyCaL/Gfri6gpBEDrtRW+nXcf65xd5
	IvqLin6iQ8vwIPDPXRfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vaUH9-00000004WEc-0NnL;
	Tue, 30 Dec 2025 07:36:15 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vaUH4-00000004WDq-1hga;
	Tue, 30 Dec 2025 07:36:13 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 8008E402FC;
	Tue, 30 Dec 2025 07:36:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D3D02C4CEFB;
	Tue, 30 Dec 2025 07:36:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767080169;
	bh=3spopZsNXxvl9VFGdm0Har22/l2edY2y+GJxsqfjeSQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=uwIE5jixzPny/vITlv9VBaDQIxhslgJ4JV0TrJH1QEr24JDi0JrFvAZ3z/u3yzFA4
	 cgpEhQBzWzMaKaMCXwhjmIYU8FjSj7aiy9rOSvJj2s9v+NTzHA6jaoU+erq7pLnqxj
	 ZbISZ6x/kyNQuHao5YQrZIIYTymTOBQtucJMkddQU51xsxq94Amio06NLvHkb4djgI
	 ch+0nRuN6P2ii2DcbEIYjmKf/g8yY2W11/WfZ/7EJQ/fIZsusVHwFhb/VAGzZ7YlBC
	 Ok5pSKwdUDUiC5y1jDNNt1xnhsRAwWHr0BSNShW0SUCTUHNdNdGAYKXJAxmXgT4vfS
	 /ooaRpuP47oNw==
Date: Tue, 30 Dec 2025 08:36:06 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Jiayu Du <jiayu.riscv@isrc.iscas.ac.cn>
Cc: conor@kernel.org, vkoul@kernel.org, gregkh@linuxfoundation.org, 
	pjw@kernel.org, palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr, 
	neil.armstrong@linaro.org, krzk+dt@kernel.org, linux-riscv@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org, 
	linux-usb@vger.kernel.org
Subject: Re: [PATCH 1/5] dt-bindings: phy: Add Canaan K230 USB2.0 PHY DT
 schema
Message-ID: <20251230-tricky-hasty-koala-2fc9f0@quoll>
References: <20251230023725.15966-1-jiayu.riscv@isrc.iscas.ac.cn>
 <20251230023725.15966-2-jiayu.riscv@isrc.iscas.ac.cn>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20251230023725.15966-2-jiayu.riscv@isrc.iscas.ac.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251229_233611_338994_CD3C29FF 
X-CRM114-Status: GOOD (  14.14  )
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

On Tue, Dec 30, 2025 at 10:37:20AM +0800, Jiayu Du wrote:
> k230-usb-phy driver supports USB 2.0 phys integrated in Canaan

Describe hardware, not driver.

> K230 SoC. Add YAML schema for its binding.

There is no such stuff as YAML schema for a binding. Look at other
commits how they phrase it.

> 
> Signed-off-by: Jiayu Du <jiayu.riscv@isrc.iscas.ac.cn>
> ---
>  .../bindings/phy/canaan,k230-usb-phy.yaml     | 36 +++++++++++++++++++
>  1 file changed, 36 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/phy/canaan,k230-usb-phy.yaml
> 
> diff --git a/Documentation/devicetree/bindings/phy/canaan,k230-usb-phy.yaml b/Documentation/devicetree/bindings/phy/canaan,k230-usb-phy.yaml
> new file mode 100644
> index 000000000000..f1c9511c873f
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/phy/canaan,k230-usb-phy.yaml
> @@ -0,0 +1,36 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/phy/canaan,k230-usb-phy.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Canaan K230 USB2.0 PHY
> +
> +maintainers:
> +  - Jiayu Du <jiayu.riscv@isrc.iscas.ac.cn>
> +
> +properties:
> +  compatible:
> +    const: canaan,k230-usb-phy
> +
> +  reg:
> +    description:
> +      Two register regions for USB PHY in HiSysConfig syscon block.

Drop

> +    items:
> +      - description: USB PHY test control reg (pullup/pulldown config)
> +      - description: USB PHY core control reg (PLL/transceiver tuning)
> +    minItems: 2
> +    maxItems: 2

You didn't ever test it, did you? Drop last two lines.

> +
> +  clocks:
> +    maxItems: 1
> +
> +  "#phy-cells":
> +    const: 0
> +
> +required:
> +  - compatible
> +  - reg

clocks

> +  - "#phy-cells"
> +
> +additionalProperties: false

Missing example.

> -- 
> 2.52.0
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
