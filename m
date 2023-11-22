Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88AB1C61D92
	for <linux-riscv@archiver.kernel.org>; Wed, 22 Nov 2023 03:41:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Jh3F0lhi34WachgWS+sOAsWd71NUntE1HVhPfQ6AYO8=; b=XTsGlgxm7WY7CJ
	fiUUXr46aPLRC7M3Yy1/cDAANKrBLo1OCdD/djJ3lNGsA25cPNTGsJEXNXqA/qYQHgEbG70FQGAgy
	rI2qy75TQxdr00aZL5AS4YS+d0YcOvEIDVhgMzuKNIG94G589jqNyam+UeBYn4221FASqB7LJpMNr
	EknRjlpQAD0FjvX0CL4IPnXKsNk73Bqj374fyGol5+R6Vs8BENak/JEsZehJ7WghZXZW/I+SJBAbP
	ZrkfxwxtwVTdNHjZYpwABFY15wtg6xrC3QKlSPgxm+G+oUNwuV+/yWuJOnh5U9KPgvT0Lv1OIE8GF
	AGze/oPx5mTtqIS0I1FA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r5e7L-000YqT-0o;
	Wed, 22 Nov 2023 03:41:35 +0000
Received: from mail-oi1-x234.google.com ([2607:f8b0:4864:20::234])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r5e7H-000Yps-18
	for linux-riscv@lists.infradead.org;
	Wed, 22 Nov 2023 03:41:33 +0000
Received: by mail-oi1-x234.google.com with SMTP id 5614622812f47-3b6ce6fac81so3821983b6e.1
        for <linux-riscv@lists.infradead.org>; Tue, 21 Nov 2023 19:41:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1700624490; x=1701229290; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=lTFMml4INEv5C+irajH43nV2pQy7Qcw7rpWXL+qKufA=;
        b=Xm777OemHqKBuHSVFu2ggmjI0ao2MTJruMEmXNjuY+kEcdYJJqMQIfqwlMabIX9lqB
         PLJeJ71LXfNk06mHiSHgPHYvZq1TkEBS2O7GK+qbqmz+RIsYUw+ToFjBoibDs6tyiyTV
         tMqlBg0nZ9dBLtyQNWDDkNn44mg7jiN9nUCXnqxyS+PzNgvbpps28EOJ7S5PLZq6geG/
         FzblUHSKA6imsKzn7ln44PxcOg3HKEXT7ds56RunCZHMFbwwfAmxLlRJQ3VF2l4+ImQ3
         R9jyInmaEEKwysvGGtcAC2A3dNZRFhQWCjwfQ2oQJcD3uIpEAhjSf71ze9K2iUNL/Q+i
         A0Tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700624490; x=1701229290;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lTFMml4INEv5C+irajH43nV2pQy7Qcw7rpWXL+qKufA=;
        b=Ceuog6mN8o9yg8bVnloSPi6pho9A258fGH3wOBcMo2Li4lsDCVb68rqK28ZWOT2bxJ
         NnpdY0JMi3ov+PnvWn+mN5tT2idk1JOnQmlnCZRRNuUuOzyGcpqrvTsm9crhZr2vHJBf
         5g+eGZWXC74QW70F+GRFAiG4IUnPZQ3TB1K2IYMfoP0vQGN0OZ1iOGgQLzvJHtGAEpur
         kBAQbji4sbQRHaJZYrB+d9E61I/ewx1Fb1zk1fd/YdPqEg24pj5LX7HpZNXCtT3t5LdZ
         8/xj4agvQZb1NIZFCPNQuWu1pSny8q+RfImee/Vf/YQdLD5tyBYRQzsFTTBFsm2oZvZ0
         9LSw==
X-Gm-Message-State: AOJu0YyYw5TGBr6Dv7xpgyEnf0OWCm53rc+HnBb/ZwkI1M7/zO2SnpqQ
	moDN4OF3syMJTx3XxK5Uffd8VA==
