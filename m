Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21607C30653
	for <linux-riscv@archiver.kernel.org>; Wed, 26 Jun 2024 10:41:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UnCHo5M06UOQZKWmJuQJShSjC26MNxq3gS7YYUzgYoQ=; b=OzIElEL1aBGYVS
	wy8DTQIpWEy50BhGeerhI0i1ZPi2sN1uF6E2qob28Dt48xOUrNI2hYprOI/H4hi25fc3q0V5Aed8w
	qrT+XmzMsOz8rvHyVuFBUivW9c7OPjvTCAu12ZCg8FtwkR7JPZFcPb1Ru5Wsn02ZlsbLZCkYu6BPv
	VZMDnKmDYcRGiYZXDjd+BRKKJc8kuvjR8cXeOm93SlmY+60jW3xngHloucx2RmYK0F13caiUzjTf1
	JP5DIoUoOMIpfu+efOb6Q1fuGDC3PSE/uVdlPhC5EljFi9btD9ZZleWQuQ5txLRZsPdmwGrhHUXvn
	RdIOlkRBxMOV2aHiwtjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sMQ5B-00000006Ngj-3KgZ;
	Wed, 26 Jun 2024 10:40:57 +0000
Received: from mail-yb1-xb2f.google.com ([2607:f8b0:4864:20::b2f])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sMQ55-00000006Ndx-2oBS
	for linux-riscv@lists.infradead.org;
	Wed, 26 Jun 2024 10:40:55 +0000
Received: by mail-yb1-xb2f.google.com with SMTP id 3f1490d57ef6-dfef5980a69so6461351276.3
        for <linux-riscv@lists.infradead.org>; Wed, 26 Jun 2024 03:40:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1719398451; x=1720003251; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KHbQKOiYe+Ibua4xAi15PJl+V4d0EJrIgF7ce4mlbFQ=;
        b=wATRUmnSALzCnyzXDRw78IYMtccWBCWvs3qe80V/PQFTkoQEch2xmgJIl4UPAFSIR1
         PGzTvl9QTC6FPoFWcFRjpTH0JuIyKNeb0LLPN4WyjJCkmL+TOBLQV1b9Pcfuq+GlisEv
         qZQTn1GzuN3pjsuBYavwjWm3gsBb0aThuAb6nlPpwuCmEa1VBgksFjtAnyNc0Byzw/RA
         85xkU9SxFUygo9yktHu/FMOBYrgHcqjL084xGDc4INc3Rx3XVQByH6mCbSZcFLheV2Wt
         jnbdZYg5WkwSZA28F70fGgFpIYp89KxwPfolo6KvW4cV0nGNyS8aXdUHp82N4wgpjinY
         MTzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719398451; x=1720003251;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KHbQKOiYe+Ibua4xAi15PJl+V4d0EJrIgF7ce4mlbFQ=;
        b=iFMDISHT3VmhP//hoocMy/Vzk27ULBY8p3MoWh/Ktmih0n3XLlBgvIM2Y//nKf4bH5
         zXBEpBm+4FB9l9tpb9B/LZ68tYRNiQ86TJvPYL24SZV0vjhXokHMvp2Gkp5su5ycvbVf
         hgxT3bKJCOc/G8Nc175DcdsSdED+PaauqJoznx718ZjepBSEmbNvJxVkxxn8ForXbSyk
         +6UAGFpwcwUz5EcNNAuo67jD4845EkgngMg/gs1oh/XdtpMmywNfa0H9Za/OBL+b2tGU
         FIUbCcVhG6Bxo0RI6vmcbHZjlj5c1SQ9MEdbUgv42ptcOF6/t0PPRWUyo/Us4Bq09/Oi
         htIw==
X-Forwarded-Encrypted: i=1; AJvYcCU9pHtKBFgxjV8BWpBdCDPtWQX9Bg4LAvMrv0Z6MPSXNzevIR5bTIEpkqxhes77Lq+O633Mizkv11GZAzGJPHBtYytAd7uqhtFOcC2AqXMV
X-Gm-Message-State: AOJu0YyERnU9QFGdExTMUgYc2nKCpS1xKb7zC1rdLwy4cofYJkTJV+tL
	xOM40P1zS036VJP7f4TN3bxgeNpuuOarX9bEG55hWxcUpwbHtMjG+Q4XR/cFrUnvIsUXsiZBsoG
	rKKjJ+YnGiG5X6FZ0X1TIHh7Y1ji7TWAnZitbWg==
X-Google-Smtp-Source: AGHT+IGAQdQECALwFQiRgkrKA/rZBEJOAnkCpPbedoTQq7/jt7W9vOb6wQcj2qKoWUKoPCAEcM15HUQq3HQFJjgWzyA=
X-Received: by 2002:a25:c553:0:b0:dfa:6e39:95b0 with SMTP id
 3f1490d57ef6-e030107f616mr10069878276.49.1719398450656; Wed, 26 Jun 2024
 03:40:50 -0700 (PDT)
