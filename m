Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1692BC433EF
	for <linux-riscv@archiver.kernel.org>; Tue,  7 Jun 2022 09:34:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=z7zB0exDVZpZGsxnxDy1JALeymDeqPIyxhhYGet6Fqo=; b=0NdlC+YZPe9aCy
	VxHVWRH+qAlrdvgOGiMvRaFeqmQy6qI1VtIT3VIsrF2eNj+1JuYVvwe90pzCj7NZKbn+7MkiTzIeT
	75n1y0t2orBqVSHOas+aXu4qIPTVYZuVisH75HV3j+NWXmYr2mAjDfIod7fSdWmp3cTDFIiq5dJkZ
	Hk+7VgV+rglZkP9GBoG78ZNXOeeIh/AKPkzM6Ehw3k0f2Fg971R5p9TL6kM1++RPgMLQSZkjBzS39
	858QPdWLBfwrLWq00vUHbJnSkQ6VF/eHrAY1F8WOAmVaO+h20gXwq8uMa8OBa2bpfm7Kmzp4INuJx
	g9ktqB+DWgZYpPE2C+Tg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nyVb3-006GNd-V7; Tue, 07 Jun 2022 09:33:57 +0000
Received: from szxga01-in.huawei.com ([45.249.212.187])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nyVKW-0068TY-HR; Tue, 07 Jun 2022 09:17:06 +0000
Received: from dggpemm500021.china.huawei.com (unknown [172.30.72.54])
	by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4LHPps2DC1zjdbL;
	Tue,  7 Jun 2022 17:15:49 +0800 (CST)
Received: from dggpemm500014.china.huawei.com (7.185.36.153) by
 dggpemm500021.china.huawei.com (7.185.36.109) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Tue, 7 Jun 2022 17:16:45 +0800
Received: from localhost.localdomain (10.175.112.125) by
 dggpemm500014.china.huawei.com (7.185.36.153) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Tue, 7 Jun 2022 17:16:44 +0800
From: Wupeng Ma <mawupeng1@huawei.com>
To: <corbet@lwn.net>, <will@kernel.org>, <ardb@kernel.org>,
	<catalin.marinas@arm.com>
CC: <tglx@linutronix.de>, <mingo@redhat.com>, <bp@alien8.de>,
	<dave.hansen@linux.intel.com>, <x86@kernel.org>, <hpa@zytor.com>,
	<dvhart@infradead.org>, <andy@infradead.org>, <rppt@kernel.org>,
	<akpm@linux-foundation.org>, <paul.walmsley@sifive.com>,
	<palmer@dabbelt.com>, <aou@eecs.berkeley.edu>, <paulmck@kernel.org>,
	<keescook@chromium.org>, <songmuchun@bytedance.com>, <rdunlap@infradead.org>,
	<damien.lemoal@opensource.wdc.com>, <swboyd@chromium.org>,
	<wei.liu@kernel.org>, <robin.murphy@arm.com>, <david@redhat.com>,
	<mawupeng1@huawei.com>, <anshuman.khandual@arm.com>,
	<thunder.leizhen@huawei.com>, <wangkefeng.wang@huawei.com>,
	<gpiccoli@igalia.com>, <chenhuacai@kernel.org>, <geert@linux-m68k.org>,
	<chenzhou10@huawei.com>, <vijayb@linux.microsoft.com>,
	<linux-doc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-efi@vger.kernel.org>,
	<platform-driver-x86@vger.kernel.org>, <linux-mm@kvack.org>,
	<linux-riscv@lists.infradead.org>
Subject: [PATCH v3 2/6] arm64/mirror: arm64 enabling - find mirrored memory ranges
Date: Tue, 7 Jun 2022 17:38:01 +0800
Message-ID: <20220607093805.1354256-3-mawupeng1@huawei.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220607093805.1354256-1-mawupeng1@huawei.com>
References: <20220607093805.1354256-1-mawupeng1@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.175.112.125]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 dggpemm500014.china.huawei.com (7.185.36.153)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220607_021652_955173_92FD0388 
X-CRM114-Status: GOOD (  11.97  )
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

From: Ma Wupeng <mawupeng1@huawei.com>

Commit b05b9f5f9dcf ("x86, mirror: x86 enabling - find mirrored memory ranges")
introduced mirrored memory support for x86 and this could be used on arm64.

Since we only support this feature on arm64, efi_find_mirror() won't be placed
into efi_init(), which is used by riscv/arm/arm64, it is added in setup_arch()
to scan the memory map and mark mirrored memory in memblock.

Signed-off-by: Ma Wupeng <mawupeng1@huawei.com>
---
 Documentation/admin-guide/kernel-parameters.txt | 2 +-
 arch/arm64/kernel/setup.c                       | 1 +
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
index 8090130b544b..e3537646b6f7 100644
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -2301,7 +2301,7 @@
 
 	keepinitrd	[HW,ARM]
 
-	kernelcore=	[KNL,X86,IA-64,PPC]
+	kernelcore=	[KNL,X86,IA-64,PPC,ARM64]
 			Format: nn[KMGTPE] | nn% | "mirror"
 			This parameter specifies the amount of memory usable by
 			the kernel for non-movable allocations.  The requested
diff --git a/arch/arm64/kernel/setup.c b/arch/arm64/kernel/setup.c
index cf3a759f10d4..6e9acd7ecf0f 100644
--- a/arch/arm64/kernel/setup.c
+++ b/arch/arm64/kernel/setup.c
@@ -328,6 +328,7 @@ void __init __no_sanitize_address setup_arch(char **cmdline_p)
 
 	xen_early_init();
 	efi_init();
+	efi_find_mirror();
 
 	if (!efi_enabled(EFI_BOOT) && ((u64)_text % MIN_KIMG_ALIGN) != 0)
 	     pr_warn(FW_BUG "Kernel image misaligned at boot, please fix your bootloader!");
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
