Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A27FC43458
	for <linux-riscv@archiver.kernel.org>; Fri, 26 Jun 2026 15:29:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=amhamxToxNMNBgoGdFQBgDEnRFYWdIWhkhn0EBrIDoQ=; b=PWUcl+E7QiQ8Wv
	ZYGFcpieQoyWljXtBDOeMsl1gaBGj9+tAXIjhP/5R9UpTObYuD7PprqjfFQc3Qs6qsSe9QVcZP7m3
	28OzuA2V1Bbsvl49ww9Ay0QNvfr6hJhsNusmDVARv1hDAduTagMjFeEVzYqq9qwKdtY/WRor9Ltct
	49NhwL5uRJBNljZwxPmnu4ejYpj1xqGP/4yeoi/07Scx/EtN+uHZ+wwqvFoSFecvN/f/PAhoyeiR9
	lmRBWc5MaWfFCyqKxydddilll/j33VHLjTeK+k/DjV967zK7gigrHeyeXS6umwCV+oPVer0bvgCeH
	bnatzxUsw1doqKCLWCoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wd8UN-0000000BYAZ-1Qcf;
	Fri, 26 Jun 2026 15:29:07 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wd8UK-0000000BYA9-3GE5;
	Fri, 26 Jun 2026 15:29:04 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 9ABFE432F2;
	Fri, 26 Jun 2026 15:29:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EF1081F000E9;
	Fri, 26 Jun 2026 15:28:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782487743;
	bh=YSvnrDQeqiuou4mWYG8YFG85sz9T2AFOYdJJQqH5aKQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=idHputUKAXQjKNiThw4I2jQol6Qci2xV0EurB5Pr1bNgQj+ucMHTasa7myaudlUf4
	 zeB0phEsOTef3/d8Io+sTnhlAhw4DJL/SNQHe5Bs3EuVep7xigU4jO464ACUXS14e5
	 JUKoc1t21hbjEgwwsWveOSF8TemVlod3dOSIsDW1z58x0hCYQDEiAmVaY+3OS3XFuO
	 Gdegn4G1m+r084YL3gAe04jFQyugVl6EE6Js2I5X1xWntH08RmiPoUEDZCiAOcetKS
	 y1mPxAubsgFYG1nr92yN69gLeRpLenjKfTN5T65Kah7gTu1XrHYLX+jEL3e278dnim
	 xW79xk2em+PlQ==
Date: Fri, 26 Jun 2026 18:28:34 +0300
From: Mike Rapoport <rppt@kernel.org>
To: Brendan Jackman <brendan.jackman@linux.dev>
Cc: Lorenzo Stoakes <ljs@kernel.org>,
	"Kalyazin, Nikita" <kalyazin@amazon.co.uk>,
	"kvm@vger.kernel.org" <kvm@vger.kernel.org>,
	"linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"linux-mm@kvack.org" <linux-mm@kvack.org>,
	"bpf@vger.kernel.org" <bpf@vger.kernel.org>,
	"linux-kselftest@vger.kernel.org" <linux-kselftest@vger.kernel.org>,
	"kernel@xen0n.name" <kernel@xen0n.name>,
	"linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
	"pbonzini@redhat.com" <pbonzini@redhat.com>,
	"corbet@lwn.net" <corbet@lwn.net>,
	"maz@kernel.org" <maz@kernel.org>,
	"oupton@kernel.org" <oupton@kernel.org>,
	"suzuki.poulose@arm.com" <suzuki.poulose@arm.com>,
	"yuzenghui@huawei.com" <yuzenghui@huawei.com>,
	"will@kernel.org" <will@kernel.org>,
	"seanjc@google.com" <seanjc@google.com>,
	"mingo@redhat.com" <mingo@redhat.com>,
	"bp@alien8.de" <bp@alien8.de>,
	"dave.hansen@linux.intel.com" <dave.hansen@linux.intel.com>,
	"x86@kernel.org" <x86@kernel.org>, "hpa@zytor.com" <hpa@zytor.com>,
	"luto@kernel.org" <luto@kernel.org>,
	"willy@infradead.org" <willy@infradead.org>,
	"akpm@linux-foundation.org" <akpm@linux-foundation.org>,
	"david@kernel.org" <david@kernel.org>,
	"lorenzo.stoakes@oracle.com" <lorenzo.stoakes@oracle.com>,
	"vbabka@kernel.org" <vbabka@kernel.org>,
	"surenb@google.com" <surenb@google.com>,
	"mhocko@suse.com" <mhocko@suse.com>,
	"ast@kernel.org" <ast@kernel.org>,
	"daniel@iogearbox.net" <daniel@iogearbox.net>,
	"andrii@kernel.org" <andrii@kernel.org>,
	"martin.lau@linux.dev" <martin.lau@linux.dev>,
	"eddyz87@gmail.com" <eddyz87@gmail.com>,
	"song@kernel.org" <song@kernel.org>,
	"yonghong.song@linux.dev" <yonghong.song@linux.dev>,
	"john.fastabend@gmail.com" <john.fastabend@gmail.com>,
	"kpsingh@kernel.org" <kpsingh@kernel.org>,
	"haoluo@google.com" <haoluo@google.com>,
	"jolsa@kernel.org" <jolsa@kernel.org>,
	"jhubbard@nvidia.com" <jhubbard@nvidia.com>,
	"jannh@google.com" <jannh@google.com>,
	"pfalcato@suse.de" <pfalcato@suse.de>,
	"skhan@linuxfoundation.org" <skhan@linuxfoundation.org>,
	"riel@surriel.com" <riel@surriel.com>,
	"ryan.roberts@arm.com" <ryan.roberts@arm.com>,
	"jgross@suse.com" <jgross@suse.com>,
	"yu-cheng.yu@intel.com" <yu-cheng.yu@intel.com>,
	"kas@kernel.org" <kas@kernel.org>,
	"coxu@redhat.com" <coxu@redhat.com>,
	"ackerleytng@google.com" <ackerleytng@google.com>,
	"yosry@kernel.org" <yosry@kernel.org>,
	"ajones@ventanamicro.com" <ajones@ventanamicro.com>,
	"maobibo@loongson.cn" <maobibo@loongson.cn>,
	"prsampat@amd.com" <prsampat@amd.com>,
	"wu.fei9@sanechips.com.cn" <wu.fei9@sanechips.com.cn>,
	"mlevitsk@redhat.com" <mlevitsk@redhat.com>,
	"jthoughton@google.com" <jthoughton@google.com>,
	"agordeev@linux.ibm.com" <agordeev@linux.ibm.com>,
	"alex@ghiti.fr" <alex@ghiti.fr>,
	"aou@eecs.berkeley.edu" <aou@eecs.berkeley.edu>,
	"borntraeger@linux.ibm.com" <borntraeger@linux.ibm.com>,
	"chenhuacai@kernel.org" <chenhuacai@kernel.org>,
	"baolu.lu@linux.intel.com" <baolu.lu@linux.intel.com>,
	"dev.jain@arm.com" <dev.jain@arm.com>,
	"gor@linux.ibm.com" <gor@linux.ibm.com>,
	"hca@linux.ibm.com" <hca@linux.ibm.com>,
	"palmer@dabbelt.com" <palmer@dabbelt.com>,
	"pjw@kernel.org" <pjw@kernel.org>,
	"shijie@os.amperecomputing.com" <shijie@os.amperecomputing.com>,
	"svens@linux.ibm.com" <svens@linux.ibm.com>,
	"thuth@redhat.com" <thuth@redhat.com>,
	"Liam.Howlett@oracle.com" <Liam.Howlett@oracle.com>,
	"urezki@gmail.com" <urezki@gmail.com>,
	"zhengqi.arch@bytedance.com" <zhengqi.arch@bytedance.com>,
	"pavel@kernel.org" <pavel@kernel.org>,
	"yangyicong@hisilicon.com" <yangyicong@hisilicon.com>,
	"vannapurve@google.com" <vannapurve@google.com>,
	"jackmanb@google.com" <jackmanb@google.com>,
	"patrick.roy@linux.dev" <patrick.roy@linux.dev>,
	"Thomson, Jack" <jackabt@amazon.co.uk>,
	"Itazuri, Takahiro" <itazur@amazon.co.uk>,
	"Manwaring, Derek" <derekmn@amazon.com>
