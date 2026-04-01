Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0303ED35159
	for <linux-riscv@archiver.kernel.org>; Wed,  1 Apr 2026 08:17:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Am5FC395r5uBfLDkhiMOAsaCC/jL6N6/3MNtQIxv6Vk=; b=PjUY80ILV+Ho5G
	PV9guKOKQFin2ccCnjPqrp33RWi19xuyAQ6trKt2p8VKpMaXhh4PiPGFijWAIzR3dL0/087n/VjnG
	8qdBeg/WZbmvQz78bBTPvL4yTDVNK7drGThjbq8nZz6tJyXSKorMjZ9coYDpTE8iGynpCib7SV/El
	BNr2HmKnslxs5tAX/P3FDFDoOubeWdYGuiEWaDDDeKf8e8RyYV98ITbdaJFFzNOoDhuDd1tEkga4j
	JoiE52I67KVWHyAHDBCE80J56EIIA8to4Z1CeOl4bgPXkPvW2ndbsUeSzdbrCHUcTrVX4xjbCId4K
	FsJ5Tn4yZss9/BCH+9dw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7ql4-0000000EHMp-3KwF;
	Wed, 01 Apr 2026 08:17:02 +0000
Received: from canpmsgout04.his.huawei.com ([113.46.200.219])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7ql1-0000000EHKT-1Ejx;
	Wed, 01 Apr 2026 08:17:01 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=c9AlrYXsxBFF3IzNBDnKrFfgKSQZlOG3wlCt2foyY+Y=;
	b=s0jHWYuxfoxkRN+t4KseYGhpk5P2m2+oPxvld1K2wRhg/xq/KJ6rPLjiy3A+eHJcZDd4LECJR
	hk2c9oJcG9N70ZRCYC/HPCz/7V6gQufIs9IC6ExJohMMFTan9KIJsB7lPAuY/r27HFSh7GQcO9C
	uY27gGt24m7NlqDK+Rfdv9c=
Received: from mail.maildlp.com (unknown [172.19.163.0])
	by canpmsgout04.his.huawei.com (SkyGuard) with ESMTPS id 4flyNC08FCz1prLN;
	Wed,  1 Apr 2026 16:10:35 +0800 (CST)
Received: from kwepemk500009.china.huawei.com (unknown [7.202.194.94])
	by mail.maildlp.com (Postfix) with ESMTPS id 9190740537;
	Wed,  1 Apr 2026 16:16:47 +0800 (CST)
Received: from localhost.localdomain (10.50.163.32) by
 kwepemk500009.china.huawei.com (7.202.194.94) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Wed, 1 Apr 2026 16:16:45 +0800
From: Chengwen Feng <fengchengwen@huawei.com>
To: Bjorn Helgaas <bhelgaas@google.com>, Catalin Marinas
	<catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, "Rafael J .
 Wysocki" <rafael@kernel.org>
Subject: [PATCH RESEND v10 0/8] ACPI: Unify CPU UID interface and fix ARM64 TPH steer-tag issue
Date: Wed, 1 Apr 2026 16:16:32 +0800
Message-ID: <20260401081640.26875-1-fengchengwen@huawei.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [10.50.163.32]
X-ClientProxiedBy: kwepems200001.china.huawei.com (7.221.188.67) To
 kwepemk500009.china.huawei.com (7.202.194.94)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260401_011700_011353_4228ED11 
