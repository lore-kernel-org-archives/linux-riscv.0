Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92EF2C3DA4A
	for <linux-riscv@archiver.kernel.org>; Wed, 14 Aug 2024 08:11:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=k//hY7F3Kl9u7Y/OiIUSNHDzv7oKQsnO2DXv5Fv/F3k=; b=T60k8lAreZVYGe
	BWN9e3aDv5NOb+wSwuHa1FaubdtsGiqlLo02RneRxpd39nYFbtCx5mGhd8FGUMQQl7hoOFAyqbzy/
	5dhYx8Xc+AUEhuhsb8sA4G13I2ecgqdKnwKOSFDuw+jb8QGw5iMGhQz/tB0jc6Eor8rf1SA41QMMX
	hO5t6Aa+zLXZKQOuzo0WeRy9cjtI4cwvFa4g4VgskiuThsNkNwZr7xDti0ztTL58TtuKqSQB3s1x3
	YgzYGeYLZMESGfA84FcCvhivqLlFKvxLJL8IRMqpgyqeKXAvIFLuPYdtlr9QqMruT4sENh/y95Y5G
	yqahRgxnhlNMQ9DtaQ8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1se96a-00000006BqU-0U7y;
	Wed, 14 Aug 2024 08:11:40 +0000
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1se96W-00000006BoE-1SvR
	for linux-riscv@lists.infradead.org;
	Wed, 14 Aug 2024 08:11:38 +0000
Received: by mail-pf1-x435.google.com with SMTP id d2e1a72fcca58-7104f93a20eso5313781b3a.1
        for <linux-riscv@lists.infradead.org>; Wed, 14 Aug 2024 01:11:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1723623095; x=1724227895; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HRg7k8b1pNHrGkCawN5XlEnE++zRqhFin8UtxZvnPiA=;
        b=XQgU0iZFDjbZtOH4a0Hcg+B7dnMIqVHG8DF4o+PgWS2DhzIY1M2S6CWYXvnSJ5irJc
         T9DwFXHaNtKlYA7V8wdlzrQASIAF7z504zeZr7jG8lKBd0SGymTmD0tG50y/lTH1S9l+
         Pej9D8Nez6JHCPIKFXBYO+xNNts8HkZAGqQMkCmQXd4DaIfpu7jztNqId519BmQUwluw
         Q5tUzFmwzIvkCwMU8EYBIsUWJ6ZYekDJBFy2RcxGsy+X2Q/wZbzoc5V2SI8rQc8McWgH
         Vtw/tcENWE8fVVtDrZuwRZT2G3DCnhjQeGBav1ZRVTMkCtNy0i1ZWw+X60DX6WTeEjrj
         9PUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723623095; x=1724227895;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HRg7k8b1pNHrGkCawN5XlEnE++zRqhFin8UtxZvnPiA=;
        b=gg5T8kbLxp6/lJCH/jlH8Ahk8pieHSC6Z2rrIyrVflXaGQZNsOVz0KS+lqjQ0gog5i
         JDkjGPjEgoxM76MTr1ow3GoomNfe0Is1WPwbO6737omS1+vn0/NyWZPufUy8jYYaMJf6
         zt9UOZkML3haEuXsQp00yJCRaVMiK2pVX/8YOcgU7vE+7IELmK7bLlBsESBF6aEGJdKn
         FeyQ4w4acXF5BY1yB5D0iRTul8n/61xV3KIaQZqFQ1bJ8zJ3Y9LpuUBzIvfzE9dWtS7p
         +UZnZcB7JN3p6Tnkmx6H+3MNQQwFBBKGXQdYsaIDcqKrJNYmZ4jDuIEbZCmeyANWg9xZ
         mXqw==
X-Gm-Message-State: AOJu0YyNBm+t7baw72NFkmWTY2XSjF+k5a7+g2y6TOnkJ6Xliny4XJQW
	M5PH7yuBvDiqbZQDQkcNOb+xEArI3p1g8v4JeiEQTGhsS/R9JB9T9SgQHwBVbIeOh+47n5MRauw
	kwF2QLprPI0/JsDaXL3cBk1UIajfB7izTYehSxr8etlIwDZnFzi8bDVwUIm04c+AzAFF2nJnKmW
	5htVyWEDWiEcmB6MGs4jDgq8ViMw+FBQv5oqvlDa7StprrY7m2WkVOljV5
X-Google-Smtp-Source: AGHT+IH0hIuDifGPsQ/ifvUQj74P9NaxskpxaUYin4TYlEuYI0bGgoYZnDTa7sdcogfJRcGcPQNb/Q==
X-Received: by 2002:a05:6a20:8b1a:b0:1c8:eb6e:5817 with SMTP id adf61e73a8af0-1c8eb6e5864mr1613115637.5.1723623095015;
        Wed, 14 Aug 2024 01:11:35 -0700 (PDT)
Received: from sw06.internal.sifive.com ([4.53.31.132])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-201cd1a94d2sm24559955ad.127.2024.08.14.01.11.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Aug 2024 01:11:34 -0700 (PDT)
From: Samuel Holland <samuel.holland@sifive.com>
To: linux-riscv@lists.infradead.org,
	Palmer Dabbelt <palmer@dabbelt.com>
Cc: Andrew Jones <ajones@ventanamicro.com>,
	Conor Dooley <conor@kernel.org>,
	linux-kernel@vger.kernel.org,
	Deepak Gupta <debug@rivosinc.com>,
	Samuel Holland <samuel.holland@sifive.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Andy Chiu <andy.chiu@sifive.com>,
	Charlie Jenkins <charlie@rivosinc.com>,
	=?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>,
	Evan Green <evan@rivosinc.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Xiao Wang <xiao.w.wang@intel.com>,
	Zhao Ke <ke.zhao@shingroup.cn>
Subject: [PATCH v4 3/3] riscv: Call riscv_user_isa_enable() only on the boot hart
Date: Wed, 14 Aug 2024 01:10:56 -0700
Message-ID: <20240814081126.956287-4-samuel.holland@sifive.com>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <20240814081126.956287-1-samuel.holland@sifive.com>
References: <20240814081126.956287-1-samuel.holland@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240814_011136_539698_4E9A19FF 
X-CRM114-Status: GOOD (  14.68  )
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

Now that the [ms]envcfg CSR value is maintained per thread, not per
hart, riscv_user_isa_enable() only needs to be called once during boot,
to set the value for the init task. This also allows it to be marked as
__init.

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
Reviewed-by: Deepak Gupta <debug@rivosinc.com>
Signed-off-by: Samuel Holland <samuel.holland@sifive.com>
---

Changes in v4:
 - Rebase on riscv/for-next (v6.11-rc)
 - Add Conor's Reviewed-by tags from v2 (missed in v3)

Changes in v3:
 - Drop use of __initdata due to conflicts with cpufeature.c refactoring

Changes in v2:
 - Rebase on riscv/for-next

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
index df3e7e8d6d78..b3b9735cb19a 100644
--- a/arch/riscv/kernel/cpufeature.c
+++ b/arch/riscv/kernel/cpufeature.c
@@ -919,12 +919,12 @@ unsigned long riscv_get_elf_hwcap(void)
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
2.45.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
