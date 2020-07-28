Return-Path: <SRS0=Fr2v=BH=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1D647C433E3
	for <linux-riscv@archiver.kernel.org>; Tue, 28 Jul 2020 14:15:42 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DCC4A2074F
	for <linux-riscv@archiver.kernel.org>; Tue, 28 Jul 2020 14:15:41 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="CSB+JGZ4";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="QgGc4X7Y"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DCC4A2074F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=YVMbwWRZwuCDO5/ds6EFWvelrJSiffgyHdMjfo+zBp4=; b=CSB+JGZ4Wz5WxVxRn7vt8jQon
	14OW1Q6CTm2UecCunHHEQzvy5uVpUhkX/KBH/a/xWtxvYcks02L2StQ6iFbgaLlahTA9aikhAIX59
	9rtgGgopexkExXRvedlkZg/keHrg4iL5fQ65F5hxWKz/++AjDtEw8k7lkkOtSEsByXDuOBebw+6+K
	SJIFKWI/7s4xrarMinw0ReJxsVTfzntLUMYCxDzwK0OmezV7XLinvFZVtzGcEhakM8d2+tJJpArVD
	J2vzAoTNy1EPW9rHJJ/CozPwt17F5kIywhSdmrp+5gKGiw3BSSV/Y1cLmZjpISOlXinHmbuanSDLd
	vsbjdM8mw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k0QO9-0006wQ-Pd; Tue, 28 Jul 2020 14:15:29 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k0QO0-0006st-E5; Tue, 28 Jul 2020 14:15:21 +0000
Received: from kernel.org (unknown [87.71.40.38])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 7BC04206F5;
 Tue, 28 Jul 2020 14:15:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1595945719;
 bh=lUPY2x+FC7QKHEsbHiDvmWaDq+mpMmmwkd+OggYom1s=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=QgGc4X7YUZ1ckDx2DS7TV0wJ9kprJKWkAHEon+OMgHl2R1sb+tkMTAcVnCBfWfbCy
 0OtC+wiVDREvJNkkA1XcIE7jDME0kzNs1q63GPOaIsM59WTD15P6atSjYRp+nh+npo
 fGSf3gFWEKzBxONEs1GYYDPsR5qUaUEQHRNOUSzo=
Date: Tue, 28 Jul 2020 17:15:04 +0300
From: Mike Rapoport <rppt@kernel.org>
To: Baoquan He <bhe@redhat.com>
Subject: Re: [PATCH 14/15] x86/numa: remove redundant iteration over
 memblock.reserved
Message-ID: <20200728141504.GC3655207@kernel.org>
References: <20200728051153.1590-1-rppt@kernel.org>
 <20200728051153.1590-15-rppt@kernel.org>
 <20200728110254.GA14854@MiWiFi-R3L-srv>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200728110254.GA14854@MiWiFi-R3L-srv>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200728_101520_708264_041CAA14 
X-CRM114-Status: GOOD (  30.70  )
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
Cc: linux-sh@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Dave Hansen <dave.hansen@linux.intel.com>, linux-mips@vger.kernel.org,
 Max Filippov <jcmvbkbc@gmail.com>, Paul Mackerras <paulus@samba.org>,
 sparclinux@vger.kernel.org, linux-riscv@lists.infradead.org,
 Will Deacon <will@kernel.org>, Stafford Horne <shorne@gmail.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>, linux-s390@vger.kernel.org,
 linux-c6x-dev@linux-c6x.org, Yoshinori Sato <ysato@users.sourceforge.jp>,
 Michael Ellerman <mpe@ellerman.id.au>, x86@kernel.org,
 Russell King <linux@armlinux.org.uk>, Mike Rapoport <rppt@linux.ibm.com>,
 clang-built-linux@googlegroups.com, Ingo Molnar <mingo@redhat.com>,
 Catalin Marinas <catalin.marinas@arm.com>,
 uclinux-h8-devel@lists.sourceforge.jp, linux-xtensa@linux-xtensa.org,
 openrisc@lists.librecores.org, Borislav Petkov <bp@alien8.de>,
 Andy Lutomirski <luto@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>,
 Thomas Gleixner <tglx@linutronix.de>, linux-arm-kernel@lists.infradead.org,
 Michal Simek <monstr@monstr.eu>, linux-mm@kvack.org,
 linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 iommu@lists.linux-foundation.org, Palmer Dabbelt <palmer@dabbelt.com>,
 Andrew Morton <akpm@linux-foundation.org>, Christoph Hellwig <hch@lst.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Tue, Jul 28, 2020 at 07:02:54PM +0800, Baoquan He wrote:
