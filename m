Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A633AC531C9
	for <linux-riscv@archiver.kernel.org>; Fri, 24 Jul 2026 15:12:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=LdrNfKLKSlY+UGdJTOm/cyW5rASt6G2v8pWg8970ujg=; b=ZvoySwG7vET24V
	Vg5LojucPVACV72OTzYcUo0mdSSOCQaAWghoVeRgVe0pF5bL+LjM5yDN9g8uKQkzDKMdJjg9snQ8B
	e3SOQsjPin/YhsEXfELLAlI3IM+P983U00Gx4XKkNLlvoRZFe3NfaCTaKPEtUW388OxwI6rB2IQVc
	smjkpinbg7rvKPBlSBgOOMQGClSoxQop2gFGKWvJYNnWgMxOwSSBR4qkFAG38iJ6c9YX12+hksaKn
	Lac8PamDHuN8XbGS4r0XOr3oR0qanf37bDAASkqOlKoJSL7bkYw/5OCzX6DAXXlSD805BvC9RRNuR
	ONQlp6wP5GeiNCUsDqPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnHZb-0000000GewW-39ak;
	Fri, 24 Jul 2026 15:12:27 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnHZY-0000000Geup-2PNt
	for linux-riscv@lists.infradead.org;
	Fri, 24 Jul 2026 15:12:26 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66ODbCIq3089374
	for <linux-riscv@lists.infradead.org>; Fri, 24 Jul 2026 15:12:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=HZTaqOfthGVMHlz4UUR4FZopztKLradcCh8
	wOx7NFuc=; b=FWcfKQtGTrOAIZkY0Rghx6vky3N2cD3YEVJyG3fqdsr7Y4Wit+V
	y1ZJ2TPmNGqcp/GYHcW1jO7UZYe/kGx9m6HIa+m+98YJvnuamjfbrdw1tc+WxBnv
	B7vhb1kwS0PVosJ7IdzfYhuuuP7HG+fXpkR/gzKBTR+TaVcBvFW97z+KX9omITQ8
	wenNOwG6eiBPTCO9bvIvZ0WGyer2vGauC5rZfoDt22jBPUnwe3BNoqjLH2XljtHo
	inDN7W+ilEocrcY07ig7cHtOQgwq+4cqxyNYT3vGpfPbPvZEcYIWeg4B7a02hnhX
	cencFVcJrWVAZngVl6vxX6zO004LvD26pzA==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fm8cgghrn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Fri, 24 Jul 2026 15:12:23 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-51c1a97644aso10054321cf.2
        for <linux-riscv@lists.infradead.org>; Fri, 24 Jul 2026 08:12:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784905942; x=1785510742; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=HZTaqOfthGVMHlz4UUR4FZopztKLradcCh8wOx7NFuc=;
        b=eLxFdVf8oR9kQ6y12nVL6cxXTaahtCVbVvRqtwF+RbkdOTAWqy4ZHoLXvaUeJKITWB
         yoD4fpISoWiOHsUd04IktGFoIX+p4dAhq3jHvrfCrvcPUBjZxGpGLsrNzXK/dkpn662M
         dC0bTKWeDRRVta6AawwWun6rOll2uIJtbuItHUQQoVXWdIjmoxE03quGA/lj7MMlAw+y
         aPHLgXeysgyUAlfDN7zFs204aj3baYl8MJHETKjYayez9ltOZuRvoMyVxp5qp+/BjfXf
         QwbtIJF/bAsCLOfvwF93SsP2uPHLS9HrWqaBoA6fhIneTUl36Fh5Ky7UhhaDwqZH/R+L
         APeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784905942; x=1785510742;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HZTaqOfthGVMHlz4UUR4FZopztKLradcCh8wOx7NFuc=;
        b=BYQDdV5++9JirCX/rWazXKTTv92fiYMcEUsCJxe2xe3G/NPPlk+zPBmQzIL13rB3Wk
         2kUf6m+Jsj9m0m4hQZtEpzGLZCfv3uzzhqFvXYzmIy7R0Wmfv35i1DvClVuurZ/3xYwN
         Dv7o+zeeKV7VnZy0DBtAK7XFr3D8ADfy/ySlVwdIzfR2xL3qDxd/3X4oteYyHicYR8Yl
         0bj12ygXI7EIdlKShYIuufIOyIp1bc++FwlBKXDViA+g52nxCTGfZvybIduoBrxdvhVU
         nY2vsx+91/lxKwa+FbaiXIAH2glaPyBqLoxabXDKChseyDilVaavpgqro61dWCylOq5q
         GCTg==
X-Gm-Message-State: AOJu0Yxe6heQ4p0+FoFgTANX8tBvIAwzftUcI9KmXF8NpiRLpjzS/DIy
	Z361GBJUdkSAoCegQBnFwlZTod3lmMBjjQ+sYG0mkwQeRyqrG7SZOPN4MNVO4Ooz+4DeI1BALUI
	1Q/iai8JNTQv0yWvJcYQDDFKlswEC+4qgxtIpC3Jj5f5wh/FFEBRxBJXKL4ENHNSXbh9Ib4tlcw
	MR3hs=
