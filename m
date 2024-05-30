Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 642D8C25B78
	for <linux-riscv@archiver.kernel.org>; Thu, 30 May 2024 07:54:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Kk5QsQ2J9fmGhhSSOPBQwLUbajudrduiU6WZqK5rHFc=; b=tmrdNkuLAIK8je
	U0S03axOK9m6M+hhlyHYwCDA+JXMNmkrCJ7H+4XMK6YvePFtpPTqVyydem4zqvcUwwRP/xkrBkBZH
	VYx6wDjvwPeAZYy5bD5mb/tClEJZFzqpkRDxr5Lnbt1rsP5LRJF9VKdAXHQ2LNk2HuM3rbhle6ChD
	DRAAEZkLItRumBMqjx2rqjp0oUCALTarZH6qBNyaCfYitqLHJkrm8Mo4hjR40PVrtKoEeBWXasmen
	d0hwOELExPoqzjn+jfb1Fd2yxatiJoVR36BKjV3BJIbyKKAg1uHcS+n7GOeYZ+/V8RhsY9++a9lAW
	OP1ShMFeLdanxPpppG+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sCacN-00000006YdS-1ocP;
	Thu, 30 May 2024 07:54:35 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sCacJ-00000006Ycy-18dP
	for linux-riscv@lists.infradead.org;
	Thu, 30 May 2024 07:54:33 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-4211a86f124so6727795e9.0
        for <linux-riscv@lists.infradead.org>; Thu, 30 May 2024 00:54:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1717055668; x=1717660468; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=1gEk4cRtLIMz1d+ONWzu542I10bGkCjrk9ZcxQfZHt8=;
        b=d2/O+gs0zzybotZipHL3Lplmki5JWSVJ6b/a8dXd1Qg7ghrns/iqafsIOGM+fyh4/u
         oZRmLeRrcOLI21gfdXGGR9/x2walQkYPh0qERWVUytTGGGCtlJfxO+8syOm/I/gKSG3E
         +/bljIq/MGsmLIIxaSBxCXzEzyUtN5mPPoNf6XTmESHx0JAE7qZLZQJV4egxnp8lnSQk
         FCaLRtWpIIgNzgrBiKZrVg1xN26P8ubJ0UMA9Ft1H1brGIUpKj/jERp3NTP37l0rVL+e
         47bWw7UcX1FC5N7InV2vm9zBFHp8B+xLyGU6NgB3y47nmzj+KUpQBuZEEsyK2Makwsps
         TZTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717055668; x=1717660468;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1gEk4cRtLIMz1d+ONWzu542I10bGkCjrk9ZcxQfZHt8=;
        b=u5qLwwlVx0uTPKvpT/DU7doRFlpkqlh2U745AiYi+022ONSphYOfnWPbf5pjvSZXQ/
         0yR5WFOlrt/MjfqzyzAYcyWZnPqbPZClhF9/0NPcCwWqe9V1AAQVfwE4A3CfkEVvQO56
         OaQ9OypExrFvbzX6G0ptrHe5ZMgnF/TsJ18b1/STjyJxX1HG/hBU+UKwuonaUgS+z5Ty
         aIR9hBPcDKpS8MjNQa5Kb3+5e52U4poembIKVP6rva/7wYvDePqBj0MbhBrbPKh180Zo
         eR27F9wzq9LmJStcc6R77w5aWSFTlZPjYPTOROgzAQPVby5L9EHxaVpyNDgJSTnq79YJ
         u5NA==
X-Forwarded-Encrypted: i=1; AJvYcCXw7fZlwsKm9XW/+7qWr1IX48DDYJE0/Y9vg/sCB9t99QSDjJNg6WFyeV9/kzUavgLOC9IzMg/TavGks3PyhthHcfTbfXWv9DgfpwlazU3W
X-Gm-Message-State: AOJu0YzorNfWGNxko/l1Zo8EL3ipuYbzlXXW9iHj/KASeVm1zj62xABM
	EkAuRm81ZyWYxsHR26qLz4xFA3y8iuv256kdxcBWLFmZbnuExgRYXfKMEslgvVE=
X-Google-Smtp-Source: AGHT+IGeI7XRpZK2v9DADY+iDjOcvT75H36nmiKPi9Fmv16Kmngas9i40NRhcRNrQXkLHUYN59XZKA==
X-Received: by 2002:a05:600c:1896:b0:418:e04b:ee63 with SMTP id 5b1f17b1804b1-42127935444mr15689335e9.36.1717055668219;
        Thu, 30 May 2024 00:54:28 -0700 (PDT)
Received: from localhost.localdomain (amontpellier-656-1-456-62.w92-145.abo.wanadoo.fr. [92.145.124.62])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-421270791c7sm16650635e9.31.2024.05.30.00.54.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 May 2024 00:54:27 -0700 (PDT)
From: Alexandre Ghiti <alexghiti@rivosinc.com>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Leonardo Bras <leobras@redhat.com>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Alexandre Ghiti <alexghiti@rivosinc.com>,
	Andrea Parri <parri.andrea@gmail.com>
