Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92DD9C76196
	for <linux-riscv@archiver.kernel.org>; Fri, 31 Mar 2023 07:19:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ED3MtxuiL/AQo8X4XwBxJMiOuNTVdNvoIK8k+lDaaSQ=; b=DLuTykj6RTpDv6
	6yzMrrm3BjlvXL0N24X/SSbHCcO/agl1brGraO69R6QpbSiLaaaT8Zs0+kx8OUyT8G2aYKl7vVKGq
	zF5/gzlXPpK6SOSnc1EZxR9HQAb/tOrw5O0jKCGeXuHUV+o2VShEqyV3YDL67jV6pfH7aoBTLGzbU
	8zgbsSNkZ3NxUPBhozyEe1KVPnFKfaBOcPjWTstjALXR1rDXzvRrHko6x1xi48JV3CocbaXJxabYX
	4MCtZtlRlW+j6znsU1I0aPv2Gdgb4QHXo94jF6plU7nY0IZ2JBlBe3B2+7k+5KWGZ3m3vbX7rEIT+
	j9g4UXiEXbgJHAHdSc9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pi92K-00682E-0t;
	Fri, 31 Mar 2023 07:19:00 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pi92F-0067z3-0m
	for linux-riscv@lists.infradead.org;
	Fri, 31 Mar 2023 07:18:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1680247135; x=1711783135;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=v+iGAOoMCBTZGHjA4MlM8wSqYcR0Frqq6qIhcdJ6VMQ=;
  b=pQL+eyW852Bqrl3MHB6ECcL0CuaietiaKjIAoGza6HWRxlIz1Lob/LXR
   R3fTsBnk07+0RWfQdebpHaEhdrSacla/o6oTpp3YW5l/l0SLNzSue1l8+
   f76qEq/2sqm2uPm5QNEdBLmIf0V/yDyTaNhBWeo1Kkcn3ExtPEKEaSt9W
   0GK+Yw3nxl1SftxkicnaQegfEiFrQ4T3laYF6UZy/9cOubhLcNqn2yTfh
   wxnSiicqRA1+fddvGwRoqSOTKJeCSNY35xvtpnRN3YS1H8ybBoaBrYSDP
   +EYG5IRT2qbCIkl/QG5gvntFGX/l5IY1uA/j8KDiRupWrmllXUtnh/n+L
   w==;
X-IronPort-AV: E=Sophos;i="5.98,307,1673938800"; 
   d="scan'208";a="204349705"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa4.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 31 Mar 2023 00:18:49 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Fri, 31 Mar 2023 00:18:46 -0700
Received: from wendy.microchip.com (10.10.115.15) by chn-vm-ex01.mchp-main.com
 (10.10.85.143) with Microsoft SMTP Server id 15.1.2507.21 via Frontend
 Transport; Fri, 31 Mar 2023 00:18:44 -0700
From: Conor Dooley <conor.dooley@microchip.com>
To: <linux-fpga@vger.kernel.org>
CC: <conor@kernel.org>, <conor.dooley@microchip.com>, Daire McNamara
	<daire.mcnamara@microchip.com>, Rob Herring <robh+dt@kernel.org>, "Krzysztof
 Kozlowski" <krzysztof.kozlowski+dt@linaro.org>, Moritz Fischer
	<mdf@kernel.org>, Wu Hao <hao.wu@intel.com>, Xu Yilun <yilun.xu@intel.com>,
	Tom Rix <trix@redhat.com>, <linux-riscv@lists.infradead.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v2 1/7] soc: microchip: mpfs: add a prefix to rx_callback()
Date: Fri, 31 Mar 2023 08:18:17 +0100
Message-ID: <20230331071823.956087-2-conor.dooley@microchip.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230331071823.956087-1-conor.dooley@microchip.com>
References: <20230331071823.956087-1-conor.dooley@microchip.com>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1311; i=conor.dooley@microchip.com; h=from:subject; bh=v+iGAOoMCBTZGHjA4MlM8wSqYcR0Frqq6qIhcdJ6VMQ=; b=owGbwMvMwCFWscWwfUFT0iXG02pJDClqnZYdwexPn4oeOna7jq3DNefegq0nhZf/fnGl8NcJfqG0 bRPPdZSyMIhxMMiKKbIk3u5rkVr/x2WHc89bmDmsTCBDGLg4BWAicsIM/2z2J17J72e+Xq1+ZdthlR 8a5kU5nxKvz9r7zWzLD5bJdvEM/5RWHLM+vDBzSmu4MEeniEXxJv8kW31v7/UcRaUK06cKswAA
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230331_001855_464034_9D8C413B 
X-CRM114-Status: GOOD (  11.58  )
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

Add a prefix to the function name to match the rest of the file.

Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 drivers/soc/microchip/mpfs-sys-controller.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/soc/microchip/mpfs-sys-controller.c b/drivers/soc/microchip/mpfs-sys-controller.c
index ceaeebc1fc6b..216d9f4ea0ce 100644
--- a/drivers/soc/microchip/mpfs-sys-controller.c
+++ b/drivers/soc/microchip/mpfs-sys-controller.c
@@ -75,7 +75,7 @@ int mpfs_blocking_transaction(struct mpfs_sys_controller *sys_controller, struct
 }
 EXPORT_SYMBOL(mpfs_blocking_transaction);
 
-static void rx_callback(struct mbox_client *client, void *msg)
+static void mpfs_sys_controller_rx_callback(struct mbox_client *client, void *msg)
 {
 	struct mpfs_sys_controller *sys_controller =
 		container_of(client, struct mpfs_sys_controller, client);
@@ -121,7 +121,7 @@ static int mpfs_sys_controller_probe(struct platform_device *pdev)
 		return -ENOMEM;
 
 	sys_controller->client.dev = dev;
-	sys_controller->client.rx_callback = rx_callback;
+	sys_controller->client.rx_callback = mpfs_sys_controller_rx_callback;
 	sys_controller->client.tx_block = 1U;
 	sys_controller->client.tx_tout = msecs_to_jiffies(MPFS_SYS_CTRL_TIMEOUT_MS);
 
-- 
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
