Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD5B2C44515
	for <linux-riscv@archiver.kernel.org>; Mon, 20 Jul 2026 15:08:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=62fP9BPPuGmx5UYqAc2zvS4S/kRXGjvvdGQZDsZfb6g=; b=PVgVBUSKby5Sts
	I0sr1K8D9gwtE5vNFu4GZxvECuTnNWuqRNKVk7AhPVAqSGZLZwSBCRgUyYYkvn/hjgqm5fBl7CFk3
	EoDjWKfTdU9H0rs4+K4WwcvvRGGRXLDBO+bV1hBT1kX5sc8jzRjSzc/oOWgTV3bCszZWkljK/ePRJ
	GwklauqcIQMDFIWv578MFD9qUeBqUPnqFmisJ+ueYajwF9dozGqpxb62/YjllmjfMOki0P45/Yn/e
	AVWty38VmVPhCvbdUSP0uFdvCmf7QcC+8sZPJpjN0M3UxiSvW6geY09zXWH8BiY0V2OmJ6S63Sp0c
	sZYRXbn3dAveocpH7syQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlpba-0000000768B-2hUN;
	Mon, 20 Jul 2026 15:08:30 +0000
Received: from m16.mail.163.com ([117.135.210.4])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlpbK-000000075Ji-0ru4;
	Mon, 20 Jul 2026 15:08:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=Bh
	DWjSEv175HZK5Lkhl53A0JTo49xTss24i6v5jm7E4=; b=kZgUgkgHJL7Sf1yplc
	EnVrsUr+kYw+MnNaSlluBx5Yi7X5Bp4RB+P69pUgltAro9iVZSKW7dLWF5mbf370
	LWNjY+SZWr9P+hZaEDuv9kpdl1fIU+SyfCYTwc0y5Jc3Sq+HbrVZs3IOtC3wGaC4
	yWHKyq4Tktzljvj7NEpmiisuA=
Received: from zhb.. (unknown [])
	by gzga-smtp-mtada-g1-1 (Coremail) with SMTP id _____wD3b1rIOV5qyHOjKQ--.35310S5;
	Mon, 20 Jul 2026 23:07:58 +0800 (CST)
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
Subject: [PATCH v3 11/16] PCI: dwc: qcom: Use cached PCIe capability offset
Date: Mon, 20 Jul 2026 23:06:14 +0800
Message-Id: <20260720150619.24733-12-18255117159@163.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260720150619.24733-1-18255117159@163.com>
References: <20260720150619.24733-1-18255117159@163.com>
MIME-Version: 1.0
X-CM-TRANSID: _____wD3b1rIOV5qyHOjKQ--.35310S5
X-Coremail-Antispam: 1Uf129KBjvJXoWxCF4xJFWUKFWfWw13Jr45GFg_yoWrCw4Dpa
	s0vrn0yF45Jr48WFnFyFZ3Xr1agrnxArW7Aa97Kr1SqF9xtryUGa1jyrySyFn3GFZrtFy7
	Gry8tryUX3WrtrUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0ziHa09UUUUU=
X-Originating-IP: [240e:b8f:91b3:d000:f138:f837:e143:4264]
X-CM-SenderInfo: rpryjkyvrrlimvzbiqqrwthudrp/xtbC7A6zV2peOc52YQAA3S
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260720_080815_190110_F95ABE9B 
X-CRM114-Status: GOOD (  10.61  )
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

dw_pcie_host_init() caches the offset after .init, so .post_init callbacks
and later functions (.link_up, icc_opp_update) can use pci->pcie_cap
directly. For .init itself, we must call dw_pcie_get_pcie_cap() inside
qcom_pcie_host_init() to obtain the offset (hardware is already enabled).

Signed-off-by: Hans Zhang <18255117159@163.com>
---
In pcie-qcom, dw_pcie_find_capability() appears in multiple call chains:

  static const struct dw_pcie_host_ops qcom_pcie_dw_ops = {
    .init = qcom_pcie_host_init,
  };
  qcom_pcie_host_init()
    -> qcom_pcie_clear_aspm_l0s()
      -> dw_pcie_find_capability()

  static const struct qcom_pcie_ops ops_* = {
    .post_init = qcom_pcie_post_init_*,
  };
  qcom_pcie_post_init_*()
    -> qcom_pcie_set_slot_nccs()  (for many versions)
      -> dw_pcie_find_capability()
    -> For 2_3_3 and 2_9_0: also calls dw_pcie_find_capability() directly

  static const struct dw_pcie_ops dw_pcie_ops = {
    .link_up = qcom_pcie_link_up,
  };
  qcom_pcie_link_up()
    -> dw_pcie_find_capability()

  qcom_pcie_probe()
    -> dw_pcie_host_init()
    -> qcom_pcie_icc_opp_update()
      -> dw_pcie_find_capability()
