Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8145CEB64DC
	for <linux-riscv@archiver.kernel.org>; Wed, 28 Jun 2023 13:36:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cglaWYdC+kabktJNNnyiuVq6ryYK7VxtjLXlXG29My4=; b=1ZtZYaxOt8W4Pt
	hyfxAfJTCTGbvG+IwF9T9lai++1LArNCIm3t0gYPAulr3oFN3wewUMX1gHW6xLDGv9CdkbqxHIw7s
	b7ARLc/7cOBj9hQ7qxqrialiLuDlFDKYNmY6rj1B5oSvqBZp/5oZjA569k0KKrYZh6V1HSU9siZT1
	GUpiD3nBllz208DLi/AonTce4OBZq6oAPvEPEUg/+tg7eimDZV1zEFdDkhobYpUfpGL0DDzcEMrhg
	4tO4gglrRPSH90GDDtq071s0oYnGndDfV162cEhmd1EXsfoGyrSHSuJHix5nLBK072+ij83XclNEZ
	7WmXXM5dK6AWRS5U/Khg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qEVLq-00Fmib-2Q;
	Wed, 28 Jun 2023 13:36:54 +0000
Received: from bg4.exmail.qq.com ([43.155.67.158])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qEVLo-00FmhS-1N
	for linux-riscv@lists.infradead.org;
	Wed, 28 Jun 2023 13:36:54 +0000
X-QQ-mid: bizesmtp68t1687959386tfk2bzmm
Received: from linux-lab-host.localdomain ( [116.30.129.193])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Wed, 28 Jun 2023 21:36:24 +0800 (CST)
X-QQ-SSF: 01200000000000D0V000000A0000000
X-QQ-FEAT: znfcQSa1hKaTu/Ha7ZQ1+V2pKPKgcx9n9xqgBcc+SOYAX8h6kkRGQ1foUBAeE
	kncvdehoqJs9juDKWFcfnf91v40tNFH0eQpUaw2087LC37IxT3o70ShZHzxi4qbU8j9f4Jf
	OjQC38WI2V8z38rxPbae6PLJ7uZIFfF0g0UWlirZRWVd7RAIUtlkOg0YAdNOG7nAc701TXf
	g0LWaq6rxYsTiXEGw5rt3bGahKrMMBKAxfA1Z220RnBaJ+5lds/fz4bTaMuZjVqYqdKB4vJ
	CYpmXXl+DIMJE2YeOLonC/ZLLx35FWmy08Mx6wHrLSe8+5+1VVxXmzDcJcJDFWG5D/R9cFA
	zUiGHVhsiY0vSp2vIBMvWK7tymqDyhYUVoV5h3yHFMWKg9BnCvyvWng45N1mA==
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 10609451260477278999
From: Zhangjin Wu <falcon@tinylab.org>
To: thomas@t-8ch.de,
	w@1wt.eu
Cc: falcon@tinylab.org,
	arnd@arndb.de,
	david.laight@aculab.com,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: [PATCH v5 08/14] tools/nolibc: arch-mips.h: shrink with SYSCALL_CLOBBERLIST
Date: Wed, 28 Jun 2023 21:31:25 +0800
Message-Id: <9e932ce3fdba8ed744319b170ce094a916ac71be.1687957589.git.falcon@tinylab.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1687957589.git.falcon@tinylab.org>
References: <cover.1687957589.git.falcon@tinylab.org>
MIME-Version: 1.0
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:tinylab.org:qybglogicsvrsz:qybglogicsvrsz3a-3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230628_063652_771899_0BB02B10 
X-CRM114-Status: UNSURE (   7.55  )
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
 tools/include/nolibc/arch-mips.h | 22 ++++++++++------------
 1 file changed, 10 insertions(+), 12 deletions(-)

