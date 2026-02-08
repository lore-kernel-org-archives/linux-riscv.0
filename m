Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B8C0EF06E2
	for <linux-riscv@archiver.kernel.org>; Sun,  8 Feb 2026 14:43:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=45cPJiV5k2fhtoHW7X9mrwdfsmUSjIO+/fuy9kvBsH0=; b=Myj6CeoWfAp2bq
	/g8AE4Vz3FFL9fF9CzoY7wzyOTQc1v2srsBQ1gXIAFUVxvqE67KmiyhYd7VH7ppcdNX0glo+Xon6O
	vljer0gyHQp90SFoz5no+Eu/PCJSosAkOGg/LbWWgSvaVMhbymB4teKaN4lX2laTSnEnrmDGEt131
	pvBSc6ABVj5cQ6b4WhAGWoEpyHxT5SMWJumMYluH0efacjwSlhQQxHX4DGaqmZlQiZjgI1QJ0j356
	Dv3RpkDbTdisKxVp/kHkQtMduTke0Au4XKnZcM5LIeydy4Ydu970V5+E0hkM7HjKUMh4g7vRShEjU
	c05XEgWbHDl56fkt+zsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vp5zk-0000000DOH1-1PId;
	Sun, 08 Feb 2026 14:42:40 +0000
Received: from out30-131.freemail.mail.aliyun.com ([115.124.30.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vp5zg-0000000DOGA-2PIi
	for linux-riscv@lists.infradead.org;
	Sun, 08 Feb 2026 14:42:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1770561743; h=From:To:Subject:Date:Message-Id:MIME-Version;
	bh=dZsF7c/aL+ja/nJWbNKTWO6qdxxmo/bPtv/d90lMG5U=;
	b=lHjwjZfMlvWrOiuXlC6FOz+hBZjrKDN7NbuYt1TDeFkfESWaOdId4bF3gt4ggjEPXY2o4TcOD+8xE55CTbQU2RohFaUBpgdHV7v+KoUi/NOEyxsBK+014IdaleizKCRKqz1EkJdxlycvEXiGhEi9ftyLt2S6RIrL8JVQ124q/p0=
Received: from localhost.localdomain(mailfrom:fangyu.yu@linux.alibaba.com fp:SMTPD_---0WylHpC7_1770561740 cluster:ay36)
          by smtp.aliyun-inc.com;
          Sun, 08 Feb 2026 22:42:22 +0800
From: fangyu.yu@linux.alibaba.com
To: tjeznach@rivosinc.com,
	joro@8bytes.org,
	will@kernel.org,
	robin.murphy@arm.com,
	pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	andrew.jones@oss.qualcomm.com
Cc: guoren@kernel.org,
	iommu@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Fangyu Yu <fangyu.yu@linux.alibaba.com>
Subject: [PATCH 0/2] iommu/riscv: support range and non-leaf IOTLB invalidation
Date: Sun,  8 Feb 2026 22:42:11 +0800
Message-Id: <20260208144213.94856-1-fangyu.yu@linux.alibaba.com>
X-Mailer: git-send-email 2.39.3 (Apple Git-146)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260208_064237_012965_621DF035 
X-CRM114-Status: UNSURE (   5.27  )
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

This series adds support for two RISC-V IOMMU v1.0.1 invalidation extensions in
the RISC-V IOMMU driver:

  - Address Range Invalidation (capabilities.S), which allows encoding a NAPOT
    address range in the IOTINVAL.{VMA,GVMA} ADDR operand when the S bit is set,
    reducing the number of invalidation commands for large or superpage-backed
    mappings.

  - Non-leaf PTE Invalidation (capabilities.NL), which allows IOTINVAL.VMA with
    AV=1 and NL=1 to invalidate cached non-leaf PTE information for the given
    IOVA, addressing cases where updating mappings replaces a non-leaf entry.

Patch 1 introduces the missing capability/operand definitions and switches the
IOTLB invalidation path to use NAPOT range invalidations when supported.

Patch 2 adds the NL capability/operand definitions and extends the invalidation
path to optionally request non-leaf invalidation. When map_pages() replaces
non-leaf page-table entries, the driver invalidates the affected IOVA range with
non-leaf semantics.

No functional changes are expected on hardware that does not advertise these
capabilities; the driver continues to fall back to the existing invalidation
behavior.

Fangyu Yu (2):
  iommu/riscv: Add NAPOT range invalidation support for IOTINVAL
  iommu/riscv: Add non-leaf invalidation support

 drivers/iommu/riscv/iommu-bits.h |  17 +++++
 drivers/iommu/riscv/iommu.c      | 111 +++++++++++++++++++++++++++++--
 2 files changed, 124 insertions(+), 4 deletions(-)

-- 
2.50.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
