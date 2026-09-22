Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67285C982FF
	for <linux-riscv@archiver.kernel.org>; Tue, 22 Sep 2026 12:17:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wPvsLcliqRAqQYX57fqKQjvMpRQdiSdBrvgKd1RQb1A=; b=u0xoUb3oVW3f7t
	yCtZVDhzKWRFj6tYgCTP7pSm97bmWSET2GG5G/3ukciNZOEQMTkqKewE/eADUF7f49TxStQGON0ZH
	5lBIyQZC5cydDl0RD9+/znknDEoU9ouki1UXFuGHKsJ60Cwwuqa06xouJoc0h08/08R4cWLcnED49
	uWI4xV//PdMgrPZQHRffghEWeD7ublJKRANGAYCcJ3G8bYlPleNw8S6IdMpaQJoU8A8gahv8nLRZx
	BM2z2OSJjfX3pT+duH3Dd9ZPumkff4DN6jVVBR/nSRyb2ZHX7PrPjaW/RHPO75tPfghH8BCSg8uTU
	Op9WwIWX5AN5ToHM/XWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8zQr-00000005HnS-3xxw;
	Tue, 22 Sep 2026 12:17:09 +0000
Received: from mail-ej2-x10.google.com ([2a00:1450:4864:34::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8zQp-00000005Hmb-18u4
	for linux-riscv@lists.infradead.org;
	Tue, 22 Sep 2026 12:17:08 +0000
Received: by mail-ej2-x10.google.com with SMTP id a640c23a62f3a-c254fa650c8so592918066b.0
        for <linux-riscv@lists.infradead.org>; Tue, 22 Sep 2026 05:17:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790079425; x=1790684225; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:date:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=UgtWhH7fN1wZ1neVmdj/h2QBFjKH8NY7ifeQrzN/T4U=;
        b=rQ9K5DTao3DAv8tDjKuRvYJl09JBcQzyxuNG7vznjRtULLiEz/LwxPb6TxJvyKSc2w
         YOSrm1OeSOR2VV5y5dg4pIv+jMFLcSOduJhqgX4ow61cWgoaN182ogSei6rmp0CQlQzX
         STjTC5h9ceHfm3SHBI8rQ66m45MdVUn+x8Gu7abVfAxd5eGN5j7rcn3E8s4MfiPQQPqs
         APSs8m9QxLIjgiMVJFBdOthBYdqKWom6L6S13IOL8SPz74Zx8YcxOVmXqitNTORJHEQX
         zDoAykl5pZLGAPJfUzDrBvhQ2pAYNg9JnDlbd0dMgJbdP+iFkZXEi1CRq0dPtntz1dRF
         EIJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790079425; x=1790684225;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UgtWhH7fN1wZ1neVmdj/h2QBFjKH8NY7ifeQrzN/T4U=;
        b=wWrOhMdBozLD3sDxW+omCzMsXOUZbgbgNoZUarr14POlgbQP6m5E4nnwRZ2pFYwarl
         uLbW5Ftr0Wsa/0ji81kuwzz1B7bZURQyFlqxTIskUIG2VM6Ijx3XLiOWLsI+lU6ZaJth
         lYO/TmG30lhKiZ/kXe4jotF/5nHGble/MXNvNhkDggpIv2U2cPg+Ev80OepYy5Knxech
         LzljXX5N+vrHrx8LfQ9WP5i1IBtB3ZhlKip6eHZIVMMfljxSWQYKseFjx/fi+r/lq2Kb
         iTkZsh3ei/dWptRlRNMByantk2J8gwASj7FG3KeifZNzcfkfDTNSxfPaFacFPaeMoPaA
         4kLg==
X-Forwarded-Encrypted: i=1; AKwUvBx/71rym1TiTtqzBT2eaNimTS/HOh7SCsyBkTCzUH9R79En9MNUD7v9x3PdNZisHN0F12Gqr4tA4KaVZg==@lists.infradead.org
X-Gm-Message-State: AFuF++m+27AZKJf9r3Ba6JkDH+jcd628XoU2fHilTZhGVyzI/JNosj1b
	hhgnYvwBAxvcfiQvlNeZZeErULYGGjJxO4Ap80sw4DWFS2Zcytkh2ZK3
X-Gm-Gg: AYBFou3gCaINUbF9YWzg0Lb8PQeNA47ESO1bO+m7iheBKAMWjD/Gd0BYtk/ObPB0uHP
	oJfKMeaIS8YQ7c7JOZ79J1+yoWkjQWxuAIw+qoW+1S1Cm1Q847jOOlkVelBPpwtGn4Yl3pr2akV
	TZn5PgfezuINEMp7fEs5ciJJJCFsnONG9awPLzn0dHZT1zWK6jyn5+ePs217UyYtPU+Q77pschK
	3ZabY5UHoBz7qlwImotv8LmLjnwzOpIeMQvz5r9tTv7+A4ltKcqSJ5vUZhzz+inZACVUTUzk8Dl
	n/cJpGa77glB0JjvUYEMywAU6wYRu2CoF1FBi9pw6VUi9gL1kTljlpT/PrtB/O6+Wvz7pqZsKSS
	PwaxbOfTvzeaUKXRXRfK5G5TyS4LNFXtWyqp5OXuh/Tnqm4WfPhms41D1YOHAtlsB9yHCuUR+or
	CIYcE+NPJMG5E6VeieHP4upP5GbqKR4kT9qdk=
X-Received: by 2002:a17:907:e11c:b0:c27:420b:7c79 with SMTP id a640c23a62f3a-c2a8acf45edmr237310966b.48.1790079425184;
        Tue, 22 Sep 2026 05:17:05 -0700 (PDT)
Received: from milan ([2001:9b1:d5a0:a500::24b])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2a9c5ee0b4sm74104166b.50.2026.09.22.05.17.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 05:17:04 -0700 (PDT)
From: Uladzislau Rezki <urezki@gmail.com>
X-Google-Original-From: Uladzislau Rezki <urezki@milan>
Date: Tue, 22 Sep 2026 14:17:02 +0200
To: Ye Liu <ye.liu@linux.dev>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Uladzislau Rezki <urezki@gmail.com>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	linux-mm@kvack.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org, Ye Liu <liuye@kylinos.cn>
Subject: Re: [PATCH v2 1/3] mm/vmalloc: fix vmalloc_dump_obj address
 alignment for last-page lookups
Message-ID: <arJxvj1vaCeNCisu@milan>
References: <20260921-vmalloc_dump_obj-v2-0-73fceb3ed1c8@linux.dev>
 <20260921-vmalloc_dump_obj-v2-1-73fceb3ed1c8@linux.dev>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260921-vmalloc_dump_obj-v2-1-73fceb3ed1c8@linux.dev>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260922_051707_347214_C9231BF0 
X-CRM114-Status: GOOD (  20.12  )
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

On Mon, Sep 21, 2026 at 09:17:21PM +0800, Ye Liu wrote:
> From: Ye Liu <liuye@kylinos.cn>
> 
> vmalloc_dump_obj() uses PAGE_ALIGN() to normalize the input address
> before looking it up in the per-node busy tree.  PAGE_ALIGN() rounds
> up, which can push an address in the last page of a vmalloc allocation
> to va_end -- outside the [va_start, va_end) range that
> __find_vmap_area() searches.  This causes the lookup to miss the VA
> and return false, degrading diagnostic output in OOM dumps and KASAN
> reports to the less informative "vmalloc memory" fallback.
> 
> The upward alignment can also change the addr_to_node() mapping when
> the page boundary crosses a vmap zone boundary, causing the search to
> hit the wrong node entirely.
> 
> Use PAGE_ALIGN_DOWN() instead, which rounds down to the page
> containing the address.  This keeps the address within the VA range
> and preserves the correct node mapping.
> 
> Signed-off-by: Ye Liu <liuye@kylinos.cn>
> ---
>  mm/vmalloc.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/mm/vmalloc.c b/mm/vmalloc.c
> index 859e6d2d57a3..df42d8a6f058 100644
> --- a/mm/vmalloc.c
> +++ b/mm/vmalloc.c
> @@ -5277,7 +5277,7 @@ bool vmalloc_dump_obj(void *object)
>  	unsigned long addr;
>  	unsigned long nr_pages;
>  
> -	addr = PAGE_ALIGN((unsigned long) object);
> +	addr = PAGE_ALIGN_DOWN((unsigned long) object);
>  	vn = addr_to_node(addr);
>  
>  	if (!spin_trylock(&vn->busy.lock))
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
