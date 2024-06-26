Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6899C27C4F
	for <linux-riscv@archiver.kernel.org>; Wed, 26 Jun 2024 13:09:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0Ngcgbrwbihv+GVAmJF88iCyZVBxECAY15YUW3Je8Ug=; b=LXRz7NXnnZKZN7
	o6ZzJyPVPMcRv9lqrqtOtOe4m/x/UOSAKl0z/TPIFUdl/uH2YPmEmkNIp4SpguO0Aa+yWkq6zDSvC
	2/QRDYD7Mb0QGfMfkgKvgaCwpEQF5r55OTCmETOV1fhatbAWGUqorOlyg4n8XdyvINr4qIm6sPq02
	ZES5B+A0iSj9/gHrksWEoylZRfZj1uvKjN71ak4YiMG1fhAP4Nay4PCBxJUOrfbxkPmWERZSIDqy7
	wwERevNmZuLa4fDpg9DJTf6OVdpCYwErDr+Cq9vw6hi+9aUReQczt+8TpZnjCvSbSXtU8rSnWLcsu
	fRWxJXUngH2h45yRrFHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sMSOo-00000006sxI-32xw;
	Wed, 26 Jun 2024 13:09:24 +0000
Received: from mail-lj1-x230.google.com ([2a00:1450:4864:20::230])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sMSOR-00000006skU-3kba
	for linux-riscv@lists.infradead.org;
	Wed, 26 Jun 2024 13:09:02 +0000
Received: by mail-lj1-x230.google.com with SMTP id 38308e7fff4ca-2ec50a5e230so50126081fa.0
        for <linux-riscv@lists.infradead.org>; Wed, 26 Jun 2024 06:08:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1719407338; x=1720012138; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DAwsmjkuECiz/mPkaZn9ympydsm9zMlHdoAoEYhhRo8=;
        b=vFzOWgQRLVhB7VP7Oo0CkvMVdw5ZGeQ0WL7P7jLB5tXTnmr0ZyEhCEp9Y+18cY8Vf1
         7Yyk7eqEqC+toaDKKuZmrCYYJx869qnlInxjoIfDN8FuKoERRyCRhlGGBp/ash94fYd6
         BU0KdiobHbdpVpYnN2Z9jK6pZtn4X9JMeuQnOHswaGFXPOy0KUIFN655Vc6fPaPguqqF
         GpxzmINTiLS8Urtnbr1i4xVVZ61a5Fr/Pwj8jCNmKAAdv5x7TftvEAqzfMuiAF7edql2
         V6Rpqkn3+MEkJrBmflG3sLpESPRYxHioJRhjb3zaSAbDuAe9hRSznXegVPolodv70M0X
         4bCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719407338; x=1720012138;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DAwsmjkuECiz/mPkaZn9ympydsm9zMlHdoAoEYhhRo8=;
        b=BVHkFkoBdAB7RjaFZpLajV4apJSHxwObemCJNEO+kjWMChWuFHTl48RV4Tk+rH8py5
         toNTPk55N5LbE75iWSdHVUUk6FCj6JuAztXK1V8PEViyXBv8QQmSY7xhjxq/v9v2t/6+
         I7fGFkRydcl9xqw6s/KLMJBHXAdcPVBzHDK1ItZ7mbg5QXSP5i+89iXIUM+Dh/9LsNkt
         Va6aeDGRaj6tDhsVoISGKCcaaeH8nC+DgYxhrQbXYz8xm656RG7VU6TepLEh1bXq9Hhv
         DztLgxLFN8SxHl/gW5zWpNGCdUqrLadqdpr1yfHAXoDYdAhV2Hnuwz432LqWaCTPvS6a
         MZBA==
X-Forwarded-Encrypted: i=1; AJvYcCXOFmITLM1/TEunqpgdS18w7BalvP9fdk+6mtY/qwnKL8w/waem+96t16b0jBBfEGzyU1Nylzxq39SED7dRZO904o0qHUqdgMFe2utxzJEe
X-Gm-Message-State: AOJu0Ywpk2ymT5EmpolEbFSSNPsdbwzRkrARSywiH+ZL0Xj1QILiQW08
	PO/g7cwjK5Oz+8nnHcTxfOnBJN8mXWWIT96Wcrxm5qp02WrIjl1Y3a+5yJVEiWE=
X-Google-Smtp-Source: AGHT+IE6IYtOzpJIWWby5oBtItvoKm+O8WuyMECCoA3dQcwC4BqVw/peghmNdO01PLv674LqbGf4lw==
X-Received: by 2002:a05:6512:6ce:b0:52d:b1bb:370 with SMTP id 2adb3069b0e04-52db1bb0490mr1964462e87.23.1719407337732;
        Wed, 26 Jun 2024 06:08:57 -0700 (PDT)
Received: from localhost.localdomain (amontpellier-656-1-456-62.w92-145.abo.wanadoo.fr. [92.145.124.62])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-424c8266bd5sm25627705e9.26.2024.06.26.06.08.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Jun 2024 06:08:57 -0700 (PDT)
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
Cc: Alexandre Ghiti <alexghiti@rivosinc.com>
Subject: [PATCH v2 05/10] riscv: Implement arch_cmpxchg128() using Zacas
Date: Wed, 26 Jun 2024 15:03:42 +0200
Message-Id: <20240626130347.520750-6-alexghiti@rivosinc.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240626130347.520750-1-alexghiti@rivosinc.com>
References: <20240626130347.520750-1-alexghiti@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240626_060900_294635_54433A6D 
X-CRM114-Status: GOOD (  12.72  )
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
index 3c65b00a0d36..da42f32ea53d 100644
--- a/arch/riscv/include/asm/cmpxchg.h
+++ b/arch/riscv/include/asm/cmpxchg.h
@@ -280,4 +280,43 @@ end:;									\
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
