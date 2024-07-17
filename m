Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 385EFC3DA42
	for <linux-riscv@archiver.kernel.org>; Wed, 17 Jul 2024 06:26:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KT5iGaOwIjI6o8DIxzUsSahby8RT+P5FQjcB7YEiZ/w=; b=H1UKApr+PcLSYw
	u2VOwf4Kq3h+uBZqYFNDOIdXKzR4rCBxF1GFrRuBKkud6DyOTvbC0Pz35fk/GNjOPFDDR1f15mjEs
	AxjMZaDYjRc5gEE4Yt+DxvmUP6tsRZoZSpjR/jLBW5X6JnEWfRJ2Y+xiuJhdsgAqto7ord8PeFlN2
	PK9Npiqu1GAtHs4lHi0GEvVlbTADo+q2Jp6RhayRUponscNp1rkxIj9S8fGFiHdDz9HD+nLw9NpFK
	AmwmHOFyLaeSxLy8CH1/lDVSp0rTAGnXyBOtMprB6l81SSJtfh0Wf+yxtF0CjFYBn/v+rCj19lOxA
	S05Nq36QVwD62srKrr8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sTy79-0000000CpR4-2BA0;
	Wed, 17 Jul 2024 06:26:11 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sTy77-0000000CpP8-0lwb
	for linux-riscv@lists.infradead.org;
	Wed, 17 Jul 2024 06:26:10 +0000
Received: by mail-wr1-x430.google.com with SMTP id ffacd0b85a97d-367ab76d5e1so2118698f8f.3
        for <linux-riscv@lists.infradead.org>; Tue, 16 Jul 2024 23:26:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1721197568; x=1721802368; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3zMQJJ1+QlmFm418V6AGBGbWQY3rNoVY0h/UyfCjPDE=;
        b=3fP/BCAEzy724JQEqdY8dqI1f/C9d2eCRu/o78G+ogjBwfZTTwms13v+tGG21PFYby
         N0c0vgL8RZh4GLxJX1ggSAsmkBrryeHmAhE6zIfwkA25wqY41vjYjjT7Ti7U168tHP+T
         B6o4F8eWomBun1dhDl4wQDeyVcL7UB812f5i1hTRuPr93WUjIyMZeYCrdU0J0sbqeCGz
         2eyujcZ4XiFbWCSTpKMZMbii6Y1wXvSqDvLkLUTsbYn7t1D73bCqMJY63dGJHNPp4GKj
         lYWvASuhmJCZdoANbtSZOYe3eQWU/gWsZfbXjVovK+Gcked8675mXvoxrt/7YHAdug4a
         idiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721197568; x=1721802368;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3zMQJJ1+QlmFm418V6AGBGbWQY3rNoVY0h/UyfCjPDE=;
        b=gF26ESbkCQaEW+h5YzQyVd2464noctQzOdkKaqEkJpmCa57lwSQSVUG4cRSsmyu0n6
         fzJOzCspRZ/u5njDAS6EKWAhYqsGcbk8fJiF1cN+YN3BGYgYyukU94FlgnMudm4V1n55
         RnYN7Heig3HEQkgF2wZGivXWiaFp1jVrcyY9OmzM9ShJEwWFpPzct4oEzPYM92T55Y0k
         iIPpZcq4TN5eymTM5aA+Cas+5CyHXepO/i4H940TJ+Fyusd72Rf2Q7J8DbDz0yikNROO
         gMbyQJ7i0Z+RLtSLSD95o+M0/NC0OfWZNMKPIdcwbskZwWy4GvzBQReB/vOAfMV1/T1G
         f+eQ==
X-Forwarded-Encrypted: i=1; AJvYcCUrvRJRlWGWDEuVvKemp7qe1QU6bILx7nzXQdxea+2vrYru6d3p674hrI/YrjSyJK3GSqtTsDqPxiQNji1jykF34lJCNMJqDsO361pNpX1x
X-Gm-Message-State: AOJu0YwdjZynv5OeP5YKHgkfgNxEZDPF+O41biDIs62aHD7QpIzCzEKz
	ZQ9qI10Q0hxz5M3RnStH9Qwy22aSvYrHSwSRMw5VoTjy84qx1/zWXnTMB2BKSK8=
X-Google-Smtp-Source: AGHT+IE6uNjEd3rgzo2cnMZIenDe0Lf33upNb/sgH/fJlHpS9fKERnXLFFmQs0acmED+vAQAC04L2Q==
X-Received: by 2002:adf:e681:0:b0:368:3079:4277 with SMTP id ffacd0b85a97d-3683165b50amr545623f8f.28.1721197567667;
        Tue, 16 Jul 2024 23:26:07 -0700 (PDT)
