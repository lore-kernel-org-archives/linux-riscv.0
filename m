Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 063E1C2BD09
	for <linux-riscv@archiver.kernel.org>; Mon,  1 Jul 2024 07:29:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CoVMZ1ypia9Xq4OxjL9+Ky1zj3f+eiUg64TA+XwVDYY=; b=e356WlQRMOAbxX
	xA2by/mA2WL3v7kO8I110xzG/1MHXdSkrxg1gzhu0JqWzhmj7BWIAz8rlZKsdazuRwDyZplug0pjp
	cX3LrJ74yzBfhNao9U5pWWi7pzU/FJ8cI2j4Su00RPSpPPm/ZIVGXxCA7zjNCkN6+vQPu8z/T0HYV
	J4I85iCtWWobsvQ2GLwI2SroZTdDWFLCKeC3EWZFCaAACtbvj7WOSNHfmLutvySaWw967j//qMniY
	4oI9DjfQRrYMXR5RhWmysXNJyXsILjSZJNh8c8kFg9JQ1UYs3qYYVUoUWUqkfuULmbdkqUCn5OYH8
	qIXvIc47mvTRtZvf8LaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sOBTc-0000000224i-1hVi;
	Mon, 01 Jul 2024 07:29:28 +0000
Received: from mail-oi1-x233.google.com ([2607:f8b0:4864:20::233])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sOBTY-0000000222i-38Oh
	for linux-riscv@lists.infradead.org;
	Mon, 01 Jul 2024 07:29:26 +0000
Received: by mail-oi1-x233.google.com with SMTP id 5614622812f47-3c9b94951cfso1693725b6e.3
        for <linux-riscv@lists.infradead.org>; Mon, 01 Jul 2024 00:29:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1719818963; x=1720423763; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WIwvidCJhYXXjv9fs8E48O/N337p1plrTXtjqFhBKIQ=;
        b=fsOVEGRxQ9MoaP5Mn0kjqYZR0+kugvQvA9SUq3Gfb5CRu83zWU8K3uAUsBWmonS1pA
         KwV4wMFUwwtewVngA0yrzUyt7CiMWeWWmS9KkERQ8zzavb8fZVjtW8MezGhFp1LLxbzB
         aiflXINoPisXRxLYxbBgZ1Ksm6FH9Bek6b4mpkKOcJr2SA58TmwxYHm/CdOD2srbIUpI
         pCiH8x+clC7LUkekPmhiF4hNRkQfIRsJ8NhqlZqS4WjhjHnpSAPTslBFJaPenwJaQuus
         WkOnvjd0crdusG6BFbvXIcED3518OIs0Ptr3hHZc8Fd7rx/Nm1GVqG1nT0d+jPmnDVD8
         sw+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719818963; x=1720423763;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WIwvidCJhYXXjv9fs8E48O/N337p1plrTXtjqFhBKIQ=;
        b=lV1bUPzJlAL5dBKAXrF5354TRhVsZVoIKyzqZjZGdd6CoSdjtRxKJNKtVrtyu+iJAY
         W9LrkgH+O1oZDIZSVKgQe6cl+P14Uz929+gFQBruPvozHBzo5cjPBUCTntJPbxMGOMxM
         EXMHRg39VGknZViDHtyfk9VG3nMdx0hgzl1+JHd6mIxbromeWmys0tClrAsYYri+f3Lu
         wKg7gHfVsNlZbBg/49IuoZWT7saijqNFBS7jqBIsz7P0su837KmW5TU6vA3QXGhM98Gu
         FVdHwsVTyhRiTYmL3S2P8ToXR1IcWnuSXmhzEn58rHRAIejj5FoRjGkdaoChOwICESVO
         93Hg==
X-Forwarded-Encrypted: i=1; AJvYcCXPcbM8ulw1d3NG46AZtAWsksD8iUmIn32OXE9lhVNbXsrI0eyi7DaX83TsL6PqixzRE4YKNREA+2KUmKovGiIUZ7R3xkOStRltasuIxavy
X-Gm-Message-State: AOJu0Yym/7XlOEKt1LmESpPK8QnXBzlknhCto2ERsOUDRE0OAUQcCXyk
	+QSD0l31PxdKQ1Z/XTuToYiKIj1t56FIWOxMFUslaSvAe4/+h59U1NYiOjbun3Q=
X-Google-Smtp-Source: AGHT+IHRz1SHHY+TmlIy6IZBZFwaBFuAJ4rZWriiRFCwuK0Ao+rNzMBXMsAGPD3T1rYs7tmFaCwRjQ==
X-Received: by 2002:a05:6808:159c:b0:3d6:324b:ddc7 with SMTP id 5614622812f47-3d6b35ca407mr8326356b6e.28.1719818963388;
        Mon, 01 Jul 2024 00:29:23 -0700 (PDT)
Received: from J9GPGXL7NT.bytedance.net ([61.213.176.58])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-70803ecf757sm5779337b3a.104.2024.07.01.00.29.18
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 01 Jul 2024 00:29:23 -0700 (PDT)
From: Xu Lu <luxu.kernel@bytedance.com>
To: tjeznach@rivosinc.com,
	joro@8bytes.org,
	will@kernel.org,
	robin.murphy@arm.com,
	paul.walmsley@sifive.com
Subject: [PATCH 1/1] iommu/riscv: Support sharing irq lines between iommu queues
Date: Mon,  1 Jul 2024 15:29:08 +0800
Message-Id: <20240701072908.25503-2-luxu.kernel@bytedance.com>
X-Mailer: git-send-email 2.39.3 (Apple Git-146)
In-Reply-To: <20240701072908.25503-1-luxu.kernel@bytedance.com>
References: <20240701072908.25503-1-luxu.kernel@bytedance.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240701_002924_810917_234E0FBC 
X-CRM114-Status: UNSURE (   9.25  )
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
Cc: apatel@ventanamicro.com, aou@eecs.berkeley.edu, linux@rivosinc.com, linux-kernel@vger.kernel.org, Xu Lu <luxu.kernel@bytedance.com>, xieyongji@bytedance.com, iommu@lists.linux.dev, palmer@dabbelt.com, linux-riscv@lists.infradead.org, lihangjing@bytedance.com, baolu.lu@linux.intel.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

When the number of wired interrupt lines is less than the number of
iommu queues, we should assign one irq line for several queues and
configure csr icvec accordingly.

Signed-off-by: Xu Lu <luxu.kernel@bytedance.com>
---
 drivers/iommu/riscv/iommu-platform.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/iommu/riscv/iommu-platform.c b/drivers/iommu/riscv/iommu-platform.c
index da336863f152..1d0af1260d5b 100644
--- a/drivers/iommu/riscv/iommu-platform.c
+++ b/drivers/iommu/riscv/iommu-platform.c
@@ -60,6 +60,10 @@ static int riscv_iommu_platform_probe(struct platform_device *pdev)
 	for (vec = 0; vec < iommu->irqs_count; vec++)
 		iommu->irqs[vec] = platform_get_irq(pdev, vec);
 
+	for (vec = iommu->irqs_count; vec < RISCV_IOMMU_INTR_COUNT; vec++)
+		iommu->irqs[vec] = platform_get_irq(pdev,
+						    (vec % iommu->irqs_count));
+
 	/* Enable wire-signaled interrupts, fctl.WSI */
 	if (!(iommu->fctl & RISCV_IOMMU_FCTL_WSI)) {
 		iommu->fctl |= RISCV_IOMMU_FCTL_WSI;
-- 
2.20.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
