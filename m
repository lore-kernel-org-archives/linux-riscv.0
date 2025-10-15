Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDDE7CCD199
	for <linux-riscv@archiver.kernel.org>; Wed, 15 Oct 2025 18:14:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NyavjuBvF0NsSynAF3ikQaCA5yscjvilqJVuJOqLM3c=; b=KKzWhvq31tqIDv
	3m8mD9tCNnZHQxqERRiZkOfQTlwb1vFeNKS2Z7DONLGzYg4UJVJD3LHLCUd3OywIyJn4+VFGebbn3
	MmCSKgRvmnsAsWeO1j2uM8b+6jvLPNUim2Q/yOguvd/gU6hGAzcdPyYEB+DDMLFHWJfknpiCsoZmq
	3E6wC3k+iK2/kuldetHe88+oH2mOjK5qM1Oakh1qjEsywaMIZ4cTj6cniCxjRf7xSAoNlH4F8HaRl
	d5d7PKXOyH8gVsUJDsIiI2QoZzIY/aLeeunt3aqSmvuUanAORV3oOGCAXjw2bjVNp9KxvamB59ogK
	aRF9HpJRylqr/kMS1JRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v961Q-00000002Y9O-1A93;
	Wed, 15 Oct 2025 18:14:48 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v961O-00000002Y5R-0xte
	for linux-riscv@bombadil.infradead.org;
	Wed, 15 Oct 2025 18:14:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Cc:To:In-Reply-To:References:Message-Id
	:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender
	:Reply-To:Content-ID:Content-Description;
	bh=Dbof0LYINd4D+dAMCbCh8LGflH6StFg2c2dYAuc2+YY=; b=iJnDlhIEtq5Jrh5EeVbwUeKVVf
	YEoBlqU5TcEQu20EsDByEnsQC7rEDhnxHo6abIwCISN2CMSS18+Tfr//MD08VH1KnI0i8LMg7HlWB
	kZCdD7QOurqlJRloJXVmPOXAKRQfV+gF9XjbBrTi32t7wRI8DJb9W8dS5i6hScMCnrBad0FAQMEoW
	H1cjHgwhYZzfFAGeXx3NB+me5EhZ+JHf4MRcKw2t/z6hTL0rYcZ7F25y8ArNvkYoehLyo7pPE2oRc
	MFF0bYUnlNV15iUiKPhyxRFZxi07e1I+SnSo++n3zwmjG+5yijiMMAfeduauAdy3THhq2blgJmAo8
	kvLYhfBQ==;
Received: from mail-pg1-x531.google.com ([2607:f8b0:4864:20::531])
	by casper.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v961J-00000003jUH-3WjH
	for linux-riscv@lists.infradead.org;
	Wed, 15 Oct 2025 18:14:45 +0000
Received: by mail-pg1-x531.google.com with SMTP id 41be03b00d2f7-b62e7221351so5671990a12.1
        for <linux-riscv@lists.infradead.org>; Wed, 15 Oct 2025 11:14:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc.com; s=google; t=1760552080; x=1761156880; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Dbof0LYINd4D+dAMCbCh8LGflH6StFg2c2dYAuc2+YY=;
        b=UuBhJ9xCHIm6P43gI/wYg42d5VNy4NmNRbmqPR3HZpnjOOErMNOQyNcbvwuiUELqQs
         L706jnyJVVSeBvcewqwZ8F6IonnRZWeAfkdJ/SUv2cCNyQucdZkdFfEHCIGnTMBVqi5N
         wxP5VXhBOh5Q922uf9dGLNLhchfxfDcv1Is+z+wtFCw8FPlPO9z04Xh93cOB4SurunAh
         A3D//6jWAydIzInc9WbJlRMODEgBxlxOmpZx3rAub8EiIXBkRPtJjhkmJtYGbipKLuXw
         WXENm97pOGLCT1GrxnYIpOEC99kT9UzbBQ7AigY2xZHoDY2OcCUR5ehe4QBlkHb2zbWn
         WY6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760552080; x=1761156880;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Dbof0LYINd4D+dAMCbCh8LGflH6StFg2c2dYAuc2+YY=;
        b=mCIlYlR32Cpc+3fd2FN3+ShyVr3n774PlVPorJXVDyfYHxEu5ntDkH39gOkxd5dS2B
         Vn1Wf/R8IPlGVOQit+d2CwoyUkiKD93ALSbav3LW+HGtLoq6bJHuKpJeRadDr/NPKJTd
         2uhTfxKfnGryFkh5HgQNJ/WLsWmPa2wzRGEsxsOWr5MAqDvwTRNi6DSR87FQpklSDLPb
         PRM9EM5GPVNbXinLDTsrUN/bRJki6aURZmhVCcguXYZKJA/HTb5XD1FgWmkLLa1CC+LJ
         lNBq1L8aaMCt8jE5YGrvgMLg78Q6r2dbKfdqO4McVem8sUfN67JVBDRMuDMFW3vh/o+B
         U8VQ==
