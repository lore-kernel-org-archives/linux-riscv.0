Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6CE5DCA5FD4
	for <linux-riscv@archiver.kernel.org>; Fri,  2 Oct 2026 17:00:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YJAwAktHf4MgJY7C22biQJUePAPcPPjO1nbARM0itHc=; b=I6wX9nbBRgdNn4
	4CTPaEIM3yRV64gXrBcQLamCSkMeEB1D2hCca8W1NvhrFihHDpv4QGEnQek8i9SP9T6OOGjM3VYCv
	c/0PKH1Ada5u9xvRMXo6SnZ7PD9AUb1WdJhYbKszrbJqW3gu0w6Z4cw8SZYo1T7+q4GyiLXpFHeby
	CHJAeM0WhanBr229fA8ue8yI4Sw9akNVu6Ue82aKfazt3FA2oAuyBslqLvUyqzC9Mpo8ylynj08iU
	KzHQHgkcEHq2TV8LyHf5YbgM/8Nbwb4BtXbolS5wONc8v9gD4xSuzV1HARbSxD9EQi1afBAiHrxUj
	HCVNK+bPCx/CGhciuhJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCgbx-0000000C5yN-3jBF;
	Fri, 02 Oct 2026 16:59:53 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCgbw-0000000C5wt-17xi
	for linux-riscv@bombadil.infradead.org;
	Fri, 02 Oct 2026 16:59:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=wr4LtdUbpqcAeSn0rG32NGieF132dt6UAMZa+jOZzQA=; b=j3CKLKZaGroKo+Sq+DAHb9iEsW
	dX7jiqjhWiKD8TuSCT0Gy3/OhV23hM8clIFVHF8c0Qp0bbREON2mecUfclZ434de+8rNbmnWE540K
	lqP8tjOLGLJqBwQEMazZHZXUtAx0Gcb81MD0iOSLRrONl4JorbYcZmMlCJVRjGXbdL1iBue5Z0xg1
	buYAh+Ioil63Qvu3nTOMyeB55UwKzSTUV8OqlznnBrLGtZPREkzN0ivhNwXbd8xzMfoVMT5OAnax/
	ecmZ+Cr7BNySWPGGcJ6jpdvYb4Z28mlWUqWDhBrV0UZJFrkxuk1Pl6M/LI1MqPy++57BtR0BfglN/
	4iYhoP7A==;
Received: from mail-pj2-x11.google.com ([2607:f8b0:4864:39::11])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1xCgbs-000000068sQ-1EII
	for linux-riscv@lists.infradead.org;
	Fri, 02 Oct 2026 16:59:51 +0000
Received: by mail-pj2-x11.google.com with SMTP id d9443c01a7336-2d747f0b25dso50215465ad.2
        for <linux-riscv@lists.infradead.org>; Fri, 02 Oct 2026 09:59:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1790960386; x=1791565186; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wr4LtdUbpqcAeSn0rG32NGieF132dt6UAMZa+jOZzQA=;
        b=EyNvcCyiI05zcxoNnucfWEkRullOu2FMTLye6dReP+gnFoa4I/gRSUjcQ1VfOYuhBY
         kwt51LPJIZXIiFj6KZrOGRiTK1FPQhE/9v72h4vNeiTjQJIqhVupKdqsDCwBDlyZfqJP
         /V222Z9OgWCumQCfui9wf6JSkJhKU+lHZIpU31otHC3WmEz6/GVYdYW6JvBIYM03tg9y
         dpIfYiqAkYJgD8wxWNjpDzer5rpsMEnH1ppGGbZsrmvdQTqsXyHXOCtUR8VVJIHae9E9
         H2K2N16X8o1wR1g8rgJqLkEG6jlBL+XBASUxp+aRcJG6snFPbgQJ4ILH/p7PLQDmaYKg
         QWXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790960386; x=1791565186;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=wr4LtdUbpqcAeSn0rG32NGieF132dt6UAMZa+jOZzQA=;
        b=YEs0U+fYEnbHEn1axtGMCEX1wtnJt8p/OPEV+XTcfxjeDNCrU/1filwepY989UtuxM
         dLbtRBBxqD0Gt09k9kI8+5QV3/nunuqselNGCTAxxrV+HkxRkUXVPMJsuu0meSwdoMAP
         USb9T3av36nKswfJmGEP/EBkXyiWM3ZLKLBVIGbK2GHPbKaXgZt9U/EkzoC/FH1lG/Ft
         HIxVvmNRGWNf4GKcx6mxRCQfnxMOsZfB3YizpDqTAklYweTbIZRXOCM5naZTn/1OTEBz
         8u+S47hvG8a19+Ifjp6HtWPZy8/cRaiF3BhiqkxWgbR+iyMu4fATM+bS29BDhN/UOjtp
         4azQ==
