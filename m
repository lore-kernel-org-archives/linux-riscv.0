Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2912BC25B74
	for <linux-riscv@archiver.kernel.org>; Thu, 30 May 2024 14:56:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=/nLIYHOSqFrtUg10UGuKbPnrNUpxCiXP0Lo+M/sANso=; b=MsSSWH3fubM5Pn
	e4anCWcMu9NF1UUtpEmAYbgksht8P01GTtowrV5CEEwHVRPrvKXC79e/9Km9KJddMn+DMcWuXE5EP
	Sxwt45tNIp0hPbR4BXttH8qmhvS4LjWFHnZqs2UOzjuqblr4bta9smil3WfOMQzMfQnDQYBTWW5wI
	rMSmn20jqGFJn6AI80/BZE477+E2NY7l+OluW/ySavDiUycY0As1uh15aFIaUikCoFDdCJm7khlLS
	uMLB5wrBH/mWrCR7ftEQ+2YeSsj6hUsTwmN7ENVzJNi6vSzoZOFSL14fEE05ADDW6UAttrcEcLSji
	3+BXw4j9I28BjZy/VtlA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sChC6-00000007cbc-3JZT;
	Thu, 30 May 2024 14:55:54 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sChC4-00000007cbC-0ncK
	for linux-riscv@lists.infradead.org;
	Thu, 30 May 2024 14:55:54 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-42121d27861so9812525e9.0
        for <linux-riscv@lists.infradead.org>; Thu, 30 May 2024 07:55:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1717080949; x=1717685749; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=kF9KjPkj/1zZtp+GEuMgpwBghf6s7Q8QVJOIdZrAtlI=;
        b=daqBds3U3KVHtUByscEGKtgeDMJhzGBS8G0vPaGC0RYjhmqTRS8Kk4HYsn9tqYNsue
         K06UduPLgUWSHQfJ6WTybXCJU/0bk3On2svok9E7kBL4izRxM97Q0v37kdQDuEB6nZey
         OgVUARJovoXP/o2nnKA8XaBRvZlzPBt1o967B0SOVfiI1H3AYhn5kXjJhxhNHU4wkQOf
         E0ZMnO/NJrhyFr/AUn9A9DJJd67+pGwxmOUP9XSuK04kFCl4GkjafRlBsliqmYWzfsnd
         aW695QaJojMS3UERkXNWezLNfpzgHAxTNyyTODz77fQ2gUMLSTZWrH6DL0VZehXpjECm
         JbJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717080949; x=1717685749;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kF9KjPkj/1zZtp+GEuMgpwBghf6s7Q8QVJOIdZrAtlI=;
        b=ix34N3pZezuOfWunnjYskZiI+5FVjVQ7aUlpxsnpU5po209AuDvDYg3bS89dEn7OYN
         mqsfyl1X+DiTi2DyJjoMuR5sfa7J6FCSr1tyYbSOehFMzt3Ri0FBVGsxvWvPuRzRtaSn
         xXk+ceW4GLwW/XqhBOxODT57kJyl5CVAx3/HWXQJxOBtXILeWlzaZGeKJeulsio7XOFk
         UPl+WSR9sGYaZ9otIAuJY9IvGy0kcIJrQ0vOvRveo3I3C6g4z9iMrnbvhzFyelwTYATl
         mC+QzRa06Juf02d87iJCl0uVC7FTt4qroD3sk1hcEGsUDgLsPxMGkMJvFhHVWAEHmiMa
         2g7w==
X-Forwarded-Encrypted: i=1; AJvYcCUxjOVBsvh7Ks6nQBca4mk9zXAZBEENJwQqcR8KIEnING61pZfEJagd3BjqMv4CWQkrk5DVKbcAoHGvP627sg4UdS7NJ1MBXMkzMiZX+HN9
X-Gm-Message-State: AOJu0YzCsqpRcOzrwxgUlPxMANu34Wtp4kj79VmRfEqEYMxJXD0L8z7Y
	y9M5WVBeodu4l2RWISrBsxcFOIIxap8PxTGNhmt1aXNirZmp0A/bBIPfduZ/8Cs=
