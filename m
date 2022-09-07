Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44C02C38145
	for <linux-riscv@archiver.kernel.org>; Wed,  7 Sep 2022 05:41:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=SUr/Itfvno81t21jWDzmlAj1DhQE+HEvS6le8l4egu0=; b=wGlkTJzrZxX9EX
	WcmKPgjXEPdOx9XgfYSw7vN0eCWxoQVfpPEIldB/oIWP+VuG1QTmpoX1m2ML0XUtxNx75dv9FKrBw
	lBMmbRPmkDJaOOLOxtxgEpWV5wqjpBNkl11ddpBtFd/ctSRe377dUosLhqloIj7aS9FZv/K21nRW2
	SI9hiLAD0ZS2+cpScrMQCAzjNy22tP37amASxpKm1a0VQirEOLTnXyQQsXi+ao4QBTesFwk1Jfm5F
	iZiKGf86qeCd4UpvALpCR9kHnUyz8bM/vh3HkqUzPVWsnYL/FTSnom/r0hMxQx9ons+n3f/BuDE+P
	Mzgc6p98g/MHr2/fd5vw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oVno2-002sp2-JO; Wed, 07 Sep 2022 05:40:58 +0000
Received: from sender4-op-o18.zoho.com ([136.143.188.18])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oVnnz-002slG-Af
	for linux-riscv@lists.infradead.org; Wed, 07 Sep 2022 05:40:56 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1662529250; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=X1X3qs5DaixNb8/fsOtVBYiS04o+PohJB+RUMSFKVbNoMRTJsDqT0T/wqXcMcV3yWkAwwEA8ZYHlt9M13RXZgaF8qk4Np7LlgGfYYZceb9Z3RVgUXnwi4kh2GLmjcQ9qoIu3QS7i6MUOHPXuYiv3Ojovs3k4cpBxv/ykUZ0y9/0=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1662529250; h=Content-Transfer-Encoding:Cc:Date:From:MIME-Version:Message-ID:Subject:To; 
	bh=Rcq4Bn+toMirH9/FszU0mYhD55p/yIgYD9I0ba0nhsg=; 
	b=f7BH4egKDE1oS7aMb6eNWabMEx0Hx17GDKWL0xG3s/5Xv1eCeiCgZh67iNVXyohvL/3ZfDCUCkasjh9DRQGecgVf/Yt8m6ozqfZcJGKt4VdRWfyCb9LGTzGT/Sdwt/ewiMkFsPx4nHngX/wnaDCo/TJ8/FrcO+iQ1mtTTuJa1Eg=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=icenowy.me;
	spf=pass  smtp.mailfrom=uwu@icenowy.me;
	dmarc=pass header.from=<uwu@icenowy.me>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1662529250;
	s=zmail; d=icenowy.me; i=uwu@icenowy.me;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-Id:Message-Id:MIME-Version:Content-Transfer-Encoding:Reply-To;
	bh=Rcq4Bn+toMirH9/FszU0mYhD55p/yIgYD9I0ba0nhsg=;
	b=cl4c8PKR8V7lq2vRuBva3+emG264Hm3+zljfpCJyYo3FamDSM5aEK/D1D/uMkmM7
	bjqSnbWc1lt5bjQR0LPmKpFDFjIYDBIZa732uXqBlG0PELDTr0bjfay7zIRLL8xz4fo
	RncBVTibiZI+bUjAOfmdjUqgtdOXYX6t/pOGuyBo=
Received: from edelgard.icenowy.me (112.94.103.212 [112.94.103.212]) by mx.zohomail.com
	with SMTPS id 1662529249034989.0127040626833; Tue, 6 Sep 2022 22:40:49 -0700 (PDT)
From: Icenowy Zheng <uwu@icenowy.me>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Greentime Hu <greentime.hu@sifive.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Rob Herring <robh@kernel.org>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kw@linux.com>,
	Bjorn Helgaas <bhelgaas@google.com>
Cc: linux-pci@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Icenowy Zheng <uwu@icenowy.me>
Subject: [PATCH] PCI: fu740: do not use clock name when requesting clock
Date: Wed,  7 Sep 2022 13:40:20 +0800
Message-Id: <20220907054020.745672-1-uwu@icenowy.me>
X-Mailer: git-send-email 2.37.1
MIME-Version: 1.0
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220906_224055_558618_2A74879A 
X-CRM114-Status: GOOD (  11.28  )
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

The DT binding of FU740 PCIe does not enforce a clock-names property,
and there exist some device tree that has a clock name that does not
stick to the one used by Linux DT (e.g. the one shipped with current
U-Boot mainline).

Drop the name in the clock request, instead just pass NULL (because
this device should have only a single clock).

Signed-off-by: Icenowy Zheng <uwu@icenowy.me>
---
 drivers/pci/controller/dwc/pcie-fu740.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pci/controller/dwc/pcie-fu740.c b/drivers/pci/controller/dwc/pcie-fu740.c
index 0c90583c078b..edb218a37a4f 100644
--- a/drivers/pci/controller/dwc/pcie-fu740.c
+++ b/drivers/pci/controller/dwc/pcie-fu740.c
@@ -315,7 +315,7 @@ static int fu740_pcie_probe(struct platform_device *pdev)
 		return dev_err_probe(dev, PTR_ERR(afp->pwren), "unable to get pwren-gpios\n");
 
 	/* Fetch clocks */
-	afp->pcie_aux = devm_clk_get(dev, "pcie_aux");
+	afp->pcie_aux = devm_clk_get(dev, NULL);
 	if (IS_ERR(afp->pcie_aux))
 		return dev_err_probe(dev, PTR_ERR(afp->pcie_aux),
 					     "pcie_aux clock source missing or invalid\n");
-- 
2.37.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
