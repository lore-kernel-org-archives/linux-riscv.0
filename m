Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 328F4606A33A
	for <linux-riscv@archiver.kernel.org>; Thu,  5 Nov 2026 09:53:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=C9rI5SR1;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=sntech.de header.i=@sntech.de header.a=rsa-sha256 header.s=gloria202408 header.b=0M+GuEew
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=XH9xlDcUYk2CFaqPW281UKFuyDn6weDUWVyWRSGiCFo=; b=C9rI5SR1ISZ+smzduYyWSiHvVV
	KI/EqsW0zObXnVFONAndUHDzwiDnbatZlHART3nnUxb4Eajbb8j3UBB7CmxWGe0iKx/tV0DWd5QK/
	oMzqevV1V/1m+LBPlRd0ESXrxelG72ic/F2JOthRTdCRgp3FtaJmbJzwxTFCO//Jr3mdikJeWbFgs
	oL96x8PN3n2qlVJ1dDUP05UaWdmWm5qm8G83QAfhAXb5uMlQrJWJ8a2R74wNDasLVVyhfR3LhTGKZ
	yHVGoiroDpSOJ0IDL0vmhsowVw2sxLbgu40V3Wc669YeAcEhpJZrOpnePO/JjWLlsh8t2DhdGowMo
	DhFuwS+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOuA0-00000008N1g-09rG;
	Thu, 05 Nov 2026 09:53:32 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOu9v-00000008N0A-0WjW;
	Thu, 05 Nov 2026 09:53:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=MqP9VAl2M+HKyxx6eNykqH5O6VAgeEFbQ04dXIcL6Fo=; b=0M+GuEewUIj5GPHIXeBPBAoW3i
	zXgPfn+4LRyxdrZX5AnFP0236jDmDcidoXjDIeK5la4bnSWlwP/aZUzh9u1vohdQc4sRqo5M9FiTZ
	XsKFcdvzK7qt8QEdsQSylM11AZnu4iPDITkQcjUn4zfIfcds/OLMyweROsbCE3fQAk1jwgK8PO7GC
	r/MMyfZXSnibjvKjuIl8o5UMF1xPT+WnfymrPAY8YvXlVRSPCk8iEnYhtKgHuTwij4n4Cfw4THGOi
	/JXgecGtiDWVrFC7I7GPBbxIJf/5GkIcvvbxDrRFBoSJ0R4DwsK1IZQlgJFaEAyXpaPB2c3cJR+sS
	7ddGpAsA==;
From: Heiko =?UTF-8?B?U3TDvGJuZXI=?= <heiko@sntech.de>
To: Mark Brown <broonie@kernel.org>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Claudiu Beznea <claudiu.beznea@tuxon.dev>,
 Radu Pirea <radu_nicolae.pirea@upb.ro>, CL Wang <cl634@andestech.com>,
 Ryan Wanner <ryan.wanner@microchip.com>,
 Florian Fainelli <florian.fainelli@broadcom.com>,
 Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
 Vladimir Oltean <olteanv@gmail.com>, Frank Li <Frank.Li@nxp.com>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Han Xu <han.xu@nxp.com>,
 Haibo Chen <haibo.chen@nxp.com>, Linus Walleij <linusw@kernel.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Daniel Mack <daniel@zonque.org>, Haojian Zhuang <haojian.zhuang@gmail.com>,
 Robert Jarzmik <robert.jarzmik@free.fr>,
 Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
 Andi Shyti <andi.shyti@kernel.org>, Tudor Ambarus <tudor.ambarus@linaro.org>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 Peter Griffin <peter.griffin@linaro.org>,
 Alim Akhtar <alim.akhtar@samsung.com>, Yixun Lan <dlan@kernel.org>,
 Troy Mitchell <troy.mitchell@linux.spacemit.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Alain Volmat <alain.volmat@foss.st.com>, Chen-Yu Tsai <wens@kernel.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>, Laxman Dewangan <ldewangan@nvidia.com>,
 Thierry Reding <thierry.reding@kernel.org>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Sowjanya Komatineni <skomatineni@nvidia.com>,
 Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
 Masami Hiramatsu <mhiramat@kernel.org>,
 "open list:SPI SUBSYSTEM" <linux-spi@vger.kernel.org>,
 "moderated list:ARM/Microchip (AT91) SoC support"
 <linux-arm-kernel@lists.infradead.org>,
 open list <linux-kernel@vger.kernel.org>,
 "moderated list:BROADCOM BCM2711/BCM2835 ARM ARCHITECTURE"
 <linux-rpi-kernel@lists.infradead.org>,
 "open list:FREESCALE DSPI DRIVER" <imx@lists.linux.dev>,
 "open list:ARM/QUALCOMM MAILING LIST" <linux-arm-msm@vger.kernel.org>,
 "open list:ARM/Rockchip SoC support" <linux-rockchip@lists.infradead.org>,
 "open list:RENESAS RZ/V2H(P) RSPI DRIVER"
 <linux-renesas-soc@vger.kernel.org>,
 "open list:SAMSUNG SPI DRIVERS" <linux-samsung-soc@vger.kernel.org>,
 "open list:RISC-V SPACEMIT SoC Support" <linux-riscv@lists.infradead.org>,
 "open list:RISC-V SPACEMIT SoC Support" <spacemit@lists.linux.dev>,
 "moderated list:ARM/STM32 ARCHITECTURE"
 <linux-stm32@st-md-mailman.stormreply.com>,
 "open list:ARM/Allwinner sunXi SoC support" <linux-sunxi@lists.linux.dev>,
 "open list:TEGRA ARCHITECTURE SUPPORT" <linux-tegra@vger.kernel.org>,
 Frank.Li@oss.nxp.com
