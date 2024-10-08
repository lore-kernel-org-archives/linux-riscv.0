Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93A47CF042F
	for <linux-riscv@archiver.kernel.org>; Tue,  8 Oct 2024 23:45:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LGUkz1gxVjt+irq/D3dGNpAegxf/xfpV45LCzQ2dvTs=; b=Jx9J9GWbgP9G2T
	i/ra+N0Uo4xOfWA3EmtLvqpPhhQpqRxk4Iz1iwIXwwTSG9+pculkW2AVL+1goegS796gMkHRcknjB
	9jGVsONQaq5YIrF00J0NQtTtAzEYwL/D0ze71tnDI8ZB25Ln/U8EfWTV89mCs9v1WpRQZJvryOP7v
	mfTGK60WvgHqb983kSq6a1y1ibqU2bNfZWPlmsVHq66vhLF2qkgdeVWmDkafMST6pRpzb3jCLZYlk
	L1Vu1wf0omtAnMi9xZVWC8iB4pjazL1fyFcGAA3ZBASzStapx1JOE8BQ1MXtmOh0SdKe8m3Eolxbi
	Lf0QMGehvMJ3knX6IgvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1syJte-00000007SEt-1v1P;
	Tue, 08 Oct 2024 23:45:42 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1syIqP-00000007IXf-2ica
	for linux-riscv@bombadil.infradead.org;
	Tue, 08 Oct 2024 22:38:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=aVxR1oWgZ2k5hHFq9uLsQO1od960zXed/8DpSx7GGdM=; b=ULHW0Eekp33pM90ZT6YNxBbllQ
	ZIbvKDEY4rgd04rltoUFNZY0ERuqeFmXfnkP1USveJ8B690jTIuXe2V793l8iXh9tFgPNaSlQKCEE
	uqnabfSQlaKgxEwC0SQH2zsrwfjCUZfBcvmxSVqhoYoYpYciH2/754tmu3A0kJHrgsquHxJGaWAX8
	GaRL3fcrCNinJbZtUtwSd7TqW2RElGp415qcsacs95Mwdr4Z8Y2mdQLUXbPL0I8L58P2Ax/JvnAsj
	SXU8Q69deUfYZ5R+2pDtAtjAbIRfoOLiOeMmr3pE7rhY0TfM6JKeuZDITP5vJ7VoEYiooIdZ5ZyKg
	QKf2DJmA==;
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1syIqH-00000004hR9-1Wpu
	for linux-riscv@lists.infradead.org;
	Tue, 08 Oct 2024 22:38:12 +0000
Received: by mail-pf1-x432.google.com with SMTP id d2e1a72fcca58-71df468496fso3482263b3a.1
        for <linux-riscv@lists.infradead.org>; Tue, 08 Oct 2024 15:38:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1728427081; x=1729031881; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aVxR1oWgZ2k5hHFq9uLsQO1od960zXed/8DpSx7GGdM=;
        b=PTHLwi+i5Nv0W9CpGbywms0UgMebd4dEyuUCwrNH4YGJVzwo0aBPuMhYjjx7h4GBwS
         NEvqDhLmSira2hIdKCJSRz7x2udcBGXCtVPAuidp++HGVRY8pGsllk1lrqr6tQqU83lB
         K5wNitEr6Yz8VANz9LiFUgmQW4sH0sFBGzCH3Pro3y0A+AceZaARB765HgFZf8IaDE84
         N55U/HFJDWyW03QaSadma9G0Cx06nmTe8i7vSyX3U+kHAx55m8RUk+51TlJbscWisBBe
         WZurkta0YL+U+bfTmbOmW+BNqyWvtt6shVNC12ZFsfXHxg07nAaxi6ChkTShhnSCWZAD
         GIAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728427081; x=1729031881;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aVxR1oWgZ2k5hHFq9uLsQO1od960zXed/8DpSx7GGdM=;
        b=iHbLAV7djwTnfmlswvKZggdklh0+A+z/crzmxtO/j+MbyijsNPEXhOdlY+3fpNzut/
         Xbvk7wo+Eehs8Cjz4/5q3UUQ+6DotiuOuchsd9Ta2AZOSI/s0y2tTYyoQAi9xBwODTm1
         ANr6QH/Y4yJswTX1+7+4fbGe5m+VMp3126TFHGVfzDA7G08ybm5SmsRCOSnik7zndTt+
         mCDkOLlGBHPoj1XnT7b/5Trpbdme6hRid8j0TH06tvkXvjpgzJBxaKka0f0pOTXUTxvM
         AzpJg2BxK1MYq7CRWc15V7N00ZlPEcIR6bVR7zNgYs3bGceMo1CpMhyQwHvYhEy399T5
         HN/w==
X-Forwarded-Encrypted: i=1; AJvYcCXj1vGrbHuFwGdMGqMF552mhrsyMeC/0K+GOVYLcUo5zrC+XlyCbxo/vUDabdlmamPQwJPIn6goIhrKQg==@lists.infradead.org
X-Gm-Message-State: AOJu0YwIQX0w9gMMjSyYdh9R++PwIRuGmC4YAploV7okom8Fp12+FkMP
	bfzwzHAwmnGiIYCvkyAvPX9R1OLsdRbcN/5V7CseKv7VgrsFwV6Hm7Nl84STU9g=
