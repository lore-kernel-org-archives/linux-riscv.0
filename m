Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B96F4C9830E
	for <linux-riscv@archiver.kernel.org>; Fri, 25 Sep 2026 10:37:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/GVwxDwOmDdg92c6VnC+uf5sHCiDiq/msLqHHo0HSro=; b=AM2ZiSkONqbTYD
	Jo5DKj5jSUyWcpIvGhR8opaf/1O+Owp2kV58Wgiah48ROG228l7lAyP7KZDMuJnxLLmrX6a1Cv1HV
	AXdCTeCva/2ZSuosbxmApc2U3iTPE9f6HCY1dwOhlYXusrZXzdVZwygGYl1PqDrWE3iUqoD+XKhTg
	dVLqnlcPlUhsobt8t7RrfY4B7t6XsqpxrdQC5NzqrIMwzCPAT6rdYqAFooPHMbP0aulb/4t9uockO
	jZXpMoLFiml5hR7+AGfsXPZKB/ti/taE1wMIEBVd+WmnS6LZLaKMnNAaAjXh8U9wB1j+hAvSecm6c
	5W2p+4qXoXKNPLXf2bKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xA3IU-0000000D6rU-0IsF;
	Fri, 25 Sep 2026 10:36:54 +0000
Received: from mail-ej2-x10.google.com ([2a00:1450:4864:34::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xA3IR-0000000D6r2-20GV
	for linux-riscv@lists.infradead.org;
	Fri, 25 Sep 2026 10:36:52 +0000
Received: by mail-ej2-x10.google.com with SMTP id a640c23a62f3a-c254f6c7a4aso97296966b.0
        for <linux-riscv@lists.infradead.org>; Fri, 25 Sep 2026 03:36:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790332609; x=1790937409; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:date:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=FhWuBlVR+9Exee5MQnVdQb500Y1OJ3oFiUVTaPUsfcQ=;
        b=oVczfoQtaCyaC9+D4a6kl3m0fdxBI2ao5YlYjwUaizZUpoatFoiBzZMTzLPaMIw8my
         ty9b9fqCBhM+J3buzx05rYmyAyO3BNc3QeQ5EG6tddX0VBKDjcRp3MJqy5NcG36RZRQt
         h6ToZr6+n4k8iGTGY6ENrkP/93FXebMdKzZcDryMmDAmpHLvD3EMJdhohvRkOLSYE7cU
         18RpEuNK1A2CtyO5QEjnrfaQrO0/Jf1/pKKs+Y9GrrPlTPjDPREeFVwijFUSiwRV9D5C
         Bj/zpqwqkZ5LAvFLhEw/s1H6jhrUMaGxDa9BSUZpmUObMNS6L3aoPsMooOvWbO6ZgxNa
         Y3jA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790332609; x=1790937409;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FhWuBlVR+9Exee5MQnVdQb500Y1OJ3oFiUVTaPUsfcQ=;
        b=qslySzpZsyhUGfGvHaN0SrnQ1yeXEqV2DMMY8S8q4gRD/LoU84yIvUW3L9Dotj+Rs7
         uhAxgFelUyHys3HJtKIJGPWqR08tHUmVyC+D2BYsYrBWPsQiNTwnWMZ855d8UkRNnBbD
         4V1KfvSkgeU8Jv6oEgGqWNKgybZk2wLLaAZx8dJi0fuUgT9FwH8zwlLEW+bgAjXGayDR
         fahRRP/P3Y1oI5/YXKc5vEMRi21aY54uykmGI7WJ/jRDuh3uCfOzEV2+0Zuff7F8DC+I
         duSO4oSruPsoZLnr/Usz8PM/TTupfIv+LMC2uE7TowJiBsVXvvlSvC705GCMwUdpPWXe
         UiZQ==
X-Forwarded-Encrypted: i=1; AKwUvBx8Q6A4ELKjrJspvYboPIqOqYFesR1+5wVhfPne1o0hSeumVX8huk2tzU1EUcea7DCbFrkvdnXnfTCYuA==@lists.infradead.org
X-Gm-Message-State: AFuF++lH4ZPaPyTAndX5m9t4O8VpGRGfUxeiyKqHezOuUbLaUhxe0kQ7
	3dsoHIpAeJhbwkR9S3r8n7ysI1mzYGEal2DILmUqABbw86HwV/7TheZb
X-Gm-Gg: AYBFou1GCv7q7Ax8u6AN7O25QXIOU+1uusO29b+E8i33Ffqky53eztQBCbB9cqEWGZp
	ykKhy0tC9Ymv0MpIKZFRZy5of6+f2dp47SoFi7oVqTR3o06Ca69R2sCDPUlfPv1ympd+ZbhpDX6
	Mo0cttF7iF0FozesH4CwEYNExTDtiT+j/cv7jcB1MoRZATnYO+Pc3q8izCNLeaD6m4KSxdfQ1Jw
	e5iKlw8ORhu3r6d97Kr3/TrDd9/tD99lHYnLV/lBfVLtgnDeprDibv6IDmp6BQb0JHMaEDu1PkA
	n2vibGrarBWnqSWo+7uUJR0BN8zymTsT8zvWqFdIfZ1wRcH2rpGD2qvkHq1Nmq6PPpYq5Z44uzM
	WsLMvo5eTelEm3TjHWZaauM0p9tNgw73/pdm+bI4XI15u6+Vp5HpUZoQSqBixlJaNAi83PW2jfz
	rj4r2E0qzDIbN3kbMm7g7JhvEaPWB/m293cF8=
X-Received: by 2002:a17:906:7947:b0:c26:1649:47ad with SMTP id a640c23a62f3a-c2ac53c3f15mr404029566b.35.1790332608444;
        Fri, 25 Sep 2026 03:36:48 -0700 (PDT)
Received: from milan ([2001:9b1:d5a0:a500::24b])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2ae77fd743sm95444766b.47.2026.09.25.03.36.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2026 03:36:48 -0700 (PDT)
From: Uladzislau Rezki <urezki@gmail.com>
X-Google-Original-From: Uladzislau Rezki <urezki@milan>
Date: Fri, 25 Sep 2026 12:36:45 +0200
To: Ye Liu <ye.liu@linux.dev>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Uladzislau Rezki <urezki@gmail.com>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	linux-mm@kvack.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org, Ye Liu <liuye@kylinos.cn>
Subject: Re: [PATCH v3 2/2] mm/vmalloc: fix vmalloc_dump_obj cross-zone VA
 lookup
Message-ID: <arZOvQzkacy826wJ@milan>
References: <20260924-vmalloc_dump_obj-v3-0-5bdee3da37b3@linux.dev>
 <20260924-vmalloc_dump_obj-v3-2-5bdee3da37b3@linux.dev>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260924-vmalloc_dump_obj-v3-2-5bdee3da37b3@linux.dev>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260925_033651_548905_310F34E3 
X-CRM114-Status: GOOD (  31.19  )
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

On Thu, Sep 24, 2026 at 04:51:40PM +0800, Ye Liu wrote:
> From: Ye Liu <liuye@kylinos.cn>
> 
> vmalloc_dump_obj() searches only one vmap node (addr_to_node(addr)),
> but a vmalloc allocation may span multiple vmap zones.  The VA is
> stored in only one node's rb-tree (addr_to_node(va_start)), so an
> object pointer in a different zone than va_start maps to a different
> node and the search misses.  This affects any allocation larger than
> vmap_zone_size (64 KiB) on multi-CPU systems.
> 
> Extract find_vmap_area_lock() from find_vmap_area() to share the
> cross-node iteration logic.  The helper supports both spin_lock and
> spin_trylock, the latter for atomic dump contexts (OOM, KASAN, RCU).
> 
> Signed-off-by: Ye Liu <liuye@kylinos.cn>
> ---
>  mm/vmalloc.c | 111 +++++++++++++++++++++++++++++++++++++----------------------
>  1 file changed, 69 insertions(+), 42 deletions(-)
> 
> diff --git a/mm/vmalloc.c b/mm/vmalloc.c
> index df42d8a6f058..e5b465de1559 100644
> --- a/mm/vmalloc.c
> +++ b/mm/vmalloc.c
> @@ -2517,39 +2517,81 @@ static void free_unmap_vmap_area(struct vmap_area *va)
>  	free_vmap_area_noflush(va);
>  }
>  
> -struct vmap_area *find_vmap_area(unsigned long addr)
> +static inline int next_vmap_node_id(int i)
> +{
> +	return (i + nr_vmap_nodes - 1) % nr_vmap_nodes;
> +}
> +
> +enum vmap_lock_mode {
> +	VMAP_LOCK,
> +	VMAP_TRYLOCK,
> +};
> +
> +/*
> + * Search for a vmap_area at @addr across all vmap nodes.  An
> + * addr_to_node_id(addr) converts an address to a node index where
> + * a VA is located. If VA spans several zones and passed addr is not
> + * the same as va->va_start, what is not common, we may need to scan
> + * extra nodes. See an example:
> + *
> + *      <----va---->
> + * -|-----|-----|-----|-----|-
> + *     1     2     0     1
> + *
> + * VA resides in node 1 whereas it spans 1, 2 an 0. If passed addr
> + * is within 2 or 0 nodes we should do extra work.
> + *
> + * Returns the VA with @locked_vn->busy.lock held; the caller must
> + * release it. If @mode is VMAP_TRYLOCK, nodes that cannot be locked
> + * are skipped.
> + */
> +static struct vmap_area *
> +find_vmap_area_lock(unsigned long addr, struct vmap_node **locked_vn,
> +		enum vmap_lock_mode mode)
>  {
>  	struct vmap_node *vn;
>  	struct vmap_area *va;
>  	int i, j;
>  
> -	if (unlikely(!vmap_initialized))
> +	if (unlikely(!vmap_initialized)) {
> +		*locked_vn = NULL;
>
Just set it to NULL once on entry?

>  		return NULL;
> +	}
>  
> -	/*
> -	 * An addr_to_node_id(addr) converts an address to a node index
> -	 * where a VA is located. If VA spans several zones and passed
> -	 * addr is not the same as va->va_start, what is not common, we
> -	 * may need to scan extra nodes. See an example:
> -	 *
> -	 *      <----va---->
> -	 * -|-----|-----|-----|-----|-
> -	 *     1     2     0     1
> -	 *
> -	 * VA resides in node 1 whereas it spans 1, 2 an 0. If passed
> -	 * addr is within 2 or 0 nodes we should do extra work.
> -	 */
>  	i = j = addr_to_node_id(addr);
>  	do {
>  		vn = &vmap_nodes[i];
>  
> -		spin_lock(&vn->busy.lock);
> +		if (mode == VMAP_LOCK) {
> +			spin_lock(&vn->busy.lock);
> +		} else {
> +			if (!spin_trylock(&vn->busy.lock))
> +				continue;
> +		}
> +
>  		va = __find_vmap_area(addr, &vn->busy.root);
> +		if (va) {
> +			*locked_vn = vn;
> +			return va;
> +		}
> +
>  		spin_unlock(&vn->busy.lock);
> +	} while ((i = next_vmap_node_id(i)) != j);
>  
> -		if (va)
> -			return va;
> -	} while ((i = (i + nr_vmap_nodes - 1) % nr_vmap_nodes) != j);
> +	*locked_vn = NULL;
> +	return NULL;
> +}
> +
> +struct vmap_area *find_vmap_area(unsigned long addr)
> +{
> +	struct vmap_node *vn;
> +	struct vmap_area *va;
> +
> +	va = find_vmap_area_lock(addr, &vn, VMAP_LOCK);
> +	if (va) {
> +		spin_unlock(&vn->busy.lock);
> +		return va;
> +	}
>
Can we simplify like?
...
	va = find_vmap_area_lock(addr, &vn, VMAP_LOCK);
	if (va)
		spin_unlock(&vn->busy.lock);

	return va;
...

Thanks!

--
Uladzislau Rezki

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
