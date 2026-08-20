Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A311C5DF81
	for <linux-riscv@archiver.kernel.org>; Thu, 20 Aug 2026 21:42:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=0E/OTs7LY+oFjX0i+GM5JwYOTfaSlE5MA4i0WilXqvA=; b=Co/k91D2qTn/Qt
	1l3jVaEtwqraxTS86S7BvcVkE0pFPRAoL8gg5+4X0PXmAvQwd8sfiY+IYH3Qj8LWj7ScLMikOpHVG
	NIokOubk/i/KFxza+ty/FDk+AME0X9hDGd+uGv5Mpg2zAQz3NcGIEPRaQrQHXfUwQZjUxIreZVaYQ
	Om3E72qp9QtC9KDL0IqmmnXai1FMKwYZFfXN2nATF3+5AVjdqiQD94hbIK2DVYpp/Rh7xgM0qHbWt
	aLRhAX/E4f40+iXt8dpXxWL1WgtUmTwtiLLdUzAtBLepDg9ksfDxGbUnxqEeCW80hHfRN1pEM3orl
	/1ACbMhc5oam7ez8iFYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxAWO-0000000CDZZ-14Vv;
	Thu, 20 Aug 2026 21:42:00 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxAWK-0000000CDYe-4AYF
	for linux-riscv@lists.infradead.org;
	Thu, 20 Aug 2026 21:41:58 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67KK7pLO3492133
	for <linux-riscv@lists.infradead.org>; Thu, 20 Aug 2026 21:41:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=j6Bwt9iYUQQSgcsBbVeYnZY6fTgfzlVwvWx
	n3LzObN0=; b=Xe1KDJx0lFBAjkmtJ7gBkS1/b3Bi3OnTOov37nhLUUjj7D8aKMN
	rZ6ywynDG64aQvR2b7BZZgVdrshIp4Lac3WH1efUu9GXSpCQ0j/OD7k/+XaKuQK8
	v64aTxN1VjbkBrT8/wLxdoRcL+CWS8Iga6MGZj+/1r6cTKJmXlEMQt6Dn/cpxZkL
	GwQ87gkXzCIqHyEKUjp10kGqkQmFNzw6q8aqFTRiGtDekD6uWvweRIX6NKmBgQTh
	k4zsL83bWrLYfTSt9gIUf0kGO5wNKCs+KaG/dVoZuUBhopjqzZFkA0qoAtjuZyWa
	EJRJdAFx4Nx7XNCbQ/tTd64RmRBg3Z62luw==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g5ytcb061-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Thu, 20 Aug 2026 21:41:54 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-526da7e3c9dso3075601cf.1
        for <linux-riscv@lists.infradead.org>; Thu, 20 Aug 2026 14:41:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787262114; x=1787866914; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=j6Bwt9iYUQQSgcsBbVeYnZY6fTgfzlVwvWxn3LzObN0=;
        b=Q+A9oDxtxDaWDYqTRlE4iO8AbAdyQCpVVo33jwsApNXd0izEaIKqMaGt+rsRgPfTC7
         1VMQfH5POmuMabvRlqXC48DKGW67GQU/0qvXvRkhEeUm/btGTlOLiip2ikXpJcbjeLbc
         0AzwbV4/D7DZxiv6HWZ7MD9+lU5rNqjxjobp+5/vMByvnMg9taLuvrzXuBesDqzvOEMP
         Iau6KElzcCBEtR/kP1XElNPUxjdZ4pYOxEVvrZJ3mv4UetDXqcUqCIiTFEwfDFYsmAaZ
         yAhZO1LPxnX4mDC61E1qtSN5iBWBhpnEuUdsVElGYepZ8H7sNUqDFAYLQq5jg+m5Fbhz
         Yt2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787262114; x=1787866914;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=j6Bwt9iYUQQSgcsBbVeYnZY6fTgfzlVwvWxn3LzObN0=;
        b=WCB1MxK87V8czcIqQ0D2u26CMfAscArEHOLKVqaG7JlFcCYi6BDdbbAacvsoZxdQ4F
         VIUouGlp71+VorUjf0fy1YIIu6MWhOs8iKtv7URVlcPghOrlIwGFUXZYhz+sVqI7a7qF
         V3AD/AvBDYukMyrUOLU6sqVC7qMgumVYbm3+0nqOqDwMwVvqPNvwyDcCbRjD8sPo0nUm
         +131DP95432XqBLdSiKBeKRpLHLDDquDF/11fpXqyCXuOL3YczjsMz6qr255X2qskqpj
         pysPrBxbqXuB7aYJMAbV2xwV6LAb6UEUFc7QIWkHjcHZadYhgQyLOncKK/ZjdI6zryWB
         uTMQ==
