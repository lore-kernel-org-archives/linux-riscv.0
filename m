Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E53AC3DA5D
	for <linux-riscv@archiver.kernel.org>; Fri, 19 Jul 2024 14:39:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3Z/3LrOnnQJguIKbCf6eGRHXbN5ivQdrlqb/xJ7VuH4=; b=ZNoH1ieclPE3Qj
	Hp5wH4s6k8AVcxhHfQ8tkf7HS4tYgf9ywxFAqc/JZtx4fAaFUKEepQX/xYBl2KNxqIcmENQQ5dS/6
	DPAA24atSplnZhLNVYLtpfNqcvWWliicFY2id7lHljRYp017M7J1KyK+gyU//p5hOGMpGVoYxb3KS
	PqyhvyjjGprOPRJ4tPVpXdW5zMIJqwGxjluFErLw250dK46tCiXVorPmM06X5mloSDSKTIZ6Qq+ZY
	VZNekLGwBavn9D//R33gpKqXr/J7MM/0g12S9M8/O8c1SQn/ed+MukkM3VysHtdLPHCvH4WdOCWds
	VFx+vOPhgh2XriYLpHpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sUola-00000002xlb-2zHg;
	Fri, 19 Jul 2024 14:39:26 +0000
Received: from frasgout.his.huawei.com ([185.176.79.56])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sUolD-00000002xck-0aBV;
	Fri, 19 Jul 2024 14:39:05 +0000
Received: from mail.maildlp.com (unknown [172.18.186.216])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4WQXMF48rrz6JBjL;
	Fri, 19 Jul 2024 22:37:29 +0800 (CST)
Received: from lhrpeml500005.china.huawei.com (unknown [7.191.163.240])
	by mail.maildlp.com (Postfix) with ESMTPS id D6E9D140684;
	Fri, 19 Jul 2024 22:38:53 +0800 (CST)
Received: from localhost (10.203.174.77) by lhrpeml500005.china.huawei.com
 (7.191.163.240) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.39; Fri, 19 Jul
 2024 15:38:53 +0100
Date: Fri, 19 Jul 2024 15:38:52 +0100
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
Subject: Re: [PATCH 02/17] MIPS: sgi-ip27: make NODE_DATA() the same as on
 all other architectures
Message-ID: <20240719153852.00003f44@Huawei.com>
In-Reply-To: <e57eca18-b66d-4b5d-9e73-8ab22f6bc747@redhat.com>
References: <20240716111346.3676969-1-rppt@kernel.org>
	<20240716111346.3676969-3-rppt@kernel.org>
	<e57eca18-b66d-4b5d-9e73-8ab22f6bc747@redhat.com>
Organization: Huawei Technologies Research and Development (UK) Ltd.
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.33; x86_64-w64-mingw32)
MIME-Version: 1.0
X-Originating-IP: [10.203.174.77]
X-ClientProxiedBy: lhrpeml500004.china.huawei.com (7.191.163.9) To
 lhrpeml500005.china.huawei.com (7.191.163.240)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240719_073903_477204_EEE5DA3A 
X-CRM114-Status: GOOD (  26.97  )
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

On Wed, 17 Jul 2024 16:32:59 +0200
David Hildenbrand <david@redhat.com> wrote:

> On 16.07.24 13:13, Mike Rapoport wrote:
> > From: "Mike Rapoport (Microsoft)" <rppt@kernel.org>
> > 
> > sgi-ip27 is the only system that defines NODE_DATA() differently than
> > the rest of NUMA machines.
> > 
> > Add node_data array of struct pglist pointers that will point to
> > __node_data[node]->pglist and redefine NODE_DATA() to use node_data
> > array.
> > 
> > This will allow pulling declaration of node_data to the generic mm code
> > in the next commit.
> > 
> > Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
> > ---
> >   arch/mips/include/asm/mach-ip27/mmzone.h | 5 ++++-
> >   arch/mips/sgi-ip27/ip27-memory.c         | 5 ++++-
> >   2 files changed, 8 insertions(+), 2 deletions(-)
> > 
> > diff --git a/arch/mips/include/asm/mach-ip27/mmzone.h b/arch/mips/include/asm/mach-ip27/mmzone.h
> > index 08c36e50a860..629c3f290203 100644
> > --- a/arch/mips/include/asm/mach-ip27/mmzone.h
> > +++ b/arch/mips/include/asm/mach-ip27/mmzone.h
> > @@ -22,7 +22,10 @@ struct node_data {
> >   
> >   extern struct node_data *__node_data[];
> >   
> > -#define NODE_DATA(n)		(&__node_data[(n)]->pglist)
> >   #define hub_data(n)		(&__node_data[(n)]->hub)
> >   
> > +extern struct pglist_data *node_data[];
> > +
> > +#define NODE_DATA(nid)		(node_data[nid])
> > +
> >   #endif /* _ASM_MACH_MMZONE_H */
> > diff --git a/arch/mips/sgi-ip27/ip27-memory.c b/arch/mips/sgi-ip27/ip27-memory.c
> > index b8ca94cfb4fe..c30ef6958b97 100644
> > --- a/arch/mips/sgi-ip27/ip27-memory.c
> > +++ b/arch/mips/sgi-ip27/ip27-memory.c
> > @@ -34,8 +34,10 @@
> >   #define SLOT_PFNSHIFT		(SLOT_SHIFT - PAGE_SHIFT)
> >   #define PFN_NASIDSHFT		(NASID_SHFT - PAGE_SHIFT)
> >   
> > -struct node_data *__node_data[MAX_NUMNODES];
> > +struct pglist_data *node_data[MAX_NUMNODES];
> > +EXPORT_SYMBOL(node_data);
> >   
> > +struct node_data *__node_data[MAX_NUMNODES];
> >   EXPORT_SYMBOL(__node_data);
> >   
> >   static u64 gen_region_mask(void)
> > @@ -361,6 +363,7 @@ static void __init node_mem_init(nasid_t node)
> >   	 */
> >   	__node_data[node] = __va(slot_freepfn << PAGE_SHIFT);
> >   	memset(__node_data[node], 0, PAGE_SIZE);
> > +	node_data[node] = &__node_data[node]->pglist;
> >   
> >   	NODE_DATA(node)->node_start_pfn = start_pfn;
> >   	NODE_DATA(node)->node_spanned_pages = end_pfn - start_pfn;  
> 
> I was assuming we could get rid of __node_data->pglist.
> 
> But now I am confused where that is actually set.

It looks nasty... Cast in arch_refresh_nodedata() takes
incoming pg_data_t * and casts it to the local version of
struct node_data * which I think is this one

struct node_data {
	struct pglist_data pglist; (which is pg_data_t pglist)
	struct hub_data hub;
};

https://elixir.bootlin.com/linux/v6.10/source/arch/mips/sgi-ip27/ip27-memory.c#L432

Now that pg_data_t is allocated by 
arch_alloc_nodedata() which might be fine (though types could be handled in a more
readable fashion via some container_of() magic.
https://elixir.bootlin.com/linux/v6.10/source/arch/mips/sgi-ip27/ip27-memory.c#L427

However that call is:
pg_data_t * __init arch_alloc_nodedata(int nid)
{
	return memblock_alloc(sizeof(pg_data_t), SMP_CACHE_BYTES);
}

So doesn't seem to allocate enough space to me as should be sizeof(struct node_data)

Worth cleaning up whilst here?  Proper handling of types would definitely
help.

Jonathan


> 
> Anyhow
> 
> Reviewed-by: David Hildenbrand <david@redhat.com>
> 


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
