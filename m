Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89AC4C47DDF
	for <linux-riscv@archiver.kernel.org>; Wed, 31 Jan 2024 02:18:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=kR0suVb7q32jlp+GDX/hXbKkDXm9yI03I/OLm4LaGQs=; b=24MPmoDX2/eYAW
	WoyGR5cVn3ZJHRLR0ILRFtDmK5R09NXLqCUrVxbaUuQgrWQM45uUdzLrWW5VMyVEXN5hiEv3xug/s
	vVjjsigTHizYyqW5rtuwXkONwz4tD5l3+PUZk9HTbf+8b+fnLuhEke1MjhVgQCeGSgT/F5qFbbeis
	kAtvtSspwQ5igJD0LgStehZUasDTvs8oJiN/4v8FxFUYEIsP3ao/q1+9JPpeJvGcqDcQ582TC8eHp
	TCp7R6RpxtcA5fVSibThKtE40eAmtuNS5gh5l5Ki/ilescgnVHiO/PdceKKpc/4aI68RtLsytwuz8
	/6emoLGaVm8mGT6F3xIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rV0BR-00000001F6M-2CPL;
	Wed, 31 Jan 2024 02:18:37 +0000
Received: from mgamail.intel.com ([192.198.163.7])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rV0BO-00000001F5d-1lvg
	for linux-riscv@lists.infradead.org;
	Wed, 31 Jan 2024 02:18:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1706667514; x=1738203514;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=plKPxBQ2jsb/v68hxkyJ/JuBYB+4x5Jxb3q+0BdUhZ0=;
  b=K+sLNNwcT/0IZ6hJ4d46l0qsr6+dh+xBSbmqaaKPS+Oa+mXcJ2cQgEer
   NyObxa6nVces2n04bfkBARzkMBIe6qh4AQ5o4bLAoAUNGh4szP+VjQ+Tp
   joYh6B7cGKI9QX5adBOt0b2EzJCINK8W+Tc4pnCFMbacqI2kG1tkbXCcQ
   IvormIyhEKPXPd8kRAvMpDYb7J2VShOygusm7Muh/FblHSGfGNHvwYp15
   93n/SFEJhi2aHu5jvWuh5HyneQqB4IFiAjSAaW6SzQK9wI2gEcT2FQCZv
   hOkkR1fVBDqnTJ/LNMCmdzYFYzACrC8WRfoib1ufYWN67tJJN55C4v7Dt
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10969"; a="24938949"
X-IronPort-AV: E=Sophos;i="6.05,231,1701158400"; 
   d="scan'208";a="24938949"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jan 2024 18:18:31 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10969"; a="907714690"
X-IronPort-AV: E=Sophos;i="6.05,231,1701158400"; 
   d="scan'208";a="907714690"
Received: from haibo-optiplex-7090.sh.intel.com ([10.239.159.132])
  by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jan 2024 18:18:23 -0800
From: Haibo Xu <haibo1.xu@intel.com>
To: 
Subject: [PATCH 0/4] Add ACPI NUMA support for RISC-V
Date: Wed, 31 Jan 2024 10:31:57 +0800
Message-Id: <cover.1706603678.git.haibo1.xu@intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240130_181834_495434_D0F6A070 
X-CRM114-Status: GOOD (  11.91  )
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
Cc: Alison Schofield <alison.schofield@intel.com>, "Rafael J. Wysocki" <rafael@kernel.org>, Dave Hansen <dave.hansen@linux.intel.com>, =?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@rivosinc.com>, Conor Dooley <conor.dooley@microchip.com>, Guo Ren <guoren@kernel.org>, Jisheng Zhang <jszhang@kernel.org>, James Morse <james.morse@arm.com>, linux-riscv@lists.infradead.org, Ard Biesheuvel <ardb@kernel.org>, Haibo Xu <haibo1.xu@intel.com>, Baoquan He <bhe@redhat.com>, acpica-devel@lists.linux.dev, Robert Moore <robert.moore@intel.com>, linux-acpi@vger.kernel.org, Sami Tolvanen <samitolvanen@google.com>, Greentime Hu <greentime.hu@sifive.com>, Len Brown <lenb@kernel.org>, Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alexghiti@rivosinc.com>, Arnd Bergmann <arnd@arndb.de>, Yang Li <yang.lee@linux.alibaba.com>, Dan Williams <dan.j.williams@intel.com>, Chen Jiahao <chenjiahao16@huawei.com>, Yuntao Wang <ytcoode@gmail.com>, Paul Walmsley <paul.walmsley@sifive.com>, =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>, xiaobo55x@gmail.com, Anup Patel <apatel@ventanamicro.com>, Tony Luck <tony.luck@intel.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org, Samuel Holland <samuel.holland@sifive.com>, Evan Green <evan@rivosinc.com>, Palmer Dabbelt <palmer@dabbelt.com>, ajones@ventanamicro.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

This patch series enable RISC-V ACPI NUMA support which was based on
the recently approved ACPI ECR[1].

Patch 1/4 is generated from the acpica PR[2] and should be merged through
the acpica project. Due to this dependency, other 3 patches can only be
merged after the corresponding ACPICA patch was pulled into linux.

Patch 2/4 add the common SRAT RINTC affinity structure handler.
Patch 3/4 add RISC-V specific acpi_numa.c file to parse NUMA information
from SRAT and SLIT ACPI tables.
Patch 4/4 add corresponding ACPI_NUMA config for RISC-V Kconfig. 

Based-on: https://github.com/linux-riscv/linux-riscv/tree/for-next

[1] https://mantis.uefi.org/mantis/view.php?id=2433
[2] https://github.com/acpica/acpica/pull/926

Testing:
Since the ACPI AIA/PLIC support patch set is still under upstream review,
hence it is tested using the poll based HVC SBI console and RAM disk.
1) Build latest Qemu with the following patch backported
   https://lore.kernel.org/all/20240129094200.3581037-1-haibo1.xu@intel.com/
   https://github.com/vlsunil/qemu/commit/42bd4eeefd5d4410a68f02d54fee406d8a1269b0

2) Build latest EDK-II
   https://github.com/tianocore/edk2/blob/master/OvmfPkg/RiscVVirt/README.md

3) Build Linux with the following configs enabled
   CONFIG_RISCV_SBI_V01=y
   CONFIG_SERIAL_EARLYCON_RISCV_SBI=y
   CONFIG_HVC_RISCV_SBI=y

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

Haibo Xu (4):
  ACPICA: SRAT: Add RISC-V RINTC affinity structure
  ACPI: NUMA: Add handler for SRAT RINTC affinity structure
  ACPI: RISCV: Add NUMA support based on SRAT and SLIT
  ACPI: RISCV: Enable ACPI based NUMA

 arch/riscv/Kconfig            |   1 +
 arch/riscv/include/asm/acpi.h |  15 +++-
 arch/riscv/kernel/Makefile    |   1 +
 arch/riscv/kernel/acpi.c      |   5 --
 arch/riscv/kernel/acpi_numa.c | 133 ++++++++++++++++++++++++++++++++++
 arch/riscv/kernel/setup.c     |   4 +-
 arch/riscv/kernel/smpboot.c   |   2 -
 drivers/acpi/numa/Kconfig     |   2 +-
 drivers/acpi/numa/srat.c      |  35 ++++++++-
 include/acpi/actbl3.h         |  18 ++++-
 include/linux/acpi.h          |   7 ++
 11 files changed, 209 insertions(+), 14 deletions(-)
 create mode 100644 arch/riscv/kernel/acpi_numa.c

-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
