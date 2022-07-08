Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3FC92CCA482
	for <linux-riscv@archiver.kernel.org>; Fri,  8 Jul 2022 14:39:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=srPc1IusxLmnTVYfeG2LhVG4KtjrU+QNgQCui0AMz+Q=; b=AUgrg33+0bH5sv
	XuMxAWIDbcHOOYZI4vNO8s4sNi9eqqwRLv8wD8dB/1UyplVU4Nk1lOZ6/l/eysKz92vowpqFsBwxP
	KVXW2HeegwIGMCO1KcOI1MnoH9SbMYl/1rokYPmimQYdD+5iJYYiWpEOY88lbj6OXdzxt6qO7HztH
	IVhW7YofFZYsN9ZVC3tZsceddooJn47vfKvuT8Uzbt0anmdoXFEXI0kXKHBQhfVWqq/6o8boU0d6n
	k5GiGQ6JFw4OykmxibtoRYKfirqyltCspvboQozQf6ZZXHyO79v2h3WdgA56jeI5HkcJdIpaUE9qw
	vUiOE3a3tRlKKgznUo2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o9p8g-004B6t-DV; Fri, 08 Jul 2022 14:39:26 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o9p8d-004B69-MJ
	for linux-riscv@lists.infradead.org; Fri, 08 Jul 2022 14:39:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1657291163; x=1688827163;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=VbdXyRUiSQBioCAGfM5AjkhlSoNyma51Up4CyM2gg9A=;
  b=eyAcQdHQUqDJ2awOzHBfOevSMV/OdkkPo2cpa/SbS60pQy3EtjP7zNEm
   DTZmFru2YtLGfqGQYxGrtNfyBC0MB2oSoM4rA3ijLgblQhFhqlx8vAHB0
   rrFPbklCn2Owabeh0vIxDK5p0xxV40yD7c+RnaXXT4Np87WpISQn4+kw4
   OjvKshfBNaEk7IJljlEXy3zzSBS1rbjjt9Hq7GacgBpBHNsQ3xOgxXMsz
   W2xH6GxoNIiDu9j/WGQdEg6J4vapo/whLqYmYxZxOQARnaE4xxDB3ghdG
   71oOiYo1+eczuXNmK3Epu+gSNbpwHFzK39iFM+k1dTsxrwOV/1fG9p7NO
   g==;
X-IronPort-AV: E=Sophos;i="5.92,255,1650956400"; 
   d="scan'208";a="171611031"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa3.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 08 Jul 2022 07:39:22 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Fri, 8 Jul 2022 07:39:22 -0700
Received: from wendy.microchip.com (10.10.115.15) by chn-vm-ex03.mchp-main.com
 (10.10.85.151) with Microsoft SMTP Server id 15.1.2375.17 via Frontend
 Transport; Fri, 8 Jul 2022 07:39:20 -0700
From: Conor Dooley <conor.dooley@microchip.com>
To: Thierry Reding <thierry.reding@gmail.com>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>, "Lee
 Jones" <lee.jones@linaro.org>, Rob Herring <robh+dt@kernel.org>, "Krzysztof
 Kozlowski" <krzysztof.kozlowski+dt@linaro.org>
CC: Daire McNamara <daire.mcnamara@microchip.com>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-pwm@vger.kernel.org>, <linux-riscv@lists.infradead.org>, Conor Dooley
	<conor.dooley@microchip.com>
Subject: [PATCH v5 0/4] Microchip soft ip corePWM driver
Date: Fri, 8 Jul 2022 15:39:19 +0100
Message-ID: <20220708143923.1129928-1-conor.dooley@microchip.com>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220708_073923_750167_8CF3B4A8 
X-CRM114-Status: GOOD (  16.58  )
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

Hey Uwe, all,

Added some extra patches so I have a cover letter this time.
You pointed out that I was overriding npwmcells in the driver and I 
realised that the dt & binding were not correct so I have added two
simple patches to deal with that. The dts patch I will take in my tree
once the binding is applied.

For the maintainers entry, I mentioned before that I have several
changes in-flight for it. We are late(ish) in the cycle so I doubt
you'll be applying this for v5.20, but in the off chance you do - I
would be happy to send it (with your Ack) alongside an i2c addition
that is "deferred".

In your review of v3, you had a lot of comments about the period and
duty cycle calculations, so I have had another run at them. I converted
the period calculation to "search" from the bottom up for the suitable
prescale value. The duty cycle calculation has been fixed - the problem
was exactly what I suspected in my replies to your review. I had to block
the use of a 0xFF period_steps register value (which I think should be
covered by the updated comment and limitation #2).

Beyond that, I have rebased on -next and converted to the devm_ stuff
in probe that was recently added & dropped remove() - as requested.
I added locking to protect the period racing, changed the #defines and
switched to returning -EINVAL when the period is locked to a value
greater than that requested.

Thanks,
Conor.

Changes from v4:
- dropped some accidentally added files

Conor Dooley (4):
  dt-bindings: pwm: fix microchip corePWM's pwm-cells
  riscv: dts: fix the icicle's #pwm-cells
  pwm: add microchip soft ip corePWM driver
  MAINTAINERS: add pwm to PolarFire SoC entry

 .../bindings/pwm/microchip,corepwm.yaml       |   4 +-
 MAINTAINERS                                   |   1 +
 .../dts/microchip/mpfs-icicle-kit-fabric.dtsi |   2 +-
 drivers/pwm/Kconfig                           |  10 +
 drivers/pwm/Makefile                          |   1 +
 drivers/pwm/pwm-microchip-core.c              | 355 ++++++++++++++++++
 6 files changed, 371 insertions(+), 2 deletions(-)
 create mode 100644 drivers/pwm/pwm-microchip-core.c


base-commit: 088b9c375534d905a4d337c78db3b3bfbb52c4a0
-- 
2.36.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
