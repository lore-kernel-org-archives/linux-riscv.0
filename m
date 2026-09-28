Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D562EC9833E
	for <linux-riscv@archiver.kernel.org>; Mon, 28 Sep 2026 09:06:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gN8c2QND8slaLj0TiaRkIKZPATvae40020PwRoJLbmg=; b=hCQPodNxtrVoDk
	sT4ptBPJ14J6vVRK/53zQCKVnoExsKsy/Sh4yV0/aksrXny1F9Bjl63Szl35V3T7XmC4jN51n+gis
	Gy5EVjx4gUG0+plyLNoKBZFw9nROgkJ/EY3QoxWl3JR67V0xErjydUoSCsMRa5Wr26Odrno/6QOs2
	NtBoCpUBAUGxjarINAf+zv+tSNYSEnNyp3RLS9Pyuo2m2FtybyUNLpO0xJ9YeSJm3+A8a97kir0TX
	MOX8FelEU67KsVjX4MbsLb2+bhN0GxKsr12ITL5kg727DBIcXz2H8oVxQKM+mtpqjlqvbZeB5zHeW
	cRzkd6t/hqiJ7shHdF6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xB7JN-00000000Avz-26Ca;
	Mon, 28 Sep 2026 09:06:13 +0000
Received: from mail-ej2-x0d.google.com ([2a00:1450:4864:34::d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xB7JK-00000000AvI-3fIv
	for linux-riscv@lists.infradead.org;
	Mon, 28 Sep 2026 09:06:12 +0000
Received: by mail-ej2-x0d.google.com with SMTP id a640c23a62f3a-c2dca989afcso146754566b.2
        for <linux-riscv@lists.infradead.org>; Mon, 28 Sep 2026 02:06:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790586368; x=1791191168; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:date:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=XtSlOLaW3Y5DkxUyXc5MQJfomo4EWRSttsNoIPMu1rQ=;
        b=JIuWYG854G4KzcJ1CZGd84PTk7nLkIy94pzWpYyEfzc7Wy4d6JycwrZq88aKR0Zbfo
         tbeAIKS2ybLciUNlJrbrdI0FSf6s6XFynD88y/sfnB0yAjx3BCGbasIRMQFL/xCcrVZz
         KvmkFCoMOCO92KpCeFkswn55QLDZAyS1PzKcMbl6H7l+Bp/xmBeEJElkYS1fCpP0D556
         G7megK1piQ3yo25+l/6Z2Gfx2ZbpZ//QpveWY36OQM8f/T/ZKQEX0YhRDrh8+fB2kdOi
         DctLoxCLTmOMu5dQy3SC2/sxgeqhLIYK+YUQbVtVXDlQs1rckPwNelt6wpsAKAuNHLVq
         NU+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790586368; x=1791191168;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XtSlOLaW3Y5DkxUyXc5MQJfomo4EWRSttsNoIPMu1rQ=;
        b=0CWe0uzeDqn63H6QsRlhFRlLxlaMx9hhUFcsdWzHq6PsmKv5dSKcc1Or71UgQCAMJC
         6xnIdzJXvd1MKcuqGggEZ3QLXOmg4gILhUmAKixidGc9j3Xfmyg095W5mQoM6xEGaXfc
         dYJ3qFptLbylWU4NQ4eySk9KR1xWomtr/9Xs1KLJaWBwPHSmz0IVyAJtcfKjXQwxPZPz
         duAW6zpfnZprJ/PDXIm/YN7m1LUFXDIZ+jJp4R6DxQ9qyeyZisCvSHNFgs4hfIORr6y1
         jdczH8GkNiCUTzz5Nv470wxHDqehQNs7Vas9hst+nInDjrhmbfaZEsyKTH+332SZ+ppC
         /thQ==
X-Forwarded-Encrypted: i=1; AKwUvBz3H4d3dWg8GuKqvX8caTvZjaw9juwoazTXYLFBxjjiI3AHE9FWim5kZgRqYqGbwcwHpRALnbny2OXmqg==@lists.infradead.org
X-Gm-Message-State: AFuF++kl2TaRGZqjwtGxXHzk4rRyIGx5PJRjgpm3l5u9N+eTfiOO8yIB
	gGgXgIbnKIqcIyHBc/kL6d/psxJKBRSAjz6nX++mtA9BT5qpIaE4j/aR
X-Gm-Gg: AYBFou1IhJcse2iFre1N8JpoxcLZ6tXnRQUyRwDxRmmq6FGhDn4wCJM+YY1+7kwv0q9
	s1PgdcATkkTX+O2FQPNV1SLyIk1Tk3sUvV1E0FHIHFuRfVaG7ZTyLH2HCJZECPiXFJbyYicO5O6
	yMTPhsc+HncYk7Us9jvtUlSYAKjj/XuM3Zs8beXWQJbgPbKKqu/vf4PLeQF5eTlcScsXfM1ukj+
	E7QAewcact2pKBZCgIHO4pauCa/nM7/mvREG5ykv2bTpYYiprwhAY8hu48NLs/rsYoAl0S84ELu
	8a/PhTxG3x1xeqGk9hMDsh4p0D3Fe2rBfaVkPUQlVYIl6Ba1QdFzCtFrgJa6+Sgo8NQTojakcte
	4TVk4xw5ySq+lRoutAV0MdbwOhzgsJjp+L0ssGXhF8SjtSc1yeA+EThuD8ORedGsOCzYVWrHWT4
	K08Gbut5VwllcVgNZYFDFOBUyPDoYAcR3AE/4=
X-Received: by 2002:a17:907:9447:b0:c26:2eee:ffc7 with SMTP id a640c23a62f3a-c2ac250ec3emr1002093866b.35.1790586367856;
        Mon, 28 Sep 2026 02:06:07 -0700 (PDT)
Received: from milan ([2001:9b1:d5a0:a500::24b])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2ae7356d1csm441929866b.18.2026.09.28.02.06.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 02:06:07 -0700 (PDT)
From: Uladzislau Rezki <urezki@gmail.com>
X-Google-Original-From: Uladzislau Rezki <urezki@milan>
Date: Mon, 28 Sep 2026 11:06:04 +0200
To: Ye Liu <ye.liu@linux.dev>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Uladzislau Rezki <urezki@gmail.com>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	linux-mm@kvack.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org, Ye Liu <liuye@kylinos.cn>
Subject: Re: [PATCH v4 2/2] mm/vmalloc: fix vmalloc_dump_obj cross-zone VA
 lookup
Message-ID: <arot_MLB2tWwR7ue@milan>
References: <20260928-vmalloc_dump_obj-v4-0-6f288a431edc@linux.dev>
 <20260928-vmalloc_dump_obj-v4-2-6f288a431edc@linux.dev>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260928-vmalloc_dump_obj-v4-2-6f288a431edc@linux.dev>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260928_020610_941408_46CB9971 
X-CRM114-Status: GOOD (  32.46  )
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

On Mon, Sep 28, 2026 at 04:15:55PM +0800, Ye Liu wrote:
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
>  mm/vmalloc.c | 108 ++++++++++++++++++++++++++++++++++++-----------------------
>  1 file changed, 66 insertions(+), 42 deletions(-)
> 
> diff --git a/mm/vmalloc.c b/mm/vmalloc.c
> index df42d8a6f058..4f4d7453962f 100644
> --- a/mm/vmalloc.c
> +++ b/mm/vmalloc.c
> @@ -2517,67 +2517,94 @@ static void free_unmap_vmap_area(struct vmap_area *va)
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
> +	*locked_vn = NULL;
> +
>  	if (unlikely(!vmap_initialized))
>  		return NULL;
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
> -		va = __find_vmap_area(addr, &vn->busy.root);
> -		spin_unlock(&vn->busy.lock);
> +		if (mode == VMAP_LOCK) {
> +			spin_lock(&vn->busy.lock);
> +		} else {
> +			if (!spin_trylock(&vn->busy.lock))
> +				continue;
> +		}
>  
> -		if (va)
> +		va = __find_vmap_area(addr, &vn->busy.root);
> +		if (va) {
> +			*locked_vn = vn;
>  			return va;
> -	} while ((i = (i + nr_vmap_nodes - 1) % nr_vmap_nodes) != j);
> +		}
> +
> +		spin_unlock(&vn->busy.lock);
> +	} while ((i = next_vmap_node_id(i)) != j);
>  
>  	return NULL;
>  }
>  
> -static struct vmap_area *find_unlink_vmap_area(unsigned long addr)
> +struct vmap_area *find_vmap_area(unsigned long addr)
>  {
>  	struct vmap_node *vn;
>  	struct vmap_area *va;
> -	int i, j;
> -
> -	/*
> -	 * Check the comment in the find_vmap_area() about the loop.
> -	 */
> -	i = j = addr_to_node_id(addr);
> -	do {
> -		vn = &vmap_nodes[i];
>  
> -		spin_lock(&vn->busy.lock);
> -		va = __find_vmap_area(addr, &vn->busy.root);
> -		if (va)
> -			unlink_va(va, &vn->busy.root);
> +	va = find_vmap_area_lock(addr, &vn, VMAP_LOCK);
> +	if (va)
>  		spin_unlock(&vn->busy.lock);
>  
> -		if (va)
> -			return va;
> -	} while ((i = (i + nr_vmap_nodes - 1) % nr_vmap_nodes) != j);
> +	return va;
> +}
>  
> -	return NULL;
> +static struct vmap_area *find_unlink_vmap_area(unsigned long addr)
> +{
> +	struct vmap_node *vn;
> +	struct vmap_area *va;
> +
> +	va = find_vmap_area_lock(addr, &vn, VMAP_LOCK);
> +	if (va) {
> +		unlink_va(va, &vn->busy.root);
> +		spin_unlock(&vn->busy.lock);
> +	}
> +
> +	return va;
>  }
>  
>  /*** Per cpu kva allocator ***/
> @@ -5278,14 +5305,11 @@ bool vmalloc_dump_obj(void *object)
>  	unsigned long nr_pages;
>  
>  	addr = PAGE_ALIGN_DOWN((unsigned long) object);
> -	vn = addr_to_node(addr);
> -
> -	if (!spin_trylock(&vn->busy.lock))
> -		return false;
>  
> -	va = __find_vmap_area(addr, &vn->busy.root);
> +	va = find_vmap_area_lock(addr, &vn, VMAP_TRYLOCK);
>  	if (!va || !va->vm) {
> -		spin_unlock(&vn->busy.lock);
> +		if (va)
> +			spin_unlock(&vn->busy.lock);
>  		return false;
>  	}
>  
> 
> -- 
> 2.25.1
> 
LGTM:

Reviewed-by: Uladzislau Rezki (Sony) <urezki@gmail.com>

--
Uladzislau Rezki

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
