Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15C33C3DA4A
	for <linux-riscv@archiver.kernel.org>; Thu, 22 Aug 2024 20:39:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=meNgGaidJgvhBiJXdFHfJZf43HdRTt/jo5NqPDBGGXw=; b=za5kYxewK/pdQK
	Z6AvJMUA9UF2Kvs4xxcWnZfDIHdcJiSE0dJaaC5OmRobys53wDpB34XGKS4d9l7DykNZnipZpkAX+
	kFnhNmfMh0KWXfCgzHpNW05YMp3UF2p484hToFk/txsL2Iz6WNyskZtC43CJRdl3NDKje8lDsEPgW
	Nh2DoDRTg+rXsjk4gj3StlS4wC+N2vuAWXKXZqc+UfNpDGEHuAvSvV0/lm8U/JJiZsI2UHv2LaZ3B
	oiWKLvFPfbtsP9h57j6ijpIyI63EWLhEfxUAbzLMbAG0lRKDvqxVFh70IrvacwxIMTnC7wFNpL2uI
	Rq5e7R/txHSycpgU763A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1shEaW-0000000EFiK-0BQM;
	Thu, 22 Aug 2024 20:39:20 +0000
Received: from mail-qk1-x72a.google.com ([2607:f8b0:4864:20::72a])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1shEaT-0000000EFhh-0izd
	for linux-riscv@lists.infradead.org;
	Thu, 22 Aug 2024 20:39:18 +0000
Received: by mail-qk1-x72a.google.com with SMTP id af79cd13be357-7a1e31bc1efso78458485a.3
        for <linux-riscv@lists.infradead.org>; Thu, 22 Aug 2024 13:39:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1724359154; x=1724963954; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=aVFB9PSUxxNQxYSa9Dc2uzxRSZf/ScsRdF3Dy3pBcbw=;
        b=jlgmFTYs1jppNQmqBALQjXeLSc6b2b4at4EAwwlBw5trD6XOF78LyBmjCI4J8YE1Yh
         ACNRCbpifbME2AMIBb7J4KFSh8XKcw0m0tKHf2/nrtwE/IConb3Z/thWByvLPEPs7p/3
         VY+UK1TSCaeDcsnHg8ZQcjYpKKWYro6C4LWZSdb6/mHbRkhaax9NwaZ2HSCcDOAOFL89
         DQX3NUq3FDEJgKl9Xsir1tz9wA726D5lgOpKrvrfvrhV4O2HJ2mOSaNg3moErqEfn4kp
         XyH9Z27XjXV1GA1kvyu18RPDiICMHwRh6tW7SZQMgaCEfkmjwYbjCehfQc42IPPHhwpF
         n8RQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724359154; x=1724963954;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aVFB9PSUxxNQxYSa9Dc2uzxRSZf/ScsRdF3Dy3pBcbw=;
        b=NFVC3Bx+E9qU9yav1nq/iVwKM2qnwDImBLj2ErkNmlD5Q4sogyED02DE0wG24l8yM1
         wL7BCW2YNUIa0OGTa3ggF+JkjhauzFQ8fMBcvCbNcazppUlerq+UVw53w9fdwojZ0GM4
         FxDBBEwd1ajYjZbGzwY43wcDJ9MiFo4tb6PPW/BCtgSFVNdI6d47UNMu7ZQke7q1XfcW
         DWiEZa8KMYaa8ILHtsc7I3BzsHdJ2A6tVElZbpk2C5r6I1n55a/Ou7uF2v86qAJKqvrV
         jWz95M32krioRJKJ28+eT9GLgFdeVfrV+O7O1wJ9f/4r0VMj5LI2fvCpG0VvID7hcQ7B
         qpjw==
X-Gm-Message-State: AOJu0YxfBAWdWmyw7w1u42f10zE3vBiMA/KhpXPNejAZk9olumQHJ9dL
	pXRbymEf3POx7bvOOSs6N1C8QKw1bM+sA1fIc6eEYnd2VXg1er8K7SDvqRQFOpTxZypqxYIIYca
	l
