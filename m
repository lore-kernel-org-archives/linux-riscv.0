Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F062CC5B572
	for <linux-riscv@archiver.kernel.org>; Mon, 17 Aug 2026 17:31:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HXHUoe2XOfiuA7/X5vdA9JssZQ7RIU3a0R6948LufY8=; b=MqWY1WIsQ6RzCj
	JgDF8f+Uy17sKBEmu8o+PdXPPA7eApWvoUXionZOk0oE7U6Tu8QUZnbj8kYkvTMHWY4m773SfMRkP
	48MsayMnQN8QUVJg47C58YbXxNjWDEF4pEr8ns6/lNp+blcI7+P+/qwTeMW+IWs1ILsDuK4VO6KD/
	jte4AZySh+7+3mb3EXTcOQ1MIN8m4bwipIy58NX6CiZjMewD5xMarfaBPXOhBMe21Q+T/1eNkOgaH
	oeRgZzwHOPGnjLWMGuVdsUVdHplZhmuNXKqbguJuh0Jd4ch8zFruFQK2poj4Xn/H3qYrqJqjX1Fry
	nJ8BnxwtnUuckebhAt2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1ww1BH-00000006b2P-11cH;
	Mon, 17 Aug 2026 17:31:27 +0000
Received: from mail-lf1-x129.google.com ([2a00:1450:4864:20::129])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1ww1BD-00000006b10-0ezu
	for linux-riscv@lists.infradead.org;
	Mon, 17 Aug 2026 17:31:25 +0000
Received: by mail-lf1-x129.google.com with SMTP id 2adb3069b0e04-5aeb59d54b1so3725009e87.1
        for <linux-riscv@lists.infradead.org>; Mon, 17 Aug 2026 10:31:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786987880; x=1787592680; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:date:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=gdAST+PW7bd2DD1v0YjadB8+zi0iamo4AznH2c9tOUI=;
        b=U1Y617RourvNlnBiQgzMPmhFZE4bkxTwWNpo6xh0BLAnadZFBIkCaH2T4JQmHqfvdf
         ++dwOn/6SXY6RaO7ShDoTKWErNUTjumEAz9T9feDWaGQmC6eTBsYahwI0MzmidWRTbm6
         a+fkmFHYDo16PxZkDI+UbWlTBJBlyg9jpedbx1e2lFzqFVB4dWQVuzFikQI9SjbpKOXK
         ficnA4hR13NSpQR1Gs4zCANUK7Tr8fWw+N2v8wXvEo0A7vv2wGX16VHkxxpNBeaUh5O8
         iOlEExu2j8ssUmsEkvFkfmZrFgy0j2zOfehewkexgeKb60CaV1EohD1JJnV9XptlEutu
         Wqqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786987880; x=1787592680;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gdAST+PW7bd2DD1v0YjadB8+zi0iamo4AznH2c9tOUI=;
        b=YwRIRYApOY26meTnGqa1Ob7NDGZgYBXdXB9axBuBbmrVJnveBxCeEKN7L0iEhaesFX
         hUS63KshgI8W0eDIkYnbkgJZkjnvPC0llc/gzckPn+jucyfHOTAhy/X4NbmScrn3aKRx
         iB49HrHvzcOBytMljVpMD3C0uOhAk8qid39wwDfaOC6o43Gf5zG53YpwGxQX04wzWv6K
         kW/FF0r9dIozYGlEaczIkb/su111+yUbUKEmUnDumeuk8LdiMDGBCkBayzZZ0z8EmbsJ
         +xhHjRjKaPQqF8vZ6gRBpcuND2gwjdmvSGgAEZwxHUlZUMgmhjteohgdH1TSjJ+XUq7S
         MDmQ==
X-Forwarded-Encrypted: i=1; AHgh+RpGoCaMzlY+uXudE+JcjbUn4tZi3yz13FIcSLnLEt4TG1GD6r4Kmnow84VrFiP+dG9mQymJPLKCCT2okQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Ywuhq8QOEeuiySYWonUaNTQbCddDazSyDAUxZUgXXRQH7ZcthJG
	ZVuDxj6gNHepO67ZU//6znB2ky1mDKBhjZUf8imBY54IzMzdofv5uDoq
X-Gm-Gg: AR+sD12iXMDa1OQTBeqZpReBAwnyBUvIUPKU7OXtY2/ZE2eoofLUhq7kHqws168vkrc
	Ts1UG5jjCLFHbbmiiXKIiOC6b1vciMJbIDXYYoYB2JRWvF1a7XgPIu3KfmaYgKz4mvNYlbSod/G
	N8pe0BxT8PrQyYdc640CgTWyPlyzkdl3lFNXbXoSLiA5QkJ1ma7hOpOadgZTlMSXMEV+yAY7MYq
	z2brmdXrTOjdfMNdj028UZn9TeIwldXsaDvcwoE79ABr6RKTiAw0rfCJDfQlugQatwiLyHVlXhg
	umOZsUtr8qPlIOQO7XVDFII3X5ngzcN/7NzbDMvOqKELgV3PDgrHP2Lg5RQjYy9/FetfkWHdp9G
	ZvsnFlg9G0/bcut/S87iNQdfb+q+i+DI70QmjLtUcA3VZi4b4uWBpldfGsjdDSxPpStDtjRqewk
	/srMgp9uCeTzf8W3V+lgOqN9cjtQ==
