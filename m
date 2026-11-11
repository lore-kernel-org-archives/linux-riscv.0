Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A659C606A894
	for <linux-riscv@archiver.kernel.org>; Wed, 11 Nov 2026 11:53:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=WbaoZBxm;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=fujitsu.com header.i=@fujitsu.com header.a=rsa-sha256 header.s=fj2 header.b=FFq+5+SG
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=JpGjF0+q90+CxSz6OB2RCD1BhgBLcQ5Ddct3+02lT80=; b=WbaoZBxmmgELUI30XnWrCfuL3R
	nY3yQ2BdopQxtr79vu9kQPPxFKLvEctuS1fFopubVSEKpRlXfVaAnT1+Q0vzvFCFdt2VsZFylpgZa
	Jyo+dNJqaGHBdAN0z247yi1x7HGAxUt+iJwSmwch8B6GMsYsPtpVFiy7Yw+yYuB6EGR531jOkAo2a
	tY26c+nRQ7DZCJapNC4BLU0LKqmVjv1bBhNQ39OD6iIB0py7zu+m4UgIQ2dIud/pKl9OVPnJWQOmb
	oqwh8sgu7/x0qEbt8bInw38Xl9ibkabxDmD2tZ7AcmedGa43iTCqJoRjea6JzOFMxxVGgUDL4O9im
	QRsuY31Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xR6tN-00000006YBN-2YpN;
	Wed, 11 Nov 2026 11:53:29 +0000
Received: from esa2.hc1455-7.c3s2.iphmx.com ([207.54.90.48])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xR6tK-00000006YAh-0Dgv;
	Wed, 11 Nov 2026 11:53:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1794398014; x=1825934014;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=HCCipxtjnPjwYW8DIXAeMVHDqScHm74Hg2zPPlBSipM=;
  b=FFq+5+SG7mwgjZWSf3NUjdF+nrRr2enhu3SJXYAl/5a5HeblDaDJdMt3
   lXJbE0YmgvRbo8YRCg9CZg/MIXd90BR+My9DacBt2JvB79JWOS0ck73Kc
   NmS4bBMbTIkqjLrSWiHgg/ONBpp1aNHsdtblHjs3As+jn7JFFA6qAQE8N
   lvO/iH1fU9A3wbRfhy/SIHKORVJDNwMOvmWR1sey07Lxlie/cHh7baWpq
   yFhUXsXdtuolGVi2w5pss3l1dJWG0YQa5Gl+kS3019WBKLrAbAutAUiM7
   pH5WXN8AB+kTkpEYXT/VXTEBJVuAjUj+Z63oPOqi6AGhtaBor7lrTiQH2
   g==;
X-CSE-ConnectionGUID: ZdtrVOsCQmytxX8fH02Z0g==
X-CSE-MsgGUID: qIyBpLAURR+wRMR6lLs3AA==
X-IronPort-AV: E=McAfee;i="6800,10657,11962"; a="261420800"
X-IronPort-AV: E=Sophos;i="6.27,207,1786978800"; 
   d="scan'208";a="261420800"
Received: from gmgwnl01.global.fujitsu.com (HELO mgmgwnl01.global.fujitsu.com) ([52.143.17.124])
  by esa2.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Nov 2026 20:53:30 +0900
Received: from az2nlsmgm4.fujitsu.com (unknown [10.150.26.204])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mgmgwnl01.global.fujitsu.com (Postfix) with ESMTPS id 7ED3B3FD0;
	Wed, 11 Nov 2026 11:53:22 +0000 (UTC)
