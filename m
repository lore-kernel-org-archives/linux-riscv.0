Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F9ACD6D227
	for <linux-riscv@archiver.kernel.org>; Wed, 27 Nov 2024 19:18:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ixda70/nLHNWGx0Y/DQ9CbNyFtduMeE5KDIFk0MrIvA=; b=TGTV09DeV4H7if
	T9ttAYMg7rDE2noHp14Gdn2bIyoJJ2x3M98cgxaXr2CWe4JXXBZcE1xcA7/P2WDWf5sdvahuRtiqA
	x3sBkAZNiCIc5NUpmM+7jLH7/lsKQ5TDxLhCe+JBtiSflmrrvzB8f4oNmCP/Cnz5/3ncIAKBW4Z3p
	aGykwa/IyUtvENWCRVAMOcwxt+ognt4Yu7o0mDpXhFIIlmbSoJIxQJqVB0Qg6t7GzseDQgch34+gf
	1JTtOQk4BK1vjeJpzlvr80PHvGM2oYmQdI0hFtdtH6sAM3zXnEUaZU3AIJ+XwPpCue4r63oSYLxE6
	2YGCe91yZp6/+rw20Fxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tGNYd-0000000Dula-0x9O;
	Wed, 27 Nov 2024 19:18:39 +0000
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tGNYb-0000000Dukq-0DVl
	for linux-riscv@lists.infradead.org;
	Wed, 27 Nov 2024 19:18:38 +0000
Received: by mail-pj1-x102d.google.com with SMTP id 98e67ed59e1d1-2ea1e5fc65bso94694a91.3
        for <linux-riscv@lists.infradead.org>; Wed, 27 Nov 2024 11:18:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1732735116; x=1733339916; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=vB7+zX/eMQEZVkQdJuvLGtE/WTXbmTPbcZWyGfuE/hw=;
        b=iGgS+frmnCJkcDo+Q8sbEPka4B6vy9rpnEm4wnELHiUxH01S13IecW5x2w8i/3YBJS
         T08dcciVHe4cdy2qfogRce0kvlPQC/GV4vHArh/Q3smTkQenKdKETwzR+KUEzTUEKQbN
         ssweY18E/LbyKDaiFr+o+PRQ/wbuNgSg93sliSat2nM08YCq/Ad9E5f3DFXnSndCxOie
         ICwpzDZ42q1HckI0H/uZ8fDHcTWkKbPJOWN3yXkk/LEMeJchGUPzoTvxmC8LGFFTI5+Q
         PQqAbRSxAxc9AtZdLf9OEyRNBeBN/dse1a7U3Z3bsScZJKlzwdl69st9nOJ1WtlCcDiR
         mo8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732735116; x=1733339916;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vB7+zX/eMQEZVkQdJuvLGtE/WTXbmTPbcZWyGfuE/hw=;
        b=THgRRc7Mjk5g0T3eo4Lpy2Ojdfl1vwHknY2PxQLybPam4HDUe5huaXRUgUJMOQ2ULz
         v+xkDbAo3ckYzC9HFmFe+XMZF9R9aZMjjNnkYirCufEQ72s8Er9SsElrMHR5Ks/sMYvz
         T0Q3XWBdnAws7ADOQcf2xCm5Et2aNpRTPnVRucWAcTGhJiVDoDzuLVukHx21lDpjSIDl
         LJBupI75UbhqKCMB1hPTSAZiyKXj352Bo1hsVeR9vBQepQ/KuExn9YdXtBcrXEePXs4u
         d6RYVaWfPPlnZzHFWtQrn79G+jIYfegnm4haHZira4UyS3F2J8svuO+WATYrLDSarbcO
         LzuA==
X-Forwarded-Encrypted: i=1; AJvYcCUOm1Fg4/DSKiLbQFFTeEASk1x0PpkwvpG4EgrdWWf7xWL4ED2WGa429z9xJVB6kHyqzuoVy8TMhuPenA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yyaj6ICLqVzQXvJCql/zF6GiC9zEaPUFsfmo1M/iR6bw1T2oU3O
	sHEtNWOD+XckpCbjtkP8kovLaW/3WcCwLhr3Hy3cf9l0pAqpuQH6H3+3IZ00LRE=
X-Gm-Gg: ASbGncuS5LkZc699B3a3mW9+3YvplN2Kmh/o5SHUfiPUtamAB/bPfAcMnA58uxLi+Fc
	cfaVdF+6jkEWJmr/TncnWQAoyDixuPG7K/zrwg7ht7KTT4Bodu3WK7p7eLchWhIffSAo8nIa0F+
	HmRh7Va+985JYVVFPBqty12fzE23k7vW3/ClvUihXv+UElFNZm15ghWBBggsRDKd6IBXMATHfGT
	o6bUZi41/yh7IDhbtSbwDnUIsRxHmpsNcm47KGDKXo=
