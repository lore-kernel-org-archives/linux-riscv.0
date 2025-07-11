Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBCD0C83F1A
	for <linux-riscv@archiver.kernel.org>; Fri, 11 Jul 2025 20:47:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mdUydf/bnlY0I9SgBYhMLYmB++7KoomIeTZReIMkgjQ=; b=fitzw5UgEHckkF
	d0xosIn2EQr7H1lAoYm21djPo6HvYD1preykbXfiYGh7XmAght0CH6qzljxfRSM3Immisj7F2czeR
	9DuTVoDZrgHQ+NuBsdG/Y6zBmaa1liu6Ld1DYqNNQo9jktSs4Vy9fYOHq+X445vEwgrgTWspKQbex
	WuTbLyhWMMyNPYxYJeTQWGq7SmpteIjqWdiqTc7tk0hG22ZtdBdU+M8DThBt8ewr/sLxBS/y3BQwG
	iShyOw/T2cc6/3Ro70ysM0Q/W/xFahVO55LnyR5SScu0cfVtbYWqCIqf0g/aPXKIwH4fR2Hcs4HqC
	ylq5bKrIv5wFf1q4oyvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uaKeg-0000000Foih-3kf0;
	Fri, 11 Jul 2025 20:47:38 +0000
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uaJiS-0000000Fgpc-0tLQ
	for linux-riscv@lists.infradead.org;
	Fri, 11 Jul 2025 19:47:29 +0000
Received: by mail-pf1-x42c.google.com with SMTP id d2e1a72fcca58-748feca4a61so1590799b3a.3
        for <linux-riscv@lists.infradead.org>; Fri, 11 Jul 2025 12:47:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1752263247; x=1752868047; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zGYKU8oEStLMY+WKb4utGxIDZo++9HKS8iEvkqWqbZk=;
        b=mjJHk8njAHwM87UQrv30HoIj81/eTVhVlA3vN8ExegWlWk6cCtWXoHdd3Llr1XWbn1
         WlFgG7KkdeCmQMVN/k+Cyfdvx2aLSWGZvNMW8yHDKUj7R9C4rRaFzWQoR1ZJQsnHOk0o
         DljIOIuixKgGytdGkzp1z96XanSjRF1QeFSPYz0gETN7ORAGCvnY0K99aEsCFuj4xlVz
         qbh2joV3un89AruoEbDj3yMD4/3XGU6LjwWIInzlJeuEifHtLvRLW5zC+EeG0IviNBfK
         9lNOLlYK3aSDc94bYBQw6B2ValoQeME9lpK59rGClCP6NKQjvu+bNAYIBLmXKWSQIhu9
         AQQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752263247; x=1752868047;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zGYKU8oEStLMY+WKb4utGxIDZo++9HKS8iEvkqWqbZk=;
        b=noIG0D2JzNLUNAjiXVEEa0kxEPtw6yJHDFsp0kmr+QOejajkiUoJFTBDJATNJw08z/
         bKWjmCXb+/b7DRDI8ZBr4RvyabIduDssJLna81d0TTXGLGji1p1kMK1+ZeXPhOvnvgw4
         Vm5ZlzHhloFWJZBdDs+SphqWDdrcKncx4Md1RJ1LaAm2+XSQD6/NKCazX8LZMHrqAM8I
         qF1hlUfHMb99K/Aw5WiGXMy/MyihBQMgebsiQaWtbpluxLm/gzwzmkCBnwhtnniCngIS
         eCKwi0xx2SMHH5qIqYFKK1hEUt4JiowRig9YOduHqSWS7mPLcCDi1izUzaAyGXB8BGJv
         5KsA==
X-Forwarded-Encrypted: i=1; AJvYcCXGfDmJwtNDNnynVkRRPg2F/J5JmroQgbopJThbmLU/dYKWsTtWvVoQkd63tppkeYAWZxNDUo7xQCmmxA==@lists.infradead.org
X-Gm-Message-State: AOJu0YzFQ+wKzw7bq5kDG2cK/QRFaqTKWqSbOXD3SYb8rwfSxcQfweNJ
	TrbLl3dHrcvuzgB7qgJ+PlJbGeqtVhJ1GKQTGYBzycvXx/uV1sXlx5+zT2GAdgq455Q=
X-Gm-Gg: ASbGncu7IKXfYAk+CePIsYc8QM/+0Og3j5PvmOckD5SyYlkfvvv7z5lKNpYuxV9LJTy
	hmHOgMcGyX9am94cgfEGHujiO/81iai8RCb3vXnER8n/lOnfdOhfl++mBSBDEa2ap/WupaA/+an
	Fv31/oveGC9gCGa7bsaziBTxTIe9Hddex2r8Lzh9aT4u9utbjWsrUkVYT7VRTh7AnZnGisktiEA
	PT6vzYgsRPm0BMd2dXjNWwAyKGLh5ln3oQyXGcySEiukwmnP814dSeyEgvmBrh3icBHFyLngNLK
	tS+kA8/zmvw+9AvyyR5Msn1aEArup6BuygCF+yzmuiN73kPvBI5i4FSDAOs/ANU9L3RmOM/nnRH
	7hFrw2qe8sqZC6uNSoxFIvQDKj98PHP7w
X-Google-Smtp-Source: AGHT+IEsEqGjrDeW2X9G2yHiapVhyLhkS/QI4B1UlMQoQiVgeLmn2Nt1VUXQjuYKd+UB5h+FQa/Zuw==
X-Received: by 2002:a05:6a00:1994:b0:748:68dd:eb8c with SMTP id d2e1a72fcca58-74ee2d510ecmr5840604b3a.23.1752263247480;
        Fri, 11 Jul 2025 12:47:27 -0700 (PDT)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74eb9e06995sm5840977b3a.38.2025.07.11.12.47.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Jul 2025 12:47:27 -0700 (PDT)
From: Deepak Gupta <debug@rivosinc.com>
Date: Fri, 11 Jul 2025 12:46:29 -0700
Subject: [PATCH v18 24/27] riscv: create a config for shadow stack and
 landing pad instr support
MIME-Version: 1.0
Message-Id: <20250711-v5_user_cfi_series-v18-24-a8ee62f9f38e@rivosinc.com>
References: <20250711-v5_user_cfi_series-v18-0-a8ee62f9f38e@rivosinc.com>
In-Reply-To: <20250711-v5_user_cfi_series-v18-0-a8ee62f9f38e@rivosinc.com>
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
X-CRM114-CacheID: sfid-20250711_124728_267025_F3810A86 
X-CRM114-Status: GOOD (  14.46  )
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
index 36061f4732b7..385c3d93e378 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -1161,6 +1161,27 @@ config RANDOMIZE_BASE
 
           If unsure, say N.
 
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