X-Gm-Message-State: AFq9FYJqVwPnDZOyhJ/3K0MAu2tMeDzylm8gSBr7eVcxfi7VvVQdVxfp
	XZd99Z2xxSIcZ4j+P928sAdIL4B5ZDaOIrkFPXGyll6g+fa2sGHxrE24TNhVGjI1g/2rI3PPNnP
	FedU9ez9CjQ==
X-Gm-Gg: AYBFou1GwBHlViQhr2ms8jIeolfswvN0QrNrePX8uw5ORt4KpxIyTnjSsXmCWtk6Wtp
	DwYZTgLRcr/MKifZnrgMq++3ybjzdCBRCMvnGecDi8DhvLk9RjmXtJ0c7r1GhV+AIIUC0IBbMgE
	GLYtQbcmnsB1VfrDjBJ62YiTlwvq0K87TjuJItsnNmA1YScG7Vl7HuzDEsIQlmXcKZAzIOHPk+k
	Co+WhKj+a0hOrqypjSj6ufubWJSSSr84MAA+GQma4SCaBRyefN0czsSzQYat3+qCmNohO1Tts5w
	Wt4cfKjhqx/H0mYe045EedRtFeCT8AGxO5oFckw9+9v1MMbbSV+Elfboq/ygrVt24wLJnBAMajt
	cu/oujcsI+cK3ZBShUJfwlkkPwQ5rtTYRi5FSnv4HFjvAEQCMPc93Tauo09lzlgVOy6fIL5JT/t
	ay7QXKRwpGmKzqDwaejygHiEkJZqTHRr2sN2vSStS1d03HjBgDpAtOi0VxxUS8p3YA8WMmPDzm/
	Dl4EBobkh0lxnIcprOV9LFT7GAX
X-Received: by 2002:a17:90b:528d:b0:3a0:d2f3:fa80 with SMTP id 98e67ed59e1d1-3a6ce647e72mr3012020a91.6.1790960386164;
        Fri, 02 Oct 2026 09:59:46 -0700 (PDT)
Received: from n37-012-226.byted.org ([115.190.40.12])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a6cd5d88bbsm4900871a91.12.2026.10.02.09.59.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 09:59:45 -0700 (PDT)
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
Subject: [PATCH v5 4/5] riscv: Use Zalasr for xchg and cmpxchg ordering
Date: Sat,  3 Oct 2026 00:59:09 +0800
Message-Id: <20261002165910.3818940-5-qingwei.hu@bytedance.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20261002165910.3818940-1-qingwei.hu@bytedance.com>
References: <20261002165910.3818940-1-qingwei.hu@bytedance.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261002_175949_470695_08DA6AC7 
X-CRM114-Status: GOOD (  13.43  )
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

From: Xu Lu <luxu.kernel@bytedance.com>

RISC-V implements acquire and release xchg/cmpxchg operations with a
directional fence before or after a relaxed atomic instruction. Fully
ordered LR/SC fallbacks use sc.rl followed by a full fence.

Keep those sequences as the default alternatives. On Zalasr systems, use
aq or rl annotations on the LR, SC, AMO, or CAS instruction and replace
the matching fence with a nop. Use lr.aq together with sc.aqrl for fully
ordered LR/SC fallbacks. Direct fully ordered AMO and CAS paths are
already annotated and remain unchanged.

Apply the alternatives to both the Zabha/Zacas paths and their LR/SC
fallbacks while retaining the instruction-set option scopes required by
newer toolchains. Relaxed operations do not gain alternative entries.

