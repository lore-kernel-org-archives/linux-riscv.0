Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60B4EC61D97
	for <linux-riscv@archiver.kernel.org>; Wed, 22 Nov 2023 00:04:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LFayBJTrT9bfNpOIGextXRav3lRKXGll+4oxfMdHg0w=; b=hNwI1p7MoVv+BE
	TWYdTeeA7j3sE0pX6SVNtd2GCAfM/JXMSKejevMJcdJ7i2wODN7zCcCaF+EUdV2f4wb4UOTcC8RYH
	Vz7rMB36znxAVp0BG/s9UMpE8dmrODBZ3tPkdDgvfcJBcrfQXAqNuL5pjDOzDhnYqvIyWbxTMTp0h
	SwsJLmIjOIBvADlHx3v140mp+rltxxcvcK5Bt3gKTAAAE3yA7yyD/4ZwHF1cM5U1aXfJVa9XKtipp
	LmeefMKup9w4oZRwDgMwwD/80SBkMSir49K4ROBneTs8N64aBKOtZM155OiRwo/jRPRSr0TA+H/Nq
	9wTUnJ1nePFtB+rpX60A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r5aj7-000J22-0l;
	Wed, 22 Nov 2023 00:04:21 +0000
Received: from mail-io1-xd34.google.com ([2607:f8b0:4864:20::d34])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r5aj3-000J1e-30
	for linux-riscv@lists.infradead.org;
	Wed, 22 Nov 2023 00:04:19 +0000
Received: by mail-io1-xd34.google.com with SMTP id ca18e2360f4ac-7b34c5d7ecdso36944439f.0
        for <linux-riscv@lists.infradead.org>; Tue, 21 Nov 2023 16:04:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1700611456; x=1701216256; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=YxnEhA5aA5H886Dh20wjuh2VkCHKHsh7zbteIbp9JQs=;
        b=Z/er4QddT+Lv4T2N0GPNVLQvbgSCATLgttfs2Czc17hGaXrbmTaVKDkHYHBo0j/u10
         XOvzBQwzkHEQofOpcRvW+cRZ+voqBlbYuqat7HCqLjOXHm9XI6Ti27iSXCqrQLM/K5F1
         NoAJJPWLr+DWP3qb0x2fl66Nau4zh4MKV4EJVTV91a79xq5tE5EQ231ogUDeRDEzmzLr
         tLT2dgGauMro6bmZP6WSSu2SLF6yOBefO7PpvZnKdvcbEu+P6myhnK6eXUn98iPdBraK
         nH7ReB26dk79Kxl1F/n+dfxKeINj/kv5ToMs/9qHDBOw2xHnmvyg0IvZqoFwBhQFKQcr
         MN4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700611456; x=1701216256;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YxnEhA5aA5H886Dh20wjuh2VkCHKHsh7zbteIbp9JQs=;
        b=NZuDL4xEFWDKLMa/6IycaZvJ6fY3KQSSci83SXOqpL5uVIEhMUN+FfuW5Hw1b2Em9r
         Yr5878DnrkdPw9ioHLytdZxJjM/DmE5Ptn3c5Pn2/3lGoobA5zRqHdeYvtGkIcfXv3z8
         5tUu1/Dj6oc3UGZ/diyMxQ9Fvw2WnS/4A9letEwV81otIA3gNYsQKZ3Ilh4BgEyo4oFk
         i6/X/1FlvoDLf4mVti5S83uD3t0DxbN9BoFEPLk4kRj3ZIuElJgIM8GawrNR09LEnmO9
         c7gZ9M39mMfwbiFVGTBMz8+cC6z89ubRblxnsT3vyPW4BUZy/TxvFbGR5s+Ax1A7+0n3
         RaeA==
X-Gm-Message-State: AOJu0YxdnnvIHkV5WDwonBmXgi50eeW/jjoB6h1lqz5xL6BSMiqK3jWN
	sHk/9xwq+vw7CRhMojH82THnoA==
X-Google-Smtp-Source: AGHT+IF3L6i08gq79HwdT/CJapPzwIdJlqIeGTxSczW/uOWMiWv7/ReRMNa5E6ZsD+kWJ0dhq/RV/w==
X-Received: by 2002:a05:6e02:1c84:b0:350:f51b:c32e with SMTP id w4-20020a056e021c8400b00350f51bc32emr672908ill.16.1700611456144;
        Tue, 21 Nov 2023 16:04:16 -0800 (PST)
Received: from ?IPV6:2605:a601:adae:4500:9465:402f:4b0a:1116? ([2605:a601:adae:4500:9465:402f:4b0a:1116])
        by smtp.gmail.com with ESMTPSA id a7-20020a92d107000000b00357409c4e57sm3498048ilb.44.2023.11.21.16.04.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Nov 2023 16:04:15 -0800 (PST)
