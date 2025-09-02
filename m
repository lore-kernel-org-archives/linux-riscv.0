Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DAF8CA0FFE
	for <linux-riscv@archiver.kernel.org>; Tue,  2 Sep 2025 12:28:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Sb2ubnIgh47jJgDFTTw97bNAWU0yGhdJ3w1hKYXp4vs=; b=4m5Fjs6tiJm3ci
	SqZfEZ2s8Xs1mCiFodyP3HCF97jXuBTys1Ne/vTidL0hQMICA+BxsD06ng9lVLHw0M1tZkl8Ju+ln
	p7h0vRJKj0HvZI4UgsITB4HJmuEweGyYoJEcjAYS8gBT28sFEnnEUGXT9Wjzde+GvRzqDhJV23CkG
	0zkwGn8Kw0MgRkBRH1yWozODhAbSWotrmfe9/gwzd4P47QYBQKa7DfHOIAzO3oqMwQs9Un02Hdf9G
	JCs5MuB5zeJ0xTaM0hjr31UQYmT1mwERUkqPhmY0WffY5HyHhoFx4FQKt84JURXM7r9de+ugLK1Eq
	Nhckylb/Crmle6NNA55Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utQ7B-0000000HEba-3v14;
	Tue, 02 Sep 2025 12:27:57 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utNDR-0000000GKcu-0ejp
	for linux-riscv@lists.infradead.org;
	Tue, 02 Sep 2025 09:22:14 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-45b8b2712d8so22268745e9.3
        for <linux-riscv@lists.infradead.org>; Tue, 02 Sep 2025 02:22:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ursulin-net.20230601.gappssmtp.com; s=20230601; t=1756804931; x=1757409731; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0Be300C9M54HN2j6qqn3KzILYOn0Dm/rUn/s4aJntRQ=;
        b=LZI+7QdpHRL+gjgiE0W+xC1Sm2+sS1+C1LUp2get4ehK088ME2rzPhz1yK00p+3mnD
         WPMnllQIohwmIhRd44omfd5P8VCo7Ps1OdlKhwehassDf1xeY/DrICuwwDgM5J6La+bc
         4gD2iLxG0hNyaf36ORvzA+b/3A2+4bgIelN5X9N4JQXxrqia+ip82c58S8RZr+h6yxdy
         SHPkOhAgE4OJDvtUaj1mTds1GWa9AsJ9TF0pqYg6kAlRJOItspDf/Fbzv4oVtyf0rogt
         myQaUwJsubvmF4PQ6yr/fG+1r1t/hpFGPBKNPpTG/P6ncwWsAgFEsFsU0S8epoF6yXsW
         tRBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756804931; x=1757409731;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0Be300C9M54HN2j6qqn3KzILYOn0Dm/rUn/s4aJntRQ=;
        b=UUs+lwx8HcV08bSB6vIB+54Dank/z+LXgia7EOEpqM3qjnrUbYzTNLLk9pxhl60igt
         TKqDUHSea6iwf0SESxQ339N0aMLnMx0ZL/HMYgRn2+LglyFsMYHjf9BsWT4hCuslQ098
         VFGXr8VW1RUPbt5QsxIT+aDEDXDQuqdzKogcUmTvcZZqF/aE0eV8v5Oitnzan5CBElRt
         EXscgeRHhHiCHcnpcLoAWLVUHJ+D2ldaxAq1vnRii5BkgcAXee+YcznswBralwRHvghX
         GjMJSG/I0S7e7OBde6GBB8N0zG5oLtxG1Gzd5hBURyXGUI3GS3GGfHHxYiFswt5/kBq6
         b6aA==
X-Forwarded-Encrypted: i=1; AJvYcCVRsq60C8xGA74XwowBLtXtg8aQrpcnkOz3viV8W7k/rz9736yrfX7rm4mTYoVG9PPeuc4N5nqEhqFNjQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YyJnkfa+iAwsqLn3uZ69qhSgIwGBNLgvdQo2M4n3PjedlUYstf3
	AF3VoGN76c73Bi7xbTEaabFdtkjr1CVGpYUfmoQQNRibZGAJdDOnr2VDo3vHMzAOMGk=
X-Gm-Gg: ASbGnculfViH/9lxWNkjSHEfiIzorBNQIXNjvoKe+SHwa3LhBkBqATnzOs/yCPmsP+G
	rCNdK7jN9ANiUZJTvB12WEkSbrIQFV6hHqCkuRQTJ8mQ7ml5apJW8WKVQXANkN/WHcnt9O5Zxay
	P/9zZyekc9ZRtR3vRdWsrzaaX8m+Io9A5A+6x842O0doBHXVNaFzRPjMzdkKhXZ7RDFgt44DvbU
	7OMrbORHXoD3IQnyGbcNDmMoRZ8YVqqwv/iM+YsteSOY95BLQZ1MIvceqSGptlMl0+QumpxnUsV
	hGc/j3gEgTd4xPGfDPTQResItnlmJU5kujK3/Wnjfp7dNiUpRU6crqn7eYSJvidu27Rn24iD+HD
	B7WlytKWh2xDMV7ldNlvCz9zsjY3BD/Sm8NI=
