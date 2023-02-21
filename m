Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB8CEC636D7
	for <linux-riscv@archiver.kernel.org>; Tue, 21 Feb 2023 20:15:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xVkiimp9gjRNRY1a1GyoZveI5IrQy6oNbYOkdkPyZlk=; b=zym4eM8B7znWXn
	03esT5Qyb0vY/3eNNzhjGtvbREvaWjbeX63Fp45q+BhDg0I+9N0LfkujhKymyKThHpST1feapnsk4
	K5JlcfetdHbQ8MOsBgg/6fYB7gJ4pXfe3g3+Nu+ZYvq23Ca81aRHH/oOWZEeP5K4TXp7nFowia1lO
	Oi6bAKrdQu6QqovJ2peJnPe0wKgVYOO6N6epxhIxMsMCXGIEG1PVmWzFt5Pols9ZU5g1zCaBHEXsl
	g9DECRndb/oYgnGYlpvVCGLSxaUR6QYfc30ouAzN+QzNO1DtW/+9T13GLGg49yGP7RD8RQVI3FxQ/
	TCbvGX7PsNVsOvXlMh/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pUZ34-009fie-Ou; Tue, 21 Feb 2023 20:15:38 +0000
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pUY0z-009Urv-5Q
	for linux-riscv@lists.infradead.org; Tue, 21 Feb 2023 19:09:28 +0000
Received: by mail-ed1-x534.google.com with SMTP id b12so21356466edd.4
        for <linux-riscv@lists.infradead.org>; Tue, 21 Feb 2023 11:09:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GXedayrqa7eBo4rkkBiYovR8Wr8pe4sKgfVmovmcu18=;
        b=j/982Ctm96sVfHm/ro7bM8b7YKU6uEmLnHH3zdFR0JwFQSSlkXrzD+jMoXyli3VYtR
         TtsAXkyj59KhFyyvK+M+XVj1TgJYLsmw/l8bW3OHD0y3porahT8MSEGSpgVLfo1Ra3b+
         CwhBanLhecrJPXkkW6kidWmp+WKCWn0ilAOhBwyvHjGN3XjpTMeaG/qM0jiTcJmJnWHy
         Py6PrxoHnY4wFrz/zGJHmYnPXiOXSkn3BlutKP7hH7fiDQe70ZMrJUpoRSkxTYhmocBh
         bb+gqtQ/z/JVipRnELQd6fIOSwweIhkMAVe5PupX4tanWoik/1vKhPUC0UXVsUBLXtIP
         DF5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GXedayrqa7eBo4rkkBiYovR8Wr8pe4sKgfVmovmcu18=;
        b=JWQRGsF3uGwjYiSZt6Cx23ozIgSwGgdWCJhQurfDTu1U9T0J0NmQEDglWglWUgr08c
         CGpvfgpQRzOdnJtiLP6rw6ELxeVUPnft4drX5yzLppRpH3AH+90n7dvhKkiYw0qsDutM
         UM1erPTLw7J5R8TNR9PeSY5IUwzyTg1Q7EjXUsmdIsxTmqWYWC1ekzVznDi/0dQ33pus
         7I4djGXVl0u5EiC3VB8hloeY4UhByI3muDaONvYASUmfERpB5ZdqSNsu+VUjhGtfcM38
         zUNtCLkB6LOeoHDRekbuAQ4xmO+IgNrMZbUs8M4hpqV2tkE5Juwcy7AjbyX1udDQSQ7I
         CbnA==
X-Gm-Message-State: AO0yUKWozPNq0No94tLMTwYiyBdB8NubI+ni2OtNAHWU+n9j17a3+xZ0
	NzeJ1Jlyvnw0VWOH/U/tNJczYVO4WdLgTNjc
X-Google-Smtp-Source: AK7set80pg34Z/dTD1nm35A+9eoM84IWV71wFC0+PR8j5t8jwA+a78wLQabIFXgkq+hRLQaeiCQT/w==
X-Received: by 2002:a17:907:d25:b0:878:5c36:a14a with SMTP id gn37-20020a1709070d2500b008785c36a14amr19466820ejc.23.1677006563769;
        Tue, 21 Feb 2023 11:09:23 -0800 (PST)
