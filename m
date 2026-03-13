Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1698C106FD69
	for <linux-riscv@archiver.kernel.org>; Fri, 13 Mar 2026 02:22:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=z9ln96ljSIfmQtN0c3Qh3nTHtnfeUoKTFiUx7VHoc+g=; b=YsWK0ih3xTP7Oo
	6vWLiOb240jDvBv49j86hckYoRfRLoTJF7TkD/XRJUVUcRXZYiR+YvFeNIJK4L1rq/0XcYx3URxYP
	g8XFlyTDsinVnbJC5oXmFPUGpRZg2Kx23DmaqwWhZVW4ii23+54AfdUPriB6Yr8dcHTduvMNOo/lx
	eYxDSc7Cr8dE6jDTOySU9ouSniTxMegtuaBUGLo29/71yMVFmc9APBOYjUXSP5y87O9MoZ8aWtYsU
	F3y2K4VBEnJ2oySeemjiQidLCSOm+wTDiysrWe9F7Z2jhxSXujNnr4461t/H08JWkG7vN2Y1Yr+z7
	L8JgDTmskgNx+2vTDWpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0sA7-0000000GDWV-1lbD;
	Fri, 13 Mar 2026 02:22:03 +0000
Received: from canpmsgout02.his.huawei.com ([113.46.200.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0sA2-0000000GDTY-3q4O;
	Fri, 13 Mar 2026 02:22:01 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=yK49JnkLKpYBZOqDDiJ5tuFkHdnhSIg09tqBvQIMd28=;
	b=kKHyA/oBTEDBLkGyt6IF5Mfl/9NSCdKjuLiy/HF08xBMphI4nGy1HFAwxMG51XNjBjkBo5mE1
	yjJ8Kunab1b6+Q35VPZpdNjHq9uHYBsa/8T6vWVzXsQpo9LPA6UF2V4Yh93oUHRXBNRvgd2kM7T
	N9D++v+eloU19GgyjqKPnrA=
Received: from mail.maildlp.com (unknown [172.19.162.223])
	by canpmsgout02.his.huawei.com (SkyGuard) with ESMTPS id 4fX7QJ21J1zcb2r;
	Fri, 13 Mar 2026 10:16:24 +0800 (CST)
Received: from kwepemk500009.china.huawei.com (unknown [7.202.194.94])
	by mail.maildlp.com (Postfix) with ESMTPS id B187F40569;
	Fri, 13 Mar 2026 10:21:53 +0800 (CST)
Received: from localhost.localdomain (10.50.163.32) by
 kwepemk500009.china.huawei.com (7.202.194.94) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Fri, 13 Mar 2026 10:21:52 +0800
From: Chengwen Feng <fengchengwen@huawei.com>
To: Bjorn Helgaas <bhelgaas@google.com>, Catalin Marinas
	<catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, "Rafael J .
 Wysocki" <rafael@kernel.org>
CC: Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
	Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>, Paul
 Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
	<aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, Thomas Gleixner
	<tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov
	<bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, <x86@kernel.org>,
	"H . Peter Anvin" <hpa@zytor.com>, Juergen Gross <jgross@suse.com>, Sohil
 Mehta <sohil.mehta@intel.com>, Ilkka Koskinen <ilkka@os.amperecomputing.com>,
	Robin Murphy <robin.murphy@arm.com>, James Clark <james.clark@linaro.org>,
	Besar Wicaksono <bwicaksono@nvidia.com>, Ma Ke <make24@iscas.ac.cn>, Wei
 Huang <wei.huang2@amd.com>, Andy Gospodarek <andrew.gospodarek@broadcom.com>,
	Somnath Kotur <somnath.kotur@broadcom.com>, <kees@kernel.org>,
	<punit.agrawal@oss.qualcomm.com>, <guohanjun@huawei.com>,
	<suzuki.poulose@arm.com>, <ryan.roberts@arm.com>, <chenl311@chinatelecom.cn>,
	<masahiroy@kernel.org>, <wangyuquan1236@phytium.com.cn>,
	<anshuman.khandual@arm.com>, <heinrich.schuchardt@canonical.com>,
	<Eric.VanTassell@amd.com>, <jonathan.cameron@huawei.com>,
	<wangzhou1@hisilicon.com>, <wanghuiqiang@huawei.com>,
	<liuyonglong@huawei.com>, <fengchengwen@huawei.com>,
	<linux-pci@vger.kernel.org>, <linux-doc@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<loongarch@lists.linux.dev>, <linux-riscv@lists.infradead.org>,
	<xen-devel@lists.xenproject.org>, <linux-acpi@vger.kernel.org>,
	<linux-perf-users@vger.kernel.org>, <stable@vger.kernel.org>
Subject: [PATCH v7 3/3] PCI/TPH: Fix get cpu steer-tag fail on ARM64 platform
Date: Fri, 13 Mar 2026 10:21:44 +0800
Message-ID: <20260313022144.40942-4-fengchengwen@huawei.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20260313022144.40942-1-fengchengwen@huawei.com>
References: <20260313022144.40942-1-fengchengwen@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.50.163.32]
X-ClientProxiedBy: kwepems100001.china.huawei.com (7.221.188.238) To
 kwepemk500009.china.huawei.com (7.202.194.94)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260312_192159_578158_022C9CC1 
X-CRM114-Status: GOOD (  19.84  )
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

pcie_tph_get_cpu_st() is broken on ARM64:
1. pcie_tph_get_cpu_st() passes cpu_uid to the PCI ACPI DSM method.
   cpu_uid should be the ACPI Processor UID [1].
2. In BNXT, pcie_tph_get_cpu_st() is passed a cpu_uid obtained via
   cpumask_first(irq->cpu_mask) - the logical CPU ID of a CPU core,
   generated and managed by kernel (e.g., [0,255] for a system  with 256
   logical CPU cores).
3. On ARM64 platforms, ACPI assigns Processor UID to cores listed in the
   MADT table, and this UID may not match the kernel's logical CPU ID.
   When this occurs, the mismatch results in the wrong CPU steer-tag.
4. On AMD x86 the logical CPU ID is identical to the ACPI Processor UID
   so the mismatch is not seen.

Resolution:
1. Use acpi_get_cpu_uid() in pcie_tph_get_cpu_st() to translate from
   logical CPU ID to ACPI Processor UID needed for the DSM call.
2. Rename pcie_tpu_get_cpu_st() parameter from cpu_uid to cpu to
   reflect that it is a logical CPU_ID.

[1] According to ECN_TPH-ST_Revision_20200924
    (https://members.pcisig.com/wg/PCI-SIG/document/15470), the input
    is defined as: "If the target is a processor, then this field
    represents the ACPI Processor UID of the processor as specified in
    the MADT. If the target is a processor container, then this field
    represents the ACPI Processor UID of the processor container as
    specified in the PPTT."

Fixes: d2e8a34876ce ("PCI/TPH: Add Steering Tag support")
Cc: stable@vger.kernel.org
Signed-off-by: Chengwen Feng <fengchengwen@huawei.com>
Reviewed-by: Jonathan Cameron <jonathan.cameron@huawei.com>
---
 Documentation/PCI/tph.rst |  4 ++--
 drivers/pci/tph.c         | 16 +++++++++++-----
 include/linux/pci-tph.h   |  4 ++--
 3 files changed, 15 insertions(+), 9 deletions(-)

diff --git a/Documentation/PCI/tph.rst b/Documentation/PCI/tph.rst
index e8993be64fd6..b6cf22b9bd90 100644
--- a/Documentation/PCI/tph.rst
+++ b/Documentation/PCI/tph.rst
@@ -79,10 +79,10 @@ To retrieve a Steering Tag for a target memory associated with a specific
 CPU, use the following function::
 
   int pcie_tph_get_cpu_st(struct pci_dev *pdev, enum tph_mem_type type,
-                          unsigned int cpu_uid, u16 *tag);
+                          unsigned int cpu, u16 *tag);
 
 The `type` argument is used to specify the memory type, either volatile
-or persistent, of the target memory. The `cpu_uid` argument specifies the
+or persistent, of the target memory. The `cpu` argument specifies the
 CPU where the memory is associated to.
 
 After the ST value is retrieved, the device driver can use the following
diff --git a/drivers/pci/tph.c b/drivers/pci/tph.c
index ca4f97be7538..b67c9ad14bda 100644
--- a/drivers/pci/tph.c
+++ b/drivers/pci/tph.c
@@ -236,21 +236,27 @@ static int write_tag_to_st_table(struct pci_dev *pdev, int index, u16 tag)
  * with a specific CPU
  * @pdev: PCI device
  * @mem_type: target memory type (volatile or persistent RAM)
- * @cpu_uid: associated CPU id
+ * @cpu: associated CPU id
  * @tag: Steering Tag to be returned
  *
  * Return the Steering Tag for a target memory that is associated with a
- * specific CPU as indicated by cpu_uid.
+ * specific CPU as indicated by cpu.
  *
  * Return: 0 if success, otherwise negative value (-errno)
  */
 int pcie_tph_get_cpu_st(struct pci_dev *pdev, enum tph_mem_type mem_type,
-			unsigned int cpu_uid, u16 *tag)
+			unsigned int cpu, u16 *tag)
 {
 #ifdef CONFIG_ACPI
 	struct pci_dev *rp;
 	acpi_handle rp_acpi_handle;
 	union st_info info;
+	u32 cpu_uid;
+	int ret;
+
+	ret = acpi_get_cpu_uid(cpu, &cpu_uid);
+	if (ret != 0)
+		return ret;
 
 	rp = pcie_find_root_port(pdev);
 	if (!rp || !rp->bus || !rp->bus->bridge)
@@ -265,9 +271,9 @@ int pcie_tph_get_cpu_st(struct pci_dev *pdev, enum tph_mem_type mem_type,
 
 	*tag = tph_extract_tag(mem_type, pdev->tph_req_type, &info);
 
-	pci_dbg(pdev, "get steering tag: mem_type=%s, cpu_uid=%d, tag=%#04x\n",
+	pci_dbg(pdev, "get steering tag: mem_type=%s, cpu=%d, tag=%#04x\n",
 		(mem_type == TPH_MEM_TYPE_VM) ? "volatile" : "persistent",
-		cpu_uid, *tag);
+		cpu, *tag);
 
 	return 0;
 #else
diff --git a/include/linux/pci-tph.h b/include/linux/pci-tph.h
index ba28140ce670..be68cd17f2f8 100644
--- a/include/linux/pci-tph.h
+++ b/include/linux/pci-tph.h
@@ -25,7 +25,7 @@ int pcie_tph_set_st_entry(struct pci_dev *pdev,
 			  unsigned int index, u16 tag);
 int pcie_tph_get_cpu_st(struct pci_dev *dev,
 			enum tph_mem_type mem_type,
-			unsigned int cpu_uid, u16 *tag);
+			unsigned int cpu, u16 *tag);
 void pcie_disable_tph(struct pci_dev *pdev);
 int pcie_enable_tph(struct pci_dev *pdev, int mode);
 u16 pcie_tph_get_st_table_size(struct pci_dev *pdev);
@@ -36,7 +36,7 @@ static inline int pcie_tph_set_st_entry(struct pci_dev *pdev,
 { return -EINVAL; }
 static inline int pcie_tph_get_cpu_st(struct pci_dev *dev,
 				      enum tph_mem_type mem_type,
-				      unsigned int cpu_uid, u16 *tag)
+				      unsigned int cpu, u16 *tag)
 { return -EINVAL; }
 static inline void pcie_disable_tph(struct pci_dev *pdev) { }
 static inline int pcie_enable_tph(struct pci_dev *pdev, int mode)
-- 
2.17.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
