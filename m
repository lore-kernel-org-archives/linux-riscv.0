Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A3E4C433EF
	for <linux-riscv@archiver.kernel.org>; Mon,  7 Mar 2022 15:37:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=mXH2WZ7bF4i1TpUfsktMq+Vib5o6uYpgzDkSqsG3lqY=; b=jRZo6cQNRsV1WG
	5Nq6aZrirh/udOQDbi+TZ62KU3nNYRo0aKYVRdUmMm9PuywAPhoa/DAkHKre9gLI9WBLELwp0gdY6
	Wwn7SeGq5uImhrP+XQXVzTL3Z4WTGNAcyscWDl31vCjpQIOPGvZC4KQFBhUqSWugE2U6i5bzTji/F
	f2nm8o+hgZKQga3D6Av/CjZv/JsiroqXd2b00PB59OzwAGjc2lEMmEO21WQnyWh8fTC6EdUxlJ0lR
	PQeTLZEhGSzxDwXN7Fn7F9UCSGdFjYXYPwWmjc0v92Ba5UxZpuU8EhMCefoPxOY/bF+RI67wP7q8T
	ANH5v2Wtr4u/AZTM7ZSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nRFQJ-000drt-Hg; Mon, 07 Mar 2022 15:37:23 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nRFQH-000drD-Dq
 for linux-riscv@lists.infradead.org; Mon, 07 Mar 2022 15:37:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1646667441; x=1678203441;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=HqBJCaUgOl4ABA5A2mBxWwr43jmzmLhKACc11IzWAck=;
 b=PKRyBnZg4zEYFSmbh6hSFNU8T8LCyoGrCIOajP8J3PQp9GlHRK5rCzU1
 lbNZ5vQ0uxivRHFyK0kdvJIXAYMZ2rOm6mGGtA1/SvRbleTVrrfauf6wP
 AgUDt+fluNOKmafzIKN7HFN8XbBMctMaRyk9bEr3534k9SSWGBmA7aWVA
 NrAXUOcfpIS/0W/6MJPazG4qXP/Lv/o+TsYXGelVYduN3Erud1U3755Oj
 rNvBfBvwtnajgv45uORETotx9M3Fuf8cj+Q5I0Sf2sGpuQhEBqdRTekQ6
 MRMV03rhxh5e93AwHpxp5uPHEMjXx4izBXrwM3Z7Ix5g8ZnIwHiNzdPux g==;
X-IronPort-AV: E=Sophos;i="5.90,162,1643698800"; d="scan'208";a="148340403"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa4.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 07 Mar 2022 08:37:19 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Mon, 7 Mar 2022 08:37:19 -0700
Received: from wendy.microchip.com (10.10.115.15) by chn-vm-ex04.mchp-main.com
 (10.10.85.152) with Microsoft SMTP Server id 15.1.2375.17 via
 Frontend Transport; Mon, 7 Mar 2022 08:37:18 -0700
From: <conor.dooley@microchip.com>
To: <mpm@selenic.com>, <herbert@gondor.apana.org.au>
CC: <lewis.hanly@microchip.com>, <linux-kernel@vger.kernel.org>,
 <linux-crypto@vger.kernel.org>, <linux-riscv@lists.infradead.org>, "Conor
 Dooley" <conor.dooley@microchip.com>
Subject: [PATCH 0/2] Add support for hwrng on PolarFire SoC
Date: Mon, 7 Mar 2022 15:40:22 +0000
Message-ID: <20220307154023.813158-1-conor.dooley@microchip.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220307_073721_571178_B338104D 
X-CRM114-Status: UNSURE (   9.06  )
X-CRM114-Notice: Please train this message.
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

As it says on the tin, add support for the hardware rng on PolarFire
SoC, which is accessed via the system controller. While we're at it,
add the rng driver to the list of files included as part of the SoC
support in MAINTAINERS.

Base commit is in arm/soc branch of the soc tree as the hwrng driver
depends on the system controller, which is to be introduced via that
tree in 5.18

Conor Dooley (2):
  hwrng: mpfs - add polarfire soc hwrng support
  MAINTAINERS: update PolarFire SoC support

 MAINTAINERS                       |   1 +
 drivers/char/hw_random/Kconfig    |  13 ++++
 drivers/char/hw_random/Makefile   |   1 +
 drivers/char/hw_random/mpfs-rng.c | 103 ++++++++++++++++++++++++++++++
 4 files changed, 118 insertions(+)
 create mode 100644 drivers/char/hw_random/mpfs-rng.c


base-commit: a483b1b232e616d0095a59b987ffc739bc1b56bc
-- 
2.35.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
