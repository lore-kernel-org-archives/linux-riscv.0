Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 851E5CAC59F
	for <linux-riscv@archiver.kernel.org>; Thu, 18 Sep 2025 09:03:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oxAC/srg21M9QXGz3lKAm8KFJ0PwJIbe8oth0sEh/js=; b=XX3+SBsL7ETwR7
	5btcxZg6z6CF8k+8jk7Rm39pCMIIjZAGUwvb33BMR4X8LoWnA9PUXK3e2BLLPxLiaIzVmJcIH6nSe
	0JFBbUKeQKDlzwd2NfSUIR4hw41Tpguk/AvOAjr4sajTPnuNSNqOKN6tQDNVJdG6EQi4r2ZaUsftE
	THSR6S8Jv3ByKy6ltiIJN8sEG0IPQUIW6n6Zg7zgZiGWcj2AoV27fqiG0tdMT02MNHaJ7/2d3I6hL
	9Zx2lhxgZACg6ExO+WXtNI4FHIulYSdU4y5qTMlEVg1RU0MFYDiVHeSEfXErM8nsFSFjEDoasnB2k
	g1IA5ZjhPXJS5z8U0b3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzAXn-0000000Gnqi-3Jch;
	Thu, 18 Sep 2025 09:03:11 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzAXl-0000000Gnpj-1sAH
	for linux-riscv@lists.infradead.org;
	Thu, 18 Sep 2025 09:03:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1758186188;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=XFCZX9eN7thiq9pavKtpP8J9JCm4he2B7yCgrgp98u4=;
	b=MCjtsiz4r9xGj+hY01nwJfnHfS/x74Wez0cQH0RlxB6nI6WsptM4xKY+TOJotUsgpZev9X
	wb/PWgC8Oc9RujZKW7PV3HM1CnV/p2eAQIF3GoyvhHSTUZjm7bcurfjEwwCrKcbtx8eAgh
	OUUiP4Rc3MsrCmEwdgpxAdJVriCXSbY=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-660-PdnHK873PCOqOLkwjIHRXQ-1; Thu, 18 Sep 2025 05:03:06 -0400
X-MC-Unique: PdnHK873PCOqOLkwjIHRXQ-1
X-Mimecast-MFC-AGG-ID: PdnHK873PCOqOLkwjIHRXQ_1758186185
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-3ee10a24246so334940f8f.3
        for <linux-riscv@lists.infradead.org>; Thu, 18 Sep 2025 02:03:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758186185; x=1758790985;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XFCZX9eN7thiq9pavKtpP8J9JCm4he2B7yCgrgp98u4=;
        b=FrUaEOrO6R9sQokNPzCDJ1dNJo9eYZYeiAkoeYieLhW7jWrmvo5accmHNJiTdnFFEP
         7uHGlCmlBeLeeFeOBQVrwf2pWhNM8KSMuKo0VLVwQtSVqsX86H8mPq2nkNNpz5uOvJyU
         94lvst1lkp9mWR4G872jV3vddbC+i8WD2SURuoPj65pPaqEfp0o1L4VHOXJA0lni1xiC
         9iTy41ohvza5LidRA3mSnHdU51MDLZbT62FbwZYpAYg59G1VUg/2Mhs8vw6iA454WDFC
         IeTv+3qACIjB6kQbC3GtbCMUL/VjEEXSixYevTjtvK0ug6vugGH5WTPbRme69odr9h8O
         kosA==
X-Forwarded-Encrypted: i=1; AJvYcCVKqdfw4PG6XaF78xplh++o4Ddn+acYmtdY1cER7xhek0ZdNcO3lzyxyDa0BRb51Gnr8EvMBy6FUV8wSg==@lists.infradead.org
X-Gm-Message-State: AOJu0YxneZS/OEgbVN86EeCcV7nWO0FSErShNWDS0+mkGKkzeQKpzkSp
	GjSqmfZkcf6a4of0ShbGSUOMeelL6e3tIYKN1/ZM1OVudagY6kspbMng+FbSYfGwuY2Q+OoCKyy
	j+Of9jG3Yt3TfrpNdUNDkk5w35sOqwXu9EpRaUmfJt8XduU9THl97wRY58TQv3pYGVvnA+Q==
X-Gm-Gg: ASbGncsN1g2ue2Bz8fHFOGYmKEMsizCT6I98h+3kA3CGlzHQrohAhXN3i0dPu274No8
	UorNjMKk/8WyOcOfBrfq5Eo3PZ0wi0oYVsVYmf7uJddmQiVbT412SCmnH66uMC0w4agSvBYajn/
	PXrgPE6L0rZBu1iSFBKJGsUMasDyn+iERySyJgSMFRra3FRBLarfI0dHYM1wtUhDaQHwrRueSkE
	TdM2SJGJomyu0v2mkYiOlZQIUGxLYSCcBvq6MQFmm27arUBujoWwStZTn4miU3j+MLa8goFZRma
	dRIJoqhnrCrAxSGESWTFn7XmdykSOvYmlsaHvAR9SaTbyWwWhAcBhcm3FnodWUGr991mYoor2aH
	iLOjrtZFh8D3xi0a9Jpkits2+a+A4clREInkpsethJZNOo/W1ENYNMUHgk8JJp4zxOHS9
