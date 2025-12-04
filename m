Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2C29D2A524
	for <linux-riscv@archiver.kernel.org>; Thu,  4 Dec 2025 20:05:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=K05qrPZEWKQr/expf6SKqdobhGqv2wKeMttTWnHAuFU=; b=rWSmczyl+LBKsK
	cyZ5KWvEVsuC80NwkFBizfkK+/ku+DvcF0xiwcJxGFYHILkXy2D5IljbSw2FVxA6bn/5zchSvKlZU
	Fcgkf55YD1IRmT7IVHFisXlfQzY0cI0wEOoDXQxVSnWXrgEtzbQyJkPOa3vVSj0UHOzeh72DZABbt
	TI/fYWR7SbvgJyd3qHVlQSSpfqjuQBLDKrGqmI+yU4DYqsUoc3SY5bbSOsHOsrwhnrdYdbwQpyNk7
	WRjLLqOiXEoYAJPYfIyiPJUF7IxpNHSIf/4K89b9szPeCQYuHddaj6PyUHmrbavN2oMBNIyaDCpdd
	A1GwlznMudp+6r2xhNdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRFZU-00000008ZNH-0hAw;
	Thu, 04 Dec 2025 20:05:00 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRFZS-00000008ZHC-0mDW
	for linux-riscv@bombadil.infradead.org;
	Thu, 04 Dec 2025 20:04:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=uR2ANK1p/GtJMLoYkqluiVL+IiMuKNKdjgHs5HSKwC4=; b=MFDw1btDwH/WCThz70edBHIRVd
	xLuLLYuI+w+INUjNi6AIXDXVm6iri+YhPtJNhtEvyuJ2et4rlzOBzZlZ2bHpeOx5XwWL63u/4Unqy
	1YZQjTVRKONGQvrkCw+mgTDJdJh0asBYpphFXLP7OHVXIB6dZWKVUS5vr7771WnCDNmpTxoU8Osor
	gngQfs2W9tQ7CCP/q7pPz66+ngAqJSi+8cSryKPA+Jt4tvtF60we753aVH0/STgL0/gpnPnLcWBZH
	ztCXE/oGsIp/17xVnysxAqqjU6jOkauRaZlZy7E/mMxIIZVlxC3cHmB8YkVrE0C7iOmtbdEWnBYjN
	5Wvpti7Q==;
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vREhn-00000004n84-13Yo
	for linux-riscv@lists.infradead.org;
	Thu, 04 Dec 2025 19:09:35 +0000
Received: by mail-pf1-x42d.google.com with SMTP id d2e1a72fcca58-7aae5f2633dso1542826b3a.3
        for <linux-riscv@lists.infradead.org>; Thu, 04 Dec 2025 12:04:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc.com; s=google; t=1764878689; x=1765483489; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uR2ANK1p/GtJMLoYkqluiVL+IiMuKNKdjgHs5HSKwC4=;
        b=flqSSJ6njeU9eoX/WswWjeRBhpIedqCR1pxyh64uJ21XU4jOtbkJJjzO/v8CH8e0oR
         PBR4QsEISLigaOUoMb5cTiCdUaUi/3Dbbckhz+RfbkRjFBJftYA64AHQQaYcIpoGxaYC
         srYf1cl/lCynmLbaTiHZeyWS7NIsvhUnrcK+XYs/7FjSh9T/zcWzB4E/kkW7qR1oIz6e
         0c681jCav3iN+XIusmGdmWWXsPntNMS57QXf7TJ1dmL0mSUAn6M3ZhHMNdIP+q2PtnGT
         NCAtwFsCX66U1AxiBPUjbspRl+b5N4Qeg7QQjw/bJ3DOS8Ru/Iv6ec+B+nYePgUbAn5Z
         AvRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764878689; x=1765483489;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=uR2ANK1p/GtJMLoYkqluiVL+IiMuKNKdjgHs5HSKwC4=;
        b=w20w5fWJGwW6s6qlTYug+kFo7ZCud/HqVmnyOHfucmmmzquQvGdwNZjJmkjB7Z3dhZ
         KL2W5hgzLQ6tLiereth536l21LNEX9iLQXSrQeiqVXlgEQPfAama0h/gGKwmCIMBhdfl
         GNF+gL2X3vUQhO2qwOJTT4FSZzXcLKQJpGJ5PHX1dpTbeJUIv2quu83USE5IPhfEE50I
         nXciXwroYKUT64/Sz4/VkJtriyXNEPE0iUVydB+KdcBZktNeOIHr4HD5khQcf2BIoIpQ
         sR+0oaSJknA71TDy3bnjrfOqj1o01Yff+RAVENtWS9UarvZj5Y1iOkfJaXhvglKfMSk/
         X5DQ==
