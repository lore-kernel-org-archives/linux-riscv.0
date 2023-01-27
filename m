Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80B5FC54EAA
	for <linux-riscv@archiver.kernel.org>; Fri, 27 Jan 2023 09:11:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tC0XecHjT3yVoaw6wWQRJY/UBsDkpzHFOrlvVS8utsU=; b=XzWgQsVsXxM7eY
	1sxLDS5zIX7J5RH+QKJn4TNR6OdTCVEVU8SpSNwehlk4oetlhcYFBS73BPqwpmV3Nv4hONplqhPUC
	snT8Q98jgikYi4hsabl20ezJ1zAaaoJ5HODZ/0LJWFdjhoDP0TW4fGQg0G48k77eAjj9RwJVp0jWB
	AU1sWvNhpgoxTfLd4xYz8Lew98UpT1gwxzYjlCiBH17befS6FG0aWJueACY9v7ZKD8UM9sZeYWYVG
	FAaiHI8yKW1yVl6+y5OFh5Te4kZCa934r4GdJT2X/KY3SXIzflabLaYDB86w16t2I2CTaBdrecfxy
	mJJq7TNbd0FUb8+sZCdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pLKly-00DasS-Ao; Fri, 27 Jan 2023 09:11:50 +0000
Received: from fd01.gateway.ufhost.com ([61.152.239.71])
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pLKlt-00Daod-OC
	for linux-riscv@lists.infradead.org; Fri, 27 Jan 2023 09:11:48 +0000
Received: from EXMBX166.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX166", Issuer "EXMBX166" (not verified))
	by fd01.gateway.ufhost.com (Postfix) with ESMTP id 0AD4624DBD3;
	Fri, 27 Jan 2023 17:11:16 +0800 (CST)
Received: from EXMBX066.cuchost.com (172.16.7.66) by EXMBX166.cuchost.com
 (172.16.6.76) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Fri, 27 Jan
 2023 17:11:16 +0800
Received: from jsia-virtual-machine.localdomain (60.50.196.81) by
 EXMBX066.cuchost.com (172.16.6.66) with Microsoft SMTP Server (TLS) id
 15.0.1497.42; Fri, 27 Jan 2023 17:11:10 +0800
From: Sia Jee Heng <jeeheng.sia@starfivetech.com>
To: <paul.walmsley@sifive.com>, <palmer@dabbelt.com>, <aou@eecs.berkeley.edu>
CC: <linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<jeeheng.sia@starfivetech.com>, <leyfoon.tan@starfivetech.com>,
	<mason.huo@starfivetech.com>
Subject: [PATCH v3 1/4] RISC-V: Change suspend_save_csrs and suspend_restore_csrs to public function
Date: Fri, 27 Jan 2023 17:10:48 +0800
Message-ID: <20230127091051.1465278-2-jeeheng.sia@starfivetech.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230127091051.1465278-1-jeeheng.sia@starfivetech.com>
References: <20230127091051.1465278-1-jeeheng.sia@starfivetech.com>
MIME-Version: 1.0
X-Originating-IP: [60.50.196.81]
X-ClientProxiedBy: EXCAS066.cuchost.com (172.16.6.26) To EXMBX066.cuchost.com
 (172.16.6.66)
X-YovoleRuleAgent: yovoleflag
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230127_011145_969274_5C810370 
X-CRM114-Status: GOOD (  11.46  )
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

Currently suspend_save_csrs() and suspend_restore_csrs() functions are
statically defined in the suspend.c. Change the function's attribute
to public so that the functions can be used by hibernation as well.

Signed-off-by: Sia Jee Heng <jeeheng.sia@starfivetech.com>
Reviewed-by: Ley Foon Tan <leyfoon.tan@starfivetech.com>
Reviewed-by: Mason Huo <mason.huo@starfivetech.com>
---
 arch/riscv/include/asm/suspend.h | 3 +++
 arch/riscv/kernel/suspend.c      | 4 ++--
 2 files changed, 5 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/include/asm/suspend.h b/arch/riscv/include/asm/suspend.h
index 8be391c2aecb..75419c5ca272 100644
--- a/arch/riscv/include/asm/suspend.h
+++ b/arch/riscv/include/asm/suspend.h
@@ -33,4 +33,7 @@ int cpu_suspend(unsigned long arg,
 /* Low-level CPU resume entry function */
 int __cpu_resume_enter(unsigned long hartid, unsigned long context);
 
+/* Used to save and restore the csr */
+void suspend_save_csrs(struct suspend_context *context);
+void suspend_restore_csrs(struct suspend_context *context);
 #endif
diff --git a/arch/riscv/kernel/suspend.c b/arch/riscv/kernel/suspend.c
index 9ba24fb8cc93..3c89b8ec69c4 100644
--- a/arch/riscv/kernel/suspend.c
+++ b/arch/riscv/kernel/suspend.c
@@ -8,7 +8,7 @@
 #include <asm/csr.h>
 #include <asm/suspend.h>
 
-static void suspend_save_csrs(struct suspend_context *context)
+void suspend_save_csrs(struct suspend_context *context)
 {
 	context->scratch = csr_read(CSR_SCRATCH);
 	context->tvec = csr_read(CSR_TVEC);
@@ -29,7 +29,7 @@ static void suspend_save_csrs(struct suspend_context *context)
 #endif
 }
 
-static void suspend_restore_csrs(struct suspend_context *context)
+void suspend_restore_csrs(struct suspend_context *context)
 {
 	csr_write(CSR_SCRATCH, context->scratch);
 	csr_write(CSR_TVEC, context->tvec);
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
