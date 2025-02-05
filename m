Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D6D5C02192
	for <linux-riscv@archiver.kernel.org>; Wed,  5 Feb 2025 23:53:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:From:Cc:MIME-Version:References:
	In-Reply-To:Message-ID:Date:Subject:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JgllEXOJlItDvCLRxeMAvFkUlfcQoEeEZtXwLi5SLHA=; b=IlpreXp+5hZZZi
	Av/qZ8MQXkcatIboMZcsd+DduPl0rm2ksID1mKuFtZuFt1gZ1iLSu7/DBAY6YpK2/LzlN5tv5IzMh
	ON+CNkhLiekgpUAdgFO/FNikgZQGo+OCynHKy6YRQP5lltgcG9QbVE5JuNCMqzNXBc/VOdD2RpfBm
	VbYKDkV73IeS48O0a5s08JtU/ShxLrXd0G1yYLDN5+W98EwZR3n2r20Tpa0slJSJqq2o7WI/A9+eI
	4we3eJ5SBs+Caf1G3iHjtSUNmIzWYH7ll6OOb4BIIjmGCxVZwtWDrawHwr3/rIurl4lZ77e8Anhzs
	M/6LtnoGlkNzAGOpOL+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tfpCx-00000004sRl-2nQE;
	Wed, 05 Feb 2025 23:53:27 +0000
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfpCv-00000004sQj-3G2w
	for linux-riscv@lists.infradead.org;
	Wed, 05 Feb 2025 23:53:26 +0000
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-2163dc5155fso7137045ad.0
        for <linux-riscv@lists.infradead.org>; Wed, 05 Feb 2025 15:53:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1738799605; x=1739404405; darn=lists.infradead.org;
        h=to:from:cc:content-transfer-encoding:mime-version:references
         :in-reply-to:message-id:date:subject:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fAML0XAoIrhVBZFyj1JHk4ov4OlHr6qrklpFhDAq2S0=;
        b=pucpkXsnpgkHYjJmWKr572N60W9qnGsfDy3TbVHbXJoMUVuh/vsIi21JahQmG3knvZ
         SUOAfNDfHqMeU8OzKZ3f6yeN4z12RRLQc1k06lwsDxchLicPl0c3us03a3RP6zN7Q7S+
         BnwOZckMUD8V7J0DfS7n0K7PtyF4xyuKE4/uZ4Jv7S8H5v/Aqb/HGcnwCVCFOxowXtNt
         SiG7jtCpWWYWOwgwyOxonJ4eSAB5RJX4UmLF0z5ASv0AWWd0D9iSldl01++Eu3D0FOn6
         ItVoD+OAM2SL9L/MRIfmw0VFCqOk1oemPhxPTVLaGUz1cgGkpCji1aMBrOXG1qfgOZTy
         iAlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738799605; x=1739404405;
        h=to:from:cc:content-transfer-encoding:mime-version:references
         :in-reply-to:message-id:date:subject:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fAML0XAoIrhVBZFyj1JHk4ov4OlHr6qrklpFhDAq2S0=;
        b=vP+0YEj9NqfmDV8XfhSzFBtxP2/5yph+e2AncucOqnE5I7UTrRKadsX7nU4QDBq+fm
         MYdbme7tm0wVoyIc56Tq7AgSZglH5k6V/CVF4Z509K+2JYsAzcXDrVg/SKEjZ7dT0E9N
         XG4DqC1EcHhoALVivbkxd70lAlD+zJs27Tietn3dVkO1z3MR3UnpoAfLAx0d8/O2BTYf
         S4ExjjgaJW1JKCpYV34c+q53pM9wnGYhCfia0Pa47lWNpTJmKSSngLjYhrma6bUAB9Js
         6Hgx+OHHTkEpw5Yoy53hq+8FBbS0JrURc7YVhrj7HZ4NipLf0/y9ravvk+Vt82ofhUMg
         VaVg==
X-Gm-Message-State: AOJu0YywIjcRx97PnwcbEs0GOvbOFFM5k4K47XIL9wGtAzhRZCdVLDq9
	MdBCA45eMef+c4zHiV7ZNif0wLYgknP/UQyZd/BUFMpsyDRhJTtw5h3poCOtKGbtQeBzTzDW9+C
	E
X-Gm-Gg: ASbGnct+EvxWrAOkULTvF7/8Vay64iIbTbq87Nxjneqc55Ha6H31ThcEjDWy6TCO6Jy
	hE9FJJ5Po/3fB6WSthFB8HAJn9fYgwzPEdNlzh9P0EiqhG8FJJOwdZbX2N52ZBZAZ5UfgGYu0WB
	+jGfPziR125yTQFxI81vnylflj8f36kUyJlJlK+iPkoex8Lc3fo9davnPzR2S/Jq+NSoTp3mWOC
	zt2GSpwHCRSwazmCotdgb6Eu4pwdtmhjz8J7r0BztEZlMHSCKfQgKYx0aol7dbX99YTx+FQyQo+
	ZpPEvaRXxgR56A==
