Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9101CC3DA60
	for <linux-riscv@archiver.kernel.org>; Tue, 16 Jul 2024 11:14:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qINmVZjQJPTHd6NzxXcQQ/cLAUlJFTdoe+bjDyuL9aE=; b=XYiXD+aXVzi8aM
	Sm64UpPPn+mgujWN463oBcy/LdIzC9UJixTnJt1kkomk56E/wOJeaNxzcaNOiYwmezOsXWSRhO1Ru
	eDMgzZekrBS4xq1nnfj875w0T5U0yMNHV83NXI8clXQhxsICuXayWG0PtkqpyGyPM7rd8PKWhaW3i
	zvTdGEktTxuIS9z/ngCq/0e3Hw/Ij10w8/mhfBCijwsIT5pM9jv6f98UedSIgnL+z7PDeeDczNn7B
	TUgKXa4O0vuD83XxctfncJW/r4zqYNzCUwWFl8w9wIkcwYTP/UyG5oMU0CpnHlV4i5/nASr7dBXq7
	wgyre/kp8vCzztLOeFNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sTg90-0000000AA0A-0dZa;
	Tue, 16 Jul 2024 11:14:54 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sTg8P-0000000A9gF-1OO4;
	Tue, 16 Jul 2024 11:14:18 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id C8FC9610A2;
	Tue, 16 Jul 2024 11:14:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DF837C4AF09;
	Tue, 16 Jul 2024 11:14:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1721128456;
	bh=y3TD89E5xgR+cEB9zJIVa1MhEE/ag71T+percuJb8Jk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=VkMJWuO92ZVIqTdQkBEULX1mdRfTUE6/w4UgTHJ/fo7CztNbTtED3l85kzn8gLFLR
	 LumfY8sNSw4PSPj6yPSVQ8T2AEm8DCptdeO4INOBYjWuTbnE/JBCrfMzXTkNp8RXXu
	 PBbS4LvDKghzVJNnNuLWmFVcS9ZKXPYXnKmA2ypjS6EXUEizahbhRrvw97jmJUis9x
	 t5wpJsRgWDGJfWMC3y9xWDYl0Ok0JGcYB/caEAlLDVVeg4rOAYZV4nWqDO8bTw2kQj
	 43/rV7DDmhcC37yK0DUqUAJAzU4bD2511EnJEtmeEXsRdvV9Uz2W5zZnfn3J5VwvF8
	 0EWJpUJP/BkOg==
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
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Heiko Carstens <hca@linux.ibm.com>,
	Huacai Chen <chenhuacai@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
	Jonathan Cameron <jonathan.cameron@huawei.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Mike Rapoport <rppt@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Thomas Gleixner <tglx@linutronix.de>,
	Vasily Gorbik <gor@linux.ibm.com>,
	Will Deacon <will@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	loongarch@lists.linux.dev,
	linux-mips@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org,
	linux-sh@vger.kernel.org,
	sparclinux@vger.kernel.org,
	linux-acpi@vger.kernel.org,
	linux-cxl@vger.kernel.org,
	nvdimm@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-arch@vger.kernel.org,
	linux-mm@kvack.org,
	x86@kernel.org
Subject: [PATCH 01/17] mm: move kernel/numa.c to mm/
Date: Tue, 16 Jul 2024 14:13:30 +0300
Message-ID: <20240716111346.3676969-2-rppt@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240716111346.3676969-1-rppt@kernel.org>
References: <20240716111346.3676969-1-rppt@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240716_041417_583900_4394BB16 
X-CRM114-Status: GOOD (  10.22  )
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
index 8fb85acda1b1..773b3b267438 100644
--- a/mm/Makefile
+++ b/mm/Makefile
@@ -139,3 +139,4 @@ obj-$(CONFIG_HAVE_BOOTMEM_INFO_NODE) += bootmem_info.o
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