X-Google-Smtp-Source: AGHT+IE/RTGphmtify7ZaBGz4r8U96xtkLO6P3lDZmR5UXWHj3NjFx9egQQunrEc3RZFFoV8wwYuqg==
X-Received: by 2002:a05:6a20:929d:b0:1d7:5a8:379d with SMTP id adf61e73a8af0-1d8a3bff07bmr624695637.15.1728427081301;
        Tue, 08 Oct 2024 15:38:01 -0700 (PDT)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71df0ccc4b2sm6591270b3a.45.2024.10.08.15.37.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Oct 2024 15:38:00 -0700 (PDT)
From: Deepak Gupta <debug@rivosinc.com>
Date: Tue, 08 Oct 2024 15:36:47 -0700
Subject: [PATCH v6 05/33] riscv: Call riscv_user_isa_enable() only on the
 boot hart
MIME-Version: 1.0
Message-Id: <20241008-v5_user_cfi_series-v6-5-60d9fe073f37@rivosinc.com>
References: <20241008-v5_user_cfi_series-v6-0-60d9fe073f37@rivosinc.com>
In-Reply-To: <20241008-v5_user_cfi_series-v6-0-60d9fe073f37@rivosinc.com>
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
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <shuah@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
 linux-mm@kvack.org, linux-riscv@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-arch@vger.kernel.org, 
 linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 alistair.francis@wdc.com, richard.henderson@linaro.org, jim.shu@sifive.com, 
 andybnac@gmail.com, kito.cheng@sifive.com, charlie@rivosinc.com, 
 atishp@rivosinc.com, evan@rivosinc.com, cleger@rivosinc.com, 
 alexghiti@rivosinc.com, samitolvanen@google.com, broonie@kernel.org, 
 rick.p.edgecombe@intel.com, Deepak Gupta <debug@rivosinc.com>, 
 Samuel Holland <samuel.holland@sifive.com>, 
 Andrew Jones <ajones@ventanamicro.com>, 
 Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.14.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241008_233809_772062_66D3E37C 
X-CRM114-Status: GOOD (  15.35  )
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

From: Samuel Holland <samuel.holland@sifive.com>

Now that the [ms]envcfg CSR value is maintained per thread, not per
hart, riscv_user_isa_enable() only needs to be called once during boot,
to set the value for the init task. This also allows it to be marked as
__init.

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
Reviewed-by: Deepak Gupta <debug@rivosinc.com>
Signed-off-by: Samuel Holland <samuel.holland@sifive.com>
---
 arch/riscv/include/asm/cpufeature.h | 2 +-
 arch/riscv/kernel/cpufeature.c      | 4 ++--
 arch/riscv/kernel/smpboot.c         | 2 --
 3 files changed, 3 insertions(+), 5 deletions(-)

diff --git a/arch/riscv/include/asm/cpufeature.h b/arch/riscv/include/asm/cpufeature.h
index 45f9c1171a48..ce9a995730c1 100644
--- a/arch/riscv/include/asm/cpufeature.h
+++ b/arch/riscv/include/asm/cpufeature.h
@@ -31,7 +31,7 @@ DECLARE_PER_CPU(struct riscv_cpuinfo, riscv_cpuinfo);
 /* Per-cpu ISA extensions. */
 extern struct riscv_isainfo hart_isa[NR_CPUS];
 
-void riscv_user_isa_enable(void);
+void __init riscv_user_isa_enable(void);
 
 #define _RISCV_ISA_EXT_DATA(_name, _id, _subset_exts, _subset_exts_size, _validate) {	\
 	.name = #_name,									\
diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
index 27bafc5dd62d..b3a057c36996 100644
--- a/arch/riscv/kernel/cpufeature.c
+++ b/arch/riscv/kernel/cpufeature.c
@@ -920,12 +920,12 @@ unsigned long riscv_get_elf_hwcap(void)
 	return hwcap;
 }
 
-void riscv_user_isa_enable(void)
+void __init riscv_user_isa_enable(void)
 {
 	if (riscv_has_extension_unlikely(RISCV_ISA_EXT_ZICBOZ))
 		current->thread.envcfg |= ENVCFG_CBZE;
 	else if (any_cpu_has_zicboz)
-		pr_warn_once("Zicboz disabled as it is unavailable on some harts\n");
+		pr_warn("Zicboz disabled as it is unavailable on some harts\n");
 }
 
 #ifdef CONFIG_RISCV_ALTERNATIVE
diff --git a/arch/riscv/kernel/smpboot.c b/arch/riscv/kernel/smpboot.c
index 0f8f1c95ac38..e36d20205bd7 100644
--- a/arch/riscv/kernel/smpboot.c
+++ b/arch/riscv/kernel/smpboot.c
@@ -233,8 +233,6 @@ asmlinkage __visible void smp_callin(void)
 	numa_add_cpu(curr_cpuid);
 	set_cpu_online(curr_cpuid, true);
 
-	riscv_user_isa_enable();
-
 	/*
 	 * Remote cache and TLB flushes are ignored while the CPU is offline,
 	 * so flush them both right now just in case.

-- 
2.45.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
