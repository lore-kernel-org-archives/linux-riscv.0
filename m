Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94BE0CD11C2
	for <linux-riscv@archiver.kernel.org>; Wed, 10 Apr 2024 11:59:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wiWytukYbZFCL/h1siw3tkkehW2tfnI+mSALMjFgA6c=; b=EU1wUqjLyp0fGw
	LEcdsk8QVSRPcdZCu2d4v5IdTkx3vp4ECDKEMOBqoBbtGpTvHGmJjRTaoh5Q3aPX+kXKTcHGMFVG5
	fJMdM/5fWy/yICCEw0+GoB1N02l/73bOmfbhnsCex3FGc/Bq7mFfN7PFQqpFz0cbT2AE+8q7/Ij6H
	j0xpUZFO9GMAYgA8u1lHd3IumVUQLFIsoyKMxP5BZJcfsmOUIYOAIY9NgLL0pSWXF6Hf1mk6nYEY5
	q3EE+TyZICBrPfy4bwO9WxPbZrCNiRERKZFDiWt5/QFs30QeeljiOfPe4MC+j6PjwX5oIUM76+q1c
	YTEbPDaJm1RzGiKv4S5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruWbQ-00000006llK-272L;
	Wed, 10 Apr 2024 11:58:56 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruWbI-00000006leZ-3mjU
	for linux-riscv@lists.infradead.org;
	Wed, 10 Apr 2024 11:58:50 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 6AEDC61BFD;
	Wed, 10 Apr 2024 11:58:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DEC8FC43390;
	Wed, 10 Apr 2024 11:58:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1712750328;
	bh=zozmtpGCyzauq3lW42w4fnyusZzE+3jFnWSCycg+74w=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Ki2sL3MhTeMJTG3avbeH1rzNAe7ciJKLADcUu1fQX6z8ruJDN7zDZ+xQ8xSe28t4h
	 YhkH6vqfVaZHU9te9wWvdi5pPKlKDCnRBeBnjIV+Rc48jKhTKBYFD9oeQnL8J4GVZb
	 HVMEZKtFzlB2SOMIasbDU9Gzk2dtbZAuEFDIbmsoSKiape4vzIXXDm8sijBmwY5Sti
	 iWJMcaxZjcQBA1vjeI1rInOjnB4e6VQaeljR0Y+zBZYvOIb0L+mTukLCuWeoyiufay
	 ojFtgFrSaLueQnp9nfK2cr9h0aQ0arl+iRMn1B6ZC2csTJ49/U9Iqe4gmILb/nxfra
	 gCiQ6tAqghoyw==
From: Conor Dooley <conor@kernel.org>
To: linux-riscv@lists.infradead.org
Cc: conor@kernel.org,
	Conor Dooley <conor.dooley@microchip.com>,
	Daire McNamara <daire.mcnamara@microchip.com>,
	Cyril Jean <cyril.jean@microchip.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 4/5] firmware: microchip: move buffer allocation into mpfs_auto_update_set_image_address()
Date: Wed, 10 Apr 2024 12:58:07 +0100
Message-ID: <20240410-manhood-gathering-41ccbfdad649@spud>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240410-opulently-epic-8654bdac3422@spud>
References: <20240410-opulently-epic-8654bdac3422@spud>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=4105; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=wFllIaLoSb4Gw+0g2yEUZWRr6LUeHyCfKeT7QJ6ExZU=; b=owGbwMvMwCFWscWwfUFT0iXG02pJDGlidVd1lBOmeBjKi02Xe3uSP7V/Pf+C1dOcTPVPX1Z9I PRvlXV4RykLgxgHg6yYIkvi7b4WqfV/XHY497yFmcPKBDKEgYtTACbS6srIMPltMsdPBVHxzU9W FgTfqeLbN4m7+g1P2V2hKvkzOg+vpjEyXJ/q3iv1ePUiRh2XM1fvnfeUiNvy4aifBX/iRq4z6fp 57AA=
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240410_045849_142719_5FFE74CE 
X-CRM114-Status: GOOD (  14.12  )
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

This buffer is used exclusively by mpfs_auto_update_set_image_address(),
so move the management of it there, employing the recently added cleanup
infrastructure to avoid littering the function with gotos.

Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 drivers/firmware/microchip/mpfs-auto-update.c | 32 ++++++++-----------
 1 file changed, 13 insertions(+), 19 deletions(-)

