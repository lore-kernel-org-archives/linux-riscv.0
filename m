Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B801560A5BD7
	for <linux-riscv@archiver.kernel.org>; Tue, 10 Nov 2026 15:35:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=kXWRiyRP;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=zte.com.cn header.i=@zte.com.cn header.a=rsa-sha256 header.s=z202610 header.b=guDkJoXd
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:Cc:To:From:Mime-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=uiNPpqP8HsITrgMd1lfpTrTTP68LocvM0fK3Lyx2plE=; b=kXWRiyRPFddx0qh6S3mfHSPR01
	bQK20AyFs5Rzu5kLgVb8nfX7hXSiD+EH5PFIqmzcKMN0y9ejEEMFNG2gNV4X9BNzy1C8g7fbQJ1qt
	FPoptF4t32upRFfRhAM6XUgdB24EA7Vz5TL+ClugcoKwisQI5gQCOeGKsfNp0p8RFhPjVwQ/gbZwM
	krwwINBVtL2qd2175N0Ns0l6Oijn3sSI106IKlwWP4kecHQCpYBqmobtvuLDMqlfWtjYdRiFfzkao
	0l8Rxq8nTwXmIR2SY9kUDowIy0rUcV5KQt8bMAZm4BDGgG0i9fUuiMaHVlidWwQnQvgvf/AXw7Dgu
	68Fy8zAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQnsG-00000004PCX-1FRy;
	Tue, 10 Nov 2026 15:35:04 +0000
Received: from mxct.zte.com.cn ([183.62.165.209])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQnsD-00000004P75-09Fa;
	Tue, 10 Nov 2026 15:35:02 +0000
