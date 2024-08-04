Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1D2CC52D70
	for <linux-riscv@archiver.kernel.org>; Sun,  4 Aug 2024 07:27:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=P0qSPGv4NxA//WQpROoogafHcUceB+iwLWHizZ3XR88=; b=zr6Ta9AFwatoav
	PMvrB13cKP9uYgoORdOT3Ibbj/Cu/DJm7oc4ZPQ/yqo9yvPm8yS4n+U8fxrk5NblXaDsZqB0xM4vi
	DPv01pu7T/90vfbwk+Qv3F8Nnx4VVmXJeCnousSvntWyx4PM92mn6vbMFVev1e5Pa6XAu8BgyYOVQ
	eVCFBnkV4+ppS5MxVpjgoHK+E0CnsWpn3YWYhU4Xm6TqOi90Mp3UYABwsWL1bu9bPrDjCpAi8blr5
	T4eHKbt9Dd5hpxjbMKB7+3VEE6w5M1kacn1/W+PV8gXvAyl2gLDEEPNFcYt6CwJYGo4rP8gsl0Zd/
	y8/Qxpdt7qfoTOyK+2IA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1saVe2-0000000CpB1-0C1k;
	Sun, 04 Aug 2024 07:27:10 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1saVdT-0000000CozW-0RVX;
	Sun, 04 Aug 2024 07:26:36 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 8829660BD3;
	Sun,  4 Aug 2024 07:26:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DD611C32786;
	Sun,  4 Aug 2024 07:26:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722756393;
	bh=rx2UdBu3Jn4YvMBlkSpIvWfaZAHG3g5eVDYxreRC0w8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KIU8LoVOwFPBw/i+e9r4MNw3lCZ9Vibx6Dii6JlG87646MCH9g5WB4uLhl1sgD8XY
	 fdhDH8dGci/plC04bp2qqqFN5dQbJHMWc6fWKJYivJ+bk5+GubVSlg3B3t+HSNIfir
	 JTwRTaCcEoGzTNU1jYvwPfIqnBAdwUe1xFf3HqAX19LfaXMjWdmtrEyuqIK93JEmBz
	 EFHb56nL5u7GvI90DNZwVtfaVmCpUg9fU4iOezzHPPuQFpcF1invnI5Iw9ThB6TUT4
	 ADe9mcgPXLgojRwwccp6Y65CANZWgRQC4iHBhVf31YxxkVq1gi+zDus1lvqFhKf27J
	 Jc+qx/YNiH/Gg==
Date: Sun, 4 Aug 2024 10:24:15 +0300
From: Mike Rapoport <rppt@kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	linux-kernel@vger.kernel.org,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Andreas Larsson <andreas@gaisler.com>,
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
	Jonathan Corbet <corbet@lwn.net>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Samuel Holland <samuel.holland@sifive.com>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Thomas Gleixner <tglx@linutronix.de>,
	Vasily Gorbik <gor@linux.ibm.com>, Will Deacon <will@kernel.org>,
	Zi Yan <ziy@nvidia.com>, devicetree@vger.kernel.org,
	linux-acpi@vger.kernel.org, linux-arch@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-cxl@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-mips@vger.kernel.org,
	linux-mm@kvack.org, linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org, linux-sh@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, loongarch@lists.linux.dev,
	nvdimm@lists.linux.dev, sparclinux@vger.kernel.org, x86@kernel.org
Subject: Re: [PATCH v3 07/26] mm: drop CONFIG_HAVE_ARCH_NODEDATA_EXTENSION
Message-ID: <Zq8sn5iD1iOmYrss@kernel.org>
References: <20240801060826.559858-1-rppt@kernel.org>
 <20240801060826.559858-8-rppt@kernel.org>
 <20240802104922.000051a0@Huawei.com>
 <20240803115813.809f808f1afbe9f9feaae129@linux-foundation.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240803115813.809f808f1afbe9f9feaae129@linux-foundation.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240804_002635_302623_9B269C9F 
X-CRM114-Status: GOOD (  31.33  )
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

