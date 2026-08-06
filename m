Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E77C2C56208
	for <linux-riscv@archiver.kernel.org>; Thu,  6 Aug 2026 09:36:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Rk9LEd0qApg+lhb4SUOiYcJmTGaOMA0uZA3KlUEJLNQ=; b=AEWDTsezz1iVP5
	mr6t5BP15hv+3GJkzNzQ0FfnzWnsXZZ1WbiUYnrbOX/2TOYyOdti8KHMs+mqeFu9AAhRDPHG8YC0Q
	oe+3lEyTk+4V3qWhI/ELOufskW2a20EEyAE8hiRJHBQOSL8YRC8rwMRBRfu+ExLvQGluZSWS38J0U
	SE7iBHW/+R86XkQbqUmPV571RjuKE/uC2Ehs1sxsspWkNpo4rgz7CwTSuyuST3vc1gW+oT+MOFJwk
	hQ3//IWRh0O+EarOuEGo3ojF8mg8eO6+Sgb5oCQ2OKE6zLhiGftA/n4tEx4lTbwWTk1BxMC3Lbzje
	cX9ZKJ3hSjo6jRRA9nzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wruWl-00000005QIj-3RVc;
	Thu, 06 Aug 2026 09:36:39 +0000
Received: from mail-pz2-x00.google.com ([2607:f8b0:4864:3b::])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wruWi-00000005QDJ-1OqG
	for linux-riscv@lists.infradead.org;
	Thu, 06 Aug 2026 09:36:38 +0000
Received: by mail-pz2-x00.google.com with SMTP id 41be03b00d2f7-c888c001628so1207853a12.0
        for <linux-riscv@lists.infradead.org>; Thu, 06 Aug 2026 02:36:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786008996; x=1786613796; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LuSw8PyHR5EplcrqG8+HZ+85Dl0Ckz8ecCi5UKpH+2g=;
        b=aVgmjEfQQcIkRjSFFYTfpxQ/6PG687uT3wDbdq2DLPSgwE3Q5VCCDGMybt2/mcvzVF
         PXCwdPbfgEzIQewrsHUQwchmfjwNXaVmlN8fC6kXuwagBotahvu98c0Y6YJfraPG+QT8
         j+X/sLtFwzF5mrjtfOcazLKbzrIpBZ8xQk+xEj1/X7nQEgTUClRTI6yCP0n1Jzir7PHw
         JNrB4fhOjVC0akvztaMZ5cDryFKf6bfpExxtkWFAIxzjje88rMesjAOwKHvGuIDGvaOn
         TAywWrCJJJ7PZYg2YaBBM4I6wYPcg7jLzXtqYLsraQ182kvQMf5Pa7ttHRwxSnpEGCVu
         1NZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786008996; x=1786613796;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=LuSw8PyHR5EplcrqG8+HZ+85Dl0Ckz8ecCi5UKpH+2g=;
        b=eJ73iFJW6ayKGbmwu/8rrI8NsQPoej7LoJLVunjEfPXQKc1xgHtOedGM3k73GEcZgx
         Y4poehb+CIcWeKOfn1u4E/uzmjS4AWKlzpq4+N1kAIe4pbBshWHHhJEWac63HnP5rXsn
         q8Ucibz7qx5qly1ujyi55LeAoS7tBahSdzQyUzQpMRhWOStVRKsh26vlHV1y7knY6QgE
         lw5L9WgXODXeOCvqeyo9CeS60BSiuJ7aQdVeBxXYre4xHKU0JVFq1+yLgoMwieULpzZm
         x3xz2+jmCQJFV4Gh6PeM9cmLbaoVYXj/0++ldOMuTyuXC0ISyqVZODzMvOWpsEDmFioE
         XSXA==
X-Forwarded-Encrypted: i=1; AHgh+RrnvOT5sVQX7jojVW8OJKLM7mFrR/zcTfcYkPeY9IQO1TXA+jLogNG+wF+27oc6rQtjPm8N+Cjy2jesgw==@lists.infradead.org
X-Gm-Message-State: AOJu0YzQIsgzpBsv0cyjLIwB6fQrCWpDBurNB/wobHBAEXJrrc8qEaso
	SXDoPHfwvgw7i8nBGjCREW2UGFQG92mVtXk3PyL6MOKTQx67vF5EOpO/
X-Gm-Gg: AR+sD12V/by9oF68JBe6+qBzWgYbEeUmFlhGe9q4TvqgGJPL9aN56vCZzXBjJDVS/pd
	D31ik9LY3SLGyJHEKyHqogk5SNoTlBWYHKusj1KSzAbCjhNn2T9COiBfLD8TvJIvJb/ZI3Z60UY
	/AP6rg3w7paOANXx/K+8fby7cFuQFuWfNV9NxUAADp6rchEBbhVJ0M9OsEtG8BhszusBjdPcIOE
	jzQ3JjfZRAJ9HC/VTticGcz5K/s443FUh391WCZ63dtA4fxvdm/PpAymQcn5tq5E707brMoYAIF
	H+sWcE4F7N0EFTvPlqWgqElPdc38zUmsp7yJgYgWrFFhonQgL8RyOvawOsckr+urcXDU6DAjjcv
	W3l4wysLuqbQrWeX9IOoUnVhduU7f+fgTzTCxL8xlBNhkdRF9Th6VNrXcx0o6kg/IrNcfuwzLMA
	eNjQR9Js/Ihx8aJShZfZIl898HMxUd+gqvrkQy1fchz+L4p5w2zts4jOZyppiXIgMWD+ahnqSWP
	Q==