Signed-off-by: Xu Lu <luxu.kernel@bytedance.com>
Co-developed-by: Yunhui Cui <cuiyunhui@bytedance.com>
Signed-off-by: Yunhui Cui <cuiyunhui@bytedance.com>
Co-developed-by: Qingwei Hu <qingwei.hu@bytedance.com>
Signed-off-by: Qingwei Hu <qingwei.hu@bytedance.com>
---
 arch/riscv/include/asm/cmpxchg.h | 186 +++++++++++++++++++------------
 1 file changed, 114 insertions(+), 72 deletions(-)

diff --git a/arch/riscv/include/asm/cmpxchg.h b/arch/riscv/include/asm/cmpxchg.h
index 39f8195c9fd6c..eac60cf91b9b5 100644
--- a/arch/riscv/include/asm/cmpxchg.h
+++ b/arch/riscv/include/asm/cmpxchg.h
@@ -16,8 +16,12 @@
 #include <asm/processor.h>
 #include <asm/errata_list.h>
 
-#define __arch_xchg_masked(sc_sfx, swap_sfx, prepend, sc_append,		\
-			   swap_append, r, p, n)				\
+#define RISCV_SELECT_OLD(old, ...)	old
+
+#define __arch_xchg_masked(lr_alt, sc_alt, swap_alt,			\
+			   lr_sfx, sc_sfx, swap_sfx,			\
+			   z_lr_sfx, z_sc_sfx, z_swap_sfx,		\
+			   prepend, sc_append, swap_append, r, p, n)	\
 ({										\
 	if (IS_ENABLED(CONFIG_RISCV_ISA_ZABHA) &&				\
 	    riscv_has_extension_unlikely(RISCV_ISA_EXT_ZABHA)) {		\
@@ -25,7 +29,8 @@
 			prepend							\
 			"	.option push\n"					\
 			"	.option arch, +zabha\n"				\
-			"	amoswap" swap_sfx " %0, %z2, %1\n"		\
+			swap_alt("	amoswap" swap_sfx " %0, %z2, %1\n",\
+				 "	amoswap" z_swap_sfx " %0, %z2, %1\n") \
 			"	.option pop\n"					\
 			swap_append						\
 			: "=&r" (r), "+A" (*(p))				\
@@ -43,10 +48,13 @@
 		__asm__ __volatile__ (						\
 		       prepend							\
 		       PREFETCHW_ASM(%5)					\
-		       "0:	lr.w %0, %2\n"					\
+		       "0:\n"						\
+		       lr_alt("	lr.w" lr_sfx " %0, %2\n",		\
+			      "	lr.w" z_lr_sfx " %0, %2\n")		\
 		       "	and  %1, %0, %z4\n"				\
 		       "	or   %1, %1, %z3\n"				\
-		       "	sc.w" sc_sfx " %1, %1, %2\n"			\
+		       sc_alt("	sc.w" sc_sfx " %1, %1, %2\n",		\
+			      "	sc.w" z_sc_sfx " %1, %1, %2\n")	\
 		       "	bnez %1, 0b\n"					\
 		       sc_append						\
 		       : "=&r" (__retx), "=&r" (__rc), "+A" (*(__ptr32b))	\
@@ -57,19 +65,23 @@
 	}									\
 })
 
-#define __arch_xchg(sfx, prepend, append, r, p, n)			\
+#define __arch_xchg(swap_alt, swap_sfx, z_swap_sfx,			\
+		    prepend, append, r, p, n)				\
 ({									\
 	__asm__ __volatile__ (						\
 		prepend							\
-		"	amoswap" sfx " %0, %2, %1\n"			\
+		swap_alt("	amoswap" swap_sfx " %0, %2, %1\n",	\
+			 "	amoswap" z_swap_sfx " %0, %2, %1\n")	\
 		append							\
 		: "=r" (r), "+A" (*(p))					\
 		: "r" (n)						\
 		: "memory");						\
 })
 
