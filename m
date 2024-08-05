Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 506BFC3DA7F
	for <linux-riscv@archiver.kernel.org>; Mon,  5 Aug 2024 20:12:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VwnxS0NATx9p6xTOd+9Kb59nwWzjK/uWicouEiIjYd0=; b=lc0Vr57UyrZ/I/
	88xipg/ir8BnLhkOtm3h6UKQqNoXQsg5xvEqHsnNzfUR++HgH+GtE/NERwBO8FfZ45Q1xb0AjM2PK
	Uc7JwPNXYwcm2oKqPLOnJnSo1p+D2p62fT/Hw81vZPPrg9wUkHsNq93ggC2F75qOxBGJJz0ex61Lx
	ZJzexgzAqdq7hQu02dYZaFF6aMPz7vvEV2kpSf9ACIrGdr9vkmJQNUXNzpGUzhS8f4pRKIDlT8RAw
	HrrIWWhydXITruIqF/N45FSFYfx0fOL0At0oqjGdDX4dfXPFM86Voy6wR7i0aC6pBskwoINfr1PV0
	IFQSeACW7j3RCrCx4Q5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sb44I-0000000H8hm-1DXS;
	Mon, 05 Aug 2024 20:12:34 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sb44F-0000000H8hG-0wxw
	for linux-riscv@lists.infradead.org;
	Mon, 05 Aug 2024 20:12:32 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 5B98BCE0B66;
	Mon,  5 Aug 2024 20:12:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 64130C32782;
	Mon,  5 Aug 2024 20:12:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722888748;
	bh=qYBvaHL3vD4VHbkp3Ybz7XYW3bPDmyd8NoKhaj/sNmM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=aovcIPLPARzezThzuLLHwIqhKDUu8VXJPp/l7XNL2hAx5LmhKDpUb+pTvo2HDSZ3z
	 WkTTqszt2lxUUL4yEr/ECGL2raULibk++qIU5aZPxX1OGtLIl1kHpKC6WCms1iR0EH
	 10ZhMT3IzDgODqzgSrldtxSdYhtg1N0b/upbLqhZjVM1chy7upSkoNQfd5BHYAjQoF
	 TfcqY+FHbF4+P8aFA9ryf3aTfbFKNnUERfsUkqHLb1MG1d0EA9U66/DRvh/J3Iz5xD
	 QBtGYggbK7ZrDBbJN38u9SzzrJLqnSCNZtWctHkOn4QcY93zFC7b/fOzzvUC++uHNq
	 Z83SRnp20XKTg==
Date: Mon, 5 Aug 2024 14:12:27 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Inochi Amaoto <inochiama@outlook.com>
Cc: Yixun Lan <dlan@gentoo.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen Wang <unicorn_wang@outlook.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Jisheng Zhang <jszhang@kernel.org>, linux-riscv@lists.infradead.org,
	Haylen Chu <heylenay@outlook.com>, devicetree@vger.kernel.org,
	Guo Ren <guoren@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Liu Gui <kenneth.liu@sophgo.com>,
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
	Drew Fustini <dfustini@baylibre.com>
Subject: Re: [PATCH v4 1/7] dt-bindings: pinctrl: Add pinctrl for Sophgo
 CV1800 series SoC.
Message-ID: <172288873889.3218811.8560482319769136077.robh@kernel.org>
References: <IA1PR20MB4953DC78BB0FE0C57EA94F91BBB32@IA1PR20MB4953.namprd20.prod.outlook.com>
 <IA1PR20MB4953680DE7977CAD906DBDB4BBB32@IA1PR20MB4953.namprd20.prod.outlook.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <IA1PR20MB4953680DE7977CAD906DBDB4BBB32@IA1PR20MB4953.namprd20.prod.outlook.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240805_131231_476969_F4474AB7 
X-CRM114-Status: UNSURE (   8.54  )
X-CRM114-Notice: Please train this message.
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


On Fri, 02 Aug 2024 08:35:16 +0800, Inochi Amaoto wrote:
> Add pinctrl support for Sophgo CV1800 series SoC.
> 
> Signed-off-by: Inochi Amaoto <inochiama@outlook.com>
> ---
>  .../pinctrl/sophgo,cv1800-pinctrl.yaml        | 122 +++++++++++++++++
>  include/dt-bindings/pinctrl/pinctrl-cv1800b.h |  63 +++++++++
>  include/dt-bindings/pinctrl/pinctrl-cv1812h.h | 127 ++++++++++++++++++
>  include/dt-bindings/pinctrl/pinctrl-cv18xx.h  |  19 +++
>  include/dt-bindings/pinctrl/pinctrl-sg2000.h  | 127 ++++++++++++++++++
>  include/dt-bindings/pinctrl/pinctrl-sg2002.h  |  79 +++++++++++
>  6 files changed, 537 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/pinctrl/sophgo,cv1800-pinctrl.yaml
>  create mode 100644 include/dt-bindings/pinctrl/pinctrl-cv1800b.h
>  create mode 100644 include/dt-bindings/pinctrl/pinctrl-cv1812h.h
>  create mode 100644 include/dt-bindings/pinctrl/pinctrl-cv18xx.h
>  create mode 100644 include/dt-bindings/pinctrl/pinctrl-sg2000.h
>  create mode 100644 include/dt-bindings/pinctrl/pinctrl-sg2002.h
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
