Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5D051093170
	for <linux-riscv@archiver.kernel.org>; Fri, 20 Mar 2026 03:18:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZzyKEHOfB8rLXFZCVh7X9ks6uCYeQQE8VJfOpKm9hnI=; b=ellzgSJwtT8g8H
	JpN93c0u1e4ppFl/1k8wrkjLi064JWHRM8o20fmAx+iZt4RarER4aUuGGKbID0+G+SwmjwEgrrplv
	5Wia8JyY4RTkHZkNT8iM7KhVvl8GEH3kyUbyFziCTMGXxxZqEzNRQ0g6jnuqwYaVGa4HAQhbdQMqZ
	DFxHmpSdYPnS+JlIVgOPW0IVsHw4po7Ic5EmUXzn0eosGMehQ71qkXR5QbVWhodelWjTDlkWOAh0P
	imvvfZW6r6N/j2y29joaxCMYYIdU1zSVyOhlQOFw7qyVGOuJ0/zpk2Vv+Dw3aFBUExbB60zIzRrm6
	GDcFWZLMB1YviT9QeAag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3QN6-0000000ByVd-3lT5;
	Fri, 20 Mar 2026 03:18:00 +0000
Received: from canpmsgout10.his.huawei.com ([113.46.200.225])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3QN0-0000000ByQq-0QjK;
	Fri, 20 Mar 2026 03:17:56 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=BAu9Jx0jggsoB9DdjhBMDzv6GW2fgZQZhQIfabnTV1w=;
	b=0iNno9KssbzJIwOx46kM6OnZNBBxZqavG7rHHC5bdLxsRgIt4sx/XNjUZTTVDZXEoVFcegx0c
	Yif2aSgMI7B+vjuMbgqzpMuvUrJW1SQ8yRstGcNtfNLWFUMM/xjzPhZAjZffDLNoeTFLUbEByDb
	+8fyvzP5gn6CQVDmf4awY48=
Received: from mail.maildlp.com (unknown [172.19.163.214])
	by canpmsgout10.his.huawei.com (SkyGuard) with ESMTPS id 4fcSK00QGxz1K96X;
	Fri, 20 Mar 2026 11:11:48 +0800 (CST)
Received: from kwepemk500009.china.huawei.com (unknown [7.202.194.94])
	by mail.maildlp.com (Postfix) with ESMTPS id 1E5564056C;
	Fri, 20 Mar 2026 11:17:48 +0800 (CST)
Received: from localhost.localdomain (10.50.163.32) by
 kwepemk500009.china.huawei.com (7.202.194.94) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Fri, 20 Mar 2026 11:17:46 +0800
From: Chengwen Feng <fengchengwen@huawei.com>
To: Bjorn Helgaas <bhelgaas@google.com>, Catalin Marinas
	<catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, "Rafael J .
 Wysocki" <rafael@kernel.org>
Subject: [PATCH v10 2/8] LoongArch: Add acpi_get_cpu_uid() for unified ACPI CPU UID retrieval
Date: Fri, 20 Mar 2026 11:17:31 +0800
Message-ID: <20260320031737.35048-3-fengchengwen@huawei.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20260320031737.35048-1-fengchengwen@huawei.com>
References: <20260320031737.35048-1-fengchengwen@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.50.163.32]
X-ClientProxiedBy: kwepems100002.china.huawei.com (7.221.188.206) To
 kwepemk500009.china.huawei.com (7.202.194.94)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260319_201754_480486_1F0C7136 
X-CRM114-Status: UNSURE (   9.72  )
X-CRM114-Notice: Please train this message.
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
loongarch. While at it, add input validation to make the code more
robust.

Cc: stable@vger.kernel.org
Signed-off-by: Chengwen Feng <fengchengwen@huawei.com>
Reviewed-by: Jonathan Cameron <jonathan.cameron@huawei.com>
---
 arch/loongarch/include/asm/acpi.h | 1 +
 arch/loongarch/kernel/acpi.c      | 9 +++++++++
 2 files changed, 10 insertions(+)

diff --git a/arch/loongarch/include/asm/acpi.h b/arch/loongarch/include/asm/acpi.h
index 7376840fa9f7..8bb101b4557e 100644
--- a/arch/loongarch/include/asm/acpi.h
+++ b/arch/loongarch/include/asm/acpi.h
@@ -44,6 +44,7 @@ static inline u32 get_acpi_id_for_cpu(unsigned int cpu)
 {
 	return acpi_core_pic[cpu_logical_map(cpu)].processor_id;
 }
+int acpi_get_cpu_uid(unsigned int cpu, u32 *uid);
 
 #endif /* !CONFIG_ACPI */
 
diff --git a/arch/loongarch/kernel/acpi.c b/arch/loongarch/kernel/acpi.c
index 1367ca759468..058f0dbe8e8f 100644
--- a/arch/loongarch/kernel/acpi.c
+++ b/arch/loongarch/kernel/acpi.c
@@ -385,3 +385,12 @@ int acpi_unmap_cpu(int cpu)
 EXPORT_SYMBOL(acpi_unmap_cpu);
 
 #endif /* CONFIG_ACPI_HOTPLUG_CPU */
+
+int acpi_get_cpu_uid(unsigned int cpu, u32 *uid)
+{
+	if (cpu >= nr_cpu_ids)
+		return -EINVAL;
+	*uid = acpi_core_pic[cpu_logical_map(cpu)].processor_id;
+	return 0;
+}
+EXPORT_SYMBOL_GPL(acpi_get_cpu_uid);
-- 
2.17.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
