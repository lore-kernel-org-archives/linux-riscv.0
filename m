Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA2F6C10F1A
	for <linux-riscv@archiver.kernel.org>; Tue,  7 May 2024 05:35:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kGoGf/ntVftJnbartE25tr7IcbsO9enIO60PqqNuea4=; b=Dwa1AOpGs6tbiE
	+cKtQbC23st7RVtrc+rrVMbrJO26O6pEzIunWO5vl+XEi79tO1Z9lVRDbQ9Z3ueckARDOF+jVUxXc
	zCs7nrg1btyAWGXOFobJUfs4Cgor0jvxy2pGBOXVEjDNHcSSmS0px+QnU8xD/6TnyIro8CZTLkYfl
	1hrzuZNXPUg04EgZ0eQS+m96WHcM3googFZeUggZcgWONc1hDIwv1pei5KAhH2Q2iyM/RIuU9MeiZ
	zFSbJQeZDJohgYhk8lNVjyyY2vO7qH6M0ldsXeoulVILaYkW8rssx+vai6R4oaRsUNA8CmrHGTBJG
	tFYpviAbKEYQ/uNJnQRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s4DU9-00000009i4Z-24ov;
	Tue, 07 May 2024 05:35:29 +0000
Received: from relay6-d.mail.gandi.net ([2001:4b98:dc4:8::226])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s4DU6-00000009i3h-07RZ
	for linux-riscv@lists.infradead.org;
	Tue, 07 May 2024 05:35:27 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 4BD24C0003;
	Tue,  7 May 2024 05:35:20 +0000 (UTC)
Message-ID: <5a812c84-c3bb-4874-b29c-0816494b77a8@ghiti.fr>
Date: Tue, 7 May 2024 07:35:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/5] riscv: Add update_mmu_tlb_range()
Content-Language: en-US
To: Bang Li <libang.li@antgroup.com>, akpm@linux-foundation.org,
 chenhuacai@kernel.org, tsbogend@alpha.franken.de, paul.walmsley@sifive.com,
 palmer@dabbelt.com, chris@zankel.net, jcmvbkbc@gmail.com
Cc: linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 loongarch@lists.linux.dev, linux-riscv@lists.infradead.org,
 david@redhat.com, ryan.roberts@arm.com, ioworker0@gmail.com,
 libang.linux@gmail.com
References: <20240506155120.83105-1-libang.li@antgroup.com>
 <20240506155120.83105-4-libang.li@antgroup.com>
From: Alexandre Ghiti <alex@ghiti.fr>
In-Reply-To: <20240506155120.83105-4-libang.li@antgroup.com>
X-GND-Sasl: alex@ghiti.fr
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240506_223526_250707_E5B62768 
X-CRM114-Status: UNSURE (   9.47  )
X-CRM114-Notice: Please train this message.
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Hi Bang,

On 06/05/2024 17:51, Bang Li wrote:
> Added update_mmu_tlb_range function, we can batch update tlb of an
> address range.
>
> Signed-off-by: Bang Li <libang.li@antgroup.com>
> ---
>   arch/riscv/include/asm/pgtable.h | 4 ++++
>   1 file changed, 4 insertions(+)
>
> diff --git a/arch/riscv/include/asm/pgtable.h b/arch/riscv/include/asm/pgtable.h
> index 661b2b4fe758..f784c6dd2c66 100644
> --- a/arch/riscv/include/asm/pgtable.h
> +++ b/arch/riscv/include/asm/pgtable.h
> @@ -489,6 +489,10 @@ static inline void update_mmu_cache_range(struct vm_fault *vmf,
>   #define __HAVE_ARCH_UPDATE_MMU_TLB
>   #define update_mmu_tlb update_mmu_cache
>   
> +#define __HAVE_ARCH_UPDATE_MMU_TLB_RANGE
> +#define update_mmu_tlb_range(vma, addr, ptep, nr) \
> +	update_mmu_cache_range(NULL, vma, addr, ptep, nr)
> +
>   static inline void update_mmu_cache_pmd(struct vm_area_struct *vma,
>   		unsigned long address, pmd_t *pmdp)
>   {


You can add:

Reviewed-by: Alexandre Ghiti <alexghiti@rivosinc.com>

Thanks,

Alex


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
