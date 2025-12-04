Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EAC54D29FB2
	for <linux-riscv@archiver.kernel.org>; Thu,  4 Dec 2025 20:05:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LbMyC2a5KjckNaC3eMf2AAeLRx5owNl0fRF+3Q6FGN4=; b=nUDVHPYaFE7x3e
	Sk5aDkj/qOK5wn+8ZEmaNuKLE6Kc+9lGV3yoI8X1HiLHFHvn4at7kiYb2po5/WC0kjEyd/ZALMDWl
	Hzzkcj4JTLtwCpuaHXzOanSxHMknlpDuK/l2B5OegOgM5k9Motz/Qg7MVbSIiwkHy5TMNEG7+Z1Bs
	WUFKsreaCsfNrT4fDOw7FJbVwhMxFYVte/d1Y2jrMB3WIQ5zq3ElgUTTz2A56cYkjPCkP2cfo3qAz
	hsLRbdZkQVLf5hYbTDSgnvOlgCiPeLtZx4RGpSykcoyZf+beTZLBMHsOLPJLm75Fuwo1PtzIR6wDY
	GCOBEszPk/2dPhInHi+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRFZK-00000008Z5o-3kkv;
	Thu, 04 Dec 2025 20:04:50 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRFZI-00000008Yzk-0CIj
	for linux-riscv@bombadil.infradead.org;
	Thu, 04 Dec 2025 20:04:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=7RnuI2UkBizC29w22/jrSl2sQbK2qqJuozv4nJOkh7A=; b=WeOneh18DGRGxqYiddrtVm/jmh
	Kq3D+eUZfOLpixLA4uIK1/Exn3AIs1R85rNhnTAvfjj8nuOuXuffnYlaEdURDE/xMb1meuQjnnzVS
	lXflnEStYiePqJ9FjYPLaT2nzIRx5+Vf9sAiSPU1jscsHJpiTdmVbpp+bGOcjWD7ibRDPNlSInoXF
	CjWzbWnNfjxZKV5949UiWMCChFs/VIYVuYM+rTIIsxwX8+XnaM9b+YfPPRCp3DXAfEcKEDOpYyXOW
	QA0ag+0mlL+Ts8SC8k3PDYKV/bOgkUhpNZSfiqA9AybGtNchhSMS/Ksm+kj2RNNHumOZJle1AFqz0
	Rh2Q0Ulg==;
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vREhg-00000004n3X-4A8k
	for linux-riscv@lists.infradead.org;
	Thu, 04 Dec 2025 19:09:27 +0000
Received: by mail-pf1-x429.google.com with SMTP id d2e1a72fcca58-7baf61be569so1643119b3a.3
        for <linux-riscv@lists.infradead.org>; Thu, 04 Dec 2025 12:04:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc.com; s=google; t=1764878683; x=1765483483; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7RnuI2UkBizC29w22/jrSl2sQbK2qqJuozv4nJOkh7A=;
        b=bc3ZEaXRDAWFn6YuK/kaqPdfoV3mvPRHkkL0gQ0jO6XHSpIcgjItI3mZfmSNE0nYMP
         awl12Yu9UGXMblQAbnrUb+qMYlcllAo2JqzrQ/OMu0fjLzMrbtxf/5NfgIF6vu2o9Pt1
         HYF+IQZMzY/zKxFrFpJsvfBb7SFCnY4f30d/LffOEVcB0SoWpNBo7BH+OS7dRy0BhWa3
         UPdxCYm4u6D1sLurUEhhFTg9d9zyjP8+N5W9xOdCx8ccILd6r2J2ZjVJeouCIqCz/5vM
         VW6X8hUez+g9aPBLwLP3VIKhEU6U4ajFtEl1Ha2+Xr1AnUgj/j1ajutBaEiHrWls60F+
         BofQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764878683; x=1765483483;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=7RnuI2UkBizC29w22/jrSl2sQbK2qqJuozv4nJOkh7A=;
        b=ab/BkmmNs/O7gX6s8DvqfCeBAbPB+vo5rV4c68f2cMPWh74jwY+0M6zbhe/1Zy9Cre
         QovV42GA71oYmikWAKgfqjlnhaZ+BtscPzSvoXPloKkxy3GE1QxI9ao7Af2OTW95Mjqj
         /TfqGIkSIkEgr0S6td2tJe0vAXC2FnKGhE0RndRihTkzc+cqqdwq7zznWSSuhLyeXGb3
         3AAw0Z9t2C8BEHR7q3HDFW+TcyAYEYcXp73k2xbkK9rSmpyQRxuXTi9UW717Hkcz/Sbn
         yEZRSI4vKG6TnVmsCx02c7qRa/8TJFYl8TaEB3UjLk6is2OlPMxF9JehdOK/kpxyZDey
         /z+w==
