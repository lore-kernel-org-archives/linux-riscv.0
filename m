Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D06E8C35FF8
	for <linux-riscv@archiver.kernel.org>; Fri, 14 Mar 2025 22:51:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HfwZCr1o++6wQX4oCzYvbe49ZtstdNWvKH9+6jGzdyM=; b=gmZxXEBjRd3zqx
	afTGun7CBXfwi1BQ7scnjFpi56GpMb8sglblFev8iiv2+3LDd1qLlrhLeTm29rSkpGlFWE8D0U71Z
	+Yk3O3K//0ygLxJqRZyL6ExQ3sdCuCs4nliKoDaoLov3sviIn7dU3ECFAvKNqOh/HDBktTtQPsayG
	8saOM7/76eNDRStcYpD1eidN2QtL5A8jP7mE2JrR3/w2TFsbsw25aquPA/zucYbgNha41hYbtgyua
	x4nd+uvPn1SHxP4s9aFrCWouPMqLXYLahTB9E1Amamrcyyx23Y6tlSgHoZWLYYbLQ3UnoRBsoDqPE
	7ttIY0CLC7D4PyCbRF6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1ttDs0-0000000FSui-0f33;
	Fri, 14 Mar 2025 22:51:12 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1ttClf-0000000FLLu-2BcO
	for linux-riscv@bombadil.infradead.org;
	Fri, 14 Mar 2025 21:40:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=E9n3/K4KBqR/53b0jV+O9N/MxE5W9V2LBO7V34JU3SY=; b=bFIyQpcscN3PX3BqfYrFmmHMDv
	wCjgsxatAq7FsUjrs/crN9jEq8IsSyVrMX3Dku9TzMupBcNQKKxorpvRiBTTXSaMZmD6JaJUDu+cX
	KhEZJNSXys8KhOJlSLMsWYV0Nt+EziKkiNb4fhOh92+y2Zc/GZ1hMmZgh4JGgzJpNDi+eTqwQYtLP
	AVYXoyt+5ECpLQU0Y3ubawsKx4cblqANC1NStl7TsE/ql8SnUQE0ObzquI1eflwIvXW5ZGWc3UQtf
	tllxYVA1+jTqC2hJx+C+YperLyw523jLZFrM3Y9NTWfth86EL9TMSzf4JSfaOxDICXdlPoPQ+wLO7
	JRgQ7SFg==;
Received: from mail-pl1-f172.google.com ([209.85.214.172])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1ttClY-00000002xET-2S1E
	for linux-riscv@lists.infradead.org;
	Fri, 14 Mar 2025 21:40:32 +0000
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2241053582dso61493895ad.1
        for <linux-riscv@lists.infradead.org>; Fri, 14 Mar 2025 14:40:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1741988425; x=1742593225; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=E9n3/K4KBqR/53b0jV+O9N/MxE5W9V2LBO7V34JU3SY=;
        b=U8ebbZ1XfcVOFw4WnDivAdagE0Iy/K+JUVPNMNNhsUcMAbmMA2P1FG0f6GjYW8VUs5
         nqq4RpiBLQH8kQ1oBpK9PVjPTl30mBVFJ5xp72ZA7miDOE9czd4ytLDZuTtzJA8uLfWc
         qutgjtqf8LV95OEBBcz5CFzTdOAwsx1JBj2bd+9t4eolth0My4QF9uKbV75wWnKKBIKT
         YivzRno2oxbp5AvKgzHln9UO1hM5pd9wZrjWzPwTGWLLc6KgaUgYQHn6dvHD8mTwYtoS
         XC2nFkcg9LGqc7WTk70IS6BpCExm+1+64IVAFb5MB2Y8n6wBPk3igXeXPC3r9yBwhkce
         dEPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741988425; x=1742593225;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=E9n3/K4KBqR/53b0jV+O9N/MxE5W9V2LBO7V34JU3SY=;
        b=nVcY9WLyef2TXRdxQrBDzXjculsoETkeErukny7wpOui51ar5TOCPr+2+C0TQ3DDsL
         /Oa946VSyMJun20Sj1WtLFoqEAWiykfxlop13lHfx7cYBu3kde10sp1b3y13Jw2SDoXo
         zC2YehNXPnXXlQClw3j4SvgZ2NtV1qjv6UTGqY+JzHIvkGEHg+kY82PRJDrO9EmW0um4
         COBpeFBs7OurXPwUmfLybpFH8RhPzp+cx+Jbv4KJLg+rwUorhJUd58WRSy20UTXDE8+X
         0AywH4qFdarbpRyq8D5AP2GjMU1V6P6VsnC6TmzLHLHkc/TAoCdN60p9z8X8VXoWg3TR
         q80A==
