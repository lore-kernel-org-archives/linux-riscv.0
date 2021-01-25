Return-Path: <SRS0=syY9=G4=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 84C35C433DB
	for <linux-riscv@archiver.kernel.org>; Mon, 25 Jan 2021 21:36:08 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0F85A22AAA
	for <linux-riscv@archiver.kernel.org>; Mon, 25 Jan 2021 21:36:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0F85A22AAA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=DGOhca+wjWYMxgavw/cC6FP0/7qw2oLpjY9mUrVPjHA=; b=mEoWPa/2njTIYPhTgib7Mf0PE
	ItTcCgqOL1d3DzvXvEgy7jJLvzgG3EqhHvFsfVzVWdRCY1oqIwai8JFMbSbOj9iLATIe5RG+Dmp05
	qAqVbyaHvKCiA5aWLua5SGGaOQx+0vJErDqHRxLAFdr+et1Qgw9crppngJmHtjh8aASi+grvIrTJz
	6aylGx4EfYAdJ9xJ5vBasbEvpz50+LrH1EIHlBOKmcexBoirYOCLL5YnZBm9vMtR2qyafdwhIM62Q
	MCbfT/QQJvY1f1Lu0zkYskYZvrU5hC88TA7rbVu9OY1B+1IqSWbIODTOLhggofQ+krQFuPmMbHwUT
	CJq60tKUA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l49Wb-00035a-Dz; Mon, 25 Jan 2021 21:35:53 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l49WX-00033f-29; Mon, 25 Jan 2021 21:35:50 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 5F8A2229C6;
 Mon, 25 Jan 2021 21:35:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1611610543;
 bh=2Di0IbIXl1xn2Q918lq0pHS35BBSv9IAQLWTpnF3034=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Cy17SSKvvNvxfTqzme3GulWvb12hmNhkF7DBhyy2a+M5IaoGf8exm+dMOhwdI3cnD
 O9Y6le+GeozBAOlFWKkpEB+vZ71maF7XrODlor4nn34mqAaY2SmcJJTy1/7R4Vzp0U
 bPshjl150D1+6AqGJJwRZluiwgpDdWOErZGjlhYbAQhuHLMYpqQxkt2okbl3QmaaEV
 +AvTUTAKQGnim5uoCQhk9nL/vcRX66pRqMexDaS2sIjDuNGgW078c+2BX0w5Eu0hmE
 oc6a5eiysTeaoVlQWOTzqTt5FOVdCY/F5kyVzE2NWYn7vW0p6El384BwmC/nQzLCGf
 IjSwSAhpZJ+aA==
Date: Mon, 25 Jan 2021 23:35:26 +0200
From: Mike Rapoport <rppt@kernel.org>
To: Shakeel Butt <shakeelb@google.com>
Subject: Re: [PATCH v16 08/11] secretmem: add memcg accounting
Message-ID: <20210125213526.GK6332@kernel.org>
References: <20210121122723.3446-1-rppt@kernel.org>
 <20210121122723.3446-9-rppt@kernel.org>
 <20210125161706.GE308988@casper.infradead.org>
 <CALvZod7rn_5oXT6Z+iRCeMX_iMRO9G_8FnwSRGpJJwyBz5Wpnw@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CALvZod7rn_5oXT6Z+iRCeMX_iMRO9G_8FnwSRGpJJwyBz5Wpnw@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210125_163549_267788_B60ED7BB 
X-CRM114-Status: GOOD (  19.45  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, David Hildenbrand <david@redhat.com>,
 Peter Zijlstra <peterz@infradead.org>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Dave Hansen <dave.hansen@linux.intel.com>, Linux MM <linux-mm@kvack.org>,
 linux-kselftest@vger.kernel.org, "H. Peter Anvin" <hpa@zytor.com>,
 Christopher Lameter <cl@linux.com>, Shuah Khan <shuah@kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>,
 Elena Reshetova <elena.reshetova@intel.com>, linux-arch@vger.kernel.org,
 Tycho Andersen <tycho@tycho.ws>, linux-nvdimm@lists.01.org,
 Will Deacon <will@kernel.org>, x86@kernel.org,
 Matthew Wilcox <willy@infradead.org>, Mike Rapoport <rppt@linux.ibm.com>,
 Ingo Molnar <mingo@redhat.com>, Michael Kerrisk <mtk.manpages@gmail.com>,
 Palmer Dabbelt <palmerdabbelt@google.com>, Arnd Bergmann <arnd@arndb.de>,
 James Bottomley <jejb@linux.ibm.com>, Hagen Paul Pfeifer <hagen@jauu.net>,
 Borislav Petkov <bp@alien8.de>, Alexander Viro <viro@zeniv.linux.org.uk>,
 Andy Lutomirski <luto@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>,
 "Kirill A. Shutemov" <kirill@shutemov.name>,
 Dan Williams <dan.j.williams@intel.com>, linux-arm-kernel@lists.infradead.org,
 linux-api@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
 linux-riscv@lists.infradead.org, Palmer Dabbelt <palmer@dabbelt.com>,
 linux-fsdevel <linux-fsdevel@vger.kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 Rick Edgecombe <rick.p.edgecombe@intel.com>, Roman Gushchin <guro@fb.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Mon, Jan 25, 2021 at 09:18:04AM -0800, Shakeel Butt wrote:
> On Mon, Jan 25, 2021 at 8:20 AM Matthew Wilcox <willy@infradead.org> wrote:
> >
> > On Thu, Jan 21, 2021 at 02:27:20PM +0200, Mike Rapoport wrote:
> > > From: Mike Rapoport <rppt@linux.ibm.com>
> > >
> > > Account memory consumed by secretmem to memcg. The accounting is updated
> > > when the memory is actually allocated and freed.

I though about doing per-page accounting, but then one would be able to
create a lot of secretmem file descriptors, use only a page from each while
actual memory consumption will be way higher.

> > I think this is wrong.  It fails to account subsequent allocators from
> > the same PMD.  If you want to track like this, you need separate pools
> > per memcg.
> >
> 
> Are these secretmem pools shared between different jobs/memcgs?

A secretmem pool is per anonymous file descriptor and this file descriptor
can be shared only explicitly between several processes. So, the secretmem
pool should not be shared between different jobs/memcg. Of course, it's
possible to spread threads of a process across different memcgs, but in
that case the accounting will be similar to what's happening today with
sl*b. The first thread to cause kmalloc() will be charged for the
allocation of the entire slab and subsequent allocations from that slab
will not be accounted.

That said, having a pool per memcg will add ton of complexity with very
dubious value.

-- 
Sincerely yours,
Mike.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