X-Google-Smtp-Source: AGHT+IGligJqJeWHzAV11eOJ+aPajZTdoxK9HiLGBP/BV66Exb7uc6zWE1M5guLXcUVrU5B8rtEoCA==
X-Received: by 2002:a17:903:1a23:b0:215:a028:4ed with SMTP id d9443c01a7336-21f17e0251cmr83366065ad.20.1738799604865;
        Wed, 05 Feb 2025 15:53:24 -0800 (PST)
Received: from localhost ([192.184.165.199])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-acebe384317sm12309567a12.19.2025.02.05.15.53.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Feb 2025 15:53:24 -0800 (PST)
Subject: [PATCH v2 1/2] RISC-V: hwprobe: Use BIT macro to avoid warnings
Date: Wed,  5 Feb 2025 12:40:26 -0800
Message-ID: <20250205204129.10639-2-palmer@rivosinc.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250205204129.10639-1-palmer@rivosinc.com>
References: <20250205204129.10639-1-palmer@rivosinc.com>
MIME-Version: 1.0
Cc: alex@ghiti.fr, Charlie Jenkins <charlie@rivosinc.com>, Mr.Bossman075@gmail.com,
  Jesse Taube <jesse@rivosinc.com>, Palmer Dabbelt <palmer@rivosinc.com>
From: Palmer Dabbelt <palmer@rivosinc.com>
To: linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250205_155325_817505_D033408B 
X-CRM114-Status: GOOD (  10.63  )
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

From: Jesse Taube <jesse@rivosinc.com>

In uapi/asm/hwprobe.h file, (1 << N) is used to define the bit field
which causes checkpatch to warn. Use BIT(N) and BIT_ULL(N) to avoid
these warnings.

Signed-off-by: Jesse Taube <jesse@rivosinc.com>
[Palmer: rebase and clean up a bit]
Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>
---
 arch/riscv/include/uapi/asm/hwprobe.h | 117 +++++++++++++-------------
 1 file changed, 59 insertions(+), 58 deletions(-)

diff --git a/arch/riscv/include/uapi/asm/hwprobe.h b/arch/riscv/include/uapi/asm/hwprobe.h
index c3c1cc951cb9..600ca96ae55e 100644
--- a/arch/riscv/include/uapi/asm/hwprobe.h
+++ b/arch/riscv/include/uapi/asm/hwprobe.h
@@ -7,6 +7,7 @@
 #define _UAPI_ASM_HWPROBE_H
 
 #include <linux/types.h>
