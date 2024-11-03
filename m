Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51BD8D11101
	for <linux-riscv@archiver.kernel.org>; Sun,  3 Nov 2024 14:59:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=w+0m1strbfPEtryxkI82JSxScycN69YCQOF6L8N2kAk=; b=1QTkW/3PD0VaEA
	mBfQ5iL4zSOx4S/XHraeeUKqX+OC+V62BGCxp3tG4ar6DPlkPB+7JR1lTBW/dw7/2MuU7a2q2EQEh
	4bJPs+E3eObbxdDRP8/CXu9+JIdwL1i7f//5lLC11xg7PLY7wlc2gasjPTGhFQ7K7JG2ej5SpZiLL
	BqLgdxW5pvm4Eq2v2gq43f4pSOoA17Mt0JN72718EvldvgRjJQMUr6TopU6437tr+/ED0a7OtfTqF
	9QfKrz69qiJOE3gOnFQ3iL2tX5Jg6fzkUu0H8ijkD3RNSoumh3W2fkvCiaYxVVJN/LKUzFnvogf7t
	s+tsDGm0fNeNqxzFHyjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t7c4L-0000000BaEk-38Uo;
	Sun, 03 Nov 2024 14:59:09 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t7c4J-0000000BaDx-03mJ
	for linux-riscv@lists.infradead.org;
	Sun, 03 Nov 2024 14:59:08 +0000
Received: by mail-wr1-x436.google.com with SMTP id ffacd0b85a97d-37d3ecad390so2674246f8f.1
        for <linux-riscv@lists.infradead.org>; Sun, 03 Nov 2024 06:59:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1730645945; x=1731250745; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2YMddV/TixlRcMkBqzVFy3RqDe67DeCntBmj39JunYc=;
        b=QlYGGIMtJxTdKyufCcgVoKEyDIEMWtf+WgK4eFsfY3m1Lde5HkY/++H0Ucw+3yhb2p
         +t3xd90kNg86wGV2aKSop0tUT7BLq6p3V+ya1CRfzjlLELl2Ew56ICfSnA4buEZ9FYPD
         jQxsaOFRv+3s4A0zt9HXM4zGUjxictLthuUCfv9jAKRRfxJbldcCMQSCbELhbHTpu/bp
         168aFzj2p6zLl+6s9uBSKkoJE5Bt6/kfG453yFFFY5Qn7nXU22yG08ITADen2A+Synz5
         3Rw7q7ZaTSlGMCaBl5+og7J8o1IsIbd3xm5yk/RIgxfpUTc8fJA6YYxFVkkvdAhSxES/
         whEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730645945; x=1731250745;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2YMddV/TixlRcMkBqzVFy3RqDe67DeCntBmj39JunYc=;
        b=OMQGxZCOeSvXBphavEUDiVQRQHUNTa170ssMHFkhrVo/RhZoqTlJZ1dNElP3SoJTnB
         UgLn0zF2RKVP5VpdR4+v6rSYXU5IzQNtZ/qEVlbyDMAMFoGV4wSM7Po/X+IrW5os4kF1
         mp5yE48Un2ww4cjEj/6RQYpy/j0tZe1X7Axv+2fDERJUgfGeMUvMvcS6RlmDbq1WXxdp
         OzykjNP5A7jqyadHquPf0zJ/7QJJ3kiVWqetyCn56SiW5+fxScHQDZxWzH6sfaAFcuZI
         MuLaEZk1aja80SgUiq18adQlDxuaA3obdxHQFnTOXMTFXwyAsvr55deRoPjY2lKw105R
         E9VQ==
X-Forwarded-Encrypted: i=1; AJvYcCXWbPEHf2RmMEfMTAjN8QU1ACgxftA2+I6iBAm2wdYlEwLOJLLwDyFC6TCHRM6uHuvwnSjpszgnZXD7cA==@lists.infradead.org
X-Gm-Message-State: AOJu0YwKDc9cs85Wxc/IkCe4vjs5e9eu2LlUXCShsKa261RIv7aCHuzM
	xlt+vfBjP3Ym6BrzlazIrI434l62QIdneuXdLfmwg739oHaxYo8dfBccNySZE9Y=
X-Google-Smtp-Source: AGHT+IEwAhzLmFndg4dtG6o7eex1DY00zUsKhGi9VFC31IF8dEpvf7rYFDq+11tOCJeycg1G7RqbUQ==
X-Received: by 2002:a5d:5a8c:0:b0:381:d133:d541 with SMTP id ffacd0b85a97d-381d133d9cdmr3234403f8f.11.1730645945038;
        Sun, 03 Nov 2024 06:59:05 -0800 (PST)
Received: from alex-rivos.ba.rivosinc.com (lfbn-lyo-1-472-36.w2-7.abo.wanadoo.fr. [2.7.62.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4327d6852d9sm126046165e9.37.2024.11.03.06.59.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 Nov 2024 06:59:04 -0800 (PST)
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
Subject: [PATCH v6 07/13] riscv: Implement arch_cmpxchg128() using Zacas
Date: Sun,  3 Nov 2024 15:51:47 +0100
Message-Id: <20241103145153.105097-8-alexghiti@rivosinc.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20241103145153.105097-1-alexghiti@rivosinc.com>
References: <20241103145153.105097-1-alexghiti@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241103_065907_060367_F3E066AC 
X-CRM114-Status: GOOD (  11.99  )
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
Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
---
 arch/riscv/Kconfig               |  1 +
 arch/riscv/include/asm/cmpxchg.h | 38 ++++++++++++++++++++++++++++++++
 2 files changed, 39 insertions(+)

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index 668be90a42e4..093ee6537331 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -115,6 +115,7 @@ config RISCV
 	select GENERIC_VDSO_TIME_NS if HAVE_GENERIC_VDSO
 	select HARDIRQS_SW_RESEND
 	select HAS_IOPORT if MMU
+	select HAVE_ALIGNED_STRUCT_PAGE
 	select HAVE_ARCH_AUDITSYSCALL
 	select HAVE_ARCH_HUGE_VMALLOC if HAVE_ARCH_HUGE_VMAP
 	select HAVE_ARCH_HUGE_VMAP if MMU && 64BIT
diff --git a/arch/riscv/include/asm/cmpxchg.h b/arch/riscv/include/asm/cmpxchg.h
index 052418aba11a..f95929f538b2 100644
--- a/arch/riscv/include/asm/cmpxchg.h
+++ b/arch/riscv/include/asm/cmpxchg.h
@@ -296,6 +296,44 @@
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
