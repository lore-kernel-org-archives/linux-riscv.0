Return-Path: <SRS0=Ai3O=KJ=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D4219C43460
	for <linux-riscv@archiver.kernel.org>; Fri, 14 May 2021 08:43:58 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5836861278
	for <linux-riscv@archiver.kernel.org>; Fri, 14 May 2021 08:43:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5836861278
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=redhat.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:Subject:
	From:References:Cc:To:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=hDqpGxzrDzsyuHu5oqbdkZhBDiBjmOXL2fpoMKKmzos=; b=EB2p+5Ycz4lqrxoaOwyJtNDai
	EWubFH0CsKQ/Hb6+FZrpjArZe0QkJV0n1LiBRqC1jVyBES9tmk6MPle7JIwzpZHRAETOJtybcZ3XA
	ye5rkqApw504nRxpeyarsr77DtZRe/S10A6+jmwagzVNO/KprtuwpobY2H8387E0SHXD3r2h31qJt
	pH+jUjMwaJrX/qIzbQC4UWyTEUUl+qJgARG2LdCKerZcEWJ3pPmfqG7eNQbJa1i0R64X5WTZoxeBe
	DpNs7NNpmohiUccbordqPeiGUISpJSJW8brLTjYdEVHT87DQTZn67ZHtaY32rKbnX5EecFdukr1Hy
	7on63lWvQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lhTQ4-007XdW-LS; Fri, 14 May 2021 08:43:40 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lhTQ2-007XdI-Nx
 for linux-riscv@desiato.infradead.org; Fri, 14 May 2021 08:43:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:Subject:From:References
 :Cc:To:Sender:Reply-To:Content-ID:Content-Description;
 bh=lsAavQGtZZQfxxuNta+2PaMZ+gKpW3kyTUx2+4IIAWk=; b=Wh+bG0y+b+y9SE27/rO2P5HoF4
 OzYYJ8hco7mZrynXyjvRq1MMbRIPjpE5EzlhZ7doek3WVgTGKlc3NBk0GQfwTA8HeVenCm574iBhj
 nMCfQ4bLxFOacTiU5gZp18+XnQTaQhQBKiN5AMa2cs7gRqksSmnNc4HVWoX247Gl3HYhSSxlBjQum
 gJ03iNyFnZ0sH6K2bO/Vesh22a9wdjpu2HXMKc9OTLaWRxs8VpWodi7Bx/X8YQAm/AvUarWL7hQvR
 RzRBknk0+W3zZFoGXofseKlO5REIvhRADMideE+ck5PHCcMdrjyCRDNMy05F3oVugTCvVIJxxlVvc
 FaORz6zg==;
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lhTQ0-00BpR5-2z
 for linux-riscv@lists.infradead.org; Fri, 14 May 2021 08:43:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620981814;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lsAavQGtZZQfxxuNta+2PaMZ+gKpW3kyTUx2+4IIAWk=;
 b=YxlcmwxVHOceWjTKAGrIUdEot99VucH4vxjA3qjNsFknrZE7IXHazHM13viWykVqBYy5X5
 VM71SW5cAV+9j5Ym6YI6WGbtkINZy3T2wJUjOcktgu6sJWqNVprSe1SzUqtQkob8aT1KH+
 jmNR+YduELejNqcSBKUmHafKfcTRvj0=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-112-cCHc536sOJqDh4ahlZHymA-1; Fri, 14 May 2021 04:43:32 -0400