X-Gm-Gg: AR+sD12BkMVXH+sFmi2nTVt5an3A84AgszfEznhcxK4bsC5XRzM9RwaIXnunGpel5mG
	1NbR5ECRCeeHnObf/34mbg89GpqqFoNVKND10lt5Smu9VD7u21Or/auwepuTZ+NvP17C00WkvkI
	npEf0Bthdg6eDemhFHRR039EUSsPnkyjxcE6mQ3vvZxkdbhscuoD2gA6Qc500/vInaFEq/2xXX0
	NDx8C3UfYVsVXpJOfqLkHxrJHcV5ktdgNquGssHrG1bFIH2qhSQSMN7VJXeavHvrIrmxbRlJRJp
	e7LU/6omdRkYCba0uCEbX9K+m29lQx9nEKZy0kcG9Tc/CPhfWoO4oYviIbME+R28LExIu3LPtyr
	nMM/WcvO3qxhEGc8k+BvcP19+1SH+4fDfqkT3
X-Received: by 2002:a05:622a:2b09:b0:519:ef86:127d with SMTP id d75a77b69052e-5283dd9487fmr84249141cf.18.1784905941064;
        Fri, 24 Jul 2026 08:12:21 -0700 (PDT)
X-Received: by 2002:a05:622a:2b09:b0:519:ef86:127d with SMTP id d75a77b69052e-5283dd9487fmr84248451cf.18.1784905940449;
        Fri, 24 Jul 2026 08:12:20 -0700 (PDT)
Received: from localhost (ip-86-49-247-5.bb.vodafone.cz. [86.49.247.5])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1c32af244asm357943566b.27.2026.07.24.08.12.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jul 2026 08:12:19 -0700 (PDT)
From: Andrew Jones <andrew.jones@oss.qualcomm.com>
To: linux-riscv@lists.infradead.org, iommu@lists.linux.dev
Cc: linux-kernel@vger.kernel.org, tomasz.jeznach@linux.dev,
        tjeznach@rivosinc.com, jgg@ziepe.ca, jgg@nvidia.com, joro@8bytes.org,
        will@kernel.org, robin.murphy@arm.com, pjw@kernel.org,
        palmer@dabbelt.com, anup@brainfault.org, tglx@kernel.org,
        kevin.tian@intel.com, fangyu.yu@linux.alibaba.com
Subject: [PATCH v2 00/14] iommu/riscv: Enable MSI remapping and IOMMU_DMA
Date: Fri, 24 Jul 2026 17:12:04 +0200
Message-ID: <20260724151218.965929-1-andrew.jones@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI0MDEzNyBTYWx0ZWRfX1WWnE1PFY/7/
 YY2yyPE7vuNJPTG5TpdIsFd1Hms80U8gNtLlGT56ZxRnEbmoSHXAvHMTge2SnAZgO+OgeO57iwv
 Qz8lh9XhoRN3JJr7Y/gy4tPU4tZd3aTkqISxJVOUYywI233dVrH9T7YQtpLUHypyNySs0isrRwP
 VU4buFLres97gJCUTJmw3POS+LE1u2j0kyanAFa7X25qlknjlWVwR7L4nRbP0PbNFue/jwEMG2l
 qv4iYbEojpJBR1MLW8I3i/F/fjEKfLzfvwZykRbliLyjEiUbgDPTphwtRLKn2VPPnTXRxgOoDYo
 e5Mwwzyoss6ACxQ7Uchz5SasRQr6laUWxTrTlMjKbZjE7palpHX4Gc3PRYscwtKYoKtoNkbD+CW
 MY7qfBCsli2afKbbccrRKmRKHQIEM0WDzjkuxEru7gYl44qMRexARyFkbgT/Rj9PObOVJ9iOPdE
 P/tPJfG5+9oM9VHGcBQ==
X-Proofpoint-GUID: -timH6uv4VmRxXHTM3V62VP5263hT5t5
X-Proofpoint-ORIG-GUID: -timH6uv4VmRxXHTM3V62VP5263hT5t5
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI0MDEzNyBTYWx0ZWRfX5UEaAZC0SfpD
 QV//FgidnoRlb9wGqfxYI7oe5mS68SQO6NE6b9PY7rQcg7GWUo75cnJoyhz/zKgDYkxIlWuw1LX
 OVs/ViGFlJ9b+CZtLsQH3GFHsNKGJmI=
X-Authority-Analysis: v=2.4 cv=P9sKQCAu c=1 sm=1 tr=0 ts=6a6380d7 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=aYZ+cQcEYoLAp2L633VOig==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=SC3fYP8t-DLMrfhBmjEA:9 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-24_03,2026-07-24_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 priorityscore=1501 phishscore=0 bulkscore=0
 lowpriorityscore=0 adultscore=0 impostorscore=0 malwarescore=0 clxscore=1011
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607240137
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260724_081224_656153_2CC6E735 
X-CRM114-Status: GOOD (  17.65  )
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

