Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFA5B606A326
	for <linux-riscv@archiver.kernel.org>; Wed, 28 Oct 2026 03:07:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=MU+dlVpj;
	dkim=fail reason="signature verification failed" (1024-bit key, unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=bIxsEJpf
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=6vkckZ2SY2rNNJUV0X8Kk0fl1SUUHlMKfbBKJhkQ5z4=; b=MU+dlVpj08Go2vT8kg0budMSgZ
	tKPpLK7652r1q7LlDs5jDlP8mcw1W5hC0nHSG/sk/dN26O4RBGVQlWqVA+6dbOWcWmOFlu4R6r6ep
	mMr36TTHsaHrC8VRa8hfgduXYA/4l//a5edsh33y6oVJTWkeBsWnWe00YWOZNb0nw4hQE+E3ABHCd
	UEsGQoq5L/xZIaN88iJuWZNtWuxbxx0UKVmqxc4B2/eEaJKSMf7qLZ6t0le5gj65rzOyYN6B1XGtJ
	G/1FxtESWQFrwKndiSHiF0jy7t2Jm6yjWow5yeiokfUhLu9/xs9ITVbopGqNtsCuRVGPMwU7CBpbR
	pHS9nxog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLu0e-000000068rt-16FL;
	Wed, 28 Oct 2026 03:07:28 +0000
Received: from m16.mail.163.com ([117.135.210.4])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLu0X-000000068Yq-10Kh;
	Wed, 28 Oct 2026 03:07:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=tn
	of3xP7PItMivWd2BFSiA/M5yZlXFkryB98XPi7W/Q=; b=bIxsEJpfxRkV2FpHly
	U0V/n13hcy4H+VcXsozQLSJscEqHzeRDNeppX+qjrcGJCbh7yI8KnZss+KFFvylM
	9UYtdi51n0Ci6fj2DZqcQL0YOgtVJpeyaTOjoYSs37QnxdNq5wh3rIa9hrBiAOL6
	soQ9hKHVWath5V5n830zknt6k=
Received: from Precision-7960.. (unknown [])
	by gzga-smtp-mtada-g1-3 (Coremail) with SMTP id _____wDnD07QZuFqZiY4DA--.60713S8;
	Wed, 28 Oct 2026 11:07:03 +0800 (CST)
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
	Hans Zhang <18255117159@163.com>,
	Shawn Lin <shawn.lin@rock-chips.com>
Subject: [PATCH v5 06/16] PCI: dwc: rockchip: Use cached PCIe capability offset
Date: Wed, 28 Oct 2026 11:06:42 +0800
Message-ID: <20261028030652.2917756-7-18255117159@163.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261028030652.2917756-1-18255117159@163.com>
References: <20261028030652.2917756-1-18255117159@163.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CM-TRANSID: _____wDnD07QZuFqZiY4DA--.60713S8
X-Coremail-Antispam: 1Uf129KBjvdXoW7GrWrXr4xGF4kKFyDXw47Arb_yoWkZrbE93
	4UursrZrW8GrZYkan2y3yfXF98Za47ur1jga9YyF9xZFn2vr18Xr97X398AFn8GrnrZr97
	Kr1qvr48GFW3JjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7sRNMa0PUUUUU==
X-CM-SenderInfo: rpryjkyvrrlimvzbiqqrwthudrp/xtbC7BjihmrhZtjP5QAA3P
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261027_200721_651694_6FBCE4F1 
X-CRM114-Status: GOOD (  10.55  )
X-Spam-Score: -1.8 (-)
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	FROM_LOCAL_DIGITS,FROM_LOCAL_HEX,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

rockchip_pcie_enable_l0s() is called from rockchip_pcie_host_init(),
i.e. from the .init callback, which runs after the controller clocks and
resets have been enabled. Replace the capability search with
dw_pcie_get_pcie_cap(), which reads and caches the offset at this very
point.

Reviewed-by: Shawn Lin <shawn.lin@rock-chips.com>
Signed-off-by: Hans Zhang <18255117159@163.com>
---
 drivers/pci/controller/dwc/pcie-dw-rockchip.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pci/controller/dwc/pcie-dw-rockchip.c b/drivers/pci/controller/dwc/pcie-dw-rockchip.c
index bd86e32cc2b15..6d87da43cd6f0 100644
--- a/drivers/pci/controller/dwc/pcie-dw-rockchip.c
+++ b/drivers/pci/controller/dwc/pcie-dw-rockchip.c
@@ -374,7 +374,7 @@ static void rockchip_pcie_enable_l0s(struct dw_pcie *pci)
 	u32 cap, lnkcap;
 
 	/* Enable L0S capability for all SoCs */
-	cap = dw_pcie_find_capability(pci, PCI_CAP_ID_EXP);
+	cap = dw_pcie_get_pcie_cap(pci);
 	if (cap) {
 		lnkcap = dw_pcie_readl_dbi(pci, cap + PCI_EXP_LNKCAP);
 		lnkcap |= PCI_EXP_LNKCAP_ASPM_L0S;
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
