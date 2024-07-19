Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EBE5CC3DA59
	for <linux-riscv@archiver.kernel.org>; Fri, 19 Jul 2024 17:31:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Qtui43RIkh0cCRdberqFDeII2FKkpK468OA05IlzzPA=; b=dAyHsY50//kDHK
	sJDnaFRIc7/NszSl9gxUOtNr9ZK3gPCTNC35l/8p6pst9IJjc98oFJUA3H8kAtVh35rU/81skRqHg
	usam55aqFjulBwZ7nybISwj3cnN35HpjhSpm440eEBCT+gldRTkItmpFlSuSLEfIUPlKdTCMPQ+w7
	FeIT6EYXFqE5JEPPBZoUTDOqYaZ8WOiJcxBSSzN/DBkCL3Ur5G5v79/eh1LontkND2oQgdkQPgTsZ
	2jTcEPsh6nwhmydEqNPR+PMKiFBlrgslS1ZsZwo9hwI2PKlExix7TzPiAyBpCkIfznTKpZPXc500z
	fRG93dUgILW9LW89rMYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sUrRa-00000003OIq-26nE;
	Fri, 19 Jul 2024 17:30:58 +0000
Received: from frasgout.his.huawei.com ([185.176.79.56])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sUqTa-00000003Huo-3IK9;
	Fri, 19 Jul 2024 16:29:00 +0000
Received: from mail.maildlp.com (unknown [172.18.186.231])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4WQZn61R1mz6K7Fc;
	Sat, 20 Jul 2024 00:26:34 +0800 (CST)
Received: from lhrpeml500005.china.huawei.com (unknown [7.191.163.240])
	by mail.maildlp.com (Postfix) with ESMTPS id 9E616140517;
	Sat, 20 Jul 2024 00:28:51 +0800 (CST)
Received: from localhost (10.48.157.16) by lhrpeml500005.china.huawei.com
 (7.191.163.240) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.39; Fri, 19 Jul
 2024 17:28:50 +0100
Date: Fri, 19 Jul 2024 17:28:49 +0100
From: Jonathan Cameron <Jonathan.Cameron@Huawei.com>
To: Mike Rapoport <rppt@kernel.org>
CC: <linux-kernel@vger.kernel.org>, Alexander Gordeev
	<agordeev@linux.ibm.com>, Andreas Larsson <andreas@gaisler.com>, "Andrew
 Morton" <akpm@linux-foundation.org>, Arnd Bergmann <arnd@arndb.de>, "Borislav
 Petkov" <bp@alien8.de>, Catalin Marinas <catalin.marinas@arm.com>, Christophe
 Leroy <christophe.leroy@csgroup.eu>, Dan Williams <dan.j.williams@intel.com>,
	Dave Hansen <dave.hansen@linux.intel.com>, David Hildenbrand
	<david@redhat.com>, "David S. Miller" <davem@davemloft.net>, Greg
 Kroah-Hartman <gregkh@linuxfoundation.org>, Heiko Carstens
	<hca@linux.ibm.com>, Huacai Chen <chenhuacai@kernel.org>, Ingo Molnar
	<mingo@redhat.com>, Jiaxun Yang <jiaxun.yang@flygoat.com>, "John Paul Adrian
 Glaubitz" <glaubitz@physik.fu-berlin.de>, Michael Ellerman
	<mpe@ellerman.id.au>, Palmer Dabbelt <palmer@dabbelt.com>, "Rafael J.
 Wysocki" <rafael@kernel.org>, Rob Herring <robh@kernel.org>, "Thomas
 Bogendoerfer" <tsbogend@alpha.franken.de>, Thomas Gleixner
	<tglx@linutronix.de>, Vasily Gorbik <gor@linux.ibm.com>, Will Deacon
	<will@kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<loongarch@lists.linux.dev>, <linux-mips@vger.kernel.org>,
	<linuxppc-dev@lists.ozlabs.org>, <linux-riscv@lists.infradead.org>,
	<linux-s390@vger.kernel.org>, <linux-sh@vger.kernel.org>,
	<sparclinux@vger.kernel.org>, <linux-acpi@vger.kernel.org>,
	<linux-cxl@vger.kernel.org>, <nvdimm@lists.linux.dev>,
	<devicetree@vger.kernel.org>, <linux-arch@vger.kernel.org>,
	<linux-mm@kvack.org>, <x86@kernel.org>
