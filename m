Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7938C021B0
	for <linux-riscv@archiver.kernel.org>; Wed, 19 Feb 2025 22:38:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YRXXO8eOVGXuOwvCmNB38awqFKZTWP/Wy+Tk7bMnHh0=; b=cZABiX9dQM/Bil
	hv1SX1IHAbdQyCwY/jAOEnhDnZlibQOre7fXlq6TthmcSR1+qoxLLY/3qDl0jYBrEKkqfuSoWkylf
	s3b58JqWr3AhN5fhmDFdRAOTgLMBzVoQ5mp+m4+NRm9oe2Nqn30Ny6PTOOQzNq2Jkw/sjirnel4NJ
	p3GOclIFfyiam6D3QtoCLPLWWAKfZU4Moqr1MS+7N0N6qEkEXOedBQOlVI+KjkXY9qeeJF4VU2WST
	ZUkeW6okXwYRu4SH/tfBiSTGy7SvfWtepwAyowdK3xODHo7pvASYXaIOzP+nkEdxtoYbpVwCp77jJ
	zTy7cMdj8dbSEiKkUuWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tksiN-0000000FUJZ-0ike;
	Wed, 19 Feb 2025 22:38:47 +0000
Received: from tor.source.kernel.org ([2600:3c04::f03c:95ff:fe5e:7468])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tkshG-0000000FTyo-16OT
	for linux-riscv@lists.infradead.org;
	Wed, 19 Feb 2025 22:37:39 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 252EA61201;
	Wed, 19 Feb 2025 22:37:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F3FF9C4CED1;
	Wed, 19 Feb 2025 22:37:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740004657;
	bh=d4I+/dbOHaSeZthBV2q6Z411QDo6FQ08GXJOnck9qbo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Dv+gLefWfY2jrPLivnYgsCm4f1DuV8/EmGcIURHVr7w4J8vei0IppHEY42BraKdCm
	 oeXpD/LCX4Hm4L9qcTxQ6nvPfQIB3y8J65D1mi3AxFmIyWJFU+Jwue4gq7zyfVzf3a
	 86oPwly8pCJazf4hwq86gNkd6NFpo6x21KXoxrGWA9zmEVbcFSbn8TE81ty1W+44ud
	 AtqlMplWx66aQT6hc6EbN5RNniNlzanPPmJbz5blsFigOTcLNNm/v4v70fFjAK/Vtj
	 N4dSkVaE1q5ZONx//lzz1wiJR0Jz3VSBBeHsoG88HHUJ1/ibdxQlMMrH/KwUPW4S2D
	 rEpjPI1OEntWw==
Date: Wed, 19 Feb 2025 16:37:35 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Yixun Lan <dlan@gentoo.org>
Cc: linux-mmc@vger.kernel.org, Adrian Hunter <adrian.hunter@intel.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, spacemit@lists.linux.dev,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	Ulf Hansson <ulf.hansson@linaro.org>, devicetree@vger.kernel.org
Subject: Re: [PATCH RFC 1/2] dt-bindings: mmc: spacemit,sdhci: add support
 for K1 SoC
Message-ID: <174000465542.3097183.7038527174083018186.robh@kernel.org>
References: <20250213-20-k1-sdhci-v1-0-1f4362a980cd@gentoo.org>
 <20250213-20-k1-sdhci-v1-1-1f4362a980cd@gentoo.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250213-20-k1-sdhci-v1-1-1f4362a980cd@gentoo.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250219_143738_356584_069E918B 
X-CRM114-Status: UNSURE (   8.29  )
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


On Thu, 13 Feb 2025 18:58:24 +0800, Yixun Lan wrote:
> Add support for the SD/eMMC Host Controller found in SpacemiT K1 SoC,
> The controller supports data transmission of MMC, SDIO, SD protocol.
> 
> Signed-off-by: Yixun Lan <dlan@gentoo.org>
> ---
>  .../devicetree/bindings/mmc/spacemit,sdhci.yaml    | 53 ++++++++++++++++++++++
>  1 file changed, 53 insertions(+)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
