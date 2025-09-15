Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B319CCAC597
	for <linux-riscv@archiver.kernel.org>; Mon, 15 Sep 2025 13:53:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Szdjx51Y0GFTjVYe4+G5JqXbDVXnXfsuxhtPj5PaLm8=; b=iTySor+G7fUhtd
	7q1hIn0DSMseOxtlzBoLs4CicY320xORQ2qSwtPyhzkDkDycjL8RmoPsab6jVBiAQ4utUxkrB8RSE
	4Ee7f4U6ly9MEeEEYjMlIj/fT8UqUn3hZbAGTJuEVvWYE+HfJQlIb4lQzPDkjHnIiDVovTecv7/x0
	HWsBu2wsrJSS/wHiWPg/dYO95vxkvopPGCySbvPdm8U+WjxTM+PcUyqE9GhmLnNp2F0B3je0jEZPh
	gFLIAqnoGA3Msp4MiTW64ItLZreL+OtNhzL83juPrqgQo31gOSXBRAObjAmHR63p+5umlZAM6N40w
	FJrolNPfCsXIIfIL1YoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uy9dk-00000004U22-2DjP;
	Mon, 15 Sep 2025 13:53:08 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uy9dh-00000004Tyf-2KpF
	for linux-riscv@lists.infradead.org;
	Mon, 15 Sep 2025 13:53:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1757944384;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=WLlYJinc0dfQVpvH1UOH7RnaSWYBlLeAZhMVXB0T/UY=;
	b=TeCecidt2hZfddGwJQRQT1Tc4OARsm0J1scjdDxLaNDNoyJPRu4uwVHI6t4lTsp3PKnwBh
	xy1d5GhYmyNcoihglV6Mac3oMEch6nH8MV/RJG8I6rl8OMSPuEfAZQCuXFE//4jy7QskvD
	WsieWLCIivaFZmOR0dXWvsERZP5XeR0=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-460-X4YyrnIZMXuZz3zcZggUZg-1; Mon, 15 Sep 2025 09:53:02 -0400
X-MC-Unique: X4YyrnIZMXuZz3zcZggUZg-1
X-Mimecast-MFC-AGG-ID: X4YyrnIZMXuZz3zcZggUZg_1757944382
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-45cb604427fso25595045e9.1
        for <linux-riscv@lists.infradead.org>; Mon, 15 Sep 2025 06:53:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757944381; x=1758549181;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WLlYJinc0dfQVpvH1UOH7RnaSWYBlLeAZhMVXB0T/UY=;
        b=OLDn8tXdkysv9yVPxesAxkciCgv3mD+lOTdRtDLp+egWqJzsvrJlxVPlxp0bZOrAVE
         Dbli9N9WnWVgt8jq34DK0/xQNU8FhxpmPEltiE+6jwyaDvhGHDveNe/h/OXhWEiYwNUh
         z+irmdOFrbqwFxY0D+FXXkw1XgylIP1p/+BO75Im5Hg9eu5n4kZ9Pn0wp4hPoPVtKsjd
         /g7ZlwrTdqcon68Rc5ZxZgPRD3el0shK8HNXSu1C6gw7GBGvO+E3rp8Mb2p94b0cT/jx
         9eeh8ythHLmV/c9lRmRqwGwGxxLe0rwDbSS5qlu2h6FIz2q7TU+YrqQBUvgAa+ZSESnz
         Q9Rw==
X-Forwarded-Encrypted: i=1; AJvYcCWMXh8oII1BoUhiQI0EWSn6gNfeLMhf51OMTaVtoe26u+14ImY4zB3zc7isVpp3DQQ6aYMjaa6mQEOtwg==@lists.infradead.org
X-Gm-Message-State: AOJu0YyJmpmemZtdAmnTwpJtAO2MwsnzzmiAuI4vuWHRwrrPBuqKuNhR
	dATevImQamZfLGChUitxVrmChtoRwwqqVHiAnLdGbQCUU31ho42n0V+Tt22JDEfdkyoY1pKIXBs
	RYxIGThl1gu/Po/Qo2vgRdybdg12vCosapN2D2MkFb61OS+kqwjfCwiRwdCOt+s86kDFBxw==
