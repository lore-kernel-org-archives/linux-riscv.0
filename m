Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 575E0C4167B
	for <linux-riscv@archiver.kernel.org>; Sun, 26 Nov 2023 15:18:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LnfI0LlKWoNtqfHFrh24U/96w1ehKalV6nVE6K+sG14=; b=ZGPje63qWnRMr2
	ffHoNmsodWMueccY0AViat6i43ghS0oiXhZSL81+1iA4zlGapvK+gIBDYlTN2R6vPFV57L2Dgs60Y
	1lgwd2rEaQYGqC8PY/piSi32N5BdBTEi3iteLT+HeiuMDi/GOLRtNmTIAqY1V8AbJjNW0wzU31DPs
	wXl3I27bvBAQc8BQiEzw45HHvvSHnRv0P+anofmfE4SYHOYYrKLoRsUaabDQmu8yyDm6Bdwi2LahE
	rthEOMPFA2wij8m1gCJ+gddetlS9BXf4Uc9qZsB5iscgS6vU7JnVnJXoa7fv052G7zDRzXMirglZq
	VcMZoT+qMPPOx+rDijsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r7Gtg-00CEfc-2V;
	Sun, 26 Nov 2023 15:18:14 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r7Gtb-00CEbm-2K
	for linux-riscv@lists.infradead.org;
	Sun, 26 Nov 2023 15:18:09 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 245B960ED4;
	Sun, 26 Nov 2023 15:18:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C04B4C433C9;
	Sun, 26 Nov 2023 15:18:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701011885;
	bh=V57AiXAYYy6sW7YrUCL2Mf2ENr9bgxbhEiWxZqtaB24=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=djweukSrCgkARY+NJsXL5917br+cLSMzI3ixps8ZSKFhDZQcxIiSCuBwDFaWjvHR+
	 hVNReRtB7dzCEQtVCvtxnv97tM13yE8ChnSJFu0AYXsGtI8f7YebzylgJuMxsdPvCD
	 fMwQpf/lyGYaBfWrt4gR+++fim96obNZeAxy0NGmVlzCmblnXAsuIZM5NYiwN8r4EL
	 5GV+90hEF9MAhFa+Ut5Qg7VteaSOR4zjHpU6Mmh8vLkNSDjeUN7k+dWkzaC5knIbjG
	 7z8sCSShzyKWqItXchEz02Reskt/oRvsX2C2VAH8QDnyOfbYbXPI6dvetsFYoYYyVY
	 ukmpSSkMQetRA==
From: Masahiro Yamada <masahiroy@kernel.org>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	linux-riscv@lists.infradead.org
Cc: Masahiro Yamada <masahiroy@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] riscv: replace <asm-generic/export.h> with <linux/export.h>
Date: Mon, 27 Nov 2023 00:17:39 +0900
Message-Id: <20231126151739.1557369-2-masahiroy@kernel.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20231126151739.1557369-1-masahiroy@kernel.org>
References: <20231126151739.1557369-1-masahiroy@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231126_071808_106939_3334830A 
X-CRM114-Status: UNSURE (   9.80  )
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

Commit ddb5cdbafaaa ("kbuild: generate KSYMTAB entries by modpost")
deprecated <asm-generic/export.h>, which is now a wrapper of
<linux/export.h>.

Replace #include <asm-generic/export.h> with #include <linux/export.h>.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 arch/riscv/kernel/mcount.S  | 2 +-
 arch/riscv/lib/clear_page.S | 2 +-
 arch/riscv/lib/tishift.S    | 2 +-
 arch/riscv/lib/uaccess.S    | 2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/riscv/kernel/mcount.S b/arch/riscv/kernel/mcount.S
index b4dd9ed6849e..f46db726e42e 100644
--- a/arch/riscv/kernel/mcount.S
+++ b/arch/riscv/kernel/mcount.S
@@ -1,6 +1,7 @@
 /* SPDX-License-Identifier: GPL-2.0 */
 /* Copyright (C) 2017 Andes Technology Corporation */
 
+#include <linux/export.h>
 #include <linux/init.h>
 #include <linux/linkage.h>
 #include <linux/cfi_types.h>
@@ -9,7 +10,6 @@
 #include <asm/unistd.h>
 #include <asm/thread_info.h>
 #include <asm/asm-offsets.h>
-#include <asm-generic/export.h>
 #include <asm/ftrace.h>
 
 	.text
diff --git a/arch/riscv/lib/clear_page.S b/arch/riscv/lib/clear_page.S
index b22de1231144..fe07ce70a619 100644
--- a/arch/riscv/lib/clear_page.S
+++ b/arch/riscv/lib/clear_page.S
@@ -3,10 +3,10 @@
  * Copyright (c) 2023 Ventana Micro Systems Inc.
  */
 
+#include <linux/export.h>
 #include <linux/linkage.h>
 #include <asm/asm.h>
 #include <asm/alternative-macros.h>
-#include <asm-generic/export.h>
 #include <asm/hwcap.h>
 #include <asm/insn-def.h>
 #include <asm/page.h>
diff --git a/arch/riscv/lib/tishift.S b/arch/riscv/lib/tishift.S
index ef90075c4b0a..04f858afafe8 100644
--- a/arch/riscv/lib/tishift.S
+++ b/arch/riscv/lib/tishift.S
@@ -3,8 +3,8 @@
  * Copyright (C) 2018 Free Software Foundation, Inc.
  */
 
+#include <linux/export.h>
 #include <linux/linkage.h>
-#include <asm-generic/export.h>
 
 SYM_FUNC_START(__lshrti3)
 	beqz	a2, .L1
diff --git a/arch/riscv/lib/uaccess.S b/arch/riscv/lib/uaccess.S
index 3ab438f30d13..9eca131dc555 100644
--- a/arch/riscv/lib/uaccess.S
+++ b/arch/riscv/lib/uaccess.S
@@ -1,5 +1,5 @@
+#include <linux/export.h>
 #include <linux/linkage.h>
-#include <asm-generic/export.h>
 #include <asm/asm.h>
 #include <asm/asm-extable.h>
 #include <asm/csr.h>
-- 
2.40.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
