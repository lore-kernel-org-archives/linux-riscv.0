Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71F88CAC582
	for <linux-riscv@archiver.kernel.org>; Tue,  9 Sep 2025 17:14:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Bv0lPfQpcesKNy6afZgbqe+cMNE0H3fmsjtDPgdX8V4=; b=yKBtEipWhhn1og
	Dr1nKv2Qh+W4gQ2KsgSpWXq057xYrIF4HUriRNpTW8J9vIyzUu6pKFEQbCHYSgRAYgufmrB2DixRy
	4Ja1h7spgWoPlphGFF0JsulFUhmLxugzhqPmuiCiVNinMrWYJuxIzq3WTe/SIJvzkvo8Y538JRwyc
	ok9NA0o2FMWm841S5qIwiZcocqD2JZSGdNwaGDvP7yfemortCzPk2hSU4GDVRpGBqdEqKCRD3B5Hh
	wHN4+QC9OOo0s8HodcthloNv51ai1Ru5IqyKYv/dU9K1mJXQqejEbF7Amx0/azJLf1gl5xvr/p3dY
	+RJSUuQ/ZCEbvRCOT/CA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uw1vK-00000008mv8-06HA;
	Tue, 09 Sep 2025 17:14:30 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvwlA-00000006pIO-17Jy
	for linux-riscv@bombadil.infradead.org;
	Tue, 09 Sep 2025 11:43:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=ZfsNktiY5EeJ33gIhfo8w6nygoXQJt9oz6VGjfkKEBQ=; b=nRlKZnsXqtESMKg/jjIJlEMF9+
	bvoLmtWmbC2VHFDM2Cvdo7V/N8wt7PzlTyxEvg1xyH2tLmDsQHoacQNH9GWDJVCXDHZZapoEHmqzF
	LWKFWvpOwCLHu4CYyGC93WtAxtu/sPK3GGFKXeJDhWuK4lFrhybhGt8gXj3wBa1UvcY7Ii/RCbOa9
	KTAwLH4Dv9exKxOLjICUyQLjZtXFEn4VJYhtmw+hEJXpyexiip1ss3PE1w4vYLpuxXXJfvNfeDqjI
	855Zw4cilcTyW74XISFzHqg2thwCM5CIpWfnbWZ0SXCvZJMJWgrpcHbCdXlEPVSMz31X6z6xK8+tF
	o81Fv6kQ==;
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvwl7-00000005KOf-0uUj
	for linux-riscv@lists.infradead.org;
	Tue, 09 Sep 2025 11:43:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1757418215;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=ZfsNktiY5EeJ33gIhfo8w6nygoXQJt9oz6VGjfkKEBQ=;
	b=F3zk+Bo4/Eh2dDIl8stoO5gStY+oz5LMtO2QjH9eEh4CqFcBA4LirHoOKV9Zsb7QP9B7I4
	SvWZVdBVlViqnoRTwf8J48N/ywCuFAO3JHKOGPtCIYqwHwsZ2vV48XYMCLLLbuHxLo5f5D
	cMvlP7EOJNz7GknqwfQ7ldtaIta8Ntc=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1757418215;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=ZfsNktiY5EeJ33gIhfo8w6nygoXQJt9oz6VGjfkKEBQ=;
	b=F3zk+Bo4/Eh2dDIl8stoO5gStY+oz5LMtO2QjH9eEh4CqFcBA4LirHoOKV9Zsb7QP9B7I4
	SvWZVdBVlViqnoRTwf8J48N/ywCuFAO3JHKOGPtCIYqwHwsZ2vV48XYMCLLLbuHxLo5f5D
	cMvlP7EOJNz7GknqwfQ7ldtaIta8Ntc=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-677-v7TYeXFCOoKLQW89XSuQlQ-1; Tue, 09 Sep 2025 07:43:32 -0400
