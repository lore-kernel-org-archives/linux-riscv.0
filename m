Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC1FDECAAA1
	for <linux-riscv@archiver.kernel.org>; Thu, 27 Oct 2022 13:04:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kP/A68y+JeS8DpLhiyeYQ1H290PhH/2SF4sJXS9CHmQ=; b=SMYEEzfuiqarLu
	3p57eFzorhheCXPvlivKe2j2CWQVDf7Micg4OWQx1ll/wYH4cAd/2FTNmjhHZQYzV/quvExV87fA0
	goUuirMA83TqhvWMIuBCpxkPKlZkk5ZKGL6fhwcWjCmtR/fvtkJktK/zFHwVyR2+uUYF1H7i6Saq4
	RNIm7ku4aja8L8uEjDZsj34mumHVtDZraoPJxoOfovoD/X050+ZhXyToQNEZQ3WZBqucBqq/MBvvt
	DqFXLL7oEVGIvN3TGjwKXyIYruNvuVQ06E+2PnfTnRS+p6reJGniMKxfvy4MSctPBJIggz9aWkOMK
	rSQpfveJYJCkb5R2khEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oo2YL-00DJVi-0L; Thu, 27 Oct 2022 13:04:09 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oo2X8-00DJ0C-1Y
	for linux-riscv@lists.infradead.org; Thu, 27 Oct 2022 13:02:55 +0000
Received: by mail-wr1-x436.google.com with SMTP id z14so2038545wrn.7
        for <linux-riscv@lists.infradead.org>; Thu, 27 Oct 2022 06:02:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tB7b6oKR1dfUOgZAsQ2t0LFxMC26256opXYDnh4htWI=;
        b=hel5t1Nv9aALn3lZc7KRzARJ3XpiGU6rcAWv9iymh/hkpgFOsASWeFOaZxpDcuqONb
         Uahw+bFSpnYkyKNOnw3JIihcsnWSypIdzcSt5lvYu17/rLeURHLwBrqvQstEk/aIO6yf
         Joe7tzfOfw8LSZrKRZQrvlNCOKQZW515+MjsuUHhaIfRAAHjbruDwMAylkx7Xoq0tkfA
         ShO3333gIUMLNuHxnrM97f/VnPo0pa2kWH1OQtaLkExt96dUdEavsgpSQ7RRR70jnODA
         ONVK9QSQGJRQcVMMGOl0h2wvefqIynqprVEfCFSxpKxJDDC7+OYpaY74LLgzkj/4eH6m
         yBuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tB7b6oKR1dfUOgZAsQ2t0LFxMC26256opXYDnh4htWI=;
        b=kuXsySvVo/YQnKEmr4AOWA7XPfmrFOpqLtWHIH+zEkH2HJED7YQ/Brqj+zOLg5W06g
         tilksnuTdLuA/HE6CmE1gTddDT5CC6XVWPthqFp06wcESNQsIJsWeDbf732KMCxeBZCG
         iNnWovqy4TlEJyPUgeflJDqBHh1qgDAIWINcsGb1TEgICLve995GzAgCC84kSIv+x51z
         Yc3nquj+uv2rVNNND1D3vTQc1o5dA2Px7k1cc9PSHuOv2i4QbO+zkE6WEVQzU9/2o5+9
         SuLnpwiPwzzLV9+Bzx6kPeDQ53Iv86Eh+KQ9tnkdmbBCyeLste0dNPLAKMunhqy9JULT
         DI0A==
X-Gm-Message-State: ACrzQf1qX/OuEapVqwx/WNQ0hExBrVKEQi3XXIFugraWRGq13Jps6+dU
	yIj/PC10EsUrMko8HcX80XKDsBjWC3zzZw==
X-Google-Smtp-Source: AMsMyM7xmBzpLb+o7KlqopAHv9x2UiU8xiso95f8+//9/YjTCtomW7FGBNQJ1bQ6lAs8B/j1nZi+EA==
X-Received: by 2002:a5d:5a18:0:b0:22f:4f72:213a with SMTP id bq24-20020a5d5a18000000b0022f4f72213amr32675517wrb.57.1666875770575;
        Thu, 27 Oct 2022 06:02:50 -0700 (PDT)
Received: from localhost (cst2-173-61.cust.vodafone.cz. [31.30.173.61])
        by smtp.gmail.com with ESMTPSA id n5-20020a05600c304500b003a84375d0d1sm4426782wmh.44.2022.10.27.06.02.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Oct 2022 06:02:50 -0700 (PDT)
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
Subject: [PATCH 1/9] RISC-V: Factor out body of riscv_init_cbom_blocksize loop
Date: Thu, 27 Oct 2022 15:02:39 +0200
Message-Id: <20221027130247.31634-2-ajones@ventanamicro.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221027130247.31634-1-ajones@ventanamicro.com>
References: <20221027130247.31634-1-ajones@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221027_060254_134609_F27C591A 
X-CRM114-Status: GOOD (  10.41  )
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
---
 arch/riscv/mm/cacheflush.c | 45 +++++++++++++++++++++-----------------
 1 file changed, 25 insertions(+), 20 deletions(-)

diff --git a/arch/riscv/mm/cacheflush.c b/arch/riscv/mm/cacheflush.c
index 57b40a350420..f096b9966cae 100644
--- a/arch/riscv/mm/cacheflush.c
+++ b/arch/riscv/mm/cacheflush.c
@@ -91,34 +91,39 @@ void flush_icache_pte(pte_t pte)
 unsigned int riscv_cbom_block_size;
 EXPORT_SYMBOL_GPL(riscv_cbom_block_size);
 
+static void cbo_get_block_size(struct device_node *node,
+			       const char *name, u32 *blksz,
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
+	if (!*blksz) {
+		*blksz = val;
+		*first_hartid = hartid;
+	} else if (*blksz != val) {
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
2.37.3


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
