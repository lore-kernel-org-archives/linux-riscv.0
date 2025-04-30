Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 161C2C3ABAF
	for <linux-riscv@archiver.kernel.org>; Wed, 30 Apr 2025 02:46:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FWMP/GArqotetfQQwZfgBSvNR6Ch2dc8mOwBILVO/Ek=; b=csSiUbpA7Q9GiN
	gaqnXA/6pqcTzk20oMoVmiz3B6Rm96/bzFZ8DWJS1pCKO6hPgryytODqGvXvOU7b8V0TspGJWtOqq
	w07v34sE4uyY3dY7zLQ6JUSRr9e5tCbIhMtftMTjDW+1rYTJa9by6Eerd+dR4+g2cSic9xzWNqyN+
	pE2UUVsoFWnr5pVxkz6wLcwU6Dp7QrDvqpolux2/KdBZCguTqN/r3MLhglYyeA6pasPhYqJjWdRv4
	3Hw45lBidNwLDkUDfdVaI3kVjyM2HWL/iKh5jcN1fhP9xkkOA0nPUEqgbdsuWLzKPQy9RoP5qksif
	O3iguFUJE8AOLKUTQGyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9xSo-0000000BXba-3Cam;
	Wed, 30 Apr 2025 02:46:22 +0000
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9v8x-0000000BHCD-0SN6
	for linux-riscv@lists.infradead.org;
	Wed, 30 Apr 2025 00:17:45 +0000
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-2279915e06eso76252485ad.1
        for <linux-riscv@lists.infradead.org>; Tue, 29 Apr 2025 17:17:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1745972262; x=1746577062; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BNzeP/w/trhTL6cWe9Pecwh1mzcoQfn9vSNH+Q0tuaw=;
        b=dvUo4xteCkdmCjuUvUmE0JIVOs93YeARe9jnoDXGMKqGmYVhRFtzX1iDya02hl79w6
         Pc8Rhdrr9UCSFpmgwdcNo36qNmqL0TpZOAeS4nZkmyqWtt6nwE05YvxHDxX2cxC3w5Q4
         xnrpNIis4UAo9BC34JE/zDe7J98OpnoeDZaZDsyJUvU1bMKtHskXpfs9SNG7jf553BYd
         NjkXvAbxmV53XHG5ZhWlmgLg4bpb4NeT7FvhCdQvdUiKgEhAQ8Cc3DuULncrf04geiCa
         XYL5Ht8TC4nCay9O4gp8zZnTGie8I1E24M52Yci8vpkXgPjInXFhs49Fajn5mrgKmV9m
         hFLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745972262; x=1746577062;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BNzeP/w/trhTL6cWe9Pecwh1mzcoQfn9vSNH+Q0tuaw=;
        b=ghmVoQn7geAoyj+fobCOKcQya08Czbn4E3XMFjFj88TaTbnTb6Dd1O/3IUO+ClUwpe
         kSd096SI6CQgGRGzjIcoLTWrENg7CCNYq2UXM+6pW0imcxa3SKV3bVqCfpLj8t+NdkBd
         8EOuH8ihT0Rhqh1MwhtR0z6inwKUfQCCfMmXGGjayBsVnizLbRlBwDB39F1F1OcRt3Il
         RMbMvOrOFD8cF1M2/D4fL+pyp+kfw7vMQMKX6PZUq4tVZJAtQc3h4Ap10jBI6SA+pfrU
         Zjx0lU195Fbs+DrUXqIseO/GU2yZ4BrjBMjUGck5PhQCqacEbJK9LiSlTCB0xZOaDIK6
         Ehxw==
X-Forwarded-Encrypted: i=1; AJvYcCU1v6+nLqgmQdDEm90H9ho/ZCqs+MzMI+bO8VLwNFkOD7relv4xPdjK198j3F6HdjPW05z9Bv6P03G0Gg==@lists.infradead.org
X-Gm-Message-State: AOJu0Yx3FwstGqH+mIyTs2wgInYZC0kovcnzAuf97VzZIWowiVHh/AQL
	Il8+fCAwaXdCRmqJWOCbNuy2qAwMsHczAOa/cmFfIf1Np5gMzbLSjkxx/iJTXpo=
X-Gm-Gg: ASbGnctyRIsNMwfqEBgTONx/WFHBfBcBDLZgmFz2Wfui0HNC40vNuHSHVA3zsoqULbB
	nceVu8XUCKhbopZier6Ce+2VjuSqMNmleEIVeVoZc8bNiMevP76cklmgjpsI8zw1o42fYJsU6O+
	ZfYCaaQba2AxPxPw6Ycm2lwfH/PmSeZhWeB9wlyrLDgM0O+CzulUVUJxSpGvg5QF1FK/QNFdKmG
	I95oPjF8CD771MHCWE+nUPrlSZU4NRn8iIVjr1pd/Oz9IjjkmX+CrMR3b/HKG0yxOv04gNgvUqx
	lTdmBbq6S4Fu2dRaUaN6QaxhK1pGwUXuJvzkqi9UEASzo4uhkkTAaDdcoa2+sg==
X-Google-Smtp-Source: AGHT+IE8bdn8tLEphSjIyMJDkn6ceb8Wnl4C2tXu5He9G7slYh6azYWKOO5c5aQwZY8zwfz/0/Deyg==
X-Received: by 2002:a17:903:2ec6:b0:215:b1a3:4701 with SMTP id d9443c01a7336-22df57a3f9cmr6603965ad.13.1745972262508;
        Tue, 29 Apr 2025 17:17:42 -0700 (PDT)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22db4d770d6sm109386035ad.17.2025.04.29.17.17.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Apr 2025 17:17:42 -0700 (PDT)
From: Deepak Gupta <debug@rivosinc.com>
Date: Tue, 29 Apr 2025 17:16:41 -0700
Subject: [PATCH v14 24/27] riscv: create a config for shadow stack and
 landing pad instr support
MIME-Version: 1.0
Message-Id: <20250429-v5_user_cfi_series-v14-24-5239410d012a@rivosinc.com>
References: <20250429-v5_user_cfi_series-v14-0-5239410d012a@rivosinc.com>
In-Reply-To: <20250429-v5_user_cfi_series-v14-0-5239410d012a@rivosinc.com>
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
X-CRM114-CacheID: sfid-20250429_171743_185801_17FD37CB 
X-CRM114-Status: GOOD (  11.64  )
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
 arch/riscv/Kconfig | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index bbec87b79309..31ba88f42b1c 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -256,6 +256,26 @@ config ARCH_HAS_BROKEN_DWARF5
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
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
