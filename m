Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D263FD3C52B
	for <linux-riscv@archiver.kernel.org>; Thu, 17 Oct 2024 19:00:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AOGgw+h+tmRyOnCghX/HI9YOfGXEMcfKs/pkFX5Qk8w=; b=XPneLfaBSFrLpJ
	hSLV1KP8M61H7YmhP6hcvWxrF18iuoiT9DHJEGY/U6JrL2My8NydBPu4Pd9Rxo/INf02pGINf2vPZ
	xPqpmbMTkSqvMHkv0UA02Wi4SUKSylge2wVgGlIX3h03IFHhOUTy3ae+xOiW6jF8ZlhlQpopjllRZ
	zTDBxSHAcy1k9KOaui2w5FKqGc/YUmL0YmhqiMknhnD1K9mCKNDO906iqjw+x2nc2KEE84kyX9ScZ
	Qp0sAWxlWrHEkJt2y1VVOQEy3XprMqRTKwxEZ+hq7u+rCLcoUKVTgjpAskxejNUMJ0/YrgByMXYIl
	0z5AAIQXyg1B8U935LeA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t1Vjl-0000000FxiA-0tWT;
	Thu, 17 Oct 2024 19:00:42 +0000
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t1Vje-0000000FxfF-3vda
	for linux-riscv@lists.infradead.org;
	Thu, 17 Oct 2024 19:00:36 +0000
Received: by mail-pl1-x636.google.com with SMTP id d9443c01a7336-20c767a9c50so12785435ad.1
        for <linux-riscv@lists.infradead.org>; Thu, 17 Oct 2024 12:00:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1729191634; x=1729796434; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=M6I92cOKev06L8Upue2XsTuPJ6ytpoCnoDu3MUioPhw=;
        b=HbKtyWwemh+V35uzb5tHh0wN9KTvMH4lidDqaUnzNY30vSBGCS66SzG6KJJJdHsbsP
         x61u8JKtBrUJHRqah/6+1aY25I8W6ZSyulq5PS67DE0xvbR43hE4H8hAIXHdjtIpCMtb
         37Ae6myG5Q7JTZTPaGxR0ZauFO81BLBpwwtQComN2NJioFujS8BC2NTm9WAD/8nje0Qx
         c2kkjEoG/ORor50LSjj7n9X1OzDxPuKw2A5f3NNbXO5aR7ggovY8nzZIWIbkMha35GWD
         u3iciMgE7TTzgeh2Fwf5KIF9xUUdlkxZNhu9PFpjoJGvdar2QKN7dVqhL9dXVeH+vPer
         p7uA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729191634; x=1729796434;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=M6I92cOKev06L8Upue2XsTuPJ6ytpoCnoDu3MUioPhw=;
        b=wg+DSkWVU7R4ZrxoHMiyvKXzC7k51qwcrx9NyVXr6fgU8XxNkgy87/NKqSdzx6PNYE
         h3c2lSOT+Yx15Fftd8he8mkq6Gjtk+0BWPLyQU1XustCjInX5sOKt/RK3kXolXhOrHqn
         dKkz+ps3/BNVgj1FMFbnoo/CAoCP/8pN20tQ6oSw1pCt2QGwBFW8MhD3T6CEnVB4av39
         W5kKiCc9ALx3vqm/0C86Q2JTSnt/bK7lPtTgavuk5+BctiDoOQTru0vO9mhQpHh9WZ2q
         RLiaA+PXqY3iDRpFU1BzuthYuDwHcepoAMGdFmkQ4fPgqqkzdJcjJCt7PZycb2lMl/V4
         YCRg==
X-Forwarded-Encrypted: i=1; AJvYcCUa5AQ7bSMG7I59icGbYqZM9lIdafrhbHtnE7o8rHKpfWtBNWdIPPzcdUhdn0PUal4BoTqyT3MkBXzQ+Q==@lists.infradead.org
X-Gm-Message-State: AOJu0YwInKHCrVI8iCvSe2S56wxIbzHedLEexhLVNTERfKMVV4P7/a52
	NbgzDi1WRLl4tMl98rO3yqfCvfbFIPfVaIUtbJx4c8h2HwygQ6Nso1qSeoRClwo=
X-Google-Smtp-Source: AGHT+IEnqr/xLXrUjVnnlJHigy6Hyu2OOrtSPcsF/2JSHBJmAcPpsNh3cA82sUz5vfzl4azudhUS4g==
X-Received: by 2002:a17:903:32c9:b0:20c:6ac0:f1f3 with SMTP id d9443c01a7336-20cbb1c2931mr253055085ad.34.1729191633582;
        Thu, 17 Oct 2024 12:00:33 -0700 (PDT)
Received: from charlie.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2e55d7bf9a8sm217766a91.13.2024.10.17.12.00.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Oct 2024 12:00:32 -0700 (PDT)
From: Charlie Jenkins <charlie@rivosinc.com>
Date: Thu, 17 Oct 2024 12:00:18 -0700
Subject: [PATCH v10 1/6] RISC-V: Check scalar unaligned access on all CPUs
MIME-Version: 1.0
Message-Id: <20241017-jesse_unaligned_vector-v10-1-5b33500160f8@rivosinc.com>
References: <20241017-jesse_unaligned_vector-v10-0-5b33500160f8@rivosinc.com>
In-Reply-To: <20241017-jesse_unaligned_vector-v10-0-5b33500160f8@rivosinc.com>
To: Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 =?utf-8?q?Cl=C3=A9ment_L=C3=A9ger?= <cleger@rivosinc.com>, 
 Evan Green <evan@rivosinc.com>, Jonathan Corbet <corbet@lwn.net>