X-Received: by 2002:a05:6000:2313:b0:3e7:42ba:7e66 with SMTP id ffacd0b85a97d-3ecdf9f4477mr4804902f8f.3.1758186185417;
        Thu, 18 Sep 2025 02:03:05 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IElkxupMxmNif5/lzfzUVobHl0PSoeQ1IdEubg1s704Bcn0Lb4/+vf/JHCv5gGV276WTwwYSg==
X-Received: by 2002:a05:6000:2313:b0:3e7:42ba:7e66 with SMTP id ffacd0b85a97d-3ecdf9f4477mr4804839f8f.3.1758186184853;
        Thu, 18 Sep 2025 02:03:04 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f07:dd00:ca9c:199e:d2b6:9099? (p200300d82f07dd00ca9c199ed2b69099.dip0.t-ipconnect.de. [2003:d8:2f07:dd00:ca9c:199e:d2b6:9099])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4613e754140sm70721995e9.21.2025.09.18.02.03.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 18 Sep 2025 02:03:04 -0700 (PDT)
Message-ID: <45cd1637-54f6-4941-9670-7130aaf080f0@redhat.com>
Date: Thu, 18 Sep 2025 11:03:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V14 1/6] mm: softdirty: Add pgtable_supports_soft_dirty()
To: Chunyan Zhang <zhangchunyan@iscas.ac.cn>,
 linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor@kernel.org>,
 Deepak Gupta <debug@rivosinc.com>, Ved Shanbhogue <ved@rivosinc.com>,
 Alexander Viro <viro@zeniv.linux.org.uk>,
 Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>,
 Andrew Morton <akpm@linux-foundation.org>, Peter Xu <peterx@redhat.com>,
 Arnd Bergmann <arnd@arndb.de>, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 "Liam R . Howlett" <Liam.Howlett@oracle.com>,
 Vlastimil Babka <vbabka@suse.cz>, Mike Rapoport <rppt@kernel.org>,
 Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>,
 Axel Rasmussen <axelrasmussen@google.com>, Yuanchu Xie <yuanchu@google.com>,
 Chunyan Zhang <zhang.lyra@gmail.com>
References: <20250918083731.1820327-1-zhangchunyan@iscas.ac.cn>
 <20250918083731.1820327-2-zhangchunyan@iscas.ac.cn>
From: David Hildenbrand <david@redhat.com>
Autocrypt: addr=david@redhat.com; keydata=
 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
 qIws/H2t
In-Reply-To: <20250918083731.1820327-2-zhangchunyan@iscas.ac.cn>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: Yb1c6lDoWP-XYjXmg6rd3LjGpMv6jpK55RJ-MTxFEnw_1758186185
X-Mimecast-Originator: redhat.com
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250918_020309_560083_8AAD42C1 
X-CRM114-Status: GOOD (  17.90  )
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

On 18.09.25 10:37, Chunyan Zhang wrote:
> Some platforms can customize the PTE PMD entry soft-dirty bit making it
> unavailable even if the architecture provides the resource.
> 
> Add an API which architectures can define their specific implementations
> to detect if soft-dirty bit is available on which device the kernel is
> running.
> 
> This patch is removing "ifdef CONFIG_MEM_SOFT_DIRTY" in favor of
> pgtable_supports_soft_dirty() checks that defaults to
> IS_ENABLED(CONFIG_MEM_SOFT_DIRTY), if not overridden by
> the architecture, no change in behavior is expected.
> 
> We make sure to never set VM_SOFTDIRTY if !pgtable_supports_soft_dirty(),
> so we will never run into VM_SOFTDIRTY checks.
> 
> Acked-by: David Hildenbrand <david@redhat.com>
> Signed-off-by: Chunyan Zhang <zhangchunyan@iscas.ac.cn>
> ---

[...]

>   mas_store_fail:
> diff --git a/mm/vma_exec.c b/mm/vma_exec.c
> index 922ee51747a6..a822fb73f4e2 100644
> --- a/mm/vma_exec.c
> +++ b/mm/vma_exec.c
> @@ -107,6 +107,7 @@ int relocate_vma_down(struct vm_area_struct *vma, unsigned long shift)
>   int create_init_stack_vma(struct mm_struct *mm, struct vm_area_struct **vmap,
>   			  unsigned long *top_mem_p)
>   {
> +	unsigned long flags  = VM_STACK_FLAGS | VM_STACK_INCOMPLETE_SETUP;

No need to resend because of this (probably can be fixed up when 
applying): there is a double space before the "="

-- 
Cheers

David / dhildenb


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
