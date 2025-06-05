Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 538D1C5B543
	for <linux-riscv@archiver.kernel.org>; Thu,  5 Jun 2025 06:13:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=h3iOd4Lv/6IfCHkdbczwtuX9kHa6BohGc6s4Y0nIyaY=; b=XOeQhhaiViZRFa
	dLZJoDq9EEzMJ1+bZUPkZxqM1+G4hFYDI40zguXJMfuXghxdCfMuOlVpQ0jgUz81DYl4Q0C7Dn3Qb
	1OLOtm1dlZ4xL7A7bM+/eUqrUV++korIurz3kb57O5n2tbZfctnfiwbo+HpNfIUJi6bVs2i0QYWqM
	NzzyVgn5ps/NWBU2r+rd7c0q1oRXprf2QBXPvpcsfZtNn90qnhNX1KO38UFH+fUnRjBd0hOAy/fx/
	HTf3PLUzb1PMqAJaEth66JYxc4VP1pbq0Ae4pwj1ha1oN7UJ9HJlt3C9mhgoHUugURzU/MlO8YGDI
	BgqyAzLREqDLkaYyVw6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uN3rH-0000000EoV4-2QPP;
	Thu, 05 Jun 2025 06:13:47 +0000
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uN3rD-0000000EoTq-128U
	for linux-riscv@lists.infradead.org;
	Thu, 05 Jun 2025 06:13:45 +0000
Received: by mail-pj1-x102c.google.com with SMTP id 98e67ed59e1d1-312028c644bso497767a91.0
        for <linux-riscv@lists.infradead.org>; Wed, 04 Jun 2025 23:13:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1749104018; x=1749708818; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Hn7NBr5TJWjNI8T2dY/UzcUhiHMyl/nutXcvd+GUfmM=;
        b=KMlx5FWJF48dOAHLFLOzCTf6Z3sIuQoyJaVqcBI8kgx9sTrTlVyDt+CP+JlYdeG/IA
         cyhMkOAktDpn+Icr6DMMwweWjfbSU5aTnD9PcqbjdhO5nDZM6nDTQvyrSRBk8JZQggeg
         t2sC8atgELWhS3w+QuPYkvkqajHdrLotgYMglcUCyM/JYg6PuTFTsl7fRqUwuyUJ6DUQ
         Asf2bczkSd49gXzs/Xz8ocsBUxd2OmNBh2shHKwu3PGHdNMzvKf+Ym90M0WleLtDc+Ge
         H+K48CLM6vqJiVf4vWms/i20dUSsteD93bcVThZ0gGiMcKmAzZP2e3XFJ0Y2zQ5WLzBk
         CqFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749104018; x=1749708818;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Hn7NBr5TJWjNI8T2dY/UzcUhiHMyl/nutXcvd+GUfmM=;
        b=eAxl9/DCK41GXCE7dhiAkZwewiE7eZukbuHVc+hMTG4TvcFK5SlEHjohsLmZUr7b7I
         FG3oIWbIeOXpjl69Gt9XJxr0p2KaW5MOt2C9IHbNR1OHdV7l/2aMXEMs0H2sW0Q+zBY4
         qtUcgS8PASeKwLNHLlKnbJELH59HE6rNLvg3IrsvUGf2rRW1vFs+cuP2V+35wLIhnYh0
         OeMQbXR3L6Alu5fcyy1i6dXPoc8SB8hIM43liZuzzE7zSdaSGVizaTKEhjbPPfR4VlRN
         b7jLaCtrvMl5N99nM23IK2eexuSaGVIwT+lpwbzNA19PFK1ICCE60Pvcfs14bXYfiybm
         DkhA==
X-Forwarded-Encrypted: i=1; AJvYcCW/mhcX/GlzEzPxct2DFXZ5Btfu/rYk5kov4MSqZ5H3JEyYmF387AhSB9mbiUz3gNkdS0s8Ue4H9VKuRA==@lists.infradead.org
X-Gm-Message-State: AOJu0YzP8Wy3UkFEleATgr0VgkziOIMwNPT1+X2G9OORXJAqT9VlOpvp
	u3hfePjTqgWoSA6jS+jtG9hKidgaJwjTVogk7qh2xYFnR1SJfoKSYxkwrOT5Xdfy7WY=
X-Gm-Gg: ASbGncsZgSRJaEDHycCqPU7sLDIhFJkMT2/7L+nVYp26Wx0GmfIjjbvjW37DFP6907r
	alc4nOZuKTYRsqKj9VlkQu9Gi29o0i0zPl+zqe4Ne6ET5IUzx+HTpH2MKqmPVt2ObRomDjXiWH0
	trdc0W/KHWvbSUIPVOFDCEd1JytljorzbN0wpmPzLaO/MAjGC8QBqUUaV60Jsec7tyOl/XrOfi9
	KuJxMBERToI7A0TiW5JNGwvYORBHYpNrt1SMc67g2ZACQzvNVkJ8wB6vtfqWLFHu68+wM/jrSIY
	yOUhV8UiKBkv335D+ICx9seoA9hH9MJYN16/2h50Ui0saUSyLGX2h44PR4mWo13LkocnJk896t4
	=
