Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A374C3DA4A
	for <linux-riscv@archiver.kernel.org>; Thu,  1 Aug 2024 18:46:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zj1Bp8HZtZ5KUy0+7cQznjc3uaD0Raq+wAkr36iTln8=; b=usrgnpEFyq8oYg
	6cBRY3X7uW7tidCU42NakWO8Z7r6dFOq59v9kYjHzUGLQvYz04lHeA9moXf0KTYaCYQ2FBMq0713x
	xA2OKzT0uGz/HSOztDbOIRJuVPW0IGTI89QrJFfIeoQaasgad4bf2KxcD3rIkCYh938ezsRfSr4ZM
	osG0plW30zOxn1gzPQHT+4zfGJ0sKk/xChekEEKZDpsygLZnmNcs11k9Xc6LnMaprgV8GXV+WR8mC
	+smSKm6bA5f2Xk5Ii25XOSWrKEKa7lY0fLLrNfQndmpaFJ3It07YIZ/I5+YyH1ihZvnN/1onQhqPu
	MX9xghiA/LKr146a64VA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sZaoc-00000006RDF-440R;
	Thu, 01 Aug 2024 18:46:18 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sZZqt-00000006HVX-3kkM;
	Thu, 01 Aug 2024 17:44:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:References:In-Reply-To:Message-ID:Subject:CC:To:From:Date:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=LXnybphf572bwJQi7c32ZGhQObLEFsQQQZzWOfMLtks=; b=fc3/JXegpm5HZrzoF78l/pRszb
	+7Jk9YqMPpc8ar+uFDT3Tudzw8WpVqrHrmWqPsPssrInSt4BvMiF963XqhXFmS4xZapLMwC/rWv5b
	dkO1ByT8WGD0wipIOhLH2osk8kWTmqVaRelsoP6uKhFEoahsIfTt7uLKYm6jA/ihUxMk6KLfs6+3k
	Wx9KJf1FxKjHBTBiPg+iW8qcvOuzUOiTnGG+Mqwg+SqYN/7a7D4F6h6ljYXoVWJL8q1PWgU/UrxS4
	JqayMwIQSShzRvCj6rlTNAQr5+35LUGT+EmFUtkNFcOX6wU9XxfEKfA35Q/uMl0Hc+2xYwpwoIEhd
	KMrh8Xhg==;
Received: from frasgout.his.huawei.com ([185.176.79.56])
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sZZqo-00000005XAI-3u1J;
	Thu, 01 Aug 2024 17:44:33 +0000
Received: from mail.maildlp.com (unknown [172.18.186.31])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4WZbqf2c9cz6K6MB;
	Fri,  2 Aug 2024 01:41:34 +0800 (CST)
Received: from lhrpeml500005.china.huawei.com (unknown [7.191.163.240])
	by mail.maildlp.com (Postfix) with ESMTPS id 6C75C1400F4;
	Fri,  2 Aug 2024 01:44:10 +0800 (CST)
Received: from localhost (10.203.177.66) by lhrpeml500005.china.huawei.com
 (7.191.163.240) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.39; Thu, 1 Aug
 2024 18:44:09 +0100
Date: Thu, 1 Aug 2024 18:44:08 +0100
From: Jonathan Cameron <Jonathan.Cameron@Huawei.com>
To: Mike Rapoport <rppt@kernel.org>
CC: <linux-kernel@vger.kernel.org>, Alexander Gordeev
	<agordeev@linux.ibm.com>, Andreas Larsson <andreas@gaisler.com>, "Andrew
 Morton" <akpm@linux-foundation.org>, Arnd Bergmann <arnd@arndb.de>, "Borislav
 Petkov" <bp@alien8.de>, Catalin Marinas <catalin.marinas@arm.com>, Christophe
 Leroy <christophe.leroy@csgroup.eu>, Dan Williams <dan.j.williams@intel.com>,
	Dave Hansen <dave.hansen@linux.intel.com>, David Hildenbrand
	<david@redhat.com>, "David S. Miller" <davem@davemloft.net>, Davidlohr Bueso
	<dave@stgolabs.net>, "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>, Heiko
 Carstens <hca@linux.ibm.com>, Huacai Chen <chenhuacai@kernel.org>, Ingo
 Molnar <mingo@redhat.com>, Jiaxun Yang <jiaxun.yang@flygoat.com>, "John Paul
 Adrian Glaubitz" <glaubitz@physik.fu-berlin.de>, Jonathan Corbet
	<corbet@lwn.net>, Michael Ellerman <mpe@ellerman.id.au>, Palmer Dabbelt
	<palmer@dabbelt.com>, "Rafael J. Wysocki" <rafael@kernel.org>, Rob Herring
	<robh@kernel.org>, Samuel Holland <samuel.holland@sifive.com>, Thomas
 Bogendoerfer <tsbogend@alpha.franken.de>, Thomas Gleixner
	<tglx@linutronix.de>, "Vasily Gorbik" <gor@linux.ibm.com>, Will Deacon
	<will@kernel.org>, Zi Yan <ziy@nvidia.com>, <devicetree@vger.kernel.org>,
	<linux-acpi@vger.kernel.org>, <linux-arch@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-cxl@vger.kernel.org>,
	<linux-doc@vger.kernel.org>, <linux-mips@vger.kernel.org>,
	<linux-mm@kvack.org>, <linux-riscv@lists.infradead.org>,
	<linux-s390@vger.kernel.org>, <linux-sh@vger.kernel.org>,
	<linuxppc-dev@lists.ozlabs.org>, <loongarch@lists.linux.dev>,
	<nvdimm@lists.linux.dev>, <sparclinux@vger.kernel.org>, <x86@kernel.org>
