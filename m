Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C444FA3740
	for <linux-riscv@archiver.kernel.org>; Thu, 27 Oct 2022 13:05:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=M2likbQqMXIEdneKf+KmTq6FH0EBWsM3N6C41Qle1TA=; b=zZ2SV89CkmRYev
	G35g1LoGu+P6h7OCRUCag0FAubuFpncy34SDE+hYIhmSE7aKB7Q6IyAxPlgG9DZUKto0YdFpQ84ha
	j6GL1Z0Wz1RIhr35VqXdJqiS2yjd/jK0/gX0081rRcOJ55NU2bhYhlpSl7+IIeT7vr3qkceYfUTJR
	WJpEv+jn1N7z06aXIrDmxvqA/nIK+f6qL43euG8Kus13lgFZ8Lh10fmLpcu1LEvTP8UScu4Cs3Foj
	241KysqKfHhfrn8+c1AspqFY/OeHrF06z4rPfNm/8Gcvea7Pb80gZc5o1th/uYRccZUFK8Y2W5ld+
	Pfp9VmSu41/wtD8s0S5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oo2ZA-00DK1i-Eo; Thu, 27 Oct 2022 13:05:00 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oo2XG-00DJ5R-W0
	for linux-riscv@lists.infradead.org; Thu, 27 Oct 2022 13:03:04 +0000
Received: by mail-wm1-x32e.google.com with SMTP id l16-20020a05600c4f1000b003c6c0d2a445so1146126wmq.4
        for <linux-riscv@lists.infradead.org>; Thu, 27 Oct 2022 06:03:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ypq1jHU6FqMI0efCbfJSsSlnjMaAcFVEo7l5rTk9GE0=;
        b=A+s3px9YR/AIymPX+iXjL/IgHW8a/E3j00udC/0Eh0iE7BQNoIGWhqZfDSqPOmE7SH
         7XMJrsmNoxHGia7hHEzpD1Gzz5Wgc6g2HxFxP67iG6GLSwb4LAmB2IT5LJqsZy3Nwgdl
         aWuYKZl4zEw+rb6isikRjJIViYqcO5r97i/e7Hm5oUkU+e8PSqDkcnFaM9zWBTWfDluS
         7BBN4Gc390iP2Xj6Q5uHfMZL9RpvHJ4bpvR1I7eVa8emu8Ap4INKTyPwPT0y1qWbxs3M
         ZM1WOO2vmEu3fVEzk0np5cUc0S30zYuRJhBWfCsEnBz4ybUHUmW/3uzu+/+n/5jV3vO6
         hgSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ypq1jHU6FqMI0efCbfJSsSlnjMaAcFVEo7l5rTk9GE0=;
        b=dMPPX+POOcyFUtFUAWGE0fpzVXOIZKmKlZiY5GlqkJWVQQOcLMgefZVGixSScHFrWt
         kvpf/wzpgH3iyGKigrEzDhQ99Ai4xPRNkyBiVkq+vZrs00mzu22kgrS5gFGgStb/4aa3
         n5ffScMhOQ4RxGspVjaSF1JA/nbYRVs9401Fd6TVbQDb/ovUyViD0wH+tB9CdnJyE+ST
         UjGuYaprusiSvhpvNu9TcTeMJLyIXyvOu9DI9JAEadi99cDbIH+iUVwfOYLXtFUGjLfz
         R2QUNidyUD2kSf0pmZB1lXfRFIU8vU1nL0l82vOBeFPaqbc7WRnXcgGBuzR4IUBvgIUC
         l0mQ==
X-Gm-Message-State: ACrzQf0mYNzzxvdLDUepDEo02kTWfVzqEbn0KvJDHU/n6nKHgAQYUs4z
	ZgC6zuUWaQ7Zo8gC2h2ISwMI97Ac+viqlw==
X-Google-Smtp-Source: AMsMyM4pGTsLz/Q3zR03Raj8BHQ6U4ZtX2hvt4fOM3kTory1SVpA8TO1ZKOw9RnoLtWuCl8yhvaqgA==
X-Received: by 2002:a05:600c:4b19:b0:3c6:cc7c:763c with SMTP id i25-20020a05600c4b1900b003c6cc7c763cmr5868711wmp.57.1666875772197;
        Thu, 27 Oct 2022 06:02:52 -0700 (PDT)
