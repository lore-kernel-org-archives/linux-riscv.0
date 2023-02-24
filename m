Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 741B6C7EE2D
	for <linux-riscv@archiver.kernel.org>; Fri, 24 Feb 2023 17:31:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lLJ9EEhHsunDc+WJ100hoicqJRYxRyx6/MEyf7CpG4Y=; b=e8MW8LlwQMS+gI
	QYYmUr3RxkRQJrvbnWKrU9n23weYFoiG9woUvfxW/u2vjFryT9zEewXHVbfvaaNOb5A/aypXa0Oxk
	RQWgQy5T1n/dCLgrts4aprkxLSk8iK+umxPZXYNIHzJi+CyQ76TbQ+mRXzuVSuYJGJtFZBfL2eaUv
	SRLlmISmoEXDsOvivQ1vH3Zmkpntxyi0txst9DKPJuYTG9bJAW89vwGvace4dM3ViQdbkcfH/paB0
	4y3gghbRO4E5MzDROGi5bEN+9k2D5KZ6IWVJ7FntGaGRcMbxlgnYp8LpVdWA0NceaZ20tpeW1LHNr
	Tc8H9NC3/SXNURPSGy8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pVbuL-003JGm-RY; Fri, 24 Feb 2023 17:30:57 +0000
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pVau6-003725-0O
	for linux-riscv@lists.infradead.org; Fri, 24 Feb 2023 16:26:39 +0000
Received: by mail-wr1-x42b.google.com with SMTP id l25so14095429wrb.3
        for <linux-riscv@lists.infradead.org>; Fri, 24 Feb 2023 08:26:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=K7rGW7hYEauj0lEHNx054QYhURQUQQG6A8fMOX9HH84=;
        b=RKqYoE96klcsM5eA//F76t0V+zO9OQvwwBKBQ77Ld8n2SOHHJSGhBHre9+TrbmLg+o
         dc34CetaLatRWo/FVB1zzFELNGy8JhmmN9Qa+JXiXcOnXDr137/7bPD7R8XGC3p8k4/j
         NKlIDe+e4cDuGoIQl+28FOOiIz6lDS+GG2UkxoCBmhdjLMGw4n/yrFvnHU0zL9IJJe1/
         0SH4qE47mmAZWUiXuU6sg2VJBsAbDco/MSTG0tBoPkemCdtlp99mNEwwz0MuRWQvnwPt
         Xp+OH3iSZn6RKtfuy79sG1xBGhuhhlRp8bxCrqAr7RhYZ+vsSxYdKovagshJpdo0I2ef
         E0Vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=K7rGW7hYEauj0lEHNx054QYhURQUQQG6A8fMOX9HH84=;
        b=SyOEZeA65uKyhpQzaOmqnTesjusK44hi2bSTa8QxhPNEMpbcOAR672T83tupcwaG1W
         Rre9QoAm/uuwe4yOsS89SDt6AYZNsvYRRClJGlIKzCZwP0/uKyZCBGiWQGo/GRxcKs9i
         Wz7swHLyAGjrPPfWFG7d54stqU/+twz2fLLQ0Ry+U2WPPQN9s1zU8haF/XIwrGJLjxza
         f9YfWQbG8GxPonVrwGuHsciexWVcW5hhgnr+hlJvas23cFKK9mx7NMhAqlZPMHEKOLD0
         LDKAWt+hEKF+7owQcqny2G5nkXdKbZAWGDs/tBX0dcIOozdbzPUzNoSMEJgZh2myQmVy
         fsSw==
X-Gm-Message-State: AO0yUKWK/zXtBIT8wL2FO/y3bfkAGisUE5dxSuUufD/PEnrrsx3/huJ4
	TH3dxQwXWKvUtVv4sxIFPQQ4lCGa+Ud8SZwU
X-Google-Smtp-Source: AK7set9db9FJqAXFvqnxkWNWao+YM41d9TaJzN8ugnsztfkd9yIZbvWR8jbKEB5MZVXaCknWRUaPNg==
X-Received: by 2002:a5d:504f:0:b0:2bf:942b:ddc with SMTP id h15-20020a5d504f000000b002bf942b0ddcmr13630182wrt.55.1677255994674;
        Fri, 24 Feb 2023 08:26:34 -0800 (PST)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
        by smtp.gmail.com with ESMTPSA id t26-20020a05600c2f9a00b003eae73f0fc1sm3307797wmn.18.2023.02.24.08.26.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Feb 2023 08:26:34 -0800 (PST)
