Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A8DBCD128A
	for <linux-riscv@archiver.kernel.org>; Wed, 10 Apr 2024 11:59:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=P7TKrlnLowpQ0210zGQ9lq7xJwyu+tlt94VCfwx/Pgg=; b=pKoWuUD/tpzPsJ
	j7Kt9SZydT1+5qS2ntw1ndRnNsLyjrVi5P7DBT28CH6sOM0XLFf2mBFA6MI7CFxcVAqLZX/zgaKm+
	b3CKVAgIZ5bu8Xp5qogNzv988uKmFXbf8FB8jqs5c3d1nyG+Hh6+hpeGSH/OpIDhVHqqOJVPtR4Xf
	H35KpDRexm/bO5hhUzm1XxlNX3xXd1sBgpY3NsnPdvEIhI2bNIYxrbJxrG2nt5VqEWWlQ57bYE62N
	c0gRUdNIPP0JVkm6S7S1KTkuWGsoOUMbTBaLCeqhOyLuOTUMaqm1r/pAJ+gVhkRGa6LhBrHvRwlYJ
	PpXGKmFyzsBO0V1Mnkog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruWbR-00000006lmg-3yOc;
	Wed, 10 Apr 2024 11:58:57 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruWbK-00000006lfz-328b
	for linux-riscv@lists.infradead.org;
	Wed, 10 Apr 2024 11:58:52 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 31C8761C0C;
	Wed, 10 Apr 2024 11:58:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A6690C433F1;
	Wed, 10 Apr 2024 11:58:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1712750330;
	bh=rZ17Zq2r5GglmuwlVZDKvybg4wn7yP4nbMxcY1IRFwM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=sYY9z9jcmEO9tTdM8vBgKwQv8FfuqM0s1bASlPyB8S1nbwPNs2+QMU+gpzIG9K6HC
	 2Yoei5a+E1SBFZ78y6zTcN+ITA/9bl3K7XxPYKRIZPiPFLDy5XUdAcsbVC3anuBBXw
	 g+NR7hD89euUY0/BntKr9OWjSxjn+LOXKXrGj4nLuS5k0jwUFfjQgUesO6PDRxxphQ
	 a8d5GUkxpVC3ipWpreiUrRUym9Jy5U+L6vpZe8L1vdrFfWijsvtTsVC8EPlFaC+KZn
	 PYkDjpWxomEjg3pTnTXGrWq+w6PRuP+vBqEBohOHO9X1C0fdWdpNE21WkD0De6eez0
	 gLWvdA17qTVsA==
From: Conor Dooley <conor@kernel.org>
To: linux-riscv@lists.infradead.org
Cc: conor@kernel.org,
	Conor Dooley <conor.dooley@microchip.com>,
	Daire McNamara <daire.mcnamara@microchip.com>,
	Cyril Jean <cyril.jean@microchip.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 5/5] firmware: microchip: use scope-based cleanup where possible
Date: Wed, 10 Apr 2024 12:58:08 +0100
Message-ID: <20240410-glory-patriot-2d7c7876dcfe@spud>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240410-opulently-epic-8654bdac3422@spud>
References: <20240410-opulently-epic-8654bdac3422@spud>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3938; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=0WayOjS6Zyrbw3ItGJG9W3xsEKlmQEnuZ+2GI5oj4yg=; b=owGbwMvMwCFWscWwfUFT0iXG02pJDGlidVfT0uZ3P5i5Me39ZkGnq/U8rSpnHH9HVxjqTKkLK 7zx2Uq0o5SFQYyDQVZMkSXxdl+L1Po/Ljuce97CzGFlAhnCwMUpABNxWsHw36v1/Jo7G90V2U+6 XHXk051U6pXF8euz5hb5F0tnHBa5uZqRYefGd3/F2VQYhazl7R5/sHtbK/RP70suW5PTuW4JC3F ndgA=
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240410_045851_001738_A4D1BF6B 
X-CRM114-Status: GOOD (  13.19  )
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

There's a bunch of structs created and freed every time the mailbox is
used. Move them to use the scope-based cleanup infrastructure to avoid
manually tearing them down. mpfs_auto_update_available() didn't free the
memory that it used (albeit it allocated exactly once during probe) so
that gets moved over too.

Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 drivers/firmware/microchip/mpfs-auto-update.c | 59 +++++--------------
 1 file changed, 16 insertions(+), 43 deletions(-)

