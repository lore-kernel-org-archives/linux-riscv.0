Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72062C5DF8E
	for <linux-riscv@archiver.kernel.org>; Fri, 21 Aug 2026 13:28:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0NWPwCMX3FFAOeoAbfJYVQcERIZ4xx/Yzs3B9WadbE0=; b=z38oynrihVIzsL
	Ydn6utWEzQDDCuEdPtzYoP4Buu8b5I424QXRR3FFoesRV7oLvDEQBkgMcLwxgFk1sQ//qj9C7eKiF
	RPCA8LPxJi48k0w9iS75acAum+MjJvnxi0OXnm7cxc2wQrC8sLOplCFSMFbPKR8936v6uq0IbXXxQ
	9rJVMqM1D0feCRb3WY1MKaU0tXb1yqhYju75zJ7Ly/HVug6enULMXnRzT5XP9f/5gzE8y5V5iNMFn
	m1SZ2gAco7dIjUHlJ5OxmZJMgCmSKS6u0JSqkVNuq5AUmOqRpXHVLb75MhlptlfvKldnskVq0dzrp
	w4iaMHWsliqDynDxqTyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxPIA-0000000DPJb-2eVP;
	Fri, 21 Aug 2026 13:28:18 +0000
Received: from out30-111.freemail.mail.aliyun.com ([115.124.30.111])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxPI6-0000000DPBf-20ew
	for linux-riscv@lists.infradead.org;
	Fri, 21 Aug 2026 13:28:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1787318892; h=From:To:Subject:Date:Message-Id:MIME-Version;
	bh=fN2a+F9K2N+9UIHzo/fPW1ZnfAPXmKisjaWnaBsgmck=;
	b=pgNzNmrZmEJUStuohurEV6s6AKlvX/zElH8mxtgfTpDpyXZ7uNiY7hgd0NP6R1lTcGDHcv/Xomz2TZsMWNifJ/4PK5rvhlDq8rxKvF3vOQpaF4FSp+9QfKk+GrYSdolkOF7XHzQHg0BnCocI/j5kb/vhBnbk+35U00GkQOhx93s=
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R141e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033037026112;MF=fangyu.yu@linux.alibaba.com;NM=1;PH=DS;RN=24;SR=0;TI=SMTPD_---0X9MSFIP_1787318888;
Received: from localhost.localdomain(mailfrom:fangyu.yu@linux.alibaba.com fp:SMTPD_---0X9MSFIP_1787318888 cluster:ay36)
          by smtp.aliyun-inc.com;
          Fri, 21 Aug 2026 21:28:10 +0800
From: fangyu.yu@linux.alibaba.com
To: tomasz.jeznach@linux.dev,
	joro@8bytes.org,
	will@kernel.org,
	robin.murphy@arm.com,
	pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	baolu.lu@linux.intel.com,
	jroedel@suse.de,
	zong.li@sifive.com,
	andrew.jones@oss.qualcomm.com,
	anup@brainfault.org,
	jgg@nvidia.com,
	jgg@ziepe.ca,
	kevin.tian@intel.com,
	atish.patra@linux.dev,
	skhawaja@google.com,
	vasant.hegde@amd.com
Cc: fangyu.yu@linux.alibaba.com,
	guoren@kernel.org,
	iommu@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: [RFC PATCH v3 08/10] iommu/riscv: Pre-enable GADE for second-stage domains
Date: Fri, 21 Aug 2026 21:27:48 +0800
Message-Id: <20260821132749.82070-9-fangyu.yu@linux.alibaba.com>
X-Mailer: git-send-email 2.39.3 (Apple Git-146)
In-Reply-To: <20260821132749.82070-1-fangyu.yu@linux.alibaba.com>
References: <20260821132749.82070-1-fangyu.yu@linux.alibaba.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260821_062816_200885_1F4C2138 
X-CRM114-Status: UNSURE (   7.42  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

From: Fangyu Yu <fangyu.yu@linux.alibaba.com>

Pre-enable RISCV_IOMMU_DC_TC_GADE in the device context when
attaching a second-stage domain, if the IOMMU supports AMO_HWAD.

Software pre-populates second-stage page tables with D set, so
enabling GADE by default does not change normal behavior. When
dirty tracking is enabled, iommufd clears the pre-set D bits and
GADE becomes necessary for hardware to update the dirty bit on
write access.

This avoids toggling GADE dynamically and keeps device context
setup consistent with second-stage domain attachment.

Signed-off-by: Fangyu Yu <fangyu.yu@linux.alibaba.com>
---
 drivers/iommu/riscv/iommu.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/iommu/riscv/iommu.c b/drivers/iommu/riscv/iommu.c
index 16779877351b..f01fd4e2f840 100644
--- a/drivers/iommu/riscv/iommu.c
+++ b/drivers/iommu/riscv/iommu.c
@@ -1330,6 +1330,8 @@ static int riscv_iommu_attach_paging_domain(struct iommu_domain *iommu_domain,
 			FIELD_PREP(RISCV_IOMMU_DC_IOHGATP_MODE, pt_info.iohgatp_mode) |
 			FIELD_PREP(RISCV_IOMMU_DC_IOHGATP_GSCID, domain->gscid) |
 			FIELD_PREP(RISCV_IOMMU_DC_IOHGATP_PPN, pt_info.ppn);
+		if (iommu->caps & RISCV_IOMMU_CAPABILITIES_AMO_HWAD)
+			dc.tc |= RISCV_IOMMU_DC_TC_GADE;
 	} else {
 		if (!riscv_iommu_fsc_supported(iommu, pt_info.fsc_iosatp_mode))
 			return -ENODEV;
-- 
2.50.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
