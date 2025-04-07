Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16E8DC369A3
	for <linux-riscv@archiver.kernel.org>; Mon,  7 Apr 2025 16:05:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZD6djgRleY6fYYpqTJforXDGA2uVbQhGgjQkOXijCic=; b=xPl/Peh78W/S06
	dCCHRAyXOCOqlEHPbQ4ZlRkRKiBb8mRg794RNLlsMXCzSnaER8gWuCa6cIjO98o94OVbR52nhJ84p
	C81yVd35iO9v7k19903Y6V4OkFW6MR+ZvoIX/BBu5Sna7Yvjgpp+HRyXMKW9EPmmdm7ENGeLY/kkb
	NcGZNO2YQmyOdPOMcVTUP/3a9kmWJGRBJFWHgjNznSKxU1GuAO3+kwZ3WPmuUPvYbL6bdqREQFa9l
	bYf5y8q2PDBatmBC3vlbrK6XHWwKx8r1dQR1Hz1kMjT0yGjzq9yDc4cUoyzgZiFxo8iccB7NNDpsU
	HnCxr17gZukNofUDvARw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1oxp-000000013Is-1W60;
	Mon, 07 Apr 2025 16:04:45 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1nHn-00000000gpi-1MOI
	for linux-riscv@bombadil.infradead.org;
	Mon, 07 Apr 2025 14:17:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=g4npCZqS2ead5MEH2pdJNhOnm9tJBoCgVh/Ft1A8ghU=; b=Y/+nMZprWGjavfC/8DQQXrwIUs
	R4fA4NUr4lucun8hkpUUJQRQ9qEiw05HcmRWvdur8br9fqkM8FmImJy7XZVWraSGq5AG0cgjNl91N
	0K0QRhVOKN0lsXPSzXvuE7fPRTQkFGVVsi1fv8cbgAJVLROryNu2NUwAp5iGgXYWkCZnBiGoS3Y/z
	c2OUMpzgiR86To34J3O+Tq6OKVpHokqUNXXwkDj61N0McwyRZqXrWLwFMt7oB0OgFjFB+fDkNotUQ
	BxavPiBSu8Z3CQ418tJwqoGVoGumw0y8f+X+x89ntYHOQThr5ujbM9gyWODb/HCFVieo8xF5lmFH0
	VsBr8UfQ==;
Received: from dfw.source.kernel.org ([139.178.84.217])
	by desiato.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1nHj-00000007ygE-2WZs
	for linux-riscv@lists.infradead.org;
	Mon, 07 Apr 2025 14:17:13 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 050025C5E59;
	Mon,  7 Apr 2025 14:14:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 85B0BC4CEDD;
	Mon,  7 Apr 2025 14:17:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744035429;
	bh=Ou7KZNj8MSOzjom14ZDyBWFOBTkkVIoMAGHEMYI9KJw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=RbKPtiIzsOuPBHNzuq5ufz2iufQKkuB9EK+/OAL+g0p9lSxjdzqYL1rOeHmmf/KQ9
	 gHwcM6q5NYcSK1KMYu09RsHfmIzebugWAtJxh1bbCPvczaae8+wW+FLeStDjmEYxTJ
	 WelSfYDKcPX08Jdx9E7hOXRSDJWKbSy9b093oOU4ZX2QbnbaKLgxqt6UbVlHT8l3WR
	 w2eXNgqNI0gCR/QI/LyqYUOUzqmdtrzwkGwSk97ViL5gvw5xQvEGpGoGqzGDZgfGE8
	 tJtlDrv18RiNfOh+K5mzuv6oTsvOkBsjlPv20G+XrOknMSg6UbU0hUWJCcpDW5+mTk
	 KpvGBULMyd3sA==
Date: Mon, 7 Apr 2025 09:17:08 -0500
From: Rob Herring <robh@kernel.org>
To: Ben Zong-You Xie <ben717@andestech.com>
Cc: devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org, paul.walmsley@sifive.com,
	palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr,
	krzk+dt@kernel.org, conor+dt@kernel.org, tglx@linutronix.de,
	daniel.lezcano@linaro.org, prabhakar.mahadev-lad.rj@bp.renesas.com,
	tim609@andestech.com
Subject: Re: [PATCH 4/9] dt-bindings: interrupt-controller: add Andes
 machine-level software interrupt controller
Message-ID: <20250407141708.GA2250717-robh@kernel.org>
References: <20250407104937.315783-1-ben717@andestech.com>
 <20250407104937.315783-5-ben717@andestech.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250407104937.315783-5-ben717@andestech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250407_151712_059076_1C23E8CE 
X-CRM114-Status: GOOD (  16.91  )
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

On Mon, Apr 07, 2025 at 06:49:32PM +0800, Ben Zong-You Xie wrote:
> Add the DT binding documentation for Andes machine-level software
> interrupt controller.
> 
> In the Andes platform such as QiLai SoC, the PLIC module is instantiated a
> second time with all interrupt sources tied to zero as the software
> interrupt controller (PLICSW). PLICSW can generate machine-level software
> interrupts through programming its registers.
> 
> Signed-off-by: Ben Zong-You Xie <ben717@andestech.com>
> ---
>  .../andestech,plicsw.yaml                     | 48 +++++++++++++++++++
>  MAINTAINERS                                   |  1 +
>  2 files changed, 49 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/interrupt-controller/andestech,plicsw.yaml
> 
> diff --git a/Documentation/devicetree/bindings/interrupt-controller/andestech,plicsw.yaml b/Documentation/devicetree/bindings/interrupt-controller/andestech,plicsw.yaml
> new file mode 100644
> index 000000000000..5432fcfd95ed
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/interrupt-controller/andestech,plicsw.yaml
> @@ -0,0 +1,48 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/interrupt-controller/andestech,plicsw.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Andes machine-level software interrupt controller
> +
> +description:
> +  In the Andes platform such as QiLai SoC, the PLIC module is instantiated a
> +  second time with all interrupt sources tied to zero as the software interrupt
> +  controller (PLIC_SW). PLIC_SW can generate machine-level software interrupts
> +  through programming its registers.
> +
> +maintainers:
> +  - Ben Zong-You Xie <ben717@andestech.com>
> +
> +properties:
> +  compatible:
> +    items:
> +      - enum:
> +          - andestech,qilai-plicsw
> +      - const: andestech,plicsw

Drop the fallback. If you have another implementation that's compatible, 
then andestech,qilai-plicsw will be the fallback.

> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts-extended:
> +    minItems: 1
> +    maxItems: 15872
> +
> +additionalProperties: false
> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts-extended
> +
> +examples:
> +  - |
> +    interrupt-controller@400000 {
> +      compatible = "andestech,qilai-plicsw", "andestech,plicsw";
> +      reg = <0x400000 0x400000>;
> +      interrupts-extended = <&cpu0intc 3>,
> +                            <&cpu1intc 3>,
> +                            <&cpu2intc 3>,
> +                            <&cpu3intc 3>;
> +    };
> diff --git a/MAINTAINERS b/MAINTAINERS
> index a0ccac1cca29..645d7137cb07 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -20728,6 +20728,7 @@ F:	include/linux/irqchip/riscv-imsic.h
>  RISC-V ANDES SoC Support
>  M:	Ben Zong-You Xie <ben717@andestech.com>
>  S:	Maintained
> +F:	Documentation/devicetree/bindings/interrupt-controller/andestech,plicsw.yaml
>  F:	Documentation/devicetree/bindings/riscv/andes.yaml
>  
>  RISC-V ARCHITECTURE
> -- 
> 2.34.1
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
