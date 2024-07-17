Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7011EC3DA42
	for <linux-riscv@archiver.kernel.org>; Wed, 17 Jul 2024 06:25:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ku4pHck8jJLouOvh9r8oZFkUY177cKaoXv5snPHdt8M=; b=bArMkzK8cT6/d6
	VS0kyeUFKsHOs0TibvETcFsv9NJkhBCpnvQVMrs3bpH/3sjw07k2n50VSZqQvw/CEKt5cNa+D+Fww
	hMTjdOqI6gUr+qE2V8owLAIFWvIjWSw8YeNkPX0c1bkaDrEEcAF1Ae75OVt4DEcs52i3NCb9HpuZG
	ZDQu9j+2OoNxv2y70ViJZ3Bhvfghv5jUIbDkCTZ4Qo8PhchLG/hiYdYuLVIzGzvK/47HSrTwpcl0L
	G32ZhyPIXKkf2J0No1r0b3iVCGxBQ0LJ2d4zJ1dUcPO2Fm+MgPl/chcOAuKmbpQhCHfEv5hZ0pDBx
	HQGbylXkjABlFhWMtTAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sTy6A-0000000Cp2d-1Hvy;
	Wed, 17 Jul 2024 06:25:10 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sTy68-0000000Cp1Q-1E1D
	for linux-riscv@lists.infradead.org;
	Wed, 17 Jul 2024 06:25:09 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-4266f535e82so43773035e9.1
        for <linux-riscv@lists.infradead.org>; Tue, 16 Jul 2024 23:25:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1721197506; x=1721802306; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xQbGd0qu6ssbesu7Zjwn0myIi2A+oWSgEr0KZDNP1pQ=;
        b=oSYZUTuomlhUGJt9tE4CFLYtM5Y2+7vOdd3nodfBnbLXGD5RPZIQMZyTF9nzGpLeDN
         r7zncMrLfXap9cpp4RK4M7ZrD3zDOZiBqPDdHpH40igz3ruAfoUiQ73Uk2DMtDRuD/K/
         h++/Lih/hynyQGwY2NjxiRHwmZMP4YAZpnH7fkLLO3BRIIReW/HoP/I+JQBZ6VhQVS+M
         OyrgCM+kQfRenpAao9DSD6Tgj9WZ4CWPxGjn29yzhvt8CCJzCfxXWzIr02k+VTc3sC7Y
         FegiISgRH1oVLjyd7Y66A8dEGvn/NGUrfhHcWaXtaDYR16GZ1Khl+2UZdJgUqYwN3kVJ
         MpaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721197506; x=1721802306;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xQbGd0qu6ssbesu7Zjwn0myIi2A+oWSgEr0KZDNP1pQ=;
        b=jiDuDA1JG4saGb75wrrvuaS55v6mclzmgFVb+1kH+nBh3pTvlevd9mKzfb3WJN0sIw
         I6gvqPwxBNeDaOi3q8MRnyMDbAPeLpjdgE8O79lonQKKljm/uLKYneYm8ERwPrTaNkNt
         1uiNZkJNKSkNBrXRPcEk3s2Q+eyQBbCRK2HV8uFVidD5mH3MejcvWnwx+b9qjqCPIIjR
         SMnaV8JrVsOLXTLP/VxngOI4YjwUV/JSeyFkfIJ0K0T3UfQVfN6Rk0MMRxEVD4u9BFGv
         f5Se73iNX/tzPocPbGmUpFdAEaT8onwGsYgD1CFHSQbkSiKoo63xHot3fi7+6zhKyI7V
         7UsQ==
X-Forwarded-Encrypted: i=1; AJvYcCUgIOSTBGAqfQduVsr96RDJZ568cJsLah4KaZaH8YuHJQA88LIHQxmgkKrSoix3na1DRBLz4jSDDlrNQAoCQCuFTgqnEGqDL/aGnSRNwycJ
X-Gm-Message-State: AOJu0YzGiByLRBCPscFGjJVtjFFOyCA+9ioVv4F/cWKn6vaFmxbaTwP5
	FQScqAZ4EoqLVLNeiMmYnyt8Uz3psEB94gHJgW3wpYrhDF2yAeejZ4fOdZSHA0Q=
