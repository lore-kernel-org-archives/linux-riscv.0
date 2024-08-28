Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3EAB3C5474F
	for <linux-riscv@archiver.kernel.org>; Wed, 28 Aug 2024 05:49:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Mtxdwlv9T5BAfncOB5KjtnKL1dH0rSxpwHZ5LiMXKzs=; b=RSmw65BLlVSd3D
	1wSZtOgpitDnqAJZAjdCdzPUOehmXif/VzrbwYAl7PmswzZM4RKAt8JW6oF4LvbeKcSijUI23BJmT
	k1wQlI0wQ+Jz+OKyVRBW31h4fS+uyoF/JQ6rR9sym6Mp70ONikSTuEB7OwI6tAFfrTGueq6qUWn10
	4e4r87zEAvlNORSJhKKnQ1B7T01VTOFn1ej+eAVqT0WcgYg7bsZKKtMh7jHZbsP8oMqJ+jjYRdECn
	l0uo0zijdD1lLxaWuQwc2L7kTsZCUKbjSreRyQa90dW91hjPGXu0OclJfLZv5sea1aECnX2o2IE8/
	b/P/PazRL+EEjOOqnmJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sjBYn-0000000Dxqa-2HJm;
	Wed, 28 Aug 2024 05:49:37 +0000
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sjBYk-0000000Dxng-0aBJ
	for linux-riscv@lists.infradead.org;
	Wed, 28 Aug 2024 05:49:35 +0000
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-2025031eb60so55560945ad.3
        for <linux-riscv@lists.infradead.org>; Tue, 27 Aug 2024 22:49:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1724824173; x=1725428973; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=moiMY/9kOk6Xzt0Khn1FkF8wyTL4BDNBgOSp+BMugag=;
        b=oFgBBSVL/fEmNt5ff/kfAJU4oDIhT7d0gxx7izQFQscz46cfXPITc0ledzev860D6y
         vEV7hBVj+Nf//E4KoINTmVx5UJr0wdA7tq/GewvnL76Vs8O89FWzSXg0AWfDgvWyvOOV
         oZtAZ+2ZArE/6HDVQ5f96+Xv+OHmW9RTYttmhTSa0Pbng+G6u+TvAxYwczTqEHlTT18A
         5BwwR6qJu6XhkocTJcXijmdZGWwZIo6YAAofHHRs2FPjqMMxvVhGlgF3pANyCcmuAxo1
         It7ptQO/RrUrReqjtMQ8nhYdUHvJTseCLbYu7HXO5HuTe9lfTet4dvqLUXh8YzOy5Mhu
         Qz0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724824173; x=1725428973;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=moiMY/9kOk6Xzt0Khn1FkF8wyTL4BDNBgOSp+BMugag=;
        b=w57xAsOV5vPjBA4ReVz2hADa2+cJxEDqrg19UUZ1iRJvrNBmVc+02bVBKhCX8cTjEL
         sIVgZttjtqcT0mvs+nZqvZ3GJA57VIgmuOAkG7aSMBUTpElzeBT7BGqSGGAcdTl/fTAb
         yHR/2pU4YWMgg7+V9o44G02ZErh9pNOUL/3fmHS5vXKguh0QP9d5LSFYhdflFlrakF/V
         Wb1V3i8peBhOZBtXqXQEgpzc52OrcPKtFjiNzleX2U9n7vuZUyEC0P3JnXQpaGLxl7ZW
         +8ulyl0RHw+gl8VvPtF6S8VNy5ild3zYqDzQCg/ACKU2ROurUMrQtN1EFldCgMzIX87s
         LFNw==
X-Forwarded-Encrypted: i=1; AJvYcCXU03z59IEIlkjv3odQnBymgM1MA+zVFtRaByylEwGT2HC5JPJvVBgQpH4DoJKPcy31DAT/PupJvCPxLQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YwiWffp/0dCsORcN9wOcSz4rxe3xVxRcW2BL7vQneYFslC8G8n8
	KfQsO4rYYy17m9xfrk4B/tvVAyygtIEPsnQ8QXk1T0E+E1ETd/DE6f3jCtI66PM=
X-Google-Smtp-Source: AGHT+IE+xcDspGauSp7IVmRnQSeJseOyw+wVLX4elXR4/BGbU1fHY0MaCzZG4/pxtEucaF+r97Z9DQ==
X-Received: by 2002:a17:903:124b:b0:202:4079:1c19 with SMTP id d9443c01a7336-2039e47589dmr164242605ad.14.1724824172722;
        Tue, 27 Aug 2024 22:49:32 -0700 (PDT)
Received: from charlie.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-203855df0c4sm92092495ad.157.2024.08.27.22.49.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Aug 2024 22:49:31 -0700 (PDT)
From: Charlie Jenkins <charlie@rivosinc.com>
Date: Tue, 27 Aug 2024 22:49:08 -0700
Subject: [PATCH 02/16] riscv: mm: Do not restrict mmap address based on
 hint
