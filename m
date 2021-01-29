Return-Path: <SRS0=yqCT=HA=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 77A9DC433DB
	for <linux-riscv@archiver.kernel.org>; Fri, 29 Jan 2021 07:04:30 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1356364DFD
	for <linux-riscv@archiver.kernel.org>; Fri, 29 Jan 2021 07:04:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1356364DFD
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=WXq+nLEyWqUPy7Dj1Y70TI7We9FqaaYqF+ZgqxSa+Fw=; b=0uZqwgUbCIX8nhEywmhrZpkHu
	AKRjyD+rGbPyVORPRN/iPO66R4MCMBNXYAmzvrMRgAJzEAHFPXYu0V4QzyX7wVdsfWXeQDNTeqcUW
	nJYCzI+tDwAigMSXWcazLZZLxXPkSgPj5A1DDYvrQk7++LwBls18kLjOLAIUvfXRtq27Dz2RGH9/m
	ktr5BVeNTIdcBoung8dm/UeAv/Jm6jcuOrqhx2lPzx1dpfvqfQ4tgGwXqvQLhY2ok18ohR35YjCx4
	G1iZ6/N6d2bvUIUM75L9kkfIQHWF/FbwCQ8Uf76QlZ95q/JhhU85tmGz2thDzaP7vLO3TCmAmj2LU
	9+6t7z3Zw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l5NpL-0007oo-Cq; Fri, 29 Jan 2021 07:04:19 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l5NpG-0007n7-Nh; Fri, 29 Jan 2021 07:04:15 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 6692D60234;
 Fri, 29 Jan 2021 07:04:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1611903853;
 bh=B8baj/kr8egXx07AKTfXmu2q+uVtPa7Wa10vxWLTyX4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=FU1gKzkR0Kkuw4BUPc2Ykvl/qSOzFXlBbHnlbTvI/BhKT7ahDUpGEZB46gpU40Y83
 MoHNwFp1wY6tLb5AUTCsnEfd/AMZYsjtoOTM/ubtkBakz4JEJpx2QSQ5qDWK5JBhpB
 4v3NJredQAUcuf0ikqua2sKTx8pGC/pdnTjma60/EtjBbJKLV0sBexjvYgwWm6cmAr
 6YkTn12NhzoZ5vWMbb1h+pYot7MLL4lAT5rK7YbxkDbSaKqIWEB24dlTSavj0W7G0i
 ikyrL756m9C6l5UyrhfShwTx10Viq23ua1S5t39e8a1T6A4j5m1JHtrkXMph6V4jLt
 ck06v8VwMSCEw==
Date: Fri, 29 Jan 2021 09:03:55 +0200
From: Mike Rapoport <rppt@kernel.org>
To: James Bottomley <jejb@linux.ibm.com>
Subject: Re: [PATCH v16 07/11] secretmem: use PMD-size pages to amortize
 direct map fragmentation
Message-ID: <20210129070355.GC242749@kernel.org>
References: <20210121122723.3446-1-rppt@kernel.org>
 <20210121122723.3446-8-rppt@kernel.org>
 <20210126114657.GL827@dhcp22.suse.cz>
 <303f348d-e494-e386-d1f5-14505b5da254@redhat.com>
 <20210126120823.GM827@dhcp22.suse.cz>
 <20210128092259.GB242749@kernel.org>
 <YBK1kqL7JA7NePBQ@dhcp22.suse.cz>
 <2b6a5f22f0b062432186b89eeef58e2ba45e09c1.camel@linux.ibm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <2b6a5f22f0b062432186b89eeef58e2ba45e09c1.camel@linux.ibm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210129_020414_973096_1D5BEDD7 
