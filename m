Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71EBBEB64DB
	for <linux-riscv@archiver.kernel.org>; Wed, 14 Jun 2023 15:21:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3IUqlk9kDWARB3yrQR/Ou1NG1qVeJA/085D8MzyS5Zs=; b=RG9ObfERhljZ7i
	zAvXLSh5xplCBvORza4ykLqpnN6NUbji5kaTzEVtMZrpdgQJXFRazh2MEV1bmvM3M0myv89oAAXX7
	2f2h/3McVpnPIcp9aZAx7K+V8REiNayrZnVR6brJ4BoicC9fIwCj0Vm+qkHA/ny5xQKi33lNR4juj
	OeluMKpvMOEJqxYyO3Z4IteXXmfjx2LVlxZY+GqW8mr6p5tnQURVqdRTbBVNlLkBG5ASAkPZpFeNT
	bQ/alE4HPuu7usNfYqHFCSwGfRcDXc1zBgxqRtvlA+djbaQ2fbdpB9xWGVLAfyWaRCk9PsqX0sllx
	06Py8MpRaqIWtMl3hvVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q9SJU-00C3aU-2W;
	Wed, 14 Jun 2023 15:21:36 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q9SJQ-00C3YR-35;
	Wed, 14 Jun 2023 15:21:34 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 66B1D63A8D;
	Wed, 14 Jun 2023 15:21:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7A344C433C8;
	Wed, 14 Jun 2023 15:21:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1686756091;
	bh=il/HQfNL/uVoI8Ww57mtbKzYiPMAc1DKtiQkMGOtIfk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=EVqVK3+cHzzM3I6jLTXFddZxbFNGPyRkmUP04L3rXdQHtkhROZjeS4xs716iEeHdI
	 3NTDNl7d+xttJku6jL5Vp2AtMEzW22vWDWbwjll2V8vVRNY23vhOyS7i+LK0LxbXdw
	 FLa/cSLNMXXmsxuzrxQhCn+drunkS9V+mQxgMLtHYqy48lWC0KA1CxMftayd+ywuMN
	 LLMWJKOOtCwfpjAWz8cODynASF/ygJUUKBwEscMZxGpjyvRIOPidi0xPpAYKGa2gya
	 /E5L+RC/PloG4xdfJOfUmDMA7VZBXAl85QlMPjo/CmXi01rcsEFX+MuFeeezAt7qfD
	 tIubuOBxrNFBw==
Date: Wed, 14 Jun 2023 18:20:53 +0300
From: Mike Rapoport <rppt@kernel.org>
To: "Vishal Moola (Oracle)" <vishal.moola@gmail.com>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Matthew Wilcox <willy@infradead.org>, linux-mm@kvack.org,
	linux-arch@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-csky@vger.kernel.org, linux-hexagon@vger.kernel.org,
	loongarch@lists.linux.dev, linux-m68k@lists.linux-m68k.org,
	linux-mips@vger.kernel.org, linux-openrisc@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org, linux-sh@vger.kernel.org,
	sparclinux@vger.kernel.org, linux-um@lists.infradead.org,
	xen-devel@lists.xenproject.org, kvm@vger.kernel.org,
	Hugh Dickins <hughd@google.com>,
	"David S. Miller" <davem@davemloft.net>
Subject: Re: [PATCH v4 32/34] sparc: Convert pgtable_pte_page_{ctor, dtor}()
 to ptdesc equivalents
Message-ID: <20230614152053.GE52412@kernel.org>
References: <20230612210423.18611-1-vishal.moola@gmail.com>
 <20230612210423.18611-33-vishal.moola@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230612210423.18611-33-vishal.moola@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230614_082133_032296_7C2E1528 
X-CRM114-Status: GOOD (  15.82  )
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

On Mon, Jun 12, 2023 at 02:04:21PM -0700, Vishal Moola (Oracle) wrote:
> Part of the conversions to replace pgtable pte constructor/destructors with
> ptdesc equivalents.
> 
> Signed-off-by: Vishal Moola (Oracle) <vishal.moola@gmail.com>

Acked-by: Mike Rapoport (IBM) <rppt@kernel.org>

> ---
>  arch/sparc/mm/srmmu.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/sparc/mm/srmmu.c b/arch/sparc/mm/srmmu.c
> index 13f027afc875..8393faa3e596 100644
> --- a/arch/sparc/mm/srmmu.c
> +++ b/arch/sparc/mm/srmmu.c
> @@ -355,7 +355,8 @@ pgtable_t pte_alloc_one(struct mm_struct *mm)
>  		return NULL;
>  	page = pfn_to_page(__nocache_pa((unsigned long)ptep) >> PAGE_SHIFT);
>  	spin_lock(&mm->page_table_lock);
> -	if (page_ref_inc_return(page) == 2 && !pgtable_pte_page_ctor(page)) {
> +	if (page_ref_inc_return(page) == 2 &&
> +			!pagetable_pte_ctor(page_ptdesc(page))) {
>  		page_ref_dec(page);
>  		ptep = NULL;
>  	}
> @@ -371,7 +372,7 @@ void pte_free(struct mm_struct *mm, pgtable_t ptep)
>  	page = pfn_to_page(__nocache_pa((unsigned long)ptep) >> PAGE_SHIFT);
>  	spin_lock(&mm->page_table_lock);
>  	if (page_ref_dec_return(page) == 1)
> -		pgtable_pte_page_dtor(page);
> +		pagetable_pte_dtor(page_ptdesc(page));
>  	spin_unlock(&mm->page_table_lock);
>  
>  	srmmu_free_nocache(ptep, SRMMU_PTE_TABLE_SIZE);
> -- 
> 2.40.1
> 
> 

-- 
Sincerely yours,
Mike.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
