Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0187C54ED1
	for <linux-riscv@archiver.kernel.org>; Fri, 23 May 2025 06:38:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Oz9zwaE066QUrSKx70DCh3sc5XZ+T7Bw3l9Vgm3c2zo=; b=lWQauRcSYa30yn
	g0yudv+ghPsCM6rdhWSCTae70xoj8iljIhS4tIOz5n+Zndld53JJurnPflrpZ4j4QC9du7xvnxGBA
	OoLsIibyXFjpI0D9l0GS2uHeqZdGFohPyKS2r919TTSW5/qzH6oSrBvITB7ff+G7Cd+/rJWAr0Um9
	G/TNLywodUZb+wu92vVC9ugfqbcTAGgamT7WpUKzIN5Olui7Z2OTbS2fDQbtM7dvDASU3/tFCfgIW
	yV7i/c6KlyphJDrOskPIvsMiBNRK2R7BllijiPXyDNKX3m35WHVG3Ly3fRSDyHsGMFhEgqJJLxrK5
	rG0Wkh54cMrk8Qbc3JQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uIM31-000000037Va-3PwV;
	Fri, 23 May 2025 06:38:27 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uIL1D-000000030bo-14tq
	for linux-riscv@bombadil.infradead.org;
	Fri, 23 May 2025 05:32:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=SRVZyg5TbDWDMLZOF7W+PGgxfQ2OnZA5ElwRPiEh+VA=; b=HJLnwMTWkvCpZC26BLrUEjn/wl
	QUDCXg/qryTYikAIbf1T0oJ7ELFBGFeJv1dEgGeIDgYvDWY9p2RzAr4dzcd5JGjMA7r5T8C5jxoyX
	MTghchR2yfHQgg54UAuVAmI5Rkh+vDSIlQNVjijj1lp4+/LETkacnwA2gOnoEN9HPs4GCBSLydPbf
	ga0KgilbSSaJH+V7NQKH8lcI/21ZlXXC7QnSkvhPuI8KacPs8Yg4pPawDnTAOP2v5xujJtOm3hJHX
	7hak0Uh9SFeTDueoAwFOglogCbTPsS+W+pgtGImSSoVk9hyeFUZDk3xRMoF0DCF1swOWWQNn9ZucF
	7RVZoPEw==;
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a])
	by desiato.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1uIL19-000000018qx-0O3F
	for linux-riscv@lists.infradead.org;
	Fri, 23 May 2025 05:32:30 +0000
Received: by mail-pf1-x42a.google.com with SMTP id d2e1a72fcca58-742c46611b6so7380540b3a.1
        for <linux-riscv@lists.infradead.org>; Thu, 22 May 2025 22:32:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1747978345; x=1748583145; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SRVZyg5TbDWDMLZOF7W+PGgxfQ2OnZA5ElwRPiEh+VA=;
        b=0h67SxoxqCiIrJ84ZMNNBONYf99DNBHJmv1A23KQMNPFPcf9CGXwBrtplW+VrmwZKH
         vfJhhAhioaiSN+wacdWOSfAQJ+L1pdFLjEQub9asf2E1ANfdJVAsShuwK0HkQmmOKjR2
         GiB92cW4B0Gg7esAua5p+uT/HX8sWcRpQ9JaV/JmIrJp2KbXRSFtMLT91c7LOfrY82Ph
         6eicPs5OdMhqpyHOxuDf3T00JS3M2fOPTci40f5d9T6tBjdVGufEqZclU3nu/W05GfrI
         dG6ly8TIibmzof1ooZ3hpXg8yIedzUdTiyU+K9uSgOQ2xd1dY5TqQcMwS8RI+vc2UsXm
         KeTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747978345; x=1748583145;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SRVZyg5TbDWDMLZOF7W+PGgxfQ2OnZA5ElwRPiEh+VA=;
        b=wxAyz5+q7DryCAZnoSjaEAZc0BWjjfjxF1KOCfUuFclS7lrRnTMlVDJwZH3N48l5tJ
         kSYfiP/DN9TquHe9Qd/nAgil50tZY+eNIF2oq1He6w5pcpCE1qiFvFPS5Vz5RPfzMHeh
         F6o+p3zNCud9cgnnxnjR/EnAdDstc/Fi3iJEm9/K7EWwWzzmAei3n9j6N92mrLx+LZRE
         uPRmojy+LDx2OXaZH279YjHdtK4UElKA1fkcMLb8PTwi4C6LeD6VNdyjMa6VNou/UQpG
         CUlBieRKybhqo//BHf3D8mh8k7E8liDW5LkjmCRyyMTdYOJIpgLWO7Q87NGAv6CZO+d7
         kV8g==
