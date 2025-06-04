Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BCA3C61DB2
	for <linux-riscv@archiver.kernel.org>; Wed,  4 Jun 2025 18:28:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uoFUGB2qu9orwwCUpI5YQSZJXCGPZLo3THL1eMKTpAo=; b=KsLHrZWGBJgogq
	MAg7K4f9oS/KzQlj/HTwTs+A1NG8dWDQIO53fxXlJ9LQH2d3eI6ggjBf2SjDFFb9Kod9MmOLIivFc
	+ks+Oljr5zUv4hmbLbo6GgrC6mmdIFXwGD3ii+bimeh9V0dg6ltBzRDr3WnK7f2hqsadCY0cn69BF
	kuxMxAkk7MFvLw7I2i+Esxof9LpVv80hLO1hnqHL+xO4Qcd1vxc2dyGzPUYd4zrHfpLSVeIAFeLop
	pyW0PyXXCdxDOPDLp4g3Ly5U7D0h+FOhNa8Iph7FUQ79MNyKxuCNFcX6iaYHNqfr+O31c8+99sE88
	uR6Z13//0gtjqxaNKQ+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMsqw-0000000E10j-3iOu;
	Wed, 04 Jun 2025 18:28:42 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMrk4-0000000DtOA-3jgp
	for linux-riscv@bombadil.infradead.org;
	Wed, 04 Jun 2025 17:17:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=zd01FxT3OlMOzWqIaODnmoUPnuHtuVmONb+HNJjd/YM=; b=PGPVZEBPxPZyzPrGgEi92+n3cf
	7H7ePh4eKLHEzMuuzl8mj8kl5agaNH5Q1tgNL62bfuDrqRDGsAS1VGnuL184Q7HkgclAPbNj7XxB4
	TFQClOhspZ5IbDs+F5UdKTo1Io6qoIPtuj3s+n1YGOCWnmcsbVUcsQHWTntpVB2B8aVCWM5x/SWzJ
	AbDrND7APtt1IGh1CX6Izl3UYUVACqbYSYIPH0F51ok6i+asfpekIAn87NhNfhowJZ3+HZTqyaWLX
	eAKvzv/nBYhHmkdJFPP7UzHFRKTtsh0JCpcnpr0Qcp1W7rGbKgOZ7HPnpviiklKvfWFfJjy1an3JE
	2EhrHJwg==;
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMrk2-00000000vG6-0C7c
	for linux-riscv@lists.infradead.org;
	Wed, 04 Jun 2025 17:17:31 +0000
Received: by mail-pj1-x102c.google.com with SMTP id 98e67ed59e1d1-311ef4fb549so87912a91.2
        for <linux-riscv@lists.infradead.org>; Wed, 04 Jun 2025 10:17:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1749057448; x=1749662248; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zd01FxT3OlMOzWqIaODnmoUPnuHtuVmONb+HNJjd/YM=;
        b=J9pkMbCD63jN5SN9GznixGyUSwu6XkoSC5vBLUxG7ukobYQCoknl17AZ/f92/i1daq
         0nP2/6jHBRSiHutG54g6gFxcCAtYD+PS+jAD8MkzgutHnupAxPlZHJta+710JZ5dTgOt
         k3BO+EfVgriG29ssJkAuBPWJdOVWpUPOndvkFt74BaNkONpWyGssVYJ7floKa0nQnttp
         axi/bxVwzsQ8F54k+7vdvjK3dAgnVYvPk4uO5PJBauSiFGWpED14FPTanduH4hHWbeje
         +32WkariJd2obpwcq4I5fIZyurkEczF1AdNYCoCjYtVq9m6K0nEW7SHZwJQh1QjEvNSx
         Qqng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749057448; x=1749662248;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zd01FxT3OlMOzWqIaODnmoUPnuHtuVmONb+HNJjd/YM=;
        b=PsenxPsbbcBMJv9mxJpd8st87EOiDaBVMrx3CZYFHcSxJcv21QoDGrXzJSTZFjj8Iw
         Q6aPdTKfKf0T6/LrAzC+LRfOQXQ6Ooc7i0A/il28GBiEsONK3sXN7WtpYsICnV5BiXee
         caZx3MMNTrb0UWvPPfZKHaxMrRVKC/mpz+OjinvxpbxyBCyku7rCmbcXY1CB7e164v/L
         XTBXE2YOIDM23/7FltePkSp1ebKNrRqrhNFGX1GB/CldGm70zfeP7bfwUBQuIT6ltaq7
         XXaGyCqVFINAUDPXnO6IXROxvfWc3AOu9Msz52AXXmbHn8axPZG1mCYBkxHWySVz71w3
         56aQ==