X-Gm-Gg: ASbGncshXvL4JvQVhPZ45CaZHV/YhjdwwMI9/OSPrpaxNOEYrVCc7Vx8ezJlQEInkb+
	k5pGdZP2ukntLeCJKlpAlfOiExAfemloBkEf5U7rYBnnkIt4aLSdWeOeVPuGbAdo2fdrEMDrOLE
	TIjr8pFG8bh1CxUAGxXsFljDuWILabz45jrBauQXyaQ3bC4pPxcLoZ1iKTS3YwGNj1xr6P8VQhJ
	YiVDlmsmpSaHKjtC7aJvp8KigMAPujpViWjmYwRQeovZHdgHsuwbZwj4hHUltJAXJ+qI12OJlWo
	AhFMMFQeGILhajro/UPH31Na1m7EvVI39tfwvM7t64bGjm05jfi3KHbSuIl2T8crLFWZWB0DLhT
	6YFu2kdYTtVyHYfySOYBeyysnNbGn6xcx/mesVfdRqUkyAsYZSxn0ap+kghLtf3P5dKQ=
X-Received: by 2002:a05:600c:354f:b0:45f:2c7c:c1ed with SMTP id 5b1f17b1804b1-45f2c7cc3dcmr34398625e9.2.1757944381495;
        Mon, 15 Sep 2025 06:53:01 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHcLx/v+RcvjN7afogw7EpWBGd7QAXnqzzVsXD0ZOV8pq1yT5xn6CvxOmjMR8tWQ2JOMsAx5g==
X-Received: by 2002:a05:600c:354f:b0:45f:2c7c:c1ed with SMTP id 5b1f17b1804b1-45f2c7cc3dcmr34398405e9.2.1757944381060;
        Mon, 15 Sep 2025 06:53:01 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f18:f900:e0ae:65d5:8bf8:8cfd? (p200300d82f18f900e0ae65d58bf88cfd.dip0.t-ipconnect.de. [2003:d8:2f18:f900:e0ae:65d5:8bf8:8cfd])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45e017bfd14sm179952405e9.21.2025.09.15.06.52.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 15 Sep 2025 06:53:00 -0700 (PDT)
Message-ID: <9c66e21b-c782-4ed5-b89d-0d7412ef3c85@redhat.com>
Date: Mon, 15 Sep 2025 15:52:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V12 1/5] mm: softdirty: Add pgtable_supports_soft_dirty()
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
 <20250915101343.1449546-2-zhangchunyan@iscas.ac.cn>
From: David Hildenbrand <david@redhat.com>
Autocrypt: addr=david@redhat.com; keydata=
 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
 qIws/H2t
In-Reply-To: <20250915101343.1449546-2-zhangchunyan@iscas.ac.cn>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 1a8ltU3c0xplbc_zHHpJMwiYeMDR3OGnqsLDu5fTg94_1757944382
X-Mimecast-Originator: redhat.com
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250915_065305_672950_5BF9C35B 
X-CRM114-Status: GOOD (  14.04  )
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
> Some platforms can customize the PTE PMD entry soft-dirty bit making it
> unavailable even if the architecture provides the resource.
> 
> Add an API which architectures can define their specific implementations
> to detect if soft-dirty bit is available on which device the kernel is
> running.

You should probably mention that we are removing "ifdef 
CONFIG_MEM_SOFT_DIRTY" in favor of pgtable_supports_soft_dirty() checks 
that defaults to IS_ENABLED(CONFIG_MEM_SOFT_DIRTY) if not overriden by 
the arch -> no change in behavior expected.

Then you should mention that we make sure to never set VM_SOFTDIRTY if 
!pgtable_supports_soft_dirty(), so we will never run into VM_SOFTDIRTY 
checks.

> 
> Signed-off-by: Chunyan Zhang <zhangchunyan@iscas.ac.cn>
> ---
>   fs/proc/task_mmu.c      | 15 ++++++---------
>   include/linux/mm.h      |  3 +++
>   include/linux/pgtable.h | 12 ++++++++++++
>   mm/debug_vm_pgtable.c   | 10 +++++-----
>   mm/huge_memory.c        | 13 +++++++------
>   mm/internal.h           |  2 +-
>   mm/mmap.c               |  6 ++++--
>   mm/mremap.c             | 13 +++++++------
>   mm/userfaultfd.c        | 10 ++++------
>   mm/vma.c                |  6 ++++--
>   mm/vma_exec.c           |  5 ++++-
>   11 files changed, 57 insertions(+), 38 deletions(-)
> 

Good! All relevant CONFIG_MEM_SOFT_DIRTY occurrences seem to be gone 
now, which is nice.

Nothing jumped at me, hoping this makes cross-compilers happy.

Acked-by: David Hildenbrand <david@redhat.com>

-- 
Cheers

David / dhildenb


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
