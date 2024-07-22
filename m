Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05248C3DA5D
	for <linux-riscv@archiver.kernel.org>; Mon, 22 Jul 2024 07:37:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=offBFIDaJMHOPNX6gX+rxwIf2NfBcvGrJ8oXBe8dvhY=; b=Z1tt44kfKqm7+8
	eflKhtR8QXS6XskFDkaBYXxz7JVe9W5qfBUEpFdyN6mrPW63jcsSme7CsNZvSdw8SQbk3kxp2YPbE
	CNalyhwrkUPRW76PF30dRMb1irlnosUY7d37vtxcWKkBqsiRnHS7omaW9QF8ZoF9HJ9AD5yWtCPGd
	kD5Eyoq4z46ppVUmT893AopTwCJaZC5s1M44uMxm9RjpPdNo2KmhYmD/l7HvNCZ27tAf3rhKDqCHg
	r8xGfGm6ZLdBd5x/lehIFJSlT795hH9IhYadyX8p2BDSyA6PUF40KLQNm86KJg05wMFkZ9VNNUlLZ
	OSCGP9FaOPRozTiujgVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sVnc9-00000008jPB-0aWR;
	Mon, 22 Jul 2024 07:37:45 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sVnbj-00000008jEw-3h1a;
	Mon, 22 Jul 2024 07:37:21 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 7105ECE0B0A;
	Mon, 22 Jul 2024 07:37:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2C14EC116B1;
	Mon, 22 Jul 2024 07:37:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1721633837;
	bh=Dxslf8J1nw2EoO1825aVEeJAxLrpHgQU1wjgg+XF/0U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=V5rEoxjJyp8Si4Ol1tKmDHfxujD1M6arK5yB3md41TgtMqzL7133QUbpMAiRqALI8
	 zHqP2jnhANmIGx1K6HRYtObkAQqmVJ2vQFti7pCzHaOzz0dds7xFt2urt534cJHiXw
	 CurmUQ1pi3n/TpSSCUqTSIn7TV/EpAfGuHiiiLk6U01osyb6JXJ0yznQ72y9r7YmE5
	 p6fsNYiqRdEsZWZ4qQtfi/2IxHr6rbbdo6JlW+fM0tWjobtA9os1Uj3kz7eGY4SLEa
	 ISuNDqsn9MvH468ghs8RFDYohLKYRIm2o5BjdJ/Ni63NJJU1x+XnEdyepZgDkMsXF7
	 by+28UouvqBSA==
Date: Mon, 22 Jul 2024 10:34:06 +0300
From: Mike Rapoport <rppt@kernel.org>
To: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Cc: David Hildenbrand <david@redhat.com>, linux-kernel@vger.kernel.org,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Andreas Larsson <andreas@gaisler.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Arnd Bergmann <arnd@arndb.de>, Borislav Petkov <bp@alien8.de>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Dan Williams <dan.j.williams@intel.com>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"David S. Miller" <davem@davemloft.net>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Heiko Carstens <hca@linux.ibm.com>,
	Huacai Chen <chenhuacai@kernel.org>, Ingo Molnar <mingo@redhat.com>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Thomas Gleixner <tglx@linutronix.de>,
	Vasily Gorbik <gor@linux.ibm.com>, Will Deacon <will@kernel.org>,
	linux-arm-kernel@lists.infradead.org, loongarch@lists.linux.dev,
	linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
	linux-sh@vger.kernel.org, sparclinux@vger.kernel.org,
	linux-acpi@vger.kernel.org, linux-cxl@vger.kernel.org,
	nvdimm@lists.linux.dev, devicetree@vger.kernel.org,
	linux-arch@vger.kernel.org, linux-mm@kvack.org, x86@kernel.org
Subject: Re: [PATCH 02/17] MIPS: sgi-ip27: make NODE_DATA() the same as on
 all other architectures
Message-ID: <Zp4Lbh20_IHZ2I5n@kernel.org>
References: <20240716111346.3676969-1-rppt@kernel.org>
 <20240716111346.3676969-3-rppt@kernel.org>
 <e57eca18-b66d-4b5d-9e73-8ab22f6bc747@redhat.com>
 <20240719153852.00003f44@Huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240719153852.00003f44@Huawei.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240722_003720_305736_F39F9FD9 
X-CRM114-Status: GOOD (  33.53  )
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

