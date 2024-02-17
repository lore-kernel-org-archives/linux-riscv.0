Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E7A7C48BC3
	for <linux-riscv@archiver.kernel.org>; Sat, 17 Feb 2024 13:13:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=t/kUDYivXX0OxJvCd4Jwg/ogo1Y8bGYXSEm2Lv3xlX4=; b=rBeyJ4GriyrU24lvFJnmWlT3Nf
	CKqn8sKqr/UASjYIuJ5eKWD1BUrJUtbxFYVjn4roN6XKs3CPq5+PANWlcRcf2VsVMbc/BiIcDBlAu
	wMXFJnIWsbfM+OqnZ3DlJ6jHdEAuiFcnyJ8GBj87eTBWGTrAFlZkEUNid3Vc7Xxy32MTPlpnwZ7Rc
	0Au146oSBzubKo7nfbNsMPK76Dcuw/mbhdpU+fGp5nOqlD8qVFxW2jHh7kFsoVOjvXpju//EV8+me
	QRl8xnwCuESQISaIXos3Kxrh7GWreyz2+KVqSSxKG130ytT+3pyxJaPhSVWK/Ok+8ftN68HMHrJNi
	vmzlBW0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rbKVF-00000005iGb-01xi;
	Sat, 17 Feb 2024 13:13:13 +0000
Received: from mail-yb1-xb4a.google.com ([2607:f8b0:4864:20::b4a])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rbKVB-00000005iE3-2jwF
	for linux-riscv@lists.infradead.org;
	Sat, 17 Feb 2024 13:13:11 +0000
Received: by mail-yb1-xb4a.google.com with SMTP id 3f1490d57ef6-dc6b26845cdso4789977276.3
        for <linux-riscv@lists.infradead.org>; Sat, 17 Feb 2024 05:13:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1708175588; x=1708780388; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=R2+WpDCt8HOz+kxBkD8ukIa/A2HuTgCzwuZw4fcBj8Q=;
        b=c0GlGeTyVcKxESkAzJRDcEbZaQNKmQUuAU56AUbt9nhsp1JxodrerVF5LZw73jeqzA
         9ZIvA+6tE1CqlXBWSd32UxabUr5P4IjUzkOPkcf8FafabBK3unLfY2Bvfvkc/lOKG7oc
         3pNRbSNKM+IfjsFbLxd4vA5MFm1vuCizbSzWX1jVApzWKY4UmjLlW7WVq1sVHHy1zn7I
         moH5/IgEy5WVSm63UKcVIv13u/TXC5evfCPcpVCqOmkkMJ+eN/HxYm2vrZhHo+1asjDR
         9Ou+NYLOWIVMKyI709XSEHqOt+XURji/3n65sp8bzUNF5MAPCnaySAHBs/ut6ZhkUkdo
         kT7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708175588; x=1708780388;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=R2+WpDCt8HOz+kxBkD8ukIa/A2HuTgCzwuZw4fcBj8Q=;
        b=T8O2ArPiINCjUI7ZWnl9f5a0zgpzrmdM1gxejKU0lPX6Sgqd8RwgvRYHRZNUR6WHdK
         CjHRwv5E3b0PRXQv4GN/a+sLlsHwjpYUE7+T3pfcONtVMH8DkapbEjPKrasFxChhaai9
         eFuhUteq26HSnr/S8BKEYw1V36+ZB2k+BfItrtCyt9hSX51MLBKiFlQh0mrQlSYP9eJd
         oDHzZbz/ME58gbZjRyNjkKk4FN47BUT7B6lSxbQWjAS0pEWfbTRg3dOOSpbgc+BV5XPw
         h1DAYzld1TI0BmDGMzgWELeL75TTUoZBKe0VFKVI1vFpvOSF9/p9O4gODHh+M71OyTyP
         Niww==
X-Gm-Message-State: AOJu0YyDPhenqStXi8dho0AlUBhAPY9HVV/BDsnCGEpY9S70sgfwKEWa
	TJY0KV+cGtMx48VL/BcfCE78WyJ4EMnatf0I9jilsy2RvECT41WIpL5kKkPPX7j8TFxnbfZwWXm
	QGexK96Lo1RwONCAvvQ==
