Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B604C2A09B
	for <linux-riscv@archiver.kernel.org>; Fri,  7 Aug 2026 18:17:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=IslRiSZeq8CQmxggLt5L8DftNMnl73Ux/0Y73fcVxW4=; b=Yu/HEJAnrrY7LQ
	qwNcScoo2aikUwBr9HyJcjZksPfrccDmm6hImZsvrCJNq6/077FJM3p893dcvXyG+cknkRHD7owYx
	yBzOCo3TkwBl/XEJCMF52lSg4uCZ/4rpBtZM4ocjzlrhYtMv9aMKjcHrSFUXAys/oQWzs+lCwQ0OW
	3Tqoc8vZSX2OPEibh7gUjG3yshXctKZL3Qtrh/3jqxMDsbMbjfSmLV4lwneNokudP4lPY325lx+bN
	0JI7EIHexYUK+52Na3B3DG3izdZz/AbvoSSj1sukTA1FHZp+PpwTdqOfAn0Gel0t2QppkzmiAvPv7
	qrXldYj0H+ueeuQic6zw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsP8E-00000008Z9a-48JU;
	Fri, 07 Aug 2026 18:17:22 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsP8C-00000008Z8p-0Fsb
	for linux-riscv@lists.infradead.org;
	Fri, 07 Aug 2026 18:17:21 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 677GOEg0769878
	for <linux-riscv@lists.infradead.org>; Fri, 7 Aug 2026 18:17:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=mTHaDqPuYE0hc87S0Qdk1xSBSfV/vLCUnN9
	+GLT39n0=; b=Ztn6r2+fHEdxxJidlueemU/H3tuB3y5qDexALM31F4qZRnFgReE
	wgIBRUhn17QkSRg2nf70wxMYFRH44a9OKnv40IgGPYRLgIu3LsHSjHVTzSaDwc9a
	IeincXYpq5hgP4NZAJpdgY2Sl4I3yI+5qqFVU1H+ktaiJB96GI1LwSnBZvCQ/Eva
	+WixgyVVLfTsUkNCy4tNbgHMbo+yB9+bMuXEnWrgWT+QvE0WPFJ8u2TkU6zjqbR+
	oP+LxE4PEWI6pSNzhDhQAH9Ravw2Zj6HvVl66W6t6E0qfH2/9J765E1GCa1bsJth
	oKtpicsSA1XtVxkEetwMAo3YepwSsYY/wFg==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fw9vu2uxw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Fri, 07 Aug 2026 18:17:17 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-51c0408254aso26166001cf.0
        for <linux-riscv@lists.infradead.org>; Fri, 07 Aug 2026 11:17:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786126636; x=1786731436; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=mTHaDqPuYE0hc87S0Qdk1xSBSfV/vLCUnN9+GLT39n0=;
        b=VKHSZUEMPFFgYIM23cGC2FV1xi/nBsdnlvsPh9aynHJMomGisMP1I7LfnzRALt/iW/
         kB/mpUBTu+0qIMv+Go4g5s9x9wegRdrBzuwOZ3nvsv4TgfVrW5MQNhcS7jlqkI0kqdMc
         QCSh3MlsdPaEUXWO1e6mu+ynEBOJxnWI11XPiWVVaDh4sjmXrR+S6k/+5uEBe2SFcQLD
         K6ZE507cPnQWkwZ9C3WV0oVF2kq1xzMmEmjLNGnOraD0U/KTh5jN8KSN6JoKRTqnQt4S
         TS86En4Et1hU+F7SvgGBMTnGIMeru7amoB559IpySeL3z6Zm0X9VLyYbysv2fV7yCptd
         RBrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786126636; x=1786731436;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mTHaDqPuYE0hc87S0Qdk1xSBSfV/vLCUnN9+GLT39n0=;
        b=Lt4gt33HcHNCDIP9FWdawm50G1AffNqW1JUGdhTYmtNYsoY+BHYa3GaDbgLWBhk/6Z
         xD2H0F9y2t5O6ghIOXSxk7qmkrsznRf4CJajvIzdFTzkeoOdd/SKfWqeGND0pBcS8RLE
         Kvqlx3+F4raNsgTuj3J50cVpT3iW9EnpEKoSeRWoNNdLLlNyomB8ko6lE+xkrrsWsrTZ
         7DHB7S3KTY+3NdU+WxjKstnYjL6h1NRzxI0vti1olqJhmBaR6SmtVwTvRRNi1vkUeBD2
         IOlSXP+EL/Pg8/gf38fzf7ilTlVaHljQmTciEmZNRzk8S0b1YdQ9yfXE7l3z80v1wl+5
         FdzA==
