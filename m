Return-Path: <SRS0=S+R5=LD=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 80BB1C48BCD
	for <linux-riscv@archiver.kernel.org>; Wed,  9 Jun 2021 10:52:56 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 46F3161287
	for <linux-riscv@archiver.kernel.org>; Wed,  9 Jun 2021 10:52:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 46F3161287
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=redhat.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wSUCT4+FxzoAkZ5DjRjmh5mzwEJq6mM3h9+pyKwNGg4=; b=zHXlvvQ5+cQfxyRl5bacEoUxHa
	Xol/OylTLW1wHISkKjfP+666wRo8HWI9P+8a8py6BR+cXmlOXrDr6MVC5q1KKaeaaEPfFBzIUql2V
	VKRCBpOAHAb7v7eLSAn4u+Pl9WbsD1UqdZ+6VeDFN4qarr+QsEUWUzSa2TvYgdqHZgKI/0LEc9tmY
	2ST94IGKO1MPsUeLOhWa2enZGRkeH8vy8s2B/CuynVSro1obKp2OsRcqqpvZf/1ULP0/hi++Ohcpf
	YZeX3mb5dx8siee/RRW6UsBrjIPiMYFVAAEMcHz0o1N+gHqoRDRoULizlPEmlHYp7+RIcIPuzXAOu
	3JrxD1Bg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lqvp8-00D8zv-TL; Wed, 09 Jun 2021 10:52:38 +0000
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lqvom-00D8kz-U8
 for linux-riscv@lists.infradead.org; Wed, 09 Jun 2021 10:52:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623235936;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VZPPxlVuFpma5nN0KBwsgNEj1D60a3U+wCT7M5MPOro=;
 b=frTfy1YDgNqJUa6+Wl1fkhQV/+kPWz532OoTHULtA6AK2s8MFtdjlqiYnbWoeFzINWwnvG
 amzLFXrvHcogwLVEUnozyFlZKUE/1pPMnuK2pUBGbSELEsLE2ZrgaWXRGAM8EKoP6mbosP
 hXIIlMtw1yEzn2UEs0vmRqpLwyhTMnc=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-553-JEMnhEfJOhWmSPPisU5MBw-1; Wed, 09 Jun 2021 06:52:14 -0400
X-MC-Unique: JEMnhEfJOhWmSPPisU5MBw-1
Received: by mail-wr1-f72.google.com with SMTP id
 t14-20020adfe44e0000b029011851efa802so10546104wrm.11
 for <linux-riscv@lists.infradead.org>; Wed, 09 Jun 2021 03:52:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=VZPPxlVuFpma5nN0KBwsgNEj1D60a3U+wCT7M5MPOro=;
 b=KVW1kg4sSAhOTZtaI3l9IP7PzmjWV7uYbQnFTb8SRToALuBYCP90uF0M/0R9cDnWpA
 b9bUh4/VxHZYqb2MPCHlBaeVyoFWaGRrUyXQo9bOgZnTVKz/+M+uE7C7rVAKeEB59TmN
 YWwEN/VdC5f+1jSfZQkflhHSyEtxZtx8hcijRdfx2e2vkc1q+RxiTu030ONOodYOjy+4
 izCLYrVU8p9AYSdNMlZmdqf6v+QW58nGHbrQKl/DEySyqRe290EMmw4dyb0o/Nft1zQN
 BWvkeMCpsWkR0uw3CTz9+5D3XibPVzlkmPucRtgqtBus30Wc4V2S8Vgzg9hFwFq1ua2W
 +oxA==
X-Gm-Message-State: AOAM533rJDDAyZeEYXxAk7yAZEtTocEb0QbsGnHe/kPq36whUxzX2O87
 Cf/4XQE+lTEFnGCBa7yyoqoxOm36f+KNwSOeUqbRlD6sNS44EQYeaj2fPz/Ms2gGLbCda/zNuce
 VUJ8f29kWZIWvXz4DAPIxMkhgxmRK
X-Received: by 2002:a05:600c:c9:: with SMTP id
 u9mr26528256wmm.156.1623235933485; 
 Wed, 09 Jun 2021 03:52:13 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwOhpm0kR/qb02GnRlZAdwrQqqdavzoWPuk2BGBrMztminfq9lmdrK+j2M/FH+Xh9QtwaeMHg==
X-Received: by 2002:a05:600c:c9:: with SMTP id
 u9mr26528228wmm.156.1623235933268; 
 Wed, 09 Jun 2021 03:52:13 -0700 (PDT)
Received: from [192.168.3.132] (p5b0c611d.dip0.t-ipconnect.de. [91.12.97.29])
 by smtp.gmail.com with ESMTPSA id
 89sm25391165wrq.14.2021.06.09.03.52.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 09 Jun 2021 03:52:13 -0700 (PDT)
Subject: Re: [PATCH 2/9] arc: update comment about HIGHMEM implementation
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
 <20210602105348.13387-3-rppt@kernel.org>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
Message-ID: <2764dca8-f395-f76a-0939-215eccdfd82e@redhat.com>
Date: Wed, 9 Jun 2021 12:52:11 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210602105348.13387-3-rppt@kernel.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210609_035217_124748_96DA5DD9 
X-CRM114-Status: GOOD (  22.77  )
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
> Arc does not use DISCONTIGMEM to implement high memory, update the comment
> describing how high memory works to reflect this.
> 
> Signed-off-by: Mike Rapoport <rppt@linux.ibm.com>
> ---
>   arch/arc/mm/init.c | 13 +++++--------
>   1 file changed, 5 insertions(+), 8 deletions(-)
> 
> diff --git a/arch/arc/mm/init.c b/arch/arc/mm/init.c
> index e2ed355438c9..397a201adfe3 100644
> --- a/arch/arc/mm/init.c
> +++ b/arch/arc/mm/init.c
> @@ -139,16 +139,13 @@ void __init setup_arch_memory(void)
>   
>   #ifdef CONFIG_HIGHMEM
>   	/*
> -	 * Populate a new node with highmem
> -	 *
>   	 * On ARC (w/o PAE) HIGHMEM addresses are actually smaller (0 based)
> -	 * than addresses in normal ala low memory (0x8000_0000 based).
> +	 * than addresses in normal aka low memory (0x8000_0000 based).
>   	 * Even with PAE, the huge peripheral space hole would waste a lot of
> -	 * mem with single mem_map[]. This warrants a mem_map per region design.
> -	 * Thus HIGHMEM on ARC is imlemented with DISCONTIGMEM.
> -	 *
> -	 * DISCONTIGMEM in turns requires multiple nodes. node 0 above is
> -	 * populated with normal memory zone while node 1 only has highmem
> +	 * mem with single contiguous mem_map[].
> +	 * Thus when HIGHMEM on ARC is enabled the memory map corresponding
> +	 * to the hole is freed and ARC specific version of pfn_valid()
> +	 * handles the hole in the memory map.
>   	 */
>   #ifdef CONFIG_DISCONTIGMEM
>   	node_set_online(1);
> 

Reviewed-by: David Hildenbrand <david@redhat.com>

-- 
Thanks,

David / dhildenb


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