> On 07/28/20 at 08:11am, Mike Rapoport wrote:
> > From: Mike Rapoport <rppt@linux.ibm.com>
> > 
> > numa_clear_kernel_node_hotplug() function first traverses numa_meminfo
> > regions to set node ID in memblock.reserved and than traverses
> > memblock.reserved to update reserved_nodemask to include node IDs that were
> > set in the first loop.
> > 
> > Remove redundant traversal over memblock.reserved and update
> > reserved_nodemask while iterating over numa_meminfo.
> > 
> > Signed-off-by: Mike Rapoport <rppt@linux.ibm.com>
> > ---
> >  arch/x86/mm/numa.c | 26 ++++++++++----------------
> >  1 file changed, 10 insertions(+), 16 deletions(-)
> > 
> > diff --git a/arch/x86/mm/numa.c b/arch/x86/mm/numa.c
> > index 8ee952038c80..4078abd33938 100644
> > --- a/arch/x86/mm/numa.c
> > +++ b/arch/x86/mm/numa.c
> > @@ -498,31 +498,25 @@ static void __init numa_clear_kernel_node_hotplug(void)
> >  	 * and use those ranges to set the nid in memblock.reserved.
> >  	 * This will split up the memblock regions along node
> >  	 * boundaries and will set the node IDs as well.
> > +	 *
> > +	 * The nid will also be set in reserved_nodemask which is later
> > +	 * used to clear MEMBLOCK_HOTPLUG flag.
> > +	 *
> > +	 * [ Note, when booting with mem=nn[kMG] or in a kdump kernel,
> > +	 *   numa_meminfo might not include all memblock.reserved
> > +	 *   memory ranges, because quirks such as trim_snb_memory()
> > +	 *   reserve specific pages for Sandy Bridge graphics.
> > +	 *   These ranges will remain with nid == MAX_NUMNODES. ]
> >  	 */
> >  	for (i = 0; i < numa_meminfo.nr_blks; i++) {
> >  		struct numa_memblk *mb = numa_meminfo.blk + i;
> >  		int ret;
> >  
> >  		ret = memblock_set_node(mb->start, mb->end - mb->start, &memblock.reserved, mb->nid);
> > +		node_set(mb->nid, reserved_nodemask);
> 
> Really? This will set all node id into reserved_nodemask. But in the
> current code, it's setting nid into memblock reserved region which
> interleaves with numa_memoinfo, then get those nid and set it in
> reserved_nodemask. This is so different, with my understanding. Please
> correct me if I am wrong.

You are right, I've missed the intersections of numa_meminfo with
memblock.reserved.

x86 interaction with membock is so, hmm, interesting...
 
> Thanks
> Baoquan
> 
> >  		WARN_ON_ONCE(ret);
> >  	}
> >  
> > -	/*
> > -	 * Now go over all reserved memblock regions, to construct a
> > -	 * node mask of all kernel reserved memory areas.
> > -	 *
> > -	 * [ Note, when booting with mem=nn[kMG] or in a kdump kernel,
> > -	 *   numa_meminfo might not include all memblock.reserved
> > -	 *   memory ranges, because quirks such as trim_snb_memory()
> > -	 *   reserve specific pages for Sandy Bridge graphics. ]
> > -	 */
> > -	for_each_memblock(reserved, mb_region) {
> > -		int nid = memblock_get_region_node(mb_region);
> > -
> > -		if (nid != MAX_NUMNODES)
> > -			node_set(nid, reserved_nodemask);
> > -	}
> > -
> >  	/*
> >  	 * Finally, clear the MEMBLOCK_HOTPLUG flag for all memory
> >  	 * belonging to the reserved node mask.
> > -- 
> > 2.26.2
> > 
> > 
> 

-- 
Sincerely yours,
Mike.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
