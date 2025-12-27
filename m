Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 033B9E8FDD8
	for <linux-riscv@archiver.kernel.org>; Sat, 27 Dec 2025 13:00:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HOjby7pa7h7E4bK6dqOcW2stu8S3jkYTj+cfygv3DeE=; b=mn6qYOFLDaSwc6
	TwLaQAtYL7ei5CqV1RsFbrxG8u8SWvCYssDgY1vqusThF/FZzW2kpa/8VTXubxJ4kDdIJkrxfpJzS
	1Ue1jLqATh99B0tqU8ZU0qA34115g6z0lETgTnd8M2ythYjEK8HB0loBJ3G/ZKrMIrM65wThwjYik
	3L9E1caE4hg3EazFH6oKz15cWLBtMjm+NXN0bRq2Z+H8urNRPM2otya+c3yFOg3FzgPhidO8ff4+/
	rSuOl/4PBi1hXez/77nT9tynA/DCZSC+poeEXdExPEEqH0mYml/MuWPzHdEWB50Pe630mk1XY1Jws
	1iel/7X6y0ejgqhbSBlw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vZTuE-00000001zfI-3Rdn;
	Sat, 27 Dec 2025 13:00:26 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vZTuD-00000001zf7-2TGS
	for linux-riscv@lists.infradead.org;
	Sat, 27 Dec 2025 13:00:25 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id A97426000A;
	Sat, 27 Dec 2025 13:00:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ADFFEC4CEF1;
	Sat, 27 Dec 2025 13:00:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766840424;
	bh=Gh6gqoS5hMGDmiIF264QlqRD2aJHzbjUVlGUqxG43cU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XRgVXU5YOBBADhBt7fo0NPjp5x67v/ZS3Kkc5iQtFeEVf9ojbZuhzwTJ5EX9g7Ad4
	 Lk0DgezSXYiM6gm73K6CvbfUzrNTQyGM9xqP5VsiST3jUsq6RurBWB7vSkD9AZUi5y
	 dnZwfCO+feez9AMKLXMr0Pp+CMNDtjEsrtPFASUClKbh3y45B7xosdX5beSLGhomyB
	 OXYrD+9RkAllOvCBSE68bylE4SRO3Mir03EEsrFlreW54K3SrPGWHBy4dEvOYmtT8M
	 jBMDuj7Yco6Se8vEQL3Mxq4O4CNs9/D1bdra63n3jLNC4qNqRq0CoUhtiybmOfIZAJ
	 uyeqLV/Z6rbqQ==
Date: Sat, 27 Dec 2025 14:00:21 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@gentoo.org>, 
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
	Linus Walleij <linusw@kernel.org>, devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
	spacemit@lists.linux.dev, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org
Subject: Re: [PATCH 2/2] pinctrl: spacemit: support I/O power domain
 configuration
Message-ID: <20251227-pastel-certain-orca-4b53cf@quoll>
References: <20251223-kx-pinctrl-aib-io-pwr-domain-v1-0-5f1090a487c7@linux.spacemit.com>
 <20251223-kx-pinctrl-aib-io-pwr-domain-v1-2-5f1090a487c7@linux.spacemit.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20251223-kx-pinctrl-aib-io-pwr-domain-v1-2-5f1090a487c7@linux.spacemit.com>
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

On Tue, Dec 23, 2025 at 05:11:12PM +0800, Troy Mitchell wrote:
> IO domain power control registers are used to configure the operating
> voltage of dual-voltage GPIO banks. By default, these registers are
> configured for 3.3V operation. As a result, even when a GPIO bank is
> externally supplied with 1.8V, the internal logic continues to
> operate in the 3.3V domain, which may lead to functional failures.
> 
> This patch adds support for programming the IO domain power control

Please do not use "This commit/patch/change", but imperative mood. See
longer explanation here:
https://elixir.bootlin.com/linux/v6.16/source/Documentation/process/submitting-patches.rst#L94

> registers, allowing dual-voltage GPIO banks to be explicitly configured
> for 1.8V operation when required.
> 
> Care must be taken when configuring these registers. If a GPIO bank is
> externally supplied with 3.3V while the corresponding IO power domain
> is configured for 1.8V, external current injection (back-powering)
> may occur, potentially causing damage to the GPIO pin.
> 
> Due to these hardware constraints and safety considerations, the IO
> domain power control registers are implemented as secure registers.
> Access to these registers requires unlocking via the AIB Secure Access
> Register (ASAR) in the APBC block before a single read or write
> operation can be performed.
> 
> Signed-off-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>
> ---
>  arch/riscv/boot/dts/spacemit/k1.dtsi  |   4 +-

No, this never, never comes together with driver code. You cannot fix
non-bisectability and ABI break that way.

Read carefully maintainers soc profile and submitting patches in DT dir.

...


>  static int spacemit_pinctrl_probe(struct platform_device *pdev)
>  {
> +	struct device_node *np = pdev->dev.of_node;
>  	struct device *dev = &pdev->dev;
>  	struct spacemit_pinctrl *pctrl;
>  	struct clk *func_clk, *bus_clk;
> @@ -816,6 +927,18 @@ static int spacemit_pinctrl_probe(struct platform_device *pdev)
>  	if (IS_ERR(pctrl->regs))
>  		return PTR_ERR(pctrl->regs);
>  
> +	pctrl->io_pd_reg = devm_platform_ioremap_resource(pdev, 1);
> +	if (IS_ERR(pctrl->io_pd_reg))
> +		return PTR_ERR(pctrl->io_pd_reg);
> +
> +	pctrl->regmap_apbc =
> +		syscon_regmap_lookup_by_phandle_args(np, "spacemit,apbc", 1,
> +						     &pctrl->regmap_apbc_offset);
> +
> +	if (IS_ERR(pctrl->regmap_apbc))
> +		return dev_err_probe(dev, PTR_ERR(pctrl->regmap_apbc),
> +				     "failed to get syscon\n");

Actual ABI break.

Best regards,
Krzysztof


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
