Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBDE9EB64D7
	for <linux-riscv@archiver.kernel.org>; Wed, 28 Jun 2023 13:30:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WEdRuinENARD9t+LEJMFZAVfjmZjZHC381Jb7tXXtic=; b=kXYDeX8b3a/Qte
	98iGTDyWl1oPLEKWlL18q6/8kPJ/uAXyVIBF6l/J9YnCOIU0GwdRUdVZg+R+31C5XGZrjbf+gqmKO
	tdy3SN4LBfNe8ifRPCqJO80+WWQTsp2dyc63wm48cTEyWPAXfF7SMlRt/jEMAxfPhL+1c4WRRen6U
	9iUeGdjv/Qc7oBIK2Wb4LNWBOm5TYfLgNhAl3RzyccV4VNS21xwJsUX0Y2Zg9DBb7/XARX9ekH91Y
	BQUx+nmnIgEkHy0ii09RYY1yKpSiApvOM+Yb04HM1yrlvKkFGH47gj9mCYGHbAhg7KM6gU9MXGWoB
	nVguwTHCsSZTIo8OrfIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qEVFy-00Fm3Q-2y;
	Wed, 28 Jun 2023 13:30:50 +0000
Received: from bg4.exmail.qq.com ([43.154.221.58])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qEVFt-00Fm1K-1j
	for linux-riscv@lists.infradead.org;
	Wed, 28 Jun 2023 13:30:48 +0000
X-QQ-mid: bizesmtp62t1687959022tib37q6q
Received: from linux-lab-host.localdomain ( [116.30.129.193])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Wed, 28 Jun 2023 21:30:20 +0800 (CST)
X-QQ-SSF: 01200000000000D0V000000A0000000
X-QQ-FEAT: LE7C6P2vL8S1CRIbgI3gKZWFO4BCex2pqEfZtd/aX85aJ9sjdLMhw/y0Ap4tA
	7fHeizX68awglr5Opdxyh1pyvulK+J5cwyQFi0jpVR9W0e7iLNrrSLzAjXQI4ptIaAtgkqw
	/mDAJc4sQJ/jhWto1SZoK17Sdg5sHkxCIVC4A2mjnRhn7DE1KV+u0ueg6mOLQu2UP1KeIip
	Uhv/c4Wct8cBN45EWXwkRdNa9OtNasKLSnlrpf2xRniMG+fehkLsV+C4UEonZ+a1i0u9PgT
	NSR4jmWS0jHaPoy0P+3AipY3jTWBpD1iqyZgyEP8yHRyid9F0U5Gbc1GMiiVLg8PCRYV/GT
	Xi8EuPBsiJQ57h33gS9szn2ksgwW9VNGV8xGBOSphhLwE+qm82nrNY1BhQJJg==
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 2723118437991997148
From: Zhangjin Wu <falcon@tinylab.org>
To: thomas@t-8ch.de,
	w@1wt.eu
Cc: falcon@tinylab.org,
	arnd@arndb.de,
	david.laight@aculab.com,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: [PATCH v5 07/14] tools/nolibc: arch-loongarch.h: shrink with SYSCALL_CLOBBERLIST
Date: Wed, 28 Jun 2023 21:22:21 +0800
Message-Id: <a906a8e5bb39d88fee89be8f2bca8bf62307d468.1687957589.git.falcon@tinylab.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1687957589.git.falcon@tinylab.org>
References: <cover.1687957589.git.falcon@tinylab.org>
MIME-Version: 1.0
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:tinylab.org:qybglogicsvrgz:qybglogicsvrgz5a-1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230628_063045_878073_A0F149DC 
X-CRM114-Status: UNSURE (   6.74  )
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

my_syscall<N> share a same long clobber list, define a macro for them.

Signed-off-by: Zhangjin Wu <falcon@tinylab.org>
---
 tools/include/nolibc/arch-loongarch.h | 25 +++++++++++--------------
 1 file changed, 11 insertions(+), 14 deletions(-)

