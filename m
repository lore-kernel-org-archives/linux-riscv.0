Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5AFEC3DA4B
	for <linux-riscv@archiver.kernel.org>; Wed, 17 Jul 2024 06:24:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wdGHoWbOdbpAipZ6GduZJ2FzK/ZPUL5J8i0IboyNMkQ=; b=h9lBT6Uk3cPiTE
	91EwacOlh3+Eb/FxJxbp9hbHiOQYQFeJ77vP19AvUcQtOPfp8ECmySxwsPbvzx6XFIKy6DXW7J1GZ
	GOhVS4bNKPpOrpmtwOJriPkmfBfaS7n7CkgJSD7AqReLvya/YTB78byjmkN4We6iiB1FURwUELfYG
	JNzboS5bLXPyG8+2+I/co4KLT0vbw7LWFQxPut6SsFV9hkMGGxpGV4xGPI3CGL8gijtb3OzfFO0dU
	BawqamOF+gQ0yaoyitB6ObBVrTYXY77H+tahlWzdaHJBgzwAkRp/5PTpoP7kbJTt+zZR1Dg4k66fL
	Ou3b7b1AxfckRWjEXWzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sTy5B-0000000Cok4-0fYP;
	Wed, 17 Jul 2024 06:24:09 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sTy58-0000000Coj9-1CEg
	for linux-riscv@lists.infradead.org;
	Wed, 17 Jul 2024 06:24:07 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-4266f535e82so43766675e9.1
        for <linux-riscv@lists.infradead.org>; Tue, 16 Jul 2024 23:24:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1721197445; x=1721802245; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ds1f3nvde/2kobU8ZNZg62T2Qi5mJIAm9dc1xPbfhas=;
        b=aDHZn1wxHmG4ZZ1lr6mk0I/dNuDuRdAbDSJHHn0K+fnw6tMwlEzEx8HbQrvQWRrcVN
         jc+AtkHOknXc6HqOzKGtpdlp9rLqq1jYLnRoMYOWIugny6E0NIjUEM0wdnIIHbHViGSj
         sDPNBYYY39dqOwn+8hlcV/Kaa8gbi4z3rJf7J1XKh3gFmGx4/4eyyint4/V+zcZ9tO/5
         totgjxbSae7D88AQKSg04A+tcuzwam+MKFS4t/on79QAsSjjGPEf8Wva/wdaXDykliZf
         tHqrS/I/kwneZDrQ61N/fWGJ+o4XmF05OfYaLx+lVIZ/t4FLF46rzHlDYT1oJ8Df96Al
         eANQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721197445; x=1721802245;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ds1f3nvde/2kobU8ZNZg62T2Qi5mJIAm9dc1xPbfhas=;
        b=JU/PciT/I2HoXXcbnawPai1Nkm5zCAPa8XKNMlzvYimQTpR4it16Ai/Rd0+g9x5GRT
         +JY2A703P6QLJ2+nSpcGXFQE9HjkPmd6u65fdEt8v1R5fkcMFJFjB4GuN61R2t2UL3dD
         KcbT00ML4+Ivb8M1DjVE5GPmPM1Db724p/RkrstqsZ8o+60K0zqQ9dlCaKy26C52M6/r
         sboCXvwxSOK7iT4tekecjoyCIy1MEmBcscFX0QmpJ205pcRRUbQBsZdqbRSccBLu+VDh
         wCTqLas4X1ZOgEFwgsInnzzQN5MBk9kNwqQV2IretjwpNfRIqsp9icdbrXsgwK9RxZwv
         PmYA==
X-Forwarded-Encrypted: i=1; AJvYcCW3jDopXNpFM/CWtEETIZgwQueKmUfAaL1715Imb5yiWgNj1Bu0hXkAsbT/DS/4CYDjVUnrhgRde1TA9xcsa1TU9oiLC+y2bVk+wp3UPWQb
X-Gm-Message-State: AOJu0YxD1abY9m6Vu5Ra4f1FZiTlnZJqR12SrLCgZqSgrzjO3k0Kw99e
	QtN5bmSi2AAamOwY27+/6XpCVxCPcrR7f/O6oRbkOjHz9iecIoolcyz1jsZJuEM=
X-Google-Smtp-Source: AGHT+IEIXpdS+STkowwy/Wm5vUbJoSbRCAM24AYCj9d6c8yOJneivGu6HLD2duOFWquiyMpaznkmeg==
X-Received: by 2002:a5d:6b8d:0:b0:368:75:26e5 with SMTP id ffacd0b85a97d-368316003e7mr683121f8f.1.1721197444910;
        Tue, 16 Jul 2024 23:24:04 -0700 (PDT)
