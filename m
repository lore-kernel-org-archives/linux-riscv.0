Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DA60C369CB
	for <linux-riscv@archiver.kernel.org>; Sat, 26 Apr 2025 14:54:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5w42H4NSeU5rjjfJBWpZSWdnsNgyGmxFwwomONuW738=; b=jVGNm4uy5InElR
	DCxQxSrYIuh7QFk90VfCF0bcFwbY0WO8EouEXJDc7BNijV0kFZynAbJ/dwwmDNcKzlrMn50aiemEM
	OuAkyzxyICQA1XjBBRscDV9FPgs2qHZKCdeiVv0/xyVUP8E5xdcObHFlxl5aOlSCgtkkeJHmhMSqj
	9T2FG3hqswrkXXrVJ8TwLxZGzGc3JOnvv3R26bVgdAVpjaiBw1DexuoSrseCAX3zloCG6jSDUFp40
	lwQsKANpre7pnisN//8fCwNEQPKIXm9TC88U2EhtMyRhsa38eWgzldtzytT6pOK9Lc0Kd2vzG2/Mg
	9A3vkie1hMiBesboZeFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8gvM-00000002BKf-414c;
	Sat, 26 Apr 2025 14:54:36 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8gvK-00000002BJz-2E2q
	for linux-riscv@lists.infradead.org;
	Sat, 26 Apr 2025 14:54:35 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id DE0475C5787;
	Sat, 26 Apr 2025 14:52:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 79621C4CEE2;
	Sat, 26 Apr 2025 14:54:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745679272;
	bh=jr3XRJfORT4XwYRsSfCCGcYkWr9+PGGChSVSgni5WAM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QshoRKIMj7lXu+pq5SP5kVW/YAWsq8+LODBex/ZUGL31ib3dtUavavNoYyj3Mu/bl
	 vqtoJt+lHLzsaGDvF5x0ndA+Mrb/AKxwu9Tlz/+mxXnEajx1tVIRgdlp/7fjL2/PaC
	 mn1g4fcsrHO/R6JBq3y2BsanLzlLutGRmrsfE0VJXneDPucIuQOC8dW8ulNWiJUYy0
	 zvuLWq3eagjRiV5lvsR+CvGUcxcIVSnJVCL0f6rViV6H0/JyGu6LUvpQKypbXqMMFh
	 6F9WEobmhWC46oJlK+AigeksFTCzBk6omScCeTiUXZYtPzPC2zPmRXEeznZZhyzBiY
	 JnLuGXHQHJVgg==
Date: Sat, 26 Apr 2025 22:38:03 +0800
From: Jisheng Zhang <jszhang@kernel.org>
To: Pinkesh Vaghela <pinkesh.vaghela@einfochips.com>
Cc: Conor Dooley <conor@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Samuel Holland <samuel.holland@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Min Lin <linmin@eswincomputing.com>,
	Pritesh Patel <pritesh.patel@einfochips.com>,
	Yangyu Chen <cyy@cyyself.name>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Yu Chien Peter Lin <peterlin@andestech.com>,
	Charlie Jenkins <charlie@rivosinc.com>,
	Kanak Shilledar <kanakshilledar@gmail.com>,
	Darshan Prajapati <darshan.prajapati@einfochips.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Heiko Stuebner <heiko@sntech.de>, Aradhya Bhatia <a-bhatia1@ti.com>,
	rafal@milecki.pl, Anup Patel <anup@brainfault.org>,
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 04/10] dt-bindings: riscv: Add SiFive HiFive Premier
 P550 board
Message-ID: <aAzvy7ZJqPv6jW3p@xhacker>
References: <20250410152519.1358964-1-pinkesh.vaghela@einfochips.com>
 <20250410152519.1358964-5-pinkesh.vaghela@einfochips.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250410152519.1358964-5-pinkesh.vaghela@einfochips.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250426_075434_652140_42C487B6 
X-CRM114-Status: GOOD (  17.39  )
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

On Thu, Apr 10, 2025 at 08:55:13PM +0530, Pinkesh Vaghela wrote:
> From: Pritesh Patel <pritesh.patel@einfochips.com>
> 
> Add DT binding documentation for the ESWIN EIC7700 SoC and
> HiFive Premier P550 Board
> 
> Signed-off-by: Pritesh Patel <pritesh.patel@einfochips.com>
> Reviewed-by: Samuel Holland <samuel.holland@sifive.com>
> Signed-off-by: Pinkesh Vaghela <pinkesh.vaghela@einfochips.com>
> Reviewed-by: Matthias Brugger <matthias.bgg@kernel.org>
> Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
> ---
>  .../devicetree/bindings/riscv/eswin.yaml      | 29 +++++++++++++++++++
>  MAINTAINERS                                   |  7 +++++
>  2 files changed, 36 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/riscv/eswin.yaml
> 
> diff --git a/Documentation/devicetree/bindings/riscv/eswin.yaml b/Documentation/devicetree/bindings/riscv/eswin.yaml
> new file mode 100644
> index 000000000000..c603c45eef22
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/riscv/eswin.yaml
> @@ -0,0 +1,29 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/riscv/eswin.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: ESWIN SoC-based boards
> +
> +maintainers:
> +  - Min Lin <linmin@eswincomputing.com>
> +  - Pinkesh Vaghela <pinkesh.vaghela@einfochips.com>
> +  - Pritesh Patel <pritesh.patel@einfochips.com>
> +
> +description:
> +  ESWIN SoC-based boards
> +
> +properties:
> +  $nodename:
> +    const: '/'
> +  compatible:
> +    oneOf:
> +      - items:
> +          - enum:
> +              - sifive,hifive-premier-p550
> +          - const: eswin,eic7700
> +
> +additionalProperties: true
> +
> +...
> diff --git a/MAINTAINERS b/MAINTAINERS
> index bfcdf2bced61..f90c940f286c 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -8768,6 +8768,13 @@ L:	linux-can@vger.kernel.org
>  S:	Maintained
>  F:	drivers/net/can/usb/esd_usb.c
>  
> +ESWIN DEVICETREES
> +M:	Min Lin <linmin@eswincomputing.com>

IMHO, this series isn's sent by this email, and I didn't find any
Min's commit history in the Linus tree, and even didn't find any
discussions or code reviews in the mailist, so is it suitable to add
to maintainers? I think maintainers doesn't work like this flow.

> +M:	Pinkesh Vaghela <pinkesh.vaghela@einfochips.com>
> +M:	Pritesh Patel <pritesh.patel@einfochips.com>
> +S:	Maintained
> +F:	Documentation/devicetree/bindings/riscv/eswin.yaml
> +
>  ET131X NETWORK DRIVER
>  M:	Mark Einon <mark.einon@gmail.com>
>  S:	Odd Fixes
> -- 
> 2.25.1
> 
> 
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
