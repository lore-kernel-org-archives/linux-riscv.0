Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73A4ACD4F2F
	for <linux-riscv@archiver.kernel.org>; Thu, 13 Nov 2025 13:31:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BKCVOA23rKvj17YG6WxlR6eoun14ee2jjVlSwz+DE/o=; b=iaRjrONso9zR/y
	sVYFt4YkUSwEhrSSoolgMvhZUEpjT6hSF8QhYWmn7DkMHagUziT52iLvrEk7XQtSdl/+ApWfOch4u
	YEJJ8Exk39Jct8bcMWTZlL76KfDf9f136LAEDeoCB17DWwHNJhA4AtU6PeuM+PFRXP/pn2kMQS7Bb
	bYS2/6SkE8Rz/8taJUsDbJMtoDJvWv7+1BXKlKpExJsDxbpGXrf+k1UhBnN5+RoPSrHzD0Z57qCbe
	I6DJ1Qz9sZaDBp0tO5+a6rBUyS6FcF+nZCfMm24mbcUtT0VpeSmMkdFeslcHcRTvMWxSouhGd8TKr
	0blqLvxqOO4IyOXzFkmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJXQK-0000000AXlA-2Fj2;
	Thu, 13 Nov 2025 13:31:40 +0000
Received: from mail-lf1-x136.google.com ([2a00:1450:4864:20::136])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJXQG-0000000AXhm-0Zwq
	for linux-riscv@lists.infradead.org;
	Thu, 13 Nov 2025 13:31:38 +0000
Received: by mail-lf1-x136.google.com with SMTP id 2adb3069b0e04-5957d7e0bf3so1457899e87.0
        for <linux-riscv@lists.infradead.org>; Thu, 13 Nov 2025 05:31:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1763040694; x=1763645494; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=73kr7nUrOWZMw2Xrq3JK7B68+7C7ERu+i4U/2oSeqZY=;
        b=VfrElMLag51Qj5NDMdmZQfiel/BSamC2N1hWhyZiybvkzbT7+vFPVqNK4/maljPMEY
         5+zOQigNPAZbQJuAtOmzeHg8cZ0+SirQwdRVIklNVKwlLl4+6d7cwUToFF2wWWxCIYFH
         ORtJh1G+8uD84sKiy6osk0whQudCoff71cbUIPqeOrpi1IqZCzTt7POmpCEfxASoRt0h
         wYdKHem/MtfiTUxfH8QuLzWrdoI+nZE6WHTx/FFsWCKHWoJV/zYCCH8EEx9FjpY3Iz/O
         WO9L8zZMlSr5W0qSWLbdI6xbjOrNVqMy5soaVsfQbxi3b7fYCV+QfK9Z40Izrli+QGG2
         Cyiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763040694; x=1763645494;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=73kr7nUrOWZMw2Xrq3JK7B68+7C7ERu+i4U/2oSeqZY=;
        b=n4d11ukL8BSu0vZrcyy3no6oAprESnMQb2VsSYr8D92tQ0GfL55/IfTTSkD62lM66v
         Th4weySbUK80LiUU4b8+W76A5F1XRYxiig9mYgKtFqIcsL0EETelHH1TI+qVvYM4dh5i
         DQuqlLD7fl8oIxcqpnl767iKnklyse+ouH2hoSIDwPeQMOgpz2e+vfJ9Bb47aBHWDU7+
         M7U6ux7HGm9J9fbI56iMnXTcXssxPtj9yVnFzwYDbWHwnzAzZ9q7JDOl1ujc6PCO3WlN
         yInueA1m0Kj/VrvLZHtmAYusizIJz9kk4LfGVb6FZxmD20ax4rutnbmQQt549r02WJgP
         2DGw==
X-Forwarded-Encrypted: i=1; AJvYcCU9Q9JRNbVzC6ZN/JjKJFb3U+qA0P4BGBkMgM2TG2BPwuPFmoBBSvB9a7PholowqBJjGgUCytRS68281Q==@lists.infradead.org
X-Gm-Message-State: AOJu0YxvYmH76Jytiq5XYc/2LBeycFVP5BmEB5Uc7/hKPlXcmZvLVT8a
	KafDVgidzI1VExoC5Esi/sLXpl7VNey9Da2vSZ4eWlUaMH6pD5e/ONpncWYx+LptVcw4SwaW/n7
	TAzBpTVADCWSyvFairNNwEYkCKURBUOATzFLipy5WAg==
X-Gm-Gg: ASbGncsflfOWzFkEFdxA/eKrzx9haykjPDJ0hc1YTm2gh7sKxodv9Z/ehP7DfAbQXK5
	gdqWfDi3cE6DM0anGvDmZCAtFuEYR27GDXd+OP3vzmHdYKOZBvUx3a91+lVVmQis6lvev6yeC8U
	xtpjMMYrMHN9RIgI42lC+LO6x9hAxxol1Xb+RzkWol8QptDRa2ggpXQCZjAvacyJUjt/fQkj0Km
	qmZ+OzmMMo7teGYC0kZlujvzetNapRQbWGRHTv6YP+Nz9cZREdl4urqF5z28YGBiAk+W1Q7qHbz
	zb+rpv7hMhxpfzqY
X-Google-Smtp-Source: AGHT+IFmYGYaNrPxFWU0ghXUofhzNye14/5vushtgIFDWSfgA/MklzOW/JNoBE9rLO+zgbK8iJzH+WbW5agg2UGK7Co=
X-Received: by 2002:a05:6512:144d:20b0:595:7b24:d352 with SMTP id
 2adb3069b0e04-5957ececb1fmr730185e87.24.1763040694032; Thu, 13 Nov 2025
 05:31:34 -0800 (PST)