-#define _arch_xchg(ptr, new, sc_sfx, swap_sfx, prepend,			\
-		   sc_append, swap_append)				\
+#define _arch_xchg(ptr, new, lr_alt, sc_alt, swap_alt,			\
+		   lr_sfx, sc_sfx, swap_sfx,				\
+		   z_lr_sfx, z_sc_sfx, z_swap_sfx,			\
+		   prepend, sc_append, swap_append)			\
 ({									\
 	__typeof__(ptr) __ptr = (ptr);					\
 	__typeof__(*(__ptr)) __new = (new);				\
@@ -77,22 +89,26 @@
 									\
 	switch (sizeof(*__ptr)) {					\
 	case 1:								\
-		__arch_xchg_masked(sc_sfx, ".b" swap_sfx,		\
+		__arch_xchg_masked(lr_alt, sc_alt, swap_alt,		\
+				   lr_sfx, sc_sfx, ".b" swap_sfx,	\
+				   z_lr_sfx, z_sc_sfx, ".b" z_swap_sfx,\
 				   prepend, sc_append, swap_append,	\
 				   __ret, __ptr, __new);		\
 		break;							\
 	case 2:								\
-		__arch_xchg_masked(sc_sfx, ".h" swap_sfx,		\
+		__arch_xchg_masked(lr_alt, sc_alt, swap_alt,		\
+				   lr_sfx, sc_sfx, ".h" swap_sfx,	\
+				   z_lr_sfx, z_sc_sfx, ".h" z_swap_sfx,\
 				   prepend, sc_append, swap_append,	\
 				   __ret, __ptr, __new);		\
 		break;							\
 	case 4:								\
-		__arch_xchg(".w" swap_sfx, prepend, swap_append,	\
-			      __ret, __ptr, __new);			\
+		__arch_xchg(swap_alt, ".w" swap_sfx, ".w" z_swap_sfx,\
+			      prepend, swap_append, __ret, __ptr, __new);\
 		break;							\
 	case 8:								\
-		__arch_xchg(".d" swap_sfx, prepend, swap_append,	\
-			      __ret, __ptr, __new);			\
+		__arch_xchg(swap_alt, ".d" swap_sfx, ".d" z_swap_sfx,\
+			      prepend, swap_append, __ret, __ptr, __new);\
 		break;							\
 	default:							\
 		BUILD_BUG();						\
@@ -101,22 +117,36 @@
 })
 
 #define arch_xchg_relaxed(ptr, x)					\
-	_arch_xchg(ptr, x, "", "", "", "", "")
+	_arch_xchg(ptr, x,						\
+		   RISCV_SELECT_OLD, RISCV_SELECT_OLD, RISCV_SELECT_OLD,\
+		   "", "", "", "", "", "", "", "", "")
 
 #define arch_xchg_acquire(ptr, x)					\
-	_arch_xchg(ptr, x, "", "", "",					\
+	_arch_xchg(ptr, x,						\
+		   RISCV_ZALASR_SMP_ALTERNATIVE, RISCV_SELECT_OLD,	\
+		   RISCV_ZALASR_SMP_ALTERNATIVE,			\
+		   "", "", "", ".aq", "", ".aq", "",		\
 		   RISCV_ZALASR_SMP_ALTERNATIVE(			\
-			RISCV_ACQUIRE_BARRIER, RISCV_FULL_BARRIER),	\
+			RISCV_ACQUIRE_BARRIER, __nops(1)),		\
 		   RISCV_ZALASR_SMP_ALTERNATIVE(			\
-			RISCV_ACQUIRE_BARRIER, RISCV_FULL_BARRIER))
+			RISCV_ACQUIRE_BARRIER, __nops(1)))
 
 #define arch_xchg_release(ptr, x)					\
-	_arch_xchg(ptr, x, "", "",					\
+	_arch_xchg(ptr, x,						\
+		   RISCV_SELECT_OLD, RISCV_ZALASR_SMP_ALTERNATIVE,	\
+		   RISCV_ZALASR_SMP_ALTERNATIVE,			\
+		   "", "", "", "", ".rl", ".rl",			\
 		   RISCV_ZALASR_SMP_ALTERNATIVE(			\
-			RISCV_RELEASE_BARRIER, RISCV_FULL_BARRIER), "", "")
+			RISCV_RELEASE_BARRIER, __nops(1)), "", "")
 
 #define arch_xchg(ptr, x)						\