Received: from az2nlsmom3.fujitsu.com (unknown [10.150.26.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm4.fujitsu.com (Postfix) with ESMTPS id 3653510001FC;
	Wed, 11 Nov 2026 11:53:22 +0000 (UTC)
Received: from FCCLS0092175.localdomain (unknown [10.9.86.149])
	by az2nlsmom3.fujitsu.com (Postfix) with SMTP id 52B3F101BB7F;
	Wed, 11 Nov 2026 11:53:02 +0000 (UTC)
Date: Wed, 11 Nov 2026 20:53:00 +0900
From: Kohei Enju <enju.kohei@fujitsu.com>
To: "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, iommu@lists.linux.dev, linux-kernel@vger.kernel.org, 
	Robin Murphy <robin.murphy@arm.com>, Marek Szyprowski <m.szyprowski@samsung.com>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Randy Dunlap <rdunlap@infradead.org>, Mark Rutland <mark.rutland@arm.com>, 
	Marc Zyngier <maz@kernel.org>, Steven Price <steven.price@arm.com>, 
	Suzuki K Poulose <Suzuki.Poulose@arm.com>, Jiri Pirko <jiri@resnulli.us>, Jason Gunthorpe <jgg@ziepe.ca>, 
	Mostafa Saleh <smostafa@google.com>, Petr Tesarik <ptesarik@suse.com>, 
	Alexey Kardashevskiy <aik@amd.com>, Dan Williams <dan.j.williams@intel.com>, 
	Xu Yilun <yilun.xu@linux.intel.com>, Madhavan Srinivasan <maddy@linux.ibm.com>, 
	Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>, "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>, 
	Shrikanth Hegde <sshegde@linux.ibm.com>, Alexander Gordeev <agordeev@linux.ibm.com>, 
	Gerald Schaefer <gerald.schaefer@linux.ibm.com>, Heiko Carstens <hca@linux.ibm.com>, 
	Vasily Gorbik <gor@linux.ibm.com>, Christian Borntraeger <borntraeger@linux.ibm.com>, 
	Sven Schnelle <svens@linux.ibm.com>, Stefano Stabellini <sstabellini@kernel.org>, 
	Russell King <linux@armlinux.org.uk>, Huacai Chen <chenhuacai@kernel.org>, 
	WANG Xuerui <kernel@xen0n.name>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
	Jiaxun Yang <jiaxun.yang@flygoat.com>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Andy Lutomirski <luto@kernel.org>, 
	Peter Zijlstra <peterz@infradead.org>, Thomas Gleixner <tglx@kernel.org>, 
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, "H. Peter Anvin" <hpa@zytor.com>, 
	linux-arm-kernel@lists.infradead.org, loongarch@lists.linux.dev, linux-mips@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org, 
	x86@kernel.org
Subject: Re: [PATCH v6 6/8] dma: swiotlb: Centralize memory-encryption pool
 sizing
Message-ID: <avRKiCBs81XSYMqW@FCCLS0092175.localdomain>
References: <20260924060756.1325156-7-aneesh.kumar@kernel.org>
 <asVs3doaJ4WrT3M2@willie-the-truck>
 <asYZFXGyafRjjBS0@arm.com>
 <asYiOgskwi8JYLe_@willie-the-truck>
 <yq5awlrt3dwo.fsf@kernel.org>
 <yq5av77c92oo.fsf@kernel.org>
 <aseRzPshcoys7AJS@arm.com>
 <yq5ao6d48dqr.fsf@kernel.org>
 <auR0fT1yrKQ9wbm8@FCCLS0092175.localdomain>
 <yq5a8q3d9oe6.fsf@kernel.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <yq5a8q3d9oe6.fsf@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261111_035326_389970_7A7DA267 
X-CRM114-Status: GOOD (  27.14  )
X-Spam-Score: -4.4 (----)
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-8.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Aneesh,

On 11/01 09:47, Aneesh Kumar K.V wrote:
[...]
> >
> > Hi Aneesh,
> >
> > I can reproduce the CCA regression discussed in this thread:
> >   https://lore.kernel.org/all/yq5azeyxyfol.fsf@kernel.org/#t
> >
> > The guest runs out of SWIOTLB slots, causing disk I/O to fail and
> > preventing the guest from booting.
> >
> > I would like to test the fix on real CCA hardware. Could you please Cc
> > me when you respin the series? I follow LKML, but I may still miss the
> > posting by chance.
> >
> 
> The conclusion was to either use CONFIG_SWIOTLB_DYNAMIC or swiotlb kernel command line
> option

Thanks for the clarification.

After reading this whole thread, I agree that dynamic sizing would be
appropriate.

However, currently some distributions do not enable
CONFIG_SWIOTLB_DYNAMIC. Users of such distributions would therefore need
to rebuild their kernels with the option enabled. This is not a
practical solution for many users, particularly cloud users who use
kernels provided by their distributions or cloud providers.

Specifying swiotlb= on the kernel command line is also not particularly
user-friendly. It requires users or cloud providers to choose a fixed
value in advance, without automatically taking into account properties
of the VM, such as its memory size or whether it is a confidential
guest.

I do not think the existing heuristic used for x86 CoCo guests is
necessarily optimal, but a fixed swiotlb= value chosen by each user may
be even less appropriate.

Overall, I would prefer the dynamic sizing approach. However, I believe
the initial pool size still matters.

Also, as Catalin pointed out earlier in the following message:

    https://lore.kernel.org/all/ann6noRzoPLL9kDY@arm.com/

the arm64 adjustment also reduces the target size used for dynamic
pool allocation, since both the initial pool and dynamic allocation
currently use default_nslabs.

I am testing the patch below to decouple the initial pool size from the
dynamic allocation target. It adds swiotlb_adjust_initial_size() for
callers that only want to reduce the initial allocation, while keeping
the existing swiotlb_adjust_size() semantics for callers that want to
adjust both sizes.

Thanks,
Kohei

--->8---
diff --git a/arch/arm64/mm/init.c b/arch/arm64/mm/init.c
index 4e7682dfe366..80a2c171895f 100644
--- a/arch/arm64/mm/init.c
+++ b/arch/arm64/mm/init.c
@@ -349,7 +349,7 @@ void __init arch_mm_preinit(void)
                unsigned long size =
                        DIV_ROUND_UP(memblock_phys_mem_size(), 1024);

-               swiotlb_adjust_size(min(swiotlb_default_pool_size(), size));
+               swiotlb_adjust_initial_size(min(swiotlb_default_pool_size(), size));
        }

        swiotlb_init(true, flags);
diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
index 070ee69eabb3..7dd9fcec90a5 100644
--- a/arch/riscv/mm/init.c
+++ b/arch/riscv/mm/init.c
@@ -189,7 +189,7 @@ void __init arch_mm_preinit(void)
                 */
                unsigned long size =
                        DIV_ROUND_UP(memblock_phys_mem_size(), 1024);
-               swiotlb_adjust_size(min(swiotlb_default_pool_size(), size));
+               swiotlb_adjust_initial_size(min(swiotlb_default_pool_size(), size));
                swiotlb = true;
                swiotlb_flags |= SWIOTLB_ANY;
        }
