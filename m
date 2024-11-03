Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 452D6D11101
	for <linux-riscv@archiver.kernel.org>; Sun,  3 Nov 2024 15:00:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tirAkl3dMM8AqneL1/oZOXYeSAPKsmU+6/bQ+/UiY8c=; b=GSVWEV5fMdJXv3
	uDr396SfDd+geMv/BSdX4FahUrESnXH5c+1YY/9Fmc5LFUgskZoxv/xGC2bmEFyADqo5zb4Kg3SL3
	qHM9H+LjvyavjeGkYTqcaa7qi3uSG/cj0O2/Klt10ywTuU/NEwPVvjmKXPh+TWgPyglBV1hXT3TEu
	qTafM2CO8ooPoxlH0Sw/Itxq+iRV8b59771LYdV0nPk6MQOlX7Bp/kU6DGqJ5ilqeO6UrWtmmtjXS
	zL+SUwsb1F2Z/fSwDL9AHArphTRiGLT8UlGB1IBwLdEKlMlQDTfBiHWjO7OqYQtnDnitXPY+NNYE0
	MHHRBRZC+DKWSbcDK/7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t7c5K-0000000BaQ6-3VnO;
	Sun, 03 Nov 2024 15:00:10 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t7c5H-0000000BaPC-499C
	for linux-riscv@lists.infradead.org;
	Sun, 03 Nov 2024 15:00:09 +0000
Received: by mail-wr1-x436.google.com with SMTP id ffacd0b85a97d-37ec4e349f4so2144579f8f.0
        for <linux-riscv@lists.infradead.org>; Sun, 03 Nov 2024 07:00:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1730646006; x=1731250806; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=C7omRwb2buD8uK45bQUSORyOPEIU9zvIfXDatLe8IP8=;
        b=zwn8cPbBWDQxQcDBagA+n9hHJ/Ns10N+V7Ay54I67IQpTadho3MEKUVtyEB0s6G/V8
         Am0o4USu1xlRPXl+2b93CNIHbqynIWKqzKkTN/6ZU65cBc8dgrvc//+9SLNglVW/5PYv
         LOVcLoW9o9H5Um8ACAZX4oVIiPKVkrv+g+ioF58/hlPz9zqgAIBu92QwMcGiICxt8T3r
         JRbFobqCF1G4cd0B/UYtnTz1/LFsbXdIw1GCWQvqp9L7HemLXA8PJq8+b5RSE7qLa+eY
         3/TJX6Ko9Ovy4y0EO37IuGjf6XmO6NattJNN6EJTwUa6kSGBL4W/plmrkqygESsfpx2j
         aVvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730646006; x=1731250806;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=C7omRwb2buD8uK45bQUSORyOPEIU9zvIfXDatLe8IP8=;
        b=w2Jja000hb0S7eg7j4+5JYU/k3EvxDDAOdt0nBeOYyZxD43D0wubvVT8Tdqrv+/YDD
         GOh2Ft+foaZdZT2gnJeZYp08jECPy477cT1ja6qCcv6hbFNEkNtP3Wzrpbmeuwz4ecST
         ir1CLTpaFpgzD0zLEO1vFtfUGv4c1Hq+yGCEWBc7bEvvGRIwoB+wJyCTo0uaPr4zNfRL
         nqT0HbJVYJLu9d3xDfmPF+ysY718aRg6KT3DDO30SPUXXM+JO5XYvW64zCLM9RJoZeVg
         numpdOWGnc6KGXpFRT276Sl7dnj6jql3IXjWWOu+5AwGI859xlWw/xjh+49W/d/1esni
         BT8w==
X-Forwarded-Encrypted: i=1; AJvYcCV23R14rI4MxqYKS/TP3daUzvgdKMM/s5qJjAV4RCyUKHFCCSdeFc4hpQAk0s3jyFDyimrbfdhrNc/gAA==@lists.infradead.org
X-Gm-Message-State: AOJu0YwNp7FcLws89w4JBcIUGJbPkOt+GFkfvnhDkAtXfyEVp7iPgO3o
	b/uRRubE91GakMjFLHQda0FZoAM6vgqs3R/3of3jepnCeFzOwI43n79A+aVK+V4=
X-Google-Smtp-Source: AGHT+IErbU6/+ESL9c7D4Rkx4JGXztbjh558spmD2njQc7VJwfVBMIIjkXAoMafrlIu7KWoRdehU9Q==
X-Received: by 2002:a05:6000:4029:b0:37e:d2b7:acd5 with SMTP id ffacd0b85a97d-381c7a476a8mr7741924f8f.8.1730646006376;
        Sun, 03 Nov 2024 07:00:06 -0800 (PST)
Received: from alex-rivos.ba.rivosinc.com (lfbn-lyo-1-472-36.w2-7.abo.wanadoo.fr. [2.7.62.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-381c10e7465sm10805300f8f.53.2024.11.03.07.00.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 Nov 2024 07:00:05 -0800 (PST)
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
	Andrew Jones <ajones@ventanamicro.com>
Subject: [PATCH v6 08/13] riscv: Implement xchg8/16() using Zabha
Date: Sun,  3 Nov 2024 15:51:48 +0100
Message-Id: <20241103145153.105097-9-alexghiti@rivosinc.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20241103145153.105097-1-alexghiti@rivosinc.com>
References: <20241103145153.105097-1-alexghiti@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241103_070008_057100_00C94FFA 
X-CRM114-Status: UNSURE (   9.73  )
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

This adds runtime support for Zabha in xchg8/16() operations.

Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
---
 arch/riscv/include/asm/cmpxchg.h | 65 ++++++++++++++++++++------------
 1 file changed, 41 insertions(+), 24 deletions(-)

diff --git a/arch/riscv/include/asm/cmpxchg.h b/arch/riscv/include/asm/cmpxchg.h
index f95929f538b2..4cadc56220fe 100644
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
