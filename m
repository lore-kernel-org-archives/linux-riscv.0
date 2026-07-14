Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A886AC43458
	for <linux-riscv@archiver.kernel.org>; Tue, 14 Jul 2026 07:25:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=uoFTDcR6sQZOm6F0w4M7wdgHev4sNm0cjza8xQhthLE=; b=tiVJ/XG2r74NCo
	RHB/yrJIimghQ8VCOYmr8RVq7jEJZLu3W33xkN9qMCoFBK10bI/CLrySymbgNeLs55neO0HukBY+n
	KYSU2dfUyox8VeIFyuv/ghDo0DQEfQpmsb9Suv98vJnls5pgZXUqZI03Wd0SPe8/PE/SjNAKW9mN9
	YjL71D4P5O9JmWmIAeElYuICFxIq9Du1xvMOksoS/q6uV3K5gXnrLJVNfjTda6H4Ab/nkwDBwLqVh
	LHfwg1PaiP0Tt3TZRkWVESeEURClZmqNeOQA7yA+Oo7fOBMcw8iN2d02dje/4iw9cANyTvyQao0WR
	GFWIKPKs2kGzBxU1uDBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjXW5-0000000B9iM-0oSf;
	Tue, 14 Jul 2026 07:25:21 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjXVy-0000000B9g6-1xag
	for linux-riscv@lists.infradead.org;
	Tue, 14 Jul 2026 07:25:17 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-493c5220cb7so4295035e9.3
        for <linux-riscv@lists.infradead.org>; Tue, 14 Jul 2026 00:25:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1784013912; x=1784618712; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=peGrgF9PpfvVPhNKWNItMli4F0UFAyd4BhokmZXNYpk=;
        b=XNBduzUWECAks7GYUpPSS+4q3suS9Dg/oNIcakuVKl9FKezyKqVavrk5ZdY9KZzhgx
         CRwcnujR70RlE5I2ZD2EeZgh0qSh5qLbGBwWYyVCAtF/MxUj4p8JgzlbTkJFSwFlZqvZ
         sMXv4AFjmxP2d7D/rBihMiMHfo7ehm0Wxi2LfR8Ts62tR12IqgNmWLMXgGetvOAbErqB
         xcweq3U3xe3kzj5NxWN5iKjTqaux2F9PofB18yrMJtsNoxCixZeoE66G2GQDY6loiSsb
         LdAg4wBZ5V+YjnLHrPtYK4j70MdcaKr7d/1ZMt7l2vI1GeJNVU5Ovh/2TZ0qdiBqqlTK
         RqeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784013912; x=1784618712;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=peGrgF9PpfvVPhNKWNItMli4F0UFAyd4BhokmZXNYpk=;
        b=GzVyEVrTDtPtldyXRTih4oZUSAnkZvPWJ8LxjBpncXbHBJdtua9Gktnuv4R5oFu25w
         29GLKviLCkm7IWJOzZ4QVlGustAA3ufZeRLb5IePBc3ErhqN25/55DvwwrB5FQWqvEfn
         fGGiufYwoowaNmfzze0vrj3tfP12TSXVQHz+F4bG+E5j6YPDceihcS29T2lSD497in7+
         M5Vsztk8eqqpbTokmufu8KbMj06M2UnIOTMe3f/JgpxDiiByTe52r0Zkgwa+FJNs9KcY
         uEmEItr7KIMZdeD4NQElJIf2gaDFem0Ynb1r2GiSU0kZ9F7ZFKVBCuRQocdGTVGnGUw0
         1QDg==
X-Forwarded-Encrypted: i=1; AHgh+RqFGEeLaJwomAdKfi5umuG7UV0+JeWM2yIfyDr6RuIoUZv8csMjyIk8owAXfzdL+gzHEMtSKQxNpoSDAQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YzMpZP9CRQxux5A2uIXqKqJ65Go2t1YNmKZ2BI1F4aTwdP2VsCy
	0AXK7bGeWmjXAbI+fPeeioXUiFrfOTyvWq6m0XBH3Ha634eczBgYT6TcsE7QlF6H6qI=
