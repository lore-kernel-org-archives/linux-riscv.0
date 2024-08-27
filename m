Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 287A3C52D6F
	for <linux-riscv@archiver.kernel.org>; Tue, 27 Aug 2024 08:56:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=17ztkG1ngFo6P1vkHmRRdIRLbuCQ8etk3mLIoFNjTig=; b=ZG0mriZMRgWwk3
	MYqV6mRKY/jyDHizfklKobQECTEX6BquzJVYiqbWroOcXDb8iN1IGInEoIyDYrDO5RvcV4+mIovoM
	R5KnkGhdju+JA/lkFKqgi0yhMLJzghWa4eSZiYGIbRR3ZeiKCD6O6MlCiX9fMjJtguuPzUVZBU4GW
	7s1s1AU0xdY/5OegxIea0reNxompo/UNy7har6Fow9/SvYnev3u7mqpN9Jo1os0P3WX2SE3ZQHnMM
	7DWV/tXd2QImoj3mD+teNQwZMTptQSfAwQAIir+30xarjDbjBUUqeOR8+qbUYkzaTniBvAZ2sB0oY
	v9YxpK2MuqQmQvnw6jyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sirzb-0000000AU7f-2EUF;
	Tue, 27 Aug 2024 08:55:59 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sirzO-0000000AU2E-17L9;
	Tue, 27 Aug 2024 08:55:47 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 2CEDCA4168D;
	Tue, 27 Aug 2024 08:55:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E362BC8B7A5;
	Tue, 27 Aug 2024 08:55:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724748944;
	bh=WLyDwKrTLwxUKO9wLuHMkEx2eqbtMQG2RDk7GrJYDXs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DusVZnZ7wV2iULh/1avLL75JPrhMhQlBqoECiJtic0bUtwgwuIxQeD5hzgO3OPkyS
	 dpl+eK1bBgzJJ35WOwwwbfdgq1YQrY2eHAEWUAKnv8OixY+PRJYPtQH9Uh4KDOOHgD
	 2/VI5iJPwBhdC5LsFDFX73FW+2wIcx/umVi6Bv43EvELDrk40xPn4mIuDGkezsnKRA
	 xbs+ZNNQqQDTYUIePAvIqd1K0l/VrmBAarQw0NUQwiKK+jAlMR+ifUUyK+I6EB0ATl
	 0IqZzSdRMeIajz+pVDlkeyPLq3GoGX7ttE4pCEa3ZuqwGkXktl0F6ooJc0ev3A8Yxa
	 2+SfAAZCXhU+Q==
Date: Tue, 27 Aug 2024 11:52:55 +0300
From: Mike Rapoport <rppt@kernel.org>
To: Bruno Faccini <bfaccini@nvidia.com>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Andreas Larsson <andreas@gaisler.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Arnd Bergmann <arnd@arndb.de>, Borislav Petkov <bp@alien8.de>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Dan Williams <dan.j.williams@intel.com>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	David Hildenbrand <david@redhat.com>,
	"David S. Miller" <davem@davemloft.net>,
	Davidlohr Bueso <dave@stgolabs.net>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Heiko Carstens <hca@linux.ibm.com>,
	Huacai Chen <chenhuacai@kernel.org>, Ingo Molnar <mingo@redhat.com>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
	Jonathan Cameron <jonathan.cameron@huawei.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Samuel Holland <samuel.holland@sifive.com>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Thomas Gleixner <tglx@linutronix.de>,
	Vasily Gorbik <gor@linux.ibm.com>, Will Deacon <will@kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-acpi@vger.kernel.org" <linux-acpi@vger.kernel.org>,
	"linux-arch@vger.kernel.org" <linux-arch@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"linux-cxl@vger.kernel.org" <linux-cxl@vger.kernel.org>,
	"linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
	"linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
	"linux-mm@kvack.org" <linux-mm@kvack.org>,
	"linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
	"linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>,
	"linux-sh@vger.kernel.org" <linux-sh@vger.kernel.org>,
	"linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
	"loongarch@lists.linux.dev" <loongarch@lists.linux.dev>,
	"nvdimm@lists.linux.dev" <nvdimm@lists.linux.dev>,
	"sparclinux@vger.kernel.org" <sparclinux@vger.kernel.org>,
	"x86@kernel.org" <x86@kernel.org>, Zi Yan <ziy@nvidia.com>
