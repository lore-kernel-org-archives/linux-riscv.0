Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93B35C77B7C
	for <linux-riscv@archiver.kernel.org>; Wed, 10 May 2023 08:01:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1YttNlIma9vplMuc2RFSt9qKvLUWqBeeCu99ad1f4VY=; b=sVu0sklpRIKw3u
	xWj7TtZi4TTLw/wOz5L7v6WZYdn1z77aSs1a+JbPq0dDvxFv8vSX+CjbkCVvUubQgz9DS1DKfYOvF
	V764tWgyAck/EK1G044dvydYSPirQ/gk/Ua9Ap3vSg1aQUwytvaoFYBW5WLcahA2kgI4n6TCk89CD
	yxpyJr2ThcZVTwDIS2B9R2fjmDa6+1P1wAr2poa1bbT3t2wsD+fRFfR8Mlxwwg7kvVbQsJzllqRao
	yMXaQbwnrSEPRYeouhiT21f84GjSjlLcevi3lDCdFnd9AnQRyXnZKIDofdGVbQciTRm35C2FCAvaY
	5XBhmPMpQu/ZM7fFnDgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pwelT-005Sb6-15;
	Wed, 10 May 2023 08:01:35 +0000
Received: from relay4-d.mail.gandi.net ([217.70.183.196])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pwelQ-005SYo-1X;
	Wed, 10 May 2023 08:01:34 +0000
Received: (Authenticated sender: alex@ghiti.fr)
	by mail.gandi.net (Postfix) with ESMTPSA id 90583E000A;
	Wed, 10 May 2023 08:01:13 +0000 (UTC)
Message-ID: <6ad10e79-74e5-7c48-d10c-78229187da32@ghiti.fr>
Date: Wed, 10 May 2023 10:01:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH 14/23] riscv/hugetlb: pte_alloc_huge() pte_offset_huge()
To: Hugh Dickins <hughd@google.com>, Andrew Morton <akpm@linux-foundation.org>
Cc: Mike Kravetz <mike.kravetz@oracle.com>, Mike Rapoport <rppt@kernel.org>,
 "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>,
 Matthew Wilcox <willy@infradead.org>, David Hildenbrand <david@redhat.com>,
 Suren Baghdasaryan <surenb@google.com>, Qi Zheng
 <zhengqi.arch@bytedance.com>, Russell King <linux@armlinux.org.uk>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>, Greg Ungerer
 <gerg@linux-m68k.org>, Michal Simek <monstr@monstr.eu>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Helge Deller
 <deller@gmx.de>, John David Anglin <dave.anglin@bell.net>,
 "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>,
 Alexandre Ghiti <alexghiti@rivosinc.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Heiko Carstens <hca@linux.ibm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Claudio Imbrenda <imbrenda@linux.ibm.com>,
 John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
 "David S. Miller" <davem@davemloft.net>, Chris Zankel <chris@zankel.net>,
 Max Filippov <jcmvbkbc@gmail.com>, x86@kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-ia64@vger.kernel.org,
 linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org,
 linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
 linux-sh@vger.kernel.org, sparclinux@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org
References: <77a5d8c-406b-7068-4f17-23b7ac53bc83@google.com>
 <d1e54510-9ea2-edf-3851-fa7635ce1e5e@google.com>
Content-Language: en-US
From: Alexandre Ghiti <alex@ghiti.fr>
In-Reply-To: <d1e54510-9ea2-edf-3851-fa7635ce1e5e@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230510_010132_649219_C38CC116 
X-CRM114-Status: GOOD (  14.68  )
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

Hi Hugh,

On 5/10/23 06:59, Hugh Dickins wrote:
> pte_alloc_map() expects to be followed by pte_unmap(), but hugetlb omits
> that: to keep balance in future, use the recently added pte_alloc_huge()
> instead; with pte_offset_huge() a better name for pte_offset_kernel().
>
> Signed-off-by: Hugh Dickins <hughd@google.com>
> ---
>   arch/riscv/mm/hugetlbpage.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/arch/riscv/mm/hugetlbpage.c b/arch/riscv/mm/hugetlbpage.c
> index a163a3e0f0d4..80926946759f 100644
> --- a/arch/riscv/mm/hugetlbpage.c
> +++ b/arch/riscv/mm/hugetlbpage.c
> @@ -43,7 +43,7 @@ pte_t *huge_pte_alloc(struct mm_struct *mm,
>   
>   	for_each_napot_order(order) {
>   		if (napot_cont_size(order) == sz) {
> -			pte = pte_alloc_map(mm, pmd, addr & napot_cont_mask(order));
> +			pte = pte_alloc_huge(mm, pmd, addr & napot_cont_mask(order));
>   			break;
>   		}
>   	}
> @@ -90,7 +90,7 @@ pte_t *huge_pte_offset(struct mm_struct *mm,
>   
>   	for_each_napot_order(order) {
>   		if (napot_cont_size(order) == sz) {
> -			pte = pte_offset_kernel(pmd, addr & napot_cont_mask(order));
> +			pte = pte_offset_huge(pmd, addr & napot_cont_mask(order));
>   			break;
>   		}
>   	}


Reviewed-by: Alexandre Ghiti <alexghiti@rivosinc.com>

Thanks,

Alex


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
