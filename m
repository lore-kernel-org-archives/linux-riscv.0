Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C21EC28B30
	for <linux-riscv@archiver.kernel.org>; Thu, 20 Mar 2025 08:46:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=I+p/BcjcPS/C3K+wFs9TIlsXm32qagKuk5G76r0RNAY=; b=AkYxysMlT1Efb4
	pi4jg98Y6KdlCVpY6Yu73VoI9LxPQium6/dc3hkbg/aWgslX2PkBiM3FauhEQ7BfEUaEmXchcwPXC
	v880WHtk4Gcq3xgjDOfVuJIao4RnrQ4rzmkFNBX8bSANlZhZcZJt/jC2ZGJKH4RIVCMVKH4P+QCZC
	ns2H8H0bI46a1em7eA+e4ZtsqR78laV+JGV1dR4RMIuOLAE7zGhShFMmfOdZN52RQZmm4t3GNCAIY
	QqVUH1dxMUG5OaUOMl15hU7bfE9OAhmgVIa8mB1BoNF4sT+xqd6uRDldqCtnFz8ddBbnulqFCQ1pD
	2cWgeQvCJ3bb2wSICBAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tvBXa-0000000BaGr-2BME;
	Thu, 20 Mar 2025 08:46:14 +0000
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tvBWP-0000000Ba5D-1GPE
	for linux-riscv@lists.infradead.org;
	Thu, 20 Mar 2025 08:45:02 +0000
Received: by mail-pl1-x62b.google.com with SMTP id d9443c01a7336-224019ad9edso9935415ad.1
        for <linux-riscv@lists.infradead.org>; Thu, 20 Mar 2025 01:44:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1742460298; x=1743065098; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=6ge+2Zy4b/aVKYNPvh9+f0g34JnK38AaqDpbfA611Vw=;
        b=FzbUeXLDm5g35GGbkC7PzsjLuRNSzMwfbqVEv+CJU56khhlwQSkxLIYanGzBSuwNQg
         oa9/eucTd/k3+34RF47NwjTcPjUdk+I3mkcyARipnQI11iSGmS7h7B7FKr+n/LW/4dEP
         dsAezp+Hu4NX/9ub0sM4OEWRaE+v3fSsNUDIpkPtctZVPFtVDR7KBZOSxa0oZgEAxebV
         SZrtJaZWyy17AFFho6PSvVU3vLQ1DLaEHKJBs+BIjh8HVm2t+U6rfv2qyZ7YDqfCuZK2
         MKYmJ5PiU4/sqHBjCLUb/ZcUxLDndOFO+iZLN/IV4o+Y3kMKDCb41CqjVW3q+ZemhhtG
         Onzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742460298; x=1743065098;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6ge+2Zy4b/aVKYNPvh9+f0g34JnK38AaqDpbfA611Vw=;
        b=L+wT3kk6GKZBewxhzYB4n/5vYyKTPLxAIPjwaEpP8Y7yv3r7Pi7aV79KfM/4G39qoF
         oFpdAbdG7D48ubUrgyYA3eGoiEhR3kcIJPtcDQwZrwqpuwFXmMf/ZOU2rir/RoS4VArh
         h4vZnTC0/8IaVJzA3HumoKKmPZ8JFp7DscqzLom5Qv0QX6YBK9GhUQGdhcmdLDihk6cj
         SoPoi3q7inDgClrXYnU3EpuixFJRnN/pwc2bGIy/0G5R4hSWSZ4xxj4HQwo8zL4vPxdt
         ML6IC2Dky/PGxi0gCjMiA16No6kfHYEL/JQ/Q28xGi8eWzk/fWFzK4Jn7QZfg6gai5CX
         fk/Q==
X-Forwarded-Encrypted: i=1; AJvYcCWGBOlUb/Gap18CnnIW+Zx7EHE1Uo2janrI1IBmtfmRI7Pw+EAbm72SyvW/vY0sBm5BXGf1XjnmBvnYRg==@lists.infradead.org
X-Gm-Message-State: AOJu0YwQDfeoK0O4jsnpD73npVxZmM19ODFU11S4AOQFuP7pude5zBlT
	VhS3dSlRlP30GHacIUnWWcP5U0nk2XyHgA+35doW46JyJ3BOxD+Un+11XmQ8Rtw=
X-Gm-Gg: ASbGncstLKZn+JKC3UH0fRdED7ZoORMaLDaxXKvcwQKDd8/OjnhGaRQVFLNnghv3ofR
	svTlzs7Gq9iDaWuV56W2mRGlHFyw+hJZBJRzc2tB9nMStY4iw7XqHLjGKKBWEBz4RuoXVpumIET
	JGjIIEp4MQVcvK54Io+s1JjIxVHRGjYwHry4yJPdx65IHmIsfEr+Rve/zOq3DWvmIyJCvUmIIIY
	PiQSzmShJ7CwuyHrR4EKlAmpga2KHXnXY1vDDnP7fqPkGjMhZCYyxbP0AaL5cX9Z9jFLb56Qfou
	8+3kWW/D/29xVDawclA8tv70mlZOWGn1Ik/vVZFKyo0M+ejXD6ZfvmIlBbbZmtGhpMabVnlt+49
	x8MI=
X-Google-Smtp-Source: AGHT+IGpZnMUz3aNkSz4lCZ4lxTHMzea8UwmPxzl9b/dm1grVRgitblsPBXeHqLKUTHra0EyfaksNA==
X-Received: by 2002:a17:903:2281:b0:223:635d:3e38 with SMTP id d9443c01a7336-2264993225bmr75908705ad.15.1742460297818;
        Thu, 20 Mar 2025 01:44:57 -0700 (PDT)
