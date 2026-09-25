Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7FD2C9830E
	for <linux-riscv@archiver.kernel.org>; Fri, 25 Sep 2026 15:17:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=vOrRW61tioeFvLH6JiQPK9yPF5F1gMc3K+Wm3ARCBcw=; b=vOn+7oX7wd/N1K
	9QToou7Fc+LQjgcK8ZlyDBMQkYtT0U0kJz/7VB0aciwgwWYvBEv3QMLPZAfdMnC3EaDfgkgOsHSy2
	dRXUIS21y7he4ujFzksuY2PnUu7rDvi/b//gbKa3egp2XyOWIgayiWIDo0diMCzDnBaADpBIDPlw/
	l0PmQc63dhxpJt8tqRMsqsSDO0n/C73XSEq4mgzXDFZRw2mmEbJtA6Fc5AzULp/WLl3w6tzR6Nhne
	7krmgkc4QWBph6/bdoBJW7ncc4vxcVHp8JtLz3nXQ/pMDZUaxFXdmWW0JTRkfvO8YUBGBzzQHUDqW
	gJ005IsESIZ+zEiINSBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xA7ff-0000000Djli-1IO4;
	Fri, 25 Sep 2026 15:17:07 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xA7fc-0000000Djki-0aUj
	for linux-riscv@lists.infradead.org;
	Fri, 25 Sep 2026 15:17:05 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68PEFNEv756679
	for <linux-riscv@lists.infradead.org>; Fri, 25 Sep 2026 15:17:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=UhcJd91SmA5edbXD2iwXlkUxZSO0+0I604B
	mJXkJ+Gw=; b=VuIyr7d5TvqQxI7ccIpadKBEEbOssZgdNk+FQSNn/XZZnu9MTD3
	61n1Wtw/t7KqLnWkAt+75wCJG4wtKdyr2rNvEpcu6FSNi3O/u15CJDAwyMEfNx/V
	zHQmLnwpPO9Y/Om1d8aY2WduzpHic4TPa8pzO330heVxCLsPWi2PgWjk4Ajn9yTW
	J5U6l2NmjKQD5Z8annSlIzJB2z870KO2FqZay4cfSHP3As8Ng+QpAR33D3NcKL3K
	n50KMITUeiG9NNVsSGe3/BcriYtVL7a+bO0MQbulm95k+gmAZXTqatqU/ZwqB2gc
	qok/ajYS9Cl6cEX/XzYlZJZ7M95Gh14k5rQ==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gwjq09wh8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Fri, 25 Sep 2026 15:17:02 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-7866c4ed349so831216137.0
        for <linux-riscv@lists.infradead.org>; Fri, 25 Sep 2026 08:17:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790349422; x=1790954222; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=UhcJd91SmA5edbXD2iwXlkUxZSO0+0I604BmJXkJ+Gw=;
        b=YqyfouoTLuNFjhX9kjJyfg37OH/n3UqurtZn1LjwwtpQLP4pzXLljCt8sXFneybDj8
         cVGMUywfF02GC9tNHeHX18UnLWTXbFg2mXWoHbXPC1sXUDsvJtQobU9TmesauheHfYQZ
         0DW50wp42FPjaUd+crQyCVoqh/yb2Kz7MKhCQ2GaousqNxsLlG26VJHMEO/wf+TqeYiH
         fURwYcMpOiWXvaAmXLDYJrOOBwJfeCjlQm4PXEw8IeVyRzZXBq0cTawNKCzRL7U1r0r2
         z0pgePRU2xnWsGXNspQWjBa5v3B+d+ckoIBT8UQtFoCv7WU2agAt8neeHO2D7Q/uAVgx
         9Z5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790349422; x=1790954222;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UhcJd91SmA5edbXD2iwXlkUxZSO0+0I604BmJXkJ+Gw=;
        b=WhJlxztHRbpxI6gbKpTlrxicymDJngexHEGN2ZeN/56GY9SddICMnuygyJbax+WQYG
         wkFGD0VLCMBDTStDTKLyhwW4yuO/FNCxdn8xgXxtPh9VA2nzlPlYnrSOeUQKv9z6bYsG
         k1Yexn87ofNHKViSZRafueIr5Q59FcsoADZ15y2vgWiPjLx0hBibOaVJm02ENPREYkAv
         xfAthVgY98B+gtLlm3rBFmdvFKd0C7xK+sprMem/n1GPSfpkA6K0/gqqxVcl239uW49G
         OqET0gxLdPULnI+oQhz4Y5fe9VPVcS5/tAeGu3NNjGYJRkYgCWsdjimXazwaPjtvlBKf
         zTYQ==
