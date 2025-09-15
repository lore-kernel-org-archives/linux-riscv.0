Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 157E9CAC597
	for <linux-riscv@archiver.kernel.org>; Mon, 15 Sep 2025 13:56:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EBDtc0OS15Xq9N9AJeg0r1CqpVrEhwL58pr9u83/Jsc=; b=b4+HgX/jeTh6My
	l2METjJY0PvJzFAEMTrRLR6buXAFUePjKohAjRwIDSFXMF6feNjb3zKSqhrpF1Ev0cbjqObTJw747
	r07cihIZTYp+w2en6MF7MKmnXZmDbARNYcEbRi007C2ivIx7K4IcpHM7jxaU246NRIrLWr8LNrQG4
	NS2eLHgyO5ior5UrEWNUTtFnv9J8N2FkAqmMXLmesJTvTVNzH10irmacLXB42g3/bGnBNMb6MqZI8
	W7OSwQyWYhoKytkvYNnO429JX9PuMoaUtr8KjH2qoZeGwQUyla50j4E+eq+DQyWcqDY5ZDJMusI5I
	irLoy9Iptn1Xl3+mbz3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uy9gs-00000004W2G-1RBx;
	Mon, 15 Sep 2025 13:56:22 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uy9gp-00000004Vzr-2FTj
	for linux-riscv@lists.infradead.org;
	Mon, 15 Sep 2025 13:56:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1757944578;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=xhOG/fvp4vP62Eb6XPp5XNsran7BwQlb2XSK8gOzU1U=;
	b=TQjt94Eme8jgdYUH4LwJOtPcUYean+0g/unCzJPTC2vyP3N/63H/K6yaAlalzU0xJBrfVh
	Q7vH+L9+Y/3hASHZBavdEUpj13rWnMUYtgcZeqqtmIIa5zxdbJvqlQejXs6FTGnB9GlV55
	EYSPSJsbHQpow9XBiAdabXwz3RtHkVs=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-250--2QKE05EPiiJB6dpQmEXjg-1; Mon, 15 Sep 2025 09:56:17 -0400
X-MC-Unique: -2QKE05EPiiJB6dpQmEXjg-1
X-Mimecast-MFC-AGG-ID: -2QKE05EPiiJB6dpQmEXjg_1757944576
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-45dd9a66cfbso1604395e9.1
        for <linux-riscv@lists.infradead.org>; Mon, 15 Sep 2025 06:56:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757944576; x=1758549376;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xhOG/fvp4vP62Eb6XPp5XNsran7BwQlb2XSK8gOzU1U=;
        b=bztUPrzRh4dCTVxrCAw2HJqcJTDXgHXrGC5Fkwy9i4hOVXcKRtQ69fyV0EqlHx4fOS
         UIahxTMrrPElUL+SXXLjGkDGr/qYDQqTjaq2bKx8UBV4V0p6mYQwAjZxzJTe5siu69YI
         OaSRNedvRw5t5oUjCTZNUh6KfiliYcqb7RVVyKobi6Uqe7Au65IKLL8ZDdh5We9qwvEx
         47AhrH4yj7srfpZgK2Ms1lbxGuUhJFXJvckaDOrDFN7o4SuOfbHgwSTPqzB+ZOz0ymTn
         tT6N6eFGz1aZie1IRk2mwx16XT3OVeli7CVR/7QiHo3r5kmTkzkp7MxtlfBj+R/iSNx3
         vSyg==
X-Forwarded-Encrypted: i=1; AJvYcCVqfV2MlTepgXqBXRDiGDcNN+fOHVHKE8CWyFsIpQBe07+yBOStqf1dd0hvmv9xQVElgD6cftIqRyd+Pg==@lists.infradead.org
X-Gm-Message-State: AOJu0Yw95xt2AQUKwuDM4Vec+IHhXueMx5zkZr/Pa0xMnxrG0dDp/Yb+
	QD9aIRSnC0CCG3g33XZkZnmDORyKkuFkBRkLWbZt4GSUuwfIef1XiRqrYlticsHtLWPlTZwwzBL
	LHQHtBigpf9sxdlScUA3SS3Y4iGqLwhBc5BD1yNupH1IyJ/mRP3nyXseS+EmVk+Y9Y2T9tA==
