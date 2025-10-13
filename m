Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C5BBCCD183
	for <linux-riscv@archiver.kernel.org>; Mon, 13 Oct 2025 22:04:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NyavjuBvF0NsSynAF3ikQaCA5yscjvilqJVuJOqLM3c=; b=ClmcPNYzbVeGk2
	ppft1CaJ7fM4uRAMBp88pgCdu09qYLlaah4MMQSvfatVYmI4U2Oi0McMVplNskyz4iQ88wXU5syJc
	n9gMG9a6mcCnWDTUJeJseYp6zcHnFuI6Iwq1KzmsuAnj8EcD417j1HUNpqG5ViNla8Z2pGAJALAEX
	MrNHDMUz7QsHTV0zZEB7oa6Zze3KyHAVwmQaVPkVOnuIjTU/Sass25Nf03ZDe3kGvImzUzcsvb82c
	4C2Y8WdtS3A0uqyvorVBpBeemZrko+ZETicGzE5V2ViExyyMFVRhyOamf6VGaVMB2xNejzUmSFhk8
	ByErDgtKp31vcMxU94VQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8Qee-0000000EfIF-2ajC;
	Mon, 13 Oct 2025 22:04:32 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8Qed-0000000EfHQ-0lkP
	for linux-riscv@bombadil.infradead.org;
	Mon, 13 Oct 2025 22:04:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=Dbof0LYINd4D+dAMCbCh8LGflH6StFg2c2dYAuc2+YY=; b=N9coJweizkp58wG7ykDyB5NaXW
	7/T903QmvUWRdCeZWa7QQpecXB8kRax9SBGiXeLOpZ/55wEnnB3s2PSiyxKodBlAlA6IVcVdhFADL
	g4+qocyrslwEnYHLjkILYM0YpULJ/X9R34P6LfvAKtlUxqgzAAQ3LkxmZpvDpCGKn2bmba4wfevPp
	e6z6psmzbnvFpIDcZOMaOXL/7QIjSI/w78R4vtHKSgRBeVIAEYLfKluZiEp+b3soFxlGmxV1DKtwJ
	INxfOpT7fk3MwASuuG2DvBpTWn2ICF/ZQCUzgINfgkWrKqhZZUYXV6K6fDiDmsoWXelEL4WEsvoWc
	wPblNNsQ==;
Received: from mail-ua1-x930.google.com ([2607:f8b0:4864:20::930])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8QeZ-00000004g92-2JW3
	for linux-riscv@lists.infradead.org;
	Mon, 13 Oct 2025 22:04:29 +0000
Received: by mail-ua1-x930.google.com with SMTP id a1e0cc1a2514c-8e936be1359so2901245241.0
        for <linux-riscv@lists.infradead.org>; Mon, 13 Oct 2025 15:04:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc.com; s=google; t=1760393064; x=1760997864; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Dbof0LYINd4D+dAMCbCh8LGflH6StFg2c2dYAuc2+YY=;
        b=dhz+q1blYDB0Y134TwHYJoSXzGOodOh68gawac7JZcTg22wQ7Lszzu4iCQ4qk5rBsT
         nvt3oT9ahSH8D7luwskDx+1pDTN6FPur2GvePDaa2QmKsp/xKVQFLsBrT3+xlAq2bryx
         1WBLs6owhNtqdcBOXgiQ9eC8FlU5ABmAGMLFzf7DeFjuik5pMh4WUyHv+7k+wnU7pmi8
         xMYk39aBXg7coqqNXxqvQreLmSt0PRJVQU79OOIOouecZgDU5i78FpYIfhA2fTCS4rkt
         WxxuRic4DsEBW+dREoiGU/Ez67M+g0XH6Rn7XbNdDb63wqA8M30IEacZxwbmdhQbea+l
         cGjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760393064; x=1760997864;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Dbof0LYINd4D+dAMCbCh8LGflH6StFg2c2dYAuc2+YY=;
        b=jK1k9mscxWdw4WGYN1HutHtzG2DAKtrbGBt1zURO4Ya/Q0TEWn4JZzfizJr0X5n2pg
         /eZjxQBT6urDzo0/rBjqOHNesEWsWJVUAMK59dDnaAqSWabIm9iqmYV0XR1xb9O00Q5g
         qrM+GJQgpIotAaE2cMRWdJWsHEWJHo0q14lus6d80R1h8ZRGxpvfCCQiSVbOoW35N62K
         Fv3DbbvJVzWGYBG1j7sshJ6QlZaMEc6IfBngyPadvip+krDmEO6mDWL8HBwwm2u7Qw+M
         oOP4FNr+7Lc0XrHbwqUumHJJQ96stK+Jngrql+d3SfDr/6lVVHwfDqeRTqrEdQe6d4wc
         NBAA==
