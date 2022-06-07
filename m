Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16BD8C433EF
	for <linux-riscv@archiver.kernel.org>; Tue,  7 Jun 2022 08:47:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=XTcVViJ+f873EZR6AFjTalThVebEAclv0v6aZwapRKc=; b=gElT4RxmmU8MGm
	XMapbhD3zj38lM0mTivHg7b/vUfqF46z7M7S2vACTklKBSUC/OxzTDGibSj03CBRGPKxcCxielks8
	5x+Il844/yWMDDQqoXm3hpVG3Kow10P2RFmNMZ4kmuvf/egIfqjCwnIUympdByPGZWPablCIkZJ0P
	SW8ZTV2lLTfLXv01ITSvifVIlCmCyANXSUYVbI29fS1Kdy5yuGV7mV54uc86lKOQ+3J+PbIFOoeyQ
	JktFm7DC26BqjJQ1FxUVYFU0fD6RNbQAF7wIOzA6qdgRs2BTG+AkmJQ4wZGV1MNdDzs+AkWBfPxTB
	cPQosI2Ig0INL84WA5fQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nyUsA-005tVh-CG; Tue, 07 Jun 2022 08:47:34 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nyUs7-005tTP-3S
	for linux-riscv@lists.infradead.org; Tue, 07 Jun 2022 08:47:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1654591652; x=1686127652;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=3CoKXSna6CTgje4u/qjkWGKm+Bb40J2h4l6CX9UJM+0=;
  b=caIfxRHv3WriaXidgdXu8uJExQ+zcv4R4G3AVW+TVMhiI5WIfL2bEgfk
   mdC9ZenTFPC5dnq0+VFvVszi1nDgRtUnKfbzmEPoYoGhfSZZVqVJ08dfM
   LBgsR5pNZefZ3+F9gN5IbDe3LqcUHOcBy2MGBUSUt/EWgpkw5GpP3NABw
   4VNhX1hWjTirj5kHpokYGBfIaYxkOTPFsjXHQQlvSrd4QnbdX8T2W6WpD
   v7n0pJhs0zrn//sasbIKsqXmveD6pSwODHxKHYtAjHjBxexVhL5vHf/Ly
   /CHUsUKLIFqxIWgLxqTxzJyteNWz6h6zW2zV2Y7f6nsd8weVNpNOE8BIX
   Q==;
X-IronPort-AV: E=Sophos;i="5.91,283,1647327600"; 
   d="scan'208";a="167052009"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa5.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 07 Jun 2022 01:47:31 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Tue, 7 Jun 2022 01:47:29 -0700
Received: from wendy.microchip.com (10.10.115.15) by chn-vm-ex03.mchp-main.com
 (10.10.85.151) with Microsoft SMTP Server id 15.1.2375.17 via Frontend
 Transport; Tue, 7 Jun 2022 01:47:27 -0700
From: Conor Dooley <conor.dooley@microchip.com>
To: Thierry Reding <thierry.reding@gmail.com>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>, "Lee
 Jones" <lee.jones@linaro.org>
CC: Daire McNamara <daire.mcnamara@microchip.com>,
	<linux-kernel@vger.kernel.org>, <linux-pwm@vger.kernel.org>,
	<linux-riscv@lists.infradead.org>, Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH 0/2] Add support for Microchip's pwm fpga core
Date: Tue, 7 Jun 2022 09:45:50 +0100
Message-ID: <20220607084551.2735922-1-conor.dooley@microchip.com>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220607_014731_243734_86831CAE 
X-CRM114-Status: UNSURE (   7.56  )
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

Hey all,
Small series here, adding a driver for the "soft" pwm IP core
for microchip FPGAs. The binding for them was already added
in 5.18.
Thanks,
Conor.

Conor Dooley (2):
  pwm: add microchip soft ip corePWM driver
  MAINTAINERS: add pwm to PolarFire SoC entry

 MAINTAINERS                      |   1 +
 drivers/pwm/Kconfig              |  10 ++
 drivers/pwm/Makefile             |   1 +
 drivers/pwm/pwm-microchip-core.c | 289 +++++++++++++++++++++++++++++++
 4 files changed, 301 insertions(+)
 create mode 100644 drivers/pwm/pwm-microchip-core.c

-- 
2.36.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
