Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60339C43334
	for <linux-riscv@archiver.kernel.org>; Thu, 14 Jul 2022 08:01:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=uOvD9XA7wOi6CeV2tIgKOxNNV6xULiZa2+85+7hQtuU=; b=FnkKMLjR+pKBgK
	vgcOGCChbNbshX2yPkuhHSDTU9B1t+0sRTyQLQqBPkZZ4zIiX63P5adOJHD/qmaLaufq5UFSy11SR
	PMjaa/XpylZNSV7q/iHAB+vA0IV4wEd95regQGN0HQquCuHXyIAVVY38+87YTA9NZ2FCB23h1eqlC
	HYC+NEcprrIg6kQMN+WJjOQjN3IRrzU6//cpW1ciDAQHD0Z7Nf19QjEvZ4St5F7ldfuRPyr40TUKY
	HKOzFw7XREOPm12q+vQ6LPz189CWqPZ0iaFfvuEVHN03ECDRDTdiWfUgRm/dUErpPKLYxbs6oz6cC
	x5L5skpt9o0TXtkcalAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oBtmL-00C89C-KT; Thu, 14 Jul 2022 08:00:57 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oBtmG-00C853-0x
	for linux-riscv@lists.infradead.org; Thu, 14 Jul 2022 08:00:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1657785651; x=1689321651;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=ezHH08ZJoHqMKA1HP3S+d/8YzMZKMJEJHkyWdOyCAo4=;
  b=nuijspzxWQbrfq5FTfMOS6lM40YiolcTFgy3sgHQPaVdu9Mh0owDmDnm
   2qiimEl2ile8f2OZoWD1Day0wHBtDRg653tpGLyzVIdhA8EbPKiI+34W+
   HuXXvlksUq6Fd2aujAclD2YWZYaiiET2CI4+XCtqVFfDmj0Uv/INzAz11
   OivNldncbQKtK3CalLm5bwKmzoln0ozJxSUT3loFvvZJ0GP85PlgiKdxw
   MZK27fzb/ihquzcsEokjU1NTVnUkj39smL8NY4S6YFfxnPyU0rsa6O+8X
   AB98U4aKHQfiUjAPPHYVIfTrT4ePiiGgGf9VfU5+v2Xm8+Pv4R5snVQVW
   w==;
X-IronPort-AV: E=Sophos;i="5.92,269,1650956400"; 
   d="scan'208";a="104419031"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 14 Jul 2022 01:00:50 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Thu, 14 Jul 2022 01:00:50 -0700
Received: from wendy.microchip.com (10.10.115.15) by chn-vm-ex01.mchp-main.com
 (10.10.85.143) with Microsoft SMTP Server id 15.1.2375.17 via Frontend
 Transport; Thu, 14 Jul 2022 01:00:48 -0700
From: Conor Dooley <conor.dooley@microchip.com>
To: <aou@eecs.berkeley.edu>, <linux-riscv@lists.infradead.org>,
	<palmer@dabbelt.com>, <paul.walmsley@sifive.com>
CC: <conor.dooley@microchip.com>, <ben.dooks@sifive.com>,
	<jude.onyenegecha@sifive.com>, <atishp@rivosinc.com>
Subject: [PATCH] riscv: ensure cpu_ops_sbi is declared
Date: Thu, 14 Jul 2022 09:00:57 +0100
Message-ID: <20220714080057.3852364-1-conor.dooley@microchip.com>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220714_010052_155198_24F12F46 
X-CRM114-Status: UNSURE (   6.97  )
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

Sparse complains that cpu_ops_sbi is used undeclared:
arch/riscv/kernel/cpu_ops_sbi.c:17:29: warning: symbol 'cpu_ops_sbi' was not declared. Should it be static?

Fix the warning by adding cpu_ops_sbi to cpu_ops_sbi.h & including that
where used.

Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 arch/riscv/include/asm/cpu_ops_sbi.h | 2 ++
 arch/riscv/kernel/cpu_ops.c          | 1 +
 2 files changed, 3 insertions(+)

diff --git a/arch/riscv/include/asm/cpu_ops_sbi.h b/arch/riscv/include/asm/cpu_ops_sbi.h
index 56e4b76d09ff..d6e4665b3195 100644
--- a/arch/riscv/include/asm/cpu_ops_sbi.h
+++ b/arch/riscv/include/asm/cpu_ops_sbi.h
@@ -10,6 +10,8 @@
 #include <linux/sched.h>
 #include <linux/threads.h>
 
+extern const struct cpu_operations cpu_ops_sbi;
+
 /**
  * struct sbi_hart_boot_data - Hart specific boot used during booting and
  *			       cpu hotplug.
diff --git a/arch/riscv/kernel/cpu_ops.c b/arch/riscv/kernel/cpu_ops.c
index 170d07e57721..916b71f5dfb9 100644
--- a/arch/riscv/kernel/cpu_ops.c
+++ b/arch/riscv/kernel/cpu_ops.c
@@ -9,6 +9,7 @@
 #include <linux/string.h>
 #include <linux/sched.h>
 #include <asm/cpu_ops.h>
+#include <asm/cpu_ops_sbi.h>
 #include <asm/sbi.h>
 #include <asm/smp.h>
 
-- 
2.36.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