X-Google-Smtp-Source: AGHT+IG9d2Dhr06uBPNVTlyZtrq3fR1la7qkTtdMZ9XARQizEYKDs2DfO+7rmvJ5eCSaU68b9UjyXw==
X-Received: by 2002:a05:600c:4f8f:b0:418:f991:713f with SMTP id 5b1f17b1804b1-4212781b9bbmr23791285e9.23.1717080949418;
        Thu, 30 May 2024 07:55:49 -0700 (PDT)
Received: from localhost.localdomain (amontpellier-656-1-456-62.w92-145.abo.wanadoo.fr. [92.145.124.62])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-421270553c9sm27435975e9.8.2024.05.30.07.55.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 May 2024 07:55:49 -0700 (PDT)
From: Alexandre Ghiti <alexghiti@rivosinc.com>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Leonardo Bras <leobras@redhat.com>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Alexandre Ghiti <alexghiti@rivosinc.com>,
	Andrea Parri <parri.andrea@gmail.com>
Subject: [PATCH -fixes v2] riscv: Fix fully ordered LR/SC xchg[8|16]() implementations
Date: Thu, 30 May 2024 16:55:46 +0200
Message-Id: <20240530145546.394248-1-alexghiti@rivosinc.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240530_075552_333750_B9C7F98D 
X-CRM114-Status: UNSURE (   9.99  )
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

Changes in v2:
- Remove the superfluous full barrier introduced in v1 for xchg32/64() (Andrea)
- Use RISCV_FULL_BARRIER instead of the corresponding string (Andrea)

 arch/riscv/include/asm/cmpxchg.h | 22 ++++++++++++----------
 1 file changed, 12 insertions(+), 10 deletions(-)

diff --git a/arch/riscv/include/asm/cmpxchg.h b/arch/riscv/include/asm/cmpxchg.h
index ddb002ed89de..808b4c78462e 100644
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
@@ -46,7 +46,8 @@
 		: "memory");						\
 })
 
-#define _arch_xchg(ptr, new, sfx, prepend, append)			\
+#define _arch_xchg(ptr, new, sc_sfx, swap_sfx, prepend,			\
+		   sc_append, swap_append)				\
 ({									\
 	__typeof__(ptr) __ptr = (ptr);					\
 	__typeof__(*(__ptr)) __new = (new);				\
@@ -55,15 +56,15 @@
 	switch (sizeof(*__ptr)) {					\
 	case 1:								\
 	case 2:								\
-		__arch_xchg_masked(prepend, append,			\
+		__arch_xchg_masked(sc_sfx, prepend, sc_append,		\
 				   __ret, __ptr, __new);		\
 		break;							\
 	case 4:								\
-		__arch_xchg(".w" sfx, prepend, append,			\
+		__arch_xchg(".w" swap_sfx, prepend, swap_append,	\
 			      __ret, __ptr, __new);			\
 		break;							\
 	case 8:								\
-		__arch_xchg(".d" sfx, prepend, append,			\
+		__arch_xchg(".d" swap_sfx, prepend, swap_append,	\
 			      __ret, __ptr, __new);			\
 		break;							\
 	default:							\
@@ -73,16 +74,17 @@
 })
 
 #define arch_xchg_relaxed(ptr, x)					\
-	_arch_xchg(ptr, x, "", "", "")
+	_arch_xchg(ptr, x, "", "", "", "", "")
 
 #define arch_xchg_acquire(ptr, x)					\
-	_arch_xchg(ptr, x, "", "", RISCV_ACQUIRE_BARRIER)
+	_arch_xchg(ptr, x, "", "", "",					\
+		   RISCV_ACQUIRE_BARRIER, RISCV_ACQUIRE_BARRIER)
 
 #define arch_xchg_release(ptr, x)					\
-	_arch_xchg(ptr, x, "", RISCV_RELEASE_BARRIER, "")
+	_arch_xchg(ptr, x, "", "", RISCV_RELEASE_BARRIER, "", "")
 
 #define arch_xchg(ptr, x)						\
-	_arch_xchg(ptr, x, ".aqrl", "", "")
+	_arch_xchg(ptr, x, ".rl", ".aqrl", "", RISCV_FULL_BARRIER, "")
 
 #define xchg32(ptr, x)							\
 ({									\
-- 
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