Received: from alex-rivos.home (amontpellier-656-1-456-62.w92-145.abo.wanadoo.fr. [92.145.124.62])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3680dafba03sm10826606f8f.76.2024.07.16.23.24.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jul 2024 23:24:04 -0700 (PDT)
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
Cc: Alexandre Ghiti <alexghiti@rivosinc.com>,
	Andrea Parri <andrea@rivosinc.com>
Subject: [PATCH v3 04/11] riscv: Improve zacas fully-ordered cmpxchg()
Date: Wed, 17 Jul 2024 08:19:50 +0200
Message-Id: <20240717061957.140712-5-alexghiti@rivosinc.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240717061957.140712-1-alexghiti@rivosinc.com>
References: <20240717061957.140712-1-alexghiti@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240716_232406_368204_BE223C07 
X-CRM114-Status: UNSURE (   9.34  )
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

The current fully-ordered cmpxchgXX() implementation results in:

  amocas.X.rl     a5,a4,(s1)
  fence           rw,rw

This provides enough sync but we can actually use the following better
mapping instead:

  amocas.X.aqrl   a5,a4,(s1)

Suggested-by: Andrea Parri <andrea@rivosinc.com>
Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
---
 arch/riscv/include/asm/cmpxchg.h | 71 ++++++++++++++++++++------------
 1 file changed, 44 insertions(+), 27 deletions(-)

diff --git a/arch/riscv/include/asm/cmpxchg.h b/arch/riscv/include/asm/cmpxchg.h
index c86722a101d0..97b24da38897 100644
--- a/arch/riscv/include/asm/cmpxchg.h
+++ b/arch/riscv/include/asm/cmpxchg.h
@@ -105,7 +105,10 @@
  * indicated by comparing RETURN with OLD.
  */
 
-#define __arch_cmpxchg_masked(sc_sfx, cas_sfx, prepend, append, r, p, o, n)	\
+#define __arch_cmpxchg_masked(sc_sfx, cas_sfx,				\
+			      sc_prepend, sc_append,			\
+			      cas_prepend, cas_append,			\
+			      r, p, o, n)				\
 ({									\
 	__label__ no_zabha_zacas, end;					\
 									\
@@ -119,9 +122,9 @@
 			 : : : : no_zabha_zacas);			\
 									\
 		__asm__ __volatile__ (					\
-			prepend						\
+			cas_prepend					\
 			"	amocas" cas_sfx " %0, %z2, %1\n"	\
-			append						\
+			cas_append					\
 			: "+&r" (r), "+A" (*(p))			\
 			: "rJ" (n)					\
 			: "memory");					\
@@ -139,7 +142,7 @@ no_zabha_zacas:;							\
 	ulong __rc;							\
 									\
 	__asm__ __volatile__ (						\
-		prepend							\
+		sc_prepend						\
 		"0:	lr.w %0, %2\n"					\
 		"	and  %1, %0, %z5\n"				\
 		"	bne  %1, %z3, 1f\n"				\
@@ -147,7 +150,7 @@ no_zabha_zacas:;							\
 		"	or   %1, %1, %z4\n"				\
 		"	sc.w" sc_sfx " %1, %1, %2\n"			\
 		"	bnez %1, 0b\n"					\
-		append							\
+		sc_append						\
 		"1:\n"							\
 		: "=&r" (__retx), "=&r" (__rc), "+A" (*(__ptr32b))	\
 		: "rJ" ((long)__oldx), "rJ" (__newx),			\
@@ -159,7 +162,10 @@ no_zabha_zacas:;							\
 end:;									\
 })
 
-#define __arch_cmpxchg(lr_sfx, sc_cas_sfx, prepend, append, r, p, co, o, n)	\
+#define __arch_cmpxchg(lr_sfx, sc_sfx, cas_sfx,				\
+		       sc_prepend, sc_append,				\
+		       cas_prepend, cas_append,				\
+		       r, p, co, o, n)					\
 ({									\
 	__label__ no_zacas, end;					\
 	register unsigned int __rc;					\
@@ -170,9 +176,9 @@ end:;									\
 			 : : : : no_zacas);				\
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
@@ -181,12 +187,12 @@ end:;									\
 									\
 no_zacas:								\
 	__asm__ __volatile__ (						\
-		prepend							\
+		sc_prepend						\
 		"0:	lr" lr_sfx " %0, %2\n"				\
 		"	bne  %0, %z3, 1f\n"				\
-		"	sc" sc_cas_sfx " %1, %z4, %2\n"			\
+		"	sc" sc_sfx " %1, %z4, %2\n"			\
 		"	bnez %1, 0b\n"					\
-		append							\
+		sc_append						\
 		"1:\n"							\
 		: "=&r" (r), "=&r" (__rc), "+A" (*(p))			\
 		: "rJ" (co o), "rJ" (n)					\
@@ -195,7 +201,9 @@ no_zacas:								\
 end:;									\
 })
 