X-Forwarded-Encrypted: i=1; AJvYcCUNmgL0UEu+K/wUwEn6NOAmnCEGWlkyi+FMqqS+g2fp/DiUiKZRE2Wgzb3AOFeg4QrSNL86UglNUVbEgA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yw68COG1xLSDqjn22/rZCOnU1TVjcwoQPF4FkE2afPJ6nMC/3Cb
	kS8dM1ZOTudj3AnevGSZvZODqvTklDwKox9losU7dODeArujvupbxsVnFiDnh+PRhKc=
X-Gm-Gg: ASbGncu1Ov8w/Syn/5phCsRYhFY8gxd4Y+ps9rQ0YlCEQ4zMT6KrBDpmj2yT7Nuy3vp
	KEmgg+o1oJDmRVrSPPrq+eZ9+53Cr/holTnqaTGp0Mi6GLt6KSDCa86CnyxdPBW8I6KP+P7Prgt
	vTndhED6qDSm5qdcQZ48EQ2Q/AK9RxcJe9DyvGNFCErpbZIPe24PKlLrOTwoVyF4PyG2b/hXq+W
	JhZPVMBFyDKxcf6EV0qoD5Dp2BFL5aWLgJBrKxuNtnbsfnuta1kP+EQSSjQOrjzgOjWerriihHT
	+RSPzvsg5Qteof2etqoKBFMS/aSEeTCug72QSqKeVxu18HoK9V8cSF4sm3ULlqkfGI7wpkkmCU0
	v+c4XLklSSO58hEuP/K5l049GKhegt2KesguacWt23DdogqVbETBB8kv2QTyO/Z5jjUMb5eXW
X-Google-Smtp-Source: AGHT+IGAsBeXLYnUBeSk4VeBAeMiRCSfs4dgrhVgQ7j/hrfP/0NXVnhFuxrL4cfJn2DM39e7oP4gDw==
X-Received: by 2002:a17:903:1aef:b0:250:1c22:e7b with SMTP id d9443c01a7336-290272e3a78mr384355745ad.43.1760552080319;
        Wed, 15 Oct 2025 11:14:40 -0700 (PDT)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2909930a72esm3126625ad.21.2025.10.15.11.14.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Oct 2025 11:14:39 -0700 (PDT)
From: Deepak Gupta <debug@rivosinc.com>
Date: Wed, 15 Oct 2025 11:13:57 -0700
Subject: [PATCH v21 25/28] riscv: create a config for shadow stack and
 landing pad instr support
MIME-Version: 1.0
Message-Id: <20251015-v5_user_cfi_series-v21-25-6a07856e90e7@rivosinc.com>
References: <20251015-v5_user_cfi_series-v21-0-6a07856e90e7@rivosinc.com>
In-Reply-To: <20251015-v5_user_cfi_series-v21-0-6a07856e90e7@rivosinc.com>
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
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Trevor Gross <tmgross@umich.edu>, Benno Lossin <lossin@kernel.org>
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
X-CRM114-CacheID: sfid-20251015_191443_206511_3D19EE7D 
X-CRM114-Status: GOOD (  14.66  )
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
 arch/riscv/Kconfig                  | 21 +++++++++++++++++++++
 arch/riscv/configs/hardening.config |  4 ++++
 2 files changed, 25 insertions(+)

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index 0c6038dc5dfd..aed033e2b526 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -1146,6 +1146,27 @@ config RANDOMIZE_BASE
 
           If unsure, say N.
 
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
+	  default n.
+
 endmenu # "Kernel features"
 
 menu "Boot options"
diff --git a/arch/riscv/configs/hardening.config b/arch/riscv/configs/hardening.config
new file mode 100644
index 000000000000..089f4cee82f4
--- /dev/null
+++ b/arch/riscv/configs/hardening.config
@@ -0,0 +1,4 @@
+# RISCV specific kernel hardening options
+
+# Enable control flow integrity support for usermode.
+CONFIG_RISCV_USER_CFI=y

-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
