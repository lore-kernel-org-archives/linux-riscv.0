Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1049CD1296
	for <linux-riscv@archiver.kernel.org>; Wed, 10 Apr 2024 11:58:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jjmaOKzdEiZrviKYzrb793U0DBWzxBHkvDpYocsXGZo=; b=C1ZTFzUoKWUIvS
	mhi1zBe0FP/ZjGHLaPgF4Lo0xGXTt1SqD6pCZV6xLNVpFWjSu6S+4BnIOtqS326RFCrWeoO8vg9OR
	SJAAd4Z2hzoRCHpBTGEJ+foV2hnAEtJv83/5wIsZuVKHf5ahG8EkoA2gfoBWgqbipUz7SfnEFgoQs
	lbZAaLdb8kYsXnT8lMmMiaBBkn0qUV61CFOWSYnssTdQke0XhGMzzIF99tFRTlR7Xfm4j3EbBSxuz
	Mvb7u5A8EyauBVADuoN3onV3OVhLkIgKw+WDR4Sp5Zac9ST546mbg3bu3odk01CGFrYEaqsIgB9WG
	tQdnDcHO7xgjyXA9pYJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruWbI-00000006lee-3Xph;
	Wed, 10 Apr 2024 11:58:48 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruWbF-00000006lci-2U2L
	for linux-riscv@lists.infradead.org;
	Wed, 10 Apr 2024 11:58:46 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id DB9D761C0D;
	Wed, 10 Apr 2024 11:58:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5B724C43394;
	Wed, 10 Apr 2024 11:58:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1712750324;
	bh=miFooV5xlwUAoCg/5+WmOIw7hiB7FtagEK3Q2jQpBdo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=LzkTexlUdZzTNblZagdSguoN7Auvwyg5ucQMjlq+cptVQwFQ4S867LO/VGgVQ25q1
	 VTUXuPxX2YRuFFbOfc+vkQY7WlmW5Jdt4DKt79iebKHmaX7ED+HaeoHFIT0C4ugRL+
	 rJgJeQsfQG7vm+75L4d7106btgyKMPzToYMmFkXkIS+VxRVQqrhSrvjrzFh3Ga72Gp
	 LbgeBgxre8b7e4fJX64eavrDEv51lh66jxVdQb6vp/RIU6mjy0blehj1w31tybG7kY
	 hfFnXfndpz7KzVwYlROXa+6YdsGM3E40qG5qSaBTLDqrFnbcD4/e2rWYvxmOVYVvlv
	 Oplqn6rf66Z5g==
From: Conor Dooley <conor@kernel.org>
To: linux-riscv@lists.infradead.org
Cc: conor@kernel.org,
	Conor Dooley <conor.dooley@microchip.com>,
	Daire McNamara <daire.mcnamara@microchip.com>,
	Cyril Jean <cyril.jean@microchip.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 2/5] firmware: microchip: don't unconditionally print validation success
Date: Wed, 10 Apr 2024 12:58:05 +0100
Message-ID: <20240410-throwing-sandworm-7d03e4e2f4e8@spud>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240410-opulently-epic-8654bdac3422@spud>
References: <20240410-opulently-epic-8654bdac3422@spud>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1033; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=bV+GMkr+Qxwo4lMIT/B+7/B5KMkZCVAYKLvbSQ6UzsY=; b=owGbwMvMwCFWscWwfUFT0iXG02pJDGlidVesmcN/GW7tkMwrORDPaLzTzH1p8vWTh5Zni3yrb YxN2vu3o5SFQYyDQVZMkSXxdl+L1Po/Ljuce97CzGFlAhnCwMUpABPZIszwv+z3nHNeM45xms/P ifjf1NKtIvw0wGjhOfO0BSdPGqxKsGRkmO7Y8GXVvIqnl019DRTuX808xacV1bN4xZo8zeDmY99 YuAE=
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240410_045845_704160_E2E18517 
X-CRM114-Status: UNSURE (   7.32  )
X-CRM114-Notice: Please train this message.
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

If validation fails, both prints are made. Skip the success one in the
failure case.

Fixes: ec5b0f1193ad ("firmware: microchip: add PolarFire SoC Auto Update support")
Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 drivers/firmware/microchip/mpfs-auto-update.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/firmware/microchip/mpfs-auto-update.c b/drivers/firmware/microchip/mpfs-auto-update.c
index 33343e83373c..298ad21e139b 100644
--- a/drivers/firmware/microchip/mpfs-auto-update.c
+++ b/drivers/firmware/microchip/mpfs-auto-update.c
@@ -218,10 +218,12 @@ static int mpfs_auto_update_verify_image(struct fw_upload *fw_uploader)
 	if (ret | response->resp_status) {
 		dev_warn(priv->dev, "Verification of Upgrade Image failed!\n");
 		ret = ret ? ret : -EBADMSG;
+		goto free_message;
 	}
 
 	dev_info(priv->dev, "Verification of Upgrade Image passed!\n");
 
+free_message:
 	devm_kfree(priv->dev, message);
 free_response:
 	devm_kfree(priv->dev, response);
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
