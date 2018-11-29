Return-Path: <SRS0=kIcs=OI=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9D706C43441
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 29 Nov 2018 05:59:32 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6ED0821019
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 29 Nov 2018 05:59:32 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="dq2Dzy8Q";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="JHkkYFMt"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6ED0821019
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=EaXq2IeuCnG5noKDQm1fE7kyVDdQ2JPjVvn33yHumwM=; b=dq2Dzy8QvdzYBCMswXR0Fz/I77
	bbt6M1TzP8Xegbrb8cs6BwybuxOr7S+KfBEL3h+oQ+mYVnOJiXomVgp4vHbVrVi6Q0H31qLvJc387
	1RYYTIg8ngakjR8Ptjdo578B1ac6C7xE8033N3XKhYCLM6TWdXJHw+njR+1ghrhSOFlvrqpTyi1vc
	wJOYmf1Dz/SxpjnK02QigDVgqSLjMwYZKhse6SVFjHDCrHLhgO4fEshTX43vNGkh0SFDdwZIohZiW
	5JoiqC0EyMwwqCaK+Ec4lB5wJyZ5UUW9TtIJLgLS5sF6fKLv+DTQc6ACGKta+tb6DlomwyTrFFyGw
	AgWh+kug==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gSFMJ-0001Ra-Uu; Thu, 29 Nov 2018 05:59:31 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gSFM6-0001Fd-R1; Thu, 29 Nov 2018 05:59:20 +0000
Received: from sasha-vm.mshome.net (unknown [37.142.5.207])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 58138208E7;
 Thu, 29 Nov 2018 05:59:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1543471148;
 bh=uOxZNZa7T7GrHZFmRhyztkpMT+qrp58BkMRmlFZYg0E=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=JHkkYFMtZBjf9T+Oc9M1SI8vwTJnSVu1RgspKRtyCohVylnfl6QxO0iEn7UGbdIPB
 b5VsdYZg36W0QGCycV8fV54G/uvX9P3m/ZpB5Aa2xXHSkFqyiz7p5MqzMBoV8Nmp9I
 UtBfwfK7+WKIclHWAX3ZuTUpfZJV4Z86HFGhn5ns=
From: Sasha Levin <sashal@kernel.org>
To: stable@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH AUTOSEL 4.19 37/68] mtd: rawnand: qcom: Namespace prefix some
 commands
