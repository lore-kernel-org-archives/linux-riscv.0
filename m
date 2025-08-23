Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CD6FCA0EE4
	for <linux-riscv@archiver.kernel.org>; Sat, 23 Aug 2025 19:09:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=s50c4bGDE0dWGDigbgZiZEBp9j98TW6aYMmrpBgbVH8=; b=k4FSH5L+fpGR8Z
	wDm+uYW5PAnGYIrGHcWqLYpm/3pWIt0HatdLUb19fppTyJZTNv2jfqPLBfsHRJU/3x7XXtSBHcLeM
	N2GZwiHfqMniPQTqyGUwa4qr4/4Msk6vmh+LHUeP41kwVaWXWjIn1JgFm/Hq1pr5fcKClYYwAZAHa
	jiCh8zQDxs2zuD0mSf2bgrvV9tCqIt1SPR24PnGe0ITOKmYSBFs6buNyyDNY1OzsPeEHRvzN0lSoT
	rqW07W8UsHOyw47g58Y9yXE2EH9lMZ1dinPr7nzkwAPlxL+oolzbh0Pr7ofjOrnNksxHARJVBBprF
	P5cgVZ1af2jz/jxoL5gA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uptbv-00000005DQe-1juv;
	Sat, 23 Aug 2025 19:09:07 +0000
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uprS8-000000055Zp-0faL
	for linux-riscv@lists.infradead.org;
	Sat, 23 Aug 2025 16:50:54 +0000
Received: by mail-ed1-x52f.google.com with SMTP id 4fb4d7f45d1cf-6188b668b52so413667a12.1
        for <linux-riscv@lists.infradead.org>; Sat, 23 Aug 2025 09:50:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755967850; x=1756572650; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rswAVyuJvRa6TX9BXHZuTzZwEBPSMziKik/9EoWIi4w=;
        b=i8UlaQudxoajob1mcKBtzyouQIBmTYNfu0L9FfYNG/Cx//Wvkq6EiQL7CenouqAiBd
         /b5jIynMPVcrsokois2CjdMW7122dR7jLMT+3FUi4dQsCeIiL2svVwRkak5mRwV3ePRr
         bKI6q3sM6lzfi40RJxfLJjk0TpJOgDndZgEqvIjZfgUbKFozMpO6/R1MoYPtGtz9+vZO
         tgRbGiPJ23i8/+MUtOz2ZJe130M8oOBU9ORkoAzmX7RaIEfrehDWhO1KU6Mu27z3bLs8
         gFv1t99bElrx0QkEyddrA/I0/5r4jHHj4YcQyiimICMeABLHq0VNZueLJaV+GjP1k0CI
         dmQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755967850; x=1756572650;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rswAVyuJvRa6TX9BXHZuTzZwEBPSMziKik/9EoWIi4w=;
        b=MUh6h2hSvGuOyFEyacArXAj90/bLBgd7sk29p6zVaxiRBx4Wis0fnBhotyIxjusCk2
         TNOM1xFWfKyo7ci9s/DIdvnmMCEDv1yJyd9P6gvP3aF3uBa3nbsA3/Ztkyequr+UPGl1
         RaBigS0S/KmsbH0FS4x1+XNvVduvGwuffnRmIq14lnSAA5vk8SlQfqsteoGueoCp8wvN
         dLMjlc9KI2HTemvVvMH45LKVDIvZjkIlItJ3TiVYWXTO6izJkChb3klPRyY9zVtq7Wg7
         SSHvKHV/arJwQLBCl+8FsZoYACJFBaqtRYw+iqAUTcfR42RRcU8QM5ZCOHkiF1zE/DXI
         hIKw==
X-Forwarded-Encrypted: i=1; AJvYcCXP50OADrplq5re+wloxRdL9KmIkCApVrWq7QnAQ3tjiYw2WppLvtj3GsTDJmcaLoEMPT9PViTPqGk6mw==@lists.infradead.org
X-Gm-Message-State: AOJu0Yyhq/6rr1jnj/EsZa/cseift+9MFkjMDms4j7aLRNLKIWYEWP49
	0CIDtICduynT5+QOQYA03zNbgNr2JrdMGsqEGDVaG6UAj8tQJ8Hv41r5z4P6h9Wi3hE=
X-Gm-Gg: ASbGncvRR54sZ/Lm5EewMRiYLXJ9WF8I+M4GSoTU/irz0qv5SLOIU+TIgEWyJXKTI5Y
	YtpZJpdi1uP2N3n/3XscpAXirbkie7tbylLPS1HZF/3j1hXtYEpnBK/GSkYK7pspJ82LCSa7Pa6
	XfGzj9857HSwnSpltuGUfYuiHbjN1QZdBJzQFq5WFzozPhWY0tVzV9QexGdOr2k2b4Kjx22PY8+
	WvGLqym1uFy7Bjxf+UsqlVSM/o7Xf2KvhMSYvkA/UGFNIO+H90dhUHi68G9JCK1LUxO94u2EaIy
	D70nXiuj847P5Uv4vS4hlqN9uvypuT37sOgrpbDRKsG0v/Y/OWxj+Phnp1t+v/MnD0u18Ivehm/
	1pAWeGqybVgpo0gOti1LWE76Ji4Tuk+ofOCOYNt8=
