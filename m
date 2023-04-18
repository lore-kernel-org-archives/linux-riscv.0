Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5F32C6FD18
	for <linux-riscv@archiver.kernel.org>; Tue, 18 Apr 2023 15:45:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=897z+TM2At/EXYhFUcTIpdvluvhvyjFvXp4lhjQArN0=; b=HPbZsiQSw6Zp5H
	ANmTrPfgbUzjYeWAOwe1Vq9gOEDm9ojYQprY3vuALugbFwL00z1FZb0DONhjqbyikdR5nCbUmzLtm
	dIXRrqO8qN2z1ZDcqLTVOkm0GJEo3NvlLF1JjDctZ/MQIeyRx1rgrLY/OeKDgj0bakfzSgnn7LRWA
	eTu8BRWd0J1WsJZ1XCqvBpyfA0JTHrZUycqSLgMRmvlYkeRhs7fMIPd23tRy+MTSAHCKitfGB6H19
	6T+E8HThdUdHlJTjp7ctKn+2Uge69X2cDkZDiamoidhSRGZeag6bfoEtUDG76wPqm1DhyPBiMY69P
	32epueY2tP+7RaOezxYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1ponW5-002fOC-0u;
	Tue, 18 Apr 2023 15:45:13 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1ponW2-002fML-07
	for linux-riscv@lists.infradead.org;
	Tue, 18 Apr 2023 15:45:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1681832709;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=27YuiGTc/1Ayk3pIwHwifC0cK9cQSm41NYDsP6qMI7E=;
	b=CDPJWjw7922+HWw5MqXWuotkaTCG5XVEvGU1OSihcrxAc9NydIVybPt59TN32MBRtuA/5m
	UFxuV07/YeaK2h96WTHKE4Xc2Lrlnzyri5go6ZXhcHvV4A47wf/QxXJa4YP8FT4DCwQ8QM
	+Mu/7eMO8xZc5VF/cbvXjIiEcZcwDkE=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-544-J5DnBFZkOrGO8Fb3izqNzQ-1; Tue, 18 Apr 2023 11:45:07 -0400
X-MC-Unique: J5DnBFZkOrGO8Fb3izqNzQ-1
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-3f08ed462c0so42522925e9.1
        for <linux-riscv@lists.infradead.org>; Tue, 18 Apr 2023 08:45:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681832706; x=1684424706;
        h=content-transfer-encoding:in-reply-to:organization:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=27YuiGTc/1Ayk3pIwHwifC0cK9cQSm41NYDsP6qMI7E=;
        b=bR9Y27EmpyvrVkLM+gW0E61QyGmPJFf5hUDnG5FFrSri2EWU8qM999K5Pt7McwdJxe
         NNbXLBpwYD1nH8ENfA2aeWNT8G4YKDkkecrzD+ZB3j0DX1BSkM+GPKC3G2yTRMGnRANJ
         eHCdsEUmulYMx/xhTd0Hh9i0Kn+42wAt+K3kKL5dPTjxn77sb614p3sHF2iZALvYxP2o
         TF6tlQX3oOE8EgcQgiRtRtg1mhhq5+3AQsyDK0IS0oos9IOdMzwiqV28nA+M8d7GM7Pl
         5jtXU0iQAKv/cAYE5ohzb2F3Ybyc7773/l/qNYD6nbz++Uz5uf6aA939LFXjG0PwQrzh
         8k9A==
X-Gm-Message-State: AAQBX9cMcrv16Eh+KBKK+T4g4DH/VEhcg2WwmgeF6AeixYSL9qUQiFeF
	L3XSfNL4t08Tvw157bSNEO12TVuVEiKCIpvTPiMwTZOteGFwJl5hnpiz5bjo9loT+LmUEhV8ab2
	dxv+bZF/hN35ARqavXu83xH2UqBUR
