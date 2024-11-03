Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13F79D11100
	for <linux-riscv@archiver.kernel.org>; Sun,  3 Nov 2024 14:58:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CZmva5+Tu9/zuslc+nFimYKC/KMc3X2MSufFIAOPpK4=; b=qWPe/gwbaCrbal
	GLO+3kMbRsjpDfSHlnUS1x0FHsE4/s8GHSHuJnrgcoPmXlbVgRPKN2nWLPJgBBq6jy6w6jtMMUhxy
	kByW698xjQqb1P6W4yi2MFVBDXJk17SJz2gaBZkwcI6hMYdkr6Dy31u5kMj+/MVQN/rKj6NKfXWUk
	fV8eMLAgY20MphNi5rUWL8KAWVrDID2PUFofad1LHO1kSpr/i6eLYNJXxNT5H/XWcPOeumhL9AcLF
	XcNFwKv9KYLLZdpLBUka2kM28hlOadO1TTTZj45v5oJ3Sf0tz7eIpHIVAPnDl/DY+LmpmiT4Zo/t3
	QRreRk4HHz66uhTu5F5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t7c3M-0000000Ba50-1LJn;
	Sun, 03 Nov 2024 14:58:08 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t7c3K-0000000Ba41-0DVv
	for linux-riscv@lists.infradead.org;
	Sun, 03 Nov 2024 14:58:07 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-4315baec69eso29042455e9.2
        for <linux-riscv@lists.infradead.org>; Sun, 03 Nov 2024 06:58:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1730645884; x=1731250684; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=N5AV+nOoC/tuklQRoqzKvrTd6uHJ4OaRW4xZaKd3wLE=;
        b=M8MJ/pv158C5ccGAoLsRPI0dQZ3FgNaLFutn8lyASRXfRcIZ0u2U/R2iH5skuPG1CP
         Ipe3oAiTDOTZotkXjuap7m0N+8umQrDjTDPCmnPmLSHSjFHMGswsZoqGb4Vok6EROEkj
         NN+pAJGhNUtuuhz9NWdi2esJa/A1g6xVsc7RC6MyQiZacgNrehMNBAoVetPMJ0yVO56M
         DKXzrdxEJKVEXhghHKrHiJKIbHHJsUqn3hvxx5G6tOTy1V2SLLKmj0Vyl/OOKJrWycMG
         VEFC7olUjRRMPDbvMpD3Yxg5Ne2HF0S9jyZo95OH4OLtf/YLEiZpFjvNbKxUCTFScG+7
         0BUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730645884; x=1731250684;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=N5AV+nOoC/tuklQRoqzKvrTd6uHJ4OaRW4xZaKd3wLE=;
        b=nC0mPlpE5P8twRdVNhHvJ+031CEZw3In5mBHTdxcCrNyQQEYq8Vvsub3tYcwRLnizC
         8Tk9IXfhhDggcPdu2cpr2y+LnbHpsg2mq04pfIK0DGTaWpHUgPq1iwJTy1ia8FCJQkv8
         qtdFoaKRMaODaPdmvd4kzWOj8G6uzrHtQbjAnvYHZsLr0kdfVMs8tnMWB6Bbs9/jJtgt
         aD1iMk1+C1qjVMCBVq1I1qVuwB2crzBLOe0lRDiZ4ZyONCyk2hX/LZfhWsEWUyB2B+/X
         mygrQUhHjjgCAk1sZJwwKW8sdQ1Pqap40QDu4i1I6IXWFw7gwFlC3AWFraWP5nsUnqoD
         gbFg==
X-Forwarded-Encrypted: i=1; AJvYcCWfHzygQpdY0Ax1Zz0lbubdJmy3PjpU8KQjjIG1daS+DIbfVIswC27PN9Ib3fQP+RnLsRdefjj3lzXA2A==@lists.infradead.org
X-Gm-Message-State: AOJu0YxGx4fnybDQc2LtHNfZY7e1WuuSoScLdG6NVjfm/aa2TkHu50fV
	wqHg1kI/9x/V4WmC096XBp+qYhf5+2qo/VucD03fjW23xzft9qchnYA2NWjWGxo=
X-Google-Smtp-Source: AGHT+IE55nBQ7rbTlkCqdHR3oJ0XymsMVwn2Z7Lo05//Ad0W+sZxb56nu4edxwe80UlQVGkf+GZkPg==
X-Received: by 2002:a05:600c:22d3:b0:432:7c08:d121 with SMTP id 5b1f17b1804b1-432849fa03amr81532075e9.12.1730645883736;
        Sun, 03 Nov 2024 06:58:03 -0800 (PST)
