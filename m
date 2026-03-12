Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54C4FFED2E0
	for <linux-riscv@archiver.kernel.org>; Thu, 12 Mar 2026 07:23:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=G9nda9BZIYjPgPshTawnEODfA6pRSL6ABpu3RCngwpw=; b=NpYH/cNlW9CC1W
	U213Ojv+VuuUeNmXfwJS03l6KT90gwo4kId6pL+48BQDnC2NH9Q3u+dYLvrUCE0SWiz5i5Rctrg/M
	3UA4VTU1oRFY9lAGJR6RbNKsFJRa9wnQ8ugwJZa8fAy1ckX/jG0x1em7R6DDY2A0SCfjHjeb6CjxZ
	XO1T/r8HUhJM/isAVPGzItcfXbGLbi4M3DmAC4YH1ZDYLe2oDarhUSq8S3cKXAl40t74h7U7Y00eM
	WmeZrvem67Yj438/lSOS4z3MopJX15bnChrSXTRvsBdnaQBff9aQItQbDZfS2nmR0t1Rr7TZpoMLm
	4PaJ4MthjRpqC7pa5wcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0aOT-0000000DXU5-3OfJ;
	Thu, 12 Mar 2026 07:23:41 +0000
Received: from canpmsgout08.his.huawei.com ([113.46.200.223])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0aOP-0000000DXS0-2t8P;
	Thu, 12 Mar 2026 07:23:39 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=JWR3I9L7KX8a3aClE88ycMtETglowguHrLZMRqWv8Io=;
	b=rBBmv+LpmD6banh43JS0edaS84dH116/qBok6pLAmwhWmT+MsH/WPIcqF7IxzQwINsFJ6zh0d
	mJIuJoBHbaPglNXiO3Pr3di3NekDdj/t9i9N3QwQMRBtfQLE/3NhfvwJKUgbM+kmEdJgVXGgKaE
	7uxc8NBOtepchaLqk9hHm94=
Received: from mail.maildlp.com (unknown [172.19.163.214])
	by canpmsgout08.his.huawei.com (SkyGuard) with ESMTPS id 4fWf9H3SBhzmV6N;
	Thu, 12 Mar 2026 15:18:27 +0800 (CST)
Received: from kwepemk500009.china.huawei.com (unknown [7.202.194.94])
	by mail.maildlp.com (Postfix) with ESMTPS id 462344056C;
	Thu, 12 Mar 2026 15:23:24 +0800 (CST)
Received: from localhost.localdomain (10.50.163.32) by
 kwepemk500009.china.huawei.com (7.202.194.94) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Thu, 12 Mar 2026 15:23:22 +0800
From: Chengwen Feng <fengchengwen@huawei.com>
To: Bjorn Helgaas <bhelgaas@google.com>, Catalin Marinas
	<catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, "Rafael J .
 Wysocki" <rafael@kernel.org>
Subject: [PATCH v6 0/3] Fix get cpu steer-tag fail on ARM64 platform
Date: Thu, 12 Mar 2026 15:23:13 +0800
Message-ID: <20260312072316.4806-1-fengchengwen@huawei.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [10.50.163.32]
X-ClientProxiedBy: kwepems200001.china.huawei.com (7.221.188.67) To
 kwepemk500009.china.huawei.com (7.202.194.94)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260312_002338_674122_29B6D915 