X-Gm-Message-State: AOJu0YyFglP1HsdijNvcGFgul5JEDb50Xd3+7vxfeTc12/iKyRUAowW6
	jtD50eST6Xk3FvCGj/NZjTlBiTXdFA6ggLOckd/W7NHOaZ6cqX1uZdYP6y91TEX8DPEZ7gigDle
	RqC9O5ju8Y29j3Z0wFDbI2gzU/lOliISFIF0VDt9RWOE3jILb2CiR6C3Qv82I72LCXq7mIMd7mV
	L1HDU=
X-Gm-Gg: AR+sD123lWYzLD6iHUlkBnPVTPDn8OcptpMMdcuPw4rHcYQeMfsHqu88IOmh1T71/io
	olButtnF1pRSi3ebxGII0byGOCc/zflX3JttJNVhOFCvLTcNbwYK5Acq4XaLzrft+NYJK65aPC4
	EJgDq1QO/20T5Wbksy7pWmbY/1XuuT7JfHOxT9XwxQMHyp/1VagRq4Uf7YyggS5FFWLgpvSOy72
	5QFV9lVSDcE71mq4ZT2D2/6+9qDPBG9KvqasA9IuT4lJ7VGgu8isx5ngFYuEXLfBjV2MJAfFJ12
	OxUNIqEA9nVVoCywCI3OXiAaCO/qmeFwZVvTU3pKZQSAsqtZT6T1/oZfZW6QvrCtomPJXC4ya+9
	huaqG8V3O
X-Received: by 2002:ac8:59c8:0:b0:51b:f40b:2fb3 with SMTP id d75a77b69052e-52df5694c1emr15478311cf.9.1787262113751;
        Thu, 20 Aug 2026 14:41:53 -0700 (PDT)
X-Received: by 2002:ac8:59c8:0:b0:51b:f40b:2fb3 with SMTP id d75a77b69052e-52df5694c1emr15477741cf.9.1787262113094;
        Thu, 20 Aug 2026 14:41:53 -0700 (PDT)
Received: from localhost ([193.165.40.195])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482b1450e61sm15340014f8f.13.2026.08.20.14.41.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Aug 2026 14:41:51 -0700 (PDT)
From: Andrew Jones <andrew.jones@oss.qualcomm.com>
To: linux-riscv@lists.infradead.org, iommu@lists.linux.dev
Cc: linux-kernel@vger.kernel.org, tomasz.jeznach@linux.dev,
        tjeznach@rivosinc.com, jgg@ziepe.ca, jgg@nvidia.com, joro@8bytes.org,
        will@kernel.org, robin.murphy@arm.com, pjw@kernel.org,
        palmer@dabbelt.com, anup@brainfault.org, tglx@kernel.org,
        kevin.tian@intel.com, fangyu.yu@linux.alibaba.com
Subject: [PATCH v4 00/21] iommu/riscv: Enable MSI remapping, IOMMU_DMA and VFIO
Date: Thu, 20 Aug 2026 23:41:29 +0200
Message-ID: <20260820214150.545737-1-andrew.jones@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Authority-Analysis: v=2.4 cv=OqZ/DS/t c=1 sm=1 tr=0 ts=6a8774a2 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=CzrpMg+lqiTzknPDBj2tlw==:17
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=CRasP5_FkgFBEu7lvvUA:9 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODIwMDE2MiBTYWx0ZWRfXz1fbF+Jcmc2S
 VXCQgoe9cKnsECpLvhsBJJJdhAXU8OXzBDXeydlFbqxyd3q1BTW3pKlXBzbprxAbqfCHIOiH2JJ
 hKqreq3Iqy0rnhdyGcJlS8MlEN04pY47UDuLx5JDXnY0Zlssq7WaU0uvQNLczqsVgLvO0mvJB8c
 iXqpIuYjBQ9yRzNF4V/Y4l0Eueb2zc9ezKPXXx8apheiqk8WMY9hXVChiVsXZ8tRz67XWctidLg
 6ac0vZVaCS2lR1s3we4Q5Dlz5XXxgFLudN5UNr18odgW3cv5lT7EJ9b6LcNcLe99/7qp8S/kKsh
 bJKvYFgVc9+slnuZ9G1RsrdN6PczTyVN0TdQ60tkjstv3iD+w9WPGxVNIyeyNpBan9GtJ7+N21F
 5h1GYlv8FYotiYbFe264igVHynJVQ0GUCgM8rGjbydQswbQyqm9jkOeqdW4EmPpqNwYKKHiS0k1
 NV8si390o3V12zN+lWQ==
