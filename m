Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96E7AC369AB
	for <linux-riscv@archiver.kernel.org>; Fri, 18 Apr 2025 23:59:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2ods9XkpF567vQbA3HCkqhDeEZS11HFQjjzrifai74Q=; b=yWMLUsLFD2SWb4
	zt6zVeiTuVwyKgpPhxWZGeD3KuNKVXasxB15hFuJNaKk3q/lQmteV95HfRk7w+TKZB1avE1VmoyEl
	ApwYQx83uskiPZBGDSiQuB1FlCBYSWMIdH+tErxgPgFyOuiWMImz+wn0CsN0+yPrJZwGExar8Rudt
	RUOVtHd2GBPB02eMyGxsAcFBO8J8QVoeYiboKOGOt/oPCSfs/373Xpw3KNdYVbnOiJccdSNd1dC/b
	T9i3+n8sFMCeAb8z6FL7b+3FY5DHkDLn49CP6IEre7SMIfpkPs+0yLVM30UqYxtAFuNiljWzRdYcn
	wmS4zNkdwc264vwLAb7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5vc1-00000000Zsw-2UPU;
	Fri, 18 Apr 2025 23:59:13 +0000
Received: from woodpecker.gentoo.org ([140.211.166.183] helo=smtp.gentoo.org)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5vby-00000000ZsF-19LL
	for linux-riscv@lists.infradead.org;
	Fri, 18 Apr 2025 23:59:11 +0000
Received: from localhost (unknown [116.232.27.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dlan)
	by smtp.gentoo.org (Postfix) with ESMTPSA id 5850434301C;
	Fri, 18 Apr 2025 23:59:08 +0000 (UTC)
Date: Fri, 18 Apr 2025 23:59:04 +0000
From: Yixun Lan <dlan@gentoo.org>
To: Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/2] pinctrl: spacemit: add clock/reset support
Message-ID: <20250418235904-GYA38034@gentoo>
References: <20250416-02-k1-pinctrl-clk-v2-0-2b5fcbd4183c@gentoo.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250416-02-k1-pinctrl-clk-v2-0-2b5fcbd4183c@gentoo.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250418_165910_334105_930A34E9 
X-CRM114-Status: GOOD (  14.54  )
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

Hi Linus,

On 08:15 Wed 16 Apr     , Yixun Lan wrote:
> SpacemiT K1 pinctrl requires two clocks in order to be functional,
> also one reset line from hardware persepective.
> 
> In this series, adding clock property in dt-binding, and activate
> them in the driver. But for reset, making it optional for now.
> 
> For DT part patch, I plan to submit after clock driver merged.
> This may result dtb warnings in this version due to the mising
> clock property in pinctrl dt node.
> 
> Signed-off-by: Yixun Lan <dlan@gentoo.org>
> ---
> Changes in v2:
> - fix typo
> - drop the _optional_ API
> - Link to v1: https://lore.kernel.org/r/20250412-02-k1-pinctrl-clk-v1-0-e39734419a2d@gentoo.org
> 
> ---
> Yixun Lan (2):
>       dt-bindings: pinctrl: spacemit: add clock and reset property
>       pinctrl: spacemit: add clock support for K1 SoC
> 
>  .../bindings/pinctrl/spacemit,k1-pinctrl.yaml          | 18 ++++++++++++++++++
>  drivers/pinctrl/spacemit/pinctrl-k1.c                  | 10 ++++++++++
>  2 files changed, 28 insertions(+)
> ---
> base-commit: 0af2f6be1b4281385b618cb86ad946eded089ac8
> change-id: 20250412-02-k1-pinctrl-clk-9649d6ad22c4
> 

I think this series is good to go, can you queue for 6.16,
we need it along with clock merged (see link below)..

thanks

https://lore.kernel.org/r/174484549885.160158.3249067849153986093.b4-ty@gentoo.org


-- 
Yixun Lan (dlan)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
