Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C84AC3ABAA
	for <linux-riscv@archiver.kernel.org>; Fri,  2 May 2025 23:32:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0nLiOhM4H1Asw1ov8fvKqqovXKI6UqACFxA0WCx1dGs=; b=z9RdbqvMwfssd5
	ExY4b0LwO683cWUh97QQelzeyqUeq99IW12qIhGQN5Ic0YDsywEuL7jpVyuEQH4Tj+8t4qAgwkMp4
	Y0bE8IyAbhaWxcYAIEm3CPoCeIvb061RwSxOBQADOCz/fWiTD67cIL79KAuO20cKI+Luk5+Z2Mil6
	iM9CpHD9eKMLjIc2onbGu6GINFb/Wy+H8i+/XiHEdKXl2NGD4zpHeZsv/qypqNmRv73lKU/rLmzXY
	0eoFgeYi9HJOd4MyLezP8Uw8sXSG/ylpscXpGohfd7H1KmtpZnnSOjrmRr7rCZBrYUNB+DgLtKJGO
	05+WBgNjKp2Hm6jV45gg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAzrT-00000003Foo-1Gen;
	Fri, 02 May 2025 23:32:07 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAzrS-00000003FnN-1Ks2
	for linux-riscv@bombadil.infradead.org;
	Fri, 02 May 2025 23:32:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Cc:To:In-Reply-To:References:Message-Id
	:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender
	:Reply-To:Content-ID:Content-Description;
	bh=QHd3Vd8BT7ERvd76/ORFx6wuHZwSymRieroGATMtUTo=; b=qjeV00pbbnbBHAIVBaU22l/ETB
	IMhkdlnC9NDWR/520qyQMmvI/qF1MFGejB6Ths28pfcWNW/vHQDKU7C7qGIbIiNV5gJckvSM8kzfN
	rozt0Gf9ezQuBheQXTxfQ5PtBuYTTPOgz6EVw5T2DwyYHJnY6oSOY4JXqTSQ7d2QWjbUiP1JYgmVQ
	qYTs0EVKNdnnvoWivwJsgfsQ69ACN7Z8l2s9u1bHXy2R4s0lUFdylnyhDtMOJKGYNS6IMxDr3Pm0x
	8jd/uGdDrfa9QX16UiHboia845xJdv6d8AaZgaxWyfPjyqjmhCEQYuhaBBLhS4a6SymdBEjwOzg0U
	NBnbsHCg==;
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
	by casper.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAzrM-0000000EwXb-0zEi
	for linux-riscv@lists.infradead.org;
	Fri, 02 May 2025 23:32:05 +0000
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-224191d92e4so28491765ad.3
        for <linux-riscv@lists.infradead.org>; Fri, 02 May 2025 16:31:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1746228713; x=1746833513; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QHd3Vd8BT7ERvd76/ORFx6wuHZwSymRieroGATMtUTo=;
        b=gBwGO5sZWZ5fj6lPFIGX8XXM7bKqBqMnZf3PGHxh6vvzJ+jbk/M0fEmefUJaqScWLQ
         w2DEefsVaxImJdQRtZAxsq56YDJGoEouEfVX+d7rS3HBThfsV6jjllnnCfvvIBKss6nf
         DQ23Cn7QLCnV3umAoJabSYOD8iM8gJePxirwVx6UhMPWLvyGUXGf1ASGRM951Ch3MHIr
         t/oVpah8pIJpgQPFkRLHjOWGGHRMLDLs8PLWEBRpupZxZgMh6vN3zUB1CUmbvzbibGtx
         yystHUM4V3y2FNx2iyOK485OZNIkZSR2U7QSZUMcMr/xO7mYKH5lhaFKJgr933dF2xnn
         F5eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746228713; x=1746833513;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QHd3Vd8BT7ERvd76/ORFx6wuHZwSymRieroGATMtUTo=;
        b=AxjvJRS4SqozCggLFTVq85LnwEU8EyoL+w280FyZopYl22aBMo8KVqEc0wZetWyB+B
         clpiFO/Pd+NuwUXm/5SRbnCxXBjv1guCgxW80VrdGZWeEAvFHVVQ7Nr3/SP0vDZ03F2L
         IUu0rssr0Wd9/LnTHIRJzYdXUouNw3eb8sU9NmCqktyWAUd05dG4KKKQCdyUixxZficB
         VW9AuQ3mR8lvHTxAOzK4d0KCP3LvLT6xQfL4E+a2ykDxEH0CDa7QwTOd9IcInRtxlwER
         l92nMUyt2ahFqTD+VZGYjSEgRYRn3komo6/4P4uC5ELsh1zCl9uiRyAwAXppDmLvhVm6
         P5AA==