X-Received: by 2002:a05:6a00:298e:b0:845:dffa:3740 with SMTP id d2e1a72fcca58-84f2e0151aemr16066036b3a.4.1786008995542;
        Thu, 06 Aug 2026 02:36:35 -0700 (PDT)
Received: from intel.company.local ([210.184.73.204])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84f453b0aeasm1043878b3a.13.2026.08.06.02.36.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Aug 2026 02:36:34 -0700 (PDT)
From: Wandun Chen <chenwandun1@gmail.com>
To: catalin.marinas@arm.com,
	will@kernel.org,
	chenhuacai@kernel.org,
	pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	robh@kernel.org,
	saravanak@kernel.org,
	rppt@kernel.org,
	baoquan.he@linux.dev,
	pasha.tatashin@soleen.com,
	pratyush@kernel.org,
	m.szyprowski@samsung.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	loongarch@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-mm@kvack.org,
	kexec@lists.infradead.org,
	iommu@lists.linux.dev
Cc: kernel@xen0n.name,
	alex@ghiti.fr,
	akpm@linux-foundation.org,
	ruirui.yang@linux.dev,
	robin.murphy@arm.com
Subject: [PATCH v5 5/8] riscv: build crash_mem ranges from memblock instead of resource tree
Date: Thu,  6 Aug 2026 17:35:16 +0800
Message-ID: <20260806093519.2907771-6-chenwandun1@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260806093519.2907771-1-chenwandun1@gmail.com>
References: <20260806093519.2907771-1-chenwandun1@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260806_023636_395921_F5DCECF9 
X-CRM114-Status: GOOD (  10.69  )
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

From: Wandun Chen <chenwandun@lixiang.com>

Replace walk_system_ram_res() with for_each_mem_range(). The
MEMBLOCK_NODUMP flag lives in memblock, so only by walking memblock
can the reserved-memory regions marked MEMBLOCK_NODUMP be excluded
from the vmcore.

for_each_mem_range() iterates memblock.memory, which is freed after
init unless ARCH_KEEP_MEMBLOCK is selected. riscv needs
ARCH_KEEP_MEMBLOCK to filter reserved memory from the vmcore, so
extend its condition (ACPI || KEXEC) with (KEXEC_FILE &&
CRASH_DUMP). arm64 and loongarch already select ARCH_KEEP_MEMBLOCK
unconditionally.

Signed-off-by: Wandun Chen <chenwandun@lixiang.com>
Tested-by: Meijing Zhao <zhaomeijing@lixiang.com>
---
 arch/riscv/Kconfig                     |  2 +-
 arch/riscv/kernel/machine_kexec_file.c | 31 ++++++++++----------------
 2 files changed, 13 insertions(+), 20 deletions(-)

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index ef1101bec76c..bd8726b4dfbe 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -57,7 +57,7 @@ config RISCV
 	select ARCH_HAS_UBSAN
 	select ARCH_HAS_VDSO_ARCH_DATA
 	select ARCH_HAVE_NMI_SAFE_CMPXCHG
-	select ARCH_KEEP_MEMBLOCK if ACPI || KEXEC
+	select ARCH_KEEP_MEMBLOCK if ACPI || KEXEC || (KEXEC_FILE && CRASH_DUMP)
 	select ARCH_MHP_MEMMAP_ON_MEMORY_ENABLE	if 64BIT && MMU
 	select ARCH_OPTIONAL_KERNEL_RWX if ARCH_HAS_STRICT_KERNEL_RWX
 	select ARCH_OPTIONAL_KERNEL_RWX_DEFAULT
diff --git a/arch/riscv/kernel/machine_kexec_file.c b/arch/riscv/kernel/machine_kexec_file.c
index 26cd2a8bd0cd..808e872f4063 100644
--- a/arch/riscv/kernel/machine_kexec_file.c
+++ b/arch/riscv/kernel/machine_kexec_file.c
@@ -37,39 +37,32 @@ int arch_kimage_file_post_load_cleanup(struct kimage *image)
 }
 
 #ifdef CONFIG_CRASH_DUMP
-static int get_nr_ram_ranges_callback(struct resource *res, void *arg)
-{
-	unsigned int *nr_ranges = arg;
-
-	(*nr_ranges)++;
-	return 0;
-}
-
 unsigned int arch_get_system_nr_ranges(void)
 {
 	unsigned int nr_ranges = 2 + crashk_cma_cnt; /* For exclusion of crashkernel region */
+	u64 i;
+	phys_addr_t start, end;
 
-	walk_system_ram_res(0, -1, &nr_ranges, get_nr_ram_ranges_callback);
+	for_each_mem_range(i, &start, &end)
+		nr_ranges++;
 
 	return nr_ranges;
 }
 
-static int prepare_elf64_ram_headers_callback(struct resource *res, void *arg)
+int arch_crash_populate_cmem(struct crash_mem *cmem)
 {
-	struct crash_mem *cmem = arg;
+	u64 i;
+	phys_addr_t start, end;
 
-	cmem->ranges[cmem->nr_ranges].start = res->start;
-	cmem->ranges[cmem->nr_ranges].end = res->end;
-	cmem->nr_ranges++;
+	for_each_mem_range(i, &start, &end) {
+		cmem->ranges[cmem->nr_ranges].start = start;
+		cmem->ranges[cmem->nr_ranges].end = end - 1;
+		cmem->nr_ranges++;
+	}
 
 	return 0;
 }
 
-int arch_crash_populate_cmem(struct crash_mem *cmem)
-{
-	return walk_system_ram_res(0, -1, cmem, prepare_elf64_ram_headers_callback);
-}
-
 static char *setup_kdump_cmdline(struct kimage *image, char *cmdline,
 				 unsigned long cmdline_len)
 {
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
