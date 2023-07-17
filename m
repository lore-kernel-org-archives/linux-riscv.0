Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D26CEB64DC
	for <linux-riscv@archiver.kernel.org>; Mon, 17 Jul 2023 07:42:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yqdOQPnkEi744v77X7P0QyQMHDeG9arVR8Ui+4mdTLA=; b=MDNARDXbl2YKF5
	MPgVZuSQWmyvNweBPaQX9nuE1YB7qcZTU1s2/vIpof5cCV9p8Acaih7R6v9F1+JfQ39JBIkxqh22o
	wjjLJtx/FU57hYO/Nmrz7DeoclVkdE47nvCcJ8TD0T5mGdEf8+TXFrDZw7JCpB80e3oDtJr0YviZw
	pV7xMRiNHSJE76A1iqev+4MABp9MeTNDneeBE7TyOB1ljJr8h8ECgJHLnK6yg0/HOBy4kCEAKEPTY
	lQT2Sgu+HtPpmAD05NsttaUOJ2AGjfR7P6EkckUBP0X/qhFI0NjdWzPcC6cqr8J5dXO8golz13Y4O
	ecYx7MoJ2c+uBwG0OTWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qLIrx-003Ku7-2Z;
	Mon, 17 Jul 2023 07:42:09 +0000
Received: from mail-io1-f53.google.com ([209.85.166.53])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qLIra-003Knk-28;
	Mon, 17 Jul 2023 07:41:48 +0000
Received: by mail-io1-f53.google.com with SMTP id ca18e2360f4ac-7836272f36eso185028139f.1;
        Mon, 17 Jul 2023 00:41:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689579703; x=1692171703;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EUvC4vvxIfMz+5toOkjqLhwq7X8FXptFWezRZuPzIyE=;
        b=Wf3rgWGpNwpyv5tlyWdTupQqPacWgdyJs7ZAzgEEozZm4Uef/hxR8nkod7YQUT6bgO
         16ilXZv7wumPT7WCfAY0zdf8lC9hpR7BUwYkF0OoIkYPYPzV0d3wtcxAgOsA7fKry5sK
         AH0g8CpJJQODp0AkxrgXT23Qfmm4s7rvC9RcX1Uw4nnnUsAL4kUtgZ4SIhbJiDndZ326
         eUQdmlxzaT6JCUBedtiMUuwvJjt4iiyUIrTB5Cn9YcezZBijj4Z3qeNVJrCWtJNCnHQ3
         nKcIqujm5MYzKj0k6/GM8pywyjqygQfxKX0KXrn3pdInUFcUID9mOKwCBvLF/SETKr8q
         l6yQ==
X-Gm-Message-State: ABy/qLbehlLKnAmnNe+ZWaIn68GhEZ9L9HMYUKx6oTSvNlvpS+YSO5ZR
	/4s+iR/N7215w5XPGppiv4foFd+BsLsp5Q==
X-Google-Smtp-Source: APBJJlEPT9S2yBzgfQbCLSyofRYDx0GrmtbYTT0EGiujwYABTHHZYGBMIXm/g3tPKnD8OPB06bmsGQ==
X-Received: by 2002:a5e:aa0f:0:b0:783:4e11:76d7 with SMTP id s15-20020a5eaa0f000000b007834e1176d7mr11002981ioe.21.1689579703529;
        Mon, 17 Jul 2023 00:41:43 -0700 (PDT)
Received: from mail-io1-f48.google.com (mail-io1-f48.google.com. [209.85.166.48])
        by smtp.gmail.com with ESMTPSA id b12-20020a5ea70c000000b0076ffebfc9fasm4573508iod.47.2023.07.17.00.41.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Jul 2023 00:41:43 -0700 (PDT)
Received: by mail-io1-f48.google.com with SMTP id ca18e2360f4ac-78666994bc2so186032139f.0;
        Mon, 17 Jul 2023 00:41:42 -0700 (PDT)
X-Received: by 2002:a81:65d6:0:b0:571:11ea:b2dd with SMTP id
 z205-20020a8165d6000000b0057111eab2ddmr11237476ywb.32.1689579681652; Mon, 17
 Jul 2023 00:41:21 -0700 (PDT)
