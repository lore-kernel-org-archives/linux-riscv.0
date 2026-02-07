Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD3ECEE0AF1
	for <linux-riscv@archiver.kernel.org>; Sat,  7 Feb 2026 20:16:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=L1O+WQh3s/cu4zLOY8GdzyWMvZUKhNbk3COkpnGB3cw=; b=fpjg3TJuMr6jve
	JeMO0muZddcGDTr3l5b1x7KtNe+KvZTHqEH4DUo2fgOgOizW8aj3hvjpm1RuuSYO2HlPgMrUutVZt
	EklexlT25cpqjWJE9K9maR3IhNu/x3aVsfrm2cYPt3fRqtdtuVYD8h6R2oFDmQRHETNtJk4WFvgAU
	ou6Xz+iXvPR6CHa2sxyrVEALpcSgm/WF5WaQjArJgKiapP+O/CFv4Qc6J6NpJ/AVTJKJ0SVsj27zS
	S8gPpDV1JaniIRp6ahginFqW06uRP/s53JHWNvcPnOIi/r/c5fe0moFmiPP7oTXVQE3af/9zpVm1+
	EI6xkbJT0z3E6fWyopIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1voojI-0000000Ck4R-2IJl;
	Sat, 07 Feb 2026 20:16:32 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1voojF-0000000Ck45-0Vcv
	for linux-riscv@lists.infradead.org;
	Sat, 07 Feb 2026 20:16:30 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-47ee0291921so16264805e9.3
        for <linux-riscv@lists.infradead.org>; Sat, 07 Feb 2026 12:16:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770495387; x=1771100187; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0tgEE4qPRK7pF2tP48CJlGhSYjJKIgdfs2GqYMm8p6Y=;
        b=mJT2n6q3f6IYkWtkj+wM2G5TKIMTnacHzeHMm9jwsmugeuWP+WpPKHXA5tZGcPpCu7
         UtjsI+TOiZ6XL4TKsMk4XMuZQiAqhyyaf0iy9CMU9sCcmPbL8QDb2EZZfm8BKEKF6Xpt
         mbC3uNq/U/fVfyBxx+iBvdYPKMDuVKQQusIubSgyiu5+PxH141XpFHZplgIsSrRICOSt
         +hBeYV1RvsAiIq0b6okYgnXW50OSkjCsVfgAwE1Z53pwcDpowAKNyfS5wLPAMSHnXk5v
         Obq/mNI8iQcDsp6pTrBm5wS9eq3ACrMclTGjOTLG++yxQ3L2hzk/zuAvHrf3c+Mr93LQ
         0DeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770495387; x=1771100187;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0tgEE4qPRK7pF2tP48CJlGhSYjJKIgdfs2GqYMm8p6Y=;
        b=qn/eOlQm/a0gwWSH+NvvZtqrpWQWQxK6BVaDABBZDvuqbIR/eMe4ApOH1/kY88lKDq
         8VK3gn8aDbenAok9VsWv650dPegleNVKIgnR1bag7hDLIigalC1gp3MUXae4nVDB8uMF
         zNpWyMpX4SlOGXGMeOYdLK3px2IJ0Flu4MKJX++XuUD/OIa3n1TPLbIUoFpC1d6tDWOA
         GvottUIrItUqvgxEjiVqUUPGbO+xysY0JXUq8diJcgN/BqZhVyNMqLujf3WZt6JRaTvq
         yTCeVvdTBzzOiMfumnTl+xhRTGJ7cT9dYT9Zy/SOR1bJUZCijSqjbknd3FxwCfQAxKAW
         uHjQ==
X-Forwarded-Encrypted: i=1; AJvYcCWpRrBI6c+d74SJiiPhVlYF+X5mnlY7pHF9C8hOQAhGLSfs1iTJ73EI1c3LZ6bpJIsNlTq2XCWZhnM8yQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YzI6ZwB0N+j7xNIjZQ7Y8DnGV8KWBQWCRRSVJIu3Go8p90js7IU
	NClJxbuvl7v3BJFZqBLuHgV9S+nKoeJxRTgpaIev4rWZ2Ei74oSlq88q
