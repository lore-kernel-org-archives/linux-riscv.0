Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BD38D3515E
	for <linux-riscv@archiver.kernel.org>; Wed,  1 Apr 2026 08:17:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eRIFWEUrDIZc6ifsfXv+fs/iqV3SW2fJLUKyJLwqStg=; b=VcsyoJgVpySKzO
	jIzxaF+vKnlARdRlX+Z6FwQbMUl4svdiumVoR+CZddD3wRk72xm2SdXCVLSiQdQmw7eqwdGrfRybf
	KL+ZuSTOoBJE7HXAqrKpRSqKJC2Y03LrL1D4LsNyl+r1v5Ts8xxGq/ZUmWwsHwbNm54wGssVuAElq
	4suxIj63in799nswfVV38sV0RrqEUj4ssVErg25x5noEBEPcgLqef3QCz9QRoS6kGIPe8MwHHinmw
	q2tQkfPWvXjxmnHoZT1wNSIo86xBz+QkanFS59mZ2wowvlGHk+s9EDXG7E7m8rRWeps/sQggV5Vj6
	Ie+aD3jakwxOn3Il64IQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7qlI-0000000EHaR-1V0y;
	Wed, 01 Apr 2026 08:17:16 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7qlG-0000000EHYO-1TAH;
	Wed, 01 Apr 2026 08:17:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:MIME-Version:References:
	In-Reply-To:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=ANvjKw/V+x/xgnK84bsEKs2slfuc72S2wtUZ6Ltd7AU=; b=pnih+1J1sCT3rK4rFUYe80ylU1
	H4NWlsto7K2n9/BeImB56UrBvBnqZbLdsAn8zK1TNtsmmJSsk0SVDuDoBQRj0UQv50bKqTEX0Eby0
	Tw6VBDGn6J3inoGd20TWDiLiQcREi4HCRfS0BvHY5ahEBgiQ9WJyIDSlqE9EJpgJ+Wv/gGqOe4tjI
	c7LS1JZFcJSTbYct53TMaJ9D6p6KIGN9x7AyeX6UBgmHnS8LrfdSsPGH4HSPwyG+0K1GEt6eGZcXl
	VuYo2KmpRgoQtni/6awuJntbdh0IISEYC98D7PPTHb2Yr0/TqAbFJ/QwmBRVuBhM4YU5ckuFbMxXh
	tw2oODVA==;
Received: from canpmsgout02.his.huawei.com ([113.46.200.217])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7qlB-0000000HPAm-45WW;
	Wed, 01 Apr 2026 08:17:13 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=ANvjKw/V+x/xgnK84bsEKs2slfuc72S2wtUZ6Ltd7AU=;
	b=gAhZczIG65dC2yh+2aADvwVAp++19t5FyGF4ZzbeSLiKAirv37HFkiFuy/A1lWBlr5MpsM4Ut
	Lnhv1/GDpeZI1w99rpED8gfQlunCOXOTiUjR1yp3rBy23eO6v/Ttq6ZYJsfo+fm/1xgWotDODEb
	YV0jLZY6lrTP0qpYzZ1KoG4=
Received: from mail.maildlp.com (unknown [172.19.162.140])
	by canpmsgout02.his.huawei.com (SkyGuard) with ESMTPS id 4flyNW224WzcZxn;
	Wed,  1 Apr 2026 16:10:51 +0800 (CST)
Received: from kwepemk500009.china.huawei.com (unknown [7.202.194.94])
	by mail.maildlp.com (Postfix) with ESMTPS id BC54C203B2;
	Wed,  1 Apr 2026 16:16:55 +0800 (CST)
Received: from localhost.localdomain (10.50.163.32) by
 kwepemk500009.china.huawei.com (7.202.194.94) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Wed, 1 Apr 2026 16:16:53 +0800
From: Chengwen Feng <fengchengwen@huawei.com>
To: Bjorn Helgaas <bhelgaas@google.com>, Catalin Marinas
	<catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, "Rafael J .
 Wysocki" <rafael@kernel.org>
Subject: [PATCH RESEND v10 5/8] ACPI: Centralize acpi_get_cpu_uid() declaration in include/linux/acpi.h
Date: Wed, 1 Apr 2026 16:16:37 +0800
Message-ID: <20260401081640.26875-6-fengchengwen@huawei.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20260401081640.26875-1-fengchengwen@huawei.com>
References: <20260401081640.26875-1-fengchengwen@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.50.163.32]
X-ClientProxiedBy: kwepems200001.china.huawei.com (7.221.188.67) To
 kwepemk500009.china.huawei.com (7.202.194.94)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260401_091710_786934_68B0B0F7 
X-CRM114-Status: GOOD (  12.15  )
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