X-Gm-Message-State: AOJu0Yx8pECxvAVYGoCc8HcMkG4K+v1pNpBvS4Y5okD4OzSHz3nsAbvW
	gZdSdC2iAczVFi6wWeDGArGx9SNWj+U4QcdtXRh/T2E2bKjc/DLIr45ixCBvSvWINBnIHRlF7A2
	I28G1T9uhhScL3GXYHCngeYPlr7B8wG+pfKBMbs231ktcn9oPEtP7i8nPASim8g7lShN4JJhP9y
	OJwBM=
X-Gm-Gg: AR+sD112EnYg8PhcNUuzd92FFgATVNxb88cbAD8qF5yZg+gDY6AXWSlsER7Sz+zMjAj
	zAvq3/zh+9svRrUcNyT3SKtyyVxHVbGshPlEkaQ0hCJPkuCljIpXNOxLmrnRcleqVRmE+I7i+lz
	fKr0UJttZaclyAqpJhW6Tqi+e2zY4MGO6zu6Plp8xSrBiOuXUWoVmFUppdOcNwCktNDyQEEtXQm
	Ublv4LE16x99J5HWpgsoxTF+9OFsiHho/NHH1nKq+2M2tkLoEWA7uSn6MZ53EqXel4UjFAVQyp7
	VAKvTJCUBSvGXssMysmshiga8/4UQ63UY94D1n48SKhRAUPqb+Pa7Ysb18z9UcYeUnNlaQ7826/
	8CCeHjzA3CWZtlhRN+2nSOcjtb3y1j16XcSqiVRc=
X-Received: by 2002:ac8:5c83:0:b0:517:63df:91a5 with SMTP id d75a77b69052e-52d2380c1b0mr7887221cf.19.1786126636312;
        Fri, 07 Aug 2026 11:17:16 -0700 (PDT)
X-Received: by 2002:ac8:5c83:0:b0:517:63df:91a5 with SMTP id d75a77b69052e-52d2380c1b0mr7886581cf.19.1786126635760;
        Fri, 07 Aug 2026 11:17:15 -0700 (PDT)
Received: from localhost (ip-86-49-241-13.bb.vodafone.cz. [86.49.241.13])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2080a743ffsm82614366b.23.2026.08.07.11.17.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Aug 2026 11:17:14 -0700 (PDT)
From: Andrew Jones <andrew.jones@oss.qualcomm.com>
To: linux-riscv@lists.infradead.org, iommu@lists.linux.dev
Cc: linux-kernel@vger.kernel.org, tomasz.jeznach@linux.dev,
        tjeznach@rivosinc.com, jgg@ziepe.ca, jgg@nvidia.com, joro@8bytes.org,
        will@kernel.org, robin.murphy@arm.com, pjw@kernel.org,
        palmer@dabbelt.com, anup@brainfault.org, tglx@kernel.org,
        kevin.tian@intel.com, fangyu.yu@linux.alibaba.com
Subject: [PATCH v3 00/19] iommu/riscv: Enable MSI remapping, IOMMU_DMA and VFIO
Date: Fri,  7 Aug 2026 20:16:54 +0200
Message-ID: <20260807181713.228535-1-andrew.jones@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Proofpoint-ORIG-GUID: DcHqDILSfGJyKDpMHeo9WqROMZB-tpiT
X-Authority-Analysis: v=2.4 cv=SYbHsPRu c=1 sm=1 tr=0 ts=6a76212d cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=VPysOpcHbS0DNrM1Xqmyow==:17
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=c92rfblmAAAA:8 a=uKVmUR9HeUr0h8foQc0A:9
 a=dawVfQjAaf238kedN5IG:22 a=GvGzcOZaWPEFPQC_NcjD:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA3MDE0MyBTYWx0ZWRfX4NDe21NFJG14
 l2YifmoHA+c9ImY0NNuJDdC7yTX2+kBYdviqK+00LR5h5bfGvgqaVMNRZ3LNA36sF5qorI9NXab
 tWDZDxb7oVMmYSGWO4He27ywHioqhDA=
