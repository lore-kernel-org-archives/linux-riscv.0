Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F88BC43334
	for <linux-riscv@archiver.kernel.org>; Tue,  7 Jun 2022 12:25:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fPDyUOgV0Nq+Dg38YV7MTsB4zEqk5ntZcLV0q4yUx+g=; b=S1pHMIQWdig1uz
	EdVaHEpwFyfu6cKYPHIf6JcSFh2zw6VMXT6WhURjCzN4r3w4Q6I875WiN+Voccsu4qwNyC+7jFIwv
	SMrtvba2D6OVfdmhY3mm652BM3cyBolQxe6ngd8t1wwL/ZVPG5FDktMbE3YK1G7Mruu/F/xY7zfkG
	oJorL8M63pgMtDQBViS8xt5kVVF6axhZn8eSpx7sp8MZ5RvFM98Dvm+y2gUJB2wFl9vTCOOS71mgQ
	ewaMuxYXW7t4U8psEUnFhF1w9y77Z40fDSsNKJ0WKtj7X1g3Ky+er6UP/85ommtqMSP8PP7/R/xZs
	k1JyQRCcG6rTnM1fcoBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nyYH1-007KOw-LA; Tue, 07 Jun 2022 12:25:27 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nyYGq-007KJ5-5Q
	for linux-riscv@lists.infradead.org; Tue, 07 Jun 2022 12:25:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1654604715;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+BkMDQZuNbOmLtpQeNhEv9Hz5yKGluY7VE08oBIu2Ig=;
	b=WdQjv0ZJRznQF1sWlw8AZy+3TzsdO9/wk8RKGY2QEPPTxbAKqzgW5hR4ew24N+Vq7LFqZ+
	qOcOGZL9Xv7IjAozc1qg8LmpZttIMnLac1mqo8qwusGNtO9zru+CLzJgWuql2OSSVc9Ztq
	U260kk+2IKQ5HiRS74VRY8BiaA3+SsA=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-106-IpAHEGOiP6OxEBajmSBvhg-1; Tue, 07 Jun 2022 08:25:12 -0400
X-MC-Unique: IpAHEGOiP6OxEBajmSBvhg-1
Received: by mail-wr1-f69.google.com with SMTP id v4-20020adfebc4000000b002102c69be5eso3840566wrn.13
        for <linux-riscv@lists.infradead.org>; Tue, 07 Jun 2022 05:25:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:organization:in-reply-to
         :content-transfer-encoding;
        bh=+BkMDQZuNbOmLtpQeNhEv9Hz5yKGluY7VE08oBIu2Ig=;
        b=PJbDzkHxf+v1reIul5CsAkthspGXXz2yvZ84eTRX35YHZApq2g+vbhIsGra8MzKxEm
         yhBcb0SFsqhizlfguccdKdqomYaezjzEIMvPoEVEplpbuQ/6n9n2UM2F1Jb1nPNKaBV/
         AnYZOP5JZiCuBtiMUqx8SLsul+4urpUOSCyyQokwtIPYcQ3F7aw3mHx79ZZe6yOsgcJU
         KmaygqKNFJuI0ixxHmnSAc2PfV3oXJl8Dnee7HXpWz9pDUuktR28VkWF7lk4Y4EULnn+
         5zMThsmR1p9Zd7vxmInd5xWGVOmJEgtLn+6HeF3cAWQ/E64E/WCP7g9X4F17/aOgeTPD
         vBWQ==
X-Gm-Message-State: AOAM53077ou198vx++o59wQB/rAuXWdWLHEjE1IHhnWWU2E1viv+sFPg
	GGSBNTdlwvajNpUeFX7c740CiyG5H05Tk0hq60BI5zJ80buJDBigLVilyZjv/CX63PlygZizrMV
	9YnE+m76dAcxkIdDyZNq/yzpnDHsA
X-Received: by 2002:a1c:f208:0:b0:39c:1282:3d04 with SMTP id s8-20020a1cf208000000b0039c12823d04mr28841131wmc.26.1654604711177;
        Tue, 07 Jun 2022 05:25:11 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwMUrgCzQBm+yVcNb8mYR2lLnuWwWS9cRpDp1JcqdwRxHeXNkz9aaogfYXuCC8mxqoLMwFOiA==
X-Received: by 2002:a1c:f208:0:b0:39c:1282:3d04 with SMTP id s8-20020a1cf208000000b0039c12823d04mr28841072wmc.26.1654604710883;
        Tue, 07 Jun 2022 05:25:10 -0700 (PDT)
Received: from ?IPV6:2003:cb:c709:500:4c8d:4886:f874:7b6f? (p200300cbc70905004c8d4886f8747b6f.dip0.t-ipconnect.de. [2003:cb:c709:500:4c8d:4886:f874:7b6f])
        by smtp.gmail.com with ESMTPSA id c6-20020adffb46000000b0020c5253d90asm18213212wrs.86.2022.06.07.05.24.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Jun 2022 05:25:09 -0700 (PDT)
Message-ID: <f17bbf85-66bc-619a-6a73-71c1cc719622@redhat.com>
Date: Tue, 7 Jun 2022 14:24:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH v3 3/6] mm: Ratelimited mirrored memory related warning
 messages
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
 <20220607093805.1354256-4-mawupeng1@huawei.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
In-Reply-To: <20220607093805.1354256-4-mawupeng1@huawei.com>
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220607_052516_363282_D1B146D8 
X-CRM114-Status: GOOD (  17.32  )
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
> If system has mirrored memory, memblock will try to allocate mirrored
> memory firstly and fallback to non-mirrored memory when fails, but if with
> limited mirrored memory or some numa node without mirrored memory, lots of
> warning message about memblock allocation will occur.
> 
> This patch ratelimit the warning message to avoid a very long print during
> bootup.
> 
> Signed-off-by: Ma Wupeng <mawupeng1@huawei.com>
> ---
>  mm/memblock.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/mm/memblock.c b/mm/memblock.c
> index e4f03a6e8e56..b1d2a0009733 100644
> --- a/mm/memblock.c
> +++ b/mm/memblock.c
> @@ -327,7 +327,7 @@ static phys_addr_t __init_memblock memblock_find_in_range(phys_addr_t start,
>  					    NUMA_NO_NODE, flags);
>  
>  	if (!ret && (flags & MEMBLOCK_MIRROR)) {
> -		pr_warn("Could not allocate %pap bytes of mirrored memory\n",
> +		pr_warn_ratelimited("Could not allocate %pap bytes of mirrored memory\n",
>  			&size);
>  		flags &= ~MEMBLOCK_MIRROR;
>  		goto again;
> @@ -1384,7 +1384,7 @@ phys_addr_t __init memblock_alloc_range_nid(phys_addr_t size,
>  
>  	if (flags & MEMBLOCK_MIRROR) {
>  		flags &= ~MEMBLOCK_MIRROR;
> -		pr_warn("Could not allocate %pap bytes of mirrored memory\n",
> +		pr_warn_ratelimited("Could not allocate %pap bytes of mirrored memory\n",
>  			&size);
>  		goto again;
>  	}

Reviewed-by: David Hildenbrand <david@redhat.com>

-- 
Thanks,

David / dhildenb


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