X-Gm-Gg: ASbGncsyMzX/c2w2eXbaXOWw03add1M8l3uUj+xR8owxKQR5rq01boGBzCPbWU3K+IM
	grm9ZmhgDQtY/aZYxFk3DsiDJa1+YIBmoqwpioNQ9MG5c3B4dM2q49b706rl/jTkF1h58MRdjVp
	++vzdCxZ4x6hBeDW6EFP1bjbMW8ohtsfRd9HyClsUCWSyvo2gGM8kcpw9APR1eUMCLMq6YCNApa
	Ccg7vkaanur3vzLn6xO1eb1NJ+JJgw2qksepOJgGpvWL0SsMnTakQmiquKecaeko6RRHZSxDpDU
	3Nct4gUu1vR8SuE64C46FMm5SuN3KaS8oSDeY9GEZBzNY1GfQ5oiuj9ykLHbpaDOM1hdZKytC2v
	9yivqFwtUUZRSiPBHLdgnjZZ46NmisCywJ1fkusRLWc6R2IE6Qb1EDOf3wx+VLDYjmck=
X-Received: by 2002:a05:600c:6288:b0:45b:8adf:cf2b with SMTP id 5b1f17b1804b1-45f211f881dmr115966285e9.21.1757944576055;
        Mon, 15 Sep 2025 06:56:16 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGtjLb9Ul6kS9hK8OGR9Dc+mdLSV5OClg6Pwy+q+DWumlQ5T+nt0OyxALBeSTSBr2gbzsMVcA==
X-Received: by 2002:a05:600c:6288:b0:45b:8adf:cf2b with SMTP id 5b1f17b1804b1-45f211f881dmr115965935e9.21.1757944575556;
        Mon, 15 Sep 2025 06:56:15 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f18:f900:e0ae:65d5:8bf8:8cfd? (p200300d82f18f900e0ae65d58bf88cfd.dip0.t-ipconnect.de. [2003:d8:2f18:f900:e0ae:65d5:8bf8:8cfd])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45e032a0522sm178750375e9.0.2025.09.15.06.56.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 15 Sep 2025 06:56:15 -0700 (PDT)
Message-ID: <37c8dd09-e0b1-4f76-a03b-4548c1fe4796@redhat.com>
Date: Mon, 15 Sep 2025 15:56:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V12 2/5] mm: userfaultfd: Add pgtable_supports_uffd_wp()
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
References: <20250915101343.1449546-1-zhangchunyan@iscas.ac.cn>
 <20250915101343.1449546-3-zhangchunyan@iscas.ac.cn>
From: David Hildenbrand <david@redhat.com>
Autocrypt: addr=david@redhat.com; keydata=
 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
 qIws/H2t
In-Reply-To: <20250915101343.1449546-3-zhangchunyan@iscas.ac.cn>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 3bsbUgXbneYAKvNxW8GEEKh6kcw4x5ljib6jB0bzOOc_1757944576
X-Mimecast-Originator: redhat.com
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250915_065619_651654_588856F9 
X-CRM114-Status: GOOD (  17.93  )
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

On 15.09.25 12:13, Chunyan Zhang wrote:
> Some platforms can customize the PTE/PMD entry uffd-wp bit making
> it unavailable even if the architecture provides the resource.
> This patch adds a macro API that allows architectures to define their
> specific implementations to check if the uffd-wp bit is available
> on which device the kernel is running.
> 

Similar to my reply to #1, you should probably summarize what you do 
regarding ifdef and "No functional change expected".

> Signed-off-by: Chunyan Zhang <zhangchunyan@iscas.ac.cn>
> ---

[...]

LGTM, one not below, thanks!

Acked-by: David Hildenbrand <david@redhat.com>

> +/*
> + * Some platforms can customize the uffd-wp bit, making it unavailable
> + * even if the architecture provides the resource.
> + * Adding this API allows architectures to add their own checks for the
> + * devices on which the kernel is running.
> + * Note: When overriding it, please make sure the
> + * CONFIG_HAVE_ARCH_USERFAULTFD_WP is part of this macro.
> + */
> +#ifndef pgtable_supports_uffd_wp
> +#define pgtable_supports_uffd_wp()	IS_ENABLED(CONFIG_HAVE_ARCH_USERFAULTFD_WP)
> +#endif
> +
> +static __always_inline bool uffd_supports_wp_marker(void)
> +{
> +	return pgtable_supports_uffd_wp() && IS_ENABLED(CONFIG_PTE_MARKER_UFFD_WP);
> +}

Likely a simple "inline" should do the trick?

> +
>   #ifndef CONFIG_HAVE_ARCH_USERFAULTFD_WP
>   static __always_inline int pte_uffd_wp(pte_t pte)
>   {
> diff --git a/include/linux/mm_inline.h b/include/linux/mm_inline.h
> index 89b518ff097e..d6526a7f034b 100644
> --- a/include/linux/mm_inline.h
> +++ b/include/linux/mm_inline.h
> @@ -570,9 +570,15 @@ static inline bool
>   pte_install_uffd_wp_if_needed(struct vm_area_struct *vma, unsigned long addr,
>   			      pte_t *pte, pte_t pteval)
>   {


-- 
Cheers

David / dhildenb


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
