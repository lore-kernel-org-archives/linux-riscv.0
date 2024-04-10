Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7743ECD11C2
	for <linux-riscv@archiver.kernel.org>; Wed, 10 Apr 2024 11:58:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VBkYYGvT9sqw5L0YnMqs4qJ4IOTrmt+jEvxSIQfkSP0=; b=U1OE9lluutBH2j
	LjOQLi7KMVHcolkUniUq2FX39fwHdu+s5uAENlGlr4Fr8LlxHHl6mDToKS0jejg5WiDwcqUX9eE6o
	uVWBUsC2v1wqcegtCMyROeQyU8polOR4b5fdi2/aYS5dIafr8koMhBPdcxZb+fqFjfCb1109W3MZg
	SQ4oAZgeYQHy3Rlu1AIdiSVSGvQuyf1DnGxGvhrWFe1RNifVEFQDS4fFjqLQ1tjq82DJbnGxhfwuk
	Z/6I5LuxUJ0G0BDjj6+emDgKyH7EAu1v7PxXNhNSP9gGMd6yxqACDqKVpeDBh8WCY6cJBOmKkvas3
	70+DV78a/9UNcfCgTteA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruWbO-00000006ljY-2fLU;
	Wed, 10 Apr 2024 11:58:54 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruWbH-00000006ldf-0o0B
	for linux-riscv@lists.infradead.org;
	Wed, 10 Apr 2024 11:58:48 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id A2F5B61C15;
	Wed, 10 Apr 2024 11:58:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 224EEC43390;
	Wed, 10 Apr 2024 11:58:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1712750326;
	bh=I0ucffUjI9S2cz08Ial3I81TqrYvCDbjo9pZBliGHHs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=t5pvV5ZzYr/RzporQ5oxS0aMfiV+V0q4Y2GxhgF1z79jFoCE0gBmPkJy7lhMoquBE
	 x5z4w5o7IMU/EeUHyW97iTep8pYcNF6KIh+C6IB1CYcLFVxgjZNCMMTbCIvMFB+BwK
	 Szme+Lh+6kyqU/xCcuo6woWbxG6NduD1jomFGw6DXp9AdBzEZ/tjEm8rGLIakgd0RY
	 npZInp/oD3QhFqLgV5ZO/OlqiFRHKixUjPiQCLE4yCKluiRNE6DxYAHJqYLS8Chb01
	 R6SpQ+opJhACIPLeF7JZyq61Arnb3jTq/ZCsAu1QCNK1g8CO+Q5qModKWlw/T5WglX
	 0v98rHwxKfdJA==
From: Conor Dooley <conor@kernel.org>
To: linux-riscv@lists.infradead.org
Cc: conor@kernel.org,
	Conor Dooley <conor.dooley@microchip.com>,
	Daire McNamara <daire.mcnamara@microchip.com>,
	Cyril Jean <cyril.jean@microchip.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 3/5] firmware: microchip: clarify that sizes and addresses are in hex
Date: Wed, 10 Apr 2024 12:58:06 +0100
Message-ID: <20240410-elk-staleness-285063ef0433@spud>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240410-opulently-epic-8654bdac3422@spud>
References: <20240410-opulently-epic-8654bdac3422@spud>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2012; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=BNSIAOq6X1LAhr9L0BQrr3EsDDjmIu+xC/kpYkZfVl4=; b=owGbwMvMwCFWscWwfUFT0iXG02pJDGlidVfOqLZ/vnLjSxXD8h3G/DkLbvKtbNCIX7r23GEmu ZX9mnmSHaUsDGIcDLJiiiyJt/tapNb/cdnh3PMWZg4rE8gQBi5OAZgImxEjw9U517olFpwtyuQL X5PH7H3p4OtWvTtsN/foftl8pObDp7cM/5PmMj+azXDi/pYJrpMub31nvWG+4a3j7w7zqk1h1wz beJQFAA==
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240410_045847_305352_86481BBE 
X-CRM114-Status: GOOD (  11.21  )
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

From: Conor Dooley <conor.dooley@microchip.com>

As it says on the tin. It can be kinda confusing when "22830" is in hex,
so prefix the hex numbers with a "0x".

Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 drivers/firmware/microchip/mpfs-auto-update.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/firmware/microchip/mpfs-auto-update.c b/drivers/firmware/microchip/mpfs-auto-update.c
index 298ad21e139b..078ff328f261 100644
--- a/drivers/firmware/microchip/mpfs-auto-update.c
+++ b/drivers/firmware/microchip/mpfs-auto-update.c
@@ -279,7 +279,7 @@ static int mpfs_auto_update_set_image_address(struct mpfs_auto_update_priv *priv
 	       AUTO_UPDATE_DIRECTORY_WIDTH);
 	memset(buffer + AUTO_UPDATE_BLANK_DIRECTORY, 0x0, AUTO_UPDATE_DIRECTORY_WIDTH);
 
-	dev_info(priv->dev, "Writing the image address (%x) to the flash directory (%llx)\n",
+	dev_info(priv->dev, "Writing the image address (0x%x) to the flash directory (0x%llx)\n",
 		 image_address, directory_address);
 
 	ret = mtd_write(priv->flash, 0x0, erase_size, &bytes_written, (u_char *)buffer);
@@ -342,7 +342,7 @@ static int mpfs_auto_update_write_bitstream(struct fw_upload *fw_uploader, const
 	erase.len = round_up(size, (size_t)priv->flash->erasesize);
 	erase.addr = image_address;
 
-	dev_info(priv->dev, "Erasing the flash at address (%x)\n", image_address);
+	dev_info(priv->dev, "Erasing the flash at address (0x%x)\n", image_address);
 	ret = mtd_erase(priv->flash, &erase);
 	if (ret)
 		goto out;
@@ -352,7 +352,7 @@ static int mpfs_auto_update_write_bitstream(struct fw_upload *fw_uploader, const
 	 * will do all of that itself - including verifying that the bitstream
 	 * is valid.
 	 */
-	dev_info(priv->dev, "Writing the image to the flash at address (%x)\n", image_address);
+	dev_info(priv->dev, "Writing the image to the flash at address (0x%x)\n", image_address);
 	ret = mtd_write(priv->flash, (loff_t)image_address, size, &bytes_written, data);
 	if (ret)
 		goto out;
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
