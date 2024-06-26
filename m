Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28007C30659
	for <linux-riscv@archiver.kernel.org>; Wed, 26 Jun 2024 10:02:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=v9ONRpn62UvjGKEwUPXaeRaXHP8I1RWmcugfD0cMwvo=; b=mtHoGuXnTQ4xXB
	st1fkmcU33KUrmE1CJA6AWlHSDELkpxT3EnT6ym5yqCxSeatyw3fgyhudLc+tAqpNlMo2SjWChVyc
	+BGzoXm9bCnXdkD/DLwZJL8weoAJQlYxVjKYlgbYszj0MlfOnF+yYc/AdNs+/lNEz8Yo5phNwP5XI
	JnbIN9N1ghTV941Oils24LdzwsdZFlUiHsH6XSw7zY/xp4N5Ee4/hwXiVs6Cucyql/QCX3ibIvbAG
	LF9dF/5I3UonamPeUDrlqbfLrbGWH1fo3JC0Jpvl2d/WDWPlOqvF9g3pi0qWDqdFxqBQYPSBUhjzs
	wm84HRWVvkp/XRLicyXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sMPTv-00000006E9a-2DZa;
	Wed, 26 Jun 2024 10:02:27 +0000
Received: from mail-lf1-x12a.google.com ([2a00:1450:4864:20::12a])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sMPTr-00000006E6Y-20iy
	for linux-riscv@lists.infradead.org;
	Wed, 26 Jun 2024 10:02:25 +0000
Received: by mail-lf1-x12a.google.com with SMTP id 2adb3069b0e04-52cecba8d11so2191889e87.1
        for <linux-riscv@lists.infradead.org>; Wed, 26 Jun 2024 03:02:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1719396141; x=1720000941; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UIal9mSNuB7WVuajAQysXy9I34dokLqqKQSl/SD8Ip0=;
        b=qNqesiAC1X7e1EkVCSz62k+JFehhes2NlVG/hHoy85saQmO8K7zhG02Me767JypiZM
         sc6fPACY2nQGAdHO+awWUXeFR/hIr/tCF/DkCRuVGqx88Q8OLHb9q0h++sGlaao7cas0
         vqFBQ37EZrIYiUFIVJDvM3iDeg/1uuxC39itKAEYrMVoY42tjTSXD1GV++QA93n8EUqr
         iAT5L0VEmo+AG+Da1/Ro/gVI4DngXS+Dx7BIXusa564HZ25KuevWOwMThRRRqxjhry8E
         T20q05XDjwmdspCK1LBWN2UbwKpFySrj7g/cwGAoWjAh8cnRKCA+y2OecBg4IyV4J2oU
         SN2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719396141; x=1720000941;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UIal9mSNuB7WVuajAQysXy9I34dokLqqKQSl/SD8Ip0=;
        b=GHaSZ931hAmncJwLmAwNi+48aIiaxlngzwdeQplcA+Ovp6Q48WgurkTpdox1YYJeev
         6kPRA+yxhgpq6b7iLTxsL1/fHHEmVnAG57/PGsjIExybFiyRJ9bz7p+FhdP4fWGV4by3
         mCMPPWvjqTuiI2rjH6BRzw9sMrZXaqg+f/ttEPf2VHTmDiYSG2po5TN91nru1/TRU6SD
         qu/41VxDOS08lvUz8TQqzEXmaSd4L/U2dF8KUKodSCEopM3a65UG/5UBvSg7upMkQKGh
         hA6rqFWNW4sfrTrQC/f0DTEEAYe9f4WARLiODk25DuoAaB4jjjteEzu+6Qearf71MFsM
         /y9A==
X-Forwarded-Encrypted: i=1; AJvYcCWVWIPyI+Ps1couY8qyWE0DiBOp8qZy7IudbM4zZEAh3F4nnqzqV2pk24mKFGzsFJCBQUAMNVBPpROTgi4+DWk+u7gcH/ONHeXEo2iuzHMX
X-Gm-Message-State: AOJu0YxBFaP04l7ypJniZ7cQKHbQutWJcwP3O0LV4Ix2rRNvp93j4iiF
	elTWGsx8YTZryTgO6yZaawpAomJuyZPNynuR+c5Xsjy1Ui+Z5k0A6YqNufNLXLq+/vqKimpxuhG
	HydqgtbzbL3Uzetypo0mlzeSCLeiztfd5xOPRlg==
