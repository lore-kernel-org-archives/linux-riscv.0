Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 252A4C27C6E
	for <linux-riscv@archiver.kernel.org>; Fri, 14 Jun 2024 14:22:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=my6AuU8ROLWm2/OD0WHVtkwCW52ZWD0MnRZcYiVzDFQ=; b=aJXqMtgmM7JRdE
	5fFWhBRD2t8nY3STzCVJjRGGu2qds9506d4jQWjMVjQz2yRU7GVZmKg92zBb33qlRp0OT9OH8/bBm
	QMvTGhQRv+X/cWdQchtpjc5bj9NQrQqXiEsUNX75tTKIkWpGkAGq+kYkBzz2SuoIA1AjHyVp38rZf
	s83+EVOlhT0AEcblOJ7joHsLFF39KRJJ6VCT7wasIeOqayOPnK5SAfPJdJaftXqtcy84TRBjiLI9T
	h46gziC+WWl7o1u7KjbC8j3+2UwKCR35tPjuhJRFVTvX9u27lSq0WumK0cgC8joxYmjhhgLVtajJJ
	XLJ9JmeWXIsAbuClslWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sI7ow-00000002zz5-0RV9;
	Fri, 14 Jun 2024 14:22:26 +0000
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sI7os-00000002zvv-3lK2
	for linux-riscv@lists.infradead.org;
	Fri, 14 Jun 2024 14:22:24 +0000
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-1f6559668e1so19741975ad.3
        for <linux-riscv@lists.infradead.org>; Fri, 14 Jun 2024 07:22:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1718374940; x=1718979740; darn=lists.infradead.org;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=M7iZUV99NQN3RgJM91vO01sfzoKXhBrbq1qPqNaXoaI=;
        b=SBIT4OnzMiuZXekFqsawXW4lQtKArVOWVWE5sbdpWphdb8NYkUsHGwdD/IbLWomqCu
         7W/olX2QtopH4HBAjjOx8Rs+5pRkkhoPlMvWoiWYC7bbIM38q0yfuX4rr0R/qtALC55R
         dHWCqDWUkTz2kQ6snFBH71dXu6NZ9vo2axtWpBSkT64nl64uOlZLfQgWHhy6+NX1xQGG
         YH8P0F9FkiCV5Sxu1PaPrVs04UU22Knxg6JDnZ6vW8cxEtP3wPkx+gHNmBcIgyk1G+N0
         Yce5Wci8EpGRj1W3tZGCQt3EZEJMe5rMqbxOxjDPLdcISNrYSBxcoIpG2NFJLKKSsxy3
         lbSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718374940; x=1718979740;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=M7iZUV99NQN3RgJM91vO01sfzoKXhBrbq1qPqNaXoaI=;
        b=VizgX66Wp7KojKP7Glfqj4XZvsjkFgnL1A/kMVWwopZDDIjIbn+vzgCViifMhCKoCY
         wnuhJBuCtM8Fo81ZcgGT2ZTWIBtPHunUG2cfmqnPunXPjyKVOFknnZpgaGGDyc/+o2CI
         GW1rTDtwbx1u+VWhFpdK3yiVUg9DnkDdjq7KWXcDneEIyZbsphRWF2xGEWjZbxIj99fi
         mXDpYh1CqukvvUyBZoFi9T1b3Vq0Bj/m//oNeRy9izRIw0HVuplv+8IevKu+6R4eVKIK
         UdUlHB5dozLeOZbCuIBgrMbibsJBg3Lm+M2I0RFBcWq40C4aTXQ09xCPfNg778cHfovX
         OJ1Q==
X-Forwarded-Encrypted: i=1; AJvYcCX4RjI4OevG/uC4FbY8uECJy/mz5BBAG/UsbDoP093OcahtUqx6CksTsEFr7eVikJ4056jD7maRmDGix+bGLrYZyEIb+mNdc+z3pFH1vorU
X-Gm-Message-State: AOJu0YzJofvSNEnoLb/7rmbNo1q8SiWo9NGTlP4NeKoS/4RR0DZhpU1Z
	TWPsag0DT9zD20PzfmwcKYwAuamXK9M6vbo/urpcGw++xXfuu9Tb2NoG2DT4Zw4=