Received: from L6YN4KR4K9.bytedance.net ([139.177.225.248])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-225c6bd4af3sm129719715ad.236.2025.03.20.01.44.50
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 20 Mar 2025 01:44:57 -0700 (PDT)
From: Yunhui Cui <cuiyunhui@bytedance.com>
To: paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	anshuman.khandual@arm.com,
	akpm@linux-foundation.org,
	mingo@kernel.org,
	cuiyunhui@bytedance.com,
	catalin.marinas@arm.com,
	ryan.roberts@arm.com,
	kirill.shutemov@linux.intel.com,
	namcao@linutronix.de,
	bjorn@rivosinc.com,
	arnd@arndb.de,
	stuart.menefy@codasip.com,
	luxu.kernel@bytedance.com,
	vincenzo.frascino@arm.com,
	samuel.holland@sifive.com,
	christophe.leroy@csgroup.eu,
	dawei.li@shingroup.cn,
	rppt@kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] riscv: introduce the ioremap_prot() function
Date: Thu, 20 Mar 2025 16:44:28 +0800
Message-Id: <20250320084428.51151-1-cuiyunhui@bytedance.com>
X-Mailer: git-send-email 2.39.2 (Apple Git-143)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250320_014501_347848_063DA7D1 
X-CRM114-Status: GOOD (  14.38  )
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

It's advisable to avoid mapping memory with the non-cache attribute.
This is because issues may arise when the same physical address is
mapped as both cacheable and non-cacheable simultaneously, such as
in the case of hardware prefetching.

Signed-off-by: Yunhui Cui <cuiyunhui@bytedance.com>
---
 arch/riscv/include/asm/io.h   |  2 ++
 arch/riscv/include/asm/page.h |  2 ++
 arch/riscv/mm/Makefile        |  1 +
 arch/riscv/mm/init.c          | 12 ++++++++++++
 arch/riscv/mm/ioremap.c       | 15 +++++++++++++++
 5 files changed, 32 insertions(+)
 create mode 100644 arch/riscv/mm/ioremap.c

diff --git a/arch/riscv/include/asm/io.h b/arch/riscv/include/asm/io.h
index a0e51840b9db..736c5557bd06 100644
--- a/arch/riscv/include/asm/io.h
+++ b/arch/riscv/include/asm/io.h
@@ -133,6 +133,8 @@ __io_writes_outs(outs, u64, q, __io_pbr(), __io_paw())
 #define outsq(addr, buffer, count) __outsq(PCI_IOBASE + (addr), buffer, count)
 #endif
 
+#define ioremap_prot ioremap_prot
+
 #include <asm-generic/io.h>
 
 #ifdef CONFIG_MMU
diff --git a/arch/riscv/include/asm/page.h b/arch/riscv/include/asm/page.h
index 125f5ecd9565..181d2d3a0922 100644
--- a/arch/riscv/include/asm/page.h
+++ b/arch/riscv/include/asm/page.h
@@ -202,6 +202,8 @@ static __always_inline void *pfn_to_kaddr(unsigned long pfn)
 	return __va(pfn << PAGE_SHIFT);
 }
 
+int pfn_is_map_memory(unsigned long pfn);
+
 #endif /* __ASSEMBLY__ */
 
 #define virt_addr_valid(vaddr)	({						\
diff --git a/arch/riscv/mm/Makefile b/arch/riscv/mm/Makefile
index b916a68d324a..58a75f7d66e9 100644
--- a/arch/riscv/mm/Makefile
+++ b/arch/riscv/mm/Makefile
@@ -17,6 +17,7 @@ obj-$(CONFIG_MMU) += extable.o fault.o pageattr.o pgtable.o tlbflush.o
 obj-y += cacheflush.o
 obj-y += context.o
 obj-y += pmem.o
+obj-y += ioremap.o
 
 obj-$(CONFIG_HUGETLB_PAGE) += hugetlbpage.o
 obj-$(CONFIG_PTDUMP) += ptdump.o
diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
index 3ec9bfaa088a..74ad96e973a4 100644
--- a/arch/riscv/mm/init.c
+++ b/arch/riscv/mm/init.c
@@ -92,6 +92,18 @@ static void __init zone_sizes_init(void)
 	free_area_init(max_zone_pfns);
 }
 
+int pfn_is_map_memory(unsigned long pfn)
+{
+	phys_addr_t addr = PFN_PHYS(pfn);
+
+	/* avoid false positives for bogus PFNs, see comment in pfn_valid() */
+	if (PHYS_PFN(addr) != pfn)
+		return 0;
+
+	return memblock_is_map_memory(addr);
+}
+EXPORT_SYMBOL(pfn_is_map_memory);
+
 #if defined(CONFIG_MMU) && defined(CONFIG_DEBUG_VM)
 
 #define LOG2_SZ_1K  ilog2(SZ_1K)
diff --git a/arch/riscv/mm/ioremap.c b/arch/riscv/mm/ioremap.c
new file mode 100644
index 000000000000..037f87dfe88d
--- /dev/null
+++ b/arch/riscv/mm/ioremap.c
@@ -0,0 +1,15 @@
+// SPDX-License-Identifier: GPL-2.0-only
+
+#include <linux/mm.h>
+#include <linux/io.h>
+
+void __iomem *ioremap_prot(phys_addr_t phys_addr, size_t size,
+			   pgprot_t pgprot)
+{
+	/* Don't allow RAM to be mapped. */
+	if (WARN_ON(pfn_is_map_memory(__phys_to_pfn(phys_addr))))
+		return NULL;
+
+	return generic_ioremap_prot(phys_addr, size, pgprot);
+}
+EXPORT_SYMBOL(ioremap_prot);
-- 
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