diff --git a/tools/include/nolibc/arch-mips.h b/tools/include/nolibc/arch-mips.h
index 1fd1eedc12a6..55a9f01825e0 100644
--- a/tools/include/nolibc/arch-mips.h
+++ b/tools/include/nolibc/arch-mips.h
@@ -57,6 +57,10 @@ struct sys_stat_struct {
  *     don't have to experience issues with register constraints.
  */
 
+#define SYSCALL_CLOBBERLIST			\
+	"memory", "cc", "at", "v1", "hi", "lo",	\
+	"t0", "t1", "t2", "t3", "t4", "t5", "t6", "t7", "t8", "t9"
+
 #define my_syscall0(num)							\
 ({										\
 	register long _num __asm__ ("v0") = (num);				\
@@ -68,8 +72,7 @@ struct sys_stat_struct {
 		"addiu $sp, $sp, 32\n"						\
 		: "=r"(_num), "=r"(_arg4)					\
 		: "r"(_num)							\
-		: "memory", "cc", "at", "v1", "hi", "lo",			\
-		  "t0", "t1", "t2", "t3", "t4", "t5", "t6", "t7", "t8", "t9"	\
+		: SYSCALL_CLOBBERLIST						\
 	);									\
 	_arg4 ? -_num : _num;							\
 })
@@ -87,8 +90,7 @@ struct sys_stat_struct {
 		: "=r"(_num), "=r"(_arg4)					\
 		: "0"(_num),							\
 		  "r"(_arg1)							\
-		: "memory", "cc", "at", "v1", "hi", "lo",			\
-		  "t0", "t1", "t2", "t3", "t4", "t5", "t6", "t7", "t8", "t9"	\
+		: SYSCALL_CLOBBERLIST						\
 	);									\
 	_arg4 ? -_num : _num;							\
 })
@@ -107,8 +109,7 @@ struct sys_stat_struct {
 		: "=r"(_num), "=r"(_arg4)					\
 		: "0"(_num),							\
 		  "r"(_arg1), "r"(_arg2)					\
-		: "memory", "cc", "at", "v1", "hi", "lo",			\
-		  "t0", "t1", "t2", "t3", "t4", "t5", "t6", "t7", "t8", "t9"	\
+		: SYSCALL_CLOBBERLIST						\
 	);									\
 	_arg4 ? -_num : _num;							\
 })
@@ -128,8 +129,7 @@ struct sys_stat_struct {
 		: "=r"(_num), "=r"(_arg4)					\
 		: "0"(_num),							\
 		  "r"(_arg1), "r"(_arg2), "r"(_arg3)				\
-		: "memory", "cc", "at", "v1", "hi", "lo",			\
-		  "t0", "t1", "t2", "t3", "t4", "t5", "t6", "t7", "t8", "t9"	\
+		: SYSCALL_CLOBBERLIST						\
 	);									\
 	_arg4 ? -_num : _num;							\
 })
@@ -149,8 +149,7 @@ struct sys_stat_struct {
 		: "=r" (_num), "=r"(_arg4)					\
 		: "0"(_num),							\
 		  "r"(_arg1), "r"(_arg2), "r"(_arg3), "r"(_arg4)		\
-		: "memory", "cc", "at", "v1", "hi", "lo",			\
-		  "t0", "t1", "t2", "t3", "t4", "t5", "t6", "t7", "t8", "t9"	\
+		: SYSCALL_CLOBBERLIST						\
 	);									\
 	_arg4 ? -_num : _num;							\
 })
@@ -172,8 +171,7 @@ struct sys_stat_struct {
 		: "=r" (_num), "=r"(_arg4)					\
 		: "0"(_num),							\
 		  "r"(_arg1), "r"(_arg2), "r"(_arg3), "r"(_arg4), "r"(_arg5)	\
-		: "memory", "cc", "at", "v1", "hi", "lo",			\
-		  "t0", "t1", "t2", "t3", "t4", "t5", "t6", "t7", "t8", "t9"	\
+		: SYSCALL_CLOBBERLIST						\
 	);									\
 	_arg4 ? -_num : _num;							\
 })
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
