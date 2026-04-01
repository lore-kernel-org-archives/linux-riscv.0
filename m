Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 074FED35159
	for <linux-riscv@archiver.kernel.org>; Wed,  1 Apr 2026 08:17:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Xm19wtUONa8OaaIalBC7jHcDrK5CGmQT1ye3eZEf5lo=; b=yWnnRPoOD6kL6p
	78co/d3Vu9JEKE6kVHaWD9nfr7z/FP8iA26iSLTEnavlt8p/5bie9OhW41FGFqDu/1XVh1BUg7s7C
	1XmJF7vYan6AvDSu8yOy0evkMstX3E3heG8xZT//ukMM2TSuHGNdfkUrxt8Vo3SZjHECGjXAxiT88
	1z2ovGKqIIwoRArvsqYVPYrIuuguAxdLzOOPWLhM1u265+c9j6Ge9MhrDDe7D7nI6YhntJVHhI3jw
	7IP+0LtOHDaBThQ8Vq5NswjXcLRRDgVUPGoXAKn6sB48WENiBLT4oOe1eww60NDJ5Pt7FCTydn5mc
	f2ve3gS3J8OlW4aRfcEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7qlC-0000000EHUK-1sxG;
	Wed, 01 Apr 2026 08:17:10 +0000
Received: from canpmsgout05.his.huawei.com ([113.46.200.220])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7ql7-0000000EHNk-3vT3;
	Wed, 01 Apr 2026 08:17:07 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=hE9w7JoPF7q5rCf6KhhEJWJqCptovuDZd/Iy/+tLfKo=;
	b=qLgUdTXyB2huFMYWwsBs6yJ/F+9lt0zGJ2NBn+WC66I23Xw4lD/MYLZdp/AaESL9MDwbvh4PG
	4g/cCYoR/67GmTbgs1X5afshxewzUwAWGLnOlgBOHKQjEtF2bK4P57/PDC46EmJDfRwKl3h1FiZ
	k+9EKAAKSPQbPzHjYnS4Cu4=
Received: from mail.maildlp.com (unknown [172.19.163.0])
	by canpmsgout05.his.huawei.com (SkyGuard) with ESMTPS id 4flyPP34Mzz12LG4;
	Wed,  1 Apr 2026 16:11:37 +0800 (CST)
Received: from kwepemk500009.china.huawei.com (unknown [7.202.194.94])
	by mail.maildlp.com (Postfix) with ESMTPS id B64C540537;
	Wed,  1 Apr 2026 16:17:00 +0800 (CST)
Received: from localhost.localdomain (10.50.163.32) by
 kwepemk500009.china.huawei.com (7.202.194.94) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Wed, 1 Apr 2026 16:16:58 +0800
From: Chengwen Feng <fengchengwen@huawei.com>
To: Bjorn Helgaas <bhelgaas@google.com>, Catalin Marinas
	<catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, "Rafael J .
 Wysocki" <rafael@kernel.org>
Subject: [PATCH RESEND v10 8/8] PCI/TPH: Pass ACPI Processor UID to Cache Locality _DSM
Date: Wed, 1 Apr 2026 16:16:40 +0800
Message-ID: <20260401081640.26875-9-fengchengwen@huawei.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20260401081640.26875-1-fengchengwen@huawei.com>
References: <20260401081640.26875-1-fengchengwen@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.50.163.32]
X-ClientProxiedBy: kwepems200001.china.huawei.com (7.221.188.67) To
 kwepemk500009.china.huawei.com (7.202.194.94)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260401_011706_341072_A65B3CAE 
X-CRM114-Status: GOOD (  19.59  )
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

pcie_tph_get_cpu_st() uses the Query Cache Locality Features _DSM [1]
to retrieve the TPH Steering Tag for memory associated with the CPU
identified by its "cpu_uid" parameter, a Linux logical CPU ID.

The _DSM requires an ACPI Processor UID, which pcie_tph_get_cpu_st()
previously assumed was the same as the Linux logical CPU ID. This is
true on x86 but not on arm64, so pcie_tph_get_cpu_st() returned the
wrong Steering Tag, resulting in incorrect TPH functionality on arm64.

Convert the Linux logical CPU ID to the ACPI Processor UID with
acpi_get_cpu_uid() before passing it to the _DSM. Additionally, rename
the pcie_tph_get_cpu_st() parameter from "cpu_uid" to "cpu" to reflect
that it represents a logical CPU ID (not an ACPI Processor UID).

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
Reviewed-by: Bjorn Helgaas <bhelgaas@google.com>
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
