Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 559ABC5516F
	for <linux-riscv@archiver.kernel.org>; Sat,  1 Aug 2026 21:16:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=W/L2zJgic5S9BPfYsG1TXbjFhWBvmxmfnn5fSNqLyhM=; b=r4f6UvKA0n5mIN
	x60qI7QVT3AeJjBHr7LMnvqX8haY6wWMWWtYQqjy5kRy4/wBf/Onk3+clPMZg8fTStoweSJkaPyEr
	4+zQPRbVlJ4j8PlL3Xrrw15Kqj772hy6nPbzq7omowHifyaT2aLzZjwVWLOYUao+H/pmo1PFBuhyq
	O4WNdAUz5QBEmAjWPWP6mSJbVub/djVHLLvLg7/lSeDinmMudxgAoMc+548AjKEqPm7Ptbt99YEzv
	c13br7hSAzotM4k/BMdVGV7ZX+3k33AUa1g2B+I6l9wB0Vsl4FiJLZWBKaq6hRHlXcR0YLTuaQ8Hh
	ZaPpDa1zL1SQ2dD4mxbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqH3b-0000000F6Lm-3pEo;
	Sat, 01 Aug 2026 21:15:47 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqH3Z-0000000F6LO-2xvf;
	Sat, 01 Aug 2026 21:15:45 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 9FB4643AEE;
	Sat,  1 Aug 2026 21:15:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DB1621F00AC4;
	Sat,  1 Aug 2026 21:15:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785618944;
	bh=ALbadrPlzW4YdLs9fKrKevLx7dPEsNFJd83WcTvC4co=;
	h=Date:Subject:To:References:From:In-Reply-To;
	b=iu2suDeRu/dT8WnlAiU+FK9hRedcQZ3iPHg2hYKJN80fk09m4XzYI9nVyPNEaqZxa
	 REtFtLP5uBVTM+EjII/Pq2mthEdWYqGKeYz9v18FgcbvdJOyzkV3dO7ahaaJsaneZo
	 Nj/lmFrmw2GUo3yDwd4GcPvXOPAIaYWm1+JE387Q1t17HQeh+thY7ma+gtsatcMRSW
	 fxImTGZJ9SmQAxQNHKBBgGEZfmaq1RkbFe6VWm2eskesrtnAAqVi8GKAMpnMrGrin3
	 HZmaSHy271wjIwRn71y/FeeZXnOA3FtU2qpJbZpU43UWLquFFKChIveXiKBHXb9WCD
	 nOCOrht2bkZ2g==
Message-ID: <4b763098-a91e-46f0-88c9-d08670d31328@kernel.org>
Date: Sat, 1 Aug 2026 14:15:40 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dt-bindings: Correct white-space style
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>,
 Suzuki K Poulose <suzuki.poulose@arm.com>, Mike Leach <mike.leach@arm.com>,
 James Clark <james.clark@linaro.org>, Leo Yan <leo.yan@arm.com>,
 Damien Le Moal <dlemoal@kernel.org>, Niklas Cassel <cassel@kernel.org>,
 Jyri Sarha <jyri.sarha@iki.fi>,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
 Patrice Chotard <patrice.chotard@foss.st.com>,
 Andi Shyti <andi.shyti@kernel.org>, Jassi Brar <jassisinghbrar@gmail.com>,
 Lee Jones <lee@kernel.org>, Johannes Berg <johannes@sipsolutions.net>,
 Jeff Johnson <jjohnson@kernel.org>, Viresh Kumar <vireshk@kernel.org>,
 Nishanth Menon <nm@ti.com>, Stephen Boyd <sboyd@kernel.org>,
 Yangbo Lu <yangbo.lu@nxp.com>, =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?=
 <ukleinek@kernel.org>, Paul Walmsley <pjw@kernel.org>,
 Samuel Holland <samuel.holland@sifive.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Richard Cochran <richardcochran@gmail.com>,
 Jens Wiklander <jenswi@kernel.org>,
 Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>,
 YC Hung <yc.hung@mediatek.com>, Svyatoslav Ryhel <clamor95@gmail.com>,
 Sean Wang <sean.wang@kernel.org>, Frank Li <Frank.Li@nxp.com>,
 Peter Ujfalusi <peter.ujfalusi@gmail.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 coresight@lists.linaro.org, linux-arm-msm@vger.kernel.org,
 linux-ide@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-mediatek@lists.infradead.org, linux-gpio@vger.kernel.org,
 linux-i2c@vger.kernel.org, mfd@lists.linux.dev,
 linux-wireless@vger.kernel.org, ath10k@lists.infradead.org,
 linux-pm@vger.kernel.org, netdev@vger.kernel.org, linux-pwm@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-usb@vger.kernel.org
References: <20260801195613.235430-2-krzysztof.kozlowski@oss.qualcomm.com>
From: Jeff Johnson <jjohnson@kernel.org>
Content-Language: en-US
In-Reply-To: <20260801195613.235430-2-krzysztof.kozlowski@oss.qualcomm.com>
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

On 8/1/2026 12:56 PM, Krzysztof Kozlowski wrote:
> Correct a few white-space issues, like double space after '=' or before
> bracket '{' characters, which will be flagged by dt-check-style.  No
> functional changes.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> 
> ---
>  .../bindings/net/wireless/qcom,ath10k.yaml    | 34 +++----

Acked-by: Jeff Johnson <jjohnson@kernel.org> # qcom,ath10k.yaml



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