Subject: Re: [PATCH v12 01/16] set_memory: set_direct_map_* to take address
Message-ID: <aj6aohb8Z4yR_Sh3@kernel.org>
References: <20260410151746.61150-1-kalyazin@amazon.com>
 <20260410151746.61150-2-kalyazin@amazon.com>
 <aeeDvpDnGnY5n69n@lucifer>
 <DJJ23EXF55VK.1EGQZS511HFB6@linux.dev>
 <DJJ2NKKPRANG.188CUADJO2CKK@linux.dev>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <DJJ2NKKPRANG.188CUADJO2CKK@linux.dev>
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

On Fri, Jun 26, 2026 at 03:04:48PM +0000, Brendan Jackman wrote:
> On Fri Jun 26, 2026 at 2:38 PM UTC, Brendan Jackman wrote:
> > On Tue Apr 21, 2026 at 2:43 PM UTC, Lorenzo Stoakes wrote:
> >> On Fri, Apr 10, 2026 at 03:17:58PM +0000, Kalyazin, Nikita wrote:
> >>> From: Nikita Kalyazin <nikita.kalyazin@linux.dev>
> >>>
> >>> Let's convert set_direct_map_*() to take an address instead of a page to
> >>> prepare for adding helpers that operate on folios; it will be more
> >>> efficient to convert from a folio directly to an address without going
> >>> through a page first.
> >
> > Why is this more efficient? Isn't it a purely compile-time conversion?
> >
> > Indeed in the current implementation folio_address() is
> > page_address(&folio->page) so it still goes through a page anyway, no?
> >
> > I might be missing context here about how this will look in the
> > memdesc future.
> 
> Sorry I failed to do the history search here, this was suggested by
> Willy during the review here:
> 
> https://lore.kernel.org/kvm/aWkN4yzwPtotaTeq@casper.infradead.org/
> 
> Matthew Wilcox <willy@infradead.org> wrote:
> > The implementation isn't the greatest.  None of the implementations
> > of set_direct_map_valid_noflush() actually do anything with the struct
> > page; they all call page_address() or page_to_virt() (fundamentally the
> > same thing).  
> 
> But IMO the struct page isn't there to carry runtime information, it's a
> type hint that this API operates on physical pages. Yes this is already
> implied by the name but it also gives us a certain amount of safety
> since it avoids unaligned or non-physmap addresses at compile time.

I think it's more historical thingy, the initial user was
vmalloc::set_area_direct_map() that passed each page from vm->pages[] to
set_direct_map functions.
 
And yes, having a page there let's the implementation to go directly from
the page to it's address in the direct map, even for highmem ...

> > So converting folio->page->address is a bit inefficient.
> 
> ... but yeah now I see this comes from Willy I definitely suspect I'm
> missing memdesc insight here. 
> 
> > It feels like we should change set_direct_map_valid_noflush() to take a
> > const void * and pass either page_address() or folio_address(), depending
> > whether the caller has a page or a folio.  What do you think?

... while with void * it's not necessarily one-to-one because void * can be
a vmalloc address. 

-- 
Sincerely yours,
Mike.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
