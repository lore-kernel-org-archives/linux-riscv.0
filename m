Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C783AC43334
	for <linux-riscv@archiver.kernel.org>; Mon, 13 Jun 2022 08:01:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=F03xUFuAlz/bzxqCffb+syS+2i4BltHuPRvvMbo3avA=; b=ONp3pHHZLgr44/
	ZmQXbtApaQnLHw214jCmTvW2q/M0p9xliF8yxwpXJ9O3U4NTmc4rIQ9GxSIDYfhH1Uw1Jh7vJxn2/
	LUBfKAg1iwhJPTD4U2myDYytZQTYOoyA6nnvIhZm4cUneBP5tjE6JX6anXzfGmWvZ/bqR/dYp/puO
	fJ+XWb9X5T284LV2rCzj2rhTDllHmEzNPoLn1loickDFwVF1jWutx/in9iB0ieJ+PTqGNR+YIe5z9
	FBsXSngAUSbl6jS0ROPIUNv3km3GpMKvMlipsdkcTXWmCQimiEtyHVBwSB/q2G2fyk+xFUGE2lOn/
	EnQzyuJOTyZVU4TfjdAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o0f0G-0026b6-M5; Mon, 13 Jun 2022 08:00:52 +0000
Received: from szxga03-in.huawei.com ([45.249.212.189])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o0ezy-0026Oa-UR; Mon, 13 Jun 2022 08:00:37 +0000
Received: from dggpemm500024.china.huawei.com (unknown [172.30.72.56])
	by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4LM3rl0Nk2zDqqJ;
	Mon, 13 Jun 2022 16:00:07 +0800 (CST)
Received: from dggpemm500014.china.huawei.com (7.185.36.153) by
 dggpemm500024.china.huawei.com (7.185.36.203) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Mon, 13 Jun 2022 16:00:27 +0800
Received: from localhost.localdomain (10.175.112.125) by
 dggpemm500014.china.huawei.com (7.185.36.153) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Mon, 13 Jun 2022 16:00:25 +0800
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
	<vijayb@linux.microsoft.com>, <linux-doc@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-efi@vger.kernel.org>, <platform-driver-x86@vger.kernel.org>,
	<linux-mm@kvack.org>, <linux-riscv@lists.infradead.org>
Subject: [PATCH v4 1/6] efi: Make efi_find_mirror() public
Date: Mon, 13 Jun 2022 16:21:42 +0800
Message-ID: <20220613082147.183145-2-mawupeng1@huawei.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220613082147.183145-1-mawupeng1@huawei.com>
References: <20220613082147.183145-1-mawupeng1@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.175.112.125]
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 dggpemm500014.china.huawei.com (7.185.36.153)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220613_010035_369959_22D271CF 
X-CRM114-Status: GOOD (  12.87  )
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

Commit b05b9f5f9dcf ("x86, mirror: x86 enabling - find mirrored memory
ranges") introduce the efi_find_mirror function on x86. In order to reuse
the API we make it public in preparation for arm64 to support mirrord
memory.

Signed-off-by: Ma Wupeng <mawupeng1@huawei.com>
Reviewed-by: Kefeng Wang <wangkefeng.wang@huawei.com>
---
 arch/x86/include/asm/efi.h  |  4 ----
 arch/x86/platform/efi/efi.c | 23 -----------------------
 drivers/firmware/efi/efi.c  | 23 +++++++++++++++++++++++
 include/linux/efi.h         |  3 +++
 4 files changed, 26 insertions(+), 27 deletions(-)

diff --git a/arch/x86/include/asm/efi.h b/arch/x86/include/asm/efi.h
index 71943dce691e..eb90206eae80 100644
--- a/arch/x86/include/asm/efi.h
+++ b/arch/x86/include/asm/efi.h
@@ -383,7 +383,6 @@ static inline bool efi_is_64bit(void)
 extern bool efi_reboot_required(void);
 extern bool efi_is_table_address(unsigned long phys_addr);
 
-extern void efi_find_mirror(void);
 extern void efi_reserve_boot_services(void);
 #else
 static inline void parse_efi_setup(u64 phys_addr, u32 data_len) {}
@@ -395,9 +394,6 @@ static inline  bool efi_is_table_address(unsigned long phys_addr)
 {
 	return false;
 }
-static inline void efi_find_mirror(void)
-{
-}
 static inline void efi_reserve_boot_services(void)
 {
 }
diff --git a/arch/x86/platform/efi/efi.c b/arch/x86/platform/efi/efi.c
index 1591d67e0bcd..6e598bd78eef 100644
--- a/arch/x86/platform/efi/efi.c
+++ b/arch/x86/platform/efi/efi.c
@@ -108,29 +108,6 @@ static int __init setup_add_efi_memmap(char *arg)
 }
 early_param("add_efi_memmap", setup_add_efi_memmap);
 
