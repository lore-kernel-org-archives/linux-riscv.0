Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77424C3DA64
	for <linux-riscv@archiver.kernel.org>; Wed, 31 Jul 2024 07:32:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+enbuZzYHKqIDiuxke7hDE7QvqaI/7rNH6LmiKTaprc=; b=fu6OjXJXLQ3SiI
	/YgUIjkFSuuyz5KnIFC2kT3i8I2cqRhLwGhUJLhH5Dj/AD2lLoHnkS8Ef9aprnGkeQb92yidhd/Kj
	/9DiFK5WT8lbBdmpJ9vnKHvm7/vL/e02y+TVIyeSViV9WYGCmfLS3qtH58ef5JF1t5jIpAyImVy7h
	thn/gosJ0VT2gTYxK7rvLOfWuU97wdHM960MAvfg6SWOOLn3oXrvmZYqc9jetVOTw9ZgR558w9leU
	UYbxIHqFGYH/IBB72vDtJTiBvg04M0MfKovfQFwyi4kITohZptCk4SQGm7v2BItrVAqa6soNEyTOs
	wmHU1pCMu4KMaFpcXTBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sZ3ov-0000000093i-3JSF;
	Wed, 31 Jul 2024 07:32:25 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sZ3ou-00000000936-3007
	for linux-riscv@bombadil.infradead.org;
	Wed, 31 Jul 2024 07:32:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=xze2cs107FZ3zEBdldNBuzUZPwt1bYMtkFI7VhzQeZI=; b=WCgBz6MBacfKChetuQMPIoPSYD
	zTYJdQcdyS+DcAQNwj88Gv9xNUsDy1gDdMVfwIAcdH8NtxO0ee5VgYP3X1q28ndw701WKfP6CtT6Y
	B7DLAN925sPIRrxLQQ5R3Q/4vktIFmWDatZfbIDADyOzUfNeEWVX2eMroU2EQnzP8rdxyPy3FH4rI
	/oB3MS3098dWQfdJPAuW7ue2V32rB2meP01l1cZPiM1pIWJZSawUn6zk75sekwfzbNSQzGoeF6G9E
	yhKwIwZUVALQOErbL3gRu7nbLcb0g6ZMp//rGPyZN2H8Pc6y1vMSK2X1AVY0xSy1rgJ2V2WeSdBhH
	f4kBH0bg==;
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sZ3or-00000005A5p-0bL5
	for linux-riscv@lists.infradead.org;
	Wed, 31 Jul 2024 07:32:23 +0000
Received: by mail-wr1-x42c.google.com with SMTP id ffacd0b85a97d-3685b3dbcdcso3021803f8f.3
        for <linux-riscv@lists.infradead.org>; Wed, 31 Jul 2024 00:32:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1722411138; x=1723015938; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xze2cs107FZ3zEBdldNBuzUZPwt1bYMtkFI7VhzQeZI=;
        b=FFfGU9JETNx+z8nfY60wgnVLhJUo+casCeCIW10pdmacbb1m86p+TxYyoddLdbB4G5
         tlxh3qa5JmHYqo0GMsrLb5XFYj9PwR0weYg//todxl8Nu996thJc4PwXSPM/ABS4e16Z
         CO4wpgF8eaVLBWYwaVEave0IlTBOsgrYav0X+CfSeS/eyZber2+XSIQnufPEaLJSBSwy
         0BqoDwOXkwTKwF3T1kqnAenrvF47uYOHlSEoqhUkr6igQeqvKNmp/RfMyJVbf+d3gjbv
         4g+U+cWbsunxiILnjaFQLIMTNB9Ng2wvyEx2KiaVdEE12LYxwD3ybbQu+mR5bWr1ZpR5
         Zd6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722411138; x=1723015938;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xze2cs107FZ3zEBdldNBuzUZPwt1bYMtkFI7VhzQeZI=;
        b=ak41vziyjqxrxi919V5fqGXwohS9VLQXdlsdWAtCwePVaK9hDenm24FrBUvb8PbCIf
         FYDjI55BIpWIOkNUJ6TMFxkS+bVMvnrsKJvzn8H5g09NBk9RnDOLKa3QzuMcV5WBhXBD
         WeTw8tJ5Fezft+hV9kHYdBTMtiN7vtKra9T+66sgQ+5T3DPqTFqyPJXa6oRnGS0IYTwf
         D6zoKj9RuAwJ/SNy5z/Y8ujOwhJX4ZXrlODulPODA29ubsxv8cM61gd3wRir3bTuVRkF
         dVsyggxPHWOJ7ToXsf3o4f1S6Mqeav3Dth11jwNWq7eBC2dXnbbf57/dxvGgz642omyr
         L60A==
X-Forwarded-Encrypted: i=1; AJvYcCXDWY/otvsTElIReqV+KZTxQM8IDSm/hUu1DZ+YDu7dK/dayppcjjGUudrjvltXlBb9S1SyMH6+MG6RNeYYkyn0TuoZxjLJrheaNjKjfRbb
X-Gm-Message-State: AOJu0Yx/RzCfJKCCARGG8DnppeXdj8oFRicZjjji0fcTFBXmG2g6gOiq
	AqvQniG9IJgFLKIkr4ZI6qE4JrFM6oaBmNCS/u4ePnNOfmr5GCMkFetqAxUH3Qo=
