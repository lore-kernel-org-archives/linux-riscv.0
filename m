Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9BE6C47DAF
	for <linux-riscv@archiver.kernel.org>; Mon, 22 Jan 2024 20:03:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SvXHXesRMOUOh6g9YKVF9sp+v+hZO3WL+5x5y4zyjY4=; b=Xby5AqCDhX+7s4
	F6W2hsIB9IIJDm2RuWPepGvxrL01wZlfqtJnVWOMjkgXJqZ1rSwDFBIdp6sh3G3P4VfRGlBWYsPD0
	/qN5TGTg9Yj4l+XC6LUbAYh7fjkARVV44YZ03VTFYykNUMIsuJVcvUCM3KCHyK9afF3e28rnz6Spm
	BANhWgwv0u9BNyP53jO7H2oW1gEtfn3DVkclUM1yh/wA1W+nVE1DWqvsfE0326nXY4sAE10/5xasX
	ZtdEo7wLqO1hcZFXIEkba7bZU32vT2vub3no09j4o/lv6+YVCqlaaM/HZTvqk4x9rBwg0L7LYBzo2
	5hmWPRmj3MLiFfAw9OdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rS0WD-00Dq4D-1h;
	Mon, 22 Jan 2024 20:03:41 +0000
Received: from relay9-d.mail.gandi.net ([217.70.183.199])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rS0W9-00Dq2C-1L;
	Mon, 22 Jan 2024 20:03:39 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 42A22FF802;
	Mon, 22 Jan 2024 20:03:26 +0000 (UTC)
Message-ID: <5601b896-f67c-432d-a169-0f08928123fc@ghiti.fr>
Date: Mon, 22 Jan 2024 21:03:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 04/11] risc: pgtable: define PFN_PTE_SHIFT
Content-Language: en-US
To: David Hildenbrand <david@redhat.com>, linux-kernel@vger.kernel.org
Cc: linux-mm@kvack.org, Andrew Morton <akpm@linux-foundation.org>,
 Matthew Wilcox <willy@infradead.org>, Ryan Roberts <ryan.roberts@arm.com>,
 Russell King <linux@armlinux.org.uk>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Dinh Nguyen <dinguyen@kernel.org>, Michael Ellerman <mpe@ellerman.id.au>,
 Nicholas Piggin <npiggin@gmail.com>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>,
 "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexander Gordeev <agordeev@linux.ibm.com>,
 Gerald Schaefer <gerald.schaefer@linux.ibm.com>,
 Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Sven Schnelle <svens@linux.ibm.com>, "David S. Miller"
 <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org,
 linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
 linux-s390@vger.kernel.org, sparclinux@vger.kernel.org
References: <20240122194200.381241-1-david@redhat.com>
 <20240122194200.381241-5-david@redhat.com>
From: Alexandre Ghiti <alex@ghiti.fr>
In-Reply-To: <20240122194200.381241-5-david@redhat.com>
X-GND-Sasl: alex@ghiti.fr
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240122_120337_585360_2F042A75 
X-CRM114-Status: GOOD (  13.36  )
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

Hi David,

On 22/01/2024 20:41, David Hildenbrand wrote:
> We want to make use of pte_next_pfn() outside of set_ptes(). Let's
> simpliy define PFN_PTE_SHIFT, required by pte_next_pfn().
>
> Signed-off-by: David Hildenbrand <david@redhat.com>
> ---
>   arch/riscv/include/asm/pgtable.h | 2 ++
>   1 file changed, 2 insertions(+)
>
> diff --git a/arch/riscv/include/asm/pgtable.h b/arch/riscv/include/asm/pgtable.h
> index 0c94260b5d0c1..add5cd30ab34d 100644
> --- a/arch/riscv/include/asm/pgtable.h
> +++ b/arch/riscv/include/asm/pgtable.h
> @@ -523,6 +523,8 @@ static inline void __set_pte_at(pte_t *ptep, pte_t pteval)
>   	set_pte(ptep, pteval);
>   }
>   
> +#define PFN_PTE_SHIFT		_PAGE_PFN_SHIFT
> +
>   static inline void set_ptes(struct mm_struct *mm, unsigned long addr,
>   		pte_t *ptep, pte_t pteval, unsigned int nr)
>   {


There is a typo in the commit title: risc -> riscv. Otherwise, this is 
right so:

Reviewed-by: Alexandre Ghiti <alexghiti@rivosinc.com>

Thanks,

Alex


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