X-Google-Smtp-Source: AGHT+IFYwkUlZO9Um/1JZYOKR+I/W6wYbdoWHN4/eWoT5eNGGZUVMxGdSjF+fhcJMFLWF6MZ7xLXOg==
X-Received: by 2002:a05:6808:1144:b0:3ae:1675:700e with SMTP id u4-20020a056808114400b003ae1675700emr1892632oiu.36.1700624490176;
        Tue, 21 Nov 2023 19:41:30 -0800 (PST)
Received: from ghost ([65.158.198.2])
        by smtp.gmail.com with ESMTPSA id c19-20020a056808139300b003b83ec68a3dsm66571oiw.4.2023.11.21.19.41.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Nov 2023 19:41:29 -0800 (PST)
Date: Tue, 21 Nov 2023 22:41:26 -0500
From: Charlie Jenkins <charlie@rivosinc.com>
To: Samuel Holland <samuel.holland@sifive.com>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Ron Economos <re@w6rz.net>
Subject: Re: [PATCH v2] riscv: Safely remove entries from relocation list
Message-ID: <ZV14ZrI8pqe9kTH1@ghost>
References: <20231121-module_linking_freeing-v2-1-974bfcd3664e@rivosinc.com>
 <43359fc7-957a-4f48-a1d4-fffee238463a@sifive.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <43359fc7-957a-4f48-a1d4-fffee238463a@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231121_194131_739513_19AE6E99 
X-CRM114-Status: GOOD (  32.30  )
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

On Tue, Nov 21, 2023 at 06:04:14PM -0600, Samuel Holland wrote:
> Hi Charlie,
> 
> On 2023-11-21 4:50 PM, Charlie Jenkins wrote:
> > Use the safe versions of list and hlist iteration to safely remove
> > entries from the module relocation lists. To allow mutliple threads to
> > load modules concurrently, move relocation list pointers onto the stack
> > rather than using global variables.
> > 
> > Fixes: 8fd6c5142395 ("riscv: Add remaining module relocations")
> > Reported-by: Ron Economos <re@w6rz.net>
> > Closes: https://lore.kernel.org/linux-riscv/444de86a-7e7c-4de7-5d1d-c1c40eefa4ba@w6rz.net
> > Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
> > ---
> > Changes in v2:
> > - Support linking modules concurrently across threads.
> > - Link to v1: https://lore.kernel.org/r/20231120-module_linking_freeing-v1-1-fff81d7289fc@rivosinc.com
> > ---
> >  arch/riscv/kernel/module.c | 76 +++++++++++++++++++++++++++++++---------------
> >  1 file changed, 51 insertions(+), 25 deletions(-)
> > 
> > diff --git a/arch/riscv/kernel/module.c b/arch/riscv/kernel/module.c
> > index 56a8c78e9e21..f53e82b70dff 100644
> > --- a/arch/riscv/kernel/module.c
> > +++ b/arch/riscv/kernel/module.c
> > @@ -40,14 +40,17 @@ struct relocation_handlers {
> >  				  long buffer);
> >  };
> >  
> > -unsigned int initialize_relocation_hashtable(unsigned int num_relocations);
> > -void process_accumulated_relocations(struct module *me);
> > +unsigned int
> > +initialize_relocation_hashtable(unsigned int num_relocations,
> > +				struct hlist_head **relocation_hashtable,
> > +				struct list_head *used_buckets_list);
> > +void process_accumulated_relocations(struct module *me,
> > +				     struct hlist_head **relocation_hashtable,
> > +				     struct list_head *used_buckets_list);
> >  int add_relocation_to_accumulate(struct module *me, int type, void *location,
> > -				 unsigned int hashtable_bits, Elf_Addr v);
> > -
> > -struct hlist_head *relocation_hashtable;
> > -
> > -struct list_head used_buckets_list;
> 
> This hunk conflicts with your other patch, which is still needed for the __le16
> change. Since they are both fixes, do you intend to rebase and send them together?

I wasn't sure the best way of doing that. I will bring the __le16 changes into this series.