Message-ID: <43359fc7-957a-4f48-a1d4-fffee238463a@sifive.com>
Date: Tue, 21 Nov 2023 18:04:14 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] riscv: Safely remove entries from relocation list
Content-Language: en-US
To: Charlie Jenkins <charlie@rivosinc.com>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Ron Economos <re@w6rz.net>
References: <20231121-module_linking_freeing-v2-1-974bfcd3664e@rivosinc.com>
From: Samuel Holland <samuel.holland@sifive.com>
In-Reply-To: <20231121-module_linking_freeing-v2-1-974bfcd3664e@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231121_160417_975532_7CE3BD5C 
X-CRM114-Status: GOOD (  24.82  )
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

Hi Charlie,

On 2023-11-21 4:50 PM, Charlie Jenkins wrote:
> Use the safe versions of list and hlist iteration to safely remove
> entries from the module relocation lists. To allow mutliple threads to
> load modules concurrently, move relocation list pointers onto the stack
> rather than using global variables.
> 
> Fixes: 8fd6c5142395 ("riscv: Add remaining module relocations")
> Reported-by: Ron Economos <re@w6rz.net>
> Closes: https://lore.kernel.org/linux-riscv/444de86a-7e7c-4de7-5d1d-c1c40eefa4ba@w6rz.net
> Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
> ---
> Changes in v2:
> - Support linking modules concurrently across threads.
> - Link to v1: https://lore.kernel.org/r/20231120-module_linking_freeing-v1-1-fff81d7289fc@rivosinc.com
> ---
>  arch/riscv/kernel/module.c | 76 +++++++++++++++++++++++++++++++---------------
>  1 file changed, 51 insertions(+), 25 deletions(-)
> 
> diff --git a/arch/riscv/kernel/module.c b/arch/riscv/kernel/module.c
> index 56a8c78e9e21..f53e82b70dff 100644
> --- a/arch/riscv/kernel/module.c
> +++ b/arch/riscv/kernel/module.c
> @@ -40,14 +40,17 @@ struct relocation_handlers {
>  				  long buffer);
>  };
>  
> -unsigned int initialize_relocation_hashtable(unsigned int num_relocations);
> -void process_accumulated_relocations(struct module *me);
> +unsigned int
> +initialize_relocation_hashtable(unsigned int num_relocations,
> +				struct hlist_head **relocation_hashtable,
> +				struct list_head *used_buckets_list);
> +void process_accumulated_relocations(struct module *me,
> +				     struct hlist_head **relocation_hashtable,
> +				     struct list_head *used_buckets_list);
>  int add_relocation_to_accumulate(struct module *me, int type, void *location,
> -				 unsigned int hashtable_bits, Elf_Addr v);
> -
> -struct hlist_head *relocation_hashtable;
> -
> -struct list_head used_buckets_list;

This hunk conflicts with your other patch, which is still needed for the __le16
change. Since they are both fixes, do you intend to rebase and send them together?

> +				 unsigned int hashtable_bits, Elf_Addr v,
> +				struct hlist_head **relocation_hashtable,
> +				struct list_head *used_buckets_list);

minor: the indentation is off by one here.

