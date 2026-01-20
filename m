Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 287FAD2ECF7
	for <linux-riscv@archiver.kernel.org>; Tue, 20 Jan 2026 10:11:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=++PTPd/+EQcf6kH/P7xZE6Iu6MmAgIMySQvlQNCJCdg=; b=uP9T5qH5bLcD2V
	Ckb1YpRWe3X3NccPuaYiDK/IQ3msBK8Kjr2Wacar/uSNrwrVCEGQ0KXQ4GI8s2krjEuhpMfNy81N3
	7wJVSv78lEdeek9sJEwEpmJ11ARRnx4bQt3jS/qUN0VYpbe0afrpP97PqHZRbyjFkhmZR3q7e9Vhn
	uYJ037g/u+umVti+0nljxrMp8vkzIOX79U2gKLrnVPTg4P7W/nIjitUHQDCUzjGk0PXTSUdPqY/zC
	o1hMKwE6zoxz+SiHywhvET3LbxdzbGkkM8YuZTyLMvXcp7JhH4jHmTu3EUK3D8RPEMNMe4q4AsjTb
	27vfhJTnBDBXMyPhpM+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vi8hR-00000003aIa-1OFD;
	Tue, 20 Jan 2026 10:11:01 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vi8hP-00000003aIU-318d
	for linux-riscv@lists.infradead.org;
	Tue, 20 Jan 2026 10:10:59 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id B6FC260008;
	Tue, 20 Jan 2026 10:10:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DD260C16AAE;
	Tue, 20 Jan 2026 10:10:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768903858;
	bh=14sFAjB4MwXkB5IYvz/vbPhNzMMnETtzo0mJN+fJcs0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=SO12JgQoStGryPgG+5UcjczgvJ5BAcP6qqISOP6AXmS7I24DgPG2BSSsi5f69PaSr
	 bqK1JLZTXU7/t1TWiFuB7lMzp8MRxiQwgNVHlm8x3UaLb1DcOOy7u0OYKZH6rKmW1j
	 ZCadcmWUvl1vu4H0l6OTbtAVTFDF0zYQ2urehZlpVHL/UVA9aEPVbFDzhLx0CcpkVD
	 1jV4XFdhwKFLS9aDVVZUy6mIhxBq9Fv8NNMfWWPabjnGabOGkEP9/DIkQkHEgbkDnN
	 5RbPjtMkk/XMmx/2TaBaZYkXjnK8UaR/4wMeIaoEwNYAWGCKaUP0Q070Cv1dz6d3Jo
	 wDiBqPyVfJDpw==
Date: Tue, 20 Jan 2026 11:10:55 +0100
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
Subject: Re: [PATCH v3 1/6] ASoC: dt-bindings: sophgo,cv1800b: add I2S/TDM
 controller
Message-ID: <20260120-chirpy-booby-of-potency-ece1d7@quoll>
References: <20260119-cv1800b-i2s-driver-v3-0-04006f4111d7@gmail.com>
 <20260119-cv1800b-i2s-driver-v3-1-04006f4111d7@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260119-cv1800b-i2s-driver-v3-1-04006f4111d7@gmail.com>
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

On Mon, Jan 19, 2026 at 08:30:42PM +0400, Anton D. Stavinskii wrote:
> There are 4 TDM controllers on the SoC. Each controller can receive or
> transmit data over DMA. The dma it self has 8 channels.
> Each channel can be connected only to a specific i2s node. But each
> of dma channel can have multiple purposes so in order to save dma
> channels the configurations allows to use tx and rx, only rx, only tx
> or none channels. I2S controller without channels can be useful in
> configuration where I2S is used as clock source only and doesn't
> produce any data.
> 
> Signed-off-by: Anton D. Stavinskii <stavinsky@gmail.com>
> ---
>  .../bindings/sound/sophgo,cv1800b-i2s.yaml         | 67 ++++++++++++++++++++++
>  1 file changed, 67 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/sound/sophgo,cv1800b-i2s.yaml b/Documentation/devicetree/bindings/sound/sophgo,cv1800b-i2s.yaml
> new file mode 100644
> index 000000000000..e09631308bb6
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/sound/sophgo,cv1800b-i2s.yaml
> @@ -0,0 +1,67 @@
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
> +description: I2S/TDM controller found in CV1800B / Sophgo SG2002/SG2000 SoCs.
> +
> +allOf:
> +  - $ref: dai-common.yaml#
> +
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
> +    minItems: 2

Drop minItems, redundant in such case, implied by maxItems.

> +    maxItems: 2
> +
> +  clock-names:
> +    items:
> +      - const: i2s
> +      - const: mclk
> +
> +  dmas:

missing minItems, I already pointed out that your constraints always
need to be synchronized between xxx and xxx-names.


> +    maxItems: 2
> +
> +  dma-names:
> +    minItems: 1
> +    items:
> +      - enum: [rx, tx]
> +      - const: tx

Best regards,
Krzysztof


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