X-Google-Smtp-Source: AGHT+IHQ02v4jgJ0i8k8ZC9oEkha1vnkq1LaDLws9riLxBs06x93VaBTTty+hQP6mbP1ktT3LB3TnA==
X-Received: by 2002:adf:e707:0:b0:367:9088:fecc with SMTP id ffacd0b85a97d-36b5d0b04a6mr9601634f8f.7.1722411137984;
        Wed, 31 Jul 2024 00:32:17 -0700 (PDT)
Received: from alex-rivos.home (amontpellier-656-1-456-62.w92-145.abo.wanadoo.fr. [92.145.124.62])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-36b367c02casm16371948f8f.15.2024.07.31.00.32.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 Jul 2024 00:32:17 -0700 (PDT)
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
Cc: Alexandre Ghiti <alexghiti@rivosinc.com>
Subject: [PATCH v4 08/13] riscv: Implement xchg8/16() using Zabha
Date: Wed, 31 Jul 2024 09:24:00 +0200
Message-Id: <20240731072405.197046-9-alexghiti@rivosinc.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240731072405.197046-1-alexghiti@rivosinc.com>
References: <20240731072405.197046-1-alexghiti@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240731_083221_448243_2D87CB98 
X-CRM114-Status: GOOD (  10.61  )
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
 arch/riscv/include/asm/cmpxchg.h | 65 ++++++++++++++++++++------------
 1 file changed, 41 insertions(+), 24 deletions(-)

diff --git a/arch/riscv/include/asm/cmpxchg.h b/arch/riscv/include/asm/cmpxchg.h
index ce9613516bbb..7484f063809e 100644
--- a/arch/riscv/include/asm/cmpxchg.h
+++ b/arch/riscv/include/asm/cmpxchg.h
@@ -14,29 +14,41 @@
 #include <asm/insn-def.h>
 #include <asm/cpufeature-macros.h>
 
-#define __arch_xchg_masked(sc_sfx, prepend, append, r, p, n)		\
-({									\
-	u32 *__ptr32b = (u32 *)((ulong)(p) & ~0x3);			\
-	ulong __s = ((ulong)(p) & (0x4 - sizeof(*p))) * BITS_PER_BYTE;	\
-	ulong __mask = GENMASK(((sizeof(*p)) * BITS_PER_BYTE) - 1, 0)	\
-			<< __s;						\
-	ulong __newx = (ulong)(n) << __s;				\
-	ulong __retx;							\
-	ulong __rc;							\
-									\
-	__asm__ __volatile__ (						\
-	       prepend							\
-	       "0:	lr.w %0, %2\n"					\
-	       "	and  %1, %0, %z4\n"				\
-	       "	or   %1, %1, %z3\n"				\
-	       "	sc.w" sc_sfx " %1, %1, %2\n"			\
-	       "	bnez %1, 0b\n"					\
-	       append							\
-	       : "=&r" (__retx), "=&r" (__rc), "+A" (*(__ptr32b))	\
-	       : "rJ" (__newx), "rJ" (~__mask)				\
-	       : "memory");						\
-									\
-	r = (__typeof__(*(p)))((__retx & __mask) >> __s);		\
+#define __arch_xchg_masked(sc_sfx, swap_sfx, prepend, sc_append,		\
+			   swap_append, r, p, n)				\
+({										\
+	if (IS_ENABLED(CONFIG_RISCV_ISA_ZABHA) &&				\
+	    riscv_has_extension_unlikely(RISCV_ISA_EXT_ZABHA)) {		\
+		__asm__ __volatile__ (						\
+			prepend							\
+			"	amoswap" swap_sfx " %0, %z2, %1\n"		\
+			swap_append						\
+			: "=&r" (r), "+A" (*(p))				\
+			: "rJ" (n)						\
+			: "memory");						\
+	} else {								\
+		u32 *__ptr32b = (u32 *)((ulong)(p) & ~0x3);			\
+		ulong __s = ((ulong)(p) & (0x4 - sizeof(*p))) * BITS_PER_BYTE;	\
+		ulong __mask = GENMASK(((sizeof(*p)) * BITS_PER_BYTE) - 1, 0)	\
+				<< __s;						\
+		ulong __newx = (ulong)(n) << __s;				\
+		ulong __retx;							\
+		ulong __rc;							\
+										\
+		__asm__ __volatile__ (						\
+		       prepend							\
+		       "0:	lr.w %0, %2\n"					\
+		       "	and  %1, %0, %z4\n"				\
+		       "	or   %1, %1, %z3\n"				\
+		       "	sc.w" sc_sfx " %1, %1, %2\n"			\
+		       "	bnez %1, 0b\n"					\
+		       sc_append						\
+		       : "=&r" (__retx), "=&r" (__rc), "+A" (*(__ptr32b))	\
+		       : "rJ" (__newx), "rJ" (~__mask)				\
+		       : "memory");						\
+										\
+		r = (__typeof__(*(p)))((__retx & __mask) >> __s);		\
+	}									\
 })
 
 #define __arch_xchg(sfx, prepend, append, r, p, n)			\
@@ -59,8 +71,13 @@
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
