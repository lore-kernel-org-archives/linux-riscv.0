Return-Path: <SRS0=+z5f=CQ=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D3D2CC433E2
	for <linux-riscv@archiver.kernel.org>; Mon,  7 Sep 2020 05:58:51 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5446C20838
	for <linux-riscv@archiver.kernel.org>; Mon,  7 Sep 2020 05:58:51 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Hx4aVLNW";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="XyRUTQyl"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5446C20838
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lst.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=yU3PHNFOwyCf5wBeY/d/B42g11L2uV6BL0mVznSwNRE=; b=Hx4aVLNWINCeX6fscnPSJnoay
	e8ivvJCt8h3zNqgZGNqiPZp7IlENiu7hwXbMYwnScpjW3yP3RcBeLwuE29V6Zkc7hF2sLxqmqMpAF
	dS9nfC4181mViu55KwY+Roj399tfGPrn0Upv+peFQsurQY0C6Laz/8aWJecqWM+2El4ZVgXhucQBY
	j0oVIZkXSz2XteC9OBTKHLlqnVyM135ueyYUhRKAHEEge3E1/4H9DXBveoC+D4Y/BJGunzbS4V10+
	SpKnPWX/d6rwaZLFceeKqFMXzZV4yNwgdZq9I47hX2oJ8AS7LIB91Sj4MwzdsTmAtloWtldG8VpHg
	v0fFDuV4Q==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kFAAp-00042O-Ud; Mon, 07 Sep 2020 05:58:39 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kFAAn-00040k-Qi
 for linux-riscv@merlin.infradead.org; Mon, 07 Sep 2020 05:58:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=m+ZhzJSNyKv4ho4WyRpE+IYeLmm+BOA5yzpJjCDM1ow=; b=XyRUTQyl6EfcfGxglwwBPlkUPZ
 Gcvb9MUcJap7nsGX7p+UnXKOrOIIQHJalyMsK6wL2ePsR5ZW2/YelQbE/3PrQyJUGdLiGy5U3etE2
 B8l15qJ5eyWMfl6RFUvN3EEKONyVS0Lv9FF1Jwc7iY4TFRoEnemb9I6rhM6Lk/PAcP14kK83Dx5UL
 eOFCipeljLlW9vNa+iwVyGBEXfln9sWcKoeq2nrbTpg0YgeZtWlzFFbCZ9DtPAdvPUy2n2P4dQcMh
 L6K5a/4/SpjAOk7dtS5eFYhaQn0M300jIZNTrz/rSeizaQFgdyZGkxzhcYCzvbRTvvy2AvSc1JcJy
 jaKyJJYg==;
Received: from [2001:4bb8:184:af1:e178:97b2:ac6b:4e16] (helo=localhost)
 by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kFAAm-00036y-Lz; Mon, 07 Sep 2020 05:58:36 +0000
From: Christoph Hellwig <hch@lst.de>
To: Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Arnd Bergmann <arnd@arndb.de>,
 Alexander Viro <viro@zeniv.linux.org.uk>
Subject: [PATCH 8/8] riscv: remove address space overrides using set_fs()
Date: Mon,  7 Sep 2020 07:58:25 +0200
Message-Id: <20200907055825.1917151-9-hch@lst.de>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200907055825.1917151-1-hch@lst.de>
References: <20200907055825.1917151-1-hch@lst.de>
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 casper.infradead.org. See http://www.infradead.org/rpr.html
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: linux-arch@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Stop providing the possibility to override the address space using
set_fs() now that there is no need for that any more.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 arch/riscv/Kconfig                   |  1 -
 arch/riscv/include/asm/thread_info.h |  6 ------
 arch/riscv/include/asm/uaccess.h     | 27 +--------------------------
 arch/riscv/kernel/process.c          |  1 -
 4 files changed, 1 insertion(+), 34 deletions(-)

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index 460e3971a80fde..33dde87218ddab 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -86,7 +86,6 @@ config RISCV
 	select SPARSE_IRQ
 	select SYSCTL_EXCEPTION_TRACE
 	select THREAD_INFO_IN_TASK