Received: from mse-fl2.zte.com.cn (unknown [10.5.228.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mxct.zte.com.cn (FangMail) with ESMTPS id 4jP9gs1vMxz57HS3;
	Tue, 10 Nov 2026 23:34:49 +0800 (CST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=zte.com.cn;
	s=z202610; t=1794324889;
	bh=HCWfuzAN+AMe0nrrXGOghlVGYDRgVDFTNAe2SncsUIs=;
	h=Date:From:To:Cc:Subject;
	b=guDkJoXdJQvEWIe1CHP4KnQVolrmBcYfXSvRHr3Cekn82jHtDB1AQJYSD03Cttgbf
	 tpPGK2eAtixqtLlANiOHc4KyygrMATpmh0SVfmjX+I1F/CHnWVW5GMb7esYE6TXv1U
	 RAVqSjHsDPILBRbuHjlGSYVKe9b5Kxv6ybTwzTE7leRjE1N8+Ep19Wkwdnp3LP8F4o
	 yStuzEI7pk0/40Fl6MyMsEY/fDGDd2SeUqJxf1D8JtLCG6cpIcMT+FYfeAZeYbz7M2
	 sAe9l6h21VAKODQzZEkLYOPjNodP7Qdc9MPnykkSGVq8XU3z4iqHwb+fOAldP66rxv
	 Ixl+GkKsYieJg==
Received: from xaxapp04.zte.com.cn ([10.99.98.157])
	by mse-fl2.zte.com.cn with SMTP id 6AAFYkPO047648;
	Tue, 10 Nov 2026 23:34:46 +0800 (+08)
	(envelope-from shao.mingyin@zte.com.cn)
Received: from mapi (xaxapp04[null])
	by mapi (Zmail) with MAPI id mid32;
	Tue, 10 Nov 2026 23:34:50 +0800 (CST)
X-Zmail-TransId: 2afb6af3399a6e7-27d05
X-Mailer: Zmail v1.0
Message-ID: <20261110233450305Smji446Uhvoxa7r8SHEgl@zte.com.cn>
Date: Tue, 10 Nov 2026 23:34:50 +0800 (CST)
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0
From: <shao.mingyin@zte.com.cn>
To: <broonie@kernel.org>, <linux-spi@vger.kernel.org>
Cc: <linux-kernel@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
        <pjw@kernel.org>, <samuel.holland@sifive.com>,
        <william.zhang@broadcom.com>, <kursad.oney@broadcom.com>,
        <jonas.gorski@gmail.com>, <bcm-kernel-feedback-list@broadcom.com>,
        <anand.gore@broadcom.com>, <florian.fainelli@broadcom.com>,
        <rafal@milecki.pl>, <linux-arm-kernel@lists.infradead.org>,
        <sven@kernel.org>, <j@jannau.net>, <neal@gompa.dev>,
        <asahi@lists.linux.dev>, <ryan.wanner@microchip.com>,
        <nicolas.ferre@microchip.com>, <alexandre.belloni@bootlin.com>,
        <claudiu.beznea@tuxon.dev>
Subject: =?UTF-8?B?W1BBVENIIHYyIDAvNV0gc3BpOiBmaXggZGl2aXNpb24gYnkgemVybyB3aXRoIGEgemVybyB0cmFuc2ZlciBzcGVlZA==?=
X-MAIL: mse-fl2.zte.com.cn 6AAFYkPO047648
X-TLS: YES
X-ENVELOPE-SENDER: shao.mingyin@zte.com.cn
X-SOURCE-IP: 10.5.228.133 unknown Tue, 10 Nov 2026 23:34:49 +0800
X-CLEAN: YES
X-Fangmail-Anti-Spam-Filtered: true
X-Fangmail-MID-QID: 6AF33999.000/4jP9gs1vMxz57HS3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261110_073501_416319_5A8F28BA 
X-CRM114-Status: UNSURE (   9.93  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -4.4 (----)
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-8.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	UNPARSEABLE_RELAY autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Five SPI controller drivers compute a clock divider from the transfer
speed without checking that it is non-zero.  A SPI device whose
max_speed_hz is zero (a DT node without spi-max-frequency, or a device
created through the spidev sysfs new_device interface without a speed)
therefore reaches the division with speed_hz == 0.  The SPI core clamps
such a device to the controller limit only when host->max_speed_hz is
set, and none of these five drivers sets it.

The series is organized by driver and is independent patch-by-patch;
each patch can be applied and reviewed on its own, and taking a subset
is fine:

  1/5 spi: sifive: clamp the clock divider to the register range
  2/5 spi: bcm63xx-hsspi: fix division by zero for devices without a max speed
  3/5 spi: bcmbca-hsspi: fix division by zero for devices without a max speed
  4/5 spi: apple: fix division by zero in clock divisor calculation
  5/5 spi: atmel: use the maximum divider for an unspecified speed

1/5 and 5/5 program the slowest clock directly when no speed is supplied;
2/5-4/5 clamp the requested rate to 1 Hz.  The division does not trap on
the SoCs these drivers run on: depending on the architecture it produces
a bogus divider, a zero quotient or an undefined value, so the patches
remove undefined arithmetic rather than a crash.

Changes in v2:
- 1/5: use the maximum SCKDIV for a zero speed and saturate an excessive
  divider instead of masking away the high bits (Mark Brown).
- 5/5: select SCBR=255 directly for a zero speed instead of dividing a
  substituted 1 Hz and then failing the range check (Mark Brown).
- 2/5, 3/5 and 4/5: unchanged.
- This series replaces the two standalone v2 patches posted on 10 Nov for
  1/5 and 5/5.
Link to v1: https://lore.kernel.org/all/20261106234751020Egf42VCVVlsSC_Msov4HO@zte.com.cn/

Shao Mingyin (5):
  spi: sifive: clamp the clock divider to the register range
  spi: bcm63xx-hsspi: fix division by zero for devices without a max speed
  spi: bcmbca-hsspi: fix division by zero for devices without a max speed
  spi: apple: fix division by zero in clock divisor calculation
  spi: atmel: use the maximum divider for an unspecified speed

 drivers/spi/spi-apple.c         | 6 +++++-
 drivers/spi/spi-atmel.c         | 5 ++++-
 drivers/spi/spi-bcm63xx-hsspi.c | 3 +++
 drivers/spi/spi-bcmbca-hsspi.c  | 3 +++
 drivers/spi/spi-sifive.c        | 9 ++++++---
 5 files changed, 21 insertions(+), 5 deletions(-)

---
base-commit: ddfe51b0a0f5dc9e415cc2c8ad8db17532dd426b

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