X-Proofpoint-GUID: DcHqDILSfGJyKDpMHeo9WqROMZB-tpiT
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA3MDE0MyBTYWx0ZWRfX0gHD3dI+/mNK
 H81aq4TEB4f7hysvXawALXLZgMNDXqeeiimokeBkLyWq5Nyx//x8OoXrmxJLNC8zYdZE7rSAUv/
 zSG86Mf425ZLT3/85i9Vx+2UO6P+Nvf5MF8w4+RGXPMzgw48R2tiNKP0743hZ3jgkyrg/1m4pPz
 vTeK1EIaIYkmfTdx5F5+wulQRUcLIGjLXtg2LqWsQ50H5nWFAdhZoG7GXvzKRL0o1zyBDLbsL1Z
 jE17AW+d1daqtC8EEHDL2Qd4+sSXGy/CbByYKjA2r7hlJz5HzvjH62tDeaPn3EMMHFEZ7R4uVXQ
 3OCa89HFgjieB7li25HIhvzpfU9KfmdlgFZedHcYUuqcKhItmDduMehvG6HuK3QEF/lXqv+wt6j
 FpKjyyPUMFuzJSEjJ3+wHz1NfL/uljXE3DbfnYvZVRJCCf/iZOm2wcSrSHiJ3Nhr3YqCW+y15o3
 vDWZcLEgkrfm0SUrLXw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-07_03,2026-08-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 phishscore=0 lowpriorityscore=0 spamscore=0
 impostorscore=0 suspectscore=0 priorityscore=1501 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608070143
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260807_111720_109715_924401B0 
X-CRM114-Status: GOOD (  18.97  )
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

With the DMA path in place, v3 also carries the remaining plumbing needed
for RISC-V PCIe device assignment through VFIO/KVM: the RISC-V IOMMU
reports DMA cache-coherency capability, VFIO type1 and KVM_VFIO are
enabled for RISC-V, defconfig enables IOMMUFD/VFIO as modules with cdev
support, and the generic VFIO/iommufd selftests can be built for RISC-V.
The interrupt-remapping domain does not yet validate MSI data, so VFIO
still requires allow_unsafe_interrupts=1. Direct MSI routing to guest
interrupt files (irqbypass) is not yet supported by this series.
irqbypass will be posted separately on top.

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

v3:
- Addressed Sashiko's v2 comments[3]
- Added RISC-V VFIO/KVM enablement patches and VFIO selftest build support
- Capped SW MSI bitmap growth at 16K entries to simplify the growth arithmetic
- Tracked live MSI allocations so domain replacement can rebuild MSI IOVA
  tables when no iommufd table can be copied
- Add a patch to guard against identity <-> paging domain changes with
  in-flight MSIs

[3] https://sashiko.dev/#/patchset/20260724151218.965929-1-andrew.jones@oss.qualcomm.com


Andrew Jones (15):
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
  iommu/riscv: Gate identity boundary switches with live MSIs
  iommu/riscv: Implement irq_compose_msi_msg for IMSIC remapping
  riscv: defconfig: Enable IOMMUFD and VFIO
  selftests/vfio: Allow building on RISC-V

Tomasz Jeznach (4):
  iommu/dma: Enable IOMMU_DMA for 64-bit RISC-V
  iommu/riscv: report iommu capabilities
  vfio: enable IOMMU_TYPE1 for RISC-V
  RISC-V: KVM: Enable KVM_VFIO interfaces on RISC-V arch

 arch/riscv/configs/defconfig               |   4 +
 arch/riscv/kvm/Kconfig                     |   1 +
 drivers/iommu/Kconfig                      |   2 +-
 drivers/iommu/dma-iommu.c                  |  32 +-
 drivers/iommu/dma-iommu.h                  |  12 +-
 drivers/iommu/iommu-priv.h                 |  11 +-
 drivers/iommu/iommu.c                      | 104 +++++-
 drivers/iommu/iommufd/device.c             |   3 +-
 drivers/iommu/iommufd/driver.c             |  79 +++--
 drivers/iommu/iommufd/hw_pagetable.c       |   1 +
 drivers/iommu/iommufd/iommufd_private.h    |  41 ++-
 drivers/iommu/riscv/Kconfig                |   1 +
 drivers/iommu/riscv/Makefile               |   2 +-
 drivers/iommu/riscv/iommu-ir.c             | 353 +++++++++++++++++++++
 drivers/iommu/riscv/iommu.c                | 100 ++++--
 drivers/iommu/riscv/iommu.h                |  41 +++
 drivers/irqchip/irq-msi-lib.c              |   8 +-
 drivers/irqchip/irq-riscv-imsic-platform.c |  27 +-
 drivers/vfio/Kconfig                       |   2 +-
 include/linux/iommu.h                      |  31 ++
 include/linux/irqchip/riscv-imsic.h        |   7 +
 include/linux/irqdomain_defs.h             |   1 +
 tools/testing/selftests/vfio/Makefile      |   2 +-
 23 files changed, 749 insertions(+), 116 deletions(-)
 create mode 100644 drivers/iommu/riscv/iommu-ir.c

-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
