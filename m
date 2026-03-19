Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F559107526D
	for <linux-riscv@archiver.kernel.org>; Thu, 19 Mar 2026 06:58:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jgmFXq/eN5zGe9p/WpaTNrUMLJ9B7i1ds0DpiuofcWg=; b=0x51Io3SISYJZQ
	aK69489lk0pOti+6I0fG4oQQn87W2c2YpA2TlmaQbX46nZY36kty8FtAGwNPgeQdD4jAwVruM+LBH
	NOm9AF47QNMIZEt3kjKnPyypMlcZDX1L86UZpuD9AxIzToTnb6zLPMCmU7KJPeG2XSa4IrA9x9chn
	dGWZjGb6gINrLtpjXzHfCpSndjQdrST5xsEyyLmvedIdAaV0xk1FmZy8+OoXgs5ggKuCdaBaEB5cN
	1WsWIf0gBnqmPNh5+LDq5gWQ6tj0iwg2mRMmGPBxtSFOrsn1sJrUizm+shgEaEJIsPBtgCbFUdC1s
	Efn1knxBItEGslRMHBzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w37Kc-0000000A4qX-0mgY;
	Thu, 19 Mar 2026 06:58:10 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w37KZ-0000000A4qH-423L;
	Thu, 19 Mar 2026 06:58:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:MIME-Version:References:
	In-Reply-To:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=exD33k43BuQzAEL6nsjKEJKqL7EfNu0IQKwl4k+YbJg=; b=Sqd1irdb3zIHxqMVkajvaEzZka
	KGeKF5l/M1LQAv6bzQuSj8kng5JH8l6HqqGWe2WzZh2zjUouS47LTYelnMaUmvePKDVJ0LxE7wQlo
	aAOvmNR3AL7bWjPB1o+gQY887UnNu3LIjgSjBysyET8WyCwekozFvaBbQe9A1Ika8b/OxoL2ysmbV
	Z9R0sW574i3cb5Zin4xQhKpJ2zAneM1vZ6tTI6s+Qi+0xFB9Bgi6c3vRZbnNc4ZM+vPqKVZhDwSiZ
	14CfAyIpAzRLY145+GVRXh700WfZbKKppYz3PBIIh0WMRzCdIzjSRutin5DbaaYyitO9TG3/1X3fb
	uu9qQW8A==;
Received: from canpmsgout10.his.huawei.com ([113.46.200.225])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w37KW-0000000Cs7I-148L;
	Thu, 19 Mar 2026 06:58:06 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=exD33k43BuQzAEL6nsjKEJKqL7EfNu0IQKwl4k+YbJg=;
	b=TpkbNgrXuFHMaoSxLqV9Sehh2jyBNhzuFTjk04digWx+iZ4u7r0ZO97pTwpdiOPz3O6n3lNJ/
	4V3t97Mi4HDOAvKqXG7pd8g0EWINQftSU1qn9BC94Y+G026NOS1ZPVoH/xNOselntlRacsW/mDN
	uHBm/USFU8RvNhGQhD/mcZg=
Received: from mail.maildlp.com (unknown [172.19.163.214])
	by canpmsgout10.his.huawei.com (SkyGuard) with ESMTPS id 4fbxFK6m2wz1K9Bp;
	Thu, 19 Mar 2026 14:51:49 +0800 (CST)
Received: from kwepemk500009.china.huawei.com (unknown [7.202.194.94])
	by mail.maildlp.com (Postfix) with ESMTPS id 7856240561;
	Thu, 19 Mar 2026 14:57:49 +0800 (CST)
Received: from localhost.localdomain (10.50.163.32) by
 kwepemk500009.china.huawei.com (7.202.194.94) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Thu, 19 Mar 2026 14:57:47 +0800
From: Chengwen Feng <fengchengwen@huawei.com>
To: Bjorn Helgaas <bhelgaas@google.com>, Catalin Marinas
	<catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, "Rafael J .
 Wysocki" <rafael@kernel.org>
