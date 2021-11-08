Return-Path: <SRS0=u9qy=P3=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 74DCFC4167D
	for <linux-riscv@archiver.kernel.org>; Mon,  8 Nov 2021 15:08:02 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 44F5461053
	for <linux-riscv@archiver.kernel.org>; Mon,  8 Nov 2021 15:08:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 44F5461053
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PXHOyraxgD72pKk0ena7axfB93DCEVe/nNVKHwQ1APM=; b=kk87oPRS+yqOxr
	dSl5yK426sCalY6xvJGrnRq7esZ9kNI5kdneEEXUkbI0kGdS9H+ZWwY2uslB8sUhbsNpj5uHp0eSM
	aT60+ph/DXeDleOm/6RccjJFErbYLDzRtlAqS9Xe123Dx06rOlcz+g+KqtBc6s28U+/vG55S+3+9x
	15y+ccKWhrihL3e42roG7XyooJRAaYexvnUkksDRzIj8H6cchgnKfqF8xAVZM21edQWvf7MaJolFE
	0+0jsAAX5DzJdUrSt79fXeNAjhtUQqXpkgZOvjwh0N3PZ2ZCnx4NQGfxbHy89G7JKTUXd4aQMvtqo
	00iRHDFapQcMI3RXvFPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mk6FX-00GmrA-9W; Mon, 08 Nov 2021 15:07:55 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mk6FT-00Gmks-9G
 for linux-riscv@lists.infradead.org; Mon, 08 Nov 2021 15:07:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1636384071; x=1667920071;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=zstF7h07gTp/nSKCbQQYFsltrxG1f82P+gEsZAQgpqk=;
 b=y1/Kqv1ZPJH0n9x0jGudhkw6A83agloA0HP9ohkiFB0rerC8KFI0DrCP
 j4K0TGSAF4mRb/8qH0BnJrf/fTcYEiyHDaVpbbEOV82tAlX/6LvE5JRUy
 64/FukJe7GVr0GcAgOPm9Tz4tnN4iTlnH92MDl9OezIiHCF2kj4MLOE1p
 qUPerdr0y7uoHTJnuuLkMjfju/4sZ0zhgmJJTKE4eKokDmMR1NfP06I9t
 UvASMeF67aIvKhA6IQ0lfpK4IvQQK+uI+v23X96Cx2N9OIedwB2ixkDjP
 6g7lEIP+CIZxgYVNcYkPclHhMmQtu2ddH+y1yW/j777M+IsLLk2DETigz g==;
IronPort-SDR: Eogmog9AAXgm4HnCJJNC5JQfchpBBEOXSO9Szw9Yd6IV1QVflnJrLHXeS92sou3QG5r9z3DAb0
 u/vPYB9PXTmDijeXfeSAE9Hw4D4QxiXyUiKC9SwSKVmc1uAhYqH7vf8zdmGoYTggva0kJsP7WW
 xE6IUll8rSK8YEXhlMRqt23eNZIlsvjl8CCURx7fsPBrrnRdUJfG8wKqpwRsLOg34SZRx07PTB
 7qRZ86+1cqR97sBJlnGgEoxG+SNGDATG2j6o5Iz8k1VKg4t6bzGcO1bfWINExTZ8NeOfVpmOcA
 yK/txlrGNY6Mc976wnSszjAU
X-IronPort-AV: E=Sophos;i="5.87,218,1631602800"; d="scan'208";a="138382872"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa2.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 08 Nov 2021 08:07:50 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Mon, 8 Nov 2021 08:07:49 -0700
Received: from wendy.microchip.com (10.10.115.15) by chn-vm-ex03.mchp-main.com
 (10.10.85.151) with Microsoft SMTP Server id 15.1.2176.14 via
 Frontend Transport; Mon, 8 Nov 2021 08:07:45 -0700
From: <conor.dooley@microchip.com>
To: <linus.walleij@linaro.org>, <bgolaszewski@baylibre.com>,
 <robh+dt@kernel.org>, <jassisinghbrar@gmail.com>, <paul.walmsley@sifive.com>, 
 <palmer@dabbelt.com>, <aou@eecs.berkeley.edu>, <a.zummo@towertech.it>,
 <alexandre.belloni@bootlin.com>, <broonie@kernel.org>,
 <gregkh@linuxfoundation.org>, <lewis.hanly@microchip.com>,
 <conor.dooley@microchip.com>, <daire.mcnamara@microchip.com>,
 <atish.patra@wdc.com>, <ivan.griffin@microchip.com>,
 <linux-gpio@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-i2c@vger.kernel.org>,
 <linux-riscv@lists.infradead.org>, <linux-crypto@vger.kernel.org>,
 <linux-rtc@vger.kernel.org>, <linux-spi@vger.kernel.org>,
 <linux-usb@vger.kernel.org>
CC: <krzysztof.kozlowski@canonical.com>, <geert@linux-m68k.org>,
 <bin.meng@windriver.com>
Subject: [PATCH 13/13] MAINTAINERS: update riscv/microchip entry
Date: Mon, 8 Nov 2021 15:05:54 +0000
Message-ID: <20211108150554.4457-14-conor.dooley@microchip.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211108150554.4457-1-conor.dooley@microchip.com>
References: <20211108150554.4457-1-conor.dooley@microchip.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211108_070751_415268_483C11EB 
X-CRM114-Status: UNSURE (   6.73  )
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

Update the riscv/microchip entry by adding the microchip dts
directory and myself as maintainer

Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 MAINTAINERS | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index ca6d6fde85cf..a0000ddd02fd 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -16077,8 +16077,10 @@ K:	riscv
 
 RISC-V/MICROCHIP POLARFIRE SOC SUPPORT
 M:	Lewis Hanly <lewis.hanly@microchip.com>
+M:	Conor Dooley <conor.dooley@microchip.com>
 L:	linux-riscv@lists.infradead.org
 S:	Supported
+F:	arch/riscv/boot/dts/microchip/
 F:	drivers/mailbox/mailbox-mpfs.c
 F:	drivers/soc/microchip/
 F:	include/soc/microchip/mpfs.h
-- 
2.33.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
