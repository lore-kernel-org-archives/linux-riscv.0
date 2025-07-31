Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5ADBBC87FD3
	for <linux-riscv@archiver.kernel.org>; Thu, 31 Jul 2025 23:21:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mdUydf/bnlY0I9SgBYhMLYmB++7KoomIeTZReIMkgjQ=; b=QU4HueMjG0+pwr
	TUo+BUY04sI4eW9/w8D3mEaH0nvY2agiikQFNoJ+NmGLwvN457+VNGw6L0LLdIWtQ6gV+RT5uUGxc
	g2tipcJYEg1uhI6dJkPPOnyr9SqFEKiF5aw6NEWH/zMwFoonH4IAfsOs9EynTlpnLBCvv9AuxC1Lm
	xebsWKGMnRiU889IWVBHWwcvq54zaLv0FaJJ+0zxaMGn+wsM9zNYgsFUmmoGmDeoljzWrcrjVFfjj
	VmYOOpXCMGansk3C+uP38MScUsA7BM5HFYggVZn+TA22SIfzubtI+PC/0Olzg7+pV93SVdxsAgsRP
	3Xfy6LGGVyytp/d/9wPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhcaH-00000004cez-3ThL;
	Thu, 31 Jul 2025 23:21:13 +0000
Received: from mail-pg1-x531.google.com ([2607:f8b0:4864:20::531])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhcZc-00000004bma-3TbX
	for linux-riscv@lists.infradead.org;
	Thu, 31 Jul 2025 23:20:35 +0000
Received: by mail-pg1-x531.google.com with SMTP id 41be03b00d2f7-b423036a317so646704a12.3
        for <linux-riscv@lists.infradead.org>; Thu, 31 Jul 2025 16:20:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1754004032; x=1754608832; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zGYKU8oEStLMY+WKb4utGxIDZo++9HKS8iEvkqWqbZk=;
        b=XvTLUxpYbcGCmVleIGNcdzPRYADgxC3cII/oM8Y5XLf0PbfiWNJAYXEfOXKM6iLvB2
         YRV1V8Chbc3FCWMEpriKErLny7UvUo1Gipnh93eSC8ZKkZrWvqLbyifHsFqIIyI2WggN
         qyF6gfZipvXmQRR39gIIJpZFecORmVxEhPTiOzEzm5+6emMxBAq8K7M/hV6GAfMhbPMk
         piAs5TGpuBbJlKZJZBSxx5wsUYWYkXJO4MMoTkJEp5AdhzzllCscqduVuJnzU1yv7CdH
         uTAFUi3WJ88pXE4zKMGGf5++gHTMOcHahhkfceNGeQPw4Klt6pOYPRUOxkcudVyVBl9/
         8t6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754004032; x=1754608832;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zGYKU8oEStLMY+WKb4utGxIDZo++9HKS8iEvkqWqbZk=;
        b=Ab/XuRBVwmPET3CYcfJbjC6XjIwj0mrlMKR7bA2jkf8v/18yqxSzBv4nff8MmO7V61
         w5xVDd+YrhhFmepI8gpxaPU3D55lBWE5e7dVF24V2ydlIwzWHfXSr5SvjyYCMEn5gOaz
         V+lRdEqyGSHB3a5ZAYZoGQUY/BxohmXRQCCe74eDe2LIgthyB9oa1O9vZ/iqIVDqOAMg
         vOyLerqkHxMbcB9Bv7mxhhex9mI5VETszSttFqr5fvHZk5QoCe2hU4CpWOIy6YItGH3n
         50VVB2FXB/DMhjPoVybzQF/A5isdPwGRpqdhxqKH2FkAxwnFYwAa1od1kr9PKSq57yAF
         rrDA==
X-Forwarded-Encrypted: i=1; AJvYcCUzk+QlPtYxzqv+5V+HieBHFkFV7xhp8JJopl4WjqXZNFW3vxsUFULyuv8H08aAOWfkVBAFWmE04kSbyA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yy8CgKA7o18zp5hQgKzyn+lZFBDDPjzrLj23zLEJqugfE/jnk1K
	E2m/OqlXj4bYuPebPANsdzFJYSfL5H6BLYxqPfuRYpSURNy/XWTpasOecPgRtoe3w+s=
X-Gm-Gg: ASbGncvxwOplKS8cP/V+Jhum2ncCpN3XIpdJP2k5lqeYrUAqyO4LNxgQ0LNpR6a27BV
	4bGiq5LePTIypBF8vmLsbV21WFIuV5lXUwgqdK7BMZCfzSqFhYojS4+aDv/LFaxpo9NGhdsvhBL
	c6oOvayATCWOCwn6eAXssFKF6XPPatTkgzPQsJbarSDwP5xuAYO3WbOZO8MLKpnUInuJ/53iRpd
	pzcAH4HYBvtr1Uv961negIXxDbNgtXLieZj47FhXiSZqk4gxC+9XmOiymcNQZZQ7f27nuF6zGv2
	Pre9adQhq3wKWRdMZq1/93cIViO9zZ1h0JpHf1WN0aaXgEkC8QO2YS+aiCH5rmRBZwKovaCI5d7
	bIMyyojHYJYFN54yjekqFdRaN8LolN4HW
X-Google-Smtp-Source: AGHT+IEBs7LutVwN0PKX0aA2mBtgJYhvV4n145Nel5M/EJeFypNMhPK9pJ6ovYsY7ICv3krp+mHrVw==
X-Received: by 2002:a17:90b:5826:b0:313:2206:adf1 with SMTP id 98e67ed59e1d1-31f5dd6c4bdmr13449189a91.4.1754004032001;
        Thu, 31 Jul 2025 16:20:32 -0700 (PDT)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-31f63da8fcfsm5773085a91.7.2025.07.31.16.20.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 31 Jul 2025 16:20:31 -0700 (PDT)
From: Deepak Gupta <debug@rivosinc.com>
Date: Thu, 31 Jul 2025 16:19:34 -0700
Subject: [PATCH v19 24/27] riscv: create a config for shadow stack and
 landing pad instr support
MIME-Version: 1.0
Message-Id: <20250731-v5_user_cfi_series-v19-24-09b468d7beab@rivosinc.com>
References: <20250731-v5_user_cfi_series-v19-0-09b468d7beab@rivosinc.com>
In-Reply-To: <20250731-v5_user_cfi_series-v19-0-09b468d7beab@rivosinc.com>
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
X-CRM114-CacheID: sfid-20250731_162032_906575_938EAB57 
X-CRM114-Status: GOOD (  14.67  )
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