diff --git a/drivers/firmware/microchip/mpfs-auto-update.c b/drivers/firmware/microchip/mpfs-auto-update.c
index 078ff328f261..d7ce27f4ba1b 100644
--- a/drivers/firmware/microchip/mpfs-auto-update.c
+++ b/drivers/firmware/microchip/mpfs-auto-update.c
@@ -9,6 +9,7 @@
  *
  * Author: Conor Dooley <conor.dooley@microchip.com>
  */
+#include <linux/cleanup.h>
 #include <linux/debugfs.h>
 #include <linux/firmware.h>
 #include <linux/math.h>
@@ -233,15 +234,17 @@ static int mpfs_auto_update_verify_image(struct fw_upload *fw_uploader)
 	return ret;
 }
 
-static int mpfs_auto_update_set_image_address(struct mpfs_auto_update_priv *priv, char *buffer,
+static int mpfs_auto_update_set_image_address(struct mpfs_auto_update_priv *priv,
 					      u32 image_address, loff_t directory_address)
 {
 	struct erase_info erase;
-	size_t erase_size = AUTO_UPDATE_DIRECTORY_SIZE;
+	size_t erase_size = round_up(AUTO_UPDATE_DIRECTORY_SIZE, (u64)priv->flash->erasesize);
 	size_t bytes_written = 0, bytes_read = 0;
+	char *buffer __free(kfree) = kzalloc(erase_size, GFP_KERNEL);
 	int ret;
 
-	erase_size = round_up(erase_size, (u64)priv->flash->erasesize);
+	if (!buffer)
+		return -ENOMEM;
 
 	erase.addr = AUTO_UPDATE_DIRECTORY_BASE;
 	erase.len = erase_size;
@@ -287,7 +290,7 @@ static int mpfs_auto_update_set_image_address(struct mpfs_auto_update_priv *priv
 		return ret;
 
 	if (bytes_written != erase_size)
-		return ret;
+		return -EIO;
 
 	return 0;
 }
@@ -297,7 +300,6 @@ static int mpfs_auto_update_write_bitstream(struct fw_upload *fw_uploader, const
 {
 	struct mpfs_auto_update_priv *priv = fw_uploader->dd_handle;
 	struct erase_info erase;
-	char *buffer;
 	loff_t directory_address = AUTO_UPDATE_UPGRADE_DIRECTORY;
 	size_t erase_size = AUTO_UPDATE_DIRECTORY_SIZE;
 	size_t bytes_written = 0;
@@ -313,16 +315,12 @@ static int mpfs_auto_update_write_bitstream(struct fw_upload *fw_uploader, const
 		image_address = AUTO_UPDATE_BITSTREAM_BASE +
 				AUTO_UPDATE_UPGRADE_INDEX * priv->size_per_bitstream;
 
-	buffer = devm_kzalloc(priv->dev, erase_size, GFP_KERNEL);
-	if (!buffer)
-		return -ENOMEM;
-
 	/*
 	 * For bitstream info, the descriptor is written to a fixed offset,
 	 * so there is no need to set the image address.
 	 */
 	if (!is_info) {
-		ret = mpfs_auto_update_set_image_address(priv, buffer, image_address, directory_address);
+		ret = mpfs_auto_update_set_image_address(priv, image_address, directory_address);
 		if (ret) {
 			dev_err(priv->dev, "failed to set image address in the SPI directory: %d\n", ret);
 			return ret;
@@ -345,7 +343,7 @@ static int mpfs_auto_update_write_bitstream(struct fw_upload *fw_uploader, const
 	dev_info(priv->dev, "Erasing the flash at address (0x%x)\n", image_address);
 	ret = mtd_erase(priv->flash, &erase);
 	if (ret)
-		goto out;
+		return ret;
 
 	/*
 	 * No parsing etc of the bitstream is required. The system controller
@@ -355,19 +353,15 @@ static int mpfs_auto_update_write_bitstream(struct fw_upload *fw_uploader, const
 	dev_info(priv->dev, "Writing the image to the flash at address (0x%x)\n", image_address);
 	ret = mtd_write(priv->flash, (loff_t)image_address, size, &bytes_written, data);
 	if (ret)
-		goto out;
+		return ret;
 
-	if (bytes_written != size) {
-		ret = -EIO;
-		goto out;
-	}
+	if (bytes_written != size)
+		return -EIO;
 
 	*written = bytes_written;
 	dev_info(priv->dev, "Wrote 0x%zx bytes to the flash\n", bytes_written);
 
-out:
-	devm_kfree(priv->dev, buffer);
-	return ret;
+	return 0;
 }
 
 static enum fw_upload_err mpfs_auto_update_write(struct fw_upload *fw_uploader, const u8 *data,
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
