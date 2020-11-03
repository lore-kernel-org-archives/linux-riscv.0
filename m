Return-Path: <SRS0=g6PI=EJ=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 71468C2D0A3
	for <linux-riscv@archiver.kernel.org>; Tue,  3 Nov 2020 09:53:39 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id ECE512080C
	for <linux-riscv@archiver.kernel.org>; Tue,  3 Nov 2020 09:53:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="zrsn/GVz";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="djsvb14S"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org ECE512080C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=+1+TaGtmTCqa38EVNpTmjVUC/1QZD0FjnM5WjeUNRhU=; b=zrsn/GVzZHshqE52flvc6OO4Z
	GB9Br1ThzKf7k3bVZ1zNTMukh0jvuilSbX6HGlGfvCK9i/aeTl6UUUxtgbJVhV470N2RMwiUzDofD
	9VDpOylluUnDzQZkJ4b4rZEcu0x82Bp7InSO+bVebL7XmziTYJLIygTjKqTWeHWSxCoUd+piHJmWm
	p8K8DBkOaj4pDL83g6QVuJ6WfAAM0XKrW3yipmtqTwvKeemAephN1tgNmbg8AaoMYD8pr2pl+KUZD
	kWtRHcndlK2zeZglRh8OvD6vUpAGWZIfjTm/ohsMpN0aQijJQZSdZdfCJPKyDrrGrgY/jbRQMsP02
	57OfPEYXw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kZt0E-00027a-AV; Tue, 03 Nov 2020 09:53:22 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kZszu-00023o-KA; Tue, 03 Nov 2020 09:53:05 +0000
Received: from kernel.org (unknown [87.71.17.26])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 0BBB92080C;
 Tue,  3 Nov 2020 09:52:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1604397181;
 bh=lh70U56vprDGYqn/Uu8IBJ+iWmElKUpwOZcmksn3MyU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=djsvb14SN0dTNdL0dHydqIGZTQQJIWeDKAvtb0veCp5Ix1gEvvQVcFhgeonkgf1/J
 RQrD7O/5SRUemCadMxWpVVfGhzdDbjksjDdqo9s8ZkUJfcSYo4rTs7bMtgSd2XHOjJ
 QvgAK34USsCDWELlPKdltzRhz93byDZzTNIknty0=
Date: Tue, 3 Nov 2020 11:52:47 +0200
From: Mike Rapoport <rppt@kernel.org>
To: David Hildenbrand <david@redhat.com>
Subject: Re: [PATCH v6 0/6] mm: introduce memfd_secret system call to create
 "secret" memory areas
Message-ID: <20201103095247.GH4879@kernel.org>
References: <20200924132904.1391-1-rppt@kernel.org>
 <9c38ac3b-c677-6a87-ce82-ec53b69eaf71@redhat.com>
 <20201102174308.GF4879@kernel.org>
 <d4cb2c87-4744-3929-cedd-2be78625a741@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <d4cb2c87-4744-3929-cedd-2be78625a741@redhat.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201103_045303_104248_53804668 
X-CRM114-Status: GOOD (  32.69  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Mark Rutland <mark.rutland@arm.com>, Peter Zijlstra <peterz@infradead.org>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Dave Hansen <dave.hansen@linux.intel.com>, linux-mm@kvack.org,
 Will Deacon <will@kernel.org>, linux-kselftest@vger.kernel.org,
 "H. Peter Anvin" <hpa@zytor.com>, Christopher Lameter <cl@linux.com>,
 Idan Yaniv <idan.yaniv@ibm.com>, Thomas Gleixner <tglx@linutronix.de>,
 Elena Reshetova <elena.reshetova@intel.com>, linux-arch@vger.kernel.org,
 Tycho Andersen <tycho@tycho.ws>, linux-nvdimm@lists.01.org,
 Shuah Khan <shuah@kernel.org>, x86@kernel.org,
 Matthew Wilcox <willy@infradead.org>, Mike Rapoport <rppt@linux.ibm.com>,
 Ingo Molnar <mingo@redhat.com>, Michael Kerrisk <mtk.manpages@gmail.com>,
 Arnd Bergmann <arnd@arndb.de>, James Bottomley <jejb@linux.ibm.com>,
 Borislav Petkov <bp@alien8.de>, Alexander Viro <viro@zeniv.linux.org.uk>,
 Andy Lutomirski <luto@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>,
 "Kirill A. Shutemov" <kirill@shutemov.name>,
 Dan Williams <dan.j.williams@intel.com>, linux-arm-kernel@lists.infradead.org,
 linux-api@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, Palmer Dabbelt <palmer@dabbelt.com>,
 linux-fsdevel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Mon, Nov 02, 2020 at 06:51:09PM +0100, David Hildenbrand wrote:
> > > Assume you have a system with quite some ZONE_MOVABLE memory (esp. in
> > > virtualized environments), eating up a significant amount of !ZONE_MOVABLE
> > > memory dynamically at runtime can lead to non-obvious issues. It looks like
> > > you have plenty of free memory, but the kernel might still OOM when trying
> > > to do kernel allocations e.g., for pagetables. With CMA we at least know
> > > what we're dealing with - it behaves like ZONE_MOVABLE except for the owner
> > > that can place unmovable pages there. We can use it to compute statically
> > > the amount of ZONE_MOVABLE memory we can have in the system without doing
> > > harm to the system.
> > 
> > Why would you say that secretmem allocates from !ZONE_MOVABLE?
> > If we put boot time reservations aside, the memory allocation for
> > secretmem follows the same rules as the memory allocations for any file
> > descriptor. That means we allocate memory with GFP_HIGHUSER_MOVABLE.
> 
> Oh, okay - I missed that! I had the impression that pages are unmovable and
> allocating from ZONE_MOVABLE would be a violation of that?
> 
> > After the allocation the memory indeed becomes unmovable but it's not
> > like we are eating memory from other zones here.
> 
> ... and here you have your problem. That's a no-no. We only allow it in very
> special cases where it can't be avoided - e.g., vfio having to pin guest
> memory when passing through memory to VMs.
> 
> Hotplug memory, online it to ZONE_MOVABLE. Allocate secretmem. Try to unplug
> the memory again -> endless loop in offline_pages().
> 
> Or have a CMA area that gets used with GFP_HIGHUSER_MOVABLE. Allocate
> secretmem. The owner of the area tries to allocate memory - always fails.
> Purpose of CMA destroyed.
> 
> > 
> > > Ideally, we would want to support page migration/compaction and allow for
> > > allocation from ZONE_MOVABLE as well. Would involve temporarily mapping,
> > > copying, unmapping. Sounds feasible, but not sure which roadblocks we would
> > > find on the way.
> > 
> > We can support migration/compaction with temporary mapping. The first
> > roadblock I've hit there was that migration allocates 4K destination
> > page and if we use it in secret map we are back to scrambling the direct
> > map into 4K pieces. It still sounds feasible but not as trivial :)
> 
> That sounds like the proper way for me to do it then.
 
Although migration of secretmem pages sounds feasible now, there maybe
other issues I didn't see because I'm not very familiar with
migration/compaction code.

I've looked again at CMA and I'm inclined to agree with you that using
CMA for secretmem allocations could be the right thing. 

-- 
Sincerely yours,
Mike.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