-	_arch_xchg(ptr, x, ".rl", ".aqrl", "", RISCV_FULL_BARRIER, "")
+	_arch_xchg(ptr, x,						\
+		   RISCV_ZALASR_SMP_ALTERNATIVE,			\
+		   RISCV_ZALASR_SMP_ALTERNATIVE,			\
+		   RISCV_SELECT_OLD,					\
+		   "", ".rl", ".aqrl", ".aq", ".aqrl", ".aqrl", "",\
+		   RISCV_ZALASR_SMP_ALTERNATIVE(			\
+			RISCV_FULL_BARRIER, __nops(1)), "")
 
 #define xchg32(ptr, x)							\
 ({									\
@@ -135,10 +165,11 @@
  * store NEW in MEM.  Return the initial value in MEM.  Success is
  * indicated by comparing RETURN with OLD.
  */
-#define __arch_cmpxchg_masked(sc_sfx, cas_sfx,					\
+#define __arch_cmpxchg_masked(lr_alt, sc_alt, cas_alt,				\
+			      lr_sfx, sc_sfx, cas_sfx,				\
+			      z_lr_sfx, z_sc_sfx, z_cas_sfx,			\
 			      sc_prepend, sc_append,				\
-			      cas_prepend, cas_append,				\
-			      r, p, o, n)					\
+			      cas_prepend, cas_append, r, p, o, n)		\
 ({										\
 	if (IS_ENABLED(CONFIG_RISCV_ISA_ZABHA) &&				\
 	    IS_ENABLED(CONFIG_RISCV_ISA_ZACAS) &&				\
@@ -151,7 +182,8 @@
 			cas_prepend							\
 			"	.option push\n"					\
 			"	.option arch, +zacas, +zabha\n"				\
-			"	amocas" cas_sfx " %0, %z2, %1\n"		\
+			cas_alt("	amocas" cas_sfx " %0, %z2, %1\n",	\
+				"	amocas" z_cas_sfx " %0, %z2, %1\n")	\
 			"	.option pop\n"					\
 			cas_append							\
 			: "+&r" (r), "+A" (*(p))				\
@@ -169,12 +201,15 @@
 										\
 		__asm__ __volatile__ (						\
 			sc_prepend							\
-			"0:	lr.w %0, %2\n"					\
+			"0:\n"							\
+			lr_alt("	lr.w" lr_sfx " %0, %2\n",			\
+			       "	lr.w" z_lr_sfx " %0, %2\n")		\
 			"	and  %1, %0, %z5\n"				\
 			"	bne  %1, %z3, 1f\n"				\
 			"	and  %1, %0, %z6\n"				\
 			"	or   %1, %1, %z4\n"				\
-			"	sc.w" sc_sfx " %1, %1, %2\n"			\
+			sc_alt("	sc.w" sc_sfx " %1, %1, %2\n",		\
+			       "	sc.w" z_sc_sfx " %1, %1, %2\n")	\
 			"	bnez %1, 0b\n"					\
 			sc_append							\
 			"1:\n"							\
@@ -187,10 +222,11 @@
 	}									\
 })
 
-#define __arch_cmpxchg(lr_sfx, sc_sfx, cas_sfx,				\
+#define __arch_cmpxchg(lr_alt, sc_alt, cas_alt,				\
+		       lr_sfx, sc_sfx, cas_sfx,				\
+		       z_lr_sfx, z_sc_sfx, z_cas_sfx,			\
 		       sc_prepend, sc_append,				\
-		       cas_prepend, cas_append,				\
-		       r, p, co, o, n)					\
+		       cas_prepend, cas_append, r, p, co, o, n)		\
 ({									\
 	if (IS_ENABLED(CONFIG_RISCV_ISA_ZACAS) &&			\
 	    IS_ENABLED(CONFIG_TOOLCHAIN_HAS_ZACAS) &&			\
@@ -201,7 +237,8 @@
 			cas_prepend					\
 			"	.option push\n"				\
 			"	.option arch, +zacas\n"			\
-			"	amocas" cas_sfx " %0, %z2, %1\n"	\
+			cas_alt("	amocas" cas_sfx " %0, %z2, %1\n",\
+				"	amocas" z_cas_sfx " %0, %z2, %1\n") \
 			"	.option pop\n"				\
 			cas_append					\
 			: "+&r" (r), "+A" (*(p))			\
@@ -212,9 +249,12 @@
 									\
 		__asm__ __volatile__ (					\
 			sc_prepend					\
-			"0:	lr" lr_sfx " %0, %2\n"			\
+			"0:\n"						\
+			lr_alt("	lr" lr_sfx " %0, %2\n",		\
+			       "	lr" z_lr_sfx " %0, %2\n")		\
 			"	bne  %0, %z3, 1f\n"			\
-			"	sc" sc_sfx " %1, %z4, %2\n"		\
+			sc_alt("	sc" sc_sfx " %1, %z4, %2\n",	\
+			       "	sc" z_sc_sfx " %1, %z4, %2\n")	\
 			"	bnez %1, 0b\n"				\
 			sc_append					\
 			"1:\n"						\
@@ -224,9 +264,10 @@
 	}								\
 })
 
-#define _arch_cmpxchg(ptr, old, new, sc_sfx, cas_sfx,			\
-		      sc_prepend, sc_append,				\
-		      cas_prepend, cas_append)				\
+#define _arch_cmpxchg(ptr, old, new, lr_alt, sc_alt, cas_alt,		\
+		      lr_sfx, sc_sfx, cas_sfx,				\
+		      z_lr_sfx, z_sc_sfx, z_cas_sfx,			\
+		      sc_prepend, sc_append, cas_prepend, cas_append)	\
 ({									\
 	__typeof__(ptr) __ptr = (ptr);					\
 	__typeof__(*(__ptr)) __old = (old);				\
@@ -235,25 +276,35 @@
 									\
 	switch (sizeof(*__ptr)) {					\
 	case 1:								\
-		__arch_cmpxchg_masked(sc_sfx, ".b" cas_sfx,		\
+		__arch_cmpxchg_masked(lr_alt, sc_alt, cas_alt,		\
+				      lr_sfx, sc_sfx, ".b" cas_sfx,	\
+				      z_lr_sfx, z_sc_sfx, ".b" z_cas_sfx,\
 				      sc_prepend, sc_append,		\
 				      cas_prepend, cas_append,		\
 				      __ret, __ptr, __old, __new);	\
 		break;							\
 	case 2:								\
-		__arch_cmpxchg_masked(sc_sfx, ".h" cas_sfx,		\
+		__arch_cmpxchg_masked(lr_alt, sc_alt, cas_alt,		\
+				      lr_sfx, sc_sfx, ".h" cas_sfx,	\
+				      z_lr_sfx, z_sc_sfx, ".h" z_cas_sfx,\
 				      sc_prepend, sc_append,		\
 				      cas_prepend, cas_append,		\
 				      __ret, __ptr, __old, __new);	\
 		break;							\
 	case 4:								\
-		__arch_cmpxchg(".w", ".w" sc_sfx, ".w" cas_sfx,		\
+		__arch_cmpxchg(lr_alt, sc_alt, cas_alt,			\
+			       ".w" lr_sfx, ".w" sc_sfx, ".w" cas_sfx,\
+			       ".w" z_lr_sfx, ".w" z_sc_sfx,		\
+			       ".w" z_cas_sfx,				\
 			       sc_prepend, sc_append,			\
 			       cas_prepend, cas_append,			\
 			       __ret, __ptr, (long)(int)(long), __old, __new);	\
 		break;							\
 	case 8:								\
-		__arch_cmpxchg(".d", ".d" sc_sfx, ".d" cas_sfx,		\
+		__arch_cmpxchg(lr_alt, sc_alt, cas_alt,			\
+			       ".d" lr_sfx, ".d" sc_sfx, ".d" cas_sfx,\
+			       ".d" z_lr_sfx, ".d" z_sc_sfx,		\
+			       ".d" z_cas_sfx,				\
 			       sc_prepend, sc_append,			\
 			       cas_prepend, cas_append,			\
 			       __ret, __ptr, /**/, __old, __new);	\
@@ -264,48 +315,39 @@
 	(__typeof__(*(__ptr)))__ret;					\
 })
 
-/*
- * These macros are here to improve the readability of the arch_cmpxchg_XXX()
- * macros.
- */
-#define SC_SFX(x)	x
-#define CAS_SFX(x)	x
-#define SC_PREPEND(x)	x
-#define SC_APPEND(x)	x
-#define CAS_PREPEND(x)	x
-#define CAS_APPEND(x)	x
-
 #define arch_cmpxchg_relaxed(ptr, o, n)					\
 	_arch_cmpxchg((ptr), (o), (n),					\
-		      SC_SFX(""), CAS_SFX(""),				\
-		      SC_PREPEND(""), SC_APPEND(""),			\
-		      CAS_PREPEND(""), CAS_APPEND(""))
+		      RISCV_SELECT_OLD, RISCV_SELECT_OLD, RISCV_SELECT_OLD,\
+		      "", "", "", "", "", "", "", "", "", "")
 
 #define arch_cmpxchg_acquire(ptr, o, n)					\
 	_arch_cmpxchg((ptr), (o), (n),					\
-		      SC_SFX(""), CAS_SFX(""),				\
-		      SC_PREPEND(""), SC_APPEND(			\
-			RISCV_ZALASR_SMP_ALTERNATIVE(			\
-				RISCV_ACQUIRE_BARRIER, RISCV_FULL_BARRIER)), \
-		      CAS_PREPEND(""), CAS_APPEND(			\
-			RISCV_ZALASR_SMP_ALTERNATIVE(			\
-				RISCV_ACQUIRE_BARRIER, RISCV_FULL_BARRIER)))
+		      RISCV_ZALASR_SMP_ALTERNATIVE, RISCV_SELECT_OLD,	\
+		      RISCV_ZALASR_SMP_ALTERNATIVE,			\
+		      "", "", "", ".aq", "", ".aq", "",		\
+		      RISCV_ZALASR_SMP_ALTERNATIVE(			\
+			RISCV_ACQUIRE_BARRIER, __nops(1)), "",		\
+		      RISCV_ZALASR_SMP_ALTERNATIVE(			\
+			RISCV_ACQUIRE_BARRIER, __nops(1)))
 
 #define arch_cmpxchg_release(ptr, o, n)					\
 	_arch_cmpxchg((ptr), (o), (n),					\
-		      SC_SFX(""), CAS_SFX(""),				\
-		      SC_PREPEND(RISCV_ZALASR_SMP_ALTERNATIVE(		\
-			RISCV_RELEASE_BARRIER, RISCV_FULL_BARRIER)),	\
-		      SC_APPEND(""),					\
-		      CAS_PREPEND(RISCV_ZALASR_SMP_ALTERNATIVE(	\
-			RISCV_RELEASE_BARRIER, RISCV_FULL_BARRIER)),	\
-		      CAS_APPEND(""))
+		      RISCV_SELECT_OLD, RISCV_ZALASR_SMP_ALTERNATIVE,	\
+		      RISCV_ZALASR_SMP_ALTERNATIVE,			\
+		      "", "", "", "", ".rl", ".rl",			\
+		      RISCV_ZALASR_SMP_ALTERNATIVE(			\
+			RISCV_RELEASE_BARRIER, __nops(1)), "",		\
+		      RISCV_ZALASR_SMP_ALTERNATIVE(			\
+			RISCV_RELEASE_BARRIER, __nops(1)), "")
 
 #define arch_cmpxchg(ptr, o, n)						\
 	_arch_cmpxchg((ptr), (o), (n),					\
-		      SC_SFX(".rl"), CAS_SFX(".aqrl"),			\
-		      SC_PREPEND(""), SC_APPEND(RISCV_FULL_BARRIER),	\
-		      CAS_PREPEND(""), CAS_APPEND(""))
+		      RISCV_ZALASR_SMP_ALTERNATIVE,			\
+		      RISCV_ZALASR_SMP_ALTERNATIVE,			\
+		      RISCV_SELECT_OLD,					\
+		      "", ".rl", ".aqrl", ".aq", ".aqrl", ".aqrl", "",\
+		      RISCV_ZALASR_SMP_ALTERNATIVE(			\
+			RISCV_FULL_BARRIER, __nops(1)), "", "")
 
 #define arch_cmpxchg_local(ptr, o, n)					\
 	arch_cmpxchg_relaxed((ptr), (o), (n))
-- 
2.39.5


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
