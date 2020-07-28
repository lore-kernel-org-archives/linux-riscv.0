Return-Path: <SRS0=Fr2v=BH=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 56D04C433E5
	for <linux-riscv@archiver.kernel.org>; Tue, 28 Jul 2020 14:24:24 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 21FBB20663
	for <linux-riscv@archiver.kernel.org>; Tue, 28 Jul 2020 14:24:24 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ME8RHbYB";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="GtVsFuqy"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 21FBB20663
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=redhat.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=yLpXP0awmLZxa2KTy6B6DALjr4fcJuweGLEDZSfum68=; b=ME8RHbYBf9jNIicJ7Hr30/J47
	kAruabJQ1VKe/ePQwWc+X7OAUIbJWUGje/3DjRhcHT3bWfpQ+/yh3m61u8uc4v30j1f/6pb8PvOtn
	Xu0dGTDSQ2RwfkJrqjvMrYc7UPA3fgillo1tHuAk6WmjDaDMUZrQLj4bDJmDoUHQx3Ub0PX7iIOAF
	z6AxhCGZZPg3DhFPP/zkmbLjVcRuI/FqUdLJbhP4rXHTonVdQyRkWYXVSUYiE0jD8sMft19Rrxvo8
	uNxicb+RNMo0G9l/GnX93u+/6Y4/t/IdxQEPO7dVcPp3cPc5MKPeffWSoM05FstZsYE68rFlc7y5K
	kh76wtaaA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k0QWZ-0008Ot-La; Tue, 28 Jul 2020 14:24:11 +0000
Received: from us-smtp-2.mimecast.com ([205.139.110.61]
 helo=us-smtp-delivery-1.mimecast.com)
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k0QWV-0008Mr-6P
 for linux-riscv@lists.infradead.org; Tue, 28 Jul 2020 14:24:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1595946246;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=06rCqpwu1j4S1S47vgUTPXYPKKso17TGQwzOaoYSYfs=;
 b=GtVsFuqyRfS1RkT25da+EhuUFf5MK+pGegTD127A0pLyWVLsTtxR3jny/u2SUL9VKue0wR
 zjkYY8l6DX8mAQJRrLoC7J+CTbzHM0/D8/VS0/RR8HLuez7E+VJ6vt9Qjh1l+QjbHxeH2N
 rsZkLJZxu1iQGHes548R3D8PVHuaLK4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-166-XL5fGaBiOsyWEWGpA51xEg-1; Tue, 28 Jul 2020 10:24:02 -0400
X-MC-Unique: XL5fGaBiOsyWEWGpA51xEg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8B54D1B18BC1;
 Tue, 28 Jul 2020 14:23:54 +0000 (UTC)
Received: from localhost (ovpn-12-117.pek2.redhat.com [10.72.12.117])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 303B41010427;
 Tue, 28 Jul 2020 14:23:51 +0000 (UTC)
Date: Tue, 28 Jul 2020 22:23:48 +0800
From: Baoquan He <bhe@redhat.com>
To: Mike Rapoport <rppt@kernel.org>
Subject: Re: [PATCH 14/15] x86/numa: remove redundant iteration over
 memblock.reserved
Message-ID: <20200728142348.GE10792@MiWiFi-R3L-srv>
References: <20200728051153.1590-1-rppt@kernel.org>
 <20200728051153.1590-15-rppt@kernel.org>
 <20200728110254.GA14854@MiWiFi-R3L-srv>
 <20200728141504.GC3655207@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200728141504.GC3655207@kernel.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200728_102407_311956_6DE8BB23 
X-CRM114-Status: GOOD (  32.35  )
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

On 07/28/20 at 05:15pm, Mike Rapoport wrote:
> On Tue, Jul 28, 2020 at 07:02:54PM +0800, Baoquan He wrote:
> > On 07/28/20 at 08:11am, Mike Rapoport wrote:
> > > From: Mike Rapoport <rppt@linux.ibm.com>
> > > 
> > > numa_clear_kernel_node_hotplug() function first traverses numa_meminfo
> > > regions to set node ID in memblock.reserved and than traverses
> > > memblock.reserved to update reserved_nodemask to include node IDs that were
> > > set in the first loop.
> > > 
> > > Remove redundant traversal over memblock.reserved and update
> > > reserved_nodemask while iterating over numa_meminfo.
> > > 
> > > Signed-off-by: Mike Rapoport <rppt@linux.ibm.com>
> > > ---
> > >  arch/x86/mm/numa.c | 26 ++++++++++----------------
> > >  1 file changed, 10 insertions(+), 16 deletions(-)
> > > 
> > > diff --git a/arch/x86/mm/numa.c b/arch/x86/mm/numa.c
> > > index 8ee952038c80..4078abd33938 100644
> > > --- a/arch/x86/mm/numa.c
> > > +++ b/arch/x86/mm/numa.c
> > > @@ -498,31 +498,25 @@ static void __init numa_clear_kernel_node_hotplug(void)
> > >  	 * and use those ranges to set the nid in memblock.reserved.
> > >  	 * This will split up the memblock regions along node
> > >  	 * boundaries and will set the node IDs as well.
> > > +	 *
> > > +	 * The nid will also be set in reserved_nodemask which is later
> > > +	 * used to clear MEMBLOCK_HOTPLUG flag.
> > > +	 *
> > > +	 * [ Note, when booting with mem=nn[kMG] or in a kdump kernel,
> > > +	 *   numa_meminfo might not include all memblock.reserved
> > > +	 *   memory ranges, because quirks such as trim_snb_memory()
> > > +	 *   reserve specific pages for Sandy Bridge graphics.
> > > +	 *   These ranges will remain with nid == MAX_NUMNODES. ]
> > >  	 */
> > >  	for (i = 0; i < numa_meminfo.nr_blks; i++) {
> > >  		struct numa_memblk *mb = numa_meminfo.blk + i;
> > >  		int ret;
> > >  
> > >  		ret = memblock_set_node(mb->start, mb->end - mb->start, &memblock.reserved, mb->nid);
> > > +		node_set(mb->nid, reserved_nodemask);
> > 
> > Really? This will set all node id into reserved_nodemask. But in the
> > current code, it's setting nid into memblock reserved region which
> > interleaves with numa_memoinfo, then get those nid and set it in
> > reserved_nodemask. This is so different, with my understanding. Please
> > correct me if I am wrong.
> 
> You are right, I've missed the intersections of numa_meminfo with
> memblock.reserved.
> 
> x86 interaction with membock is so, hmm, interesting...

Yeah, numa_clear_kernel_node_hotplug() intends to find out any memory node
which has reserved memory, then make it as unmovable. Setting all node
id into reserved_nodemask will break the use case of hot removing hotpluggable
boot memory after system bootup.


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