Subject: Re: [PATCH 06/17] x86/numa: simplify numa_distance allocation
Message-ID: <20240719172849.000019a0@Huawei.com>
In-Reply-To: <20240716111346.3676969-7-rppt@kernel.org>
References: <20240716111346.3676969-1-rppt@kernel.org>
	<20240716111346.3676969-7-rppt@kernel.org>
Organization: Huawei Technologies Research and Development (UK) Ltd.
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.33; x86_64-w64-mingw32)
MIME-Version: 1.0
X-Originating-IP: [10.48.157.16]
X-ClientProxiedBy: lhrpeml500006.china.huawei.com (7.191.161.198) To
 lhrpeml500005.china.huawei.com (7.191.163.240)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240719_092859_151486_BC310754 
X-CRM114-Status: GOOD (  23.19  )
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

On Tue, 16 Jul 2024 14:13:35 +0300
Mike Rapoport <rppt@kernel.org> wrote:

> From: "Mike Rapoport (Microsoft)" <rppt@kernel.org>
> 
> Allocation of numa_distance uses memblock_phys_alloc_range() to limit
> allocation to be below the last mapped page.
> 
> But NUMA initializaition runs after the direct map is populated and

initialization (one too many 'i's)

> there is also code in setup_arch() that adjusts memblock limit to
> reflect how much memory is already mapped in the direct map.
> 
> Simplify the allocation of numa_distance and use plain memblock_alloc().
> This makes the code clearer and ensures that when numa_distance is not
> allocated it is always NULL.
Doesn't this break the comment in numa_set_distance() kernel-doc?
"
 * If such table cannot be allocated, a warning is printed and further
 * calls are ignored until the distance table is reset with
 * numa_reset_distance().
"

Superficially that looks to be to avoid repeatedly hitting the
singleton bit at the top of numa_set_distance() as SRAT or similar
parsing occurs.

> 
> Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
> ---
>  arch/x86/mm/numa.c | 12 +++---------
>  1 file changed, 3 insertions(+), 9 deletions(-)
> 
> diff --git a/arch/x86/mm/numa.c b/arch/x86/mm/numa.c
> index 5e1dde26674b..ab2d4ecef786 100644
> --- a/arch/x86/mm/numa.c
> +++ b/arch/x86/mm/numa.c
> @@ -319,8 +319,7 @@ void __init numa_reset_distance(void)
>  {
>  	size_t size = numa_distance_cnt * numa_distance_cnt * sizeof(numa_distance[0]);
>  
> -	/* numa_distance could be 1LU marking allocation failure, test cnt */
> -	if (numa_distance_cnt)
> +	if (numa_distance)
>  		memblock_free(numa_distance, size);
>  	numa_distance_cnt = 0;
>  	numa_distance = NULL;	/* enable table creation */
> @@ -331,7 +330,6 @@ static int __init numa_alloc_distance(void)
>  	nodemask_t nodes_parsed;
>  	size_t size;
>  	int i, j, cnt = 0;
> -	u64 phys;
>  
>  	/* size the new table and allocate it */
>  	nodes_parsed = numa_nodes_parsed;
> @@ -342,16 +340,12 @@ static int __init numa_alloc_distance(void)
>  	cnt++;
>  	size = cnt * cnt * sizeof(numa_distance[0]);
>  
> -	phys = memblock_phys_alloc_range(size, PAGE_SIZE, 0,
> -					 PFN_PHYS(max_pfn_mapped));
> -	if (!phys) {
> +	numa_distance = memblock_alloc(size, PAGE_SIZE);
> +	if (!numa_distance) {
>  		pr_warn("Warning: can't allocate distance table!\n");
> -		/* don't retry until explicitly reset */
> -		numa_distance = (void *)1LU;
>  		return -ENOMEM;
>  	}
>  
> -	numa_distance = __va(phys);
>  	numa_distance_cnt = cnt;
>  
>  	/* fill with the default distances */


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
