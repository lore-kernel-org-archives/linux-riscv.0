Return-Path: <SRS0=syY9=G4=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 626D7C433DB
	for <linux-riscv@archiver.kernel.org>; Mon, 25 Jan 2021 21:38:52 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 102DC22510
	for <linux-riscv@archiver.kernel.org>; Mon, 25 Jan 2021 21:38:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 102DC22510
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=v0TL4PVStK9gJWgPNnwhbh/fgk+xwvWL70gurP028gU=; b=dfxEqvDsqAU2hLCU3VDuTT1nR
	i2sF3tL4tk7yHl5aGLnQzU/YUjn9Yxgry9U/hOruStKkD7oUT1100F89knIhjDemyOpkhV5nxDHMl
	45z5ld96KUuS6eYCqnsOT4dFq/j1/nr9uMsAv3F0cGDe4BmvhaRLHHiU5fFUtZPGQ+jZtPKlnACh6
	NVs6EXwo4hR+dhm6S+fKD65G8WXh4k28ewI3XHQp+D2w9K/bZT2agU6bCPIWyiEFCE3qi1iXeDSy5
	GzC9G2YIKZBAH6aL+Twl0nv+5GH7Tp4MEi1JmUr7QgNm/Chzm0tiT1ZoEjC829gOKQeaUbAWWcIy1
	vS6qh7kIg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l49ZJ-0003il-Lo; Mon, 25 Jan 2021 21:38:41 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l49ZD-0003fv-Cc; Mon, 25 Jan 2021 21:38:37 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id A683E2083E;
 Mon, 25 Jan 2021 21:38:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1611610714;
 bh=oBbSa76JFc7v8+y55SX0g1Mr9sPSRsNOv4tmWq7xrRA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ubeXULCeE5ESYXoKbbpQZvbpm7KD3rJtLMZd3bLMpG+Yf8ZlUgaes9e13MakOokA9
 iEgnWl6tWG8fgiW+VJGsU1Vz4qkDtXaocuKZT5gFf6r99ZgN3QhYKOTmMnfoGOogzo
 zlSt15bli+VWxniwjlxtECCstKhhIQyCjc9aSnUV55QlpbsGcamdfknFZPmcXMuxob
 G02UJe9Qaa5X7Qu+hPXzpNUvjCDYeTaIEq+run7rkZRwSUoqDGVquo06czJpfyCKh6
 lYHTox8ewX/SByv9aTWjggJVW9TsgcM9496MPOix7WOWD0WDa1bKzdlfYuPxgdGr6W
 86DtTT5jWaIDg==
Date: Mon, 25 Jan 2021 23:38:17 +0200
From: Mike Rapoport <rppt@kernel.org>
To: Michal Hocko <mhocko@suse.com>
Subject: Re: [PATCH v16 08/11] secretmem: add memcg accounting
Message-ID: <20210125213817.GM6332@kernel.org>
References: <20210121122723.3446-1-rppt@kernel.org>
 <20210121122723.3446-9-rppt@kernel.org>
 <20210125165451.GT827@dhcp22.suse.cz>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210125165451.GT827@dhcp22.suse.cz>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210125_163835_625448_3CD9A255 
X-CRM114-Status: GOOD (  20.56  )
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
 James Bottomley <jejb@linux.ibm.com>, Hagen Paul Pfeifer <hagen@jauu.net>,
 Borislav Petkov <bp@alien8.de>, Alexander Viro <viro@zeniv.linux.org.uk>,
 Andy Lutomirski <luto@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>,
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

On Mon, Jan 25, 2021 at 05:54:51PM +0100, Michal Hocko wrote:
> On Thu 21-01-21 14:27:20, Mike Rapoport wrote:
> > From: Mike Rapoport <rppt@linux.ibm.com>
> > 
> > Account memory consumed by secretmem to memcg. The accounting is updated
> > when the memory is actually allocated and freed.
> 
> What does this mean?

That means that the accounting is updated when secretmem does cma_alloc()
and cma_relase().

> What are the lifetime rules?

Hmm, what do you mean by lifetime rules?

> [...]
> 
> > +static int secretmem_account_pages(struct page *page, gfp_t gfp, int order)
> > +{
> > +	int err;
> > +
> > +	err = memcg_kmem_charge_page(page, gfp, order);
> > +	if (err)
> > +		return err;
> > +
> > +	/*
> > +	 * seceremem caches are unreclaimable kernel allocations, so treat
> > +	 * them as unreclaimable slab memory for VM statistics purposes
> > +	 */
> > +	mod_lruvec_page_state(page, NR_SLAB_UNRECLAIMABLE_B,
> > +			      PAGE_SIZE << order);
> 
> A lot of memcg accounted memory is not reclaimable. Why do you abuse
> SLAB counter when this is not a slab owned memory? Why do you use the
> kmem accounting API when __GFP_ACCOUNT should give you the same without
> this details?

I cannot use __GFP_ACCOUNT because cma_alloc() does not use gfp.
Besides, kmem accounting with __GFP_ACCOUNT does not seem
to update stats and there was an explicit request for statistics:
 
https://lore.kernel.org/lkml/CALo0P13aq3GsONnZrksZNU9RtfhMsZXGWhK1n=xYJWQizCd4Zw@mail.gmail.com/

As for (ab)using NR_SLAB_UNRECLAIMABLE_B, as it was already discussed here:

https://lore.kernel.org/lkml/20201129172625.GD557259@kernel.org/

I think that a dedicated stats counter would be too much at the moment and
NR_SLAB_UNRECLAIMABLE_B is the only explicit stat for unreclaimable memory.

-- 
Sincerely yours,
Mike.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
