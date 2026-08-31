Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FD7EC624A4
	for <linux-riscv@archiver.kernel.org>; Mon, 31 Aug 2026 15:00:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=TxHNCgoWO22/VxvXr9XInrjBabuSpvOfKeb4JURAsM0=; b=f4D/SzV8cTVcGc
	xREjLq7Zb1ERNn0iVf3BnUr8FZxwlm3hhMpqo/AcA0FU+bYVDqHlKoP/wuoRwW2KRr8TpFEbzVDtW
	XoDvuNex5qM6Ct7m85oTIs1sfiM0IflaL/Jwq6QoSYzytSg+PQaqOucWeaIetersuTQimeI+9K26k
	8F49OhqKwnNRW6wfu0mhJdj4d914MjiP/yvw8v0qUqcSNEo77HcmMJZLk3N6ibIaE9212YheVg+gs
	Ya8pT7Vrwu77LO071Zq9D8Ux9YDs/iJSyaDkU9arF3pF4YW/qlXJWDmPjJHhXBnEy3G7FHKFjjCmg
	7iBalKhqMzGHWd9XmRhg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x13UD-00000009kOR-3cxk;
	Mon, 31 Aug 2026 14:59:49 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x13UB-00000009kNZ-47dF
	for linux-riscv@lists.infradead.org;
	Mon, 31 Aug 2026 14:59:49 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67VETWjd3807963
	for <linux-riscv@lists.infradead.org>; Mon, 31 Aug 2026 14:59:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=Tkl8tnadHtPrcVG8m6n51ANnk/CuKRldgYo
	l5hl0s1Q=; b=Jx8EdU2C7BlzsajnXjzQUJ/T1Xbm8yScJHCgWeXIewES/PdnzPO
	hKFw8xl1Lh3viBbGKgdOu0e/CzpW69VxkFAYpqFu/rbTYugJsHxRj4nppA9xnnUY
	yKdYwShoasTCaqEVt9h8BZHTDTeNDfQROwY+HYMbhh08PZqOzU1eb4EcbbKH6b57
	6LJ4oG44c+ZMyigAHvmJAfk8eJcJQ+uu1HoknJuYKuOv3+PyWPRszmiup1oeOCVW
	l3FzEsOtVZdxPuS494UOti7ObCnHEJspeBgiwOC0+OcCs2A/WZb2DwHCkJWlCVQF
	qTJx4N5XmgF6/9fDQ3LXMUoxKKqTyUTPVDA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gcv7wbahe-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Mon, 31 Aug 2026 14:59:46 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-92ec3146553so863872985a.1
        for <linux-riscv@lists.infradead.org>; Mon, 31 Aug 2026 07:59:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788188386; x=1788793186; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Tkl8tnadHtPrcVG8m6n51ANnk/CuKRldgYol5hl0s1Q=;
        b=hr1zWFomKWv9WJwi5NeOvcibgAAtxKFDrBGdBgcEX4lLfKhVk3dv0WxCAvKPRpRbTH
         c79QM07piOCzMFzFmxifMIrQ9ghkNsWzEredxoT9zoRmURtpQ5VayNKJNf/y3N/Cymjy
         vk4DihvT6uk8b0wCVds5bUOt2/dXp/44Rf41AWyGNGsmqfov0FjPAZBMGVoQnmXIaHr3
         czg0A+kQbjtPAGcyOCimq3RtsElAhdnGPjIXeERTYw9k7ZDWL/Hz8tEI3rN8+6I9oQKW
         kqpROtZzQLk21yvwELTRGA/K6+geQrEZ3ukevZRR7+AZ5K41J6M7OilFYsppc6hCoLyR
         kynQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788188386; x=1788793186;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Tkl8tnadHtPrcVG8m6n51ANnk/CuKRldgYol5hl0s1Q=;
        b=T1bw3HoM1x9lvycrnVFZpeK2fePcOKFHS9bw/Umd77HKmplbM51jicU75nhaQtUtLU
         88qJdHzITOLPRB2YQWi7+lbmthu1lsYevszwhOk1L+KrlMrj5FpcmUIzaEUClDvFJ+51
         AqOrAbzZYY87Gr9YEetFZbAqLN1NYN+sREHYJq6CQAstJsy2CNFQ3+eh95JuiboQp8C2
         bg1iWMUBnIOCnyvc6PgsaF+0oWTq6OOEUiS/EAkl97SRKIUObrwWSamP+VicCHUuJPL6
         ap+1KmnIg+TND7XJgVCGWYWmPyASfg7ZtqUZKQZNe0f3RJSFsRfRrHmD7NeMtEoGAPwR
         jC7g==