>  
>  /*
>   * The auipc+jalr instruction pair can reach any PC-relative offset
> @@ -604,7 +607,9 @@ static const struct relocation_handlers reloc_handlers[] = {
>  	/* 192-255 nonstandard ABI extensions  */
>  };
>  
> -void process_accumulated_relocations(struct module *me)
> +void process_accumulated_relocations(struct module *me,
> +				     struct hlist_head **relocation_hashtable,

You only need the double pointer in initialize_relocation_hashtable(). If you
pass the single pointer here and in add_relocation_to_accumulate(), you can
avoid the extra dereference operations.

> +				     struct list_head *used_buckets_list)
>  {
>  	/*
>  	 * Only ADD/SUB/SET/ULEB128 should end up here.
> @@ -624,18 +629,25 @@ void process_accumulated_relocations(struct module *me)
>  	 *	- Each relocation entry for a location address
>  	 */
>  	struct used_bucket *bucket_iter;
> +	struct used_bucket *bucket_iter_tmp;
>  	struct relocation_head *rel_head_iter;
> +	struct hlist_node *rel_head_iter_tmp;
>  	struct relocation_entry *rel_entry_iter;
> +	struct relocation_entry *rel_entry_iter_tmp;
>  	int curr_type;
>  	void *location;
>  	long buffer;
>  
> -	list_for_each_entry(bucket_iter, &used_buckets_list, head) {
> -		hlist_for_each_entry(rel_head_iter, bucket_iter->bucket, node) {
> +	list_for_each_entry_safe(bucket_iter, bucket_iter_tmp,
> +				 used_buckets_list, head) {
> +		hlist_for_each_entry_safe(rel_head_iter, rel_head_iter_tmp,
> +					  bucket_iter->bucket, node) {
>  			buffer = 0;
>  			location = rel_head_iter->location;
> -			list_for_each_entry(rel_entry_iter,
> -					    rel_head_iter->rel_entry, head) {
> +			list_for_each_entry_safe(rel_entry_iter,
> +						 rel_entry_iter_tmp,
> +						 rel_head_iter->rel_entry,
> +						 head) {
>  				curr_type = rel_entry_iter->type;
>  				reloc_handlers[curr_type].reloc_handler(
>  					me, &buffer, rel_entry_iter->value);
> @@ -648,11 +660,13 @@ void process_accumulated_relocations(struct module *me)
>  		kfree(bucket_iter);
>  	}
>  
> -	kfree(relocation_hashtable);
> +	kfree(*relocation_hashtable);
>  }
>  
>  int add_relocation_to_accumulate(struct module *me, int type, void *location,
> -				 unsigned int hashtable_bits, Elf_Addr v)
> +				 unsigned int hashtable_bits, Elf_Addr v,
> +				struct hlist_head **relocation_hashtable,
> +				struct list_head *used_buckets_list)
>  {
>  	struct relocation_entry *entry;
>  	struct relocation_head *rel_head;
> @@ -667,7 +681,7 @@ int add_relocation_to_accumulate(struct module *me, int type, void *location,
>  
>  	hash = hash_min((uintptr_t)location, hashtable_bits);
>  
> -	current_head = &relocation_hashtable[hash];
> +	current_head = &((*relocation_hashtable)[hash]);
>  
>  	/* Find matching location (if any) */
>  	bool found = false;
> @@ -693,7 +707,7 @@ int add_relocation_to_accumulate(struct module *me, int type, void *location,
>  				kmalloc(sizeof(struct used_bucket), GFP_KERNEL);
>  			INIT_LIST_HEAD(&bucket->head);
>  			bucket->bucket = current_head;
> -			list_add(&bucket->head, &used_buckets_list);
> +			list_add(&bucket->head, used_buckets_list);
>  		}
>  		hlist_add_head(&rel_head->node, current_head);
>  	}
> @@ -704,7 +718,10 @@ int add_relocation_to_accumulate(struct module *me, int type, void *location,
>  	return 0;
>  }
>  
> -unsigned int initialize_relocation_hashtable(unsigned int num_relocations)
> +unsigned int
> +initialize_relocation_hashtable(unsigned int num_relocations,
> +				struct hlist_head **relocation_hashtable,
> +				struct list_head *used_buckets_list)
>  {
>  	/* Can safely assume that bits is not greater than sizeof(long) */
>  	unsigned long hashtable_size = roundup_pow_of_two(num_relocations);
> @@ -720,12 +737,12 @@ unsigned int initialize_relocation_hashtable(unsigned int num_relocations)
>  
>  	hashtable_size <<= should_double_size;
>  
> -	relocation_hashtable = kmalloc_array(hashtable_size,
> -					     sizeof(*relocation_hashtable),
> -					     GFP_KERNEL);
> -	__hash_init(relocation_hashtable, hashtable_size);
> +	*relocation_hashtable = kmalloc_array(hashtable_size,
> +					      sizeof(*relocation_hashtable),
> +					      GFP_KERNEL);

You need to check for allocation failure here and inside
add_relocation_to_accumulate(). Module loading under memory pressure is a
reasonably likely scenario.

> +	__hash_init(*relocation_hashtable, hashtable_size);
>  
> -	INIT_LIST_HEAD(&used_buckets_list);
> +	INIT_LIST_HEAD(used_buckets_list);

This is the only place used_buckets_list is used in this function. If you move
this line out to apply_relocate_add, you can drop the parameter.

Regards,
Samuel

>  
>  	return hashtable_bits;
>  }
> @@ -742,7 +759,13 @@ int apply_relocate_add(Elf_Shdr *sechdrs, const char *strtab,
>  	Elf_Addr v;
>  	int res;
>  	unsigned int num_relocations = sechdrs[relsec].sh_size / sizeof(*rel);
> -	unsigned int hashtable_bits = initialize_relocation_hashtable(num_relocations);
> +	struct hlist_head *relocation_hashtable;
> +	struct list_head used_buckets_list;
> +	unsigned int hashtable_bits;
> +
> +	hashtable_bits = initialize_relocation_hashtable(num_relocations,
> +							 &relocation_hashtable,
> +							 &used_buckets_list);
>  
>  	pr_debug("Applying relocate section %u to %u\n", relsec,
>  	       sechdrs[relsec].sh_info);
> @@ -823,14 +846,17 @@ int apply_relocate_add(Elf_Shdr *sechdrs, const char *strtab,
>  		}
>  
>  		if (reloc_handlers[type].accumulate_handler)
> -			res = add_relocation_to_accumulate(me, type, location, hashtable_bits, v);
> +			res = add_relocation_to_accumulate(
> +				me, type, location, hashtable_bits, v,
> +				&relocation_hashtable, &used_buckets_list);
>  		else
>  			res = handler(me, location, v);
>  		if (res)
>  			return res;
>  	}
>  
> -	process_accumulated_relocations(me);
> +	process_accumulated_relocations(me, &relocation_hashtable,
> +					&used_buckets_list);
>  
>  	return 0;
>  }
> 
> ---
> base-commit: 98b1cc82c4affc16f5598d4fa14b1858671b2263
> change-id: 20231120-module_linking_freeing-2b5a3b255b5e


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