X-Google-Smtp-Source: AGHT+IEAJ/4G6wD0KVnJGN5oQcDtNoKQ10qhlVZxpPvg7p+h7qHeL1Q6wHY/niRI5dbBnn7ePSTvHDt/7ZPsroqL
X-Received: from ericchancf.c.googlers.com ([fda3:e722:ac3:cc00:4f:4b78:c0a8:4139])
 (user=ericchancf job=sendgmr) by 2002:a05:6902:1029:b0:dc9:5ef8:2b2d with
 SMTP id x9-20020a056902102900b00dc95ef82b2dmr1930551ybt.4.1708175588280; Sat,
 17 Feb 2024 05:13:08 -0800 (PST)
Date: Sat, 17 Feb 2024 13:13:02 +0000
In-Reply-To: <20240217131206.3667544-1-ericchancf@google.com>
Mime-Version: 1.0
References: <20240217131206.3667544-1-ericchancf@google.com>
X-Mailer: git-send-email 2.44.0.rc0.258.g7320e95886-goog
Message-ID: <20240217131302.3668481-1-ericchancf@google.com>
Subject: [PATCH v6 2/4] riscv/barrier: Define RISCV_FULL_BARRIER
From: Eric Chan <ericchancf@google.com>
To: paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	ericchancf@google.com, conor.dooley@microchip.com, parri.andrea@gmail.com, 
	emil.renner.berthing@canonical.com, samuel.holland@sifive.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240217_051309_715383_76E03B2D 
X-CRM114-Status: UNSURE (   8.89  )
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

Introduce RISCV_FULL_BARRIER and use in arch_atomic* function.
like RISCV_ACQUIRE_BARRIER and RISCV_RELEASE_BARRIER, the fence
instruction can be eliminated When SMP is not enabled.

Signed-off-by: Eric Chan <ericchancf@google.com>
---
 arch/riscv/include/asm/atomic.h  | 16 ++++++++--------
 arch/riscv/include/asm/cmpxchg.h |  4 ++--
 arch/riscv/include/asm/fence.h   |  2 ++
 3 files changed, 12 insertions(+), 10 deletions(-)

