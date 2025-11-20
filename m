Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0482CF9C46
	for <linux-riscv@archiver.kernel.org>; Thu, 20 Nov 2025 16:26:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=QogR5eWk5XuPwLQfnkADFs/z+YKN9E4bIUDsGWA9XM4=; b=Iro0qtW0Xc4gn9
	wdSj4peIbG5feA+fohuZhQTF3A9TgDDs69ZSuG6qxZkKVtokFOsE+iputS/JMO1f7wys0+VtDQY6W
	42XEv/O6R9SUk4ks+jjsw8Arx9apfiLdAhOmMIHSsUGtgFBulVcicG+FRQC5up5tFvz3bmNazFiQp
	3rfWz0uFyoXcEIpEZ7WJlXoSAsvw8NSu6CYtn6WFNr3ftrYSwtIclgXLG8TDFZE8WIT0GNMLzrv5S
	LbQ25E1rX2cYPS/XLCStQFLZrfW/eWFiLOXUwgNL4lzKgw9U9iSpS8fb/mINMFfGm0kEfohH5Odmf
	ZWANpM8DD15G+z2r2ohg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vM7UI-000000070KI-09iY;
	Thu, 20 Nov 2025 16:26:26 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vM7UH-000000070KC-0wUS
	for linux-riscv@lists.infradead.org;
	Thu, 20 Nov 2025 16:26:25 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id A45A26018D;
	Thu, 20 Nov 2025 16:26:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1BC7DC4CEF1;
	Thu, 20 Nov 2025 16:26:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763655984;
	bh=VFdInjZuW8OVQiLkoQCYxSWVELFFX1f2xoZR+vgdiIw=;
	h=From:To:Cc:Subject:Date:From;
	b=tf2LQc7tA04gQGgvkm/rquhCfdao5lWhMFfhT/OVF9qZfqyKal2H4XrPvPY7cBvGU
	 2/Gg3sUIVgcm3onQBVwS2QtV2D2YJPNHIag3498gJx/laWYwDQhslLOGzl0MNLqfEf
	 /QrTcUlQiCM4So6LkPvFQ+w4eDAjCQdTzwItxNI/jQsJzED0JnbnlBFNtiGs2JMZr5
	 Pw8N1t5eCjn7vBOVoLDMQkAq0/4QWFgNIAfQEuIdDaTxVg+ciVA8QwmSdtstFAhTAC
	 Z5xs7WhcnIrtlkAkLBHXK4Cs80FRlyXHmSAWCwinfPY70SLAHK/ED5rC8xU0/Oegf6
	 WvuPtG1XF+xpA==
From: Conor Dooley <conor@kernel.org>
To: netdev@vger.kernel.org
Cc: conor@kernel.org,
	Conor Dooley <conor.dooley@microchip.com>,
	Valentina.FernandezAlanis@microchip.com,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Daire McNamara <daire.mcnamara@microchip.com>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Richard Cochran <richardcochran@gmail.com>,
	Samuel Holland <samuel.holland@sifive.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Neil Armstrong <narmstrong@baylibre.com>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Sean Anderson <sean.anderson@linux.dev>,
	Vineeth Karumanchi <vineeth.karumanchi@amd.com>,
	Abin Joseph <abin.joseph@amd.com>
Subject: [RFC net-next v1 0/7] highly rfc macb usrio/tsu patches
Date: Thu, 20 Nov 2025 16:26:02 +0000
Message-ID: <20251120-jubilant-purposely-67ec45ce4e2f@spud>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3020; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=5P1WlSNu7vavYPtiBZgecbAqHDhNnltvncSBgQUxKPc=; b=owGbwMvMwCVWscWwfUFT0iXG02pJDJnyjlKRNizRgupP0tfyCTdsPvN6QY+JWPthE9EzN/YVL KkUZb/ZUcrCIMbFICumyJJ4u69Fav0flx3OPW9h5rAygQxh4OIUgInc2cjwz/yx4r1V/3bs//wq LGyTmNBKTx2d+E+H7mX+Sbf7wS+bkMjIcKhVi+Hsq5/H5pumdj1Y5bt32b7V69vNja7lnxe3XmF 5gQcA
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