From: Andrew Jones <ajones@ventanamicro.com>
To: linux-riscv@lists.infradead.org,
	kvm-riscv@lists.infradead.org,
	devicetree@vger.kernel.org
Cc: 'Conor Dooley ' <conor.dooley@microchip.com>,
	'Paul Walmsley ' <paul.walmsley@sifive.com>,
	'Palmer Dabbelt ' <palmer@dabbelt.com>,
	'Sudip Mukherjee ' <sudip.mukherjee@codethink.co.uk>,
	'Ben Dooks ' <ben.dooks@codethink.co.uk>,
	'Atish Patra ' <atishp@rivosinc.com>,
	'Albert Ou ' <aou@eecs.berkeley.edu>,
	'Anup Patel ' <apatel@ventanamicro.com>,
	'Krzysztof Kozlowski ' <krzysztof.kozlowski+dt@linaro.org>,
	'Rob Herring ' <robh@kernel.org>,
	'Jisheng Zhang ' <jszhang@kernel.org>,
	'Heiko Stuebner ' <heiko@sntech.de>
Subject: [PATCH v6 2/8] RISC-V: Factor out body of riscv_init_cbom_blocksize loop
Date: Fri, 24 Feb 2023 17:26:25 +0100
Message-Id: <20230224162631.405473-3-ajones@ventanamicro.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230224162631.405473-1-ajones@ventanamicro.com>
References: <20230224162631.405473-1-ajones@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230224_082638_128189_FDDEFD1D 
X-CRM114-Status: GOOD (  10.27  )
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

Refactor riscv_init_cbom_blocksize() to prepare for it to be used
for both cbom block size and cboz block size.

Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
Reviewed-by: Heiko Stuebner <heiko@sntech.de>
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
---
 arch/riscv/mm/cacheflush.c | 45 +++++++++++++++++++++-----------------
 1 file changed, 25 insertions(+), 20 deletions(-)

diff --git a/arch/riscv/mm/cacheflush.c b/arch/riscv/mm/cacheflush.c
index 3cc07ed45aeb..eaf23fc14966 100644
--- a/arch/riscv/mm/cacheflush.c
+++ b/arch/riscv/mm/cacheflush.c
@@ -98,34 +98,39 @@ void flush_icache_pte(pte_t pte)
 unsigned int riscv_cbom_block_size;
 EXPORT_SYMBOL_GPL(riscv_cbom_block_size);
 
+static void cbo_get_block_size(struct device_node *node,
+			       const char *name, u32 *block_size,
+			       unsigned long *first_hartid)
+{
+	unsigned long hartid;
+	u32 val;
+
+	if (riscv_of_processor_hartid(node, &hartid))
+		return;
+
+	if (of_property_read_u32(node, name, &val))
+		return;
+
+	if (!*block_size) {
+		*block_size = val;
+		*first_hartid = hartid;
+	} else if (*block_size != val) {
+		pr_warn("%s mismatched between harts %lu and %lu\n",
+			name, *first_hartid, hartid);
+	}
+}
+
 void riscv_init_cbom_blocksize(void)
 {
 	struct device_node *node;
 	unsigned long cbom_hartid;
-	u32 val, probed_block_size;
-	int ret;
+	u32 probed_block_size;
 
 	probed_block_size = 0;
 	for_each_of_cpu_node(node) {
-		unsigned long hartid;
-
-		ret = riscv_of_processor_hartid(node, &hartid);
-		if (ret)
-			continue;
-
 		/* set block-size for cbom extension if available */
-		ret = of_property_read_u32(node, "riscv,cbom-block-size", &val);
-		if (ret)
-			continue;
-
-		if (!probed_block_size) {
-			probed_block_size = val;
-			cbom_hartid = hartid;
-		} else {
-			if (probed_block_size != val)
-				pr_warn("cbom-block-size mismatched between harts %lu and %lu\n",
-					cbom_hartid, hartid);
-		}
+		cbo_get_block_size(node, "riscv,cbom-block-size",
+				   &probed_block_size, &cbom_hartid);
 	}
 
 	if (probed_block_size)
-- 
2.39.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
