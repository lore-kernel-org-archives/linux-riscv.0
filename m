Return-Path: <SRS0=NTR9=SO=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BDB71C10F0E
	for <infradead-linux-riscv@archiver.kernel.org>; Fri, 12 Apr 2019 14:40:24 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 903FF2084D
	for <infradead-linux-riscv@archiver.kernel.org>; Fri, 12 Apr 2019 14:40:24 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ks0hxjrp"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 903FF2084D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lst.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=l6rNcQQI5NVd6s4gElboq/LzSrsrbSPu3bVzfsEszIo=; b=ks0hxjrpXlVtdu
	CvlJpMGcbcWaDo8hWeyUInUxOMQ8qpkYL+f1egWJ9uIRtmUxNaAAJ7vT095Iu9sqNdfuejIQ7K5ua
	jtvtwwpWRCEi4auv+OtJHimLba5rr1zuAXEFB7AGNflUxBDr4igeUTboz0DCym7SF37NZO9hRj/LM
	pywZTyiPXC84JkFFR0VcUZUXPBEko06hJkuce48rCxLcKDFn8XplKF0aDcMuw9kX0/LAXu7Wa3N4b
	jsXlBHRjeX+C+xDyrs54DGkjfQd/Mn9eQ02RgfNHi6o0+6tLcKeUHpokaRql92hcVbvu0bTFdO30q
	heELg4plT+qvXIqHUSEQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hExLp-00017H-2Y; Fri, 12 Apr 2019 14:40:21 +0000
Received: from 089144214194.atnat0023.highway.a1.net ([89.144.214.194]
 helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hExLl-0000ys-Rr; Fri, 12 Apr 2019 14:40:18 +0000
From: Christoph Hellwig <hch@lst.de>
To: Palmer Dabbelt <palmer@sifive.com>
Subject: [PATCH 02/12] riscv: turn mm_segment_t into a struct
Date: Fri, 12 Apr 2019 16:39:38 +0200
Message-Id: <20190412143948.12478-3-hch@lst.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190412143948.12478-1-hch@lst.de>
References: <20190412143948.12478-1-hch@lst.de>
MIME-Version: 1.0
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
Cc: Nick Kossifidis <mick@ics.forth.gr>, Atish Patra <atish.patra@wdc.com>,
 linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

This matches what other heavily used architectures do, and will allow us
to easily use <asm-generic/uaccess.h> for the nommu case.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 arch/riscv/include/asm/thread_info.h |  4 +++-
 arch/riscv/include/asm/uaccess.h     | 12 +++++++-----
 2 files changed, 10 insertions(+), 6 deletions(-)

diff --git a/arch/riscv/include/asm/thread_info.h b/arch/riscv/include/asm/thread_info.h
index 1c9cc8389928..9c039870019b 100644
--- a/arch/riscv/include/asm/thread_info.h
+++ b/arch/riscv/include/asm/thread_info.h
@@ -28,7 +28,9 @@
 #include <asm/processor.h>
 #include <asm/csr.h>
 
-typedef unsigned long mm_segment_t;
+typedef struct {
+	unsigned long seg;
+} mm_segment_t;
 
 /*
  * low level task data that entry.S needs immediate access to
diff --git a/arch/riscv/include/asm/uaccess.h b/arch/riscv/include/asm/uaccess.h
index cc5b253d4c57..c51fc8bfbdde 100644
--- a/arch/riscv/include/asm/uaccess.h
+++ b/arch/riscv/include/asm/uaccess.h
@@ -39,8 +39,10 @@
  * For historical reasons, these macros are grossly misnamed.
  */
 
-#define KERNEL_DS	(~0UL)
-#define USER_DS		(TASK_SIZE)
+#define MAKE_MM_SEG(s)	((mm_segment_t) { (s) })
+
+#define KERNEL_DS	MAKE_MM_SEG(~0UL)
+#define USER_DS		MAKE_MM_SEG(TASK_SIZE)
 
 #define get_fs()	(current_thread_info()->addr_limit)
 
@@ -49,9 +51,9 @@ static inline void set_fs(mm_segment_t fs)
 	current_thread_info()->addr_limit = fs;
 }
 
-#define segment_eq(a, b) ((a) == (b))
+#define segment_eq(a, b) ((a).seg == (b).seg)
 
-#define user_addr_max()	(get_fs())
+#define user_addr_max()	(get_fs().seg)
 
 
 /**
@@ -83,7 +85,7 @@ static inline int __access_ok(unsigned long addr, unsigned long size)
 {
 	const mm_segment_t fs = get_fs();
 
-	return (size <= fs) && (addr <= (fs - size));
+	return size <= fs.seg && addr <= fs.seg - size;
 }
 
 /*
-- 
2.20.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