Received: from localhost (cst2-173-16.cust.vodafone.cz. [31.30.173.16])
        by smtp.gmail.com with ESMTPSA id y14-20020a1709064b0e00b008c979c74732sm3931632eju.156.2023.02.21.11.09.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Feb 2023 11:09:23 -0800 (PST)
From: Andrew Jones <ajones@ventanamicro.com>
To: linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org,
	kvm-riscv@lists.infradead.org
Cc: 'Rob Herring ' <robh@kernel.org>,
	'Jisheng Zhang ' <jszhang@kernel.org>,
	'Anup Patel ' <apatel@ventanamicro.com>,
	'Conor Dooley ' <conor.dooley@microchip.com>,
	'Krzysztof Kozlowski ' <krzysztof.kozlowski+dt@linaro.org>,
	'Heiko Stuebner ' <heiko@sntech.de>,
	'Paul Walmsley ' <paul.walmsley@sifive.com>,
	'Palmer Dabbelt ' <palmer@dabbelt.com>,
	'Albert Ou ' <aou@eecs.berkeley.edu>,
	'Ben Dooks ' <ben.dooks@codethink.co.uk>,
	'Atish Patra ' <atishp@rivosinc.com>
Subject: [PATCH v5 4/8] RISC-V: Add Zicboz detection and block size parsing
Date: Tue, 21 Feb 2023 20:09:12 +0100
Message-Id: <20230221190916.572454-5-ajones@ventanamicro.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230221190916.572454-1-ajones@ventanamicro.com>
References: <20230221190916.572454-1-ajones@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230221_110925_243122_A8187E83 
X-CRM114-Status: GOOD (  14.64  )
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

Parse "riscv,cboz-block-size" from the DT by piggybacking on Zicbom's
riscv_init_cbom_blocksize(). Additionally check the DT for the presence
of the "zicboz" extension and, when it's present, validate the parsed
cboz block size as we do Zicbom's cbom block size with
riscv_isa_extension_check().

Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
Reviewed-by: Heiko Stuebner <heiko@sntech.de>
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
---
 arch/riscv/include/asm/cacheflush.h |  3 ++-
 arch/riscv/include/asm/hwcap.h      |  1 +
 arch/riscv/kernel/cpu.c             |  1 +
 arch/riscv/kernel/cpufeature.c      | 10 ++++++++++
 arch/riscv/kernel/setup.c           |  2 +-
 arch/riscv/mm/cacheflush.c          | 23 +++++++++++++++--------
 6 files changed, 30 insertions(+), 10 deletions(-)

diff --git a/arch/riscv/include/asm/cacheflush.h b/arch/riscv/include/asm/cacheflush.h
index 03e3b95ae6da..8091b8bf4883 100644
--- a/arch/riscv/include/asm/cacheflush.h
+++ b/arch/riscv/include/asm/cacheflush.h
@@ -50,7 +50,8 @@ void flush_icache_mm(struct mm_struct *mm, bool local);
 #endif /* CONFIG_SMP */
 
 extern unsigned int riscv_cbom_block_size;
-void riscv_init_cbom_blocksize(void);
+extern unsigned int riscv_cboz_block_size;
+void riscv_init_cbo_blocksizes(void);
 
 #ifdef CONFIG_RISCV_DMA_NONCOHERENT
 void riscv_noncoherent_supported(void);
diff --git a/arch/riscv/include/asm/hwcap.h b/arch/riscv/include/asm/hwcap.h
index ee9c80fe0062..bd025e918a08 100644
--- a/arch/riscv/include/asm/hwcap.h
+++ b/arch/riscv/include/asm/hwcap.h
@@ -47,6 +47,7 @@
 #define RISCV_ISA_EXT_ZBB              30
 #define RISCV_ISA_EXT_ZICBOM           31
 #define RISCV_ISA_EXT_ZIHINTPAUSE      32
+#define RISCV_ISA_EXT_ZICBOZ           33
 
 #ifndef __ASSEMBLY__
 
