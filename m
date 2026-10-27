Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A606606CB2C
	for <linux-riscv@archiver.kernel.org>; Tue, 27 Oct 2026 12:29:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=UjdTtVIr;
	dkim=fail reason="signature verification failed" (1024-bit key, unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=ie8Q0fCu
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=lDy+E0sBEuWe5UV1BiBiVjtwLtWNQ7A/17vKiOTmuU8=; b=UjdTtVIrtq7bgG+hTdZW4YP6nj
	hdzxYTNXsb8tLHGGB0czFcaVbFyR9N6pT+QY3OGYWbDUFEwry+9xj0Dz+0A0j9kQ+VhEqziU+2EA2
	19niV27rhheHLgxsb2kCUC5sdXaok5jRZaqMxYrePSVUnBscURPGKrcB4ODZ7xyK+U9y7I2kD5iWb
	sfoHovbgDCtS8UvtNAdDHqqUn8GqZ/n4GTHKJ03fpUXnSVwEA9kTpX06vPN3Msqqmkc3Cv6MExqZc
	pIuC5g4gLJPBdcyeVtSDXAw2eGplzaWRwD3eKG40mGFN9Q/vqfjNaHK487i/w7WB9H4fuSq+mmlaB
	/uPpsvFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLgJ8-00000004eF0-2lPW;
	Tue, 27 Oct 2026 12:29:38 +0000
Received: from m16.mail.163.com ([220.197.31.5])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLgId-00000004cwM-04yT;
	Tue, 27 Oct 2026 12:29:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=5r
	TEfJyH8+8TFmlvfs8UtpwLKWhfbVwPgm8PGgqTxGU=; b=ie8Q0fCuq74BxlHMKN
	rqVQbExiWDMoqUzfp8O3Y/hWetwXPiAFKAyLO7FSIdPsoisDrRl7PnIb2yafKVk3
	DbNld+Q7sGWlFp+SoTnJwMlWHEZm6yZ/CQkjgXae2uC+mH2aUYyoRXtP7kZskJqB
	qEm607T+lG8JRwT/TzissUwC4=
Received: from Precision-7960.. (unknown [])
	by gzsmtp5 (Coremail) with SMTP id QCgvCgAH_5wFmeBq67qCCQ--.31668S2;
	Tue, 27 Oct 2026 20:28:53 +0800 (CST)
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
Subject: [PATCH v4 16/16] PCI: dwc: ultrarisc: Use cached PCIe capability offset
Date: Tue, 27 Oct 2026 20:28:27 +0800
Message-ID: <20261027122827.2725643-17-18255117159@163.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261027122827.2725643-1-18255117159@163.com>
References: <20261027122827.2725643-1-18255117159@163.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CM-TRANSID: QCgvCgAH_5wFmeBq67qCCQ--.31668S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7Cr18Aw1UZr1xJrykur4rKrg_yoW8JFykpa
	yaqr1YyF1ktr4Yyan2ka4DWFy2qFnxAryDJan7Kr13ZFy2krWUW34vka4FyFnrCF4UKryY
	k3yYyFW7Gas5Jw7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0piFfOwUUUUU=
X-CM-SenderInfo: rpryjkyvrrlimvzbiqqrwthudrp/xtbC6wY63WrgmQYa+AAA39
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261027_052907_521830_78F11947 
X-CRM114-Status: UNSURE (   9.20  )
X-CRM114-Notice: Please train this message.
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

ultrarisc_pcie_host_init() runs from the .init callback with the
controller already enabled. Replace the capability search with
dw_pcie_get_pcie_cap(). Since the lookup is performed lazily at the
point of use, the driver no longer depends on any earlier caching step
and the offset is always valid here.

Signed-off-by: Hans Zhang <18255117159@163.com>
---
 drivers/pci/controller/dwc/pcie-ultrarisc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pci/controller/dwc/pcie-ultrarisc.c b/drivers/pci/controller/dwc/pcie-ultrarisc.c
index 51e89180490d..85373b479b64 100644
--- a/drivers/pci/controller/dwc/pcie-ultrarisc.c
+++ b/drivers/pci/controller/dwc/pcie-ultrarisc.c
@@ -56,7 +56,7 @@ static int ultrarisc_pcie_host_init(struct dw_pcie_rp *pp)
 	FIELD_MODIFY(PORT_FLT_SF_MASK, &val, PORT_FLT_SF_VAL_64);
 	dw_pcie_writel_dbi(pci, PCIE_TIMER_CTRL_MAX_FUNC_NUM, val);
 
-	cap_exp = dw_pcie_find_capability(pci, PCI_CAP_ID_EXP);
+	cap_exp = dw_pcie_get_pcie_cap(pci);
 	val = dw_pcie_readl_dbi(pci, cap_exp + PCI_EXP_LNKCTL2);
 	FIELD_MODIFY(PCI_EXP_LNKCTL2_TLS, &val, PCI_EXP_LNKCTL2_TLS_16_0GT);
 	dw_pcie_writel_dbi(pci, cap_exp + PCI_EXP_LNKCTL2, val);
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
