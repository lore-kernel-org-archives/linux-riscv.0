Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0424C27C4F
	for <linux-riscv@archiver.kernel.org>; Thu, 13 Jun 2024 08:36:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=FOTnauKEyZNIjxGrbaLIM8eEN8+bW5PGjPHcHy60XFs=; b=CjV3J44BBcXXR4
	4wM2fjDrepFw8uzz+2pth9HuLTlaepHPrL5p4h2KLywXQABb7+wXgpuD/1Uso2RmCtfITdj+zqIrO
	EsnTMcp8ceV7dF9thEn92c3bSg4NJdOuB3S0I4PAGvFzFcJfo/kHirvGp4Fhar7/CGLTb1WxMWDQU
	BrGVczoj3igQqxk62eK0nKfy7XRsghgUKef0XBqxeEjqZlZkIkiBHxWUwW+f1IJbUYOsOfpIy0Lg8
	+4uaDmzbfjxxRBYwM1TPS9C2fEecSa4o3fuJJ4aTMxkf+nb9mgkh+AsczN1YE5xeB1zOeqLOaLqMq
	AoJH0yM/Nlh7kRevafQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sHfwj-0000000Fiji-1yT9;
	Thu, 13 Jun 2024 08:36:37 +0000
Received: from mgamail.intel.com ([198.175.65.21])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sHfwg-0000000Fiho-0KSR;
	Thu, 13 Jun 2024 08:36:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718267794; x=1749803794;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=3ovCB/zXsuebWe0Yz4yc+d18kQMuEVZClgl8PA7HD5o=;
  b=P94kh+Vf7oQiaWGKvQTuKEHmjWg00LMgw6icEAPmziFHYJPZJfQFpkji
   QIcmX4AiHzgKk8eBJn8s4xKIV3dGqFQk0qmqlTcCZ4/Nu3/kVhuALe0el
   evbY4A8gjpzfnsi7zj0ox5aUIOsbh99tadlvNPzCreBcKwhu2jmuWxrwT
   Ndv7n79nwfS4KV2wK2r1riLGnPHMrfBAe8BhfMu/e1oDFomYy2F0sVpu8
   f4hK/kd2v1YuXUWfyB/35BqRzvMOE3WEaRUar+ofYvqBeuFIPPuzibZ2Y
   cxBdIV+EaEaLzDSQiYudpMfWG1aYBD3I7NDukkLNJ2Ovk3SI94p2Ov2i2
   g==;
X-CSE-ConnectionGUID: 1YoGbbR2TLqXzqWpwySAFw==
X-CSE-MsgGUID: +Bc5FY2pSHeha5SoW3lqJg==
X-IronPort-AV: E=McAfee;i="6700,10204,11101"; a="15037724"
X-IronPort-AV: E=Sophos;i="6.08,234,1712646000"; 
   d="scan'208";a="15037724"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jun 2024 01:36:31 -0700
X-CSE-ConnectionGUID: Qv+liwW3RqmG1+jP0AhpCA==
X-CSE-MsgGUID: nvdTq6xyRMCMcg4RPM/Zeg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,234,1712646000"; 
   d="scan'208";a="40033609"
Received: from unknown (HELO haibo-OptiPlex-7090.sh.intel.com) ([10.239.159.132])
  by fmviesa008.fm.intel.com with ESMTP; 13 Jun 2024 01:36:21 -0700
From: Haibo Xu <haibo1.xu@intel.com>
To: sunilvl@ventanamicro.com,
	arnd@arndb.de
Cc: xiaobo55x@gmail.com,
	ajones@ventanamicro.com,
	Haibo Xu <haibo1.xu@intel.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Huacai Chen <chenhuacai@kernel.org>,
	WANG Xuerui <kernel@xen0n.name>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Len Brown <lenb@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Conor Dooley <conor.dooley@microchip.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Charlie Jenkins <charlie@rivosinc.com>,
	Baoquan He <bhe@redhat.com>,
	Evan Green <evan@rivosinc.com>,
	=?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>,
	Zong Li <zong.li@sifive.com>,
	Sami Tolvanen <samitolvanen@google.com>,
	Alexandre Ghiti <alexghiti@rivosinc.com>,
	Samuel Holland <samuel.holland@sifive.com>,
	Chen Jiahao <chenjiahao16@huawei.com>,
	"Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
	Jisheng Zhang <jszhang@kernel.org>,
	James Morse <james.morse@arm.com>,
	Andy Chiu <andy.chiu@sifive.com>,
	Marc Zyngier <maz@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Tony Luck <tony.luck@intel.com>,
	Ard Biesheuvel <ardb@kernel.org>,
	Dan Williams <dan.j.williams@intel.com>,
	Alison Schofield <alison.schofield@intel.com>,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	Robert Richter <rrichter@amd.com>,
	Yuntao Wang <ytcoode@gmail.com>,
	Dave Jiang <dave.jiang@intel.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	loongarch@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	linux-acpi@vger.kernel.org
Subject: [PATCH v4 0/4] Add ACPI NUMA support for RISC-V
Date: Thu, 13 Jun 2024 16:54:32 +0800
Message-Id: <cover.1718268003.git.haibo1.xu@intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240613_013634_281730_98A293CC 
X-CRM114-Status: GOOD (  12.09  )
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

