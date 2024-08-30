Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26D42CA0ECC
	for <linux-riscv@archiver.kernel.org>; Fri, 30 Aug 2024 01:34:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OvG956DEFSLJLWLSovATUTw+IM2c6/C/JIN52r8fQCg=; b=IQyeSdFhNGTEfk
	DZZgguuJEcJxDLngSGhWJjtBaTP+HRWjARweBQ+GLA1PbkjTJBMcn9jpUls0J3yb2Y6G4YLCHt8cx
	i+F9xDd8OM13fBgaGKeqaG8RF4Crz6MZYPhQ9Q9DgErZG9LG9dywJuhOoHKPEZGW038jf6IdFI61N
	Zacnuig4HVJP50IR0Khehr/MTPJl4q9ix5s9BE70cCmewKYxYTS7Aq1ktAzKxVRrpOA6UfaOkl+6U
	FASQT8h5ieeiXqTcsfrljHpCU1stbtq19VNG31oozxOedb82hV3CWdzSYkZJpMjKaE4WnHuePhp4W
	KSROVTWA3sfxuFVQtV9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sjqWt-00000004JAU-1NVD;
	Fri, 30 Aug 2024 01:34:23 +0000
Received: from szxga07-in.huawei.com ([45.249.212.35])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sjqWo-00000004J9l-2Ejw
	for linux-riscv@lists.infradead.org;
	Fri, 30 Aug 2024 01:34:21 +0000
Received: from mail.maildlp.com (unknown [172.19.162.112])
	by szxga07-in.huawei.com (SkyGuard) with ESMTP id 4Ww0zm0r92z1S9T8;
	Fri, 30 Aug 2024 09:33:56 +0800 (CST)
Received: from kwepemh500013.china.huawei.com (unknown [7.202.181.146])
	by mail.maildlp.com (Postfix) with ESMTPS id 13F851401E9;
	Fri, 30 Aug 2024 09:34:10 +0800 (CST)
Received: from [10.67.109.254] (10.67.109.254) by
 kwepemh500013.china.huawei.com (7.202.181.146) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Fri, 30 Aug 2024 09:34:09 +0800
Message-ID: <3386ad7d-1834-3a81-d9b7-2aab2e8b48d0@huawei.com>
Date: Fri, 30 Aug 2024 09:34:08 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
Subject: Re: [RESEND PATCH V4 3/3] riscv: mm: Add uffd write-protect support
Content-Language: en-US
To: Chunyan Zhang <zhangchunyan@iscas.ac.cn>, Paul Walmsley
	<paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
	<aou@eecs.berkeley.edu>, Andrew Morton <akpm@linux-foundation.org>, Alexandre
 Ghiti <alex@ghiti.fr>
CC: <linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>, Chunyan
 Zhang <zhang.lyra@gmail.com>
References: <20240830011101.3189522-1-zhangchunyan@iscas.ac.cn>
 <20240830011101.3189522-4-zhangchunyan@iscas.ac.cn>
From: Jinjie Ruan <ruanjinjie@huawei.com>
In-Reply-To: <20240830011101.3189522-4-zhangchunyan@iscas.ac.cn>
X-Originating-IP: [10.67.109.254]
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 kwepemh500013.china.huawei.com (7.202.181.146)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240829_183419_137044_D88F9E7F 
X-CRM114-Status: GOOD (  20.53  )
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



On 2024/8/30 9:11, Chunyan Zhang wrote:
> Reuse PTE bit(9) to do uffd-wp tracking and make it mutually exclusive
> with soft-dirty and DEVMAP which all use this PTE bit.
> 
> Additionally for tracking the uffd-wp state as a PTE swap bit,
> we use swap entry pte bit(4) which is also used by swap
> soft-dirty tracking.
> 
> Signed-off-by: Chunyan Zhang <zhangchunyan@iscas.ac.cn>

Hi, I have submitted a similar patch below before rebased on commit
216e04bf1e4d ("riscv: mm: Add support for ZONE_DEVICE")
has been removed:

https://lore.kernel.org/all/20240730095325.3540198-1-ruanjinjie@huawei.com/

