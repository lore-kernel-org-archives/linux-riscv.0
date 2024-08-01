Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F849C3DA64
	for <linux-riscv@archiver.kernel.org>; Thu,  1 Aug 2024 06:09:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UgQx48b0ze4WBnfRrodI6VnCpMIpaEZ7H1cyjFGkJvA=; b=rvcQRj8GrpdobB
	14EisV4hrckstxars527dZlPBlsZodqKikgAW5ovjYWv/NAbQBPZDPdYFtT8KxTgGKcFK+XV3O7xF
	Vb6BE2lpFFfcrT/F4LAaL+znIC7d42ecU1JZ0SejghyXNIro5xQmcGbaFf4ZOdRQ6Sk8zsJv6QP/d
	feGl83e1aEGO2L3xrVa7Fx/MqnymLUjASDqxsXmKS8JG+DbStOTi/jz/+mw+EPqr/ogi1N+doS6sC
	QOLqnR5WKMMOiXMmZcFuCwwNx37OJN6yaGSxVLdH1GW/UFYJY8ELICzjKhKFFuC0wiYCULSoY3m+t
	hQ8u6z/Aa1F3n3kHJQGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sZP0c-00000003rwN-3Win;
	Thu, 01 Aug 2024 06:09:54 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sZOzn-00000003rVb-0qV8;
	Thu, 01 Aug 2024 06:09:06 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id E5BCDCE12D4;
	Thu,  1 Aug 2024 06:09:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 160B6C4AF0D;
	Thu,  1 Aug 2024 06:08:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722492539;
	bh=ahZO7HcpjJfu28QyxaeMh/IeX+F8/tsP9+GBaY7P+JU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=jnYRQTD4LOi6UYgIg7wnq6U4iqrnpuP08zjDaKgtXu3WJUYa/E097kuxH2aeK5VY/
	 Bcq+eK7GU5lblfPhzlOYIPo3Arzk4E40wMmg3gN1FTZ2TxhvcvhTRw68CsZTvioJTn
	 Wk3ISPON95CHAcboKkfATHNIu6XwkVsh4264IZAISjY8p9ijm4bYlQ+mnOeh5hZziE
	 RPlKjD3veB4BttqTLV9MIi8S0/XpTfL9SupmvL01R3UMwD8Xz5dAC7pERBZLD3bqkX
	 W9+XZrhHYiJ2Mids5IYyn3anSkKL5z5ZYL4TiQyrUAV2GaerVPAbMpNy9iVuloAcq2
	 f8gJBIb48MQag==
From: Mike Rapoport <rppt@kernel.org>
To: linux-kernel@vger.kernel.org
Cc: Alexander Gordeev <agordeev@linux.ibm.com>,
	Andreas Larsson <andreas@gaisler.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Borislav Petkov <bp@alien8.de>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Dan Williams <dan.j.williams@intel.com>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	David Hildenbrand <david@redhat.com>,
	"David S. Miller" <davem@davemloft.net>,
	Davidlohr Bueso <dave@stgolabs.net>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Heiko Carstens <hca@linux.ibm.com>,
	Huacai Chen <chenhuacai@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
	Jonathan Cameron <jonathan.cameron@huawei.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Mike Rapoport <rppt@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Samuel Holland <samuel.holland@sifive.com>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Thomas Gleixner <tglx@linutronix.de>,
	Vasily Gorbik <gor@linux.ibm.com>,
	Will Deacon <will@kernel.org>,
	Zi Yan <ziy@nvidia.com>,
	devicetree@vger.kernel.org,
	linux-acpi@vger.kernel.org,
	linux-arch@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-cxl@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-mips@vger.kernel.org,
	linux-mm@kvack.org,
	linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org,
	linux-sh@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	loongarch@lists.linux.dev,
	nvdimm@lists.linux.dev,
	sparclinux@vger.kernel.org,
	x86@kernel.org,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>
Subject: [PATCH v3 01/26] mm: move kernel/numa.c to mm/
Date: Thu,  1 Aug 2024 09:08:01 +0300
Message-ID: <20240801060826.559858-2-rppt@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240801060826.559858-1-rppt@kernel.org>
References: <20240801060826.559858-1-rppt@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240731_230903_788267_68CFD577 
X-CRM114-Status: GOOD (  11.57  )
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

From: "Mike Rapoport (Microsoft)" <rppt@kernel.org>

The stub functions in kernel/numa.c belong to mm/ rather than to kernel/

Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
Acked-by: David Hildenbrand <david@redhat.com>
Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Tested-by: Zi Yan <ziy@nvidia.com> # for x86_64 and arm64
---
 kernel/Makefile       | 1 -
 mm/Makefile           | 1 +
 {kernel => mm}/numa.c | 0
 3 files changed, 1 insertion(+), 1 deletion(-)
 rename {kernel => mm}/numa.c (100%)

diff --git a/kernel/Makefile b/kernel/Makefile
index 3c13240dfc9f..87866b037fbe 100644
--- a/kernel/Makefile
+++ b/kernel/Makefile
@@ -116,7 +116,6 @@ obj-$(CONFIG_SHADOW_CALL_STACK) += scs.o
 obj-$(CONFIG_HAVE_STATIC_CALL) += static_call.o
 obj-$(CONFIG_HAVE_STATIC_CALL_INLINE) += static_call_inline.o
 obj-$(CONFIG_CFI_CLANG) += cfi.o
-obj-$(CONFIG_NUMA) += numa.o
 
 obj-$(CONFIG_PERF_EVENTS) += events/
 
diff --git a/mm/Makefile b/mm/Makefile
index d2915f8c9dc0..4e668be85f0b 100644
--- a/mm/Makefile
+++ b/mm/Makefile
@@ -141,3 +141,4 @@ obj-$(CONFIG_HAVE_BOOTMEM_INFO_NODE) += bootmem_info.o
 obj-$(CONFIG_GENERIC_IOREMAP) += ioremap.o
 obj-$(CONFIG_SHRINKER_DEBUG) += shrinker_debug.o
 obj-$(CONFIG_EXECMEM) += execmem.o
+obj-$(CONFIG_NUMA) += numa.o
diff --git a/kernel/numa.c b/mm/numa.c
similarity index 100%
rename from kernel/numa.c
rename to mm/numa.c
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
