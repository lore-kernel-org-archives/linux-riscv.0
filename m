Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC31DC3DA59
	for <linux-riscv@archiver.kernel.org>; Fri, 19 Jul 2024 15:52:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hoyE63QgqtJKOv5bQ1m2yQpYruCvdL6OPQTE0RFrftY=; b=lgI37TEF/9P0Cr
	CX7Lm+PUE5DsI+JcAiOoFQzoHlYUMnmHHGaGRDTS1AUcQhP2H19CbjcLBodz7njerLhHMqMmSc9rv
	VJ6oDHMjcq7o0vubY2Dy5ELPIA5KEblZEW7Kbsq2kEPCwGNFavCVveIPNcOdXyP+nnTnm/GsL6N4l
	TSFereAQhM67emc+opuyLVU6QaKeL7RvPPvfnsSM1GxTMD5W3gWq5qepmgtZ1u7G7pyx1zFzkVkLZ
	62odMgn9HayEhg3udO+dupQKbdH0AtfHLnt2u9lEZU+6ZSc9Booi+M4MtBZvng2MtY1pjI52VPLF5
	pDjU2pIlNpzbuzDk7ZXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sUpu5-000000038hT-1A0B;
	Fri, 19 Jul 2024 15:52:17 +0000
Received: from frasgout.his.huawei.com ([185.176.79.56])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sUpti-000000038Zu-2C9w;
	Fri, 19 Jul 2024 15:51:56 +0000
Received: from mail.maildlp.com (unknown [172.18.186.231])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4WQYyl1P08z6J67T;
	Fri, 19 Jul 2024 23:49:51 +0800 (CST)
Received: from lhrpeml500005.china.huawei.com (unknown [7.191.163.240])
	by mail.maildlp.com (Postfix) with ESMTPS id BC470140517;
	Fri, 19 Jul 2024 23:51:45 +0800 (CST)
Received: from localhost (10.48.157.16) by lhrpeml500005.china.huawei.com
 (7.191.163.240) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.39; Fri, 19 Jul
 2024 16:51:44 +0100
Date: Fri, 19 Jul 2024 16:51:43 +0100
From: Jonathan Cameron <Jonathan.Cameron@Huawei.com>
To: David Hildenbrand <david@redhat.com>
CC: Mike Rapoport <rppt@kernel.org>, <linux-kernel@vger.kernel.org>,
	"Alexander Gordeev" <agordeev@linux.ibm.com>, Andreas Larsson
	<andreas@gaisler.com>, Andrew Morton <akpm@linux-foundation.org>, Arnd
 Bergmann <arnd@arndb.de>, Borislav Petkov <bp@alien8.de>, Catalin Marinas
	<catalin.marinas@arm.com>, Christophe Leroy <christophe.leroy@csgroup.eu>,
	Dan Williams <dan.j.williams@intel.com>, Dave Hansen
	<dave.hansen@linux.intel.com>, "David S. Miller" <davem@davemloft.net>, Greg
 Kroah-Hartman <gregkh@linuxfoundation.org>, Heiko Carstens
	<hca@linux.ibm.com>, "Huacai Chen" <chenhuacai@kernel.org>, Ingo Molnar
	<mingo@redhat.com>, Jiaxun Yang <jiaxun.yang@flygoat.com>, John Paul Adrian
 Glaubitz <glaubitz@physik.fu-berlin.de>, Michael Ellerman
	<mpe@ellerman.id.au>, Palmer Dabbelt <palmer@dabbelt.com>, "Rafael J.
 Wysocki" <rafael@kernel.org>, Rob Herring <robh@kernel.org>, Thomas
 Bogendoerfer <tsbogend@alpha.franken.de>, Thomas Gleixner
	<tglx@linutronix.de>, "Vasily Gorbik" <gor@linux.ibm.com>, Will Deacon
	<will@kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<loongarch@lists.linux.dev>, <linux-mips@vger.kernel.org>,
	<linuxppc-dev@lists.ozlabs.org>, <linux-riscv@lists.infradead.org>,
	<linux-s390@vger.kernel.org>, <linux-sh@vger.kernel.org>,
	<sparclinux@vger.kernel.org>, <linux-acpi@vger.kernel.org>,
	<linux-cxl@vger.kernel.org>, <nvdimm@lists.linux.dev>,
	<devicetree@vger.kernel.org>, <linux-arch@vger.kernel.org>,
	<linux-mm@kvack.org>, <x86@kernel.org>
