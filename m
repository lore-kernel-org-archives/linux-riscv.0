Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8B9FC44508
	for <linux-riscv@archiver.kernel.org>; Wed, 15 Jul 2026 16:56:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=88ELOI/W7oBKZRh+3ieSWUUiZwAb5lNqJhS6ZYnra1g=; b=d0VeN7HObk2292
	bEc3qnqTX0UJbHuxgl3xMtnPYdU5wT2nFMBUObxy1t7eh+bzNbMZ3V+CXl0Cm7QDBUko1LVS0HvCd
	JXYm5tA7k2HJJA91R4LkilDaUHRV10NO+qls0N67X9jomXzbOw2r6wMFzirSQ7AAYr0dJ5u7Yt3zl
	X2iis5W+Pp6vy4xQjGY2JC8UdrrA69LL4sJTFmff3wtAxZ5cnH8bItShBc4aMN985RRJjgxLzUKj0
	N/b1a/QVzp/bJaSeylT114sb54WLczsOqfH6oTZjtfZoLoBM8VgJs2EI/849RaHwzRCcOoN4ffxLk
	ErpQZvfTIHarCZlWPSxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wk2u2-0000000FW1U-2Uj2;
	Wed, 15 Jul 2026 16:56:10 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wk2tx-0000000FVyw-3SJP
	for linux-riscv@lists.infradead.org;
	Wed, 15 Jul 2026 16:56:08 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-490cf322ed0so40925025e9.1
        for <linux-riscv@lists.infradead.org>; Wed, 15 Jul 2026 09:56:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1784134563; x=1784739363; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dc9Aopu2Z728JKtTIyYoYTkFBGcLajEY2h1IaXFOYK4=;
        b=cliJ/q9RzCzSKvg5MwS5Tl9VaHDRajnkr9h+tz6OmijXDjT3G5azPzyBYDqUZE3JR9
         0pLfQrqZBOJWdR2p8iDJgtNnN8SvwEFhEpFGzHNQZJSOtjlRBf1lS7KvbN7IqcGpUbWY
         2mmT1c0wegVNwb3pjj+ohcnnKbM2Tw9EdqJbGtMi0p0xSZB6unbMvrUQ5XhFdnrC/IWe
         fNCV16sdcrz0k4NQuFJE/AYPt/ur59s1TfIARS+L5ROPyfdlbF8LDsJezsILribypQlq
         MvlOCi3QZ+KOPfpGONPTH7h04WWHMGde4S3Yr4DIQ0K5zj/2/ZYdPgIWV5roiW5Yw03z
         Ukug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784134563; x=1784739363;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=dc9Aopu2Z728JKtTIyYoYTkFBGcLajEY2h1IaXFOYK4=;
        b=d5kaGgJhmdqHmWu0pC1hTlxHMzvBvp0vzkEVstNV5wEMb6j7WAvF/WH7NDgrXWx/o1
         i5nfNpyF+XaqCO8NvZgbwVAUQSwP6Al0VwhM/6ONPrr991lZUC3CEA11cPR6GQOBe0DV
         wt243Eb3QOWs28HQ3yVJ5a9hhpEDtRqg5BjL+BQq4IaYy1BDZ7rt7KmEL8ah445yscMr
         ZsZIS2FRSv/zxKVGW949WcdcLt2pztbuZOvSvc05d3dU3/+bAVMI3ZMfKFuIs070iymC
         xksDW0Fov5AxC2aiI+E2XIs9ycYn8kA0wFjBfjLzi3Rpd+/UaLp/gehmwKomTuyZxV1q
         TfyA==
X-Forwarded-Encrypted: i=1; AHgh+Rq4DUgmW0yvT5kqaoa7fnrCkoi03pDu7SpPU1tmBVa2cJEaSI91eoAY7ZoFJiPiTIpPY3b2cDzWwubQ0A==@lists.infradead.org
X-Gm-Message-State: AOJu0YwwtvBZ3MH0Vn3b0G66dgWquHsDUINkFgMeJfE1ei8jnIHQH32t
	WlfbwRjcn9KTU2XtCtEaFGxmlr4zGPcfDCqbwEe1bPNSwGxJYc8U3RNg7tr+GLW6xiI=
