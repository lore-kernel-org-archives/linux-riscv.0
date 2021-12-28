Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0FB9DC433F5
	for <linux-riscv@archiver.kernel.org>; Tue, 28 Dec 2021 14:48:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=f4vuqOWm/Ds0WvoGhE0qqMEEDiBCMnW7cJDFHty2V2A=; b=SijM01mNa81e0i
	RDLzoa5PMuL8oSgr1O4WyCp6E+Qo9TeGkAniGFbY6MSC0GIBJzJqqa2y1N+pC1rH0R9eE+TIQD3/U
	lVuKMw9vBQJMjqUSnSJpwnZY9XYDA5JRYFQMS0V+70ZmXPoocMgyKHBOS4lBcVzXAyeE8G1nhb0Vp
	gCDCTESZmyLrgw3VmxlmKIDA2j4fek58syKqeeVR4N/AYKjXHsl0e7euPZFnj+RXjYcSiygUJeNGQ
	JjdFkQzOEiJpgZaIj9agJ9NWj0u77CaBYBgNIsfKOy6D8eidsPeu+D9JcHWcxMApO1Om19jYtGH/u
	mw+18gDLk4Iw8ts5ZCHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n2DlY-001EDV-M6; Tue, 28 Dec 2021 14:47:52 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n2DeT-001BfN-QZ; Tue, 28 Dec 2021 14:40:37 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 46206B8121A;
 Tue, 28 Dec 2021 14:40:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8EEABC36AE7;
 Tue, 28 Dec 2021 14:40:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1640702430;
 bh=3byrm+yGxeKMJ9kNoapVVFJejVfsvroXVI00JX6Y684=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=cwKk5m2/mZUm+Bsf/+Fyq2v5OH3XgZW4Q2TKi6sy6PSQ/w0bAXqCo8NONWGZmcTJy
 BJssa4oCWgmmKeyUu7kX2JUXK38a8bre/c87Xfj/9ceJv/NcqRq+PJ4N70yty6LcDq
 y/OGDGHXvhc0Md2fFstFbtKsmS4bW4M3/wHrQnZ7YuS8o+T3JN/legZ+tl0EqGUFro
 Iu627DO+21OiKutZrMzZvJrt+/Fwj17vv33ogwOiEYvkKyMyqRVBl8Z7Ygyb8adhAe
 Tm5S8S4HOTMdYl9PtraKaDMsOITAsSKWjzW9D53BxB/ysL5Bv/6nR887OEFY2OZFOp
 mlX38KEoDgDWA==
From: guoren@kernel.org
To: guoren@kernel.org, palmer@dabbelt.com, arnd@arndb.de, anup.patel@wdc.com,
 gregkh@linuxfoundation.org, liush@allwinnertech.com, wefu@redhat.com,
 drew@beagleboard.org, wangjunqiang@iscas.ac.cn, hch@infradead.org
Cc: linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-csky@vger.kernel.org, linux-s390@vger.kernel.org,
 sparclinux@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 inux-parisc@vger.kernel.org, linux-mips@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, x86@kernel.org,
 Guo Ren <guoren@linux.alibaba.com>
Subject: [PATCH V2 03/17] asm-generic: fcntl: compat: Remove duplicate
 definitions
Date: Tue, 28 Dec 2021 22:39:44 +0800
Message-Id: <20211228143958.3409187-4-guoren@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211228143958.3409187-1-guoren@kernel.org>
References: <20211228143958.3409187-1-guoren@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211228_064034_173106_60FDE436 
X-CRM114-Status: GOOD (  10.65  )
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

From: Guo Ren <guoren@linux.alibaba.com>

