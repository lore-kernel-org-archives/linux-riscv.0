Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA186C433EF
	for <linux-riscv@archiver.kernel.org>; Tue, 23 Nov 2021 13:31:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mRqRm+hylzMoBV+aCLxy9eEoyYzlRiXYOYdX4Asirbw=; b=DzpKKT8FWdxXH3
	9rTN0zqV2VUiFw9wE5+iTta4RLRwFyRegxfmi40nRgaknLTx96DbrNZAlh/druiWpPDbKHNEcCVnn
	VcJKpq4DnGD2RaNKy94OokyFH9zty7v3ZgoKr51ExSDHZmZueOF4kmzHJjAOSm1dsn8/mpBjGkQrC
	nGYHDQSIlAVaAlpGwJSeTESd2XC5J9TqE6blS6s2RB6QsI3+PtA5wn7aHIuloRUTnF1I61lBmdHFn
	ps00Ji6mGEMSi6gj99+TNcspwHDn5aYSiB9LGDd9u+lTKBkeQ6b3yFRTDpw/xggC4NP3FJF3Cecyo
	f8P/OPRG1u1WjtKGQPHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mpVss-002O8f-IV; Tue, 23 Nov 2021 13:30:54 +0000
Received: from szxga02-in.huawei.com ([45.249.212.188])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mpVsD-002Nus-Gx
 for linux-riscv@lists.infradead.org; Tue, 23 Nov 2021 13:30:16 +0000
Received: from dggemv703-chm.china.huawei.com (unknown [172.30.72.55])
 by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4Hz4kl6sFhzbj2d;
 Tue, 23 Nov 2021 21:30:07 +0800 (CST)
Received: from kwepemm600003.china.huawei.com (7.193.23.202) by
 dggemv703-chm.china.huawei.com (10.3.19.46) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Tue, 23 Nov 2021 21:30:09 +0800
Received: from huawei.com (10.175.113.32) by kwepemm600003.china.huawei.com
 (7.193.23.202) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.20; Tue, 23 Nov
 2021 21:30:08 +0800
From: Nanyong Sun <sunnanyong@huawei.com>
To: <paul.walmsley@sifive.com>, <palmer@dabbelt.com>, <aou@eecs.berkeley.edu>
CC: <sunnanyong@huawei.com>, <palmerdabbelt@google.com>,
 <wangkefeng.wang@huawei.com>, <anup@brainfault.org>, <alex@ghiti.fr>,
 <jszhang@kernel.org>, <linux-riscv@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>
Subject: [PATCH -next 2/2] riscv/mm: Enable THP migration
Date: Tue, 23 Nov 2021 22:06:38 +0800
Message-ID: <20211123140638.3852400-3-sunnanyong@huawei.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211123140638.3852400-1-sunnanyong@huawei.com>
References: <20211123140638.3852400-1-sunnanyong@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.175.113.32]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 kwepemm600003.china.huawei.com (7.193.23.202)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211123_053013_838420_C4761F39 
X-CRM114-Status: UNSURE (   7.78  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Add two THP helpers required to create PMD migration swap entries,
and enable THP migration via ARCH_ENABLE_THP_MIGRATION. This can
reduce time of THP migration without splitting and guarantee the
migrated pages are still contiguous.

Signed-off-by: Nanyong Sun <sunnanyong@huawei.com>
---
 arch/riscv/Kconfig               | 1 +
 arch/riscv/include/asm/pgtable.h | 5 +++++
 2 files changed, 6 insertions(+)

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index 821252b65f89..7cad1a8e71bf 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -75,6 +75,7 @@ config RISCV
 	select HAVE_ARCH_SECCOMP_FILTER
 	select HAVE_ARCH_TRACEHOOK
 	select HAVE_ARCH_TRANSPARENT_HUGEPAGE if 64BIT && MMU
+	select ARCH_ENABLE_THP_MIGRATION if TRANSPARENT_HUGEPAGE
 	select HAVE_ARCH_THREAD_STRUCT_WHITELIST
 	select HAVE_ARCH_VMAP_STACK if MMU && 64BIT
 	select HAVE_ASM_MODVERSIONS
diff --git a/arch/riscv/include/asm/pgtable.h b/arch/riscv/include/asm/pgtable.h
index 8bb2010f9a25..b9bf51e31adc 100644
--- a/arch/riscv/include/asm/pgtable.h
+++ b/arch/riscv/include/asm/pgtable.h
@@ -649,6 +649,11 @@ static inline pmd_t pmdp_establish(struct vm_area_struct *vma,
 #define __pte_to_swp_entry(pte)	((swp_entry_t) { pte_val(pte) })
 #define __swp_entry_to_pte(x)	((pte_t) { (x).val })
 
+#ifdef CONFIG_ARCH_ENABLE_THP_MIGRATION
+#define __pmd_to_swp_entry(pmd) ((swp_entry_t) { pmd_val(pmd) })
+#define __swp_entry_to_pmd(swp) __pmd((swp).val)
+#endif /* CONFIG_ARCH_ENABLE_THP_MIGRATION */
+
 /*
  * In the RV64 Linux scheme, we give the user half of the virtual-address space
  * and give the kernel the other (upper) half.
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