---
 drivers/pci/controller/dwc/pcie-qcom.c | 21 +++++++++------------
 1 file changed, 9 insertions(+), 12 deletions(-)

diff --git a/drivers/pci/controller/dwc/pcie-qcom.c b/drivers/pci/controller/dwc/pcie-qcom.c
index d8eb52857f69..bd383d7cb02b 100644
--- a/drivers/pci/controller/dwc/pcie-qcom.c
+++ b/drivers/pci/controller/dwc/pcie-qcom.c
@@ -341,13 +341,13 @@ static int qcom_pcie_start_link(struct dw_pcie *pci)
 static void qcom_pcie_clear_aspm_l0s(struct dw_pcie *pci)
 {
 	struct qcom_pcie *pcie = to_qcom_pcie(pci);
-	u16 offset;
+	u8 offset;
 	u32 val;
 
 	if (!pcie->cfg->no_l0s)
 		return;
 
-	offset = dw_pcie_find_capability(pci, PCI_CAP_ID_EXP);
+	offset = dw_pcie_get_pcie_cap(pci);
 
 	dw_pcie_dbi_ro_wr_en(pci);
 
@@ -360,7 +360,6 @@ static void qcom_pcie_clear_aspm_l0s(struct dw_pcie *pci)
 
 static void qcom_pcie_set_slot_nccs(struct dw_pcie *pci)
 {
-	u16 offset = dw_pcie_find_capability(pci, PCI_CAP_ID_EXP);
 	u32 val;
 
 	dw_pcie_dbi_ro_wr_en(pci);
@@ -370,9 +369,9 @@ static void qcom_pcie_set_slot_nccs(struct dw_pcie *pci)
 	 * notifications for the Hot-Plug commands. So set the NCCS field to
 	 * avoid waiting for the completions.
 	 */
-	val = readl(pci->dbi_base + offset + PCI_EXP_SLTCAP);
+	val = readl(pci->dbi_base + pci->pcie_cap + PCI_EXP_SLTCAP);
 	val |= PCI_EXP_SLTCAP_NCCS;
-	writel(val, pci->dbi_base + offset + PCI_EXP_SLTCAP);
+	writel(val, pci->dbi_base + pci->pcie_cap + PCI_EXP_SLTCAP);
 
 	dw_pcie_dbi_ro_wr_dis(pci);
 }
@@ -935,7 +934,7 @@ static int qcom_pcie_init_2_3_3(struct qcom_pcie *pcie)
 static int qcom_pcie_post_init_2_3_3(struct qcom_pcie *pcie)
 {
 	struct dw_pcie *pci = pcie->pci;
-	u16 offset = dw_pcie_find_capability(pci, PCI_CAP_ID_EXP);
+	u8 offset = pci->pcie_cap;
 	u32 val;
 
 	/* Force PHY out of lowest power state */
@@ -1257,7 +1256,7 @@ static int qcom_pcie_init_2_9_0(struct qcom_pcie *pcie)
 static int qcom_pcie_post_init_2_9_0(struct qcom_pcie *pcie)
 {
 	struct dw_pcie *pci = pcie->pci;
-	u16 offset = dw_pcie_find_capability(pci, PCI_CAP_ID_EXP);
+	u8 offset = pci->pcie_cap;
 	u32 val;
 	int i;
 
@@ -1303,8 +1302,7 @@ static int qcom_pcie_post_init_2_9_0(struct qcom_pcie *pcie)
 
 static bool qcom_pcie_link_up(struct dw_pcie *pci)
 {
-	u16 offset = dw_pcie_find_capability(pci, PCI_CAP_ID_EXP);
-	u16 val = readw(pci->dbi_base + offset + PCI_EXP_LNKSTA);
+	u16 val = readw(pci->dbi_base + pci->pcie_cap + PCI_EXP_LNKSTA);
 
 	return val & PCI_EXP_LNKSTA_DLLLA;
 }
@@ -1664,15 +1662,14 @@ static int qcom_pcie_icc_init(struct qcom_pcie *pcie)
 
 static void qcom_pcie_icc_opp_update(struct qcom_pcie *pcie)
 {
-	u32 offset, status, width, speed;
+	u32 status, width, speed;
 	struct dw_pcie *pci = pcie->pci;
 	struct dev_pm_opp_key key = {};
 	unsigned long freq_kbps;
 	struct dev_pm_opp *opp;
 	int ret, freq_mbps;
 
-	offset = dw_pcie_find_capability(pci, PCI_CAP_ID_EXP);
-	status = readw(pci->dbi_base + offset + PCI_EXP_LNKSTA);
+	status = readw(pci->dbi_base + pci->pcie_cap + PCI_EXP_LNKSTA);
 
 	/* Only update constraints if link is up. */
 	if (!(status & PCI_EXP_LNKSTA_DLLLA))
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