MIME-Version: 1.0
References: <20251107-qcom-sa8255p-emac-v5-0-01d3e3aaf388@linaro.org>
 <20251107-qcom-sa8255p-emac-v5-3-01d3e3aaf388@linaro.org> <9805b902-95bb-4b18-b65f-f6efdfb6807a@oss.qualcomm.com>
In-Reply-To: <9805b902-95bb-4b18-b65f-f6efdfb6807a@oss.qualcomm.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 13 Nov 2025 14:31:22 +0100
X-Gm-Features: AWmQ_bmfo87z1zTXv8LP-M-WOLEoIFCS2S60P9_2zq_qXBjBuZTULdbiMAAMcS0
Message-ID: <CAMRc=MdWu5x5bgh4CfPsowJnF0Qh1W770KTDtTFMkGkQf4_LKg@mail.gmail.com>
Subject: Re: [PATCH v5 3/8] net: stmmac: qcom-ethqos: improve typing in devres callback
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
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
X-CRM114-CacheID: sfid-20251113_053136_207052_FBF5CC7D 
X-CRM114-Status: GOOD (  16.70  )
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

T24gRnJpLCBOb3YgNywgMjAyNSBhdCAxMTo1MOKAr0FNIEtvbnJhZCBEeWJjaW8KPGtvbnJhZC5k
eWJjaW9Ab3NzLnF1YWxjb21tLmNvbT4gd3JvdGU6Cj4KPiBPbiAxMS83LzI1IDExOjI5IEFNLCBC
YXJ0b3N6IEdvbGFzemV3c2tpIHdyb3RlOgo+ID4gRnJvbTogQmFydG9zeiBHb2xhc3pld3NraSA8
YmFydG9zei5nb2xhc3pld3NraUBsaW5hcm8ub3JnPgo+ID4KPiA+IEl0J3MgYmFkIHByYWN0aWNl
IHRvIGp1c3QgZGlyZWN0bHkgcGFzcyB2b2lkIHBvaW50ZXJzIHRvIGZ1bmN0aW9ucyB3aGljaAo+
ID4gZXhwZWN0IGNvbmNyZXRlIHR5cGVzLiBNYWtlIGl0IG1vcmUgY2xlYXIgd2hhdCB0eXBlIGV0
aHFvc19jbGtzX2NvbmZpZygpCj4gPiBleHBlY3RzLgo+ID4KPiA+IFNpZ25lZC1vZmYtYnk6IEJh
cnRvc3ogR29sYXN6ZXdza2kgPGJhcnRvc3ouZ29sYXN6ZXdza2lAbGluYXJvLm9yZz4KPiA+IC0t
LQo+ID4gIGRyaXZlcnMvbmV0L2V0aGVybmV0L3N0bWljcm8vc3RtbWFjL2R3bWFjLXFjb20tZXRo
cW9zLmMgfCA0ICsrKy0KPiA+ICAxIGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspLCAxIGRl
bGV0aW9uKC0pCj4gPgo+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvbmV0L2V0aGVybmV0L3N0bWlj
cm8vc3RtbWFjL2R3bWFjLXFjb20tZXRocW9zLmMgYi9kcml2ZXJzL25ldC9ldGhlcm5ldC9zdG1p
Y3JvL3N0bW1hYy9kd21hYy1xY29tLWV0aHFvcy5jCj4gPiBpbmRleCA4NTc4YTJkZjhjZjBkMWQ4
ODA4YmNmN2U3YjU3YzkzZWIxNGM4N2RiLi44NDkzMTMxY2EzMmY1YzZjYTdlMTY1NGRhMGJiZjRm
ZmExZWVmYTRlIDEwMDY0NAo+ID4gLS0tIGEvZHJpdmVycy9uZXQvZXRoZXJuZXQvc3RtaWNyby9z
dG1tYWMvZHdtYWMtcWNvbS1ldGhxb3MuYwo+ID4gKysrIGIvZHJpdmVycy9uZXQvZXRoZXJuZXQv
c3RtaWNyby9zdG1tYWMvZHdtYWMtcWNvbS1ldGhxb3MuYwo+ID4gQEAgLTcyNiw3ICs3MjYsOSBA
QCBzdGF0aWMgaW50IGV0aHFvc19jbGtzX2NvbmZpZyh2b2lkICpwcml2LCBib29sIGVuYWJsZWQp
Cj4gPgo+ID4gIHN0YXRpYyB2b2lkIGV0aHFvc19jbGtzX2Rpc2FibGUodm9pZCAqZGF0YSkKPiA+
ICB7Cj4gPiAtICAgICBldGhxb3NfY2xrc19jb25maWcoZGF0YSwgZmFsc2UpOwo+ID4gKyAgICAg
c3RydWN0IHFjb21fZXRocW9zICpldGhxb3MgPSBkYXRhOwo+ID4gKwo+ID4gKyAgICAgZXRocW9z
X2Nsa3NfY29uZmlnKGV0aHFvcywgZmFsc2UpOwo+Cj4gZXRocW9zX2Nsa3NfY29uZmlnKCkgdGFr
ZXMgYSB2b2lkcHRyIHRvbwo+Cj4gS29ucmFkCgpSaWdodC4gSSB0aGluayBJIGhhZCBzb21ldGhp
bmcgaW4gbWluZCB3aGVuIEkgd3JvdGUgaXQgYnV0IEknbSBub3QKc3VyZSB3aGF0IGFueW1vcmUu
IEJlc3QgZHJvcCB0aGlzLgoKQmFydAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3Rz
LmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5m
by9saW51eC1yaXNjdgo=
