Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3939C54FAA
	for <linux-riscv@archiver.kernel.org>; Wed, 28 Aug 2024 13:59:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=POqMOXCBtTgjk0OyQynQICeRkZ4bkA9N6bM24oYc4G4=; b=KM1ArBIJqyeyS6
	kYPa1AhqhMENmVf2HAfF6R4NtyIQgWW4NqjtdhYGpftdjSrFSHOZqjVQ/ohnnSmE7GKbXtYaa8gNs
	1xLVFd7clayeXIiD4/12IBRW3iTteNUKtviUhCgvGnqBEENwZIgJd/F1lJaSj91hP3lZ8sBamlW+C
	TiZ0M44b5Bja6lIMRxEwqFRRDj579STJqA6979r9Y/CCAWpBUKzsCM8jFXjZN37Ul1RHy4w5lRASQ
	WvydWdPYGeVSBnJE6kWuJqbSfvIiu5q2lksqPI7sfHcybn605zYG57zgGHfLB6lg+4Rbt+5ijhSgF
	i4DMw0BQFUXlw6D3xzBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sjJDE-0000000FdTZ-1l3p;
	Wed, 28 Aug 2024 13:59:52 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sjJAu-0000000FcvA-3spu;
	Wed, 28 Aug 2024 13:57:30 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id CB786A40BC7;
	Wed, 28 Aug 2024 13:57:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8A50CC581BF;
	Wed, 28 Aug 2024 13:41:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724852516;
	bh=a2swbrR98wISn+eYtffCdkI+7ImxeBOzuWP7GOb5gpY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Ufak4esb9vRxDU4GXWxGafmlJTaaq4y+jEUzLh7YVE4uiQMPQ83Ft6+XewFe94s4D
	 FNSQ6lEyET56QVve7F3q7ILt31ZxLKe/stiwlh1KArGfGN1zrJBxVz3Lb4UAYpXXbH
	 Xa1fAc4sQdH7f2f+Ia1OCsm3lDcOVwDwdd2qnY1z7dxxkPnXF0uCJxN75Wsa/lDK3Z
	 AwW/zPEUD4tQB7wVyZJYppBwcu0FJ4zD8yyJijlAQjkxBO2aztydzi3duvsjQ990CJ
	 31Fp721OMzvYoe8BbXyNS/QwrRMlSJQfFszL9R7HyGkyWXl8LMbBeV6tW5+NmhyeKX
	 1DPFCurUvPooA==
Date: Wed, 28 Aug 2024 08:41:55 -0500
From: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Emanuele Ghidoli <emanuele.ghidoli@toradex.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Daire McNamara <daire.mcnamara@microchip.com>,
	Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Maxime Ripard <mripard@kernel.org>,
	Masahiro Yamada <yamada.masahiro@socionext.com>,
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor.dooley@microchip.com>, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH 0/3] dt-bindings: gpio/pinctrl: add missing type to GPIO
 hogs
Message-ID: <20240828134155.GA3656223-robh@kernel.org>
References: <20240828-dt-bindings-gpio-hog-v1-0-63b83e47d804@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240828-dt-bindings-gpio-hog-v1-0-63b83e47d804@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240828_065729_056757_602F8496 
X-CRM114-Status: GOOD (  12.12  )
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

On Wed, Aug 28, 2024 at 11:35:56AM +0200, Krzysztof Kozlowski wrote:
> Merging
> =======
> Patches are independent and can go via different trees.
> 
> Description
> ===========
> DTS like:
> 
>     device {
>         compatible = "fcs,fxl6408";
>         dummy-hog;
>     };
> 
> should fail, but unfortunately it does not if "type: object" is missing.
> Add missing type, so this will properly trigger warning:
> 
>     dummy-hog: True is not of type 'object'
> 
> Best regards,
> Krzysztof
> 
> ---
> Krzysztof Kozlowski (3):
>       dt-bindings: gpio: fcs,fxl6408: add missing type to GPIO hogs
>       dt-bindings: pinctrl: qcom: add missing type to GPIO hogs
>       dt-bindings: gpio: simplify GPIO hog nodes schema

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