Cc: Palmer Dabbelt <palmer@rivosinc.com>, linux-riscv@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
 Charlie Jenkins <charlie@rivosinc.com>, Jesse Taube <jesse@rivosinc.com>, 
 stable@vger.kernel.org
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3354; i=charlie@rivosinc.com;
 h=from:subject:message-id; bh=luXKoHMr90jWw4aZ0MlK8J4IV7I78iZ6mhaINZaU4mk=;
 b=owGbwMvMwCHWx5hUnlvL8Y3xtFoSQ7pg3OmbLj8cdy1ct8gpf9/s2mSH22/866sX3b/jGXw0+
 xpzY8v5jlIWBjEOBlkxRRaeaw3MrXf0y46Klk2AmcPKBDKEgYtTACaybCEjw/+8/9/MuS9uWbXc
 kSXp3Jr5XUfffXW5sjd5pXmVmFys4kqG/ym5YZIX/zE2i4hMcrJvXWBYu8xF4orcvJIPpjOCxHc
 +ZgQA
X-Developer-Key: i=charlie@rivosinc.com; a=openpgp;
 fpr=7D834FF11B1D8387E61C776FFB10D1F27D6B1354
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241017_120035_032857_11A55160 
X-CRM114-Status: GOOD (  12.96  )
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

From: Jesse Taube <jesse@rivosinc.com>

Originally, the check_unaligned_access_emulated_all_cpus function
only checked the boot hart. This fixes the function to check all
harts.

Fixes: 71c54b3d169d ("riscv: report misaligned accesses emulation to hwprobe")
Signed-off-by: Jesse Taube <jesse@rivosinc.com>
Reviewed-by: Charlie Jenkins <charlie@rivosinc.com>
Reviewed-by: Evan Green <evan@rivosinc.com>
Cc: stable@vger.kernel.org
---
 arch/riscv/include/asm/cpufeature.h  |  2 ++
 arch/riscv/kernel/traps_misaligned.c | 14 +++++++-------
 2 files changed, 9 insertions(+), 7 deletions(-)

diff --git a/arch/riscv/include/asm/cpufeature.h b/arch/riscv/include/asm/cpufeature.h
index 45f9c1171a48..dfa5cdddd367 100644
--- a/arch/riscv/include/asm/cpufeature.h
+++ b/arch/riscv/include/asm/cpufeature.h
@@ -8,6 +8,7 @@
 
 #include <linux/bitmap.h>
 #include <linux/jump_label.h>
+#include <linux/workqueue.h>
 #include <asm/hwcap.h>
 #include <asm/alternative-macros.h>
 #include <asm/errno.h>
@@ -60,6 +61,7 @@ void riscv_user_isa_enable(void);
 
 #if defined(CONFIG_RISCV_MISALIGNED)
 bool check_unaligned_access_emulated_all_cpus(void);
+void check_unaligned_access_emulated(struct work_struct *work __always_unused);
 void unaligned_emulation_finish(void);
 bool unaligned_ctl_available(void);
 DECLARE_PER_CPU(long, misaligned_access_speed);
diff --git a/arch/riscv/kernel/traps_misaligned.c b/arch/riscv/kernel/traps_misaligned.c
index d4fd8af7aaf5..d076dde5ad20 100644
--- a/arch/riscv/kernel/traps_misaligned.c
+++ b/arch/riscv/kernel/traps_misaligned.c
@@ -526,11 +526,11 @@ int handle_misaligned_store(struct pt_regs *regs)
 	return 0;
 }
 
-static bool check_unaligned_access_emulated(int cpu)
+void check_unaligned_access_emulated(struct work_struct *work __always_unused)
 {
+	int cpu = smp_processor_id();
 	long *mas_ptr = per_cpu_ptr(&misaligned_access_speed, cpu);
 	unsigned long tmp_var, tmp_val;
-	bool misaligned_emu_detected;
 
 	*mas_ptr = RISCV_HWPROBE_MISALIGNED_SCALAR_UNKNOWN;
 
@@ -538,19 +538,16 @@ static bool check_unaligned_access_emulated(int cpu)
 		"       "REG_L" %[tmp], 1(%[ptr])\n"
 		: [tmp] "=r" (tmp_val) : [ptr] "r" (&tmp_var) : "memory");
 
-	misaligned_emu_detected = (*mas_ptr == RISCV_HWPROBE_MISALIGNED_SCALAR_EMULATED);
 	/*
 	 * If unaligned_ctl is already set, this means that we detected that all
 	 * CPUS uses emulated misaligned access at boot time. If that changed
 	 * when hotplugging the new cpu, this is something we don't handle.
 	 */
-	if (unlikely(unaligned_ctl && !misaligned_emu_detected)) {
+	if (unlikely(unaligned_ctl && (*mas_ptr != RISCV_HWPROBE_MISALIGNED_SCALAR_EMULATED))) {
 		pr_crit("CPU misaligned accesses non homogeneous (expected all emulated)\n");
 		while (true)
 			cpu_relax();
 	}
-
-	return misaligned_emu_detected;
 }
 
 bool check_unaligned_access_emulated_all_cpus(void)
@@ -562,8 +559,11 @@ bool check_unaligned_access_emulated_all_cpus(void)
 	 * accesses emulated since tasks requesting such control can run on any
 	 * CPU.
 	 */
+	schedule_on_each_cpu(check_unaligned_access_emulated);
+
 	for_each_online_cpu(cpu)
-		if (!check_unaligned_access_emulated(cpu))
+		if (per_cpu(misaligned_access_speed, cpu)
+		    != RISCV_HWPROBE_MISALIGNED_SCALAR_EMULATED)
 			return false;
 
 	unaligned_ctl = true;

-- 
2.45.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