X-Gm-Gg: AfdE7ckkiNPIk5+sF/mpV2cA5AWfN2vw/EFHMmETh007/ZFknADZ9zlktxyUYI3DUOe
	/lpjNqgtau8UjR1iGOnQw5jdw4CzEx2XahuKcAIrLnkaESp8Gy32m3W0ZfRzNiMU7BVMqhGTcdO
	oHL7YZ3G0IlxKwV8m3mP+UsztPOYkZd6y1NzzZI6Ye6d6bHmQ8U4zP3OHEn4rEf/jLLL6GIObnv
	EfxBHeCO36pp2sWFRtVsbAWooDVzVuFWy6BwSEwYySelChLymjeJX9EMZFm4zQSXF8Gf5Z+Lw/B
	IpTiBdLq0rqwuxzjxZO+Ru9ktp6aWUAL3NwLaKTOoJZVgfSVQLWM95cLK4fmLlN5haKechkItv3
	HeIOaNqh9Af1btFWB79EPTxN7IwKEQUu1CHyMySVxi0idwkD0wPQ6yLIjVMvff1qQn9Xb2PHTaQ
	sorwKDHTCx8V4Wl5hpAJtJ39zPvWPKDtM6CkVujcaaPmyJeBzkD2K32ClRGWC9MmnbrxDlmARkc
	tbh
X-Received: by 2002:a05:600c:8108:b0:495:39a9:f8bb with SMTP id 5b1f17b1804b1-49539a9f8cbmr778035e9.27.1784013912057;
        Tue, 14 Jul 2026 00:25:12 -0700 (PDT)
Received: from localhost (p200300f65f47db04b44a80421173aa03.dip0.t-ipconnect.de. [2003:f6:5f47:db04:b44a:8042:1173:aa03])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-493f3a60404sm297426135e9.1.2026.07.14.00.25.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jul 2026 00:25:11 -0700 (PDT)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?= <u.kleine-koenig@baylibre.com>
To: Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>
Cc: Yang Shen <shenyang39@huawei.com>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Lixu Zhang <lixu.zhang@intel.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Israel Cepeda <israel.a.cepeda.lopez@intel.com>,
	Hans de Goede <hansg@kernel.org>,
	Andy Shevchenko <andy@kernel.org>,
	Ray Jui <rjui@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Scott Branden <sbranden@broadcom.com>,
	Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Imre Kaloz <kaloz@openwrt.org>,
	Conor Dooley <conor.dooley@microchip.com>,
	Daire McNamara <daire.mcnamara@microchip.com>,
	Daniel Palmer <daniel@thingy.jp>,
	Romain Perier <romain.perier@gmail.com>,
	Robert Jarzmik <robert.jarzmik@free.fr>,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	Mika Westerberg <westeri@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-acpi@vger.kernel.org,
	Hoan Tran <hoan@os.amperecomputing.com>,
	Alan Borzeszkowski <alan.borzeszkowski@linux.intel.com>,
	"Enrico Weigelt, metux IT consult" <info@metux.net>,
	Viresh Kumar <vireshk@kernel.org>,
	virtualization@lists.linux.dev,
	Yinbo Zhu <zhuyinbo@loongson.cn>,
	Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	linux-tegra@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Adrian Ng <adrianhoyin.ng@altera.com>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	Alban Bedel <albeu@free.fr>,
	James Cowgill <james.cowgill@blaize.com>,
	Matt Redfearn <matt.redfearn@blaize.com>,
	Neil Jones <neil.jones@blaize.com>,
	Nikolaos Pasaloukos <nikolaos.pasaloukos@blaize.com>,
	Doug Berger <opendmb@gmail.com>,
	Keerthy <j-keerthy@ti.com>,
	Vladimir Zapolskiy <vz@mleia.com>,
	Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>,
	Sven Peter <sven@kernel.org>,
	Janne Grunau <j@jannau.net>,
	Neal Gompa <neal@gompa.dev>,
	Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
	=?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>,
	Bamvor Jian Zhang <bamv2005@gmail.com>,
	=?utf-8?q?Marek_Beh=C3=BAn?= <kabel@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Avi Fishman <avifishman70@gmail.com>,
	Tomer Maimon <tmaimon77@gmail.com>,
	Tali Perry <tali.perry1@gmail.com>,
	Patrick Venture <venture@google.com>,
	Nancy Yuen <yuenn@google.com>,
	Benjamin Fair <benjaminfair@google.com>,
	Grygorii Strashko <grygorii.strashko@ti.com>,
	Santosh Shilimkar <ssantosh@kernel.org>,
	Kevin Hilman <khilman@kernel.org>,
	Orson Zhai <orsonzhai@gmail.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Chunyan Zhang <zhang.lyra@gmail.com>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Ludovic Desroches <ludovic.desroches@microchip.com>,
	Paul Walmsley <pjw@kernel.org>,
	Samuel Holland <samuel.holland@sifive.com>,
	Michael Walle <mwalle@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Nobuhiro Iwamatsu <nobuhiro.iwamatsu.x90@mail.toshiba>,
	Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>,
	Srinivas Neeli <srinivas.neeli@amd.com>,
	Michal Simek <michal.simek@amd.com>,
	Magnus Damm <magnus.damm@gmail.com>,
	linux-aspeed@lists.ozlabs.org,
	asahi@lists.linux.dev,
	linux-mediatek@lists.infradead.org,
	openbmc@lists.ozlabs.org,
	linux-omap@vger.kernel.org,
	linux-unisoc@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-renesas-soc@vger.kernel.org,
	Michael Buesch <m@bues.ch>,
	William Breathitt Gray <wbg@kernel.org>,
	Robert Richter <rric@kernel.org>
