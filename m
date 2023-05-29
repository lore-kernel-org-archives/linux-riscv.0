Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6311CC7EE23
	for <linux-riscv@archiver.kernel.org>; Mon, 29 May 2023 19:55:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HxnwkFvMHdcg+X2HGzQYhZGergtNvcwvyDxDFYENFPc=; b=010DPKG9Do+60k
	+njnB0dP7pIxtVw5QFThIoIHGN0pyaUaEB9IxOHGV+eYzmoALJdej5iBhjqLPoR4oe5QVFxNslD8o
	h0o55ieK7JDrGiNXRn6x8nj8Ki0p2FpamJR1R5M6F/sGZx29g7Az3eNTi03tS3Hn4dwB50ZBSgn0c
	YB7rJ5ZtCGO87nA3Q7mcmS1acuiXj6Fsw5l+1FP0XL61ZQJkohApJk0tW209FPyyAvioTRXtawXFN
	hWG7w5m/q/YAg2P0+wfBMh+Jtk9GRlB/prnnpXPbcmKRxdOgsRyo/bSZ1OQag/uK0akfSVV7zFcVH
	kf4YBG0te6Tvi4T44USw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q3ixT-00BZHB-2m;
	Mon, 29 May 2023 19:55:11 +0000
Received: from bg4.exmail.qq.com ([43.155.65.254])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q3ixR-00BZEz-1V
	for linux-riscv@lists.infradead.org;
	Mon, 29 May 2023 19:55:10 +0000
X-QQ-mid: bizesmtp74t1685390094tpc5r986
Received: from linux-lab-host.localdomain ( [119.123.130.80])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Tue, 30 May 2023 03:54:53 +0800 (CST)
X-QQ-SSF: 01200000000000D0V000000A0000000
X-QQ-FEAT: uGhnJwy6xZISo/AEbiO2R7D9Bkp1qAC1x25dTn245rn0AypFebeWwalodNjhE
	EL0Hxl2tTtRKwyjA9hWn6rJEMWZwJ13M7sTzYmfFM1VAENq33hSqeuCTSPxUjmRP8In5z0j
	jE3PPH0La2QBf3gtfL4qavbfPRbU9RB/PQuJibgW2/x+jjWS9xtIWSHbLtt65NMZEKdLaN8
	dkZK4Ia/D7JyiFc+a1Kz4je5B5SnuVU37OtBIhZa6tgmgd8wfgtSuev0V/BKN+5P6bH/hRU
	5o3Ae2l3mwfoTcHHys8UBybwBk03+OCAL3pFbxALn8Bt+8SyD8qmmeKLiKKhfao3WsglZUh
	Asti4FqiHE3VbrkVNKSBjtA3A/Az2xVvvEmvGiv9bla+QGTOev9aF8pmMHpuQ==
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 5796279202276383086
From: Zhangjin Wu <falcon@tinylab.org>
To: w@1wt.eu
Cc: arnd@arndb.de,
	falcon@tinylab.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	thomas@t-8ch.de
Subject: [PATCH v2 07/13] tools/nolibc: sys_lseek: add pure 64bit lseek
Date: Tue, 30 May 2023 03:54:23 +0800
Message-Id: <2f5c3338898da65210ad3f62d7b7773a96f6d251.1685387484.git.falcon@tinylab.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1685387484.git.falcon@tinylab.org>
References: <cover.1685387484.git.falcon@tinylab.org>
MIME-Version: 1.0
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:tinylab.org:qybglogicsvrsz:qybglogicsvrsz3a-3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230529_125509_803646_C50D2EC5 
X-CRM114-Status: UNSURE (   7.09  )
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

use sys_llseek instead of sys_lseek to add 64bit seek even in 32bit
platforms.

This code is based on sysdeps/unix/sysv/linux/lseek.c of glibc and
src/unistd/lseek.c of musl.

Signed-off-by: Zhangjin Wu <falcon@tinylab.org>
Signed-off-by: Willy Tarreau <w@1wt.eu>
---
 tools/include/nolibc/sys.h | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/tools/include/nolibc/sys.h b/tools/include/nolibc/sys.h
index 98cfa2f6d021..d0720af84b6d 100644
--- a/tools/include/nolibc/sys.h
+++ b/tools/include/nolibc/sys.h
@@ -672,7 +672,17 @@ int link(const char *old, const char *new)
 static __attribute__((unused))
 off_t sys_lseek(int fd, off_t offset, int whence)
 {
+#if defined(__NR_llseek) || defined(__NR__llseek)
+#ifndef __NR__llseek
+#define __NR__llseek __NR_llseek
+#endif
+	off_t result;
+	return my_syscall5(__NR__llseek, fd, offset >> 32, offset, &result, whence) ?: result;
+#elif defined(__NR_lseek)
 	return my_syscall3(__NR_lseek, fd, offset, whence);
+#else
+#error None of __NR_lseek, __NR_llseek nor __NR__llseek defined, cannot implement sys_lseek()
+#endif
 }
 
 static __attribute__((unused))
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