On Fri, Jul 19, 2024 at 03:38:52PM +0100, Jonathan Cameron wrote:
> On Wed, 17 Jul 2024 16:32:59 +0200
> David Hildenbrand <david@redhat.com> wrote:
> 
> > On 16.07.24 13:13, Mike Rapoport wrote:
> > > From: "Mike Rapoport (Microsoft)" <rppt@kernel.org>
> > > 
> > > sgi-ip27 is the only system that defines NODE_DATA() differently than
> > > the rest of NUMA machines.
> > > 
> > > Add node_data array of struct pglist pointers that will point to
> > > __node_data[node]->pglist and redefine NODE_DATA() to use node_data
> > > array.
> > > 
> > > This will allow pulling declaration of node_data to the generic mm code
> > > in the next commit.
> > > 
> > > Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
> > > ---
> > >   arch/mips/include/asm/mach-ip27/mmzone.h | 5 ++++-
> > >   arch/mips/sgi-ip27/ip27-memory.c         | 5 ++++-
> > >   2 files changed, 8 insertions(+), 2 deletions(-)
> > > 
> > > diff --git a/arch/mips/include/asm/mach-ip27/mmzone.h b/arch/mips/include/asm/mach-ip27/mmzone.h
> > > index 08c36e50a860..629c3f290203 100644
> > > --- a/arch/mips/include/asm/mach-ip27/mmzone.h
> > > +++ b/arch/mips/include/asm/mach-ip27/mmzone.h
> > > @@ -22,7 +22,10 @@ struct node_data {
> > >   
> > >   extern struct node_data *__node_data[];
> > >   
> > > -#define NODE_DATA(n)		(&__node_data[(n)]->pglist)
> > >   #define hub_data(n)		(&__node_data[(n)]->hub)
> > >   
> > > +extern struct pglist_data *node_data[];
> > > +
> > > +#define NODE_DATA(nid)		(node_data[nid])
> > > +
> > >   #endif /* _ASM_MACH_MMZONE_H */
> > > diff --git a/arch/mips/sgi-ip27/ip27-memory.c b/arch/mips/sgi-ip27/ip27-memory.c
> > > index b8ca94cfb4fe..c30ef6958b97 100644
> > > --- a/arch/mips/sgi-ip27/ip27-memory.c
> > > +++ b/arch/mips/sgi-ip27/ip27-memory.c
> > > @@ -34,8 +34,10 @@
> > >   #define SLOT_PFNSHIFT		(SLOT_SHIFT - PAGE_SHIFT)
> > >   #define PFN_NASIDSHFT		(NASID_SHFT - PAGE_SHIFT)
> > >   
> > > -struct node_data *__node_data[MAX_NUMNODES];
> > > +struct pglist_data *node_data[MAX_NUMNODES];
> > > +EXPORT_SYMBOL(node_data);
> > >   
> > > +struct node_data *__node_data[MAX_NUMNODES];
> > >   EXPORT_SYMBOL(__node_data);
> > >   
> > >   static u64 gen_region_mask(void)
> > > @@ -361,6 +363,7 @@ static void __init node_mem_init(nasid_t node)
> > >   	 */
> > >   	__node_data[node] = __va(slot_freepfn << PAGE_SHIFT);
> > >   	memset(__node_data[node], 0, PAGE_SIZE);
> > > +	node_data[node] = &__node_data[node]->pglist;
> > >   
> > >   	NODE_DATA(node)->node_start_pfn = start_pfn;
> > >   	NODE_DATA(node)->node_spanned_pages = end_pfn - start_pfn;  
> > 
> > I was assuming we could get rid of __node_data->pglist.
> > 
> > But now I am confused where that is actually set.
> 
> It looks nasty... 

Nasty indeed :)

> Cast in arch_refresh_nodedata() takes incoming pg_data_t * and casts it
> to the local version of struct node_data * which I think is this one
> 
> struct node_data {
> 	struct pglist_data pglist; (which is pg_data_t pglist)
> 	struct hub_data hub;
> };
> 
> https://elixir.bootlin.com/linux/v6.10/source/arch/mips/sgi-ip27/ip27-memory.c#L432
> 
> Now that pg_data_t is allocated by 
> arch_alloc_nodedata() which might be fine (though types could be handled in a more
> readable fashion via some container_of() magic.
> https://elixir.bootlin.com/linux/v6.10/source/arch/mips/sgi-ip27/ip27-memory.c#L427
> 
> However that call is:
> pg_data_t * __init arch_alloc_nodedata(int nid)
> {
> 	return memblock_alloc(sizeof(pg_data_t), SMP_CACHE_BYTES);
> }
> 
> So doesn't seem to allocate enough space to me as should be sizeof(struct node_data)

Well, it's there to silence a compiler error (commit f8f9f21c7848 ("MIPS:
Fix build error for loongson64 and sgi-ip27")), but this is not a proper
fix :(
Luckily nothing calls cpumask_of_node() for offline nodes...
 
> Worth cleaning up whilst here?  Proper handling of types would definitely
> help.

Worth cleanup indeed, but I'd rather drop arch_alloc_nodedata() on MIPS
altogether.
 
> Jonathan

-- 
Sincerely yours,
Mike.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
