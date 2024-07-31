Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F42FC3DA7F
	for <linux-riscv@archiver.kernel.org>; Wed, 31 Jul 2024 07:31:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JCeSUs4HXSUCwtUXm7G1vMoQX/wcz1BqM0xQP69qu9A=; b=Iu4Xtj/RvMiRVi
	tH4M5tpL2oNkRNCzZYEAlmagtkztS0Si0f0u0XyHZDJXRTSziGTf/5OAouFh3UOpv92ZylkphLLlT
	ICTMcjI5zkeBr2VYBzIRU1PJNom++uR+rBb8r/nCtxyX3nfhZMn+uQyvmU49Pk15tzY6h2V/l2XNP
	JVAYRvl9XV/BViRIYIFXE1QwQsoJsu9rOWDiEJrlGf7Ze/Ag3QiTHqsW9D9gTAZD2e5c68hRG6Wlu
	AKaiR0fgAw/9covrLMuB6ZXo5mbFsnKPRAHnvU/a1Vj7Ekd8Upz15oQtci1WnkDnOKIFb2WgksPV4
	DAsQv16F8cR3NmMs7wAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sZ3nt-000000008q2-1UgP;
	Wed, 31 Jul 2024 07:31:21 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sZ3nq-000000008o5-2pvI
	for linux-riscv@lists.infradead.org;
	Wed, 31 Jul 2024 07:31:20 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-428163f7635so33109255e9.2
        for <linux-riscv@lists.infradead.org>; Wed, 31 Jul 2024 00:31:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1722411077; x=1723015877; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BHoHYllmH7EYuYJy+Jv8B241H4q5/CnBJ4HnToKFT0c=;
        b=R/QK68O61+nvVpCn3D/1OH+qS/KgSI3e2psV2xuvV31+m6GPbHFVroXay3lgHidjl8
         Ne1NmlEU4f6/EEiEznG7V47baf4+1uS8gbIadURI5pdoiEzG8MjHjsm4UzunOs09oBCC
         OrvQjSH25eJT4Zqo1EJMNS2lmBO44RkVFUVwLWbZkWZzOF6UB74Kv+bDJu0mElKwV6yX
         Rbyd/U3Oozdr9+ccila9LywGSOGNOVOqqVpRYNYhbgzNZJpPixxc0ld7SoghbeTBTfG5
         KMyt4/nmLuyqIAFsnheFBbiGcbhDgWYljCDMHTSprxK4bp8x6whe38kVCz+C52bXqYSb
         d9qA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722411077; x=1723015877;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BHoHYllmH7EYuYJy+Jv8B241H4q5/CnBJ4HnToKFT0c=;
        b=AHv7TKm7sTuKBH7nhWjOMDCcWiEMBb4yvVdOz8vZRkU4rtJbNTybjPJRKtbt15TmkP
         PYoQKqn3FBYDtoDhik+IOqCgGqkBzkoHu7kc4Z6ow09+SmTHJWIonMqeuTiDyfESUGDN
         c3T2JYrko3xH5pEjMJehAkc8QfnE6y7YevDp/QZYYmOfAwU5OFq0HxNqKinW5Ky/d6Br
         LKjAyKVQ9b0qi+KTaMlaDg+dVxlLESUwEr1ynf0AdV+nQRyFj+SkM5YUK/3NKs07scas
         hqz2rME8FYlAo9dYm2LuXgcGNgQ1uiFmVZS+2NWfuIdafPv9ejT1GrH70ku3UA5vIq94
         7b1A==
X-Forwarded-Encrypted: i=1; AJvYcCUDRuVPxKkdleNbbXzDVOklq7kKEf+dBgskFV61lp2/YudxIPH4kSMrUUhWd40Xmvu9vGcf7arJERg3y/HBVgdUsZnWMPfE4j3H7B4VchOm
X-Gm-Message-State: AOJu0YxSY7h0hsO8/xuP07nj7aFjaAx9FkEBzqCqoRE2QNz46bHFLETn
	l4WPr2yqq/Sg0xU48mqvzoYh/em+SlK2YYyomOQ9rN3AcosVmaVc3O+TLzXLrzM=