Received: from localhost (cst2-173-61.cust.vodafone.cz. [31.30.173.61])
        by smtp.gmail.com with ESMTPSA id i17-20020a05600c355100b003a8434530bbsm5047740wmq.13.2022.10.27.06.02.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Oct 2022 06:02:51 -0700 (PDT)
From: Andrew Jones <ajones@ventanamicro.com>
To: linux-riscv@lists.infradead.org,
	kvm-riscv@lists.infradead.org
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Anup Patel <apatel@ventanamicro.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Conor Dooley <conor.dooley@microchip.com>,
	Atish Patra <atishp@rivosinc.com>,
	Jisheng Zhang <jszhang@kernel.org>
Subject: [PATCH 2/9] RISC-V: Add Zicboz detection and block size parsing
Date: Thu, 27 Oct 2022 15:02:40 +0200
Message-Id: <20221027130247.31634-3-ajones@ventanamicro.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221027130247.31634-1-ajones@ventanamicro.com>
References: <20221027130247.31634-1-ajones@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221027_060303_094240_DF54EA3D 
X-CRM114-Status: GOOD (  17.23  )
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

Mostly follow the same pattern as Zicbom, but leave out the toolchain
checks as we plan to use the insn-def framework for the cbo.zero
instruction.

Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
---
 arch/riscv/Kconfig                  | 13 +++++++++++++
 arch/riscv/include/asm/cacheflush.h |  3 ++-
 arch/riscv/include/asm/hwcap.h      |  1 +
 arch/riscv/kernel/cpu.c             |  1 +
 arch/riscv/kernel/cpufeature.c      | 10 ++++++++++
 arch/riscv/kernel/setup.c           |  2 +-
 arch/riscv/mm/cacheflush.c          | 23 +++++++++++++++--------
 7 files changed, 43 insertions(+), 10 deletions(-)

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index 6b48a3ae9843..c20e6fa0c0b1 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -433,6 +433,19 @@ config RISCV_ISA_ZICBOM
 
 	   If you don't know what to do here, say Y.
 
+config RISCV_ISA_ZICBOZ
+	bool "Zicboz extension support for faster zeroing of memory"
+	depends on !XIP_KERNEL && MMU
+	select RISCV_ALTERNATIVE
+	default y
+	help
+	   Adds support to dynamically detect the presence of the ZICBOZ
+	   extension (cbo.zero instruction) and enable its usage.
+
+	   The Zicboz extension is used for faster zeroing of memory.
+
+	   If you don't know what to do here, say Y.
+
 config FPU
 	bool "FPU support"
 	default y
diff --git a/arch/riscv/include/asm/cacheflush.h b/arch/riscv/include/asm/cacheflush.h
index f6fbe7042f1c..5b31568cf5e6 100644
--- a/arch/riscv/include/asm/cacheflush.h
+++ b/arch/riscv/include/asm/cacheflush.h
@@ -43,7 +43,8 @@ void flush_icache_mm(struct mm_struct *mm, bool local);
 #endif /* CONFIG_SMP */
 
 extern unsigned int riscv_cbom_block_size;
-void riscv_init_cbom_blocksize(void);
+extern unsigned int riscv_cboz_block_size;
+void riscv_init_cbo_blocksizes(void);
 
 #ifdef CONFIG_RISCV_DMA_NONCOHERENT
 void riscv_noncoherent_supported(void);
diff --git a/arch/riscv/include/asm/hwcap.h b/arch/riscv/include/asm/hwcap.h
index 5d6492bde446..eaa5a972ad2d 100644
--- a/arch/riscv/include/asm/hwcap.h
+++ b/arch/riscv/include/asm/hwcap.h
@@ -45,6 +45,7 @@
 #define RISCV_ISA_EXT_ZIHINTPAUSE	29
 #define RISCV_ISA_EXT_SSTC		30
 #define RISCV_ISA_EXT_SVINVAL		31
+#define RISCV_ISA_EXT_ZICBOZ		32
 
 #define RISCV_ISA_EXT_ID_MAX		RISCV_ISA_EXT_MAX
 
diff --git a/arch/riscv/kernel/cpu.c b/arch/riscv/kernel/cpu.c
index fa427bdcf773..bf969218f609 100644
--- a/arch/riscv/kernel/cpu.c
+++ b/arch/riscv/kernel/cpu.c
@@ -144,6 +144,7 @@ static struct riscv_isa_ext_data isa_ext_arr[] = {
 	__RISCV_ISA_EXT_DATA(svpbmt, RISCV_ISA_EXT_SVPBMT),
 	__RISCV_ISA_EXT_DATA(zicbom, RISCV_ISA_EXT_ZICBOM),
 	__RISCV_ISA_EXT_DATA(zihintpause, RISCV_ISA_EXT_ZIHINTPAUSE),
+	__RISCV_ISA_EXT_DATA(zicboz, RISCV_ISA_EXT_ZICBOZ),
 	__RISCV_ISA_EXT_DATA("", RISCV_ISA_EXT_MAX),
 };
 
diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
index 18b9ed4df1f4..e13b3391de76 100644
--- a/arch/riscv/kernel/cpufeature.c
+++ b/arch/riscv/kernel/cpufeature.c
@@ -78,6 +78,15 @@ static bool riscv_isa_extension_check(int id)
 			return false;
 		}
 		return true;
+	case RISCV_ISA_EXT_ZICBOZ:
+		if (!riscv_cboz_block_size) {
+			pr_err("Zicboz detected in ISA string, but no cboz-block-size found\n");
+			return false;
+		} else if (!is_power_of_2(riscv_cboz_block_size)) {
+			pr_err("cboz-block-size present, but is not a power-of-2\n");
+			return false;
+		}
+		return true;
 	}
 
 	return true;
@@ -225,6 +234,7 @@ void __init riscv_fill_hwcap(void)
 				SET_ISA_EXT_MAP("zihintpause", RISCV_ISA_EXT_ZIHINTPAUSE);
 				SET_ISA_EXT_MAP("sstc", RISCV_ISA_EXT_SSTC);
 				SET_ISA_EXT_MAP("svinval", RISCV_ISA_EXT_SVINVAL);
+				SET_ISA_EXT_MAP("zicboz", RISCV_ISA_EXT_ZICBOZ);
 			}
 #undef SET_ISA_EXT_MAP
 		}
diff --git a/arch/riscv/kernel/setup.c b/arch/riscv/kernel/setup.c
index a07917551027..26de0d8fd23d 100644
--- a/arch/riscv/kernel/setup.c
+++ b/arch/riscv/kernel/setup.c
@@ -296,7 +296,7 @@ void __init setup_arch(char **cmdline_p)
 	setup_smp();
 #endif
 
-	riscv_init_cbom_blocksize();
+	riscv_init_cbo_blocksizes();
 	riscv_fill_hwcap();
 	apply_boot_alternatives();
 #ifdef CONFIG_RISCV_DMA_NONCOHERENT
diff --git a/arch/riscv/mm/cacheflush.c b/arch/riscv/mm/cacheflush.c
index f096b9966cae..208e0d58bde3 100644
--- a/arch/riscv/mm/cacheflush.c
+++ b/arch/riscv/mm/cacheflush.c
@@ -91,6 +91,9 @@ void flush_icache_pte(pte_t pte)
 unsigned int riscv_cbom_block_size;
 EXPORT_SYMBOL_GPL(riscv_cbom_block_size);
 
+unsigned int riscv_cboz_block_size;
+EXPORT_SYMBOL_GPL(riscv_cboz_block_size);
+
 static void cbo_get_block_size(struct device_node *node,
 			       const char *name, u32 *blksz,
 			       unsigned long *first_hartid)
@@ -113,19 +116,23 @@ static void cbo_get_block_size(struct device_node *node,
 	}
 }
 
-void riscv_init_cbom_blocksize(void)
+void riscv_init_cbo_blocksizes(void)
 {
+	unsigned long cbom_hartid, cboz_hartid;
+	u32 cbom_blksz = 0, cboz_blksz = 0;
 	struct device_node *node;
-	unsigned long cbom_hartid;
-	u32 probed_block_size;
 
-	probed_block_size = 0;
 	for_each_of_cpu_node(node) {
-		/* set block-size for cbom extension if available */
+		/* set block-size for cbom and/or cboz extension if available */
 		cbo_get_block_size(node, "riscv,cbom-block-size",
-				   &probed_block_size, &cbom_hartid);
+				   &cbom_blksz, &cbom_hartid);
+		cbo_get_block_size(node, "riscv,cboz-block-size",
+				   &cboz_blksz, &cboz_hartid);
 	}
 
-	if (probed_block_size)
-		riscv_cbom_block_size = probed_block_size;
+	if (cbom_blksz)
+		riscv_cbom_block_size = cbom_blksz;
+
+	if (cboz_blksz)
+		riscv_cboz_block_size = cboz_blksz;
 }
-- 
2.37.3


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
