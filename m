Return-Path: <SRS0=91Bs=CN=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 88695C433E2
	for <linux-riscv@archiver.kernel.org>; Fri,  4 Sep 2020 16:52:42 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4D30520795
	for <linux-riscv@archiver.kernel.org>; Fri,  4 Sep 2020 16:52:42 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="HZ9yePo6";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="SOQUm4/w"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4D30520795
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lst.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=WXxntzPoDcpn8MgVZ/sBJrsAsyxNrYRD//QGceaSjh8=; b=HZ9yePo6GWMt4qtoHl7FMZ4t5
	hZs6MVZpkf4w2W2ptWvAMi9CC4PYgdap/AT94cgw/v4qz9jztuR94JA4B9rbH21U51Vjk1jEbz6Zz
	A1IL4xfYHgc8DCJqrmHhPlCkjGKpoW1uIvtyMN8oCwceN9ZDJ2IypF3P/Nh+WYF0fiPzUpeq4+Gvw
	kfQ8Ef503U3ks/2PcUReX0eHBEugfPNJYSQQleouiEmWersBYtRqAfYBXPjZNXeyZbzJ/bsLjX02E
	8sFNTdyHYfW5e1OdeI3u65Qye2JJ7AE2s5vFoQZ54wqrgFGT5MKE1MkU8zRh73AhsdEWvSoxRMtTG
	wmn+6PraA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kEEwu-0004Lg-O2; Fri, 04 Sep 2020 16:52:28 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kEEws-0004KB-Sj
 for linux-riscv@merlin.infradead.org; Fri, 04 Sep 2020 16:52:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=QKmvOnnTVM0cYTahP4FVnPiXurVXegESFen5M4G3dfE=; b=SOQUm4/wf1XXCcewYv86blHZSu
 SMtJHM3I1MESTHR9hPa7Bq523Nn9NZvcV4d+vaX0ssZYMvcP8CnuRw1rRfP2/Zm5ybwB48Bly2FtN
 ZonjSIlhYpoZ11lo/ENJpRa4/PDYsXZ/MkYy9vij4C764f/7yQbBtzkZTu6cDy7hyVVqyyEP+m3mh
 HyjJOTPdxXlekWOM3RcKmBo+IgOL5KUm5jq1q5UCHGaa76k/zsDP8+RyAr142TFfSl+N2eeRj6hrk
 zlOYu9o6u/FlrBvdK8xIuBqhV3B4fQRCV0dA+xjd2korRJ3+iQY1HnYLRpOKCdhxSyOvw+jJPVeG5
 yFIYa5Qg==;
Received: from [2001:4bb8:184:af1:704:22b1:700d:1395] (helo=localhost)
 by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kEEwr-00013D-Q3; Fri, 04 Sep 2020 16:52:25 +0000
From: Christoph Hellwig <hch@lst.de>
To: Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Arnd Bergmann <arnd@arndb.de>,
 Alexander Viro <viro@zeniv.linux.org.uk>
Subject: [PATCH 5/8] riscv: use memcpy based uaccess for nommu again
Date: Fri,  4 Sep 2020 18:52:13 +0200
Message-Id: <20200904165216.1799796-6-hch@lst.de>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200904165216.1799796-1-hch@lst.de>
References: <20200904165216.1799796-1-hch@lst.de>
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

This reverts commit adccfb1a805ea84d2db38eb53032533279bdaa97.

Now that the generic uaccess by mempcy code handles unaligned addresses
the generic code can be used for all RISC-V CPUs.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 arch/riscv/Kconfig               |  1 +
 arch/riscv/include/asm/uaccess.h | 36 ++++++++++++++++----------------
 arch/riscv/lib/Makefile          |  2 +-
 3 files changed, 20 insertions(+), 19 deletions(-)

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index 07d53044013ede..460e3971a80fde 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -87,6 +87,7 @@ config RISCV
 	select SYSCTL_EXCEPTION_TRACE
 	select THREAD_INFO_IN_TASK
 	select SET_FS
+	select UACCESS_MEMCPY if !MMU
 
 config ARCH_MMAP_RND_BITS_MIN
 	default 18 if 64BIT
diff --git a/arch/riscv/include/asm/uaccess.h b/arch/riscv/include/asm/uaccess.h
index f56c66b3f5fe21..e8eedf22e90747 100644
--- a/arch/riscv/include/asm/uaccess.h
+++ b/arch/riscv/include/asm/uaccess.h
@@ -13,24 +13,6 @@
 /*
  * User space memory access functions
  */
-
-extern unsigned long __must_check __asm_copy_to_user(void __user *to,
-	const void *from, unsigned long n);
-extern unsigned long __must_check __asm_copy_from_user(void *to,
-	const void __user *from, unsigned long n);
-
-static inline unsigned long
-raw_copy_from_user(void *to, const void __user *from, unsigned long n)
-{
-	return __asm_copy_from_user(to, from, n);
-}
-
-static inline unsigned long
-raw_copy_to_user(void __user *to, const void *from, unsigned long n)
-{
-	return __asm_copy_to_user(to, from, n);
-}
-
 #ifdef CONFIG_MMU
 #include <linux/errno.h>
 #include <linux/compiler.h>
@@ -385,6 +367,24 @@ do {								\
 		-EFAULT;					\
 })
 
+
+unsigned long __must_check __asm_copy_to_user(void __user *to,
+	const void *from, unsigned long n);
+unsigned long __must_check __asm_copy_from_user(void *to,
+	const void __user *from, unsigned long n);
+
+static inline unsigned long
+raw_copy_from_user(void *to, const void __user *from, unsigned long n)
+{
+	return __asm_copy_from_user(to, from, n);
+}
+
+static inline unsigned long
+raw_copy_to_user(void __user *to, const void *from, unsigned long n)
+{
+	return __asm_copy_to_user(to, from, n);
+}
+
 extern long strncpy_from_user(char *dest, const char __user *src, long count);
 
 extern long __must_check strlen_user(const char __user *str);
diff --git a/arch/riscv/lib/Makefile b/arch/riscv/lib/Makefile
index 0d0db80800c4ed..47e7a82044608d 100644
--- a/arch/riscv/lib/Makefile
+++ b/arch/riscv/lib/Makefile
@@ -2,5 +2,5 @@
 lib-y			+= delay.o
 lib-y			+= memcpy.o
 lib-y			+= memset.o
-lib-y			+= uaccess.o
+lib-$(CONFIG_MMU)	+= uaccess.o
 lib-$(CONFIG_64BIT)	+= tishift.o
-- 
2.28.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
