Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3AC23CA101C
	for <linux-riscv@archiver.kernel.org>; Thu,  4 Sep 2025 16:24:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2/WnDKhEWvduxzRJZjqZm4mNh1Z9vyDRQHzxXVkqj4w=; b=un1+MeGKecXG7L
	csPHOv6T+9cJ2Txcd8ui61YKg5LV+dQNV8tEkqEuFI2ydgWz23y287wGZAImVHqYGDXiHfNRKh7oB
	9/ZaogRIuFg2w1K8E3B9FL/3qaDzOqtgHA4KTF+oTAUO+j9UV1+Y8Ir0zrIJqU9WvcXAzTbzJqlmU
	02hs8BuQBCoQgQSfl5CKihMMymEW7r05C4fh2w6UVG3jqcXq3imTwoCX10U0Umh4fbyi/dFK2KCU9
	q6qYcSFS/PWM+J8PxuUNHyT5e01kEEvlkpSX1ZIFLYHcpt0ALu7UUBv3JaJQUFEexXRQJoxg1nyoP
	WG43C3gKrrDomvrtHtaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuClO-0000000Cqgf-2Rdg;
	Thu, 04 Sep 2025 16:24:42 +0000
Received: from relay7-d.mail.gandi.net ([2001:4b98:dc4:8::227])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uu93U-0000000BYLj-09ig;
	Thu, 04 Sep 2025 12:27:09 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 99F8842D83;
	Thu,  4 Sep 2025 12:27:02 +0000 (UTC)
Message-ID: <113262ca-214a-4cd4-86f2-c0e3e4bb1a06@ghiti.fr>
Date: Thu, 4 Sep 2025 14:27:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/7] riscv: Stop calling page_address() in free_pages()
To: "Vishal Moola (Oracle)" <vishal.moola@gmail.com>, linux-mm@kvack.org
Cc: linux-kernel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>,
 linux-block@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
 linux-efi@vger.kernel.org, virtualization@lists.linux.dev,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>
References: <20250903185921.1785167-1-vishal.moola@gmail.com>
 <20250903185921.1785167-5-vishal.moola@gmail.com>
Content-Language: en-US
From: Alexandre Ghiti <alex@ghiti.fr>
In-Reply-To: <20250903185921.1785167-5-vishal.moola@gmail.com>
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdeggdeitddvucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfevfhfhjggtgfesthejredttddvjeenucfhrhhomheptehlvgigrghnughrvgcuifhhihhtihcuoegrlhgvgiesghhhihhtihdrfhhrqeenucggtffrrghtthgvrhhnpedthfelfeejgeehveegleejleelgfevhfekieffkeeujeetfedvvefhledvgeegieenucfkphepvddttddumeekiedumeeffeekvdemvghfledtmeekheeftgemfegrfhegmegvfhegheemsggvudejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvddttddumeekiedumeeffeekvdemvghfledtmeekheeftgemfegrfhegmegvfhegheemsggvudejpdhhvghloheplgfkrfggieemvddttddumeekiedumeeffeekvdemvghfledtmeekheeftgemfegrfhegmegvfhegheemsggvudejngdpmhgrihhlfhhrohhmpegrlhgvgiesghhhihhtihdrfhhrpdhnsggprhgtphhtthhopedufedprhgtphhtthhopehvihhshhgrlhdrmhhoohhlrgesghhmrghilhdrtghomhdprhgtphhtthhopehlihhnuhigqdhmmheskhhvrggtkhdrohhrghdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvl
 hdrohhrghdprhgtphhtthhopegrkhhpmheslhhinhhugidqfhhouhhnuggrthhiohhnrdhorhhgpdhrtghpthhtoheplhhinhhugidqsghlohgtkhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdgrrhhmqdhkvghrnhgvlheslhhishhtshdrihhnfhhrrgguvggrugdrohhrghdprhgtphhtthhopehlihhnuhigphhptgdquggvvheslhhishhtshdrohiilhgrsghsrdhorhhgpdhrtghpthhtoheplhhinhhugidqrhhishgtvheslhhishhtshdrihhnfhhrrgguvggrugdrohhrgh
X-GND-Sasl: alex@ghiti.fr
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250904_052708_227108_93C9B200 
X-CRM114-Status: GOOD (  11.87  )
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

Hi Vishal,

On 9/3/25 20:59, Vishal Moola (Oracle) wrote:
> free_pages() should be used when we only have a virtual address. We
> should call __free_pages() directly on our page instead.
>
> Signed-off-by: Vishal Moola (Oracle) <vishal.moola@gmail.com>
> ---
>   arch/riscv/mm/init.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
> index 15683ae13fa5..1056c11d3251 100644
> --- a/arch/riscv/mm/init.c
> +++ b/arch/riscv/mm/init.c
> @@ -1624,7 +1624,7 @@ static void __meminit free_pud_table(pud_t *pud_start, p4d_t *p4d)
>   	if (PageReserved(page))
>   		free_reserved_page(page);
>   	else
> -		free_pages((unsigned long)page_address(page), 0);
> +		__free_pages(page, 0);
>   	p4d_clear(p4d);
>   }
>   
> @@ -1646,7 +1646,7 @@ static void __meminit free_vmemmap_storage(struct page *page, size_t size,
>   		return;
>   	}
>   
> -	free_pages((unsigned long)page_address(page), order);
> +	__free_pages(page, order);
>   }
>   
>   static void __meminit remove_pte_mapping(pte_t *pte_base, unsigned long addr, unsigned long end,


Acked-by: Alexandre Ghiti <alexghiti@rivosinc.com>

Thanks,

Alex


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