From: Conor Dooley <conor.dooley@microchip.com>

Hey folks,

After doing some debugging of broken tsu/ptp support on mpfs, I've come
up with some very rfc patches that I'd like opinions on - particularly
because they impact a bunch of platforms that I have no access to at all
and have no idea how they work. The at91 platforms I can just ask
Nicolas about (and he already provided some info directly, so I'm not
super worried at least about the usrio portion there) but the others
my gut says are likely incorrect in the driver at the moment.

These patches *are* fairly opinionated and not necessarily technically
correct or w/e. The only thing I am confident in saying that they are is
more deliberate than what's being done at the moment.

At the very least, it'd be good of the soc vendor folks could check
their platforms and see if their usrio stuff actually lines up with what
the driver currently calls "macb_default_usrio". Ours didn't and it was
a nasty surprise.

Cheers,
Conor.

CC: Valentina.FernandezAlanis@microchip.com
CC: Andrew Lunn <andrew+netdev@lunn.ch>
CC: David S. Miller <davem@davemloft.net>
CC: Eric Dumazet <edumazet@google.com>
CC: Jakub Kicinski <kuba@kernel.org>
CC: Paolo Abeni <pabeni@redhat.com>
CC: Rob Herring <robh@kernel.org>
CC: Krzysztof Kozlowski <krzk+dt@kernel.org>
CC: Conor Dooley <conor+dt@kernel.org>
CC: Daire McNamara <daire.mcnamara@microchip.com>
CC: Paul Walmsley <pjw@kernel.org>
CC: Palmer Dabbelt <palmer@dabbelt.com>
CC: Albert Ou <aou@eecs.berkeley.edu>
CC: Alexandre Ghiti <alex@ghiti.fr>
CC: Nicolas Ferre <nicolas.ferre@microchip.com>
CC: Claudiu Beznea <claudiu.beznea@tuxon.dev>
CC: Richard Cochran <richardcochran@gmail.com>
CC: Samuel Holland <samuel.holland@sifive.com>
CC: netdev@vger.kernel.org
CC: devicetree@vger.kernel.org
CC: linux-kernel@vger.kernel.org
CC: linux-riscv@lists.infradead.org
CC: Neil Armstrong <narmstrong@baylibre.com>
CC: Dave Stevenson <dave.stevenson@raspberrypi.com>
CC: Sean Anderson <sean.anderson@linux.dev>
CC: Vineeth Karumanchi <vineeth.karumanchi@amd.com>
CC: Abin Joseph <abin.joseph@amd.com>

Conor Dooley (7):
  riscv: dts: microchip: add tsu clock to macb on mpfs
  net: macb: warn on pclk use as a tsu_clk fallback
  net: macb: rename macb_default_usrio to at91_default_usrio as not all
    platforms have mii mode control in usrio
  net: macb: np4 doesn't need a usrio pointer
  dt-bindings: net: macb: add property indicating timer adjust mode
  net: macb: afaict, the driver doesn't support tsu timer adjust mode
  net: macb: add mpfs specific usrio configuration

 .../devicetree/bindings/net/cdns,macb.yaml    |  15 +++
 arch/riscv/boot/dts/microchip/Makefile.orig   |  26 ++++
 arch/riscv/boot/dts/microchip/mpfs.dtsi       |   8 +-
 drivers/net/ethernet/cadence/macb.h           |   3 +
 drivers/net/ethernet/cadence/macb_main.c      | 123 +++++++++++-------
 5 files changed, 125 insertions(+), 50 deletions(-)
 create mode 100644 arch/riscv/boot/dts/microchip/Makefile.orig

-- 
2.51.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