Cc: imx@lists.linux.dev, vkoul@kernel.org
Subject: Re: [PATCH 1/1] spi: use dmaengine_desc_set_callback()
Date: Thu, 05 Nov 2026 10:52:38 +0100
Message-ID: <2154003.0S5aU1g85B@diego>
In-Reply-To: <20261102174005.3933649-1-Frank.Li@oss.nxp.com>
References: <20261102174005.3933649-1-Frank.Li@oss.nxp.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261105_015327_210705_897F26DB 
X-CRM114-Status: GOOD (  13.53  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

QW0gTW9udGFnLCAyLiBOb3ZlbWJlciAyMDI2LCAxODozOTo1OCBNaXR0ZWxldXJvcMOkaXNjaGUg
Tm9ybWFsemVpdCBzY2hyaWViIEZyYW5rLkxpQG9zcy5ueHAuY29tOgo+IEZyb206IEZyYW5rIExp
IDxGcmFuay5MaUBueHAuY29tPgo+IAo+IFJlcGxhY2Ugb3Blbi1jb2RlZCBhc3NpZ25tZW50cyB0
byBjYWxsYmFjayBhbmQgY2FsbGJhY2tfcGFyYW0gZmllbGRzCj4gb2Ygc3RydWN0IGRtYV9hc3lu
Y190eF9kZXNjcmlwdG9yIHdpdGggY2FsbHMgdG8gdGhlCj4gZG1hZW5naW5lX2Rlc2Nfc2V0X2Nh
bGxiYWNrKCkgaGVscGVyIGFjcm9zcyBTUEkgYnVzIGRyaXZlcnMuCj4gCj4gTm8gZnVuY3Rpb25h
bCBjaGFuZ2UgaW50ZW5kZWQuIFByZXBhcmUgbWFrZSB0byBzdHJ1Y3QKPiBkbWFfYXN5bmNfdHhf
ZGVzY3JpcHRvciBwcml2YXRlIHRvIHRoZSBETUEgZW5naW5lLgo+IAo+IFNpZ25lZC1vZmYtYnk6
IEZyYW5rIExpIDxGcmFuay5MaUBueHAuY29tPgoKWy4uLl0KCj4gZGlmZiAtLWdpdCBhL2RyaXZl
cnMvc3BpL3NwaS1yb2NrY2hpcC5jIGIvZHJpdmVycy9zcGkvc3BpLXJvY2tjaGlwLmMKPiBpbmRl
eCAxYTgxZmQ5NGI0Mzk2Li5mOGQ2Y2VhMmYzZGFkIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvc3Bp
L3NwaS1yb2NrY2hpcC5jCj4gKysrIGIvZHJpdmVycy9zcGkvc3BpLXJvY2tjaGlwLmMKPiBAQCAt
NDc1LDggKzQ3NSw3IEBAIHN0YXRpYyBpbnQgcm9ja2NoaXBfc3BpX3ByZXBhcmVfZG1hKHN0cnVj
dCByb2NrY2hpcF9zcGkgKnJzLAo+ICAJCWlmICghcnhkZXNjKQo+ICAJCQlyZXR1cm4gLUVJTlZB
TDsKPiAgCj4gLQkJcnhkZXNjLT5jYWxsYmFjayA9IHJvY2tjaGlwX3NwaV9kbWFfcnhjYjsKPiAt
CQlyeGRlc2MtPmNhbGxiYWNrX3BhcmFtID0gY3RscjsKPiArCQlkbWFlbmdpbmVfZGVzY19zZXRf
Y2FsbGJhY2socnhkZXNjLCByb2NrY2hpcF9zcGlfZG1hX3J4Y2IsIE5VTEwsIGN0bHIpOwo+ICAJ
fQo+ICAKPiAgCXR4ZGVzYyA9IE5VTEw7Cj4gQEAgLTUwMCw4ICs0OTksNyBAQCBzdGF0aWMgaW50
IHJvY2tjaGlwX3NwaV9wcmVwYXJlX2RtYShzdHJ1Y3Qgcm9ja2NoaXBfc3BpICpycywKPiAgCQkJ
cmV0dXJuIC1FSU5WQUw7Cj4gIAkJfQo+ICAKPiAtCQl0eGRlc2MtPmNhbGxiYWNrID0gcm9ja2No
aXBfc3BpX2RtYV90eGNiOwo+IC0JCXR4ZGVzYy0+Y2FsbGJhY2tfcGFyYW0gPSBjdGxyOwo+ICsJ
CWRtYWVuZ2luZV9kZXNjX3NldF9jYWxsYmFjayh0eGRlc2MsIHJvY2tjaGlwX3NwaV9kbWFfdHhj
YiwgTlVMTCwgY3Rscik7Cj4gIAl9Cj4gIAo+ICAJLyogcnggbXVzdCBiZSBzdGFydGVkIGJlZm9y
ZSB0eCBkdWUgdG8gc3BpIGluc3RpbmN0ICovCgpSZXZpZXdlZC1ieTogSGVpa28gU3R1ZWJuZXIg
PGhlaWtvQHNudGVjaC5kZT4KCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmlu
ZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9s
aW51eC1yaXNjdgo=
