Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A69D3C52D7C
	for <linux-riscv@archiver.kernel.org>; Fri,  9 Aug 2024 13:49:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=qRAhQ1MAcJiaiacrAnlaEEOjq4L9eo8Jam2it5lSaVA=; b=nvaYjurnShREF7
	q88fYvpaiitPDGyX+t1QJ3AmNCnvAmCc1yQA4zCKyvEbUnqgGf7i+srVwaY24nYluo1ilHe8J4SQ3
	N/1+4MAjJpbfE01SEroWvti857J9JAzuTzNBHtbyMQPCjNe6NHBDFKGM8z9wPmjnJR/pLc++aZl+o
	hu39eNn3H53+7yFLO7YDXJvUtM0pvf1Rr1uZYkog87C8JNZALvbMvM2h9gHMoxHLHEQIQCSZZDJtP
	oMi9a0fIXK7bCJFHJKNSdNJ/S+OS15Hej5HQF7UwWtakW4tk+3O1qcJnoKG6NESAPllGGqXkWCQmJ
	RkdMActZwh7LPNvIqSsg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1scPzp-0000000BP8Q-1PMJ;
	Fri, 09 Aug 2024 13:49:33 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1scPz6-0000000BOxG-3CxA
	for linux-riscv@lists.infradead.org;
	Fri, 09 Aug 2024 13:48:50 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 1423BCE1178;
	Fri,  9 Aug 2024 13:48:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 06F77C32782;
	Fri,  9 Aug 2024 13:48:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1723211325;
	bh=A0tSM4oCvTNgFrKON+QtYT6MsGmLeuf7Q3DHmwARVoI=;
	h=From:To:Cc:Subject:Date:From;
	b=tjG6PaWdPJzIm1y+GxAZWS4tJQ3MYEjkBcJyoEloNotFiP7N4LqJHrcBzQ61oYv4K
	 aRh0Un29gg9pJIJ68VF8ZQvEs3uQchMqsrZj2t+WdBJllzuU/tqzazKNM5NAnPAW/z
	 xZmgR5qkC0fTZOpjIM8SYiUaNnLaEqAkAfBtKymSzIO4hmyMoUB7syVW87+vLEq36i
	 ev8UJ8i7O57Q3Mnh8JwLAXG+ZTJBWuLozjj1gIGeq8qkpyz+3HeZituicddVrWNuOw
	 PIjUeNBNlVAQxk488ewwHtM56oF0YdI7nTZeE2hhsa/UNvBUtfrQM2KdHVuxIxqyN2
	 RCXwjTZYyKovg==
From: Conor Dooley <conor@kernel.org>
To: linux-riscv@lists.infradead.org
Cc: conor@kernel.org,
	Steve Wilkins <steve.wilkins@raymarine.com>,
	linux-kernel@vger.kernel.org,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v1] firmware: microchip: fix incorrect error report of programming:timeout on success
Date: Fri,  9 Aug 2024 14:47:44 +0100
Message-ID: <20240809-acclimate-droplet-9a782ab70193@spud>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1233; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=TWS+/+h21GGCByux8yD5HcPxtxziLmECdkjzPNrD1Xk=; b=owGbwMvMwCFWscWwfUFT0iXG02pJDGnbZP9vFdbiaIpnutLWpffgiY6nrziza5PVgXn7piRPr GJcttqoo5SFQYyDQVZMkSXxdl+L1Po/Ljuce97CzGFlAhnCwMUpABPpn8HwV+z3/a56DenYV5u3 i8xnWWEWtOFo383Xr1fkXfNXnG1w7hPD/zq/C62yIXqzXk7+oej7nMtPZqGtT1bbND3xVUcvqfz fwgEA
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240809_064849_004555_EBFFA74B 
X-CRM114-Status: GOOD (  10.97  )
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

From: Steve Wilkins <steve.wilkins@raymarine.com>

After successfully programming the SPI flash with an MFPS auto update
image, the error sysfs attribute reports programming:timeout.
This is caused by an incorrect check on the return value from
wait_for_completion_timeout() in mpfs_auto_update_poll_complete().

Fixes: ec5b0f1193ad ("firmware: microchip: add PolarFire SoC Auto Update support")
Signed-off-by: Steve Wilkins <steve.wilkins@raymarine.com>
Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
I took the liberty of converting if (ret == 0) to if (!ret).
---
 drivers/firmware/microchip/mpfs-auto-update.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/firmware/microchip/mpfs-auto-update.c b/drivers/firmware/microchip/mpfs-auto-update.c
index 30de47895b1c..9ca5ee58edbd 100644
--- a/drivers/firmware/microchip/mpfs-auto-update.c
+++ b/drivers/firmware/microchip/mpfs-auto-update.c
@@ -166,7 +166,7 @@ static enum fw_upload_err mpfs_auto_update_poll_complete(struct fw_upload *fw_up
 	 */
 	ret = wait_for_completion_timeout(&priv->programming_complete,
 					  msecs_to_jiffies(AUTO_UPDATE_TIMEOUT_MS));
-	if (ret)
+	if (!ret)
 		return FW_UPLOAD_ERR_TIMEOUT;
 
 	return FW_UPLOAD_ERR_NONE;
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
