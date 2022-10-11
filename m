Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8350EC433F5
	for <linux-riscv@archiver.kernel.org>; Tue, 11 Oct 2022 16:22:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9GmHTI2uaETzGpb2dAVluxvnjo0tHCzelp5ZVtwvA60=; b=tHJQN/kvN6W5Ry
	8taP6wemMfXRjasNWSjiK+NEymz6z3P8y9sIDiTMe+Ch1hViRhLEnVL01yPfCabxisSfXAI9soEMn
	2Z2IUxHiHb7JpqYGQLTJ/XKFXDv3RbKNcF1rVzsI8Rgz/Rk8DJq+tjnpmuOT6mccl7+0uYDocqJZW
	fAMHkeSrD4Q/ax5JZHnUBeMjid3hfqUcr6KUXywTiXRDzh4j2/P4e2YHDwA2rjgNuYUKpHNZWZbyS
	EjDiPs0WWsJ9acqzQqT62UWM7bOwgDPOM4niAXb/LMdJ6IKsSdZqDaZD63y9jjc0rsPbcnNr1xU3S
	vecOZC3DyQ/JvKYvX9aw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oiI1X-005Bq3-Cu; Tue, 11 Oct 2022 16:22:31 +0000
Received: from mail-qv1-f44.google.com ([209.85.219.44])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oiAuW-003lQR-Rk; Tue, 11 Oct 2022 08:46:50 +0000
Received: by mail-qv1-f44.google.com with SMTP id de14so8546738qvb.5;
        Tue, 11 Oct 2022 01:46:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RG7je/SPkrUeGbyJflxBun3+ZBOYqWehWXWhY9Ywba0=;
        b=gT3lHliTE5GrKiqC3uEgSy7evr/7mRWpGq6pscwDtGi1ivLrGFRKCMsQVTG2WXgSJr
         wx+oDShRzKLtIAFQ/y/7a8eaRiSxBoUgUmBy2OJhwaTFS2qk1cowsraM0EzzP5e3DvKZ
         sYYJHmcAk0D6gvCEc27qZWMXyqV3Kp2yDbCkz4Y+aj4VvFfU97x5NDCP6vb4q3bAQet3
         spcL+kydxjHMGQlCU22pTYB9HdK2IvZ8U1Gw10oRjMvxHyDPxGDC/gnzoMeViyZWDkoe
         J9CPcS0KE9RQ1GQm7+TlxYb8kMv8MoQ4vJTJgpCyMyTLHl0D1Sxt7wXRlhlR+gsumZAZ
         ecRw==
X-Gm-Message-State: ACrzQf2YS83raYZlVTZ1LfpcLdFWP5uiPTeIQU/r/PqhJXWQY4RnYYSz
	MEP8T1ohwko+XurptXp942wQReq7ivlEtw3+
X-Google-Smtp-Source: AMsMyM4RzVSj/J9m5p35es9nzDWH+P/Qu6tAHVZ86D2OizVsX6loOiuKVnnXAkPnJYH5346lwCalYA==
X-Received: by 2002:ad4:5be6:0:b0:4b3:ff39:7ad4 with SMTP id k6-20020ad45be6000000b004b3ff397ad4mr7734229qvc.126.1665478006263;
        Tue, 11 Oct 2022 01:46:46 -0700 (PDT)
Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com. [209.85.128.170])
        by smtp.gmail.com with ESMTPSA id f11-20020a05620a280b00b006ce515196a7sm12599208qkp.8.2022.10.11.01.46.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 11 Oct 2022 01:46:45 -0700 (PDT)
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-35befab86a4so120950637b3.8;
        Tue, 11 Oct 2022 01:46:45 -0700 (PDT)
X-Received: by 2002:a0d:de43:0:b0:349:31bd:e8d5 with SMTP id
 h64-20020a0dde43000000b0034931bde8d5mr20151543ywe.283.1665478004869; Tue, 11
 Oct 2022 01:46:44 -0700 (PDT)
MIME-Version: 1.0
References: <20221010201453.77401-1-andriy.shevchenko@linux.intel.com>
 <20221010201453.77401-37-andriy.shevchenko@linux.intel.com> <d63088d7-202b-a550-01e5-345a22de5f7d@amd.com>
