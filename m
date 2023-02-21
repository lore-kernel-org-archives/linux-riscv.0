Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F014C61DA3
	for <linux-riscv@archiver.kernel.org>; Tue, 21 Feb 2023 20:15:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lLJ9EEhHsunDc+WJ100hoicqJRYxRyx6/MEyf7CpG4Y=; b=V/zlp73P0N3con
	kfwE2A0yaV+LsdUUmH1jOPa+rS1m91MGkGKhi04jOHLjev54JxReswkwU3QLaYp4ssahTlMoKnxOI
	jWg/Q1BIPnb2CDu/zHxN8Blr9GlQGnLW9wkUCi2+lj0zblrcIm8aO6xtISK4CmB6+pgJcJukbomYg
	TQYuQO1SGtR8AQn74jiTcNdfLzfJNFxYDDg4HONqG14j5IYrA1iveuVCPCgzoBk2Xn0hksVMiftom
	MlA12wBlPv8w4E5NqaEn0t7pxvwLSWNz0p1eogLA25lqMsKxBh2OplDQJxswkDcRCtSZoveroMhzj
	/Fs8CPgabO9vJX/Ornhw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pUZ30-009fgs-BH; Tue, 21 Feb 2023 20:15:34 +0000
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pUY0w-009Uok-C1
	for linux-riscv@lists.infradead.org; Tue, 21 Feb 2023 19:09:25 +0000
Received: by mail-ed1-x532.google.com with SMTP id da10so22604048edb.3
        for <linux-riscv@lists.infradead.org>; Tue, 21 Feb 2023 11:09:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=K7rGW7hYEauj0lEHNx054QYhURQUQQG6A8fMOX9HH84=;
        b=cC0ULT7/+BrHU2ZvV2TFw46UvQ/44ePZIIwdLcHDoSg8FUU1oNlaQ7Vv/h1ge8HGtl
         SgNA+8Vt7WTURfWna3wXHm4egrYzEjFssuiE/tSKZf80ouVpb9TCCbkve1Wo98b153i6
         x4w1A0Dka/Rcokbu/RGvMn9wXff/oA0e6ORxiGp7SsETSDQOETyhtKxuwLt1v3Xmn88X
         zHRQKpxFv63xVx4jXQzuDL08VRddAa/f8/hpj3h79+8Pwk3yl5Qf0SvlUzAkFhrMRG9A
         pezlqblmliS8oYq7P9gkFYb0bqJ+30J5gKsS2OBbpln4qmIqbWv7tZFNsJYoTduTXu3e
         OPbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=K7rGW7hYEauj0lEHNx054QYhURQUQQG6A8fMOX9HH84=;
        b=spjAKn+4aiyXfZQWmZTDs3OIHJbURujmPNec4t/R3y06OJOPKOmq1L0Q4452ul8yrk
         q9M2O/EtI9TiK17ONPoaxBWxlWSj6xVL8WBZZdRU8wpDeCWo5Hxm2nPjHWCOOJWQCl2f
         h2JgKqlqKrN6Io0OmEetQzuZRRSu0sttyca/4vQc1L7NA88ifu+moZ5T5pLrKiQOyaZP
         NV24EYrVmTkmexvuuzEgFgMq0kwtyJ8tHzdQxYjWb0Bw1ZA7CUMLLEMtfiosdCOMA96X
         1SY0NOSYCpc5cgvK8iTGFIN6JTaV2QF7U56UjTSCBTEXUQFfV7LJHXDkYTmlXirGgQ3D
         XBNQ==
X-Gm-Message-State: AO0yUKVUWS984+6lqwwUhXTg8JyQ4GEL1Fd7DJHdqAhMCJ6L5wONKKTv
	FLKP0VuY8MC2SFpyS7XLg+rQQwbVPuuBMVat
X-Google-Smtp-Source: AK7set9FgSEil/ObjCnoBx5+EIDW01ef3uYae3HN5WaDBbhvpW7zd/e0eZAry1Z286cMc6/eMEx5VA==
X-Received: by 2002:a17:906:dac1:b0:8b1:2b8b:a1fa with SMTP id xi1-20020a170906dac100b008b12b8ba1famr21315665ejb.47.1677006560758;
        Tue, 21 Feb 2023 11:09:20 -0800 (PST)
Received: from localhost (cst2-173-16.cust.vodafone.cz. [31.30.173.16])
        by smtp.gmail.com with ESMTPSA id lg17-20020a170906f89100b008b1797a53b4sm6729902ejb.215.2023.02.21.11.09.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Feb 2023 11:09:20 -0800 (PST)
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
Subject: [PATCH v5 2/8] RISC-V: Factor out body of riscv_init_cbom_blocksize loop
Date: Tue, 21 Feb 2023 20:09:10 +0100
Message-Id: <20230221190916.572454-3-ajones@ventanamicro.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230221190916.572454-1-ajones@ventanamicro.com>
References: <20230221190916.572454-1-ajones@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230221_110922_416178_F02D566F 
X-CRM114-Status: GOOD (  10.77  )
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
