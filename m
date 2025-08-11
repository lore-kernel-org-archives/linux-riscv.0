Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F96DCA0EC4
	for <linux-riscv@archiver.kernel.org>; Mon, 11 Aug 2025 18:36:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PWlN2XFLBs5GEqqLddTQZ7FVcVoKMf5p2j8StkhDipw=; b=pjVnU4xQlVFKF3
	qN3tQEQF9/syLgoX/Gqyj3rl3/qcCuaUin7NKQ8GyIDcUjIn1/ssx4FN9ecBUYflXy5NkyeVBlvhu
	UwQX78ryTD+HCzvG+8/XQmaiytBryf8rk1Y4atUgRvXDtuOMrdXr4BYMB1ZvbCBqPgpfEihfdPukI
	lz/jMJoUxWM/v9KbB/0BgXm0OI13VaHKU5lGw9En+tVBBjOs7MxDsz1JLysDuhRjGSwqvQJ8e1xqI
	U8yFJhsl1WqTNwUROdzfZ4RpagGNB2UJ2oEbBwQPHyTqpGz6+7ZALWdSoMB+GsLCWjeHEeeM095ds
	xj64fXddzNmIm/lLpD4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulXNc-00000008ntS-43ig;
	Mon, 11 Aug 2025 18:36:20 +0000
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulUbp-00000008E9g-2nze;
	Mon, 11 Aug 2025 15:38:50 +0000
Received: by mail-ej1-x632.google.com with SMTP id a640c23a62f3a-af93381a1d2so726758366b.3;
        Mon, 11 Aug 2025 08:38:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754926728; x=1755531528; darn=lists.infradead.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=qD3PnaCJHe7CAGf98jDIpzJE6HGS8eh/nvSCm5VXAxc=;
        b=fhoAf4Pr7QA/YO6wqWh8rb2wQUPOZT6h8rpWpV3LJk241HcSvl7Jx7+WKOKVq+a/SW
         ZwKz7PMf8dbYSIe6XuUgNCMsTIxt38LYyxqCWorcU5OxhTYzz/6Qtt0iqi8j6uDKgtRb
         Z0UzE6Hd9JzndBPl7vhoPKc59uhBBwMcJ00FcXcxgd/M/3V6tYgxzsvx8jSeKeReWNKy
         vhg0A+UpQOlVk4WLIQMRwEbWU18csBfyyU2Uo6X8frAsZ+13/MncgVTPNY5897ElYBU0
         THawwmwaeGhJcw8EDkvvWDBiz+T90TEVgn8pp0ZL2wuMjNEV9FgS0rQyu2Bnnr+yNBpC
         Rypg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754926728; x=1755531528;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qD3PnaCJHe7CAGf98jDIpzJE6HGS8eh/nvSCm5VXAxc=;
        b=otgyud60/gRaWx9zPL7YewcktVtfhwMyxJknqUo2HZA8GX6WOgHZQKV2owM162oKWg
         kIsS2s7S5nAeiRoT4HhqUx8BfT0tmV+6BJghli62KIzP+aVqVWqF5NSOcA2cWVdE3QDu
         oIpeX8T4rXgIVBE3l6y37utjNt1LPxqDDYnNI8up8kav+XZgZvPTB+FM9PRWh5J2Loww
         /aY8s5ZceyWwEy67c6yTWWXSq1VLw57k2R+kg+bsp26EROj4nLbIJzu3kyqxsCS1UUsU
         Wl1dmdICCyhTfJHQUxQDc0/2hX/6x8TB9BpgY2TIwD+UAMxe3zpACyYyqzGw0IOgtnOE
         SNrg==