X-Forwarded-Encrypted: i=1; AJvYcCU5ffuCZ5hR45eHeMYDhnFhQ6ehQe8cYLoh4fGwIWYmWqGsdG5k0LHOfDkKm4vXUcTBkdVQJRHYOEoBKg==@lists.infradead.org
X-Gm-Message-State: AOJu0YwmhjDHaL+1tpN3DFABO3tvkBfjcY9HMwlMMRAtdQKVtFCNKiZr
	PjKbhmJacsNqohg7exWtvnfYPbyO4Nxd1ymxbwXJU5VPbmIjnc50r+RCBrjzJ3DVny0=
X-Gm-Gg: ASbGncv/kpMX+HQo48imKWy5hIion9NrJugiZJHbB7GYGGrb/bpaXgg/sR1VdIRUrCm
	H++kMKJzASQ06iSCVAmPkjzV2jW1TCNYpUQ8y+vRmsEX8/RATfwSJxiNoUMOOSfuRtezghf3HZ+
	exF9+YV3niQPBQxYAsiaIYw1+nOu5TYvBJwgahMAieCWJjt9pVQlydDDnWUTSsL+tBnDxuNQiRZ
	UhvS8TF/6rlZvDADi8P/v/hDakQm//RKL63Lyb6qQ7rE9ftfHEDx9LoW/5iBizeTfXa5BocWTOQ
	+jy9o2r0JOvANY/yj1Ca5EIbA1EKPEbCT2v1go9318N0IlzZTxtdQU57Lzyzaw==
X-Google-Smtp-Source: AGHT+IFWkJ78wFMwg3GliR7Galn0PbhhfnyCNBUVVp6rLtdMWNFL3ewFiC9H95Yfi/uZOn7VC4Cxkg==
X-Received: by 2002:a17:90b:3c4d:b0:312:f88d:25f9 with SMTP id 98e67ed59e1d1-31310fc4f72mr4513419a91.7.1749057447912;
        Wed, 04 Jun 2025 10:17:27 -0700 (PDT)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3124e2e9c9fsm9178972a91.30.2025.06.04.10.17.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Jun 2025 10:17:27 -0700 (PDT)
From: Deepak Gupta <debug@rivosinc.com>
Date: Wed, 04 Jun 2025 10:15:48 -0700
Subject: [PATCH v17 24/27] riscv: create a config for shadow stack and
 landing pad instr support
MIME-Version: 1.0
Message-Id: <20250604-v5_user_cfi_series-v17-24-4565c2cf869f@rivosinc.com>
References: <20250604-v5_user_cfi_series-v17-0-4565c2cf869f@rivosinc.com>
In-Reply-To: <20250604-v5_user_cfi_series-v17-0-4565c2cf869f@rivosinc.com>
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
X-CRM114-CacheID: sfid-20250604_181730_148069_7C056A86 
X-CRM114-Status: GOOD (  11.59  )
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
index bbec87b79309..147ae201823e 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -256,6 +256,27 @@ config ARCH_HAS_BROKEN_DWARF5
 	# https://github.com/llvm/llvm-project/commit/7ffabb61a5569444b5ac9322e22e5471cc5e4a77
 	depends on LD_IS_LLD && LLD_VERSION < 180000
 
+config RISCV_USER_CFI
+	def_bool n
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
