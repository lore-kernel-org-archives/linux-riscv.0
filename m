Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 587CCC43334
	for <linux-riscv@archiver.kernel.org>; Mon, 27 Jun 2022 17:15:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ekLGu6YKPSiqf624kSpPGGiwfroMTHd99E+jLlKRRz0=; b=e1Kzrc19iUwjCM
	YcgZ6AJad9hSpknFqnG7OaaN5KRR0t8/LGKpWUCHsItNdvitGdCztGIqXI726xxRhm6W08eA5krwA
	2+B4iuLkTCLlUrYsWnss6nhzc0mdcNaKgcY84lAk0PpDiZnn0OChCWRgtG5mLjqP0/arVsXf5bz7M
	AWgAR9pLvpNmwXILoXEh7zcS7NhF/a4J7gsU8htjYZtCyupFTMCoIY0iXtuxoHusZoH5tLnexk1ol
	1ihiDgWitaoV2z/BQGXChjqgw+garAHdw5IKhk22wsHgQbzLC+pYZ45rLFkA2jC+zx3E/oxQnP7fD
	hk8WaW8Gm3Bk6LSBOaZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o5sKp-00276a-MY; Mon, 27 Jun 2022 17:15:39 +0000
Received: from mailrelay4-1.pub.mailoutpod1-cph3.one.com ([46.30.210.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o5sKL-0026lD-4w
	for linux-riscv@lists.infradead.org; Mon, 27 Jun 2022 17:15:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ravnborg.org; s=rsa1;
	h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
	 from:date:from;
	bh=7lcoTIguoCU25UtATqw0zpenNexDp4klBKBcas47lUI=;
	b=DnMKzuyWChdqVj0eyu9qk+S12hDc5E1lpoUVu+RwnrA66JDBO9VVaJjjgy7iZh0CwjBX0Tb2UW9eA
	 IDL3blt0HWe+7nCJ6LBbtgtWCdYTIJf7JxMi5tEKyk04dMJhxQKgJhN19n7gZmip7ExOCH60av6Zc+
	 fpOnPKVrkcE6dB7IpmBBA5V/48B5nOCXs0dWxrIHUJoi6B5gDTxnps7C32yW7RQiRmwMZofOskZtJ1
	 g5yggk+VyjJho8A1QsSz/r/K9taqv0SWrqNZr//W7DugrtnSjHFKtDOi/ahsacud1GZwml0SRslSij
	 +WBGlPijIt3aAxUmrpMXX3P747L7FOQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed;
	d=ravnborg.org; s=ed1;
	h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
	 from:date:from;
	bh=7lcoTIguoCU25UtATqw0zpenNexDp4klBKBcas47lUI=;
	b=0c4FfNqt1mwTyFHOd20j3eJXx+yZAcz5xOVj+2VVBhkRNfl+lcYaMnmV/txPP7q97nUwiERp2Rz/D
	 LTtF3EvDA==
X-HalOne-Cookie: be347a0a6f76c63821867329f3b288b192d004df
X-HalOne-ID: ab689703-f63c-11ec-8236-d0431ea8bb10
Received: from mailproxy2.cst.dirpod3-cph3.one.com (80-162-45-141-cable.dk.customer.tdc.net [80.162.45.141])
	by mailrelay4.pub.mailoutpod1-cph3.one.com (Halon) with ESMTPSA
	id ab689703-f63c-11ec-8236-d0431ea8bb10;
	Mon, 27 Jun 2022 17:14:58 +0000 (UTC)
Date: Mon, 27 Jun 2022 19:14:56 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Anshuman Khandual <anshuman.khandual@arm.com>
Cc: linux-mm@kvack.org, hch@infradead.org, christophe.leroy@csgroup.eu,
	Andrew Morton <akpm@linux-foundation.org>,
	linuxppc-dev@lists.ozlabs.org, sparclinux@vger.kernel.org,
	x86@kernel.org, openrisc@lists.librecores.org,
	linux-xtensa@linux-xtensa.org, linux-csky@vger.kernel.org,
	linux-hexagon@vger.kernel.org, linux-parisc@vger.kernel.org,
	linux-alpha@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org, linux-ia64@vger.kernel.org,
	linux-mips@vger.kernel.org, linux-m68k@lists.linux-m68k.org,
	linux-snps-arc@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-um@lists.infradead.org,
	linux-sh@vger.kernel.org, linux-kernel@vger.kernel.org,
	"David S. Miller" <davem@davemloft.net>
Subject: Re: [PATCH V5 04/26] sparc/mm: Move protection_map[] inside the
 platform
Message-ID: <YrnlkLbyYSbI0EQw@ravnborg.org>
References: <20220627045833.1590055-1-anshuman.khandual@arm.com>
 <20220627045833.1590055-5-anshuman.khandual@arm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220627045833.1590055-5-anshuman.khandual@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220627_101509_543494_5B3D90B5 
X-CRM114-Status: GOOD (  19.47  )
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

Hi Anshuman,

On Mon, Jun 27, 2022 at 10:28:11AM +0530, Anshuman Khandual wrote:
> This moves protection_map[] inside the platform and while here, also enable
> ARCH_HAS_VM_GET_PAGE_PROT on 32 bit platforms via DECLARE_VM_GET_PAGE_PROT.
> 
> Cc: "David S. Miller" <davem@davemloft.net>
> Cc: sparclinux@vger.kernel.org
> Cc: linux-kernel@vger.kernel.org
> Signed-off-by: Anshuman Khandual <anshuman.khandual@arm.com>
> ---
>  arch/sparc/Kconfig                  |  2 +-
>  arch/sparc/include/asm/pgtable_32.h | 19 -------------------
>  arch/sparc/include/asm/pgtable_64.h | 19 -------------------
>  arch/sparc/mm/init_32.c             | 20 ++++++++++++++++++++
>  arch/sparc/mm/init_64.c             |  3 +++
>  5 files changed, 24 insertions(+), 39 deletions(-)
> 
> diff --git a/arch/sparc/Kconfig b/arch/sparc/Kconfig
> index ba449c47effd..09f868613a4d 100644
> --- a/arch/sparc/Kconfig
> +++ b/arch/sparc/Kconfig
> @@ -13,6 +13,7 @@ config 64BIT
>  config SPARC
>  	bool
>  	default y
> +	select ARCH_HAS_VM_GET_PAGE_PROT
>  	select ARCH_MIGHT_HAVE_PC_PARPORT if SPARC64 && PCI
>  	select ARCH_MIGHT_HAVE_PC_SERIO
>  	select DMA_OPS
> @@ -84,7 +85,6 @@ config SPARC64
>  	select PERF_USE_VMALLOC
>  	select ARCH_HAVE_NMI_SAFE_CMPXCHG
>  	select HAVE_C_RECORDMCOUNT
> -	select ARCH_HAS_VM_GET_PAGE_PROT
>  	select HAVE_ARCH_AUDITSYSCALL
>  	select ARCH_SUPPORTS_ATOMIC_RMW
>  	select ARCH_SUPPORTS_DEBUG_PAGEALLOC
> diff --git a/arch/sparc/include/asm/pgtable_32.h b/arch/sparc/include/asm/pgtable_32.h
> index 4866625da314..8ff549004fac 100644
> --- a/arch/sparc/include/asm/pgtable_32.h
> +++ b/arch/sparc/include/asm/pgtable_32.h
> @@ -64,25 +64,6 @@ void paging_init(void);
>  
>  extern unsigned long ptr_in_current_pgd;
>  
> -/*         xwr */
> -#define __P000  PAGE_NONE
> -#define __P001  PAGE_READONLY
> -#define __P010  PAGE_COPY
> -#define __P011  PAGE_COPY
> -#define __P100  PAGE_READONLY
> -#define __P101  PAGE_READONLY
> -#define __P110  PAGE_COPY
> -#define __P111  PAGE_COPY
> -
> -#define __S000	PAGE_NONE
> -#define __S001	PAGE_READONLY
> -#define __S010	PAGE_SHARED
> -#define __S011	PAGE_SHARED
> -#define __S100	PAGE_READONLY
> -#define __S101	PAGE_READONLY
> -#define __S110	PAGE_SHARED
> -#define __S111	PAGE_SHARED
> -
>  /* First physical page can be anywhere, the following is needed so that
>   * va-->pa and vice versa conversions work properly without performance
>   * hit for all __pa()/__va() operations.
> diff --git a/arch/sparc/include/asm/pgtable_64.h b/arch/sparc/include/asm/pgtable_64.h
> index 4679e45c8348..a779418ceba9 100644
> --- a/arch/sparc/include/asm/pgtable_64.h
> +++ b/arch/sparc/include/asm/pgtable_64.h
> @@ -187,25 +187,6 @@ bool kern_addr_valid(unsigned long addr);
>  #define _PAGE_SZHUGE_4U	_PAGE_SZ4MB_4U
>  #define _PAGE_SZHUGE_4V	_PAGE_SZ4MB_4V
>  
> -/* These are actually filled in at boot time by sun4{u,v}_pgprot_init() */
> -#define __P000	__pgprot(0)
> -#define __P001	__pgprot(0)
> -#define __P010	__pgprot(0)
> -#define __P011	__pgprot(0)
> -#define __P100	__pgprot(0)
> -#define __P101	__pgprot(0)
> -#define __P110	__pgprot(0)
> -#define __P111	__pgprot(0)
> -
> -#define __S000	__pgprot(0)
> -#define __S001	__pgprot(0)
> -#define __S010	__pgprot(0)
> -#define __S011	__pgprot(0)
> -#define __S100	__pgprot(0)
> -#define __S101	__pgprot(0)
> -#define __S110	__pgprot(0)
> -#define __S111	__pgprot(0)
> -
>  #ifndef __ASSEMBLY__
>  
>  pte_t mk_pte_io(unsigned long, pgprot_t, int, unsigned long);
> diff --git a/arch/sparc/mm/init_32.c b/arch/sparc/mm/init_32.c
> index 1e9f577f084d..8693e4e28b86 100644
> --- a/arch/sparc/mm/init_32.c
> +++ b/arch/sparc/mm/init_32.c
> @@ -302,3 +302,23 @@ void sparc_flush_page_to_ram(struct page *page)
>  		__flush_page_to_ram(vaddr);
>  }
>  EXPORT_SYMBOL(sparc_flush_page_to_ram);
> +
> +static pgprot_t protection_map[16] __ro_after_init = {
This can be const - like done for powerpc and others.
sparc32 and sparc64 uses each their own - and I do not see sparc32 do
any modifications to protection_map.

With this change:
Reviewed-by: Sam Ravnborg <sam@ravnborg.org>

> +	[VM_NONE]					= PAGE_NONE,
> +	[VM_READ]					= PAGE_READONLY,
> +	[VM_WRITE]					= PAGE_COPY,
> +	[VM_WRITE | VM_READ]				= PAGE_COPY,
> +	[VM_EXEC]					= PAGE_READONLY,
> +	[VM_EXEC | VM_READ]				= PAGE_READONLY,
> +	[VM_EXEC | VM_WRITE]				= PAGE_COPY,
> +	[VM_EXEC | VM_WRITE | VM_READ]			= PAGE_COPY,
> +	[VM_SHARED]					= PAGE_NONE,
> +	[VM_SHARED | VM_READ]				= PAGE_READONLY,
> +	[VM_SHARED | VM_WRITE]				= PAGE_SHARED,
> +	[VM_SHARED | VM_WRITE | VM_READ]		= PAGE_SHARED,
> +	[VM_SHARED | VM_EXEC]				= PAGE_READONLY,
> +	[VM_SHARED | VM_EXEC | VM_READ]			= PAGE_READONLY,
> +	[VM_SHARED | VM_EXEC | VM_WRITE]		= PAGE_SHARED,
> +	[VM_SHARED | VM_EXEC | VM_WRITE | VM_READ]	= PAGE_SHARED
> +};
> +DECLARE_VM_GET_PAGE_PROT
> diff --git a/arch/sparc/mm/init_64.c b/arch/sparc/mm/init_64.c
> index f6174df2d5af..d6faee23c77d 100644
> --- a/arch/sparc/mm/init_64.c
> +++ b/arch/sparc/mm/init_64.c
> @@ -2634,6 +2634,9 @@ void vmemmap_free(unsigned long start, unsigned long end,
>  }
>  #endif /* CONFIG_SPARSEMEM_VMEMMAP */
>  
> +/* These are actually filled in at boot time by sun4{u,v}_pgprot_init() */
> +static pgprot_t protection_map[16] __ro_after_init;
> +
>  static void prot_init_common(unsigned long page_none,
>  			     unsigned long page_shared,
>  			     unsigned long page_copy,
> -- 
> 2.25.1

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
