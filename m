Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0EC6FC43334
	for <linux-riscv@archiver.kernel.org>; Tue,  7 Jun 2022 12:26:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bkdAR9Y+0pj8ze4/XS/L4rAQtqqyYlxkhBNBehIE0P8=; b=ITANGnH3TjLpap
	cds3Oo5YbmObEp9VVkj/p5x5vDsc+Db9g8O81uBrNepvYnqXwAor70s93zOylOWIpep4qGbuuspWY
	iS2MDdRh7sJv+D4irWfuxxd5G6IHzIb7D7vGoZHH+uQdimbxz6TeHpPGrsjls/slX6Gpt8FLlTsdy
	cMQ9X4cOTkXyFS5wdeSB15Cl0AL79EEe9HMXZSu+7J6n59mARDMYpsG/1bR+CF4kpzclA+iOt5TvB
	nCJliQ8N/D7gYhfyiJgYKC+EMHVzhqmCOI0QXaVZgKf6liWR4Nomg+oN0Fcdp1hVfI5QywI6pb5Qf
	pR2MqLOur6vvLb9Rz3+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nyYHW-007Kdl-37; Tue, 07 Jun 2022 12:25:58 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nyYHS-007KbA-Gl
	for linux-riscv@lists.infradead.org; Tue, 07 Jun 2022 12:25:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1654604753;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Mf4QQ8b/9HcGL5J+sznsLy7f+ZtpXa7DM56pD/5wHRY=;
	b=QZdUjLJdDMTedDPRnSLCZ+grDpFvVdwSypmj7uIx9cVEBRr7hGT+/17myGIx6uO0B8y7Xn
	LywoXQgXDR0bV5MFi4oQETG6Uz2zIYBZ5GN9tsSxvay0t7lqSnlT5FdvwlY/mYg0L810Qb
	6SGuJYfLq3w8zcCeRIDg2wtugRo1Z8o=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-494-PAnaFK8uPy68tGwCbmkEOQ-1; Tue, 07 Jun 2022 08:25:52 -0400
X-MC-Unique: PAnaFK8uPy68tGwCbmkEOQ-1
Received: by mail-wm1-f69.google.com with SMTP id k32-20020a05600c1ca000b0039c4cf75023so3720183wms.9
        for <linux-riscv@lists.infradead.org>; Tue, 07 Jun 2022 05:25:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:organization:in-reply-to
         :content-transfer-encoding;
        bh=Mf4QQ8b/9HcGL5J+sznsLy7f+ZtpXa7DM56pD/5wHRY=;
        b=O7gphzDfmJwvvd4XtaeGXOiJ4cYAaMHV0vz11PQOJRbWTxwTg9kh05aAEkvGvGGnLT
         ZvTEGtzTYSr2BrJnIKIX9sTNY7FyVDVL7OyENVKinfQIwY7m+lvPjUQWARu5y+JD+Wpc
         vSNogRiTTrGDg+P/tx1PVo5mQpMJopjQNkZLTq+l1ybALrlDydwiFviferhhM6ytMqfx
         Q3NcwzJpXTOHkcERwTqHUOgCkDxhNzEKB0rSHu4q731EIYQ52IdcyHhe5RT/z0VnOOCh
         hWUQe/ohYb4xQm6zAc256uAcs8bO+M0MBUq3zSq/grSDc+QUN5FRj5r2irgmMrGzYlfL
         ehPA==
X-Gm-Message-State: AOAM530V9sFoCx4sFPGWVJBzu1sQM3n6ja/0GkfX6vvFnkjxHqziRC9Y
	1k+HqO6206ZpH6s6Y3/iNvDxW7nHs/YnM1dQNKHrievMmflCxcubwQUj1bSxvOyLipGI4VMf5IJ
	dnfKB9siQjq80J1HieoeASccudBVS
X-Received: by 2002:a05:600c:190d:b0:394:8241:6454 with SMTP id j13-20020a05600c190d00b0039482416454mr29078117wmq.198.1654604751335;
        Tue, 07 Jun 2022 05:25:51 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxEuwOaCR67pR222FFFc/vDtB6DVVouzt2vgnHsRtqi2r3pc13yypWYxPfO2mRuKCd4JmPjUQ==
