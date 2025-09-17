Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AFCCBCAC598
	for <linux-riscv@archiver.kernel.org>; Wed, 17 Sep 2025 07:25:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8DkswmGdlxiQkRF3H8OQZVRUGWDiA+L2gK2pV8pZ05A=; b=F8x85R29Es0Qj4
	elu0jjluPzPgIya8jjk411UayCX47snbbmPFyZRT0i8c2pA1zjIJPJzmHu2lhmqPGTlo77Jr5mFGk
	jH5iSxSNwUd9yBr5QfGLwk+CY+RcbWqyn+5UGjeTXWEREgHRhDX+1UFRSykwIu4AwArASwO8MmT4F
	BtDoLWwDmNJdw9UfSDEyniDKKesykGAKqfynkijoe29vsjLFYnQRs9XW2Jcfy6rVtmGCTKNxoiMoq
	WxkDvIzHsnLwGCNtUvv/bIYsdHH5q184MrInAYKcKluJZ8LIk5Sup3QdXb1rmavJ37pfiD2zFAH29
	fTzyGnT0Bba0RSpLCHhg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uymXX-0000000ATS2-0lRL;
	Wed, 17 Sep 2025 07:25:19 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uymXT-0000000ATQn-2fHb
	for linux-riscv@lists.infradead.org;
	Wed, 17 Sep 2025 07:25:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1758093914;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=dxO4as0Q5XxTHNvaMG0p9FD9iYcKS+h7Cf1+/OhamkI=;
	b=TTrZ8pul1fq0AfyJTB69hzXWb8wwqgpOypKf1qs3PnGCmyQ7JL2iVN5osR0LZaQUY6dnml
	BGmt/bltagzOWaqaiMduLnNh/kxjjqD9WPdCEtIQWxtHS5FwyCoa4OAgC0waHApp8HCaJi
	Dox98hoPPplyAt7E/gHNw9tzAuIi0Kk=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-498-4MIRh5_LNbiIWAdkQS-9jw-1; Wed, 17 Sep 2025 03:25:13 -0400
X-MC-Unique: 4MIRh5_LNbiIWAdkQS-9jw-1
X-Mimecast-MFC-AGG-ID: 4MIRh5_LNbiIWAdkQS-9jw_1758093912
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-3ea35489002so2390386f8f.0
        for <linux-riscv@lists.infradead.org>; Wed, 17 Sep 2025 00:25:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758093912; x=1758698712;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dxO4as0Q5XxTHNvaMG0p9FD9iYcKS+h7Cf1+/OhamkI=;
        b=Ndcc3gIwE4gUPc2YhKbUDERyORXdh0WG5joDCV8/ggsWIZnD06VKPVB/2UBBFszYDC
         ow9OYcVIgcOOy1lQdKfAWVxw1V6o+iSB1l4HZQ5FM3eEwW817Gh/r0YNedZF31ekPBQ3
         xDz0snEgXXhwzv2PlsIdDNn9xEKtF5jVgO4kFDFefJDFpAK2u9pRDe0vqADIPvqsgvXf
         p/8iCKkhVx8hBDuFTS0cBHr2SwXA9JoqDcrLNrKmNbc/nFXDzSTfv1znMTR1z3q8xGiv
         DDvdbI43UTUoTySwFwPM1RWvnMHepfDDh2RaMvJnR2+5fWGPydK62SqkDuthDR7UKdxC
         l26A==
X-Forwarded-Encrypted: i=1; AJvYcCVD3viyUtWwtimpEA9XWFOGcdRBd0ofn7c68Hl7GC2cvsrTMPIP/ycGMFBKf9GDvmwFWNfZMv+YpZmzWg==@lists.infradead.org
X-Gm-Message-State: AOJu0YxqXqf/DN485/fcy/LoDRaAKoL7eGBibx7dJTucubPWZ6R7VrYR
	BhdqsyxSnk6MyYwQQBshfaQv0vyABdCNxByRT4Cc5DGqOorqCFAF3Bkdpsw6YpyqVN8Ykr5Du6v
	vlsVKD2s0IFX+Fhbt6q+XGeKb2peDm7zh2eVt/gqc8U2VV5sXzeWKOhfmrq9bvRq4wbqvxg==
X-Gm-Gg: ASbGncuSi1/uQDS5cnn4qDc4Zw8rlXaOVCpKPlCEGX32DodSIzrjk12DOHoZOCQ94Ol
	Xa+GxyjtBoV//qJBKv0akXixV/1Uzr5HDfKmHoVlx+lmZzp2Jcci9UWIKddkRmELyPzUFnlQGqs
	JcDTMSksjFzdv3VttDk4z++tIkyJXGXaf7+k0XnKFVjuTVNAxs+b7xs35Rtz55bJpXcigXLk1cA
	zbIqTBF6QMoLSHIX560H+5kwOeHxLvuuY2klChQO0dfNN7Hy1UIN0kUSUhr/dem0EEwZn0wRuo9
	cQgH3qatZwv/rn+Qd+LldKrAtKi4fydgteI5Ylg8TA9JtzP0OqdWW2G+mD4bkQ9uSX38ag23UG1
	aAx9WI7a/DHX7pCSyzIPGe0Mg2DepqBQbUsGb3WKXQFFA2g5PNjH23vD4Q5TVZrKK
