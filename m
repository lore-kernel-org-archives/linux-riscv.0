Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DFF24C3ABDB
	for <linux-riscv@archiver.kernel.org>; Tue, 17 Sep 2024 06:15:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YcOOUumrwib/rpxdHp6kmem7R/gboEBuk+r90+rpOhY=; b=zkF1gNY2nQh16P
	BbVIChhz+BWxsGN/IFf20BPVQsIPtleuE0heeiqEVNLYVSGZIs0HKVXUUAE7lNLfcl+7Wc/T3QDi9
	EWiwmw8hRuIztfqOefbhSOSrd8W1liGOLfC30pu+bWbBLJlJvYI0UCs70L/nDPjQMYXOcic57q09k
	/javw5s2p4viNEldwqVS9jjcy2Cp2qRJERqSoNb2nfTE7Om7MtESuzwJxSmqGSqPbJhvVnaF5+mkX
	cChBZ1AG3ywRhF40pyieY7mntUTaR47/xmyzJzzufWJGaxlsPCKwachE28BjDazAlIWfNWKS8zslu
	b3/XVxNwr9TX0FOMoHHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sqRUY-00000005TBR-2yem;
	Tue, 17 Sep 2024 06:15:14 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sqRUV-00000005TAf-3lCd
	for linux-riscv@lists.infradead.org;
	Tue, 17 Sep 2024 06:15:13 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 1C5FCA433CE;
	Tue, 17 Sep 2024 06:15:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CFB03C4CEC6;
	Tue, 17 Sep 2024 06:15:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726553710;
	bh=aJPxLpvFIUFAi+Q31pxB6zY+VxnHP2JJjx37Fi0l3Rs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=b806YLFQapJe6xnW1+aKdJJpYmsvawavG40vkyB+YqZbQeOP6ga/4l/t6LWVEi9+v
	 ZDSIrowayhwzvQaMGa9Do1dcBdTHsufbr7jqJCaca02pHB2BmHO/95v/QHIeDJlJ/E
	 VUQnQ8QTWC9fvtTtgakdt0abR/uQRHrSmhCSZdkGlUzR6jl/Vv/ISfoZjZnqh15sjp
	 rz/ZZ+ZZdrXSRKDQ1+4ek8hvjZEnqNIEH+YoUkuNYhG9X9Br5gz34hiBFscN6uqf4n
	 jexzM3C29FYzfzI6LQXIYpOb5SahFhpUssTAuk7QycLrkk0kULmDstsyvzdpP7v9Nm
	 U5zYR8MRQ0mzQ==
Date: Tue, 17 Sep 2024 08:15:07 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Haylen Chu <heylenay@outlook.com>
Cc: Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-riscv@lists.infradead.org, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Inochi Amaoto <inochiama@outlook.com>, 
	Chen Wang <unicornxdotw@foxmail.com>, Jisheng Zhang <jszhang@kernel.org>
Subject: Re: [PATCH v2 1/3] dt-bindings: soc: spacemit: Add spacemit,k1-syscon
Message-ID: <enzkaomrdmftp5adcexj55zklgzo7hx25becllpnib2rqmhn2d@hu3yylm6nnej>
References: <SEYPR01MB4221829A2CD4D4C1704BABD7D7602@SEYPR01MB4221.apcprd01.prod.exchangelabs.com>
 <SEYPR01MB42212A60B191731DF9759B7DD7602@SEYPR01MB4221.apcprd01.prod.exchangelabs.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <SEYPR01MB42212A60B191731DF9759B7DD7602@SEYPR01MB4221.apcprd01.prod.exchangelabs.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240916_231512_093752_D2411AAF 
X-CRM114-Status: GOOD (  15.89  )
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

On Mon, Sep 16, 2024 at 10:23:08PM +0000, Haylen Chu wrote:
> Add documentation to describe Spacemit K1 system controller registers.
> 
> Signed-off-by: Haylen Chu <heylenay@outlook.com>
> ---
>  .../soc/spacemit/spacemit,k1-syscon.yaml      | 47 +++++++++++++++++++
>  1 file changed, 47 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/soc/spacemit/spacemit,k1-syscon.yaml
> 
> diff --git a/Documentation/devicetree/bindings/soc/spacemit/spacemit,k1-syscon.yaml b/Documentation/devicetree/bindings/soc/spacemit/spacemit,k1-syscon.yaml
> new file mode 100644
> index 000000000000..4e3a72b48aff
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/soc/spacemit/spacemit,k1-syscon.yaml
> @@ -0,0 +1,47 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/soc/spacemit/spacemit,k1-syscon.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Spacemit K1 SoC System Controller
> +
> +maintainers:
> +  - Haylen Chu <heylenay@outlook.com>
> +
> +description:
> +  The Spacemit K1 SoC system controller provides access to shared register files
> +  for related SoC modules, such as clock controller and reset controller.
> +
> +properties:
> +  compatible:
> +    items:
> +      - enum:
> +          - spacemit,k1-apbc-syscon
> +          - spacemit,k1-apbs-syscon
> +          - spacemit,k1-apmu-syscon
> +          - spacemit,k1-mpmu-syscon
> +      - const: syscon
> +      - const: simple-mfd

Drop, not used. Or make the binding complete.

> +
> +  reg:
> +    maxItems: 1
> +
> +  "#address-cells":

Drop

> +    const: 1
> +
> +  "#size-cells":

Drop, not used.

> +    const: 1
> +
> +additionalProperties: false

This goes after required:

> +
> +required:
> +  - compatible
> +  - reg
> +
> +examples:
> +  - |
> +    syscon_mpmu: system-controller@d4050000 {
> +        compatible = "spacemit,mpmu-syscon", "syscon", "simple-mfd";

This is example from something entirely different.

> +        reg = <0xd4050000 0x209c>;
> +    };
> -- 
> 2.46.0
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