Date: Thu, 29 Nov 2018 00:55:28 -0500
Message-Id: <20181129055559.159228-37-sashal@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20181129055559.159228-1-sashal@kernel.org>
References: <20181129055559.159228-1-sashal@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181128_215918_910801_BE1D3B37 
X-CRM114-Status: GOOD (  11.36  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Olof Johansson <olof@lixom.net>,
 Boris Brezillon <boris.brezillon@bootlin.com>, linux-riscv@lists.infradead.org,
 linux-mtd@lists.infradead.org, Sasha Levin <sashal@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
Message-ID: <20181129055528.exiy7gY08pPXB2CJ9jCfH8QlizJwqZ_ZDqEBe0fvgQc@z>

From: Olof Johansson <olof@lixom.net>

[ Upstream commit 33bf5519ae5dd356b182a94e3622f42860274a38 ]

PAGE_READ is used by RISC-V arch code included through mm headers,
and it makes sense to bring in a prefix on these in the driver.

drivers/mtd/nand/raw/qcom_nandc.c:153: warning: "PAGE_READ" redefined
 #define PAGE_READ   0x2
In file included from include/linux/memremap.h:7,
                 from include/linux/mm.h:27,
                 from include/linux/scatterlist.h:8,
                 from include/linux/dma-mapping.h:11,
                 from drivers/mtd/nand/raw/qcom_nandc.c:17:
arch/riscv/include/asm/pgtable.h:48: note: this is the location of the previous definition

Caught by riscv allmodconfig.

Signed-off-by: Olof Johansson <olof@lixom.net>
Reviewed-by: Miquel Raynal <miquel.raynal@bootlin.com>
Signed-off-by: Boris Brezillon <boris.brezillon@bootlin.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/mtd/nand/raw/qcom_nandc.c | 32 +++++++++++++++----------------
 1 file changed, 16 insertions(+), 16 deletions(-)

diff --git a/drivers/mtd/nand/raw/qcom_nandc.c b/drivers/mtd/nand/raw/qcom_nandc.c
index d1d470bb32e4..8815f3e2b718 100644
--- a/drivers/mtd/nand/raw/qcom_nandc.c
+++ b/drivers/mtd/nand/raw/qcom_nandc.c
@@ -151,15 +151,15 @@
 #define	NAND_VERSION_MINOR_SHIFT	16
 
 /* NAND OP_CMDs */
-#define	PAGE_READ			0x2
-#define	PAGE_READ_WITH_ECC		0x3
-#define	PAGE_READ_WITH_ECC_SPARE	0x4
-#define	PROGRAM_PAGE			0x6
-#define	PAGE_PROGRAM_WITH_ECC		0x7
-#define	PROGRAM_PAGE_SPARE		0x9
-#define	BLOCK_ERASE			0xa
-#define	FETCH_ID			0xb
-#define	RESET_DEVICE			0xd
+#define	OP_PAGE_READ			0x2
+#define	OP_PAGE_READ_WITH_ECC		0x3
+#define	OP_PAGE_READ_WITH_ECC_SPARE	0x4
+#define	OP_PROGRAM_PAGE			0x6
+#define	OP_PAGE_PROGRAM_WITH_ECC	0x7
+#define	OP_PROGRAM_PAGE_SPARE		0x9
+#define	OP_BLOCK_ERASE			0xa
+#define	OP_FETCH_ID			0xb
+#define	OP_RESET_DEVICE			0xd
 
 /* Default Value for NAND_DEV_CMD_VLD */
 #define NAND_DEV_CMD_VLD_VAL		(READ_START_VLD | WRITE_START_VLD | \
@@ -692,11 +692,11 @@ static void update_rw_regs(struct qcom_nand_host *host, int num_cw, bool read)
 
 	if (read) {
 		if (host->use_ecc)
-			cmd = PAGE_READ_WITH_ECC | PAGE_ACC | LAST_PAGE;
+			cmd = OP_PAGE_READ_WITH_ECC | PAGE_ACC | LAST_PAGE;
 		else
-			cmd = PAGE_READ | PAGE_ACC | LAST_PAGE;
+			cmd = OP_PAGE_READ | PAGE_ACC | LAST_PAGE;
 	} else {
-			cmd = PROGRAM_PAGE | PAGE_ACC | LAST_PAGE;
+		cmd = OP_PROGRAM_PAGE | PAGE_ACC | LAST_PAGE;
 	}
 
 	if (host->use_ecc) {
@@ -1170,7 +1170,7 @@ static int nandc_param(struct qcom_nand_host *host)
 	 * in use. we configure the controller to perform a raw read of 512
 	 * bytes to read onfi params
 	 */
-	nandc_set_reg(nandc, NAND_FLASH_CMD, PAGE_READ | PAGE_ACC | LAST_PAGE);
+	nandc_set_reg(nandc, NAND_FLASH_CMD, OP_PAGE_READ | PAGE_ACC | LAST_PAGE);
 	nandc_set_reg(nandc, NAND_ADDR0, 0);
 	nandc_set_reg(nandc, NAND_ADDR1, 0);
 	nandc_set_reg(nandc, NAND_DEV0_CFG0, 0 << CW_PER_PAGE
@@ -1224,7 +1224,7 @@ static int erase_block(struct qcom_nand_host *host, int page_addr)
 	struct qcom_nand_controller *nandc = get_qcom_nand_controller(chip);
 
 	nandc_set_reg(nandc, NAND_FLASH_CMD,
-		      BLOCK_ERASE | PAGE_ACC | LAST_PAGE);
+		      OP_BLOCK_ERASE | PAGE_ACC | LAST_PAGE);
 	nandc_set_reg(nandc, NAND_ADDR0, page_addr);
 	nandc_set_reg(nandc, NAND_ADDR1, 0);
 	nandc_set_reg(nandc, NAND_DEV0_CFG0,
@@ -1255,7 +1255,7 @@ static int read_id(struct qcom_nand_host *host, int column)
 	if (column == -1)
 		return 0;
 
-	nandc_set_reg(nandc, NAND_FLASH_CMD, FETCH_ID);
+	nandc_set_reg(nandc, NAND_FLASH_CMD, OP_FETCH_ID);
 	nandc_set_reg(nandc, NAND_ADDR0, column);
 	nandc_set_reg(nandc, NAND_ADDR1, 0);
 	nandc_set_reg(nandc, NAND_FLASH_CHIP_SELECT,
@@ -1276,7 +1276,7 @@ static int reset(struct qcom_nand_host *host)
 	struct nand_chip *chip = &host->chip;
 	struct qcom_nand_controller *nandc = get_qcom_nand_controller(chip);
 
-	nandc_set_reg(nandc, NAND_FLASH_CMD, RESET_DEVICE);
+	nandc_set_reg(nandc, NAND_FLASH_CMD, OP_RESET_DEVICE);
 	nandc_set_reg(nandc, NAND_EXEC_CMD, 1);
 
 	write_reg_dma(nandc, NAND_FLASH_CMD, 1, NAND_BAM_NEXT_SGL);
-- 
2.17.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
