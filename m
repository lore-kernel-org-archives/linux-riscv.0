Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EEE4DC4345F
	for <linux-riscv@archiver.kernel.org>; Wed, 24 Apr 2024 05:29:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=d0lhqB2jM2oDM9aUmZnDzdZeJphfe4hEnbiO4uM2nhI=; b=4RZpgHJFpqj35w
	Mhn76q6Led6nv2FJbVMxyDaYc5qQVNU4BHoLowsxEh/pxvapyFQlCMIeAgKtiWlbfGRoxFSwWxuna
	4YNOcCfVRLsm/iGV/hTA5uWaEoQUXEjmaWuyJdtPrzh8p2O6jx2aWf0CQIU6durU/Y/Gv3tZMnNV5
	lAh6FzDEo0gDoGQtsuzN3Fq30dXqqoeIR3ZLjU5BAIBGiGDX57Ta9AprC4H6d5jXK+fgkQBFkwSGv
	Z2xt8Pv6G5koz6QTS6j2cwp0AWzHBAUnxQ8ZtAlmTpl9QCixCrcFfxkzS9nuVTFwZZTHtucFh6C6Q
	cnoYrb+jVc/SRb3I7tEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rzVCI-00000002g2Z-04zl;
	Wed, 24 Apr 2024 05:29:34 +0000
Received: from mgamail.intel.com ([198.175.65.10])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rzVCD-00000002g1R-42HN;
	Wed, 24 Apr 2024 05:29:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1713936571; x=1745472571;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=1/iIct8UGpDmuG/5bl7oWPxGoo+moxuqtVa10nZ/dok=;
  b=Srro5q+w1OwUKauTviVMYrwBq6C1XDuY1wm8PjoJipOMr8Ifrdx5m+Y8
   tfwHXLxY6R8QbGFuC21zpAqa3MO3HTscxEyEB5zu28IMargjfDAEmQExg
   wDKSa0+oQTRUWhnCQZTJ7F3LHvvuFos/qhq5Kx47g3PPc2ib4JakCYJws
   Buj568YwNYjke8QCtfaiwPjFRkMLRcKYqE9xM4rLRo4+k5TiUMIz3pydj
   dRZBoYtUPxqHSl4saGgw4PIl+LpX1McA8ihoGFOrP0wF4F7JYEURtEmKg
   SJfzuVVsJy++P+weGh1w3g+7LIHBwJGa53WjuNmGgYzPvqbTL7iIhHC3U
   A==;
X-CSE-ConnectionGUID: qFUjJRLGRTyYK3ycng3XCw==
X-CSE-MsgGUID: 9wis9kegTvaYw/9WjEi2hg==
X-IronPort-AV: E=McAfee;i="6600,9927,11053"; a="27004148"
X-IronPort-AV: E=Sophos;i="6.07,225,1708416000"; 
   d="scan'208";a="27004148"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Apr 2024 22:29:25 -0700
X-CSE-ConnectionGUID: TZUdjSLNSc++1OEGH/Lb4Q==
X-CSE-MsgGUID: 4RHRlqHiSi+Bn+7xBiL3uQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,225,1708416000"; 
   d="scan'208";a="62049672"
Received: from unknown (HELO haibo-OptiPlex-7090.sh.intel.com) ([10.239.159.132])
  by orviesa001.jf.intel.com with ESMTP; 23 Apr 2024 22:29:14 -0700
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
	Robert Moore <robert.moore@intel.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Guo Ren <guoren@kernel.org>,
	Alexandre Ghiti <alexghiti@rivosinc.com>,
	Baoquan He <bhe@redhat.com>,
	Greentime Hu <greentime.hu@sifive.com>,
	Charlie Jenkins <charlie@rivosinc.com>,
	Zong Li <zong.li@sifive.com>,
	Sami Tolvanen <samitolvanen@google.com>,
	=?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>,
	Samuel Holland <samuel.holland@sifive.com>,
	Chen Jiahao <chenjiahao16@huawei.com>,
	Jisheng Zhang <jszhang@kernel.org>,
	James Morse <james.morse@arm.com>,
	"Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
	Evan Green <evan@rivosinc.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ard Biesheuvel <ardb@kernel.org>,
	Tony Luck <tony.luck@intel.com>,
	Yuntao Wang <ytcoode@gmail.com>,
	Alison Schofield <alison.schofield@intel.com>,
	Dave Jiang <dave.jiang@intel.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	loongarch@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	linux-acpi@vger.kernel.org,
	acpica-devel@lists.linux.dev
Subject: [PATCH v3 0/6] Add ACPI NUMA support for RISC-V
Date: Wed, 24 Apr 2024 13:46:20 +0800
Message-Id: <cover.1713778236.git.haibo1.xu@intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240423_222930_077465_824E66B7 
X-CRM114-Status: GOOD (  13.72  )
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

Patch 1/6 is generated from the acpica PR[2] and should be merged through
the acpica project. Due to this dependency, other 5 patches can only be
merged after the corresponding ACPICA patch was pulled into linux.

Patch 2/6 add RISC-V specific acpi_numa.c file to parse NUMA information
from SRAT and SLIT ACPI tables.
Patch 3/6 add the common SRAT RINTC affinity structure handler.
Patch 4/6 remove the '#if defined(CONFIG_ARCH)' condition to make some NUMA
related parse functions common for all current architectures that support
ACPI_NUMA.
Patch 5/6 change the ACPI_NUMA to a hidden option since it would be selected
by default on all supported platform. 
Patch 6/6 replace pr_info with pr_debug in arch_acpi_numa_init() to avoid
potential boot noise on ACPI platforms that are not NUMA.  

Based-on: https://github.com/linux-riscv/linux-riscv/tree/for-next

[1] https://drive.google.com/file/d/1YTdDx2IPm5IeZjAW932EYU-tUtgS08tX/view?usp=sharing
[2] https://github.com/acpica/acpica/pull/926

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
Changes since v2
  - Rebase to Linux 6.9-rc1
  - changed ACPI_NUMA to a hidden option in patch 5/6 per Arnd's suggestion
  - Removed original 6/6 which was not needed with changes in patch 5/6
  - Added a new patch 6/6 to replace pr_info to pr_debug in arch_acpi_numa_init

Haibo Xu (6):
  ACPICA: SRAT: Add RISC-V RINTC affinity structure
  ACPI: RISCV: Add NUMA support based on SRAT and SLIT
  ACPI: NUMA: Add handler for SRAT RINTC affinity structure
  ACPI: NUMA: Make some NUMA related parse functions common
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
 drivers/acpi/numa/srat.c      |  40 ++++++++---
 drivers/base/arch_numa.c      |   2 +-
 include/acpi/actbl3.h         |  18 ++++-
 include/linux/acpi.h          |   6 ++
 13 files changed, 204 insertions(+), 27 deletions(-)
 create mode 100644 arch/riscv/kernel/acpi_numa.c

-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