diff --git a/arch/riscv/include/asm/atomic.h b/arch/riscv/include/asm/atomic.h
index f5dfef6c2153..31e6e2e7cc18 100644
--- a/arch/riscv/include/asm/atomic.h
+++ b/arch/riscv/include/asm/atomic.h
@@ -207,7 +207,7 @@ static __always_inline int arch_atomic_fetch_add_unless(atomic_t *v, int a, int
 		"	add      %[rc], %[p], %[a]\n"
 		"	sc.w.rl  %[rc], %[rc], %[c]\n"
 		"	bnez     %[rc], 0b\n"
-		"	fence    rw, rw\n"
+		RISCV_FULL_BARRIER
 		"1:\n"
 		: [p]"=&r" (prev), [rc]"=&r" (rc), [c]"+A" (v->counter)
 		: [a]"r" (a), [u]"r" (u)
@@ -228,7 +228,7 @@ static __always_inline s64 arch_atomic64_fetch_add_unless(atomic64_t *v, s64 a,
 		"	add      %[rc], %[p], %[a]\n"
 		"	sc.d.rl  %[rc], %[rc], %[c]\n"
 		"	bnez     %[rc], 0b\n"
-		"	fence    rw, rw\n"
+		RISCV_FULL_BARRIER
 		"1:\n"
 		: [p]"=&r" (prev), [rc]"=&r" (rc), [c]"+A" (v->counter)
 		: [a]"r" (a), [u]"r" (u)
@@ -248,7 +248,7 @@ static __always_inline bool arch_atomic_inc_unless_negative(atomic_t *v)
 		"	addi      %[rc], %[p], 1\n"
 		"	sc.w.rl   %[rc], %[rc], %[c]\n"
 		"	bnez      %[rc], 0b\n"
-		"	fence     rw, rw\n"
+		RISCV_FULL_BARRIER
 		"1:\n"
 		: [p]"=&r" (prev), [rc]"=&r" (rc), [c]"+A" (v->counter)
 		:
@@ -268,7 +268,7 @@ static __always_inline bool arch_atomic_dec_unless_positive(atomic_t *v)
 		"	addi      %[rc], %[p], -1\n"
 		"	sc.w.rl   %[rc], %[rc], %[c]\n"
 		"	bnez      %[rc], 0b\n"
-		"	fence     rw, rw\n"
+		RISCV_FULL_BARRIER
 		"1:\n"
 		: [p]"=&r" (prev), [rc]"=&r" (rc), [c]"+A" (v->counter)
 		:
@@ -288,7 +288,7 @@ static __always_inline int arch_atomic_dec_if_positive(atomic_t *v)
 		"	bltz     %[rc], 1f\n"
 		"	sc.w.rl  %[rc], %[rc], %[c]\n"
 		"	bnez     %[rc], 0b\n"
-		"	fence    rw, rw\n"
+		RISCV_FULL_BARRIER
 		"1:\n"
 		: [p]"=&r" (prev), [rc]"=&r" (rc), [c]"+A" (v->counter)
 		:
@@ -310,7 +310,7 @@ static __always_inline bool arch_atomic64_inc_unless_negative(atomic64_t *v)
 		"	addi      %[rc], %[p], 1\n"
 		"	sc.d.rl   %[rc], %[rc], %[c]\n"
 		"	bnez      %[rc], 0b\n"
-		"	fence     rw, rw\n"
+		RISCV_FULL_BARRIER
 		"1:\n"
 		: [p]"=&r" (prev), [rc]"=&r" (rc), [c]"+A" (v->counter)
 		:
@@ -331,7 +331,7 @@ static __always_inline bool arch_atomic64_dec_unless_positive(atomic64_t *v)
 		"	addi      %[rc], %[p], -1\n"
 		"	sc.d.rl   %[rc], %[rc], %[c]\n"
 		"	bnez      %[rc], 0b\n"
-		"	fence     rw, rw\n"
+		RISCV_FULL_BARRIER
 		"1:\n"
 		: [p]"=&r" (prev), [rc]"=&r" (rc), [c]"+A" (v->counter)
 		:
@@ -352,7 +352,7 @@ static __always_inline s64 arch_atomic64_dec_if_positive(atomic64_t *v)
 		"	bltz     %[rc], 1f\n"
 		"	sc.d.rl  %[rc], %[rc], %[c]\n"
 		"	bnez     %[rc], 0b\n"
-		"	fence    rw, rw\n"
+		RISCV_FULL_BARRIER
 		"1:\n"
 		: [p]"=&r" (prev), [rc]"=&r" (rc), [c]"+A" (v->counter)
 		:
diff --git a/arch/riscv/include/asm/cmpxchg.h b/arch/riscv/include/asm/cmpxchg.h
index 2f4726d3cfcc..a608e4d1a0a4 100644
--- a/arch/riscv/include/asm/cmpxchg.h
+++ b/arch/riscv/include/asm/cmpxchg.h
@@ -313,7 +313,7 @@
 			"	bne  %0, %z3, 1f\n"			\
 			"	sc.w.rl %1, %z4, %2\n"			\
 			"	bnez %1, 0b\n"				\
-			"	fence rw, rw\n"				\
+			RISCV_FULL_BARRIER				\
 			"1:\n"						\
 			: "=&r" (__ret), "=&r" (__rc), "+A" (*__ptr)	\
 			: "rJ" ((long)__old), "rJ" (__new)		\
@@ -325,7 +325,7 @@
 			"	bne %0, %z3, 1f\n"			\
 			"	sc.d.rl %1, %z4, %2\n"			\
 			"	bnez %1, 0b\n"				\
-			"	fence rw, rw\n"				\
+			RISCV_FULL_BARRIER				\
 			"1:\n"						\
 			: "=&r" (__ret), "=&r" (__rc), "+A" (*__ptr)	\
 			: "rJ" (__old), "rJ" (__new)			\
diff --git a/arch/riscv/include/asm/fence.h b/arch/riscv/include/asm/fence.h
index 2b443a3a487f..6c26c44dfcd6 100644
--- a/arch/riscv/include/asm/fence.h
+++ b/arch/riscv/include/asm/fence.h
@@ -4,9 +4,11 @@
 #ifdef CONFIG_SMP
 #define RISCV_ACQUIRE_BARRIER		"\tfence r , rw\n"
 #define RISCV_RELEASE_BARRIER		"\tfence rw,  w\n"
+#define RISCV_FULL_BARRIER		"\tfence rw, rw\n"
 #else
 #define RISCV_ACQUIRE_BARRIER
 #define RISCV_RELEASE_BARRIER
+#define RISCV_FULL_BARRIER
 #endif
 
 #endif	/* _ASM_RISCV_FENCE_H */
-- 
2.44.0.rc0.258.g7320e95886-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
