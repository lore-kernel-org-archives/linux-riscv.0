Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 926BEC77B7C
	for <linux-riscv@archiver.kernel.org>; Wed, 24 May 2023 17:41:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VW/nQ6yDCt+UIG3TPCxZo7gT8wVOK8aMH8JkLg1b+Co=; b=fyBDur1tSGNJ5a
	xoZqpM05TDzZE0vZtt1F1RURIeGb+nrGPI4QdvVcotWsp0BIK7gbrtAh2IpMkkV+7mneMOCBYWGjT
	ItvuvJbY+kmI8o3yWJRSqwJRFD+foauswUXa2LMC4NV51/hKhiQl4YQmWWcUkPp793DyNd/AKnzWg
	5YNBPohY9+DsyarovNgtF/dQ2Eje3ebTgYPSsOGsZt+MRIMbSAZjceDS4uAoMr8plbFRGaVljhjbN
	QqrEjrBb78nU4QnIMy/PgYOlizn2xNiQFOBh+MCOlZqZp6K7RsOtiE1eO3RFceXMILN96jlGNUI1r
	qbzCMaOsxMwPkgRX+AgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q1sUD-00EE8W-2K;
	Wed, 24 May 2023 17:41:21 +0000
Received: from bg4.exmail.qq.com ([43.154.54.12])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q1sUA-00EE6p-1f
	for linux-riscv@lists.infradead.org;
	Wed, 24 May 2023 17:41:20 +0000
X-QQ-mid: bizesmtp85t1684950069tkbe1e2d
Received: from linux-lab-host.localdomain ( [116.30.125.36])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Thu, 25 May 2023 01:41:08 +0800 (CST)
X-QQ-SSF: 01200000000000D0V000000A0000000
X-QQ-FEAT: ymkv9EwBIzIqdJHXz1tqkq1Xg/DZPmkYs3TYAOpX5T7lHwTwTwis4rf2mwKFE
	ieDnbszxtjK2OAL7YE2gUPRLdWypPjkjaRhPGXRbx5dlmtZiULOtw7P7XD2aTb7WChN22gt
	+p+oJOz/ld1s36+Y5HLYRZ+6j9LYEwPb7u1+5HMIWWZtn5+fAK+Dxry+5TJZmF/TQ5AW9Xz
	CRyBs923a/CV3bsZPZtqThtsORSKPAtHO9jdjXmQVwKAIDSffJdR9hO5v6QRIlHdL/Clvs8
	1zHRswgNcSBP8wNh+2l4cYYjDr62+2dRdZBMuwaM5EmTdiDFcskXJ7PO74thD79yjH1VQbI
	+AcdX1ozF9N8Op3VjzWCAWk59keifaWIKuiJNGj/RqMBsPMFJpwSzkswbimyA==
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 4465477485056657340
From: Zhangjin Wu <falcon@tinylab.org>
To: w@1wt.eu
Cc: falcon@tinylab.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	palmer@dabbelt.com,
	paul.walmsley@sifive.com,
	thomas@t-8ch.de
Subject: [PATCH 01/13] Revert "tools/nolibc: riscv: Support __NR_llseek for rv32"
Date: Thu, 25 May 2023 01:41:06 +0800
Message-Id: <c8221575c0c2edebf15aea67e1dcd6ce09f01157.1684949267.git.falcon@tinylab.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1684949267.git.falcon@tinylab.org>
References: <cover.1684949267.git.falcon@tinylab.org>
MIME-Version: 1.0
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:tinylab.org:qybglogicsvrsz:qybglogicsvrsz3a-3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230524_104118_878708_DA89E905 
X-CRM114-Status: UNSURE (   7.12  )
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

This reverts commit d2c3acba6d66 to prepare for a whole new patch later.

Signed-off-by: Zhangjin Wu <falcon@tinylab.org>
---
 tools/include/nolibc/std.h |  1 -
 tools/include/nolibc/sys.h | 19 -------------------
 2 files changed, 20 deletions(-)

diff --git a/tools/include/nolibc/std.h b/tools/include/nolibc/std.h
index 83c0b0cb9564..933bc0be7e1c 100644
--- a/tools/include/nolibc/std.h
+++ b/tools/include/nolibc/std.h
@@ -32,6 +32,5 @@ typedef   signed long         off_t;
 typedef   signed long     blksize_t;
 typedef   signed long      blkcnt_t;
 typedef   signed long        time_t;
-typedef     long long        loff_t;
 
 #endif /* _NOLIBC_STD_H */
diff --git a/tools/include/nolibc/sys.h b/tools/include/nolibc/sys.h
index 7874062bea95..d5792a5de70b 100644
--- a/tools/include/nolibc/sys.h
+++ b/tools/include/nolibc/sys.h
@@ -671,26 +671,7 @@ int link(const char *old, const char *new)
 static __attribute__((unused))
 off_t sys_lseek(int fd, off_t offset, int whence)
 {
-#ifdef __NR_lseek
 	return my_syscall3(__NR_lseek, fd, offset, whence);
-#elif defined(__NR_llseek)
-	loff_t res;
-	off_t retval;
-
-	int rc = my_syscall5(__NR_llseek, fd, (long) (((uint64_t) (offset)) >> 32), (long) offset, &res, whence);
-
-	if (rc)
-		return rc;
-
-	retval = (off_t) res;
-	if (retval == res)
-		return retval;
-
-	SET_ERRNO(EOVERFLOW);
-	return (off_t) -1;
-#else
-#error Neither __NR_lseek nor __NR_llseek defined, cannot implement sys_lseek()
-#endif
 }
 
 static __attribute__((unused))
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
