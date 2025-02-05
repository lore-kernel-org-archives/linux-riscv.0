Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76441C02193
	for <linux-riscv@archiver.kernel.org>; Wed,  5 Feb 2025 01:22:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QtbSUQe4nKmAXnCTInEk1WY5vPoUNqfHcvrQI2XShC8=; b=4ZYoeys7Fje44Q
	fxaX1GFDk4EVSGb0/r3qQRfdSEyjRa0ER67euN6gcTImAYjt2Gj+Bs1LOD8RDRHwA0s/7LYdiAArd
	FAWfeBEOQvaOBBmImeiNgQ/Xzr/wfx9QqHq1IOxNdcpX+Am/sb2nd2JqFfiPGfzb2JTWQskzcz1FJ
	x3snX/wJM8CffcZaP06/CViQkaihQUZ6wGb39cYbpgofPbSrigQxbb3vx1CbB7vUl7DS1Ni7slR3U
	UjwZNgnR71wtzCFBb3H1XrK7X+Iu2Ev0I+KOFiIYLiiEeGxhdlFnf3+Aw+fQzt212OE9Bo67m+V+S
	NUqskBjqBYNuuM0iLqvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tfU7p-000000021sZ-2viN;
	Wed, 05 Feb 2025 01:22:45 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfU7o-000000021pq-02K7
	for linux-riscv@bombadil.infradead.org;
	Wed, 05 Feb 2025 01:22:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=9LN1OOVFFK55bIQe9Bj7KSCICvDpdODqLxcVYOIQy28=; b=XWNKKkHh5uOAXJbOkKSjDY04PN
	fRmbc60ZA+abyx7cTeyIz0djkvGwpfjRBwqRHJjQXLQHTewxTqB3Nx/b43FDaqFG1uv8pu3HlmI5p
	2jP5fxQ1Ja3S+rnZgYTtmPeIFOq5FcrkVJf+T9kQZqbGbwAjAGTHi8K/ZhFhENX2Cc0qq124EgFuE
	p6VyEFqKsrZEYOWURy9EIf4P1y7NYQDSNfC+fQrhkR/DgDRX4dmX72aKk/6FwtLdO9M1ybEmwIa07
	PKJ2G81dQmEkNyZGjwNPtCkx/9lD8FrqmRV+aI6flHMIEPt9jbepMuiAV3SFYWNNQC4ZB5Wr1fMMU
	FHy8iCgQ==;
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfU7j-0000000GTyZ-2I38
	for linux-riscv@lists.infradead.org;
	Wed, 05 Feb 2025 01:22:42 +0000
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-21f1b2480a2so397215ad.0
        for <linux-riscv@lists.infradead.org>; Tue, 04 Feb 2025 17:22:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1738718558; x=1739323358; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9LN1OOVFFK55bIQe9Bj7KSCICvDpdODqLxcVYOIQy28=;
        b=fkFEVKdcna7G2nbnzXxC6mLIsQ2LzpsQ8YeEQsMI2OMMNCyzY9c1DyiQHXGzjNdx1W
         wNfAa6+oHIKfNH77Zz3qslR+nL//LRoOCOsTOn2wa8SqDjv7ucfIWfE2YijDQOxhgy1k
         XowRIQxFYBfHpN1P/DUzXqZr/iJUfck/6B+rpmUFPsCPcX3TVe0jEWYFBxWsCfzqyph6
         Poq2U0RW76h3xMGhCz3QS05+LSA7OWjJEqYYz7L/OOec0SDpTb+d4Zxv+i02tfZ7PXH8
         AbfA7dz1teIKbRexrmhgoUIX8NsSvyUj6+5BXhCFaPLBnf3doCGYWQc22s34rZjJgEp1
         WbVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738718558; x=1739323358;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9LN1OOVFFK55bIQe9Bj7KSCICvDpdODqLxcVYOIQy28=;
        b=BDC2BynY/cVRrxH4U64yixGTZq+tzMJjWvbufrVYbyv2J/APvRKM+pGmaasS5j7Ybe
         2YSc334bgHzWxvug6sCYKUm5vZApPUSRTSg+CtXhkvUxm7CYn+0Rt+jYS/1MH2a3ljDo
         srEuT5dW2JLhiLgc+CLde8vwyVfTEZXu8l/ak5gtFWzOWhvEO057C8c837DhXOmbkN59
         9mKGK/4V8ATMi6Cva420gBZThuTv1DfVHr/RcjDi9NjM2zHjFBwDPSzeUWdnTh3W+dAU
         P4jcR4TJCuKabf/735jDK1dgq/U3DOCuQ1df/6fa9JNB0WPv49r95gTjQ2TtiDwMBvZo
         Psgg==
X-Forwarded-Encrypted: i=1; AJvYcCUr+6C+9p+k1hSER0As6PxrbHBZipct+RXJ5PPaCI/A9DKEKLBElP06PfF5YZ9p5/gudJNVefLXkuRWUQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yw/MxStYYXwJwh0ry2fPv3CAmD966koqL5pN0YYadevdjtNsQQH
	iXy6+NMad7np6igp2tSi5y/yg9m5iyceG3Gg+LvdEMp2JG5Hy0/3N+HalPrcBHEB1hR+LN4bxPG
	G
