Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EEB2AC433FE
	for <linux-riscv@archiver.kernel.org>; Mon, 17 Oct 2022 12:21:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7Yh9LkwAwbn1Q6XPgzk24gedn2ukWFB9HqvW+gRlltw=; b=Wqi+YL75VKzGGP
	D/Sm3aX94WwVlQ1YPmhwhXVSPZsWtUfWe+Q6wFVqXy+vzJ5GWT7mZHSZhb1H4/11Pcg567vQBDKbH
	9lu6WRC0Zg2JzCUWJGbfXCE7U81sLvh4N5ui2GA+173iT+iUI4+5ZxX1ja74vqgzD5hlHGjGHkC6w
	LszHwp35eAl+ZCqOr6oDczBSuYr43gbuNs8fNIihd/bgHBz3ZMM71xRzp58KkolM8IL8n6Y3ax03K
	JFzkz4gc3vh/A3AcTjuL5oD4oZf0s8vbTUAAyl1GRYD9nTNZY0ddGCFDkrvnHyqFID0YLQYrhLP4F
	3LUPe4PO+W4AyLUNSyUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1okP7c-00BUs7-UR; Mon, 17 Oct 2022 12:21:32 +0000
Received: from mail-qt1-x833.google.com ([2607:f8b0:4864:20::833])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1okP2j-00BSTr-UQ; Mon, 17 Oct 2022 12:16:31 +0000
Received: by mail-qt1-x833.google.com with SMTP id w3so7504368qtv.9;
        Mon, 17 Oct 2022 05:16:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FViSSKwYNLFy/8i7voLq1fvEAiC2E4b3lKUtg6bhSNs=;
        b=G4XBw7OtjlEVYhvq3ujakfFtUjrlMIkd5uVVPI4L3fSHgn9r2dYLTBKR1DSk55qy8/
         vjDDH2t4lQErUrsZ81N0WmnCPAq1TAG4psbIGjoQRhntN5Cmq1aF/T5qp0/euyInLZPZ
         /K8bnHyxQYrmvZCrh75klmy5Bz15Y/XvsM73Xs3LGuMo2izmCHPf5UYpUMbW37BEsOEV
         sVucDgXlyB1YZt4pqPGa9U7E85eMuIK9JN+tGTbAMfTNB3gqhaNnxWOxBOHdWu8HWlhw
         4OAFcfWlF4Cka/k2IMLMYdJ1w8Emhfeq9FKglqB57GbZ26ff4iD6Qp74edFo/4+10u7I
         pv7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FViSSKwYNLFy/8i7voLq1fvEAiC2E4b3lKUtg6bhSNs=;
        b=SzUaeyzbSfTwPlIA2/6WI2gSIqOUjgrTTKBWVH27V2PoCUxcE8usl/CvMoKzB0K4KT
         EF6WgI0BKWSBK1i+pF2tfViuNab1aD8PvjcwybHZa8VNlobvt4iXMrByV34HUK9TGx+l
         9Cg2weVM597FxkO3bgasGD9BRFmnommoP8unKAjJeR3kYz3mh9HsjKz4nD51CjxQzRD0
         CrY0OvjM7epQl39bXWoCtQMEiJz3BKmdKJmslcAZbWql/dliIXzgpdb4y0giZlwlz3d5
         SkvNAlZAJHwfADVedt6XoDx4WSB2mp4epJPSD5OVz1ZBnITIcL/ONo1Bunx+WTlZ/wSk
         XzRw==
X-Gm-Message-State: ACrzQf2mAtDjwNKPzbdhtyZbuXOiB2XZv9vgxINX9P19IrQAaXt9ZUAc
	zfG6FWqP3k//Aos/3JmMFnb7hgjWcbceIGfgXrA=
X-Google-Smtp-Source: AMsMyM5ONAbRwJ0mRV8lFkFN/+yOIGgrHcLBILWbhUW8XaqfnSolfxdkiScuiVdMZUaqcXP+J2a9nYR4SqM8sa8eRyQ=
X-Received: by 2002:a05:622a:1045:b0:39c:e2e1:dc59 with SMTP id
 f5-20020a05622a104500b0039ce2e1dc59mr7379719qte.195.1666008987610; Mon, 17
 Oct 2022 05:16:27 -0700 (PDT)