Subject: Re: [PATCH v3 02/26] MIPS: sgi-ip27: make NODE_DATA() the same as
 on all other architectures
Message-ID: <20240801184408.00002e8b@Huawei.com>
In-Reply-To: <20240801060826.559858-3-rppt@kernel.org>
References: <20240801060826.559858-1-rppt@kernel.org>
	<20240801060826.559858-3-rppt@kernel.org>
Organization: Huawei Technologies Research and Development (UK) Ltd.
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.33; x86_64-w64-mingw32)
MIME-Version: 1.0
X-Originating-IP: [10.203.177.66]
X-ClientProxiedBy: lhrpeml500001.china.huawei.com (7.191.163.213) To
 lhrpeml500005.china.huawei.com (7.191.163.240)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240801_184431_331467_1F29F1AD 
X-CRM114-Status: GOOD (  23.74  )
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

On Thu,  1 Aug 2024 09:08:02 +0300
Mike Rapoport <rppt@kernel.org> wrote:

> From: "Mike Rapoport (Microsoft)" <rppt@kernel.org>
> 
> sgi-ip27 is the only system that defines NODE_DATA() differently than
> the rest of NUMA machines.
> 
> Add node_data array of struct pglist pointers that will point to
> __node_data[node]->pglist and redefine NODE_DATA() to use node_data
> array.
> 
> This will allow pulling declaration of node_data to the generic mm code
> in the next commit.
> 
> Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
After staring for a while at the use made of the other part
of the __node_data I think what you have in this an the next
two patches is fine.

I'm far from convinced it was correct before though as
arch_refresh_node_data() called on offline nodes in free_area_init()
would have replaced __node_data with an allocation of
size pg_data_t but the hub_data(), visible below, is after that.
Maybe hub_data() as never called for offline nodes, but
I couldn't establish that.

After these patches the arch_refresh_node_data() generic
version will only be replacing the pointer in node_data
leaving the hub_data where it was in the first place and
thus is fine.

So with that in mind (and it could be completely wrong ;)

Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>



> ---
>  arch/mips/include/asm/mach-ip27/mmzone.h | 5 ++++-
>  arch/mips/sgi-ip27/ip27-memory.c         | 5 ++++-
>  2 files changed, 8 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/mips/include/asm/mach-ip27/mmzone.h b/arch/mips/include/asm/mach-ip27/mmzone.h
> index 08c36e50a860..629c3f290203 100644
> --- a/arch/mips/include/asm/mach-ip27/mmzone.h
> +++ b/arch/mips/include/asm/mach-ip27/mmzone.h
> @@ -22,7 +22,10 @@ struct node_data {
>  
>  extern struct node_data *__node_data[];
>  
> -#define NODE_DATA(n)		(&__node_data[(n)]->pglist)
>  #define hub_data(n)		(&__node_data[(n)]->hub)
>  
> +extern struct pglist_data *node_data[];
> +
> +#define NODE_DATA(nid)		(node_data[nid])
> +
>  #endif /* _ASM_MACH_MMZONE_H */
> diff --git a/arch/mips/sgi-ip27/ip27-memory.c b/arch/mips/sgi-ip27/ip27-memory.c
> index b8ca94cfb4fe..c30ef6958b97 100644
> --- a/arch/mips/sgi-ip27/ip27-memory.c
> +++ b/arch/mips/sgi-ip27/ip27-memory.c
> @@ -34,8 +34,10 @@
>  #define SLOT_PFNSHIFT		(SLOT_SHIFT - PAGE_SHIFT)
>  #define PFN_NASIDSHFT		(NASID_SHFT - PAGE_SHIFT)
>  
> -struct node_data *__node_data[MAX_NUMNODES];
> +struct pglist_data *node_data[MAX_NUMNODES];
> +EXPORT_SYMBOL(node_data);
>  
> +struct node_data *__node_data[MAX_NUMNODES];
>  EXPORT_SYMBOL(__node_data);
>  
>  static u64 gen_region_mask(void)
> @@ -361,6 +363,7 @@ static void __init node_mem_init(nasid_t node)
>  	 */
>  	__node_data[node] = __va(slot_freepfn << PAGE_SHIFT);
>  	memset(__node_data[node], 0, PAGE_SIZE);
> +	node_data[node] = &__node_data[node]->pglist;
>  
>  	NODE_DATA(node)->node_start_pfn = start_pfn;
>  	NODE_DATA(node)->node_spanned_pages = end_pfn - start_pfn;


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
