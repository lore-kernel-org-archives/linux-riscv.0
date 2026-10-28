Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3A9760A2619
	for <linux-riscv@archiver.kernel.org>; Wed, 28 Oct 2026 03:08:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=dYUiVD6J;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=fXrSW3rV;
	dkim=fail reason="signature verification failed" (1024-bit key, unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=RSwjLMSz
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=bM0At9CNh9BN0/OFLknXnkENYeFpus8932n5piDeof0=; b=dYUiVD6JMOe4qh2MmVBumF/Vl8
	EhlOLnhdKEa1NVklNfxbDmceOpPNE0JouVk8a3MLGS7qL9gUxyrD9FIq9y4h6HvcMRaDJsx8QWTgk
	Fwz/mtxAZ1yUCfJD9rmA09WyQ91E0DKum5GTgqFYGJ9BVoccI2gotk19OOLqUXkSiBENdbr82cLkE
	6r4bKoqNwDVNKmQIbhosZgcjYnC9/VLXjo3nUPLY1ovWmfZgSujJorxuGoQBmv6DfpGA8NacWbk24
	7aU+MjWch5cWL34scNGUjZc03XVUugm/cA9jzOdsg52n5hvJk/ms9doHrx/oZqkTOeD8afhhi9yyC
	gaPWkDsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLu1D-00000006AC1-2AdG;
	Wed, 28 Oct 2026 03:08:03 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLu13-000000069iq-1j1d;
	Wed, 28 Oct 2026 03:07:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=uGOww8cTZ+dmcRduWhvlBtmVa5S9Xqh7rcDtCCMSFaU=; b=fXrSW3rVREwZw8nwhrKqzlcL5f
	meAOIOZWfADqJ93Va4/HPplSjHhytnyKxyRYm/9RdTSA71/Ba5mWzLUPSJ7UhvDGzX7Oz3BBTY4i1
	S3H7DxuPPghgueDO0WxxQmDykmttHSv8zRAS/FaPd0g+69LhEDsx+Rz/C6enfFrESgRrdEGC75V2Z
	8096nXKBbpV3DOvKHXTMhfBJut7yWNeqwEOrGDRavqhmR2cBnLoB9dXPupOwE+Cr9AKGESCoPlBW/
	pKg5kHLto4zB6XqqFT4x+nzL1hfuxMXhB0fow0BdavZZowT/37Exk2uYCnd+plKB6FiCtM1RBklMi
	Gb851Ajg==;
Received: from m16.mail.163.com ([117.135.210.5])
	by desiato.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLu0y-0000000FdaX-10P1;
	Wed, 28 Oct 2026 03:07:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=uG
	Oww8cTZ+dmcRduWhvlBtmVa5S9Xqh7rcDtCCMSFaU=; b=RSwjLMSzAQnxak8cmk
	7cG9+kuYA6fM6xiN80akLhw8s7Dr7paowbfmps8cOdj+m4q4E3/iC+HYPXjScxR7
	CJJfX/W9z09f3QH56i8pO5ywPoHHyAS3UdLaxVepcGDglSHUjPxK4SmXu7KmviBi
	lwzcQRd5cGDFhgdUvc+MwLEC0=
Received: from Precision-7960.. (unknown [])
	by gzga-smtp-mtada-g0-0 (Coremail) with SMTP id _____wDXT8PnZuFq9rwVDg--.12376S2;
	Wed, 28 Oct 2026 11:07:20 +0800 (CST)
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
Subject: [PATCH v5 16/16] PCI: dwc: ultrarisc: Use cached PCIe capability offset
Date: Wed, 28 Oct 2026 11:06:52 +0800
Message-ID: <20261028030652.2917756-17-18255117159@163.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261028030652.2917756-1-18255117159@163.com>
References: <20261028030652.2917756-1-18255117159@163.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CM-TRANSID: _____wDXT8PnZuFq9rwVDg--.12376S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7Cr18Aw18ur17KF4rWF47XFb_yoW8JFy3pa
	yaqr1YyF1kJr4Yyws2ka4DWF12q3ZxAryDJan7Kr13ZFyakrWUX34vk34rtFnFkF4UKr1Y
	kw4FyFy7G3WrXwUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0pirWriUUUUU=
X-CM-SenderInfo: rpryjkyvrrlimvzbiqqrwthudrp/xtbC7AnmimrhZunUcQAA3o
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261028_030749_108459_6D37C817 
X-CRM114-Status: GOOD (  10.27  )
X-Spam-Score: 0.4 (/)
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
index 523f454c6c524..915305bd88df4 100644
--- a/drivers/pci/controller/dwc/pcie-ultrarisc.c
+++ b/drivers/pci/controller/dwc/pcie-ultrarisc.c
@@ -56,7 +56,7 @@ static int ultrarisc_pcie_host_init(struct dw_pcie_rp *pp)
 	FIELD_MODIFY(PORT_FLT_SF_MASK, &val, PORT_FLT_SF_VAL_64);
 	dw_pcie_writel_dbi(pci, TIMER_CTRL_MAX_FUNC_NUM, val);
 
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
