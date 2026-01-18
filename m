Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9A7FC9832F
	for <linux-riscv@archiver.kernel.org>; Sun, 18 Jan 2026 10:15:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FyAxQjU5qgvsee7Yxj/JkBMeAeQi9bGY83GoCc5iJ+k=; b=kqEMTBpmALk/vH
	633r/GAQY4HKSSfbcrQE/BtIRckBcnVrGfOaMbh7to5uMLCpNIq7/XsPYy9dXxqZSuRAysPnX4OvP
	R70LJXkDfhZ6BhStuT0g44vRVu4BnCZ9wUXdnJ8T3dnRl/suGkHe/PKsZTis1NsJCI/zu2v8CtlZK
	arpz88ev3KMht8WkLFezIbHTn2GxSzjAxgDfz8HU9wfgYJ+Irrb6U0qEeq6aMJOrlbQOLsjCMVMfI
	uOicTHZdi0L00duCP99oz0kbvPRD1zT2/2C8p8ncK/3saRms1e/XaFCXpaf+Lr6hD4pjI370mW5kO
	XA8KSreFTqy2LA8FrWJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhPof-0000000HIQS-1SCk;
	Sun, 18 Jan 2026 10:15:29 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhPoe-0000000HIQ5-0afi
	for linux-riscv@lists.infradead.org;
	Sun, 18 Jan 2026 10:15:28 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 9131B6000A;
	Sun, 18 Jan 2026 10:15:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E1F39C116D0;
	Sun, 18 Jan 2026 10:15:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768731327;
	bh=N/dVNcBLkw0XJOLT6p0rpf1f1NNJg75jSEfBr0ZqoRM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZVD1WG+qT6TJhFc6LCFnTglrP3tM5uk2S62OTZKlh/m5x2sCJceOFYKLDuqpc2uhZ
	 Zs//2956o3AhATFHclKW54W/x61AykukzjJ/LiBxBTm5Uojbc2bJDGu1wIlDj3Mz9N
	 hbFYvQe2dZYPBuH+CT8jZNMSMDjmFN6d/L3/jsuftdfJ6WagLEliYgKd1C8kUKXrcY
	 xI4GK1XnHmTy4s3YgxSeWK7hwrNpIuu5nM0Qzot2yGwmagFBpfTL9cbQy7mH/OYhNl
	 ukSlewoOnqnqFBuggGgC+87bI9MYBLYoDRl5r4WlDPE2q3cLWdwSI1V9ZA0BEpOMYW
	 hNntZYmDgTe5w==
Date: Sun, 18 Jan 2026 11:15:25 +0100
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
Subject: Re: [PATCH v2 3/7] dt-bindings: sound: sophgo: add CV1800B internal
 ADC codec
Message-ID: <20260118-literate-tan-sheep-33bdf3@quoll>
References: <20260118-cv1800b-i2s-driver-v2-0-d10055f68368@gmail.com>
 <20260118-cv1800b-i2s-driver-v2-3-d10055f68368@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260118-cv1800b-i2s-driver-v2-3-d10055f68368@gmail.com>
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

On Sun, Jan 18, 2026 at 12:18:55AM +0400, Anton D. Stavinskii wrote:
> Document the internal ADC audio codec integrated in the Sophgo
> CV1800B SoC.
> 
> Signed-off-by: Anton D. Stavinskii <stavinsky@gmail.com>
> ---
>  .../bindings/sound/sophgo,cv1800b-sound-adc.yaml   | 43 ++++++++++++++++++++++
>  1 file changed, 43 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/sound/sophgo,cv1800b-sound-adc.yaml b/Documentation/devicetree/bindings/sound/sophgo,cv1800b-sound-adc.yaml
> new file mode 100644
> index 000000000000..339b60e317e8
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/sound/sophgo,cv1800b-sound-adc.yaml
> @@ -0,0 +1,43 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/sound/sophgo,cv1800b-sound-adc.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Sophgo CV1800B Internal ADC Codec
> +
> +maintainers:
> +  - Anton D. Stavinskii <stavinsky@gmail.com>
> +
> +description: |

Same comments as for first bindings patch.

All of them.


> +  Internal ADC audio codec integrated in the Sophgo CV1800B SoC.
> +  The codec exposes a single DAI and is intended to be connected
> +  to an I2S/TDM controller via an ASoC machine driver.
> +
> +properties:
> +  compatible:
> +    const: sophgo,cv1800b-sound-adc
> +
> +  reg:
> +    maxItems: 1
> +    description:
> +      Base address and size of the ADC register block.

Drop description, redundant.

> +
> +  "#sound-dai-cells":
> +    const: 0

Best regards,
Krzysztof


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