diff --git a/tools/include/nolibc/arch-loongarch.h b/tools/include/nolibc/arch-loongarch.h
index 292d6a58dc87..fbb4844f7993 100644
--- a/tools/include/nolibc/arch-loongarch.h
+++ b/tools/include/nolibc/arch-loongarch.h
@@ -23,6 +23,10 @@
  */
 #define __ARCH_WANT_SYS_PSELECT6
 
+#define SYSCALL_CLOBBERLIST			\
+	"memory", "$t0", "$t1", "$t2", "$t3",	\
+	"$t4", "$t5", "$t6", "$t7", "$t8"
+
 #define my_syscall0(num)							\
 ({										\
 	register long _num __asm__ ("a7") = (num);				\
@@ -32,8 +36,7 @@
 		"syscall 0\n"							\
 		: "=r"(_arg1)							\
 		: "r"(_num)							\
-		: "memory", "$t0", "$t1", "$t2", "$t3",				\
-		  "$t4", "$t5", "$t6", "$t7", "$t8"				\
+		: SYSCALL_CLOBBERLIST						\
 	);									\
 	_arg1;									\
 })
@@ -47,8 +50,7 @@
 		"syscall 0\n"							\
 		: "+r"(_arg1)							\
 		: "r"(_num)							\
-		: "memory", "$t0", "$t1", "$t2", "$t3",				\
-		  "$t4", "$t5", "$t6", "$t7", "$t8"				\
+		: SYSCALL_CLOBBERLIST						\
 	);									\
 	_arg1;									\
 })
@@ -64,8 +66,7 @@
 		: "+r"(_arg1)							\
 		: "r"(_arg2),							\
 		  "r"(_num)							\
-		: "memory", "$t0", "$t1", "$t2", "$t3",				\
-		  "$t4", "$t5", "$t6", "$t7", "$t8"				\
+		: SYSCALL_CLOBBERLIST						\
 	);									\
 	_arg1;									\
 })
@@ -82,8 +83,7 @@
 		: "+r"(_arg1)							\
 		: "r"(_arg2), "r"(_arg3),					\
 		  "r"(_num)							\
-		: "memory", "$t0", "$t1", "$t2", "$t3",				\
-		  "$t4", "$t5", "$t6", "$t7", "$t8"				\
+		: SYSCALL_CLOBBERLIST						\
 	);									\
 	_arg1;									\
 })
@@ -101,8 +101,7 @@
 		: "+r"(_arg1)							\
 		: "r"(_arg2), "r"(_arg3), "r"(_arg4),				\
 		  "r"(_num)							\
-		: "memory", "$t0", "$t1", "$t2", "$t3",				\
-		  "$t4", "$t5", "$t6", "$t7", "$t8"				\
+		: SYSCALL_CLOBBERLIST						\
 	);									\
 	_arg1;									\
 })
@@ -121,8 +120,7 @@
 		: "+r"(_arg1)							\
 		: "r"(_arg2), "r"(_arg3), "r"(_arg4), "r"(_arg5),		\
 		  "r"(_num)							\
-		: "memory", "$t0", "$t1", "$t2", "$t3",				\
-		  "$t4", "$t5", "$t6", "$t7", "$t8"				\
+		: SYSCALL_CLOBBERLIST						\
 	);									\
 	_arg1;									\
 })
@@ -142,8 +140,7 @@
 		: "+r"(_arg1)							\
 		: "r"(_arg2), "r"(_arg3), "r"(_arg4), "r"(_arg5), "r"(_arg6),	\
 		  "r"(_num)							\
-		: "memory", "$t0", "$t1", "$t2", "$t3",				\
-		  "$t4", "$t5", "$t6", "$t7", "$t8"				\
+		: SYSCALL_CLOBBERLIST						\
 	);									\
 	_arg1;									\
 })
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