X-Google-Smtp-Source: AGHT+IFWKmJ8e4ndadH473CTdPU3AlRXobOboTCXTtcOkKGrZDLPp8Y0XiEkCzxGJJj4GbuZsEuDpQ==
X-Received: by 2002:a05:600c:4447:b0:426:5c34:b19b with SMTP id 5b1f17b1804b1-42811d9af49mr92305945e9.20.1722411076723;
        Wed, 31 Jul 2024 00:31:16 -0700 (PDT)
Received: from alex-rivos.home (amontpellier-656-1-456-62.w92-145.abo.wanadoo.fr. [92.145.124.62])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4282bac8069sm10520875e9.28.2024.07.31.00.31.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 Jul 2024 00:31:16 -0700 (PDT)
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
Subject: [PATCH v4 07/13] riscv: Implement arch_cmpxchg128() using Zacas
Date: Wed, 31 Jul 2024 09:23:59 +0200
Message-Id: <20240731072405.197046-8-alexghiti@rivosinc.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240731072405.197046-1-alexghiti@rivosinc.com>
References: <20240731072405.197046-1-alexghiti@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240731_003118_760320_3E2E5EAF 
X-CRM114-Status: GOOD (  12.93  )
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

Now that Zacas is supported in the kernel, let's use the double word
atomic version of amocas to improve the SLUB allocator.

Note that we have to select fixed registers, otherwise gcc fails to pick
even registers and then produces a reserved encoding which fails to
assemble.

Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
---
 arch/riscv/Kconfig               |  1 +
 arch/riscv/include/asm/cmpxchg.h | 38 ++++++++++++++++++++++++++++++++
 2 files changed, 39 insertions(+)

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index 212ec2aab389..ef55ab94027e 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -111,6 +111,7 @@ config RISCV
 	select GENERIC_VDSO_TIME_NS if HAVE_GENERIC_VDSO
 	select HARDIRQS_SW_RESEND
 	select HAS_IOPORT if MMU
+	select HAVE_ALIGNED_STRUCT_PAGE
 	select HAVE_ARCH_AUDITSYSCALL
 	select HAVE_ARCH_HUGE_VMALLOC if HAVE_ARCH_HUGE_VMAP
 	select HAVE_ARCH_HUGE_VMAP if MMU && 64BIT
diff --git a/arch/riscv/include/asm/cmpxchg.h b/arch/riscv/include/asm/cmpxchg.h
index 391730367213..ce9613516bbb 100644
--- a/arch/riscv/include/asm/cmpxchg.h
+++ b/arch/riscv/include/asm/cmpxchg.h
@@ -276,6 +276,44 @@
 	arch_cmpxchg_release((ptr), (o), (n));				\
 })
 
+#if defined(CONFIG_64BIT) && defined(CONFIG_RISCV_ISA_ZACAS)
+
+#define system_has_cmpxchg128()        riscv_has_extension_unlikely(RISCV_ISA_EXT_ZACAS)
+
+union __u128_halves {
+	u128 full;
+	struct {
+		u64 low, high;
+	};
+};
+
+#define __arch_cmpxchg128(p, o, n, cas_sfx)					\
+({										\
+	__typeof__(*(p)) __o = (o);                                             \
+	union __u128_halves __hn = { .full = (n) };				\
+	union __u128_halves __ho = { .full = (__o) };				\
+	register unsigned long t1 asm ("t1") = __hn.low;			\
+	register unsigned long t2 asm ("t2") = __hn.high;			\
+	register unsigned long t3 asm ("t3") = __ho.low;			\
+	register unsigned long t4 asm ("t4") = __ho.high;			\
+										\
+	__asm__ __volatile__ (							\
+		 "       amocas.q" cas_sfx " %0, %z3, %2"			\
+		 : "+&r" (t3), "+&r" (t4), "+A" (*(p))				\
+		 : "rJ" (t1), "rJ" (t2)						\
+		 : "memory");							\
+										\
+		 ((u128)t4 << 64) | t3;						\
+})
+
+#define arch_cmpxchg128(ptr, o, n)						\
+	__arch_cmpxchg128((ptr), (o), (n), ".aqrl")
+
+#define arch_cmpxchg128_local(ptr, o, n)					\
+	__arch_cmpxchg128((ptr), (o), (n), "")
+
+#endif /* CONFIG_64BIT && CONFIG_RISCV_ISA_ZACAS */
+
 #ifdef CONFIG_RISCV_ISA_ZAWRS
 /*
  * Despite wrs.nto being "WRS-with-no-timeout", in the absence of changes to
-- 
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
