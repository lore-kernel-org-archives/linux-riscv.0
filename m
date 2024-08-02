Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24C05C52D6D
	for <linux-riscv@archiver.kernel.org>; Fri,  2 Aug 2024 11:13:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=q0h5j3Y+5vqMBbfCBxvp5l16s5wKDM2M2wfnI87ycTA=; b=vVmeJBkoIi6zRM
	IW7rprk6q+lyeDYRCuPaZF160jx9dhF1RROrzfxqX4A5Hj4GYlEzcH6QiKy7CDaWSSbO8KCF2eNor
	hpAxpbcXR+QApCdb/ha3EUtNOBx9Lt4FGksxjiIezrBuHCAAY4gsS7SsJhWKOQEd1kRVbCLn7orL+
	jlMRJi4ksCzgaq/zJXReLPT4l8X3QljahuEHJWwNWiRLVwXjU3+KP4gqhxFMl4ppeXtB/8P7Zd2fr
	W6/Rc0hLBlSnWyUvZWpZf/xMQEjRi0bEqgBLWCl2i6pNs2CkWryiJDf8AvYd0iAJZ9uh+SxqdLPti
	SKl5P5K6gjGWinxPDVNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sZqDe-00000008eIe-1eLp;
	Fri, 02 Aug 2024 11:13:10 +0000
Received: from frasgout.his.huawei.com ([185.176.79.56])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sZqD6-00000008e45-2paA;
	Fri, 02 Aug 2024 11:12:38 +0000
Received: from mail.maildlp.com (unknown [172.18.186.231])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4Wb35J7183z6K9Db;
	Fri,  2 Aug 2024 19:09:56 +0800 (CST)
Received: from lhrpeml500005.china.huawei.com (unknown [7.191.163.240])
	by mail.maildlp.com (Postfix) with ESMTPS id 5BD1D140A08;
	Fri,  2 Aug 2024 19:12:34 +0800 (CST)
Received: from localhost (10.203.177.66) by lhrpeml500005.china.huawei.com
 (7.191.163.240) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.39; Fri, 2 Aug
 2024 12:12:33 +0100
Date: Fri, 2 Aug 2024 12:12:32 +0100
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
Subject: Re: [PATCH v3 22/26] mm: numa_memblks: use
 memblock_{start,end}_of_DRAM() when sanitizing meminfo
Message-ID: <20240802121232.00005b2c@Huawei.com>
In-Reply-To: <20240801060826.559858-23-rppt@kernel.org>
References: <20240801060826.559858-1-rppt@kernel.org>
	<20240801060826.559858-23-rppt@kernel.org>
Organization: Huawei Technologies Research and Development (UK) Ltd.
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.33; x86_64-w64-mingw32)
MIME-Version: 1.0
X-Originating-IP: [10.203.177.66]
X-ClientProxiedBy: lhrpeml500003.china.huawei.com (7.191.162.67) To
 lhrpeml500005.china.huawei.com (7.191.163.240)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240802_041237_037896_2C5975B8 
X-CRM114-Status: GOOD (  15.43  )
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

On Thu,  1 Aug 2024 09:08:22 +0300
Mike Rapoport <rppt@kernel.org> wrote:

> From: "Mike Rapoport (Microsoft)" <rppt@kernel.org>
> 
> numa_cleanup_meminfo() moves blocks outside system RAM to
> numa_reserved_meminfo and it uses 0 and PFN_PHYS(max_pfn) to determine
> the memory boundaries.
> 
> Replace the memory range boundaries with more portable
> memblock_start_of_DRAM() and memblock_end_of_DRAM().
> 
> Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
> Tested-by: Zi Yan <ziy@nvidia.com> # for x86_64 and arm64
Makes sense
Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>

> ---
>  mm/numa_memblks.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/mm/numa_memblks.c b/mm/numa_memblks.c
> index e97665a5e8ce..e4358ad92233 100644
> --- a/mm/numa_memblks.c
> +++ b/mm/numa_memblks.c
> @@ -212,8 +212,8 @@ int __init numa_add_memblk(int nid, u64 start, u64 end)
>   */
>  int __init numa_cleanup_meminfo(struct numa_meminfo *mi)
>  {
> -	const u64 low = 0;
> -	const u64 high = PFN_PHYS(max_pfn);
> +	const u64 low = memblock_start_of_DRAM();
> +	const u64 high = memblock_end_of_DRAM();
>  	int i, j, k;
>  
>  	/* first, trim all entries */


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
