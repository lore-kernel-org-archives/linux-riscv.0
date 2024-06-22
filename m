Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76C48C27C53
	for <linux-riscv@archiver.kernel.org>; Sat, 22 Jun 2024 16:36:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:References:
	In-Reply-To:Cc:To:From:MIME-Version:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=i5ChhNKSk9NLPgKgks6O0Gru0PagtGcAf8wQ2e+QS48=; b=uREaTS7Is4rjW6ex7/FPL41r1K
	ZBR76ZdpJsZ390Yey73knpyc3KmcyZu8p8yDCpRkbw6EGZehF+Jloe/c4mPLYCIXbm8/qdwVX7WZj
	yNp5fzSaq+SXds4i2sso+fItUg5cx4gRIyXa7PJu1WtYLg+zZfJscosUh7z8hXhjeWN1BvpAcrwc4
	iRpfPrKL3WJKmbAMsQJzZsDtSEvs0bBY0F8bz+YR+qolERD9LCrtwYoVfrEVdxGmYHIO0vXPS7pz9
	oYA7sP/+fk05FrTg/bkfxH9Xooww30mHS6rm4xnE+YSCDWRKhhZNGnfJ66PJNAWCKxDx45qlxuqoD
	ijyMdF1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sL3ii-0000000CQh8-3Qtu;
	Sat, 22 Jun 2024 16:36:09 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sL3ic-0000000CQen-2ndI;
	Sat, 22 Jun 2024 16:36:04 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id DE3B7CE0AAE;
	Sat, 22 Jun 2024 16:36:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 08074C32786;
	Sat, 22 Jun 2024 16:35:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719074160;
	bh=IqRPpntD7uRExF49cR8LxazBx/7ElPwSoGve1XYwmlQ=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
	b=kL8gc5+F+tJ530e3bK4OWPC/UkU6cQ7BVF2hgkPs4EtDctm6vcSmZ9k24R+wPr8AO
	 umlQI1t5gyL8O5xZzaYpGNp1XP6haEn7yhYoIZGJpp9eR++AM7v4eWXadmECjAe1h9
	 SC+M/dWoNJrBDD3CG7h+YaE1Q6mewxhkPkcC9lKh8hgUwuX4iRaO15JpBpDet0RZuP
	 5PiBhs/F+cJ3Q323HbTsMf0EiJr4z9Yzja7OYhd0zdEN4+mLVw/RaDCTDDPdr7Kl2Y
	 NagRR4l/8dXa0tpfZaLs7n3Pjbe14/QtwPRGIxphb0u5BM3/6YheQW4n8DSh9jTxk8
	 weA/M1DhcRYTQ==
Date: Sat, 22 Jun 2024 10:35:58 -0600
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Chen-Yu Tsai <wens@kernel.org>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Albert Ou <aou@eecs.berkeley.edu>, 
 Chen-Yu Tsai <wens@csie.org>, linux-sunxi@lists.linux.dev, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 linux-riscv@lists.infradead.org, Palmer Dabbelt <palmer@dabbelt.com>, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20240622150731.1105901-2-wens@kernel.org>
References: <20240622150731.1105901-1-wens@kernel.org>
 <20240622150731.1105901-2-wens@kernel.org>
Message-Id: <171907415897.1042829.2907756455868106157.robh@kernel.org>
Subject: Re: [PATCH 1/3] dt-bindings: sram: sunxi-sram: Add regulators
 child
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240622_093602_941315_54F3A223 
X-CRM114-Status: GOOD (  11.27  )
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


On Sat, 22 Jun 2024 23:07:29 +0800, Chen-Yu Tsai wrote:
> From: Samuel Holland <samuel@sholland.org>
> 
> Some sunxi SoCs have in-package regulators controlled by a register in
> the system control MMIO block. Allow a child node for this regulator
> device in addition to SRAM child nodes.
> 
> Signed-off-by: Samuel Holland <samuel@sholland.org>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Signed-off-by: Chen-Yu Tsai <wens@csie.org>
> ---
>  .../allwinner,sun4i-a10-system-control.yaml   | 28 +++++++++++++++++++
>  1 file changed, 28 insertions(+)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/sram/allwinner,sun4i-a10-system-control.example.dtb: syscon@3000000: regulators@3000150: False schema does not allow {'compatible': ['allwinner,sun20i-d1-system-ldos'], 'reg': [[50331984, 4]], 'ldoa': {'regulator-min-microvolt': [[1800000]], 'regulator-max-microvolt': [[1800000]]}, 'ldob': {'regulator-name': ['vcc-dram'], 'regulator-min-microvolt': [[1500000]], 'regulator-max-microvolt': [[1500000]]}}
	from schema $id: http://devicetree.org/schemas/sram/allwinner,sun4i-a10-system-control.yaml#
Documentation/devicetree/bindings/sram/allwinner,sun4i-a10-system-control.example.dtb: /example-1/syscon@3000000/regulators@3000150: failed to match any schema with compatible: ['allwinner,sun20i-d1-system-ldos']

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20240622150731.1105901-2-wens@kernel.org

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