diff --git a/include/linux/swiotlb.h b/include/linux/swiotlb.h
index 5f24edf47b68..c1984ee12355 100644
--- a/include/linux/swiotlb.h
+++ b/include/linux/swiotlb.h
@@ -190,6 +190,7 @@ size_t swiotlb_max_mapping_size(struct device *dev);
 bool is_swiotlb_allocated(void);
 bool is_swiotlb_active(struct device *dev);
 void __init swiotlb_adjust_size(unsigned long size);
+void __init swiotlb_adjust_initial_size(unsigned long size);
 phys_addr_t default_swiotlb_base(void);
 phys_addr_t default_swiotlb_limit(void);
 #else
@@ -232,6 +233,10 @@ static inline void swiotlb_adjust_size(unsigned long size)
 {
 }

+static inline void swiotlb_adjust_initial_size(unsigned long size)
+{
+}
+
 static inline phys_addr_t default_swiotlb_base(void)
 {
        return 0;
diff --git a/kernel/dma/swiotlb.c b/kernel/dma/swiotlb.c
index 2c57b49ac7c0..211fefb32fb5 100644
--- a/kernel/dma/swiotlb.c
+++ b/kernel/dma/swiotlb.c
@@ -99,6 +99,7 @@ static struct io_tlb_mem io_tlb_default_mem;
 #endif /* CONFIG_SWIOTLB_DYNAMIC */

 static unsigned long default_nslabs = IO_TLB_DEFAULT_SIZE >> IO_TLB_SHIFT;
+static unsigned long dynamic_nslabs = IO_TLB_DEFAULT_SIZE >> IO_TLB_SHIFT;
 static unsigned long default_nareas;
 static bool swiotlb_cmdline_size_set __initdata;

@@ -152,6 +153,8 @@ static void swiotlb_adjust_nareas(unsigned int nareas)
                nareas = roundup_pow_of_two(nareas);

        default_nareas = nareas;
+       dynamic_nslabs =
+               swiotlb_calc_nslabs(dynamic_nslabs << IO_TLB_SHIFT, nareas);

        pr_info("area num %d.\n", nareas);
        nslabs = swiotlb_calc_nslabs(default_nslabs << IO_TLB_SHIFT, nareas);
@@ -254,6 +257,7 @@ setup_io_tlb_npages(char *str)
                /* avoid tail segment of size < IO_TLB_SEGSIZE */
                default_nslabs =
                        ALIGN(simple_strtoul(str, &str, 0), IO_TLB_SEGSIZE);
+               dynamic_nslabs = default_nslabs;
                swiotlb_cmdline_size_set = true;
        }
        if (*str == ',')
@@ -290,7 +294,7 @@ unsigned long swiotlb_default_pool_size(void)
        return default_nslabs << IO_TLB_SHIFT;
 }

-void __init swiotlb_adjust_size(unsigned long size)
+void __init swiotlb_adjust_initial_size(unsigned long size)
 {
        /*
         * If swiotlb parameter has not been specified, give a chance to
@@ -305,6 +309,12 @@ void __init swiotlb_adjust_size(unsigned long size)
        pr_info("SWIOTLB bounce buffer size adjusted to %luMB", size >> 20);
 }

+void __init swiotlb_adjust_size(unsigned long size)
+{
+       swiotlb_adjust_initial_size(size);
+       dynamic_nslabs = default_nslabs;
+}
+
 void swiotlb_print_info(void)
 {
        struct io_tlb_pool *mem = &io_tlb_default_mem.defpool;
@@ -507,6 +517,7 @@ void __init swiotlb_init_remap(bool addressing_limit, unsigned int flags,
                pr_info("SWIOTLB bounce buffer size adjusted %lu -> %lu slabs",
                        default_nslabs, nslabs);
                default_nslabs = nslabs;
+               dynamic_nslabs = default_nslabs;
        }

        alloc_size = PAGE_ALIGN(array_size(sizeof(*mem->slots), nslabs));
@@ -889,7 +900,7 @@ static void swiotlb_dyn_alloc(struct work_struct *work)
                container_of(work, struct io_tlb_mem, dyn_alloc);
        struct io_tlb_pool *pool;

-       pool = swiotlb_alloc_pool(NULL, mem, IO_TLB_MIN_SLABS, default_nslabs,
+       pool = swiotlb_alloc_pool(NULL, mem, IO_TLB_MIN_SLABS, dynamic_nslabs,
                                  default_nareas, mem->phys_limit, GFP_KERNEL);
        if (!pool) {
                pr_warn_ratelimited("Failed to allocate new pool");


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
