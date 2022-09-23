Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B77CC04A95
	for <linux-riscv@archiver.kernel.org>; Fri, 23 Sep 2022 21:46:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=n2gwnzYLBLq9nQqhUuED0jyiMdgJtvEyaKthPGZc1g0=; b=vmsY/PMnh7DrSs
	u0ZpYOn0LvnNMAB5WXOjHQr2ZJh1lCnTQ3yhZiqt5u0Dl7iJLh9ptJLbaNDmLcIKf3oXQ6i27grVH
	2OpFzEjrzCtCsiJJt5Q+x6VqVr2j8CM8bSeLZzhPCYy7GvXUAkIwhY4pxtFZdDJ9T/oyY+OgPDHTC
	D1zFjBOXO7NnRJjWPgOYyNAlZpia+GcvNQ+oRqXol45lhhJwI0ZExUPMk6pllRmDEkNuo43UaqlAQ
	guAar5LRBJ8IcnmYkQU4U5v8uoDXJFsoZXb38CYxxuW9KWrLi2jpqNPDTBG6Dc+5BUgKXfEdW8tpp
	OaqAGVM3Ncy5UJtp7FlQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1obqUc-005mQT-4j; Fri, 23 Sep 2022 21:45:54 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1obqUX-005mPy-L7
	for linux-riscv@lists.infradead.org; Fri, 23 Sep 2022 21:45:51 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 1FFF2B80E0B;
	Fri, 23 Sep 2022 21:45:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C75A8C433D6;
	Fri, 23 Sep 2022 21:45:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1663969546;
	bh=QPQtMFO6u2PmeaIikpsa/EjuxmbTB4kLNdGuaZmww34=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=SIq5/7SvMl31k0Ey8jEXzKmzLQjpmUgoDsgglrRObgHhid+N7TERc0fTfQjzJXLa3
	 64lL78hQJSBg1fwcJIQ3ScRHNaBpKjNreg4WEPVIWK10rvc1OD5jjziwLhx2AQ9Qrz
	 zonMZeJeUKIZm+8ww+0d6tJ3mZ1a2vg0HZsRhwAhdZ6yiJdcnDDmY8JwviSTRaukUJ
	 Uq/ThuHEmy4ZRFfDUZc1+EQZlgGRHu7lqlGUUT/kjcwkK0t6L67dcGuJUpw4yVTY3E
	 XEn8HZv7bu7Z5bTyHaTumL9y3Z2OOGG38+hKcM78Zm8aXpe+JYzssPgTN8I8RDi6Fy
	 RgYmw5RfPrRwg==
Date: Fri, 23 Sep 2022 22:45:40 +0100
From: Conor Dooley <conor@kernel.org>
To: Jinyu Tang <tjytimi@163.com>
Cc: paul.walmsley@sifive.com, ajones@ventanamicro.com, palmer@dabbelt.com,
	aou@eecs.berkeley.edu, conor.dooley@microchip.com,
	anup@brainfault.org, alexandre.ghiti@canonical.com,
	guoren@kernel.org, akpm@linux-foundation.org, heiko@sntech.de,
	tongtiangen@huawei.com, sunnanyong@huawei.com,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	falcon@tinylab.org
Subject: Re: [PATCH v2] riscv: support update_mmu_tlb() for riscv
Message-ID: <Yy4pBHm1fZ3oM/m5@spud>
References: <20220918055940.24726-1-tjytimi@163.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220918055940.24726-1-tjytimi@163.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220923_144549_874295_FC91F806 
X-CRM114-Status: GOOD (  20.94  )
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

Hey Jinyu,
Firstly, the "for riscv" in the title is redundant and can be dropped.

On Sun, Sep 18, 2022 at 01:59:40PM +0800, Jinyu Tang wrote:
> Add macro definition to support updata_mmu_tlb() for riscv,
                                       ^
				s/updata/update/

> this function is from commit:7df676974359 ("mm/memory.c:Update
> local TLB if PTE entry exists").

So, and this just may be may lack of knowledge showing, but I don't
really understand _why_ we need this change. Your commit message should
explain why you are making the change rather than just repeating what
you are doing since that is obvious from the diff.

Only MIPS seems to have this define, so your commit message needs to
explain what it is about RISC-V that means we need it when all bar one
arch does not.

Thanks,
Conor.

> 
> Signed-off-by: Jinyu Tang <tjytimi@163.com>
> Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
> ---
> v1 -> v2: 
> 
> Change the format with the help from Andrew Jones and Conor Dooley.
> 
>  arch/riscv/include/asm/pgtable.h | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/arch/riscv/include/asm/pgtable.h b/arch/riscv/include/asm/pgtable.h
> index 7ec936910a96..c61ae83aadee 100644
> --- a/arch/riscv/include/asm/pgtable.h
> +++ b/arch/riscv/include/asm/pgtable.h
> @@ -418,6 +418,9 @@ static inline void update_mmu_cache(struct vm_area_struct *vma,
>  	local_flush_tlb_page(address);
>  }
>  
> +#define __HAVE_ARCH_UPDATE_MMU_TLB
> +#define update_mmu_tlb update_mmu_cache
> +
>  static inline void update_mmu_cache_pmd(struct vm_area_struct *vma,
>  		unsigned long address, pmd_t *pmdp)
>  {
> -- 
> 2.30.2
> 
> 
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