-void __init efi_find_mirror(void)
-{
-	efi_memory_desc_t *md;
-	u64 mirror_size = 0, total_size = 0;
-
-	if (!efi_enabled(EFI_MEMMAP))
-		return;
-
-	for_each_efi_memory_desc(md) {
-		unsigned long long start = md->phys_addr;
-		unsigned long long size = md->num_pages << EFI_PAGE_SHIFT;
-
-		total_size += size;
-		if (md->attribute & EFI_MEMORY_MORE_RELIABLE) {
-			memblock_mark_mirror(start, size);
-			mirror_size += size;
-		}
-	}
-	if (mirror_size)
-		pr_info("Memory: %lldM/%lldM mirrored memory\n",
-			mirror_size>>20, total_size>>20);
-}
-
 /*
  * Tell the kernel about the EFI memory map.  This might include
  * more than the max 128 entries that can fit in the passed in e820
diff --git a/drivers/firmware/efi/efi.c b/drivers/firmware/efi/efi.c
index 860534bcfdac..79c232e07de7 100644
--- a/drivers/firmware/efi/efi.c
+++ b/drivers/firmware/efi/efi.c
@@ -446,6 +446,29 @@ static int __init efisubsys_init(void)
 
 subsys_initcall(efisubsys_init);
 
+void __init efi_find_mirror(void)
+{
+	efi_memory_desc_t *md;
+	u64 mirror_size = 0, total_size = 0;
+
+	if (!efi_enabled(EFI_MEMMAP))
+		return;
+
+	for_each_efi_memory_desc(md) {
+		unsigned long long start = md->phys_addr;
+		unsigned long long size = md->num_pages << EFI_PAGE_SHIFT;
+
+		total_size += size;
+		if (md->attribute & EFI_MEMORY_MORE_RELIABLE) {
+			memblock_mark_mirror(start, size);
+			mirror_size += size;
+		}
+	}
+	if (mirror_size)
+		pr_info("Memory: %lldM/%lldM mirrored memory\n",
+			mirror_size>>20, total_size>>20);
+}
+
 /*
  * Find the efi memory descriptor for a given physical address.  Given a
  * physical address, determine if it exists within an EFI Memory Map entry,
diff --git a/include/linux/efi.h b/include/linux/efi.h
index 7d9b0bb47eb3..53f64c14a525 100644
--- a/include/linux/efi.h
+++ b/include/linux/efi.h
@@ -872,6 +872,7 @@ static inline bool efi_rt_services_supported(unsigned int mask)
 {
 	return (efi.runtime_supported_mask & mask) == mask;
 }
+extern void efi_find_mirror(void);
 #else
 static inline bool efi_enabled(int feature)
 {
@@ -889,6 +890,8 @@ static inline bool efi_rt_services_supported(unsigned int mask)
 {
 	return false;
 }
+
+static inline void efi_find_mirror(void) {}
 #endif
 
 extern int efi_status_to_err(efi_status_t status);
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
