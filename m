Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D63FBD4A5F4
	for <linux-riscv@archiver.kernel.org>; Sun, 18 Jan 2026 10:14:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4dxZm01Ssmnhw1Kf200gFDvbHwBa7m4EmHE2NfAsVqQ=; b=Vk8INcYSzvaAJ/
	iD3CitoyGF40/mlpYj9oNaMG/9Ct5dv37rzJz3wgn1/LbXe23PF0tgpu2wgWH/jCfbEtMyxf1iHE/
	kHaPfv/E3sRfTX8nFf/ziNKaQiH7DbEcP2zlULQF6/793zcIu/FU6rEi4zLtu4B24WsqZVk5TmVQk
	mRt+Pos6nxQ8p/+GqJ47jSIjAKImr+QNMg37qTcK24xfmgtbzkz2nEofFM8SrZoZQRT3btm3MyWc7
	gmP5qAz4Tj1C3jEeiO6dXT5Ep+46AshEjyZOTzGCVV0q68aR3uw9ASm9IIdSow4UmZPIuiiDfwSG3
	2V7nq/IuWCIEzgUWG5TQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhPns-0000000HIHq-188T;
	Sun, 18 Jan 2026 10:14:40 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhPnq-0000000HIHM-0PEc
	for linux-riscv@lists.infradead.org;
	Sun, 18 Jan 2026 10:14:38 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 35CE16000A;
	Sun, 18 Jan 2026 10:14:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 851D1C116D0;
	Sun, 18 Jan 2026 10:14:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768731276;
	bh=+/399kGVf0+NWo4+YQDToqsTIGlk/UkYUiOlFikNpk0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=pQNwjFaviTx/163sFtxVKP2usrohojK6T7njg5pJGy0MQJg3WsQgS/L5SbtHbdk12
	 UhK/qll9y8juvS7dkDPTqpS0Vu8BTM9+QcWhHNfEqHowCXxoP27YiM08nqKfp60XyH
	 IHb7T6y452ZmgUR1C+YXraNHbLo8R0qCKwxm7T65TKP1UgshiFJayKzTpiS70EQHPS
	 76Ck73Hz83Wjkll7K1i5CWplWjHPOG2zAaHD/8MkzHjECJ6qJ+p9oBHA88gQHTJmJ7
	 g2QVtXUPy253SoxD5dslpqSk7aL+FdN5yvBQcfqL9Z/prwUUC9X52+KdLzhOFlvY9n
	 DfH8NXD8lZpPA==
Date: Sun, 18 Jan 2026 11:14:34 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: "Anton D. Stavinskii" <stavinsky@gmail.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Chen Wang <unicorn_wang@outlook.com>, 
	Inochi Amaoto <inochiama@gmail.com>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, linux-sound@vger.kernel.org, 
	devicetree@vger.kernel.org, sophgo@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH v2 1/7] dt-bindings: sound: sophgo: add CV1800B I2S/TDM
 controller binding
Message-ID: <20260118-famous-magnificent-peccary-474ba8@quoll>
References: <20260118-cv1800b-i2s-driver-v2-0-d10055f68368@gmail.com>
 <20260118-cv1800b-i2s-driver-v2-1-d10055f68368@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260118-cv1800b-i2s-driver-v2-1-d10055f68368@gmail.com>
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

On Sun, Jan 18, 2026 at 12:18:53AM +0400, Anton D. Stavinskii wrote:
> Purpose: introduce DT schema for the CPU driver

Bindings are for hardware, not drivers. Drop the purpose.

> The driver uses dma to transfer data. The dma it self has 8 channels.

Describe the hardware.


> Each channel can be connected only to a specific i2s node. But each
> of dma channel can have multiple purposes so in order to save dma
> channels the configurations allows to use tx and rx, only rx, only tx
> or none channels. I2S controller without channels can be useful in
> configuration where I2S is used as clock source only and doesn't
> produce any data.

Please use subject prefixes matching the subsystem. You can get them for
example with 'git log --oneline -- DIRECTORY_OR_FILE' on the directory
your patch is touching. For bindings, the preferred subjects are
explained here:
https://www.kernel.org/doc/html/latest/devicetree/bindings/submitting-patches.html#i-for-patch-submitters

A nit, subject: drop second/last, redundant "binding". The
"dt-bindings" prefix is already stating that these are bindings.
See also:
https://elixir.bootlin.com/linux/v6.17-rc3/source/Documentation/devicetree/bindings/submitting-patches.rst#L18

> 
> Signed-off-by: Anton D. Stavinskii <stavinsky@gmail.com>
> ---
>  .../bindings/sound/sophgo,cv1800b-i2s.yaml         | 75 ++++++++++++++++++++++
>  1 file changed, 75 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/sound/sophgo,cv1800b-i2s.yaml b/Documentation/devicetree/bindings/sound/sophgo,cv1800b-i2s.yaml
> new file mode 100644
> index 000000000000..cf30880a62da
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/sound/sophgo,cv1800b-i2s.yaml
> @@ -0,0 +1,75 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/sound/sophgo,cv1800b-i2s.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Sophgo CV1800B I2S/TDM controller
> +
> +maintainers:
> +  - Anton D. Stavinskii <stavinsky@gmail.com>
> +
> +description: |

Do not need '|' unless you need to preserve formatting.

> +  I2S/TDM controller found in CV1800B / Sophgo SG2002/SG2000 SoCs.
> +

Miss allOf with ref to dai-common.

> +properties:
> +  compatible:
> +    const: sophgo,cv1800b-i2s
> +
> +  reg:
> +    maxItems: 1
> +
> +  "#sound-dai-cells":
> +    const: 0
> +
> +  clocks:
> +    minItems: 1
> +    maxItems: 2

1. Why is it flexible?

2. And then why names are not flexible. These should be synced in
constraints.

> +
> +  clock-names:
> +    items:
> +      - const: i2s
> +      - const: mclk
> +
> +  dmas:
> +    maxItems: 2
> +
> +  dma-names:
> +    description: |
> +      Names of DMA channels. May be omitted. If present, one entry
> +      selects a single direction, while two entries select RX and TX.

Drop desription. Don't repeat constraints in free form text.

> +    minItems: 1
> +    maxItems: 2

Again, messed constraints.

> +    items:
> +      enum: [rx, tx]

No, it has to be a specific/fixed list.

> +
> +  "#address-cells":
> +    const: 1
> +
> +  "#size-cells":
> +    const: 0

Why? Drop these.

> +
> +required:
> +  - compatible
> +  - reg
> +  - clocks
> +  - clock-names
> +  - "#sound-dai-cells"
> +
> +additionalProperties: false

unevaluatedProperties instead

> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/sophgo,cv1800.h>
> +
> +    i2s1: i2s@4110000 {

Drop unused label.

> +        compatible = "sophgo,cv1800b-i2s";
> +        reg = <0x04110000 0x10000>;
> +        #address-cells = <1>;
> +        #size-cells = <0>;

Drop useless properties.

Best regards,
Krzysztof


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
