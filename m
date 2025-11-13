Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2D3DCD6E74
	for <linux-riscv@archiver.kernel.org>; Thu, 13 Nov 2025 14:40:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0O1rW3HBFy7jHttfAcA+Y+I5s8nsnREZ4GpiqNzzBAk=; b=Hc0D6MtUKInONr
	y47uRQkowwB1ZGkl32H+lesG9lYxrxyrqiF6yY7oG1K31l9zh3gP1jjWx+x43zNVxOTkAdMcanM62
	E579kMNtQw0tWThIoPFt8fFLOa8nSfRkYshiVIEqNjSBZ2usGEk/yzJqmaStIk4IFKRWkCbrpLAJX
	LlkmOBul9C6+9DRCSK2xSfdYYFABEMZcYT4yqUpO7giic4hRaBR8f1D9JOSfQ4qWs3MGY8S+scAP7
	uLHJtoTIX7PITQDOaEPL0hmbShEco8qd3W3Z/1ta1OIujdI0nH4KQtUuW2tv3MREnR+bSD/HjEtz1
	rYON9xd0iaKZrCmdGnmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJYUW-0000000AcvC-48B5;
	Thu, 13 Nov 2025 14:40:04 +0000
Received: from mail-lj1-x232.google.com ([2a00:1450:4864:20::232])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJYUU-0000000Actf-2wmX
	for linux-riscv@lists.infradead.org;
	Thu, 13 Nov 2025 14:40:04 +0000
Received: by mail-lj1-x232.google.com with SMTP id 38308e7fff4ca-37a2dced861so18517941fa.1
        for <linux-riscv@lists.infradead.org>; Thu, 13 Nov 2025 06:40:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1763044800; x=1763649600; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wl4571SxJAzignqkvu+iEEF0Pe+/jqH/UWVoWMdIiw4=;
        b=pRGGRITiMcjn/zmuPzohApNv86aR22HHu5oEcaFnYgBnF2u4gNNc+txsgFPzf3Yjru
         29tSYfC9lZAIdvkdkjDq0Gv6omGxhI7lY/fEPdcoFMEG3aImzO6tKbaWA+tmmxwPjQb1
         qN+PC1LF1P7eDaV8MPQlVqpsDFnjcUOlFBZ1umnlVp9o8VItAD71kxXya6fgdpPV8fMh
         RMAi+EwYdk2ZNGU7Bh7ZL+RUd7VdhkQTcZmsC6W1wCbpExx1Jr+DUhxHpYayQQJMVgNG
         Y5geJzyIX9Z9NMhq3WdUkAuQD7ZsWNaKSIJEfNk3evjd7H1fWfY40A2a4wFcGoBxPNMA
         gX6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763044800; x=1763649600;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=wl4571SxJAzignqkvu+iEEF0Pe+/jqH/UWVoWMdIiw4=;
        b=gElBMm5QTPRAX3VAvtxC5zMGVpzmASh9NgZYii5Zk6ZSos1DAizmbFogb4g96T+fdj
         DPZpATjxa5hwIhx3voc1ZRkhouYDrI3WWKUiwYl7WkgPc2JvEvJZqT0/RKzZIhdVZadD
         jNIsNvNztveORNH32o62vLqNHEVTY0rDyUlYQPiHocaanhQR58vLe8qKEnRTbmy02XYc
         kVs+EDBXDjDmSFhPYdN4VnBvzvCOj5IeEXgDo7BRiF6kGVYAyKbsNNC/oPRCoKK+s+Cu
         /uMwbdfhSzJjK89YzdmWF8+LSMAls3xLKI82TdZhTIjiQQ6xWN7ehU0IZXs9396yzb+v
         yiyA==
X-Forwarded-Encrypted: i=1; AJvYcCXrgkxZJbN1tBbyK7JiYoBLtKrzazJwNUihHyosizTxoNvd9Dn0jkfmhjbc+RxEqNN9gPTScXO5Im1bxQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YxXRbZUMwFrIwxuFJIzFuz2IDHfPQYS7/ULs9PsS/FfY5bOHMtR
	feyLni2cE4ko/REQCkfPAzEhAh1F6tXW876JD1fDlQqWoRqE8OzVmVJoENm7JyeJCjY5qBhdR5A
	WT92EhQC6U7qgdQ4MqTJ/9zosP8QShl+8FOQEuFw5Ew==