X-Proofpoint-ORIG-GUID: 3jR4IV_j9j448oCnw6V0Q47LeqCi3hV5
X-Proofpoint-GUID: 3jR4IV_j9j448oCnw6V0Q47LeqCi3hV5
X-Proofpoint-Spam-Info: AW1haW4tMjYwODIwMDE2MiBTYWx0ZWRfXxR2Ter7cGF37
 f6t7XdJvo39mMEHNkRNFupIxdN8Ptf5dXH1ghb895p/WkMxLhr8ZpgPGuyPilo3aJN6KUBWBNKD
 ENlq97h+9MBlfN0KhtDkM8tJEt3lj+Y=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-20_02,2026-08-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0 malwarescore=0 clxscore=1015 adultscore=0
 bulkscore=0 suspectscore=0 lowpriorityscore=0 priorityscore=1501
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608200162
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260820_144157_045073_8B1FE28D 
X-CRM114-Status: GOOD (  20.76  )
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
proposal for v2 was to follow ARM's approach. This series does that at a
high level by introducing an IOMMU IRQ domain, mapping MSI targets into
the device's DMA address space, and rewriting composed messages with
msi_msg_set_addr(). A new iommu_dma_map_msi() supports both DMA-IOMMU and
iommufd domains and returns each mapping to the interrupt-remapping
driver rather than caching it on an MSI descriptor.

ARM can map a fixed doorbell PA per ITS and cache its IOVA on the
descriptor because affinity changes only hardware routing, not the
composed address. An IMSIC target PA changes with affinity, and MSI
composition may run in atomic context, so mapping the selected target on
demand is not an option. This series pre-maps the supervisor IMSIC page
for every possible CPU into a domain-local PA-to-IOVA table when remapped
IRQs are first allocated, allowing composition to select the target with
an O(1) lookup. If iommufd replaces a paging domain while IRQs remain
allocated, the incoming domain's table is rebuilt before it is attached.

The series also carries the remaining plumbing needed for RISC-V PCIe
device assignment through VFIO/KVM: the RISC-V IOMMU reports DMA
cache-coherency capability for coherent devices, VFIO type1 and KVM_VFIO
are enabled for RISC-V, defconfig enables IOMMUFD/VFIO as modules with
cdev support, and the generic VFIO/iommufd selftests can be built for
RISC-V. The RISC-V IOMMU specification does not provide MSI data
validation, so the interrupt-remapping domain cannot provide isolated
MSI. VFIO device assignment therefore requires the applicable
allow_unsafe_interrupts=1 module parameter. Direct MSI routing to guest
interrupt files (irqbypass) is not yet supported by this series and will
be posted separately on top.

LLM-based coding assistants were used during development for code
exploration ("super grep" as one of my colleagues calls it), patch review,
test execution, and drafting and editing commit messages and this cover
letter. I reviewed and finalized all resulting code and text. Per-patch
Assisted-by tags are omitted in light of the ongoing discussion about
simplifying coding-assistant attribution[2].

Thanks,
drew

[1] https://lore.kernel.org/all/20260508212339.381933-1-andrew.jones@oss.qualcomm.com/
[2] https://lore.kernel.org/all/20260701-work-coding-assistants-v1-1-a20a94d1d606@kernel.org/

v4:
- Rebased onto linux-iommu/next
- Addressed Thomas's v3 review comments[3]
- Added documentation for mapping MSIs while replacing an IOMMU domain
- Reworked domain replacement to rebuild MSI IOVAs through each domain's
  backend rather than copying iommufd tables