X-Gm-Message-State: AFuF++n8ot7pnMhQXk2bb7jszCExG9iHJRZmR4VT4XuNk5VrYYHCLNSA
	29UWecDqgZ1SM1gskTfPhWSghFUF1BPAIafCbE/50hQLYC5Pd8oivwZb/f9i4hY2zHslAWP0R+F
	yxVFpTfVAEfwq29BfvZ3pjD3gddHHDzGVq0PcmSk/zH5hwpY6aGiXcyo0WFLSdipAU12slDjo/u
	B31mg=
X-Gm-Gg: AR+sD1136KhEvkf6rYKTaHL0hWjjlfCHRqsfKE782vLrkQj4Dg+P/Flw20gCs9XKx0H
	cij6cP82dqT4M/tAFJ5xc+m86UOSAWahevo2YhDTVjT9pHdPNKdfW8Em0+cqYAtSz7SJq+jRV3V
	zjnVUjM6aH4v5Eqxjm4V/+UNfj9ppze2W3Iy6nQWFs9x5I2rBN7ElP2p6uu4LyDKhEGc0xNoZJD
	sPuzcyRDuit6+jmZa22W05KnscAl6tohR+nSJBsEAjNk4p/6wEwSog45opLJkDLYINt6Mu9s5UQ
	K9QC2++I3gIXfwQWmUGRPMgKzATZ6OtMRukzWKxjyDRdc2K0Q+a5/uwsyL+qH+BLXoNX2TZ3aCH
	LDnMjYMajAb1GisprI+S3dRCfzGcfH6fQUk0=
X-Received: by 2002:a05:620a:11ae:b0:930:f723:35f5 with SMTP id af79cd13be357-939138ffc48mr2409148585a.20.1788188385872;
        Mon, 31 Aug 2026 07:59:45 -0700 (PDT)
X-Received: by 2002:a05:620a:11ae:b0:930:f723:35f5 with SMTP id af79cd13be357-939138ffc48mr2409142785a.20.1788188385383;
        Mon, 31 Aug 2026 07:59:45 -0700 (PDT)
Received: from localhost (ip-86-49-251-7.bb.vodafone.cz. [86.49.251.7])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48440e08b43sm1608652f8f.22.2026.08.31.07.59.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 07:59:44 -0700 (PDT)
From: Andrew Jones <andrew.jones@oss.qualcomm.com>
To: linux-riscv@lists.infradead.org, iommu@lists.linux.dev
Cc: linux-kernel@vger.kernel.org, tomasz.jeznach@linux.dev,
        tjeznach@rivosinc.com, jgg@ziepe.ca, jgg@nvidia.com, joro@8bytes.org,
        will@kernel.org, robin.murphy@arm.com, pjw@kernel.org,
        palmer@dabbelt.com, anup@brainfault.org, tglx@kernel.org,
        kevin.tian@intel.com, fangyu.yu@linux.alibaba.com
Subject: [PATCH v5 00/17] iommu/riscv: Enable MSI remapping, IOMMU_DMA and VFIO
Date: Mon, 31 Aug 2026 16:59:26 +0200
Message-ID: <20260831145943.313726-1-andrew.jones@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Authority-Analysis: v=2.4 cv=E9f9Y6dl c=1 sm=1 tr=0 ts=6a9596e2 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=on9AXyaqQ0RhfYpiXjjEXA==:17
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=ZZtlPswqtT560II7qJwA:9 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODMxMDEyOSBTYWx0ZWRfX9mniiqQkqXf6
 yNy25rHAhR1cQ/vdpAzfzV8pAPpGm7nn2qIVy4sHR0AhVVUIzKaoy5hXKlxrEuPup6VGtMjoBWM
 fIVw3Ber+HDvo4Bzy02eUR3zVYAROjk=