X-Gm-Gg: ASbGncsMmaHDX0VNBHU+Suc4driBf+thwib5oloKDcEmVdqtgWMr1AZGuVFsbmGnE4R
	DDgTaRd71aYguY16bOL2UJxW7QSe6B61ojcciCFmywFxAsJI1QJjA1HXLIwHgOh0I6XoojaS96d
	LbjogNjb4PH4JWnGlzuMw++9JMsTNEt+VC7gOl9yZZYdbK+zpaBJ5ns6oFkQSYXS11O7/9KBt0S
	zGVqPabcQgMhL0DaTi+Qc0u0ouwdELuqbgFBeQqhm+o0cgUU4km6Ab40WJxSc+LcldAZsTiOqXw
	CXD+2OiQ1b5V2HAK
X-Google-Smtp-Source: AGHT+IHcp5RL49BzQ/EwQ2Jax7wwd/a8PEM1WoZpid3JGwwdtlpJzBmzwt/P9jvyh9TplD5Nus8fFpsIw/K4cuDWoP0=
X-Received: by 2002:a05:6512:104f:b0:594:2876:c901 with SMTP id
 2adb3069b0e04-5957ececcc7mr1012811e87.25.1763044799557; Thu, 13 Nov 2025
 06:39:59 -0800 (PST)
MIME-Version: 1.0
References: <20251107-qcom-sa8255p-emac-v5-0-01d3e3aaf388@linaro.org>
 <20251107-qcom-sa8255p-emac-v5-8-01d3e3aaf388@linaro.org> <aRMiafCQNPVDOljU@horms.kernel.org>
In-Reply-To: <aRMiafCQNPVDOljU@horms.kernel.org>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 13 Nov 2025 15:39:45 +0100
X-Gm-Features: AWmQ_bmyO0__RPwdcHgOIMRaFCfnIoYFER6JzR_p2Qqf8fR68sQPWn6kw1o5zWY
Message-ID: <CAMRc=MfEuAhichw-tPJkj_BKxy7AzvfmVJJyXzHsqa2wf=2EKw@mail.gmail.com>
Subject: Re: [PATCH v5 8/8] net: stmmac: qcom-ethqos: add support for sa8255p
To: Simon Horman <horms@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Richard Cochran <richardcochran@gmail.com>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Vinod Koul <vkoul@kernel.org>, Giuseppe Cavallaro <peppe.cavallaro@st.com>, 
	Jose Abreu <joabreu@synopsys.com>, Chen-Yu Tsai <wens@kernel.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Matthew Gerlach <matthew.gerlach@altera.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
	Keguang Zhang <keguang.zhang@gmail.com>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Jan Petrous <jan.petrous@oss.nxp.com>, s32@nxp.com, 
	Romain Gantois <romain.gantois@bootlin.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, Heiko Stuebner <heiko@sntech.de>, 
	Chen Wang <unicorn_wang@outlook.com>, Inochi Amaoto <inochiama@gmail.com>, 
	Emil Renner Berthing <kernel@esmil.dk>, Minda Chen <minda.chen@starfivetech.com>, 
	Drew Fustini <fustini@kernel.org>, Guo Ren <guoren@kernel.org>, Fu Wei <wefu@redhat.com>, 
	Nobuhiro Iwamatsu <nobuhiro.iwamatsu.x90@mail.toshiba>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	Maxime Ripard <mripard@kernel.org>, Shuang Liang <liangshuang@eswincomputing.com>, 
	Zhi Li <lizhi2@eswincomputing.com>, Shangjuan Wei <weishangjuan@eswincomputing.com>, 
	"G. Jaya Kumaran" <vineetha.g.jaya.kumaran@intel.com>, Clark Wang <xiaoning.wang@nxp.com>, 
	Linux Team <linux-imx@nxp.com>, Frank Li <Frank.Li@nxp.com>, David Wu <david.wu@rock-chips.com>, 
	Samin Guo <samin.guo@starfivetech.com>, 
	Christophe Roullier <christophe.roullier@foss.st.com>, Swathi K S <swathi.ks@samsung.com>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, netdev@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, Drew Fustini <dfustini@tenstorrent.com>, 
	linux-sunxi@lists.linux.dev, linux-amlogic@lists.infradead.org, 
	linux-mips@vger.kernel.org, imx@lists.linux.dev, 
	linux-renesas-soc@vger.kernel.org, linux-rockchip@lists.infradead.org, 
	sophgo@lists.linux.dev, linux-riscv@lists.infradead.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251113_064002_897409_B2583B46 
