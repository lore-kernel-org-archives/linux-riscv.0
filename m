Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5080C6FD18
	for <linux-riscv@archiver.kernel.org>; Wed, 19 Apr 2023 06:26:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=oWLOa3/ZXWCNJsm/9awJGKv6FSSX7qZ7IM4yTRiVkVY=; b=iZGQ9IMXS/4pm3
	NKPVfEwOxeGdQQHF5OBbGgFDcmlHhZHqmW/uk6c1BpK0um4nqcGidssiTGR9z0ngdiQkBAeg9huT4
	Oi2oGTF7fMRVG0xzCoVAMEJKWCWp8e/e2Ozveo0kx2YQqwkW2MND+65gmfI7Xc7Y6llVEGZs77uFO
	FPsFb4cjNTi3zQPGGlFw7dfRbhH8cMjfQ5x7DbLb6PmuV8xNwYlB3wN88ytOW+L8VpY6DaRLTlm1Z
	WO+g5LdVZsAuWy8y22aWh9Vp6K4xiHSU9b2SnCJn/HWjozdoCbZPa9VUCJBGpvoYwQ6gyh0G7lMwa
	8T46Mh3i4XO9CVrK7jNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pp1GX-004E49-0U;
	Wed, 19 Apr 2023 06:26:05 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pp1GT-004E3A-2P
	for linux-riscv@lists.infradead.org;
	Wed, 19 Apr 2023 06:26:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1681885560;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=bqr63rdBNJW6MJxcSz6TUxSygJeiGgSztBtqTvNWdFg=;
	b=Kj1d+WrDZvKlM1OzU9d127XhNtxpuSHQWNqGUynUuffg6X6JaKMW5H4Ff765rezA+UD+Z2
	BEy2iGbxhWOIjuRVaxZ6pGxB864bEG+EESBHwOYilUaTxBm/FJ0NTfrNozCXdSDI+U0mZ3
	jcSx6LgXyFsBwFN4dWH/mW1Y/f4Cick=
