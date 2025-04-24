Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DB12C369D7
	for <linux-riscv@archiver.kernel.org>; Thu, 24 Apr 2025 08:37:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KGhhARm7W93I++snyYJqcN6lHwqNCecjaqEKYTQqvxk=; b=bG4ezTKAMGZEIm
	cAYIxAwFHZl3tqHzekSnc43Yy0usdUD6IKFg5zbYjUgHwVjI+1BSwI/DukorHPIScRPEY0o9yH1pD
	MC8ryd38XpC2jkfw8uEJcoZYBwZ871FtRgRgVDG4J0fo8mLErBhT+/abMcna6AHYmsP7AXHC2b64i
	0IB7xRVqtc5ZnBRJJ272SXWub99RClf0hPDQg9n3Te6FJxTJgZvItGAWaa1doqZWc1pgW02z3VP6b
	WYRrmwgKYBiEpLyHbjTAMJ9zGwsIrG8xKatTV0JjQmoUlGEGPJwh8umJfbvgA/3DHhNZjFuY4Ytep
	yXawlkxz1PndhTXUGMpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7s57-0000000DLVN-323n;
	Thu, 24 Apr 2025 08:37:17 +0000
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7qtv-0000000D8OE-14q3
	for linux-riscv@lists.infradead.org;
	Thu, 24 Apr 2025 07:21:40 +0000
Received: by mail-pl1-x636.google.com with SMTP id d9443c01a7336-2295d78b433so7001285ad.2
        for <linux-riscv@lists.infradead.org>; Thu, 24 Apr 2025 00:21:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1745479298; x=1746084098; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cFz+/4buGG21gqDMlIHIpI2LyTeJMnqyc0qHyBDGzIU=;
        b=hKKKeuyxdaNLtggCArPL4w6heShPeSWDA4BqHP8fxiV/NjDzAbpcl27cWGeeFk8AGg
         cmtB47u8WSGQw8k+88WLu+r6Q5q7foH2FmcUnNuDPJCb+Hhb2dwPNWIvp9USChSo3qPC
         lF6SKvSKpYKh1h6wAytqtDtUe/pFQWkfUUMox4Cvf8mAG9l6IGRxKSLJFML5SRxZrpW3
         frqNxDQwkb/CDqDpJfloFSHjFvepoAc5/VkABEnaRNUV1gX/RO5OXdH9ihTq/5/G6Cxa
         dUtgOYE0zGtAt04Oh3ua4ogyUWFm1SQEv4+pHryjh7CWtlGYyslacgA/4MGIs0E/AeeX
         ki4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745479298; x=1746084098;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cFz+/4buGG21gqDMlIHIpI2LyTeJMnqyc0qHyBDGzIU=;
        b=lJWs2PnX20jJI9YmoRNKWT67DKfFpIaY5m0q7ewRqPeVlhentW61CIL4ztbGC8rb0A
         gworgmooacu1nLmL3jYd0NsSx2n5sgphLgdy+XeK5jfPcv2ugdZEKs3qFjVXavNopwFA
         Jy0o9OW5T3A+1dOlSbvkoXW0mEfs4e3YVT8xYAIbEJ5JfrRvTo9lvV274DRwzR2sbc8D
         XQd9r40TCMdLbTlNPBm5hymNWjUIdmDN1gvDiNx/BYd3Aiz6cUzPfswrfVdXQXYq2WwD
         I3iFYI1G18oNk6TxTObhOLCpDzTh1vzL8kzy+77GQE5uwy7QT1q5gZLJZa0xB82z6ed9
         hpyg==
X-Forwarded-Encrypted: i=1; AJvYcCXrfl7EE1wKkC0jIzjmti24bCxoXlzKVRXKOVjboqXEX8O4gytBYpMFlw5c8BzZxm3WRtXSCNhJmmbWiA==@lists.infradead.org
X-Gm-Message-State: AOJu0YzX/+hQ+c6hD5pb1EknvA5zUB6H+kL/8cwT41PQrMdfmzj6pY7d
	fW5Y2FPKDKJEo1tg5XPMAQO3VnJGAdZIt0RdfAcUk8u7d/x8XChFpiW5jvXH2ko=
