Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BDC36E674B5
	for <linux-riscv@archiver.kernel.org>; Mon, 22 Dec 2025 15:17:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=au8Ebb7T5/hZ8HRSCrBJ+4jScVu4q5JcuGh1WQiLj9o=; b=M4bnTNGBgSg11S
	TG7n09/iCzV7++jJ3srNL1TrKFiyS2tGVShddNQY5doLf0YGfCeA609Rq4WI2q3QKx2m+Rz6kZo9J
	YRTKUPHH7w9hys628Fdw+GsPuUkd3ozphUpac2p0IUXdXpC4uaTqY0FGT9VhO7kjIbm6q2jPH33CN
	snSsrf1my0nUJWxSo8qz8YsXdgk1FwIZ2Cw408dLnofteFjDtaaysxaIjNpFftDG46rEIBzWTYO6u
	9e5LO0yC+YMBqwVD6u0cIJctR2YndqysQD3kmz0bKQ/UAQqo9AeVEuU28mvJ+0xOhYJeJvx3/4vaE
	kWd1hiQiE9A31jjhfTfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXheS-0000000Duye-072o;
	Mon, 22 Dec 2025 15:16:48 +0000
Received: from mail-lf1-x12b.google.com ([2a00:1450:4864:20::12b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXheP-0000000DuyH-2she
	for linux-riscv@lists.infradead.org;
	Mon, 22 Dec 2025 15:16:47 +0000
Received: by mail-lf1-x12b.google.com with SMTP id 2adb3069b0e04-5959d9a8eceso4645957e87.3
        for <linux-riscv@lists.infradead.org>; Mon, 22 Dec 2025 07:16:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766416603; x=1767021403; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=nOhpbiD30EOzMJOTDaD6LW0o3SAP0osk2RqB6dtZz9w=;
        b=js1tEdkjXSQeh0eBxakfX9feWIwF88bPKiK3QPhhHUMZVEws77X4vbr2WbkR3sozAw
         /g6VcxR9pg2XSF9/TdNM5HHo8IstUs1TaNdiSTOIrX0n+MgEwK1KE+0uvDRWqeh9HBHV
         xuzmff9s8uwV8WdVro0k7qK7y6AOEagbZtU//mkuzENaDOItCUn6pBarF8bGkmgQCWWq
         +7VGDdM85CsGgTx1VdGIFbWknCqEbEk7zZAOxCB53HYg0WRpxe+59tFR4qHftgz+4Cpi
         cQXH1oQCNHo8tiI2IGSPe+b8zvgmhpYF2SV25hzgxJFawoLAT/3LaIJuUUoxc6ySCGeh
         x4vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766416603; x=1767021403;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nOhpbiD30EOzMJOTDaD6LW0o3SAP0osk2RqB6dtZz9w=;
        b=g6Y9iaVocH4GTCAWfX3zeISWUZxbFPyqV/McbPmKwE4clHvzJDTQCYYA7+wL6moxSf
         05KsGqCfdIrXqm4V75G/amlD1T197F5QavRIgw5KI0P+3jJ/tv4KepAfQsQ8XhJP4AVV
         YOJX+gQjlZCr2gt/Gk2axVk3cxi4DdJynhIHP1DqBqRU6v9VVEpR6j8CvwiC6I+fH+SY
         I6RZsxvEl3Ndjd+dyaf60tRY3xSsD3grarSLfKp3UFJ4KNLwbavE07/U5z7WGbGNyG7l
         GYr6F4zOwG/xS8ft/ApDQyS1+j0UpKAvN12dndSFKppeZhYiCH+cVg2CxX0gn92rASBY
         QqxA==
X-Forwarded-Encrypted: i=1; AJvYcCX/J7ppTf4ccht9UzsbpJmI4g9lr8BFi4tXvT19SiZmerCj4pxHB8RpjzsXDhEjQK5I/OZE5drO2Z3oIA==@lists.infradead.org
X-Gm-Message-State: AOJu0YwdQokuc24vmSDr723hLiSIMGWgxQXVqqLWrFAJ09V0nEhmF+Hz
	jlTJpxCzNGC1QCd4Pz88lYN5Aprd1LoNF2rz3HNSUCgeQijo87MMJs+k
X-Gm-Gg: AY/fxX5fi98E8BQ/S1c7KSLkpfzKgYM7w66JEwJu99hPmE6a75Qag1kTySFlxapSruz
	UgODr2I9iZMc7dDEfA3T2aBqf+YwjeQ9fC/twWQSoSNcvBn1+8mRQVwW5XawEQOIdIxV6wu2ADT
	+V40yAD9H0ifDXLNMajKnLwSA7Ssllw+/JQelw4Ih9hyNKg0oxwkSt6G0elez4DwqvZtuExSUt0
	fXcrMxhN0I6CT0ccACtiLuQ9RFBNMGB94Vn11MrJmntCdLBI+8iKMNpcRDDLNF1ggbTYXeMohOu
	pRpptjiK3uwcQXCNwhW5qX0ixxJFWjPLhEB/nRbiDtNkyHYj7IwJKaUu+ic0/Mh6+n/Za8HE+Wh
	vRCUi1GPDvd49Ll8BclnP4QhHZfoS+lCRPNh5nebPmzYtI3OI7c9ScmCUWuqmViLvSddz6uWfdv
	wW94Hm49NP8aIA+rs+WdPGQIE2wg==
X-Google-Smtp-Source: AGHT+IFDiNOFmtI+bsuMmANJj/IxkuWiRZG1UDwI686IycfQtSE8H4lpxzEMDRaaxB0lvLInfVeh5w==
X-Received: by 2002:a05:6512:b08:b0:593:f74:90c1 with SMTP id 2adb3069b0e04-59a17dec043mr3191513e87.42.1766416602980;
        Mon, 22 Dec 2025 07:16:42 -0800 (PST)
Received: from localhost.localdomain ([176.33.67.19])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59a185d5db1sm3284874e87.18.2025.12.22.07.16.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Dec 2025 07:16:42 -0800 (PST)
From: Alper Ak <alperyasinak1@gmail.com>
To: tjeznach@rivosinc.com
Cc: Alper Ak <alperyasinak1@gmail.com>,
	Dan Carpenter <error27@gmail.com>,
	Joerg Roedel <joro@8bytes.org>,
	Will Deacon <will@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	iommu@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] iommu/riscv: Fix unsigned comparison with negative error code
Date: Mon, 22 Dec 2025 18:15:49 +0300
Message-ID: <20251222151550.987992-1-alperyasinak1@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251222_071645_763338_79C44DAD 
X-CRM114-Status: GOOD (  12.21  )
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

platform_irq_count() can return -EPROBE_DEFER, but irqs_count is
unsigned. This causes the negative value to wrap around and bypass
the error check.

Store the return value in a signed integer first and check for
errors before assigning to irqs_count.

Reported-by: Dan Carpenter <error27@gmail.com>
Closes: https://lore.kernel.org/r/202512141551.kZLTle5r-lkp@intel.com/
Signed-off-by: Alper Ak <alperyasinak1@gmail.com>
---
 drivers/iommu/riscv/iommu-platform.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/iommu/riscv/iommu-platform.c b/drivers/iommu/riscv/iommu-platform.c
index 83a28c83f991..5ec8efedbf12 100644
--- a/drivers/iommu/riscv/iommu-platform.c
+++ b/drivers/iommu/riscv/iommu-platform.c
@@ -68,8 +68,13 @@ static int riscv_iommu_platform_probe(struct platform_device *pdev)
 	iommu->caps = riscv_iommu_readq(iommu, RISCV_IOMMU_REG_CAPABILITIES);
 	iommu->fctl = riscv_iommu_readl(iommu, RISCV_IOMMU_REG_FCTL);
 
-	iommu->irqs_count = platform_irq_count(pdev);
-	if (iommu->irqs_count <= 0)
+	ret = platform_irq_count(pdev);
+	if (ret < 0)
+		return ret;
+
+	iommu->irqs_count = ret;
+
+	if (!iommu->irqs_count)
 		return dev_err_probe(dev, -ENODEV,
 				     "no IRQ resources provided\n");
 	if (iommu->irqs_count > RISCV_IOMMU_INTR_COUNT)
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