Received: from alex-rivos.ba.rivosinc.com (lfbn-lyo-1-472-36.w2-7.abo.wanadoo.fr. [2.7.62.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4327d5c65b8sm124358355e9.18.2024.11.03.06.58.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 Nov 2024 06:58:03 -0800 (PST)
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
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-arch@vger.kernel.org
Cc: Alexandre Ghiti <alexghiti@rivosinc.com>,
	Andrea Parri <andrea@rivosinc.com>,
	Andrew Jones <ajones@ventanamicro.com>
Subject: [PATCH v6 06/13] riscv: Improve zacas fully-ordered cmpxchg()
Date: Sun,  3 Nov 2024 15:51:46 +0100
Message-Id: <20241103145153.105097-7-alexghiti@rivosinc.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20241103145153.105097-1-alexghiti@rivosinc.com>
References: <20241103145153.105097-1-alexghiti@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241103_065806_235611_C74C9FB5 
X-CRM114-Status: GOOD (  11.12  )
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

The current fully-ordered cmpxchgXX() implementation results in:

  amocas.X.rl     a5,a4,(s1)
  fence           rw,rw

This provides enough sync but we can actually use the following better
mapping instead:

  amocas.X.aqrl   a5,a4,(s1)

Suggested-by: Andrea Parri <andrea@rivosinc.com>
Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
---
 arch/riscv/include/asm/cmpxchg.h | 92 ++++++++++++++++++++++----------
 1 file changed, 64 insertions(+), 28 deletions(-)

diff --git a/arch/riscv/include/asm/cmpxchg.h b/arch/riscv/include/asm/cmpxchg.h
index 1f4cd12e4664..052418aba11a 100644
--- a/arch/riscv/include/asm/cmpxchg.h
+++ b/arch/riscv/include/asm/cmpxchg.h
@@ -107,8 +107,10 @@
  * store NEW in MEM.  Return the initial value in MEM.  Success is
  * indicated by comparing RETURN with OLD.
  */
-
-#define __arch_cmpxchg_masked(sc_sfx, cas_sfx, prepend, append, r, p, o, n)	\
+#define __arch_cmpxchg_masked(sc_sfx, cas_sfx,					\
+			      sc_prepend, sc_append,				\
+			      cas_prepend, cas_append,				\
+			      r, p, o, n)					\
 ({										\
 	if (IS_ENABLED(CONFIG_RISCV_ISA_ZABHA) &&				\
 	    IS_ENABLED(CONFIG_RISCV_ISA_ZACAS) &&				\
@@ -117,9 +119,9 @@
 		r = o;								\
 										\
 		__asm__ __volatile__ (						\
-			prepend							\
+			cas_prepend							\
 			"	amocas" cas_sfx " %0, %z2, %1\n"		\
-			append							\
+			cas_append							\
 			: "+&r" (r), "+A" (*(p))				\
 			: "rJ" (n)						\
 			: "memory");						\
@@ -134,7 +136,7 @@
 		ulong __rc;							\
 										\
 		__asm__ __volatile__ (						\
-			prepend							\
+			sc_prepend							\
 			"0:	lr.w %0, %2\n"					\
 			"	and  %1, %0, %z5\n"				\
 			"	bne  %1, %z3, 1f\n"				\
@@ -142,7 +144,7 @@
 			"	or   %1, %1, %z4\n"				\
 			"	sc.w" sc_sfx " %1, %1, %2\n"			\
 			"	bnez %1, 0b\n"					\
-			append							\
+			sc_append							\
 			"1:\n"							\
 			: "=&r" (__retx), "=&r" (__rc), "+A" (*(__ptr32b))	\
 			: "rJ" ((long)__oldx), "rJ" (__newx),			\
@@ -153,16 +155,19 @@
 	}									\
 })
 
-#define __arch_cmpxchg(lr_sfx, sc_cas_sfx, prepend, append, r, p, co, o, n)	\
+#define __arch_cmpxchg(lr_sfx, sc_sfx, cas_sfx,				\
+		       sc_prepend, sc_append,				\
+		       cas_prepend, cas_append,				\
+		       r, p, co, o, n)					\
 ({									\
 	if (IS_ENABLED(CONFIG_RISCV_ISA_ZACAS) &&			\
 	    riscv_has_extension_unlikely(RISCV_ISA_EXT_ZACAS)) {	\
 		r = o;							\
 									\
 		__asm__ __volatile__ (					\
-			prepend						\
-			"	amocas" sc_cas_sfx " %0, %z2, %1\n"	\
-			append						\
+			cas_prepend					\
+			"	amocas" cas_sfx " %0, %z2, %1\n"	\
+			cas_append					\
 			: "+&r" (r), "+A" (*(p))			\
 			: "rJ" (n)					\
 			: "memory");					\
@@ -170,12 +175,12 @@
 		register unsigned int __rc;				\
 									\
 		__asm__ __volatile__ (					\
-			prepend						\
+			sc_prepend					\
 			"0:	lr" lr_sfx " %0, %2\n"			\
 			"	bne  %0, %z3, 1f\n"			\
-			"	sc" sc_cas_sfx " %1, %z4, %2\n"		\
+			"	sc" sc_sfx " %1, %z4, %2\n"		\
 			"	bnez %1, 0b\n"				\
-			append						\
+			sc_append					\
 			"1:\n"						\
 			: "=&r" (r), "=&r" (__rc), "+A" (*(p))		\
 			: "rJ" (co o), "rJ" (n)				\
@@ -183,7 +188,9 @@
 	}								\
 })
 
-#define _arch_cmpxchg(ptr, old, new, sc_cas_sfx, prepend, append)	\
+#define _arch_cmpxchg(ptr, old, new, sc_sfx, cas_sfx,			\
+		      sc_prepend, sc_append,				\
+		      cas_prepend, cas_append)				\
 ({									\
 	__typeof__(ptr) __ptr = (ptr);					\
 	__typeof__(*(__ptr)) __old = (old);				\
@@ -192,22 +199,28 @@
 									\
 	switch (sizeof(*__ptr)) {					\
 	case 1:								\
-		__arch_cmpxchg_masked(sc_cas_sfx, ".b" sc_cas_sfx,	\
-					prepend, append,		\
-					__ret, __ptr, __old, __new);    \
+		__arch_cmpxchg_masked(sc_sfx, ".b" cas_sfx,		\
+				      sc_prepend, sc_append,		\
+				      cas_prepend, cas_append,		\
+				      __ret, __ptr, __old, __new);	\
 		break;							\
 	case 2:								\
-		__arch_cmpxchg_masked(sc_cas_sfx, ".h" sc_cas_sfx,	\
-					prepend, append,		\
-					__ret, __ptr, __old, __new);	\
+		__arch_cmpxchg_masked(sc_sfx, ".h" cas_sfx,		\
+				      sc_prepend, sc_append,		\
+				      cas_prepend, cas_append,		\
+				      __ret, __ptr, __old, __new);	\
 		break;							\
 	case 4:								\
-		__arch_cmpxchg(".w", ".w" sc_cas_sfx, prepend, append,	\
-				__ret, __ptr, (long), __old, __new);	\
+		__arch_cmpxchg(".w", ".w" sc_sfx, ".w" cas_sfx,		\
+			       sc_prepend, sc_append,			\
+			       cas_prepend, cas_append,			\
+			       __ret, __ptr, (long), __old, __new);	\
 		break;							\
 	case 8:								\
-		__arch_cmpxchg(".d", ".d" sc_cas_sfx, prepend, append,	\
-				__ret, __ptr, /**/, __old, __new);	\
+		__arch_cmpxchg(".d", ".d" sc_sfx, ".d" cas_sfx,		\
+			       sc_prepend, sc_append,			\
+			       cas_prepend, cas_append,			\
+			       __ret, __ptr, /**/, __old, __new);	\
 		break;							\
 	default:							\
 		BUILD_BUG();						\
@@ -215,17 +228,40 @@
 	(__typeof__(*(__ptr)))__ret;					\
 })
 
+/*
+ * These macros are here to improve the readability of the arch_cmpxchg_XXX()
+ * macros.
+ */
+#define SC_SFX(x)	x
+#define CAS_SFX(x)	x
+#define SC_PREPEND(x)	x
+#define SC_APPEND(x)	x
+#define CAS_PREPEND(x)	x
+#define CAS_APPEND(x)	x
+
 #define arch_cmpxchg_relaxed(ptr, o, n)					\
-	_arch_cmpxchg((ptr), (o), (n), "", "", "")
+	_arch_cmpxchg((ptr), (o), (n),					\
+		      SC_SFX(""), CAS_SFX(""),				\
+		      SC_PREPEND(""), SC_APPEND(""),			\
+		      CAS_PREPEND(""), CAS_APPEND(""))
 
 #define arch_cmpxchg_acquire(ptr, o, n)					\
-	_arch_cmpxchg((ptr), (o), (n), "", "", RISCV_ACQUIRE_BARRIER)
+	_arch_cmpxchg((ptr), (o), (n),					\
+		      SC_SFX(""), CAS_SFX(""),				\
+		      SC_PREPEND(""), SC_APPEND(RISCV_ACQUIRE_BARRIER),	\
+		      CAS_PREPEND(""), CAS_APPEND(RISCV_ACQUIRE_BARRIER))
 
 #define arch_cmpxchg_release(ptr, o, n)					\
-	_arch_cmpxchg((ptr), (o), (n), "", RISCV_RELEASE_BARRIER, "")
+	_arch_cmpxchg((ptr), (o), (n),					\
+		      SC_SFX(""), CAS_SFX(""),				\
+		      SC_PREPEND(RISCV_RELEASE_BARRIER), SC_APPEND(""),	\
+		      CAS_PREPEND(RISCV_RELEASE_BARRIER), CAS_APPEND(""))
 
 #define arch_cmpxchg(ptr, o, n)						\
-	_arch_cmpxchg((ptr), (o), (n), ".rl", "", "	fence rw, rw\n")
+	_arch_cmpxchg((ptr), (o), (n),					\
+		      SC_SFX(".rl"), CAS_SFX(".aqrl"),			\
+		      SC_PREPEND(""), SC_APPEND(RISCV_FULL_BARRIER),	\
+		      CAS_PREPEND(""), CAS_APPEND(""))
 
 #define arch_cmpxchg_local(ptr, o, n)					\
 	arch_cmpxchg_relaxed((ptr), (o), (n))
-- 
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