diff --git a/drivers/firmware/microchip/mpfs-auto-update.c b/drivers/firmware/microchip/mpfs-auto-update.c
index d7ce27f4ba1b..30de47895b1c 100644
--- a/drivers/firmware/microchip/mpfs-auto-update.c
+++ b/drivers/firmware/microchip/mpfs-auto-update.c
@@ -175,28 +175,17 @@ static enum fw_upload_err mpfs_auto_update_poll_complete(struct fw_upload *fw_up
 static int mpfs_auto_update_verify_image(struct fw_upload *fw_uploader)
 {
 	struct mpfs_auto_update_priv *priv = fw_uploader->dd_handle;
-	struct mpfs_mss_response *response;
-	struct mpfs_mss_msg *message;
-	u32 *response_msg;
+	u32 *response_msg __free(kfree) =
+		kzalloc(AUTO_UPDATE_FEATURE_RESP_SIZE * sizeof(*response_msg), GFP_KERNEL);
+	struct mpfs_mss_response *response __free(kfree) =
+		kzalloc(sizeof(struct mpfs_mss_response), GFP_KERNEL);
+	struct mpfs_mss_msg *message __free(kfree) =
+		kzalloc(sizeof(struct mpfs_mss_msg), GFP_KERNEL);
 	int ret;
 
-	response_msg = devm_kzalloc(priv->dev, AUTO_UPDATE_FEATURE_RESP_SIZE * sizeof(response_msg),
-				    GFP_KERNEL);
-	if (!response_msg)
+	if (!response_msg || !response || !message)
 		return -ENOMEM;
 
-	response = devm_kzalloc(priv->dev, sizeof(struct mpfs_mss_response), GFP_KERNEL);
-	if (!response) {
-		ret = -ENOMEM;
-		goto free_response_msg;
-	}
-
-	message = devm_kzalloc(priv->dev, sizeof(struct mpfs_mss_msg), GFP_KERNEL);
-	if (!message) {
-		ret = -ENOMEM;
-		goto free_response;
-	}
-
 	/*
 	 * The system controller can verify that an image in the flash is valid.
 	 * Rather than duplicate the check in this driver, call the relevant
@@ -218,20 +207,12 @@ static int mpfs_auto_update_verify_image(struct fw_upload *fw_uploader)
 	ret = mpfs_blocking_transaction(priv->sys_controller, message);
 	if (ret | response->resp_status) {
 		dev_warn(priv->dev, "Verification of Upgrade Image failed!\n");
-		ret = ret ? ret : -EBADMSG;
-		goto free_message;
+		return ret ? ret : -EBADMSG;
 	}
 
 	dev_info(priv->dev, "Verification of Upgrade Image passed!\n");
 
-free_message:
-	devm_kfree(priv->dev, message);
-free_response:
-	devm_kfree(priv->dev, response);
-free_response_msg:
-	devm_kfree(priv->dev, response_msg);
-
-	return ret;
+	return 0;
 }
 
 static int mpfs_auto_update_set_image_address(struct mpfs_auto_update_priv *priv,
@@ -406,23 +387,15 @@ static const struct fw_upload_ops mpfs_auto_update_ops = {
 
 static int mpfs_auto_update_available(struct mpfs_auto_update_priv *priv)
 {
-	struct mpfs_mss_response *response;
-	struct mpfs_mss_msg *message;
-	u32 *response_msg;
+	u32 *response_msg __free(kfree) =
+		kzalloc(AUTO_UPDATE_FEATURE_RESP_SIZE * sizeof(*response_msg), GFP_KERNEL);
+	struct mpfs_mss_response *response __free(kfree) =
+		kzalloc(sizeof(struct mpfs_mss_response), GFP_KERNEL);
+	struct mpfs_mss_msg *message __free(kfree) =
+		kzalloc(sizeof(struct mpfs_mss_msg), GFP_KERNEL);
 	int ret;
 
-	response_msg = devm_kzalloc(priv->dev,
-				    AUTO_UPDATE_FEATURE_RESP_SIZE * sizeof(*response_msg),
-				    GFP_KERNEL);
-	if (!response_msg)
-		return -ENOMEM;
-
-	response = devm_kzalloc(priv->dev, sizeof(struct mpfs_mss_response), GFP_KERNEL);
-	if (!response)
-		return -ENOMEM;
-
-	message = devm_kzalloc(priv->dev, sizeof(struct mpfs_mss_msg), GFP_KERNEL);
-	if (!message)
+	if (!response_msg || !response || !message)
 		return -ENOMEM;
 
 	/*
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