X-Forwarded-Encrypted: i=1; AJvYcCUv4BjsQeCL00DUp0zuLSEWK89zCh3USPF8WELaM/Cnjv41girzKIPh0u8Herk2kY28TdrSesX6JylpVg==@lists.infradead.org
X-Gm-Message-State: AOJu0YwQx8/5jnNE5lNacvjP1rhxPlgdVbK7Gd7lsKXEnHtYOpmXfJ3B
	/sSbG/Nk7QuqbOfOvqOBiyPF0SACv+/5PV4WavvpfrOiGgID/uzXFPN3MZohyzESrBF/X6CI5Uo
	/NpZ4
X-Gm-Gg: ASbGncvs3xUJXEVLVH8hf8IyXmKtIuvcKxMjlXOXv1lqBFngIAYDvZhEXLYH7mCFrk8
	OHtfen7NHPl3Qikjgj5ZnQWtDNjgeI32DxkQk3EAmrD1n7dNuce3K6XEpp8ujOtAMG0Nq+tA/Iu
	BW7ie7NkuCUrhL9lcBCK9osecWtU9MUwOAwpvW4ucCMpp5ONzJpzgbiiUpFnfsKzRtIBezoCoN8
	JiyADVvJXJOyBT2TL5kerBMyTgduB3U6avfJwCqrNhM7a5A98ubdekg0OZFVXFsAgu1yg+LtVKp
	qELTOz178dpw4A2ii6jK4eq0tyk3UxICfuPmMmM/a6hZb6Oxuc5L0iDq1HYEULJwnTTtih9GI1n
	B3iXvMQTK28BNcSzxCftUuXi+CAIq8SRuLySQZE+J5b1iUbi60CaSdvdkK2/slQ==
X-Google-Smtp-Source: AGHT+IFIgzSXP/F7dXAlqZ2LJnQcYWDmxG36zDHOJJWTPgNoALO0OawBjU2puecWF73352ydInfFiA==
X-Received: by 2002:a17:90b:1d8b:b0:32b:355a:9de with SMTP id 98e67ed59e1d1-33b513d005amr30620659a91.32.1760392614454;
        Mon, 13 Oct 2025 14:56:54 -0700 (PDT)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-33b626bb49esm13143212a91.12.2025.10.13.14.56.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Oct 2025 14:56:54 -0700 (PDT)
From: Deepak Gupta <debug@rivosinc.com>
Date: Mon, 13 Oct 2025 14:56:17 -0700
Subject: [PATCH v20 25/28] riscv: create a config for shadow stack and
 landing pad instr support
MIME-Version: 1.0
Message-Id: <20251013-v5_user_cfi_series-v20-25-b9de4be9912e@rivosinc.com>
References: <20251013-v5_user_cfi_series-v20-0-b9de4be9912e@rivosinc.com>
In-Reply-To: <20251013-v5_user_cfi_series-v20-0-b9de4be9912e@rivosinc.com>
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
X-CRM114-CacheID: sfid-20251013_230428_182028_F253D465 
X-CRM114-Status: GOOD (  14.23  )
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
