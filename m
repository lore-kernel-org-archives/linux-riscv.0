Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C5DBC00144
	for <linux-riscv@archiver.kernel.org>; Fri, 29 Jul 2022 11:11:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=jcTpz8guaRVRIONq/Xz1GDu5VqIoca0gswu6hza0vVY=; b=V/EjpYBJUfNy6K
	hGCHnQc18ylusyLWlOD5oOIQ+O+D8J3RvkcQdrL03X3jTMrxFP5EbIwca0KBqLDtVZznnE7DZQPZD
	xI7kCFnkyCHKDEXBAoFc2lbIPBah8da3R1PfE7bCrrG9cbdPzZ2aMRZQjSFLuYUbl22n6pDzDNgG4
	bAYrcI5Jx0Qzh7/1E8G/1tcaPwqYU6VxtceNtQD49c6wZs10JhC9LGQ2BtLm219i7PzqOjvs7RrMf
	MPk17NgwjnY8CoCn9zZnEpNN3sSRuE0NHv9k5bNJpGh8F/BqNcE8VN1M3Euo/DMRy2YhLI30SvW5J
	Qhjk6u9PalpO8LoGXvkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oHNuA-004L8b-88; Fri, 29 Jul 2022 11:11:42 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oHNu6-004L78-Qe
	for linux-riscv@lists.infradead.org; Fri, 29 Jul 2022 11:11:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1659093099; x=1690629099;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=RgSFa9oE3+JTu9GhXjJ/wL49wBg3BPs0f4VE4aUqX0k=;
  b=RnvLgIE4JEKo2spSM2JbXrsKjtj7WioDo2pv529AlGB4Jw0BJrX9AKbq
   jOgJWx+pB45rmP39R0b9Y/DZD2LKpT682frSHcwnLPSDAuW6ch7vPDgB8
   I2TXll6HEv+usodog5YTGSNkNa55u28zDgQarE2mocM8XNETbGU8bR6+V
   gasvLd24S9ySKMgDkeRNltKRLh2YqP707Bv1prQBdaZHAuka3GAU7y0iZ
   JI1sOFNo+Dd+qRgue1hx7xx4HN7o0X+nvy3GVtTNZtM5SfiIrttdNBTXx
   aEqfWonQ08iY9f7vYAeU9pq/G53TjprIGkT4z/DKX0dEMgHL3INDmf7z3
   Q==;
X-IronPort-AV: E=Sophos;i="5.93,201,1654585200"; 
   d="scan'208";a="166948905"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa4.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 29 Jul 2022 04:11:31 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28; Fri, 29 Jul 2022 04:11:30 -0700
Received: from wendy.microchip.com (10.10.115.15) by chn-vm-ex02.mchp-main.com
 (10.10.85.144) with Microsoft SMTP Server id 15.1.2375.17 via Frontend
 Transport; Fri, 29 Jul 2022 04:11:29 -0700
From: Conor Dooley <conor.dooley@microchip.com>
To: <aou@eecs.berkeley.edu>, <palmer@dabbelt.com>, <paul.walmsley@sifive.com>,
	<linux-riscv@lists.infradead.org>
CC: <conor.dooley@microchip.com>, <samuel@sholland.org>,
	<dfustini@baylibre.com>
Subject: [PATCH] riscv: enable software resend of irqs
Date: Fri, 29 Jul 2022 12:11:17 +0100
Message-ID: <20220729111116.259146-1-conor.dooley@microchip.com>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220729_041139_001586_2DB5F8F5 
X-CRM114-Status: UNSURE (   4.93  )
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

The PLIC specification does not describe the interrupt pendings bits as
read-write, only that they "can be read". To allow for retriggering of
interrupts (and the use of the irq debugfs interface) enable
HARDIRQS_SW_RESEND for RISC-V.

Link: https://github.com/riscv/riscv-plic-spec/blob/master/riscv-plic.adoc#interrupt-pending-bits
Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 arch/riscv/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index 55d2cc458ace..d8a132426c64 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -69,6 +69,7 @@ config RISCV
 	select GENERIC_SMP_IDLE_THREAD
 	select GENERIC_TIME_VSYSCALL if MMU && 64BIT
 	select GENERIC_VDSO_TIME_NS if HAVE_GENERIC_VDSO
+	select HARDIRQS_SW_RESEND
 	select HAVE_ARCH_AUDITSYSCALL
 	select HAVE_ARCH_JUMP_LABEL if !XIP_KERNEL
 	select HAVE_ARCH_JUMP_LABEL_RELATIVE if !XIP_KERNEL
-- 
2.36.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
