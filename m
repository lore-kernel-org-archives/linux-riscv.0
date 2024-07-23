Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93FFAC3DA63
	for <linux-riscv@archiver.kernel.org>; Tue, 23 Jul 2024 06:43:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=m0sPgnlLwBzOAX39Nqv+22/0IHcuSZKL+D923jt4Uks=; b=n0UGR0DEanuHwg
	PNTLhYuwfXzp1CdjuRrC3/039DRlQ6Gb5nAzuVBC1A3ZfEmTCoDMKTDLOaP0juAk+X8hMGN9mq36+
	mw2HR+7B4h+vTgs7Pvsvhlrmu3WCfl28k0zM+SsZTWP02X5mM9H1SW17APRmdhZbjI7n6c3tn6tIc
	/0OABtbjsQbLkRJrA/f8IdbRaUWoh80hXVVfFlyW3N0hzcfpp/KTD/QzUnhVpkyk3E19ikru9hiRM
	Of1iOqzJwz1qgvZ9mdYYeLwkmwLgZPyu/GJ2Kc+vlyHmYmb2NRv4KrbhvGk7IzOfA1M2b/+XEgcqQ
	Yf+EaSwb0p1Bh4CDSlmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sW9FF-0000000BWv9-3v16;
	Tue, 23 Jul 2024 06:43:33 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sW9EP-0000000BWPL-1zgg;
	Tue, 23 Jul 2024 06:42:42 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id B5DE060B98;
	Tue, 23 Jul 2024 06:42:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 65428C4AF09;
	Tue, 23 Jul 2024 06:42:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1721716960;
	bh=wE9udk3T5PUOzWhffSqfqF0jfi91yVWMRgCuaEhaWIs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=L4fNJ84X321lZQzRVwm/9NQS5NvRjUpsrvUknu/25CNWvxfQJeLO5JGwoMu66FrNE
	 yvDUpLniReSKqIGbvqtVRByoS59WWzegjXjEaI/pSrYNABzkWG217PFiU/HwCkFTUq
	 g5LaEICTajd27yc9CaZWhZMte2v93pqn/oc7mWi2RjQwmIaj9fD9pBiOpgfGeAY97T
	 Oe4NEENOMypP8RnZtX4JhQBHzOIYuexn1Vt8ZCQFxdsT1om7AChjHOPoOQjfy6zd24
	 JMhzIfEW86NpfX+IthkEOW0SXal75QemXF5ziyXOa5gbgR3IX+M2Vk2vL97MmOTzDj
	 iYFpZ/HwvvjKw==
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
	x86@kernel.org
Subject: [PATCH v2 02/25] MIPS: sgi-ip27: make NODE_DATA() the same as on all other architectures
Date: Tue, 23 Jul 2024 09:41:33 +0300
Message-ID: <20240723064156.4009477-3-rppt@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240723064156.4009477-1-rppt@kernel.org>
References: <20240723064156.4009477-1-rppt@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240722_234241_641811_7FA06566 
X-CRM114-Status: GOOD (  14.46  )
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

sgi-ip27 is the only system that defines NODE_DATA() differently than
the rest of NUMA machines.

Add node_data array of struct pglist pointers that will point to
__node_data[node]->pglist and redefine NODE_DATA() to use node_data
array.

This will allow pulling declaration of node_data to the generic mm code
in the next commit.

Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
---
 arch/mips/include/asm/mach-ip27/mmzone.h | 5 ++++-
 arch/mips/sgi-ip27/ip27-memory.c         | 5 ++++-
 2 files changed, 8 insertions(+), 2 deletions(-)

diff --git a/arch/mips/include/asm/mach-ip27/mmzone.h b/arch/mips/include/asm/mach-ip27/mmzone.h
index 08c36e50a860..629c3f290203 100644
--- a/arch/mips/include/asm/mach-ip27/mmzone.h
+++ b/arch/mips/include/asm/mach-ip27/mmzone.h
@@ -22,7 +22,10 @@ struct node_data {
 
 extern struct node_data *__node_data[];
 
-#define NODE_DATA(n)		(&__node_data[(n)]->pglist)
 #define hub_data(n)		(&__node_data[(n)]->hub)
 
+extern struct pglist_data *node_data[];
+
+#define NODE_DATA(nid)		(node_data[nid])
+
 #endif /* _ASM_MACH_MMZONE_H */
diff --git a/arch/mips/sgi-ip27/ip27-memory.c b/arch/mips/sgi-ip27/ip27-memory.c
index b8ca94cfb4fe..c30ef6958b97 100644
--- a/arch/mips/sgi-ip27/ip27-memory.c
+++ b/arch/mips/sgi-ip27/ip27-memory.c
@@ -34,8 +34,10 @@
 #define SLOT_PFNSHIFT		(SLOT_SHIFT - PAGE_SHIFT)
 #define PFN_NASIDSHFT		(NASID_SHFT - PAGE_SHIFT)
 
-struct node_data *__node_data[MAX_NUMNODES];
+struct pglist_data *node_data[MAX_NUMNODES];
+EXPORT_SYMBOL(node_data);
 
+struct node_data *__node_data[MAX_NUMNODES];
 EXPORT_SYMBOL(__node_data);
 
 static u64 gen_region_mask(void)
@@ -361,6 +363,7 @@ static void __init node_mem_init(nasid_t node)
 	 */
 	__node_data[node] = __va(slot_freepfn << PAGE_SHIFT);
 	memset(__node_data[node], 0, PAGE_SIZE);
+	node_data[node] = &__node_data[node]->pglist;
 
 	NODE_DATA(node)->node_start_pfn = start_pfn;
 	NODE_DATA(node)->node_spanned_pages = end_pfn - start_pfn;
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