MIME-Version: 1.0
References: <20240504-pinctrl-cleanup-v2-0-26c5f2dc1181@nxp.com>
 <20240504-pinctrl-cleanup-v2-20-26c5f2dc1181@nxp.com> <171939733731.25849.13373950874840419376.b4-ty@linaro.org>
In-Reply-To: <171939733731.25849.13373950874840419376.b4-ty@linaro.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 26 Jun 2024 12:40:36 +0200
Message-ID: <CACRpkdastCME_0BWjcaNc0Fw8qsLAGgoQUMi7g8sEP+xT=T_tQ@mail.gmail.com>
Subject: Re: (subset) [PATCH v2 20/20] pinctrl: samsung: Use scope based
 of_node_put() cleanups
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, 
	Dvorkin Dmitry <dvorkin@tibbo.com>, Wells Lu <wellslutw@gmail.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Emil Renner Berthing <kernel@esmil.dk>, Jianlong Huang <jianlong.huang@starfivetech.com>, 
	Hal Feng <hal.feng@starfivetech.com>, Orson Zhai <orsonzhai@gmail.com>, 
	Baolin Wang <baolin.wang@linux.alibaba.com>, Chunyan Zhang <zhang.lyra@gmail.com>, 
	Viresh Kumar <vireshk@kernel.org>, Shiraz Hashim <shiraz.linux.kernel@gmail.com>, soc@kernel.org, 
	Krzysztof Kozlowski <krzk@kernel.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>, 
	Alim Akhtar <alim.akhtar@samsung.com>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Patrice Chotard <patrice.chotard@foss.st.com>, Heiko Stuebner <heiko@sntech.de>, 
	Damien Le Moal <dlemoal@kernel.org>, Ludovic Desroches <ludovic.desroches@microchip.com>, 
	Nicolas Ferre <nicolas.ferre@microchip.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
	Dong Aisheng <aisheng.dong@nxp.com>, Fabio Estevam <festevam@gmail.com>, 
	Shawn Guo <shawnguo@kernel.org>, Jacky Bai <ping.bai@nxp.com>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Chester Lin <chester62515@gmail.com>, 
	Matthias Brugger <mbrugger@suse.com>, Ghennadi Procopciuc <ghennadi.procopciuc@oss.nxp.com>, 
	Sean Wang <sean.wang@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Andrew Jeffery <andrew@codeconstruct.com.au>, 
	Joel Stanley <joel@jms.id.au>, Dan Carpenter <dan.carpenter@linaro.org>, 
	Tony Lindgren <tony@atomide.com>, Stephen Warren <swarren@wwwdotorg.org>, 
	"Peng Fan (OSS)" <peng.fan@oss.nxp.com>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, 
	linux-stm32@st-md-mailman.stormreply.com, linux-samsung-soc@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, linux-rockchip@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	imx@lists.linux.dev, linux-aspeed@lists.ozlabs.org, openbmc@lists.ozlabs.org, 
	Peng Fan <peng.fan@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240626_034051_837766_7E4ABF8D 
X-CRM114-Status: UNSURE (   8.69  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gV2VkLCBKdW4gMjYsIDIwMjQgYXQgMTI6MjLigK9QTSBLcnp5c3p0b2YgS296bG93c2tpCjxr
cnp5c3p0b2Yua296bG93c2tpQGxpbmFyby5vcmc+IHdyb3RlOgo+IE9uIFNhdCwgMDQgTWF5IDIw
MjQgMjE6MjA6MTggKzA4MDAsIFBlbmcgRmFuIChPU1MpIHdyb3RlOgo+ID4gVXNlIHNjb3BlIGJh
c2VkIG9mX25vZGVfcHV0KCkgY2xlYW51cCB0byBzaW1wbGlmeSBjb2RlLgo+ID4KPiA+Cj4KPiBB
cHBsaWVkLCB0aGFua3MhCj4KPiBbMjAvMjBdIHBpbmN0cmw6IHNhbXN1bmc6IFVzZSBzY29wZSBi
YXNlZCBvZl9ub2RlX3B1dCgpIGNsZWFudXBzCj4gICAgICAgICBodHRwczovL2dpdC5rZXJuZWwu
b3JnL3BpbmN0cmwvc2Ftc3VuZy9jLzcwNzgwN2Y0YzExMjhlMzk0NDI1MTllODQ5ZTRjZTBiN2My
OWIxMTAKCk9LIEkgZHJvcHBlZCBpdCBmcm9tIG15IHF1ZXVlIQoKWW91cnMsCkxpbnVzIFdhbGxl
aWoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4
LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6
Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