X-Gm-Gg: ASbGncvBa/muNTpb+HOrO9QqtmAXWvS8OwAVXeiyzR8+cyuw+GOe3Br13Bf5iw6dQfQ
	znpkeKZpjsr2QWE8dJeUXsqAzSC0L/ckY5nICVKgZdOPaDNPuI6b9WjkQGEZquvwCw7baCcRwKB
	Y5ItdllL4l1vbFxIZ4V5sn2858qRg/1WY5vOGSHZYe1QQWw0ZuKsuJpK5EFp4ZCT7Sw6QUdBlCH
	KSVlFwgAtR9E1YMUV6BdLF1axciPO2HTSDXDiERG6WzmmYhHO7KuwGmV86Ug7ViEVhWfvVWE5m0
	98WhiUHNw4d12dsMeOYq7i2lJsJlQ06TMdhfuVbX1BHXe2HI3ss=
X-Google-Smtp-Source: AGHT+IEO8Xd4tVdyUa9PjnzD8nPNNIzaFyukV8ZkIipYXkGmr/TGbVqh3iRHaB96zvxslBoo9AWYIQ==
X-Received: by 2002:a17:902:e74c:b0:22d:b240:34c9 with SMTP id d9443c01a7336-22db3dc845cmr26466965ad.53.1745479298272;
        Thu, 24 Apr 2025 00:21:38 -0700 (PDT)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22db52163d6sm6240765ad.214.2025.04.24.00.21.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Apr 2025 00:21:37 -0700 (PDT)
From: Deepak Gupta <debug@rivosinc.com>
Date: Thu, 24 Apr 2025 00:20:38 -0700
Subject: [PATCH v13 23/28] riscv: enable kernel access to shadow stack
 memory via FWFT sbi call
MIME-Version: 1.0
Message-Id: <20250424-v5_user_cfi_series-v13-23-971437de586a@rivosinc.com>
References: <20250424-v5_user_cfi_series-v13-0-971437de586a@rivosinc.com>
In-Reply-To: <20250424-v5_user_cfi_series-v13-0-971437de586a@rivosinc.com>
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
X-CRM114-CacheID: sfid-20250424_002139_292087_ED1442F8 
X-CRM114-Status: GOOD (  10.80  )
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
 arch/riscv/kernel/asm-offsets.c |  4 ++++
 arch/riscv/kernel/head.S        | 23 +++++++++++++++++++++++
 2 files changed, 27 insertions(+)

diff --git a/arch/riscv/kernel/asm-offsets.c b/arch/riscv/kernel/asm-offsets.c
index 0c188aaf3925..21f99d5757b6 100644
--- a/arch/riscv/kernel/asm-offsets.c
+++ b/arch/riscv/kernel/asm-offsets.c
@@ -515,4 +515,8 @@ void asm_offsets(void)
 	DEFINE(FREGS_A6,	    offsetof(struct __arch_ftrace_regs, a6));
 	DEFINE(FREGS_A7,	    offsetof(struct __arch_ftrace_regs, a7));
 #endif
+	DEFINE(SBI_EXT_FWFT, SBI_EXT_FWFT);
+	DEFINE(SBI_EXT_FWFT_SET, SBI_EXT_FWFT_SET);
+	DEFINE(SBI_FWFT_SHADOW_STACK, SBI_FWFT_SHADOW_STACK);
+	DEFINE(SBI_FWFT_SET_FLAG_LOCK, SBI_FWFT_SET_FLAG_LOCK);
 }
diff --git a/arch/riscv/kernel/head.S b/arch/riscv/kernel/head.S
index 356d5397b2a2..d47876eca637 100644
--- a/arch/riscv/kernel/head.S
+++ b/arch/riscv/kernel/head.S
@@ -15,6 +15,7 @@
 #include <asm/image.h>
 #include <asm/scs.h>
 #include <asm/xip_fixup.h>
+#include <asm/usercfi.h>
 #include "efi-header.S"
 
 __HEAD
@@ -164,6 +165,17 @@ secondary_start_sbi:
 	call relocate_enable_mmu
 #endif
 	call .Lsetup_trap_vector
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
 	scs_load_current
 	call smp_callin
 #endif /* CONFIG_SMP */
@@ -320,6 +332,17 @@ SYM_CODE_START(_start_kernel)
 	la tp, init_task
 	la sp, init_thread_union + THREAD_SIZE
 	addi sp, sp, -PT_SIZE_ON_STACK
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
 	scs_load_current
 
 #ifdef CONFIG_KASAN

-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
