Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9037C3DA59
	for <linux-riscv@archiver.kernel.org>; Sat, 20 Jul 2024 10:27:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PEJjULpAOF8H30iYq0Ns4Wjb8vMdRIHVQ5aQVRLR38I=; b=3iQP6UkGKa5XxG
	J8LLHqPS+0KmzeJvZiUPuYetAMsrbn5b7MqPyEPqp1JkyMODKBvTH9gean8mG1YZ3+MXhusgPO/s1
	lvgxCqQ+ZC1n6k2h1EshABDa+1LjQEU0g6t7XLfQ0XRWMqA3sx+FgOX94+/FifAnHNp5zLSNyPlae
	fQ/EGe0O+t7gmS4fDzLDcmEisw3oliPRKucQm2Oh1cY24M5rpKV8wrFkkNrD0D/debG9mBVuz1lUe
	w4fuAKrFKnVQMW4Ml5FZHlD842V7yJBNd4FnHUizDu3Uhlo3OkiMm4zYUCdvIMVFG3Ikvy54vRGJe
	igRHnH5eIHJsFbIrsm5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sV7JW-00000004uxo-0dxy;
	Sat, 20 Jul 2024 10:27:42 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sV7J9-00000004upE-15nF;
	Sat, 20 Jul 2024 10:27:21 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 423DFCE021C;
	Sat, 20 Jul 2024 10:27:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F39A7C2BD10;
	Sat, 20 Jul 2024 10:27:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1721471235;
	bh=dVNVV+LbgZSpehO8np8DsTOCzJGiWq4UJOrsJg2zgCA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OSOw1h0Ig/Sxo42NZVxgWqDg7PApDQPKQu7IqHtWulHzO5DZIoZUQKCkyr/Imoxko
	 Lntuo9YYc0lQcsGc+PRntWL+4q6xGqYrJQGqSwrQ2zZ1CtZ6MvlYyVAEJlaBtunrNO
	 F2DuSLx1QB9fjEK101QysRMhcJp+/gGJQsWj4+tgA87UM1Qqi7MiDFaIy33Yfgv/7x
	 VV0gk0bbejGKCDskyj6Yq3aWY4qrq3jL+EZ+nUCUWS3c3DH2vL/WRIeqbcd+hCBosA
	 QTOgUg+IY8NEEcUIVy6GfU3iS+hehOwAyUj7zAH7+pI+6MP+NYXBi6cf1MEyU9Ri4P
	 as0dGwXRHcDEg==
Date: Sat, 20 Jul 2024 13:24:06 +0300
From: Mike Rapoport <rppt@kernel.org>
To: David Hildenbrand <david@redhat.com>
Cc: linux-kernel@vger.kernel.org,
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
	Jonathan Cameron <jonathan.cameron@huawei.com>,
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
Subject: Re: [PATCH 05/17] arch, mm: pull out allocation of NODE_DATA to
 generic code
Message-ID: <ZpuQRgmrp-4deiur@kernel.org>
References: <20240716111346.3676969-1-rppt@kernel.org>
 <20240716111346.3676969-6-rppt@kernel.org>
 <220da8ed-337a-4b1e-badf-2bff1d36e6c3@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <220da8ed-337a-4b1e-badf-2bff1d36e6c3@redhat.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240720_032719_676497_84048C34 
X-CRM114-Status: GOOD (  20.55  )
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

On Wed, Jul 17, 2024 at 04:42:48PM +0200, David Hildenbrand wrote:
> On 16.07.24 13:13, Mike Rapoport wrote:
> > From: "Mike Rapoport (Microsoft)" <rppt@kernel.org>
> > 
> > Architectures that support NUMA duplicate the code that allocates
> > NODE_DATA on the node-local memory with slight variations in reporting
> > of the addresses where the memory was allocated.
> > 
> > Use x86 version as the basis for the generic alloc_node_data() function
> > and call this function in architecture specific numa initialization.
> > 
> > Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
> > ---
> 
> [...]
> 
> > diff --git a/arch/mips/loongson64/numa.c b/arch/mips/loongson64/numa.c
> > index 9208eaadf690..909f6cec3a26 100644
> > --- a/arch/mips/loongson64/numa.c
> > +++ b/arch/mips/loongson64/numa.c
> > @@ -81,12 +81,8 @@ static void __init init_topology_matrix(void)
> >   static void __init node_mem_init(unsigned int node)
> >   {
> > -	struct pglist_data *nd;
> >   	unsigned long node_addrspace_offset;
> >   	unsigned long start_pfn, end_pfn;
> > -	unsigned long nd_pa;
> > -	int tnid;
> > -	const size_t nd_size = roundup(sizeof(pg_data_t), SMP_CACHE_BYTES);
> 
> One interesting change is that we now always round up to full pages on
> architectures where we previously rounded up to SMP_CACHE_BYTES.

I did some git archaeology and it seems that round up to full pages on x86
backdates to bootmem era when allocation granularity was PAGE_SIZE anyway.
I'm going to change that to SMP_CACHE_BYTES in v2.
 
> I assume we don't really expect a significant growth in memory consumption
> that we care about, especially because most systems with many nodes also
> have  quite some memory around.

-- 
Sincerely yours,
Mike.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