X-Gm-Message-State: AFuF++kpypG9ntSe5jc1K140IPtGjic9jUhRNJZO4zUteZCxYQ13HZOp
	LKsbNpVZuZ76cEUvsew7wqcFdU2+06scEahIfodAy3/IdBgrX7V4kltPXE08YB3Gpt2EEzWbhK0
	BPAFwbvJtAOiOWqLtwKasmO/yXP8nlJzqMWcfgieTIitTzF69KuZ5hLJdU1nyerrb3TDn6eHJnA
	BrnH8=
X-Gm-Gg: AYBFou1L63qgl+pcyVkbWpG3Jtbahn6Way+ynq7HmBQw8ufL0ghUbPOLPWDn5rz3YTS
	ukOGO0KmvQyxPP0EQ87yRaLQbRG6v5RVnoWN5uOidM0f1CJ6IHG05UIgWJSwzBZqeCeJsONi0Gj
	kfbUg6UPUKkYcZ3Uo6LWIUATxUwI4KHiulvdcPqQ5Q6zeVt2QnfYffRQDuDF/A+QGnuPz1lwr3J
	QysIz5wcHLZh64IwHtCl8HCiAAfv0KmMpUXf3IYfaJJqXLgLDghN5dx1CeQHtUTS0RbTRpL2/8A
	Oe2ryS6J7BWf5Is4iP414W/d+bw9W1jArzoe0vX43tJneA3wTyJZKTaIQ/3xTmj1XfOVfvfI1UK
	DfMp8QThT4d4T3yrI985RF4GIVFhgwNKpT7Y1pA==
X-Received: by 2002:a05:6102:4188:b0:7a6:dfec:3643 with SMTP id ada2fe7eead31-7af1ebf3435mr3192935137.27.1790349422142;
        Fri, 25 Sep 2026 08:17:02 -0700 (PDT)
X-Received: by 2002:a05:6102:4188:b0:7a6:dfec:3643 with SMTP id ada2fe7eead31-7af1ebf3435mr3192914137.27.1790349421589;
        Fri, 25 Sep 2026 08:17:01 -0700 (PDT)
Received: from localhost (ip-86-49-245-11.bb.vodafone.cz. [86.49.245.11])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4887a34a76fsm8049157f8f.7.2026.09.25.08.17.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2026 08:17:00 -0700 (PDT)
From: Andrew Jones <andrew.jones@oss.qualcomm.com>
To: linux-riscv@lists.infradead.org, iommu@lists.linux.dev
Cc: linux-kernel@vger.kernel.org, tomasz.jeznach@linux.dev,
        tjeznach@rivosinc.com, jgg@ziepe.ca, jgg@nvidia.com, joro@8bytes.org,
        will@kernel.org, robin.murphy@arm.com, pjw@kernel.org,
        palmer@dabbelt.com, anup@brainfault.org, tglx@kernel.org,
        kevin.tian@intel.com, fangyu.yu@linux.alibaba.com
Subject: [PATCH v6 00/16] iommu/riscv: Enable MSI remapping, IOMMU_DMA and VFIO
Date: Fri, 25 Sep 2026 17:16:43 +0200
Message-ID: <20260925151659.419512-1-andrew.jones@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI1MDA2MCBTYWx0ZWRfX9M9BknTDjYRM
 FMY/fVZfWOGvVsEEnbjNgPyoKDLaE1LUP2gr775n2HcIVO0yaF9pZkJ6ClzRqbAmBqWKqTXkMnk
 uYwstJ1qAxNn4j1K0eo02+PuY93d9lw=
