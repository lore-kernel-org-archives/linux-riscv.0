Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D188FC3DA7F
	for <linux-riscv@archiver.kernel.org>; Mon,  5 Aug 2024 20:38:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=g88SwNQSqNmprQLxFADQDwZsEAGrJP39M/r4XUjncEI=; b=XmzU92eWpE+e4E
	tgl5cvW5eGTenblsbUblwdo4XHVn8eQT7M/nAiZ9f07T5mS3K3JJX+/9TTBezUfa92sIwt0OJ5OVb
	7ek1SZ0hxgZE+aUDP8EtTe9vSsfeQGolzU40feYGiFgW1+EpQ93j0oAowoFW2/M4/z4lrLqPdXvU+
	5S/wC4vYh1JsILMkQT9w3TubucxNK1/BeWgOSkhTzaEgOUM4lQv5EBwsFk5XyhzmykcxEUvQgW/ss
	74Z9+7PMnhBqyWM8bDu+XytZO2/OprxN1yepnUmymeu33wUR6/NtwP6XbL6b62HeTazWyga5121Rv
	XXKfFaI3ivAucseFwaRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sb4TA-0000000HE2j-1Rqg;
	Mon, 05 Aug 2024 20:38:16 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sb4Sc-0000000HDse-22kq;
	Mon, 05 Aug 2024 20:37:43 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id AD1AD60DD2;
	Mon,  5 Aug 2024 20:37:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 087EBC4AF0E;
	Mon,  5 Aug 2024 20:37:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722890261;
	bh=qdRuOti9XNlLltkR78ltAp8iub7ZiaEGkve5ZQKgRXs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bF0xgt419GbxyCGFRj0fNjByi1OtMInAxUy0fO7kuEExoo6r6jeZMXGjN5ikPGLYH
	 /M1nzHizackmgautp/VnDSLRxQXCurMyrYVEwg5Yf+PdgGkwhSt7ZiA1a6tEsPe3+w
	 oJPfE55fHB91q50vVv1vV9hAXYemhAyhr6OpNgWOOvXUx9/9Vw4S7evidbf87YcNj+
	 pEPIiDW05PYUn8lRlujrJ1DKbY3WIHytjXuNelSTWpy7nXBiYR1lO2v9ZQh4g3aHrR
	 PgFXkbijAdUJ0BywpuS1YJGB4AvPiLFgG1t0OrXdtLJEh5IFQJb88z75ZKH8cfv8oU
	 ALk7ATW/rOneA==
Date: Mon, 5 Aug 2024 23:35:22 +0300
From: Mike Rapoport <rppt@kernel.org>
To: Dan Williams <dan.j.williams@intel.com>
Cc: linux-kernel@vger.kernel.org,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Andreas Larsson <andreas@gaisler.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Arnd Bergmann <arnd@arndb.de>, Borislav Petkov <bp@alien8.de>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	David Hildenbrand <david@redhat.com>,
	"David S. Miller" <davem@davemloft.net>,
	Davidlohr Bueso <dave@stgolabs.net>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Heiko Carstens <hca@linux.ibm.com>,
	Huacai Chen <chenhuacai@kernel.org>, Ingo Molnar <mingo@redhat.com>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
	Jonathan Cameron <jonathan.cameron@huawei.com>,
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
Subject: Re: [PATCH v3 11/26] x86/numa: use get_pfn_range_for_nid to verify
 that node spans memory
Message-ID: <ZrE3ijXA3efepKcH@kernel.org>
References: <20240801060826.559858-1-rppt@kernel.org>
 <20240801060826.559858-12-rppt@kernel.org>
 <66b1302ce5fd3_c1448294d3@dwillia2-xfh.jf.intel.com.notmuch>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <66b1302ce5fd3_c1448294d3@dwillia2-xfh.jf.intel.com.notmuch>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240805_133742_679900_3EEB7207 
X-CRM114-Status: GOOD (  24.02  )
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

On Mon, Aug 05, 2024 at 01:03:56PM -0700, Dan Williams wrote:
> Mike Rapoport wrote:
> > From: "Mike Rapoport (Microsoft)" <rppt@kernel.org>
> > 
> > Instead of looping over numa_meminfo array to detect node's start and
> > end addresses use get_pfn_range_for_init().
> > 
> > This is shorter and make it easier to lift numa_memblks to generic code.
> > 
> > Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
> > Tested-by: Zi Yan <ziy@nvidia.com> # for x86_64 and arm64
> > ---
> >  arch/x86/mm/numa.c | 13 +++----------
> >  1 file changed, 3 insertions(+), 10 deletions(-)
> > 
> > diff --git a/arch/x86/mm/numa.c b/arch/x86/mm/numa.c
> > index edfc38803779..cfe7e5477cf8 100644
> > --- a/arch/x86/mm/numa.c
> > +++ b/arch/x86/mm/numa.c
> > @@ -521,17 +521,10 @@ static int __init numa_register_memblks(struct numa_meminfo *mi)
> >  
> >  	/* Finally register nodes. */
> >  	for_each_node_mask(nid, node_possible_map) {
> > -		u64 start = PFN_PHYS(max_pfn);
> > -		u64 end = 0;
> > +		unsigned long start_pfn, end_pfn;
> >  
> > -		for (i = 0; i < mi->nr_blks; i++) {
> > -			if (nid != mi->blk[i].nid)
> > -				continue;
> > -			start = min(mi->blk[i].start, start);
> > -			end = max(mi->blk[i].end, end);
> > -		}
> > -
> > -		if (start >= end)
> > +		get_pfn_range_for_nid(nid, &start_pfn, &end_pfn);
> > +		if (start_pfn >= end_pfn)
> 
> Assuming I understand why this works, would it be worth a comment like:
> 
> "Note, get_pfn_range_for_nid() depends on memblock_set_node() having
>  already happened"

Will add a comment, sure.
 
> ...at least that context was not part of the diff so took me second to
> figure out how this works.
> 

-- 
Sincerely yours,
Mike.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