X-CRM114-Status: GOOD (  10.19  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, x86@kernel.org, liuyonglong@huawei.com, anshuman.khandual@arm.com, linux-doc@vger.kernel.org, Kees Cook <kees@kernel.org>, linux-pci@vger.kernel.org, Dave Hansen <dave.hansen@linux.intel.com>, Eric.VanTassell@amd.com, fengchengwen@huawei.com, Somnath Kotur <somnath.kotur@broadcom.com>, Kai Huang <kai.huang@intel.com>, Kevin Loughlin <kevinloughlin@google.com>, punit.agrawal@oss.qualcomm.com, "H .
 Peter Anvin" <hpa@zytor.com>, Ilkka Koskinen <ilkka@os.amperecomputing.com>, WANG Xuerui <kernel@xen0n.name>, Thorsten Blum <thorsten.blum@linux.dev>, linux-acpi@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>, masahiroy@kernel.org, Yanteng Si <si.yanteng@linux.dev>, linux-riscv@lists.infradead.org, Peter Zijlstra <peterz@infradead.org>, Pawan Gupta <pawan.kumar.gupta@linux.intel.com>, linux-arm-kernel@lists.infradead.org, xen-devel@lists.xenproject.org, Zheyun Shen <szy0127@sjtu.edu.cn>, Len Brown <lenb@kernel.org>, Tom Lendacky <thomas.lendacky@amd.com>, Thomas Huth <thuth@redhat.com>, ryan.roberts@arm.com, "Ahmed S . Darwish" <darwi@linutronix.de>, Ma Ke <make24@iscas.ac.cn>, suzuki.poulose@arm.com, James Clark <james.clark@linaro.org>, Wei Huang <wei.huang2@amd.com>, Besar Wicaksono <bwicaksono@nvidia.com>, loongarch@lists.linux.dev, Jonathan Cameron <jonathan.cameron@huawei.com>, Sohil Mehta <sohil.mehta@intel.com>, Boris Ostrovsky <boris.ostrovsky@oracle.com>, Xin Li <xin@zytor.com>, Andy Gospodarek <andrew.gospodarek@broadcom.com>, wanghuiqiang@huawei.com, Juergen Gross <jgross@suse.com>, wangyuquan1236@phytium.com.cn, Sean Christopherson <seanjc@google.com>, guohanjun@huawei.com, linux-kernel@vger.kernel.org, stable@vger.kernel.org, linux-perf-users@vger.kernel.org, wangzhou1@hisilicon.com, Thomas Gleixner <tglx@kernel.org>, heinrich.schuchardt@canonical.com, chenl311@chinatelecom.cn, Robin Murphy <robin.murphy@arm.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

This patchset unifies ACPI Processor UID retrieval across
arm64/loongarch/riscv/x86 via acpi_get_cpu_uid() (with input validation)
and fixes ARM64 CPU steer-tag retrieval failure in PCI/TPH:

1-4: Add acpi_get_cpu_uid() for arm64/loongarch/riscv/x86 (update
     respective users)
5: Centralize acpi_get_cpu_uid() declaration in include/linux/acpi.h
6: Clean up perf/arm_cspmu
7: Clean up ACPI/PPTT and remove unused get_acpi_id_for_cpu()
8: Pass ACPI Processor UID to Cache Locality _DSM

The interface refactor ensures consistent CPU UID retrieval across
architectures (no functional changes for valid inputs) and provides the
unified interface required for the ARM64 TPH fix

---
Changes in v10-resend:
- Add Catalin's ack-by for arm64 commit
- Add CC to x86@kernel.org

Changes in v10:
- Refine commit header&log according to Punit's and Bjorn's review
- Split perf/arm_cspmu as a separate commit which address Punit's
  review

Changes in v9:
- Address Bjorn's review: split commits to each platform so that make
  them easy to review

Changes in v8:
- Moving arm64's get_cpu_for_acpi_id() to kernel/acpi.c which address
  Jeremy's review

Chengwen Feng (8):
  arm64: acpi: Add acpi_get_cpu_uid() for unified ACPI CPU UID retrieval
  LoongArch: Add acpi_get_cpu_uid() for unified ACPI CPU UID retrieval
  RISC-V: ACPI: Add acpi_get_cpu_uid() for unified ACPI CPU UID
    retrieval
  x86/acpi: Add acpi_get_cpu_uid() for unified ACPI CPU UID retrieval
  ACPI: Centralize acpi_get_cpu_uid() declaration in
    include/linux/acpi.h
  perf: arm_cspmu: Switch to acpi_get_cpu_uid() from
    get_acpi_id_for_cpu()
  ACPI: PPTT: Use acpi_get_cpu_uid() and remove get_acpi_id_for_cpu()
  PCI/TPH: Pass ACPI Processor UID to Cache Locality _DSM

 Documentation/PCI/tph.rst          |  4 +--
 arch/arm64/include/asm/acpi.h      | 17 +---------
 arch/arm64/kernel/acpi.c           | 30 ++++++++++++++++++
 arch/loongarch/include/asm/acpi.h  |  5 ---
 arch/loongarch/kernel/acpi.c       |  9 ++++++
 arch/riscv/include/asm/acpi.h      |  4 ---
 arch/riscv/kernel/acpi.c           | 16 ++++++++++
 arch/riscv/kernel/acpi_numa.c      |  9 ++++--
 arch/x86/include/asm/cpu.h         |  1 -
 arch/x86/include/asm/smp.h         |  1 -
 arch/x86/kernel/acpi/boot.c        | 20 ++++++++++++
 arch/x86/xen/enlighten_hvm.c       |  5 +--
 drivers/acpi/pptt.c                | 50 ++++++++++++++++++++++--------
 drivers/acpi/riscv/rhct.c          |  7 ++++-
 drivers/pci/tph.c                  | 16 +++++++---
 drivers/perf/arm_cspmu/arm_cspmu.c |  6 ++--
 include/linux/acpi.h               | 11 +++++++
 include/linux/pci-tph.h            |  4 +--
 18 files changed, 158 insertions(+), 57 deletions(-)

-- 
2.17.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
