Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7AC49C27C4F
	for <linux-riscv@archiver.kernel.org>; Wed, 26 Jun 2024 13:08:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PAfz3aVxtqKfh7jjAE6HNaks7WIFZXxndzG3g1ZKraE=; b=H0PjCNSEig3sQ9
	wzziZKGU1fvu118QZAPUW5pYsDLy1RMvmq5OU5orJ5aN3ko8B/WI/GYKUorFQi7c5eJsT/9I22rDJ
	dmORvPPkIDFwOpKD0xBosfM8IXUzkMMAoPLJRNO33WqZXQQM3Mar7pf7qgajDsMvG9JoJk337APP5
	sr9kiauLHbEpHD/EjQKdmQmG6/IWZDvm/ucAP3OoY3aDvIiTyJNTLUQ/5evox+0B789K3wN2Y+bEb
	ZQ8UIx9RpPMgmzgUvqnQCKDBNuuckwEv3feaGWG00+zgVKUPo4chnEsQF1DwdKu9nioWIbL1yQPaW
	5Q3m6wY3DdA1v/hGKS0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sMSOB-00000006sa7-2uHK;
	Wed, 26 Jun 2024 13:08:43 +0000
Received: from mail-lj1-x229.google.com ([2a00:1450:4864:20::229])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sMSNS-00000006s9u-3La0
	for linux-riscv@lists.infradead.org;
	Wed, 26 Jun 2024 13:08:00 +0000
Received: by mail-lj1-x229.google.com with SMTP id 38308e7fff4ca-2ebe0a81dc8so88816481fa.2
        for <linux-riscv@lists.infradead.org>; Wed, 26 Jun 2024 06:07:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1719407276; x=1720012076; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6Y2lg3OgYzhfS3tcxdHdgy6tUi+qEwW8C3VWq7VXFkI=;
        b=Q3n/gBc6igU5gyBMlZCPjcTkUAyWe4Yx/oCgo13ia1y58alAdlYJjtjmLYHRq8L8dJ
         9P2uIwjdIY2fNfGz05PHxrbNPob2MhvoCKD8+iKI3P+eiHAgfpQLRCf0Yw3UkHu8tCZR
         fyZZoOnXyKe9fXCqYAuDEKm6mkTxK1Db+z9/7k2nd0LunLBDZlbZKx8UFb28IfuRP5fG
         +kTEF3G29k/0sMiV80Yco6wkXGeMZRi+3J3nq6GeIvUlKIoXgYk1d3kUSNqTrYPMakcl
         eOyxeyduftpiB/PIkWVk0Xru654j88tGkg3K70KhEMxn7XSzrDbCj698RtpqZvja+dK1
         fNpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719407276; x=1720012076;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6Y2lg3OgYzhfS3tcxdHdgy6tUi+qEwW8C3VWq7VXFkI=;
        b=tw4qp/mE6xi0JuKDEvLsYm7hUjXaNdghGWMEL44X2Q5zip795qEHd3iImpPrOC1cKP
         aS/dsXhbpIjJ/vIuXFVMDjTNJd/H96tysB21FsalmK7egOQJLNQN3lLNPAP3vU8GlqTw
         WvhWOe6SyBODmrhBRnB99fVDq2o8+FwPxvFq9ayuwnkBqRvzeO7DayY8C1GS9CYovTGs
         QXtdCS7qJqKc5e+F/+KXHW/WBKwXLtv9PBTeYoC/XDCT5Bf14KGytqm0oUtr/4DvZERt
         i/UIWbPMK9kdRfQPuU3IRexge5WQyCxuxZ1SjhGo+I+P6cX2CW0qq71iFTFj1vf5X0vm
         me6g==
X-Forwarded-Encrypted: i=1; AJvYcCXrROdVOEcUGhneLyxplBX0tfj7WHvZDz2EynhTWSzq9GVVucegpAwvg24X+hdRlESroYHhmSsslouCy2UFQyJHOeOkvjogqpQRV4tQJzxG
X-Gm-Message-State: AOJu0Yw2zz6u86hU54gUl1o3Y4r/rcJ7x7pJr3EdYwfQiomxV9KiBBjg
	uJwishDM1B+G/j8BWWJvFMEeBYDwOydsHKgGXdU2kZBvqHWOvJDTqiJAbl+xQSE=
