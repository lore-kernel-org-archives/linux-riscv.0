Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BBD1C54E49
	for <linux-riscv@archiver.kernel.org>; Thu,  7 Mar 2024 08:34:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ZN34etWbfOxV5Qye70wSzO7UdlR/qYMCZv9hIWAwvEM=; b=JwlJD80Ueb8e//
	CBMdiJwheYoT4jRilwd6brRElj3hKcq9X1u9UuqpEbkcVjQ8WY+0nhBmGp42kb+uqJUG7gTCW6MKG
	f3UjTP0rHVcaOQn7WWYQGWgiIUmj+/dYVbSecCNb/8lulfnPKhacZ4IbUkoYEpLZbwBEesj/pBLIa
	Yfb10EkkBJVWHX6QLiN7toQ242S2y0VxMkiemWFTsYHvAItiBKkZm9vCZypmRvCb0otUSp9mHbh2w
	3UjklYy9E2ATy1L+Hxs+C2UoKPQB30w5kjQrJ5+Su8G/Zf3BbjgXli1qH/8x2wtmH0q6KkELBg4S9
	1Hi/trsjsFnfouL+rJYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ri9Cx-00000003dwP-2pKs;
	Thu, 07 Mar 2024 08:34:31 +0000
Received: from mgamail.intel.com ([198.175.65.17])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ri9Cu-00000003dvx-10Yu
	for linux-riscv@lists.infradead.org;
	Thu, 07 Mar 2024 08:34:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1709800469; x=1741336469;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=xxeOUPpVmvNkXIEHbrtGfOjB9ivL0JFCLXLAfH8o+c4=;
  b=XKFzDEVkhZVpcvgtXmwA9xahaLhVOECLyb9KThZMdtjiniePGIeLiTM6
   4eH8HV6Ba9V0NNMjRThrmxV+DfdtHuqTmNimfHIFyFOHAbgDKe86683s3
   OSvWDfmq9wrb+KAjlXVlgOLiv7RbXj9prEqG4BKGONtsjpbmXNJzBY3lW
   U4CiSG4TdnR2Uo4fwZV/NsqhIxdsQuoIIB0HlOHKtE8fp2vG5OFeZBKv/
   ec1BRg2A5OnkbIiOnZJtICMUk9gnLMXE5JlgTvFikEzgQEeca6NIIRolt
   I4tmeRahXICyt5L63GELeRTRf7ovBej0fnCHI6OwwfxuOCHdARrTRcvMy
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11005"; a="4600279"
X-IronPort-AV: E=Sophos;i="6.06,210,1705392000"; 
   d="scan'208";a="4600279"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Mar 2024 00:34:27 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,210,1705392000"; 
   d="scan'208";a="14699530"
Received: from haibo-optiplex-7090.sh.intel.com ([10.239.159.132])
  by orviesa004.jf.intel.com with ESMTP; 07 Mar 2024 00:34:17 -0800
From: Haibo Xu <haibo1.xu@intel.com>
To: 
Subject: [PATCH v2 0/6] Add ACPI NUMA support for RISC-V
Date: Thu,  7 Mar 2024 16:47:52 +0800
Message-Id: <cover.1709780590.git.haibo1.xu@intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240307_003428_347342_7D8BAAFD 
X-CRM114-Status: GOOD (  13.84  )
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
Cc: Alison Schofield <alison.schofield@intel.com>, Jisheng Zhang <jszhang@kernel.org>, "Rafael J. Wysocki" <rafael@kernel.org>, Dave Hansen <dave.hansen@linux.intel.com>, =?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@rivosinc.com>, Conor Dooley <conor.dooley@microchip.com>, Guo Ren <guoren@kernel.org>, Zong Li <zong.li@sifive.com>, James Morse <james.morse@arm.com>, linux-riscv@lists.infradead.org, Ard Biesheuvel <ardb@kernel.org>, Haibo Xu <haibo1.xu@intel.com>, Baoquan He <bhe@redhat.com>, acpica-devel@lists.linux.dev, Robert Moore <robert.moore@intel.com>, linux-acpi@vger.kernel.org, Sami Tolvanen <samitolvanen@google.com>, Greentime Hu <greentime.hu@sifive.com>, Len Brown <lenb@kernel.org>, Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alexghiti@rivosinc.com>, Arnd Bergmann <arnd@arndb.de>, Dan Williams <dan.j.williams@intel.com>, Chen Jiahao <chenjiahao16@huawei.com>, Yuntao Wang <ytcoode@gmail.com>, Paul Walmsley <paul.walmsley@sifive.com>, =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>, xiaobo55x@gmail.com, Anup Patel <apatel@ventanamicro.com>, Tony Luck <tony.luck@intel.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org, Samuel Holland <samuel.holland@sifive.com>, Evan Green <evan@rivosinc.com>, Palmer Dabbelt <palmer@dabbelt.com>, ajones@ventanamicro.com
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
ACPI_NUMA
Patch 5/6 remove ARCH depends option in ACPI_NUMA Kconfig which was no
longer needed since all the current architectures that support ACPI would
select ACPI_NUMA by default.
Patch 6/6 add corresponding ACPI_NUMA config for RISC-V Kconfig.

Based-on: https://github.com/linux-riscv/linux-riscv/tree/for-next

[1] https://drive.google.com/file/d/1YTdDx2IPm5IeZjAW932EYU-tUtgS08tX/view?usp=sharing
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
Changes since v1
  - Switch the order of patch 2/4 and 3/4 - Per Sunil's suggestion
  - Add a new patch 4/6 to make some NUMA related parse functions common
    for all the architectures that support ACPI NUMA - Per Sunil's suggestion
  - Add a new patch 5/6 to remove ARCH depends option in ACPI_NUMA
    Kconfig since all the current architectures that support ACPI
    would select ACPI_NUMA by default - Per Arnd and Sunil's suggestion
  - Other minor fix for code format - Per Sunil's comments

Haibo Xu (6):
  ACPICA: SRAT: Add RISC-V RINTC affinity structure
  ACPI: RISCV: Add NUMA support based on SRAT and SLIT
  ACPI: NUMA: Add handler for SRAT RINTC affinity structure
  ACPI: NUMA: Make some NUMA related parse functions common
  ACPI: NUMA: Remove ARCH depends option in ACPI_NUMA Kconfig
  ACPI: RISCV: Enable ACPI based NUMA

 arch/riscv/Kconfig            |   1 +
 arch/riscv/include/asm/acpi.h |  15 +++-
 arch/riscv/kernel/Makefile    |   1 +
 arch/riscv/kernel/acpi.c      |   5 --
 arch/riscv/kernel/acpi_numa.c | 131 ++++++++++++++++++++++++++++++++++
 arch/riscv/kernel/setup.c     |   4 +-
 arch/riscv/kernel/smpboot.c   |   2 -
 drivers/acpi/numa/Kconfig     |   1 -
 drivers/acpi/numa/srat.c      |  40 ++++++++---
 include/acpi/actbl3.h         |  18 ++++-
 include/linux/acpi.h          |   6 ++
 11 files changed, 203 insertions(+), 21 deletions(-)
 create mode 100644 arch/riscv/kernel/acpi_numa.c

-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