X-CRM114-Status: GOOD (  28.37  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, Michal Hocko <mhocko@suse.com>,
 David Hildenbrand <david@redhat.com>, Peter Zijlstra <peterz@infradead.org>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Dave Hansen <dave.hansen@linux.intel.com>, linux-mm@kvack.org,
 linux-kselftest@vger.kernel.org, "H. Peter Anvin" <hpa@zytor.com>,
 Christopher Lameter <cl@linux.com>, Shuah Khan <shuah@kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>,
 Elena Reshetova <elena.reshetova@intel.com>, linux-arch@vger.kernel.org,
 Tycho Andersen <tycho@tycho.ws>, linux-nvdimm@lists.01.org,
 Will Deacon <will@kernel.org>, x86@kernel.org,
 Matthew Wilcox <willy@infradead.org>, Mike Rapoport <rppt@linux.ibm.com>,
 Ingo Molnar <mingo@redhat.com>, Michael Kerrisk <mtk.manpages@gmail.com>,
 Palmer Dabbelt <palmerdabbelt@google.com>, Arnd Bergmann <arnd@arndb.de>,
 Hagen Paul Pfeifer <hagen@jauu.net>, Borislav Petkov <bp@alien8.de>,
 Alexander Viro <viro@zeniv.linux.org.uk>, Andy Lutomirski <luto@kernel.org>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 "Kirill A. Shutemov" <kirill@shutemov.name>,
 Dan Williams <dan.j.williams@intel.com>, linux-arm-kernel@lists.infradead.org,
 linux-api@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, Palmer Dabbelt <palmer@dabbelt.com>,
 linux-fsdevel@vger.kernel.org, Shakeel Butt <shakeelb@google.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Rick Edgecombe <rick.p.edgecombe@intel.com>, Roman Gushchin <guro@fb.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Thu, Jan 28, 2021 at 07:28:57AM -0800, James Bottomley wrote:
> On Thu, 2021-01-28 at 14:01 +0100, Michal Hocko wrote:
> > On Thu 28-01-21 11:22:59, Mike Rapoport wrote:
> [...]
> > > One of the major pushbacks on the first RFC [1] of the concept was
> > > about the direct map fragmentation. I tried really hard to find
> > > data that shows what is the performance difference with different
> > > page sizes in the direct map and I didn't find anything.
> > > 
> > > So presuming that large pages do provide advantage the first
> > > implementation of secretmem used PMD_ORDER allocations to amortise
> > > the effect of the direct map fragmentation and then handed out 4k
> > > pages at each fault. In addition there was an option to reserve a
> > > finite pool at boot time and limit secretmem allocations only to
> > > that pool.
> > > 
> > > At some point David suggested to use CMA to improve overall
> > > flexibility [3], so I switched secretmem to use CMA.
> > > 
> > > Now, with the data we have at hand (my benchmarks and Intel's
> > > report David mentioned) I'm even not sure this whole pooling even
> > > required.
> > 
> > I would still like to understand whether that data is actually
> > representative. With some underlying reasoning rather than I have run
> > these XYZ benchmarks and numbers do not look terrible.
> 
> My theory, and the reason I made Mike run the benchmarks, is that our
> fear of TLB miss has been alleviated by CPU speculation advances over
> the years.  You can appreciate this if you think that both Intel and
> AMD have increased the number of levels in the page table to
> accommodate larger virtual memory size 5 instead of 3.  That increases
> the length of the page walk nearly 2x in a physical system and even
> more in a virtual system.  Unless this were massively optimized,
> systems would have slowed down significantly.  Using 2M pages only
> eliminates one level and 2G pages eliminates 2, so I theorized that
> actually fragmentation wouldn't be the significant problem we once
> thought it was and asked Mike to benchmark it.
> 
> The benchmarks show that indeed, it isn't a huge change in the data TLB
> miss time, I suspect because data is nicely continuous nowadays and the
> prediction that goes into the CPU optimizations quite easy.  ITLB
> fragmentation actually seems to be quite a bit worse, likely because we
> still don't have branch prediction down to an exact science.

Another thing is that normally useful work done by userspace so data
accesses are dominated by userspace and any change in dTLB miss rate for
kernel data accesses is only a small fraction of all misses.

> James
> 
> 

-- 
Sincerely yours,
Mike.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
