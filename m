Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59500CEACE8
	for <linux-riscv@archiver.kernel.org>; Tue,  1 Oct 2024 16:20:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BOeGoOcctbD1bMNicS5cCZbrdoDWYFVCnwzCpnwZxbs=; b=2RygvR3ZSpE1FB
	QPVGJvF2wn1Jp0kkAiqMAiR3xLT4fdBs4nquvKCVCe1T4bHbm7G2GP4ztSLvPwLQPocIvSV1m0V+J
	C5bd1lVU4Fs97aNnsnepMr7YFKxQZVQpsQKLAXgxfLlghbaFHkAo4zM4IXDpnbhPOC/x4xcKPnjVY
	iYTethn7Ri/WcBQCiEz2Gh9xav4vMrXaYxON1XmHA664m/EcOdIxAilcluevh3dpjNBFjORs7hN+d
	/ZDm/fTOfFujZRc5fxcZt/AwO7/RSv5NtFbwgFWt2MOFqFb7+oU6NH2Mg1xYllvc/cJ6S7GxlK4bU
	TbdyRR+g/+fU5YjkoIcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1svfbZ-00000003VPD-2koc;
	Tue, 01 Oct 2024 16:20:05 +0000
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1svfP7-00000003Qu1-2z3o
	for linux-riscv@lists.infradead.org;
	Tue, 01 Oct 2024 16:07:15 +0000
Received: by mail-pj1-x1033.google.com with SMTP id 98e67ed59e1d1-2e06acff261so4203813a91.2
        for <linux-riscv@lists.infradead.org>; Tue, 01 Oct 2024 09:07:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1727798832; x=1728403632; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FOwX8zEWq9u2vqkDVwGK82xZureIgOdXeRz6EPpdBWc=;
        b=igtJwrKXI9jRISY2TEoOn0l+IxkYDEf5V5Ou6eFPxsyi3UyYh7uipq5LNRDjc3aDn4
         695nKhtWKq0WFML22BkWPyKKH4bhA9Kyegb6nq/mETcXLVXfBBZj7bmxSXqOQk3YKYFz
         Zhf/W2kCTkOAwSUfXOZbpBy/5OteRE9sl/3IdwM2LBCxYx3O++PmA81k80ZFpQgxoJMD
         cpKsE/S4e29hw9lHjN/Bf7Uj75C2GnQqMpET/G2bYlM7Wf35PAV8Lbqv4Rq0jTjjyYCX
         Ul71h86M5oxXEijL98dE+VHjwdU0MUgGGWKk6vn2kKjNLqmzXX4pOHyWRT+2VXSGDBsb
         ljnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727798832; x=1728403632;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FOwX8zEWq9u2vqkDVwGK82xZureIgOdXeRz6EPpdBWc=;
        b=oYq3KFpJ/+25Zh6fu8ETaL37m/FVNKFOp4kwVhLhSSmvjjIOhe4y/LcRaVV7iIJU5Q
         no245+YcIq9ie2plHZJLoZWNn6A7LA/UGzO9Sx/0JWbrBPS9OPODXFYxdV5+7lCZbiY0
         KRrq93a1jXxUNa7kNTWlN8VK5WQv5SA30elOaHuYUXIJjwtep71yETpyCG7FNHeyv2eE
         vtcC4GuuhNj3QKYX6osNHA+ebvTtGV+nMrATZZEHgFQ1xl3T1A4NCG3GJC86s8WXXiY1
         uGdHnAJTRwn0biyjE1rDE0bcuBpCBDnW6Q0PEG7S/VVaaX1TDHJCKwjpj8AGO6JB+eFf
         t0/g==
X-Forwarded-Encrypted: i=1; AJvYcCV5MSx6BuiZrMUBgIfXAKSvrUqyaoh9WPZWhQL27P2D2DMVmB1/38IW0/2jjOTp/3pfvgrAH1KKOLd4PA==@lists.infradead.org
X-Gm-Message-State: AOJu0Ywjtxqjca+ep2AH9q2+hMlQDRwqnVka05D+ln63GNrQO/41I5Bx
	ibY+9evRQP5RNseudQcSTUV4aRnktQ6F0L4ragnmQRZahtnRDlLrzttj9kPXd74=
X-Google-Smtp-Source: AGHT+IG+QoJp6SaYR4NX7gvJQsxk2XpCmBA5X0cJPckGFJwiDNphfS2kILfudd4XZsrEP9ImoMA9pw==
X-Received: by 2002:a17:90b:4a86:b0:2e0:a9e8:b9c1 with SMTP id 98e67ed59e1d1-2e1846aff84mr236832a91.22.1727798832417;
        Tue, 01 Oct 2024 09:07:12 -0700 (PDT)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2e06e1d7d47sm13843973a91.28.2024.10.01.09.07.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Oct 2024 09:07:12 -0700 (PDT)
From: Deepak Gupta <debug@rivosinc.com>
Date: Tue, 01 Oct 2024 09:06:10 -0700
Subject: [PATCH 05/33] riscv: Call riscv_user_isa_enable() only on the boot
 hart
MIME-Version: 1.0
Message-Id: <20241001-v5_user_cfi_series-v1-5-3ba65b6e550f@rivosinc.com>
References: <20241001-v5_user_cfi_series-v1-0-3ba65b6e550f@rivosinc.com>
In-Reply-To: <20241001-v5_user_cfi_series-v1-0-3ba65b6e550f@rivosinc.com>
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
X-CRM114-CacheID: sfid-20241001_090713_832641_0CB1CE30 
X-CRM114-Status: GOOD (  15.48  )
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
index c0986291696a..7117366d80db 100644
--- a/arch/riscv/kernel/cpufeature.c
+++ b/arch/riscv/kernel/cpufeature.c
@@ -920,12 +920,12 @@ unsigned long riscv_get_elf_hwcap(void)
 	return hwcap;
 }
 
-void riscv_user_isa_enable(void)
+void __init riscv_user_isa_enable(void)
 {
 	if (riscv_has_extension_unlikely(RISCV_ISA_EXT_ZICBOZ))
 		current->thread_info.envcfg |= ENVCFG_CBZE;
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
