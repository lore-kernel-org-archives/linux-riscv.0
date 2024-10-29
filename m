Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F58FD7494E
	for <linux-riscv@archiver.kernel.org>; Tue, 29 Oct 2024 23:44:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=b9Xjs2ErQOge3eC46v8DWjNy73kbDL0rlnkVaS8yTo0=; b=NZDNtIcf+KtEob
	tpKm17I58I0zOF+/fwzzLFWS+gMuMIdtrQiEnqD7orjA6lZUvNOwoHvdLRNpU2nuEcW7cp5A6mcaf
	TLTwPqoxJggA5zVjbixVfUKdsUKrkm5AQmWQ4TNMOWfi2dym4gszPUbNXxx3A1xcIJsI9ozt4jjXa
	GdENSgiSVI0ei/wMIb9xeKGktvyKo3p73xrj2cQEN2uZpoW2zset9ZqDu2zKh9bbLJMliofe8etVu
	6LQzAzHciGaFyrUMwlZ2JntEGxw0LoD8E3dmUCmQ3tEdpXRcgApvP2454i8nVsXNDXRdlX5sRjrHP
	h6ZwFfJFb4SbYiF/nltA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5vtE-0000000GDXs-3gDG;
	Tue, 29 Oct 2024 23:44:44 +0000
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5vsz-0000000GDJz-3q26
	for linux-riscv@lists.infradead.org;
	Tue, 29 Oct 2024 23:44:33 +0000
Received: by mail-pf1-x42b.google.com with SMTP id d2e1a72fcca58-71ec12160f6so4359553b3a.3
        for <linux-riscv@lists.infradead.org>; Tue, 29 Oct 2024 16:44:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1730245469; x=1730850269; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lBYlqLcHDdUtNQoLJCRBG8R/P8wZP2gIPf6gwWr372U=;
        b=SK+WJH5kTRrVV2iCQsNbRH5SBqrrS1CkSA39+/1OEGQr4dMCfb9fymKi4TUvzFt3xC
         12fpu80wrA1BEk8UMlRiH8Q1qTvV1apR1BmjA8ApsynD+yuXWr500I3MYsjE8mFylCM9
         liyCGIKmlFiLuH3jyG3o0oaqAf/nifpOpmQCmGYBW0A/Zu/+i7eyfTiXC15qK2PiPXtM
         /IXEdepTMzxoLIidSf6xdp8fRWdYIiUAwqC5Qly8Ots/bT/bgNH65LThUr3T/T+pInsn
         gKwmR/gIPORRAP9DetFeJGGUXFsqVI2Zz+EpUjZxTXtvB3z7vCaMd6e9t0rCwhL2ZgWx
         ZN8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730245469; x=1730850269;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lBYlqLcHDdUtNQoLJCRBG8R/P8wZP2gIPf6gwWr372U=;
        b=BM2txXg4tjWFZX2V0yXJ/0VhnRwkewTRMOdnPiHQNAnTbjAVyCRHN2pjGBMlP83TS8
         4fOeorkXdLDH8khGTtabZGXtlSSiu0OYyCLnGlH1kiRCDPK7eIueQWR80gwF2c86HXS+
         CRWJw6tXZRItdYrOSnRjpgsr1Nom9tcFHgUi+0bJeH2z7H7v+eKdFifW+l+bn2Ih3gCU
         oDn6S/foPIyiPTLUV9ASBx7Sn8ti2hYwhYhXA2MJhanMLyfJxPP9z4QTrkf41bz90+GN
         0Kwt1xjwZq1WprVHgDnmmQqBHpihvP7l3LSteQXd4uqfCSsgFJ0TsXE9g61VpX4gz1hx
         YeLA==
X-Forwarded-Encrypted: i=1; AJvYcCWhHdTA/FnvAv35kwSr9WL63Nj758DW9EU8OJZgnVjkAOM/Rd9C4yyRddFZijxgKs1BS/shU6lPYamS9g==@lists.infradead.org
X-Gm-Message-State: AOJu0YydhnXsVCUHGEKi7Sr8CLMYgJUBVxdLK9vOl0+slrd94cieaS4p
	zQIZOWs3vwQ1n70AoUNjqlEMkzVul5m9iDSJh3wdt0KrL0rdqS6zS/ptz4vaIro=
X-Google-Smtp-Source: AGHT+IELZ2VSZVfVna2i/qkCG/IWw0r7P7GSQ8cnF6JfcdOHDu45D3ZJHWKDe58LG2WiYKkWATRH8g==
X-Received: by 2002:a05:6a00:10c7:b0:717:9154:b5d6 with SMTP id d2e1a72fcca58-72063028d41mr20002790b3a.22.1730245468803;
        Tue, 29 Oct 2024 16:44:28 -0700 (PDT)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72057921863sm8157643b3a.33.2024.10.29.16.44.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Oct 2024 16:44:28 -0700 (PDT)
From: Deepak Gupta <debug@rivosinc.com>
Date: Tue, 29 Oct 2024 16:44:05 -0700
Subject: [PATCH v7 05/32] riscv: Call riscv_user_isa_enable() only on the
 boot hart
MIME-Version: 1.0
Message-Id: <20241029-v5_user_cfi_series-v7-5-2727ce9936cb@rivosinc.com>
References: <20241029-v5_user_cfi_series-v7-0-2727ce9936cb@rivosinc.com>
In-Reply-To: <20241029-v5_user_cfi_series-v7-0-2727ce9936cb@rivosinc.com>
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
 rick.p.edgecombe@intel.com, Samuel Holland <samuel.holland@sifive.com>, 
 Andrew Jones <ajones@ventanamicro.com>, 
 Conor Dooley <conor.dooley@microchip.com>, 
 Deepak Gupta <debug@rivosinc.com>
X-Mailer: b4 0.14.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241029_164430_245578_9632A984 
X-CRM114-Status: GOOD (  15.30  )
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
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
