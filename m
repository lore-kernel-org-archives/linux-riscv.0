Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 425E7C433F5
	for <linux-riscv@archiver.kernel.org>; Fri, 17 Dec 2021 09:34:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8onp031gFEFQw7c3NCiE7c5wHavWyPT5hk/dTvXBAlU=; b=GrOtYnQX/V2wIU
	Cwqxkl3M8XVEchtnlspGnuvbjaYDdN0aLbjz5VHujbtSiFAF9rMqjQLrocreD7+dROzLCUq79Jgte
	eTJ2FLdjyMyqCHmR1UilPADtLbuJrdhTZ8rkxtFmikD9OJW5um5kDsUoc4EvQmpGw+JHyl6S+cGMM
	Ae8ce49uIM7RXDF7fFjXnZZ0w6nybh/yFfySO645LhqHV77fqTVYfKlnzG9lFzPSMWPLU9ZVIpBSa
	A2RFbugEbY0JWft+l2BnEKKvp6Lf6CZIF0oN73+wpercDSicYVyuyw+JoxsKUenGb4HTtix0ntaFz
	1U0J8YLxa7vgJDKHe7uw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1my9dP-009C9U-U7; Fri, 17 Dec 2021 09:34:39 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1my9cp-009Bkq-Tl
 for linux-riscv@lists.infradead.org; Fri, 17 Dec 2021 09:34:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1639733645; x=1671269645;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=TDibzwXp0/AuHXb5O6QBcMvGLoIDWdV4nhrP4ikiYgs=;
 b=IcJDN+RGDIVzS9VxUo0YVwzZJaPpUvMkGkMripa+z2MZabshIe5SSnqJ
 IQESsW87UvB6HfglIhN0stn5sSe/31Re2Fr0FZGVpT1kJTUTbbkjAP3Mh
 IDUoUs0olc0wHQJ9Rn+tB5dovDxGzxEAlEktema0KmfBqh58u+VaUe8wJ
 FnLFVgfL4YMgN/yjisbKY2U5v9Opws05QhKK2JB7gTbOhoXFEged+HZI5
 TXayCCe9vhz6hXkxvlW8MNMkJYQWZa4wpfQFpEgqBGoZcLYrrZIqVvVVZ
 k58AaPy289+TCzDWsHF53S2m70ra5BiPTLrieP5mkbfn27ep4i1HrU2iz A==;
IronPort-SDR: r1QESrmcOCK5lUf5FF6Gn0Cql1Ju+0e+9pZAOvhWsVIpc52P6vwGhXUymrsWdqF1jX4k/QdndF
 Sy/niIGR57CRxg5z1cy+Nx6swWGhVFT6P4RFjvMFyzx3TvL3T6UO5psIi78fznxYe9q2yzdcpy
 AQ/SWYg0GxxlJgy1IGAmshJykmCdYOlcmUanjXVQTIPsvRWsNpoaccNsP+Idg947VedbAYNMOZ
 rFEtcMMdUtTthvbYj+OHtUwaryWPyPjPgXMhLCSRXX0KHuiqbmvw4k7br64xgN9fXZzAm7ynAC
 JLlvSXfyiW3hjvThwnRZs8P7
X-IronPort-AV: E=Sophos;i="5.88,213,1635231600"; d="scan'208";a="147002811"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa5.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 17 Dec 2021 02:34:03 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Fri, 17 Dec 2021 02:34:00 -0700
Received: from wendy.microchip.com (10.10.115.15) by chn-vm-ex01.mchp-main.com
 (10.10.85.143) with Microsoft SMTP Server id 15.1.2375.17 via
 Frontend Transport; Fri, 17 Dec 2021 02:33:54 -0700
From: <conor.dooley@microchip.com>
To: <linus.walleij@linaro.org>, <bgolaszewski@baylibre.com>,
 <robh+dt@kernel.org>, <jassisinghbrar@gmail.com>, <paul.walmsley@sifive.com>, 
 <palmer@dabbelt.com>, <aou@eecs.berkeley.edu>, <a.zummo@towertech.it>,
 <alexandre.belloni@bootlin.com>, <broonie@kernel.org>,
 <gregkh@linuxfoundation.org>, <thierry.reding@gmail.com>,
 <u.kleine-koenig@pengutronix.de>, <lee.jones@linaro.org>,
 <linux-gpio@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-i2c@vger.kernel.org>,
 <linux-pwm@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
 <linux-crypto@vger.kernel.org>, <linux-rtc@vger.kernel.org>,
 <linux-spi@vger.kernel.org>, <linux-usb@vger.kernel.org>
CC: <krzysztof.kozlowski@canonical.com>, <geert@linux-m68k.org>,
 <bin.meng@windriver.com>, <heiko@sntech.de>, <lewis.hanly@microchip.com>,
 <conor.dooley@microchip.com>, <daire.mcnamara@microchip.com>,
 <ivan.griffin@microchip.com>, <atish.patra@wdc.com>
Subject: [PATCH v2 17/17] MAINTAINERS: update riscv/microchip entry
Date: Fri, 17 Dec 2021 09:33:25 +0000
Message-ID: <20211217093325.30612-18-conor.dooley@microchip.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211217093325.30612-1-conor.dooley@microchip.com>
References: <20211217093325.30612-1-conor.dooley@microchip.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211217_013404_045941_619AC9CB 
X-CRM114-Status: UNSURE (   6.14  )
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

Update the RISC-V/Microchip entry by adding the microchip dts
directory and myself as maintainer

Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 MAINTAINERS | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 7a2345ce8521..3b1d6be7bd56 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -16348,8 +16348,10 @@ K:	riscv
 
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
