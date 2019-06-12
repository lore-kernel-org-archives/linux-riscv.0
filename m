Return-Path: <SRS0=2mpb=UL=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DCC32C31E46
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 12 Jun 2019 10:49:36 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AB7F92082C
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 12 Jun 2019 10:49:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="YxHU/wiU";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="ZSELiBES"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AB7F92082C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=nA/B+0GKGPxB65svmsoDA0qQaT+vX6Akrm4vTQOHkOA=; b=YxHU/wiUddpqrZU8SVL/I7kXtJ
	azR0mkyn6CtqhNb7vUba56IA6qJoWefrEecuzJtWX63ZzNOPYdEJxeRmI1foOpQs/Et1O9wsMV2Bt
	QCl6CjLIfINGcl/aEZKzAIYKzAuL0eN6dSIt1cMW5Hc5l2G/hYBe2O1HC+t76nbxRUkTVQhsu7OOT
	FeoNJ6RmMhVRVJqLRyvuTDhMjZza3ZufD5Gh9HXyk1sJoImsECXpLFrLYS+mavF8zjddiNVFT9O3b
	kjzTLgj9VhmlPnv8IVJDXXGvKVD60jIyxv0C2D02FHu0KGC5sJtbjOgvgV4bt+eNbQ8N7CrmhltWK
	TazHuS0w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hb0ou-00019W-Fs; Wed, 12 Jun 2019 10:49:32 +0000
Received: from mail-pg1-x543.google.com ([2607:f8b0:4864:20::543])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hb0oX-0000jl-S9
 for linux-riscv@lists.infradead.org; Wed, 12 Jun 2019 10:49:12 +0000
Received: by mail-pg1-x543.google.com with SMTP id 196so8729555pgc.6
 for <linux-riscv@lists.infradead.org>; Wed, 12 Jun 2019 03:49:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=s7M7QYSxGt/aVWkXZdIMJHrBQMPJsRF6Kb+FhsyP4CA=;
 b=ZSELiBESGPlceqPX3xiDLypLBYaVWBovPKh751e21AzuB6YBJLTeXfqMFPfCnHHtwD
 KzSenLJAQYR5e8gZfmN2mvHPZsmlAOMibc4jRsDbtXbGa+Zh6yxNbJ24PKWZzucJMN3d
 3DP5BBk8wqJQD2cC5tRRguKt7ZBDCJyNE/90iFKnTr9ocx8UsMsRQXMteuWCpQNQXSGd
 5HJ+/Nvfen8CBt1ZKi6Rx6UXP3nKpErfFa1wrVwpUY2LC0iNqjGCtcNjV9USd0PBGSbL
 Br+hzWZWfhfEW8VqGFrFjhkz8wIIkI7oBwu4rOXoCJi3OjvA85GSY3IRHmTic5v0Y8PC
 CX/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=s7M7QYSxGt/aVWkXZdIMJHrBQMPJsRF6Kb+FhsyP4CA=;
 b=Th45br8cbtizErR4tVFEayShKH6VHgf9p8QCXcvpFN9WFxHZamO+bG9pve5Omv65qZ
 LiSszxGVKLFPj3Yvi02L10XjCaTriAeJTCTN3IqTBZgmb5PUu/O4nU4z8tfmqiVaTumL
 TAl6u/FLmvNdGw1A77hf0Gl8ppTmPYnDM+aShIhYVHYek7sM1ZwtHBkTP8Zy1t76ljIB
 uYH8d8X1ePVEtWi3yRf83/eFDpIS3PoMzMHSXdZt/f1YadEHpIXkN0MBl+bwmJdBDM3c
 auXPHazJ/P8zTNAgDI+8a7rrFJfz/XkJa5GoHwzUjU0KbGZedIZjQdE5oIJ//LAK8xzS
 xNcQ==
X-Gm-Message-State: APjAAAUSjkQMlngBkch/zq3Fdr1TcshjXSBGUVi2xAZC7yigXaw4guPg
 Dh62cwy+u9sYklTf1DekCiunTA==
X-Google-Smtp-Source: APXvYqw0gz/9zS/lAD2oWKmUiowOrlPz0e+ywn/q0KQ7ZMUPVYjMbZ10Yp+KlKI2tXbBvWxiC43gVg==
X-Received: by 2002:a63:6881:: with SMTP id
 d123mr18402074pgc.201.1560336546861; 
 Wed, 12 Jun 2019 03:49:06 -0700 (PDT)
