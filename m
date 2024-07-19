Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8268C3DA59
	for <linux-riscv@archiver.kernel.org>; Fri, 19 Jul 2024 13:34:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=De2dnIG+7tI9vHow4LIWdnPQnoQvliPUXdSFe4LRpqk=; b=q/Wik+M8EGQY0z
	KIjEV6/4ldMtWsK4FCVQVZkLnxHP9mhZldI4e1IXJkUM/pwa/DnczyE1gdqu3X3Zybgh7ZfMU1UwZ
	RKwWDMR8k5a3DIPdJ/Hdg6iVZW93BcdyLj6Ha/nHHXThDpiZPAIEqDoztQuggD63FB3YNVKxw/UWK
	cwZHbaABKqsk8+dm5Dy/+av+RteLzkiqBoGRXMYpnDi4TtJcKK7aFBv0TG+klaxdSYEfSmXreI7qI
	J7vMyGt/KNyXG/HlO8GMp/zes1Pshde0uPRIAwSpA8wp9smn6EgSvKrCYFnp0XeXG+h64ruTN8Vf3
	BukoDs4nq+RRX+AEbWng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sUnkd-00000002nMk-3Lpk;
	Fri, 19 Jul 2024 13:34:23 +0000
Received: from frasgout.his.huawei.com ([185.176.79.56])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sUnkC-00000002nE8-0cV0;
	Fri, 19 Jul 2024 13:33:58 +0000
Received: from mail.maildlp.com (unknown [172.18.186.31])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4WQVw90sR6z6JBj4;
	Fri, 19 Jul 2024 21:32:25 +0800 (CST)
Received: from lhrpeml500005.china.huawei.com (unknown [7.191.163.240])
	by mail.maildlp.com (Postfix) with ESMTPS id 4D842140A87;
	Fri, 19 Jul 2024 21:33:49 +0800 (CST)
Received: from localhost (10.122.19.247) by lhrpeml500005.china.huawei.com
 (7.191.163.240) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.39; Fri, 19 Jul
 2024 14:33:48 +0100
Date: Fri, 19 Jul 2024 14:33:47 +0100
From: Jonathan Cameron <Jonathan.Cameron@huawei.com>
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
Subject: Re: [PATCH 00/17] mm: introduce numa_memblks
Message-ID: <20240719143347.000077d9@huawei.com>
In-Reply-To: <20240716111346.3676969-1-rppt@kernel.org>
References: <20240716111346.3676969-1-rppt@kernel.org>
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.29; x86_64-w64-mingw32)
MIME-Version: 1.0
X-Originating-IP: [10.122.19.247]
X-ClientProxiedBy: lhrpeml100002.china.huawei.com (7.191.160.241) To
 lhrpeml500005.china.huawei.com (7.191.163.240)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240719_063356_503362_6ED4C7D9 
X-CRM114-Status: GOOD (  24.15  )
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

On Tue, 16 Jul 2024 14:13:29 +0300
Mike Rapoport <rppt@kernel.org> wrote:

> From: "Mike Rapoport (Microsoft)" <rppt@kernel.org>
> 
> Hi,
> 
> Following the discussion about handling of CXL fixed memory windows on
> arm64 [1] I decided to bite the bullet and move numa_memblks from x86 to
> the generic code so they will be available on arm64/riscv and maybe on
> loongarch sometime later.
> 
> While it could be possible to use memblock to describe CXL memory windows,
> it currently lacks notion of unpopulated memory ranges and numa_memblks
> does implement this.
> 
> Another reason to make numa_memblks generic is that both arch_numa (arm64
> and riscv) and loongarch use trimmed copy of x86 code although there is no
> fundamental reason why the same code cannot be used on all these platforms.
> Having numa_memblks in mm/ will make it's interaction with ACPI and FDT
> more consistent and I believe will reduce maintenance burden.
> 
> And with generic numa_memblks it is (almost) straightforward to enable NUMA
> emulation on arm64 and riscv.
> 
> The first 5 commits in this series are cleanups that are not strictly
> related to numa_memblks.
> 
> Commits 6-11 slightly reorder code in x86 to allow extracting numa_memblks
> and NUMA emulation to the generic code.
> 
> Commits 12-14 actually move the code from arch/x86/ to mm/ and commit 15
> does some aftermath cleanups.
> 
> Commit 16 switches arch_numa to numa_memblks.
> 
> Commit 17 enables usage of phys_to_target_node() and
> memory_add_physaddr_to_nid() with numa_memblks.

Hi Mike,

I've lightly tested with emulated CXL + Generic Ports and Generic
Initiators as well as more normal cpus and memory via qemu on arm64 and it's
looking good.

From my earlier series, patch 4 is probably still needed to avoid
presenting nodes with nothing in them at boot (but not if we hotplug
memory then remove it again in which case they disappear)
https://lore.kernel.org/all/20240529171236.32002-5-Jonathan.Cameron@huawei.com/
However that was broken/inconsistent before your rework so I can send that
patch separately. 

Thanks for getting this sorted!  I should get time to do more extensive
testing and review in next week or so.

Jonathan