X-Proofpoint-GUID: nCTAFGK8eyGFPaUWD864-e-ERSaCsWuq
X-Proofpoint-ORIG-GUID: nCTAFGK8eyGFPaUWD864-e-ERSaCsWuq
X-Authority-Analysis: v=2.4 cv=LNPz05W9 c=1 sm=1 tr=0 ts=6ab6906e cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=4CXLxsOAgPM/krjtHEZQyA==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=kPzB1T93wNrnoFBju0gA:9 a=-aSRE8QhW-JAV6biHavz:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI1MDA2MCBTYWx0ZWRfXw5O9G7LhOCkh
 G6+PifjDAWyfke+UvnafbQpPBR4xB80kXZvGoQG7LfDIIPohUuXFN55O/c4cUVeD5XkTXgQfaaU
 zNGNpyPiHtHzviOPmDgtY8yTzImKyEQ+D5CZZhXFD+WFdqRhyWiijYczujVbaE3L3yUC9jsLaNi
 hkPGj+T2k6pTPZxolaE3M/HRJ4a3qjfceGGu5i99LLI/UyYJYZNGX/samO48bnc8nZ8uKPz/U9u
 Lcrb5r+CDZBbrSEMyYcOrfqVR3h1lUAOnZ15n4EpthL1mRB7ktRcofVZZRiBMERJ2vOK9xIrSQ9
 Q9ZtbufxAAjFuLljcdBj3ADawvsy8y1cJNPilofptdVV3EVJytk0GDsUa2EIN7ta2sQd3dPnQgE
 5W+PRGdMQ463KoEC/ee0J+Ygy4zcPHyvzBagAFHCFqRuPhDiPwD1B5WotavPzOyvH7VonfrxnFS
 GeX76CcSs41QOt09lKw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-25_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0 suspectscore=0 impostorscore=0 malwarescore=0
 adultscore=0 priorityscore=1501 clxscore=1015 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609250060
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260925_081704_320704_436A684C 
X-CRM114-Status: GOOD (  18.74  )
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
list of MSI targets as one contiguous IOVA range. That resulted in v5[3],
a complete redesign around that approach. This is v6, which just has a few
minor updates to v5.

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

Unlike v4, v5 and v6 have no RISC-V IOMMU IRQ domain, no domain-local
IMSIC mapping table, and no IOMMU lookup during MSI composition. The IMSIC
IRQ domain owns the target list and message composition, while the IOMMU
layers only provide the mappings. Devices which do not need IOMMU MSI
translation keep using physical MSI addresses through the same IMSIC path.

The series also carries the remaining plumbing needed for RISC-V PCIe
device assignment through VFIO/KVM: VFIO type1 and KVM_VFIO are enabled
for RISC-V, defconfig enables IOMMUFD/VFIO as modules with cdev
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
[3] https://lore.kernel.org/all/20260831145943.313726-1-andrew.jones@oss.qualcomm.com/

v6:
- Rebased on latest linux-iommu/next, dropping the now upstream
  cache-coherency capability patch
- Picked up some r-b and t-b tags -- Thanks!
- Addressed Anup's comments
- Moved the SW MSI window from 128 MiB to 16 MiB to avoid kvmtool's
  guest IMSIC window, and documented the limitations of using a fixed
  window in the patch's commit message


Andrew Jones (13):
  iommu/dma: Prepare MSI physical address lists
  iommufd: Convert struct iommufd_sw_msi_maps to a growable bitmap
  iommufd: Split software MSI map lookup and allocation
  iommufd: Bound software MSI mappings to the reserved range
  iommufd: Prepare software MSI maps for address lists
  iommufd: Install software MSI map ranges atomically
  iommufd: Prepare software MSI installation for address lists
  iommu/dma: Introduce iommu_dma_prepare_msi_list()
  iommu/riscv: Reserve an MSI IOVA window for iommufd
  irqchip/riscv-imsic: Add MSI address list
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
 drivers/iommu/riscv/iommu.c                |  20 ++
 drivers/iommu/riscv/iommu.h                |   4 +
 drivers/irqchip/Kconfig                    |   1 +
 drivers/irqchip/irq-riscv-imsic-platform.c |  24 +-
 drivers/irqchip/irq-riscv-imsic-state.c    |  54 ++++
 drivers/irqchip/irq-riscv-imsic-state.h    |   3 +
 drivers/vfio/Kconfig                       |   2 +-
 include/linux/iommu.h                      |   8 +
 include/linux/irqchip/riscv-imsic.h        |   6 +
 tools/testing/selftests/vfio/Makefile      |   2 +-
 22 files changed, 646 insertions(+), 127 deletions(-)

-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