X-Google-Smtp-Source: AGHT+IFibXerpu/bTQ8y3LbVZ+LSuPoGA9fjYKjk5jwlDwlIOb8M9rkEFeIslajkZZ7g7g2gAUfMJA==
X-Received: by 2002:a2e:720c:0:b0:2ec:4e79:b416 with SMTP id 38308e7fff4ca-2ec5b2fc299mr74660131fa.6.1719407276560;
        Wed, 26 Jun 2024 06:07:56 -0700 (PDT)
Received: from localhost.localdomain (amontpellier-656-1-456-62.w92-145.abo.wanadoo.fr. [92.145.124.62])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-424c838bef4sm24669765e9.46.2024.06.26.06.07.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Jun 2024 06:07:56 -0700 (PDT)
From: Alexandre Ghiti <alexghiti@rivosinc.com>
To: Jonathan Corbet <corbet@lwn.net>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
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
Subject: [PATCH v2 04/10] riscv: Improve amocas.X use in cmpxchg()
Date: Wed, 26 Jun 2024 15:03:41 +0200
Message-Id: <20240626130347.520750-5-alexghiti@rivosinc.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240626130347.520750-1-alexghiti@rivosinc.com>
References: <20240626130347.520750-1-alexghiti@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240626_060758_867735_9E8E2027 
X-CRM114-Status: UNSURE (   9.84  )
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

cmpxchg() uses amocas.X instructions from Zacas and Zabha but still uses
the LR/SC acquire/release semantics which require barriers.

Let's improve that by using proper amocas acquire/release semantics in
order to avoid any of those barriers.

Suggested-by: Andrea Parri <andrea@rivosinc.com>
Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
---
 arch/riscv/include/asm/cmpxchg.h | 60 ++++++++++++++++++--------------
 1 file changed, 33 insertions(+), 27 deletions(-)

diff --git a/arch/riscv/include/asm/cmpxchg.h b/arch/riscv/include/asm/cmpxchg.h
index b9a3fdcec919..3c65b00a0d36 100644
--- a/arch/riscv/include/asm/cmpxchg.h
+++ b/arch/riscv/include/asm/cmpxchg.h
@@ -105,7 +105,9 @@
  * indicated by comparing RETURN with OLD.
  */
 
