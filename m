Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7AE2C77B7C
	for <linux-riscv@archiver.kernel.org>; Wed, 24 May 2023 17:56:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5CA6330LsXHiePjejln7R3IIsqAtubLioAsBqBsm3cM=; b=nJ+yQoQ+ofYyG3
	MGR63vrhf+4TPW9I2YvS/rpm0uBc3JOSCXTRCNkThYySHsYhEKc4Pk0pUfQm8g10jBO4Y/HOwblc6
	kEPhp+kDGB6HuzPN//dCASQsJnvYhh5RL5bOnyZ84ti+04CuvcyvGWq4OVkC2xMrtYbClyDH9D/aC
	LzGCnMYi6wKJ8lpNFaxbsIhRJIfLK6fB1CtFOhuC2Dxhq1lPOvxH6A/Im+fg7WALNXwgY/KETsFSS
	SJZoPASvtUDD8PtGtlxPTAUzAf+dumtvwzsbs+Wm3mArKWUrwFW506w0LgIczTpIR1uyajWJiuuWx
	PiL/NIFm8hh0lAAWMKKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q1sir-00EHmv-1Y;
	Wed, 24 May 2023 17:56:29 +0000
Received: from bg4.exmail.qq.com ([43.154.54.12])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q1sin-00EHl6-2k
	for linux-riscv@lists.infradead.org;
	Wed, 24 May 2023 17:56:27 +0000
X-QQ-mid: bizesmtp83t1684950976taj01xsk
Received: from linux-lab-host.localdomain ( [116.30.125.36])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Thu, 25 May 2023 01:56:14 +0800 (CST)
X-QQ-SSF: 01200000000000D0V000000A0000000
X-QQ-FEAT: 3M0okmaRx3heRPkZGAvThL5q8yJbl4iq2g+n/V08QcrkuDixKCO+Kd5/chZ81
	RzQT/uozjLZp+bJTDwM4DrjefAVoP6YAkePF7XNpTK/nJeuf9WQLmw0zG25rrehB1prqfgh
	Mxe/FZ2oQE83jxi0IwkPYBpg1nhziKdy250rcb2fxzd2Y14WfvDQutJBG35HFVq8BnVLs7O
	P8KDx0A/JpQyxXInpBxAh2ptKYxoEApcMkJMZmv56mSHAl/oZrtg2VYwPJm4gT9nt9jEq1L
	c4eGTgncEQWLJLlWkWX99AdeN6dGvF7IcjRuEmGdHroUaPPPUybeEoz2wiy/oTiy6tvnQ3v
	Dn5Dy/0Ii+6Wiu+MMEXg7lf4YzUemtxh5Zhk5Dp+Tsn/rDdZtH0dxeEjPUGUQ==
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 1222464122104175739
From: Zhangjin Wu <falcon@tinylab.org>
To: w@1wt.eu
Cc: falcon@tinylab.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	palmer@dabbelt.com,
	paul.walmsley@sifive.com,
	thomas@t-8ch.de
Subject: [PATCH 08/13] tools/nolibc: sys_lseek: riscv: use __NR_llseek for rv32
Date: Thu, 25 May 2023 01:55:39 +0800
Message-Id: <f25526b466803d6826dd9c5bb1489a5276cf58b0.1684949268.git.falcon@tinylab.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1684949267.git.falcon@tinylab.org>
References: <cover.1684949267.git.falcon@tinylab.org>
MIME-Version: 1.0
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:tinylab.org:qybglogicsvrsz:qybglogicsvrsz3a-3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230524_105626_197294_C314304C 
X-CRM114-Status: UNSURE (   8.47  )
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

riscv uses the generic include/uapi/asm-generic/unistd.h, it has code
like this:

  #if __BITS_PER_LONG == 64 && !defined(__SYSCALL_COMPAT)
  #define __NR_lseek __NR3264_lseek
  #else
  #define __NR_llseek __NR3264_lseek
  #endif

There is no __NR_lseek for rv32, use __NR_llseek instead.

This code is based on sysdeps/unix/sysv/linux/lseek.c of glibc.

Signed-off-by: Zhangjin Wu <falcon@tinylab.org>
Signed-off-by: Willy Tarreau <w@1wt.eu>
---
 tools/include/nolibc/std.h |  1 +
 tools/include/nolibc/sys.h | 18 ++++++++++++++++++
 2 files changed, 19 insertions(+)

diff --git a/tools/include/nolibc/std.h b/tools/include/nolibc/std.h
index 933bc0be7e1c..83c0b0cb9564 100644
--- a/tools/include/nolibc/std.h
+++ b/tools/include/nolibc/std.h
@@ -32,5 +32,6 @@ typedef   signed long         off_t;
 typedef   signed long     blksize_t;
 typedef   signed long      blkcnt_t;
 typedef   signed long        time_t;
+typedef     long long        loff_t;
 
 #endif /* _NOLIBC_STD_H */
diff --git a/tools/include/nolibc/sys.h b/tools/include/nolibc/sys.h
index d5792a5de70b..0ff77c0a06d7 100644
--- a/tools/include/nolibc/sys.h
+++ b/tools/include/nolibc/sys.h
@@ -671,7 +671,25 @@ int link(const char *old, const char *new)
 static __attribute__((unused))
 off_t sys_lseek(int fd, off_t offset, int whence)
 {
+#ifdef __NR_lseek
 	return my_syscall3(__NR_lseek, fd, offset, whence);
+#elif defined(__NR_llseek)
+	loff_t result;
+	off_t retval;
+	int ret;
+
+	ret = my_syscall5(__NR_llseek, fd, (long) (((uint64_t) (offset)) >> 32), (long) offset, &result, whence);
+	if (ret)
+		return ret;
+
+	retval = (off_t) result;
+	if (retval != result)
+		return -EOVERFLOW;
+
+	return retval;
+#else
+#error Neither __NR_lseek nor __NR_llseek defined, cannot implement sys_lseek()
+#endif
 }
 
 static __attribute__((unused))
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