Subject: Re: [PATCH v4 24/26] arch_numa: switch over to numa_memblks
Message-ID: <Zs2T5wkSYO9MGcab@kernel.org>
References: <MW4PR12MB72616723E1A090E315681FF6A38B2@MW4PR12MB7261.namprd12.prod.outlook.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <MW4PR12MB72616723E1A090E315681FF6A38B2@MW4PR12MB7261.namprd12.prod.outlook.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240827_015546_459964_9916EF08 
X-CRM114-Status: GOOD (  29.40  )
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

Hi,

On Mon, Aug 26, 2024 at 06:17:22PM +0000, Bruno Faccini wrote:
> > On 7 Aug 2024, at 2:41, Mike Rapoport wrote:
> > 
> > From: "Mike Rapoport (Microsoft)" <rppt@kernel.org>
> > 
> > Until now arch_numa was directly translating firmware NUMA information
> > to memblock.
> > 
> > Using numa_memblks as an intermediate step has a few advantages:
> > * alignment with more battle tested x86 implementation
> > * availability of NUMA emulation
> > * maintaining node information for not yet populated memory
> > 
> > Adjust a few places in numa_memblks to compile with 32-bit phys_addr_t
> > and replace current functionality related to numa_add_memblk() and
> > __node_distance() in arch_numa with the implementation based on
> > numa_memblks and add functions required by numa_emulation.
> > 
> > Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
> > Tested-by: Zi Yan <ziy@nvidia.com> # for x86_64 and arm64
> > Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
> > Tested-by: Jonathan Cameron <Jonathan.Cameron@huawei.com> [arm64 + CXL via
> > QEMU]
> > Acked-by: Dan Williams <dan.j.williams@intel.com>
> > Acked-by: David Hildenbrand <david@redhat.com>
> > ---
> >   drivers/base/Kconfig       |   1 +
> >   drivers/base/arch_numa.c   | 201 +++++++++++--------------------------
> >   include/asm-generic/numa.h |   6 +-
> >   mm/numa_memblks.c          |  17 ++--
> >   4 files changed, 75 insertions(+), 150 deletions(-)
> >  
> > <snip>
> > 
> > +
> > +u64 __init numa_emu_dma_end(void)
> > +{
> > +             return PFN_PHYS(memblock_start_of_DRAM() + SZ_4G);
> > +}
> > +
> 
> PFN_PHYS() translation is unnecessary here, as
> memblock_start_of_DRAM() + SZ_4G is already a
> memory size.
> 
> This should fix it:
>  
> diff --git a/drivers/base/arch_numa.c b/drivers/base/arch_numa.c
> index 8d49893c0e94..e18701676426 100644
> --- a/drivers/base/arch_numa.c
> +++ b/drivers/base/arch_numa.c
> @@ -346,7 +346,7 @@ void __init numa_emu_update_cpu_to_node(int
> *emu_nid_to_phys,
> 
> u64 __init numa_emu_dma_end(void)
> {
> -              return PFN_PHYS(memblock_start_of_DRAM() + SZ_4G);
> +             return memblock_start_of_DRAM() + SZ_4G;
> }
> 
> void debug_cpumask_set_cpu(unsigned int cpu, int node, bool enable)

Right, I've missed that. Thanks for the fix!

Andrew, can you please apply this (with fixed formatting)

diff --git a/drivers/base/arch_numa.c b/drivers/base/arch_numa.c
index 8d49893c0e94..e18701676426 100644
--- a/drivers/base/arch_numa.c
+++ b/drivers/base/arch_numa.c
@@ -346,7 +346,7 @@ void __init numa_emu_update_cpu_to_node(int *emu_nid_to_phys,
 
 u64 __init numa_emu_dma_end(void)
 {
-	return PFN_PHYS(memblock_start_of_DRAM() + SZ_4G);
+	return memblock_start_of_DRAM() + SZ_4G;
 }
 
 void debug_cpumask_set_cpu(unsigned int cpu, int node, bool enable)

-- 
Sincerely yours,
Mike.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
