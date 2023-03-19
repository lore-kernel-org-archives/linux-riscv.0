Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14EB7C7618A
	for <linux-riscv@archiver.kernel.org>; Sun, 19 Mar 2023 21:15:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=H3tYDuw97fkcx6yxzaJfWcdbTlgt8o6b0OMJnUAxtYU=; b=tsyOeydax9amGN
	oELJcdDOoRKnRrOkTe/LYg9NV7OuBx502Yy++fo5oDfDv2R/QfzQD6wTkuU1M99Dge9ISqJ0EDB0A
	Kut3RATVS21WTB8tt06BDorSH2/scpieS/84T/UAIHPjnozSpdNWl1zfgqpHScTZt9r8D58G8Xw+w
	NuC5FBP0Fa7TwAfD7xVPapJoy6DC/Ei0AOE/CqE7vsycnu3ajOSZofif1ZD//nfGzUI97EGNqpGT3
	9wG6pauzRiv+y3kaXw6v50Wktkx3q4QCsB+aQB80F0U9Q3AhANWueq2MZF/myW2W2CuzoN8k62uzC
	/6Z8FpBr3uYzxs3IbJmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pe0Mr-007SLr-02;
	Sun, 19 Mar 2023 21:15:05 +0000
Received: from mail-yb1-xb2b.google.com ([2607:f8b0:4864:20::b2b])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pe0Mn-007SIf-2o
	for linux-riscv@lists.infradead.org;
	Sun, 19 Mar 2023 21:15:03 +0000
Received: by mail-yb1-xb2b.google.com with SMTP id e71so10911360ybc.0
        for <linux-riscv@lists.infradead.org>; Sun, 19 Mar 2023 14:15:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679260500;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=o0iorqXQgWfUsmZ323+Wyn0oeyKtqb16TQ+B351+3qA=;
        b=PqJlDX0gTYbEtn8Inp0Uq9s7u/HTYqGjD1dgyn2nK1HN81qzYpJ9YK87P3/GK9pyjS
         NIox5xD6dYqMCgOx32vaNV7CStlqriTHBcn+xVBoWVHv64f9OkeU7yqIs+ePEjrucDlf
         hLYQeSFr+uU2/M2tfVJ5lrNZIIQBGZMUOQR/x/Pb64/87ScadQHktjIXmYzf0soAd8Cm
         1/vXcIPIvmyXhvwjyg9zJXzO53/CrLg2sarThltEBai116bRrT//SIC4+loKJSCgmFoX
         qFt40qfje7rzwaijTzBX1bDxUpXmUPSUnzUEnrOEFINsNM2XFX8efE0qIlI4ANoUsKOX
         jQCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679260500;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=o0iorqXQgWfUsmZ323+Wyn0oeyKtqb16TQ+B351+3qA=;
        b=K8jxZ7QXZKJ3E0an6uZuNb5Dm6JCSMRYQXDo7I3s8wd27GbIxGhMyDiE/qz0QMPajA
         GKZvYVU2XGTmjiDt+oPQCzTfWX0Id5uBhFlyHppKqVOXttKBNV/JPMEuiwrDkY7dp9ed
         RVjLzLD1vaeu3ldn4PPZICyPI7Z/YjkPCs1xKWrFcJ426dcqLSe9NfpFHUvcaaz/FnZS
         AcO35aQGJ6OugIXQjaJtS0Drl+LWNwqgGC7sgxyMbY/x36gbY+jC+doi5d1aCmpadj2v
         7itFT+Nj0DdeA3bdyLzVzDlNA9lHAh7Q/GP29KZOWduMYVheHPOUaFhORFJWJ6BzY/tQ
         46yQ==
X-Gm-Message-State: AO0yUKUr9veHoe1HQV1DAGBhnRu61/7JUs41Ku91voGdKGtA13VNrVzP
	lMKhhBVH3REnwbKLfAfEzq0XvMFciBejahI0kMQs3Q==
