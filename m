Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06E81C7EE23
	for <linux-riscv@archiver.kernel.org>; Thu, 18 May 2023 17:12:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XJYKYjMPP8cs2V0mNTXOoCi2DaC5YUU79Z7u/ywDJEk=; b=rHT8RjChGlOdVW
	z3t0VezWVsW4RJNEebajRq9JUcVmHUzT+JUofqktBIL3WySquiFDfr+U8g9wumqKkpcv9GVFs9D4Q
	U6VJnnzCB4dkj2JZ2mLrXZaAXy+tGXFA82BFaQ3Ge/jitcY+d8yg9J3guJJEbuaan4crRLZzQMa1q
	6fVu1wPtGlUrY+uJcHjWXSUKtCjfKrSkkDYHlxFVWY2KgsZ1LhG6bmDtOgpTom7Clw/fa3+z1mf4a
	NJ0M4zZNq5maWGKzu5tOHf8v4zlxFvC9maPHbFjo4iSYVUmpc1T6PBG6aIhRaocrBvTVoVbE3Cayp
	zRwMInrDy5n3nwQm6fCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pzhAY-00DaxD-1H;
	Thu, 18 May 2023 17:12:02 +0000
Received: from bg4.exmail.qq.com ([43.154.54.12])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pzhAT-00Davh-3B
	for linux-riscv@lists.infradead.org;
	Thu, 18 May 2023 17:12:01 +0000
X-QQ-mid: bizesmtp68t1684429433tu2oywf5
Received: from linux-lab-host.localdomain ( [119.123.131.162])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Fri, 19 May 2023 01:03:52 +0800 (CST)
X-QQ-SSF: 01200000000000C0V000000A0000000
X-QQ-FEAT: 52Hx6s90yLUx+utHt+6bFHvQXW0WiAszRJitTBNppc4EY8DRALtcS1CtKQmqa
	TlWtRfGFRGdejKhmIK/ziEf82MHLcOCF001VkX/uXD0B++NhRtTTDurusfZESve9dnnCNgi
	U9kLGSI7H5NovK8Rgj69s+0mxS+gcgeFK5f04VREl2E2oDKb2UCJ58NxYZtirW4PjGxaWLK
	9/XKatAVxn3FMJyE0UnD0GrU3aB6SS1sWsAPGi5YpxGRrPReBfcgFn4rMltjipWtP39m5nO
	/5zvjVkwm2aRD8tQepNl9SrNYf1dckkmjtIfWrRL8Ot2aVtRUuMBqpL5kNDxD5a8dezAs1J
	vfjeSpTfnhNqZiZyu6VAHo+loFHyNWHSAgdXVSidN1akhiKr4czN4x8zk31KQ==
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 3862181891431925915
From: Zhangjin Wu <falcon@tinylab.org>
To: Willy Tarreau <w@1wt.eu>,
	Palmer Dabbelt <palmer@rivosinc.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>
Cc: "Paul E . McKenney" <paulmck@kernel.org>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Zhangjin Wu <falcon@tinylab.org>
Subject: [PATCH 2/2] tools/nolibc: riscv: Support __NR_llseek for rv32
Date: Fri, 19 May 2023 01:03:50 +0800
Message-Id: <d1d2eabc49e9c8790470010d161ff297c172096c.1684425792.git.falcon@tinylab.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1684425792.git.falcon@tinylab.org>
References: <cover.1684425792.git.falcon@tinylab.org>
MIME-Version: 1.0
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:tinylab.org:qybglogicsvrsz:qybglogicsvrsz3a-3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230518_101158_329449_7C13EA05 
X-CRM114-Status: UNSURE (   8.10  )
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

There is no __NR_lseek for rv32, use __NR_llseek instead.

This code is based on sysdeps/unix/sysv/linux/lseek.c of glibc.

Signed-off-by: Zhangjin Wu <falcon@tinylab.org>
---
 tools/include/nolibc/std.h |  1 +
 tools/include/nolibc/sys.h | 19 +++++++++++++++++++
 2 files changed, 20 insertions(+)

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
index 5d624dc63a42..ab32f3c0a460 100644
--- a/tools/include/nolibc/sys.h
+++ b/tools/include/nolibc/sys.h
@@ -668,7 +668,26 @@ int link(const char *old, const char *new)
 static __attribute__((unused))
 off_t sys_lseek(int fd, off_t offset, int whence)
 {
+#ifdef __NR_lseek
 	return my_syscall3(__NR_lseek, fd, offset, whence);
+#elif defined(__NR_llseek)
+	loff_t res;
+	off_t retval;
+
+	int rc = my_syscall5(__NR_llseek, fd, (long) (((uint64_t) (offset)) >> 32), (long) offset, &res, whence);
+
+	if (rc)
+		return rc;
+
+	retval = (off_t) res;
+	if (retval == res)
+		return retval;
+
+	SET_ERRNO(EOVERFLOW);
+	return (off_t) -1;
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