X-Gm-Gg: ASbGncvjIDhnL1+MlikRJAfe1LmugP5quFBBrmcz/dxbBjrOGeCltAmzLh9Cfe56c1a
	5AYoiOJ20Xp5FTnJZRwm42iY/f1aAtBbwcEJ5llQCFm7mlshqaTdlbPzVVKIaUdtyZyzRaHEQ76
	fAWwFxyKKq95aQjDg50laR5ucUwalMzWnoqTimgS628WbzdmboMJhg99uwmTJYJv8O4jjh7I+rY
	MWhAEK+aEFsV8+14fiIab65p/NJ/hJCjd0m5E2uFn+S79i57Tl3XXkygXdjMFR5soVIl5x3fQuy
	v0NlReNMcLfck4EWArlPnRjZHw==
X-Google-Smtp-Source: AGHT+IEz0qHgqun1HMRAWwYPxj4lEXbUX4lq/KHX/YPS8k5v/b/oBuAj+3XdSaG2F4SQ1olAiHNptg==
X-Received: by 2002:a05:6a20:6f09:b0:1e1:ca25:8da3 with SMTP id adf61e73a8af0-1ede8845f6amr1551216637.20.1738718557822;
        Tue, 04 Feb 2025 17:22:37 -0800 (PST)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72fe69cec0fsm11457202b3a.137.2025.02.04.17.22.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Feb 2025 17:22:37 -0800 (PST)
From: Deepak Gupta <debug@rivosinc.com>
Date: Tue, 04 Feb 2025 17:22:10 -0800
Subject: [PATCH v9 23/26] riscv: create a config for shadow stack and
 landing pad instr support
MIME-Version: 1.0
Message-Id: <20250204-v5_user_cfi_series-v9-23-b37a49c5205c@rivosinc.com>
References: <20250204-v5_user_cfi_series-v9-0-b37a49c5205c@rivosinc.com>
In-Reply-To: <20250204-v5_user_cfi_series-v9-0-b37a49c5205c@rivosinc.com>
To: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, 
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, 
 x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>, 
 Andrew Morton <akpm@linux-foundation.org>, 
 "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
 Vlastimil Babka <vbabka@suse.cz>, 
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Conor Dooley <conor@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
 Christian Brauner <brauner@kernel.org>, 
 Peter Zijlstra <peterz@infradead.org>, Oleg Nesterov <oleg@redhat.com>, 
 Eric Biederman <ebiederm@xmission.com>, Kees Cook <kees@kernel.org>, 
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <shuah@kernel.org>, 
 Jann Horn <jannh@google.com>, Conor Dooley <conor+dt@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
 linux-mm@kvack.org, linux-riscv@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-arch@vger.kernel.org, 
 linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 alistair.francis@wdc.com, richard.henderson@linaro.org, jim.shu@sifive.com, 
 andybnac@gmail.com, kito.cheng@sifive.com, charlie@rivosinc.com, 
 atishp@rivosinc.com, evan@rivosinc.com, cleger@rivosinc.com, 
 alexghiti@rivosinc.com, samitolvanen@google.com, broonie@kernel.org, 
 rick.p.edgecombe@intel.com, Deepak Gupta <debug@rivosinc.com>
X-Mailer: b4 0.14.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250205_012240_549809_129E26B4 
X-CRM114-Status: GOOD (  11.41  )
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

This patch creates a config for shadow stack support and landing pad instr
support. Shadow stack support and landing instr support can be enabled by
selecting `CONFIG_RISCV_USER_CFI`. Selecting `CONFIG_RISCV_USER_CFI` wires
up path to enumerate CPU support and if cpu support exists, kernel will
support cpu assisted user mode cfi.

If CONFIG_RISCV_USER_CFI is selected, select `ARCH_USES_HIGH_VMA_FLAGS`,
`ARCH_HAS_USER_SHADOW_STACK` and DYNAMIC_SIGFRAME for riscv.

Signed-off-by: Deepak Gupta <debug@rivosinc.com>
---
 arch/riscv/Kconfig | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index 7612c52e9b1e..0a2e50f056e8 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -250,6 +250,26 @@ config ARCH_HAS_BROKEN_DWARF5
 	# https://github.com/llvm/llvm-project/commit/7ffabb61a5569444b5ac9322e22e5471cc5e4a77
 	depends on LD_IS_LLD && LLD_VERSION < 180000
 
+config RISCV_USER_CFI
+	def_bool y
+	bool "riscv userspace control flow integrity"
+	depends on 64BIT && $(cc-option,-mabi=lp64 -march=rv64ima_zicfiss)
+	depends on RISCV_ALTERNATIVE
+	select ARCH_HAS_USER_SHADOW_STACK
+	select ARCH_USES_HIGH_VMA_FLAGS
+	select DYNAMIC_SIGFRAME
+	help
+	  Provides CPU assisted control flow integrity to userspace tasks.
+	  Control flow integrity is provided by implementing shadow stack for
+	  backward edge and indirect branch tracking for forward edge in program.
+	  Shadow stack protection is a hardware feature that detects function
+	  return address corruption. This helps mitigate ROP attacks.
+	  Indirect branch tracking enforces that all indirect branches must land
+	  on a landing pad instruction else CPU will fault. This mitigates against
+	  JOP / COP attacks. Applications must be enabled to use it, and old user-
+	  space does not get protection "for free".
+	  default y
+
 config ARCH_MMAP_RND_BITS_MIN
 	default 18 if 64BIT
 	default 8

-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