X-Google-Smtp-Source: AGHT+IHDy86FEw+vzJcbrf39p87S4pydRZ7lyu+1r5y5V92k7PKGXeaSlNE+WkPTO7jTgdMiiqKipg==
X-Received: by 2002:a17:90b:5290:b0:311:9c9a:58c5 with SMTP id 98e67ed59e1d1-3130cd146e2mr10841635a91.12.1749104018411;
        Wed, 04 Jun 2025 23:13:38 -0700 (PDT)
Received: from [10.68.122.90] ([63.216.146.178])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-313319020e0sm477078a91.12.2025.06.04.23.13.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Jun 2025 23:13:37 -0700 (PDT)
Message-ID: <1fd82421-90ad-4952-8fc0-77859f861570@bytedance.com>
Date: Thu, 5 Jun 2025 14:13:27 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] mm/pagewalk: split walk_page_range_novma() into
 kernel/user parts
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: Barry Song <baohua@kernel.org>, David Hildenbrand <david@redhat.com>,
 "Liam R . Howlett" <Liam.Howlett@oracle.com>,
 Vlastimil Babka <vbabka@suse.cz>, Mike Rapoport <rppt@kernel.org>,
 Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>,
 Muchun Song <muchun.song@linux.dev>, Oscar Salvador <osalvador@suse.de>,
 Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>,
 Jonas Bonn <jonas@southpole.se>,
 Stefan Kristiansson <stefan.kristiansson@saunalahti.fi>,
 Stafford Horne <shorne@gmail.com>, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>, Jann Horn <jannh@google.com>,
 loongarch@lists.linux.dev, linux-kernel@vger.kernel.org,
 linux-openrisc@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-mm@kvack.org, Andrew Morton <akpm@linux-foundation.org>
References: <20250604141958.111300-1-lorenzo.stoakes@oracle.com>
From: Qi Zheng <zhengqi.arch@bytedance.com>
In-Reply-To: <20250604141958.111300-1-lorenzo.stoakes@oracle.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250604_231343_619829_E0105D38 
X-CRM114-Status: GOOD (  23.09  )
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



On 6/4/25 10:19 PM, Lorenzo Stoakes wrote:
> The walk_page_range_novma() function is rather confusing - it supports two
> modes, one used often, the other used only for debugging.
> 
> The first mode is the common case of traversal of kernel page tables, which
> is what nearly all callers use this for.
> 
> Secondly it provides an unusual debugging interface that allows for the
> traversal of page tables in a userland range of memory even for that memory
> which is not described by a VMA.
> 
> It is far from certain that such page tables should even exist, but perhaps
> this is precisely why it is useful as a debugging mechanism.
> 
> As a result, this is utilised by ptdump only. Historically, things were
> reversed - ptdump was the only user, and other parts of the kernel evolved
> to use the kernel page table walking here.
> 
> Since we have some complicated and confusing locking rules for the novma
> case, it makes sense to separate the two usages into their own functions.
> 
> Doing this also provide self-documentation as to the intent of the caller -
> are they doing something rather unusual or are they simply doing a standard
> kernel page table walk?
> 
> We therefore establish two separate functions - walk_page_range_debug() for
> this single usage, and walk_kernel_page_table_range() for general kernel
> page table walking.
> 
> We additionally make walk_page_range_debug() internal to mm.
> 
> Note that ptdump uses the precise same function for kernel walking as a
> convenience, so we permit this but make it very explicit by having
> walk_page_range_novma() invoke walk_kernel_page_table_range() in this case.
> 
> Signed-off-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
> Acked-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
> ---
> v2:
> * Renamed walk_page_range_novma() to walk_page_range_debug() as per David.
> * Moved walk_page_range_debug() definition to mm/internal.h as per Mike.
> * Renamed walk_page_range_kernel() to walk_kernel_page_table_range() as
>    per David.
> 
> v1 resend:
> * Actually cc'd lists...
> * Fixed mistake in walk_page_range_novma() not handling kernel mappings and
>    update commit message to referene.
> * Added Mike's off-list Acked-by.
> * Fixed up comments as per Mike.
> * Add some historic flavour to the commit message as per Mike.
> https://lore.kernel.org/all/20250603192213.182931-1-lorenzo.stoakes@oracle.com/
> 
> v1:
> (accidentally sent off-list due to error in scripting)
> 
>   arch/loongarch/mm/pageattr.c |  2 +-
>   arch/openrisc/kernel/dma.c   |  4 +-
>   arch/riscv/mm/pageattr.c     |  8 +--
>   include/linux/pagewalk.h     |  7 ++-
>   mm/hugetlb_vmemmap.c         |  2 +-
>   mm/internal.h                |  4 ++
>   mm/pagewalk.c                | 98 ++++++++++++++++++++++++------------
>   mm/ptdump.c                  |  3 +-
>   8 files changed, 82 insertions(+), 46 deletions(-)
> 

Acked-by: Qi Zheng <zhengqi.arch@bytedance.com>

Thanks.



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