-	select SET_FS
 	select UACCESS_MEMCPY if !MMU
 
 config ARCH_MMAP_RND_BITS_MIN
diff --git a/arch/riscv/include/asm/thread_info.h b/arch/riscv/include/asm/thread_info.h
index 464a2bbc97ea33..a390711129de64 100644
--- a/arch/riscv/include/asm/thread_info.h
+++ b/arch/riscv/include/asm/thread_info.h
@@ -24,10 +24,6 @@
 #include <asm/processor.h>
 #include <asm/csr.h>
 
-typedef struct {
-	unsigned long seg;
-} mm_segment_t;
-
 /*
  * low level task data that entry.S needs immediate access to
  * - this struct should fit entirely inside of one cache line
@@ -39,7 +35,6 @@ typedef struct {
 struct thread_info {
 	unsigned long		flags;		/* low level flags */
 	int                     preempt_count;  /* 0=>preemptible, <0=>BUG */
-	mm_segment_t		addr_limit;
 	/*
 	 * These stack pointers are overwritten on every system call or
 	 * exception.  SP is also saved to the stack it can be recovered when
@@ -59,7 +54,6 @@ struct thread_info {
 {						\
 	.flags		= 0,			\
 	.preempt_count	= INIT_PREEMPT_COUNT,	\
-	.addr_limit	= KERNEL_DS,		\
 }
 
 #endif /* !__ASSEMBLY__ */
diff --git a/arch/riscv/include/asm/uaccess.h b/arch/riscv/include/asm/uaccess.h
index 264e52fb62b143..c47e6b35c551f4 100644
--- a/arch/riscv/include/asm/uaccess.h
+++ b/arch/riscv/include/asm/uaccess.h
@@ -26,29 +26,6 @@
 #define __disable_user_access()							\
 	__asm__ __volatile__ ("csrc sstatus, %0" : : "r" (SR_SUM) : "memory")
 
-/*
- * The fs value determines whether argument validity checking should be
- * performed or not.  If get_fs() == USER_DS, checking is performed, with
- * get_fs() == KERNEL_DS, checking is bypassed.
- *
- * For historical reasons, these macros are grossly misnamed.
- */
-
-#define MAKE_MM_SEG(s)	((mm_segment_t) { (s) })
-
-#define KERNEL_DS	MAKE_MM_SEG(~0UL)
-#define USER_DS		MAKE_MM_SEG(TASK_SIZE)
-
-#define get_fs()	(current_thread_info()->addr_limit)
-
-static inline void set_fs(mm_segment_t fs)
-{
-	current_thread_info()->addr_limit = fs;
-}
-
-#define uaccess_kernel() (get_fs().seg == KERNEL_DS.seg)
-#define user_addr_max()	(get_fs().seg)
-
 /**
  * access_ok: - Checks if a user space pointer is valid
  * @addr: User space pointer to start of block to check
@@ -76,9 +53,7 @@ static inline void set_fs(mm_segment_t fs)
  */
 static inline int __access_ok(unsigned long addr, unsigned long size)
 {
-	const mm_segment_t fs = get_fs();
-
-	return size <= fs.seg && addr <= fs.seg - size;
+	return size <= TASK_SIZE && addr <= TASK_SIZE - size;
 }
 
 /*
diff --git a/arch/riscv/kernel/process.c b/arch/riscv/kernel/process.c
index 2b97c493427c9e..19225ec65db62f 100644
--- a/arch/riscv/kernel/process.c
+++ b/arch/riscv/kernel/process.c
@@ -84,7 +84,6 @@ void start_thread(struct pt_regs *regs, unsigned long pc,
 	}
 	regs->epc = pc;
 	regs->sp = sp;
-	set_fs(USER_DS);
 }
 
 void flush_thread(void)
-- 
2.28.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