X-Received: by 2002:a05:6512:1284:b0:5b2:9358:b854 with SMTP id 2adb3069b0e04-5b459142afbmr3869031e87.42.1786987880080;
        Mon, 17 Aug 2026 10:31:20 -0700 (PDT)
Received: from milan ([2001:9b1:d5a0:a500::24b])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a16b1f1852sm5885691fa.38.2026.08.17.10.31.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Aug 2026 10:31:19 -0700 (PDT)
From: Uladzislau Rezki <urezki@gmail.com>
X-Google-Original-From: Uladzislau Rezki <urezki@milan>
Date: Mon, 17 Aug 2026 19:31:17 +0200
To: "Mike Rapoport (Microsoft)" <rppt@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Adrian =?utf-8?Q?Barna=C5=9B?= <abarnas@google.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Alexandre Ghiti <alex@ghiti.fr>, Andy Lutomirski <luto@kernel.org>,
	Borislav Petkov <bp@alien8.de>,
	Brendan Jackman <brendan.jackman@linux.dev>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	David Hildenbrand <david@kernel.org>,
	Gerald Schaefer <gerald.schaefer@linux.ibm.com>,
	Heiko Carstens <hca@linux.ibm.com>,
	Huacai Chen <chenhuacai@kernel.org>, Ingo Molnar <mingo@redhat.com>,
	Len Brown <lenb@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <pjw@kernel.org>, Pavel Machek <pavel@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	"H. Peter Anvin" <hpa@zytor.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Sven Schnelle <svens@linux.ibm.com>,
	Thomas Gleixner <tglx@kernel.org>,
	Uladzislau Rezki <urezki@gmail.com>,
	Vasily Gorbik <gor@linux.ibm.com>, WANG Xuerui <kernel@xen0n.name>,
	Will Deacon <will@kernel.org>, x86@kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-mm@kvack.org, linux-pm@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
	loongarch@lists.linux.dev
Subject: Re: [PATCH 2/6] mm/vmalloc: set area's page_order after allocation
 succeeds
Message-ID: <aoNFZU_QzghDBgbZ@milan>
References: <20260816-execmem-set-vm-perms-v0-2-v1-0-90944a3ad43f@kernel.org>
 <20260816-execmem-set-vm-perms-v0-2-v1-2-90944a3ad43f@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260816-execmem-set-vm-perms-v0-2-v1-2-90944a3ad43f@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260817_103123_223121_47650BD9 
X-CRM114-Status: GOOD (  24.52  )
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

On Sun, Aug 16, 2026 at 01:59:25PM +0300, Mike Rapoport (Microsoft) wrote:
> __vmalloc_area_node() calls set_vm_area_page_order() to set area's
> page_order before actually allocating pages to populate the area.
> 
> If allocation of large pages in HUGE_VMAP case fails midway, this leaves
> the area with elevated page_order throughout the cleanup path.
> 
> There is no actual issue with this because the only place that currently
> relies on area->page_order on the cleanup path is the loop calculating
> the direct map alias range in vm_reset_perms() and it anyway skips
> unpopulated pages.
> 
> But having set_vm_area_page_order() in the middle of __vmalloc_area_node()
> makes things very obscure, hard to reason about and error prone against
> future changes of the cleanup path.
> 
> Move the call to set_vm_area_page_order() after __vmalloc_area_node()
> succeeded where page order is guaranteed.
> 
> Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
> ---
>  mm/vmalloc.c | 11 +++++++++--
>  1 file changed, 9 insertions(+), 2 deletions(-)
> 
> diff --git a/mm/vmalloc.c b/mm/vmalloc.c
> index 22566e0b6e38..6822f0fe9583 100644
> --- a/mm/vmalloc.c
> +++ b/mm/vmalloc.c
> @@ -3901,8 +3901,7 @@ static void *__vmalloc_area_node(struct vm_struct *area, gfp_t gfp_mask,
>  		goto fail;
>  	}
>  
> -	set_vm_area_page_order(area, page_shift - PAGE_SHIFT);
> -	page_order = vm_area_page_order(area);
> +	page_order = page_shift - PAGE_SHIFT;
>  
>  	/*
>  	 * High-order nofail allocations are really expensive and
> @@ -4106,6 +4105,14 @@ void *__vmalloc_node_range_noprof(unsigned long size, unsigned long align,
>  	if (!ret)
>  		goto fail;
>  
> +	/*
> +	 * Set area->page_order once it's known exactly that the order of the
> +	 * pages the area contains.
> +	 * Even if we succeeded to partially populate the area with large pages,
> +	 * still treat the area as populated with order-0 pages.
> +	 */
> +	set_vm_area_page_order(area, shift - PAGE_SHIFT);
> +
>  	/*
>  	 * Mark the pages as accessible, now that they are mapped.
>  	 * The condition for setting KASAN_VMALLOC_INIT should complement the
> 
> -- 
> 2.53.0
> 
OK, can we just set it right after the:

	area->nr_pages = vm_area_alloc_pages(
			vmalloc_gfp_adjust(gfp_mask, page_order), node,
			page_order, nr_small_pages, area->pages);


succeeds?

I am not sure there is a good reason to move it out of the
__vmalloc_area_node().

--
Uladzislau Rezki

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