MIME-Version: 1.0
References: <20221010201453.77401-1-andriy.shevchenko@linux.intel.com>
 <20221010201453.77401-2-andriy.shevchenko@linux.intel.com>
 <CACRpkdbdzFR-a_xh8EjLMAshTeesOYhD3-_Bkc=vi7iK72ZKtA@mail.gmail.com> <CAMRc=MexjuQw+hUDDfCVxiBEJ573jNb3Ko9SyOU-xJ03wOe8cQ@mail.gmail.com>
In-Reply-To: <CAMRc=MexjuQw+hUDDfCVxiBEJ573jNb3Ko9SyOU-xJ03wOe8cQ@mail.gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Mon, 17 Oct 2022 15:15:51 +0300
Message-ID: <CAHp75VftkwPB-+jhCrhCdPRN0hLm5DLADMyAO45eBTRFfxiNuQ@mail.gmail.com>
Subject: Re: [PATCH v2 01/36] gpiolib: tegra186: Add missed header(s)
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Linus Walleij <linus.walleij@linaro.org>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Marc Zyngier <maz@kernel.org>, 
	Kent Gibson <warthog618@gmail.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Billy Tsai <billy_tsai@aspeedtech.com>, Thomas Gleixner <tglx@linutronix.de>, 
	Mika Westerberg <mika.westerberg@linux.intel.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Chen-Yu Tsai <wenst@chromium.org>, 
	Claudiu Beznea <claudiu.beznea@microchip.com>, Samuel Holland <samuel@sholland.org>, 
	Horatiu Vultur <horatiu.vultur@microchip.com>, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>, 
	Bjorn Andersson <bjorn.andersson@linaro.org>, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	Phil Edworthy <phil.edworthy@renesas.com>, 
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
	Fabien Dessenne <fabien.dessenne@foss.st.com>, Prathamesh Shete <pshete@nvidia.com>, 
	Basavaraj Natikar <Basavaraj.Natikar@amd.com>, linux-gpio@vger.kernel.org, 
	linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org, 
	linux-actions@lists.infradead.org, linux-aspeed@lists.ozlabs.org, 
	openbmc@lists.ozlabs.org, linux-rpi-kernel@lists.infradead.org, 
	alsa-devel@alsa-project.org, patches@opensource.cirrus.com, 
	linux-mediatek@lists.infradead.org, linux-mips@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-omap@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com, linux-arm-msm@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
	Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, 
	Patrice Chotard <patrice.chotard@foss.st.com>, =?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.de>, 
	Manivannan Sadhasivam <mani@kernel.org>, Andrew Jeffery <andrew@aj.id.au>, Joel Stanley <joel@jms.id.au>, 
	Florian Fainelli <f.fainelli@gmail.com>, Ray Jui <rjui@broadcom.com>, 
	Scott Branden <sbranden@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
	Charles Keepax <ckeepax@opensource.cirrus.com>, 
	Richard Fitzgerald <rf@opensource.cirrus.com>, Dong Aisheng <aisheng.dong@nxp.com>, 
	Fabio Estevam <festevam@gmail.com>, Shawn Guo <shawnguo@kernel.org>, Jacky Bai <ping.bai@nxp.com>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Sascha Hauer <s.hauer@pengutronix.de>, 
	NXP Linux Team <linux-imx@nxp.com>, Andy Shevchenko <andy@kernel.org>, Sean Wang <sean.wang@kernel.org>, 
	Andrew Lunn <andrew@lunn.ch>, Gregory Clement <gregory.clement@bootlin.com>, 
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Avi Fishman <avifishman70@gmail.com>, 
	Tomer Maimon <tmaimon77@gmail.com>, Tali Perry <tali.perry1@gmail.com>, 
	Patrick Venture <venture@google.com>, Nancy Yuen <yuenn@google.com>, 
	Benjamin Fair <benjaminfair@google.com>, 
	Ludovic Desroches <ludovic.desroches@microchip.com>, 
	Nicolas Ferre <nicolas.ferre@microchip.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Chen-Yu Tsai <wens@csie.org>, 
	Paul Cercueil <paul@crapouillou.net>, Damien Le Moal <damien.lemoal@wdc.com>, 
	Tony Lindgren <tony@atomide.com>, Haojian Zhuang <haojian.zhuang@linaro.org>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Michal Simek <michal.simek@xilinx.com>, Andy Gross <agross@kernel.org>, 
	Konrad Dybcio <konrad.dybcio@somainline.org>, Tomasz Figa <tomasz.figa@gmail.com>, 
	Sylwester Nawrocki <s.nawrocki@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Viresh Kumar <vireshk@kernel.org>, Shiraz Hashim <shiraz.linux.kernel@gmail.com>, soc@kernel.org, 
	Orson Zhai <orsonzhai@gmail.com>, Baolin Wang <baolin.wang@linux.alibaba.com>, 
	Chunyan Zhang <zhang.lyra@gmail.com>, Emil Renner Berthing <kernel@esmil.dk>, 
	Kunihiko Hayashi <hayashi.kunihiko@socionext.com>, Masami Hiramatsu <mhiramat@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221017_051630_105084_F2074EC7 
