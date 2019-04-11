Return-Path: <SRS0=Og1w=SN=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E77DAC10F13
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 11 Apr 2019 11:57:01 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B6BF02133D
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 11 Apr 2019 11:57:01 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="phBSiha7"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B6BF02133D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lst.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Nkaenu02ouhL4Xqm0zR+TMADOVpDFFzrOdYEf/sFmMA=; b=phBSiha7MBc3ym
	YbVPmyOuvu96fNvE0BqPIa6/O3WyvorQ7zN73oORbWml3Kuyn10HDsJYPABIMFJajV3Kox/vYkm6r
	8uBaYDtne8Pz2UltrzTdklhCLmfL9RKy7UbNKj5OSP/2aoeKcWOm12hZhyUjXCay1oQW2zC/3cUWn
	bF9M/w0NTbo3juRouVvamUJJmutcmKhrlSa01SiyuBfQS7e/Wtpg+7KYtuRSj2QKq8KU3EW2wnNhM
	1ccD4lPrJrVJyWiemI2AtKw1tszSgyRgKp69gNMceC4ws+iTwuiQ4lrUdK/yg7Eq8dg9KkEKf91N3
	qF+FL+a4Mcr5FyN3Envg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hEYKA-00011T-PM; Thu, 11 Apr 2019 11:56:58 +0000
Received: from clnet-p19-102.ikbnet.co.at ([83.175.77.102] helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hEYK9-0000yW-2h; Thu, 11 Apr 2019 11:56:57 +0000
From: Christoph Hellwig <hch@lst.de>
To: Palmer Dabbelt <palmer@sifive.com>
Subject: [PATCH 4/9] riscv: turn mm_segment_t into a struct
Date: Thu, 11 Apr 2019 13:56:18 +0200
Message-Id: <20190411115623.5749-5-hch@lst.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190411115623.5749-1-hch@lst.de>
References: <20190411115623.5749-1-hch@lst.de>
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
Cc: linux-riscv@lists.infradead.org
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
index 5c50ed6f8c93..b26f407be5c8 100644
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