-#define _arch_cmpxchg(ptr, old, new, sc_sfx, prepend, append)		\
+#define _arch_cmpxchg(ptr, old, new, sc_sfx, cas_sfx,			\
+		      sc_prepend, sc_append,				\
+		      cas_prepend, cas_append)				\
 ({									\
 	__typeof__(ptr) __ptr = (ptr);					\
 	__typeof__(*(__ptr)) __old = (old);				\
@@ -204,22 +212,28 @@ end:;									\
 									\
 	switch (sizeof(*__ptr)) {					\
 	case 1:								\
-		__arch_cmpxchg_masked(sc_sfx, ".b" sc_sfx,		\
-					prepend, append,		\
-					__ret, __ptr, __old, __new);    \
+		__arch_cmpxchg_masked(sc_sfx, ".b" cas_sfx,		\
+				      sc_prepend, sc_append,		\
+				      cas_prepend, cas_append,		\
+				      __ret, __ptr, __old, __new);	\
 		break;							\
 	case 2:								\
-		__arch_cmpxchg_masked(sc_sfx, ".h" sc_sfx,		\
-					prepend, append,		\
-					__ret, __ptr, __old, __new);	\
+		__arch_cmpxchg_masked(sc_sfx, ".h" cas_sfx,		\
+				      sc_prepend, sc_append,		\
+				      cas_prepend, cas_append,		\
+				      __ret, __ptr, __old, __new);	\
 		break;							\
 	case 4:								\
-		__arch_cmpxchg(".w", ".w" sc_sfx, prepend, append,	\
-				__ret, __ptr, (long), __old, __new);	\
+		__arch_cmpxchg(".w", ".w" sc_sfx, ".w" cas_sfx,		\
+			       sc_prepend, sc_append,			\
+			       cas_prepend, cas_append,			\
+			       __ret, __ptr, (long), __old, __new);	\
 		break;							\
 	case 8:								\
-		__arch_cmpxchg(".d", ".d" sc_sfx, prepend, append,	\
-				__ret, __ptr, /**/, __old, __new);	\
+		__arch_cmpxchg(".d", ".d" sc_sfx, ".d" cas_sfx,		\
+			       sc_prepend, sc_append,			\
+			       cas_prepend, cas_append,			\
+			       __ret, __ptr, /**/, __old, __new);	\
 		break;							\
 	default:							\
 		BUILD_BUG();						\
@@ -228,16 +242,19 @@ end:;									\
 })
 
 #define arch_cmpxchg_relaxed(ptr, o, n)					\
-	_arch_cmpxchg((ptr), (o), (n), "", "", "")
+	_arch_cmpxchg((ptr), (o), (n), "", "", "", "", "", "")
 
 #define arch_cmpxchg_acquire(ptr, o, n)					\
-	_arch_cmpxchg((ptr), (o), (n), "", "", RISCV_ACQUIRE_BARRIER)
+	_arch_cmpxchg((ptr), (o), (n), "", "",				\
+		      "", RISCV_ACQUIRE_BARRIER, "", RISCV_ACQUIRE_BARRIER)
 
 #define arch_cmpxchg_release(ptr, o, n)					\
-	_arch_cmpxchg((ptr), (o), (n), "", RISCV_RELEASE_BARRIER, "")
+	_arch_cmpxchg((ptr), (o), (n), "", "",				\
+		      RISCV_RELEASE_BARRIER, "", RISCV_RELEASE_BARRIER, "")
 
 #define arch_cmpxchg(ptr, o, n)						\
-	_arch_cmpxchg((ptr), (o), (n), ".rl", "", "	fence rw, rw\n")
+	_arch_cmpxchg((ptr), (o), (n), ".rl", ".aqrl",			\
+		      "", RISCV_FULL_BARRIER, "", "")
 
 #define arch_cmpxchg_local(ptr, o, n)					\
 	arch_cmpxchg_relaxed((ptr), (o), (n))
-- 
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