In-Reply-To: <d63088d7-202b-a550-01e5-345a22de5f7d@amd.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 11 Oct 2022 10:46:30 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUfdQnisexfs4yLjeKs-LUPY1HjChrgeNjNL1qSErir9Q@mail.gmail.com>
Message-ID: <CAMuHMdUfdQnisexfs4yLjeKs-LUPY1HjChrgeNjNL1qSErir9Q@mail.gmail.com>
Subject: Re: [PATCH v2 36/36] pinctrl: Clean up headers
To: Basavaraj Natikar <bnatikar@amd.com>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Marc Zyngier <maz@kernel.org>, 
	Bartosz Golaszewski <brgl@bgdev.pl>, Kent Gibson <warthog618@gmail.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Billy Tsai <billy_tsai@aspeedtech.com>, 
	Thomas Gleixner <tglx@linutronix.de>, Linus Walleij <linus.walleij@linaro.org>, 
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
X-CRM114-CacheID: sfid-20221011_014648_924247_199A6489 
X-CRM114-Status: GOOD (  27.59  )
X-Mailman-Approved-At: Tue, 11 Oct 2022 09:22:17 -0700
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

T24gVHVlLCBPY3QgMTEsIDIwMjIgYXQgOTozMSBBTSBCYXNhdmFyYWogTmF0aWthciA8Ym5hdGlr
YXJAYW1kLmNvbT4gd3JvdGU6Cj4gT24gMTAvMTEvMjAyMiAxOjQ0IEFNLCBBbmR5IFNoZXZjaGVu
a28gd3JvdGU6Cj4gPiBUaGVyZSBpcyBhIGZldyB0aGluZ3MgZG9uZToKPiA+IC0gaW5jbHVkZSBv
bmx5IHRoZSBoZWFkZXJzIHdlIGFyZSBkaXJlY3QgdXNlciBvZgo+ID4gLSB3aGVuIHBvaW50ZXIg
aXMgaW4gdXNlLCBwcm92aWRlIGEgZm9yd2FyZCBkZWNsYXJhdGlvbgo+ID4gLSBhZGQgbWlzc2Vk
IGhlYWRlcnMKPiA+IC0gZ3JvdXAgZ2VuZXJpYyBoZWFkZXJzIGFuZCBzdWJzeXN0ZW0gaGVhZGVy
cwo+ID4gLSBzb3J0IGVhY2ggZ3JvdXAgYWxwaGFiZXRpY2FsbHkKPiA+Cj4gPiBXaGlsZSBhdCBp
dCwgZml4IHNvbWUgYXdrd2FyZCBpbmRlbnRhdGlvbnMuCj4gPgo+ID4gU2lnbmVkLW9mZi1ieTog
QW5keSBTaGV2Y2hlbmtvIDxhbmRyaXkuc2hldmNoZW5rb0BsaW51eC5pbnRlbC5jb20+Cj4gPiAt
LS0KPiA+ICBkcml2ZXJzL3BpbmN0cmwvY29yZS5jICAgICAgICAgICAgICAgICAgfCAxOSArKysr
KysrKy0tLS0tLS0KPiA+ICBkcml2ZXJzL3BpbmN0cmwvY29yZS5oICAgICAgICAgICAgICAgICAg
fCAxMiArKysrKysrKystCj4gPiAgZHJpdmVycy9waW5jdHJsL2RldmljZXRyZWUuaCAgICAgICAg
ICAgIHwgIDYgKysrKysKPiA+ICBkcml2ZXJzL3BpbmN0cmwvcGluY29uZi5oICAgICAgICAgICAg
ICAgfCAxMCArKysrKysrKwo+ID4gIGRyaXZlcnMvcGluY3RybC9waW5jdHJsLXV0aWxzLmggICAg
ICAgICB8ICA1ICsrKysKPiA+ICBkcml2ZXJzL3BpbmN0cmwvcGlubXV4LmMgICAgICAgICAgICAg
ICAgfCAxNyArKysrKysrKy0tLS0tLQo+ID4gIGRyaXZlcnMvcGluY3RybC9waW5tdXguaCAgICAg
ICAgICAgICAgICB8IDExICsrKysrKysrKwo+ID4gIGluY2x1ZGUvbGludXgvcGluY3RybC9jb25z
dW1lci5oICAgICAgICB8IDMxICsrKysrKysrKysrLS0tLS0tLS0tLS0tLS0KPiA+ICBpbmNsdWRl
L2xpbnV4L3BpbmN0cmwvZGV2aW5mby5oICAgICAgICAgfCAgNiArKystLQo+ID4gIGluY2x1ZGUv
bGludXgvcGluY3RybC9tYWNoaW5lLmggICAgICAgICB8ICA4ICsrKystLS0KPiA+ICBpbmNsdWRl
L2xpbnV4L3BpbmN0cmwvcGluY29uZi1nZW5lcmljLmggfCAyMyArKysrKysrKysrLS0tLS0tLS0K
PiA+ICBpbmNsdWRlL2xpbnV4L3BpbmN0cmwvcGluY3RybC5oICAgICAgICAgfCAxOCArKysrKysr
LS0tLS0tLQo+ID4gIGluY2x1ZGUvbGludXgvcGluY3RybC9waW5tdXguaCAgICAgICAgICB8ICA1
ICsrLS0KPiA+ICAxMyBmaWxlcyBjaGFuZ2VkLCAxMTAgaW5zZXJ0aW9ucygrKSwgNjEgZGVsZXRp
b25zKC0pCj4gPgo+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvcGluY3RybC9jb3JlLmMgYi9kcml2
ZXJzL3BpbmN0cmwvY29yZS5jCj4gPiBpbmRleCA5ZTU3ZjRjNjJlNjAuLjY1NWY5NTAyZTczZiAx
MDA2NDQKPiA+IC0tLSBhL2RyaXZlcnMvcGluY3RybC9jb3JlLmMKPiA+ICsrKyBiL2RyaXZlcnMv
cGluY3RybC9jb3JlLmMKPiA+IEBAIC0xMiwxOSArMTIsMjEgQEAKPiA+ICAgKi8KPiA+ICAjZGVm
aW5lIHByX2ZtdChmbXQpICJwaW5jdHJsIGNvcmU6ICIgZm10Cj4gPgo+ID4gLSNpbmNsdWRlIDxs
aW51eC9rZXJuZWwuaD4KPiA+IC0jaW5jbHVkZSA8bGludXgva3JlZi5oPgo+ID4gLSNpbmNsdWRl
IDxsaW51eC9leHBvcnQuaD4KPiA+IC0jaW5jbHVkZSA8bGludXgvaW5pdC5oPgo+ID4gKyNpbmNs
dWRlIDxsaW51eC9kZWJ1Z2ZzLmg+Cj4gPiAgI2luY2x1ZGUgPGxpbnV4L2RldmljZS5oPgo+ID4g
LSNpbmNsdWRlIDxsaW51eC9zbGFiLmg+Cj4gPiAgI2luY2x1ZGUgPGxpbnV4L2Vyci5oPgo+ID4g
KyNpbmNsdWRlIDxsaW51eC9leHBvcnQuaD4KPiA+ICsjaW5jbHVkZSA8bGludXgvaW5pdC5oPgo+
ID4gKyNpbmNsdWRlIDxsaW51eC9rZXJuZWwuaD4KPiA+ICsjaW5jbHVkZSA8bGludXgva3JlZi5o
Pgo+ID4gICNpbmNsdWRlIDxsaW51eC9saXN0Lmg+Cj4gPiAtI2luY2x1ZGUgPGxpbnV4L2RlYnVn
ZnMuaD4KPiA+ICAjaW5jbHVkZSA8bGludXgvc2VxX2ZpbGUuaD4KPiA+ICsjaW5jbHVkZSA8bGlu
dXgvc2xhYi5oPgo+ID4gKwo+ID4gICNpbmNsdWRlIDxsaW51eC9waW5jdHJsL2NvbnN1bWVyLmg+
Cj4gPiAtI2luY2x1ZGUgPGxpbnV4L3BpbmN0cmwvcGluY3RybC5oPgo+ID4gKyNpbmNsdWRlIDxs
aW51eC9waW5jdHJsL2RldmluZm8uaD4KPiA+ICAjaW5jbHVkZSA8bGludXgvcGluY3RybC9tYWNo
aW5lLmg+Cj4gPiArI2luY2x1ZGUgPGxpbnV4L3BpbmN0cmwvcGluY3RybC5oPgo+ID4KPiA+ICAj
aWZkZWYgQ09ORklHX0dQSU9MSUIKPiA+ICAjaW5jbHVkZSAiLi4vZ3Bpby9ncGlvbGliLmgiCj4g
PiBAQCAtMzMsOSArMzUsOCBAQAo+ID4KPiA+ICAjaW5jbHVkZSAiY29yZS5oIgo+ID4gICNpbmNs
dWRlICJkZXZpY2V0cmVlLmgiCj4gPiAtI2luY2x1ZGUgInBpbm11eC5oIgo+ID4gICNpbmNsdWRl
ICJwaW5jb25mLmgiCj4gPiAtCj4gPiArI2luY2x1ZGUgInBpbm11eC5oIgo+ID4KPiA+ICBzdGF0
aWMgYm9vbCBwaW5jdHJsX2R1bW15X3N0YXRlOwo+ID4KPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJz
L3BpbmN0cmwvY29yZS5oIGIvZHJpdmVycy9waW5jdHJsL2NvcmUuaAo+ID4gaW5kZXggODQwMTAz
YzQwYzE0Li40ZDBiZGI5ZmI5OWIgMTAwNjQ0Cj4gPiAtLS0gYS9kcml2ZXJzL3BpbmN0cmwvY29y
ZS5oCj4gPiArKysgYi9kcml2ZXJzL3BpbmN0cmwvY29yZS5oCj4gPiBAQCAtOSwxMiArOSwyMiBA
QAo+ID4gICAqLwo+ID4KPiA+ICAjaW5jbHVkZSA8bGludXgva3JlZi5oPgo+ID4gKyNpbmNsdWRl
IDxsaW51eC9saXN0Lmg+Cj4gPiAgI2luY2x1ZGUgPGxpbnV4L211dGV4Lmg+Cj4gPiAgI2luY2x1
ZGUgPGxpbnV4L3JhZGl4LXRyZWUuaD4KPiA+IC0jaW5jbHVkZSA8bGludXgvcGluY3RybC9waW5j
b25mLmg+Cj4KPiBSZW1vdmluZyBwaW5jb25mLmggZnJvbSB0aGUgY29yZS5oIG1heSBjYXVzZSBi
dWlsZCBmYWlsdXJlIGluIG90aGVyIGZpbGVzCj4gYmVjYXVzZSB3aGVyZS1ldmVyIGNvcmUuaCBp
cyBpbmNsdWRlZCB0byB1c2Ug4oCcc3RydWN0IHBpbmNvbmZfb3Bz4oCdLCB0aGVyZQo+IGlzIGEg
bmVlZCB0byBpbmNsdWRlIHBpbmNvbmYuaC4KCkkgY2FuIGNvbmZpcm0gYWRkaW5nCgogICAgI2lu
Y2x1ZGUgPGxpbnV4L3BpbmN0cmwvcGluY29uZi5oPgoKdG8gZHJpdmVycy9waW5jdHJsL3JlbmVz
YXMvcGluY3RybC1yem4xLmMgYW5kIGRyaXZlcnMvcGluY3RybC9waW5jdHJsLXNpbmdsZS5jCmZp
eGVzIHRoZSBpc3N1ZXMgSSB3YXMgc2VlaW5nIHdpdGggc2htb2JpbGVfZGVmY29uZmlnIGFuZCAo
b3V0LW9mLXRyZWUpCnJlbmVzYXNfZGVmY29uZmlnLgoKR3J7b2V0amUsZWV0aW5nfXMsCgogICAg
ICAgICAgICAgICAgICAgICAgICBHZWVydAoKLS0KR2VlcnQgVXl0dGVyaG9ldmVuIC0tIFRoZXJl
J3MgbG90cyBvZiBMaW51eCBiZXlvbmQgaWEzMiAtLSBnZWVydEBsaW51eC1tNjhrLm9yZwoKSW4g
cGVyc29uYWwgY29udmVyc2F0aW9ucyB3aXRoIHRlY2huaWNhbCBwZW9wbGUsIEkgY2FsbCBteXNl
bGYgYSBoYWNrZXIuIEJ1dAp3aGVuIEknbSB0YWxraW5nIHRvIGpvdXJuYWxpc3RzIEkganVzdCBz
YXkgInByb2dyYW1tZXIiIG9yIHNvbWV0aGluZyBsaWtlIHRoYXQuCiAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgLS0gTGludXMgVG9ydmFsZHMKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1y
aXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxt
YW4vbGlzdGluZm8vbGludXgtcmlzY3YK
