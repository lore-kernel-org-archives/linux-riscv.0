Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89303C2BD09
	for <linux-riscv@archiver.kernel.org>; Tue,  9 Jul 2024 07:07:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XsYcrcNtnXf6DsgiApKGQtim5yACohVEzpEydArlEDM=; b=QHH5/DM4Z8SNgN
	21i1XjdORRg2cqAL5Tz8ytW5MMiKj515o0+0nPaR68n+vvNY+KiXaOLE9VH8nG+mMGKJ0dXNmnXS9
	nz0gnoaERk+MjRO0AZj1VoFDHxg+NGCtlwYRgjFoQucvyaNK+n8hhLdsdLYo7CnA6Y5SgR6Mpj/NP
	/r7V7KgrJGcrlQU0sEfXbNbLjWZc+AGRgQPOJBphJrRK4X4ezr0qgrOgrHcWAMmJeJAx3GOxvv1Sl
	JB7YhH7I6FGdgLS0KAgb3ARY3nFl14GGTmm0Gf4WPOhE9ZW5wJa0ilCRAJcEg66/87DXa4UO2d5J3
	DrMWxt7znA1CF83uK4OA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sR4wy-00000006BgS-4Bea;
	Tue, 09 Jul 2024 07:07:45 +0000
Received: from layka.disroot.org ([178.21.23.139])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sR4wu-00000006BfB-3Fgm;
	Tue, 09 Jul 2024 07:07:43 +0000
Received: from localhost (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id ABEC8415AA;
	Tue,  9 Jul 2024 09:07:37 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
	by localhost (disroot.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cUT17D5U45te; Tue,  9 Jul 2024 09:07:33 +0200 (CEST)
Date: Tue, 9 Jul 2024 15:07:04 +0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1720508853; bh=T3HvSrDk2qteJMR5w2c8GDjk4fhaQNkajCHCo/XfIXs=;
	h=Date:From:To:Subject:References:In-Reply-To;
	b=CDQMapIH2nysRPRLimL50CU32n5WdAN+AUDcY2ZL6nSlakMPRxqMbPmcjhDomyyyD
	 RFqXGs7UfWQKf17pe5MaukCJZUJcWvB6NSbcrQRzfNpye4+jHKbeYHY/q9KZQQRZEg
	 vkm45H5WJonkkUwOHbGpBLnsgqD9YfZ8VLW+aKCnzhu+M9vONG0rQih0CHk6c8YO24
	 Gl6XcFoQfU+eJlU0RUzk2VyYttS0+9DiO2Qv8TWlATCEe0+9UHifclyT2Y2hNE66kY
	 nja/fJWotyoUkKXe69kH35FmYF97mmEzSl4+zVz1aoeJhvxYtJrmgAzHjN1kUJvQEg
	 /H4B/aobgFt8w==
From: Yao Zi <ziyao@disroot.org>
To: Inochi Amaoto <inochiama@outlook.com>, Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen Wang <unicorn_wang@outlook.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Jisheng Zhang <jszhang@kernel.org>, linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH 1/3] dt-bindings: phy: add YAML schema for cv1800-usb-phy
 driver bindings
Message-ID: <ZozhanjnG2jbB5lN@ziyaolaptop.my.domain>
References: <20240708120830.5785-1-ziyao@disroot.org>
 <20240708120830.5785-2-ziyao@disroot.org>
 <IA1PR20MB495304D471AE08F75D97C25FBBDA2@IA1PR20MB4953.namprd20.prod.outlook.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <IA1PR20MB495304D471AE08F75D97C25FBBDA2@IA1PR20MB4953.namprd20.prod.outlook.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240709_000741_339562_6FACC3CE 
X-CRM114-Status: GOOD (  21.39  )
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

On Tue, Jul 09, 2024 at 06:23:58AM +0800, Inochi Amaoto wrote:
> On Mon, Jul 08, 2024 at 12:08:28PM GMT, Yao Zi wrote:
> > cv1800-usb-phy driver supports USB 2.0 phys integrated in Sophgo
> > Cv1800/SG200x SoCs. Add YAML schema for its binding.
> > 
> > Signed-off-by: Yao Zi <ziyao@disroot.org>
> > ---
> >  .../bindings/phy/sophgo,cv1800-usb-phy.yaml   | 67 +++++++++++++++++++
> >  1 file changed, 67 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/phy/sophgo,cv1800-usb-phy.yaml
> > 
> > diff --git a/Documentation/devicetree/bindings/phy/sophgo,cv1800-usb-phy.yaml b/Documentation/devicetree/bindings/phy/sophgo,cv1800-usb-phy.yaml
> > new file mode 100644
> > index 000000000000..0403d899e23b
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/phy/sophgo,cv1800-usb-phy.yaml
> > @@ -0,0 +1,67 @@
> > +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> > +# Copyright 2019 BayLibre, SAS
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/phy/sophgo,cv1800-usb-phy.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Sophgo CV1800 USB PHY
> > +
> > +maintainers:
> > +  - Yao Zi <ziyao@disroot.org>
> > +
> > +properties:
> > +  compatible:
> > +    enum:
> > +      - sophgo,cv1800-usb-phy
> > +
> > +  reg:
> > +    maxItems: 2
> > +
> > +  reg-names:
> > +    items:
> > +      - const: phy
> > +      - const: pin
> 
> drop pin, cv1800 series does not support this.
> 
> > +
> > +  clocks:
> > +    maxItems: 4
> > +
> > +  clock-names:
> > +    items:
> > +      - const: apb
> > +      - const: 125m
> > +      - const: 33k
> > +      - const: 12m
> > +
> > +  "#phy-cells":
> > +    const: 0
> > +
> > +  dr_role:
> > +    enum:
> > +      - host
> > +      - device
> 
> cv181x series have otg support. For board with OTG,
> it should be properly handled.
> 
> > +
> > +required:
> > +  - compatible
> > +  - reg
> > +  - reg-names
> > +  - clocks
> > +  - clock-names
> > +  - "#phy-cells"
> > +
> > +additionalProperties: false
> > +
> > +examples:
> > +  - |
> > +    #include <dt-bindings/clock/sophgo,cv1800.h>
> > +    usb_phy: usb-phy@3006000 {
> > +        compatible = "sophgo,cv1800-usb-phy";
> > +        reg = <0x300600 0x60>, <0x3000048 0x4>;
> > +        reg-names = "phy", "pin";
> > +        clocks = <&clk CLK_APB_USB>,
> > +                 <&clk CLK_USB_125M>,
> > +                 <&clk CLK_USB_33K>,
> > +                 <&clk CLK_USB_12M>;
> > +        clock-names = "apb", "125m", "33k", "12m";
> > +        #phy-cells = <0>;
> > +    };
> > -- 
> > 2.45.2
> > 
> 
> You patch is duplicated, I have sumbitted patches 
> month ago and still needs some time to figure out 
> the best topology. Phy driver belongs to syscon,
> which make things kind of complex.
> 
> https://lore.kernel.org/all/IA1PR20MB4953C1876484E149AA390DD5BB1D2@IA1PR20MB4953.namprd20.prod.outlook.com/#t

I didn't check that, sorry for the noise.

Best regards,
Yao Zi

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