X-Gm-Gg: AfdE7ck8BCPtdR7CMofznlkXJzsI81JgnhSY4pgMLXV5rON3WTAw63g1jpzaBRK/OYA
	3aaqOPe0a0xJrJahKXNT+PRgBtPHMuKMCtbVOYRV4jwmKngq2qQH5/x08VJP4bASSjpv5uduB15
	QjvKTLkZwz0wFZQtnXQIufFbjyXUCt/jeC3A+LKMAEb1xA2ArjiLdEm6Uavl5gzPbeta7uYWiE+
	+LCLlZYKKkond8qAMrLFR//XzJUgwVto2XfZJfO7O46BZwPIlSCGu+OEDFkAHbXx2LPAyEaJRKn
	TRfJHzeH5ww4DHzrae/+UJPF4LWDCMn8d8ro4gh8V/DeuEiIy+GQW3nNUelB5JHxxiJBbBJSKjG
	tjH/u79bW2P2RzjfqiqCUxe4wOEGGa01sD95Rarfycy5IWAO2W/JkAWwVlqSIS3JqPmcK5pOL20
	rxTiz/eIXuHV8f/x4LBQeRXbYu15crTgKb5S/ZVApz2pDxO8ocHWgDOskZ42M9248tk+ZFAhpmm
	f4=
X-Received: by 2002:a05:600c:350a:b0:493:bb23:152a with SMTP id 5b1f17b1804b1-4953c28868emr41628395e9.34.1784134563454;
        Wed, 15 Jul 2026 09:56:03 -0700 (PDT)
Received: from localhost (p200300f65f47db04249e031dea91a10d.dip0.t-ipconnect.de. [2003:f6:5f47:db04:249e:31d:ea91:a10d])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4953c6ff429sm47318815e9.1.2026.07.15.09.56.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jul 2026 09:56:02 -0700 (PDT)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?= <u.kleine-koenig@baylibre.com>
To: Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Lixu Zhang <lixu.zhang@intel.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
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
	Hoan Tran <hoan@os.amperecomputing.com>,
	Alan Borzeszkowski <alan.borzeszkowski@linux.intel.com>,
	Mika Westerberg <westeri@kernel.org>,
	"Enrico Weigelt, metux IT consult" <info@metux.net>,
	Viresh Kumar <vireshk@kernel.org>,
	virtualization@lists.linux.dev,
	Yinbo Zhu <zhuyinbo@loongson.cn>,
	Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	linux-tegra@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>,
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
	Santosh Shilimkar <ssantosh@kernel.org>,
	Kevin Hilman <khilman@kernel.org>,
	Orson Zhai <orsonzhai@gmail.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Chunyan Zhang <zhang.lyra@gmail.com>,
	Magnus Damm <magnus.damm@gmail.com>,
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
	linux-aspeed@lists.ozlabs.org,
	asahi@lists.linux.dev,
	linux-mediatek@lists.infradead.org,
	openbmc@lists.ozlabs.org,
	linux-omap@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-unisoc@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	Michael Buesch <m@bues.ch>,
	William Breathitt Gray <wbg@kernel.org>,
	Robert Richter <rric@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-acpi@vger.kernel.org
Subject: [PATCH v2 00/21] gpio: Improvements around device-id arrays
Date: Wed, 15 Jul 2026 18:55:05 +0200
Message-ID: <cover.1784133987.git.u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.55.0.11.g153666a7d9bb
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=8054; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=IWUCunGUaTCNiIjJZFExRrEmVa81OfH9Xay6Y9Sp9+8=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBqV7tpcWa4IDqdHE07WRN6KbaBUpPQqFeHKz38l NPYom/XImOJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCale7aQAKCRCPgPtYfRL+ TtTaB/wMHdo4jeTAu8TDocMrZIkg854g5QFjcfbVE54N17jnr4AIRFzaeHw5Ef3dkM+guUxSwmj F5MR8eG3l1tF9YtUNmlhbx/vfxy40WhQn9DtmnjtWzwMlcrq2Bx1Qy3dAIUKRmWu8OBHmQoLETO JQ4Z0G/Aungdh91TZCoSgDUdjGBT9AqikXKikNh82DMEMiG8tx14PL5vabsoJ+RX+kgTyt3svCn U25sKCqazurzcIFFDvuLBrl46NkLy88JS0XSCIhIpvTjh0oHlkKksNl1o0uzGB+W2A9BEDa799A SZq7t3HXFBTrZVb4r5+uP0V69VjegzndPUWsZzWqJxaovWlm
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260715_095605_963471_F0F861DA 
X-CRM114-Status: GOOD (  16.05  )
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

