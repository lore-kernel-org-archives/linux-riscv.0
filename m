Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C2CFC4452A
	for <linux-riscv@archiver.kernel.org>; Mon, 20 Jul 2026 15:08:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NZOHLXZ+IGnzhlm8QrYzu/qgI1SA6qd86rM/9o6B5Lw=; b=22PONcBeRdaVTu
	6oaayMK5nLxAbDEEkqClqYJT7PibHQF4rhbNBUn2yPPILR2+8F78YQAKcgVrzRsYwoqG0Bon4Hguo
	O80PjUqTrqz7JX7lMMKYF1VgEPQ2t6xN8LEQL1Qi2yXTtsDNO5f6+VoU4HdcUSdDG4Wt0R7S+vg7B
	UEy+9TMpgM7ozwGT2bru39/J4X/nAYpEjHRBZP5KEoYoxL8OmFtyIJ4TSmFearSgt7+vrNIfUgjT1
	Mcx+RlPqG7pDLnkTYz5knrNy2lmmZhDt5eoudTeP9XVRmiYrI2CvbVwjOldRbvrZgmude+SiVGc+n
	haXdcMjCx+4RrtEjdhlA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlpbk-000000076bd-0heW;
	Mon, 20 Jul 2026 15:08:40 +0000
Received: from m16.mail.163.com ([117.135.210.5])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlpbT-000000075bI-2S5A;
	Mon, 20 Jul 2026 15:08:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=VX
	L2XKRY5F3qPW2VboJTa9SPw1RX8rEnzJV3c1g8W44=; b=PL56MJC6Mw2Dm3beJw
	EGXf2JsTShEbMBOlljS+EgYO6qacNN2UjIkc8WYsI3Z3k7cA6sDekfjYsxzQ//WC
	ct1DT3oLvPkTGbHh3jinH59RtwXi3SySdmeiigJq4uG8QntqeP+JmCy4vww5lACu
	u6uUmyYQXJwiJIDj086urjZ4o=
Received: from zhb.. (unknown [])
	by gzga-smtp-mtada-g1-3 (Coremail) with SMTP id _____wDX5ybVOV5q0OGYJQ--.29751S2;
	Mon, 20 Jul 2026 23:08:06 +0800 (CST)
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
Subject: [PATCH v3 16/16] PCI: dwc: ultrarisc: Use cached PCIe capability offset
Date: Mon, 20 Jul 2026 23:06:19 +0800
Message-Id: <20260720150619.24733-17-18255117159@163.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260720150619.24733-1-18255117159@163.com>
References: <20260720150619.24733-1-18255117159@163.com>
MIME-Version: 1.0
X-CM-TRANSID: _____wDX5ybVOV5q0OGYJQ--.29751S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7ZFy7CF43CF1xGry8JFy7KFg_yoW8Grykpa
	y3WryjyF1Dtr4YvFs2v3WDXF13tFnxAr9xJanrGrnIvF1akrWUJ390k34rtFn7GFWUKryY
	kr1YyFy5Ga4rtwUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0pi0tCwUUUUU=
X-Originating-IP: [240e:b8f:91b3:d000:f138:f837:e143:4264]
X-CM-SenderInfo: rpryjkyvrrlimvzbiqqrwthudrp/xtbCxBa1WWpeOdYHFAAA32
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260720_080824_236718_539ED960 
X-CRM114-Status: UNSURE (   9.73  )
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

Inside .init we call dw_pcie_get_pcie_cap() to obtain the offset, because
the core has not yet cached it. Hardware is already enabled by the driver
before this point.

Signed-off-by: Hans Zhang <18255117159@163.com>
---
In pcie-ultrarisc, the call chain is:

  static const struct dw_pcie_host_ops ultrarisc_pcie_host_ops = {
    .init = ultrarisc_pcie_host_init,
  };
  ultrarisc_pcie_host_init()
    -> dw_pcie_find_capability()
---
 drivers/pci/controller/dwc/pcie-ultrarisc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pci/controller/dwc/pcie-ultrarisc.c b/drivers/pci/controller/dwc/pcie-ultrarisc.c
index 6ee661ceff67..3f6e3ab0aa69 100644
--- a/drivers/pci/controller/dwc/pcie-ultrarisc.c
+++ b/drivers/pci/controller/dwc/pcie-ultrarisc.c
@@ -49,7 +49,7 @@ static int ultrarisc_pcie_host_init(struct dw_pcie_rp *pp)
 	FIELD_MODIFY(PORT_FLT_SF_MASK, &val, PORT_FLT_SF_VAL_64);
 	dw_pcie_writel_dbi(pci, PCIE_TIMER_CTRL_MAX_FUNC_NUM, val);
 
-	cap_exp = dw_pcie_find_capability(pci, PCI_CAP_ID_EXP);
+	cap_exp = dw_pcie_get_pcie_cap(pci);
 	val = dw_pcie_readl_dbi(pci, cap_exp + PCI_EXP_LNKCTL2);
 	FIELD_MODIFY(PCI_EXP_LNKCTL2_TLS, &val, PCI_EXP_LNKCTL2_TLS_16_0GT);
 	dw_pcie_writel_dbi(pci, cap_exp + PCI_EXP_LNKCTL2, val);
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