X-Google-Smtp-Source: AGHT+IGJERSTIzaOjggWWP0rQrcqidvG0Fn1shO0SdaiGkk+fF3agyv6rp5JLRqhxN5jNm2HLZv71g==
X-Received: by 2002:a17:902:6906:b0:1f7:21fd:ab83 with SMTP id d9443c01a7336-1f8629feaeemr22250365ad.54.1718374940068;
        Fri, 14 Jun 2024 07:22:20 -0700 (PDT)
Received: from hsinchu26.internal.sifive.com (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f855e559d9sm32522005ad.35.2024.06.14.07.22.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Jun 2024 07:22:19 -0700 (PDT)
From: Zong Li <zong.li@sifive.com>
To: joro@8bytes.org,
	will@kernel.org,
	robin.murphy@arm.com,
	tjeznach@rivosinc.com,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	jgg@ziepe.ca,
	kevin.tian@intel.com,
	linux-kernel@vger.kernel.org,
	iommu@lists.linux.dev,
	linux-riscv@lists.infradead.org
Cc: Zong Li <zong.li@sifive.com>
Subject: [RFC PATCH v2 04/10] iommu/riscv: add iotlb_sync_map operation support
Date: Fri, 14 Jun 2024 22:21:50 +0800
Message-Id: <20240614142156.29420-5-zong.li@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20240614142156.29420-1-zong.li@sifive.com>
References: <20240614142156.29420-1-zong.li@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240614_072222_998019_E25E872F 
X-CRM114-Status: GOOD (  10.09  )
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Add iotlb_sync_map operation for flush IOTLB. Software must
flush the IOTLB after each page table.

Signed-off-by: Zong Li <zong.li@sifive.com>
---
 drivers/iommu/riscv/Makefile |  1 +
 drivers/iommu/riscv/iommu.c  | 11 +++++++++++
 2 files changed, 12 insertions(+)

diff --git a/drivers/iommu/riscv/Makefile b/drivers/iommu/riscv/Makefile
index d36625a1fd08..f02ce6ebfbd0 100644
--- a/drivers/iommu/riscv/Makefile
+++ b/drivers/iommu/riscv/Makefile
@@ -1,3 +1,4 @@
 # SPDX-License-Identifier: GPL-2.0-only
 obj-$(CONFIG_RISCV_IOMMU) += iommu.o iommu-platform.o iommu-pmu.o
 obj-$(CONFIG_RISCV_IOMMU_PCI) += iommu-pci.o
+obj-$(CONFIG_SIFIVE_IOMMU) += iommu-sifive.o
diff --git a/drivers/iommu/riscv/iommu.c b/drivers/iommu/riscv/iommu.c
index 9aeb4b20c145..df7aeb2571ae 100644
--- a/drivers/iommu/riscv/iommu.c
+++ b/drivers/iommu/riscv/iommu.c
@@ -1115,6 +1115,16 @@ static void riscv_iommu_iotlb_sync(struct iommu_domain *iommu_domain,
 	riscv_iommu_iotlb_inval(domain, gather->start, gather->end);
 }
 
+static int riscv_iommu_iotlb_sync_map(struct iommu_domain *iommu_domain,
+				      unsigned long iova, size_t size)
+{
+	struct riscv_iommu_domain *domain = iommu_domain_to_riscv(iommu_domain);
+
+	riscv_iommu_iotlb_inval(domain, iova, iova + size - 1);
+
+	return 0;
+}
+
 static inline size_t get_page_size(size_t size)
 {
 	if (size >= IOMMU_PAGE_SIZE_512G)
@@ -1396,6 +1406,7 @@ static const struct iommu_domain_ops riscv_iommu_paging_domain_ops = {
 	.unmap_pages = riscv_iommu_unmap_pages,
 	.iova_to_phys = riscv_iommu_iova_to_phys,
 	.iotlb_sync = riscv_iommu_iotlb_sync,
+	.iotlb_sync_map = riscv_iommu_iotlb_sync_map,
 	.flush_iotlb_all = riscv_iommu_iotlb_flush_all,
 };
 
-- 
2.17.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
