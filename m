Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91748C25B78
	for <linux-riscv@archiver.kernel.org>; Tue, 28 May 2024 15:15:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XaaSiKMkr0Nl4WeDVFqJzZP5EWKVIw4Y6evz3momZM4=; b=eOsVM9r6YVpZ/5
	VxCz1PzuFSPTlSZqBxkPlaWqVF/3p8eQdjerYo4osGjZgdPounZCJJk6w3yDsd67GuVdpVYOIDihK
	emo1kiJdAtEhfjcj8BXA0ekhni6Sx4ItEE81qe/5keikGVqC7czRdActMsiO4zqxpLNS+LiVj2IL/
	goMHw2ya3nCDl7WDCDw0jjf6/Ili36paoTU8ROO/G/gaM1f9AhYg+zH/V/QZMpL+iL9995HJOk9pB
	T6zoKK2oh9Oz54ilJc+07+v4+J37pGJBqI2zSVjame3b6uoyr4Vhvax/kjQ+XSyt78IA/akcXR+rJ
	s+n5KXeAJIm1MSt5PlFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sByXY-00000001BYe-1Ckj;
	Tue, 28 May 2024 15:15:04 +0000
Received: from mail-lj1-x22f.google.com ([2a00:1450:4864:20::22f])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sByXW-00000001BVp-1GY8
	for linux-riscv@lists.infradead.org;
	Tue, 28 May 2024 15:15:03 +0000
Received: by mail-lj1-x22f.google.com with SMTP id 38308e7fff4ca-2e724bc46c4so9776991fa.2
        for <linux-riscv@lists.infradead.org>; Tue, 28 May 2024 08:15:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1716909299; x=1717514099; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QJ9jfwQtVSCqEew5FGQUfrRX44QJ3TNBiU9EdF5jARo=;
        b=mwSZ8c9w47TArHpqEFpCquu/NZWJXHSzuh5XRv+Ag+DwQ0Yh7o1NxlLp/2/6OHFLjT
         NyZXOSAsQiNz9+gtxlzamW0QaRhWff1bZ9ozTmlSAJhkgC1+DF9dedS369Iy4q5oMvig
         jp5iYkIpJpuq00FVvYJTKj72igysTh2CYGvPLM+ETu+MH/+abg6X9OhFjuXD0tVZ6yKS
         qLmnyFex44mRSgpnSRmuLwneyTkzb5NYdeX3oeUeY357aItdzXXZm/BCRCTnx0sRXMki
         9hNQgB2HiIL1Ryp/TvrXSBZXHWiFupbkNw8mrM7t10oipChGD9+MLSW/wCLS2xzd1p8F
         KRFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716909299; x=1717514099;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QJ9jfwQtVSCqEew5FGQUfrRX44QJ3TNBiU9EdF5jARo=;
        b=sTbAgu5CRNHuP93aS+h8TDGpNc3jnvX2/Gc+V79Lw/YxLkZdnw2D+vmc4R3lButubh
         hr7pPpk/4Ih/swwwTItSytl7V3vwMn11eAXw3oubb7dzQ3J78XBOYaPi3mMFQW9r+NNK
         Dv3gOln4YsIA7LSJimOQ2FQKineg7DVf9djddRmZbvo1omcQUMlGOhZfJd07VYJb+kEC
         cLljFbVqHK0RdHe129j2SKOQFD7NzQG2x4HgD0e6jDQ5QOyHjH8YxoAMMH1pU12gOe09
         V03Gn3nmOcwlzR60BwoaIOPiA065GokWmZ8PsJXzZLoY558XToDM2LbuvDYBh5kmZTTa
         GtRg==
X-Forwarded-Encrypted: i=1; AJvYcCW+9rx8D0KE3de5hmwuqCCfQVaR2XfG1g5fzoWO3yOos5kK3KO0l5Tl59jURbOjOsfao+C6yUa6zYhG/CK/poZr8oEtpBZh3NkdVWWavPZv
X-Gm-Message-State: AOJu0YwsNBx0ZydcpWOHLVf+GxpTNTfKmpFkrkRODFO2PFWxJK8fSKZD
	CvIdu0x/E6XcnS3xkDw6+ZnU5qFKwcGFMA0qf9ys8XMkVoP7XEqHE6AqqYJZa1A=
X-Google-Smtp-Source: AGHT+IE9xnl9B6iLJUPGftImcREYfkzUqsxyaCtbYNOO7bdA0+3T64EEnX3IW7R8WIRTpy4sMb+IqA==
X-Received: by 2002:a2e:a7c3:0:b0:2e9:546c:544a with SMTP id 38308e7fff4ca-2e95b28ae5emr87639391fa.34.1716909299278;
        Tue, 28 May 2024 08:14:59 -0700 (PDT)