diff --git a/arch/riscv/kernel/cpu.c b/arch/riscv/kernel/cpu.c
index 420228e219f7..7a3065544dcb 100644
--- a/arch/riscv/kernel/cpu.c
+++ b/arch/riscv/kernel/cpu.c
@@ -187,6 +187,7 @@ arch_initcall(riscv_cpuinfo_init);
 static struct riscv_isa_ext_data isa_ext_arr[] = {
 	__RISCV_ISA_EXT_DATA(zbb, RISCV_ISA_EXT_ZBB),
 	__RISCV_ISA_EXT_DATA(zicbom, RISCV_ISA_EXT_ZICBOM),
+	__RISCV_ISA_EXT_DATA(zicboz, RISCV_ISA_EXT_ZICBOZ),
 	__RISCV_ISA_EXT_DATA(zihintpause, RISCV_ISA_EXT_ZIHINTPAUSE),
 	__RISCV_ISA_EXT_DATA(sscofpmf, RISCV_ISA_EXT_SSCOFPMF),
 	__RISCV_ISA_EXT_DATA(sstc, RISCV_ISA_EXT_SSTC),
diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
index 151e1a715db9..6102b6bb5db3 100644
--- a/arch/riscv/kernel/cpufeature.c
+++ b/arch/riscv/kernel/cpufeature.c
@@ -73,6 +73,15 @@ static bool riscv_isa_extension_check(int id)
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
@@ -221,6 +230,7 @@ void __init riscv_fill_hwcap(void)
 				SET_ISA_EXT_MAP("svpbmt", RISCV_ISA_EXT_SVPBMT);
 				SET_ISA_EXT_MAP("zbb", RISCV_ISA_EXT_ZBB);
 				SET_ISA_EXT_MAP("zicbom", RISCV_ISA_EXT_ZICBOM);
+				SET_ISA_EXT_MAP("zicboz", RISCV_ISA_EXT_ZICBOZ);
 				SET_ISA_EXT_MAP("zihintpause", RISCV_ISA_EXT_ZIHINTPAUSE);
 			}
 #undef SET_ISA_EXT_MAP
diff --git a/arch/riscv/kernel/setup.c b/arch/riscv/kernel/setup.c
index 376d2827e736..5d3184cbf518 100644
--- a/arch/riscv/kernel/setup.c
+++ b/arch/riscv/kernel/setup.c
@@ -297,7 +297,7 @@ void __init setup_arch(char **cmdline_p)
 	setup_smp();
 #endif
 
-	riscv_init_cbom_blocksize();
+	riscv_init_cbo_blocksizes();
 	riscv_fill_hwcap();
 	apply_boot_alternatives();
 	if (IS_ENABLED(CONFIG_RISCV_ISA_ZICBOM) &&
diff --git a/arch/riscv/mm/cacheflush.c b/arch/riscv/mm/cacheflush.c
index eaf23fc14966..ba4832bb949b 100644
--- a/arch/riscv/mm/cacheflush.c
+++ b/arch/riscv/mm/cacheflush.c
@@ -98,6 +98,9 @@ void flush_icache_pte(pte_t pte)
 unsigned int riscv_cbom_block_size;
 EXPORT_SYMBOL_GPL(riscv_cbom_block_size);
 
+unsigned int riscv_cboz_block_size;
+EXPORT_SYMBOL_GPL(riscv_cboz_block_size);
+
 static void cbo_get_block_size(struct device_node *node,
 			       const char *name, u32 *block_size,
 			       unsigned long *first_hartid)
@@ -120,19 +123,23 @@ static void cbo_get_block_size(struct device_node *node,
 	}
 }
 
-void riscv_init_cbom_blocksize(void)
+void riscv_init_cbo_blocksizes(void)
 {
+	unsigned long cbom_hartid, cboz_hartid;
+	u32 cbom_block_size = 0, cboz_block_size = 0;
 	struct device_node *node;
-	unsigned long cbom_hartid;
-	u32 probed_block_size;
 
-	probed_block_size = 0;
 	for_each_of_cpu_node(node) {
-		/* set block-size for cbom extension if available */
+		/* set block-size for cbom and/or cboz extension if available */
 		cbo_get_block_size(node, "riscv,cbom-block-size",
-				   &probed_block_size, &cbom_hartid);
+				   &cbom_block_size, &cbom_hartid);
+		cbo_get_block_size(node, "riscv,cboz-block-size",
+				   &cboz_block_size, &cboz_hartid);
 	}
 
-	if (probed_block_size)
-		riscv_cbom_block_size = probed_block_size;
+	if (cbom_block_size)
+		riscv_cbom_block_size = cbom_block_size;
+
+	if (cboz_block_size)
+		riscv_cboz_block_size = cboz_block_size;
 }
-- 
2.39.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