X-CRM114-Status: GOOD (  12.90  )
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

T24gTW9uLCBPY3QgMTcsIDIwMjIgYXQgMTI6MzUgUE0gQmFydG9zeiBHb2xhc3pld3NraSA8YnJn
bEBiZ2Rldi5wbD4gd3JvdGU6Cj4gT24gTW9uLCBPY3QgMTcsIDIwMjIgYXQgMTA6NTIgQU0gTGlu
dXMgV2FsbGVpaiA8bGludXMud2FsbGVpakBsaW5hcm8ub3JnPiB3cm90ZToKPj7Ct09uIE1vbiwg
T2N0IDEwLCAyMDIyIGF0IDEwOjE1IFBNIEFuZHkgU2hldmNoZW5rbwo+ID4gPGFuZHJpeS5zaGV2
Y2hlbmtvQGxpbnV4LmludGVsLmNvbT4gd3JvdGU6Cj4gPgo+ID4gPiBEbyBub3QgaW1wbHkgdGhh
dCBzb21lIG9mIHRoZSBnZW5lcmljIGhlYWRlcnMgbWF5IGJlIGFsd2F5cyBpbmNsdWRlZC4KPiA+
ID4gSW5zdGVhZCwgaW5jbHVkZSBleHBsaWNpdGx5IHdoYXQgd2UgYXJlIGRpcmVjdCB1c2VyIG9m
Lgo+ID4gPgo+ID4gPiBXaGlsZSBhdCBpdCwgc29ydCBoZWFkZXJzIGFscGhhYmV0aWNhbGx5Lgo+
ID4gPgo+ID4gPiBTaWduZWQtb2ZmLWJ5OiBBbmR5IFNoZXZjaGVua28gPGFuZHJpeS5zaGV2Y2hl
bmtvQGxpbnV4LmludGVsLmNvbT4KPiA+Cj4gPiBSZXZpZXdlZC1ieTogTGludXMgV2FsbGVpaiA8
bGludXMud2FsbGVpakBsaW5hcm8ub3JnPgoKPiBBbmR5OiBhcmUgeW91IGdvaW5nIHRvIHNlbmQg
aXQgdG9nZXRoZXIgd2l0aCB0aGUgY29ycmVzcG9uZGluZyBwaW5jdHJsCj4gY2hhbmdlcyBpbiBh
IHNlcGFyYXRlIFBSPwoKWWVzLCB0aGlzIGlzIHRoZSBwbGFuLCBidXQgSSB3YW50IGZpcnN0IHRv
IHB1c2ggaXQgdG8gTGludXggTmV4dCAodmlhCm15IHRyZWUpIGZvciBhIGNvdXBsZSBvZiBkYXlz
LCBzbyB3ZSB3aWxsIGJlIHN1cmUgdGhlcmUgYXJlIG5vCmNvbXBpbGF0aW9uIGlzc3Vlcy4KCi0t
IApXaXRoIEJlc3QgUmVnYXJkcywKQW5keSBTaGV2Y2hlbmtvCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGlu
dXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