X-Proofpoint-ORIG-GUID: dPGJ_TQdZ9j1HsDpJsbjsatWaFdBx3wb
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODMxMDEyOSBTYWx0ZWRfX0btsrhYHOMZw
 DvNNZfP8xf8YBXKqaHaUUp9aYU7sqsD6RN2LFiuhezqzbgEAKViUy9CdgkfWZ6GbZAZHMt41E0s
 2KQ0pUZG2uLziLHARI92A8HYA8PxsFlRvC4KtpwJx9esdABo4fYHLZvFrmiS3nCZBXbTnx+o9Lt
 RmFxtdAHXwpgL6v/R5/aOlgo1PhwKVNtBfKISg0b2sxL9KNM90rl/31f9JI5b+Gjfj8zOjmGEOe
 /cPOzJOt/WZbZNPdA3LNpVA0BGLd3p12RB920bhB1DWY/gdEaAkSCKtotOUT/2fs0gRGDkKwma+
 HZ/hTyb3afJ//qnGG2cLU0WYPnJ9I8T6qXJ6A3PmBHLsJomVD+RVcQme3Q+3VMhlrDKBnhS5Rz3
 1QonA0aHJ43aSurq2P5qcnpzk+9iPPFx7eo/PpxatEjkcBzF/WKn+5/Q6bwPE/9ijpgGtFlBP81
 kle1Nk6+vac5U9lDSAg==
X-Proofpoint-GUID: dPGJ_TQdZ9j1HsDpJsbjsatWaFdBx3wb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-31_05,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 bulkscore=0 spamscore=0 phishscore=0
 lowpriorityscore=0 adultscore=0 impostorscore=0 priorityscore=1501
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608310129
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260831_075948_138739_7E0F6E02 
X-CRM114-Status: GOOD (  18.79  )
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
map IMSIC pages, but that was rejected as only a workaround. v2 through
v4[2] instead introduced a RISC-V IOMMU IRQ domain which pre-mapped every
possible IMSIC target and maintained a domain-local PA-to-IOVA table. The
v4 discussion with Jason identified a simpler way to handle the RISC-V
requirement that the MSI target address changes with interrupt affinity:
extend the existing iommu_dma_prepare_msi() model to prepare an ordered
list of MSI targets as one contiguous IOVA range. v5 is a complete redesign
around that approach.

The IMSIC driver now builds an array containing the supervisor IMSIC page
for every possible CPU, indexed by logical CPU number. When allocating an
IRQ, it passes the complete array to iommu_dma_prepare_msi_list(). The new
API maps the ordered physical address list into one contiguous IOVA range
through either DMA-IOMMU or iommufd, then caches the base IOVA and mapping
granule in the MSI descriptor. MSI composition can therefore select the
target for the current CPU with simple arithmetic, including during an
affinity change, without allocating memory or consulting IOMMU-owned state
in atomic context.

DMA-IOMMU extends its existing per-page MSI cache to recognize and reuse
complete ranges. iommufd grows its software-MSI bitmap on demand, bounds
allocations to the reserved MSI window, and prepares, installs, rolls back,
and replays a range as one unit. This keeps the descriptor's contiguous
IOVA valid across iommufd paging-domain replacement without exposing a
partially installed range.

Unlike v4, v5 has no RISC-V IOMMU IRQ domain, no domain-local IMSIC mapping
table, and no IOMMU lookup during MSI composition. The IMSIC IRQ domain
owns the target list and message composition, while the IOMMU layers only
provide the mappings. Devices which do not need IOMMU MSI translation keep
using physical MSI addresses through the same IMSIC path.

The series also carries the remaining plumbing needed for RISC-V PCIe
device assignment through VFIO/KVM: the RISC-V IOMMU reports DMA
cache-coherency capability for coherent devices, VFIO type1 and KVM_VFIO
are enabled for RISC-V, defconfig enables IOMMUFD/VFIO as modules with cdev
support, and the generic VFIO/iommufd selftests can be built for RISC-V.
The RISC-V IOMMU specification does not provide MSI data validation, so
VFIO device assignment requires the applicable allow_unsafe_interrupts=1
module parameter. Direct MSI routing to guest interrupt files (irqbypass)
is not yet supported by this series and will be posted separately on top.