X-Forwarded-Encrypted: i=1; AJvYcCXOew/hTJQ0X+nkHuUFmKQeYBKN4jlkDL+KoB1/cYzTXwnhzapJVu7OFSn9Z9To+vHWB9Ah8mqbZDpTkA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yw0aUkGw3cB2ydz1xOQRXEcUhdyiCt2r+ZOw+uh7NQUgCV6AQie
	Xg9/S/qcIBK26o9JXcaX6/0EU64jXJ9fAiUzshPtKHRoz/++Ujc9OHkzHJ8jHlo=
X-Gm-Gg: ASbGncu76g8SwA9znjx4U+e7dP0kpyksI6zpicooRGDN9Lf9Do6oqQhZXXwaIcYm8g2
	FAHq0IaqMiHB1GFnfZy0pj7Ke9KofZ2vJYtk2X7eAxG3rJuVJUtgtV003fsOTjB9MA4CVF+F7px
	F8AQ/yPCtVRssTJW5/P/wNZb1sPMIu8x6caV20d/XKEKWsYuiC9tnAJvaqHHsHAPFmy2M39UdPX
	f9uYl+pDSHQ30Ney2fIqpTV86gXgi2y9Z7UBm8dSa2cdphUNFzMa/N46OODd5Xjy/8wXnupCNLC
	7lU5tI58Oz39aaE174h5FOZj2ZOsW/gldRQigtPGCpVPMGcR5JlGE7L5sOFwfT8Ysg==
X-Google-Smtp-Source: AGHT+IElyciILdjHw/3i0RPFBnjTqOBGsA25cCwm/QkQU1/hQmx1TwMvm2SBws42y5o8HIBP24yMlw==
X-Received: by 2002:a17:902:f645:b0:216:3c36:69a7 with SMTP id d9443c01a7336-225e0b4970dmr65622535ad.45.1741988425325;
        Fri, 14 Mar 2025 14:40:25 -0700 (PDT)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-225c68a6e09sm33368855ad.55.2025.03.14.14.40.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Mar 2025 14:40:24 -0700 (PDT)
From: Deepak Gupta <debug@rivosinc.com>
Date: Fri, 14 Mar 2025 14:39:41 -0700
Subject: [PATCH v12 22/28] riscv: enable kernel access to shadow stack
 memory via FWFT sbi call
MIME-Version: 1.0
Message-Id: <20250314-v5_user_cfi_series-v12-22-e51202b53138@rivosinc.com>
References: <20250314-v5_user_cfi_series-v12-0-e51202b53138@rivosinc.com>
In-Reply-To: <20250314-v5_user_cfi_series-v12-0-e51202b53138@rivosinc.com>
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
 Jann Horn <jannh@google.com>, Conor Dooley <conor+dt@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
 linux-mm@kvack.org, linux-riscv@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-arch@vger.kernel.org, 
 linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 alistair.francis@wdc.com, richard.henderson@linaro.org, jim.shu@sifive.com, 
 andybnac@gmail.com, kito.cheng@sifive.com, charlie@rivosinc.com, 
 atishp@rivosinc.com, evan@rivosinc.com, cleger@rivosinc.com, 
 alexghiti@rivosinc.com, samitolvanen@google.com, broonie@kernel.org, 
 rick.p.edgecombe@intel.com, Zong Li <zong.li@sifive.com>, 
 Deepak Gupta <debug@rivosinc.com>
X-Mailer: b4 0.14.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250314_214030_397681_8FD3EC0B 
X-CRM114-Status: GOOD (  10.02  )
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
 arch/riscv/kernel/head.S        | 12 ++++++++++++
 2 files changed, 16 insertions(+)

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
index 356d5397b2a2..6244408ca917 100644
--- a/arch/riscv/kernel/head.S
+++ b/arch/riscv/kernel/head.S
@@ -164,6 +164,12 @@ secondary_start_sbi:
 	call relocate_enable_mmu
 #endif
 	call .Lsetup_trap_vector
+	li a7, SBI_EXT_FWFT
+	li a6, SBI_EXT_FWFT_SET
+	li a0, SBI_FWFT_SHADOW_STACK
+	li a1, 1 /* enable supervisor to access shadow stack access */
+	li a2, SBI_FWFT_SET_FLAG_LOCK
+	ecall
 	scs_load_current
 	call smp_callin
 #endif /* CONFIG_SMP */
@@ -320,6 +326,12 @@ SYM_CODE_START(_start_kernel)
 	la tp, init_task
 	la sp, init_thread_union + THREAD_SIZE
 	addi sp, sp, -PT_SIZE_ON_STACK
+	li a7, SBI_EXT_FWFT
+	li a6, SBI_EXT_FWFT_SET
+	li a0, SBI_FWFT_SHADOW_STACK
+	li a1, 1 /* enable supervisor to access shadow stack access */
+	li a2, SBI_FWFT_SET_FLAG_LOCK
+	ecall
 	scs_load_current
 
 #ifdef CONFIG_KASAN

-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
