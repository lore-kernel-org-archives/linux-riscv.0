Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5DBCFC4452B
	for <linux-riscv@archiver.kernel.org>; Mon, 20 Jul 2026 15:08:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sirQ7noVORE1fuK8WXYFxlkPesnSGAT4rk0fjvkjF0Y=; b=MnAHJJIC8CGv0S
	s1g8ShuB0UDjmlZ5MFael3GfCj90Skc84sHBOeaj7Smu7qThtAqJS+clByWBwClqjQSU1dg4yRb21
	xwylP1J26PeQKHx7jqthT+edgEwhYqgDZgRnTQYmLHkc6n2yrko4C/xmkvouhEjdeGkwvVvhoodvu
	8xJGxIh7gr3GWSmkHZvuLxJFv79VFeVuG0jLo9loQEMLmLZMx5qgTPLGTDUINRysR2qMwhVQ3DpL6
	wZjerQPhtqD4iuWQS1eudI68BsEAn1dpRUULaikrQQY5Fw9bz6E8w348Yo6ARTmHfFqqhU0jLcNli
	VlR5dJuhmC4dS5/U+asQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlpbS-000000075kL-05i8;
	Mon, 20 Jul 2026 15:08:22 +0000
Received: from m16.mail.163.com ([220.197.31.3])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlpbI-000000075K0-2ara;
	Mon, 20 Jul 2026 15:08:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=mA
	809+5dKgIh5hEU/u2sEYn54hA7ngIexLFJ1RFII/4=; b=Rsa4jCy4DZD7SMWYo7
	jBSCqh9Uym3kU3QnHscX2w+T5j8CfHl4x70kbASd0ua39cOpmpSZfFOEqU+hASMB
	M+lRnw9Rx7nT0npcoOUrBMQgY64hXsZ64tQML0k0CFYlpkNBIyZMKl7H1U0izOe6
	EZuBeYsiFHxPVCQ09c8uU66gY=
Received: from zhb.. (unknown [])
	by gzga-smtp-mtada-g1-1 (Coremail) with SMTP id _____wD3b1rIOV5qyHOjKQ--.35310S6;
	Mon, 20 Jul 2026 23:07:59 +0800 (CST)
From: Hans Zhang <18255117159@163.com>
To: bhelgaas@google.com,
	lpieralisi@kernel.org,
	kwilczynski@kernel.org,
	mani@kernel.org,
	jingoohan1@gmail.com
Cc: imx@lists.linux.dev,
	linuxppc-dev@lists.ozlabs.org,
	linux-amlogic@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-msm@vger.kernel.org,
	sophgo@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	linux-tegra@vger.kernel.org,
	linux-pci@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Hans Zhang <18255117159@163.com>
Subject: [PATCH v3 12/16] PCI: dwc: sophgo: Use cached PCIe capability offset
Date: Mon, 20 Jul 2026 23:06:15 +0800
Message-Id: <20260720150619.24733-13-18255117159@163.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260720150619.24733-1-18255117159@163.com>
References: <20260720150619.24733-1-18255117159@163.com>
MIME-Version: 1.0
X-CM-TRANSID: _____wD3b1rIOV5qyHOjKQ--.35310S6
X-Coremail-Antispam: 1Uf129KBjvJXoW7CF48WFW5tr1rXryrCry3Arb_yoW8Jw1kpa
	y5Zr4FkF4rJF4Yqa1Iy3WkZr1Yq3sxAryxJa93Gw4av34akFyDJw45tFyYgFnrGFWjyry3
	KFn8t3W3WF98AwUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0pi9a9hUUUUU=
X-Originating-IP: [240e:b8f:91b3:d000:f138:f837:e143:4264]
X-CM-SenderInfo: rpryjkyvrrlimvzbiqqrwthudrp/xtbC6w+zV2peOc9vigAA3n
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260720_080813_057331_F796B988 
X-CRM114-Status: UNSURE (   8.19  )
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

dw_pcie_host_init() calls .init before caching, so we must call
dw_pcie_get_pcie_cap() inside .init. The hardware is already enabled by
the driver's own initialization before this point. The helper will cache
the offset and avoid redundant searches.

Signed-off-by: Hans Zhang <18255117159@163.com>
---
In pcie-sophgo, the call chain is:

  static const struct dw_pcie_host_ops sophgo_pcie_host_ops = {
    .init = sophgo_pcie_host_init,
  };
  sophgo_pcie_host_init()
    -> sophgo_pcie_disable_l0s_l1()
      -> dw_pcie_find_capability()
---
 drivers/pci/controller/dwc/pcie-sophgo.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/pci/controller/dwc/pcie-sophgo.c b/drivers/pci/controller/dwc/pcie-sophgo.c
index 044088898819..39703d2b7b5f 100644
--- a/drivers/pci/controller/dwc/pcie-sophgo.c
+++ b/drivers/pci/controller/dwc/pcie-sophgo.c
@@ -164,9 +164,10 @@ static void sophgo_pcie_msi_enable(struct dw_pcie_rp *pp)
 static void sophgo_pcie_disable_l0s_l1(struct dw_pcie_rp *pp)
 {
 	struct dw_pcie *pci = to_dw_pcie_from_pp(pp);
-	u32 offset, val;
+	u8 offset;
+	u32 val;
 
-	offset = dw_pcie_find_capability(pci, PCI_CAP_ID_EXP);
+	offset = dw_pcie_get_pcie_cap(pci);
 
 	dw_pcie_dbi_ro_wr_en(pci);
 
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
