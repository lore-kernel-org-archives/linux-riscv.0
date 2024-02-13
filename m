Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FF92C48BC1
	for <linux-riscv@archiver.kernel.org>; Tue, 13 Feb 2024 14:29:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=Wfhau4lNy2cAl3EGf77+Hf+ilhxK4tjJQtenUD7aXls=; b=V11wWjYNjvcxYDc/YHmtY7t9nF
	BbEtMxuw4IYipW1MwK7fI7hogVChWMEZqwkSVbJoUyfwjkMd8GXEYbFlWcMC0r11S7nzvZUCT0fkO
	xkAOvIALQyH457FLkaRocjbjNu7//vQVEQ69r0ZHoYODM7Ub7W58xed7vnayzGvhsGNx+pj9yc9x+
	eaz34OtOMSqIxFZWAIrio3ot5CQlariFYZrW1UUQvXfpV1CWUvZSUOc9zLeZzAX2sbVvcqcy/nU8q
	d1FAXhtCZsDgtHE3KJOx3njZ8Nag2wms1FbFYeqxnnGsYWUuFTBhsdRy5wHdsXIOnUTfdEbPwkCRZ
	sseWYcjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rZtn5-00000009W26-2PEU;
	Tue, 13 Feb 2024 14:29:43 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rZtmv-00000009Vwg-2GzB
	for linux-riscv@bombadil.infradead.org;
	Tue, 13 Feb 2024 14:29:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Cc:To:From:Subject:
	Message-ID:References:Mime-Version:In-Reply-To:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=2A5s0YU98xz4fK0cK8V3de3MUudesnEU1GM23Fa1guU=; b=PZevmN0/oVityjvvVfwcVR82A5
	M9TLbttUn6JWySCzvELlJj1hfnJ9rItSGpZ6K2G9dCCBeJhSKalWtMCJVgMIF1tQKvf74nzTZPNHi
	wNpeBqR8pnkudSXWrnj7eB1XMQttbiyhEsU+2ILQYBMZPcM2+2YJq6K8Fc303ApJhIyprycbSOWi7
	2jUtXY9PqAyjngrJkF86qUlwf3p8gsMcGaRxZ/fyAptdvHKqulOzl7V4jKcOwzLbREF8tWIyyL+/K
	6lvuUWtQGDy2NyND1/zCelJ1fBoN41QN4m9LH3mbl3vn4ZAY4c68qhkLZnApfwM756Scr4ZPVLf/H
	GRtKZ92Q==;
Received: from mail-yb1-xb4a.google.com ([2607:f8b0:4864:20::b4a])
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rZtmr-0000000Fm8J-3REV
	for linux-riscv@lists.infradead.org;
	Tue, 13 Feb 2024 14:29:32 +0000
Received: by mail-yb1-xb4a.google.com with SMTP id 3f1490d57ef6-dc6b26783b4so5250259276.0
        for <linux-riscv@lists.infradead.org>; Tue, 13 Feb 2024 06:29:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1707834565; x=1708439365; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=2A5s0YU98xz4fK0cK8V3de3MUudesnEU1GM23Fa1guU=;
        b=Lb84zdsL5VfDkZ0b7D2ZOzAcQ5oAY9rK2NYK7OUmB4NOUBj0UnOzOscrnzplHm4m1X
         NKZ9ApBHZorE6EA2Vr+bMXjjK4n5Vz+sQYaBBd4qaIvITtmkdeuBlAPsOtkJhEiUIBkb
         zCnLn6Auc8Lw7UHROoBnUKYYQI2e2poeBFsWnXy0GZEqJDlSN1KmfOjm33Q9VIXD2QgC
         sXHhu46I+Tgu3lJKr0lCk28999/hpUaSrNzN9ryb6HEcti3m5wzMHQ3+4X3PUQssZS34
         HfsedoCosRhf36WLzrl6t4IxDHvcXwFlRryAq9Bn4hdxGWgLSa4QhTgTuw3xDgb85mRT
         wrjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707834565; x=1708439365;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2A5s0YU98xz4fK0cK8V3de3MUudesnEU1GM23Fa1guU=;
        b=qPKLeJfEhUPiihXTf80Gwf3hgK40pwbEBZUTQC/Y1+0wg+xGeWNdLrvB+TdZNroysM
         n2CXl5LmfP6c+LesuUquNWGkvcfgEOyv9ImbRRJhXtvgFwQej5cfDkw7FaHeR6SPx4Kt
         uMu9TvJ0nZ4+V97Qi8vXENtEX/+TRFhr4rA+4+B7Yuyp1ijHnvhpwqAtj/WAt2XJDItD
         V/XgIuZrwr2XOV+DE1H7ZMZHkFr9iJTqLeYDCIMFe3flryXtgvy/qLCkQIuIG88p+de3
         L04/8Xpx+crp5kp04R7fVOXpVtmYwP2b4ROMzBz6XR1Ra8czcB+cnIybiIAQiJegUhG6
         Hhcw==
X-Gm-Message-State: AOJu0YyPqOygYQSXfQZ376plJEFO1wpFs74aPTRFSem9vdGgJDpoUxeh
	6RUCJ4+ZFtqV66x/8LimSBQrZPyNVpA/fwLPdSCouLw3VdO+51Qw2YJnGrgD+hc57znJ7yBqmqc
	URc7xNY9KONuYB32xFA==
X-Google-Smtp-Source: AGHT+IEFfDoRwQ206s3vRpeCnYcR/ybaOaF2/O1U/21MDlmy9oENsuSN3eESDaGFpf658j2sMYStzQ152cIojUz6
X-Received: from ericchancf.c.googlers.com ([fda3:e722:ac3:cc00:4f:4b78:c0a8:4139])
 (user=ericchancf job=sendgmr) by 2002:a25:69c4:0:b0:dcc:53c6:1133 with SMTP
 id e187-20020a2569c4000000b00dcc53c61133mr76167ybc.13.1707834565189; Tue, 13
 Feb 2024 06:29:25 -0800 (PST)
Date: Tue, 13 Feb 2024 14:29:19 +0000
In-Reply-To: <20240213142632.2415127-1-ericchancf@google.com>
Mime-Version: 1.0
References: <20240213142632.2415127-1-ericchancf@google.com>
X-Mailer: git-send-email 2.43.0.687.g38aa6559b0-goog
Message-ID: <20240213142919.2416728-1-ericchancf@google.com>
Subject: [PATCH v3 2/4] riscv/barrier: Define RISCV_FULL_BARRIER
From: Eric Chan <ericchancf@google.com>
To: paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	ericchancf@google.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240213_142929_980250_C854CFD2 
X-CRM114-Status: UNSURE (   8.88  )
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
2.43.0.687.g38aa6559b0-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
