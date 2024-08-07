Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16EC9C52D73
	for <linux-riscv@archiver.kernel.org>; Wed,  7 Aug 2024 18:21:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fPOnzBnO6dWw5lk+qJuhSys0uUR9aCIW9xU8BgOWyLI=; b=rXV/y04TPbTi/c
	z8416BmE/3eOHQso4+Hm5R5f7LnH46URWqcUvVxwCWOMbhrJSNsoqP4JlHILEBsblRQpYj0AkyrUY
	jVpM3ViwiHBnV53hG1Pyq/Z+cE95+z6XxgLfETV4mhgfrKoXGP21dzx/kWcuSN431gyh1zwsIenVt
	VJfADwRcFaA3AQx724mIyoOzRfsK1+BELFJgmgXykBkWx9QqJVbQ444WeeqO49klZnjPJf9zwS6nN
	AJ15lxINv9+ZFbv3qABITQqWPWHJpsXf2iJCesCANBU5ToNN9qwBwMbbN/XwtzXrJ8CZfqmd4b373
	2ICLYDOOEjDw12Tq4x/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sblHs-00000005vnx-3lRK;
	Wed, 07 Aug 2024 18:21:28 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sblHH-00000005vcl-3SVd;
	Wed, 07 Aug 2024 18:20:53 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id C181ACE1196;
	Wed,  7 Aug 2024 18:20:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BF468C32781;
	Wed,  7 Aug 2024 18:20:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1723054848;
	bh=iPtiZxg9mYFfVaMP/wI1h2AEAZxcZhi354BsRK7OzkQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fs+rYBQUVp7T/qbPiJP5M3yDB/6MQZbtGhaQKvRjA1Mevvpi2N6URXoVm6Iu+rs/H
	 5E96EIlDL0oiovI1UalP4pGMxvee6uDYhAHWeNICYCTEurK07w5XNnYjIp7hBBtH+o
	 BuYSL8/k1GjAORViJw9J27QcUbojhI3Ae/34xWNzZpQoCHqR1I22VHBnMk5CVvZxw6
	 SS54CnDP9bArj1yivpeOI0pLAxkinjxlqbL5z/NWC2FfzasiBT9xJGfZMh2KPtgniu
	 UwqU0smfhLaXdoDIRZ0Xs8jOb5KYUUdKDjJmyRdFpd/cLCPX7dVpAIbbnapWdyqlxn
	 +oDN4u6kRqxgA==
Date: Wed, 7 Aug 2024 21:18:24 +0300
From: Mike Rapoport <rppt@kernel.org>
To: Arnd Bergmann <arnd@arndb.de>
Cc: linux-kernel@vger.kernel.org,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Andreas Larsson <andreas@gaisler.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Borislav Petkov <bp@alien8.de>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Dan Williams <dan.j.williams@intel.com>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	David Hildenbrand <david@redhat.com>,
	"David S . Miller" <davem@davemloft.net>,
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
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Samuel Holland <samuel.holland@sifive.com>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Thomas Gleixner <tglx@linutronix.de>,
	Vasily Gorbik <gor@linux.ibm.com>, Will Deacon <will@kernel.org>,
	Zi Yan <ziy@nvidia.com>, devicetree@vger.kernel.org,
	linux-acpi@vger.kernel.org, Linux-Arch <linux-arch@vger.kernel.org>,
	linux-arm-kernel@lists.infradead.org, linux-cxl@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-mips@vger.kernel.org,
	linux-mm@kvack.org, linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org, linux-sh@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, loongarch@lists.linux.dev,
	nvdimm@lists.linux.dev, sparclinux@vger.kernel.org, x86@kernel.org
Subject: Re: [PATCH v4 24/26] arch_numa: switch over to numa_memblks
Message-ID: <ZrO6cExVz1He_yPn@kernel.org>
References: <20240807064110.1003856-1-rppt@kernel.org>
 <20240807064110.1003856-25-rppt@kernel.org>
 <1befc540-8904-4c23-b0e6-e2c556fe22b9@app.fastmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1befc540-8904-4c23-b0e6-e2c556fe22b9@app.fastmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240807_112052_402589_2844BA24 
X-CRM114-Status: GOOD (  22.39  )
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

On Wed, Aug 07, 2024 at 08:58:37AM +0200, Arnd Bergmann wrote:
> On Wed, Aug 7, 2024, at 08:41, Mike Rapoport wrote:
> > From: "Mike Rapoport (Microsoft)" <rppt@kernel.org>
> >
> > Until now arch_numa was directly translating firmware NUMA information
> > to memblock.
> 
> I get a link time warning from this:
> 
>     WARNING: modpost: vmlinux: section mismatch in reference: numa_set_cpumask+0x24 (section: .text.unlikely) -> early_cpu_to_node (section: .init.text)

I didn't see this neither in my build tests nor in kbuild reports :/
 
> > @@ -142,7 +144,7 @@ void __init early_map_cpu_to_node(unsigned int cpu, int nid)
> >  unsigned long __per_cpu_offset[NR_CPUS] __read_mostly;
> >  EXPORT_SYMBOL(__per_cpu_offset);
> > 
> > -int __init early_cpu_to_node(int cpu)
> > +int early_cpu_to_node(int cpu)
> >  {
> >  	return cpu_to_node_map[cpu];
> >  }
> 
> early_cpu_to_node() can no longer be __init here
> 
> > +#endif /* CONFIG_NUMA_EMU */
> > diff --git a/include/asm-generic/numa.h b/include/asm-generic/numa.h
> > index c32e0cf23c90..c2b046d1fd82 100644
> > --- a/include/asm-generic/numa.h
> > +++ b/include/asm-generic/numa.h
> > @@ -32,8 +32,6 @@ static inline const struct cpumask *cpumask_of_node(int node)
> > 
> >  void __init arch_numa_init(void);
> >  int __init numa_add_memblk(int nodeid, u64 start, u64 end);
> > -void __init numa_set_distance(int from, int to, int distance);
> > -void __init numa_free_distance(void);
> >  void __init early_map_cpu_to_node(unsigned int cpu, int nid);
> >  int __init early_cpu_to_node(int cpu);
> >  void numa_store_cpu_info(unsigned int cpu);
> 
> but is still declared as __init in the header, so it is
> still put in that section and discarded after boot.

I believe this should fix it

diff --git a/include/asm-generic/numa.h b/include/asm-generic/numa.h
index c2b046d1fd82..e063d6487f66 100644
--- a/include/asm-generic/numa.h
+++ b/include/asm-generic/numa.h
@@ -33,7 +33,7 @@ static inline const struct cpumask *cpumask_of_node(int node)
 void __init arch_numa_init(void);
 int __init numa_add_memblk(int nodeid, u64 start, u64 end);
 void __init early_map_cpu_to_node(unsigned int cpu, int nid);
-int __init early_cpu_to_node(int cpu);
+int early_cpu_to_node(int cpu);
 void numa_store_cpu_info(unsigned int cpu);
 void numa_add_cpu(unsigned int cpu);
 void numa_remove_cpu(unsigned int cpu);
 
> I was confused by this at first, since the 'early' name
> seems to imply that you shouldn't call it once the system
> is up, but now you do.

I agree that this is confusing, but that's what x86 does and numa_emulation
uses.
 
>      Arnd
> 

-- 
Sincerely yours,
Mike.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