X-MC-Unique: cCHc536sOJqDh4ahlZHymA-1
Received: by mail-ed1-f72.google.com with SMTP id
 g7-20020aa7c5870000b02903888f809d62so16109646edq.23
 for <linux-riscv@lists.infradead.org>; Fri, 14 May 2021 01:43:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:to:cc:references:from:organization:subject
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=lsAavQGtZZQfxxuNta+2PaMZ+gKpW3kyTUx2+4IIAWk=;
 b=BDHsDPdtJ1qo3zSGBlg/LTjG+mxE0wPGiBaiEmAidWB9xrcMPQ2WnrPEZ/YEwbpW0Q
 FeOS34VGyCX2svYdELJJkFzq1Jbsw94AsaJo2yvn7yNSnq9K0r4fGQxsVGeFZYDG9+z7
 3H8vG4shDlCSHcG+ui4mpMYE/8YuFW16mkkHBCj2kokwu4qHlXeL2OTTZfS6tJUbfxh9
 nVAQhf0qnJUYhBGreFMQR5zuigRgmpHfztUffrPxMB/YwHT7rTC0oMFF/5WhwlnGHqwl
 hS2R1na6ZXUM/XVXcmgIIkIZJnf7IUlQpKIFW+gduzkCJ0uLb7ZeG1uBe6mf9ML5ASlQ
 9lag==
X-Gm-Message-State: AOAM531g+LdgWQvy1q/dSKOTXe5WSCYh3KR+mUop7vmI0QniLH3DfO2G
 oD2ov/6YhPtN4eeUsTNJUYgheeT7rBJGCWGCbmnrgTEVfBy89i3h4XdCljWtI6TOgq0ZPcyHhGc
 MvaHc5ixjDBECOAPeAob0fcxvIUxC
X-Received: by 2002:a50:ed0c:: with SMTP id j12mr54641139eds.12.1620981811579; 
 Fri, 14 May 2021 01:43:31 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJypI4ge2hxqi/JfrvWJM2sA3w80IXDC+WmQ5wQdEdZZtqA+keJm9IEpbNTASfWRrXFPNSGQBQ==
X-Received: by 2002:a50:ed0c:: with SMTP id j12mr54641100eds.12.1620981811327; 
 Fri, 14 May 2021 01:43:31 -0700 (PDT)
Received: from [192.168.3.132] (p5b0c6501.dip0.t-ipconnect.de. [91.12.101.1])
 by smtp.gmail.com with ESMTPSA id
 k12sm3969468edo.50.2021.05.14.01.43.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 14 May 2021 01:43:31 -0700 (PDT)
To: Mike Rapoport <rppt@kernel.org>, Andrew Morton <akpm@linux-foundation.org>
Cc: Alexander Viro <viro@zeniv.linux.org.uk>,
 Andy Lutomirski <luto@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 Borislav Petkov <bp@alien8.de>, Catalin Marinas <catalin.marinas@arm.com>,
 Christopher Lameter <cl@linux.com>, Dan Williams <dan.j.williams@intel.com>,
 Dave Hansen <dave.hansen@linux.intel.com>,
 Elena Reshetova <elena.reshetova@intel.com>, "H. Peter Anvin"
 <hpa@zytor.com>, Hagen Paul Pfeifer <hagen@jauu.net>,
 Ingo Molnar <mingo@redhat.com>, James Bottomley <jejb@linux.ibm.com>,
 Kees Cook <keescook@chromium.org>, "Kirill A. Shutemov"
 <kirill@shutemov.name>, Matthew Wilcox <willy@infradead.org>,
 Matthew Garrett <mjg59@srcf.ucam.org>, Mark Rutland <mark.rutland@arm.com>,
 Michal Hocko <mhocko@suse.com>, Mike Rapoport <rppt@linux.ibm.com>,
 Michael Kerrisk <mtk.manpages@gmail.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Palmer Dabbelt <palmerdabbelt@google.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Peter Zijlstra <peterz@infradead.org>, "Rafael J. Wysocki"
 <rjw@rjwysocki.net>, Rick Edgecombe <rick.p.edgecombe@intel.com>,
 Roman Gushchin <guro@fb.com>, Shakeel Butt <shakeelb@google.com>,
 Shuah Khan <shuah@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
 Tycho Andersen <tycho@tycho.ws>, Will Deacon <will@kernel.org>,
 Yury Norov <yury.norov@gmail.com>, linux-api@vger.kernel.org,
 linux-arch@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-fsdevel@vger.kernel.org, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
 linux-nvdimm@lists.01.org, linux-riscv@lists.infradead.org, x86@kernel.org
References: <20210513184734.29317-1-rppt@kernel.org>
 <20210513184734.29317-4-rppt@kernel.org>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
