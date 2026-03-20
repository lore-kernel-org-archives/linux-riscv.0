Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C0191093172
	for <linux-riscv@archiver.kernel.org>; Fri, 20 Mar 2026 03:18:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ACH46kjjAl87NrLaDEVbSYvctCHP2V7mi3bVbHhxTLg=; b=MEaO40uUsmbPXm
	bH+K4jW7Uywy4EzyXtFoi0q99AxrnXCBZhks2FjKA/aU7hV0nEG5nv3OqR3EaREEof1kP7YEOb3Sa
	W/3mxOXXia0ChZQoV3A1AHeMhatA20OKTcELWgCuutFYoC0Xv5POkFAbaH14yJ3jODwFDLYVpjJL0
	gwpT+ATI2IQzpjcqAlx1ibI6WsGLdh/l9qTusWcL/2n4CN9/ELYHx/9gpFalF/ucS5EIvvIcQKs4g
	CUb6dxDj5HyUOFZXEhnZX0uvRZOqTCrUQqS8R9b5lLAj8PgsH4crms3EfuKmKMixAgU4OSG904pE2
	h/ayKf59v0AZRlL2lAFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3QN3-0000000BySQ-0hUs;
	Fri, 20 Mar 2026 03:17:57 +0000
Received: from canpmsgout01.his.huawei.com ([113.46.200.216])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3QMz-0000000ByQv-30J8;
	Fri, 20 Mar 2026 03:17:55 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=iz8YIEZdONKZjhVUadBKtisgs3GnBKQW890wI7E2K40=;
	b=JkiHQ4POUePhg6nVnn7KYCDnENz7SLcoof0mOjF3SuSUq8iuNklW2rhRA5lGQFfksKsKg/CJB
	fgMOjIFrgZCX9KAxkrsIaVclooF0P9jJSHtGkT9OJDkVde3FzBSqg1oVyD4JQp6fGM3G+LNl1gU
	iaDtpnWu2OjsLqrqB35ybCc=
Received: from mail.maildlp.com (unknown [172.19.162.140])
	by canpmsgout01.his.huawei.com (SkyGuard) with ESMTPS id 4fcSKf63Y8z1T4Fg;
	Fri, 20 Mar 2026 11:12:22 +0800 (CST)
Received: from kwepemk500009.china.huawei.com (unknown [7.202.194.94])
	by mail.maildlp.com (Postfix) with ESMTPS id 832D62012A;
	Fri, 20 Mar 2026 11:17:46 +0800 (CST)
Received: from localhost.localdomain (10.50.163.32) by
 kwepemk500009.china.huawei.com (7.202.194.94) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Fri, 20 Mar 2026 11:17:44 +0800
From: Chengwen Feng <fengchengwen@huawei.com>
To: Bjorn Helgaas <bhelgaas@google.com>, Catalin Marinas
	<catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, "Rafael J .
 Wysocki" <rafael@kernel.org>
Subject: [PATCH v10 1/8] arm64: acpi: Add acpi_get_cpu_uid() for unified ACPI CPU UID retrieval
Date: Fri, 20 Mar 2026 11:17:30 +0800
Message-ID: <20260320031737.35048-2-fengchengwen@huawei.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20260320031737.35048-1-fengchengwen@huawei.com>
References: <20260320031737.35048-1-fengchengwen@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.50.163.32]
X-ClientProxiedBy: kwepems100002.china.huawei.com (7.221.188.206) To
 kwepemk500009.china.huawei.com (7.202.194.94)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260319_201754_074414_8B375BD0 