On Sat, Aug 03, 2024 at 11:58:13AM -0700, Andrew Morton wrote:
> On Fri, 2 Aug 2024 10:49:22 +0100 Jonathan Cameron <Jonathan.Cameron@Huawei.com> wrote:
> 
> > > --- a/mm/mm_init.c
> > > +++ b/mm/mm_init.c
> > > @@ -1838,11 +1838,10 @@ void __init free_area_init(unsigned long *max_zone_pfn)
> > >  
> > >  		if (!node_online(nid)) {
> > >  			/* Allocator not initialized yet */
> > > -			pgdat = arch_alloc_nodedata(nid);
> > > +			pgdat = memblock_alloc(sizeof(*pgdat), SMP_CACHE_BYTES);
> > >  			if (!pgdat)
> > >  				panic("Cannot allocate %zuB for node %d.\n",
> > >  				       sizeof(*pgdat), nid);
> > > -			arch_refresh_nodedata(nid, pgdat);
> > 
> > This allocates pgdat but never sets node_data[nid] to it
> > and promptly leaks it on the line below. 
> > 
> > Just to sanity check this I spun up a qemu machine with no memory
> > initially present on some nodes and it went boom as you'd expect.
> > 
> > I tested with addition of
> > 			NODE_DATA(nid) = pgdat;
> > and it all seems to work as expected.
> 
> Thanks, I added that.  It blew up on x86_64 allnoconfig because
> node_data[] (and hence NODE_DATA()) isn't an lvalue when CONFIG_NUMA=n.
> 
> I'll put some #ifdef CONFIG_NUMAs in there for now but
> 
> a) NODE_DATA() is upper-case. Implies "constant".  Shouldn't be assigned to.
> 
> b) NODE_DATA() should be non-lvalue when CONFIG_NUMA=y also.  But no,
>    we insist on implementing things in cpp instead of in C.

This looks like a candidate for a separate tree-wide cleanup.
 
> c) In fact assigning to anything which ends in "()" is nuts.  Please
>    clean up my tempfix.
> 
> c) Mike, generally I'm wondering if there's a bunch of code here
>    which isn't needed on CONFIG_NUMA=n.  Please check all of this for
>    unneeded bloatiness.

I believe the patch addresses your concerns, just with this the commit log
needs update. Instead of 

    Replace the call to arch_alloc_nodedata() in free_area_init() with
    memblock_alloc(), remove arch_refresh_nodedata() and cleanup
    include/linux/memory_hotplug.h from the associated ifdefery.

it should be

    Replace the call to arch_alloc_nodedata() in free_area_init() with a
    new helper alloc_offline_node_data(), remove arch_refresh_nodedata()
    and cleanup include/linux/memory_hotplug.h from the associated
    ifdefery.

I can send an updated patch if you prefer.

diff --git a/include/linux/numa.h b/include/linux/numa.h
index 3b12d8ca0afd..5a749fd67f39 100644
--- a/include/linux/numa.h
+++ b/include/linux/numa.h
@@ -34,6 +34,7 @@ extern struct pglist_data *node_data[];
 #define NODE_DATA(nid)	(node_data[nid])
 
 void __init alloc_node_data(int nid);
+void __init alloc_offline_node_data(int nit);
 
 /* Generic implementation available */
 int numa_nearest_node(int node, unsigned int state);
@@ -62,6 +63,8 @@ static inline int phys_to_target_node(u64 start)
 {
 	return 0;
 }
+
+static inline void alloc_offline_node_data(int nit) {}
 #endif
 
 #define numa_map_to_online_node(node) numa_nearest_node(node, N_ONLINE)
diff --git a/mm/mm_init.c b/mm/mm_init.c
index bcc2f2dd8021..2785be04e7bb 100644
--- a/mm/mm_init.c
+++ b/mm/mm_init.c
@@ -1836,13 +1836,8 @@ void __init free_area_init(unsigned long *max_zone_pfn)
 	for_each_node(nid) {
 		pg_data_t *pgdat;
 
-		if (!node_online(nid)) {
-			/* Allocator not initialized yet */
-			pgdat = memblock_alloc(sizeof(*pgdat), SMP_CACHE_BYTES);
-			if (!pgdat)
-				panic("Cannot allocate %zuB for node %d.\n",
-				       sizeof(*pgdat), nid);
-		}
+		if (!node_online(nid))
+			alloc_offline_node_data(nid);
 
 		pgdat = NODE_DATA(nid);
 		free_area_init_node(nid);
diff --git a/mm/numa.c b/mm/numa.c
index da27eb151dc5..07e486a977c7 100644
--- a/mm/numa.c
+++ b/mm/numa.c
@@ -34,6 +34,18 @@ void __init alloc_node_data(int nid)
 	memset(NODE_DATA(nid), 0, sizeof(pg_data_t));
 }
 
+void __init alloc_offline_node_data(int nit)
+{
+	pg_data_t *pgdat;
+
+	pgdat = memblock_alloc(sizeof(*pgdat), SMP_CACHE_BYTES);
+	if (!pgdat)
+		panic("Cannot allocate %zuB for node %d.\n",
+		      sizeof(*pgdat), nid);
+
+	node_data[nid] = pgdat;
+}
+
 /* Stub functions: */
 
 #ifndef memory_add_physaddr_to_nid

 

-- 
Sincerely yours,
Mike.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