MIME-Version: 1.0
Message-Id: <20240827-patches-below_hint_mmap-v1-2-46ff2eb9022d@rivosinc.com>
References: <20240827-patches-below_hint_mmap-v1-0-46ff2eb9022d@rivosinc.com>
In-Reply-To: <20240827-patches-below_hint_mmap-v1-0-46ff2eb9022d@rivosinc.com>
To: Arnd Bergmann <arnd@arndb.de>, Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
 Christophe Leroy <christophe.leroy@csgroup.eu>, 
 Naveen N Rao <naveen@kernel.org>, Muchun Song <muchun.song@linux.dev>, 
 Andrew Morton <akpm@linux-foundation.org>, 
 "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
 Vlastimil Babka <vbabka@suse.cz>, 
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, 
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, 
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, 
 x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>, 
 Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>, 
 Russell King <linux@armlinux.org.uk>, 
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>, 
 Helge Deller <deller@gmx.de>, Alexander Gordeev <agordeev@linux.ibm.com>, 
 Gerald Schaefer <gerald.schaefer@linux.ibm.com>, 
 Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, 
 Christian Borntraeger <borntraeger@linux.ibm.com>, 
 Sven Schnelle <svens@linux.ibm.com>, 
 Yoshinori Sato <ysato@users.sourceforge.jp>, Rich Felker <dalias@libc.org>, 
 John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, 
 "David S. Miller" <davem@davemloft.net>, 
 Andreas Larsson <andreas@gaisler.com>, Shuah Khan <shuah@kernel.org>, 
 Alexandre Ghiti <alexghiti@rivosinc.com>
Cc: linux-arch@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Palmer Dabbelt <palmer@rivosinc.com>, linux-riscv@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, 
 linux-mm@kvack.org, loongarch@lists.linux.dev, linux-mips@vger.kernel.org, 
 linux-parisc@vger.kernel.org, linux-s390@vger.kernel.org, 
 linux-sh@vger.kernel.org, sparclinux@vger.kernel.org, 
 linux-kselftest@vger.kernel.org, Charlie Jenkins <charlie@rivosinc.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2260; i=charlie@rivosinc.com;
 h=from:subject:message-id; bh=YMF9irkRUC4sRvnkdcE8hTIaJNmeFPHDQEKHg4RlOyw=;
 b=owGbwMvMwCHWx5hUnlvL8Y3xtFoSQ9q5XbEGN52ULpq4/39venW688upWgwFDj9spqW3rOd57
 Wdme6Ooo5SFQYyDQVZMkYXnWgNz6x39sqOiZRNg5rAygQxh4OIUgInoxjIyLPq831JpspB17kOr
 jRV1b1+9OjXz6TVOvZStd2IFbrHtWM3wV9buiFXmKu3sWVt1RJfzLlfjNmD+lbK6aQ3rc0+mG/t
 jOAA=
X-Developer-Key: i=charlie@rivosinc.com; a=openpgp;
 fpr=7D834FF11B1D8387E61C776FFB10D1F27D6B1354
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240827_224934_187893_F3790222 
X-CRM114-Status: GOOD (  13.88  )
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

The hint address should not forcefully restrict the addresses returned
by mmap as this causes mmap to report ENOMEM when there is memory still
available.

Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
Fixes: b5b4287accd7 ("riscv: mm: Use hint address in mmap if available")
Fixes: add2cc6b6515 ("RISC-V: mm: Restrict address space for sv39,sv48,sv57")
Closes: https://lore.kernel.org/linux-kernel/ZbxTNjQPFKBatMq+@ghost/T/#mccb1890466bf5a488c9ce7441e57e42271895765

---

This patch is pulled from [1] for ease of review of this series.

Link:
https://lore.kernel.org/lkml/20240826-riscv_mmap-v1-2-cd8962afe47f@rivosinc.com/T/
[1]
---
 arch/riscv/include/asm/processor.h | 28 +++-------------------------
 1 file changed, 3 insertions(+), 25 deletions(-)

diff --git a/arch/riscv/include/asm/processor.h b/arch/riscv/include/asm/processor.h
index 8702b8721a27..1015f2a49917 100644
--- a/arch/riscv/include/asm/processor.h
+++ b/arch/riscv/include/asm/processor.h
@@ -14,36 +14,14 @@
 
 #include <asm/ptrace.h>
 
-/*
- * addr is a hint to the maximum userspace address that mmap should provide, so
- * this macro needs to return the largest address space available so that
- * mmap_end < addr, being mmap_end the top of that address space.
- * See Documentation/arch/riscv/vm-layout.rst for more details.
- */
 #define arch_get_mmap_end(addr, len, flags)			\
 ({								\
-	unsigned long mmap_end;					\
-	typeof(addr) _addr = (addr);				\
-	if ((_addr) == 0 || is_compat_task() ||			\
-	    ((_addr + len) > BIT(VA_BITS - 1)))			\
-		mmap_end = STACK_TOP_MAX;			\
-	else							\
-		mmap_end = (_addr + len);			\
-	mmap_end;						\
+	STACK_TOP_MAX;						\
 })
 
-#define arch_get_mmap_base(addr, base)				\
+#define arch_get_mmap_base(addr, base, flags)			\
 ({								\
-	unsigned long mmap_base;				\
-	typeof(addr) _addr = (addr);				\
-	typeof(base) _base = (base);				\
-	unsigned long rnd_gap = DEFAULT_MAP_WINDOW - (_base);	\
-	if ((_addr) == 0 || is_compat_task() || 		\
-	    ((_addr + len) > BIT(VA_BITS - 1)))			\
-		mmap_base = (_base);				\
-	else							\
-		mmap_base = (_addr + len) - rnd_gap;		\
-	mmap_base;						\
+	base;							\
 })
 
 #ifdef CONFIG_64BIT

-- 
2.45.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