X-Forwarded-Encrypted: i=1; AJvYcCVLiq0aShSsZbXYIaL60Tw/rR5B+fWDWMGxpnC9nowMB5CW0M99baHRI6xQTCA3WofheHsvBooCoJxA6A==@lists.infradead.org
X-Gm-Message-State: AOJu0YyAsOJeHkkiM4mXwZqSVd1Q2hTYjeCSIPQsniHm1IS2y0kMq9jn
	aWZHC4eLpl1N0aG4WkgdX3Dw3GQV0ePbPVX0xS3qM+5Im82CFKe5SkNZOUdvyGHifa0=
X-Gm-Gg: ASbGnctr9q6Bbm/9dUhpCZJ751PD6cCcigdgUWvrFPh3c4XvJv+8U6FLAJAk2s6mNz2
	/6zd7hW/PVo0jzpiQWZ6c+FO1WH4Q0qrMrgY3WWiK2t1UwddyS7jMhtvlPD41fsQfiP6YXZhf0E
	T7jwHEivCwqjTq4MSyk0Os7889dxLewl+TEDstMDhWPJR/D7bBtUNB+63oCJgGPOIsQOCxSr4zN
	augWD3M1rAa+N3XWU/0zVQAm73SJpGq+CZB0lgS1BwWGFduubFF633wElsThXdzqBAqDFADpTzt
	63lLhN0mfS688ac7aUMT6zTRiZZzm8rtpc7pcC0369bpOdbQeG4YBSY7BK9teFCIsf2LbucM6rz
	Sje8JkAh1imfskNGNOuizJAzlKzNBEF4XHQ2j+KN17SA+WrCtQEw1mJLi820xxw6LB9T7T9ApMv
	4kgAZll2lfkGj+sfOTKB+Y
X-Google-Smtp-Source: AGHT+IF16MKXc3hQ084pupi13Dl2urHAgrpT88m6eiVRkvjF23PTTOUeQTpFrtMGdK1aUuGo06V0dg==
X-Received: by 2002:a05:7022:90b:b0:11b:ceee:b78a with SMTP id a92af1059eb24-11df0be1472mr5168873c88.19.1764878682485;
        Thu, 04 Dec 2025 12:04:42 -0800 (PST)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-11df76e2eefsm10417454c88.6.2025.12.04.12.04.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Dec 2025 12:04:41 -0800 (PST)
From: Deepak Gupta <debug@rivosinc.com>
Date: Thu, 04 Dec 2025 12:04:11 -0800
Subject: [PATCH v24 22/28] riscv: enable kernel access to shadow stack
 memory via FWFT sbi call
MIME-Version: 1.0
Message-Id: <20251204-v5_user_cfi_series-v24-22-ada7a3ba14dc@rivosinc.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1764878636; l=2983;
 i=debug@rivosinc.com; s=20251023; h=from:subject:message-id;
 bh=UW9zPS2E4TbdsfJtyu+1aU02XU1fbJS+cjnllb5pNMY=;
 b=WuDcgJ62IvLXPFgLcbkpSl0esymJQ5NG1MpKico0xKW3dN4w1YBch3Z3iJoZAFZASJeAR5ose
 QSMma6B9ys2A3GbTrz8rpZ2vK5fiaUGL2oKnDU3DgoW8pbHwXIyIDhd
X-Developer-Key: i=debug@rivosinc.com; a=ed25519;
 pk=O37GQv1thBhZToXyQKdecPDhtWVbEDRQ0RIndijvpjk=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251204_190925_105831_759136B8 
X-CRM114-Status: GOOD (  10.98  )
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

Kernel will have to perform shadow stack operations on user shadow stack.
Like during signal delivery and sigreturn, shadow stack token must be
created and validated respectively. Thus shadow stack access for kernel
must be enabled.

