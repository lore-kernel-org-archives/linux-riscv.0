Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2862C25B78
	for <linux-riscv@archiver.kernel.org>; Tue, 28 May 2024 15:14:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eUP2sTYMyE91+sojr27ubykRvkdmgsuKgQSrr30LHfc=; b=EEpUWT/+z5ppWv
	y8GIrl57WCFWY7kiCn7pWnNbZVOFVB2flbRb+X4r5CbTowfDRLO9XqtrIf72PNNEZFy9AiA39uHEr
	JZveUHLfWuZunTNs8WZACV40IP9m2bemST6RYRnrsp8SHYWoXvBTEXUibeN4oyIPKgMPQTe626Rj+
	F3waoK5a10QEQLN0EC3pRgLK0Cwj/T3wdXuKI6OaekzqPm0s6H3gB/Ol8bgEHOG51V+q4Pt3hi0Ne
	FwYnvJvXbx3r6VvJ19f8cOqoUVAhg/88KjFBmI7nWUUUQ5HuIc1JQbpcDoFvsR092Iq9hQGV+2i7F
	i/9PeLv1sOc6mS/YSG7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sByWY-00000001BAt-3pQi;
	Tue, 28 May 2024 15:14:02 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sByWW-00000001B9h-46SC
	for linux-riscv@lists.infradead.org;
	Tue, 28 May 2024 15:14:02 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-4210aa012e5so8313165e9.0
        for <linux-riscv@lists.infradead.org>; Tue, 28 May 2024 08:13:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1716909238; x=1717514038; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8+QNuMhUn/mhPs/6E1/sFkjL9Li5Z0ATbah2dvUIKDM=;
        b=stsX1EmL78jQ5Z5Y2PxUgeKPh3auMCKPVqsnLmeqg1SjDYYL3NG9WwLRzZ8TutdlmC
         pGQu3Nkt/iDOpjGHc7IjBbE4U+E6QyjJoHlupdvw3oZWdF6FPYoGVfALQD8gMYtQqfpO
         W79wL4PLkghIKE+3ecA4ufukN+e4LtEjxCy0nu6XaV+c8Qj7adRxEY2FIZDZFdpqoBvJ
         EKrjlYj8nWA1jomH1i/TyepS3Jqbf6BPXfEjO5GNY6SuxuL7Ba7YdVhHfIBFvFOjcNZx
         DejUCm9FWSnRMi6zUnJmyw6TVzLMkvVIezs/LzsMyDekBgHA7exRi363365CAFtI4XI2
         3QtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716909238; x=1717514038;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8+QNuMhUn/mhPs/6E1/sFkjL9Li5Z0ATbah2dvUIKDM=;
        b=YKEa97YVub41YomKZ+I98OgjIvhUp5IYsuL8/L5cbCuLEyANefl62CTuvOWsAcXdQm
         eqABr06cO4j5UmHZuxHB0giX9or+SeD5I56p7gae/4/Hp0AFXRGe3GYrPf4a0xkMjAWI
         rD3iDUp+Qom2HOCvGMxrHo8ClImDn7bXXxQcnEGfz7ZOS9Yq3xqk/SRnRVWkrWScKJoc
         udTr8/miIOKtpbQzHr3wodATHEGjSt4lC085Zm2LjYd8nvv+dM3a9Qkw131L1I4IC7QL
         91v534FpgZJt4OYtH/0t04Xl7IhoVk5zLHzsGo1NlWixXVSYs/oKLoE9STkgN8WvkltQ
         fe/w==
X-Forwarded-Encrypted: i=1; AJvYcCXmfS66YU7TaqQccpjAy/aAwBHQz0HirYMkszjpFdyMkOvmRG6mpOA5cqTaga9Ot+GzmrXrkE3ccjuvTyk4vlAuauG9HZpBZwwo+Bbujl4e
X-Gm-Message-State: AOJu0YzQBK/SqQyRABfRXa5SGA5TE3nOzeMPMnj9xPevhtDQK5ZOJDoy
	xPWkhYl4cmsZ3iBWvZKofh7ZjAs9c8OE0hFJc4IDgljWoK0xescD983NYXXEiE0=
X-Google-Smtp-Source: AGHT+IFax4v0kzQv5SDc3SAQTe47rQjW60kRd6Vmso4QAx01vZU4yzSYIPRZPjT4yaPXSVHdqYbyVw==
X-Received: by 2002:a5d:558d:0:b0:34d:74cb:c0be with SMTP id ffacd0b85a97d-35526c569cbmr8166449f8f.35.1716909238142;
        Tue, 28 May 2024 08:13:58 -0700 (PDT)
Received: from alex-rivos.home (amontpellier-656-1-456-62.w92-145.abo.wanadoo.fr. [92.145.124.62])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3557a0908e4sm12094483f8f.63.2024.05.28.08.13.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 May 2024 08:13:57 -0700 (PDT)
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
Subject: [PATCH 3/7] riscv: Implement arch_cmpxchg128() using Zacas
Date: Tue, 28 May 2024 17:10:48 +0200
Message-Id: <20240528151052.313031-4-alexghiti@rivosinc.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240528151052.313031-1-alexghiti@rivosinc.com>
References: <20240528151052.313031-1-alexghiti@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240528_081401_057249_0B9843BF 
X-CRM114-Status: GOOD (  12.64  )
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
 arch/riscv/include/asm/cmpxchg.h | 41 ++++++++++++++++++++++++++++++++
 2 files changed, 42 insertions(+)

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index 05597719bb1c..184a9edb04e0 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -101,6 +101,7 @@ config RISCV
 	select GENERIC_VDSO_TIME_NS if HAVE_GENERIC_VDSO
 	select HARDIRQS_SW_RESEND
 	select HAS_IOPORT if MMU
+	select HAVE_ALIGNED_STRUCT_PAGE
 	select HAVE_ARCH_AUDITSYSCALL
 	select HAVE_ARCH_HUGE_VMALLOC if HAVE_ARCH_HUGE_VMAP
 	select HAVE_ARCH_HUGE_VMAP if MMU && 64BIT && !XIP_KERNEL
diff --git a/arch/riscv/include/asm/cmpxchg.h b/arch/riscv/include/asm/cmpxchg.h
index 65de9771078e..0789fbe38b23 100644
--- a/arch/riscv/include/asm/cmpxchg.h
+++ b/arch/riscv/include/asm/cmpxchg.h
@@ -242,4 +242,45 @@ end:									\
 	arch_cmpxchg_relaxed((ptr), (o), (n));				\
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
+#define __arch_cmpxchg128(p, o, n, prepend, append)			\
+({									\
+	__typeof__(*(p)) __o = (o);					\
+	union __u128_halves new = { .full = (n) };			\
+	union __u128_halves old = { .full = (__o) };			\
+	register unsigned long x6 asm ("x6") = new.low;			\
+	register unsigned long x7 asm ("x7") = new.high;		\
+	register unsigned long x28 asm ("x28") = old.low;		\
+	register unsigned long x29 asm ("x29") = old.high;		\
+									\
+	__asm__ __volatile__ (						\
+		prepend							\
+		"	amocas.q %0, %z2, %1\n"				\
+		append							\
+		: "+&r" (x28), "+A" (*(p))				\
+		: "rJ" (x6)						\
+		: "memory");						\
+									\
+	__o;								\
+})
+
+#define arch_cmpxchg128(ptr, o, n)					\
+	__arch_cmpxchg128((ptr), (o), (n), "", "     fence rw, rw\n")
+
+#define arch_cmpxchg128_local(ptr, o, n)				\
+	__arch_cmpxchg128((ptr), (o), (n), "", "")
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