X-Google-Smtp-Source: AGHT+IEoRpx83TwCTADpbTIPE8iEGIQ8Pwle6TGVihkq7WkEL+JaskxzQiEWVFEUECXATS3MnClPBw==
X-Received: by 2002:a05:620a:1990:b0:7a2:d64:1cbc with SMTP id af79cd13be357-7a680a57533mr449953785a.26.1724359154139;
        Thu, 22 Aug 2024 13:39:14 -0700 (PDT)
Received: from jesse-desktop.. (pool-108-26-179-17.bstnma.fios.verizon.net. [108.26.179.17])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7a67f327ce2sm108846185a.1.2024.08.22.13.39.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Aug 2024 13:39:13 -0700 (PDT)
From: Jesse Taube <jesse@rivosinc.com>
To: linux-riscv@lists.infradead.org
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	=?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>,
	Conor Dooley <conor@kernel.org>,
	Evan Green <evan@rivosinc.com>,
	Charlie Jenkins <charlie@rivosinc.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	Jesse Taube <jesse@rivosinc.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] RISC-V: hwprobe: Use BIT macro to avoid warnings
Date: Thu, 22 Aug 2024 16:39:12 -0400
Message-ID: <20240822203913.2306574-1-jesse@rivosinc.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240822_133917_239116_0442B9BD 
X-CRM114-Status: UNSURE (   8.81  )
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

In uapi/asm/hwprobe.h file, (1 << N) is used to define the bit field
which causes checkpatch to warn. Use BIT(N) and BIT_ULL(N) to avoid
these warnings.

Signed-off-by: Jesse Taube <jesse@rivosinc.com>
Reviewed-by: Charlie Jenkins <charlie@rivosinc.com>
Tested-by: Charlie Jenkins <charlie@rivosinc.com>
---
V1 -> V2:
 - Reword commit message
---
 arch/riscv/include/uapi/asm/hwprobe.h | 102 +++++++++++++-------------
 1 file changed, 51 insertions(+), 51 deletions(-)

