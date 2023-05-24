Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC9F0C77B7A
	for <linux-riscv@archiver.kernel.org>; Wed, 24 May 2023 17:57:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+inc83yX1dOXwtO1Gzwat6vj+quvd7wPbRlxt5rU+D4=; b=LRYGnJLfkEwoj/
	sPwl8Zh5o+4PV8BpNmPTnMaqfytp0NxVM0uPg06MLHdrCrkQEYihAAMZzAiERC1VDPBKVxHf3zjmG
	FmnBPDtxitOI3G4zk8ips8k7fyeBqJolbQpLOKdAcNtIMXjTynmqLml9+AVGp3zMFyxh3Jfwsrwxb
	0yb+WMvOX5C/TNRTbhsbYYDFICG8V6ZghnXswvXA5s/CZI4twZL5DT/W759fwtVbMRi2kbJhY7B7J
	JChL3+7U7ktjVxD0QHJ0m4v6i1CW8tIFkzCsNw3Jhyy1ZcYzaaB1655FRdB2kWNL88pv9CqF0JmAm
	V0UzEOF1Beu72M+HueXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q1sk4-00EIAO-1p;
	Wed, 24 May 2023 17:57:44 +0000
Received: from bg4.exmail.qq.com ([43.155.65.254])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q1sk1-00EI8A-1E
	for linux-riscv@lists.infradead.org;
	Wed, 24 May 2023 17:57:42 +0000
X-QQ-mid: bizesmtp69t1684951051toedm1f2
Received: from linux-lab-host.localdomain ( [116.30.125.36])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Thu, 25 May 2023 01:57:30 +0800 (CST)
X-QQ-SSF: 01200000000000D0V000000A0000000
X-QQ-FEAT: 1U/NVTUyJNR0Bdf3bNTIg9tVMMQ36KW+m0gOe7QYfuSjie+syXUksgUIyPwT9
	XfFw8T5ZcY0Gquio8enXfYroGAwnsHycofnfTqboltbdqCDUUnRUVfDdQvLU4WvGApwZDmN
	bAN6znioI8PEsk337ISXWj6upRE/YjYx52ag3fsAJyiq4tZ26fjpekhGMHr/nYoxUoDKTYU
	6S9Cj0J1aASneoJI34cnjcZTI00YRCWzxAihgavquQbYb9F5spPI4fNfgj/l9yZIVq6KWXo
	a6u2uupdH0bFQEDqTZhEIceDjXFL2DwMqyhdHjNld9/7nfjCGEzUsIU/oflxOuhOMH7GnTA
	mW8SbP+DccbvKioNg2HMYwFQW6yUW75OfYEsj38yT1ZpwZ2SpCTFlWISeGvAQ==
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 7132561189251988013
From: Zhangjin Wu <falcon@tinylab.org>
To: w@1wt.eu
Cc: falcon@tinylab.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	palmer@dabbelt.com,
	paul.walmsley@sifive.com,
	thomas@t-8ch.de
Subject: [PATCH 09/13] tools/nolibc: sys_poll: riscv: use __NR_ppoll_time64 for rv32
Date: Thu, 25 May 2023 01:57:24 +0800
Message-Id: <ec5af2ae25264eddce4b50380bfd24f9490eca75.1684949268.git.falcon@tinylab.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1684949267.git.falcon@tinylab.org>
References: <cover.1684949267.git.falcon@tinylab.org>
MIME-Version: 1.0
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:tinylab.org:qybglogicsvrsz:qybglogicsvrsz3a-3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230524_105741_714473_781200F6 
X-CRM114-Status: GOOD (  11.05  )
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

rv32 uses the generic include/uapi/asm-generic/unistd.h and it has no
__NR_ppoll after kernel commit d4c08b9776b3 ("riscv: Use latest system
call ABI"), use __NR_ppoll_time64 instead.

Signed-off-by: Zhangjin Wu <falcon@tinylab.org>
---
 tools/include/nolibc/std.h   | 1 +
 tools/include/nolibc/sys.h   | 7 ++++++-
 tools/include/nolibc/types.h | 6 ++++++
 3 files changed, 13 insertions(+), 1 deletion(-)

diff --git a/tools/include/nolibc/std.h b/tools/include/nolibc/std.h
index 83c0b0cb9564..221385c0e823 100644
--- a/tools/include/nolibc/std.h
+++ b/tools/include/nolibc/std.h
@@ -32,6 +32,7 @@ typedef   signed long         off_t;
 typedef   signed long     blksize_t;
 typedef   signed long      blkcnt_t;
 typedef   signed long        time_t;
+typedef     long long       time64_t;
 typedef     long long        loff_t;
 
 #endif /* _NOLIBC_STD_H */
diff --git a/tools/include/nolibc/sys.h b/tools/include/nolibc/sys.h
index 0ff77c0a06d7..08d38175bd7b 100644
--- a/tools/include/nolibc/sys.h
+++ b/tools/include/nolibc/sys.h
@@ -923,8 +923,13 @@ int pivot_root(const char *new, const char *old)
 static __attribute__((unused))
 int sys_poll(struct pollfd *fds, int nfds, int timeout)
 {
-#if defined(__NR_ppoll)
+#if defined(__NR_ppoll) || defined(__NR_ppoll_time64)
+#ifdef __NR_ppoll
 	struct timespec t;
+#else
+	struct timespec64 t;
+#define __NR_ppoll __NR_ppoll_time64
+#endif
 
 	if (timeout >= 0) {
 		t.tv_sec  = timeout / 1000;
diff --git a/tools/include/nolibc/types.h b/tools/include/nolibc/types.h
index 15b0baffd336..ee914391439c 100644
--- a/tools/include/nolibc/types.h
+++ b/tools/include/nolibc/types.h
@@ -203,6 +203,12 @@ struct stat {
 	time_t    st_ctime;   /* time of last status change */
 };
 
+/* needed by time64 syscalls */
+struct timespec64 {
+	time64_t	tv_sec;		/* seconds */
+	long		tv_nsec;	/* nanoseconds */
+};
+
 /* WARNING, it only deals with the 4096 first majors and 256 first minors */
 #define makedev(major, minor) ((dev_t)((((major) & 0xfff) << 8) | ((minor) & 0xff)))
 #define major(dev) ((unsigned int)(((dev) >> 8) & 0xfff))
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
