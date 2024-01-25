Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5CFB7C48260
	for <linux-riscv@archiver.kernel.org>; Thu, 25 Jan 2024 14:15:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hOpD8L7yEssu9sQ949O6r5kTvEQnJ7WrXW2P1ETy62M=; b=Bini4p5ahWqKsm
	ClpQiH3iJxwrfFzDwdJbviHgmqTJimwu9PJnqsa4S7siDUQ9Hikc3XkAQ2mr7CbiwHrHG5UXwLvfA
	uoeumasRvvl7Jj7dqNUveZV8J9TYdgG+gF2Pvuth5hH8eUpQLtm8/Tys49eMpOKat9yyPVXruWZmz
	dxWzLGIgcrqAc9eBRd/y96RmFOKUTyPrmS4yxt6Lza7KIqTRuaFNu7dxls89e2b3xjjcijyN1liF6
	+fW9PI9ySL7xwnCA7FtuxZVZx6/fYGFI8poJORcecaSAf/RSPdnM5uaDyC5hTlaGD/cclugwRBHVs
	8JVwgc+3oneZfT/uksdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rT0VO-00000000JHC-2Yd7;
	Thu, 25 Jan 2024 14:14:58 +0000
Received: from madrid.collaboradmins.com ([46.235.227.194])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rT0V5-00000000J6F-2pAv;
	Thu, 25 Jan 2024 14:14:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1706192078;
	bh=xuWotEzSelSVBqWujYKbIOXX960an6aLcCPwqSUkjtM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=nSMrqxBc5B0zoxSh7oM+5Fjyr3Ev/UxHPkW05LIh9tqvVs8PD+gCaNAqlz5QsrhBH
	 HbSRK9bawmsg86dsQH2IjMpDCUePRyRF5oM8aEVzAti4uMMz1HRIpPYLi32u2KBQJ+
	 AliVBErnUM3jUPU81ZHJPCNYmhPMgUeAyPCVcAL4Hih1LBsQ2CGmIALnpwgLpButSL
	 rbFGcAbYC6BY3TnD/ujgbQgo1zc9++xbkTUK6KOdcjliB5wx4T3j9bIncv2DioZft3
	 9ALNYJlMlexd763yE/DkmWdIt93ZLBCvhepEUEmz9UsnHPTMiD95fyECCAAuyLjyhN
	 8xG5LCL5+b38A==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 3B7E43782057;
	Thu, 25 Jan 2024 14:14:35 +0000 (UTC)
Message-ID: <4079a650-74a6-49bc-87a9-c5729fb6e8d1@collabora.com>
Date: Thu, 25 Jan 2024 15:14:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 003/111] pwm: Provide a macro to get the parent device
 of a given chip
Content-Language: en-US
To: =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 linux-pwm@vger.kernel.org, Claudiu Beznea <claudiu.beznea@tuxon.dev>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Florian Fainelli <florian.fainelli@broadcom.com>, Ray Jui
 <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
 Benson Leung <bleung@chromium.org>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>, Paul Cercueil <paul@crapouillou.net>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley
 <paul.walmsley@sifive.com>, Fabrice Gasnier <fabrice.gasnier@foss.st.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>, Chen-Yu Tsai
 <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>, Andrzej Hajda
 <andrzej.hajda@intel.com>, Robert Foss <rfoss@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: kernel@pengutronix.de, linux-arm-kernel@lists.infradead.org,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, Guenter Roeck
 <groeck@chromium.org>, chrome-platform@lists.linux.dev,
 Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>,
 linux-mips@vger.kernel.org, linux-mediatek@lists.infradead.org,
 Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-amlogic@lists.infradead.org, linux-rpi-kernel@lists.infradead.org,
 Alim Akhtar <alim.akhtar@samsung.com>, linux-samsung-soc@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-sunxi@lists.linux.dev, Douglas Anderson <dianders@chromium.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, dri-devel@lists.freedesktop.org,
 greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev
References: <cover.1706182805.git.u.kleine-koenig@pengutronix.de>
 <1cae6f73264ab313205eaa9483251f7aaf259cb4.1706182805.git.u.kleine-koenig@pengutronix.de>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <1cae6f73264ab313205eaa9483251f7aaf259cb4.1706182805.git.u.kleine-koenig@pengutronix.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240125_061439_973367_E023554E 
X-CRM114-Status: GOOD (  17.78  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

SWwgMjUvMDEvMjQgMTM6MDgsIFV3ZSBLbGVpbmUtS8O2bmlnIGhhIHNjcml0dG86Cj4gQ3VycmVu
dGx5IGEgcHdtX2NoaXAgc3RvcmVzIGluIGl0cyBzdHJ1Y3QgZGV2aWNlICpkZXYgbWVtYmVyIGEg
cG9pbnRlcgo+IHRvIHRoZSBwYXJlbnQgZGV2aWNlLiBQcmVwYXJpbmcgYSBjaGFuZ2UgdGhhdCBl
bWJlZHMgYSBmdWxsIHN0cnVjdAo+IGRldmljZSBpbiBzdHJ1Y3QgcHdtX2NoaXAsIHRoaXMgYWNj
ZXNzb3IgbWFjcm8gc2hvdWxkIGJlIHVzZWQgaW4gYWxsCj4gZHJpdmVycyBkaXJlY3RseSBhY2Nl
c3NpbmcgY2hpcC0+ZGV2IG5vdy4gVGhpcyB3YXkgc3RydWN0IHB3bV9jaGlwIGFuZAo+IHRoaXMg
bWFjcm8gY2FuIGJlIGNoYW5nZWQgd2l0aG91dCBoYXZpbmcgdG8gdG91Y2ggYWxsIGRyaXZlcnMg
aW4gdGhlCj4gc2FtZSBjaGFuZ2Ugc2V0Lgo+IAo+IFNpZ25lZC1vZmYtYnk6IFV3ZSBLbGVpbmUt
S8O2bmlnIDx1LmtsZWluZS1rb2VuaWdAcGVuZ3V0cm9uaXguZGU+CgpSZXZpZXdlZC1ieTogQW5n
ZWxvR2lvYWNjaGlubyBEZWwgUmVnbm8gPGFuZ2Vsb2dpb2FjY2hpbm8uZGVscmVnbm9AY29sbGFi
b3JhLmNvbT4KCj4gLS0tCj4gICBpbmNsdWRlL2xpbnV4L3B3bS5oIHwgNSArKysrKwo+ICAgMSBm
aWxlIGNoYW5nZWQsIDUgaW5zZXJ0aW9ucygrKQo+IAo+IGRpZmYgLS1naXQgYS9pbmNsdWRlL2xp
bnV4L3B3bS5oIGIvaW5jbHVkZS9saW51eC9wd20uaAo+IGluZGV4IDhmZmU5YWU3YTIzYS4uZDc5
NjY5MThmMzAxIDEwMDY0NAo+IC0tLSBhL2luY2x1ZGUvbGludXgvcHdtLmgKPiArKysgYi9pbmNs
dWRlL2xpbnV4L3B3bS5oCj4gQEAgLTI4OSw2ICsyODksMTEgQEAgc3RydWN0IHB3bV9jaGlwIHsK
PiAgIAlzdHJ1Y3QgcHdtX2RldmljZSAqcHdtczsKPiAgIH07Cj4gICAKPiArc3RhdGljIGlubGlu
ZSBzdHJ1Y3QgZGV2aWNlICpwd21jaGlwX3BhcmVudChzdHJ1Y3QgcHdtX2NoaXAgKmNoaXApCj4g
K3sKPiArCXJldHVybiBjaGlwLT5kZXY7Cj4gK30KPiArCj4gICAjaWYgSVNfRU5BQkxFRChDT05G
SUdfUFdNKQo+ICAgLyogUFdNIHVzZXIgQVBJcyAqLwo+ICAgaW50IHB3bV9hcHBseV9taWdodF9z
bGVlcChzdHJ1Y3QgcHdtX2RldmljZSAqcHdtLCBjb25zdCBzdHJ1Y3QgcHdtX3N0YXRlICpzdGF0
ZSk7CgoKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwps
aW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpo
dHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