Received: from alex-rivos.home (amontpellier-656-1-456-62.w92-145.abo.wanadoo.fr. [92.145.124.62])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-368111d3e7dsm10358022f8f.87.2024.07.16.23.26.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jul 2024 23:26:07 -0700 (PDT)
From: Alexandre Ghiti <alexghiti@rivosinc.com>
To: Jonathan Corbet <corbet@lwn.net>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Conor Dooley <conor@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Andrea Parri <parri.andrea@gmail.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>,
	Will Deacon <will@kernel.org>,
	Waiman Long <longman@redhat.com>,
	Boqun Feng <boqun.feng@gmail.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Leonardo Bras <leobras@redhat.com>,
	Guo Ren <guoren@kernel.org>,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-arch@vger.kernel.org
Cc: Alexandre Ghiti <alexghiti@rivosinc.com>
Subject: [PATCH v3 06/11] riscv: Implement xchg8/16() using Zabha
Date: Wed, 17 Jul 2024 08:19:52 +0200
Message-Id: <20240717061957.140712-7-alexghiti@rivosinc.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240717061957.140712-1-alexghiti@rivosinc.com>
References: <20240717061957.140712-1-alexghiti@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240716_232609_380854_5A15AD91 
X-CRM114-Status: UNSURE (   9.69  )
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

This adds runtime support for Zabha in xchg8/16() operations.

Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
---
 arch/riscv/include/asm/cmpxchg.h | 32 +++++++++++++++++++++++++++++---
 1 file changed, 29 insertions(+), 3 deletions(-)

diff --git a/arch/riscv/include/asm/cmpxchg.h b/arch/riscv/include/asm/cmpxchg.h
index 608d98522557..091e6612ddb3 100644
--- a/arch/riscv/include/asm/cmpxchg.h
+++ b/arch/riscv/include/asm/cmpxchg.h
@@ -11,8 +11,27 @@
 #include <asm/fence.h>
 #include <asm/alternative.h>
 
-#define __arch_xchg_masked(sc_sfx, prepend, append, r, p, n)		\
+#define __arch_xchg_masked(sc_sfx, swap_sfx, prepend, sc_append,	\
+			   swap_append, r, p, n)			\
 ({									\
+	__label__ no_zabha, end;					\
+									\
+	if (IS_ENABLED(CONFIG_RISCV_ISA_ZABHA)) {			\
+		asm goto(ALTERNATIVE("j %[no_zabha]", "nop", 0,		\
+				     RISCV_ISA_EXT_ZABHA, 1)		\
+			 : : : : no_zabha);				\
+									\
+		__asm__ __volatile__ (					\
+			prepend						\
+			"	amoswap" swap_sfx " %0, %z2, %1\n"	\
+			swap_append					\
+			: "=&r" (r), "+A" (*(p))			\
+			: "rJ" (n)					\
+			: "memory");					\
+		goto end;						\
+	}								\
+									\
+no_zabha:;								\
 	u32 *__ptr32b = (u32 *)((ulong)(p) & ~0x3);			\
 	ulong __s = ((ulong)(p) & (0x4 - sizeof(*p))) * BITS_PER_BYTE;	\
 	ulong __mask = GENMASK(((sizeof(*p)) * BITS_PER_BYTE) - 1, 0)	\
@@ -28,12 +47,14 @@
 	       "	or   %1, %1, %z3\n"				\
 	       "	sc.w" sc_sfx " %1, %1, %2\n"			\
 	       "	bnez %1, 0b\n"					\
-	       append							\
+	       sc_append						\
 	       : "=&r" (__retx), "=&r" (__rc), "+A" (*(__ptr32b))	\
 	       : "rJ" (__newx), "rJ" (~__mask)				\
 	       : "memory");						\
 									\
 	r = (__typeof__(*(p)))((__retx & __mask) >> __s);		\
+									\
+end:;									\
 })
 
 #define __arch_xchg(sfx, prepend, append, r, p, n)			\
@@ -56,8 +77,13 @@
 									\
 	switch (sizeof(*__ptr)) {					\
 	case 1:								\
+		__arch_xchg_masked(sc_sfx, ".b" swap_sfx,		\
+				   prepend, sc_append, swap_append,	\
+				   __ret, __ptr, __new);		\
+		break;							\
 	case 2:								\
-		__arch_xchg_masked(sc_sfx, prepend, sc_append,		\
+		__arch_xchg_masked(sc_sfx, ".h" swap_sfx,		\
+				   prepend, sc_append, swap_append,	\
 				   __ret, __ptr, __new);		\
 		break;							\
 	case 4:								\
-- 
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
