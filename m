Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98ED8C433F5
	for <linux-riscv@archiver.kernel.org>; Mon,  6 Dec 2021 10:57:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MXJv450Lm86LUQv/T6zjwnk8HXzcV/aYsOhOADdUONs=; b=2EBi9nYMfyGxvO
	HOx2Kyxhi/L9arWI6DarZIYeM6yNlyT7CUkjxGsgy5HGUjjKUfTaZpX+0yhChcxXaxxjbXmM2C+qd
	+nFAkPTqrRosEHxGC/5ixZA7tgZcAGjk8biAhus4khe+2jO82uK4kcrCzP7VvYWY6K79m3oCetkd1
	qpoANaJqU+OfVENjQMIgTFs18mG37XK6fjvkfApgeqP8rJrnHNyYqmvRyVrEPlwkKaMZ3tKE1SOUG
	6Qjv7EAFpeFKek/IJvO7IesKuTmuul6jXdBguU0cqc7ABe3Zju3SgIjzT30wk4u/5jU2o4Lat8Q4S
	u7ia4nFHosLPx1mZ3q7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1muBgo-003Sz5-2p; Mon, 06 Dec 2021 10:57:46 +0000
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1muBga-003Sty-8k
 for linux-riscv@lists.infradead.org; Mon, 06 Dec 2021 10:57:33 +0000
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 0FE6E3F1F3
 for <linux-riscv@lists.infradead.org>; Mon,  6 Dec 2021 10:57:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1638788251;
 bh=fuCo6GlipVLANouxdlUj9UPk8z3xqJtBdYt3yi5vrR4=;
 h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
 MIME-Version;
 b=ulrGmckJ8nc5LwsUlD940AsFDTW6ioANuf5gf8/o7ygs3KdJQJrnDDn5QeRj3YGLx
 +kgMlgO/Z+B0u0aXTBND/G8sgAJWITLbhE18vCXCukV7LN1Bo8GItkzNIJeGq5oLZ8
 W8D7zMnmWHA9M5LP98kra/dBwoMQ5C/hjZM6R5SZoUezwSU+Fr3vJBlcbWlYUcg3j6
 2/09RbKdlm2F1LxqBPefZQWPU58j3yajy2F2XSkwOof6jsINSZaPQEmV1j+oMOwhlg
 o/CgEydZ7HX/lH/QyrNcff1NFO+AMcJqKtUkSPuKpXuxz5e1hucfOoezYh+E4Rvmoc
 frzZ/pmkE/RYg==
Received: by mail-wm1-f71.google.com with SMTP id
 y141-20020a1c7d93000000b0033c2ae3583fso5926200wmc.5
 for <linux-riscv@lists.infradead.org>; Mon, 06 Dec 2021 02:57:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=fuCo6GlipVLANouxdlUj9UPk8z3xqJtBdYt3yi5vrR4=;
 b=wmlkd8mvS9/zuMbTJgtsw2yQXNiijqPTvvq0lU3wugFTtjIyNP5GBTAlAxhPlxePl2
 2zwTPjbH/GKctSMpHmi5t/MrtTKfB8A6JeNFhDkkJcvn4+Fq5fOD9Sfbo0vJdWRK1iuH
 LuxAsItWySfy9HS8e5GREy4b6L+d+jlFL4qQBS6ntweqxR0RB4vtzSgrvHJ6UzXxkFIJ
 JayRvUrIH5iUZfVUSFdGV0TPkCYGe+ongvtY42L09rFWe76wWNt8hMqAA4YKvwl6+W8F
 IzAjDw57RT+451Y07tmoV9mbYOkN6YiOYzM/984F4R4bYTavaUUqUGFVm3fyD8hierWg
 I3Gg==
X-Gm-Message-State: AOAM5321YyyVSj2Olj7wAciUte3z1h+bL9SP9uiz4o96Rv49+1wiMTvP
 tmTD9ysX3b39rtVUB1wDLlBB8IkXSOchloWgtvtqpCqvYs/hfl/QZK/wRo11HHJgxnGdrSjR4cO
 gQbLlkCCv4m1p/6EeqJrtKGGb0G/xe1z5ZHQKsBpxxfAs9w==
X-Received: by 2002:a1c:96:: with SMTP id 144mr38540581wma.126.1638788249428; 
 Mon, 06 Dec 2021 02:57:29 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyruZG1A7uk22DjSFP29x9S3ZyEpMrCehgY/M0vUhz34HCzD1YET1HlEdm0KEK8SVJs3K6xfw==