X-CRM114-Status: GOOD (  12.92  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, x86@kernel.org, liuyonglong@huawei.com, anshuman.khandual@arm.com, linux-doc@vger.kernel.org, Kees Cook <kees@kernel.org>, linux-pci@vger.kernel.org, Dave Hansen <dave.hansen@linux.intel.com>, Eric.VanTassell@amd.com, Somnath Kotur <somnath.kotur@broadcom.com>, Kai Huang <kai.huang@intel.com>, Kevin Loughlin <kevinloughlin@google.com>, punit.agrawal@oss.qualcomm.com, "H . Peter Anvin" <hpa@zytor.com>, Ilkka Koskinen <ilkka@os.amperecomputing.com>, Shuah Khan <skhan@linuxfoundation.org>, WANG Xuerui <kernel@xen0n.name>, linux-acpi@vger.kernel.org, Alexandre Ghiti <alex@ghiti.fr>, Jonathan Corbet <corbet@lwn.net>, masahiroy@kernel.org, Huacai Chen <chenhuacai@kernel.org>, linux-riscv@lists.infradead.org, Thorsten Blum <thorsten.blum@linux.dev>, Peter Zijlstra <peterz@infradead.org>, Pawan Gupta <pawan.kumar.gupta@linux.intel.com>, Yanteng Si <si.yanteng@linux.dev>, xen-devel@lists.xenproject.org, Zheyun Shen <szy0127@sjtu.edu.cn>, Len Brown <lenb@kernel.org>, Tom Lendacky <thomas.lendacky@amd.com>, Thomas Huth <thuth@redhat.com>, Albert Ou <aou@eecs.berkeley.edu>, ryan.roberts@arm.com, "Ahmed S . Darwish" <darwi@linutronix.de>, Ma Ke <make24@iscas.ac.cn>, suzuki.poulose@arm.com, James Clark <james.clark@linaro.org>, Wei Huang <wei.huang2@amd.com>, Besar Wicaksono <bwicaksono@nvidia.com>, Borislav Petkov <bp@alien8.de>, loongarch@lists.linux.dev, Jonathan Cameron <jonathan.cameron@huawei.com>, Sohil Mehta <sohil.mehta@intel.com>, Boris Ostrovsky <boris.ostrovsky@oracle.com>, Xin Li <xin@zytor.com>, Andy Gospodarek <andrew.gospodarek@broadcom.com>, Ingo Molnar <mingo@redhat.com>, wanghuiqiang@huawei.com, Juergen Gross <jgross@suse.com>, wangyuquan1236@phytium.com.cn, Sean Christopherson <seanjc@google.com>, guohanjun@huawei.com, linux-kernel@vger.kernel.org, stable@vger.kernel.org, linux-perf-users@vger.kernel.org, wangzhou1@hisilicon.com, Palmer Dabbelt <palmer@dabbelt.com>, Thomas Gleixner <tglx@kernel.org>, heinrich.schuchardt@canonical.com, chenl311@chinatelecom.cn, Paul Walmsley <pjw@kernel.org>, Robin Murphy <robin.murphy@arm.com>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

This patchset fixes the failure of CPU steer tag retrieval on ARM64
platforms. The series is structured as follows:

1. First commit: Mechanical rename of the ACPI Processor UID retrieval
   interface (no functional changes) to align naming conventions across
   architectures;
2. Second commit: Implement acpi_get_cpu_uid() for the x86 platform to
   complete the unified ACPI Processor UID interface across all
   ACPI-enabled architectures;
3. Third commit: Implement the core fix for the CPU steer tag retrieval
   logic on ARM64 (the root cause of the retrieval failure).

The renaming and x86 implementation lay the groundwork for the unified
ACPI interface required by the ARM64 steer tag fix, ensuring consistent
CPU UID retrieval across architectures before addressing the functional
bug.

---
Changes in v6:
- Rename existing get_acpi_id_for_cpu() to acpi_get_cpu_uid()
- Split x86's modify as one commit

Changes in v5:
- Refine commit-log of commit 2/2
- Replace cpu_acpi_id() by acpi_get_cpu_acpi_id() on x86

Changes in v4:
- Split the rename into a separate commit.

Changes in v3:
- Rename existing get_acpi_id_for_cpu() to acpi_get_cpu_acpi_id() other
  than add one new API.

Changes in v2:
- Add ECN _DSM reference doc name and its URL.
- Separate implement acpi_get_cpu_acpi_id() in each arch which supports
  ACPI.
- Refine commit-log.

Chengwen Feng (2):
  ACPI: Rename get_acpi_id_for_cpu() to acpi_get_cpu_acpi_id() on
    non-x86
  PCI/TPH: Fix get cpu steer-tag fail on ARM64 platform

Chengwen Feng (3):
  ACPI: Rename get_acpi_id_for_cpu() to acpi_get_cpu_uid() on non-x86
  x86: Implement acpi_get_cpu_uid()
  PCI/TPH: Fix get cpu steer-tag fail on ARM64 platform

 Documentation/PCI/tph.rst          |  4 +--
 arch/arm64/include/asm/acpi.h      | 16 +---------
 arch/arm64/kernel/acpi.c           | 16 ++++++++++
 arch/arm64/kernel/acpi_numa.c      | 15 ++++++++++
 arch/loongarch/include/asm/acpi.h  |  5 ----
 arch/loongarch/kernel/acpi.c       |  9 ++++++
 arch/riscv/include/asm/acpi.h      |  4 ---
 arch/riscv/kernel/acpi.c           | 16 ++++++++++
 arch/riscv/kernel/acpi_numa.c      |  8 +++--
 arch/x86/include/asm/cpu.h         |  1 -
 arch/x86/include/asm/smp.h         |  1 -
 arch/x86/kernel/cpu/common.c       | 15 ++++++++++
 arch/x86/xen/enlighten_hvm.c       |  5 ++--
 drivers/acpi/pptt.c                | 47 +++++++++++++++++++++---------
 drivers/acpi/riscv/rhct.c          |  7 ++++-
 drivers/pci/tph.c                  | 16 ++++++----
 drivers/perf/arm_cspmu/arm_cspmu.c |  6 ++--
 include/linux/acpi.h               | 11 +++++++
 include/linux/pci-tph.h            |  4 +--
 19 files changed, 151 insertions(+), 55 deletions(-)

-- 
2.17.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
