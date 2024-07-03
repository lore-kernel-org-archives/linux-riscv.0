Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9716C2BD09
	for <linux-riscv@archiver.kernel.org>; Wed,  3 Jul 2024 16:35:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=n/P8xwgKHdqPA1nqxnQdI7xjxOv4prnDTov1sUkveLI=; b=TVJn/mFDVqL0L6
	4NWJ4dG3TOoHNBjSwxl/C5EXPeLNtvxHbIWk1sGG03wrMf83PxXBgmNtLUeVHDN50i10X4Zn1LlS5
	5jXJAfwbsCZOHeTXHHljrpjiUw6+6wMSWAN4/ri7zgNh4FNdv47sOH6ssTlLr4liLBOHl+Fl8Ivqz
	myAGpIUnSWFWhFpDsYsA04hLOGJ02gPCToVYlhy7N+9IDVe+dhvESLvnxwZNCNHuMd9xTzwzP1y+i
	fbfFZzfvwI2+iU+Sk3+RYAsSTuuypkLNB+4SnTitGE/f+wUjG3SfFIiXdO2nI6JpKD83N8GJCmyiY
	1liAc6qOEPxkz8RdthuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sP2xX-0000000AsGh-2qf1;
	Wed, 03 Jul 2024 16:35:55 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sP2xU-0000000AsG9-3Ail
	for linux-riscv@lists.infradead.org;
	Wed, 03 Jul 2024 16:35:54 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 7380D6237F;
	Wed,  3 Jul 2024 16:35:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DD1C9C2BD10;
	Wed,  3 Jul 2024 16:35:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720024551;
	bh=EsZFpXIeoKQfJgd3H/gVXC/Yil62xZKPu1DKpUkp0KI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=VV/sSubhL1eBS8FI6ROC7JQcM1lKWt5DwFTWPemUVCAEuMKj6azjnJWXySnw/GNwQ
	 Dxj/kMweubAsj+KHDmF5TESGvvVT8oFnqv/FzmKq6l8rVmlQbPPTeyDfyQ9KjdPc88
	 xVtTKLt6Qtypx58B6SUlXcE4Io9sjWiKHxkFOC1FauHOGWvx7Dn1NmK3XO2b7GMzKZ
	 u8XTFz27YDQ/klavQLp9LJNl5fFKxihR8jIJjeH4mwMTg2XZP/Afxydau8wW9++k2F
	 no/VjV+MZ8C7ARZWZx87s8EE82YTFEBDzV2nC5wS2zarGLSxOuuDi8I/q54fB/vjMr
	 uNEhpqrtY5/ow==
Date: Wed, 3 Jul 2024 18:35:43 +0200
From: Matthias Brugger <matthias.bgg@kernel.org>
To: Yixun Lan <dlan@gentoo.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Conor Dooley <conor@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Samuel Holland <samuel.holland@sifive.com>,
	Anup Patel <anup@brainfault.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>, Lubomir Rintel <lkundrak@v3.sk>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Yangyu Chen <cyy@cyyself.name>,
	Inochi Amaoto <inochiama@outlook.com>, linux-serial@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Meng Zhang <zhangmeng.kevin@spacemit.com>
Subject: Re: [PATCH v3 03/11] dt-bindings: riscv: add SpacemiT K1 bindings
Message-ID: <ZoV93-NzW2fqxQmN@ziggy.stardust>
References: <20240703-k1-01-basic-dt-v3-0-12f73b47461e@gentoo.org>
 <20240703-k1-01-basic-dt-v3-3-12f73b47461e@gentoo.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240703-k1-01-basic-dt-v3-3-12f73b47461e@gentoo.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240703_093552_867253_247379C9 
X-CRM114-Status: GOOD (  15.66  )
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

On Wed, Jul 03, 2024 at 02:55:06PM +0000, Yixun Lan wrote:
> From: Yangyu Chen <cyy@cyyself.name>
> 
> Add DT binding documentation for the SpacemiT K1 SoC[1] and the Banana
> Pi BPi-F3 board[2] which used it.
> 
> Link: https://www.spacemit.com/en/spacemit-key-stone-2/ [1]
> Link: https://docs.banana-pi.org/en/BPI-F3/BananaPi_BPI-F3 [2]
> Signed-off-by: Yangyu Chen <cyy@cyyself.name>
> Signed-off-by: Yixun Lan <dlan@gentoo.org>

Reviewed-by: Matthias Brugger <matthias.bgg@kernel.org>

> ---
>  .../devicetree/bindings/riscv/spacemit.yaml        | 28 ++++++++++++++++++++++
>  1 file changed, 28 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/riscv/spacemit.yaml b/Documentation/devicetree/bindings/riscv/spacemit.yaml
> new file mode 100644
> index 0000000000000..52e55077af1ae
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/riscv/spacemit.yaml
> @@ -0,0 +1,28 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/riscv/spacemit.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: SpacemiT SoC-based boards
> +
> +maintainers:
> +  - Yangyu Chen <cyy@cyyself.name>
> +  - Yixun Lan <dlan@gentoo.org>
> +
> +description:
> +  SpacemiT SoC-based boards
> +
> +properties:
> +  $nodename:
> +    const: '/'
> +  compatible:
> +    oneOf:
> +      - items:
> +          - enum:
> +              - bananapi,bpi-f3
> +          - const: spacemit,k1
> +
> +additionalProperties: true
> +
> +...
> 
> -- 
> 2.45.2
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
