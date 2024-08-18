Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6A0FC52D7C
	for <linux-riscv@archiver.kernel.org>; Sun, 18 Aug 2024 06:42:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CWx+RHf/asleKfO7mdq7EfxxO/+gsxlvgGPRa50Ak0c=; b=ZV1n/0JdOjDGgS
	sw+RQ1Q2jgHwJWROvKrTV3XBHrKRRrl7E1diep/i34XGSNHiWEpwYodScJ5f1Q10nJy1/dwzDWst5
	RpjOMG8Xyi6oj9rmtUFIOZa/dfNhzZIPWK0F9B+8uHGZqXNQ7iFLDLTMrgBhpHH3ik2rQo8spyjZb
	xzaFEibwfN9ZvTAw8ywo1sTTL7mb5UF1ZqbHM/vwL9iZTSJl5W1YQuov1s8guuOiZq98Rstotc6QL
	+TMe6i1HtAVF+MmzIcSoY1SaYgf/+50rVudxqBNti/nHg7rq3+3mTsUwUrYIWJjXC4I1cz5pYxIIw
	ISrtOgOD3vy07N5lcDfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sfZcv-0000000GECR-0emb;
	Sun, 18 Aug 2024 06:42:57 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sfZcs-0000000GEBA-2Yo2
	for linux-riscv@lists.infradead.org;
	Sun, 18 Aug 2024 06:42:56 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-4280bca3960so27868325e9.3
        for <linux-riscv@lists.infradead.org>; Sat, 17 Aug 2024 23:42:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1723963372; x=1724568172; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=quUzKJl3l9W/iH7huB/Ox/rGh7MBHVzUurNoeTrSXJY=;
        b=HZWCtucWfP8IWa2UmUklPzmGf2dJdecT133+rLqimY3oybrnwHNUXSwvaL5qUoiUHO
         dMsx1fl0BJnvhrHdyH/+K8PtBePKW5In5nWLq66/LoLgJegqBHqR4U0zxgza8ZArRtwn
         ddi1tWe+Z9i3Cl/xpi+Msa+7FcJzZ32qEYhEQLL0/VSQ0WFtmCjlwfZXzi4dgMwoveOk
         YPB2/NAD+gWMxT0DBt35nFD69Xwe0QZ/d/BRS87opGOhe31ymbdiTKQnDcjcCVFZZQD1
         IAv7nYtbwIvk1XTusJEhT1G+yEKQ39+oft9l77rv4+X/s76nJHNFMLG63Hh7gNcH3hks
         62Hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723963372; x=1724568172;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=quUzKJl3l9W/iH7huB/Ox/rGh7MBHVzUurNoeTrSXJY=;
        b=UgM4MivHEbB+9MAmfufC+8wPAq+EGWZg6HU6OkaQlsJYxThRZtqlqd+oNkMfGaHCEH
         dimWZVMbmio3YEQoPwEuytBTxZOxGczYO79xZrWX8xLGlq3AQd6iGRCMH93Wh0fBZVUS
         KxtQ5RRPZmVXVZH0O/zlPUpM0GeRbF43SGBzBcxFHiC+llMmTN0x5RfoHllPFsiGMew7
         DPnZbIkM2U8xXRD2PEthUtcnvWa/HmnVDOCMA4JAIW/l+Kn2ZKx/YeWhxACbXSYzjPPC
         /VPZmuG/WAvntD2T1th8SblgMmCwagXv0Uz3JLc/bgv6jybd5cCapZ2GWHd23FvqAeHG
         xqhQ==
X-Forwarded-Encrypted: i=1; AJvYcCVD+ZNkRCcQfYYYSCpA1j8QEmheeFBDnSSI5uxgMfB/Di245uXHX75UlGR15DWr4+gpRwsyO7PzbG8Pcw6iR7XRPHz9nXCyhlNU/grUgyk9
X-Gm-Message-State: AOJu0YxCR56LSxLalOqSxMaYUaOw1EjHBikpY0fbCB+VigKxayBbeaqc
	2mcDdT2v9GOb6Ur9s7JRXoT+xMS4gC2mXi0sloYtiqW0/iOGjwS1pGecjAaai3Y=
X-Google-Smtp-Source: AGHT+IEe0ieY97eTK1clBc3HGi9QZxo6cf+OA5t5L0JQLmZOTEmF4/dAe6bc3mWD2TnCj1Dfw0jsiA==
X-Received: by 2002:a05:600c:3509:b0:426:6b92:387d with SMTP id 5b1f17b1804b1-429ed7b8860mr53677765e9.21.1723963372179;
        Sat, 17 Aug 2024 23:42:52 -0700 (PDT)
Received: from alex-rivos.guest.squarehotel.net ([130.93.157.50])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-429ed7945b8sm66605265e9.44.2024.08.17.23.42.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Aug 2024 23:42:51 -0700 (PDT)
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
Subject: [PATCH v5 07/13] riscv: Implement arch_cmpxchg128() using Zacas
Date: Sun, 18 Aug 2024 08:35:32 +0200
Message-Id: <20240818063538.6651-8-alexghiti@rivosinc.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240818063538.6651-1-alexghiti@rivosinc.com>
References: <20240818063538.6651-1-alexghiti@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240817_234254_680682_206ED3A1 
X-CRM114-Status: GOOD (  12.09  )
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
index 5b2f95f7f310..05ba8a8e2ef5 100644
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