Subject: [PATCH v9 3/7] riscv/acpi: Add acpi_get_cpu_uid() implementation and update users
Date: Thu, 19 Mar 2026 14:57:31 +0800
Message-ID: <20260319065735.45954-4-fengchengwen@huawei.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20260319065735.45954-1-fengchengwen@huawei.com>
References: <20260319065735.45954-1-fengchengwen@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.50.163.32]
X-ClientProxiedBy: kwepems100001.china.huawei.com (7.221.188.238) To
 kwepemk500009.china.huawei.com (7.202.194.94)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260319_065804_960868_B8A680C2 
X-CRM114-Status: GOOD (  16.85  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, x86@kernel.org, liuyonglong@huawei.com, anshuman.khandual@arm.com, linux-doc@vger.kernel.org, Kees Cook <kees@kernel.org>, linux-pci@vger.kernel.org, Dave Hansen <dave.hansen@linux.intel.com>, Eric.VanTassell@amd.com, fengchengwen@huawei.com, Somnath Kotur <somnath.kotur@broadcom.com>, Kai Huang <kai.huang@intel.com>, Kevin Loughlin <kevinloughlin@google.com>, punit.agrawal@oss.qualcomm.com, "H . Peter Anvin" <hpa@zytor.com>, Ilkka Koskinen <ilkka@os.amperecomputing.com>, Shuah Khan <skhan@linuxfoundation.org>, WANG Xuerui <kernel@xen0n.name>, linux-acpi@vger.kernel.org, Alexandre Ghiti <alex@ghiti.fr>, Jonathan Corbet <corbet@lwn.net>, masahiroy@kernel.org, Huacai Chen <chenhuacai@kernel.org>, linux-riscv@lists.infradead.org, Thorsten Blum <thorsten.blum@linux.dev>, Peter Zijlstra <peterz@infradead.org>, Pawan Gupta <pawan.kumar.gupta@linux.intel.com>, Yanteng Si <si.yanteng@linux.dev>, xen-devel@lists.xenproject.org, Zheyun Shen <szy0127@sjtu.edu.cn>, Len Brown <lenb@kernel.org>, Tom Lendacky <thomas.lendacky@amd.com>, Thomas Huth <thuth@redhat.com>, Albert Ou <aou@eecs.berkeley.edu>, ryan.roberts@arm.com, "Ahmed S . Darwish" <darwi@linutronix.de>, Ma Ke <make24@iscas.ac.cn>, suzuki.poulose@arm.com, James Clark <james.clark@linaro.org>, Wei Huang <wei.huang2@amd.com>, Besar Wicaksono <bwicaksono@nvidia.com>, Borislav Petkov <bp@alien8.de>, loongarch@lists.linux.dev, Jonathan Cameron <jonathan.cameron@huawei.com>, Sohil Mehta <sohil.mehta@intel.com>, Boris Ostrovsky <boris.ostrovsky@oracle.com>, Xin Li <xin@zytor.com>, Andy Gospodarek <andrew.gospodarek@broadcom.com>, Ingo Molnar <mingo@redhat.com>, wanghuiqiang@huawei.com, Juergen Gross <jgross@suse.com>, wangyuquan1236@phytium.com.cn, Sean Christopherson <seanjc@google.com>, guohanjun@huawei.com, linux-kernel@vger.kernel.org, stable@vger.kernel.org, linux-perf-users@vger.kernel.org, wangzhou1@hisilicon.com, Palmer Dabbelt <palmer@dabbelt.com>, Thomas Gleixner <tglx@kernel.org>, heinrich.schuchardt@canonical.com, chenl311@chinatelecom.cn, Paul Walmsley <pjw@kernel.org>, Robin Murphy <robin.murphy@arm.com>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Add arch-specific acpi_get_cpu_uid() for riscv:
- Declare acpi_get_cpu_uid() in arch/riscv/include/asm/acpi.h
- Implement acpi_get_cpu_uid() with input parameter validation
- Switch rhct.c and arch/riscv/kernel/acpi_numa.c to use
  acpi_get_cpu_uid() instead of get_acpi_id_for_cpu()

This aligns riscv with the unified ACPI CPU UID interface, improving
input validation and consistency across ACPI-enabled platforms.

Cc: stable@vger.kernel.org
Signed-off-by: Chengwen Feng <fengchengwen@huawei.com>
Reviewed-by: Jonathan Cameron <jonathan.cameron@huawei.com>
---
 arch/riscv/include/asm/acpi.h |  1 +
 arch/riscv/kernel/acpi.c      | 16 ++++++++++++++++
 arch/riscv/kernel/acpi_numa.c |  9 ++++++---
 drivers/acpi/riscv/rhct.c     |  7 ++++++-
 4 files changed, 29 insertions(+), 4 deletions(-)

diff --git a/arch/riscv/include/asm/acpi.h b/arch/riscv/include/asm/acpi.h
index 6e13695120bc..f3520cc85af3 100644
--- a/arch/riscv/include/asm/acpi.h
+++ b/arch/riscv/include/asm/acpi.h
@@ -65,6 +65,7 @@ static inline u32 get_acpi_id_for_cpu(int cpu)
 {
 	return acpi_cpu_get_madt_rintc(cpu)->uid;
 }
+int acpi_get_cpu_uid(unsigned int cpu, u32 *uid);
 
 int acpi_get_riscv_isa(struct acpi_table_header *table,
 		       unsigned int cpu, const char **isa);
diff --git a/arch/riscv/kernel/acpi.c b/arch/riscv/kernel/acpi.c
index 71698ee11621..322ea92aa39f 100644
--- a/arch/riscv/kernel/acpi.c
+++ b/arch/riscv/kernel/acpi.c
@@ -337,3 +337,19 @@ int raw_pci_write(unsigned int domain, unsigned int bus,
 }
 
 #endif	/* CONFIG_PCI */
+
+int acpi_get_cpu_uid(unsigned int cpu, u32 *uid)
+{
+	struct acpi_madt_rintc *rintc;
+
+	if (cpu >= nr_cpu_ids)
+		return -EINVAL;
+
+	rintc = acpi_cpu_get_madt_rintc(cpu);
+	if (!rintc)
+		return -ENODEV;
+
+	*uid = rintc->uid;
+	return 0;
+}
+EXPORT_SYMBOL_GPL(acpi_get_cpu_uid);
diff --git a/arch/riscv/kernel/acpi_numa.c b/arch/riscv/kernel/acpi_numa.c
index 130769e3a99c..6a2d4289f806 100644
--- a/arch/riscv/kernel/acpi_numa.c
+++ b/arch/riscv/kernel/acpi_numa.c
@@ -37,11 +37,14 @@ static int __init acpi_numa_get_nid(unsigned int cpu)
 
 static inline int get_cpu_for_acpi_id(u32 uid)
 {
-	int cpu;
+	u32 cpu_uid;
+	int ret;
 
-	for (cpu = 0; cpu < nr_cpu_ids; cpu++)
-		if (uid == get_acpi_id_for_cpu(cpu))
+	for (int cpu = 0; cpu < nr_cpu_ids; cpu++) {
+		ret = acpi_get_cpu_uid(cpu, &cpu_uid);
+		if (ret == 0 && uid == cpu_uid)
 			return cpu;
+	}
 
 	return -EINVAL;
 }
diff --git a/drivers/acpi/riscv/rhct.c b/drivers/acpi/riscv/rhct.c
index caa2c16e1697..8f3f38c64a88 100644
--- a/drivers/acpi/riscv/rhct.c
+++ b/drivers/acpi/riscv/rhct.c
@@ -44,10 +44,15 @@ int acpi_get_riscv_isa(struct acpi_table_header *table, unsigned int cpu, const
 	struct acpi_rhct_isa_string *isa_node;
 	struct acpi_table_rhct *rhct;
 	u32 *hart_info_node_offset;
-	u32 acpi_cpu_id = get_acpi_id_for_cpu(cpu);
+	u32 acpi_cpu_id;
+	int ret;
 
 	BUG_ON(acpi_disabled);
 
+	ret = acpi_get_cpu_uid(cpu, &acpi_cpu_id);
+	if (ret != 0)
+		return ret;
+
 	if (!table) {
 		rhct = acpi_get_rhct();
 		if (!rhct)
-- 
2.17.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
