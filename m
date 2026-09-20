Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32F6DC982D0
	for <linux-riscv@archiver.kernel.org>; Sun, 20 Sep 2026 03:38:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=TYJncI7oJ1+BDQg6nPiQtFylUN1nNCXsttLWu8ux56A=; b=VG8LxelgII4b1C
	F4Q+Af/KyaCE+8jv6q5VNt3pfH6MqQOkP7gchHVEdm67NT5MQ+mWn36IPqM/flcUCAS5lLvHKXoYu
	mTz2sMawm6hex6e4fnmaJJvSVJJffPcQWt5SG3wRu3n8TAFZ7KcHWL7PWgSNZb6EDf9drHV6zMWKG
	B/m1SlqUJ1ZsNMKacTe9YwjyfFBMbBh2tUCAXfvLefXbmUkzjSifcN3IOqM3R58wjrfFGwgyYai4H
	fz3xUXWLUF8HLeBZzlHDzM6c7A5+Cxz+cSu3/MKfbNjoM8So+JJLecTOhBG9UdcydaNv6u1LufhqU
	UNC8hflLzt1NLPT59EtA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x88Ng-0000000GomF-0nXM;
	Sun, 20 Sep 2026 03:38:20 +0000
Received: from mail-proxy25256.mail.163.com ([103.129.252.56])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x88Nc-0000000Golk-3Gob
	for linux-riscv@lists.infradead.org;
	Sun, 20 Sep 2026 03:38:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=Ii
	D8BlwNqKyX2cf1nZWhUxxdH2tvwCrHzATad2JUYoI=; b=mc2HTetA5O5UJLvtVA
	7cbzf+UPBLlf+6IbaP7Jp00BwBc9iULrM5cuTQBY4Qold1xxzZETZGo7x9sV7Oed
	ZCTOPj30Ju4QClJqyl8hFPMeEfh8+x66jMocxT1PqSvSQhSqkuzqvTwqJZNgSwS5
	vVHyX9LmNvoOIM0RJfwAzrpuQ=
Received: from localhost.localdomain (unknown [])
	by gzsmtp2 (Coremail) with SMTP id PSgvCgC3J8sDVa9q4l5RAQ--.42957S2;
	Sun, 20 Sep 2026 11:37:40 +0800 (CST)
From: Pengpeng Hou <hppiscas@163.com>
To: zhangsenchuan@eswincomputing.com
Cc: lpieralisi@kernel.org,
	kwilczynski@kernel.org,
	mani@kernel.org,
	robh@kernel.org,
	bhelgaas@google.com,
	linux-pci@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	ningyu@eswincomputing.com,
	ouyanghui@eswincomputing.com,
	sef1548@gmail.com,
	hppiscas@163.com
Subject: [PATCH v2] PCI: eswin: Publish the platform driver OF alias
Date: Sun, 20 Sep 2026 11:37:37 +0800
Message-ID: <20260920033737.13957-1-hppiscas@163.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
X-CM-TRANSID: PSgvCgC3J8sDVa9q4l5RAQ--.42957S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7tw4kWw15AryrAw1UCw4kJFb_yoW8Xw4xpa
	y5J3yIkFy8KF43Ja12y3Wv9FyYk3ZxCFyjkrZrGa47Xa43u348ur1xtFyYqFyDAF43Ww13
	tr1Yqa43uF4rArUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07Uba93UUUUU=
X-CM-SenderInfo: 5kssx2xfdvqiywtou0bp/xtbC7QTcpWqvVQSL6wAA3k
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260919_203817_105512_80C4F651 
X-CRM114-Status: UNSURE (   7.98  )
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

PCIE_ESWIN is tristate and eswin_pcie_driver uses an OF match table, but
the table is not exported. The resulting module lacks the OF alias
needed for automatic loading on an ESWIN PCIe host controller.

Export the OF table. Keep builtin_platform_driver() and the intentional
absence of an unregister path unchanged; module alias publication does
not require making this interrupt-controller driver unloadable.

The issue was found by our static-analysis tool.

Fixes: b593c26d081a ("PCI: eswin: Add ESWIN PCIe Root Complex driver")
Assisted-by: gpt 5
Signed-off-by: Pengpeng Hou <hppiscas@163.com>
---
Changes since v1:
https://lore.kernel.org/all/20260905134251.67210-1-hppiscas@163.com/
Use the full author name. Preserve the registration model explained by
Manivannan; do not add a remove path.

 drivers/pci/controller/dwc/pcie-eswin.c |    1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/pci/controller/dwc/pcie-eswin.c b/drivers/pci/controller/dwc/pcie-eswin.c
index ce8d64f8a395..1bb44696057e 100644
--- a/drivers/pci/controller/dwc/pcie-eswin.c
+++ b/drivers/pci/controller/dwc/pcie-eswin.c
@@ -388,6 +388,7 @@ static const struct of_device_id eswin_pcie_of_match[] = {
 	{ .compatible = "eswin,eic7700-pcie", .data = &eswin_eic7700_data },
 	{}
 };
+MODULE_DEVICE_TABLE(of, eswin_pcie_of_match);
 
 static struct platform_driver eswin_pcie_driver = {
 	.probe = eswin_pcie_probe,

base-commit: 518e5b794c06c0f0eb40df3e202274a66202c137
-- 
2.50.1 (Apple Git-155)


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