In future when kernel shadow stacks are enabled for linux kernel, it must
be enabled as early as possible for better coverage and prevent imbalance
between regular stack and shadow stack. After `relocate_enable_mmu` has
been done, this is as early as possible it can enabled.

Reviewed-by: Zong Li <zong.li@sifive.com>
Tested-by: Andreas Korb <andreas.korb@aisec.fraunhofer.de>
Tested-by: Valentin Haudiquet <valentin.haudiquet@canonical.com>
Signed-off-by: Deepak Gupta <debug@rivosinc.com>
---
 arch/riscv/kernel/asm-offsets.c |  6 ++++++
 arch/riscv/kernel/head.S        | 27 +++++++++++++++++++++++++++
 2 files changed, 33 insertions(+)

diff --git a/arch/riscv/kernel/asm-offsets.c b/arch/riscv/kernel/asm-offsets.c
index 8a2b2656cb2f..af827448a609 100644
--- a/arch/riscv/kernel/asm-offsets.c
+++ b/arch/riscv/kernel/asm-offsets.c
@@ -533,4 +533,10 @@ void asm_offsets(void)
 	DEFINE(FREGS_A6,	    offsetof(struct __arch_ftrace_regs, a6));
 	DEFINE(FREGS_A7,	    offsetof(struct __arch_ftrace_regs, a7));
 #endif
+#ifdef CONFIG_RISCV_SBI
+	DEFINE(SBI_EXT_FWFT, SBI_EXT_FWFT);
+	DEFINE(SBI_EXT_FWFT_SET, SBI_EXT_FWFT_SET);
+	DEFINE(SBI_FWFT_SHADOW_STACK, SBI_FWFT_SHADOW_STACK);
+	DEFINE(SBI_FWFT_SET_FLAG_LOCK, SBI_FWFT_SET_FLAG_LOCK);
+#endif
 }
diff --git a/arch/riscv/kernel/head.S b/arch/riscv/kernel/head.S
index bdf3352acf4c..9c99c5ad6fe8 100644
--- a/arch/riscv/kernel/head.S
+++ b/arch/riscv/kernel/head.S
@@ -15,6 +15,7 @@
 #include <asm/image.h>
 #include <asm/scs.h>
 #include <asm/xip_fixup.h>
+#include <asm/usercfi.h>
 #include "efi-header.S"
 
 __HEAD
@@ -170,6 +171,19 @@ secondary_start_sbi:
 	call relocate_enable_mmu
 #endif
 	call .Lsetup_trap_vector
+#if defined(CONFIG_RISCV_SBI) && defined(CONFIG_RISCV_USER_CFI)
+	li a7, SBI_EXT_FWFT
+	li a6, SBI_EXT_FWFT_SET
+	li a0, SBI_FWFT_SHADOW_STACK
+	li a1, 1 /* enable supervisor to access shadow stack access */
+	li a2, SBI_FWFT_SET_FLAG_LOCK
+	ecall
+	beqz a0, 1f
+	la a1, riscv_nousercfi
+	li a0, CMDLINE_DISABLE_RISCV_USERCFI_BCFI
+	REG_S a0, (a1)
+1:
+#endif
 	scs_load_current
 	call smp_callin
 #endif /* CONFIG_SMP */
@@ -330,6 +344,19 @@ SYM_CODE_START(_start_kernel)
 	la tp, init_task
 	la sp, init_thread_union + THREAD_SIZE
 	addi sp, sp, -PT_SIZE_ON_STACK
+#if defined(CONFIG_RISCV_SBI) && defined(CONFIG_RISCV_USER_CFI)
+	li a7, SBI_EXT_FWFT
+	li a6, SBI_EXT_FWFT_SET
+	li a0, SBI_FWFT_SHADOW_STACK
+	li a1, 1 /* enable supervisor to access shadow stack access */
+	li a2, SBI_FWFT_SET_FLAG_LOCK
+	ecall
+	beqz a0, 1f
+	la a1, riscv_nousercfi
+	li a0, CMDLINE_DISABLE_RISCV_USERCFI_BCFI
+	REG_S a0, (a1)
+1:
+#endif
 	scs_load_current
 
 #ifdef CONFIG_KASAN

-- 
2.45.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
