Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64BB7C61DBD
	for <linux-riscv@archiver.kernel.org>; Thu, 27 Aug 2026 02:49:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nLBZNUar7cZdre/HQV3jRkS0ggmkPK7D719JSM0rtzM=; b=zJzAz5yd5bRafy
	1Dvi+XQTO1r3FfD+KeFBJItDZBpr4zsFPXbwofmfCqd7XukIWGnWEvBwB7xL4RUlaN3gtTJT4YvLG
	kE9o73T3DrR//01bc0G0MXXoMwbp0uu2A/pg+vvgGQDcq17EYsSr8l85jqPLEKAitYxX+8OeJv/xy
	tBAghrqCo2BNySMwWLSjOYNrO4OvW/qc3D35m+IZIVBcRzM93JdGdx7E0D4pHuGOtVDdMDvevR3pY
	hT+u29u1zX8ik0186HM9UkLukeC+dttWqNlzs+sckGS7MOmIWLTccT5kxEnwTnK7HJX2F5eR9Rcyv
	IuQ355oae+TjBZ7w9R0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzQB3-00000003KHy-31c1;
	Thu, 27 Aug 2026 02:49:17 +0000
Received: from [38.23.173.23] (helo=localhost)
	by bombadil.infradead.org with esmtpsa (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzQB1-00000003KHf-19Y2;
	Thu, 27 Aug 2026 02:49:15 +0000
Date: Wed, 26 Aug 2026 22:49:12 -0400
From: "Liam R. Howlett" <liam@infradead.org>
To: "Mike Rapoport (Microsoft)" <rppt@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
	Catalin Marinas <catalin.marinas@arm.com>, Danilo Krummrich <dakr@kernel.org>, 
	David Hildenbrand <david@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Lorenzo Stoakes <ljs@kernel.org>, Michal Hocko <mhocko@suse.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <pjw@kernel.org>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Suren Baghdasaryan <surenb@google.com>, 
	Vlastimil Babka <vbabka@kernel.org>, Will Deacon <will@kernel.org>, driver-core@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH] drivers/base, mm: move arch_numa.c to mm/
Message-ID: <xzndraf66344jbze5gfst2ugz5plr4cqsgv7hiw4w2vefqekn6@fkaqeczif5cb>
References: <20260806-arch-numa-v1-1-968ec128121e@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260806-arch-numa-v1-1-968ec128121e@kernel.org>
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

On 26/08/06 09:58AM, Mike Rapoport (Microsoft) wrote:
> arch_numa.c implements boot time discovery and initialization of NUMA
> topology on architectures that select GENERIC_ARCH_NUMA (currently arm64
> and riscv).
> 
> Since this is step in the initialization of the memory management
> subsystem, it's logical to have arch_numa.c in mm/ alongside numa.c,
> numa_memblks.c and numa_emulation.c.
> 
> Move arch_numa.c to mm/ and add its F: entry to "MEMBLOCK AND MEMORY
> MANAGEMENT INITIALIZATION" in MAINTAINERS.
> 
> Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>

Acked-by: Liam R. Howlett (Oracle) <liam@infradead.org>

> ---
>  MAINTAINERS                      | 1 +
>  drivers/base/Kconfig             | 7 -------
>  drivers/base/Makefile            | 1 -
>  mm/Kconfig                       | 7 +++++++
>  mm/Makefile                      | 1 +
>  {drivers/base => mm}/arch_numa.c | 0
>  6 files changed, 9 insertions(+), 8 deletions(-)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 5114e6db7307..465b64f8e93c 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -16880,6 +16880,7 @@ T:	git git://git.kernel.org/pub/scm/linux/kernel/git/rppt/memblock.git fixes
>  F:	Documentation/core-api/boot-time-mm.rst
>  F:	include/linux/kho/abi/memblock.h
>  F:	include/linux/memblock.h
> +F:	mm/arch_numa.c
>  F:	mm/bootmem_info.c
>  F:	mm/memblock.c
>  F:	mm/memtest.c
> diff --git a/drivers/base/Kconfig b/drivers/base/Kconfig
> index f7d385cbd3ba..1d93bfc34490 100644
> --- a/drivers/base/Kconfig
> +++ b/drivers/base/Kconfig
> @@ -239,13 +239,6 @@ config GENERIC_ARCH_TOPOLOGY
>  	  appropriate scaling, sysfs interface for reading capacity values at
>  	  runtime.
>  
> -config GENERIC_ARCH_NUMA
> -	bool
> -	select NUMA_MEMBLKS
> -	help
> -	  Enable support for generic NUMA implementation. Currently, RISC-V
> -	  and ARM64 use it.
> -
>  config FW_DEVLINK_SYNC_STATE_TIMEOUT
>  	bool "sync_state() behavior defaults to timeout instead of strict"
>  	help
> diff --git a/drivers/base/Makefile b/drivers/base/Makefile
> index 8074a10183dc..435710f643a5 100644
> --- a/drivers/base/Makefile
> +++ b/drivers/base/Makefile
> @@ -25,7 +25,6 @@ obj-$(CONFIG_PINCTRL) += pinctrl.o
>  obj-$(CONFIG_DEV_COREDUMP) += devcoredump.o
>  obj-$(CONFIG_GENERIC_MSI_IRQ) += platform-msi.o
>  obj-$(CONFIG_GENERIC_ARCH_TOPOLOGY) += arch_topology.o
> -obj-$(CONFIG_GENERIC_ARCH_NUMA) += arch_numa.o
>  obj-$(CONFIG_ACPI) += physical_location.o
>  
>  obj-y			+= test/
> diff --git a/mm/Kconfig b/mm/Kconfig
> index 9e0ca4824905..410b8a0a92b9 100644
> --- a/mm/Kconfig
> +++ b/mm/Kconfig
> @@ -1469,6 +1469,13 @@ config NUMA_EMU
>  	  into virtual nodes when booted with "numa=fake=N", where N is the
>  	  number of nodes. This is only useful for debugging.
>  
> +config GENERIC_ARCH_NUMA
> +	bool
> +	select NUMA_MEMBLKS
> +	help
> +	  Enable support for generic NUMA implementation. Currently, RISC-V
> +	  and ARM64 use it.
> +
>  config ARCH_HAS_USER_SHADOW_STACK
>  	bool
>  	help
> diff --git a/mm/Makefile b/mm/Makefile
> index eff9f9e7e061..fd29be716fa8 100644
> --- a/mm/Makefile
> +++ b/mm/Makefile
> @@ -122,6 +122,7 @@ obj-$(CONFIG_CMA)	+= cma.o
>  obj-$(CONFIG_NUMA) += numa.o
>  obj-$(CONFIG_NUMA_MEMBLKS) += numa_memblks.o
>  obj-$(CONFIG_NUMA_EMU) += numa_emulation.o
> +obj-$(CONFIG_GENERIC_ARCH_NUMA) += arch_numa.o
>  obj-$(CONFIG_BALLOON) += balloon.o
>  obj-$(CONFIG_PAGE_EXTENSION) += page_ext.o
>  obj-$(CONFIG_PAGE_TABLE_CHECK) += page_table_check.o
> diff --git a/drivers/base/arch_numa.c b/mm/arch_numa.c
> similarity index 100%
> rename from drivers/base/arch_numa.c
> rename to mm/arch_numa.c
> 
> ---
> base-commit: 075b74841bd0065a3bda3440873c747938e69b68
> change-id: 20260806-arch-numa-444bb4806114
> 
> --
> Sincerely yours,
> Mike.
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