diff --git a/arch/riscv/include/uapi/asm/hwprobe.h b/arch/riscv/include/uapi/asm/hwprobe.h
index b706c8e47b02..d0874ff2fd37 100644
--- a/arch/riscv/include/uapi/asm/hwprobe.h
+++ b/arch/riscv/include/uapi/asm/hwprobe.h
@@ -21,57 +21,57 @@ struct riscv_hwprobe {
 #define RISCV_HWPROBE_KEY_MARCHID	1
 #define RISCV_HWPROBE_KEY_MIMPID	2
 #define RISCV_HWPROBE_KEY_BASE_BEHAVIOR	3
-#define		RISCV_HWPROBE_BASE_BEHAVIOR_IMA	(1 << 0)
+#define		RISCV_HWPROBE_BASE_BEHAVIOR_IMA	BIT_ULL(0)
 #define RISCV_HWPROBE_KEY_IMA_EXT_0	4
-#define		RISCV_HWPROBE_IMA_FD		(1 << 0)
-#define		RISCV_HWPROBE_IMA_C		(1 << 1)
-#define		RISCV_HWPROBE_IMA_V		(1 << 2)
-#define		RISCV_HWPROBE_EXT_ZBA		(1 << 3)
-#define		RISCV_HWPROBE_EXT_ZBB		(1 << 4)
-#define		RISCV_HWPROBE_EXT_ZBS		(1 << 5)
-#define		RISCV_HWPROBE_EXT_ZICBOZ	(1 << 6)
-#define		RISCV_HWPROBE_EXT_ZBC		(1 << 7)
-#define		RISCV_HWPROBE_EXT_ZBKB		(1 << 8)
-#define		RISCV_HWPROBE_EXT_ZBKC		(1 << 9)
-#define		RISCV_HWPROBE_EXT_ZBKX		(1 << 10)
-#define		RISCV_HWPROBE_EXT_ZKND		(1 << 11)
-#define		RISCV_HWPROBE_EXT_ZKNE		(1 << 12)
-#define		RISCV_HWPROBE_EXT_ZKNH		(1 << 13)
-#define		RISCV_HWPROBE_EXT_ZKSED		(1 << 14)
-#define		RISCV_HWPROBE_EXT_ZKSH		(1 << 15)
-#define		RISCV_HWPROBE_EXT_ZKT		(1 << 16)
-#define		RISCV_HWPROBE_EXT_ZVBB		(1 << 17)
-#define		RISCV_HWPROBE_EXT_ZVBC		(1 << 18)
-#define		RISCV_HWPROBE_EXT_ZVKB		(1 << 19)
-#define		RISCV_HWPROBE_EXT_ZVKG		(1 << 20)
-#define		RISCV_HWPROBE_EXT_ZVKNED	(1 << 21)
-#define		RISCV_HWPROBE_EXT_ZVKNHA	(1 << 22)
-#define		RISCV_HWPROBE_EXT_ZVKNHB	(1 << 23)
-#define		RISCV_HWPROBE_EXT_ZVKSED	(1 << 24)
-#define		RISCV_HWPROBE_EXT_ZVKSH		(1 << 25)
-#define		RISCV_HWPROBE_EXT_ZVKT		(1 << 26)
-#define		RISCV_HWPROBE_EXT_ZFH		(1 << 27)
-#define		RISCV_HWPROBE_EXT_ZFHMIN	(1 << 28)
-#define		RISCV_HWPROBE_EXT_ZIHINTNTL	(1 << 29)
-#define		RISCV_HWPROBE_EXT_ZVFH		(1 << 30)
-#define		RISCV_HWPROBE_EXT_ZVFHMIN	(1ULL << 31)
-#define		RISCV_HWPROBE_EXT_ZFA		(1ULL << 32)
-#define		RISCV_HWPROBE_EXT_ZTSO		(1ULL << 33)
-#define		RISCV_HWPROBE_EXT_ZACAS		(1ULL << 34)
-#define		RISCV_HWPROBE_EXT_ZICOND	(1ULL << 35)
-#define		RISCV_HWPROBE_EXT_ZIHINTPAUSE	(1ULL << 36)
-#define		RISCV_HWPROBE_EXT_ZVE32X	(1ULL << 37)
-#define		RISCV_HWPROBE_EXT_ZVE32F	(1ULL << 38)
-#define		RISCV_HWPROBE_EXT_ZVE64X	(1ULL << 39)
-#define		RISCV_HWPROBE_EXT_ZVE64F	(1ULL << 40)
-#define		RISCV_HWPROBE_EXT_ZVE64D	(1ULL << 41)
-#define		RISCV_HWPROBE_EXT_ZIMOP		(1ULL << 42)
-#define		RISCV_HWPROBE_EXT_ZCA		(1ULL << 43)
-#define		RISCV_HWPROBE_EXT_ZCB		(1ULL << 44)
-#define		RISCV_HWPROBE_EXT_ZCD		(1ULL << 45)
-#define		RISCV_HWPROBE_EXT_ZCF		(1ULL << 46)
-#define		RISCV_HWPROBE_EXT_ZCMOP		(1ULL << 47)
-#define		RISCV_HWPROBE_EXT_ZAWRS		(1ULL << 48)
+#define		RISCV_HWPROBE_IMA_FD		BIT_ULL(0)
+#define		RISCV_HWPROBE_IMA_C		BIT_ULL(1)
+#define		RISCV_HWPROBE_IMA_V		BIT_ULL(2)
+#define		RISCV_HWPROBE_EXT_ZBA		BIT_ULL(3)
+#define		RISCV_HWPROBE_EXT_ZBB		BIT_ULL(4)
+#define		RISCV_HWPROBE_EXT_ZBS		BIT_ULL(5)
+#define		RISCV_HWPROBE_EXT_ZICBOZ	BIT_ULL(6)
+#define		RISCV_HWPROBE_EXT_ZBC		BIT_ULL(7)
+#define		RISCV_HWPROBE_EXT_ZBKB		BIT_ULL(8)
+#define		RISCV_HWPROBE_EXT_ZBKC		BIT_ULL(9)
+#define		RISCV_HWPROBE_EXT_ZBKX		BIT_ULL(10)
+#define		RISCV_HWPROBE_EXT_ZKND		BIT_ULL(11)
+#define		RISCV_HWPROBE_EXT_ZKNE		BIT_ULL(12)
+#define		RISCV_HWPROBE_EXT_ZKNH		BIT_ULL(13)
+#define		RISCV_HWPROBE_EXT_ZKSED		BIT_ULL(14)
+#define		RISCV_HWPROBE_EXT_ZKSH		BIT_ULL(15)
+#define		RISCV_HWPROBE_EXT_ZKT		BIT_ULL(16)
+#define		RISCV_HWPROBE_EXT_ZVBB		BIT_ULL(17)
+#define		RISCV_HWPROBE_EXT_ZVBC		BIT_ULL(18)
+#define		RISCV_HWPROBE_EXT_ZVKB		BIT_ULL(19)
+#define		RISCV_HWPROBE_EXT_ZVKG		BIT_ULL(20)
+#define		RISCV_HWPROBE_EXT_ZVKNED	BIT_ULL(21)
+#define		RISCV_HWPROBE_EXT_ZVKNHA	BIT_ULL(22)
+#define		RISCV_HWPROBE_EXT_ZVKNHB	BIT_ULL(23)
+#define		RISCV_HWPROBE_EXT_ZVKSED	BIT_ULL(24)
+#define		RISCV_HWPROBE_EXT_ZVKSH		BIT_ULL(25)
+#define		RISCV_HWPROBE_EXT_ZVKT		BIT_ULL(26)
+#define		RISCV_HWPROBE_EXT_ZFH		BIT_ULL(27)
+#define		RISCV_HWPROBE_EXT_ZFHMIN	BIT_ULL(28)
+#define		RISCV_HWPROBE_EXT_ZIHINTNTL	BIT_ULL(29)
+#define		RISCV_HWPROBE_EXT_ZVFH		BIT_ULL(30)
+#define		RISCV_HWPROBE_EXT_ZVFHMIN	BIT_ULL(31)
+#define		RISCV_HWPROBE_EXT_ZFA		BIT_ULL(32)
+#define		RISCV_HWPROBE_EXT_ZTSO		BIT_ULL(33)
+#define		RISCV_HWPROBE_EXT_ZACAS		BIT_ULL(34)
+#define		RISCV_HWPROBE_EXT_ZICOND	BIT_ULL(35)
+#define		RISCV_HWPROBE_EXT_ZIHINTPAUSE	BIT_ULL(36)
+#define		RISCV_HWPROBE_EXT_ZVE32X	BIT_ULL(37)
+#define		RISCV_HWPROBE_EXT_ZVE32F	BIT_ULL(38)
+#define		RISCV_HWPROBE_EXT_ZVE64X	BIT_ULL(39)
+#define		RISCV_HWPROBE_EXT_ZVE64F	BIT_ULL(40)
+#define		RISCV_HWPROBE_EXT_ZVE64D	BIT_ULL(41)
+#define		RISCV_HWPROBE_EXT_ZIMOP		BIT_ULL(42)
+#define		RISCV_HWPROBE_EXT_ZCA		BIT_ULL(43)
+#define		RISCV_HWPROBE_EXT_ZCB		BIT_ULL(44)
+#define		RISCV_HWPROBE_EXT_ZCD		BIT_ULL(45)
+#define		RISCV_HWPROBE_EXT_ZCF		BIT_ULL(46)
+#define		RISCV_HWPROBE_EXT_ZCMOP		BIT_ULL(47)
+#define		RISCV_HWPROBE_EXT_ZAWRS		BIT_ULL(48)
 #define RISCV_HWPROBE_KEY_CPUPERF_0	5
 #define		RISCV_HWPROBE_MISALIGNED_UNKNOWN	(0 << 0)
 #define		RISCV_HWPROBE_MISALIGNED_EMULATED	(1 << 0)
@@ -85,6 +85,6 @@ struct riscv_hwprobe {
 /* Increase RISCV_HWPROBE_MAX_KEY when adding items. */
 
 /* Flags */
-#define RISCV_HWPROBE_WHICH_CPUS	(1 << 0)
+#define RISCV_HWPROBE_WHICH_CPUS	BIT(0)
 
 #endif
-- 
2.45.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
