Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB884C3DA63
	for <linux-riscv@archiver.kernel.org>; Tue, 23 Jul 2024 06:49:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ARd/VmSYb4SrXIOhxJ9JO1Mez6IicZ3mqTPTVd4ljrA=; b=qXGxqpHgQD0mzO
	reCr+aGIVlfBZSSOKZxhHRZ9bAYwoKp+JCfi8mwWkdZYqND/dMDPUg6n3fe+NoJP2T9zN6E4WiJwv
	OW9fgzsmnG2/xBlYv4uYg0//qwaAcZJozbWjLbZinAGwEIlonaiT0M87VQ5Q8Ls1bZLOBjoTPzTJq
	tMnOcJHINlEkRozmkQ1MtWjbk4cWX3bxXuvgEViB/IyZsuW/7hoY3I5hJ/uPraERbb3bOe07v2CDX
	OeQqFi7RrI9ByvnqoDgW1DWE135WW6AHXedQPYDrQK1APSuEmNiBZj+oj7y6HGmCj59ZWOOSV7vLa
	jqKZh1j6N6pgzVGO/m0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sW9Ko-0000000BaU3-3owH;
	Tue, 23 Jul 2024 06:49:18 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sW9GT-0000000BXkc-3ZnH;
	Tue, 23 Jul 2024 06:44:51 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 0702460B90;
	Tue, 23 Jul 2024 06:44:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 75DE2C4AF0C;
	Tue, 23 Jul 2024 06:44:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1721717088;
	bh=UMRR3QRNDoHU23r5jw2deXNa43lw6nj2o1uMl8WO5EY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=j35xuHfuNJnQeqb7veAbB9mttyDh+negQYCVoPrqp5oqP0zJLv/BXespI7J//nCIr
	 Sc5hLZUbxIz7818WwGcqoz5uRApIPm6FTsS8D2xgtV/3QhZq/vSHjbyYQFteCdX9J/
	 Z0Q1q+EAiONG8IXS2KIYvn9ZTZrI3rN/ZDXZYtg5Ba0JDP5j1rydPiw07EDLRjnfzj
	 pgm5ToFUGkUK44WCFFrLfRGFLEUz96+/NIboNOkbTCMEuxXkQqulA5vFQFBYRFoA+V
	 bDUooind5lcDC0gKC+UTC2cNByUYBIjZr44sdbkDnMkyVdXJiz8oVeerB9hf/6EipM
	 zivkL/l1N+MSA==
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
Subject: [PATCH v2 13/25] x86/numa_emu: simplify allocation of phys_dist
Date: Tue, 23 Jul 2024 09:41:44 +0300
Message-ID: <20240723064156.4009477-14-rppt@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240723064156.4009477-1-rppt@kernel.org>
References: <20240723064156.4009477-1-rppt@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240722_234450_053842_D10491F8 
X-CRM114-Status: GOOD (  12.84  )
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

By the time numa_emulation() is called, all physical memory is already
mapped in the direct map and there is no need to define limits for
memblock allocation.

Replace memblock_phys_alloc_range() with memblock_alloc().

Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
---
 arch/x86/mm/numa_emulation.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/arch/x86/mm/numa_emulation.c b/arch/x86/mm/numa_emulation.c
index 1ce22e315b80..439804e21962 100644
--- a/arch/x86/mm/numa_emulation.c
+++ b/arch/x86/mm/numa_emulation.c
@@ -448,15 +448,11 @@ void __init numa_emulation(struct numa_meminfo *numa_meminfo, int numa_dist_cnt)
 
 	/* copy the physical distance table */
 	if (numa_dist_cnt) {
-		u64 phys;
-
-		phys = memblock_phys_alloc_range(phys_size, PAGE_SIZE, 0,
-						 PFN_PHYS(max_pfn_mapped));
-		if (!phys) {
+		phys_dist = memblock_alloc(phys_size, PAGE_SIZE);
+		if (!phys_dist) {
 			pr_warn("NUMA: Warning: can't allocate copy of distance table, disabling emulation\n");
 			goto no_emu;
 		}
-		phys_dist = __va(phys);
 
 		for (i = 0; i < numa_dist_cnt; i++)
 			for (j = 0; j < numa_dist_cnt; j++)
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