> 
> > +				 unsigned int hashtable_bits, Elf_Addr v,
> > +				struct hlist_head **relocation_hashtable,
> > +				struct list_head *used_buckets_list);
> 
> minor: the indentation is off by one here.
> 
> >  
> >  /*
> >   * The auipc+jalr instruction pair can reach any PC-relative offset
> > @@ -604,7 +607,9 @@ static const struct relocation_handlers reloc_handlers[] = {
> >  	/* 192-255 nonstandard ABI extensions  */
> >  };
> >  
> > -void process_accumulated_relocations(struct module *me)
> > +void process_accumulated_relocations(struct module *me,
> > +				     struct hlist_head **relocation_hashtable,
> 
> You only need the double pointer in initialize_relocation_hashtable(). If you
> pass the single pointer here and in add_relocation_to_accumulate(), you can
> avoid the extra dereference operations.
> 
> > +				     struct list_head *used_buckets_list)
> >  {
> >  	/*
> >  	 * Only ADD/SUB/SET/ULEB128 should end up here.
> > @@ -624,18 +629,25 @@ void process_accumulated_relocations(struct module *me)
> >  	 *	- Each relocation entry for a location address
> >  	 */
> >  	struct used_bucket *bucket_iter;
> > +	struct used_bucket *bucket_iter_tmp;
> >  	struct relocation_head *rel_head_iter;
> > +	struct hlist_node *rel_head_iter_tmp;
> >  	struct relocation_entry *rel_entry_iter;
> > +	struct relocation_entry *rel_entry_iter_tmp;
> >  	int curr_type;
> >  	void *location;
> >  	long buffer;
> >  
> > -	list_for_each_entry(bucket_iter, &used_buckets_list, head) {
> > -		hlist_for_each_entry(rel_head_iter, bucket_iter->bucket, node) {
> > +	list_for_each_entry_safe(bucket_iter, bucket_iter_tmp,
> > +				 used_buckets_list, head) {
> > +		hlist_for_each_entry_safe(rel_head_iter, rel_head_iter_tmp,
> > +					  bucket_iter->bucket, node) {
> >  			buffer = 0;
> >  			location = rel_head_iter->location;
> > -			list_for_each_entry(rel_entry_iter,
> > -					    rel_head_iter->rel_entry, head) {
> > +			list_for_each_entry_safe(rel_entry_iter,
> > +						 rel_entry_iter_tmp,
> > +						 rel_head_iter->rel_entry,
> > +						 head) {
> >  				curr_type = rel_entry_iter->type;
> >  				reloc_handlers[curr_type].reloc_handler(
> >  					me, &buffer, rel_entry_iter->value);
> > @@ -648,11 +660,13 @@ void process_accumulated_relocations(struct module *me)
> >  		kfree(bucket_iter);
> >  	}
> >  
> > -	kfree(relocation_hashtable);
> > +	kfree(*relocation_hashtable);
> >  }
> >  
> >  int add_relocation_to_accumulate(struct module *me, int type, void *location,
> > -				 unsigned int hashtable_bits, Elf_Addr v)
> > +				 unsigned int hashtable_bits, Elf_Addr v,
> > +				struct hlist_head **relocation_hashtable,
> > +				struct list_head *used_buckets_list)
> >  {
> >  	struct relocation_entry *entry;
> >  	struct relocation_head *rel_head;
> > @@ -667,7 +681,7 @@ int add_relocation_to_accumulate(struct module *me, int type, void *location,
> >  
> >  	hash = hash_min((uintptr_t)location, hashtable_bits);
> >  
> > -	current_head = &relocation_hashtable[hash];
> > +	current_head = &((*relocation_hashtable)[hash]);
> >  
> >  	/* Find matching location (if any) */
> >  	bool found = false;
> > @@ -693,7 +707,7 @@ int add_relocation_to_accumulate(struct module *me, int type, void *location,
> >  				kmalloc(sizeof(struct used_bucket), GFP_KERNEL);
> >  			INIT_LIST_HEAD(&bucket->head);
> >  			bucket->bucket = current_head;
> > -			list_add(&bucket->head, &used_buckets_list);
> > +			list_add(&bucket->head, used_buckets_list);
> >  		}
> >  		hlist_add_head(&rel_head->node, current_head);
> >  	}
> > @@ -704,7 +718,10 @@ int add_relocation_to_accumulate(struct module *me, int type, void *location,
> >  	return 0;
> >  }
> >  
> > -unsigned int initialize_relocation_hashtable(unsigned int num_relocations)
> > +unsigned int
> > +initialize_relocation_hashtable(unsigned int num_relocations,
> > +				struct hlist_head **relocation_hashtable,
> > +				struct list_head *used_buckets_list)
> >  {
> >  	/* Can safely assume that bits is not greater than sizeof(long) */
> >  	unsigned long hashtable_size = roundup_pow_of_two(num_relocations);
> > @@ -720,12 +737,12 @@ unsigned int initialize_relocation_hashtable(unsigned int num_relocations)
> >  
> >  	hashtable_size <<= should_double_size;
> >  
> > -	relocation_hashtable = kmalloc_array(hashtable_size,
> > -					     sizeof(*relocation_hashtable),
> > -					     GFP_KERNEL);
> > -	__hash_init(relocation_hashtable, hashtable_size);
> > +	*relocation_hashtable = kmalloc_array(hashtable_size,
> > +					      sizeof(*relocation_hashtable),
> > +					      GFP_KERNEL);
> 
> You need to check for allocation failure here and inside
> add_relocation_to_accumulate(). Module loading under memory pressure is a
> reasonably likely scenario.
> 
> > +	__hash_init(*relocation_hashtable, hashtable_size);
> >  
> > -	INIT_LIST_HEAD(&used_buckets_list);
> > +	INIT_LIST_HEAD(used_buckets_list);
> 
> This is the only place used_buckets_list is used in this function. If you move
> this line out to apply_relocate_add, you can drop the parameter.
> 
> Regards,
> Samuel
>

Thanks for the suggestions, I will send out another version.

- Charlie

> >  
> >  	return hashtable_bits;
> >  }
> > @@ -742,7 +759,13 @@ int apply_relocate_add(Elf_Shdr *sechdrs, const char *strtab,
> >  	Elf_Addr v;
> >  	int res;
> >  	unsigned int num_relocations = sechdrs[relsec].sh_size / sizeof(*rel);
> > -	unsigned int hashtable_bits = initialize_relocation_hashtable(num_relocations);
> > +	struct hlist_head *relocation_hashtable;
> > +	struct list_head used_buckets_list;
> > +	unsigned int hashtable_bits;
> > +
> > +	hashtable_bits = initialize_relocation_hashtable(num_relocations,
> > +							 &relocation_hashtable,
> > +							 &used_buckets_list);
> >  
> >  	pr_debug("Applying relocate section %u to %u\n", relsec,
> >  	       sechdrs[relsec].sh_info);
> > @@ -823,14 +846,17 @@ int apply_relocate_add(Elf_Shdr *sechdrs, const char *strtab,
> >  		}
> >  
> >  		if (reloc_handlers[type].accumulate_handler)
> > -			res = add_relocation_to_accumulate(me, type, location, hashtable_bits, v);
> > +			res = add_relocation_to_accumulate(
> > +				me, type, location, hashtable_bits, v,
> > +				&relocation_hashtable, &used_buckets_list);
> >  		else
> >  			res = handler(me, location, v);
> >  		if (res)
> >  			return res;
> >  	}
> >  
> > -	process_accumulated_relocations(me);
> > +	process_accumulated_relocations(me, &relocation_hashtable,
> > +					&used_buckets_list);
> >  
> >  	return 0;
> >  }
> > 
> > ---
> > base-commit: 98b1cc82c4affc16f5598d4fa14b1858671b2263
> > change-id: 20231120-module_linking_freeing-2b5a3b255b5e
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