Received: from buildserver-90.open-silicon.com ([114.143.65.226])
 by smtp.googlemail.com with ESMTPSA id y22sm12241561pfm.70.2019.06.12.03.49.02
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Wed, 12 Jun 2019 03:49:06 -0700 (PDT)
From: Sagar Shrikant Kadam <sagar.kadam@sifive.com>
To: marek.vasut@gmail.com, tudor.ambarus@microchip.com, dwmw2@infradead.org,
 computersforpeace@gmail.com, miquel.raynal@bootlin.com, richard@nod.at,
 vigneshr@ti.com, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: [PATCH v5 1/3] mtd: spi-nor: add support for is25wp256
Date: Wed, 12 Jun 2019 16:17:54 +0530
Message-Id: <1560336476-31763-2-git-send-email-sagar.kadam@sifive.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1560336476-31763-1-git-send-email-sagar.kadam@sifive.com>
References: <1560336476-31763-1-git-send-email-sagar.kadam@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190612_034909_938829_6F2B9156 
X-CRM114-Status: GOOD (  13.38  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: wesley@sifive.com, palmer@sifive.com,
 Sagar Shrikant Kadam <sagar.kadam@sifive.com>, aou@eecs.berkeley.edu,
 paul.walmsley@sifive.com
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

Update spi_nor_id table for is25wp256 (32MB)device from ISSI,
present on HiFive Unleashed dev board (Rev: A00).

Set method to enable quad mode for ISSI device in flash parameters
table.

Based on code originally written by Wesley Terpstra <wesley@sifive.com>
and/or Palmer Dabbelt <palmer@sifive.com>
https://github.com/riscv/riscv-linux/commit/c94e267766d62bc9a669611c3d0c8ed5ea26569b

Signed-off-by: Sagar Shrikant Kadam <sagar.kadam@sifive.com>
---
 drivers/mtd/spi-nor/spi-nor.c | 10 +++++++++-
 include/linux/mtd/spi-nor.h   |  1 +
 2 files changed, 10 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
index 73172d7..2d5a925 100644
--- a/drivers/mtd/spi-nor/spi-nor.c
+++ b/drivers/mtd/spi-nor/spi-nor.c
@@ -1834,6 +1834,10 @@ static int sr2_bit7_quad_enable(struct spi_nor *nor)
 			SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ) },
 	{ "is25wp128",  INFO(0x9d7018, 0, 64 * 1024, 256,
 			SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ) },
+	{ "is25wp256", INFO(0x9d7019, 0, 64 * 1024, 1024,
+			SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ |
+			SPI_NOR_4B_OPCODES)
+	},
 
 	/* Macronix */
 	{ "mx25l512e",   INFO(0xc22010, 0, 64 * 1024,   1, SECT_4K) },
@@ -3652,6 +3656,10 @@ static int spi_nor_init_params(struct spi_nor *nor,
 		case SNOR_MFR_MACRONIX:
 			params->quad_enable = macronix_quad_enable;
 			break;
+		case SNOR_MFR_ISSI:
+			params->quad_enable = macronix_quad_enable;
+			break;
+
 
 		case SNOR_MFR_ST:
 		case SNOR_MFR_MICRON:
@@ -4129,7 +4137,7 @@ int spi_nor_scan(struct spi_nor *nor, const char *name,
 	if (ret)
 		return ret;
 
-	if (nor->addr_width) {
+	if (nor->addr_width && JEDEC_MFR(info) != SNOR_MFR_ISSI) {
 		/* already configured from SFDP */
 	} else if (info->addr_width) {
 		nor->addr_width = info->addr_width;
diff --git a/include/linux/mtd/spi-nor.h b/include/linux/mtd/spi-nor.h
index b3d360b..ff13297 100644
--- a/include/linux/mtd/spi-nor.h
+++ b/include/linux/mtd/spi-nor.h
@@ -19,6 +19,7 @@
 #define SNOR_MFR_ATMEL		CFI_MFR_ATMEL
 #define SNOR_MFR_GIGADEVICE	0xc8
 #define SNOR_MFR_INTEL		CFI_MFR_INTEL
+#define SNOR_MFR_ISSI		0x9d		/* ISSI */
 #define SNOR_MFR_ST		CFI_MFR_ST	/* ST Micro */
 #define SNOR_MFR_MICRON		CFI_MFR_MICRON	/* Micron */
 #define SNOR_MFR_MACRONIX	CFI_MFR_MACRONIX
-- 
1.9.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