X-Google-Smtp-Source: AGHT+IHjBstjuzxQsJVLkeGYHgOE3wWdKaHmumAPQvcdN50PYZzwBsMeGzXzhJUjnQCkGBQZZA30xg==
X-Received: by 2002:a05:6402:274e:b0:61a:927b:a79c with SMTP id 4fb4d7f45d1cf-61c1b703ddfmr2766014a12.8.1755967850448;
        Sat, 23 Aug 2025 09:50:50 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-61c312c4cdesm1797880a12.23.2025.08.23.09.50.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 23 Aug 2025 09:50:49 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Sudeep Holla <sudeep.holla@arm.com>, 
 Cristian Marussi <cristian.marussi@arm.com>, 
 Chen Wang <unicorn_wang@outlook.com>, Inochi Amaoto <inochiama@gmail.com>, 
 Nicolas Ferre <nicolas.ferre@microchip.com>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
 Paul Cercueil <paul@crapouillou.net>, 
 Keguang Zhang <keguang.zhang@gmail.com>, 
 Taichi Sugaya <sugaya.taichi@socionext.com>, 
 Takao Orito <orito.takao@socionext.com>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Jacky Huang <ychuang3@nuvoton.com>, 
 Shan-Chun Hung <schung@nuvoton.com>, Vladimir Zapolskiy <vz@mleia.com>, 
 Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Samuel Holland <samuel.holland@sifive.com>, Yixun Lan <dlan@gentoo.org>, 
 Steen Hegelund <Steen.Hegelund@microchip.com>, 
 Daniel Machon <daniel.machon@microchip.com>, UNGLinuxDriver@microchip.com, 
 Orson Zhai <orsonzhai@gmail.com>, 
 Baolin Wang <baolin.wang@linux.alibaba.com>, 
 Chunyan Zhang <zhang.lyra@gmail.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Michal Simek <michal.simek@amd.com>, Maxime Ripard <mripard@kernel.org>, 
 =?utf-8?q?Andreas_F=C3=A4rber?= <afaerber@suse.de>, 
 Manivannan Sadhasivam <mani@kernel.org>, Sven Peter <sven@kernel.org>, 
 Janne Grunau <j@jannau.net>, Alyssa Rosenzweig <alyssa@rosenzweig.io>, 
 Neal Gompa <neal@gompa.dev>, Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>, 
 Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Max Filippov <jcmvbkbc@gmail.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Daniel Palmer <daniel@thingy.jp>, Romain Perier <romain.perier@gmail.com>, 
 Andrew Lunn <andrew@lunn.ch>, Gregory Clement <gregory.clement@bootlin.com>, 
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Heiko Stuebner <heiko@sntech.de>, 
 Andrea della Porta <andrea.porta@suse.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Qin Jian <qinjian@cqplus1.com>, Viresh Kumar <vireshk@kernel.org>, 
 Ulf Hansson <ulf.hansson@linaro.org>, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>, 
 Alex Helms <alexander.helms.jy@renesas.com>, 
 Linus Walleij <linus.walleij@linaro.org>, Liviu Dudau <liviu.dudau@arm.com>, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>, 
 Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>, 
 Brian Masney <bmasney@redhat.com>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
 arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 sophgo@lists.linux.dev, linux-mips@vger.kernel.org, imx@lists.linux.dev, 
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
 linux-stm32@st-md-mailman.stormreply.com, patches@opensource.cirrus.com, 
 linux-actions@lists.infradead.org, asahi@lists.linux.dev, 
 linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org, 
 linux-renesas-soc@vger.kernel.org, linux-rockchip@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, soc@lists.linux.dev
In-Reply-To: <20250811-clk-for-stephen-round-rate-v1-99-b3bf97b038dc@redhat.com>
References: <20250811-clk-for-stephen-round-rate-v1-0-b3bf97b038dc@redhat.com>
 <20250811-clk-for-stephen-round-rate-v1-99-b3bf97b038dc@redhat.com>
Subject: Re: (subset) [PATCH 099/114] clk: samsung: pll: convert from
 round_rate() to determine_rate()
Message-Id: <175596784601.52468.3851559862193091574.b4-ty@linaro.org>
Date: Sat, 23 Aug 2025 18:50:46 +0200
MIME-Version: 1.0
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250823_095052_224231_C0BE19C5 
X-CRM114-Status: UNSURE (   8.97  )
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


On Mon, 11 Aug 2025 11:19:31 -0400, Brian Masney wrote:
> The round_rate() clk ops is deprecated, so migrate this driver from
> round_rate() to determine_rate() using the Coccinelle semantic patch
> on the cover letter of this series.
> 
> 

Applied, thanks!

[099/114] clk: samsung: pll: convert from round_rate() to determine_rate()
          https://git.kernel.org/krzk/linux/c/e278e39b014d789fb670695d422ff33c3ef56040

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