X-Google-Smtp-Source: AGHT+IEFDv6V5tFWhauDPHJiZCgq6FMlgRvbm1hC+8pd4MPLkSbI6qpbIzPF0VaZZ69mfVtEYemITg==
X-Received: by 2002:a05:600c:4eca:b0:426:549c:294c with SMTP id 5b1f17b1804b1-427c2d06e43mr5639015e9.35.1721197506505;
        Tue, 16 Jul 2024 23:25:06 -0700 (PDT)
Received: from alex-rivos.home (amontpellier-656-1-456-62.w92-145.abo.wanadoo.fr. [92.145.124.62])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-427a5ef4617sm155918965e9.41.2024.07.16.23.25.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jul 2024 23:25:06 -0700 (PDT)
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
Cc: Alexandre Ghiti <alexghiti@rivosinc.com>
Subject: [PATCH v3 05/11] riscv: Implement arch_cmpxchg128() using Zacas
Date: Wed, 17 Jul 2024 08:19:51 +0200
Message-Id: <20240717061957.140712-6-alexghiti@rivosinc.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240717061957.140712-1-alexghiti@rivosinc.com>
References: <20240717061957.140712-1-alexghiti@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240716_232508_338373_B0728429 
X-CRM114-Status: GOOD (  12.52  )
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
 arch/riscv/include/asm/cmpxchg.h | 39 ++++++++++++++++++++++++++++++++
 2 files changed, 40 insertions(+)

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index d3b0f92f92da..0bbaec0444d0 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -104,6 +104,7 @@ config RISCV
 	select GENERIC_VDSO_TIME_NS if HAVE_GENERIC_VDSO
 	select HARDIRQS_SW_RESEND
 	select HAS_IOPORT if MMU
+	select HAVE_ALIGNED_STRUCT_PAGE
 	select HAVE_ARCH_AUDITSYSCALL
 	select HAVE_ARCH_HUGE_VMALLOC if HAVE_ARCH_HUGE_VMAP
 	select HAVE_ARCH_HUGE_VMAP if MMU && 64BIT
diff --git a/arch/riscv/include/asm/cmpxchg.h b/arch/riscv/include/asm/cmpxchg.h
index 97b24da38897..608d98522557 100644
--- a/arch/riscv/include/asm/cmpxchg.h
+++ b/arch/riscv/include/asm/cmpxchg.h
@@ -289,4 +289,43 @@ end:;									\
 	arch_cmpxchg_release((ptr), (o), (n));				\
 })
 
+#ifdef CONFIG_RISCV_ISA_ZACAS
+
+#define system_has_cmpxchg128()						\
+			riscv_has_extension_unlikely(RISCV_ISA_EXT_ZACAS)
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
+	__typeof__(*(p)) __o = (o);						\
+	union __u128_halves __hn = { .full = (n) };				\
+	union __u128_halves __ho = { .full = (__o) };				\
+	register unsigned long x6 asm ("x6") = __hn.low;			\
+	register unsigned long x7 asm ("x7") = __hn.high;			\
+	register unsigned long x28 asm ("x28") = __ho.low;			\
+	register unsigned long x29 asm ("x29") = __ho.high;			\
+										\
+	__asm__ __volatile__ (							\
+		"	amocas.q" cas_sfx " %0, %z3, %2"			\
+		: "+&r" (x28), "+&r" (x29), "+A" (*(p))				\
+		: "rJ" (x6), "rJ" (x7)						\
+		: "memory");							\
+										\
+	((u128)x29 << 64) | x28;						\
+})
+
+#define arch_cmpxchg128(ptr, o, n)						\
+	__arch_cmpxchg128((ptr), (o), (n), ".aqrl")
+
+#define arch_cmpxchg128_local(ptr, o, n)					\
+	__arch_cmpxchg128((ptr), (o), (n), "")
+
+#endif /* CONFIG_RISCV_ISA_ZACAS */
+
 #endif /* _ASM_RISCV_CMPXCHG_H */
-- 
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