Subject: Re: [PATCH v19 3/8] set_memory: allow set_direct_map_*_noflush() for
 multiple pages
Message-ID: <858e5561-bc7d-4ce1-5cb8-3c333199d52a@redhat.com>
Date: Fri, 14 May 2021 10:43:29 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210513184734.29317-4-rppt@kernel.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210514_014336_232522_D2532485 
X-CRM114-Status: GOOD (  24.06  )
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

On 13.05.21 20:47, Mike Rapoport wrote:
> From: Mike Rapoport <rppt@linux.ibm.com>
> 
> The underlying implementations of set_direct_map_invalid_noflush() and
> set_direct_map_default_noflush() allow updating multiple contiguous pages
> at once.
> 
> Add numpages parameter to set_direct_map_*_noflush() to expose this
> ability with these APIs.
> 

[...]

Finally doing some in-depth review, sorry for not having a detailed look 
earlier.


>   
> -int set_direct_map_invalid_noflush(struct page *page)
> +int set_direct_map_invalid_noflush(struct page *page, int numpages)
>   {
>   	struct page_change_data data = {
>   		.set_mask = __pgprot(0),
>   		.clear_mask = __pgprot(PTE_VALID),
>   	};
> +	unsigned long size = PAGE_SIZE * numpages;
>   

Nit: I'd have made this const and added an early exit for !numpages. But 
whatever you prefer.

>   	if (!debug_pagealloc_enabled() && !rodata_full)
>   		return 0;
>   
>   	return apply_to_page_range(&init_mm,
>   				   (unsigned long)page_address(page),
> -				   PAGE_SIZE, change_page_range, &data);
> +				   size, change_page_range, &data);
>   }
>   
> -int set_direct_map_default_noflush(struct page *page)
> +int set_direct_map_default_noflush(struct page *page, int numpages)
>   {
>   	struct page_change_data data = {
>   		.set_mask = __pgprot(PTE_VALID | PTE_WRITE),
>   		.clear_mask = __pgprot(PTE_RDONLY),
>   	};
> +	unsigned long size = PAGE_SIZE * numpages;
>   

Nit: dito

>   	if (!debug_pagealloc_enabled() && !rodata_full)
>   		return 0;
>   
>   	return apply_to_page_range(&init_mm,
>   				   (unsigned long)page_address(page),
> -				   PAGE_SIZE, change_page_range, &data);
> +				   size, change_page_range, &data);
>   }
>   


[...]

>   extern int kernel_set_to_readonly;
> diff --git a/arch/x86/mm/pat/set_memory.c b/arch/x86/mm/pat/set_memory.c
> index 156cd235659f..15a55d6e9cec 100644
> --- a/arch/x86/mm/pat/set_memory.c
> +++ b/arch/x86/mm/pat/set_memory.c
> @@ -2192,14 +2192,14 @@ static int __set_pages_np(struct page *page, int numpages)
>   	return __change_page_attr_set_clr(&cpa, 0);
>   }
>   
> -int set_direct_map_invalid_noflush(struct page *page)
> +int set_direct_map_invalid_noflush(struct page *page, int numpages)
>   {
> -	return __set_pages_np(page, 1);
> +	return __set_pages_np(page, numpages);
>   }
>   
> -int set_direct_map_default_noflush(struct page *page)
> +int set_direct_map_default_noflush(struct page *page, int numpages)
>   {
> -	return __set_pages_p(page, 1);
> +	return __set_pages_p(page, numpages);
>   }
>   

So, what happens if we succeeded setting 
set_direct_map_invalid_noflush() for some pages but fail when having to 
split a large mapping?

Did I miss something or would the current code not undo what it 
partially did? Or do we simply not care?

I guess to handle this cleanly we would either have to catch all error 
cases first (esp. splitting large mappings) before actually performing 
the set to invalid, or have some recovery code in place if possible.


AFAIKs, your patch #5 right now only calls it with 1 page, do we need 
this change at all? Feels like a leftover from older versions to me 
where we could have had more than a single page.

-- 
Thanks,

David / dhildenb


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