- Rejected passthrough MSI mapping results when preparing an incoming
  paging domain, preventing a first iommufd attach with live MSIs from
  caching an unusable address-zero table [PatchWise]
- Deferred interrupt-remapping domain publication until probe_finalize(),
  after the IOMMU core assigns the device group [PatchWise]
- Refreshed stale OF and ACPI platform MSI domains before setting up
  interrupt remapping [PatchWise]
- Used vcalloc() for the sparse IMSIC PA-to-IOVA table [Sashiko]
- Reported IOMMU_CAP_CACHE_COHERENCY only for DMA-coherent devices [Sashiko]
- Clarified that only direct identity <-> paging domain transitions are
  rejected while IRQs are allocated [Sashiko]
- Used the old-domain argument to avoid unnecessary RCU lookups in attach
  callbacks [Sashiko]
- Fixed the VFIO selftest architecture check to use riscv64 [Sashiko]
- Reworked commit messages throughout

[3] https://lore.kernel.org/all/20260807181713.228535-1-andrew.jones@oss.qualcomm.com/


Andrew Jones (18):
  iommufd: Convert struct iommufd_sw_msi_maps to a growable bitmap
  iommufd: Add iommufd_sw_map_msi()
  iommu/dma: Add iommu_dma_sw_map_msi()
  iommu/dma: Add iommu_dma_map_msi()
  iommu: Document MSI mapping during domain replacement
  genirq/msi: Provide DOMAIN_BUS_MSI_REMAP
  irqchip/riscv-imsic: Compose MSI updates through the hierarchy
  iommu/riscv: Add IRQ domain for interrupt remapping
  iommu/riscv: Refresh platform MSI domain before IR setup
  iommu/riscv: Prepare info->domain for concurrent RCU read access
  iommu/riscv: Reserve an MSI IOVA window for iommufd
  iommu/riscv: Pre-map IMSIC MSI targets
  iommu/riscv: Preserve MSI IOVA state across domain replacement
  iommu/riscv: Gate direct identity boundary switches with live MSIs
  iommu/riscv: Remap IMSIC targets during MSI composition
  iommu/riscv: Report cache coherency capability
  riscv: defconfig: Enable IOMMUFD and VFIO
  selftests/vfio: Allow building on RISC-V

Tomasz Jeznach (3):
  iommu/dma: Enable IOMMU_DMA for 64-bit RISC-V
  vfio: enable IOMMU_TYPE1 for RISC-V
  RISC-V: KVM: Enable KVM_VFIO interfaces on RISC-V arch

 arch/riscv/configs/defconfig               |   4 +
 arch/riscv/kvm/Kconfig                     |   1 +
 drivers/iommu/Kconfig                      |   2 +-
 drivers/iommu/dma-iommu.c                  |  33 +-
 drivers/iommu/dma-iommu.h                  |  12 +-
 drivers/iommu/iommu-priv.h                 |  11 +-
 drivers/iommu/iommu.c                      | 109 +++++-
 drivers/iommu/iommufd/device.c             |   3 +-
 drivers/iommu/iommufd/driver.c             |  87 +++--
 drivers/iommu/iommufd/hw_pagetable.c       |   1 +
 drivers/iommu/iommufd/iommufd_private.h    |  41 ++-
 drivers/iommu/riscv/Kconfig                |   1 +
 drivers/iommu/riscv/Makefile               |   2 +-
 drivers/iommu/riscv/iommu-ir.c             | 397 +++++++++++++++++++++
 drivers/iommu/riscv/iommu.c                | 111 ++++--
 drivers/iommu/riscv/iommu.h                |  48 +++
 drivers/irqchip/irq-msi-lib.c              |   8 +-
 drivers/irqchip/irq-riscv-imsic-platform.c |  27 +-
 drivers/vfio/Kconfig                       |   2 +-
 include/linux/iommu.h                      |  31 ++
 include/linux/irqchip/riscv-imsic.h        |   7 +
 include/linux/irqdomain_defs.h             |   1 +
 tools/testing/selftests/vfio/Makefile      |   2 +-
 23 files changed, 819 insertions(+), 122 deletions(-)
 create mode 100644 drivers/iommu/riscv/iommu-ir.c

-- 
2.43.0

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
