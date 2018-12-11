Return-Path: <SRS0=hxTO=OU=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.9 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5F8CEC5CFFE
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 11 Dec 2018 08:09:55 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3065F20811
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 11 Dec 2018 08:09:55 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="HAUbdwFS";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AWt604Sw"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3065F20811
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=cvoKTy9CzLfWAP/UWoQ3OdmpvkaxWziG1uEfZxMwLBM=; b=HAUbdwFScQCyhe
	Zm2yClDqEK4+l8hToVp4sTE/nLGy7elyP2ajq8CMZFQx6rVmCwWDNWMq1iog5C3hPXf4a5Jrz831N
	YU/77ticJCE/r69hvo8Narb8ls0PpopK0FDmsNgHVrjRecEvc9BlY1WEcgOkMlwXipKLCTdBp5+im
	vi8XbuXM0Bqz7nIV+A15nQsIcKNruZsURLVe7roZ5lryrMwWq2PX64JkQpnlJtvvx5zLIizsQAyGh
	RBlLHnTpvF+6fx62RjuVc84Db9/01MKk7o8HgQhbMhNFNzR57nDw/uHyCGVe826Pbhx/3K1GeV+9f
	FfrR4AmhirvLRA3S7snA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gWd74-0005qW-GV; Tue, 11 Dec 2018 08:09:54 +0000
Received: from mail-ed1-x541.google.com ([2a00:1450:4864:20::541])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gWd71-0005pB-U0
 for linux-riscv@lists.infradead.org; Tue, 11 Dec 2018 08:09:53 +0000
Received: by mail-ed1-x541.google.com with SMTP id h50so11747035ede.5
 for <linux-riscv@lists.infradead.org>; Tue, 11 Dec 2018 00:09:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=4ccRYGxrCLyaNwaAY2WlusVuzlGscJwbjbruVrt0AN8=;
 b=AWt604SwXOt2DAOgX+cXi84a13/pvXlP2L0FTx6ON9VpQFsEDvt0v8eDvvhQV16W+O
 nD8/Ht7HsXM8ka3ojXRHbDKEFvIGEKZ+Gjq36DSQsVhBgTVDCj5ibi3Bla4TKjdqVtNH
 CNwbefdODdoUEBh87tKSYhRpTvryHRmJh8xXlDT17jbWpVRuffYv6K3tpaWzaxnPjCCS
 hfn2h2hdeL0iOIFzyxU2J1FQdqVHcISezh5uigSbfebeoLLbYQuHLnQKqa+wpU9qC1O4
 T9ZVUr81h2zgsmw0ZBOAtP1IWHXY0+n7UTYBUlsPIN9A1FBxFKvsx4zPdQFO598r/27W
 0Ssw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=4ccRYGxrCLyaNwaAY2WlusVuzlGscJwbjbruVrt0AN8=;
 b=sYCXkli5pd+INENh2YjdccqTvqb2H8L/pEQLyRBMrkQYcg4hQGt2yLYnmzXMz4dDl4
 RDl7eqkZh2kt7Omp7LS8QH3Fqt5SPr/HowIk5WzLk+CkefbbRgXqK1GeMla8xru4YwIN
 5kGVjXcq16FfkKNXX2VlVIVdVRZSL3N2pqgHdNK0AOKtLWFp8qLrSIyhwSmTAp3uV6Yn
 iwI2vVzgfhr7XexiRowOW2ET70VTfxBTapXldvM2LIL2mWwt8r6FzT214H2bU0FGM+Se
 swIvTrA/Ps74k5Xdi/F1S2zKrYbzPUJgkp9UPIctqqQPt+KDywk9lvty/h8s+6uFZzJu
 cf7w==
X-Gm-Message-State: AA+aEWbuiAFfgIfj5XndAyapgox/b01U5ahsLWxWetHeukVI8qlgevxi
 oEAxwqRt53zEPSYmdNbVYms=
X-Google-Smtp-Source: AFSGD/VNf3G4lrFgEzqcINiGxGe0Mms0sFMwe4yRXvCyi0mzCTg014YGT0pK4JbkAV5dW/lmcFAewQ==
X-Received: by 2002:a50:b36f:: with SMTP id r44mr14210453edd.284.1544515780070; 
 Tue, 11 Dec 2018 00:09:40 -0800 (PST)