X-Received: by 2002:a1c:96:: with SMTP id 144mr38540542wma.126.1638788249196; 
 Mon, 06 Dec 2021 02:57:29 -0800 (PST)
Received: from localhost.localdomain (lfbn-lyo-1-470-249.w2-7.abo.wanadoo.fr.
 [2.7.60.249])
 by smtp.gmail.com with ESMTPSA id t127sm13430498wma.9.2021.12.06.02.57.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Dec 2021 02:57:28 -0800 (PST)
From: Alexandre Ghiti <alexandre.ghiti@canonical.com>
To: Jonathan Corbet <corbet@lwn.net>, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Zong Li <zong.li@sifive.com>, Anup Patel <anup@brainfault.org>,
 Atish Patra <Atish.Patra@rivosinc.com>, Christoph Hellwig <hch@lst.de>,
 Andrey Ryabinin <ryabinin.a.a@gmail.com>,
 Alexander Potapenko <glider@google.com>,
 Andrey Konovalov <andreyknvl@gmail.com>,
 Dmitry Vyukov <dvyukov@google.com>, Ard Biesheuvel <ardb@kernel.org>,
 Arnd Bergmann <arnd@arndb.de>, Kees Cook <keescook@chromium.org>,
 Guo Ren <guoren@linux.alibaba.com>,
 Heinrich Schuchardt <heinrich.schuchardt@canonical.com>,
 Mayuresh Chitale <mchitale@ventanamicro.com>, panqinglin2020@iscas.ac.cn,
 linux-doc@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, kasan-dev@googlegroups.com,
 linux-efi@vger.kernel.org, linux-arch@vger.kernel.org
Cc: Alexandre Ghiti <alexandre.ghiti@canonical.com>
Subject: [PATCH v3 10/13] riscv: Improve virtual kernel memory layout dump
Date: Mon,  6 Dec 2021 11:46:54 +0100
Message-Id: <20211206104657.433304-11-alexandre.ghiti@canonical.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20211206104657.433304-1-alexandre.ghiti@canonical.com>
References: <20211206104657.433304-1-alexandre.ghiti@canonical.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211206_025732_492569_F13FF7F0 
X-CRM114-Status: GOOD (  17.09  )
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

With the arrival of sv48 and its large address space, it would be
cumbersome to statically define the unit size to use to print the different
portions of the virtual memory layout: instead, determine it dynamically.

Signed-off-by: Alexandre Ghiti <alexandre.ghiti@canonical.com>
---
 arch/riscv/mm/init.c               | 67 +++++++++++++++++++++++-------
 drivers/pci/controller/pci-xgene.c |  2 +-
 include/linux/sizes.h              |  1 +
 3 files changed, 54 insertions(+), 16 deletions(-)

diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
index 6a19a1b1caf8..28de6ea0a720 100644
--- a/arch/riscv/mm/init.c
+++ b/arch/riscv/mm/init.c
@@ -79,37 +79,74 @@ static void __init zone_sizes_init(void)
 }
 
 #if defined(CONFIG_MMU) && defined(CONFIG_DEBUG_VM)
