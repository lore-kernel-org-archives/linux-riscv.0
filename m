Return-Path: <SRS0=aEGT=PC=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A12C9C43387
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 25 Dec 2018 14:48:12 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 546C521738
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 25 Dec 2018 14:48:12 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="NylpjHD5"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 546C521738
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=aurel32.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=h6t35gIHEFeeHnWyMp2OdiQbS278KjqWZJI2kLkXJ1c=; b=NylpjHD5XWohpf
	oC7PS+PPSU+7wG6+IEgTey+jeeN2yzaF2/oTO5ej7KWaXURIzFzL5SYVqr6tSo+gjb+XuTaSH+4we
	2ZB/0/OIZ7Ujse87+bVXV/hO/AmO+H4aKyLyZOH4nEnkAuv+naxb+LCpEndXGNl0/gqLmVE1Mt6Rq
	5a7OY4QVsDbNzBfQXr2atJDR08E4N+4dez0a4jlaSAg+l/kNiQCJxAOr0lCQzlBRxJ9V74TpSAXc/
	zKW8XbtxW76aOevxwTVt4yEL7Ekw+xaQ/4N5HFq7iw61sCRSVLymRiSjJYW88OyPN5qzxvvgzZ11W
	ttAhF/xgRqa53ZZtDxBg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gbo0A-0005Zb-KE; Tue, 25 Dec 2018 14:48:10 +0000
Received: from hall.aurel32.net ([2001:bc8:30d7:100::1])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gbo05-0005Ya-68
 for linux-riscv@lists.infradead.org; Tue, 25 Dec 2018 14:48:08 +0000
Received: from [2a01:e35:2e4c:a861:655e:aef3:f589:b897] (helo=ohm.rr44.fr)
 by hall.aurel32.net with esmtpsa (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.89) (envelope-from <aurelien@aurel32.net>)
 id 1gbnzf-00068B-4Z; Tue, 25 Dec 2018 15:47:39 +0100
Received: from aurel32 by ohm.rr44.fr with local (Exim 4.91)
 (envelope-from <aurelien@aurel32.net>)
 id 1gbnyb-0005q8-0P; Tue, 25 Dec 2018 15:46:33 +0100
From: Aurelien Jarno <aurelien@aurel32.net>
To: linux-riscv@lists.infradead.org
Subject: [PATCH] tools uapi: fix RISC-V 64-bit support
Date: Tue, 25 Dec 2018 15:46:24 +0100
Message-Id: <20181225144624.22402-1-aurelien@aurel32.net>
X-Mailer: git-send-email 2.19.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181225_064805_365026_9E51C97C 
X-CRM114-Status: GOOD (  13.28  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Aurelien Jarno <aurelien@aurel32.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

The BPF library is not built on 64-bit RISC-V, as the BPF feature is
not detected. Looking more in details, feature/test-bpf.c fails to build
with the following error:

| In file included from /tmp/linux-4.19.12/tools/include/uapi/asm/bitsperlong.h:17,
|                  from /tmp/linux-4.19.12/tools/include/uapi/asm-generic/unistd.h:2,
|                  from /usr/include/riscv64-linux-gnu/asm/unistd.h:1,
|                  from test-bpf.c:2:
| /tmp/linux-4.19.12/tools/include/asm-generic/bitsperlong.h:14:2: error: #error Inconsistent word size. Check asm/bitsperlong.h
|  #error Inconsistent word size. Check asm/bitsperlong.h
|   ^~~~~

The UAPI from the tools directory is missing RISC-V support, therefore
bitsperlong.h from asm-generic is used, defaulting to 32 bits.

Fix that by adding tools/arch/riscv/include/uapi/asm/bitsperlong.h as
a copy of arch/riscv/include/uapi/asm/bitsperlong.h and by updating
tools/include/uapi/asm/bitsperlong.h.

Signed-off-by: Aurelien Jarno <aurelien@aurel32.net>
---
 .../arch/riscv/include/uapi/asm/bitsperlong.h | 25 +++++++++++++++++++
 tools/include/uapi/asm/bitsperlong.h          |  2 ++
 2 files changed, 27 insertions(+)
 create mode 100644 tools/arch/riscv/include/uapi/asm/bitsperlong.h

diff --git a/tools/arch/riscv/include/uapi/asm/bitsperlong.h b/tools/arch/riscv/include/uapi/asm/bitsperlong.h
new file mode 100644
index 000000000000..0b3cb52fd29d
--- /dev/null
+++ b/tools/arch/riscv/include/uapi/asm/bitsperlong.h
@@ -0,0 +1,25 @@
+/*
+ * Copyright (C) 2012 ARM Ltd.
+ * Copyright (C) 2015 Regents of the University of California
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License version 2 as
+ * published by the Free Software Foundation.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU General Public License for more details.
+ *
+ * You should have received a copy of the GNU General Public License
+ * along with this program.  If not, see <http://www.gnu.org/licenses/>.
+ */
+
+#ifndef _UAPI_ASM_RISCV_BITSPERLONG_H
+#define _UAPI_ASM_RISCV_BITSPERLONG_H
+
+#define __BITS_PER_LONG (__SIZEOF_POINTER__ * 8)
+
+#include <asm-generic/bitsperlong.h>
+
+#endif /* _UAPI_ASM_RISCV_BITSPERLONG_H */
diff --git a/tools/include/uapi/asm/bitsperlong.h b/tools/include/uapi/asm/bitsperlong.h
index 8dd6aefdafa4..fd92ce8388fc 100644
--- a/tools/include/uapi/asm/bitsperlong.h
+++ b/tools/include/uapi/asm/bitsperlong.h
@@ -13,6 +13,8 @@
 #include "../../arch/mips/include/uapi/asm/bitsperlong.h"
 #elif defined(__ia64__)
 #include "../../arch/ia64/include/uapi/asm/bitsperlong.h"
+#elif defined(__riscv)
+#include "../../arch/riscv/include/uapi/asm/bitsperlong.h"
 #else
 #include <asm-generic/bitsperlong.h>
 #endif
-- 
2.19.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
