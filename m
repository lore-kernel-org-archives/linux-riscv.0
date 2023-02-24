Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54AF6C61DA3
	for <linux-riscv@archiver.kernel.org>; Fri, 24 Feb 2023 13:59:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=l/H6bXxYx0LPDSywxEf+jvLNcxTlV8XZBj6/42Ve0bM=; b=ZC4N9mb7UbFey4
	NaBtkq0ewO74GGPnf+7Wa517ryeannWle6qsTHAMfE3p3KvMM4agMyG/LAnud35kTZp1fh3krKL1j
	UR1fu75eSuUZ96Io4MsGv4dW1iBHOkpuy1O333OHNP7eFUOl69XY93wZEbRXgLPYKHk9ByXIvtd9R
	Mmd4VpvvZBodvRmHbPW5DD0Hd/o98I3WFeZUh6wV8hUH6M6AnUwSmJqBBasCdi86oBzyIQbdv9cOj
	gejjVXtWNS2il7bO8w5ACMvTwLfwy+oYbk6Kd6zrMF85p0ZFCwVIlFcXUeAq0LHVLSjP2h0mTP3wm
	PCZTnhzwEi+O2KFj2eJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pVYbJ-002gO7-8t; Fri, 24 Feb 2023 13:59:05 +0000
Received: from imap5.colo.codethink.co.uk ([78.40.148.171])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pVYbG-002gLI-5a
	for linux-riscv@lists.infradead.org; Fri, 24 Feb 2023 13:59:03 +0000
Received: from [167.98.27.226] (helo=rainbowdash)
	by imap5.colo.codethink.co.uk with esmtpsa  (Exim 4.94.2 #2 (Debian))
	id 1pVYb1-008YXL-1C; Fri, 24 Feb 2023 13:58:47 +0000
Received: from ben by rainbowdash with local (Exim 4.96)
	(envelope-from <ben@rainbowdash>)
	id 1pVYb0-002b32-25;
	Fri, 24 Feb 2023 13:58:46 +0000
From: Ben Dooks <ben.dooks@codethink.co.uk>
To: linux-riscv@lists.infradead.org,
	ajones@ventanamicro.com
Cc: Ben Dooks <ben.dooks@codethink.co.uk>,
	Sudip Mukherjee <sudip.mukherjee@codethink.co.uk>
Subject: [PATCH] RISC-V: Fixup clear_page export when using  Zicboz
Date: Fri, 24 Feb 2023 13:58:44 +0000
Message-Id: <20230224135844.619054-1-ben.dooks@codethink.co.uk>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230221190916.572454-7-ajones@ventanamicro.com>
References: <20230221190916.572454-7-ajones@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230224_055902_231398_7ED8F721 
X-CRM114-Status: GOOD (  10.54  )
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

When the clear_page() via Zicboz is enabled, the module build
fails as clear_page() is not marked as a ksym entry. Fix this
by changing the asm code to use <asm-generic/export.h> to add
the correct export.

Also remove the weak clear_page() as there's nothing else in
the build defining this symbol, so just make it the entry when
the Zicboz is enabled.

Fixes modpost errors such as this:
ERROR: modpost: "clear_page" [drivers/gpu/drm/ttm/ttm.ko] undefined!

Reported-by: Sudip Mukherjee <sudip.mukherjee@codethink.co.uk>
Signed-off-by: Ben Dooks <ben.dooks@codethink.co.uk>
---
 arch/riscv/lib/clear_page.S | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/lib/clear_page.S b/arch/riscv/lib/clear_page.S
index 7c7fa45b5ab5..4ed5fef52d80 100644
--- a/arch/riscv/lib/clear_page.S
+++ b/arch/riscv/lib/clear_page.S
@@ -6,6 +6,7 @@
 #include <linux/linkage.h>
 #include <asm/asm.h>
 #include <asm/alternative-macros.h>
+#include <asm-generic/export.h>
 #include <asm/hwcap.h>
 #include <asm/insn-def.h>
 #include <asm/page.h>
@@ -17,7 +18,7 @@
 
 /* void clear_page(void *page) */
 ENTRY(__clear_page)
-WEAK(clear_page)
+SYM_FUNC_START(clear_page)
 	li	a2, PAGE_SIZE
 
 	/*
@@ -70,4 +71,5 @@ WEAK(clear_page)
 .Lno_zicboz:
 	li	a1, 0
 	tail	__memset
-END(__clear_page)
+SYM_FUNC_END(clear_page)
+EXPORT_SYMBOL(clear_page)
-- 
2.39.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