SGVsbG8sCgphcyB3aXRoIHYxIHRoZSBvcmlnaW5hbCBtb3RpdmF0aW9uIGZvciB0aGlzIHNlcmll
cyBhcmUgdGhlIHBhdGNoZXMgdGhhdApjb252ZXJ0IHRoZSBhcnJheXMgdG8gdXNlIG5hbWVkIGlu
aXRpYWxpemVycywgc2VlCmh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2FsbC9jb3Zlci4xNzgwMDQ4
OTI1LmdpdC51LmtsZWluZS1rb2VuaWdAYmF5bGlicmUuY29tLwpmb3IgdGhlIGlkZWEgYmVoaW5k
IGl0LiBUaGVuIGJ5IG5vdCBjbG9zaW5nIHRoZSBleWVzIGZvciBzbWFsbCBpc3N1ZXMKc3BvdHRl
ZCB3aGlsZSB3b3JraW5nIG9uIHRoYXQsIHRoaXMgc2VyaWVzIGdyZXcgYSBiaXQuCgpDaGFuZ2Vz
IHNpbmNlIHYxIChhdmFpbGFibGUgYXQKaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGludXgta2Vy
bmVsL2NvdmVyLjE3ODQwMTMwNjMuZ2l0LnUua2xlaW5lLWtvZW5pZ0BiYXlsaWJyZS5jb20pOgoK
IC0gVHJpdmlhbGx5IHJlYmFzZSB0byB0b2RheSdzIG5leHQvbWFzdGVyCiAtIFRoZSBmaXJzdCB0
d28gcGF0Y2hlcyBhcmUgbmV3LiBNeSBzY3JpcHQgZGlkbid0IG1hdGNoIG9uIGRldmljZS1pZAog
ICBhcnJheXMgdGhhdCBhcmUgbWFya2VkIHdpdGggX19tYXliZV91bnVzZWQsIHNvIHRoZSBkcml2
ZXJzIHRvdWNoZWQgaW4KICAgdGhlc2UgdHdvIHBhdGNoZXMgYXJlIGFkYXB0ZWQgZnVydGhlciBk
b3duLCB0b28uCiAtIEZpeGVkIGNhcGl0YWxpc2F0aW9uIG9mIFBDSSAoQW5keSksIGRpZCB0aGUg
c2FtZSBmb3IgQUNQSQogLSBTb3J0IHRoZSBBQ1BJIGRldmljZS1pZCBhcnJheXMgYnkgLmlkIGlu
IHRoZSAidW5pZnkiIHBhdGNoIChvbmx5IG9uZQogICBpbnN0YW5jZSBpbiBncGlvLWR3YXBiLmMg
d2FzIHVuc29ydGVkKSwgc3VnZ2VzdGVkIGJ5IEFuZHkuCiAtIEZvdW5kIGEgZmV3IG90aGVyIGlu
Y29uc2lzdGVudCBkZXZpY2VfaWQgYXJyYXlzIHRoYXQgbXkgc2NyaXB0IGRpZG4ndAogICBtYXRj
aCAoZHVlIHRvIC5kcml2ZXJfZGF0YSBub3QgYmVpbmcgYSBzaW5nbGUgZXhwcmVzc2lvbiBvciBh
IGNvbW1lbnQKICAgaW4gdGhlIHRlcm1pbmF0b3Igb3IgbW9yZSB0aGFuIG9uZSBhcnJheSBpbiBh
IHNpbmdsZSBmaWxlKQogLSBGaXhlZCBjYXN0IGV4cHJlc3Npb25zIGluIGRyaXZlcnMvZ3Bpby9n
cGlvLW12ZWJ1LmMgdG8gcGxlYXNlCiAgIGNoZWNrcGF0Y2gKIC0gRHJvcHBlZCB0aGUgZG1pIE1P
RFVMRV9ERVZJQ0VfVEFCTEUgcGF0Y2gKIC0gQWRkZWQgcmV2aWV3IHRhZ3MgZnJvbSB2MQoKQ2hl
Y2twYXRjaCBvbmx5IHJlcG9ydHMgdHdvIHVuZG9jdW1lbnRlZCBkZXZpY2UtdHJlZSBjb21wYXRp
Ymxlcy4gSSBmZWx0CmZyZWUgdG8gaWdub3JlIHRoZXNlIGFzIHRoaXMgaXMgYSBwcmUtZXhpc3Rp
bmcgaXNzdWUgYW5kIG91dC1vZi1jb250ZXh0CmZvciB0aGlzIHNlcmllcy4KCkJlc3QgcmVnYXJk
cwpVd2UKClV3ZSBLbGVpbmUtS8O2bmlnIChUaGUgQ2FwYWJsZSBIdWIpICgyMSk6CiAgZ3Bpbzog
UmVtb3ZlIF9fbWF5YmVfdW51c2VkIGFubm90YXRpb25zIGZyb20gYWNwaV9kZXZpY2VfaWQgYXJy
YXlzCiAgZ3BpbzogZnhsNjQwODogUmVtb3ZlIF9fbWF5YmVfdW51c2VkIGFubm90YXRpb25zIGZy
b20gb2ZfZGV2aWNlX2lkCiAgICBhcnJheQogIGdwaW86IERyb3AgdW51c2VkIGFzc2lnbm1lbnQg
b2YgYWNwaV9kZXZpY2VfaWQgZHJpdmVyIGRhdGEKICBncGlvOiBtYXg3MzAxOiBEcm9wIHVudXNl
ZCBhc3NpZ25tZW50IG9mIHNwaV9kZXZpY2VfaWQgZHJpdmVyIGRhdGEKICBncGlvOiBtbWlvOiBE
cm9wIHVudXNlZCBhc3NpZ25tZW50IG9mIHBsYXRmb3JtX2RldmljZV9pZCBkcml2ZXIgZGF0YQog
IGdwaW86IGxqY2E6IERyb3AgdW51c2VkIGFzc2lnbm1lbnQgb2YgYXV4aWxpYXJ5X2RldmljZV9p
ZCBkcml2ZXIgZGF0YQogIGdwaW86IEFkZCBtaXNzaW5nIEFDUEkgbW9kdWxlIGFubm90YXRpb25z
CiAgZ3Bpbzogc29kYXZpbGxlOiBBZGQgbWlzc2luZyBQQ0kgbW9kdWxlIGFubm90YXRpb25zCiAg
Z3BpbzogQWRkIG1pc3NpbmcgT0YgbW9kdWxlIGFubm90YXRpb25zCiAgZ3BpbzogcHhhOiBBZGQg
bWlzc2luZyBwbGF0Zm9ybSBtb2R1bGUgYW5ub3RhdGlvbnMKICBncGlvOiBwbDA2MTogVXNlIGVt
cHR5IGluaXRpYWxpemVyIGZvciBhbWJhX2lkIHRlcm1pbmF0b3IKICBncGlvOiBVc2UgbmFtZWQg
aW5pdGlhbGl6ZXJzIGZvciBhY3BpX2RldmljZV9pZCBhcnJheQogIGdwaW86IFVzZSBuYW1lZCBp
bml0aWFsaXplcnMgZm9yIHNwaV9kZXZpY2VfaWQgYXJyYXkKICBncGlvOiB2aXJ0aW86IFVzZSBh
IG5hbWVkIGluaXRpYWxpemVyIGZvciB2aXJ0aW9fZGV2aWNlX2lkIGFycmF5CiAgZ3BpbzogcGNm
ODU3eDogVXNlIG5hbWVkIGluaXRpYWxpemVycyBmb3Igb2ZfZGV2aWNlX2lkIGFycmF5CiAgZ3Bp
bzogVW5pZnkgc3R5bGUgb2YgYWNwaV9kZXZpY2VfaWQgYXJyYXlzCiAgZ3BpbzogVW5pZnkgc3R5
bGUgb2Ygb2ZfZGV2aWNlX2lkIGFycmF5cwogIGdwaW86IG1heDc3NjIwOiBVbmlmeSBzdHlsZSBv
ZiBwbGF0Zm9ybV9kZXZpY2VfaWQgYXJyYXlzCiAgZ3BpbzogVW5pZnkgc3R5bGUgb2Ygc3BpX2Rl
dmljZV9pZCBhcnJheXMKICBncGlvOiBVbmlmeSBzdHlsZSBvZiBwY2lfZGV2aWNlX2lkIGFycmF5
cwogIGdwaW86IFVuaWZ5IHN0eWxlIG9mIHZhcmlvdXMgKl9kZXZpY2VfaWQgYXJyYXlzCgogZHJp
dmVycy9ncGlvL2dwaW8tNzR4MTY0LmMgICAgICAgICAgfCAgNCArKy0tCiBkcml2ZXJzL2dwaW8v
Z3Bpby1hZG5wLmMgICAgICAgICAgICB8ICA0ICsrLS0KIGRyaXZlcnMvZ3Bpby9ncGlvLWFnZ3Jl
Z2F0b3IuYyAgICAgIHwgIDIgKy0KIGRyaXZlcnMvZ3Bpby9ncGlvLWFsdGVyYS1hMTBzci5jICAg
IHwgIDIgKy0KIGRyaXZlcnMvZ3Bpby9ncGlvLWFsdGVyYS5jICAgICAgICAgIHwgIDQgKystLQog
ZHJpdmVycy9ncGlvL2dwaW8tYW1kODExMS5jICAgICAgICAgfCAgMiArLQogZHJpdmVycy9ncGlv
L2dwaW8tYW1kcHQuYyAgICAgICAgICAgfCAgOCArKysrLS0tLQogZHJpdmVycy9ncGlvL2dwaW8t
YXNwZWVkLXNncGlvLmMgICAgfCAxMCArKysrKy0tLS0tCiBkcml2ZXJzL2dwaW8vZ3Bpby1hc3Bl
ZWQuYyAgICAgICAgICB8IDEwICsrKysrLS0tLS0KIGRyaXZlcnMvZ3Bpby9ncGlvLWF0aDc5LmMg
ICAgICAgICAgIHwgIDIgKy0KIGRyaXZlcnMvZ3Bpby9ncGlvLWJjbS1rb25hLmMgICAgICAgIHwg
IDEgKwogZHJpdmVycy9ncGlvL2dwaW8tYmx6cDE2MDAuYyAgICAgICAgfCAgNCArKy0tCiBkcml2
ZXJzL2dwaW8vZ3Bpby1icmNtc3RiLmMgICAgICAgICB8ICAyICstCiBkcml2ZXJzL2dwaW8vZ3Bp
by1idDh4eC5jICAgICAgICAgICB8ICAyICstCiBkcml2ZXJzL2dwaW8vZ3Bpby1jYWRlbmNlLmMg
ICAgICAgICB8ICA2ICsrKy0tLQogZHJpdmVycy9ncGlvL2dwaW8tY3JlZy1zbnBzLmMgICAgICAg
fCAgNSArKystLQogZHJpdmVycy9ncGlvL2dwaW8tZGF2aW5jaS5jICAgICAgICAgfCAgOCArKysr
LS0tLQogZHJpdmVycy9ncGlvL2dwaW8tZHdhcGIuYyAgICAgICAgICAgfCAxNCArKysrKysrLS0t
LS0tLQogZHJpdmVycy9ncGlvL2dwaW8tZW0uYyAgICAgICAgICAgICAgfCAgNCArKy0tCiBkcml2
ZXJzL2dwaW8vZ3Bpby1lcDkzeHguYyAgICAgICAgICB8ICAxICsKIGRyaXZlcnMvZ3Bpby9ncGlv
LWZ0Z3BpbzAxMC5jICAgICAgIHwgIDMgKystCiBkcml2ZXJzL2dwaW8vZ3Bpby1meGw2NDA4LmMg
ICAgICAgICB8ICAyICstCiBkcml2ZXJzL2dwaW8vZ3Bpby1ncmFuaXRlcmFwaWRzLmMgICB8ICA0
ICsrLS0KIGRyaXZlcnMvZ3Bpby9ncGlvLWdyZ3Bpby5jICAgICAgICAgIHwgIDIgKy0KIGRyaXZl
cnMvZ3Bpby9ncGlvLWd3LXBsZC5jICAgICAgICAgIHwgIDQgKystLQogZHJpdmVycy9ncGlvL2dw
aW8taGlzaS5jICAgICAgICAgICAgfCAgNiArKystLS0KIGRyaXZlcnMvZ3Bpby9ncGlvLWhsd2Qu
YyAgICAgICAgICAgIHwgIDQgKystLQogZHJpdmVycy9ncGlvL2dwaW8taW14LXNjdS5jICAgICAg
ICAgfCAgMSArCiBkcml2ZXJzL2dwaW8vZ3Bpby1peHA0eHguYyAgICAgICAgICB8ICA0ICsrLS0K
IGRyaXZlcnMvZ3Bpby9ncGlvLWxqY2EuYyAgICAgICAgICAgIHwgIDQgKystLQogZHJpdmVycy9n
cGlvL2dwaW8tbG9vbmdzb24tNjRiaXQuYyAgfCAgNCArKy0tCiBkcml2ZXJzL2dwaW8vZ3Bpby1s
cDM5NDMuYyAgICAgICAgICB8ICAyICstCiBkcml2ZXJzL2dwaW8vZ3Bpby1scGMzMnh4LmMgICAg
ICAgICB8ICA0ICsrLS0KIGRyaXZlcnMvZ3Bpby9ncGlvLW1hY3NtYy5jICAgICAgICAgIHwgIDQg
KystLQogZHJpdmVycy9ncGlvL2dwaW8tbWF4MzE5MXguYyAgICAgICAgfCAxMiArKysrKystLS0t
LS0KIGRyaXZlcnMvZ3Bpby9ncGlvLW1heDczMDEuYyAgICAgICAgIHwgIDIgKy0KIGRyaXZlcnMv
Z3Bpby9ncGlvLW1heDczNjAuYyAgICAgICAgIHwgIDggKysrKy0tLS0KIGRyaXZlcnMvZ3Bpby9n
cGlvLW1heDc3NjIwLmMgICAgICAgIHwgIDQgKystLQogZHJpdmVycy9ncGlvL2dwaW8tbWF4Nzc3
NTkuYyAgICAgICAgfCAgMiArLQogZHJpdmVycy9ncGlvL2dwaW8tbWI4NnM3eC5jICAgICAgICAg
fCAgMiArLQogZHJpdmVycy9ncGlvL2dwaW8tbWwtaW9oLmMgICAgICAgICAgfCAgMiArLQogZHJp
dmVycy9ncGlvL2dwaW8tbWx4YmYuYyAgICAgICAgICAgfCAgNiArKystLS0KIGRyaXZlcnMvZ3Bp
by9ncGlvLW1seGJmMi5jICAgICAgICAgIHwgIDYgKysrLS0tCiBkcml2ZXJzL2dwaW8vZ3Bpby1t
bHhiZjMuYyAgICAgICAgICB8ICA0ICsrLS0KIGRyaXZlcnMvZ3Bpby9ncGlvLW1tLWxhbnRpcS5j
ICAgICAgIHwgIDIgKy0KIGRyaXZlcnMvZ3Bpby9ncGlvLW1taW8uYyAgICAgICAgICAgIHwgIDMg
Ky0tCiBkcml2ZXJzL2dwaW8vZ3Bpby1tb2NrdXAuYyAgICAgICAgICB8ICA0ICsrLS0KIGRyaXZl
cnMvZ3Bpby9ncGlvLW1veHRldC5jICAgICAgICAgIHwgIDQgKystLQogZHJpdmVycy9ncGlvL2dw
aW8tbXBjNTIwMC5jICAgICAgICAgfCAgOSArKysrKy0tLS0KIGRyaXZlcnMvZ3Bpby9ncGlvLW1w
Yzh4eHguYyAgICAgICAgIHwgMjUgKysrKysrKysrKysrKy0tLS0tLS0tLS0tLQogZHJpdmVycy9n
cGlvL2dwaW8tbXBmcy5jICAgICAgICAgICAgfCAgMSArCiBkcml2ZXJzL2dwaW8vZ3Bpby1tcHNz
ZS5jICAgICAgICAgICB8ICAzICstLQogZHJpdmVycy9ncGlvL2dwaW8tbXNjMzEzLmMgICAgICAg
ICAgfCAgMSArCiBkcml2ZXJzL2dwaW8vZ3Bpby1tdDc2MjEuYyAgICAgICAgICB8ICAyICstCiBk
cml2ZXJzL2dwaW8vZ3Bpby1tdmVidS5jICAgICAgICAgICB8IDEzICsrKysrKystLS0tLS0KIGRy
aXZlcnMvZ3Bpby9ncGlvLW14Yy5jICAgICAgICAgICAgIHwgIDIgKy0KIGRyaXZlcnMvZ3Bpby9n
cGlvLW14cy5jICAgICAgICAgICAgIHwgIDQgKystLQogZHJpdmVycy9ncGlvL2dwaW8tbm9tYWRp
ay5jICAgICAgICAgfCAgNyArKysrLS0tCiBkcml2ZXJzL2dwaW8vZ3Bpby1ub3ZhbGFrZS1ldmVu
dHMuYyB8ICA0ICsrLS0KIGRyaXZlcnMvZ3Bpby9ncGlvLW5wY20tc2dwaW8uYyAgICAgIHwgIDYg
KysrLS0tCiBkcml2ZXJzL2dwaW8vZ3Bpby1vY3Rlb24uYyAgICAgICAgICB8ICAyICstCiBkcml2
ZXJzL2dwaW8vZ3Bpby1vbWFwLmMgICAgICAgICAgICB8ICAyICstCiBkcml2ZXJzL2dwaW8vZ3Bp
by1wYWxtYXMuYyAgICAgICAgICB8IDEwICsrKysrLS0tLS0KIGRyaXZlcnMvZ3Bpby9ncGlvLXBj
YTk1M3guYyAgICAgICAgIHwgIDQgKystLQogZHJpdmVycy9ncGlvL2dwaW8tcGNhOTU3MC5jICAg
ICAgICAgfCAgMiArLQogZHJpdmVycy9ncGlvL2dwaW8tcGNmODU3eC5jICAgICAgICAgfCAyNiAr
KysrKysrKysrKysrLS0tLS0tLS0tLS0tLQogZHJpdmVycy9ncGlvL2dwaW8tcGNpLWlkaW8tMTYu
YyAgICAgfCAgMyArKy0KIGRyaXZlcnMvZ3Bpby9ncGlvLXBjaWUtaWRpby0yNC5jICAgIHwgIDgg
KysrKystLS0KIGRyaXZlcnMvZ3Bpby9ncGlvLXBpc29zci5jICAgICAgICAgIHwgIDQgKystLQog
ZHJpdmVycy9ncGlvL2dwaW8tcGwwNjEuYyAgICAgICAgICAgfCAgMiArLQogZHJpdmVycy9ncGlv
L2dwaW8tcG1pYy1laWMtc3ByZC5jICAgfCAgMiArLQogZHJpdmVycy9ncGlvL2dwaW8tcHhhLmMg
ICAgICAgICAgICAgfCAyMCArKysrKysrKysrKy0tLS0tLS0tLQogZHJpdmVycy9ncGlvL2dwaW8t
cWl4aXMtZnBnYS5jICAgICAgfCAgMyArLS0KIGRyaXZlcnMvZ3Bpby9ncGlvLXJjYXIuYyAgICAg
ICAgICAgIHwgIDIgKy0KIGRyaXZlcnMvZ3Bpby9ncGlvLXJkYS5jICAgICAgICAgICAgIHwgIDIg
Ky0KIGRyaXZlcnMvZ3Bpby9ncGlvLXJlYWx0ZWstb3R0by5jICAgIHwgIDIgKy0KIGRyaXZlcnMv
Z3Bpby9ncGlvLXJvY2tjaGlwLmMgICAgICAgIHwgIDQgKystLQogZHJpdmVycy9ncGlvL2dwaW8t
c2FtYTVkMi1waW9idS5jICAgfCAgMiArLQogZHJpdmVycy9ncGlvL2dwaW8tc2lmaXZlLmMgICAg
ICAgICAgfCAgMiArLQogZHJpdmVycy9ncGlvL2dwaW8tc2wyOGNwbGQuYyAgICAgICAgfCAgMiAr
LQogZHJpdmVycy9ncGlvL2dwaW8tc29kYXZpbGxlLmMgICAgICAgfCAgMyArKy0KIGRyaXZlcnMv
Z3Bpby9ncGlvLXNwZWFyLXNwaWNzLmMgICAgIHwgIDMgKystCiBkcml2ZXJzL2dwaW8vZ3Bpby1z
cHJkLmMgICAgICAgICAgICB8ICAyICstCiBkcml2ZXJzL2dwaW8vZ3Bpby1zdG1wZS5jICAgICAg
ICAgICB8ICAyICstCiBkcml2ZXJzL2dwaW8vZ3Bpby1zdHAteHdheS5jICAgICAgICB8ICAyICst
CiBkcml2ZXJzL2dwaW8vZ3Bpby10ZWdyYS5jICAgICAgICAgICB8ICA2ICsrKy0tLQogZHJpdmVy
cy9ncGlvL2dwaW8tdGVncmExODYuYyAgICAgICAgfCAyNiArKysrKysrKysrKysrLS0tLS0tLS0t
LS0tLQogZHJpdmVycy9ncGlvL2dwaW8tdGh1bmRlcnguYyAgICAgICAgfCAgMyArLS0KIGRyaXZl
cnMvZ3Bpby9ncGlvLXRwczY1MjE4LmMgICAgICAgIHwgIDIgKy0KIGRyaXZlcnMvZ3Bpby9ncGlv
LXRzNDgwMC5jICAgICAgICAgIHwgIDQgKystLQogZHJpdmVycy9ncGlvL2dwaW8tdHM0OTAwLmMg
ICAgICAgICAgfCAgMiArLQogZHJpdmVycy9ncGlvL2dwaW8tdHdsNDAzMC5jICAgICAgICAgfCAg
NCArKy0tCiBkcml2ZXJzL2dwaW8vZ3Bpby11c2Jpby5jICAgICAgICAgICB8IDEzICsrKysrKyst
LS0tLS0KIGRyaXZlcnMvZ3Bpby9ncGlvLXZmNjEwLmMgICAgICAgICAgIHwgIDQgKystLQogZHJp
dmVycy9ncGlvL2dwaW8tdmlydGlvLmMgICAgICAgICAgfCAgNCArKy0tCiBkcml2ZXJzL2dwaW8v
Z3Bpby12aXNjb250aS5jICAgICAgICB8ICAyICstCiBkcml2ZXJzL2dwaW8vZ3Bpby13YXZlc2hh
cmUtZHNpLmMgICB8ICAyICstCiBkcml2ZXJzL2dwaW8vZ3Bpby14Z2VuZS1zYi5jICAgICAgICB8
ICA2ICsrKy0tLQogZHJpdmVycy9ncGlvL2dwaW8teGdlbmUuYyAgICAgICAgICAgfCAxMCArKysr
KystLS0tCiBkcml2ZXJzL2dwaW8vZ3Bpby14Z3MtaXByb2MuYyAgICAgICB8ICAyICstCiBkcml2
ZXJzL2dwaW8vZ3Bpby14aWxpbnguYyAgICAgICAgICB8ICA0ICsrLS0KIGRyaXZlcnMvZ3Bpby9n
cGlvLXhscC5jICAgICAgICAgICAgIHwgIDYgKysrLS0tCiBkcml2ZXJzL2dwaW8vZ3Bpby14cmEx
NDAzLmMgICAgICAgICB8ICA2ICsrKy0tLQogZHJpdmVycy9ncGlvL2dwaW8temV2aW8uYyAgICAg
ICAgICAgfCAgNSArKystLQogZHJpdmVycy9ncGlvL2dwaW8tenlucW1wLW1vZGVwaW4uYyAgfCAg
MiArLQogZHJpdmVycy9ncGlvL2dwaW9saWItYWNwaS1xdWlya3MuYyAgfCAgMiArLQogMTA2IGZp
bGVzIGNoYW5nZWQsIDI2NSBpbnNlcnRpb25zKCspLCAyNDcgZGVsZXRpb25zKC0pCgoKYmFzZS1j
b21taXQ6IGI4ODA5OTY5ZTFkN2E1OTFlMGY0OWRkNDY0YTVkMDRiM2NmMDJhYjEKLS0gCjIuNTUu
MC4xMS5nMTUzNjY2YTdkOWJiCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmlu
ZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9s
aW51eC1yaXNjdgo=