Remove duplicate F_GETLK64,F_SETLK64,F_SETLKW64 definitions in
arch/*/include/asm/compat.h.

Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
Signed-off-by: Guo Ren <guoren@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>
---
 arch/arm64/include/asm/compat.h   | 4 ----
 arch/powerpc/include/asm/compat.h | 4 ----
 arch/s390/include/asm/compat.h    | 4 ----
 arch/sparc/include/asm/compat.h   | 4 ----
 arch/x86/include/asm/compat.h     | 4 ----
 include/uapi/asm-generic/fcntl.h  | 2 +-
 6 files changed, 1 insertion(+), 21 deletions(-)

diff --git a/arch/arm64/include/asm/compat.h b/arch/arm64/include/asm/compat.h
index eaa6ca062d89..276328765408 100644
--- a/arch/arm64/include/asm/compat.h
+++ b/arch/arm64/include/asm/compat.h
@@ -73,10 +73,6 @@ struct compat_flock {
 	compat_pid_t	l_pid;
 };
 
-#define F_GETLK64	12	/*  using 'struct flock64' */
-#define F_SETLK64	13
-#define F_SETLKW64	14
-
 struct compat_flock64 {
 	short		l_type;
 	short		l_whence;
diff --git a/arch/powerpc/include/asm/compat.h b/arch/powerpc/include/asm/compat.h
index 7afc96fb6524..83d8f70779cb 100644
--- a/arch/powerpc/include/asm/compat.h
+++ b/arch/powerpc/include/asm/compat.h
@@ -52,10 +52,6 @@ struct compat_flock {
 	compat_pid_t	l_pid;
 };
 
-#define F_GETLK64	12	/*  using 'struct flock64' */
-#define F_SETLK64	13
-#define F_SETLKW64	14
-
 struct compat_flock64 {
 	short		l_type;
 	short		l_whence;
diff --git a/arch/s390/include/asm/compat.h b/arch/s390/include/asm/compat.h
index cdc7ae72529d..0f14b3188b1b 100644
--- a/arch/s390/include/asm/compat.h
+++ b/arch/s390/include/asm/compat.h
@@ -110,10 +110,6 @@ struct compat_flock {
 	compat_pid_t	l_pid;
 };
 
-#define F_GETLK64       12
-#define F_SETLK64       13
-#define F_SETLKW64      14    
-
 struct compat_flock64 {
 	short		l_type;
 	short		l_whence;
diff --git a/arch/sparc/include/asm/compat.h b/arch/sparc/include/asm/compat.h
index bd949fcf9d63..108078751bb5 100644
--- a/arch/sparc/include/asm/compat.h
+++ b/arch/sparc/include/asm/compat.h
@@ -84,10 +84,6 @@ struct compat_flock {
 	short		__unused;
 };
 
-#define F_GETLK64	12
-#define F_SETLK64	13
-#define F_SETLKW64	14
-
 struct compat_flock64 {
 	short		l_type;
 	short		l_whence;
diff --git a/arch/x86/include/asm/compat.h b/arch/x86/include/asm/compat.h
index 7516e4199b3c..8d19a212f4f2 100644
--- a/arch/x86/include/asm/compat.h
+++ b/arch/x86/include/asm/compat.h
@@ -58,10 +58,6 @@ struct compat_flock {
 	compat_pid_t	l_pid;
 };
 
-#define F_GETLK64	12	/*  using 'struct flock64' */
-#define F_SETLK64	13
-#define F_SETLKW64	14
-
 /*
  * IA32 uses 4 byte alignment for 64 bit quantities,
  * so we need to pack this structure.
diff --git a/include/uapi/asm-generic/fcntl.h b/include/uapi/asm-generic/fcntl.h
index ecd0f5bdfc1d..5bc1e51d73b1 100644
--- a/include/uapi/asm-generic/fcntl.h
+++ b/include/uapi/asm-generic/fcntl.h
@@ -116,7 +116,7 @@
 #define F_GETSIG	11	/* for sockets. */
 #endif
 
-#ifndef CONFIG_64BIT
+#if !defined(CONFIG_64BIT) || defined(CONFIG_COMPAT)
 #ifndef F_GETLK64
 #define F_GETLK64	12	/*  using 'struct flock64' */
 #define F_SETLK64	13
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
