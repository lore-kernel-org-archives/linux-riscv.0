Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82640D6ACD9
	for <linux-riscv@archiver.kernel.org>; Wed, 27 Nov 2024 14:03:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+ZkrDFVMG7J3V9QC2idIeOXt3n63+k1Evnstw4GsNbc=; b=DIxr/aV3r4t707
	hudGr2tdlqkMkpmXQxMi5WqD72KbA8r6DB00nr+bNu8nbUaKqhIXkLJE4YgZiR6xWuxNUqvqQtukn
	fZt/HvDfVW8EZ7VhI9UuFRtywuC8T7ukt/j+E3431Vo3vpbSjylhkhtXS8OSz60COCexHUqfRkHd3
	2EesWXHmJ4Lvog08sNanh4vfxChiJyLJMQHoQynlqU0In6v6oXjUQ+Q4BvudSLwWb9Oj6DtwyZt9W
	cgCFx7b/RTUoYTcUZHU7zxauhQnQl35pGaoVC68xN0pO+KjN7G7SMhWNfvh/ntDbTJgYY/b//Po0I
	lWsI2Qgue2BkRXmedKWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tGId1-0000000DKPo-3ue3;
	Wed, 27 Nov 2024 14:02:51 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tGIcz-0000000DKPM-1TmE
	for linux-riscv@lists.infradead.org;
	Wed, 27 Nov 2024 14:02:50 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-434a1fe2b43so24609875e9.2
        for <linux-riscv@lists.infradead.org>; Wed, 27 Nov 2024 06:02:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1732716167; x=1733320967; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=HHoVh6bdQ+49A7HwWA2MZyeijxPsG/IR+pS2oskUYMg=;
        b=JaN9mQH2GwQPzVn5BgDLdUwFgDs0ueGcgt2kYT2huxxeInXrKkBDLf8trFQUuNl0gG
         1pjLw2sYGX14pLIaNk/+bxHC3grndI8S5KvzDQZYfzUYL4CmUcyIZksLFsoi7Fu5Qtnn
         yZfIcZN8T5kEbPBVdZQvcdaJJkLG/wJ/vRqnGQfJ8Jem9D8lViWTwYX6zvs/fdM9o0oc
         9vV4kVOE+vLa8GQJuVBy8GmUhfDR5vo8KtNRogJEbzcr1gt4w/QiK/ArznpWP1POzb/y
         DsvLb9mCSOj8AHk3PkgG0bYAIbrlbK29RSscbrxGR1gjFclLBN6w+kqcLJyuA6Dm3YbN
         edBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732716167; x=1733320967;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HHoVh6bdQ+49A7HwWA2MZyeijxPsG/IR+pS2oskUYMg=;
        b=tMaITMt5nyFNAUiDFDF+yJju2cmogKPoX+Y2t799phSRz987J823nG2uZL4f/LdR2g
         Ru+xQa3/qBZ/dxrpUDZU5Oli2QeJRo1G9fV5+bBj/wNeUKQhZNZXg4pG3MfE8lBIgi5E
         PE0vmZcBE5jexGqify/lAsL71uyfvE8nDU3pnem1tSQ3E7P3M4L1n87Z1jZuRP30/bug
         MXbukLROCnuHfNGoRTEMGCTsSE1v++q724gPq+tG3vvE4LSEiyXgOeTmX5t9fCAsF/i1
         7bG6+RnmDtmgTyeeE7Vb9L8lDZa4RJjccG1V49YKF5SW2aA/xkcV2iVNCVotHnKJX4bl
         DhCQ==
X-Forwarded-Encrypted: i=1; AJvYcCX/SDkZC6efXg76fUrk7fNvMYsNnmhraTyCpIYr012NcuI/etfOl3FT674wVjFwhY08+guZ/RFppMqgsg==@lists.infradead.org
X-Gm-Message-State: AOJu0YwyNq3f3kWnRjgpZTU90kZIWEy25gdmsIBmV3Z4XacqrUZBWCaW
	eJYiSluoi6JYebbCeDe0aTLtS/oar+Cn957dhgOBnIdwrMcEfyvaacY5OKUCRe4=
X-Gm-Gg: ASbGncvwU12JJuHOvGg6oyjIDPM5dl1Rjvm0wZrkra+kY8yyyKcdFkd0avgv+szpq2l
	Ew1dBLisvOE4bhTxCoyVJ+aPAVq89BVLwB9t5jyV7QIwCyOSBzlYVJpYoS2qS4izBJyhNu1us8k
	ZDl1DF1DH6lw0hg/Zs9Wx3qJw5SuCRc8TEY+yohaHQNuXDj/IamYXbTtVzu97EEDau0GckPgKmA
	TLXRvanZ/XD4dQKinHo7lMEbYttl0z+3Yk+k9l+tK5wITv0IdUg77u+LDFwW9sbEglZwMSDa38Y
	bH0zwfkTuMVxp10N92csTnIL977sk/4h7ls=
X-Google-Smtp-Source: AGHT+IFe1fSW20TaAbPYl6Y04HjqEdbDAiCLB5PflXpOVEcCMA7NIYGVv9p91IM/S4pid4RHtdLlvA==
X-Received: by 2002:a05:600c:3b24:b0:434:a75b:5f59 with SMTP id 5b1f17b1804b1-434a9dbb06cmr33861275e9.3.1732716156911;
        Wed, 27 Nov 2024 06:02:36 -0800 (PST)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-434aa763a59sm22192305e9.11.2024.11.27.06.02.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Nov 2024 06:02:36 -0800 (PST)
Date: Wed, 27 Nov 2024 15:02:35 +0100
From: Andrew Jones <ajones@ventanamicro.com>
To: =?utf-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Charlie Jenkins <charlie@rivosinc.com>, zhangkai@iscas.ac.cn
Subject: Re: [PATCH] riscv: module: use a plain variable for list_head
 instead of a pointer
Message-ID: <20241127-2c074e38cc599c7e2d0da505@orel>
References: <20241127103016.2699179-1-cleger@rivosinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20241127103016.2699179-1-cleger@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241127_060249_394866_F235B13E 
X-CRM114-Status: GOOD (  22.23  )
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

On Wed, Nov 27, 2024 at 11:30:14AM +0100, Cl=E9ment L=E9ger wrote:
> list_head does not need to be allocated, it can be a plain variable.

rel_head's list_head member, rel_entry, doesn't need to be allocated,
its storage can just be part of the allocated rel_head.

> Remove the pointer which allows to get rid of the allocation as well as
> an existing memory leak.

It'd be nice to add how the memory leak was found. Inspection or some
tool?

> =

> Signed-off-by: Cl=E9ment L=E9ger <cleger@rivosinc.com>
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

>

Other than the commit message change suggestions,

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
