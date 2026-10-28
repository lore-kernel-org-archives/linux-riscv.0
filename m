Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2C8060A260B
	for <linux-riscv@archiver.kernel.org>; Wed, 28 Oct 2026 03:07:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=NoUaA14C;
	dkim=fail reason="signature verification failed" (1024-bit key, unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=c+gpwuqz
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=PN/BswQkVAOv00bP5obeOZCQkxXSri8dC2rHXrPj66g=; b=NoUaA14Cp1pOnzBadkXRQTvKm6
	ECj46z6PpNOfJVSmf1qSrP+Z/gjFZU/X2tbmHoNdtfx96vY2XvAUAOacTU+W37tsQChXr/qyO+zZk
	JVEfSg+4OR5+g+ILvQmjYknmUfx62tzQwffTl7MBMoor2tM66KI4/PUnGYCBEQLS+Pl/4DpD/3TWs
	6Xi4D0xY0uRGjd31xAvdQIyD1Dk8SII83H0fb3PyItBIMyJQZePRGCiGO8R/iHiqholoF5cMFObVz
	CPBzKWLoz9YihKZa3DcJWLydw2msRuZBVEDB7LdT2/c3VvJt3eKm1QTEO+yhdAMPqoMd0mScwnZVO
	abM8xPAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLu10-000000069fu-15rt;
	Wed, 28 Oct 2026 03:07:50 +0000
Received: from m16.mail.163.com ([117.135.210.4])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLu0d-000000068kN-2YFN;
	Wed, 28 Oct 2026 03:07:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=gv
	Ygj8/VtDiXCuQH4R2FXsxKr1lVxn6Z5zkOXet1cl0=; b=c+gpwuqzqtT532VjV9
	nrjYgYtKt+9aGWJ1k+EHtUXPiGCZ7WmfxNid/58TcqDyFhiNTjHn2hY7oEeO51rt
	D1XC4G/eKZLUOKBjAkgQstQDrFInvB0eO9yAcFOVgqxvdENWegJoEAq4rvdGNADf
	XPXpXW/64fglaQv6JxiHFdbT0=
Received: from Precision-7960.. (unknown [])
	by gzga-smtp-mtada-g1-3 (Coremail) with SMTP id _____wDnVwncZuFqLzE4DA--.33198S3;
	Wed, 28 Oct 2026 11:07:10 +0800 (CST)
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
Subject: [PATCH v5 09/16] PCI: dwc: intel-gw: Use cached PCIe capability offset
Date: Wed, 28 Oct 2026 11:06:45 +0800
Message-ID: <20261028030652.2917756-10-18255117159@163.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261028030652.2917756-1-18255117159@163.com>
References: <20261028030652.2917756-1-18255117159@163.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CM-TRANSID: _____wDnVwncZuFqLzE4DA--.33198S3
X-Coremail-Antispam: 1Uf129KBjvdXoW7Wry8Zw4xKw15uw48KryrXrb_yoWDArbE9r
	y5CrnrA3y5CFZ3CF12yw13AFy2ya42q3W09ayrtFZxZ3WxXw1vgws7ZFWDZ3W8Grs8Jr97
	tr1DAF18J347JjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7sRNJPEtUUUUU==
X-CM-SenderInfo: rpryjkyvrrlimvzbiqqrwthudrp/xtbC6x7jh2rhZt7GZQAA3B
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261027_200728_288256_692EE679 
X-CRM114-Status: UNSURE (   8.84  )
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

intel_pcie_link_setup() is called from intel_pcie_host_setup(), which
runs from the .init callback after the controller resources have been
enabled. Replace the capability search with dw_pcie_get_pcie_cap().

Signed-off-by: Hans Zhang <18255117159@163.com>
---
 drivers/pci/controller/dwc/pcie-intel-gw.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pci/controller/dwc/pcie-intel-gw.c b/drivers/pci/controller/dwc/pcie-intel-gw.c
index 348e579e683fa..a891c3f8eb012 100644
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
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