LLM-based coding assistants were used during development for code
exploration, patch review, test execution, and drafting and editing
commit messages and this cover letter. I reviewed and finalized all
resulting code and text. Per-patch Assisted-by tags are omitted in
light of ongoing discussions about simplifying coding-assistant
attribution.

Thanks,
drew

[1] https://lore.kernel.org/all/20260508212339.381933-1-andrew.jones@oss.qualcomm.com/
[2] https://lore.kernel.org/all/20260820214150.545737-1-andrew.jones@oss.qualcomm.com/

v5:
- Completely redesigned MSI remapping based on the v4 discussion[2]
- Replaced per-target mapping with iommu_dma_prepare_msi_list(), which maps
  an ordered physical address list into one contiguous IOVA range
- Reworked DMA-IOMMU and iommufd software MSI mappings to allocate, cache,
  install, roll back, and replay complete ranges
- Moved host MSI remapping into the IMSIC IRQ domain and removed the RISC-V
  IOMMU IRQ domain and domain-local PA-to-IOVA table
- Made the IMSIC driver publish a logical-CPU-indexed S-mode address list
  and derive each composed target from the descriptor's cached IOVA base
- Fixed the VFIO selftest architecture check to accept both riscv and
  riscv64

Andrew Jones (14):
  iommu/dma: Prepare MSI physical address lists
  iommufd: Convert struct iommufd_sw_msi_maps to a growable bitmap
  iommufd: Split software MSI map lookup and allocation
  iommufd: Bound software MSI mappings to the reserved range
  iommufd: Prepare software MSI maps for address lists
  iommufd: Install software MSI map ranges atomically
  iommufd: Prepare software MSI installation for address lists
  iommu/dma: Introduce iommu_dma_prepare_msi_list()
  iommu/riscv: Report cache coherency capability
  iommu/riscv: Reserve an MSI IOVA window for iommufd
  irqchip/riscv-imsic: Add S-mode MSI address list
  irqchip/riscv-imsic: Support IOMMU MSI address lists
  riscv: defconfig: Enable IOMMUFD and VFIO
  selftests/vfio: Allow building on RISC-V

Tomasz Jeznach (3):
  iommu/dma: Enable IOMMU_DMA for 64-bit RISC-V
  vfio: enable IOMMU_TYPE1 for RISC-V
  RISC-V: KVM: Enable KVM_VFIO interfaces on RISC-V arch

 arch/riscv/configs/defconfig               |   4 +
 arch/riscv/kvm/Kconfig                     |   1 +
 drivers/iommu/Kconfig                      |   2 +-
 drivers/iommu/dma-iommu.c                  | 117 ++++++--
 drivers/iommu/dma-iommu.h                  |  13 +-
 drivers/iommu/iommu-priv.h                 |   7 +-
 drivers/iommu/iommu.c                      | 109 +++++--
 drivers/iommu/iommufd/device.c             |  20 +-
 drivers/iommu/iommufd/driver.c             | 315 +++++++++++++++++----
 drivers/iommu/iommufd/hw_pagetable.c       |   1 +
 drivers/iommu/iommufd/io_pagetable.c       |   9 +-
 drivers/iommu/iommufd/iommufd_private.h    |  51 +++-
 drivers/iommu/riscv/iommu.c                |  32 +++
 drivers/iommu/riscv/iommu.h                |   4 +
 drivers/irqchip/Kconfig                    |   1 +
 drivers/irqchip/irq-riscv-imsic-platform.c |  25 +-
 drivers/irqchip/irq-riscv-imsic-state.c    |  54 ++++
 drivers/irqchip/irq-riscv-imsic-state.h    |   1 +
 drivers/vfio/Kconfig                       |   2 +-
 include/linux/iommu.h                      |   8 +
 include/linux/irqchip/riscv-imsic.h        |   6 +
 tools/testing/selftests/vfio/Makefile      |   2 +-
 22 files changed, 657 insertions(+), 127 deletions(-)

-- 
2.43.0

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