-#define __arch_cmpxchg_masked(sc_sfx, cas_sfx, prepend, append, r, p, o, n)	\
+#define __arch_cmpxchg_masked(sc_sfx, cas_sfx,				\
+			      sc_prepend, sc_append,			\
+			      r, p, o, n)				\
 ({									\
 	__label__ no_zacas, zabha, end;					\
 									\
@@ -129,7 +131,7 @@ no_zacas:;								\
 	ulong __rc;							\
 									\
 	__asm__ __volatile__ (						\
-		prepend							\
+		sc_prepend							\
 		"0:	lr.w %0, %2\n"					\
 		"	and  %1, %0, %z5\n"				\
 		"	bne  %1, %z3, 1f\n"				\
@@ -137,7 +139,7 @@ no_zacas:;								\
 		"	or   %1, %1, %z4\n"				\
 		"	sc.w" sc_sfx " %1, %1, %2\n"			\
 		"	bnez %1, 0b\n"					\
-		append							\
+		sc_append							\
 		"1:\n"							\
 		: "=&r" (__retx), "=&r" (__rc), "+A" (*(__ptr32b))	\
 		: "rJ" ((long)__oldx), "rJ" (__newx),			\
@@ -150,9 +152,7 @@ no_zacas:;								\
 zabha:									\
 	if (IS_ENABLED(CONFIG_RISCV_ISA_ZABHA)) {			\
 		__asm__ __volatile__ (					\
-			prepend						\
 			"	amocas" cas_sfx " %0, %z2, %1\n"	\
-			append						\
 			: "+&r" (r), "+A" (*(p))			\
 			: "rJ" (n)					\
 			: "memory");					\
@@ -160,7 +160,9 @@ zabha:									\
 end:;									\
 })
 
-#define __arch_cmpxchg(lr_sfx, sc_cas_sfx, prepend, append, r, p, co, o, n)	\
+#define __arch_cmpxchg(lr_sfx, sc_sfx, cas_sfx,				\
+		       sc_prepend, sc_append,				\
+		       r, p, co, o, n)					\
 ({									\
 	__label__ zacas, end;						\
 	register unsigned int __rc;					\
@@ -172,12 +174,12 @@ end:;									\
 	}								\
 									\
 	__asm__ __volatile__ (						\
-		prepend							\
+		sc_prepend							\
 		"0:	lr" lr_sfx " %0, %2\n"				\
 		"	bne  %0, %z3, 1f\n"				\
-		"	sc" sc_cas_sfx " %1, %z4, %2\n"			\
+		"	sc" sc_sfx " %1, %z4, %2\n"			\
 		"	bnez %1, 0b\n"					\
-		append							\
+		sc_append							\
 		"1:\n"							\
 		: "=&r" (r), "=&r" (__rc), "+A" (*(p))			\
 		: "rJ" (co o), "rJ" (n)					\
@@ -187,9 +189,7 @@ end:;									\
 zacas:									\
 	if (IS_ENABLED(CONFIG_RISCV_ISA_ZACAS)) {			\
 		__asm__ __volatile__ (					\
-			prepend						\
-			"	amocas" sc_cas_sfx " %0, %z2, %1\n"	\
-			append						\
+			"	amocas" cas_sfx " %0, %z2, %1\n"	\
 			: "+&r" (r), "+A" (*(p))			\
 			: "rJ" (n)					\
 			: "memory");					\
@@ -197,7 +197,8 @@ zacas:									\
 end:;									\
 })
 
-#define _arch_cmpxchg(ptr, old, new, sc_sfx, prepend, append)		\
+#define _arch_cmpxchg(ptr, old, new, sc_sfx, cas_sfx,			\
+		      sc_prepend, sc_append)				\
 ({									\
 	__typeof__(ptr) __ptr = (ptr);					\
 	__typeof__(*(__ptr)) __old = (old);				\
@@ -206,22 +207,24 @@ end:;									\
 									\
 	switch (sizeof(*__ptr)) {					\
 	case 1:								\
-		__arch_cmpxchg_masked(sc_sfx, ".b" sc_sfx,		\
-					prepend, append,		\
-					__ret, __ptr, __old, __new);    \
+		__arch_cmpxchg_masked(sc_sfx, ".b" cas_sfx,		\
+				      sc_prepend, sc_append,		\
+				      __ret, __ptr, __old, __new);	\
 		break;							\
 	case 2:								\
-		__arch_cmpxchg_masked(sc_sfx, ".h" sc_sfx,		\
-					prepend, append,		\
-					__ret, __ptr, __old, __new);	\
+		__arch_cmpxchg_masked(sc_sfx, ".h" cas_sfx,		\
+				      sc_prepend, sc_append,		\
+				      __ret, __ptr, __old, __new);	\
 		break;							\
 	case 4:								\
-		__arch_cmpxchg(".w", ".w" sc_sfx, prepend, append,	\
-				__ret, __ptr, (long), __old, __new);	\
+		__arch_cmpxchg(".w", ".w" sc_sfx, ".w" cas_sfx,		\
+			       sc_prepend, sc_append,			\
+			       __ret, __ptr, (long), __old, __new);	\
 		break;							\
 	case 8:								\
-		__arch_cmpxchg(".d", ".d" sc_sfx, prepend, append,	\
-				__ret, __ptr, /**/, __old, __new);	\
+		__arch_cmpxchg(".d", ".d" sc_sfx, ".d" cas_sfx,		\
+			       sc_prepend, sc_append,			\
+			       __ret, __ptr, /**/, __old, __new);	\
 		break;							\
 	default:							\
 		BUILD_BUG();						\
@@ -230,16 +233,19 @@ end:;									\
 })
 
 #define arch_cmpxchg_relaxed(ptr, o, n)					\
-	_arch_cmpxchg((ptr), (o), (n), "", "", "")
+	_arch_cmpxchg((ptr), (o), (n), "", "", "", "")
 
 #define arch_cmpxchg_acquire(ptr, o, n)					\
-	_arch_cmpxchg((ptr), (o), (n), "", "", RISCV_ACQUIRE_BARRIER)
+	_arch_cmpxchg((ptr), (o), (n), "", ".aq",			\
+		      "", RISCV_ACQUIRE_BARRIER)
 
 #define arch_cmpxchg_release(ptr, o, n)					\
-	_arch_cmpxchg((ptr), (o), (n), "", RISCV_RELEASE_BARRIER, "")
+	_arch_cmpxchg((ptr), (o), (n), "", ".rl",			\
+		      RISCV_RELEASE_BARRIER, "")
 
 #define arch_cmpxchg(ptr, o, n)						\
-	_arch_cmpxchg((ptr), (o), (n), ".rl", "", "	fence rw, rw\n")
+	_arch_cmpxchg((ptr), (o), (n), ".rl", ".aqrl",			\
+		      "", RISCV_FULL_BARRIER)
 
 #define arch_cmpxchg_local(ptr, o, n)					\
 	arch_cmpxchg_relaxed((ptr), (o), (n))
-- 
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