X-Forwarded-Encrypted: i=1; AJvYcCWvm8VCq3iCF9TXBbbBVfQD3PMiMNU2SUkXzVZmMNOHsr0H+M0PLLbFQNP2c3eRtAEa+1/OIEm/CqFGWg==@lists.infradead.org
X-Gm-Message-State: AOJu0YwTDIf+dZElkXTU1zqBCUTDtyF/bGWWNtKb5447CP6t0r8DwVcE
	blSfB/cXjiTEK4MQeYR5wSO4xvaZ0z400clVNpkrYhG1dHp0QBbFbpTs9LhCcQU=
X-Gm-Gg: ASbGncuTZB5OH/i6jTXAWXAIc9PniiwcYJ4K0oM621JVXKk3YVyCEf7/zYYZHprnDG0
	QZ7sCtATMC4vSqrft4z0AqtDP7zbK2QzhOzTWi9Ee4NsxI7pkBcpy18zQbP2C6M+OWuvlJRx725
	FjVVaKC3WAKfIVm8Gqqy96F9ojiaQUoEOt4SrTKmCxkfanElp2t5gQN2rqal/cxHOFYn0E0841w
	7vl6QSVH9sUKRvOqd6dGmIGzwD+6FgkBVHMRpuyrv1W79A/cF2b80p6YW7DdQt33guBUIAHZ1Tc
	jEt7clRjosK0BaH2hh+t2V2R3XwIvDQB8/P6gXb+BymJnhWRiZ8=
X-Google-Smtp-Source: AGHT+IHzgeDazwJkydeLFRDZlJB+78ZnpPCVIObI5561R3sveQ+bYTtJ7Gs3hSbcC1XBysdbzJSJkg==
X-Received: by 2002:a17:902:ecc2:b0:227:eb61:34b8 with SMTP id d9443c01a7336-22e1032b9efmr67449635ad.25.1746228712908;
        Fri, 02 May 2025 16:31:52 -0700 (PDT)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22e15228ff2sm13367055ad.180.2025.05.02.16.31.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 May 2025 16:31:52 -0700 (PDT)
From: Deepak Gupta <debug@rivosinc.com>
Date: Fri, 02 May 2025 16:30:55 -0700
Subject: [PATCH v15 24/27] riscv: create a config for shadow stack and
 landing pad instr support
MIME-Version: 1.0
Message-Id: <20250502-v5_user_cfi_series-v15-24-914966471885@rivosinc.com>
References: <20250502-v5_user_cfi_series-v15-0-914966471885@rivosinc.com>
In-Reply-To: <20250502-v5_user_cfi_series-v15-0-914966471885@rivosinc.com>
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
 Jann Horn <jannh@google.com>, Conor Dooley <conor+dt@kernel.org>, 
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <benno.lossin@proton.me>, 
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Trevor Gross <tmgross@umich.edu>
Cc: linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
 linux-mm@kvack.org, linux-riscv@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-arch@vger.kernel.org, 
 linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 alistair.francis@wdc.com, richard.henderson@linaro.org, jim.shu@sifive.com, 
 andybnac@gmail.com, kito.cheng@sifive.com, charlie@rivosinc.com, 
 atishp@rivosinc.com, evan@rivosinc.com, cleger@rivosinc.com, 
 alexghiti@rivosinc.com, samitolvanen@google.com, broonie@kernel.org, 
 rick.p.edgecombe@intel.com, rust-for-linux@vger.kernel.org, 
 Zong Li <zong.li@sifive.com>, Deepak Gupta <debug@rivosinc.com>
X-Mailer: b4 0.13.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250503_003201_150214_B73971DA 
X-CRM114-Status: GOOD (  11.91  )
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

Reviewed-by: Zong Li <zong.li@sifive.com>
Signed-off-by: Deepak Gupta <debug@rivosinc.com>
---
 arch/riscv/Kconfig | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index bbec87b79309..19d5a3d5e0d6 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -256,6 +256,27 @@ config ARCH_HAS_BROKEN_DWARF5
 	# https://github.com/llvm/llvm-project/commit/7ffabb61a5569444b5ac9322e22e5471cc5e4a77
 	depends on LD_IS_LLD && LLD_VERSION < 180000
 
+config RISCV_USER_CFI
+	def_bool y
+	bool "riscv userspace control flow integrity"
+	depends on 64BIT && $(cc-option,-mabi=lp64 -march=rv64ima_zicfiss)
+	depends on RISCV_ALTERNATIVE
+	select RISCV_SBI
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
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