X-Forwarded-Encrypted: i=1; AJvYcCWl6dkIcpdga/tCeVXgbXPPGojBWR4DGQwoExpLQvntwkG2McvAK5Q3CuzMLsdZtAhJxTiz9HL8zVz6tg==@lists.infradead.org
X-Gm-Message-State: AOJu0YzEbCGiIUgAivYJcFy/eQhxAFVPGCDv9t/qyeGeTmrAaPlZrdHv
	Dawq3avBNCX5SH63PopXM5OM3Ab/empA9rzD2B17dHucrTccqwPdi9ZisgttmHcWwuc=
X-Gm-Gg: ASbGnctzqY3g0QQamq0F8hH+AX5s9SnmEluaRs1K/HGluldgpF5zXtqJfjwCgbOXf9v
	qanKFE98yZRrmIObXl6YyQKNw9IcWEXUpCKU9L130IKPGycySu0qCErv/oXX2vo9cgUV6CwpwDW
	Zm6Eii/X++aqGk6EmFoASvj3shex/Ve9SkRBX4BitpbQ8AJqBZah+eq2O+H8FgGP85CXt4T4AMR
	xnkY4yFN/CBOq87gvG9nTfhEPczN/JihNEczarMV6a5wRtvpNR6wH9SOkYHwff9Bk/O2mB+L64T
	kFbj6+0vohYI6pw/eS5aFociXYxuENNIFDdY33wt5A9RAphyJO3lBuoswg6YXXgOTd2xTlUwBYr
	2S8xUFfkxI6BM7JJXut69d6mQpz4xLdF9Q4Gp+jYHsnVdEA3GXepFH4cDSJBuYmn6ttPUfGAVhV
	uNK/Nbk9QW5POAuFW8ioNa
X-Google-Smtp-Source: AGHT+IHr9eCZ7OoyJRMHMKZM3eAa0ZLkjuqDEJhukBTDFAFWWCXqX+gcmL/RFs0P9XhWOx4pRyl01w==
X-Received: by 2002:a05:7022:fe09:b0:119:e569:fb9b with SMTP id a92af1059eb24-11df0bd1799mr5495837c88.10.1764878689024;
        Thu, 04 Dec 2025 12:04:49 -0800 (PST)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-11df76e2eefsm10417454c88.6.2025.12.04.12.04.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Dec 2025 12:04:48 -0800 (PST)
From: Deepak Gupta <debug@rivosinc.com>
Date: Thu, 04 Dec 2025 12:04:14 -0800
Subject: [PATCH v24 25/28] riscv: create a config for shadow stack and
 landing pad instr support
MIME-Version: 1.0
Message-Id: <20251204-v5_user_cfi_series-v24-25-ada7a3ba14dc@rivosinc.com>
References: <20251204-v5_user_cfi_series-v24-0-ada7a3ba14dc@rivosinc.com>
In-Reply-To: <20251204-v5_user_cfi_series-v24-0-ada7a3ba14dc@rivosinc.com>
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
 Zong Li <zong.li@sifive.com>, 
 Andreas Korb <andreas.korb@aisec.fraunhofer.de>, 
 Valentin Haudiquet <valentin.haudiquet@canonical.com>, 
 Deepak Gupta <debug@rivosinc.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1764878636; l=2507;
 i=debug@rivosinc.com; s=20251023; h=from:subject:message-id;
 bh=+ngELFAfNSDVPG1dfl4U/GNwgJgSLmHNPMTUuZ2hwrY=;
 b=iBrp1RtTRh5oJZVzaOaeFhva2V5Z1q1JFj7rzOxyzprKnymzoWjN45RvOVAV8T5/wMd+G1JGu
 G1MvETpgLboC+3bOxlsHE8Ns8RB1GZmzEixY2AHWIc1eUxbU9mIcSne
X-Developer-Key: i=debug@rivosinc.com; a=ed25519;
 pk=O37GQv1thBhZToXyQKdecPDhtWVbEDRQ0RIndijvpjk=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251204_190931_398253_41F3479A 
X-CRM114-Status: GOOD (  14.35  )
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
Tested-by: Andreas Korb <andreas.korb@aisec.fraunhofer.de>
Tested-by: Valentin Haudiquet <valentin.haudiquet@canonical.com>
Signed-off-by: Deepak Gupta <debug@rivosinc.com>
---
 arch/riscv/Kconfig                  | 22 ++++++++++++++++++++++
 arch/riscv/configs/hardening.config |  4 ++++
 2 files changed, 26 insertions(+)

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index 0c6038dc5dfd..f5574c6f66d8 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -1146,6 +1146,28 @@ config RANDOMIZE_BASE
 
           If unsure, say N.
 
+config RISCV_USER_CFI
+	def_bool y
+	bool "riscv userspace control flow integrity"
+	depends on 64BIT && \
+		$(cc-option,-mabi=lp64 -march=rv64ima_zicfiss_zicfilp -fcf-protection=full)
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
+	  default y.
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
2.45.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