X-Google-Smtp-Source: AGHT+IFjGWdM7r4OC2xPYq10JBW42QzIVS9ISDbv655toZnOdc57tKWSkMByc2ni755H7QY3mBnVYA==
X-Received: by 2002:a05:600c:a04:b0:45b:7d24:beac with SMTP id 5b1f17b1804b1-45b8553335amr94619035e9.10.1756804930815;
        Tue, 02 Sep 2025 02:22:10 -0700 (PDT)
Received: from [192.168.0.101] ([84.66.36.92])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3d0b9402299sm17994846f8f.18.2025.09.02.02.22.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 02 Sep 2025 02:22:10 -0700 (PDT)
Message-ID: <4bbf5590-7591-4dfc-a23e-0bda6cb31a80@ursulin.net>
Date: Tue, 2 Sep 2025 10:22:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 26/37] drm/i915/gem: drop nth_page() usage within SG
 entry
To: David Hildenbrand <david@redhat.com>, linux-kernel@vger.kernel.org
Cc: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Alexander Potapenko <glider@google.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Brendan Jackman <jackmanb@google.com>, Christoph Lameter <cl@gentwo.org>,
 Dennis Zhou <dennis@kernel.org>, Dmitry Vyukov <dvyukov@google.com>,
 dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 iommu@lists.linux.dev, io-uring@vger.kernel.org,
 Jason Gunthorpe <jgg@nvidia.com>, Jens Axboe <axboe@kernel.dk>,
 Johannes Weiner <hannes@cmpxchg.org>, John Hubbard <jhubbard@nvidia.com>,
 kasan-dev@googlegroups.com, kvm@vger.kernel.org,
 "Liam R. Howlett" <Liam.Howlett@oracle.com>,
 Linus Torvalds <torvalds@linux-foundation.org>, linux-arm-kernel@axis.com,
 linux-arm-kernel@lists.infradead.org, linux-crypto@vger.kernel.org,
 linux-ide@vger.kernel.org, linux-kselftest@vger.kernel.org,
 linux-mips@vger.kernel.org, linux-mmc@vger.kernel.org, linux-mm@kvack.org,
 linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
 linux-scsi@vger.kernel.org, Marco Elver <elver@google.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>, Michal Hocko <mhocko@suse.com>,
 Mike Rapoport <rppt@kernel.org>, Muchun Song <muchun.song@linux.dev>,
 netdev@vger.kernel.org, Oscar Salvador <osalvador@suse.de>,
 Peter Xu <peterx@redhat.com>, Robin Murphy <robin.murphy@arm.com>,
 Suren Baghdasaryan <surenb@google.com>, Tejun Heo <tj@kernel.org>,
 virtualization@lists.linux.dev, Vlastimil Babka <vbabka@suse.cz>,
 wireguard@lists.zx2c4.com, x86@kernel.org, Zi Yan <ziy@nvidia.com>
References: <20250901150359.867252-1-david@redhat.com>
 <20250901150359.867252-27-david@redhat.com>
Content-Language: en-GB
From: Tvrtko Ursulin <tursulin@ursulin.net>
In-Reply-To: <20250901150359.867252-27-david@redhat.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250902_022213_212655_C09C4B6D 
X-CRM114-Status: GOOD (  18.32  )
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


On 01/09/2025 16:03, David Hildenbrand wrote:
> It's no longer required to use nth_page() when iterating pages within a
> single SG entry, so let's drop the nth_page() usage.
> 
> Reviewed-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
> Cc: Jani Nikula <jani.nikula@linux.intel.com>
> Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Cc: Tvrtko Ursulin <tursulin@ursulin.net>
> Cc: David Airlie <airlied@gmail.com>
> Cc: Simona Vetter <simona@ffwll.ch>
> Signed-off-by: David Hildenbrand <david@redhat.com>
> ---
>   drivers/gpu/drm/i915/gem/i915_gem_pages.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_pages.c b/drivers/gpu/drm/i915/gem/i915_gem_pages.c
> index c16a57160b262..031d7acc16142 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_pages.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_pages.c
> @@ -779,7 +779,7 @@ __i915_gem_object_get_page(struct drm_i915_gem_object *obj, pgoff_t n)
>   	GEM_BUG_ON(!i915_gem_object_has_struct_page(obj));
>   
>   	sg = i915_gem_object_get_sg(obj, n, &offset);
> -	return nth_page(sg_page(sg), offset);
> +	return sg_page(sg) + offset;
>   }
>   
>   /* Like i915_gem_object_get_page(), but mark the returned page dirty */

LGTM. If you want an ack to merge via a tree other than i915 you have 
it. I suspect it might be easier to coordinate like that.

Regards,

Tvrtko


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
