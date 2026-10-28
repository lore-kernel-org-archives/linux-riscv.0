Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2962360A383D
	for <linux-riscv@archiver.kernel.org>; Wed, 28 Oct 2026 03:08:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=fmnmlMQk;
	dkim=fail reason="signature verification failed" (1024-bit key, unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=g+ics2jL
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=wM5NiB36Do3819wH/sml5UaoSgDrrsxD3IVO7HgWNA4=; b=fmnmlMQku/SXJe+njb69fn2e2t
	IMnS2uipj6szRsnrAtoVzA6+hGVX74g64DJaihVRnCV/Xa0on/W5AWdSZ5SJtsoz3NYX33web7tJi
	crWiWWpja26JDzIw8WBH+g9zs64JExxdeeFUYpcOK87c3gD5Fjnej/mk07IpWN0SJVLBoZpnOEp+o
	y4tLpMUS7P4sLPS+s3IuLxRznpiax9Hrax5bzhgJ/PPMWTitG7S/uzmdDZsqHBfbzzlVTLbfhrk4V
	z2SznkOIRiIROLESLhNOrMU/ikFg3g9RkcTwGgraObvalZqSe/If+4iYk0JkhSYF/Jh04P8YforSF
	1Y3X1qqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLu18-00000006A01-3ceN;
	Wed, 28 Oct 2026 03:07:58 +0000
Received: from m16.mail.163.com ([117.135.210.3])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLu0f-000000068qU-3n7a;
	Wed, 28 Oct 2026 03:07:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=Ge
	E1WcyeYWP2mSPHN7XEqyR08PBMAZMQypM2d1RF7uc=; b=g+ics2jLEMoWNTcWou
	3zuuHVannuRGZ/4ausRW5qQudn+/+QPForLoRvvdrurb1Y5Rxg1ADvE8/7V5tX+i
	p4ShFBZhHusGdXKLBIuFdMKDGHdHepwSNela/TocacSGAl/Kxq/kWHvHuXqCEwzq
	LwiYCPKMHjcKfvCvRUusynt28=
Received: from Precision-7960.. (unknown [])
	by gzga-smtp-mtada-g1-3 (Coremail) with SMTP id _____wDnVwncZuFqLzE4DA--.33198S7;
	Wed, 28 Oct 2026 11:07:14 +0800 (CST)
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
Subject: [PATCH v5 13/16] PCI: dwc: spacemit-k1: Use cached PCIe capability offset
Date: Wed, 28 Oct 2026 11:06:49 +0800
Message-ID: <20261028030652.2917756-14-18255117159@163.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261028030652.2917756-1-18255117159@163.com>
References: <20261028030652.2917756-1-18255117159@163.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CM-TRANSID: _____wDnVwncZuFqLzE4DA--.33198S7
X-Coremail-Antispam: 1Uf129KBjvdXoW7Jr1fWryrZrW5XrWkXry8uFg_yoWfWFXE9r
	9xGanrArWUGF9Ikan2y3WfXF90y3y7Za1jgayftF98Z3Z2qw1FqryDZFWvyF1UWr4DJF93
	K34qvF1rAFWUGjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7sRMb18tUUUUU==
X-CM-SenderInfo: rpryjkyvrrlimvzbiqqrwthudrp/xtbC6wLkiGrhZuLHqAAA3l
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261027_200730_868974_6276A4B8 
X-CRM114-Status: UNSURE (   8.37  )
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

k1_pcie_disable_aspm_l1() runs from the .init callback with the
controller already enabled. Replace the capability search with
dw_pcie_get_pcie_cap().

Signed-off-by: Hans Zhang <18255117159@163.com>
---
 drivers/pci/controller/dwc/pcie-spacemit-k1.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pci/controller/dwc/pcie-spacemit-k1.c b/drivers/pci/controller/dwc/pcie-spacemit-k1.c
index 92a71ea90ac31..3369592b28608 100644
--- a/drivers/pci/controller/dwc/pcie-spacemit-k1.c
+++ b/drivers/pci/controller/dwc/pcie-spacemit-k1.c
@@ -116,7 +116,7 @@ static void k1_pcie_disable_aspm_l1(struct k1_pcie *k1)
 	u8 offset;
 	u32 val;
 
-	offset = dw_pcie_find_capability(pci, PCI_CAP_ID_EXP);
+	offset = dw_pcie_get_pcie_cap(pci);
 	offset += PCI_EXP_LNKCAP;
 
 	dw_pcie_dbi_ro_wr_en(pci);
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
