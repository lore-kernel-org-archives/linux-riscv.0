Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0869C43334
	for <linux-riscv@archiver.kernel.org>; Tue,  7 Jun 2022 12:22:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Subject:From:References:Cc:
	To:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ouTnJydXmMMve6yIhvoPMDpoNH3NXriAcoE/sUbL19I=; b=KaoreY0vLasPEt
	fK/peZViFwHy3ZgOKKFd3HmJxGTPciRxudiFkhuBmYIyih7l++Rn82KxDpMvYkWSBimC7JUXzHBBU
	OVVf5xnRMeGTxYBVme7U8WuVZGovkIMkF+KLiDraCRKtmjRY3KuLNVb5fHStZ3APedUNK1sKNVC/y
	y1SnP0SQq0ksS4ciOYtrTCk54mO0ckv6HFVxcuWXdNFw5cFfrbKpnrkEDMWKEu8cHa0WGw2IboPVH
	pslDTH9RSqqss6ug33oJ+EDepumnOTPTei3rPSY1YQ0AFB3u0UiFoEF1uBIOI9kn1MUcOYdAGP3po
	seUOtNrC5oCYxy53KOpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nyYE7-007JIC-BW; Tue, 07 Jun 2022 12:22:27 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nyYDj-007J8E-PR
	for linux-riscv@lists.infradead.org; Tue, 07 Jun 2022 12:22:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1654604522;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=LFae0+Vw/Q7XKFtLqEkht1EHSrvkXyEHWVa21iC8kcQ=;
	b=Dva+I0BHCKTTleH+R4CJSREUzVIK07grFVdalUZ3yHBRTfnWQkoAFDN6hLUeeCG2I/5KAQ
	SnXHjmVe8sPRAveLgsrVD2GwOUnZdOAbZdfKcIevjVHxrcD/w4LSFd8Hd3/zqlD8l453RG
	SMTHGHjdYiDnSSPafnz6CqtQjV407Mw=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-167-nEuWXBKlMlaM_UtOpKPbNA-1; Tue, 07 Jun 2022 08:21:59 -0400
X-MC-Unique: nEuWXBKlMlaM_UtOpKPbNA-1
Received: by mail-wr1-f69.google.com with SMTP id bw25-20020a0560001f9900b002175d64fd29so1948164wrb.9
        for <linux-riscv@lists.infradead.org>; Tue, 07 Jun 2022 05:21:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent
         :content-language:to:cc:references:from:organization:subject
         :in-reply-to:content-transfer-encoding;
        bh=LFae0+Vw/Q7XKFtLqEkht1EHSrvkXyEHWVa21iC8kcQ=;
        b=8DSkPO7n0uMOESyNh/rIRGXZKT135NL0dZE2BIr+DBCthc7llCaBiW2iFzNthFQ/uU
         Mg087zO44kZFGGzehPf7S/Un8sE9J/L47JhNf6PWwDw9PDwwlGiUBH7qrvCfvZxgb8YR
         3tVfSfykk74LWet8sHaXJBUEZPpKnEPV8FcGH7IydR2eTSeNaxobCTnctQX4OblxD7/0
         oCHnXJObs31uMOvzsxKXxI+3MOiYpZRSh07WOWvx9xxIg60tuffj5Gl32LM071xa3kAp
         3zc1TagSLmsQsTzLuJpgzw1GYidQUvnsvpz+XO7ghgTc5bT4C7dcmTWiOYF++Coq1CeB
         tgww==
X-Gm-Message-State: AOAM531grpqp3qSGISrzfnqz5JXf+bD4Oeqaj1I4Gb+GOnMU33hFfMan
	khyG42HZlGXl0EQNY69FTPJxel18PWH6FO9KWuduE/klQW55pubNZ+4h5u3479viqzHAJwqP2Zd
	0zfXWQwAvxPM3+dDLQKtGlEGM6LU5
X-Received: by 2002:a5d:6f07:0:b0:20f:e7b6:60e9 with SMTP id ay7-20020a5d6f07000000b0020fe7b660e9mr26970312wrb.452.1654604518592;
        Tue, 07 Jun 2022 05:21:58 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz6zVY8RJtypryJ4lRqoQ7sLYVvIPsHW+mIUVYuw6yWEgN87NIn1XVL3PPwxcCz6RZEMmu3Kw==
X-Received: by 2002:a5d:6f07:0:b0:20f:e7b6:60e9 with SMTP id ay7-20020a5d6f07000000b0020fe7b660e9mr26970280wrb.452.1654604518294;
        Tue, 07 Jun 2022 05:21:58 -0700 (PDT)
Received: from ?IPV6:2003:cb:c709:500:4c8d:4886:f874:7b6f? (p200300cbc70905004c8d4886f8747b6f.dip0.t-ipconnect.de. [2003:cb:c709:500:4c8d:4886:f874:7b6f])
        by smtp.gmail.com with ESMTPSA id eh2-20020a05600c61c200b0039c54f34948sm4284902wmb.5.2022.06.07.05.21.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Jun 2022 05:21:57 -0700 (PDT)
Message-ID: <99900b31-2605-2c85-a1b7-9ef2666b58da@redhat.com>
Date: Tue, 7 Jun 2022 14:21:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
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
 <20220607093805.1354256-6-mawupeng1@huawei.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
Subject: Re: [PATCH v3 5/6] mm: Add mirror flag back on initrd memory
In-Reply-To: <20220607093805.1354256-6-mawupeng1@huawei.com>
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220607_052203_927012_27C9C6BF 
X-CRM114-Status: GOOD (  20.58  )
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
> Initrd memory will be removed and then added in arm64_memblock_init() and this
> will cause it to lose all of its memblock flags. The lost of MEMBLOCK_MIRROR
> flag will lead to error log printed by find_zone_movable_pfns_for_nodes if
> the lower 4G range has some non-mirrored memory.
> 
> In order to solve this problem, the lost MEMBLOCK_MIRROR flag will be
> reinstalled if the origin memblock has this flag.
> 
> Signed-off-by: Ma Wupeng <mawupeng1@huawei.com>
> ---
>  arch/arm64/mm/init.c     |  9 +++++++++
>  include/linux/memblock.h |  1 +
>  mm/memblock.c            | 20 ++++++++++++++++++++
>  3 files changed, 30 insertions(+)
> 
> diff --git a/arch/arm64/mm/init.c b/arch/arm64/mm/init.c
> index 339ee84e5a61..11641f924d08 100644
> --- a/arch/arm64/mm/init.c
> +++ b/arch/arm64/mm/init.c
> @@ -350,9 +350,18 @@ void __init arm64_memblock_init(void)
>  			"initrd not fully accessible via the linear mapping -- please check your bootloader ...\n")) {
>  			phys_initrd_size = 0;
>  		} else {
> +			int flags, ret;
> +
> +			ret = memblock_get_flags(base, &flags);
> +			if (ret)
> +				flags = 0;
> +
>  			memblock_remove(base, size); /* clear MEMBLOCK_ flags */
>  			memblock_add(base, size);
>  			memblock_reserve(base, size);

Can you explain why we're removing+re-adding here exactly? Is it just to
clear flags as the comment indicates?


If it's really just about clearing flags, I wonder if we rather want to
have an interface that does exactly that, and hides the way this is
actually implemented (obtain flags, remove, re-add ...), internally.

But most probably there is more magic in the code and clearing flags
isn't all it ends up doing.

-- 
Thanks,

David / dhildenb


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
