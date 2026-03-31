Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9D57FF60D3
	for <linux-riscv@archiver.kernel.org>; Tue, 31 Mar 2026 06:48:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QwFJ3woLCrbRDdMavrmd4eTmLrV18FsOHV07uWWm1VE=; b=auwLuU9o0jKbKP
	rOvK7WU7u9nIrHfxeYYRmqi5PUNb1ef6QyX6LLCcuK6GfG+F9ZAANl1sg4Gf1V03rZCwBSd9EeJW6
	njaasSeeXVq3F/aBYnXbPecklQQRFxO98NbaKkEhyGXovFsPVMs9I1uW8rrxxmsvYWcG4cSUFjum5
	dBGONvzYqZ70blxa/9OTPHSe9jNGE/spy4fLJcsD7fgFKgJ00zv3Y5K7He36juek5xl0LNphdH+Sa
	rE06tGhlTuYCZi1EJA90eANcuMP2bbNspq31tkbwDDpD8cd837WmrXYisEASfxASne/CUsr0mhMvg
	Nf8E87uSJbFzu1CjY7+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7Stv-0000000CPGi-2TsH;
	Tue, 31 Mar 2026 06:48:35 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7Stt-0000000CPGW-3WZe
	for linux-riscv@lists.infradead.org;
	Tue, 31 Mar 2026 06:48:33 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 0CC05600CB;
	Tue, 31 Mar 2026 06:48:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2F775C19423;
	Tue, 31 Mar 2026 06:48:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774939712;
	bh=ezx0Ms8en0l0JsWpz/LL91KCza1vVnbzIyBSo3p3zko=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=nanm4Y+tHZI+aNy/m8diIfcWEKD1SNww+kmlfWUy+EvoLpNJOD/FaCCkOikoZfwb7
	 /YEm9fGDl3Z4LUmzzqIEu8uOE0/bcMhvvgJ41ZkBZrx/lphkm+Wj2XLyWnISA+uFqG
	 KnV7bA1jAThzKrhZmmSpxh14e5kI8Kwjaj4jA9zYt4aFKJ/TYw8t1/FxCECcty1Dyw
	 wKfd3x2k7iXGiMrDOluruC0i4R2p9qx2ahmIABWwal6qer7rsmQPQiBBsVna3sVc9e
	 QRQSHUhNt1cQcOx5cFIam2PPCsedULcRxeofALjCtNDqcXl9WmIboUCf5Dmnksc1QJ
	 h5DI5gX/ef/rg==
Date: Tue, 31 Mar 2026 08:48:30 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Iker Pedrosa <ikerpedrosam@gmail.com>
Cc: Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Adrian Hunter <adrian.hunter@intel.com>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Yixun Lan <dlan@kernel.org>, 
	Michael Opdenacker <michael.opdenacker@rootcommit.com>, Javier Martinez Canillas <javierm@redhat.com>, 
	linux-mmc@vger.kernel.org, devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
	spacemit@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 1/9] dt-bindings: mmc: spacemit,sdhci: add pinctrl
 support for voltage switching
Message-ID: <20260331-eager-kind-civet-62f60a@quoll>
References: <20260330-orangepi-sd-card-uhs-v5-0-bd853604322d@gmail.com>
 <20260330-orangepi-sd-card-uhs-v5-1-bd853604322d@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260330-orangepi-sd-card-uhs-v5-1-bd853604322d@gmail.com>
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

On Mon, Mar 30, 2026 at 10:38:02AM +0200, Iker Pedrosa wrote:
> Document pinctrl properties to support voltage-dependent pin
> configuration switching for UHS-I SD card modes.
> 
> Add optional pinctrl-names property with two states:
> - "default": For 3.3V operation with standard drive strength
> - "state_uhs": For 1.8V operation with optimized drive strength
> 
> These pinctrl states allow the SDHCI driver to coordinate voltage
> switching with pin configuration changes, ensuring proper signal
> integrity during UHS-I mode transitions.
> 
> Signed-off-by: Iker Pedrosa <ikerpedrosam@gmail.com>
> ---
>  .../devicetree/bindings/mmc/spacemit,sdhci.yaml         | 17 +++++++++++++++++
>  1 file changed, 17 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/mmc/spacemit,sdhci.yaml b/Documentation/devicetree/bindings/mmc/spacemit,sdhci.yaml
> index 9a055d963a7f0cdba4741c1e3e7269688dcd5f45..201ab97f0e88376a4680dcca7917e8b3172bd84a 100644
> --- a/Documentation/devicetree/bindings/mmc/spacemit,sdhci.yaml
> +++ b/Documentation/devicetree/bindings/mmc/spacemit,sdhci.yaml
> @@ -44,6 +44,20 @@ properties:
>        - const: axi
>        - const: sdh
>  
> +  pinctrl-names:
> +    minItems: 1
> +    maxItems: 2
> +    items:
> +      enum:

No, that's not enum but list. Look here:

> +        - default
> +        - state_uhs

Instead: uhs

> +
> +  pinctrl-0:
> +    description: Default pinctrl state for 3.3V operation

So first item must be default, not uhs

Best regards,
Krzysztof


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