X-MC-Unique: v7TYeXFCOoKLQW89XSuQlQ-1
X-Mimecast-MFC-AGG-ID: v7TYeXFCOoKLQW89XSuQlQ_1757418212
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-45de18e7eccso16660445e9.0
        for <linux-riscv@lists.infradead.org>; Tue, 09 Sep 2025 04:43:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757418211; x=1758023011;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZfsNktiY5EeJ33gIhfo8w6nygoXQJt9oz6VGjfkKEBQ=;
        b=v5ZMKBedXpLlMAIVNlG9lRmb5fPUvSc9pu66PqtbrhTxuvyv8cMH/65yA4puSYcG4f
         NXpmv84L5xjJ1OYOovIluAZWLahwr866xXd4Erq6cFlLWsTsKUPZb1giGD841jGBthBV
         mPjy0pEHaqLw62HScmm7wsAtCjkKSwtSyB6zJkFEWLhcZsGaFyr/SiMzx05DjDzgiCLc
         /UhkaZRT11ww8Rr8VWkWf6ZoXeImASefZB5jkowZt7aSu9MBJ0KlL34kpMyp/ltD132O
         4v8UW7ZoV0uqwCycSRiqoauZe08y2LbkVypLCyifkLYzBrIqBvWNvHJCG9S57PRpmRY+
         Snaw==
X-Forwarded-Encrypted: i=1; AJvYcCXVy+W8MGEojKfcaHhKj2ZPC98RVx0nl8tLI1JTX/LTmTucNRn6yp/T1FqJk1DF1trB+JK5095cPLi/2Q==@lists.infradead.org
X-Gm-Message-State: AOJu0YzfrRzbTNyQEXBSrXoL2+BxnTKwo9j5joaaIZuSVCSV4ntp+3bm
	Eq0wtp89ETAy0yQdIDWBkFIrcw6ww+kgqTLVrxNXsdHpMM9W5MmG5NO2UzAYR439MVX06D7ERsN
	5XMDjjR+KvHw6OC9oreA6AOqXdsbhz90lK0JdzbJhUzSqATMK0rahJBA5V8T3BPlUqy/Qpg==
X-Gm-Gg: ASbGnctFalz2mBQFmLHo59AZ7wKYvvLA/rMeSWmpoN2Sj+168NDwtqQ+VmmirdUc9fR
	0FeCO7N8uWaEd61C3Ppk3XUe/FjryjNBMzMct3kXbuRxnR/A7RUWChMyQQoqyy8DBr2FW8K7UXr
	hOwFQ2IMMBNNG5GG8rBuEOU3O3J7JSM07ta8vUSHgKIyqiADXRWt5NlIC4UDf9QkL7STZWub/+9
	hlP7hz2P7pbQgoLwNSJ7knxa6+nJmfKIzrmjuy3/GBHKHe9m9Ik07UijbeQwjlsKQtoiZkwB76J
	XVveMvk+MV2r+UHNYyxntkgGUnsqkZQ/DxWdx8XbeC3QVuvOLdBLXrO558bsTIcxcdbV8Q==
X-Received: by 2002:a05:600c:45c9:b0:45b:97d9:4127 with SMTP id 5b1f17b1804b1-45ddde88188mr92336235e9.1.1757418211536;
        Tue, 09 Sep 2025 04:43:31 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFJoKdOB5PemUWBhPxYUhvzLBwqsvjrZuiiRzLKO/WI4N7BBAhfeDUq9Rg/ZPYt77RdwSoTMQ==
X-Received: by 2002:a05:600c:45c9:b0:45b:97d9:4127 with SMTP id 5b1f17b1804b1-45ddde88188mr92335895e9.1.1757418211082;
        Tue, 09 Sep 2025 04:43:31 -0700 (PDT)