X-Received: by 2002:a5d:6dcc:0:b0:2ef:b8ae:8791 with SMTP id d12-20020a5d6dcc000000b002efb8ae8791mr2341930wrz.10.1681832706618;
        Tue, 18 Apr 2023 08:45:06 -0700 (PDT)
X-Google-Smtp-Source: AKy350boD2pgyaTgtT87B/OGZT/ZiXFytTcP4U4+Qx8x/yMODSTgYDG7+n20ySQtuSYJgFc2NPKTdg==
X-Received: by 2002:a5d:6dcc:0:b0:2ef:b8ae:8791 with SMTP id d12-20020a5d6dcc000000b002efb8ae8791mr2341904wrz.10.1681832706235;
        Tue, 18 Apr 2023 08:45:06 -0700 (PDT)
Received: from ?IPV6:2003:cb:c715:3f00:7545:deb6:f2f4:27ef? (p200300cbc7153f007545deb6f2f427ef.dip0.t-ipconnect.de. [2003:cb:c715:3f00:7545:deb6:f2f4:27ef])
        by smtp.gmail.com with ESMTPSA id z10-20020a5d654a000000b002daeb108304sm13380984wrv.33.2023.04.18.08.45.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Apr 2023 08:45:05 -0700 (PDT)
Message-ID: <da600570-51c7-8088-b46b-7524c9e66e5d@redhat.com>
Date: Tue, 18 Apr 2023 17:45:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH 01/33] s390: Use _pt_s390_gaddr for gmap address tracking
To: "Vishal Moola (Oracle)" <vishal.moola@gmail.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Matthew Wilcox <willy@infradead.org>
Cc: linux-mm@kvack.org, linux-arch@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-csky@vger.kernel.org,
 linux-hexagon@vger.kernel.org, loongarch@lists.linux.dev,
 linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org,
 linux-openrisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
 linux-sh@vger.kernel.org, sparclinux@vger.kernel.org,
 linux-um@lists.infradead.org, xen-devel@lists.xenproject.org,
 kvm@vger.kernel.org
References: <20230417205048.15870-1-vishal.moola@gmail.com>
 <20230417205048.15870-2-vishal.moola@gmail.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
In-Reply-To: <20230417205048.15870-2-vishal.moola@gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230418_084510_147060_3252A88C 
X-CRM114-Status: GOOD (  16.94  )
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

On 17.04.23 22:50, Vishal Moola (Oracle) wrote:
> s390 uses page->index to keep track of page tables for the guest address
> space. In an attempt to consolidate the usage of page fields in s390,
> replace _pt_pad_2 with _pt_s390_gaddr to replace page->index in gmap.
> 
> This will help with the splitting of struct ptdesc from struct page, as
> well as allow s390 to use _pt_frag_refcount for fragmented page table
> tracking.
> 
> Since page->_pt_s390_gaddr aliases with mapping, ensure its set to NULL
> before freeing the pages as well.
> 
> Signed-off-by: Vishal Moola (Oracle) <vishal.moola@gmail.com>
> ---

[...]

> diff --git a/include/linux/mm_types.h b/include/linux/mm_types.h
> index 3fc9e680f174..2616d64c0e8c 100644
> --- a/include/linux/mm_types.h
> +++ b/include/linux/mm_types.h
> @@ -144,7 +144,7 @@ struct page {
>   		struct {	/* Page table pages */
>   			unsigned long _pt_pad_1;	/* compound_head */
>   			pgtable_t pmd_huge_pte; /* protected by page->ptl */
> -			unsigned long _pt_pad_2;	/* mapping */
> +			unsigned long _pt_s390_gaddr;	/* mapping */
>   			union {
>   				struct mm_struct *pt_mm; /* x86 pgds only */
>   				atomic_t pt_frag_refcount; /* powerpc */

The confusing part is, that these gmap page tables are not ordinary 
process page tables that we would ordinarily place into this section 
here. That's why they are also not allocated/freed using the typical 
page table constructor/destructor ...

-- 
Thanks,

David / dhildenb


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