X-Google-Smtp-Source: AGHT+IEEH1F7Tv7LomODsunYV84Dtc4zLrPpgRRnnl78k+rzuBYmNhragIOzGe8Zi41e1oTPofFlhnZh4uvVT5y70J8=
X-Received: by 2002:a05:6512:2254:b0:52c:8fd7:2252 with SMTP id
 2adb3069b0e04-52ce18324cdmr7591081e87.11.1719396141307; Wed, 26 Jun 2024
 03:02:21 -0700 (PDT)
MIME-Version: 1.0
References: <20240504-pinctrl-cleanup-v2-0-26c5f2dc1181@nxp.com> <AM6PR04MB594163BAB898D8689A94056F88CE2@AM6PR04MB5941.eurprd04.prod.outlook.com>
In-Reply-To: <AM6PR04MB594163BAB898D8689A94056F88CE2@AM6PR04MB5941.eurprd04.prod.outlook.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 26 Jun 2024 12:02:09 +0200
Message-ID: <CACRpkdb17buPQVupCRDthvAgMKpvKvRWEN5GbA7pyF9NxymGEg@mail.gmail.com>
Subject: Re: [PATCH v2 00/20] pinctrl: Use scope based of_node_put() cleanups
To: Peng Fan <peng.fan@nxp.com>
Cc: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>, Thierry Reding <thierry.reding@gmail.com>, 
	Jonathan Hunter <jonathanh@nvidia.com>, Dvorkin Dmitry <dvorkin@tibbo.com>, Wells Lu <wellslutw@gmail.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Emil Renner Berthing <kernel@esmil.dk>, Jianlong Huang <jianlong.huang@starfivetech.com>, 
	Hal Feng <hal.feng@starfivetech.com>, Orson Zhai <orsonzhai@gmail.com>, 
	Baolin Wang <baolin.wang@linux.alibaba.com>, Chunyan Zhang <zhang.lyra@gmail.com>, 
	Viresh Kumar <vireshk@kernel.org>, Shiraz Hashim <shiraz.linux.kernel@gmail.com>, 
	"soc@kernel.org" <soc@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, 
	Sylwester Nawrocki <s.nawrocki@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Patrice Chotard <patrice.chotard@foss.st.com>, 
	Heiko Stuebner <heiko@sntech.de>, Damien Le Moal <dlemoal@kernel.org>, 
	Ludovic Desroches <ludovic.desroches@microchip.com>, 
	Nicolas Ferre <nicolas.ferre@microchip.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
	Aisheng Dong <aisheng.dong@nxp.com>, Fabio Estevam <festevam@gmail.com>, 
	Shawn Guo <shawnguo@kernel.org>, Jacky Bai <ping.bai@nxp.com>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Chester Lin <chester62515@gmail.com>, 
	Matthias Brugger <mbrugger@suse.com>, 
	"Ghennadi Procopciuc (OSS)" <ghennadi.procopciuc@oss.nxp.com>, Sean Wang <sean.wang@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Andrew Jeffery <andrew@codeconstruct.com.au>, 
	Joel Stanley <joel@jms.id.au>, Dan Carpenter <dan.carpenter@linaro.org>, 
	Tony Lindgren <tony@atomide.com>, Stephen Warren <swarren@wwwdotorg.org>, 
	"linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, 
	"linux-stm32@st-md-mailman.stormreply.com" <linux-stm32@st-md-mailman.stormreply.com>, 
	"linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, 
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>, 
	"linux-rockchip@lists.infradead.org" <linux-rockchip@lists.infradead.org>, 
	"linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>, 
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>, 
	"imx@lists.linux.dev" <imx@lists.linux.dev>, 
	"linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>, 
	"openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>, 
	Emil Renner Berthing <emil.renner.berthing@canonical.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240626_030223_581717_AEFF9C1E 
X-CRM114-Status: UNSURE (   9.67  )
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