Subject: [PATCH v1 00/20] gpio: Improvements around device-id arrays
Date: Tue, 14 Jul 2026 09:24:01 +0200
Message-ID: <cover.1784013063.git.u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.55.0.11.g153666a7d9bb
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=7258; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=R2k78ifV57I7bqElN2rqk35dKurD9aNrsEluPiAhhMs=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBqVeQbXm7nXijEy1eKUYHbl4wNScCj2qk8mUj+/ y7zzDJKfG2JATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCalXkGwAKCRCPgPtYfRL+ TjNvB/9C7+ymz4UqICZy8QPsc/Ow/qn0VBiFWbW1tSEKOBwwkQZo1Hy7AQ+gRBuqZ6lBXIdivbl J6Moa1BauQELgVWaBtRg0uf+8VuSizBtFiZs9QSAnyGq1As8Ig3H0TlZMAEH7loRfQoggE2XZy9 Z6FBACymjA3pjCM6m6bFnTEdA7tf/NkWWZgyekUvsu73ijI6WRdlCw8zOm3IsrB5CrRvIp5ys9E 168mnbodlTxBlZAxkLyLZkx1mBnl7QBeAFNihaznSJgydZjTVWUJ8Mg0DbCJcUjhwIRfsM0cj+S HdpAl3yxTBLjbpBAO/O99zNroQbc5aZ9lfnoj9rKKt4u/QJg
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260714_002514_562334_E01A3832 
X-CRM114-Status: GOOD (  15.81  )
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