X-Forwarded-Encrypted: i=1; AJvYcCU6RFWFaUuvA6gGKgkTX7fMphlZve4RNN+EUhsga9Bwet41DYowwHR2l9AKPnj2DWQ/wgRcUVrLumckkepN1K8=@lists.infradead.org, AJvYcCUHkcHB/ymwSoXo7aSa1g1HeMDrQMtjgZGp8KZv/sB4pmbqK4Fvlc7eS9c3K6bnVAfYqGdFHudc9wKZVRBNY5tEmg==@lists.infradead.org, AJvYcCUiP/yEiAx/DRXrZpI+2BQH+rL59wprNCgYO0dabkFbZxwU+RN6H1djT6Nv0uninsdI3Wagz5Mji6MyA/0=@lists.infradead.org, AJvYcCW8pAOygQa5WwIRxMVnKhEAQ/jCctR0dd/AJxINNHX/F6hSY3sTmOhWRT4RsXh0Ow7CIu77UyLds09sB39j@lists.infradead.org, AJvYcCXliUNHG5/ajC8ChlefR8QDVuIWUjj5U60c399oBi4ONcHBRKhSqjgNkRBTeRoZAb6X+2wViO0Itz2Njd20RyI=@lists.infradead.org
X-Gm-Message-State: AOJu0Yy5DMxVvMzXJVHV5BPVgEnwNHHvnxHqwmy3R8hZ9nhBDZvoVgIA
	Kz6INy13LBVeKIDmMKDDR5TPneP2PBe2kGR3lth6xQhgq2kMnIRjpDyg
X-Gm-Gg: ASbGnct6zH5NOcuMyAvDYNcO6OFkeLxSa3JgY79X5nVv2EVLJX9X4S82mZDw8IGxVar
	MDzK+pM8QH5DZkcdSqMSwjeHwEVJ/adFHuW9JRsEawAYq21bUMNvrokiUf6a3LK2BdD25wfOfGL
	zNosvIb+VON/kJG8HxzJBFGo5i7BpFqmO/nsQZlEwteFoKqIQ8X1p3JwDdXdlsj6cDpy7ot5f1m
	rl3Y/WAwAX5o719udV31GZpTYbzPjhNEuGq6tQAtrORVygCr11+X7xHDk3TBR1IWywnqDtLOaus
	PTleheMAGoCw8foyMRbvFF6DIw1CdGJRtQcmtbryiafDACwtdbdFSujbTBy37L0ReQehva74bTP
	rZgSNU+stwb4gsRHr/G9/dI1c9fW+wYMOL6J2c1s=
X-Google-Smtp-Source: AGHT+IEwAIMMmXMguO85CuFME8BHuByHpdLqU2yJrGASpVc+AuhN3x1kaE4ymuvmmSr6MxnWK7LVvA==
X-Received: by 2002:a17:906:b07:b0:afa:1453:6632 with SMTP id a640c23a62f3a-afa14536b03mr150166866b.50.1754926727869;
        Mon, 11 Aug 2025 08:38:47 -0700 (PDT)
Received: from giga-mm.home ([2a02:1210:8642:2b00:82ee:73ff:feb8:99e3])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-af91a21c157sm2047222366b.100.2025.08.11.08.38.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Aug 2025 08:38:47 -0700 (PDT)
Message-ID: <09635747dcd29f45a90dd33a74a9902d7bfa9649.camel@gmail.com>
Subject: Re: [PATCH 112/114] clk: scmi: remove round_rate() in favor of
 determine_rate()
