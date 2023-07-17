Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8938EB64DC
	for <linux-riscv@archiver.kernel.org>; Mon, 17 Jul 2023 14:45:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:Subject:To:
	From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=W5b9hFUebZOHytbDj34HZzuAaaDH1ODe1uvV26zSQpU=; b=3dg8GxnPNTEVoF
	BPKjw+3qPhzbnMzYQD5Z4e6BBzQpORicU0KwrTNrIpUTtQRdhd3s7xOImraxu30fjKbiuN1vgix9K
	xppqvYvABkU88sZXBOcy30PnXzlzmoVCc5Yzn8b8poP9PgcQ9QZ4w8XdgDwi2amGPFcFfwwiZCbmS
	XtPye6s0VWUX1eqHtXVqb6Wa4RU8Hyq9nAVBIOQlulkU6ePNXznQqMihz1z6sUpzhwOfsu4+OAuO8
	7VNGbBmIslGpnqwet/dB1CngFyAPBVcDCPGA+zr+4qZ2irxSvq6B3dRpMFMVAsr0i6THM5a5UayV+
	TH6a6D31dnYbUtXWfFIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qLPTm-004HU4-18;
	Mon, 17 Jul 2023 14:45:38 +0000
Received: from m12.mail.163.com ([220.181.12.215])
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qLPTV-004HQZ-1Y
	for linux-riscv@lists.infradead.org;
	Mon, 17 Jul 2023 14:45:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:Subject:Date:Message-Id; bh=RsA4mRVkyXKQtbqBxw
	dYTHMG/ciSAgujKkK09tNeLQY=; b=IwjuZnDOS2IOfK7Hltt9JDfAwrqGZX7HDn
	rnv1XHNVuL+J3l2uZwzwkhsbswOP8V1bFQ322GeJQ5y/fS4ug5cWDNIi6vyN89/p
	xFzVdnu50jHAXk8E4EI216fup8li6L9bRlJpYGGB0cDvXPpKWfjQxQF+iBqAEwCF
	W1CCq4EVE=
Received: from localhost.localdomain (unknown [202.112.113.212])
	by zwqz-smtp-mta-g4-0 (Coremail) with SMTP id _____wCXnRrwU7VkFUYeAg--.11331S4;
	Mon, 17 Jul 2023 22:45:10 +0800 (CST)
From: Yuanjun Gong <ruc_gongyuanjun@163.com>
To: Yuanjun Gong <ruc_gongyuanjun@163.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Daire McNamara <daire.mcnamara@microchip.com>,
	linux-riscv@lists.infradead.org
Subject: [PATCH v2 1/1] PCI: microchip: add return value check to devm_add_action_or_reset()
Date: Mon, 17 Jul 2023 22:44:51 +0800
Message-Id: <20230717144451.21314-1-ruc_gongyuanjun@163.com>
X-Mailer: git-send-email 2.17.1
X-CM-TRANSID: _____wCXnRrwU7VkFUYeAg--.11331S4
X-Coremail-Antispam: 1Uf129KBjvdXoWrtw47uF43ZrWUuF15Ww47twb_yoWDJFb_ur
	9rZFn7A3y5CrnYkr12kw48Xr9xA3WkuF1Sk3WFy3WayFy7Wwn0vwn7ArW5JryUGr1IqF9F
	kr1DAr4xur1xGjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7sR_-tx3UUUUU==
X-Originating-IP: [202.112.113.212]
X-CM-SenderInfo: 5uxfsw5rqj53pdqm30i6rwjhhfrp/1tbiURmv5WDESThMRAAAsf
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230717_074522_010164_A0C7C5D8 
X-CRM114-Status: UNSURE (   8.15  )
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

devm_add_action_or_reset() may fail, therefore, a check to the
return value of devm_add_action_or_reset() is added before return.

Signed-off-by: Yuanjun Gong <ruc_gongyuanjun@163.com>
---
 drivers/pci/controller/pcie-microchip-host.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/pci/controller/pcie-microchip-host.c b/drivers/pci/controller/pcie-microchip-host.c
index 5e710e485464..dd0215dbda77 100644
--- a/drivers/pci/controller/pcie-microchip-host.c
+++ b/drivers/pci/controller/pcie-microchip-host.c
@@ -863,8 +863,9 @@ static inline struct clk *mc_pcie_init_clk(struct device *dev, const char *id)
 	if (ret)
 		return ERR_PTR(ret);
 
-	devm_add_action_or_reset(dev, (void (*) (void *))clk_disable_unprepare,
-				 clk);
+	ret = devm_add_action_or_reset(dev, (void (*) (void *))clk_disable_unprepare, clk);
+	if (ret)
+		return ERR_PTR(ret);
 
 	return clk;
 }
-- 
2.17.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