MIME-Version: 1.0
References: <20230714174342.4052882-1-robh@kernel.org>
In-Reply-To: <20230714174342.4052882-1-robh@kernel.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 17 Jul 2023 09:41:10 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUUWy3Knk6Jqao12KULam_3XpYc=cGqRXe4reH7FPVZsg@mail.gmail.com>
Message-ID: <CAMuHMdUUWy3Knk6Jqao12KULam_3XpYc=cGqRXe4reH7FPVZsg@mail.gmail.com>
Subject: Re: [PATCH] clk: Explicitly include correct DT includes
To: Rob Herring <robh@kernel.org>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	=?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.de>, 
	Manivannan Sadhasivam <mani@kernel.org>, Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>, 
	Florian Fainelli <florian.fainelli@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Ray Jui <rjui@broadcom.com>, 
	Scott Branden <sbranden@broadcom.com>, Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Sudeep Holla <sudeep.holla@arm.com>, 
	Cristian Marussi <cristian.marussi@arm.com>, Luca Ceresoli <luca.ceresoli@bootlin.com>, 
	Alex Helms <alexander.helms.jy@renesas.com>, Abel Vesa <abelvesa@kernel.org>, 
	Peng Fan <peng.fan@nxp.com>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>, Nishanth Menon <nm@ti.com>, 
	Tero Kristo <kristo@kernel.org>, Santosh Shilimkar <ssantosh@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, Kevin Hilman <khilman@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Andrew Lunn <andrew@lunn.ch>, 
	Gregory Clement <gregory.clement@bootlin.com>, 
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Andy Gross <agross@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, 
	Heiko Stuebner <heiko@sntech.de>, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
	Sylwester Nawrocki <s.nawrocki@samsung.com>, Tomasz Figa <tomasz.figa@gmail.com>, 
	Chanwoo Choi <cw00.choi@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Dinh Nguyen <dinguyen@kernel.org>, Viresh Kumar <vireshk@kernel.org>, 
	Shiraz Hashim <shiraz.linux.kernel@gmail.com>, soc@kernel.org, 
	Orson Zhai <orsonzhai@gmail.com>, Baolin Wang <baolin.wang@linux.alibaba.com>, 
	Chunyan Zhang <zhang.lyra@gmail.com>, Emil Renner Berthing <kernel@esmil.dk>, 
	Hal Feng <hal.feng@starfivetech.com>, Chen-Yu Tsai <wens@csie.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	=?UTF-8?Q?Emilio_L=C3=B3pez?= <emilio@elopez.com.ar>, 
	Peter De Schrijver <pdeschrijver@nvidia.com>, Prashant Gaikwad <pgaikwad@nvidia.com>, 
	Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, 
	Kunihiko Hayashi <hayashi.kunihiko@socionext.com>, Masami Hiramatsu <mhiramat@kernel.org>, 
	Michal Simek <michal.simek@amd.com>, devicetree@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-actions@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-rpi-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org, 
	linux-oxnas@groups.io, linux-mediatek@lists.infradead.org, 
	linux-amlogic@lists.infradead.org, linux-arm-msm@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, linux-rockchip@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-sunxi@lists.linux.dev, linux-tegra@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230717_004146_717545_CB3D9F52 
X-CRM114-Status: GOOD (  18.23  )
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

T24gRnJpLCBKdWwgMTQsIDIwMjMgYXQgNzo0NOKAr1BNIFJvYiBIZXJyaW5nIDxyb2JoQGtlcm5l
bC5vcmc+IHdyb3RlOgo+IFRoZSBEVCBvZl9kZXZpY2UuaCBhbmQgb2ZfcGxhdGZvcm0uaCBkYXRl
IGJhY2sgdG8gdGhlIHNlcGFyYXRlCj4gb2ZfcGxhdGZvcm1fYnVzX3R5cGUgYmVmb3JlIGl0IGFz
IG1lcmdlZCBpbnRvIHRoZSByZWd1bGFyIHBsYXRmb3JtIGJ1cy4KPiBBcyBwYXJ0IG9mIHRoYXQg
bWVyZ2UgcHJlcHBpbmcgQXJtIERUIHN1cHBvcnQgMTMgeWVhcnMgYWdvLCB0aGV5Cj4gInRlbXBv
cmFyaWx5IiBpbmNsdWRlIGVhY2ggb3RoZXIuIFRoZXkgYWxzbyBpbmNsdWRlIHBsYXRmb3JtX2Rl
dmljZS5oCj4gYW5kIG9mLmguIEFzIGEgcmVzdWx0LCB0aGVyZSdzIGEgcHJldHR5IG11Y2ggcmFu
ZG9tIG1peCBvZiB0aG9zZSBpbmNsdWRlCj4gZmlsZXMgdXNlZCB0aHJvdWdob3V0IHRoZSB0cmVl
LiBJbiBvcmRlciB0byBkZXRhbmdsZSB0aGVzZSBoZWFkZXJzIGFuZAo+IHJlcGxhY2UgdGhlIGlt
cGxpY2l0IGluY2x1ZGVzIHdpdGggc3RydWN0IGRlY2xhcmF0aW9ucywgdXNlcnMgbmVlZCB0bwo+
IGV4cGxpY2l0bHkgaW5jbHVkZSB0aGUgY29ycmVjdCBpbmNsdWRlcy4KPgo+IFNpZ25lZC1vZmYt
Ynk6IFJvYiBIZXJyaW5nIDxyb2JoQGtlcm5lbC5vcmc+Cgo+ICBkcml2ZXJzL2Nsay9yZW5lc2Fz
L3JjYXItdXNiMi1jbG9jay1zZWwuYyAgICAgICAgfCAxIC0KPiAgZHJpdmVycy9jbGsvcmVuZXNh
cy9yZW5lc2FzLWNwZy1tc3NyLmMgICAgICAgICAgIHwgMSAtCj4gIGRyaXZlcnMvY2xrL3JlbmVz
YXMvcnpnMmwtY3BnLmMgICAgICAgICAgICAgICAgICB8IDMgKy0tCgpBY2tlZC1ieTogR2VlcnQg
VXl0dGVyaG9ldmVuIDxnZWVydCtyZW5lc2FzQGdsaWRlci5iZT4KCkdye29ldGplLGVldGluZ31z
LAoKICAgICAgICAgICAgICAgICAgICAgICAgR2VlcnQKCi0tIApHZWVydCBVeXR0ZXJob2V2ZW4g
LS0gVGhlcmUncyBsb3RzIG9mIExpbnV4IGJleW9uZCBpYTMyIC0tIGdlZXJ0QGxpbnV4LW02OGsu
b3JnCgpJbiBwZXJzb25hbCBjb252ZXJzYXRpb25zIHdpdGggdGVjaG5pY2FsIHBlb3BsZSwgSSBj
YWxsIG15c2VsZiBhIGhhY2tlci4gQnV0CndoZW4gSSdtIHRhbGtpbmcgdG8gam91cm5hbGlzdHMg
SSBqdXN0IHNheSAicHJvZ3JhbW1lciIgb3Igc29tZXRoaW5nIGxpa2UgdGhhdC4KICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAtLSBMaW51cyBUb3J2YWxkcwoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0
CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5v
cmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