This series adds MSI remapping for IMSIC so a device's MSI target gets
translated the same way its DMA does, allowing RISC-V to enable IOMMU_DMA
and paging domains by default.

v1[1] used get_resv_regions() with IOMMU_RESV_DIRECT_RELAXABLE to identity
map IMSIC pages, but that was rejected as only a workaround, and the
proposal for v2 was to follow ARM's approach. ARM calls
iommu_dma_prepare_msi() once at IRQ-alloc time, caches the IOVA on the
msi_desc, and lets compose replay it via msi_msg_set_addr(). This series
follows that structure by introducing an IRQ domain and a new
iommu_dma_map_msi(). Like iommu_dma_prepare_msi(), it dispatches on the
same domain cookie types. Unlike iommu_dma_prepare_msi(), it returns the
IOVA to the caller instead of caching it on a descriptor. That allows the
caller to collect all IOVAs needed (since IMSIC needs one IOVA per host
IMSIC page). Like ARM, msi_msg_set_addr() is used at compose time to
direct MSIs to the appropriate IOVAs.

The divergence from ARM is required due to where the target address
actually lives. ARM's doorbell PA is fixed per ITS instance (affinity
changes only retarget hardware routing, never the composed address) so
one IOVA cached at alloc time stays valid for the descriptor's lifetime.
IMSIC doesn't have a fixed target, the MSI address itself changes on
irq_set_affinity(), and that runs in atomic context, so mapping a fresh
IOVA isn't an option. This series pre-maps every IMSIC page into a
domain-wide PA-to-IOVA table at first IRQ-alloc time, and compose does an
O(1) lookup to pick the right one.

LLM-based coding assistants were used during development for code
exploration ("super grep" as one of my colleagues calls it), patch review,
test execution, and commit-message iteration, but all resulting code and
commit messages were selected, reviewed, and finalized by me. Per-patch
Assisted-by tags are omitted in light of the ongoing discussion about
simplifying coding-assistant attribution[2].

Thanks,
drew

[1] https://lore.kernel.org/all/20260508212339.381933-1-andrew.jones@oss.qualcomm.com/
[2] https://lore.kernel.org/all/20260701-work-coding-assistants-v1-1-a20a94d1d606@kernel.org/


Andrew Jones (13):
  iommufd: Convert struct iommufd_sw_msi_maps to a growable bitmap
  iommufd: Add iommufd_sw_map_msi()
  iommu/dma: Add iommu_dma_sw_map_msi()
  iommu/dma: Add iommu_dma_map_msi()
  genirq/msi: Provide DOMAIN_BUS_MSI_REMAP
  irqchip/riscv-imsic: Compose MSI updates through the hierarchy
  iommu/riscv: Add IRQ domain for interrupt remapping
  iommu/riscv: Prepare info->domain for concurrent RCU read access
  iommu/riscv: Publish IOMMU_RESV_SW_MSI region for iommufd MSI
    remapping
  iommu/riscv: Pre-map IMSIC MSI targets
  iommu/riscv: Copy MSI IOVA table when replacing an iommufd domain
  iommu/riscv: Implement irq_compose_msi_msg for IMSIC remapping
  riscv: defconfig: Enable IOMMUFD and VFIO

Tomasz Jeznach (1):
  iommu/dma: Enable IOMMU_DMA for 64-bit RISC-V

 arch/riscv/configs/defconfig               |   3 +
 drivers/iommu/Kconfig                      |   2 +-
 drivers/iommu/dma-iommu.c                  |  39 ++-
 drivers/iommu/dma-iommu.h                  |  12 +
 drivers/iommu/iommu-priv.h                 |  11 +
 drivers/iommu/iommu.c                      |  86 +++++-
 drivers/iommu/iommufd/device.c             |   3 +-
 drivers/iommu/iommufd/driver.c             |  97 +++++--
 drivers/iommu/iommufd/hw_pagetable.c       |   1 +
 drivers/iommu/iommufd/iommufd_private.h    |  38 ++-
 drivers/iommu/riscv/Kconfig                |   1 +
 drivers/iommu/riscv/Makefile               |   2 +-
 drivers/iommu/riscv/iommu-ir.c             | 298 +++++++++++++++++++++
 drivers/iommu/riscv/iommu.c                |  91 +++++--
 drivers/iommu/riscv/iommu.h                |  37 +++
 drivers/irqchip/irq-msi-lib.c              |   8 +-
 drivers/irqchip/irq-riscv-imsic-platform.c |  27 +-
 include/linux/iommu.h                      |  22 ++
 include/linux/irqchip/riscv-imsic.h        |   7 +
 include/linux/irqdomain_defs.h             |   1 +
 20 files changed, 693 insertions(+), 93 deletions(-)
 create mode 100644 drivers/iommu/riscv/iommu-ir.c

-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
