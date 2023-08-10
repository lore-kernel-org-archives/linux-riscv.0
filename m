Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42CA9C001B0
	for <linux-riscv@archiver.kernel.org>; Thu, 10 Aug 2023 04:04:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VfsN9GKoSqwjoxuQU66Q7/OyJSWiB1T4NgFHlghaRXc=; b=lTqKc5ZE/iVk8v
	tbRgOfbhm43mByKtINz4FxqpmvdoiCbTxoYRY5Ap25CTn3cj3lb/8QQ40M0/nweuAwUf/d6mF1eGh
	uy4T/xIG2Per3zIrzCHhP6v/FJ9d95bl5o14Nbw77upH2peZURPBK491P5PYtjVMQJQ/enxBeoku6
	9neVmwgZuDl9iRsP/tAXUGuYn05mDR2lTs9BmH453b99R6E01RFVaQmK/as9j2yVltMQCtyXooOrW
	VBxiELzNDqLSLLmB0gse1K6ZVetrVwmExyHTO4/Az7bnuTwZ+vBUm1pAPvu3/7O1BJrRIx1DXzkoW
	BajwaccUAhOFXjG/Vssw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qTwuU-006Sit-2H;
	Thu, 10 Aug 2023 04:04:30 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qTwuR-006Shf-1d
	for linux-riscv@lists.infradead.org;
	Thu, 10 Aug 2023 04:04:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1691640266;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=UzQb2VuQCXwMdF/Rvu48wxhx8ntZSb1KliAOBLDDWgc=;
	b=Yl0jKg/rNhmszA7A+Bh4uoKpbcFDU/mHY3ZkVDr2kDlYyPIL5Kb5rWrm2FRyBguWK7u1+y
	6D75oE2e1Cp8/ziaDrZl9RYFnUhjR0ypUuYSJ+rQV+jG73LniJpOTDWADhP8++bBSnTyeH
	SA/nWumDkAm1OfJN+DmKJlBjSTSxXQA=
Received: from mail-oi1-f200.google.com (mail-oi1-f200.google.com
 [209.85.167.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-290-71isEnHNPYG-RiFsjDp2yw-1; Thu, 10 Aug 2023 00:04:24 -0400
X-MC-Unique: 71isEnHNPYG-RiFsjDp2yw-1
Received: by mail-oi1-f200.google.com with SMTP id 5614622812f47-3a1ec37ccbbso633857b6e.0
        for <linux-riscv@lists.infradead.org>; Wed, 09 Aug 2023 21:04:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691640263; x=1692245063;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UzQb2VuQCXwMdF/Rvu48wxhx8ntZSb1KliAOBLDDWgc=;
        b=FazEVBPUM3Rdg3ing8xdVOyNbhJ/21mPdsjxj2HnTGaK5hwliRjrA4shMT3PR4+gUF
         rbGey7rShqR6KH40lskpGrxfq2Cnx3js/Bd0m8gjCW9tkwolsTOeLRERSD+QejFAuPFA
         r204tRtBGaeDA1fz4GkHJOxZbTId23omIzBQMv96KQ3eRWrcvD7MSBvU0q1dUUyzsIBN
         sqD0Ks3yPjfiBHuRDl5UstNgQrSlrpOroLR1sVRo5uLHHe4nLxl1xZTPGPXX10iSRSJ1
         oCJdrkiKBWN6BWaqX325anBo0JjZwKtwMMc0P2afdDRVlW9b5TAwUDqG3QJ3qrM7JAQP
         9wbQ==
X-Gm-Message-State: AOJu0YwvhmXvB9LHMhxX8tBBP3OWPhpEF9V5c+yu5S6/YZRXatsttvNm
	r7+FBbL+KqDMYazTvQdw8fTHDVxUeUshzxL8U8Ecm3FMG0iFwBH1hbym9M6Hem+dg8bs4tYoZY8
	1skuyhoJybkjizWUIQ7xvdb82EQ5t
X-Received: by 2002:a05:6808:998:b0:3a7:540f:ca71 with SMTP id a24-20020a056808099800b003a7540fca71mr1397776oic.53.1691640262937;
        Wed, 09 Aug 2023 21:04:22 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEoKJIRWaoDwasWuxkhBvZiGi90hdZ5+o2Vt5j+J0Py97VRwdk+5mjOtZ8GjfL51BjhINmyUg==
X-Received: by 2002:a05:6808:998:b0:3a7:540f:ca71 with SMTP id a24-20020a056808099800b003a7540fca71mr1397752oic.53.1691640262690;
        Wed, 09 Aug 2023 21:04:22 -0700 (PDT)
Received: from localhost.localdomain ([2804:431:c7ec:e667:6b7d:ed55:c363:a088])
        by smtp.gmail.com with ESMTPSA id b12-20020aca674c000000b003a7b5193909sm310087oiy.19.2023.08.09.21.04.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Aug 2023 21:04:22 -0700 (PDT)
From: Leonardo Bras <leobras@redhat.com>
To: Will Deacon <will@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Boqun Feng <boqun.feng@gmail.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Leonardo Bras <leobras@redhat.com>,
	Andrea Parri <parri.andrea@gmail.com>,
	Andrzej Hajda <andrzej.hajda@intel.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Palmer Dabbelt <palmer@rivosinc.com>,
	Guo Ren <guoren@kernel.org>
Cc: linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: [RFC PATCH v5 3/5] riscv/atomic.h : Deduplicate arch_atomic.*
Date: Thu, 10 Aug 2023 01:03:45 -0300
Message-ID: <20230810040349.92279-5-leobras@redhat.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230810040349.92279-2-leobras@redhat.com>
References: <20230810040349.92279-2-leobras@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230809_210427_616768_440358E3 
X-CRM114-Status: GOOD (  11.74  )
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

(This did not cause any change in generated asm)

Signed-off-by: Leonardo Bras <leobras@redhat.com>
Reviewed-by: Guo Ren <guoren@kernel.org>
Reviewed-by: Andrea Parri <parri.andrea@gmail.com>
---
 arch/riscv/include/asm/atomic.h | 164 +++++++++++++++-----------------
 1 file changed, 76 insertions(+), 88 deletions(-)

diff --git a/arch/riscv/include/asm/atomic.h b/arch/riscv/include/asm/atomic.h
index f5dfef6c2153..80cca7ac16fd 100644
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
@@ -222,77 +228,86 @@ static __always_inline s64 arch_atomic64_fetch_add_unless(atomic64_t *v, s64 a,
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
 #endif
 
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
 
@@ -304,17 +319,8 @@ static __always_inline bool arch_atomic64_inc_unless_negative(atomic64_t *v)
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
 
@@ -325,17 +331,8 @@ static __always_inline bool arch_atomic64_dec_unless_positive(atomic64_t *v)
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
 
@@ -346,17 +343,8 @@ static __always_inline s64 arch_atomic64_dec_if_positive(atomic64_t *v)
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
2.41.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
