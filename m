Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C86A9EB64DA
	for <linux-riscv@archiver.kernel.org>; Sun, 16 Jul 2023 12:49:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:Subject:To:
	From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=TlCveB6BC+xC4BuqObwemZFEgs5OWfASZyXf8NPXMrk=; b=2IdE8VeuUMqsv2
	F11V1vGd3PAbvAueGF0/+cCz7M/Y+6QDo+fUeaDoR8oclRi0vxqOQqGxeDeb+Qa04jeoOa3QY039Z
	m0VWcWcBSquqWopUHcSjNQZuRjHoqhax9Dq8WvzEy5AyXtqehV6Yq303GdeyoddrSUqYOFsVAYN5F
	JQXbhHbI9IgNG/e0XgbgHlDWyS4XkXo1OyOgXM3TUXrUsQ3BWIMgFRx1Kq1N2hNMWmp/M/TH2OiBf
	0KjScz603yJynrHymQLg07R8Tbci7f8WrR+v/K9bim7+0M3nlnbSI9teIAwnySbqkwNr3hWoyB4Np
	JhwnXbh38C9F3W//124g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qL1BY-00BFPW-2Y;
	Sun, 16 Jul 2023 12:49:12 +0000
Received: from m12.mail.163.com ([220.181.12.197])
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qL1BV-00BFLM-19
	for linux-riscv@lists.infradead.org;
	Sun, 16 Jul 2023 12:49:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:Subject:Date:Message-Id; bh=KNC/Y+ZDzGkCMn7fTW
	o+FvIC7E7VploXjGn02bnxHd4=; b=i/Moj+a2rzvK75DXR27vY+z91uXmi0YFoS
	FESI8GmYbzUFTQM/cd4uQtPX/3/GC6HHMtJ8fbplQUAYG5GH3tBqcm9Ed+Z0wqyY
	6ITnOFpOmxXueXEFxzTVq0/hmEgHuEYAf0SjXLDzFdv5rnOzsqsp3nRp89AHPasp
	fEktZaClw=
Received: from localhost.localdomain (unknown [202.112.113.212])
	by zwqz-smtp-mta-g1-2 (Coremail) with SMTP id _____wAX3mIl57NksxfaAQ--.22750S4;
	Sun, 16 Jul 2023 20:48:58 +0800 (CST)
From: Yuanjun Gong <ruc_gongyuanjun@163.com>
To: Yuanjun Gong <ruc_gongyuanjun@163.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Daire McNamara <daire.mcnamara@microchip.com>,
	linux-riscv@lists.infradead.org
Subject: [PATCH 1/1] pci: add return value check to devm_add_action_or_reset
Date: Sun, 16 Jul 2023 20:48:35 +0800
Message-Id: <20230716124835.5909-1-ruc_gongyuanjun@163.com>
X-Mailer: git-send-email 2.17.1
X-CM-TRANSID: _____wAX3mIl57NksxfaAQ--.22750S4
X-Coremail-Antispam: 1Uf129KBjvdXoWrtw47uF43ZrWUuF15Ww47twb_yoWfKFX_u3
	srZFnru3y5CrnYk3W2kw48Zr9Iy3Z7uF1Sk3WFy3WavFyDXw4qvws7ZrW3A34UGr1IqF9F
	kr1DAF4xur1xCjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7sR_knY5UUUUU==
X-Originating-IP: [202.112.113.212]
X-CM-SenderInfo: 5uxfsw5rqj53pdqm30i6rwjhhfrp/xtbBSRyu5VaEH3a-9QAAsv
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230716_054910_277019_7512E182 
X-CRM114-Status: UNSURE (   8.40  )
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
 drivers/pci/controller/pcie-microchip-host.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/pci/controller/pcie-microchip-host.c b/drivers/pci/controller/pcie-microchip-host.c
index 5e710e485464..8c77284fdc84 100644
--- a/drivers/pci/controller/pcie-microchip-host.c
+++ b/drivers/pci/controller/pcie-microchip-host.c
@@ -863,8 +863,10 @@ static inline struct clk *mc_pcie_init_clk(struct device *dev, const char *id)
 	if (ret)
 		return ERR_PTR(ret);
 
-	devm_add_action_or_reset(dev, (void (*) (void *))clk_disable_unprepare,
+	ret = devm_add_action_or_reset(dev, (void (*) (void *))clk_disable_unprepare,
 				 clk);
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
