Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 765F0C7EE32
	for <linux-riscv@archiver.kernel.org>; Wed, 25 Jun 2025 08:37:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Mime-Version:Message-Id:Subject:From:
	In-Reply-To:Cc:To:References:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=D4jiG6lD26aN1nW9p78QHW0xU6hk6w17WzmUYIUgus0=; b=1KnxfV960sP/PL
	AWkVSUHcrTZGZKi0EjGd5nA/AGFF7v0BadE3/weoBRNtw12Z8LF8BK2ZTugmQ2us+kxibRf70p0fF
	jRROX4G9xdo/0cISg3CYyNgeUxIsQVkILmWlmSWq8RaaHI0Gb9C88sKGllUgT7mpN0SmoW3kgjtST
	8HLyEZKlz//ANEKE/ubVs9AQJ1qiQy9dRiw9joNfvfzG6r5gJIE80MofGKuNc/5H1X0RpPn05wYOm
	/4w9jbiE40uObYSHXXqh5phsvEPCpjliCjp3sUWAsFQCXkeUWd0ZdFO5qH+QhFpDvNrIFex+mqYvS
	Tqhqhza3U+K1F0DoN0ng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uULcs-00000007ygP-3T15;
	Wed, 25 Jun 2025 08:37:02 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUKk3-00000007qg3-3i5I
	for linux-riscv@bombadil.infradead.org;
	Wed, 25 Jun 2025 07:40:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Mime-Version:Message-Id:Subject:From:
	In-Reply-To:Cc:To:References:Content-Type:Date:Content-Transfer-Encoding:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=23blSFdrb8/fbPehCaYr2JhyqpZwpwwsJFLPuTL/tn4=; b=AP1QZqq0DzdJhZNpRXacIVdmha
	/wwho8SPMvtdqMWQ55XM+8SqzFLirkt2WH0B4TfumgXKqI/FQy6zROlyT6YABALZ5osDWClT6Iz86
	PVtHrQ6JuWybSVQv+TGFxiBWPyu95g61MpvbsmlECgfwbl4wdetcLXhMl/xyPw9wgwK4NhfPK1v5F
	PDrCWlvRVUn34z1ycamaP7rTo2RGyA9HKDo6hxDnevpkJcEj8If6XeZB4MRygSonhpDXCJpMBD50r
	UFyfjJBMVuSx24q9HmXsClpRPT3RdUpmoxBdoBO6tDkfLuCgRffb4pcpMT9qrQE0ytPqYhFshSbdf
	4Nd6hskw==;
Received: from lf-2-37.ptr.blmpb.com ([101.36.218.37])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUKk0-00000005eWF-0kBb
	for linux-riscv@lists.infradead.org;
	Wed, 25 Jun 2025 07:40:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=s1; d=lanxincomputing-com.20200927.dkim.feishu.cn; t=1750837104;
  h=from:subject:mime-version:from:date:message-id:subject:to:cc:
 reply-to:content-type:mime-version:in-reply-to:message-id;
 bh=23blSFdrb8/fbPehCaYr2JhyqpZwpwwsJFLPuTL/tn4=;
 b=sfH6nujHYaqTL72nKGIfnaHW937PHrX47JAi69UyJ82IYY8rJ6RmddYmCjkcNk3qCHCOO/
 Ikec8dz2Sqa5Frl8p/300D8cyEG2IG+o+2GFUZ+658WTr/2+ruWLqgOZld8cWJ1X+Olbzd
 /mtG2xXw5ZXhiTD8ZGQMyihaCxN5WvqTj/FSQREhiOyYCynmJJYkiCCFpGhGm3HPqbWY3q
 pM7Jx4YQ71rDYBVg3BQGH2+lCQLZ5Tw4Cf1fa/VfJsxU2uegFUZNdE+rhDGMUs+sKc3D4P
 4XQbfYGH/YRmWv2KBgtdHNskPdliNSj/armfQ7BTnoYvgiVPed0P57GM9C4mag==
User-Agent: Mozilla Thunderbird
X-Lms-Return-Path: <lba+2685ba76e+28e308+lists.infradead.org+liujingqi@lanxincomputing.com>
Content-Language: en-US
Date: Wed, 25 Jun 2025 15:38:20 +0800
References: <20250618113532.471448-1-apatel@ventanamicro.com> <20250618113532.471448-6-apatel@ventanamicro.com>
Received: from [127.0.0.1] ([139.226.59.215]) by smtp.feishu.cn with ESMTPS; Wed, 25 Jun 2025 15:38:21 +0800
To: "Anup Patel" <apatel@ventanamicro.com>, 
	"Atish Patra" <atish.patra@linux.dev>