X-Received: by 2002:a05:6000:4013:b0:3dc:45be:4a7f with SMTP id ffacd0b85a97d-3ecdfa3f966mr872679f8f.57.1758093911909;
        Wed, 17 Sep 2025 00:25:11 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFEHva7vHUul9vtNQdESzjClBi0RsKFeJIXOBVMnY44/FxLP75Brxg4KOfMIxcyqeJlJmK3fQ==
X-Received: by 2002:a05:6000:4013:b0:3dc:45be:4a7f with SMTP id ffacd0b85a97d-3ecdfa3f966mr872646f8f.57.1758093911401;
        Wed, 17 Sep 2025 00:25:11 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f27:6d00:7b96:afc9:83d0:5bd? (p200300d82f276d007b96afc983d005bd.dip0.t-ipconnect.de. [2003:d8:2f27:6d00:7b96:afc9:83d0:5bd])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3ece1247bb5sm390090f8f.12.2025.09.17.00.25.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 17 Sep 2025 00:25:10 -0700 (PDT)
Message-ID: <bc87f2a8-7a9c-4416-9106-bdf4b98e40a8@redhat.com>
Date: Wed, 17 Sep 2025 09:25:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V13 2/6] mm: userfaultfd: Add pgtable_supports_uffd_wp()
To: Chunyan Zhang <zhangchunyan@iscas.ac.cn>,
 linux-riscv@lists.infradead.org, linux-fsdevel@vger.kernel.org,
 linux-mm@kvack.org, linux-kernel@vger.kernel.org
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>, Conor Dooley <conor@kernel.org>,
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
References: <20250917033703.1695933-1-zhangchunyan@iscas.ac.cn>
 <20250917033703.1695933-3-zhangchunyan@iscas.ac.cn>
From: David Hildenbrand <david@redhat.com>
Autocrypt: addr=david@redhat.com; keydata=
 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
 qIws/H2t
In-Reply-To: <20250917033703.1695933-3-zhangchunyan@iscas.ac.cn>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 14pf3Nl7YNKJu1tiBItUQvmDK_TaVHjaOtTv7tQJ_7c_1758093912
X-Mimecast-Originator: redhat.com
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250917_002516_123635_403457AA 
X-CRM114-Status: GOOD (  17.09  )
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

On 17.09.25 05:36, Chunyan Zhang wrote:
> Some platforms can customize the PTE/PMD entry uffd-wp bit making
> it unavailable even if the architecture provides the resource.
> This patch adds a macro API that allows architectures to define their
> specific implementations to check if the uffd-wp bit is available
> on which device the kernel is running.
> 
> Also this patch is removing "ifdef CONFIG_HAVE_ARCH_USERFAULTFD_WP" and
> "ifdef CONFIG_PTE_MARKER_UFFD_WP" in favor of pgtable_supports_uffd_wp()
> and uffd_supports_wp_marker() checks respectively that default to
> IS_ENABLED(CONFIG_HAVE_ARCH_USERFAULTFD_WP) and
> "IS_ENABLED(CONFIG_HAVE_ARCH_USERFAULTFD_WP) && IS_ENABLED(CONFIG_PTE_MARKER_UFFD_WP)"
> if not overridden by the architecture, no change in behavior is expected.
> 
> Acked-by: David Hildenbrand <david@redhat.com>
> Signed-off-by: Chunyan Zhang <zhangchunyan@iscas.ac.cn>
> ---

[...]

Taking another look.

>   /* mm helpers */
> @@ -415,68 +475,24 @@ static inline bool vma_has_uffd_without_event_remap(struct vm_area_struct *vma)
>   	return false;
>   }
>   
> -#endif /* CONFIG_USERFAULTFD */
> -
>   static inline bool userfaultfd_wp_use_markers(struct vm_area_struct *vma)
>   {
> -	/* Only wr-protect mode uses pte markers */
> -	if (!userfaultfd_wp(vma))
>   		return false;

Isn't this indented one level too deep?

> -
> -	/* File-based uffd-wp always need markers */
> -	if (!vma_is_anonymous(vma))
> -		return true;
> -
> -	/*
> -	 * Anonymous uffd-wp only needs the markers if WP_UNPOPULATED
> -	 * enabled (to apply markers on zero pages).
> -	 */
> -	return userfaultfd_wp_unpopulated(vma);
>   }
>   
>   static inline bool pte_marker_entry_uffd_wp(swp_entry_t entry)
>   {
> -#ifdef CONFIG_PTE_MARKER_UFFD_WP
> -	return is_pte_marker_entry(entry) &&
> -	    (pte_marker_get(entry) & PTE_MARKER_UFFD_WP);
> -#else
> -	return false;
> -#endif
> +		return false;

Same here.

>   }
>   
>   static inline bool pte_marker_uffd_wp(pte_t pte)
>   {
> -#ifdef CONFIG_PTE_MARKER_UFFD_WP
> -	swp_entry_t entry;
> -
> -	if (!is_swap_pte(pte))
>   		return false;

Same here.

> -
> -	entry = pte_to_swp_entry(pte);
> -
> -	return pte_marker_entry_uffd_wp(entry);
> -#else
> -	return false;
> -#endif
>   }


-- 
Cheers

David / dhildenb


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
