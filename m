Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6DE4C4452A
	for <linux-riscv@archiver.kernel.org>; Mon, 20 Jul 2026 15:08:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=S7w+S3C73DkHHkei4qOvW9HR15BKqjatKfy7ivzqw44=; b=5B/fwinmrcypKK
	V1nADNysy422NgmJzv0nD4SM/mdC8TSw9sZdlWW55tE3RCzLAtTcyEv79YEeO+wCiUhDPKJGt77n5
	V6APZG0h/ShRj0w3vj0rYqaDWhklxtHoRjD2Y0Y952FwRcve3lodiLcZDEf/vEoEs7dM80waWupHO
	iuung5P8KLvKWF5nu4vgnkyYUJeNhSU08yO4dXw9msHiK1VpCt33hZ4o04LBN3NsgNcxJKFIiYAWI
	aHDl33/r90qIycdyHFlbdHiTAd8ku7uTFJwZh3LYxuaqyVJOMBV2JdYJVqCQfW6rBvc9BX/YL94Ct
	j1G1dhuDu1dnns7sPr3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlpbi-000000076Vx-2Bqf;
	Mon, 20 Jul 2026 15:08:38 +0000
Received: from m16.mail.163.com ([220.197.31.5])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlpbN-000000075Rl-2NOi;
	Mon, 20 Jul 2026 15:08:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=e2
	nYu9u3Jutd+nElU90XXHobR87pV+uv8qFn8mq8pVQ=; b=P7co5XrjYMyTZkVAHt
	/cKwUjkvIhjJZ13ufrkXHk5vM5fgZrivLl6avaptV5bMUovq4jhXCIXZtygS/sZR
	+JL7x8K/M6DAAQjnRDkZdy7NaHhN1mmKSkHIMUfKsECCiFfOhpsrgmMKlhUTM4b5
	w7hQcCHbDNxtAcEn3lZ7fPc2E=
Received: from zhb.. (unknown [])
	by gzga-smtp-mtada-g1-1 (Coremail) with SMTP id _____wD3b1rIOV5qyHOjKQ--.35310S3;
	Mon, 20 Jul 2026 23:07:56 +0800 (CST)
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
Subject: [PATCH v3 09/16] PCI: dwc: intel-gw: Use cached PCIe capability offset
Date: Mon, 20 Jul 2026 23:06:12 +0800
Message-Id: <20260720150619.24733-10-18255117159@163.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260720150619.24733-1-18255117159@163.com>
References: <20260720150619.24733-1-18255117159@163.com>
MIME-Version: 1.0
X-CM-TRANSID: _____wD3b1rIOV5qyHOjKQ--.35310S3
X-Coremail-Antispam: 1Uf129KBjvJXoW7GF1xWrW8JrykKFy3Cr1fCrg_yoW8JF17pa
	y5Xr1jyFn5XF429F17A3Z8XF1Yy3ZxA3s3Ga97Gr1SvF9rCryDK3yqkryFkF9rGFW0vw1a
	kw1Utw17Grn8JrUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0pig_-QUUUUU=
X-Originating-IP: [240e:b8f:91b3:d000:f138:f837:e143:4264]
X-CM-SenderInfo: rpryjkyvrrlimvzbiqqrwthudrp/xtbC7AyzV2peOcx2MwAA3A
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260720_080818_005082_1C2ECD79 
X-CRM114-Status: UNSURE (   9.10  )
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

dw_pcie_host_init() calls .init before caching the offset, so inside
.init we must call dw_pcie_get_pcie_cap() to obtain the offset (hardware
is already enabled). The helper will cache the result for later use.

Signed-off-by: Hans Zhang <18255117159@163.com>
---
In pcie-intel-gw, the call chain is:

  static const struct dw_pcie_host_ops intel_pcie_dw_ops = {
    .init = intel_pcie_rc_init,
  };
  intel_pcie_rc_init()
    -> intel_pcie_host_setup()
      -> intel_pcie_link_setup()
        -> dw_pcie_find_capability()
---
 drivers/pci/controller/dwc/pcie-intel-gw.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pci/controller/dwc/pcie-intel-gw.c b/drivers/pci/controller/dwc/pcie-intel-gw.c
index 348e579e683f..a891c3f8eb01 100644
--- a/drivers/pci/controller/dwc/pcie-intel-gw.c
+++ b/drivers/pci/controller/dwc/pcie-intel-gw.c
@@ -119,7 +119,7 @@ static void intel_pcie_ltssm_disable(struct intel_pcie *pcie)
 static void intel_pcie_link_setup(struct intel_pcie *pcie)
 {
 	u32 val;
-	u8 offset = dw_pcie_find_capability(&pcie->pci, PCI_CAP_ID_EXP);
+	u8 offset = dw_pcie_get_pcie_cap(&pcie->pci);
 
 	val = pcie_rc_cfg_rd(pcie, offset + PCI_EXP_LNKCTL);
 
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