From: Alexander Sverdlin <alexander.sverdlin@gmail.com>
To: bmasney@redhat.com, Michael Turquette <mturquette@baylibre.com>, Stephen
 Boyd <sboyd@kernel.org>, Sudeep Holla <sudeep.holla@arm.com>, Cristian
 Marussi	 <cristian.marussi@arm.com>, Chen Wang <unicorn_wang@outlook.com>,
 Inochi Amaoto	 <inochiama@gmail.com>, Nicolas Ferre
 <nicolas.ferre@microchip.com>,  Alexandre Belloni
 <alexandre.belloni@bootlin.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>,
 Paul Cercueil	 <paul@crapouillou.net>, Keguang Zhang
 <keguang.zhang@gmail.com>, Taichi Sugaya	 <sugaya.taichi@socionext.com>,
 Takao Orito <orito.takao@socionext.com>,  Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team	
 <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, Jacky Huang	
 <ychuang3@nuvoton.com>, Shan-Chun Hung <schung@nuvoton.com>, Vladimir
 Zapolskiy	 <vz@mleia.com>, Piotr Wojtaszczyk
 <piotr.wojtaszczyk@timesys.com>, Paul Walmsley <paul.walmsley@sifive.com>,
 Samuel Holland <samuel.holland@sifive.com>, Yixun Lan	 <dlan@gentoo.org>,
 Steen Hegelund <Steen.Hegelund@microchip.com>, Daniel Machon	
 <daniel.machon@microchip.com>, UNGLinuxDriver@microchip.com, Orson Zhai	
 <orsonzhai@gmail.com>, Baolin Wang <baolin.wang@linux.alibaba.com>, Chunyan
 Zhang <zhang.lyra@gmail.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue	 <alexandre.torgue@foss.st.com>, Michal Simek
 <michal.simek@amd.com>, Maxime Ripard <mripard@kernel.org>, Andreas
 =?ISO-8859-1?Q?F=E4rber?= <afaerber@suse.de>,  Manivannan Sadhasivam	
 <mani@kernel.org>, Sven Peter <sven@kernel.org>, Janne Grunau
 <j@jannau.net>,  Alyssa Rosenzweig <alyssa@rosenzweig.io>, Neal Gompa
 <neal@gompa.dev>, Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>,  Ray Jui
 <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, Broadcom
 internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Max
 Filippov <jcmvbkbc@gmail.com>, Matthias Brugger	 <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno	 <angelogioacchino.delregno@collabora.com>,
 Daniel Palmer <daniel@thingy.jp>,  Romain Perier <romain.perier@gmail.com>,
 Andrew Lunn <andrew@lunn.ch>, Gregory Clement	
 <gregory.clement@bootlin.com>, Sebastian Hesselbarth	
 <sebastian.hesselbarth@gmail.com>, Bjorn Andersson <andersson@kernel.org>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, Heiko Stuebner
 <heiko@sntech.de>, Andrea della Porta <andrea.porta@suse.com>,  Krzysztof
 Kozlowski	 <krzk@kernel.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>,
 Chanwoo Choi	 <cw00.choi@samsung.com>, Alim Akhtar
 <alim.akhtar@samsung.com>, Qin Jian	 <qinjian@cqplus1.com>, Viresh Kumar
 <vireshk@kernel.org>, Ulf Hansson	 <ulf.hansson@linaro.org>, Luca Ceresoli
 <luca.ceresoli@bootlin.com>, Alex Helms	 <alexander.helms.jy@renesas.com>,
 Linus Walleij <linus.walleij@linaro.org>,  Liviu Dudau
 <liviu.dudau@arm.com>, Lorenzo Pieralisi <lpieralisi@kernel.org>, Nobuhiro
 Iwamatsu	 <nobuhiro1.iwamatsu@toshiba.co.jp>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
	arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	sophgo@lists.linux.dev, linux-mips@vger.kernel.org, imx@lists.linux.dev, 
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
	linux-stm32@st-md-mailman.stormreply.com, patches@opensource.cirrus.com, 
	linux-actions@lists.infradead.org, asahi@lists.linux.dev, 
	linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, linux-rockchip@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, soc@lists.linux.dev
Date: Mon, 11 Aug 2025 17:38:43 +0200
In-Reply-To: <20250811-clk-for-stephen-round-rate-v1-112-b3bf97b038dc@redhat.com>
References: <20250811-clk-for-stephen-round-rate-v1-0-b3bf97b038dc@redhat.com>
	 <20250811-clk-for-stephen-round-rate-v1-112-b3bf97b038dc@redhat.com>
