Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5A60CA5FD4
	for <linux-riscv@archiver.kernel.org>; Fri,  2 Oct 2026 16:59:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Quqxh0WUytRqZ7OcFhijazkqh8J8Z0pAEyxsZhd4KMU=; b=v76QbojoiWvTge
	z1OSvL5zyRwOj0qhTlNnmppHqOf9hy08T9IP6wfE9B5y4jYCNJb2Vj4d+L3GAl1se74mhq/lvCmYF
	hYlX7y/W3cKoJP+pZGmQqfG/m7P7zT7uQCxwzB7VhYST4co6Ouh0D+WVeXPdNRY61ylBovy5ajZ1m
	sRN4zwaila4omk7TUM3niAbXoMLomRCaCWh4waEreF/f7tuRsxrSPl/cgJGG+WHch0Q59UBAGAhKE
	WJHmuWk0rp7gOa3wVEtzrckIrB+TAgPPStTEPdqIt5QNWyRcQFiwIhgckhDiqqMnuNfyV7qa4epGj
	tCnwiBZhRNNdauht9xGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCgbc-0000000C5qt-11bn;
	Fri, 02 Oct 2026 16:59:32 +0000
Received: from mail-pj2-x0c.google.com ([2607:f8b0:4864:39::c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCgba-0000000C5qE-2K60
	for linux-riscv@lists.infradead.org;
	Fri, 02 Oct 2026 16:59:31 +0000
Received: by mail-pj2-x0c.google.com with SMTP id 98e67ed59e1d1-3a0d2c37b0bso109228a91.0
        for <linux-riscv@lists.infradead.org>; Fri, 02 Oct 2026 09:59:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1790960367; x=1791565167; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/KecXxzmarKjPHcGWecVVcSwGLZFLihD2GXEEcgxEQQ=;
        b=T2yJ0CM1w0LNiAN9UDOwdt+lLZ4hgObs76rcX4YKbREGQn4+3QZFXhEDTHGLgsMNQK
         V/g6EqTNdF/IWRcVqdfaJBsOlFVN0r0O1d6+1y8J6I9l69AEJH5DVBPJFr9UXj81nbc3
         FNCRjIoFdQNbFdSEDgAAoAbuVdWCzayn0fzeOw+ANUA0H62d4PFXLb/nl6E1ghDsyyTO
         DNh4ZMutM/5RxMGtAkligvl93NAmx4XWXM+5pmPuuj9lf/kQPg7exT4RDPGdLsdbVEAu
         6ZMxmJqkwaKl8g/ucEYze4vBX9tI8A2k5e0VzJUySf/TmnSZn5O+uwxkDnsEC65fxJ9y
         xU8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790960367; x=1791565167;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=/KecXxzmarKjPHcGWecVVcSwGLZFLihD2GXEEcgxEQQ=;
        b=iLIVcUlT2k8S/NRYrH9Bj3d6eS+ceRG7uaf1Nlt5uSOuTzzpL4ZnbPoAc5BmlMfhy4
         kLtg7jHMMikCVc7PRGjeFfRUIwiDzGNGKVze+26mudIFIxwCyynwGo/+bIMn2O73LNe3
         vPQ57q67iS9cCzQ6+ogm7whdTgQKFGF+45HxARNReqZjI8VVCMWzUijJJo+vrAMH4Ag+
         NmZbJvZhJpva1vCqR4RO8blGAzcFQW8+mCaoYuUYbbq/M6h8xlXtEWKN8/ykVJXhUD3W
         ukuiJbYduXn1jO/L8WBFnTiA9txRot/4RJFl0iFKL0mJOIfujCFmzK2+V+bnxzPnCMu8
         waOg==
X-Gm-Message-State: AFq9FYLcOTQxTGaeYaiqnp+ogqwbGQZ4bHj6LLxg4J1n8yv3yFRENTMH
	ClNjO9B51B6aRdgrO83rwUVMaLcoK0EoxXarXBENkf/Q4ShYebo2fcIYo94ie437ddSfycMDtya
	PJziRsq+gxg==
X-Gm-Gg: AYBFou3Am64UeXYkf9Ey9jDm4aED/v3pUfJU3YwEGkfmfu3sdPpbCtKGC7pMZVgbm2e
	vW3MEanimCLPBcj3+3R3fa5KpJDAkJX8Tmdz/w2rn9sWzG98j81OBUujtbiM34PG6tzctqn/dbm
	50pyU89D0LxD07lBd0pSTXVUWvBBvUT8RTrhZ6qtSkzmIMo7j/T/5huSwgMP0OgwNy6KYqiHU12
	kTa3EmnJWLTx0ounKsLxUpC4+czR+dWrRDpBfcvIdv+IEgC4NyhuZtKS8JDLcbSaUSUvDlkcHW0
	sTgWLSU4i2y1o8WZ04aNJtAeCnzsUFXnFilUaShDvh6JgXPmHLwkAiH9eGww9dSSGvPc2Fg9Trn
	gf1sE5TSzNPMfnlUfnBdj8I29070w6gwPJ1wq6VXFIlv3oe2LvViuQysAtdFf3RKJWoIZMOvu98
	ih5WwlsoHGi97/FDOR/NHDZFifkHppWpvO1y+Zw85vvYhwBRIlrAZBFbsQgJ9ElJjs3VYhyOGNq
	DLuapBkAJ1MuaS4ig==
X-Received: by 2002:a17:90b:3a0f:b0:3a4:d476:e10c with SMTP id 98e67ed59e1d1-3a6ce79667amr2617795a91.28.1790960366557;
        Fri, 02 Oct 2026 09:59:26 -0700 (PDT)
Received: from n37-012-226.byted.org ([115.190.40.12])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a6cd5d88bbsm4900871a91.12.2026.10.02.09.59.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 09:59:26 -0700 (PDT)
From: Qingwei Hu <qingwei.hu@bytedance.com>
To: linux-riscv@lists.infradead.org
Cc: linux-kernel@vger.kernel.org,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Will Deacon <will@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Boqun Feng <boqun@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Gary Guo <gary@garyguo.net>,
	Andrea Parri <parri.andrea@gmail.com>,
	Guo Ren <guoren@kernel.org>,
	Xu Lu <luxu.kernel@bytedance.com>,
	Yunhui Cui <cuiyunhui@bytedance.com>,
	Qingwei Hu <qingwei.hu@bytedance.com>
Subject: [PATCH v5 1/5] riscv: Strengthen fallback barriers with Zalasr
Date: Sat,  3 Oct 2026 00:59:06 +0800
Message-Id: <20261002165910.3818940-2-qingwei.hu@bytedance.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20261002165910.3818940-1-qingwei.hu@bytedance.com>
References: <20261002165910.3818940-1-qingwei.hu@bytedance.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261002_095930_603568_6812262B 
X-CRM114-Status: GOOD (  10.55  )
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

RISC-V acquire and release primitives currently use directional fences
around plain loads, stores, and relaxed atomic operations. Later changes
can use Zalasr acquire and release annotations instead. Mixing the two
mappings needs a full fence on the fence-based side to retain the RCsc
guarantees expected by the Linux memory model.

Before introducing annotated operations, use alternatives to upgrade the
remaining directional fences in load/store, xchg/cmpxchg, and generic
atomic fallbacks on Zalasr systems. Keep the existing fences when Zalasr
is unavailable.

Signed-off-by: Qingwei Hu <qingwei.hu@bytedance.com>
---
 arch/riscv/include/asm/atomic.h  |  8 ++++++--
 arch/riscv/include/asm/barrier.h |  8 ++++++--
 arch/riscv/include/asm/cmpxchg.h | 25 +++++++++++++++++++------
 arch/riscv/include/asm/fence.h   |  9 +++++++++
 4 files changed, 40 insertions(+), 10 deletions(-)

diff --git a/arch/riscv/include/asm/atomic.h b/arch/riscv/include/asm/atomic.h
index 616b8b332ac56..03d477a65dc6e 100644
--- a/arch/riscv/include/asm/atomic.h
+++ b/arch/riscv/include/asm/atomic.h
@@ -19,10 +19,14 @@
 #include <asm/cmpxchg.h>
 
 #define __atomic_acquire_fence()					\
-	__asm__ __volatile__(RISCV_ACQUIRE_BARRIER "" ::: "memory")
+	__asm__ __volatile__(RISCV_ZALASR_SMP_ALTERNATIVE(		\
+		RISCV_ACQUIRE_BARRIER, RISCV_FULL_BARRIER)		\
+		::: "memory")
 
 #define __atomic_release_fence()					\
-	__asm__ __volatile__(RISCV_RELEASE_BARRIER "" ::: "memory");
+	__asm__ __volatile__(RISCV_ZALASR_SMP_ALTERNATIVE(		\
+		RISCV_RELEASE_BARRIER, RISCV_FULL_BARRIER)		\
+		::: "memory");
 
 static __always_inline int arch_atomic_read(const atomic_t *v)
 {
diff --git a/arch/riscv/include/asm/barrier.h b/arch/riscv/include/asm/barrier.h
index 700ba3f922cb5..51a73712b6a12 100644
--- a/arch/riscv/include/asm/barrier.h
+++ b/arch/riscv/include/asm/barrier.h
@@ -54,7 +54,9 @@
 #define __smp_store_release(p, v)					\
 do {									\
 	compiletime_assert_atomic_type(*p);				\
-	RISCV_FENCE(rw, w);						\
+	__asm__ __volatile__(RISCV_ZALASR_ALTERNATIVE(			\
+		RISCV_FENCE_ASM(rw, w), RISCV_FENCE_ASM(rw, rw))	\
+		::: "memory");						\
 	WRITE_ONCE(*p, v);						\
 } while (0)
 
@@ -62,7 +64,9 @@ do {									\
 ({									\
 	typeof(*p) ___p1 = READ_ONCE(*p);				\
 	compiletime_assert_atomic_type(*p);				\
-	RISCV_FENCE(r, rw);						\
+	__asm__ __volatile__(RISCV_ZALASR_ALTERNATIVE(			\
+		RISCV_FENCE_ASM(r, rw), RISCV_FENCE_ASM(rw, rw))	\
+		::: "memory");						\
 	___p1;								\
 })
 
diff --git a/arch/riscv/include/asm/cmpxchg.h b/arch/riscv/include/asm/cmpxchg.h
index 662e160b05229..39f8195c9fd6c 100644
--- a/arch/riscv/include/asm/cmpxchg.h
+++ b/arch/riscv/include/asm/cmpxchg.h
@@ -105,10 +105,15 @@
 
 #define arch_xchg_acquire(ptr, x)					\
 	_arch_xchg(ptr, x, "", "", "",					\
-		   RISCV_ACQUIRE_BARRIER, RISCV_ACQUIRE_BARRIER)
+		   RISCV_ZALASR_SMP_ALTERNATIVE(			\
+			RISCV_ACQUIRE_BARRIER, RISCV_FULL_BARRIER),	\
+		   RISCV_ZALASR_SMP_ALTERNATIVE(			\
+			RISCV_ACQUIRE_BARRIER, RISCV_FULL_BARRIER))
 
 #define arch_xchg_release(ptr, x)					\
-	_arch_xchg(ptr, x, "", "", RISCV_RELEASE_BARRIER, "", "")
+	_arch_xchg(ptr, x, "", "",					\
+		   RISCV_ZALASR_SMP_ALTERNATIVE(			\
+			RISCV_RELEASE_BARRIER, RISCV_FULL_BARRIER), "", "")
 
 #define arch_xchg(ptr, x)						\
 	_arch_xchg(ptr, x, ".rl", ".aqrl", "", RISCV_FULL_BARRIER, "")
@@ -279,14 +284,22 @@
 #define arch_cmpxchg_acquire(ptr, o, n)					\
 	_arch_cmpxchg((ptr), (o), (n),					\
 		      SC_SFX(""), CAS_SFX(""),				\
-		      SC_PREPEND(""), SC_APPEND(RISCV_ACQUIRE_BARRIER),	\
-		      CAS_PREPEND(""), CAS_APPEND(RISCV_ACQUIRE_BARRIER))
+		      SC_PREPEND(""), SC_APPEND(			\
+			RISCV_ZALASR_SMP_ALTERNATIVE(			\
+				RISCV_ACQUIRE_BARRIER, RISCV_FULL_BARRIER)), \
+		      CAS_PREPEND(""), CAS_APPEND(			\
+			RISCV_ZALASR_SMP_ALTERNATIVE(			\
+				RISCV_ACQUIRE_BARRIER, RISCV_FULL_BARRIER)))
 
 #define arch_cmpxchg_release(ptr, o, n)					\
 	_arch_cmpxchg((ptr), (o), (n),					\
 		      SC_SFX(""), CAS_SFX(""),				\
-		      SC_PREPEND(RISCV_RELEASE_BARRIER), SC_APPEND(""),	\
-		      CAS_PREPEND(RISCV_RELEASE_BARRIER), CAS_APPEND(""))
+		      SC_PREPEND(RISCV_ZALASR_SMP_ALTERNATIVE(		\
+			RISCV_RELEASE_BARRIER, RISCV_FULL_BARRIER)),	\
+		      SC_APPEND(""),					\
+		      CAS_PREPEND(RISCV_ZALASR_SMP_ALTERNATIVE(	\
+			RISCV_RELEASE_BARRIER, RISCV_FULL_BARRIER)),	\
+		      CAS_APPEND(""))
 
 #define arch_cmpxchg(ptr, o, n)						\
 	_arch_cmpxchg((ptr), (o), (n),					\
diff --git a/arch/riscv/include/asm/fence.h b/arch/riscv/include/asm/fence.h
index 182db7930edc2..607f56c9b8516 100644
--- a/arch/riscv/include/asm/fence.h
+++ b/arch/riscv/include/asm/fence.h
@@ -2,6 +2,15 @@
 #ifndef _ASM_RISCV_FENCE_H
 #define _ASM_RISCV_FENCE_H
 
+#include <asm/alternative-macros.h>
+#include <asm/hwcap.h>
+
+#define RISCV_ZALASR_ALTERNATIVE(old, new) \
+	ALTERNATIVE(old, new, 0, RISCV_ISA_EXT_ZALASR, 1)
+
+#define RISCV_ZALASR_SMP_ALTERNATIVE(old, new) \
+	ALTERNATIVE(old, new, 0, RISCV_ISA_EXT_ZALASR, CONFIG_SMP)
+
 #define RISCV_FENCE_ASM(p, s)		"\tfence " #p "," #s "\n"
 #define RISCV_FENCE(p, s) \
 	({ __asm__ __volatile__ (RISCV_FENCE_ASM(p, s) : : : "memory"); })
-- 
2.39.5


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