Cc: "Palmer Dabbelt" <palmer@dabbelt.com>, 
	"Paul Walmsley" <paul.walmsley@sifive.com>, 
	"Alexandre Ghiti" <alex@ghiti.fr>, 
	"Andrew Jones" <ajones@ventanamicro.com>, 
	"Anup Patel" <anup@brainfault.org>, <kvm@vger.kernel.org>, 
	<kvm-riscv@lists.infradead.org>, <linux-riscv@lists.infradead.org>, 
	<linux-kernel@vger.kernel.org>, "Atish Patra" <atishp@rivosinc.com>
In-Reply-To: <20250618113532.471448-6-apatel@ventanamicro.com>
X-Original-From: Nutty Liu <liujingqi@lanxincomputing.com>
From: "Nutty Liu" <liujingqi@lanxincomputing.com>
Subject: Re: [PATCH v3 05/12] RISC-V: KVM: Don't flush TLB when PTE is unchanged
Message-Id: <adb4afad-19a1-404d-bec0-d0dc535d98c4@lanxincomputing.com>
Mime-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250625_084020_584235_E5210350 
X-CRM114-Status: GOOD (  12.55  )
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

On 6/18/2025 7:35 PM, Anup Patel wrote:
> The gstage_set_pte() and gstage_op_pte() should flush TLB only when
> a leaf PTE changes so that unnecessary TLB flushes can be avoided.
>
> Reviewed-by: Atish Patra <atishp@rivosinc.com>
> Signed-off-by: Anup Patel <apatel@ventanamicro.com>
> ---
>   arch/riscv/kvm/mmu.c | 14 +++++++++-----
>   1 file changed, 9 insertions(+), 5 deletions(-)
>
> diff --git a/arch/riscv/kvm/mmu.c b/arch/riscv/kvm/mmu.c
> index 1087ea74567b..29f1bd853a66 100644
> --- a/arch/riscv/kvm/mmu.c
> +++ b/arch/riscv/kvm/mmu.c
> @@ -167,9 +167,11 @@ static int gstage_set_pte(struct kvm *kvm, u32 level,
>   		ptep = &next_ptep[gstage_pte_index(addr, current_level)];
>   	}
>   
> -	set_pte(ptep, *new_pte);
> -	if (gstage_pte_leaf(ptep))
> -		gstage_remote_tlb_flush(kvm, current_level, addr);
> +	if (pte_val(*ptep) != pte_val(*new_pte)) {
> +		set_pte(ptep, *new_pte);
> +		if (gstage_pte_leaf(ptep))
> +			gstage_remote_tlb_flush(kvm, current_level, addr);
> +	}
>   
>   	return 0;
>   }
> @@ -229,7 +231,7 @@ static void gstage_op_pte(struct kvm *kvm, gpa_t addr,
>   			  pte_t *ptep, u32 ptep_level, enum gstage_op op)
>   {
>   	int i, ret;
> -	pte_t *next_ptep;
> +	pte_t old_pte, *next_ptep;
>   	u32 next_ptep_level;
>   	unsigned long next_page_size, page_size;
>   
> @@ -258,11 +260,13 @@ static void gstage_op_pte(struct kvm *kvm, gpa_t addr,
>   		if (op == GSTAGE_OP_CLEAR)
>   			put_page(virt_to_page(next_ptep));
>   	} else {
> +		old_pte = *ptep;
>   		if (op == GSTAGE_OP_CLEAR)
>   			set_pte(ptep, __pte(0));
>   		else if (op == GSTAGE_OP_WP)
>   			set_pte(ptep, __pte(pte_val(ptep_get(ptep)) & ~_PAGE_WRITE));
> -		gstage_remote_tlb_flush(kvm, ptep_level, addr);
> +		if (pte_val(*ptep) != pte_val(old_pte))
> +			gstage_remote_tlb_flush(kvm, ptep_level, addr);
>   	}
>   }
>   

Reviewed-by: Nutty Liu <liujingqi@lanxincomputing.com>

Thanks,
Nutty

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