This patch series enable RISC-V ACPI NUMA support which was based on
the recently approved ACPI ECR[1].

Patch 1/4 add RISC-V specific acpi_numa.c file to parse NUMA information
from SRAT and SLIT ACPI tables.
Patch 2/4 add the common SRAT RINTC affinity structure handler.
Patch 3/4 change the ACPI_NUMA to a hidden option since it would be selected
by default on all supported platform.
Patch 4/4 replace pr_info with pr_debug in arch_acpi_numa_init() to avoid
potential boot noise on ACPI platforms that are not NUMA.

Based-on: https://github.com/linux-riscv/linux-riscv/tree/for-next

[1] https://drive.google.com/file/d/1YTdDx2IPm5IeZjAW932EYU-tUtgS08tX/view?usp=sharing

Testing:
Since the ACPI AIA/PLIC support patch set is still under upstream review,
hence it is tested using the poll based HVC SBI console and RAM disk.
1) Build latest Qemu with the following patch backported
   https://github.com/vlsunil/qemu/commit/42bd4eeefd5d4410a68f02d54fee406d8a1269b0

2) Build latest EDK-II
   https://github.com/tianocore/edk2/blob/master/OvmfPkg/RiscVVirt/README.md

3) Build Linux with the following configs enabled
   CONFIG_RISCV_SBI_V01=y
   CONFIG_SERIAL_EARLYCON_RISCV_SBI=y
   CONFIG_NONPORTABLE=y
   CONFIG_HVC_RISCV_SBI=y
   CONFIG_NUMA=y
   CONFIG_ACPI_NUMA=y

4) Build buildroot rootfs.cpio

5) Launch the Qemu machine
   qemu-system-riscv64 -nographic \
   -machine virt,pflash0=pflash0,pflash1=pflash1 -smp 4 -m 8G \
   -blockdev node-name=pflash0,driver=file,read-only=on,filename=RISCV_VIRT_CODE.fd \
   -blockdev node-name=pflash1,driver=file,filename=RISCV_VIRT_VARS.fd \
   -object memory-backend-ram,size=4G,id=m0 \
   -object memory-backend-ram,size=4G,id=m1 \
   -numa node,memdev=m0,cpus=0-1,nodeid=0 \
   -numa node,memdev=m1,cpus=2-3,nodeid=1 \
   -numa dist,src=0,dst=1,val=30 \
   -kernel linux/arch/riscv/boot/Image \
   -initrd buildroot/output/images/rootfs.cpio \
   -append "root=/dev/ram ro console=hvc0 earlycon=sbi"

[    0.000000] ACPI: SRAT: Node 0 PXM 0 [mem 0x80000000-0x17fffffff]
[    0.000000] ACPI: SRAT: Node 1 PXM 1 [mem 0x180000000-0x27fffffff]
[    0.000000] NUMA: NODE_DATA [mem 0x17fe3bc40-0x17fe3cfff]
[    0.000000] NUMA: NODE_DATA [mem 0x27fff4c40-0x27fff5fff]
...
[    0.000000] ACPI: NUMA: SRAT: PXM 0 -> HARTID 0x0 -> Node 0
[    0.000000] ACPI: NUMA: SRAT: PXM 0 -> HARTID 0x1 -> Node 0
[    0.000000] ACPI: NUMA: SRAT: PXM 1 -> HARTID 0x2 -> Node 1
[    0.000000] ACPI: NUMA: SRAT: PXM 1 -> HARTID 0x3 -> Node 1

---
Changes since v3
  - Rebase to linux-riscv/for-next(Linux 6.10-rc1)
  - Remove original patch 1/6 since it had been merged through
    ACPICA pull(commit fe1c408d50604f)
  - Remove original patch 4/6 since the related changes was
    introduced in commit 3a785e19f43267

Haibo Xu (4):
  ACPI: RISCV: Add NUMA support based on SRAT and SLIT
  ACPI: NUMA: Add handler for SRAT RINTC affinity structure
  ACPI: NUMA: change the ACPI_NUMA to a hidden option
  ACPI: NUMA: replace pr_info with pr_debug in arch_acpi_numa_init

 arch/arm64/Kconfig            |   1 -
 arch/loongarch/Kconfig        |   1 -
 arch/riscv/include/asm/acpi.h |  15 +++-
 arch/riscv/kernel/Makefile    |   1 +
 arch/riscv/kernel/acpi.c      |   5 --
 arch/riscv/kernel/acpi_numa.c | 131 ++++++++++++++++++++++++++++++++++
 arch/riscv/kernel/setup.c     |   4 +-
 arch/riscv/kernel/smpboot.c   |   2 -
 drivers/acpi/numa/Kconfig     |   5 +-
 drivers/acpi/numa/srat.c      |  32 ++++++++-
 drivers/base/arch_numa.c      |   2 +-
 include/linux/acpi.h          |   6 ++
 12 files changed, 187 insertions(+), 18 deletions(-)
 create mode 100644 arch/riscv/kernel/acpi_numa.c

-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