X-CRM114-Status: GOOD (  13.39  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, liuyonglong@huawei.com, anshuman.khandual@arm.com, linux-doc@vger.kernel.org, Kees Cook <kees@kernel.org>, linux-pci@vger.kernel.org, guohanjun@huawei.com, Eric.VanTassell@amd.com, fengchengwen@huawei.com, Somnath Kotur <somnath.kotur@broadcom.com>, Kai Huang <kai.huang@intel.com>, Kevin Loughlin <kevinloughlin@google.com>, punit.agrawal@oss.qualcomm.com, "H . Peter Anvin" <hpa@zytor.com>, Ilkka Koskinen <ilkka@os.amperecomputing.com>, linux-riscv@lists.infradead.org, Thorsten Blum <thorsten.blum@linux.dev>, linux-acpi@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>, masahiroy@kernel.org, Yanteng Si <si.yanteng@linux.dev>, Peter Zijlstra <peterz@infradead.org>, Pawan Gupta <pawan.kumar.gupta@linux.intel.com>, linux-arm-kernel@lists.infradead.org, xen-devel@lists.xenproject.org, Zheyun Shen <szy0127@sjtu.edu.cn>, Len Brown <lenb@kernel.org>, Tom Lendacky <thomas.lendacky@amd.com>, Thomas Huth <thuth@redhat.com>, ryan.roberts@arm.com, "Ahmed S . Darwish" <darwi@linutronix.de>, Ma Ke <make24@iscas.ac.cn>, suzuki.poulose@arm.com, James Clark <james.clark@linaro.org>, Wei Huang <wei.huang2@amd.com>, Besar Wicaksono <bwicaksono@nvidia.com>, Borislav Petkov <bp@alien8.de>, loongarch@lists.linux.dev, Jonathan Cameron <jonathan.cameron@huawei.com>, Sohil Mehta <sohil.mehta@intel.com>, Boris Ostrovsky <boris.ostrovsky@oracle.com>, Xin Li <xin@zytor.com>, Andy Gospodarek <andrew.gospodarek@broadcom.com>, wanghuiqiang@huawei.com, Juergen Gross <jgross@suse.com>, wangyuquan1236@phytium.com.cn, Sean Christopherson <seanjc@google.com>, linux-kernel@vger.kernel.org, stable@vger.kernel.org, linux-perf-users@vger.kernel.org, wangzhou1@hisilicon.com, Palmer Dabbelt <palmer@dabbelt.com>, heinrich.schuchardt@canonical.com, chenl311@chinatelecom.cn, Robin Murphy <robin.murphy@arm.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

As a step towards unifying the interface for retrieving ACPI CPU UID
across architectures, introduce a new function acpi_get_cpu_uid() for
arm64. While at it, add input validation to make the code more robust.

Reimplement get_cpu_for_acpi_id() based on acpi_get_cpu_uid() for
consistency, and move its implementation next to the new function for
code coherence.

Cc: stable@vger.kernel.org
Signed-off-by: Chengwen Feng <fengchengwen@huawei.com>
Reviewed-by: Jonathan Cameron <jonathan.cameron@huawei.com>
---
 arch/arm64/include/asm/acpi.h | 14 ++------------
 arch/arm64/kernel/acpi.c      | 30 ++++++++++++++++++++++++++++++
 2 files changed, 32 insertions(+), 12 deletions(-)

diff --git a/arch/arm64/include/asm/acpi.h b/arch/arm64/include/asm/acpi.h
index c07a58b96329..2219a3301e72 100644
--- a/arch/arm64/include/asm/acpi.h
+++ b/arch/arm64/include/asm/acpi.h
@@ -118,18 +118,8 @@ static inline u32 get_acpi_id_for_cpu(unsigned int cpu)
 {
 	return	acpi_cpu_get_madt_gicc(cpu)->uid;
 }
-
-static inline int get_cpu_for_acpi_id(u32 uid)
-{
-	int cpu;
-
-	for (cpu = 0; cpu < nr_cpu_ids; cpu++)
-		if (acpi_cpu_get_madt_gicc(cpu) &&
-		    uid == get_acpi_id_for_cpu(cpu))
-			return cpu;
-
-	return -EINVAL;
-}
+int acpi_get_cpu_uid(unsigned int cpu, u32 *uid);
+int get_cpu_for_acpi_id(u32 uid);
 
 static inline void arch_fix_phys_package_id(int num, u32 slot) { }
 void __init acpi_init_cpus(void);
diff --git a/arch/arm64/kernel/acpi.c b/arch/arm64/kernel/acpi.c
index af90128cfed5..24b9d934be54 100644
--- a/arch/arm64/kernel/acpi.c
+++ b/arch/arm64/kernel/acpi.c
@@ -458,3 +458,33 @@ int acpi_unmap_cpu(int cpu)
 }
 EXPORT_SYMBOL(acpi_unmap_cpu);
 #endif /* CONFIG_ACPI_HOTPLUG_CPU */
+
+int acpi_get_cpu_uid(unsigned int cpu, u32 *uid)
+{
+	struct acpi_madt_generic_interrupt *gicc;
+
+	if (cpu >= nr_cpu_ids)
+		return -EINVAL;
+
+	gicc = acpi_cpu_get_madt_gicc(cpu);
+	if (!gicc)
+		return -ENODEV;
+
+	*uid = gicc->uid;
+	return 0;
+}
+EXPORT_SYMBOL_GPL(acpi_get_cpu_uid);
+
+int get_cpu_for_acpi_id(u32 uid)
+{
+	u32 cpu_uid;
+	int ret;
+
+	for (int cpu = 0; cpu < nr_cpu_ids; cpu++) {
+		ret = acpi_get_cpu_uid(cpu, &cpu_uid);
+		if (ret == 0 && uid == cpu_uid)
+			return cpu;
+	}
+
+	return -EINVAL;
+}
-- 
2.17.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