Subject: Re: [PATCH 05/17] arch, mm: pull out allocation of NODE_DATA to
 generic code
Message-ID: <20240719165143.0000002e@Huawei.com>
In-Reply-To: <96850252-a49f-4d78-a94b-a9a25e3f2bd5@redhat.com>
References: <20240716111346.3676969-1-rppt@kernel.org>
	<20240716111346.3676969-6-rppt@kernel.org>
	<220da8ed-337a-4b1e-badf-2bff1d36e6c3@redhat.com>
	<Zpi-HAb7EBxrZBtK@kernel.org>
	<96850252-a49f-4d78-a94b-a9a25e3f2bd5@redhat.com>
Organization: Huawei Technologies Research and Development (UK) Ltd.
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.33; x86_64-w64-mingw32)
MIME-Version: 1.0
X-Originating-IP: [10.48.157.16]
X-ClientProxiedBy: lhrpeml100006.china.huawei.com (7.191.160.224) To
 lhrpeml500005.china.huawei.com (7.191.163.240)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240719_085154_866768_C0A0E842 
X-CRM114-Status: GOOD (  20.34  )
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

On Fri, 19 Jul 2024 17:07:35 +0200
David Hildenbrand <david@redhat.com> wrote:

> >>> -	 * Allocate node data.  Try node-local memory and then any node.
> >>> -	 * Never allocate in DMA zone.
> >>> -	 */
> >>> -	nd_pa = memblock_phys_alloc_try_nid(nd_size, SMP_CACHE_BYTES, nid);
> >>> -	if (!nd_pa) {
> >>> -		pr_err("Cannot find %zu bytes in any node (initial node: %d)\n",
> >>> -		       nd_size, nid);
> >>> -		return;
> >>> -	}
> >>> -	nd = __va(nd_pa);
> >>> -
> >>> -	/* report and initialize */
> >>> -	printk(KERN_INFO "NODE_DATA(%d) allocated [mem %#010Lx-%#010Lx]\n", nid,
> >>> -	       nd_pa, nd_pa + nd_size - 1);
> >>> -	tnid = early_pfn_to_nid(nd_pa >> PAGE_SHIFT);
> >>> -	if (tnid != nid)
> >>> -		printk(KERN_INFO "    NODE_DATA(%d) on node %d\n", nid, tnid);
> >>> -
> >>> -	node_data[nid] = nd;
> >>> -	memset(NODE_DATA(nid), 0, sizeof(pg_data_t));
> >>> -
> >>> -	node_set_online(nid);
> >>> -}
> >>> -
> >>>    /**
> >>>     * numa_cleanup_meminfo - Cleanup a numa_meminfo
> >>>     * @mi: numa_meminfo to clean up
> >>> @@ -571,6 +538,7 @@ static int __init numa_register_memblks(struct numa_meminfo *mi)
> >>>    			continue;
> >>>    		alloc_node_data(nid);
> >>> +		node_set_online(nid);
> >>>    	}  
> >>
> >> I can spot that we only remove a single node_set_online() call from x86.
> >>
> >> What about all the other architectures? Will there be any change in behavior
> >> for them? Or do we simply set the nodes online later once more?  
> > 
> > On x86 node_set_online() was a part of alloc_node_data() and I moved it
> > outside so it's called right after alloc_node_data(). On other
> > architectures the allocation didn't include that call, so there should be
> > no difference there.  
> 
> But won't their arch code try setting the nodes online at a later stage?
> 
> And I think, some architectures only set nodes online conditionally
> (see most other node_set_online() calls).
> 
> Sorry if I'm confused here, but with now unconditional node_set_online(), won't
> we change the behavior of other architectures?
This is moving x86 code to x86 code, not a generic location
so how would that affect anyone else? Their onlining should be same as
before.

The node onlining difference are a pain (I recall that fun from adding
generic initiators) as different ordering on x86 and arm64 at least.

Jonathan

> 


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