X-Gm-Gg: AZuq6aLqUzSFo6uqxmWFugpq44atEoMheof9eaHkpZcpNYxmvqV1+XEfuLMUBKf79u+
	gmiFx8XvmeyKAWzy25OWuTz91JU2V5h28Rf8tP5XQ0wPpeWp8Wd0MXSoybowzt3VpnvQkPwxaYC
	L3Uy+YE7VLXoGmIGu0VJgNtizO/FepTjcAKiXx3c+FJd5lTBC3j+BntZ1BAqnlCGlMYENxjwAOw
	PoKxgvFghLYGTRxok9jEp2iFJSo5nLwIwPSe1dVJKanggm2eFn70vXSx2CAACD5dkrZXg34bJ1s
	g3OeTzXo9F+5at/gKTT7hYocrE1oG9ufPUY770bM0akX78wooFWMHQFqIb71n15TsJjiXCEDZby
	00kvLosefL0sMIHs6yaudZWmPikin0Zn5Lw9QB97QIT9Ro3q7wKZAuroxnbrO1+Kar+vTcEiaij
	FNJEOBD5P6poUS30ghL/UqJQ4qv7OWmwBlfiRGWTgtqh2IkbdUBer6HzS8zJHgtQdcbGafOpIuD
	JSvqjcKi3K8NQo=
X-Received: by 2002:a05:600c:3e12:b0:476:d494:41d2 with SMTP id 5b1f17b1804b1-4832021d67dmr86909015e9.29.1770495386585;
        Sat, 07 Feb 2026 12:16:26 -0800 (PST)
Received: from ?IPV6:2a02:6b6f:e752:9400:18cf:c773:ee86:c436? ([2a02:6b6f:e752:9400:18cf:c773:ee86:c436])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48320719b8fsm144010445e9.9.2026.02.07.12.16.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 07 Feb 2026 12:16:25 -0800 (PST)
Message-ID: <907ff793-9b02-4a22-a85e-2873246f6402@gmail.com>
Date: Sat, 7 Feb 2026 20:16:25 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCHv6 11/17] mm/hugetlb: Remove fake head pages
Content-Language: en-GB
To: Kiryl Shutsemau <kas@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 Muchun Song <muchun.song@linux.dev>, David Hildenbrand <david@redhat.com>,
 Matthew Wilcox <willy@infradead.org>, Frank van der Linden <fvdl@google.com>
Cc: Oscar Salvador <osalvador@suse.de>, Mike Rapoport <rppt@kernel.org>,
 Vlastimil Babka <vbabka@suse.cz>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, Zi Yan <ziy@nvidia.com>,
 Baoquan He <bhe@redhat.com>, Michal Hocko <mhocko@suse.com>,
 Johannes Weiner <hannes@cmpxchg.org>, Jonathan Corbet <corbet@lwn.net>,
 Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>,
 Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley
 <paul.walmsley@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>, kernel-team@meta.com, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
 loongarch@lists.linux.dev, linux-riscv@lists.infradead.org
References: <20260202155634.650837-1-kas@kernel.org>
 <20260202155634.650837-12-kas@kernel.org>
From: Usama Arif <usamaarif642@gmail.com>
In-Reply-To: <20260202155634.650837-12-kas@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260207_121629_253580_A8E42120 
X-CRM114-Status: UNSURE (   9.27  )
X-CRM114-Notice: Please train this message.
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


> +
>  int __meminit vmemmap_populate_hvo(unsigned long addr, unsigned long end,
>  				       int node, unsigned long headsize)
>  {
> +	unsigned long maddr, len, tail_pfn;
> +	unsigned int order;
>  	pte_t *pte;
> -	unsigned long maddr;
> +
> +	len = end - addr;
> +	order = ilog2(len * sizeof(struct page) / PAGE_SIZE);


This doesnt work for ARM. For len = 32 (2MB contiguous-PTE hugetlb on arm64):
ilog2(32 * 64 / 65536) = ilog2(2048 / 65536) = ilog2(0) which is undefined.

Is order = ilog2(len / sizeof(struct page)) better?



> +	tail_pfn = vmemmap_get_tail(order, node);
> +	if (!tail_pfn)
> +		return -ENOMEM;
>  
>  	for (maddr = addr; maddr < addr + headsize; maddr += PAGE_SIZE) {
>  		pte = vmemmap_populate_address(maddr, node, NULL, -1, 0);
> @@ -398,8 +426,7 @@ int __meminit vmemmap_populate_hvo(unsigned long addr, unsigned long end,
>  	/*
>  	 * Reuse the last page struct page mapped above for the rest.
>  	 */
> -	return vmemmap_populate_range(maddr, end, node, NULL,
> -					pte_pfn(ptep_get(pte)), 0);
> +	return vmemmap_populate_range(maddr, end, node, NULL, tail_pfn, 0);
>  }
>  
>  void __weak __meminit vmemmap_set_pmd(pmd_t *pmd, void *p, int node,


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