> ---
>  arch/riscv/Kconfig                    |  7 +++
>  arch/riscv/include/asm/pgtable-bits.h | 13 ++++++
>  arch/riscv/include/asm/pgtable.h      | 66 ++++++++++++++++++++++++++-
>  3 files changed, 85 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> index f1460fc01cd4..aa595a5ed4b8 100644
> --- a/arch/riscv/Kconfig
> +++ b/arch/riscv/Kconfig
> @@ -971,6 +971,13 @@ config RISCV_HAS_SOFT_DIRTY
>  	help
>  	  The PTE bit(9) is used for soft-dirty tracking.
>  
> +config RISCV_HAS_USERFAULTFD_WP
> +	bool "userfaultfd write protection"
> +	select HAVE_ARCH_USERFAULTFD_WP
> +	depends on USERFAULTFD
> +	help
> +	  The PTE bit(9) is used for userfaultfd write-protected
> +	  tracking.
>  endchoice
>  
>  endmenu # "Kernel features"
> diff --git a/arch/riscv/include/asm/pgtable-bits.h b/arch/riscv/include/asm/pgtable-bits.h
> index c6d51fe9fc6f..7de16141c049 100644
> --- a/arch/riscv/include/asm/pgtable-bits.h
> +++ b/arch/riscv/include/asm/pgtable-bits.h
> @@ -38,6 +38,19 @@
>  #define _PAGE_SWP_SOFT_DIRTY	0
>  #endif /* CONFIG_MEM_SOFT_DIRTY */
>  
> +#ifdef CONFIG_HAVE_ARCH_USERFAULTFD_WP
> +/*
> + * CONFIG_HAVE_ARCH_USERFAULTFD_WP is mutually exclusive with
> + * HAVE_ARCH_SOFT_DIRTY so we can use the same bit for uffd-wp
> + * and soft-dirty tracking.
> + */
> +#define _PAGE_UFFD_WP		(1 << 9) /* RSW: 0x2 for uffd-wp tracking */
> +#define _PAGE_SWP_UFFD_WP	_PAGE_USER
> +#else
> +#define _PAGE_UFFD_WP		0
> +#define _PAGE_SWP_UFFD_WP	0
> +#endif
> +
>  #define _PAGE_TABLE     _PAGE_PRESENT
>  
>  /*
> diff --git a/arch/riscv/include/asm/pgtable.h b/arch/riscv/include/asm/pgtable.h
> index d41507919ef2..6ce4c9ba862a 100644
> --- a/arch/riscv/include/asm/pgtable.h
> +++ b/arch/riscv/include/asm/pgtable.h
> @@ -417,6 +417,38 @@ static inline pte_t pte_wrprotect(pte_t pte)
>  	return __pte(pte_val(pte) & ~(_PAGE_WRITE));
>  }
>  
> +#ifdef CONFIG_HAVE_ARCH_USERFAULTFD_WP
> +static inline int pte_uffd_wp(pte_t pte)
> +{
> +	return pte_val(pte) & _PAGE_UFFD_WP;
> +}
> +
> +static inline pte_t pte_mkuffd_wp(pte_t pte)
> +{
> +	return pte_wrprotect(__pte(pte_val(pte) | _PAGE_UFFD_WP));
> +}
> +
> +static inline pte_t pte_clear_uffd_wp(pte_t pte)
> +{
> +	return __pte(pte_val(pte) & ~(_PAGE_UFFD_WP));
> +}
> +
> +static inline int pte_swp_uffd_wp(pte_t pte)
> +{
> +	return pte_val(pte) & _PAGE_SWP_UFFD_WP;
> +}
> +
> +static inline pte_t pte_swp_mkuffd_wp(pte_t pte)
> +{
> +	return pte_wrprotect(__pte(pte_val(pte) | _PAGE_SWP_UFFD_WP));
> +}
> +
> +static inline pte_t pte_swp_clear_uffd_wp(pte_t pte)
> +{
> +	return __pte(pte_val(pte) & ~(_PAGE_SWP_UFFD_WP));
> +}
> +#endif /* CONFIG_HAVE_ARCH_USERFAULTFD_WP */
> +
>  /* static inline pte_t pte_mkread(pte_t pte) */
>  
>  static inline pte_t pte_mkwrite_novma(pte_t pte)
> @@ -783,6 +815,38 @@ static inline pmd_t pmd_mkdevmap(pmd_t pmd)
>  	return pte_pmd(pte_mkdevmap(pmd_pte(pmd)));
>  }
>  
> +#ifdef CONFIG_HAVE_ARCH_USERFAULTFD_WP
> +static inline int pmd_uffd_wp(pmd_t pmd)
> +{
> +	return pte_uffd_wp(pmd_pte(pmd));
> +}
> +
> +static inline pmd_t pmd_mkuffd_wp(pmd_t pmd)
> +{
> +	return pte_pmd(pte_mkuffd_wp(pmd_pte(pmd)));
> +}
> +
> +static inline pmd_t pmd_clear_uffd_wp(pmd_t pmd)
> +{
> +	return pte_pmd(pte_clear_uffd_wp(pmd_pte(pmd)));
> +}
> +
> +static inline int pmd_swp_uffd_wp(pmd_t pmd)
> +{
> +	return pte_swp_uffd_wp(pmd_pte(pmd));
> +}
> +
> +static inline pmd_t pmd_swp_mkuffd_wp(pmd_t pmd)
> +{
> +	return pte_pmd(pte_swp_mkuffd_wp(pmd_pte(pmd)));
> +}
> +
> +static inline pmd_t pmd_swp_clear_uffd_wp(pmd_t pmd)
> +{
> +	return pte_pmd(pte_swp_clear_uffd_wp(pmd_pte(pmd)));
> +}
> +#endif /* CONFIG_HAVE_ARCH_USERFAULTFD_WP */
> +
>  #ifdef CONFIG_HAVE_ARCH_SOFT_DIRTY
>  static inline int pmd_soft_dirty(pmd_t pmd)
>  {
> @@ -907,7 +971,7 @@ extern pmd_t pmdp_collapse_flush(struct vm_area_struct *vma,
>   * Format of swap PTE:
>   *	bit            0:	_PAGE_PRESENT (zero)
>   *	bit       1 to 3:       _PAGE_LEAF (zero)
> - *	bit	       4:	_PAGE_SWP_SOFT_DIRTY
> + *	bit	       4:	_PAGE_SWP_SOFT_DIRTY or _PAGE_SWP_UFFD_WP
>   *	bit            5:	_PAGE_PROT_NONE (zero)
>   *	bit            6:	exclusive marker
>   *	bits      7 to 11:	swap type

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