SGVsbG8sCgp0aGUgb3JpZ2luYWwgbW90aXZhdGlvbiBmb3IgdGhpcyBzZXJpZXMgYXJlIHRoZSBw
YXRjaGVzIHRoYXQgY29udmVydCB0aGUKYXJyYXlzIHRvIHVzZSBuYW1lZCBpbml0aWFsaXplcnMs
IHNlZQpodHRwczovL2xvcmUua2VybmVsLm9yZy9hbGwvY292ZXIuMTc4MDA0ODkyNS5naXQudS5r
bGVpbmUta29lbmlnQGJheWxpYnJlLmNvbS8KZm9yIHRoZSBpZGVhIGJlaGluZCBpdC4gVGhlbiB0
aGUgcXVlc3QgZ3JldywgZHVlIHRvIHRoaW5raW5nIHRvIGNvbnZlcnQKYWxsIGRldmljZSBpZCBh
cnJheXMgaW4gYSBzaW5nbGUgc2VyaWVzIHRvIG5vdCBib3RoZXIgZWFjaCBzdWJzeXN0ZW0KcmVw
ZWF0ZWRseVsxXSwgdGhlbiBJIHNwb3R0ZWQgYSBmZXcgbWlzc2luZyBNT0RVTEVfREVWSUNFX1RB
QkxFIGFubm90YXRpb25zCmFuZCBkZWNpZGVkIHRvIGZpeCB0aGVzZS4gVGhlbiBJIG5vdGljZWQg
dGhhdCBzb21lIGRyaXZlcl9kYXRhIGVudHJpZXMKdG8gYmUgdW51c2VkIGFuZCB0aGVuIGRyb3Bw
ZWQgdGhlbSBpbnN0ZWFkIG9mIGNvbnZlcnRpbmcgdG8gbmFtZWQKaW5pdGlhbGl6ZXJzLiBBbmQg
YXMgbXkgc2NyaXB0cyB0aGF0IGRvIG1vc3Qgb2YgdGhlc2UgY2hhbmdlcyBhbHNvIGNhcmVkCmFi
b3V0IHRyYWlsaW5nIGNvbW1hcyBhbmQgaG93IHRoZSBsaXN0IHRlcm1pbmF0b3JzIGxvb2ssIHRo
aXMgaXMgYWxzbwphZGRyZXNzZWQgaW4gdGhpcyBzZXJpZXMuIEFuZCBzbyB0aGlzIGdyZXcgdG8g
MjAgcGF0Y2hlcyAuLi4KClRoaXMgaXMgYmFzZWQgb24geWVzdGVyZGF5J3MgbmV4dCBhbmQgb2J2
aW91c2x5IG1lcmdlIHdpbmRvdyBtYXRlcmlhbC4KCkJlc3QgcmVnYXJkcwpVd2UKClsxXSBPZiBj
b3Vyc2UgdGhpcyBvbmx5IHdvcmtzIGlmIG5vIG5ldyBlbnRyaWVzIGFyZSBhZGRlZCB0aGF0CiAg
ICBpbml0aWFsaXplIC5kcml2ZXJfZGF0YSBieSBhIHBvc2l0aW9uYWwgaW5pdGlhbGl6ZXIgdW50
aWwgSSBjb21lCiAgICBhcm91bmQgdG8gYWRkIHRoZSB1bmlvbiB0byB0aGUgcmVzcGVjaXZlIGRl
dmljZSBpZCBzdHJ1Y3QuCgpVd2UgS2xlaW5lLUvDtm5pZyAoVGhlIENhcGFibGUgSHViKSAoMjAp
OgogIGdwaW86IERyb3AgdW51c2VkIGFzc2lnbm1lbnQgb2YgYWNwaV9kZXZpY2VfaWQgZHJpdmVy
IGRhdGEKICBncGlvOiBtYXg3MzAxOiBEcm9wIHVudXNlZCBhc3NpZ25tZW50IG9mIHNwaV9kZXZp
Y2VfaWQgZHJpdmVyIGRhdGEKICBncGlvOiBtbWlvOiBEcm9wIHVudXNlZCBhc3NpZ25tZW50IG9m
IHBsYXRmb3JtX2RldmljZV9pZCBkcml2ZXIgZGF0YQogIGdwaW86IGxqY2E6IERyb3AgdW51c2Vk
IGFzc2lnbm1lbnQgb2YgYXV4aWxpYXJ5X2RldmljZV9pZCBkcml2ZXIgZGF0YQogIGdwaW86IEFk
ZCBtaXNzaW5nIEFDUEkgbW9kdWxlIGFubm90YXRpb25zCiAgZ3Bpbzogc29kYXZpbGxlOiBBZGQg
bWlzc2luZyBwY2kgbW9kdWxlIGFubm90YXRpb25zCiAgZ3BpbzogQWRkIG1pc3NpbmcgT0YgbW9k
dWxlIGFubm90YXRpb25zCiAgZ3BpbzogcHhhOiBBZGQgbWlzc2luZyBwbGF0Zm9ybSBtb2R1bGUg
YW5ub3RhdGlvbnMKICBncGlvOiBBZGQgbWlzc2luZyBkbWkgbW9kdWxlIGFubm90YXRpb25zCiAg
Z3BpbzogcGwwNjE6IFVzZSBlbXB0eSBpbml0aWFsaXplciBmb3IgYW1iYV9pZCB0ZXJtaW5hdG9y
CiAgZ3BpbzogVXNlIG5hbWVkIGluaXRpYWxpemVycyBmb3IgYWNwaV9kZXZpY2VfaWQgYXJyYXkK
ICBncGlvOiBVc2UgbmFtZWQgaW5pdGlhbGl6ZXJzIGZvciBzcGlfZGV2aWNlX2lkIGFycmF5CiAg
Z3BpbzogdmlydGlvOiBVc2UgYSBuYW1lZCBpbml0aWFsaXplciBmb3IgdmlydGlvX2RldmljZV9p
ZCBhcnJheQogIGdwaW86IHBjZjg1N3g6IFVzZSBuYW1lZCBpbml0aWFsaXplcnMgZm9yIG9mX2Rl
dmljZV9pZCBhcnJheQogIGdwaW86IFVuaWZ5IHN0eWxlIG9mIGFjcGlfZGV2aWNlX2lkIGFycmF5
cwogIGdwaW86IFVuaWZ5IHN0eWxlIG9mIG9mX2RldmljZV9pZCBhcnJheXMKICBncGlvOiBtYXg3
NzYyMDogVW5pZnkgc3R5bGUgb2YgcGxhdGZvcm1fZGV2aWNlX2lkIGFycmF5cwogIGdwaW86IFVu
aWZ5IHN0eWxlIG9mIHNwaV9kZXZpY2VfaWQgYXJyYXlzCiAgZ3BpbzogVW5pZnkgc3R5bGUgb2Yg
cGNpX2RldmljZV9pZCBhcnJheXMKICBncGlvOiBVbmlmeSBzdHlsZSBvZiB2YXJpb3VzICpfZGV2
aWNlX2lkIGFycmF5cwoKIGRyaXZlcnMvZ3Bpby9ncGlvLTc0eDE2NC5jICAgICAgICAgIHwgIDQg
KystLQogZHJpdmVycy9ncGlvL2dwaW8tYWRucC5jICAgICAgICAgICAgfCAgNCArKy0tCiBkcml2
ZXJzL2dwaW8vZ3Bpby1hZ2dyZWdhdG9yLmMgICAgICB8ICAyICstCiBkcml2ZXJzL2dwaW8vZ3Bp
by1hbHRlcmEtYTEwc3IuYyAgICB8ICAyICstCiBkcml2ZXJzL2dwaW8vZ3Bpby1hbHRlcmEuYyAg
ICAgICAgICB8ICA0ICsrLS0KIGRyaXZlcnMvZ3Bpby9ncGlvLWFtZDgxMTEuYyAgICAgICAgIHwg
IDIgKy0KIGRyaXZlcnMvZ3Bpby9ncGlvLWFtZHB0LmMgICAgICAgICAgIHwgIDggKysrKy0tLS0K
IGRyaXZlcnMvZ3Bpby9ncGlvLWFzcGVlZC1zZ3Bpby5jICAgIHwgMTAgKysrKystLS0tLQogZHJp
dmVycy9ncGlvL2dwaW8tYXNwZWVkLmMgICAgICAgICAgfCAxMCArKysrKy0tLS0tCiBkcml2ZXJz
L2dwaW8vZ3Bpby1hdGg3OS5jICAgICAgICAgICB8ICAyICstCiBkcml2ZXJzL2dwaW8vZ3Bpby1i
Y20ta29uYS5jICAgICAgICB8ICAxICsKIGRyaXZlcnMvZ3Bpby9ncGlvLWJsenAxNjAwLmMgICAg
ICAgIHwgIDIgKy0KIGRyaXZlcnMvZ3Bpby9ncGlvLWJyY21zdGIuYyAgICAgICAgIHwgIDIgKy0K
IGRyaXZlcnMvZ3Bpby9ncGlvLWJ0OHh4LmMgICAgICAgICAgIHwgIDIgKy0KIGRyaXZlcnMvZ3Bp
by9ncGlvLWNhZGVuY2UuYyAgICAgICAgIHwgIDQgKystLQogZHJpdmVycy9ncGlvL2dwaW8tY3Jl
Zy1zbnBzLmMgICAgICAgfCAgNSArKystLQogZHJpdmVycy9ncGlvL2dwaW8tZGF2aW5jaS5jICAg
ICAgICAgfCAgNiArKystLS0KIGRyaXZlcnMvZ3Bpby9ncGlvLWR3YXBiLmMgICAgICAgICAgIHwg
MTQgKysrKysrKy0tLS0tLS0KIGRyaXZlcnMvZ3Bpby9ncGlvLWVtLmMgICAgICAgICAgICAgIHwg
IDQgKystLQogZHJpdmVycy9ncGlvL2dwaW8tZXA5M3h4LmMgICAgICAgICAgfCAgMSArCiBkcml2
ZXJzL2dwaW8vZ3Bpby1mdGdwaW8wMTAuYyAgICAgICB8ICAzICsrLQogZHJpdmVycy9ncGlvL2dw
aW8tZ3Jhbml0ZXJhcGlkcy5jICAgfCAgNCArKy0tCiBkcml2ZXJzL2dwaW8vZ3Bpby1ncmdwaW8u
YyAgICAgICAgICB8ICAyICstCiBkcml2ZXJzL2dwaW8vZ3Bpby1ndy1wbGQuYyAgICAgICAgICB8
ICA0ICsrLS0KIGRyaXZlcnMvZ3Bpby9ncGlvLWhpc2kuYyAgICAgICAgICAgIHwgIDYgKysrLS0t
CiBkcml2ZXJzL2dwaW8vZ3Bpby1obHdkLmMgICAgICAgICAgICB8ICA0ICsrLS0KIGRyaXZlcnMv
Z3Bpby9ncGlvLWlteC1zY3UuYyAgICAgICAgIHwgIDEgKwogZHJpdmVycy9ncGlvL2dwaW8taXhw
NHh4LmMgICAgICAgICAgfCAgNCArKy0tCiBkcml2ZXJzL2dwaW8vZ3Bpby1samNhLmMgICAgICAg
ICAgICB8ICA0ICsrLS0KIGRyaXZlcnMvZ3Bpby9ncGlvLWxvb25nc29uLTY0Yml0LmMgIHwgIDQg
KystLQogZHJpdmVycy9ncGlvL2dwaW8tbHAzOTQzLmMgICAgICAgICAgfCAgMiArLQogZHJpdmVy
cy9ncGlvL2dwaW8tbHBjMzJ4eC5jICAgICAgICAgfCAgNCArKy0tCiBkcml2ZXJzL2dwaW8vZ3Bp
by1tYWNzbWMuYyAgICAgICAgICB8ICA0ICsrLS0KIGRyaXZlcnMvZ3Bpby9ncGlvLW1heDMxOTF4
LmMgICAgICAgIHwgMTIgKysrKysrLS0tLS0tCiBkcml2ZXJzL2dwaW8vZ3Bpby1tYXg3MzAxLmMg
ICAgICAgICB8ICAyICstCiBkcml2ZXJzL2dwaW8vZ3Bpby1tYXg3MzYwLmMgICAgICAgICB8ICA4
ICsrKystLS0tCiBkcml2ZXJzL2dwaW8vZ3Bpby1tYXg3NzYyMC5jICAgICAgICB8ICA0ICsrLS0K
IGRyaXZlcnMvZ3Bpby9ncGlvLW1heDc3NzU5LmMgICAgICAgIHwgIDIgKy0KIGRyaXZlcnMvZ3Bp
by9ncGlvLW1iODZzN3guYyAgICAgICAgIHwgIDIgKy0KIGRyaXZlcnMvZ3Bpby9ncGlvLW1sLWlv
aC5jICAgICAgICAgIHwgIDIgKy0KIGRyaXZlcnMvZ3Bpby9ncGlvLW1seGJmMy5jICAgICAgICAg
IHwgIDQgKystLQogZHJpdmVycy9ncGlvL2dwaW8tbW0tbGFudGlxLmMgICAgICAgfCAgMiArLQog
ZHJpdmVycy9ncGlvL2dwaW8tbW1pby5jICAgICAgICAgICAgfCAgMyArLS0KIGRyaXZlcnMvZ3Bp
by9ncGlvLW1vY2t1cC5jICAgICAgICAgIHwgIDQgKystLQogZHJpdmVycy9ncGlvL2dwaW8tbW94
dGV0LmMgICAgICAgICAgfCAgNCArKy0tCiBkcml2ZXJzL2dwaW8vZ3Bpby1tcGM1MjAwLmMgICAg
ICAgICB8ICA1ICsrKy0tCiBkcml2ZXJzL2dwaW8vZ3Bpby1tcGM4eHh4LmMgICAgICAgICB8IDI1
ICsrKysrKysrKysrKystLS0tLS0tLS0tLS0KIGRyaXZlcnMvZ3Bpby9ncGlvLW1wZnMuYyAgICAg
ICAgICAgIHwgIDEgKwogZHJpdmVycy9ncGlvL2dwaW8tbXBzc2UuYyAgICAgICAgICAgfCAgMyAr
LS0KIGRyaXZlcnMvZ3Bpby9ncGlvLW1zYzMxMy5jICAgICAgICAgIHwgIDEgKwogZHJpdmVycy9n
cGlvL2dwaW8tbXQ3NjIxLmMgICAgICAgICAgfCAgMiArLQogZHJpdmVycy9ncGlvL2dwaW8tbXZl
YnUuYyAgICAgICAgICAgfCAgMSArCiBkcml2ZXJzL2dwaW8vZ3Bpby1teGMuYyAgICAgICAgICAg
ICB8ICAyICstCiBkcml2ZXJzL2dwaW8vZ3Bpby1teHMuYyAgICAgICAgICAgICB8ICA0ICsrLS0K
IGRyaXZlcnMvZ3Bpby9ncGlvLW5vbWFkaWsuYyAgICAgICAgIHwgIDcgKysrKy0tLQogZHJpdmVy
cy9ncGlvL2dwaW8tbm92YWxha2UtZXZlbnRzLmMgfCAgNCArKy0tCiBkcml2ZXJzL2dwaW8vZ3Bp
by1ucGNtLXNncGlvLmMgICAgICB8ICA2ICsrKy0tLQogZHJpdmVycy9ncGlvL2dwaW8tb2N0ZW9u
LmMgICAgICAgICAgfCAgMiArLQogZHJpdmVycy9ncGlvL2dwaW8tb21hcC5jICAgICAgICAgICAg
fCAgMiArLQogZHJpdmVycy9ncGlvL2dwaW8tcGFsbWFzLmMgICAgICAgICAgfCAxMCArKysrKy0t
LS0tCiBkcml2ZXJzL2dwaW8vZ3Bpby1wY2E5NTN4LmMgICAgICAgICB8ICAzICsrLQogZHJpdmVy
cy9ncGlvL2dwaW8tcGNhOTU3MC5jICAgICAgICAgfCAgMiArLQogZHJpdmVycy9ncGlvL2dwaW8t
cGNmODU3eC5jICAgICAgICAgfCAyNiArKysrKysrKysrKysrLS0tLS0tLS0tLS0tLQogZHJpdmVy
cy9ncGlvL2dwaW8tcGNpLWlkaW8tMTYuYyAgICAgfCAgMyArKy0KIGRyaXZlcnMvZ3Bpby9ncGlv
LXBjaWUtaWRpby0yNC5jICAgIHwgIDggKysrKystLS0KIGRyaXZlcnMvZ3Bpby9ncGlvLXBpc29z
ci5jICAgICAgICAgIHwgIDQgKystLQogZHJpdmVycy9ncGlvL2dwaW8tcGwwNjEuYyAgICAgICAg
ICAgfCAgMiArLQogZHJpdmVycy9ncGlvL2dwaW8tcG1pYy1laWMtc3ByZC5jICAgfCAgMiArLQog
ZHJpdmVycy9ncGlvL2dwaW8tcHhhLmMgICAgICAgICAgICAgfCAyMCArKysrKysrKysrKy0tLS0t
LS0tLQogZHJpdmVycy9ncGlvL2dwaW8tcWl4aXMtZnBnYS5jICAgICAgfCAgMyArLS0KIGRyaXZl
cnMvZ3Bpby9ncGlvLXJkYS5jICAgICAgICAgICAgIHwgIDIgKy0KIGRyaXZlcnMvZ3Bpby9ncGlv
LXJlYWx0ZWstb3R0by5jICAgIHwgIDIgKy0KIGRyaXZlcnMvZ3Bpby9ncGlvLXJvY2tjaGlwLmMg
ICAgICAgIHwgIDQgKystLQogZHJpdmVycy9ncGlvL2dwaW8tc2FtYTVkMi1waW9idS5jICAgfCAg
MiArLQogZHJpdmVycy9ncGlvL2dwaW8tc2lmaXZlLmMgICAgICAgICAgfCAgMiArLQogZHJpdmVy
cy9ncGlvL2dwaW8tc2wyOGNwbGQuYyAgICAgICAgfCAgMiArLQogZHJpdmVycy9ncGlvL2dwaW8t
c29kYXZpbGxlLmMgICAgICAgfCAgMyArKy0KIGRyaXZlcnMvZ3Bpby9ncGlvLXNwZWFyLXNwaWNz
LmMgICAgIHwgIDMgKystCiBkcml2ZXJzL2dwaW8vZ3Bpby1zcHJkLmMgICAgICAgICAgICB8ICAy
ICstCiBkcml2ZXJzL2dwaW8vZ3Bpby1zdG1wZS5jICAgICAgICAgICB8ICAyICstCiBkcml2ZXJz
L2dwaW8vZ3Bpby1zdHAteHdheS5jICAgICAgICB8ICAyICstCiBkcml2ZXJzL2dwaW8vZ3Bpby10
ZWdyYS5jICAgICAgICAgICB8ICAyICstCiBkcml2ZXJzL2dwaW8vZ3Bpby10ZWdyYTE4Ni5jICAg
ICAgICB8ICAyICstCiBkcml2ZXJzL2dwaW8vZ3Bpby10aHVuZGVyeC5jICAgICAgICB8ICAzICst
LQogZHJpdmVycy9ncGlvL2dwaW8tdHBzNjUyMTguYyAgICAgICAgfCAgMiArLQogZHJpdmVycy9n
cGlvL2dwaW8tdHM0ODAwLmMgICAgICAgICAgfCAgNCArKy0tCiBkcml2ZXJzL2dwaW8vZ3Bpby10
d2w0MDMwLmMgICAgICAgICB8ICA0ICsrLS0KIGRyaXZlcnMvZ3Bpby9ncGlvLXVzYmlvLmMgICAg
ICAgICAgIHwgMTMgKysrKysrKy0tLS0tLQogZHJpdmVycy9ncGlvL2dwaW8tdmY2MTAuYyAgICAg
ICAgICAgfCAgNCArKy0tCiBkcml2ZXJzL2dwaW8vZ3Bpby12aXJ0aW8uYyAgICAgICAgICB8ICA0
ICsrLS0KIGRyaXZlcnMvZ3Bpby9ncGlvLXZpc2NvbnRpLmMgICAgICAgIHwgIDIgKy0KIGRyaXZl
cnMvZ3Bpby9ncGlvLXdhdmVzaGFyZS1kc2kuYyAgIHwgIDIgKy0KIGRyaXZlcnMvZ3Bpby9ncGlv
LXhnZW5lLXNiLmMgICAgICAgIHwgIDYgKysrLS0tCiBkcml2ZXJzL2dwaW8vZ3Bpby14Z2VuZS5j
ICAgICAgICAgICB8IDEwICsrKysrKy0tLS0KIGRyaXZlcnMvZ3Bpby9ncGlvLXhncy1pcHJvYy5j
ICAgICAgIHwgIDIgKy0KIGRyaXZlcnMvZ3Bpby9ncGlvLXhpbGlueC5jICAgICAgICAgIHwgIDIg
Ky0KIGRyaXZlcnMvZ3Bpby9ncGlvLXhscC5jICAgICAgICAgICAgIHwgIDYgKysrLS0tCiBkcml2
ZXJzL2dwaW8vZ3Bpby14cmExNDAzLmMgICAgICAgICB8ICA2ICsrKy0tLQogZHJpdmVycy9ncGlv
L2dwaW8temV2aW8uYyAgICAgICAgICAgfCAgNSArKystLQogZHJpdmVycy9ncGlvL2dwaW8tenlu
cW1wLW1vZGVwaW4uYyAgfCAgMiArLQogZHJpdmVycy9ncGlvL2dwaW9saWItYWNwaS1xdWlya3Mu
YyAgfCAgMyArKy0KIDEwMSBmaWxlcyBjaGFuZ2VkLCAyMzEgaW5zZXJ0aW9ucygrKSwgMjExIGRl
bGV0aW9ucygtKQoKCmJhc2UtY29tbWl0OiA0OTM2MjM5NGRhZDdkZjY2YzI3NGM4NjdhMjcxMzk0
YzEwY2EyYmI4Ci0tIAoyLjU1LjAuMTEuZzE1MzY2NmE3ZDliYgoKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdAps
aW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3Jn
L21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
