Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83886C30659
	for <linux-riscv@archiver.kernel.org>; Mon,  1 Jul 2024 12:36:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=D81QKfo6RD0KRRiEiCTNbQIEBOieXnaSN2n4kOFYppQ=; b=HlOXG1jEpvlEw8
	MzweqFE8mhu9lCJuxH91H29wKJrjNKKp3OwTI746YBBX2rdSNw3k1/zFyK0j/7GKaRgc+NMJZMyLF
	B4PvoR551DKmGGLSO16/59dq33KPlb0Zc+zUtRkTHPsQsi2Z1zglDe4uy5/7XmWifQcA58r9GPpZd
	c+mzdEhTxASh/ytbNEKMtZOAJ4OQzmLUtBgbNQ+FEkhaV+gtNlugAz1Mu5CFXEzebYs2HFy1aiY2z
	WtvjtIPLATuvBtmc8Rr2jLBBMn0scgKCLXXshT+SCwyxd3kBddMpKSHXWhup+8h9ZhduPWxHvFtwp
	u6CYZnP+k/oLBcXUspjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sOGGT-00000003FzA-1p50;
	Mon, 01 Jul 2024 12:36:13 +0000
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sOFvn-000000035sQ-0NxA
	for linux-riscv@lists.infradead.org;
	Mon, 01 Jul 2024 12:14:52 +0000
Received: by mail-pf1-x430.google.com with SMTP id d2e1a72fcca58-706b539fcaeso2720570b3a.0
        for <linux-riscv@lists.infradead.org>; Mon, 01 Jul 2024 05:14:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719836090; x=1720440890; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rS386Usr4IoaIpluIYt7tWvHO4kvCI/g3TOu2sRYrgA=;
        b=epu7lSfpbZ4G0+fIitQbT9kKIMX60ZliEuvDNdPkyoPxVPJgYxzdHejDTxxy7m9DrL
         OFbnPORjbfArOwbwJr9DpI8k1gwLud/HpU3/VHki4/KmYRPsuaIdMXW1Lo1CNwdiIFKG
         nzAhGgrv/H1ZVAnkfr6ji5GX/2Nf4qLUUxTzoCKzZpiVRTyeXfdiBaHNt0tcF6C2VVJq
         KgNLj4l5l2v1eXufznuHxBYna+s9PYfmjtYE7bfe+GboFMsmTg39DrrqyXyUdPm0a7Ff
         OIL1ExxGDvYFIwDx0rceeOa0taL1gjodMx+0IVa65W4WkZAiW7QiL60aFHWKg95vsaVd
         dqQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719836090; x=1720440890;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rS386Usr4IoaIpluIYt7tWvHO4kvCI/g3TOu2sRYrgA=;
        b=KJCssPgNjP+yfxzRKRzB6+vMxMjnLjlJ3jUFMV743v1QZxwl5p3GteHHReIk1tOih0
         QXRttJ105V7hhlbHfG5bBhO+LjCnSR6DBsFXWvTHsellHMrRwaSfGV/BkSg+pKqgGPp+
         DSV+ciMC1cBCVxOXd3879Utg/PmaUTlChAu4UZUIEo/p5u85ZArFH1DaG673zkK5vccy
         R8cM0WCxiGGkHYL46/w6rV4fCxGhIxy0v7xpy+9k/rLYlHFdXTAiboX73y3JvU8QBRBI
         79A/5RVyhFZcB2o5RQ00RnyCKOGCqQSyTmUjbdjKV+tWzsKptgPBpP/fVqU6F7dGnzLd
         5B4A==
X-Forwarded-Encrypted: i=1; AJvYcCU2eEtsSo1H8TGnUmedaX8iweDyZu/GEPeb8wdR7GVaaSj21hNG5+iRdex3ynEWxRSNDlbMBT8gjWbUf91+VoNi+2CJyQ4KPj/8n9NglXwK
X-Gm-Message-State: AOJu0YxD36axxiLcKaB38es71BudHf8lSqLPQlItERWIN94XbPmzDYlw
	ZoFlseI2dDTc8T1b2Fliv0L6nsqlecg0hvAr7Va5SN/nvslJKNaJ
X-Google-Smtp-Source: AGHT+IFNbabduMp8p2WkQI1bgHf8jszIWFXwxeyq2VyRo2CV/F66u8aNQnHpb3lwQVkcK28BW/LDAQ==
X-Received: by 2002:a17:90b:180c:b0:2c8:2cd1:881b with SMTP id 98e67ed59e1d1-2c92815591amr13089443a91.20.1719836090204;
        Mon, 01 Jul 2024 05:14:50 -0700 (PDT)
Received: from ga401ii.. ([223.178.83.109])
        by smtp.googlemail.com with ESMTPSA id 98e67ed59e1d1-2c91ce17a77sm6613098a91.6.2024.07.01.05.14.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jul 2024 05:14:49 -0700 (PDT)
From: Kanak Shilledar <kanakshilledar@gmail.com>
To: 
Cc: Kanak Shilledar <kanakshilledar@gmail.com>,
	Serge Semin <fancer.lancer@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jisheng Zhang <jszhang@kernel.org>,
	Guo Ren <guoren@kernel.org>,
	Fu Wei <wefu@redhat.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	linux-spi@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: [PATCH v2 2/3] spi: dw-mmio: update dw_spi_mmio_of_match struct with thead
Date: Mon,  1 Jul 2024 17:43:53 +0530
Message-ID: <20240701121355.262259-4-kanakshilledar@gmail.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240701121355.262259-2-kanakshilledar@gmail.com>
References: <20240701121355.262259-2-kanakshilledar@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240701_051451_157528_173EC913 
X-CRM114-Status: GOOD (  11.08  )
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

updated the struct of_device_id dw_spi_mmio_of_match to include
the updated compatible value for TH1520 SoC ("thead,th1520-spi")
to initialize with dw_spi_pssi_init().

Signed-off-by: Kanak Shilledar <kanakshilledar@gmail.com>
---
Changes in v2:
- Separated from a single patch file.
---
 drivers/spi/spi-dw-mmio.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/spi/spi-dw-mmio.c b/drivers/spi/spi-dw-mmio.c
index 819907e332c4..39e3d46ebf5d 100644
--- a/drivers/spi/spi-dw-mmio.c
+++ b/drivers/spi/spi-dw-mmio.c
@@ -419,6 +419,7 @@ static const struct of_device_id dw_spi_mmio_of_match[] = {
 	{ .compatible = "microchip,sparx5-spi", dw_spi_mscc_sparx5_init},
 	{ .compatible = "canaan,k210-spi", dw_spi_canaan_k210_init},
 	{ .compatible = "amd,pensando-elba-spi", .data = dw_spi_elba_init},
+	{ .compatible = "thead,th1520-spi", .data = dw_spi_pssi_init},
 	{ /* end of table */}
 };
 MODULE_DEVICE_TABLE(of, dw_spi_mmio_of_match);
-- 
2.45.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