User-Agent: Evolution 3.56.1 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250811_083849_708557_683B6EBF 
X-CRM114-Status: GOOD (  20.36  )
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

T24gTW9uLCAyMDI1LTA4LTExIGF0IDExOjE5IC0wNDAwLCBCcmlhbiBNYXNuZXkgdmlhIEI0IFJl
bGF5IHdyb3RlOgo+IEZyb206IEJyaWFuIE1hc25leSA8Ym1hc25leUByZWRoYXQuY29tPgo+IAo+
IFRoaXMgZHJpdmVyIGltcGxlbWVudHMgYm90aCB0aGUgZGV0ZXJtaW5lX3JhdGUoKSBhbmQgcm91
bmRfcmF0ZSgpIGNsawo+IG9wcywgYW5kIHRoZSByb3VuZF9yYXRlKCkgY2xrIG9wcyBpcyBkZXBy
ZWNhdGVkLiBXaGVuIGJvdGggYXJlIGRlZmluZWQsCj4gY2xrX2NvcmVfZGV0ZXJtaW5lX3JvdW5k
X25vbG9jaygpIGZyb20gdGhlIGNsayBjb3JlIHdpbGwgb25seSB1c2UgdGhlCj4gZGV0ZXJtaW5l
X3JhdGUoKSBjbGsgb3BzLCBzbyBsZXQncyByZW1vdmUgdGhlIHJvdW5kX3JhdGUoKSBjbGsgb3Bz
IHNpbmNlCj4gaXQncyB1bnVzZWQuCj4gCj4gU2lnbmVkLW9mZi1ieTogQnJpYW4gTWFzbmV5IDxi
bWFzbmV5QHJlZGhhdC5jb20+CgpSZXZpZXdlZC1ieTogQWxleGFuZGVyIFN2ZXJkbGluIDxhbGV4
YW5kZXIuc3ZlcmRsaW5AZ21haWwuY29tPgoKPiAtLS0KPiDCoGRyaXZlcnMvY2xrL2Nsay1zY21p
LmMgfCAzMCAtLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KPiDCoDEgZmlsZSBjaGFuZ2Vk
LCAzMCBkZWxldGlvbnMoLSkKPiAKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9jbGsvY2xrLXNjbWku
YyBiL2RyaXZlcnMvY2xrL2Nsay1zY21pLmMKPiBpbmRleCBkMjQwODQwMzI4M2ZjNzJmMGNmOTAy
ZTY1ZjRjMDhiY2JjN2I0YjBiLi42YzZkZGI5MmU3Y2Y2YTBjZmFjMmM3ZTE5YzBmMTVmNzc3YmI4
YzUxIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvY2xrL2Nsay1zY21pLmMKPiArKysgYi9kcml2ZXJz
L2Nsay9jbGstc2NtaS5jCj4gQEAgLTU0LDM1ICs1NCw2IEBAIHN0YXRpYyB1bnNpZ25lZCBsb25n
IHNjbWlfY2xrX3JlY2FsY19yYXRlKHN0cnVjdCBjbGtfaHcgKmh3LAo+IMKgCXJldHVybiByYXRl
Owo+IMKgfQo+IMKgCj4gLXN0YXRpYyBsb25nIHNjbWlfY2xrX3JvdW5kX3JhdGUoc3RydWN0IGNs
a19odyAqaHcsIHVuc2lnbmVkIGxvbmcgcmF0ZSwKPiAtCQkJCXVuc2lnbmVkIGxvbmcgKnBhcmVu
dF9yYXRlKQo+IC17Cj4gLQl1NjQgZm1pbiwgZm1heCwgZnRtcDsKPiAtCXN0cnVjdCBzY21pX2Ns
ayAqY2xrID0gdG9fc2NtaV9jbGsoaHcpOwo+IC0KPiAtCS8qCj4gLQkgKiBXZSBjYW4ndCBmaWd1
cmUgb3V0IHdoYXQgcmF0ZSBpdCB3aWxsIGJlLCBzbyBqdXN0IHJldHVybiB0aGUKPiAtCSAqIHJh
dGUgYmFjayB0byB0aGUgY2FsbGVyLiBzY21pX2Nsa19yZWNhbGNfcmF0ZSgpIHdpbGwgYmUgY2Fs
bGVkCj4gLQkgKiBhZnRlciB0aGUgcmF0ZSBpcyBzZXQgYW5kIHdlJ2xsIGtub3cgd2hhdCByYXRl
IHRoZSBjbG9jayBpcwo+IC0JICogcnVubmluZyBhdCB0aGVuLgo+IC0JICovCj4gLQlpZiAoY2xr
LT5pbmZvLT5yYXRlX2Rpc2NyZXRlKQo+IC0JCXJldHVybiByYXRlOwo+IC0KPiAtCWZtaW4gPSBj
bGstPmluZm8tPnJhbmdlLm1pbl9yYXRlOwo+IC0JZm1heCA9IGNsay0+aW5mby0+cmFuZ2UubWF4
X3JhdGU7Cj4gLQlpZiAocmF0ZSA8PSBmbWluKQo+IC0JCXJldHVybiBmbWluOwo+IC0JZWxzZSBp
ZiAocmF0ZSA+PSBmbWF4KQo+IC0JCXJldHVybiBmbWF4Owo+IC0KPiAtCWZ0bXAgPSByYXRlIC0g
Zm1pbjsKPiAtCWZ0bXAgKz0gY2xrLT5pbmZvLT5yYW5nZS5zdGVwX3NpemUgLSAxOyAvKiB0byBy
b3VuZCB1cCAqLwo+IC0JZG9fZGl2KGZ0bXAsIGNsay0+aW5mby0+cmFuZ2Uuc3RlcF9zaXplKTsK
PiAtCj4gLQlyZXR1cm4gZnRtcCAqIGNsay0+aW5mby0+cmFuZ2Uuc3RlcF9zaXplICsgZm1pbjsK
PiAtfQo+IC0KPiDCoHN0YXRpYyBpbnQgc2NtaV9jbGtfc2V0X3JhdGUoc3RydWN0IGNsa19odyAq
aHcsIHVuc2lnbmVkIGxvbmcgcmF0ZSwKPiDCoAkJCcKgwqDCoMKgIHVuc2lnbmVkIGxvbmcgcGFy
ZW50X3JhdGUpCj4gwqB7Cj4gQEAgLTMwMCw3ICsyNzEsNiBAQCBzY21pX2Nsa19vcHNfYWxsb2Mo
c3RydWN0IGRldmljZSAqZGV2LCB1bnNpZ25lZCBsb25nIGZlYXRzX2tleSkKPiDCoAo+IMKgCS8q
IFJhdGUgb3BzICovCj4gwqAJb3BzLT5yZWNhbGNfcmF0ZSA9IHNjbWlfY2xrX3JlY2FsY19yYXRl
Owo+IC0Jb3BzLT5yb3VuZF9yYXRlID0gc2NtaV9jbGtfcm91bmRfcmF0ZTsKPiDCoAlvcHMtPmRl
dGVybWluZV9yYXRlID0gc2NtaV9jbGtfZGV0ZXJtaW5lX3JhdGU7Cj4gwqAJaWYgKGZlYXRzX2tl
eSAmIEJJVChTQ01JX0NMS19SQVRFX0NUUkxfU1VQUE9SVEVEKSkKPiDCoAkJb3BzLT5zZXRfcmF0
ZSA9IHNjbWlfY2xrX3NldF9yYXRlOwoKLS0gCkFsZXhhbmRlciBTdmVyZGxpbi4KCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxp
bmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZy
YWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
