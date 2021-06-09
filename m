Return-Path: <SRS0=S+R5=LD=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 00ED9C48BCF
	for <linux-riscv@archiver.kernel.org>; Wed,  9 Jun 2021 10:58:08 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B4DD16136D
	for <linux-riscv@archiver.kernel.org>; Wed,  9 Jun 2021 10:58:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B4DD16136D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=redhat.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QzolAh9dFOmC/XAoCVK1TOUWHmJgObJW9suld5yDGHE=; b=yUb/Xv7/66naZG70McX2AYKUgL
	ThFvpgsOfnu1qUF+H1rn0JCxw31WvTt/KH30WaAjNhTLQahIg0gP6vWCASpnYwLC3mVmJOc+Rl/HJ
	1rIiPYkCvWh8X7yBWHaoyLM7+P7sBheAR0mfph2mq0TdCD4pji/051GxpAo0BA8cJy1HAdCdFDfaK
	XcD8GgGFql6KVMyjecMWtdGTdJteB8DbSXAARh8FUNCrTuqqN2kgoKsZlvo/moN0SdPgpb3rGYGvy
	qhkhkJ22ckRL3G8LyGpt4O21YFUd43gjnQidIn4kLO6opUsub+K6jJL1i0hztfjFrxu0rjaCJyAMT
	gDroKh6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lqvuA-00DC0W-2f; Wed, 09 Jun 2021 10:57:50 +0000
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lqvsT-00DAxO-IX
 for linux-riscv@lists.infradead.org; Wed, 09 Jun 2021 10:56:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623236164;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1eqcq/7KVFIFfww4JdqqnK/TUbif/qCxlnaAkIZ26tg=;
 b=XhbkTzLIxP/kCPYbdPkz2lNjcWWrTTwywSkuukPJX/ZGLAYCdC1RPoHuQWS0UbqoDw+MHH
 zHDpk7smthFA9q0TfeDrDNVCaxlhFEUKjKiwLCRw6HYWaBAwW6ECJIbHwP6wu40yxFzrK1
 x3ggkJKDQZ3GflUqR9fny9V7F4193AU=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-39-u4mRkNuHPwapqBFnTtpaew-1; Wed, 09 Jun 2021 06:56:03 -0400
X-MC-Unique: u4mRkNuHPwapqBFnTtpaew-1
Received: by mail-wr1-f72.google.com with SMTP id
 m27-20020a056000025bb0290114d19822edso10602420wrz.21
 for <linux-riscv@lists.infradead.org>; Wed, 09 Jun 2021 03:56:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=1eqcq/7KVFIFfww4JdqqnK/TUbif/qCxlnaAkIZ26tg=;
 b=JfJ/hKLCLCjF0Lh1fn2EOSlKy/WvXuPUGvEtonbTLjgQFuSWsoZz2pge5cPv5cCPrv
 kU9FLuTPjDSgigx6NncYNlbxMEo3xsgZSajg4EC9tH4Ws0HgaSKhMiArfrWwhTIItw25
 c5eSHOvfMeDhplNfkH2qGsoXDMgx0BCBhSyaXarDr/0q7RhqIlZRhHtDuWW0vkGPrAl6
 hFIKMsxQ/iRVODamSXKL89BsDvoUdlpBOlrbdVSjIrfBH8wSODj7+mCrW/Nc6S7Stkjy
 s/LdlLouzfPmVSfHrzMel04SUAoQsBBP7N9vH1C1c3LiQtyUj5R/ESy7CdOIADe4/11k
 DSuQ==
X-Gm-Message-State: AOAM532M3YXjvGxBxn+kldyveK4fJGE4rF+vNHP3F3shnSZKwKN9K7Uf
 ii3TRxAgq94zvDb+/hWPxJQwqplZ0t1fA6AE256sW7gmCYtMGK0Nk3KPRJ5raEmb2CkezzHU3Td
 U7c3/tTDuusQ7Pin90n048JDj4CZC
X-Received: by 2002:adf:ee46:: with SMTP id w6mr28365894wro.345.1623236162279; 
 Wed, 09 Jun 2021 03:56:02 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzQ49r+tRbGd1wOHU0mXbY7urMjvAihHVmP4oVaZtHRm+k2OFRov+Lj+Vo8CLpAoo+a81y7uQ==
X-Received: by 2002:adf:ee46:: with SMTP id w6mr28365871wro.345.1623236162032; 
 Wed, 09 Jun 2021 03:56:02 -0700 (PDT)
Received: from [192.168.3.132] (p5b0c611d.dip0.t-ipconnect.de. [91.12.97.29])
 by smtp.gmail.com with ESMTPSA id
 a4sm21295711wme.45.2021.06.09.03.56.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 09 Jun 2021 03:56:01 -0700 (PDT)
Subject: Re: [PATCH 7/9] docs: remove description of DISCONTIGMEM
To: Mike Rapoport <rppt@kernel.org>, Andrew Morton <akpm@linux-foundation.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Geert Uytterhoeven <geert@linux-m68k.org>, 
 Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Jonathan Corbet
 <corbet@lwn.net>, Matt Turner <mattst88@gmail.com>,
 Mike Rapoport <rppt@linux.ibm.com>, Richard Henderson <rth@twiddle.net>,
 Vineet Gupta <vgupta@synopsys.com>, kexec@lists.infradead.org,
 linux-alpha@vger.kernel.org, linux-arch@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org,
 linux-ia64@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org,
 linux-mm@kvack.org, linux-riscv@lists.infradead.org,
 linux-s390@vger.kernel.org, linux-sh@vger.kernel.org,
 linux-snps-arc@lists.infradead.org, linux-xtensa@linux-xtensa.org,
 linuxppc-dev@lists.ozlabs.org, sparclinux@vger.kernel.org