T24gVHVlLCBKdW4gMTgsIDIwMjQgYXQgMTo1MuKAr1BNIFBlbmcgRmFuIDxwZW5nLmZhbkBueHAu
Y29tPiB3cm90ZToKCj4gPiBTdWJqZWN0OiBbUEFUQ0ggdjIgMDAvMjBdIHBpbmN0cmw6IFVzZSBz
Y29wZSBiYXNlZCBvZl9ub2RlX3B1dCgpCj4gPiBjbGVhbnVwcwo+Cj4gc3Qvc3RtMzIvcmVuZXNh
cyBwYXRjaGVzIGFyZSBwaWNrZWQuIFdvdWxkIHlvdSBoYW5kbGUgdGhlIHJlbWFpbmluZwo+IG9u
ZXM/CgpIbSByaWdodCwgSSBhcHBsaWVkIGFsbCB0aGF0IGFwcGx5IGNsZWFubHk6Cjk3MWM4YjRj
MDhlNyAoSEVBRCAtPiBkZXZlbCkgcGluY3RybDogc2Ftc3VuZzogVXNlIHNjb3BlIGJhc2VkCm9m
X25vZGVfcHV0KCkgY2xlYW51cHMKM2E4ODI1NTRhM2JiIHBpbmN0cmw6IGsyMTA6IFVzZSBzY29w
ZSBiYXNlZCBvZl9ub2RlX3B1dCgpIGNsZWFudXBzCjdmNTAwZjIwMTFjMCBwaW5jdHJsOiBmcmVl
c2NhbGU6IG14czogRml4IHJlZmNvdW50IG9mIGNoaWxkCmQ3ZjUxMjBhOTQ0YSBwaW5jdHJsOiBw
aW5jb25mLWdlbmVyaWM6IFVzZSBzY29wZSBiYXNlZCBvZl9ub2RlX3B1dCgpIGNsZWFudXBzCjI0
MGM1ZjIzOGQ1OSBwaW5jdHJsOiBiY206IGJjbTYzeHg6IFVzZSBzY29wZSBiYXNlZCBvZl9ub2Rl
X3B1dCgpIGNsZWFudXBzCjNhMDI3OGNmYjQ0OCBwaW5jdHJsOiBtZWRpYXRlazogVXNlIHNjb3Bl
IGJhc2VkIG9mX25vZGVfcHV0KCkgY2xlYW51cHMKYzk1N2FlN2U3ZTY4IHBpbmN0cmw6IG5vbWFk
aWs6IFVzZSBzY29wZSBiYXNlZCBvZl9ub2RlX3B1dCgpIGNsZWFudXBzCjNkY2MwMWIzNmYxOCBw
aW5jdHJsOiBzMzJjYzogVXNlIHNjb3BlIGJhc2VkIG9mX25vZGVfcHV0KCkgY2xlYW51cHMKN2My
YWFiYjU2ZjkyIHBpbmN0cmw6IGF0OTE6IFVzZSBzY29wZSBiYXNlZCBvZl9ub2RlX3B1dCgpIGNs
ZWFudXBzCjU2YzQyZjZjN2IyYyBwaW5jdHJsOiByb2NrY2hpcDogVXNlIHNjb3BlIGJhc2VkIG9m
X25vZGVfcHV0KCkgY2xlYW51cHMKOGM1ZGMyYTViM2E3IHBpbmN0cmw6IHNwZWFyOiBVc2Ugc2Nv
cGUgYmFzZWQgb2Zfbm9kZV9wdXQoKSBjbGVhbnVwcwo3OTRlNWRjNTMzYjAgcGluY3RybDogc3By
ZDogVXNlIHNjb3BlIGJhc2VkIG9mX25vZGVfcHV0KCkgY2xlYW51cHMKOGZhOTljMDAzNTFjIHBp
bmN0cmw6IHN0YXJmaXZlOiBVc2Ugc2NvcGUgYmFzZWQgb2Zfbm9kZV9wdXQoKSBjbGVhbnVwcwox
MWVlZmMwYWM4ODQgcGluY3RybDogdGVncmE6IFVzZSBzY29wZSBiYXNlZCBvZl9ub2RlX3B1dCgp
IGNsZWFudXBzCgpDYW4geW91IGxvb2sgaW50byByZWJhc2luZyB0aGUgcmVtYWluaW5nIG9uZXM/
CgpJIGFtIGEgYml0IHVuc3VyZSBhYm91dCBTYW1zdW5nLCBLcnp5c3p0b2YgdXN1YWxseSBwaWNr
IHRoZXNlLCBidXQgbm8gYmlnCmRlYWwgSSBndWVzcywgaWYgaGUgb2JqZWN0cyBJIGNhbiBqdXN0
IHRha2UgaXQgb3V0IGFnYWluLgoKWW91cnMsCkxpbnVzIFdhbGxlaWoKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlz
dApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQu
b3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