Received: from [192.168.3.141] (p57a1a41f.dip0.t-ipconnect.de. [87.161.164.31])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3e75223f607sm2331885f8f.51.2025.09.09.04.43.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 Sep 2025 04:43:30 -0700 (PDT)
Message-ID: <0847f0b4-a02e-42d7-9bf3-797a753d3304@redhat.com>
Date: Tue, 9 Sep 2025 13:43:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V10 2/5] mm: uffd_wp: Add pte_uffd_wp_available()
To: Chunyan Zhang <zhangchunyan@iscas.ac.cn>,
 linux-riscv@lists.infradead.org, linux-fsdevel@vger.kernel.org,
 linux-mm@kvack.org, linux-kernel@vger.kernel.org
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>, Deepak Gupta <debug@rivosinc.com>,
 Ved Shanbhogue <ved@rivosinc.com>, Alexander Viro <viro@zeniv.linux.org.uk>,
 Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>,
 Andrew Morton <akpm@linux-foundation.org>, Peter Xu <peterx@redhat.com>,
 Arnd Bergmann <arnd@arndb.de>, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 "Liam R . Howlett" <Liam.Howlett@oracle.com>,
 Vlastimil Babka <vbabka@suse.cz>, Mike Rapoport <rppt@kernel.org>,
 Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>,
 Axel Rasmussen <axelrasmussen@google.com>, Yuanchu Xie <yuanchu@google.com>,
 Chunyan Zhang <zhang.lyra@gmail.com>
References: <20250909095611.803898-1-zhangchunyan@iscas.ac.cn>
 <20250909095611.803898-3-zhangchunyan@iscas.ac.cn>
From: David Hildenbrand <david@redhat.com>
Autocrypt: addr=david@redhat.com; keydata=
 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
 qIws/H2t
In-Reply-To: <20250909095611.803898-3-zhangchunyan@iscas.ac.cn>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: AXwazidUvPE3mOUv8TFq9W0k1zibiEhsNPhLwUemXgI_1757418212
X-Mimecast-Originator: redhat.com
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250909_124337_504782_78E5675A 
X-CRM114-Status: GOOD (  16.75  )
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

On 09.09.25 11:56, Chunyan Zhang wrote:
> Some platforms can customize the PTE uffd_wp bit and make it unavailable
> even if the architecture allows providing the PTE resource.
> This patch adds a macro API which allows architectures to define
> their specific ones for checking if the PTE uffd_wp bit is available.
> 
> Signed-off-by: Chunyan Zhang <zhangchunyan@iscas.ac.cn>
> ---
>   fs/userfaultfd.c                   | 25 +++++++++--------
>   include/asm-generic/pgtable_uffd.h | 12 ++++++++
>   include/linux/mm_inline.h          |  7 +++++
>   include/linux/userfaultfd_k.h      | 44 +++++++++++++++++++-----------
>   mm/memory.c                        |  6 ++--
>   5 files changed, 65 insertions(+), 29 deletions(-)
> 
> diff --git a/fs/userfaultfd.c b/fs/userfaultfd.c
> index 54c6cc7fe9c6..68e5006e5158 100644
> --- a/fs/userfaultfd.c
> +++ b/fs/userfaultfd.c
> @@ -1270,9 +1270,10 @@ static int userfaultfd_register(struct userfaultfd_ctx *ctx,
>   	if (uffdio_register.mode & UFFDIO_REGISTER_MODE_MISSING)
>   		vm_flags |= VM_UFFD_MISSING;
>   	if (uffdio_register.mode & UFFDIO_REGISTER_MODE_WP) {
> -#ifndef CONFIG_HAVE_ARCH_USERFAULTFD_WP
> -		goto out;
> -#endif
> +		if (!IS_ENABLED(CONFIG_HAVE_ARCH_USERFAULTFD_WP) ||
> +		    !pte_uffd_wp_available())
> +			goto out;
> +

Same comment as for the other patch: make the 
CONFIG_HAVE_ARCH_USERFAULTFD_WP part of the pte_uffd_wp_available() 
check and better call it "pgtable_uffd_wp_" ... available/supported.

-- 
Cheers

David / dhildenb


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