X-Google-Smtp-Source: AGHT+IGwVibQFz/HfTnBYJFj3BlQooBTbScjEPx6pkFCrKgYZmTcrR9P+ao05cm4glAwREsdCh+uFQ==
X-Received: by 2002:a17:90b:4d0d:b0:2eb:140d:f6df with SMTP id 98e67ed59e1d1-2ee08e9bd21mr5224356a91.1.1732735115685;
        Wed, 27 Nov 2024 11:18:35 -0800 (PST)
Received: from ghost ([2601:647:6700:64d0:1259:e59d:e348:e0])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2ee0fa33374sm1960698a91.4.2024.11.27.11.18.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Nov 2024 11:18:35 -0800 (PST)
Date: Wed, 27 Nov 2024 11:18:32 -0800
From: Charlie Jenkins <charlie@rivosinc.com>
To: =?iso-8859-1?Q?Cl=E9ment_L=E9ger?= <cleger@rivosinc.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org, Kai Zhang <zhangkai@iscas.ac.cn>,
	Andrew Jones <ajones@ventanamicro.com>
Subject: Re: [PATCH v2] riscv: module: use a plain variable for list_head
 instead of a pointer
Message-ID: <Z0dwiIUThatX1H_X@ghost>
References: <20241127142519.3038691-1-cleger@rivosinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20241127142519.3038691-1-cleger@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241127_111837_351605_205EE5CE 
X-CRM114-Status: GOOD (  19.45  )
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Wed, Nov 27, 2024 at 03:25:17PM +0100, Cl=E9ment L=E9ger wrote:
> rel_head's list_head member, rel_entry, doesn't need to be allocated,
> its storage can just be part of the allocated rel_head. Remove the
> pointer which allows to get rid of the allocation as well as an existing
> memory leak found by Kai Zang using kmemleak.
> =

> Reported-by: Kai Zhang <zhangkai@iscas.ac.cn>
> Signed-off-by: Cl=E9ment L=E9ger <cleger@rivosinc.com>
> Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

Thanks for looking into this!

Reviewed-by: Charlie Jenkins <charlie@rivosinc.com>
Tested-by: Charlie Jenkins <charlie@rivosinc.com>

> ---
> =

> V2:
>  - Add Kai Reported-by
>  - Reword the commit description (Andrew)
> =

> ---
>  arch/riscv/kernel/module.c | 18 ++++--------------
>  1 file changed, 4 insertions(+), 14 deletions(-)
> =

> diff --git a/arch/riscv/kernel/module.c b/arch/riscv/kernel/module.c
> index 1cd461f3d872..47d0ebeec93c 100644
> --- a/arch/riscv/kernel/module.c
> +++ b/arch/riscv/kernel/module.c
> @@ -23,7 +23,7 @@ struct used_bucket {
>  =

>  struct relocation_head {
>  	struct hlist_node node;
> -	struct list_head *rel_entry;
> +	struct list_head rel_entry;
>  	void *location;
>  };
>  =

> @@ -634,7 +634,7 @@ process_accumulated_relocations(struct module *me,
>  			location =3D rel_head_iter->location;
>  			list_for_each_entry_safe(rel_entry_iter,
>  						 rel_entry_iter_tmp,
> -						 rel_head_iter->rel_entry,
> +						 &rel_head_iter->rel_entry,
>  						 head) {
>  				curr_type =3D rel_entry_iter->type;
>  				reloc_handlers[curr_type].reloc_handler(
> @@ -704,16 +704,7 @@ static int add_relocation_to_accumulate(struct modul=
e *me, int type,
>  			return -ENOMEM;
>  		}
>  =

> -		rel_head->rel_entry =3D
> -			kmalloc(sizeof(struct list_head), GFP_KERNEL);
> -
> -		if (!rel_head->rel_entry) {
> -			kfree(entry);
> -			kfree(rel_head);
> -			return -ENOMEM;
> -		}
> -
> -		INIT_LIST_HEAD(rel_head->rel_entry);
> +		INIT_LIST_HEAD(&rel_head->rel_entry);
>  		rel_head->location =3D location;
>  		INIT_HLIST_NODE(&rel_head->node);
>  		if (!current_head->first) {
> @@ -722,7 +713,6 @@ static int add_relocation_to_accumulate(struct module=
 *me, int type,
>  =

>  			if (!bucket) {
>  				kfree(entry);
> -				kfree(rel_head->rel_entry);
>  				kfree(rel_head);
>  				return -ENOMEM;
>  			}
> @@ -735,7 +725,7 @@ static int add_relocation_to_accumulate(struct module=
 *me, int type,
>  	}
>  =

>  	/* Add relocation to head of discovered rel_head */
> -	list_add_tail(&entry->head, rel_head->rel_entry);
> +	list_add_tail(&entry->head, &rel_head->rel_entry);
>  =

>  	return 0;
>  }
> -- =

> 2.45.2
> =


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