Received: from mail-oa1-f69.google.com (mail-oa1-f69.google.com
 [209.85.160.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-335-Y9U9v91KN6evBqtaiv-zVg-1; Wed, 19 Apr 2023 02:25:57 -0400
X-MC-Unique: Y9U9v91KN6evBqtaiv-zVg-1
Received: by mail-oa1-f69.google.com with SMTP id 586e51a60fabf-1842c946ffdso8760071fac.0
        for <linux-riscv@lists.infradead.org>; Tue, 18 Apr 2023 23:25:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681885556; x=1684477556;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bqr63rdBNJW6MJxcSz6TUxSygJeiGgSztBtqTvNWdFg=;
        b=H8lGItDL9gRDWXMEfprrwML2MYsKWtYFOChqR5yvv4iXN57EErHNtvR78ql1LgAV9V
         7T7M8u+tRa0iDMbjG3qv+sCAl0ImQU0cUvjmEA5JL138IDClyAQIrs99xM4MF0iJWtaZ
         5oINRZGBtd357xoMSpYvzLPpflUrKp5HbCuY9/2y4LOJGu6nr2ntYOEVa74N3WePjumA
         VbyUeWVB80GoqrNwn1vQT400yynb/Dysad5f9bnFJcW+BfSBniUEPIHsEp+7q70aabnM
         4DhEqOc0Gk8MW7iTnclyrHmy7AyfXkkWe2msH6rcZkJQwiIbkM4mrHAjguB2tAf+dX6O
         gAwQ==
X-Gm-Message-State: AAQBX9cqOUq1eeJse9HDOyKjLZDUPGdQzW3P5YRJHno2SDa9zuy3DXoz
	74MJzkS7IXUGoqgB9ABX8yPa4bmQGP5mpKjCQtehpjjYl2W+BjGtCsWUK60BUIPyOv5YqSDepa2
	eKRmE8FHv4+vMGijkFzh8oMYgCaD/FI1EAvlM
X-Received: by 2002:a9d:66c2:0:b0:684:ac9d:1a17 with SMTP id t2-20020a9d66c2000000b00684ac9d1a17mr780824otm.3.1681885556474;
        Tue, 18 Apr 2023 23:25:56 -0700 (PDT)
X-Google-Smtp-Source: AKy350bKqCcNO2hix2PAQ0Js4/U/l3iu/UbIueif/kSkvexkCNyDPR3W7BSse6fcLfLJEK8fENU1ZQ==
X-Received: by 2002:a9d:66c2:0:b0:684:ac9d:1a17 with SMTP id t2-20020a9d66c2000000b00684ac9d1a17mr780819otm.3.1681885556236;
        Tue, 18 Apr 2023 23:25:56 -0700 (PDT)
Received: from localhost.localdomain ([2804:1b3:a802:873a:dbfb:e929:5eb5:6a2c])
        by smtp.gmail.com with ESMTPSA id y20-20020a056830209400b006a305c68617sm6304916otq.53.2023.04.18.23.25.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Apr 2023 23:25:55 -0700 (PDT)
From: Leonardo Bras <leobras@redhat.com>
To: Will Deacon <will@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Boqun Feng <boqun.feng@gmail.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Guo Ren <guoren@kernel.org>
Cc: Leonardo Bras <leobras@redhat.com>,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: [RFC PATCH 1/1] riscv/atomic.h: Deduplicate arch_atomic.*
Date: Wed, 19 Apr 2023 03:25:06 -0300
Message-Id: <20230419062505.257231-1-leobras@redhat.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230418_232601_860334_E905F134 
X-CRM114-Status: GOOD (  10.81  )
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

Some functions use mostly the same asm for 32-bit and 64-bit versions.

Make a macro that is generic enough and avoid code duplication.

Signed-off-by: Leonardo Bras <leobras@redhat.com>
---
 arch/riscv/include/asm/atomic.h | 164 +++++++++++++++-----------------
 1 file changed, 76 insertions(+), 88 deletions(-)

diff --git a/arch/riscv/include/asm/atomic.h b/arch/riscv/include/asm/atomic.h
index 0dfe9d857a762..85eb2edbc8219 100644
--- a/arch/riscv/include/asm/atomic.h
+++ b/arch/riscv/include/asm/atomic.h
@@ -196,22 +196,28 @@ ATOMIC_OPS(xor, xor, i)
 #undef ATOMIC_FETCH_OP
 #undef ATOMIC_OP_RETURN
 
+#define _arch_atomic_fetch_add_unless(_prev, _rc, counter, _a, _u, sfx)	\
+({									\
+	__asm__ __volatile__ (						\
+		"0:	lr." sfx "     %[p],  %[c]\n"			\
+		"	beq	       %[p],  %[u], 1f\n"		\
+		"	add            %[rc], %[p], %[a]\n"		\
+		"	sc." sfx ".rl  %[rc], %[rc], %[c]\n"		\
+		"	bnez           %[rc], 0b\n"			\
+		"	fence          rw, rw\n"			\
+		"1:\n"							\
+		: [p]"=&r" (_prev), [rc]"=&r" (_rc), [c]"+A" (counter)	\
+		: [a]"r" (_a), [u]"r" (_u)				\
+		: "memory");						\
+})
+
 /* This is required to provide a full barrier on success. */
 static __always_inline int arch_atomic_fetch_add_unless(atomic_t *v, int a, int u)
 {
        int prev, rc;
 
-	__asm__ __volatile__ (
-		"0:	lr.w     %[p],  %[c]\n"
-		"	beq      %[p],  %[u], 1f\n"
-		"	add      %[rc], %[p], %[a]\n"
-		"	sc.w.rl  %[rc], %[rc], %[c]\n"
-		"	bnez     %[rc], 0b\n"
-		"	fence    rw, rw\n"
-		"1:\n"
-		: [p]"=&r" (prev), [rc]"=&r" (rc), [c]"+A" (v->counter)
-		: [a]"r" (a), [u]"r" (u)
-		: "memory");
+	_arch_atomic_fetch_add_unless(prev, rc, v->counter, a, u, "w");
+
 	return prev;
 }
 #define arch_atomic_fetch_add_unless arch_atomic_fetch_add_unless
@@ -222,17 +228,8 @@ static __always_inline s64 arch_atomic64_fetch_add_unless(atomic64_t *v, s64 a,
        s64 prev;
        long rc;
 
-	__asm__ __volatile__ (
-		"0:	lr.d     %[p],  %[c]\n"
-		"	beq      %[p],  %[u], 1f\n"
-		"	add      %[rc], %[p], %[a]\n"
-		"	sc.d.rl  %[rc], %[rc], %[c]\n"
-		"	bnez     %[rc], 0b\n"
-		"	fence    rw, rw\n"
-		"1:\n"
-		: [p]"=&r" (prev), [rc]"=&r" (rc), [c]"+A" (v->counter)
-		: [a]"r" (a), [u]"r" (u)
-		: "memory");
+	_arch_atomic_fetch_add_unless(prev, rc, v->counter, a, u, "d");
+
 	return prev;
 }
 #define arch_atomic64_fetch_add_unless arch_atomic64_fetch_add_unless
@@ -310,61 +307,79 @@ ATOMIC_OPS()
 #undef ATOMIC_OPS
 #undef ATOMIC_OP
 
+#define _arch_atomic_inc_unless_negative(_prev, _rc, counter, sfx)	\
+({									\
+	__asm__ __volatile__ (						\
+		"0:	lr." sfx "      %[p],  %[c]\n"			\
+		"	bltz            %[p],  1f\n"			\
+		"	addi            %[rc], %[p], 1\n"		\
+		"	sc." sfx ".rl   %[rc], %[rc], %[c]\n"		\
+		"	bnez            %[rc], 0b\n"			\
+		"	fence           rw, rw\n"			\
+		"1:\n"							\
+		: [p]"=&r" (_prev), [rc]"=&r" (_rc), [c]"+A" (counter)	\
+		:							\
+		: "memory");						\
+})
+
 static __always_inline bool arch_atomic_inc_unless_negative(atomic_t *v)
 {
 	int prev, rc;
 
-	__asm__ __volatile__ (
-		"0:	lr.w      %[p],  %[c]\n"
-		"	bltz      %[p],  1f\n"
-		"	addi      %[rc], %[p], 1\n"
-		"	sc.w.rl   %[rc], %[rc], %[c]\n"
-		"	bnez      %[rc], 0b\n"
-		"	fence     rw, rw\n"
-		"1:\n"
-		: [p]"=&r" (prev), [rc]"=&r" (rc), [c]"+A" (v->counter)
-		:
-		: "memory");
+	_arch_atomic_inc_unless_negative(prev, rc, v->counter, "w");
+
 	return !(prev < 0);
 }
 
 #define arch_atomic_inc_unless_negative arch_atomic_inc_unless_negative
 
+#define _arch_atomic_dec_unless_positive(_prev, _rc, counter, sfx)	\
+({									\
+	__asm__ __volatile__ (						\
+		"0:	lr." sfx "      %[p],  %[c]\n"			\
+		"	bgtz            %[p],  1f\n"			\
+		"	addi            %[rc], %[p], -1\n"		\
+		"	sc." sfx ".rl   %[rc], %[rc], %[c]\n"		\
+		"	bnez            %[rc], 0b\n"			\
+		"	fence           rw, rw\n"			\
+		"1:\n"							\
+		: [p]"=&r" (_prev), [rc]"=&r" (_rc), [c]"+A" (counter)	\
+		:							\
+		: "memory");						\
+})
+
 static __always_inline bool arch_atomic_dec_unless_positive(atomic_t *v)
 {
 	int prev, rc;
 
-	__asm__ __volatile__ (
-		"0:	lr.w      %[p],  %[c]\n"
-		"	bgtz      %[p],  1f\n"
-		"	addi      %[rc], %[p], -1\n"
-		"	sc.w.rl   %[rc], %[rc], %[c]\n"
-		"	bnez      %[rc], 0b\n"
-		"	fence     rw, rw\n"
-		"1:\n"
-		: [p]"=&r" (prev), [rc]"=&r" (rc), [c]"+A" (v->counter)
-		:
-		: "memory");
+	_arch_atomic_dec_unless_positive(prev, rc, v->counter, "w");
+
 	return !(prev > 0);
 }
 
 #define arch_atomic_dec_unless_positive arch_atomic_dec_unless_positive
 
+#define _arch_atomic_dec_if_positive(_prev, _rc, counter, sfx)		\
+({									\
+	__asm__ __volatile__ (						\
+		"0:	lr." sfx "     %[p],  %[c]\n"			\
+		"	addi           %[rc], %[p], -1\n"		\
+		"	bltz           %[rc], 1f\n"			\
+		"	sc." sfx ".rl  %[rc], %[rc], %[c]\n"		\
+		"	bnez           %[rc], 0b\n"			\
+		"	fence          rw, rw\n"			\
+		"1:\n"							\
+		: [p]"=&r" (_prev), [rc]"=&r" (_rc), [c]"+A" (counter)	\
+		:							\
+		: "memory");						\
+})
+
 static __always_inline int arch_atomic_dec_if_positive(atomic_t *v)
 {
        int prev, rc;
 
-	__asm__ __volatile__ (
-		"0:	lr.w     %[p],  %[c]\n"
-		"	addi     %[rc], %[p], -1\n"
-		"	bltz     %[rc], 1f\n"
-		"	sc.w.rl  %[rc], %[rc], %[c]\n"
-		"	bnez     %[rc], 0b\n"
-		"	fence    rw, rw\n"
-		"1:\n"
-		: [p]"=&r" (prev), [rc]"=&r" (rc), [c]"+A" (v->counter)
-		:
-		: "memory");
+	_arch_atomic_dec_if_positive(prev, rc, v->counter, "w");
+
 	return prev - 1;
 }
 
@@ -376,17 +391,8 @@ static __always_inline bool arch_atomic64_inc_unless_negative(atomic64_t *v)
 	s64 prev;
 	long rc;
 
-	__asm__ __volatile__ (
-		"0:	lr.d      %[p],  %[c]\n"
-		"	bltz      %[p],  1f\n"
-		"	addi      %[rc], %[p], 1\n"
-		"	sc.d.rl   %[rc], %[rc], %[c]\n"
-		"	bnez      %[rc], 0b\n"
-		"	fence     rw, rw\n"
-		"1:\n"
-		: [p]"=&r" (prev), [rc]"=&r" (rc), [c]"+A" (v->counter)
-		:
-		: "memory");
+	_arch_atomic_inc_unless_negative(prev, rc, v->counter, "d");
+
 	return !(prev < 0);
 }
 
@@ -397,17 +403,8 @@ static __always_inline bool arch_atomic64_dec_unless_positive(atomic64_t *v)
 	s64 prev;
 	long rc;
 
-	__asm__ __volatile__ (
-		"0:	lr.d      %[p],  %[c]\n"
-		"	bgtz      %[p],  1f\n"
-		"	addi      %[rc], %[p], -1\n"
-		"	sc.d.rl   %[rc], %[rc], %[c]\n"
-		"	bnez      %[rc], 0b\n"
-		"	fence     rw, rw\n"
-		"1:\n"
-		: [p]"=&r" (prev), [rc]"=&r" (rc), [c]"+A" (v->counter)
-		:
-		: "memory");
+	_arch_atomic_dec_unless_positive(prev, rc, v->counter, "d");
+
 	return !(prev > 0);
 }
 
@@ -418,17 +415,8 @@ static __always_inline s64 arch_atomic64_dec_if_positive(atomic64_t *v)
        s64 prev;
        long rc;
 
-	__asm__ __volatile__ (
-		"0:	lr.d     %[p],  %[c]\n"
-		"	addi      %[rc], %[p], -1\n"
-		"	bltz     %[rc], 1f\n"
-		"	sc.d.rl  %[rc], %[rc], %[c]\n"
-		"	bnez     %[rc], 0b\n"
-		"	fence    rw, rw\n"
-		"1:\n"
-		: [p]"=&r" (prev), [rc]"=&r" (rc), [c]"+A" (v->counter)
-		:
-		: "memory");
+	_arch_atomic_dec_if_positive(prev, rc, v->counter, "d");
+
 	return prev - 1;
 }
 
-- 
2.40.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
