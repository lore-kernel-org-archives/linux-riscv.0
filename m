Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18B06CA5FA5
	for <linux-riscv@archiver.kernel.org>; Mon, 28 Sep 2026 14:31:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Y5v79WAVzYBK45hW/zOiglO2tgbCmxSnTFxatq5Ov5U=; b=aCGxiPOg4yoese
	JEEs8fnbHhipmCQCYp4vI2otZFtP+RsJQXQeqBYQyTO8+Ul1K/IXk3wjvffDyw24JFqGUaSI4/cq0
	zR+UYFp1qK5c9IQ8rvDnTeGQ8ZUEF/8nnFlJzPBIZpO+boloClsFmPKtjVlSKyyctlpUD+jQjQrNP
	M08ktywDreAYc9mhVTOxQHocv5eVgUlyLjuQajN+eoPWKCryUyYM8cC7cYNjyhWxC2dkOy1sN5c8A
	DeebvrjlC5jAaajJFlIzNS47aY0lJSE6+i7LzkydXZaQft1am/1rIFoXXMFaSS+iN5qOoKM+qN2zU
	GRh2R39ZT29Gk3DQn0uw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBCON-00000000lNO-1atV;
	Mon, 28 Sep 2026 14:31:43 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBCOK-00000000lLg-06jS
	for linux-riscv@lists.infradead.org;
	Mon, 28 Sep 2026 14:31:41 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68SBAOUA782748
	for <linux-riscv@lists.infradead.org>; Mon, 28 Sep 2026 14:31:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=z60xJj9fp2vRAD3QTBKkgHGd6KjBHDRVy/O
	SLFJMMjU=; b=WEJVLUt6Qgndx5YiL7HpWyG8kpXQW6l5olRaMN4FmaJtiSAMI7T
	3yv/pOhRBpkLZyiKRu0CfqCIbDxYg1vdaHIBC73J9OOf/tSqGMkuhLADt8b5ShH5
	BBBWHHl4A3D2+X1ObB3j0llCuQrJgtg29SJEBbeGast4A4kD2OXm+BAihAAGIShA
	BgZ0QlwUae0plvs6QYFxdtCn8m2+kcG9SqUn7P3XW5f+co5y7bdt6hJLhfJIzh9X
	c4ISX9iTXWVvLjlGbhpAY9jv8e/3I4XsnmtFwE/KWcOm9EtiAQ4z5l6gsYcoSSMt
	F177KeS7x4cTW3Fi7Mbg/muDcB24nsKEd8A==
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com [209.85.221.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gyav4axtj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Mon, 28 Sep 2026 14:31:39 +0000 (GMT)
Received: by mail-vk1-f197.google.com with SMTP id 71dfb90a1353d-5cd17531bceso411052e0c.2
        for <linux-riscv@lists.infradead.org>; Mon, 28 Sep 2026 07:31:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790605898; x=1791210698; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=z60xJj9fp2vRAD3QTBKkgHGd6KjBHDRVy/OSLFJMMjU=;
        b=FB/ICrHUUWej5mZxu7mJ/BdQpYmFh1YxSlUiirssRgnEapVfC+5SU5lIIMceop0XDW
         75K6jZjuw0kgMgT3mBWobQL+DiS5OzpG51nuFLLHxsOqHOhjIC33UBBbfXVeSZk/hjDY
         n0ig5jh4p3EOqOnhFF34rXfQ1QQMBn9pJaUzyuDxVRTqnwrnpOZwvxpUGuqTUcOFKXX8
         EfT/CfBxNnLqGgt9wYWFuAPDpUOdHXDNTfHUUPaV9K8eV+okQ7m+lyPzzPfOk7+Ht0sE
         IWImATOsbsXWEOzd5beayfp6dfHo6nIbbNx922ile4SkK/Rc+DE4HCEKMtAVnoaKD0lp
         FegA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790605898; x=1791210698;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=z60xJj9fp2vRAD3QTBKkgHGd6KjBHDRVy/OSLFJMMjU=;
        b=XLt2eo3TNJBXOM3B4m9AUIqfFnIq80huWckI2OTAqAfG5JvwT5LCILYW03UuF94K4j
         IliYfUcILz3OtWZsCFoZR32K6yGn+1Vo5nFXIDiFxudwIA0NPip6umYCUCOeV4LHaNkU
         y+E03+ZaI04aHkfPAoItt8qWGDwEgRJCzuSiG7plXaVG0h89gTWhbpK+jAKmar4QQV+O
         lWJdcnz4+HkFQcWS56pFPXW220qwxhlQ79lKW4zrkbGc23OOHs9JFUaxeQF/wxL1+4Ch
         sAaVS1+c2I6bBjk1yckxCqgXHQIL8OFnJwx1H36gS7D3FX0yyvglabbH5LaNzXtajIpf
         5Wxw==
X-Forwarded-Encrypted: i=1; AKwUvBxzDDj8DnAEiujS+s2wFK42PpU7emcJrJ/yMUhWhTzhUwyUZMXsibFEO0+Ud+LABdQLLZ2kMP0baW8Jdw==@lists.infradead.org
X-Gm-Message-State: AFq9FYJv5ENatjgXt/cDAHbIbZEzuO9PHpJ7OFTmZLhaWdYZjsp2B+P7
	Emm3zraC2Azw4kAxtuHRz3IqgmEP29llGow5ns6vn7p9RyUACfYTk1mTZNnhXQU/WWFSTQhG0FG
	FIX8i0F3FME/oNf6acaR7Mb3nKVdmnsG1bThzn3mAE0ExauKFqfVkXsNPSARQ3W1AsoCAd6U=
X-Gm-Gg: AYBFou1+7SkaL91q0kobEALW4KXZNkdksTtUMz2ytOC1+3fN3nSWNSz761A4vjps/sT
	Ng6o/kGVz7QTWtaZa2Hpou4e3Q5GWnLvY/+y6WbJzm3P3C+Af8qxWeaNrJbGTGl09QMXKc0x4TU
	o6dkY/XrteOgZUzd6Yl9asI9f3uKWTln4uFPnSGnVHMB1Q0GeRlBuyalKpnP//VXc0XX6X85nO0
	5AwMua2W5To01O3jkEKzzyXkV3UWO7yvF9qjwJXN3sVIj3F1/vOWBg2oid5N3aFXcSRW/embAsL
	rcKWZCdUr/kH4XPIDl0NdDZx3K146HauBbvn2yer0V4G2hoEECB+1wY3hpJV/OQOGKA8I+m9ab8
	TqoP2nxGfeU9vBY/OSX15qHQ5TtMCxM7GAJq5Hw==
X-Received: by 2002:a05:6102:c03:b0:7a7:196a:84e6 with SMTP id ada2fe7eead31-7b390445334mr1520149137.30.1790605897865;
        Mon, 28 Sep 2026 07:31:37 -0700 (PDT)
X-Received: by 2002:a05:6102:c03:b0:7a7:196a:84e6 with SMTP id ada2fe7eead31-7b390445334mr1519697137.30.1790605875667;
        Mon, 28 Sep 2026 07:31:15 -0700 (PDT)
Received: from localhost (ip-86-49-245-11.bb.vodafone.cz. [86.49.245.11])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2dbd3bcadbsm292389266b.72.2026.09.28.07.31.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 07:31:14 -0700 (PDT)
From: Andrew Jones <andrew.jones@oss.qualcomm.com>
To: iommu@lists.linux.dev, kvm-riscv@lists.infradead.org, kvm@vger.kernel.org,
        linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: tomasz.jeznach@linux.dev, jgg@ziepe.ca, jgg@nvidia.com, joro@8bytes.org,
        will@kernel.org, robin.murphy@arm.com, pjw@kernel.org,
        palmer@dabbelt.com, tglx@kernel.org, anup@brainfault.org,
        atish.patra@linux.dev, fangyu.yu@linux.alibaba.com,
        zhangzhanpeng.jasper@bytedance.com, zong.li@sifive.com
Subject: [RFC PATCH v3 00/14] iommu/riscv: Add irqbypass support
Date: Mon, 28 Sep 2026 16:30:59 +0200
Message-ID: <20260928143113.49838-1-andrew.jones@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Proofpoint-GUID: WbgK0uA3uwn0dL0cdrvH9OGOSlItnrph
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI4MDA1NyBTYWx0ZWRfX5ufRw/TDEC2F
 X/njNcsD7TzkNTjmDD1wO4XhSRh9BetxbrbRT5rEL7KcHhcUFQfWgqDolO/h5BDu8C1kHHjFeoF
 IN1rG0mmRGH/vEhvSeHBZN0JbgGTKSzvN9IcpiouC7FFA2qAzLZ1NFYvV0UWuuUiy09kEtFKFvC
 yCdp68Qh3g+5QXDRo1qCyuYZvYKSChE81p1b8uThVah8c2BQ0JrVHa3Pm2T/ckrhR5DR5F6mWrt
 DZNyPd6OVb3EnBlhP3Sw+nXuTz1Osa8Koh6xqOCh54Sr0b2Jw8gP5b3nUwJ/5yv1InQOEDdXe1X
 u1eM5WUvXzNGIm5gvjckKnv4ap1XZYXXF1htUyi3K8a6asxgr/ktb1YAeOzayLCR6kN1G2yrWDK
 FVpEQUe3HWNRyhhgI2dcAHZRPo4Vbxl3UomfNe8NsxJA9vdayqEmDqy4t6kNSm+xqRiJS7JQ907
 +tDhIvnGooLA1frX5GA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI4MDA1NyBTYWx0ZWRfX98EPOqRYU9eV
 uxWwJr3kvLlIMg8uBqonTa1+SoKffnY/lb7BU7wsz6IFXuKeSBYA5Gmhau6xqSSm3JX4YpmFj7U
 VEl7aD1GdZYgNeRdipzRTMzAJ82JlaQ=
X-Proofpoint-ORIG-GUID: WbgK0uA3uwn0dL0cdrvH9OGOSlItnrph
X-Authority-Analysis: v=2.4 cv=MqLHeGae c=1 sm=1 tr=0 ts=6aba7a4b cx=c_pps
 a=JIY1xp/sjQ9K5JH4t62bdg==:117 a=4CXLxsOAgPM/krjtHEZQyA==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=NEAV23lmAAAA:8
 a=VwQbUJbxAAAA:8 a=bDdBU3oEAAAA:8 a=EUspDBNiAAAA:8 a=SRrdq9N9AAAA:8
 a=JbFp9CTg7fNynJPQWhgA:9 a=tNoRWFLymzeba-QzToBc:22 a=DN7SgORnOiO7RqxRx1GC:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-28_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 suspectscore=0 impostorscore=0 phishscore=0
 adultscore=0 clxscore=1015 priorityscore=1501 spamscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609280057
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260928_073140_135328_A12C6CE1 
X-CRM114-Status: GOOD (  20.05  )
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

This series adds the RISC-V IOMMU side of IRQ bypass, allowing MSIs from
assigned devices to be delivered directly to guest IMSIC interrupt files.
It uses the IOMMU's flat MSI page table to translate guest IMSIC addresses
to their host backing, with support for both hardware guest interrupt
files (VS-files) and memory-resident interrupt files (MRIFs).

It has been a year since v2[1], and much of the design and implementation
has changed. Host MSI remapping, IOMMU_DMA, and VFIO enablement have been
split into a prerequisite series[3]. This posting contains only the
IOMMU/IRQ-side support. The KVM patches will be posted separately: they
are currently a minimal client for testing this interface, with further
work needed for general device assignment.

The design evolved while considering two-stage guests in the discussions
with Jason on v4 of the host MSI-remapping series[2]. With a guest vIOMMU,
the address in the device's MSI message may be any guest IOVA which the
guest's first-stage page tables map to a guest IMSIC GPA. The hypervisor
cannot determine the target vCPU simply by decoding that IOVA. Instead,
the intended hardware path is:

  Guest MSI IOVA -> S1 -> guest IMSIC GPA -> MSI table -> VS-file or MRIF

An MSI-table match completes the translation; addresses outside the MSI
pattern use the ordinary second-stage page tables. With S1 Bare, the
device uses the guest IMSIC GPA directly. Populating the MSI table with
all guest IMSIC targets allows guest changes to S1 mappings or interrupt
affinity without corresponding MSI-table updates. When a vCPU's host
backing changes, the hypervisor updates the entry for that guest IMSIC
GPA, leaving the device message and guest S1 mapping unchanged.

The MSI table belongs to the second-stage IOMMU domain and is shared by
all devices attached to it. RISC-V requires second-stage translation to
be enabled when using the MSI table. This is separate from host MSI
remapping, which uses ordinary page-table mappings prepared by the common
DMA-IOMMU/iommufd code and composed by the IMSIC driver.

A per-IOMMU interrupt-remapping irqdomain, installed as the MSI parent of
eligible devices at probe time, provides the irq_set_vcpu_affinity()
entry point. The IRQ hierarchy remains stable across IOMMU domain changes.
The callback obtains the device from the MSI descriptor and operates on
its currently attached second-stage domain. The irqdomain has no private
per-IRQ mapping state or MSI table of its own.

The affinity protocol supplies an owner, the guest IMSIC address pattern
and mask, and the complete set of guest targets. The first forwarded IRQ
populates the table and installs its configuration in every attached
device context. Further IRQs share that table after checking the owner
and address layout. A separate target-update command changes a guest
IMSIC's backing without changing per-IRQ forwarding state. The last IRQ
to stop forwarding removes the table configuration from the devices.

The main changes since v2 are therefore:

- Separate host MSI remapping from guest IRQ bypass, and use second-stage
  domains for the guest MSI tables
- Replace per-IRQ MSI-entry mapping and reference counting with complete
  guest-topology setup, domain-wide table lifetime, and individual target
  updates. This is intended to accommodate guest-controlled S1 mappings.
- Add IOMMU-side MRIF support alongside hardware guest interrupt files.
- Move the KVM client out of this series

This remains an RFC, particularly for the relationship between the IRQ
hierarchy and the domain-owned MSI table. Jason raised the alternative of
a per-VM irqdomain owning the table[2]; the arrangement proposed here
keeps the IRQ hierarchy stable and ties the mappings to the S2 domain
shared by the devices.

The dependency stack is based on linux-iommu/next at 634706fe6e36, with:

- "iommu/riscv: Enable MSI remapping, IOMMU_DMA and VFIO" v6[3].
- Fangyu's "iommu/riscv: Add hardware dirty tracking for second-stage
  domains" RFC v4[4], which also supplies second-stage domain allocation
  and page-table support.

The branch below contains all of the above, this series, and the minimal
KVM IRQ-bypass client:

  https://github.com/jones-drew/linux/commits/riscv/iommu-irqbypass-rfc-v3-kvm/

Testing requires userspace to select a second-stage domain, for example
by allocating an iommufd HWPT with IOMMU_HWPT_ALLOC_NEST_PARENT. The
corresponding kvmtool branch is available here:

  https://github.com/jones-drew/kvmtool/commits/iommufd-nested-rfc-v1/

LLM-based coding assistants were used during development for code
exploration, patch review, test execution, and drafting and editing
commit messages and this cover letter. I reviewed and finalized all
resulting code and text. Per-patch Assisted-by tags are omitted in
light of the ongoing discussion about simplifying coding-assistant
attribution.

Thanks,
drew

[1] https://lore.kernel.org/all/20250920203851.2205115-20-ajones@ventanamicro.com/
[2] https://lore.kernel.org/all/20260820214150.545737-3-andrew.jones@oss.qualcomm.com/
[3] https://lore.kernel.org/all/20260925151659.419512-1-andrew.jones@oss.qualcomm.com/
[4] https://lore.kernel.org/all/20260915032828.11250-1-fangyu.yu@linux.alibaba.com/

Andrew Jones (14):
  iommu/riscv: Allocate MSI tables for second-stage domains
  iommu/riscv: Prepare domain bonds for outer locking
  iommu/riscv: Serialize MSI table publication with domain attachment
  iommu/riscv: Reject live S2 replacement with forwarded IRQs
  iommu/riscv: Derive the IOMMU from the device in IODIR updates
  iommu/riscv: Cache the programmed device context
  iommu/riscv: Prepare MSI table updates for interrupt remapping
  irqchip/riscv-imsic: Define IOMMU IRQ bypass protocol
  genirq/msi: Provide DOMAIN_BUS_MSI_REMAP
  iommu/riscv: Add IRQ domain for interrupt remapping
  iommu/riscv: Prepare info->domain for concurrent RCU access
  iommu/riscv: Prepare interrupt remapping for IRQ bypass
  iommu/riscv: Validate IRQ forwarding requests
  iommu/riscv: Implement IRQ forwarding

 drivers/iommu/riscv/Makefile            |   1 +
 drivers/iommu/riscv/iommu-bits.h        |  27 ++
 drivers/iommu/riscv/iommu-ir.c          | 505 ++++++++++++++++++++++++
 drivers/iommu/riscv/iommu.c             | 352 +++++++++++++++--
 drivers/iommu/riscv/iommu.h             |  56 +++
 drivers/irqchip/irq-msi-lib.c           |   8 +-
 drivers/irqchip/irq-riscv-imsic-state.c |   6 +
 include/linux/irqchip/riscv-imsic.h     |  60 +++
 include/linux/irqdomain_defs.h          |   1 +
 9 files changed, 974 insertions(+), 42 deletions(-)
 create mode 100644 drivers/iommu/riscv/iommu-ir.c

-- 
2.43.0

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
