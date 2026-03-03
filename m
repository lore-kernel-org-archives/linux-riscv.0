Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 264B4EC1431
	for <linux-riscv@archiver.kernel.org>; Tue,  3 Mar 2026 11:24:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=X5Wi7mKfZL4GVSTO/m2xdy2mIN/OakUTDKRWUn36wgI=; b=I7gxKqWbIQgY95
	DgpGg3YAf4fGQ1FiasF7OctE+taG0N4C8mrFB5PTIbY6Ou696b/0szd4kxdWw4thwC46W4xYLw7g4
	lDizWQMcQwq1ziqjQckOpWoXBqBd02Ao6wEDbyEW/BVK6yADKZBgWjlGgVagEVyO2GIlOmx5KYTr6
	g3wVphTAk9YD/nW+XSTQDOU2apSpuo/EoK8ta48u8wk893pP7xQwkv1k8UQRqBx0rXav+su3Otya+
	8tIs3xIc4rBd7ls95gS9gogOE7qmr/NWQVuLbQrcVcOEfljzgb2s8hviPj96SXJGxFz+KfWqKI1U/
	n/EtyMO2ZkfqBCuwwFag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxNrf-0000000F3JG-0DNn;
	Tue, 03 Mar 2026 11:24:35 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxNrc-0000000F3Ik-2VaK
	for linux-riscv@lists.infradead.org;
	Tue, 03 Mar 2026 11:24:33 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id E1B7240AF7;
	Tue,  3 Mar 2026 11:24:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 49DC2C116C6;
	Tue,  3 Mar 2026 11:24:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772537071;
	bh=pMMiu99TNrwY1z//uGbZky2NfxAc1NletcO6hCwNjTU=;
	h=From:To:Cc:Subject:Date:From;
	b=BaW/HJOAID9pJeLh1LWVMlEj9XhIWwnWYRD8qsFI7bamyFpz7wxNKt9h1CmKeAOfP
	 WrkxUS3l/R+TqE6SpZEYdv1wJPy4AzaBp7iEloT7U8xPc9sS9ElsRS0yPLfzZh/OmF
	 4lWtbnYvwLoblbk6GYs53UNk36Y8b8BQv3D4QNtNWfxPPSjyPDb/axk1hJRgtY4FlL
	 wsedRG3A3QogdklUSsQjvhBP7GNsYClJpRWLKg085re8mHq0xTAcx3CEgAk/i7GLMk
	 X2ZOth1FZcjDjJPIKwowkjcQsOFW++bR+WCWeZrHeHko0xxeGOXySAmBGQ5jPd71x2
	 G414qZPgL+cQQ==
From: Conor Dooley <conor@kernel.org>
To: linux-riscv@lists.infradead.org
Cc: conor@kernel.org,
	Conor Dooley <conor.dooley@microchip.com>,
	stable@vger.kernel.org,
	Daire McNamara <daire.mcnamara@microchip.com>,
	Valentina.FernandezAlanis@microchip.com,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1] firmware: microchip: fail auto-update probe if no flash found
Date: Tue,  3 Mar 2026 11:24:06 +0000
Message-ID: <20260303-emphatic-roundness-8fe5cd8c3159@spud>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2210; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=XscQ8ymkf4EFPKmo5acF1NOwZBJtkSmMiuGUtgB65Gs=; b=owGbwMvMwCVWscWwfUFT0iXG02pJDJnLjlzvd7y0OMG+pi3+cL7v+tqWzXIPJP5qGDyY9O7JZ EvO9RP2dZSyMIhxMciKKbIk3u5rkVr/x2WHc89bmDmsTCBDGLg4BWAiuzUY/pcsK+iac1PzzTul fKfzJsec0su2qVzU5L/ykydu1ubegiZGhh8nOubtOfDLYs21oAOC/s4sP3Mjzh3rWdPooJ6pZKG XyAcA
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260303_032432_687272_BFE600A4 
X-CRM114-Status: GOOD (  15.17  )
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

There's no point letting the driver probe if there is no flash, as
trying to do a firmware upload will fail. Move the code that attempts
to get the flash from firmware upload to probe, and let it emit a
message to users stating why auto-update is not supported.
The code currently could have a problem if there's a flash in
devicetree, but the system controller driver fails to get a pointer to
it from the mtd subsystem, which will cause
mpfs_sys_controller_get_flash() to return an error. Check for errors and
null, instead of just null, in the new clause.

CC: stable@vger.kernel.org
Fixes: ec5b0f1193ad4 ("firmware: microchip: add PolarFire SoC Auto Update support")
Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
CC: Conor Dooley <conor.dooley@microchip.com>
CC: Daire McNamara <daire.mcnamara@microchip.com>
CC: Valentina.FernandezAlanis@microchip.com
CC: linux-riscv@lists.infradead.org
CC: linux-kernel@vger.kernel.org
---
 drivers/firmware/microchip/mpfs-auto-update.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/firmware/microchip/mpfs-auto-update.c b/drivers/firmware/microchip/mpfs-auto-update.c
index 46b19d803446e..05ac82f1498b3 100644
--- a/drivers/firmware/microchip/mpfs-auto-update.c
+++ b/drivers/firmware/microchip/mpfs-auto-update.c
@@ -113,10 +113,6 @@ static enum fw_upload_err mpfs_auto_update_prepare(struct fw_upload *fw_uploader
 	 * be added here.
 	 */
 
-	priv->flash = mpfs_sys_controller_get_flash(priv->sys_controller);
-	if (!priv->flash)
-		return FW_UPLOAD_ERR_HW_ERROR;
-
 	erase_size = round_up(erase_size, (u64)priv->flash->erasesize);
 
 	/*
@@ -427,6 +423,11 @@ static int mpfs_auto_update_probe(struct platform_device *pdev)
 		return dev_err_probe(dev, PTR_ERR(priv->sys_controller),
 				     "Could not register as a sub device of the system controller\n");
 
+	priv->flash = mpfs_sys_controller_get_flash(priv->sys_controller);
+	if (IS_ERR_OR_NULL(priv->flash))
+		return dev_err_probe(dev, -ENODEV,
+				     "No flash connected to the system controller, auto-update not supported\n");
+
 	priv->dev = dev;
 	platform_set_drvdata(pdev, priv);
 
-- 
2.51.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