Received: from localhost.localdomain (46-253-189-212.dynamic.monzoon.net.
 [46.253.189.212])
 by smtp.gmail.com with ESMTPSA id e14sm3949012edb.79.2018.12.11.00.09.38
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Tue, 11 Dec 2018 00:09:39 -0800 (PST)
From: David Abdurachmanov <david.abdurachmanov@gmail.com>
To: palmer@sifive.com, aou@eecs.berkeley.edu, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org
Subject: [PATCH] riscv: restore asm/syscalls.h UAPI header
Date: Tue, 11 Dec 2018 09:09:35 +0100
Message-Id: <20181211080935.20856-1-david.abdurachmanov@gmail.com>
X-Mailer: git-send-email 2.19.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181211_000951_967936_B7D70527 
X-CRM114-Status: GOOD (  14.41  )
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
Cc: David Abdurachmanov <david.abdurachmanov@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

UAPI header asm/syscalls.h was merged into UAPI asm/unistd.h header,
which did resolve issue with missing syscalls macros resulting in
glibc (2.28) build failure. It also broke glibc in a different way:
asm/syscalls.h is being used by glibc. I noticed this while doing
Fedora 30/Rawhide mass rebuild.

The patch returns asm/syscalls.h header and incl. it into asm/unistd.h.
I plan to send a patch to glibc to use asm/unistd.h instead of
asm/syscalls.h

Signed-off-by: David Abdurachmanov <david.abdurachmanov@gmail.com>
Fixes: 27f8899d6002 ("riscv: add asm/unistd.h UAPI header")
---
 arch/riscv/include/uapi/asm/syscalls.h | 29 ++++++++++++++++++++++++++
 arch/riscv/include/uapi/asm/unistd.h   | 20 +-----------------
 2 files changed, 30 insertions(+), 19 deletions(-)
 create mode 100644 arch/riscv/include/uapi/asm/syscalls.h

diff --git a/arch/riscv/include/uapi/asm/syscalls.h b/arch/riscv/include/uapi/asm/syscalls.h
new file mode 100644
index 000000000000..206dc4b0f6ea
--- /dev/null
+++ b/arch/riscv/include/uapi/asm/syscalls.h
@@ -0,0 +1,29 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (C) 2017-2018 SiFive
+ */
+
+/*
+ * There is explicitly no include guard here because this file is expected to
+ * be included multiple times in order to define the syscall macros via
+ * __SYSCALL.
+ */
+
+/*
+ * Allows the instruction cache to be flushed from userspace.  Despite RISC-V
+ * having a direct 'fence.i' instruction available to userspace (which we
+ * can't trap!), that's not actually viable when running on Linux because the
+ * kernel might schedule a process on another hart.  There is no way for
+ * userspace to handle this without invoking the kernel (as it doesn't know the
+ * thread->hart mappings), so we've defined a RISC-V specific system call to
+ * flush the instruction cache.
+ *
+ * __NR_riscv_flush_icache is defined to flush the instruction cache over an
+ * address range, with the flush applying to either all threads or just the
+ * caller.  We don't currently do anything with the address range, that's just
+ * in there for forwards compatibility.
+ */
+#ifndef __NR_riscv_flush_icache
+#define __NR_riscv_flush_icache (__NR_arch_specific_syscall + 15)
+#endif
+__SYSCALL(__NR_riscv_flush_icache, sys_riscv_flush_icache)
diff --git a/arch/riscv/include/uapi/asm/unistd.h b/arch/riscv/include/uapi/asm/unistd.h
index 1f3bd3ebbb0d..06103139db50 100644
--- a/arch/riscv/include/uapi/asm/unistd.h
+++ b/arch/riscv/include/uapi/asm/unistd.h
@@ -20,22 +20,4 @@
 #endif /* __LP64__ */
 
 #include <asm-generic/unistd.h>
-
-/*
- * Allows the instruction cache to be flushed from userspace.  Despite RISC-V
- * having a direct 'fence.i' instruction available to userspace (which we
- * can't trap!), that's not actually viable when running on Linux because the
- * kernel might schedule a process on another hart.  There is no way for
- * userspace to handle this without invoking the kernel (as it doesn't know the
- * thread->hart mappings), so we've defined a RISC-V specific system call to
- * flush the instruction cache.
- *
- * __NR_riscv_flush_icache is defined to flush the instruction cache over an
- * address range, with the flush applying to either all threads or just the
- * caller.  We don't currently do anything with the address range, that's just
- * in there for forwards compatibility.
- */
-#ifndef __NR_riscv_flush_icache
-#define __NR_riscv_flush_icache (__NR_arch_specific_syscall + 15)
-#endif
-__SYSCALL(__NR_riscv_flush_icache, sys_riscv_flush_icache)
+#include <asm/syscalls.h>
-- 
2.19.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