X-Google-Smtp-Source: AK7set88lgxJVA166ieuR2TTLZeS1J0rp7AfomiAt3xMAZzNkfr7DVMxQnogtWZ9zBjTSPGk/rTQReVq7hLkbmXRmbU=
X-Received: by 2002:a05:6902:1143:b0:aa9:bd2e:3746 with SMTP id
 p3-20020a056902114300b00aa9bd2e3746mr2997588ybu.4.1679260499808; Sun, 19 Mar
 2023 14:14:59 -0700 (PDT)
MIME-Version: 1.0
References: <20230317233623.3968172-1-robh@kernel.org>
In-Reply-To: <20230317233623.3968172-1-robh@kernel.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Sun, 19 Mar 2023 22:14:48 +0100
Message-ID: <CACRpkdYFJ-q9OT2b7U-CP08XGfdoD-qN3k3C2KBHhnuBdfSi7A@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: pinctrl: Drop unneeded quotes
To: Rob Herring <robh@kernel.org>
Cc: =?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.de>, 
	Manivannan Sadhasivam <mani@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, Hector Martin <marcan@marcan.st>, Sven Peter <sven@svenpeter.dev>, 
	Alyssa Rosenzweig <alyssa@rosenzweig.io>, Andrew Jeffery <andrew@aj.id.au>, Joel Stanley <joel@jms.id.au>, 
	Damien Le Moal <damien.lemoal@wdc.com>, Charles Keepax <ckeepax@opensource.cirrus.com>, 
	Richard Fitzgerald <rf@opensource.cirrus.com>, Dong Aisheng <aisheng.dong@nxp.com>, 
	Fabio Estevam <festevam@gmail.com>, Shawn Guo <shawnguo@kernel.org>, Jacky Bai <ping.bai@nxp.com>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Sascha Hauer <s.hauer@pengutronix.de>, 
	NXP Linux Team <linux-imx@nxp.com>, Sean Wang <sean.wang@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Andy Gross <agross@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Heiko Stuebner <heiko@sntech.de>, 
	Tomasz Figa <tomasz.figa@gmail.com>, Sylwester Nawrocki <s.nawrocki@samsung.com>, 
	Alim Akhtar <alim.akhtar@samsung.com>, Kunihiko Hayashi <hayashi.kunihiko@socionext.com>, 
	Masami Hiramatsu <mhiramat@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Emil Renner Berthing <kernel@esmil.dk>, 
	Jianlong Huang <jianlong.huang@starfivetech.com>, Dvorkin Dmitry <dvorkin@tibbo.com>, 
	Wells Lu <wellslutw@gmail.com>, Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>, 
	Michal Simek <michal.simek@xilinx.com>, linux-arm-kernel@lists.infradead.org, 
	linux-actions@lists.infradead.org, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-sunxi@lists.linux.dev, asahi@lists.linux.dev, 
	linux-aspeed@lists.ozlabs.org, openbmc@lists.ozlabs.org, 
	linux-riscv@lists.infradead.org, patches@opensource.cirrus.com, 
	alsa-devel@alsa-project.org, linux-mediatek@lists.infradead.org, 
	linux-arm-msm@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	linux-rockchip@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230319_141501_916726_46B93A7F 
X-CRM114-Status: UNSURE (   8.36  )
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

T24gU2F0LCBNYXIgMTgsIDIwMjMgYXQgMTI6MzbigK9BTSBSb2IgSGVycmluZyA8cm9iaEBrZXJu
ZWwub3JnPiB3cm90ZToKCj4gQ2xlYW51cCBiaW5kaW5ncyBkcm9wcGluZyB1bm5lZWRlZCBxdW90
ZXMuIE9uY2UgYWxsIHRoZXNlIGFyZSBmaXhlZCwKPiBjaGVja2luZyBmb3IgdGhpcyBjYW4gYmUg
ZW5hYmxlZCBpbiB5YW1sbGludC4KPgo+IFNpZ25lZC1vZmYtYnk6IFJvYiBIZXJyaW5nIDxyb2Jo
QGtlcm5lbC5vcmc+CgpMZXNzIGJhZCBleGFtcGxlcyA9IGdvb2QuCgpSZXZpZXdlZC1ieTogTGlu
dXMgV2FsbGVpaiA8bGludXMud2FsbGVpakBsaW5hcm8ub3JnPgoKWW91cnMsCkxpbnVzIFdhbGxl
aWoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4
LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6
Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