+
+#define LOG2_SZ_1K  ilog2(SZ_1K)
+#define LOG2_SZ_1M  ilog2(SZ_1M)
+#define LOG2_SZ_1G  ilog2(SZ_1G)
+#define LOG2_SZ_1T  ilog2(SZ_1T)
+
 static inline void print_mlk(char *name, unsigned long b, unsigned long t)
 {
 	pr_notice("%12s : 0x%08lx - 0x%08lx   (%4ld kB)\n", name, b, t,
-		  (((t) - (b)) >> 10));
+		  (((t) - (b)) >> LOG2_SZ_1K));
 }
 
 static inline void print_mlm(char *name, unsigned long b, unsigned long t)
 {
 	pr_notice("%12s : 0x%08lx - 0x%08lx   (%4ld MB)\n", name, b, t,
-		  (((t) - (b)) >> 20));
+		  (((t) - (b)) >> LOG2_SZ_1M));
+}
+
+static inline void print_mlg(char *name, unsigned long b, unsigned long t)
+{
+	pr_notice("%12s : 0x%08lx - 0x%08lx   (%4ld GB)\n", name, b, t,
+		  (((t) - (b)) >> LOG2_SZ_1G));
+}
+
+#ifdef CONFIG_64BIT
+static inline void print_mlt(char *name, unsigned long b, unsigned long t)
+{
+	pr_notice("%12s : 0x%08lx - 0x%08lx   (%4ld TB)\n", name, b, t,
+		  (((t) - (b)) >> LOG2_SZ_1T));
+}
+#endif
+
+static inline void print_ml(char *name, unsigned long b, unsigned long t)
+{
+	unsigned long diff = t - b;
+
+#ifdef CONFIG_64BIT
+	if ((diff >> LOG2_SZ_1T) >= 10)
+		print_mlt(name, b, t);
+	else
+#endif
+	if ((diff >> LOG2_SZ_1G) >= 10)
+		print_mlg(name, b, t);
+	else if ((diff >> LOG2_SZ_1M) >= 10)
+		print_mlm(name, b, t);
+	else
+		print_mlk(name, b, t);
 }
 
 static void __init print_vm_layout(void)
 {
 	pr_notice("Virtual kernel memory layout:\n");
-	print_mlk("fixmap", (unsigned long)FIXADDR_START,
-		  (unsigned long)FIXADDR_TOP);
-	print_mlm("pci io", (unsigned long)PCI_IO_START,
-		  (unsigned long)PCI_IO_END);
-	print_mlm("vmemmap", (unsigned long)VMEMMAP_START,
-		  (unsigned long)VMEMMAP_END);
-	print_mlm("vmalloc", (unsigned long)VMALLOC_START,
-		  (unsigned long)VMALLOC_END);
-	print_mlm("lowmem", (unsigned long)PAGE_OFFSET,
-		  (unsigned long)high_memory);
+	print_ml("fixmap", (unsigned long)FIXADDR_START,
+		 (unsigned long)FIXADDR_TOP);
+	print_ml("pci io", (unsigned long)PCI_IO_START,
+		 (unsigned long)PCI_IO_END);
+	print_ml("vmemmap", (unsigned long)VMEMMAP_START,
+		 (unsigned long)VMEMMAP_END);
+	print_ml("vmalloc", (unsigned long)VMALLOC_START,
+		 (unsigned long)VMALLOC_END);
+	print_ml("lowmem", (unsigned long)PAGE_OFFSET,
+		 (unsigned long)high_memory);
 #ifdef CONFIG_64BIT
 #ifdef CONFIG_KASAN
-	print_mlm("kasan", KASAN_SHADOW_START, KASAN_SHADOW_END);
+	print_ml("kasan", KASAN_SHADOW_START, KASAN_SHADOW_END);
 #endif
-	print_mlm("kernel", (unsigned long)KERNEL_LINK_ADDR,
-		  (unsigned long)ADDRESS_SPACE_END);
+	print_ml("kernel", (unsigned long)KERNEL_LINK_ADDR,
+		 (unsigned long)ADDRESS_SPACE_END);
 #endif
 }
 #else
diff --git a/drivers/pci/controller/pci-xgene.c b/drivers/pci/controller/pci-xgene.c
index e64536047b65..187dcf8a9694 100644
--- a/drivers/pci/controller/pci-xgene.c
+++ b/drivers/pci/controller/pci-xgene.c
@@ -21,6 +21,7 @@
 #include <linux/pci-ecam.h>
 #include <linux/platform_device.h>
 #include <linux/slab.h>
+#include <linux/sizes.h>
 
 #include "../pci.h"
 
@@ -50,7 +51,6 @@
 #define OB_LO_IO			0x00000002
 #define XGENE_PCIE_VENDORID		0x10E8
 #define XGENE_PCIE_DEVICEID		0xE004
-#define SZ_1T				(SZ_1G*1024ULL)
 #define PIPE_PHY_RATE_RD(src)		((0xc000 & (u32)(src)) >> 0xe)
 
 #define XGENE_V1_PCI_EXP_CAP		0x40
diff --git a/include/linux/sizes.h b/include/linux/sizes.h
index 1ac79bcee2bb..0bc6cf394b08 100644
--- a/include/linux/sizes.h
+++ b/include/linux/sizes.h
@@ -47,6 +47,7 @@
 #define SZ_8G				_AC(0x200000000, ULL)
 #define SZ_16G				_AC(0x400000000, ULL)
 #define SZ_32G				_AC(0x800000000, ULL)
+#define SZ_1T				_AC(0x10000000000, ULL)
 #define SZ_64T				_AC(0x400000000000, ULL)
 
 #endif /* __LINUX_SIZES_H__ */
-- 
2.32.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
