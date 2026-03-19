Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B1A51075262
	for <linux-riscv@archiver.kernel.org>; Thu, 19 Mar 2026 06:58:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bFQ2HIMaIwXlOUplmoA4LYM+nPsxRoPH9nU4BQc56Aw=; b=vTZdKISGYGrAz0
	Dcs8vr0xh/IpbcbULQZTmAsadx859KHQ0zy0iD0PymKNc65lNZkVxEQlO13+K0uGN4JsNhIlJdeFh
	LlgPIi4zutbR+v7Pxqh+k1umHcivsKZ6yuuz6qRakx+cwuydnP1fNQsN7PefEAMLXTdhXhKayk+vt
	qQNBX1BrM3kqjsSokPY+c+Qp5RqUYppa9OzkLNNsadw7bLXked+Rs1UJfOPMRepPI+l8rsaynr2r1
	XgC42l1pFqfCqUykgmte6WxXhl7N34JHLsuAqxcLzfEcrStkZspOVxngN4/7s81acsuhrEjoUGkSQ
	v5nvHhwCQ9mRwoK7SJQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w37Ko-0000000A4yG-2zNv;
	Thu, 19 Mar 2026 06:58:22 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w37Kn-0000000A4wo-0c3y;
	Thu, 19 Mar 2026 06:58:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Type:MIME-Version:References:
	In-Reply-To:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=OY+9eLOMu8D6VbbXOJYy45gDVG6RhQRdRz0wVTUZID0=; b=VarKU/dObtTsFA8r0Gjo41xLDw
	jGfXY7DOPLq/wTZdvpkTd3bW7rdkR6uT4rAktTdWeAs2ITn+LRO3qSQS6yxubfcB80/QUZaRS0IsW
	0r/WFP2t7VUq/m8UyemrBF6q4a9ZQuSwf0xiT3jZ+4Lx+v3JKJ2V0LxarG6Bld8Jd8yl0DGC22gq7
	LCZIuhkc+ooSLcdi6vlC2KDxvKRbNIYq60x8tI0ncSLxWgp9hVhZzWt36Fzzudy/c8ayb8IX0bz4F
	AF6gJAc8VBOHDvbGI7yUjd4DEwbEPqxN5c6PgY2Ic56owIPQPvCW9AErVwKzUaCYUtUrll2dUOgML
	4gy2yn3g==;
Received: from canpmsgout05.his.huawei.com ([113.46.200.220])
	by casper.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w37Kj-00000005hQm-49ZC;
	Thu, 19 Mar 2026 06:58:20 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=OY+9eLOMu8D6VbbXOJYy45gDVG6RhQRdRz0wVTUZID0=;
	b=tGsdcrSPQ6/D7kDlywRLputfdp4O3BpSi06NDZOuqDq9RwNCdUmLUny90T52M93qSR0ELt1No
	0x3bYTk6cFBJRi0ff34XzxmQupT2nTllpT0EFZ4LwwYf9jApBTbyR8UDr6ucCdTiLKu6SG7E6Gm
	l+Gf3n5twSKDJEGOWeOXo9w=
Received: from mail.maildlp.com (unknown [172.19.162.144])
	by canpmsgout05.his.huawei.com (SkyGuard) with ESMTPS id 4fbxFr4DTPz12LDD;
	Thu, 19 Mar 2026 14:52:16 +0800 (CST)
Received: from kwepemk500009.china.huawei.com (unknown [7.202.194.94])
	by mail.maildlp.com (Postfix) with ESMTPS id 6A5D340538;
	Thu, 19 Mar 2026 14:57:47 +0800 (CST)
Received: from localhost.localdomain (10.50.163.32) by
 kwepemk500009.china.huawei.com (7.202.194.94) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Thu, 19 Mar 2026 14:57:45 +0800
From: Chengwen Feng <fengchengwen@huawei.com>
To: Bjorn Helgaas <bhelgaas@google.com>, Catalin Marinas
	<catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, "Rafael J .
 Wysocki" <rafael@kernel.org>
Subject: [PATCH v9 2/7] loongarch/acpi: Add acpi_get_cpu_uid() declaration and implementation
Date: Thu, 19 Mar 2026 14:57:30 +0800
Message-ID: <20260319065735.45954-3-fengchengwen@huawei.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20260319065735.45954-1-fengchengwen@huawei.com>
References: <20260319065735.45954-1-fengchengwen@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.50.163.32]
X-ClientProxiedBy: kwepems100001.china.huawei.com (7.221.188.238) To
 kwepemk500009.china.huawei.com (7.202.194.94)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260319_065818_591882_833E2687 
X-CRM114-Status: GOOD (  13.76  )
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

Add arch-specific acpi_get_cpu_uid() for loongarch:
- Declare acpi_get_cpu_uid() in arch/loongarch/include/asm/acpi.h
- Implement acpi_get_cpu_uid() with input parameter validation

Align loongarch with the new unified ACPI CPU UID retrieval interface,
preparing for replacement of the legacy get_acpi_id_for_cpu() (to be
removed in follow-up patches).

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
