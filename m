Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 070E4C982FA
	for <linux-riscv@archiver.kernel.org>; Tue, 22 Sep 2026 12:45:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SuTijzvsIH5n4f0h3L1Bf5fbLds6BK64gjsNvPDP0l0=; b=oFUSUTV2zG9TdL
	lZvd6l+rp+Ua7mUxpjkahkJGSkmb1Qo+JoxiIADD+OrVBAOXcVr/A6TVrBsoq5cGRW11RkGsX39YI
	B+f1sWSJB5DODZxbERYI+D3L7Nu/n+mz31M07E3qVbch+jjpbMfSKZrMD/K/eUWKgzUI3cINIZ0vN
	S9n/IR75lTBNDaLWGfZFGcMFGf+ikBW2IOhq1NeyCo4jMwi6D9euTo0PncVCTl0kfxLsBy6vIJSg3
	gopX5VKIFgz0BDlz1ZEQaG/XCCxje0hKBQ6ks8xEEu1ICw/avKjBZlMSTjalRyuibEwqlx5dchtr6
	XtY6r+RDrqkQd4zHi28g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8zre-00000005LPl-4Aar;
	Tue, 22 Sep 2026 12:44:50 +0000
Received: from mail-ej2-x10.google.com ([2a00:1450:4864:34::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8zrc-00000005LOY-2Fnw
	for linux-riscv@lists.infradead.org;
	Tue, 22 Sep 2026 12:44:49 +0000
Received: by mail-ej2-x10.google.com with SMTP id a640c23a62f3a-c264788fd58so620902966b.1
        for <linux-riscv@lists.infradead.org>; Tue, 22 Sep 2026 05:44:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790081086; x=1790685886; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:date:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=p2/mloYlrcJ4io0NzgMvmL7ZcyTYG1Hsn6kSPBsACzk=;
        b=oEM53eJ63pL8QzEXwaadQoKVTA+xVLoMB4AWKByqx7jmR0k+Abk5H6nbIYHGepkAM/
         NfvP9kjzn2mgaQ5SOcGBJZjI28CouZFGg3T77rXjyOxj1XtDrC5Gena+9bcWd1LwSg4C
         YWy7vUmRrFOylRb+5QVgwBLR7qQbhhAYHIHVx5klBAr8nOzITszTcg1qi6x2rAdNRgXl
         10p+DU2Nzk169AdzKRX4wpcFtJWI83Ua3SnIpSGds67+vc/8xm2UMvjjIW7unSH2uGk2
         qgMC2UMJaIAVOo2GIVekoEPTQ4nNMhnz8D08zL372gAkCP1mPygmDntcQsmqGlP6cYzQ
         ISag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790081086; x=1790685886;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=p2/mloYlrcJ4io0NzgMvmL7ZcyTYG1Hsn6kSPBsACzk=;
        b=eim+Nk/Zz/8ZmZxPiI16d4ZKqfsirKQ1dIKguIEiH8gtZwiSWJqvbCtRqgPBl9X9zB
         c5zVm+520MTe4CQAKFnAFCM/cq/LhkbT1wlXz4oHoHeyoK3cXx/Uo5M2ff55d2CX+i9g
         fAF0xtMLBIu/LuFhm0B7rmsR7G2qW6GXE151wPdJDEF+xPleQpCbelAgaOmha45AKyXw
         IPZOymTqJkFn/faHadlOn6mZ505oRK/tFJLOQv3MjXWChLkVkZeVrpJuUtnkT9/Ad89o
         kEZFbIIx/B0W0msDOytrcrdl7AQfU0IHCSrug0AxSYDFxJZBN9koPqTLMDXP0N6iuV2p
         7jNQ==
X-Forwarded-Encrypted: i=1; AKwUvBzb1AJn3wHzD9QPR31vCfhkMTRf8XmOptx/psI1DjD2fLbWwH7QGTRoA4viAnPPf3T+76ALhlK15UxYIw==@lists.infradead.org
X-Gm-Message-State: AFuF++nepAACxcAVd3WVuEyj4orHMfq7D5L6fIEE+rFDF2BqPFbW/KMi
	MM6XYCvZn6BS7xcFW5OeoLF973i8xwY6nlUTFHqsokL+veZrxZvgNBfs
X-Gm-Gg: AYBFou3p/dM013W3X1PAcLLXawQ5E1w+qq5cakY1qQJgLlnTo0UvL8q+3XJCYuGsRSX
	Eq+FV7Rpc2MYMFls2yZeCXmHkDF3q0AOgv5ew9BaLKUoKqnBMyJkHS6Dw96orjPZflA9hzunxvZ
	CTtJhyV92CN88QWH4ON7wXLl7ijZtKuvAak123np70JM1ZJns0k6EKuidIUjL0bcKAYBt1RfcMB
	cyXyx7uEgFovemXcpMafhBgcjkwIlHJtXA3BZZdCRu065Iwr2m1uqXiRvfXRAHT6QGWtvd2jC9+
	d/qhWfoanq34KB1jxavw1546hR4n3SmsUxZrjaj1cbsoscwOlMz45/0dcI6RZUGxza4/bSxgSyy
	6FXBN4wtf4wTQZlBQPoSF3chAap25ZO3xBw5reCvxENZuQIisTcJIBF2/6HLlo7ufnJM6T+KTtx
	/tZaM+m5Gh/fpd6NaGALMbMg6KLjjvVB54V0Y=
X-Received: by 2002:a17:907:3f24:b0:c29:439b:d5c1 with SMTP id a640c23a62f3a-c2a1585a618mr1167923466b.16.1790081086414;
        Tue, 22 Sep 2026 05:44:46 -0700 (PDT)
Received: from milan ([2001:9b1:d5a0:a500::24b])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2a9c580d2fsm74868466b.26.2026.09.22.05.44.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 05:44:46 -0700 (PDT)
From: Uladzislau Rezki <urezki@gmail.com>
X-Google-Original-From: Uladzislau Rezki <urezki@milan>
Date: Tue, 22 Sep 2026 14:44:44 +0200
To: Ye Liu <ye.liu@linux.dev>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Uladzislau Rezki <urezki@gmail.com>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	linux-mm@kvack.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org, Ye Liu <liuye@kylinos.cn>
Subject: Re: [PATCH v2 2/3] mm/vmalloc: fix vmalloc_dump_obj cross-zone VA
 lookup
Message-ID: <arJ4PLGlF7uhNWOs@milan>
References: <20260921-vmalloc_dump_obj-v2-0-73fceb3ed1c8@linux.dev>
 <20260921-vmalloc_dump_obj-v2-2-73fceb3ed1c8@linux.dev>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260921-vmalloc_dump_obj-v2-2-73fceb3ed1c8@linux.dev>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260922_054448_601132_F79DD342 
X-CRM114-Status: GOOD (  27.90  )
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

On Mon, Sep 21, 2026 at 09:17:22PM +0800, Ye Liu wrote:
> From: Ye Liu <liuye@kylinos.cn>
> 
> vmalloc_dump_obj() searches only one vmap node (addr_to_node(addr)),
> but a vmalloc allocation may span multiple vmap zones.  The VA is
> stored in only one node's rb-tree (addr_to_node(va_start)), so an
> object pointer in a different zone than va_start maps to a different
> node and the search misses.  This affects any allocation larger than
> vmap_zone_size (64 KiB) on multi-CPU systems.
> 
> Iterate all vmap nodes using for_each_vmap_node, like find_vmap_area()
> does, but with spin_trylock instead of spin_lock as this function can
> be called from atomic dump contexts (OOM, KASAN, RCU).
> 
> Signed-off-by: Ye Liu <liuye@kylinos.cn>
> ---
>  mm/vmalloc.c | 24 ++++++++++++++++++------
>  1 file changed, 18 insertions(+), 6 deletions(-)
> 
> diff --git a/mm/vmalloc.c b/mm/vmalloc.c
> index df42d8a6f058..30c610f678dc 100644
> --- a/mm/vmalloc.c
> +++ b/mm/vmalloc.c
> @@ -5278,17 +5278,29 @@ bool vmalloc_dump_obj(void *object)
>  	unsigned long nr_pages;
>  
>  	addr = PAGE_ALIGN_DOWN((unsigned long) object);
> -	vn = addr_to_node(addr);
>  
> -	if (!spin_trylock(&vn->busy.lock))
> -		return false;
> +	/*
> +	 * A vmalloc allocation may span multiple vmap zones, so the
> +	 * node whose rb-tree holds the VA may differ from the node
> +	 * the address maps to.  Search all nodes.  Use trylock as
> +	 * this function can be called from atomic dump contexts.
> +	 */
> +	va = NULL;
> +	for_each_vmap_node(vn) {
> +		if (!spin_trylock(&vn->busy.lock))
> +			continue;
> +
> +		va = __find_vmap_area(addr, &vn->busy.root);
> +		if (va && va->vm)
> +			break;
>  
> -	va = __find_vmap_area(addr, &vn->busy.root);
> -	if (!va || !va->vm) {
>  		spin_unlock(&vn->busy.lock);
> -		return false;
> +		va = NULL;
>  	}
>  
> +	if (!va)
> +		return false;
> +
>  	vm = va->vm;
>  	addr = (unsigned long) vm->addr;
>  	caller = vm->caller;
> 
> -- 
> 2.25.1
> 

diff --git a/mm/vmalloc.c b/mm/vmalloc.c
index 89c327a6ce7d..3719dc02dcaf 100644
--- a/mm/vmalloc.c
+++ b/mm/vmalloc.c
@@ -2511,7 +2511,22 @@ static void free_unmap_vmap_area(struct vmap_area *va)
 	free_vmap_area_noflush(va);
 }
 
-struct vmap_area *find_vmap_area(unsigned long addr)
+static inline int next_vmap_node_id(int i)
+{
+	return (i + nr_vmap_nodes - 1) % nr_vmap_nodes;
+}
+
+enum vmap_lock_mode {
+	VMAP_LOCK,
+	VMAP_TRYLOCK,
+};
+
+/*
+ * Add a comment here.
+ */
+static struct vmap_area *
+find_vmap_area_lock(unsigned long addr, struct vmap_node **locked_vn,
+		enum vmap_lock_mode mode)
 {
 	struct vmap_node *vn;
 	struct vmap_area *va;
@@ -2534,16 +2549,40 @@ struct vmap_area *find_vmap_area(unsigned long addr)
 	 * addr is within 2 or 0 nodes we should do extra work.
 	 */
 	i = j = addr_to_node_id(addr);
+
 	do {
 		vn = &vmap_nodes[i];
 
-		spin_lock(&vn->busy.lock);
+		if (mode == VMAP_LOCK) {
+			spin_lock(&vn->busy.lock);
+		} else {
+			if (!spin_trylock(&vn->busy.lock))
+				continue;
+		}
+
 		va = __find_vmap_area(addr, &vn->busy.root);
+		if (va) {
+			*locked_vn = vn;
+			return va;
+		}
+
 		spin_unlock(&vn->busy.lock);
+	} while ((i = next_vmap_node_id(i)) != j);
 
-		if (va)
-			return va;
-	} while ((i = (i + nr_vmap_nodes - 1) % nr_vmap_nodes) != j);
+	*locked_vn = NULL;
+	return NULL;
+}
+
+struct vmap_area *find_vmap_area(unsigned long addr)
+{
+	struct vmap_node *vn;
+	struct vmap_area *va;
+
+	va = find_vmap_area_lock(addr, &vn, VMAP_LOCK);
+	if (va) {
+		spin_unlock(&vn->busy.lock);
+		return va;
+	}
 
 	return NULL;
 }


and we use the helper in the vmalloc_dump_obj()?

--
Uladzislau Rezki

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