Received: from alex-rivos.home (amontpellier-656-1-456-62.w92-145.abo.wanadoo.fr. [92.145.124.62])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-421089708f8sm143918715e9.20.2024.05.28.08.14.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 May 2024 08:14:58 -0700 (PDT)
From: Alexandre Ghiti <alexghiti@rivosinc.com>
To: Jonathan Corbet <corbet@lwn.net>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
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
Cc: Alexandre Ghiti <alexghiti@rivosinc.com>
Subject: [PATCH 4/7] riscv: Implement xchg8/16() using Zabha
Date: Tue, 28 May 2024 17:10:49 +0200
Message-Id: <20240528151052.313031-5-alexghiti@rivosinc.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240528151052.313031-1-alexghiti@rivosinc.com>
References: <20240528151052.313031-1-alexghiti@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240528_081502_449032_8D1B6E3B 
X-CRM114-Status: GOOD (  12.11  )
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
 arch/riscv/include/asm/cmpxchg.h | 24 ++++++++++++++++++++++--
 arch/riscv/include/asm/hwcap.h   |  1 +
 arch/riscv/kernel/cpufeature.c   |  1 +
 3 files changed, 24 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/include/asm/cmpxchg.h b/arch/riscv/include/asm/cmpxchg.h
index 0789fbe38b23..43696d9e13aa 100644
--- a/arch/riscv/include/asm/cmpxchg.h
+++ b/arch/riscv/include/asm/cmpxchg.h
@@ -11,8 +11,14 @@
 #include <asm/fence.h>
 #include <asm/alternative.h>
 
-#define __arch_xchg_masked(prepend, append, r, p, n)			\
+#define __arch_xchg_masked(swap_sfx, prepend, append, r, p, n)		\
 ({									\
+	__label__ zabha, end;						\
+									\
+	asm goto(ALTERNATIVE("nop", "j %[zabha]", 0,			\
+			     RISCV_ISA_EXT_ZABHA, 1)			\
+			: : : : zabha);					\
+									\
 	u32 *__ptr32b = (u32 *)((ulong)(p) & ~0x3);			\
 	ulong __s = ((ulong)(p) & (0x4 - sizeof(*p))) * BITS_PER_BYTE;	\
 	ulong __mask = GENMASK(((sizeof(*p)) * BITS_PER_BYTE) - 1, 0)	\
@@ -34,6 +40,17 @@
 	       : "memory");						\
 									\
 	r = (__typeof__(*(p)))((__retx & __mask) >> __s);		\
+	goto end;							\
+									\
+zabha:									\
+	__asm__ __volatile__ (						\
+		prepend							\
+		"	amoswap" swap_sfx " %0, %z2, %1\n"		\
+		append							\
+		: "=&r" (r), "+A" (*(p))				\
+		: "rJ" (n)						\
+		: "memory");						\
+end:									\
 })
 
 #define __arch_xchg(sfx, prepend, append, r, p, n)			\
@@ -55,8 +72,11 @@
 									\
 	switch (sizeof(*__ptr)) {					\
 	case 1:								\
+		__arch_xchg_masked(".b" sfx, prepend, append,		\
+				   __ret, __ptr, __new);		\
+		break;							\
 	case 2:								\
-		__arch_xchg_masked(prepend, append,			\
+		__arch_xchg_masked(".h" sfx, prepend, append,		\
 				   __ret, __ptr, __new);		\
 		break;							\
 	case 4:								\
diff --git a/arch/riscv/include/asm/hwcap.h b/arch/riscv/include/asm/hwcap.h
index e17d0078a651..f71ddd2ca163 100644
--- a/arch/riscv/include/asm/hwcap.h
+++ b/arch/riscv/include/asm/hwcap.h
@@ -81,6 +81,7 @@
 #define RISCV_ISA_EXT_ZTSO		72
 #define RISCV_ISA_EXT_ZACAS		73
 #define RISCV_ISA_EXT_XANDESPMU		74
+#define RISCV_ISA_EXT_ZABHA		75
 
 #define RISCV_ISA_EXT_XLINUXENVCFG	127
 
diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
index 3ed2359eae35..8d0f56dd2f53 100644
--- a/arch/riscv/kernel/cpufeature.c
+++ b/arch/riscv/kernel/cpufeature.c
@@ -257,6 +257,7 @@ const struct riscv_isa_ext_data riscv_isa_ext[] = {
 	__RISCV_ISA_EXT_DATA(zihintpause, RISCV_ISA_EXT_ZIHINTPAUSE),
 	__RISCV_ISA_EXT_DATA(zihpm, RISCV_ISA_EXT_ZIHPM),
 	__RISCV_ISA_EXT_DATA(zacas, RISCV_ISA_EXT_ZACAS),
+	__RISCV_ISA_EXT_DATA(zabha, RISCV_ISA_EXT_ZABHA),
 	__RISCV_ISA_EXT_DATA(zfa, RISCV_ISA_EXT_ZFA),
 	__RISCV_ISA_EXT_DATA(zfh, RISCV_ISA_EXT_ZFH),
 	__RISCV_ISA_EXT_DATA(zfhmin, RISCV_ISA_EXT_ZFHMIN),
-- 
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