References: <20210602105348.13387-1-rppt@kernel.org>
 <20210602105348.13387-8-rppt@kernel.org>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
Message-ID: <6b92d273-dd0b-d67f-c2f6-cce13a33afd1@redhat.com>
Date: Wed, 9 Jun 2021 12:56:00 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210602105348.13387-8-rppt@kernel.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210609_035605_807964_B0290780 
X-CRM114-Status: GOOD (  33.52  )
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

On 02.06.21 12:53, Mike Rapoport wrote:
> From: Mike Rapoport <rppt@linux.ibm.com>
> 
> Remove description of DISCONTIGMEM from the "Memory Models" document and
> update VM sysctl description so that it won't mention DISCONIGMEM.
> 
> Signed-off-by: Mike Rapoport <rppt@linux.ibm.com>
> ---
>   Documentation/admin-guide/sysctl/vm.rst | 12 +++----
>   Documentation/vm/memory-model.rst       | 45 ++-----------------------
>   2 files changed, 8 insertions(+), 49 deletions(-)
> 
> diff --git a/Documentation/admin-guide/sysctl/vm.rst b/Documentation/admin-guide/sysctl/vm.rst
> index 586cd4b86428..ddbd71d592e0 100644
> --- a/Documentation/admin-guide/sysctl/vm.rst
> +++ b/Documentation/admin-guide/sysctl/vm.rst
> @@ -936,12 +936,12 @@ allocations, THP and hugetlbfs pages.
>   
>   To make it sensible with respect to the watermark_scale_factor
>   parameter, the unit is in fractions of 10,000. The default value of
> -15,000 on !DISCONTIGMEM configurations means that up to 150% of the high
> -watermark will be reclaimed in the event of a pageblock being mixed due
> -to fragmentation. The level of reclaim is determined by the number of
> -fragmentation events that occurred in the recent past. If this value is
> -smaller than a pageblock then a pageblocks worth of pages will be reclaimed
> -(e.g.  2MB on 64-bit x86). A boost factor of 0 will disable the feature.
> +15,000 means that up to 150% of the high watermark will be reclaimed in the
> +event of a pageblock being mixed due to fragmentation. The level of reclaim
> +is determined by the number of fragmentation events that occurred in the
> +recent past. If this value is smaller than a pageblock then a pageblocks
> +worth of pages will be reclaimed (e.g.  2MB on 64-bit x86). A boost factor
> +of 0 will disable the feature.
>   
>   
>   watermark_scale_factor
> diff --git a/Documentation/vm/memory-model.rst b/Documentation/vm/memory-model.rst
> index ce398a7dc6cd..30e8fbed6914 100644
> --- a/Documentation/vm/memory-model.rst
> +++ b/Documentation/vm/memory-model.rst
> @@ -14,15 +14,11 @@ for the CPU. Then there could be several contiguous ranges at
>   completely distinct addresses. And, don't forget about NUMA, where
>   different memory banks are attached to different CPUs.
>   
> -Linux abstracts this diversity using one of the three memory models:
> -FLATMEM, DISCONTIGMEM and SPARSEMEM. Each architecture defines what
> +Linux abstracts this diversity using one of the two memory models:
> +FLATMEM and SPARSEMEM. Each architecture defines what
>   memory models it supports, what the default memory model is and
>   whether it is possible to manually override that default.
>   
> -.. note::
> -   At time of this writing, DISCONTIGMEM is considered deprecated,
> -   although it is still in use by several architectures.
> -
>   All the memory models track the status of physical page frames using
>   struct page arranged in one or more arrays.
>   
> @@ -63,43 +59,6 @@ straightforward: `PFN - ARCH_PFN_OFFSET` is an index to the
>   The `ARCH_PFN_OFFSET` defines the first page frame number for
>   systems with physical memory starting at address different from 0.
>   
> -DISCONTIGMEM
> -============
> -
> -The DISCONTIGMEM model treats the physical memory as a collection of
> -`nodes` similarly to how Linux NUMA support does. For each node Linux
> -constructs an independent memory management subsystem represented by
> -`struct pglist_data` (or `pg_data_t` for short). Among other
> -things, `pg_data_t` holds the `node_mem_map` array that maps
> -physical pages belonging to that node. The `node_start_pfn` field of
> -`pg_data_t` is the number of the first page frame belonging to that
> -node.
> -
> -The architecture setup code should call :c:func:`free_area_init_node` for
> -each node in the system to initialize the `pg_data_t` object and its
> -`node_mem_map`.
> -
> -Every `node_mem_map` behaves exactly as FLATMEM's `mem_map` -
> -every physical page frame in a node has a `struct page` entry in the
> -`node_mem_map` array. When DISCONTIGMEM is enabled, a portion of the
> -`flags` field of the `struct page` encodes the node number of the
> -node hosting that page.
> -
> -The conversion between a PFN and the `struct page` in the
> -DISCONTIGMEM model became slightly more complex as it has to determine
> -which node hosts the physical page and which `pg_data_t` object
> -holds the `struct page`.
> -
> -Architectures that support DISCONTIGMEM provide :c:func:`pfn_to_nid`
> -to convert PFN to the node number. The opposite conversion helper
> -:c:func:`page_to_nid` is generic as it uses the node number encoded in
> -page->flags.
> -
> -Once the node number is known, the PFN can be used to index
> -appropriate `node_mem_map` array to access the `struct page` and
> -the offset of the `struct page` from the `node_mem_map` plus
> -`node_start_pfn` is the PFN of that page.
> -
>   SPARSEMEM
>   =========
>   
> 

Reviewed-by: David Hildenbrand <david@redhat.com>

-- 
Thanks,

David / dhildenb


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
