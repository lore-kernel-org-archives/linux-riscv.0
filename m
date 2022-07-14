Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B958C43334
	for <linux-riscv@archiver.kernel.org>; Thu, 14 Jul 2022 08:03:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=lmVFIHSBEHRfgBQEqpMYRUm0Cw0wuxQ9xXwEqz2h80U=; b=IalB5Rh+QBfX77
	RenUDfbus2bANA/4mdNLbKFsaoiD01mAhWn2EzP1CaERX9zDmkywbVdI5Yw8HNZjAn03u6fLFsx4k
	R+3F8qc1+0ZUTJ7AAwiZ6DUxy4i+noI21YGYd6h14fZs9IDUryz0oJEnpH36PG45h/4U7BWixLUuc
	+EG1Ch9yuh2Mg6ESrFMAbbxx8FMO3L3EAjEL+H0nkyDTpqwIkxiBxca4aQ4utoDkd5xvwnvJziYjv
	Bg7R1aiHFzUDwRM56a1GzSdao6lI90vUhHnbz0nHxJDZqBf4C4Au0yb+LIyUCp1R3X729sKqPwRWc
	/2h9R8Q68x47ErCrx//g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oBtoV-00C9Tz-6D; Thu, 14 Jul 2022 08:03:11 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oBtoR-00C9Rt-FM
	for linux-riscv@lists.infradead.org; Thu, 14 Jul 2022 08:03:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1657785787; x=1689321787;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=flmEbbHtH64y5bEmBPWo/m2F0akTKTLjBiP5tcJGFFU=;
  b=JuR/Mw8CCcErmhqacKdzgJRwkBxvsgSSke5Wjz25ulPivY35qUriFGgG
   DqXIJNSpL9FrOsFTz3rr1ILR5ADDu1uY+5KtS/PosPS6VNiFSAsu18BsJ
   RS/wnR2aNYZyUhEFoRv/IPigkG/1XXQvLUuiArUUvcNrnAXWOs6+pmHxz
   z7MLv/M3eDHogC6BSKZ8vjNKRW86ffD4QWyGBsn4cTRmaUDa2/WPY1uuh
   qgt1sR3f/kW3GqIDrBag17I131GFH7dYlnN+jVjh9NK5NzIOV1WedRKtz
   65pZ5tuzG/nBSc5zAKtUiBZsmXSC1BQ+zEQ36TzYf/XodjFWefu8pCACt
   w==;
X-IronPort-AV: E=Sophos;i="5.92,269,1650956400"; 
   d="scan'208";a="167789670"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa2.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 14 Jul 2022 01:03:06 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Thu, 14 Jul 2022 01:03:03 -0700
Received: from wendy.microchip.com (10.10.115.15) by chn-vm-ex03.mchp-main.com
 (10.10.85.151) with Microsoft SMTP Server id 15.1.2375.17 via Frontend
 Transport; Thu, 14 Jul 2022 01:03:00 -0700
From: Conor Dooley <conor.dooley@microchip.com>
To: <aou@eecs.berkeley.edu>, <linux-riscv@lists.infradead.org>,
	<palmer@dabbelt.com>, <paul.walmsley@sifive.com>
CC: <conor.dooley@microchip.com>, <ben.dooks@sifive.com>,
	<jude.onyenegecha@sifive.com>, <atishp@rivosinc.com>, <anup@brainfault.org>,
	<sudip.mukherjee@sifive.com>
Subject: [PATCH v2] riscv: ensure cpu_ops_sbi is declared
Date: Thu, 14 Jul 2022 09:02:36 +0100
Message-ID: <20220714080235.3853374-1-conor.dooley@microchip.com>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220714_010307_601495_A9EBA14F 
X-CRM114-Status: UNSURE (   7.50  )
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

A trailing > broke the CC list, resending as v2 with just the CC
list fixed.

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