Subject: [PATCH -fixes] riscv: Fix fully ordered LR/SC xchg[8|16]() implementations
Date: Thu, 30 May 2024 09:54:24 +0200
Message-Id: <20240530075424.380557-1-alexghiti@rivosinc.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240530_005431_528735_1B18D55C 
X-CRM114-Status: UNSURE (   9.31  )
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

The fully ordered versions of xchg[8|16]() using LR/SC lack the
necessary memory barriers to guarantee the order.

Fix this by matching what is already implemented in the fully ordered
versions of cmpxchg() using LR/SC.

Suggested-by: Andrea Parri <parri.andrea@gmail.com>
Reported-by: Andrea Parri <parri.andrea@gmail.com>
Closes: https://lore.kernel.org/linux-riscv/ZlYbupL5XgzgA0MX@andrea/T/#u
Fixes: a8ed2b7a2c13 ("riscv/cmpxchg: Implement xchg for variables of size 1 and 2")
Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
---
 arch/riscv/include/asm/cmpxchg.h | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/arch/riscv/include/asm/cmpxchg.h b/arch/riscv/include/asm/cmpxchg.h
index ddb002ed89de..e1e564f5dc7b 100644
--- a/arch/riscv/include/asm/cmpxchg.h
+++ b/arch/riscv/include/asm/cmpxchg.h
@@ -10,7 +10,7 @@
 
 #include <asm/fence.h>
 
-#define __arch_xchg_masked(prepend, append, r, p, n)			\
+#define __arch_xchg_masked(sc_sfx, prepend, append, r, p, n)		\
 ({									\
 	u32 *__ptr32b = (u32 *)((ulong)(p) & ~0x3);			\
 	ulong __s = ((ulong)(p) & (0x4 - sizeof(*p))) * BITS_PER_BYTE;	\
@@ -25,7 +25,7 @@
 	       "0:	lr.w %0, %2\n"					\
 	       "	and  %1, %0, %z4\n"				\
 	       "	or   %1, %1, %z3\n"				\
-	       "	sc.w %1, %1, %2\n"				\
+	       "	sc.w" sc_sfx " %1, %1, %2\n"			\
 	       "	bnez %1, 0b\n"					\
 	       append							\
 	       : "=&r" (__retx), "=&r" (__rc), "+A" (*(__ptr32b))	\
@@ -46,7 +46,7 @@
 		: "memory");						\
 })
 
-#define _arch_xchg(ptr, new, sfx, prepend, append)			\
+#define _arch_xchg(ptr, new, sc_sfx, swap_sfx, prepend, append)		\
 ({									\
 	__typeof__(ptr) __ptr = (ptr);					\
 	__typeof__(*(__ptr)) __new = (new);				\
@@ -55,15 +55,15 @@
 	switch (sizeof(*__ptr)) {					\
 	case 1:								\
 	case 2:								\
-		__arch_xchg_masked(prepend, append,			\
+		__arch_xchg_masked(sc_sfx, prepend, append,		\
 				   __ret, __ptr, __new);		\
 		break;							\
 	case 4:								\
-		__arch_xchg(".w" sfx, prepend, append,			\
+		__arch_xchg(".w" swap_sfx, prepend, append,		\
 			      __ret, __ptr, __new);			\
 		break;							\
 	case 8:								\
-		__arch_xchg(".d" sfx, prepend, append,			\
+		__arch_xchg(".d" swap_sfx, prepend, append,		\
 			      __ret, __ptr, __new);			\
 		break;							\
 	default:							\
@@ -73,16 +73,16 @@
 })
 
 #define arch_xchg_relaxed(ptr, x)					\
-	_arch_xchg(ptr, x, "", "", "")
+	_arch_xchg(ptr, x, "", "", "", "")
 
 #define arch_xchg_acquire(ptr, x)					\
-	_arch_xchg(ptr, x, "", "", RISCV_ACQUIRE_BARRIER)
+	_arch_xchg(ptr, x, "", "", "", RISCV_ACQUIRE_BARRIER)
 
 #define arch_xchg_release(ptr, x)					\
-	_arch_xchg(ptr, x, "", RISCV_RELEASE_BARRIER, "")
+	_arch_xchg(ptr, x, "", "", RISCV_RELEASE_BARRIER, "")
 
 #define arch_xchg(ptr, x)						\
-	_arch_xchg(ptr, x, ".aqrl", "", "")
+	_arch_xchg(ptr, x, ".rl", ".aqrl", "", "     fence rw, rw\n")
 
 #define xchg32(ptr, x)							\
 ({									\
-- 
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