> 
> [1] https://lore.kernel.org/all/20240529171236.32002-1-Jonathan.Cameron@huawei.com/
> 
> Mike Rapoport (Microsoft) (17):
>   mm: move kernel/numa.c to mm/
>   MIPS: sgi-ip27: make NODE_DATA() the same as on all other
>     architectures
>   MIPS: loongson64: rename __node_data to node_data
>   arch, mm: move definition of node_data to generic code
>   arch, mm: pull out allocation of NODE_DATA to generic code
>   x86/numa: simplify numa_distance allocation
>   x86/numa: move FAKE_NODE_* defines to numa_emu
>   x86/numa_emu: simplify allocation of phys_dist
>   x86/numa_emu: split __apicid_to_node update to a helper function
>   x86/numa_emu: use a helper function to get MAX_DMA32_PFN
>   x86/numa: numa_{add,remove}_cpu: make cpu parameter unsigned
>   mm: introduce numa_memblks
>   mm: move numa_distance and related code from x86 to numa_memblks
>   mm: introduce numa_emulation
>   mm: make numa_memblks more self-contained
>   arch_numa: switch over to numa_memblks
>   mm: make range-to-target_node lookup facility a part of numa_memblks
> 
>  arch/arm64/include/asm/Kbuild                 |   1 +
>  arch/arm64/include/asm/mmzone.h               |  13 -
>  arch/arm64/include/asm/topology.h             |   1 +
>  arch/loongarch/include/asm/Kbuild             |   1 +
>  arch/loongarch/include/asm/mmzone.h           |  16 -
>  arch/loongarch/include/asm/topology.h         |   1 +
>  arch/loongarch/kernel/numa.c                  |  21 -
>  arch/mips/include/asm/mach-ip27/mmzone.h      |   1 -
>  .../mips/include/asm/mach-loongson64/mmzone.h |   4 -
>  arch/mips/loongson64/numa.c                   |  20 +-
>  arch/mips/sgi-ip27/ip27-memory.c              |   2 +-
>  arch/powerpc/include/asm/mmzone.h             |   6 -
>  arch/powerpc/mm/numa.c                        |  26 +-
>  arch/riscv/include/asm/Kbuild                 |   1 +
>  arch/riscv/include/asm/mmzone.h               |  13 -
>  arch/riscv/include/asm/topology.h             |   4 +
>  arch/s390/include/asm/Kbuild                  |   1 +
>  arch/s390/include/asm/mmzone.h                |  17 -
>  arch/s390/kernel/numa.c                       |   3 -
>  arch/sh/include/asm/mmzone.h                  |   3 -
>  arch/sh/mm/init.c                             |   7 +-
>  arch/sh/mm/numa.c                             |   3 -
>  arch/sparc/include/asm/mmzone.h               |   4 -
>  arch/sparc/mm/init_64.c                       |  11 +-
>  arch/x86/Kconfig                              |   9 +-
>  arch/x86/include/asm/Kbuild                   |   1 +
>  arch/x86/include/asm/mmzone.h                 |   6 -
>  arch/x86/include/asm/mmzone_32.h              |  17 -
>  arch/x86/include/asm/mmzone_64.h              |  18 -
>  arch/x86/include/asm/numa.h                   |  24 +-
>  arch/x86/include/asm/sparsemem.h              |   9 -
>  arch/x86/mm/Makefile                          |   1 -
>  arch/x86/mm/amdtopology.c                     |   1 +
>  arch/x86/mm/numa.c                            | 618 +-----------------
>  arch/x86/mm/numa_internal.h                   |  24 -
>  drivers/acpi/numa/srat.c                      |   1 +
>  drivers/base/Kconfig                          |   1 +
>  drivers/base/arch_numa.c                      | 223 ++-----
>  drivers/cxl/Kconfig                           |   2 +-
>  drivers/dax/Kconfig                           |   2 +-
>  drivers/of/of_numa.c                          |   1 +
>  include/asm-generic/mmzone.h                  |   5 +
>  include/asm-generic/numa.h                    |   6 +-
>  include/linux/numa.h                          |   5 +
>  include/linux/numa_memblks.h                  |  58 ++
>  kernel/Makefile                               |   1 -
>  kernel/numa.c                                 |  26 -
>  mm/Kconfig                                    |  11 +
>  mm/Makefile                                   |   3 +
>  mm/numa.c                                     |  57 ++
>  {arch/x86/mm => mm}/numa_emulation.c          |  42 +-
>  mm/numa_memblks.c                             | 565 ++++++++++++++++
>  52 files changed, 847 insertions(+), 1070 deletions(-)
>  delete mode 100644 arch/arm64/include/asm/mmzone.h
>  delete mode 100644 arch/loongarch/include/asm/mmzone.h
>  delete mode 100644 arch/riscv/include/asm/mmzone.h
>  delete mode 100644 arch/s390/include/asm/mmzone.h
>  delete mode 100644 arch/x86/include/asm/mmzone.h
>  delete mode 100644 arch/x86/include/asm/mmzone_32.h
>  delete mode 100644 arch/x86/include/asm/mmzone_64.h
>  create mode 100644 include/asm-generic/mmzone.h
>  create mode 100644 include/linux/numa_memblks.h
>  delete mode 100644 kernel/numa.c
>  create mode 100644 mm/numa.c
>  rename {arch/x86/mm => mm}/numa_emulation.c (94%)
>  create mode 100644 mm/numa_memblks.c
> 
> 
> base-commit: 22a40d14b572deb80c0648557f4bd502d7e83826


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
