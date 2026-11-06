Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 744F8606A32F
	for <linux-riscv@archiver.kernel.org>; Fri,  6 Nov 2026 15:48:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=zP9Qm942
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:Cc:To:From:Mime-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=Ly9Vix9G+e3t0k8OAc7XjZF40XW9UaBicHGBl9KE/Hg=; b=zP9Qm942kWSKqGeOPABl/QEFGv
	nxFTJGUXnwc4QlXHFo2eY0pjhbkvPjXu2INfV3l8/SKUemvO/LBVaehMnC4pLdawul3ZVZZd6svvr
	vXUBsvQK5988zLE1r9namL39dgKAT7DiE7GGIdhXNwvd+yFN9ZTHM7dnVhsbLTsuXoGjQa8J0W2Oo
	Yrs4P60NZ02RaGSUbV/JiqfyvVi4+4HaMl3wb7nlssB5WxDbWAcm386VnX0QZtzPho0RKlAzlgufB
	Bw2WNkBB5fdDYYd1VvcClMm/Nfm1pIwHdv7eeQydSxTeiZ+TYR4eByJ+QT2LZyuCsNiq4sP9NLy9L
	QvRX/ipg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPMAc-0000000CtOg-09fr;
	Fri, 06 Nov 2026 15:48:02 +0000
Received: from mxhk.zte.com.cn ([160.30.148.34])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPMAZ-0000000CtMp-053s;
	Fri, 06 Nov 2026 15:48:01 +0000
Received: from mse-fl1.zte.com.cn (unknown [10.5.228.132])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mxhk.zte.com.cn (FangMail) with ESMTPS id 4jLk8q5Qxvz5B12h;
	Fri, 06 Nov 2026 23:47:55 +0800 (CST)
Received: from xaxapp04.zte.com.cn ([10.99.98.157])
	by mse-fl1.zte.com.cn with SMTP id 6A6FlljR080906;
	Fri, 6 Nov 2026 23:47:47 +0800 (+08)
	(envelope-from shao.mingyin@zte.com.cn)
Received: from mapi (xaxapp02[null])
	by mapi (Zmail) with MAPI id mid32;
	Fri, 6 Nov 2026 23:47:51 +0800 (CST)
X-Zmail-TransId: 2afa6aedf6a75dc-a6563
X-Mailer: Zmail v1.0
Message-ID: <20261106234751020Egf42VCVVlsSC_Msov4HO@zte.com.cn>
Date: Fri, 6 Nov 2026 23:47:51 +0800 (CST)
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
Subject: =?UTF-8?B?W1BBVENIIDAvNV0gc3BpOiBmaXggZGl2aXNpb24gYnkgemVybyB3aXRoIGEgemVybyB0cmFuc2ZlciBzcGVlZA==?=
X-MAIL: mse-fl1.zte.com.cn 6A6FlljR080906
X-TLS: YES
X-ENVELOPE-SENDER: shao.mingyin@zte.com.cn
X-SOURCE-IP: 10.5.228.132 unknown Fri, 06 Nov 2026 23:47:55 +0800
X-CLEAN: YES
X-Fangmail-Anti-Spam-Filtered: true
X-Fangmail-MID-QID: 6AEDF6AB.000/4jLk8q5Qxvz5B12h
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261106_074759_846489_F6270F05 
X-CRM114-Status: UNSURE (   8.23  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -1.9 (-)
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

  1/5 spi: sifive: fix division by zero in clock divisor calculation
  2/5 spi: bcm63xx-hsspi: fix division by zero for devices without a max speed
  3/5 spi: bcmbca-hsspi: fix division by zero for devices without a max speed
  4/5 spi: apple: fix division by zero in clock divisor calculation
  5/5 spi: atmel: fix division by zero when transfer speed is zero

All five clamp the divisor to 1 Hz, the same approach as the recent
spi-jcore fix.  The division does not trap on the SoCs these drivers run
on: depending on the architecture it produces a bogus divider, a zero
quotient or an undefined value, so the patches remove undefined
arithmetic rather than a crash.

Shao Mingyin (5):
  spi: sifive: fix division by zero in clock divisor calculation
  spi: bcm63xx-hsspi: fix division by zero for devices without a max speed
  spi: bcmbca-hsspi: fix division by zero for devices without a max speed
  spi: apple: fix division by zero in clock divisor calculation
  spi: atmel: fix division by zero when transfer speed is zero

 drivers/spi/spi-apple.c         | 6 +++++-
 drivers/spi/spi-atmel.c         | 3 ++-
 drivers/spi/spi-bcm63xx-hsspi.c | 3 +++
 drivers/spi/spi-bcmbca-hsspi.c  | 3 +++
 drivers/spi/spi-sifive.c        | 6 +++++-
 5 files changed, 18 insertions(+), 3 deletions(-)

---
base-commit: 7649ba73f9e7e1e04d0b46213e39c79ae09dd55c

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