Centralize acpi_get_cpu_uid() in include/linux/acpi.h (global scope) and
remove arch-specific declarations from arm64/loongarch/riscv/x86
asm/acpi.h. This unifies the interface across architectures and
simplifies maintenance by eliminating duplicate prototypes.

Cc: stable@vger.kernel.org
Signed-off-by: Chengwen Feng <fengchengwen@huawei.com>
Reviewed-by: Jonathan Cameron <jonathan.cameron@huawei.com>
---
 arch/arm64/include/asm/acpi.h     |  1 -
 arch/loongarch/include/asm/acpi.h |  1 -
 arch/riscv/include/asm/acpi.h     |  1 -
 arch/x86/include/asm/acpi.h       |  2 --
 include/linux/acpi.h              | 11 +++++++++++
 5 files changed, 11 insertions(+), 5 deletions(-)

diff --git a/arch/arm64/include/asm/acpi.h b/arch/arm64/include/asm/acpi.h
index 2219a3301e72..bdb0ecf95b5c 100644
--- a/arch/arm64/include/asm/acpi.h
+++ b/arch/arm64/include/asm/acpi.h
@@ -118,7 +118,6 @@ static inline u32 get_acpi_id_for_cpu(unsigned int cpu)
 {
 	return	acpi_cpu_get_madt_gicc(cpu)->uid;
 }
-int acpi_get_cpu_uid(unsigned int cpu, u32 *uid);
 int get_cpu_for_acpi_id(u32 uid);
 
 static inline void arch_fix_phys_package_id(int num, u32 slot) { }
diff --git a/arch/loongarch/include/asm/acpi.h b/arch/loongarch/include/asm/acpi.h
index 8bb101b4557e..7376840fa9f7 100644
--- a/arch/loongarch/include/asm/acpi.h
+++ b/arch/loongarch/include/asm/acpi.h
@@ -44,7 +44,6 @@ static inline u32 get_acpi_id_for_cpu(unsigned int cpu)
 {
 	return acpi_core_pic[cpu_logical_map(cpu)].processor_id;
 }
-int acpi_get_cpu_uid(unsigned int cpu, u32 *uid);
 
 #endif /* !CONFIG_ACPI */
 
diff --git a/arch/riscv/include/asm/acpi.h b/arch/riscv/include/asm/acpi.h
index f3520cc85af3..6e13695120bc 100644
--- a/arch/riscv/include/asm/acpi.h
+++ b/arch/riscv/include/asm/acpi.h
@@ -65,7 +65,6 @@ static inline u32 get_acpi_id_for_cpu(int cpu)
 {
 	return acpi_cpu_get_madt_rintc(cpu)->uid;
 }
-int acpi_get_cpu_uid(unsigned int cpu, u32 *uid);
 
 int acpi_get_riscv_isa(struct acpi_table_header *table,
 		       unsigned int cpu, const char **isa);
diff --git a/arch/x86/include/asm/acpi.h b/arch/x86/include/asm/acpi.h
index 92b5c27c4fea..a03aa6f999d1 100644
--- a/arch/x86/include/asm/acpi.h
+++ b/arch/x86/include/asm/acpi.h
@@ -157,8 +157,6 @@ static inline bool acpi_has_cpu_in_madt(void)
 	return !!acpi_lapic;
 }
 
-int acpi_get_cpu_uid(unsigned int cpu, u32 *uid);
-
 #define ACPI_HAVE_ARCH_SET_ROOT_POINTER
 static __always_inline void acpi_arch_set_root_pointer(u64 addr)
 {
diff --git a/include/linux/acpi.h b/include/linux/acpi.h
index 4d2f0bed7a06..74a73f0e5944 100644
--- a/include/linux/acpi.h
+++ b/include/linux/acpi.h
@@ -324,6 +324,17 @@ int acpi_unmap_cpu(int cpu);
 
 acpi_handle acpi_get_processor_handle(int cpu);
 
+/**
+ * acpi_get_cpu_uid() - Get ACPI Processor UID of from MADT table
+ * @cpu: Logical CPU number (0-based)
+ * @uid: Pointer to store ACPI Processor UID
+ *
+ * Return: 0 on success (ACPI Processor ID stored in *uid);
+ *         -EINVAL if CPU number is invalid or out of range;
+ *         -ENODEV if ACPI Processor UID for the CPU is not found.
+ */
+int acpi_get_cpu_uid(unsigned int cpu, u32 *uid);
+
 #ifdef CONFIG_ACPI_HOTPLUG_IOAPIC
 int acpi_get_ioapic_id(acpi_handle handle, u32 gsi_base, u64 *phys_addr);
 #endif
-- 
2.17.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
