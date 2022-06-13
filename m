Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A202DC433EF
	for <linux-riscv@archiver.kernel.org>; Mon, 13 Jun 2022 11:03:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gEHj9w/oN7jQDRfGrvmZUyN1VQI/Qn7EbH9wRufxIjI=; b=Oy7V8p3X7Hby2+
	/bHoqLOHXOX+h+rDu4wTWGdh+oezOhZ32jx7OlH1FMSq3aA2UPnDn5hMZFZF1Yaop8aLp+VdZ55kk
	G7ikX1Fr7fAcYZcxmu8XB6ztXTMJ39L5Gh/qv7PGvbQgD9lxFwM5HQUK32FwPzrDk8oBDNgD9NK7/
	jeDAs8iQM75DJKuEcoKWn8L3LWM/nsIjtp5CZ57EOuaegSgNONwDzi+KWgH0Qv+kE8yETKML1s044
	Q5EHeiWmwu/g3BtVss7g/TLOPdmD9hG+rN94KAROcXWRYwI9iMmk9U5OYRY8pz340jtQ1Z9XyTQku
	89h3LK+iFL8Voxq2ZOgg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o0hr2-0033LT-5m; Mon, 13 Jun 2022 11:03:32 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o0hqq-0033HW-SE
	for linux-riscv@lists.infradead.org; Mon, 13 Jun 2022 11:03:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1655118200;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=j5D3sK3qxzP9CGnwsiLKPN/J+KjY10e+k7sKDOcqT5o=;
	b=IIIcIVLcunDIcWi+P4ddmwl82WwOnuEz9xGknevbwcnYh7nM8scnoslzIOqffWUIt0qjLN
	MNnopc46XiJ00oUfbhKzXPZjnVTmAyNxX2/b50S3gghDLz4yVSedH3wKawthRYR/SU8yf1
	rrqVHYO9MEKFfBhkK0jhdcMHEaYDm8I=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-411-7OU2bNp0P1GjSTXBzYDbMg-1; Mon, 13 Jun 2022 07:03:16 -0400
X-MC-Unique: 7OU2bNp0P1GjSTXBzYDbMg-1
Received: by mail-wm1-f72.google.com with SMTP id k15-20020a7bc40f000000b0039c4b7f7d09so3015630wmi.8
        for <linux-riscv@lists.infradead.org>; Mon, 13 Jun 2022 04:03:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:organization:in-reply-to
         :content-transfer-encoding;
        bh=j5D3sK3qxzP9CGnwsiLKPN/J+KjY10e+k7sKDOcqT5o=;
        b=BIMjr1bv1leeYWQKdq96eu5eYfyZ2LeIO6DLJSfF4++aJo1cW1tagCCV3o7/sPF5lm
         HJeG+TQilxwcf/iXA1bmVphFcrSWGjW6eRHudMu53ch5UTT1OvrOJwiPs3cKEDyUL+1q
         OsOxlXFF0IS3P50y2sd6C+P71sYN/eoJ59Nx43Xxj0k9XRO9noe1Fkq5h8sko0OuwsEQ
         UNrxb+Ee9V/i5hXcNnFztvntJIeb5rZdlmXDMLQhBfPvx/hnOdwGEJzz95rz5lKARx/s
         sKLzOCbCV3TuMvgH/nplf3B75RfsCOcljfope1QT6sv5sO9fFd7jewhUalKROEi2O38n
         MNHg==
X-Gm-Message-State: AOAM531vYttbkusQZpS8+3ObvxCJLALjRlZsajlvFCsD9AqzlqQTsyAx
	A5u7d+PBNK68C1SCG5laXjfXFo4TQv0YF5Hm/vELy4qt3nL5LzRg3StkcHLp3F/8MUae5eiXCM4
	hkOFt6dtQNK12SN2UiblijN9AfuIj
X-Received: by 2002:a05:600c:3508:b0:39c:8240:5538 with SMTP id h8-20020a05600c350800b0039c82405538mr13049401wmq.165.1655118195256;
        Mon, 13 Jun 2022 04:03:15 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyDoO2UACoWH0XUMegJUwRA9D70xt70UBbXMGCQlKNX3UWoHBV/NMn9vGGLzctDprJh1GcUdg==
X-Received: by 2002:a05:600c:3508:b0:39c:8240:5538 with SMTP id h8-20020a05600c350800b0039c82405538mr13049370wmq.165.1655118194993;
        Mon, 13 Jun 2022 04:03:14 -0700 (PDT)
Received: from ?IPV6:2003:cb:c706:bd00:963c:5455:c10e:fa6f? (p200300cbc706bd00963c5455c10efa6f.dip0.t-ipconnect.de. [2003:cb:c706:bd00:963c:5455:c10e:fa6f])
        by smtp.gmail.com with ESMTPSA id s7-20020a5d4247000000b0021018642ff8sm8136796wrr.76.2022.06.13.04.03.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Jun 2022 04:03:14 -0700 (PDT)
Message-ID: <4c4cf0a8-aab6-2a17-e1f9-59d6700821b7@redhat.com>
Date: Mon, 13 Jun 2022 13:03:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH v4 4/6] mm: Limit warning message in vmemmap_verify() to
 once
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
 geert@linux-m68k.org, vijayb@linux.microsoft.com, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-efi@vger.kernel.org, platform-driver-x86@vger.kernel.org,
 linux-mm@kvack.org, linux-riscv@lists.infradead.org
References: <20220613082147.183145-1-mawupeng1@huawei.com>
 <20220613082147.183145-5-mawupeng1@huawei.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
In-Reply-To: <20220613082147.183145-5-mawupeng1@huawei.com>
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220613_040321_012953_24D71E42 
X-CRM114-Status: GOOD (  17.54  )
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

On 13.06.22 10:21, Wupeng Ma wrote:
> From: Ma Wupeng <mawupeng1@huawei.com>
> 
> For a system only have limited mirrored memory or some numa node without
> mirrored memory, the per node vmemmap page_structs prefer to allocate
> memory from mirrored region, which will lead to vmemmap_verify() in
> vmemmap_populate_basepages() report lots of warning message.
> 
> This patch change the frequency of "potential offnode page_structs" warning
> messages to only once to avoid a very long print during bootup.
> 
> Signed-off-by: Ma Wupeng <mawupeng1@huawei.com>
> ---
>  mm/sparse-vmemmap.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/mm/sparse-vmemmap.c b/mm/sparse-vmemmap.c
> index f4fa61dbbee3..f34c6889b0a6 100644
> --- a/mm/sparse-vmemmap.c
> +++ b/mm/sparse-vmemmap.c
> @@ -528,7 +528,7 @@ void __meminit vmemmap_verify(pte_t *pte, int node,
>  	int actual_node = early_pfn_to_nid(pfn);
>  
>  	if (node_distance(actual_node, node) > LOCAL_DISTANCE)
> -		pr_warn("[%lx-%lx] potential offnode page_structs\n",
> +		pr_warn_once("[%lx-%lx] potential offnode page_structs\n",
>  			start, end - 1);
>  }
>  

Acked-by: David Hildenbrand <david@redhat.com>

-- 
Thanks,

David / dhildenb


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