X-Forwarded-Encrypted: i=1; AJvYcCVJdWX6rD4V2Vg/ZuzPoxuZ0NAXEJ8ZUdjo0z+GrI5lVy8u866dvOV87ENFEDuurNik3ZF7CejbwwRpYg==@lists.infradead.org
X-Gm-Message-State: AOJu0YyrxydSR3UQ4NakyMnEEa5CmGOEVzM2UuAdB3cNOT1Ay9DHwDY/
	5U8B8alW8WlHYJPv1bH2oYeoFqrjUkV1DkPM+4mo3VA7THpftZdmLeZvk+IttYwJG24=
X-Gm-Gg: ASbGnctyJQGzUfkZomAAC23DPM52aIpAGSpuoYGIn4kCqzXzSx4NwZSbMkIHfwgMfPv
	rhYh8J0MhQkBygDRmFcGujRCKp+F1uk1Sr+t4Ko30XH+jdS9X9o3FYXc5M8lH+SHj+5HqJx9gWR
	xk6YLgEEU802ukZkO0Xeo3UaaQyqjMSvG2h97px1fwOg2UHwd1wed3GPA3DsImb3AagPs6glm2H
	uaSy4uJ/ND7lEkJMthTF0nBkkzva7hvE/VuLdQ2qvLv8kgXLndAwyBy2z1mKYmrqJDTGoJAnunp
	CMWXfcSqPGFpAj/EQZJZ+R9HOFKLEzllhiP9Wt9+9Mj2wj8KXfI4ElNHOQ3WIw==
X-Google-Smtp-Source: AGHT+IGgDsB+8A3CR4+XkLmuNbK4RRzT3we3lC5k1xa9cQRvQgCx14SHfbPxiY0t9umJbxGQZcGV5Q==
X-Received: by 2002:a05:6a20:cfa2:b0:204:4573:d856 with SMTP id adf61e73a8af0-216fba27c2cmr39932928637.4.1747978345559;
        Thu, 22 May 2025 22:32:25 -0700 (PDT)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-742a982a0a4sm12474336b3a.101.2025.05.22.22.32.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 May 2025 22:32:25 -0700 (PDT)
From: Deepak Gupta <debug@rivosinc.com>
Date: Thu, 22 May 2025 22:31:25 -0700
Subject: [PATCH v16 22/27] riscv: enable kernel access to shadow stack
 memory via FWFT sbi call
MIME-Version: 1.0
Message-Id: <20250522-v5_user_cfi_series-v16-22-64f61a35eee7@rivosinc.com>
References: <20250522-v5_user_cfi_series-v16-0-64f61a35eee7@rivosinc.com>
In-Reply-To: <20250522-v5_user_cfi_series-v16-0-64f61a35eee7@rivosinc.com>
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
X-CRM114-CacheID: sfid-20250523_063227_317343_50FB55A2 
X-CRM114-Status: GOOD (  11.36  )
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
Signed-off-by: Deepak Gupta <debug@rivosinc.com>
---
 arch/riscv/kernel/asm-offsets.c |  6 ++++++
 arch/riscv/kernel/head.S        | 27 +++++++++++++++++++++++++++
 2 files changed, 33 insertions(+)

diff --git a/arch/riscv/kernel/asm-offsets.c b/arch/riscv/kernel/asm-offsets.c
index f33945432f8f..91738394f834 100644
--- a/arch/riscv/kernel/asm-offsets.c
+++ b/arch/riscv/kernel/asm-offsets.c
@@ -514,4 +514,10 @@ void asm_offsets(void)
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
index 356d5397b2a2..7eae9a172351 100644
--- a/arch/riscv/kernel/head.S
+++ b/arch/riscv/kernel/head.S
@@ -15,6 +15,7 @@
 #include <asm/image.h>
 #include <asm/scs.h>
 #include <asm/xip_fixup.h>
+#include <asm/usercfi.h>
 #include "efi-header.S"
 
 __HEAD
@@ -164,6 +165,19 @@ secondary_start_sbi:
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
@@ -320,6 +334,19 @@ SYM_CODE_START(_start_kernel)
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
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