X-Received: by 2002:a05:600c:190d:b0:394:8241:6454 with SMTP id j13-20020a05600c190d00b0039482416454mr29078055wmq.198.1654604751070;
        Tue, 07 Jun 2022 05:25:51 -0700 (PDT)
Received: from ?IPV6:2003:cb:c709:500:4c8d:4886:f874:7b6f? (p200300cbc70905004c8d4886f8747b6f.dip0.t-ipconnect.de. [2003:cb:c709:500:4c8d:4886:f874:7b6f])
        by smtp.gmail.com with ESMTPSA id m19-20020a05600c4f5300b003942a244f2esm26245306wmq.7.2022.06.07.05.25.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Jun 2022 05:25:50 -0700 (PDT)
Message-ID: <b1975f44-2552-a03c-bb6f-1452f1fd99c0@redhat.com>
Date: Tue, 7 Jun 2022 14:25:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH v3 4/6] mm: Demote warning message in vmemmap_verify() to
 debug level
To: Wupeng Ma <mawupeng1@huawei.com>, corbet@lwn.net, will@kernel.org,
 ardb@kernel.org, catalin.marinas@arm.com
Cc: tglx@linutronix.de, mingo@redhat.com, bp@alien8.de,
 dave.hansen@linux.intel.com, x86@kernel.org, hpa@zytor.com,
 dvhart@infradead.org, andy@infradead.org, rppt@kernel.org,
 akpm@linux-foundation.org, paul.walmsley@sifive.com, palmer@dabbelt.com,
 aou@eecs.berkeley.edu, paulmck@kernel.org, keescook@chromium.org,
 songmuchun@bytedance.com, rdunlap@infradead.org,
 damien.lemoal@opensource.wdc.com, swboyd@chromium.org, wei.liu@kernel.org,
 robin.murphy@arm.com, anshuman.khandual@arm.com, thunder.leizhen@huawei.com,
 wangkefeng.wang@huawei.com, gpiccoli@igalia.com, chenhuacai@kernel.org,
 geert@linux-m68k.org, chenzhou10@huawei.com, vijayb@linux.microsoft.com,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-efi@vger.kernel.org,
 platform-driver-x86@vger.kernel.org, linux-mm@kvack.org,
 linux-riscv@lists.infradead.org
References: <20220607093805.1354256-1-mawupeng1@huawei.com>
 <20220607093805.1354256-5-mawupeng1@huawei.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
In-Reply-To: <20220607093805.1354256-5-mawupeng1@huawei.com>
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220607_052554_705173_829842A0 
X-CRM114-Status: GOOD (  17.84  )
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

On 07.06.22 11:38, Wupeng Ma wrote:
> From: Ma Wupeng <mawupeng1@huawei.com>
> 
> For a system only have limited mirrored memory or some numa node without
> mirrored memory, the per node vmemmap page_structs prefer to allocate
> memory from mirrored region, which will lead to vmemmap_verify() in
> vmemmap_populate_basepages() report lots of warning message.
> 
> This patch demote the "potential offnode page_structs" warning messages
> to debug level to avoid a very long print during bootup.
> 
> Signed-off-by: Ma Wupeng <mawupeng1@huawei.com>
> ---
>  mm/sparse-vmemmap.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/mm/sparse-vmemmap.c b/mm/sparse-vmemmap.c
> index f4fa61dbbee3..78debdb89eb1 100644
> --- a/mm/sparse-vmemmap.c
> +++ b/mm/sparse-vmemmap.c
> @@ -528,7 +528,7 @@ void __meminit vmemmap_verify(pte_t *pte, int node,
>  	int actual_node = early_pfn_to_nid(pfn);
>  
>  	if (node_distance(actual_node, node) > LOCAL_DISTANCE)
> -		pr_warn("[%lx-%lx] potential offnode page_structs\n",
> +		pr_debug("[%lx-%lx] potential offnode page_structs\n",
>  			start, end - 1);
>  }
>  

This will possibly hide it in environments where this might indeed
indicate performance issues.

What about a pr_warn_once()?

-- 
Thanks,

David / dhildenb


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