X-CRM114-Status: GOOD (  24.18  )
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

T24gVHVlLCBOb3YgMTEsIDIwMjUgYXQgMTI6NDjigK9QTSBTaW1vbiBIb3JtYW4gPGhvcm1zQGtl
cm5lbC5vcmc+IHdyb3RlOgo+Cj4gT24gRnJpLCBOb3YgMDcsIDIwMjUgYXQgMTE6Mjk6NThBTSAr
MDEwMCwgQmFydG9zeiBHb2xhc3pld3NraSB3cm90ZToKPiA+IEZyb206IEJhcnRvc3ogR29sYXN6
ZXdza2kgPGJhcnRvc3ouZ29sYXN6ZXdza2lAbGluYXJvLm9yZz4KPgo+IC4uLgo+Cj4gPiArc3Rh
dGljIGludCBxY29tX2V0aHFvc19wZF9pbml0KHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYs
IHZvaWQgKnByaXYpCj4gPiArewo+ID4gKyAgICAgc3RydWN0IHFjb21fZXRocW9zICpldGhxb3Mg
PSBwcml2Owo+ID4gKyAgICAgaW50IHJldDsKPiA+ICsKPiA+ICsgICAgIC8qCj4gPiArICAgICAg
KiBFbmFibGUgZnVuY3Rpb25hbCBjbG9jayB0byBwcmV2ZW50IERNQSByZXNldCBhZnRlciB0aW1l
b3V0IGR1ZQo+ID4gKyAgICAgICogdG8gbm8gUEhZIGNsb2NrIGJlaW5nIGVuYWJsZWQgYWZ0ZXIg
dGhlIGhhcmR3YXJlIGJsb2NrIGhhcyBiZWVuCj4gPiArICAgICAgKiBwb3dlciBjeWNsZWQuIFRo
ZSBhY3R1YWwgY29uZmlndXJhdGlvbiB3aWxsIGJlIGFkanVzdGVkIG9uY2UKPiA+ICsgICAgICAq
IGV0aHFvc19maXhfbWFjX3NwZWVkKCkgaXMgY2FsbGVkLgo+ID4gKyAgICAgICovCj4gPiArICAg
ICBldGhxb3Nfc2V0X2Z1bmNfY2xrX2VuKGV0aHFvcyk7Cj4gPiArCj4gPiArICAgICByZXQgPSBx
Y29tX2V0aHFvc19kb21haW5fb24oZXRocW9zLCBFVEhRT1NfUERfQ09SRSk7Cj4gPiArICAgICBp
ZiAocmV0KQo+ID4gKyAgICAgICAgICAgICByZXR1cm4gcmV0Owo+ID4gKwo+ID4gKyAgICAgcmV0
ID0gcWNvbV9ldGhxb3NfZG9tYWluX29uKGV0aHFvcywgRVRIUU9TX1BEX01ESU8pOwo+ID4gKyAg
ICAgaWYgKHJldCkgewo+ID4gKyAgICAgICAgICAgICBxY29tX2V0aHFvc19kb21haW5fb2ZmKGV0
aHFvcywgRVRIUU9TX1BEX0NPUkUpOwo+ID4gKyAgICAgICAgICAgICByZXR1cm4gcmV0Owo+ID4g
KyAgICAgfQo+ID4gKwo+ID4gKyAgICAgcmV0dXJuIDA7Cj4gPiArfQo+ID4gKwo+ID4gK3N0YXRp
YyB2b2lkIHFjb21fZXRocW9zX3BkX2V4aXQoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldiwg
dm9pZCAqZGF0YSkKPiA+ICt7Cj4gPiArICAgICBzdHJ1Y3QgcWNvbV9ldGhxb3MgKmV0aHFvcyA9
IGRhdGE7Cj4gPiArCj4gPiArICAgICBxY29tX2V0aHFvc19kb21haW5fb2ZmKGV0aHFvcywgRVRI
UU9TX1BEX01ESU8pOwo+ID4gKyAgICAgcWNvbV9ldGhxb3NfZG9tYWluX29mZihldGhxb3MsIEVU
SFFPU19QRF9DT1JFKTsKPiA+ICt9Cj4gPiArCj4gPiAgc3RhdGljIHZvaWQgZXRocW9zX3B0cF9j
bGtfZnJlcV9jb25maWcoc3RydWN0IHN0bW1hY19wcml2ICpwcml2KQo+ID4gIHsKPiA+ICAgICAg
IHN0cnVjdCBwbGF0X3N0bW1hY2VuZXRfZGF0YSAqcGxhdF9kYXQgPSBwcml2LT5wbGF0Owo+Cj4g
Li4uCj4KPiA+IEBAIC04NTIsMjggKzk5Myw2MyBAQCBzdGF0aWMgaW50IHFjb21fZXRocW9zX3By
b2JlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpCj4gPiAgICAgICBldGhxb3MtPnJnbWlp
X2NvbmZpZ19sb29wYmFja19lbiA9IGRydl9kYXRhLT5yZ21paV9jb25maWdfbG9vcGJhY2tfZW47
Cj4gPiAgICAgICBldGhxb3MtPmhhc19lbWFjX2dlXzMgPSBkcnZfZGF0YS0+aGFzX2VtYWNfZ2Vf
MzsKPiA+ICAgICAgIGV0aHFvcy0+bmVlZHNfc2dtaWlfbG9vcGJhY2sgPSBkcnZfZGF0YS0+bmVl
ZHNfc2dtaWlfbG9vcGJhY2s7Cj4gPiAtCj4gPiAtICAgICBldGhxb3MtPnBtLmxpbmtfY2xrID0g
ZGV2bV9jbGtfZ2V0KGRldiwgY2xrX25hbWUpOwo+ID4gLSAgICAgaWYgKElTX0VSUihldGhxb3Mt
PnBtLmxpbmtfY2xrKSkKPiA+IC0gICAgICAgICAgICAgcmV0dXJuIGRldl9lcnJfcHJvYmUoZGV2
LCBQVFJfRVJSKGV0aHFvcy0+cG0ubGlua19jbGspLAo+ID4gLSAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAiRmFpbGVkIHRvIGdldCBsaW5rX2Nsa1xuIik7Cj4gPiAtCj4gPiAtICAg
ICByZXQgPSBldGhxb3NfY2xrc19jb25maWcoZXRocW9zLCB0cnVlKTsKPiA+IC0gICAgIGlmIChy
ZXQpCj4gPiAtICAgICAgICAgICAgIHJldHVybiByZXQ7Cj4gPiAtCj4gPiAtICAgICByZXQgPSBk
ZXZtX2FkZF9hY3Rpb25fb3JfcmVzZXQoZGV2LCBldGhxb3NfY2xrc19kaXNhYmxlLCBldGhxb3Mp
Owo+ID4gLSAgICAgaWYgKHJldCkKPiA+IC0gICAgICAgICAgICAgcmV0dXJuIHJldDsKPiA+IC0K
PiA+IC0gICAgIGV0aHFvcy0+cG0uc2VyZGVzX3BoeSA9IGRldm1fcGh5X29wdGlvbmFsX2dldChk
ZXYsICJzZXJkZXMiKTsKPiA+IC0gICAgIGlmIChJU19FUlIoZXRocW9zLT5wbS5zZXJkZXNfcGh5
KSkKPiA+IC0gICAgICAgICAgICAgcmV0dXJuIGRldl9lcnJfcHJvYmUoZGV2LCBQVFJfRVJSKGV0
aHFvcy0+cG0uc2VyZGVzX3BoeSksCj4gPiAtICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICJGYWlsZWQgdG8gZ2V0IHNlcmRlcyBwaHlcbiIpOwo+ID4gLQo+ID4gLSAgICAgZXRocW9z
LT5zZXRfc2VyZGVzX3NwZWVkID0gZXRocW9zX3NldF9zZXJkZXNfc3BlZWRfcGh5Owo+ID4gICAg
ICAgZXRocW9zLT5zZXJkZXNfc3BlZWQgPSBTUEVFRF8xMDAwOwo+ID4gLSAgICAgZXRocW9zX3Vw
ZGF0ZV9saW5rX2NsayhldGhxb3MsIFNQRUVEXzEwMDApOwo+ID4gKwo+ID4gKyAgICAgaWYgKHBt
X2RhdGEgJiYgcG1fZGF0YS0+dXNlX2RvbWFpbnMpIHsKPiA+ICsgICAgICAgICAgICAgZXRocW9z
LT5zZXRfc2VyZGVzX3NwZWVkID0gZXRocW9zX3NldF9zZXJkZXNfc3BlZWRfcGQ7Cj4gPiArCj4g
PiArICAgICAgICAgICAgIHJldCA9IGRldm1fcG1fZG9tYWluX2F0dGFjaF9saXN0KGRldiwgJnBt
X2RhdGEtPnBkLAo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAmZXRocW9zLT5wZC5wZF9saXN0KTsKPiA+ICsgICAgICAgICAgICAgaWYgKHJldCA8IDAp
Cj4gPiArICAgICAgICAgICAgICAgICAgICAgcmV0dXJuIGRldl9lcnJfcHJvYmUoZGV2LCByZXQs
ICJGYWlsZWQgdG8gYXR0YWNoIHBvd2VyIGRvbWFpbnNcbiIpOwo+ID4gKwo+ID4gKyAgICAgICAg
ICAgICBwbGF0X2RhdC0+Y2xrc19jb25maWcgPSBldGhxb3NfcGRfY2xrc19jb25maWc7Cj4gPiAr
ICAgICAgICAgICAgIHBsYXRfZGF0LT5zZXJkZXNfcG93ZXJ1cCA9IHFjb21fZXRocW9zX3BkX3Nl
cmRlc19wb3dlcnVwOwo+ID4gKyAgICAgICAgICAgICBwbGF0X2RhdC0+c2VyZGVzX3Bvd2VyZG93
biA9IHFjb21fZXRocW9zX3BkX3NlcmRlc19wb3dlcmRvd247Cj4gPiArICAgICAgICAgICAgIHBs
YXRfZGF0LT5leGl0ID0gcWNvbV9ldGhxb3NfcGRfZXhpdDsKPgo+IEhpIEJhcnRvc3osCj4KPiBJ
dCBzZWVtcyB0aGF0IHRoZSBpbnRlbnRpb24gb2YgdGhpcyBpcyB0byBlbnN1cmUKPiB0aGF0IGRv
bWFpbnMgdHVybmVkIG9uIGJ5IHFjb21fZXRocW9zX3BkX2luaXQoKQo+IGFyZSB0dXJuZWQgb2Zm
IGFnYWluIG9uIGV4aXQgb3IgY2xlYW4tdXAgaW4gZXJyb3IgcGF0aHMuCj4KPiA+ICsgICAgICAg
ICAgICAgcGxhdF9kYXQtPmluaXQgPSBxY29tX2V0aHFvc19wZF9pbml0Owo+ID4gKyAgICAgICAg
ICAgICBwbGF0X2RhdC0+Y2xrX3B0cF9yYXRlID0gcG1fZGF0YS0+Y2xrX3B0cF9yYXRlOwo+ID4g
Kwo+ID4gKyAgICAgICAgICAgICByZXQgPSBxY29tX2V0aHFvc19wZF9pbml0KHBkZXYsIGV0aHFv
cyk7Cj4gPiArICAgICAgICAgICAgIGlmIChyZXQpCj4gPiArICAgICAgICAgICAgICAgICAgICAg
cmV0dXJuIHJldDsKPgo+IEFuZCBoZXJlIHRob3NlIGRvbWFpbnMgYXJlIHR1cm5lZCBvbi4KPgo+
ID4gKwo+ID4gKyAgICAgICAgICAgICByZXQgPSBxY29tX2V0aHFvc19kb21haW5fb24oZXRocW9z
LCBFVEhRT1NfUERfU0VSREVTKTsKPiA+ICsgICAgICAgICAgICAgaWYgKHJldCkKPgo+IEJ1dCBp
dCBzZWVtcyB0aGF0IGlmIHdlIHJlYWNoIHRoaXMgZXJyb3IgcGF0aCB0aGVuIHRoZSBjbGVhbnVw
IGlzIG5vdAo+IHBlcmZvcm1lZC4gVGhpcyBpcyBiZWNhdXNlIHBsYXRfZGF0IGFuZCB0aHVzIGl0
J3MgZXhpdCBjYWxsYmFjayBhcmUKPiByZWdpc3RlcmVkIHVudGlsIHRoZSBjYWxsIHRvIGRldm1f
c3RtbWFjX3BsdGZyX3Byb2JlKCkgdG93YXJkcyB0aGUgZW5kIG9mCj4gdGhpcyBmdW5jdGlvbi4K
CldlIGNhbiBvbmx5IHJlYWNoIHRoaXMgaWYgZGV2bV9zdG1tYWNfcGx0ZnJfcHJvYmUoKSBmYWls
cy4gWWVhaCBpdApwcm9iYWJseSB3YXJyYW50cyBhIGRldnJlcyBhY3Rpb24uCgpCYXJ0b3N6Cgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNj
diBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlz
dHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