+#include <linux/const.h>
 
 /*
  * Interface for probing hardware capabilities from userspace, see
@@ -21,65 +22,65 @@ struct riscv_hwprobe {
 #define RISCV_HWPROBE_KEY_MARCHID	1
 #define RISCV_HWPROBE_KEY_MIMPID	2
 #define RISCV_HWPROBE_KEY_BASE_BEHAVIOR	3
-#define		RISCV_HWPROBE_BASE_BEHAVIOR_IMA	(1 << 0)
+#define		RISCV_HWPROBE_BASE_BEHAVIOR_IMA	_BITULL(0)
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
-#define		RISCV_HWPROBE_EXT_SUPM		(1ULL << 49)
+#define		RISCV_HWPROBE_IMA_FD		_BITULL(0)
+#define		RISCV_HWPROBE_IMA_C		_BITULL(1)
+#define		RISCV_HWPROBE_IMA_V		_BITULL(2)
+#define		RISCV_HWPROBE_EXT_ZBA		_BITULL(3)
+#define		RISCV_HWPROBE_EXT_ZBB		_BITULL(4)
+#define		RISCV_HWPROBE_EXT_ZBS		_BITULL(5)
+#define		RISCV_HWPROBE_EXT_ZICBOZ	_BITULL(6)
+#define		RISCV_HWPROBE_EXT_ZBC		_BITULL(7)
+#define		RISCV_HWPROBE_EXT_ZBKB		_BITULL(8)
+#define		RISCV_HWPROBE_EXT_ZBKC		_BITULL(9)
+#define		RISCV_HWPROBE_EXT_ZBKX		_BITULL(10)
+#define		RISCV_HWPROBE_EXT_ZKND		_BITULL(11)
+#define		RISCV_HWPROBE_EXT_ZKNE		_BITULL(12)
+#define		RISCV_HWPROBE_EXT_ZKNH		_BITULL(13)
+#define		RISCV_HWPROBE_EXT_ZKSED		_BITULL(14)
+#define		RISCV_HWPROBE_EXT_ZKSH		_BITULL(15)
+#define		RISCV_HWPROBE_EXT_ZKT		_BITULL(16)
+#define		RISCV_HWPROBE_EXT_ZVBB		_BITULL(17)
+#define		RISCV_HWPROBE_EXT_ZVBC		_BITULL(18)
+#define		RISCV_HWPROBE_EXT_ZVKB		_BITULL(19)
+#define		RISCV_HWPROBE_EXT_ZVKG		_BITULL(20)
+#define		RISCV_HWPROBE_EXT_ZVKNED	_BITULL(21)
+#define		RISCV_HWPROBE_EXT_ZVKNHA	_BITULL(22)
+#define		RISCV_HWPROBE_EXT_ZVKNHB	_BITULL(23)
+#define		RISCV_HWPROBE_EXT_ZVKSED	_BITULL(24)
+#define		RISCV_HWPROBE_EXT_ZVKSH		_BITULL(25)
+#define		RISCV_HWPROBE_EXT_ZVKT		_BITULL(26)
+#define		RISCV_HWPROBE_EXT_ZFH		_BITULL(27)
+#define		RISCV_HWPROBE_EXT_ZFHMIN	_BITULL(28)
+#define		RISCV_HWPROBE_EXT_ZIHINTNTL	_BITULL(29)
+#define		RISCV_HWPROBE_EXT_ZVFH		_BITULL(30)
+#define		RISCV_HWPROBE_EXT_ZVFHMIN	_BITULL(31)
+#define		RISCV_HWPROBE_EXT_ZFA		_BITULL(32)
+#define		RISCV_HWPROBE_EXT_ZTSO		_BITULL(33)
+#define		RISCV_HWPROBE_EXT_ZACAS		_BITULL(34)
+#define		RISCV_HWPROBE_EXT_ZICOND	_BITULL(35)
+#define		RISCV_HWPROBE_EXT_ZIHINTPAUSE	_BITULL(36)
+#define		RISCV_HWPROBE_EXT_ZVE32X	_BITULL(37)
+#define		RISCV_HWPROBE_EXT_ZVE32F	_BITULL(38)
+#define		RISCV_HWPROBE_EXT_ZVE64X	_BITULL(39)
+#define		RISCV_HWPROBE_EXT_ZVE64F	_BITULL(40)
+#define		RISCV_HWPROBE_EXT_ZVE64D	_BITULL(41)
+#define		RISCV_HWPROBE_EXT_ZIMOP		_BITULL(42)
+#define		RISCV_HWPROBE_EXT_ZCA		_BITULL(43)
+#define		RISCV_HWPROBE_EXT_ZCB		_BITULL(44)
+#define		RISCV_HWPROBE_EXT_ZCD		_BITULL(45)
+#define		RISCV_HWPROBE_EXT_ZCF		_BITULL(46)
+#define		RISCV_HWPROBE_EXT_ZCMOP		_BITULL(47)
+#define		RISCV_HWPROBE_EXT_ZAWRS		_BITULL(48)
+#define		RISCV_HWPROBE_EXT_SUPM		_BITULL(49)
 #define RISCV_HWPROBE_KEY_CPUPERF_0	5
-#define		RISCV_HWPROBE_MISALIGNED_UNKNOWN	(0 << 0)
-#define		RISCV_HWPROBE_MISALIGNED_EMULATED	(1 << 0)
-#define		RISCV_HWPROBE_MISALIGNED_SLOW		(2 << 0)
-#define		RISCV_HWPROBE_MISALIGNED_FAST		(3 << 0)
-#define		RISCV_HWPROBE_MISALIGNED_UNSUPPORTED	(4 << 0)
-#define		RISCV_HWPROBE_MISALIGNED_MASK		(7 << 0)
+#define		RISCV_HWPROBE_MISALIGNED_UNKNOWN	0
+#define		RISCV_HWPROBE_MISALIGNED_EMULATED	1
+#define		RISCV_HWPROBE_MISALIGNED_SLOW		2
+#define		RISCV_HWPROBE_MISALIGNED_FAST		3
+#define		RISCV_HWPROBE_MISALIGNED_UNSUPPORTED	4
+#define		RISCV_HWPROBE_MISALIGNED_MASK		7
 #define RISCV_HWPROBE_KEY_ZICBOZ_BLOCK_SIZE	6
 #define RISCV_HWPROBE_KEY_HIGHEST_VIRT_ADDRESS	7
 #define RISCV_HWPROBE_KEY_TIME_CSR_FREQ	8
@@ -98,6 +99,6 @@ struct riscv_hwprobe {
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
