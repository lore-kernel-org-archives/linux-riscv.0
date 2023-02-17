Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72291C05027
	for <linux-riscv@archiver.kernel.org>; Fri, 17 Feb 2023 16:40:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kLhaA1HCYcuGgzzlI3S2DcMf7f4xvouwOpZxtXCPw2g=; b=NcyrADJXVNhVm1
	rUGtN7ckMJHzI3fNa1CU9C5UquVlgOuwi70imw3DEA91mo7K7x3rTbmSUmInIXPg2uQJprt93cqrf
	W25TSLgkIeLYb415EeSD++9pC/aA5xM+B6IE11rXXwZux/Lrtv1LRoOg8ojw0gf0drw7FMuK78Ugm
	OmbTdARn4d0ArjxfAj6EYdDbZlf0XRKZg+qDlYD88QHpE0YdVw6i/Bun25SOjQDe/iDINViSs5XsN
	y6wsjaERlGo8XM32YIhNuMORi37MZ0g27OUSJ8bD1sa4PEWM1HqK9UPd5iCw/latx54vH37oagOWL
	l+t0J9tIfIr4+1GCOh/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pT3mz-00F7FT-Sn; Fri, 17 Feb 2023 16:40:49 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pT3mv-00F7Dv-74
	for linux-riscv@lists.infradead.org; Fri, 17 Feb 2023 16:40:47 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id B0D9261EBC;
	Fri, 17 Feb 2023 16:40:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 95E58C433D2;
	Fri, 17 Feb 2023 16:40:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1676652044;
	bh=uqM+5rtlFlEeXSd/1anUI6DmVd10V3MqxkeZ8jvGqac=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=YyjGX9s0fUOU95il4oo4Yxn3apt+m5I+pZ0R+kVThA/OZeL2ZvHMydDbh0GDLIYqM
	 2vC68gXhJCSmmlz5f/04yN5wF5uzLl4Vuu7j+41Q0PS/u7Cw/qbaXJekWuJnxHnL3t
	 CE8xyGoZ1db0PaMJTrmJTkeDEEpm7QUvqOlsQkigofx31jahniDpmjiK1lIEt/stEm
	 6iql/fle5ABVBSzjNS89m/u8bCQ2khTRM3w5Xox9KSZ4mImQKVZAM2grkB/Y4v6Ymb
	 MI3VnUUorUt/R5q1pico2pJv5lliR00loKesLKziA5R1bttuy+U96ssOfvRcKMNr0w
	 1ueRrBCmT4fUA==
From: Conor Dooley <conor@kernel.org>
To: Xu Yilun <yilun.xu@intel.com>,
	conor@kernel.org
Cc: Conor Dooley <conor.dooley@microchip.com>,
	Daire McNamara <daire.mcnamara@microchip.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Moritz Fischer <mdf@kernel.org>,
	Wu Hao <hao.wu@intel.com>,
	Tom Rix <trix@redhat.com>,
	linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-fpga@vger.kernel.org
Subject: [PATCH v1 1/6] soc: microchip: mpfs: add a prefix to rx_callback()
Date: Fri, 17 Feb 2023 16:40:18 +0000
Message-Id: <20230217164023.14255-2-conor@kernel.org>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230217164023.14255-1-conor@kernel.org>
References: <20230217164023.14255-1-conor@kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1311; i=conor.dooley@microchip.com; h=from:subject; bh=RNzEefOhKfQMOBdza8p2YEG5lWs9FX5mqYbHLNGi5xk=; b=owGbwMvMwCFWscWwfUFT0iXG02pJDMnv1759mjS3vey3XWWh/u+Eh2vL/2snBJVfX+B9R4LbJWnG fuYTHaUsDGIcDLJiiiyJt/tapNb/cdnh3PMWZg4rE8gQBi5OAZhI9xtGhjkCcm2uAefOlN69cmkz85 KXTV/DrvcKr3U9qZHx//aM/S0M//T+ON/84f/YXUf/9lSBmU8rHpj39xZd8dM9sW2zWUKWPxMA
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230217_084045_328858_332097AD 
X-CRM114-Status: GOOD (  13.61  )
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

Add a prefix to the function name to match the rest of the file.

Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 drivers/soc/microchip/mpfs-sys-controller.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/soc/microchip/mpfs-sys-controller.c b/drivers/soc/microchip/mpfs-sys-controller.c
index 973a748d324c..11616e3c9ac8 100644
--- a/drivers/soc/microchip/mpfs-sys-controller.c
+++ b/drivers/soc/microchip/mpfs-sys-controller.c
@@ -73,7 +73,7 @@ int mpfs_blocking_transaction(struct mpfs_sys_controller *sys_controller, struct
 }
 EXPORT_SYMBOL(mpfs_blocking_transaction);
 
-static void rx_callback(struct mbox_client *client, void *msg)
+static void mpfs_sys_controller_rx_callback(struct mbox_client *client, void *msg)
 {
 	struct mpfs_sys_controller *sys_controller =
 		container_of(client, struct mpfs_sys_controller, client);
@@ -119,7 +119,7 @@ static int mpfs_sys_controller_probe(struct platform_device *pdev)
 		return -ENOMEM;
 
 	sys_controller->client.dev = dev;
-	sys_controller->client.rx_callback = rx_callback;
+	sys_controller->client.rx_callback = mpfs_sys_controller_rx_callback;
 	sys_controller->client.tx_block = 1U;
 	sys_controller->client.tx_tout = msecs_to_jiffies(MPFS_SYS_CTRL_TIMEOUT_MS);
 
-- 
2.39.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
