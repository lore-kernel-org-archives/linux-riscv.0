Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE8CBC6FD18
	for <linux-riscv@archiver.kernel.org>; Fri, 31 Mar 2023 07:19:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZtypsCh/pgo/gOtqih8uHtDiflv3119TCGf3QCxRkRE=; b=YFTcC4Is/eLsET
	Bnu9MRqE0Bdz4PSjOwCHAhuBTT1dvLJca4DQvCXFxqb15XFC9jPhVBaMnnG7uAnD3bVXl7cCnNj1B
	7XORaYWJ5HuGOgBdVr7dpDVYEhoJBhfuxXiPmFbhx6cgBGqavbyMDfSDvzI01NkfYBdHU+nHpKLaD
	j9ZiptKGaUKr3IIPHFCvnMImQL1KghUX0HkCt0cQAV35aPGazAVSRgLWiTfbiz2q8tGvmWXuHUwEL
	ylQDGZNfgUbVk+UhUOI0lkRV5qYyyFrS5QVB0eIWMR1GBz4Che0qyjmSxDmKU/BY54olNlC0Da5z9
	PdcxC4MmaND8bcPvHxbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pi92P-00685K-1X;
	Fri, 31 Mar 2023 07:19:05 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pi92I-00681K-2s
	for linux-riscv@lists.infradead.org;
	Fri, 31 Mar 2023 07:19:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1680247139; x=1711783139;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=BW0Pnq9/Vd1o+EMO1M/RplcR1FECtWKGt07fea6vdfo=;
  b=s5K8pGKj7p9OUMGnnCZen0wHlvdqOTjZZOJ6Zf5j8N/hmV/TSbj81AM3
   02DaE7B8IbiQhAYzEQwfqOUSszGNEDIfwwZ8Nu2XpsW46JqMd1QkGcwxL
   LjE+XdBcRcoPbSE9bquY775zZV9ThBjnaZ+j2h66ILJVCgYdKHewcPUa7
   LuDRv8/fH9UwMcfeFUIRoeU3Vh+DDZzYLFIIhgC/NkxOqgTN/swNzM4+f
   oRgLQd/l1hLQuv/LIeeKjASnhpYiB3DKYknb731rBrrZWlh71JnrKZ1B0
   GNGF6UDlJD5t0Rvb5RpoUx8AJnRCoPkQuOEDtdq632eSoEREIi7XaOwFE
   g==;
X-IronPort-AV: E=Sophos;i="5.98,307,1673938800"; 
   d="scan'208";a="204349769"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa4.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 31 Mar 2023 00:18:57 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Fri, 31 Mar 2023 00:18:54 -0700
Received: from wendy.microchip.com (10.10.115.15) by chn-vm-ex01.mchp-main.com
 (10.10.85.143) with Microsoft SMTP Server id 15.1.2507.21 via Frontend
 Transport; Fri, 31 Mar 2023 00:18:51 -0700
From: Conor Dooley <conor.dooley@microchip.com>
To: <linux-fpga@vger.kernel.org>
CC: <conor@kernel.org>, <conor.dooley@microchip.com>, Daire McNamara
	<daire.mcnamara@microchip.com>, Rob Herring <robh+dt@kernel.org>, "Krzysztof
 Kozlowski" <krzysztof.kozlowski+dt@linaro.org>, Moritz Fischer
	<mdf@kernel.org>, Wu Hao <hao.wu@intel.com>, Xu Yilun <yilun.xu@intel.com>,
	Tom Rix <trix@redhat.com>, <linux-riscv@lists.infradead.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v2 4/7] soc: microchip: mpfs: print service status in warning message
Date: Fri, 31 Mar 2023 08:18:20 +0100
Message-ID: <20230331071823.956087-5-conor.dooley@microchip.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230331071823.956087-1-conor.dooley@microchip.com>
References: <20230331071823.956087-1-conor.dooley@microchip.com>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=973; i=conor.dooley@microchip.com; h=from:subject; bh=BW0Pnq9/Vd1o+EMO1M/RplcR1FECtWKGt07fea6vdfo=; b=owGbwMvMwCFWscWwfUFT0iXG02pJDClqnZZlMzbP5rgQfePkXPbN1oVRPcVZNYser3BuEjnxlm3D yeeeHaUsDGIcDLJiiiyJt/tapNb/cdnh3PMWZg4rE8gQBi5OAZjID39Ghpv3Gv/w53jzFs5gfyzuxC B38asJS2xr0cytzTOnFR1Xc2L4Kxp3VXXZtpyervZvJyU/rN+xfuqazb7HCg+L5S+qieR/xAMA
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230331_001858_959404_0F191B5B 
X-CRM114-Status: UNSURE (   9.05  )
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

Now that resp_status is set for failed services, print the status in the
error path's warning.

Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 drivers/soc/microchip/mpfs-sys-controller.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/soc/microchip/mpfs-sys-controller.c b/drivers/soc/microchip/mpfs-sys-controller.c
index 5270630c52bf..1b7680e05cc0 100644
--- a/drivers/soc/microchip/mpfs-sys-controller.c
+++ b/drivers/soc/microchip/mpfs-sys-controller.c
@@ -66,7 +66,9 @@ int mpfs_blocking_transaction(struct mpfs_sys_controller *sys_controller, struct
 	 */
 	if (!wait_for_completion_timeout(&sys_controller->c, timeout)) {
 		ret = -EBADMSG;
-		dev_warn(sys_controller->client.dev, "MPFS sys controller service failed\n");
+		dev_warn(sys_controller->client.dev,
+			 "MPFS sys controller service failed with status: %d\n",
+			 msg->response->resp_status);
 	} else {
 		ret = 0;
 	}
-- 
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
