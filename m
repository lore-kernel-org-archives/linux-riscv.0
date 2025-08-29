Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 948CACA1001
	for <linux-riscv@archiver.kernel.org>; Fri, 29 Aug 2025 15:43:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=m8RR44s23m/bB9uSRYkc4SVrw3xZGVLQESwVeFADEDM=; b=eWAe9gxlll4D9N
	PDuPGwUxItfyvN470PAPg0gpGLvDSjLEMtypLVAmFNfP3xRCSrRiGDaPCkjTjAqyy4XR/b5XvXJff
	kzs6RhY3VF+NFon5KJjmxv5Kgbg6gB1g6F5XGi6GF75VNh6vuQ3+id+s8OPLNp/RSfea/LX1hFpCr
	RZMJcEVDEp83DER1XLB8TX5C8ne3RUwpKudUTVv45JXr2nm+Gpl1Fn2CWubh/Mz/oIqjMDiACiCRQ
	RQbgyZOcuyVIocFenSiOSvs6JZBOgbNxbqaGY3AnPB+EtGhwVzgny4/9/cMq5fbz8+o89vq/OSiFt
	seExfMDB2lNAAD9feMEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1us1GI-00000006FRP-0Sie;
	Fri, 29 Aug 2025 15:43:34 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urxlP-00000005Z3y-1kKH
	for linux-riscv@lists.infradead.org;
	Fri, 29 Aug 2025 11:59:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1756468766;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=bF6XoHD5pMX2I9dADLrcLi6kiYTvPDGveY8Ow/uEvrs=;
	b=d05KHunasrKFjssKxDzi8ONad2YibsOsjy2Mz9+MUxZ3S4KICTRp8wZpdCE48Pz9UsxZxl
	BIXubAtGL6crt+LsTYpeGG+UhwQvwT49gFX5pLRnYRf9JJ0F8OytcVv79bSHHRyCZduQbC
	yKJtBugLBq31ZMAhQVgX6axjNyqrva4=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-74-waPaAGbyPAKOoE-UCCejNA-1; Fri, 29 Aug 2025 07:59:24 -0400
X-MC-Unique: waPaAGbyPAKOoE-UCCejNA-1
X-Mimecast-MFC-AGG-ID: waPaAGbyPAKOoE-UCCejNA_1756468763
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-3ccd58af2bbso1064190f8f.0
        for <linux-riscv@lists.infradead.org>; Fri, 29 Aug 2025 04:59:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756468763; x=1757073563;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bF6XoHD5pMX2I9dADLrcLi6kiYTvPDGveY8Ow/uEvrs=;
        b=kk6kpxH60I1BX8AiAnVoTtEB8ATsOcRbjfkrSM50XoSt1sSCifYQ3cm7i/RRpHBJbr
         ceGunCyFWBwhtrMU6YbJOy9YgngFKz4mkd22LQpG7kLs72/7fpYMJf+b/1SOp+QC3XUV
         dsCXFxO1qskG2rLLS1nKxACIZtJ5PoHvlR3uP0/+4qCD+yKH1/u3OUQMYBt6y8M2Gwoc
         SOp2OvJcG2h8OLySxdyS/+eADMB8WeEusrL2SOoLCV4snlfNFihK60eAy9nHp0dkCbnc
         N10h1I0mP7aXGqfEsW7wyzaU8BKzrYqrhdAf8sFbh43GrNS7tKeMl7i3OSeR2yqr6SAi
         Sk1g==
X-Forwarded-Encrypted: i=1; AJvYcCX0x+hzfQnIcgOK5AtSzlF+WZwVAXXsllohPqQTgerwCMtx6JyGVt0RtLqfLS8p31TIKiQG1ZZHetUOcw==@lists.infradead.org
X-Gm-Message-State: AOJu0YwQGt/MJ5N9PAnN6kRczg728cqfINjd42Guo5laX4mEFqZxhXY+
	K/MJW2a5/Kpjs51WC9IQnV18l+iYqXNaHfgpdRXEf+ouyAC+w/TRxhaITuQuXq5mHtNfgzq1tu4
	1/N+eKyP0VwcMhgPEPbl0FW2JZZ/CPLHw+GnQn+t+FfDZ9yOacieqM9/XacK8IKeP3zFc6w==
X-Gm-Gg: ASbGnctLcxaKTgKN7iJJJ4wkXdkqtxecrIzwZbcAAy3lArveZZthhY6SHIAwSC2RK+w
	DcmmtItCgvyFDBWd1qL3h9jnVKt0EE8XoMuZms5Db7snp37qfBrbQPK7rYzP5xz/qQLfi6ryeWW
	UCIqTmvk0sV/0CJngY4RAkTolZzNXT1C7LtosgK8qiVRaSRWbJ+pJDiPt59wh/hkyc5inlmlz1t
	SVibrjztNRmqGuTqMKvPWkBrHrYmy21Bd+kTOyjxo89MJ/TbDw5d2icdC1MNrw49uq0sgrCzrmf
	2wp0x5BjBmBI5Bys8xgZ548Yi9k3fgY2OtRJ9rlUbqQMGR2wpQc3ylJpn8fwI+v09Vhv5si6lct
	ctUeB9bUWmHZcFD+Iiiil79s7wJJN0ZLNkTf0XZkI6xp/FtqqrfGbC+e5tyYFS7k=
X-Received: by 2002:a05:6000:200e:b0:3d0:820:6814 with SMTP id ffacd0b85a97d-3d008206caamr1378520f8f.30.1756468762684;
        Fri, 29 Aug 2025 04:59:22 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEmTZMPZLsWUlDoIJtYZ4y1n4323fVpiEEHsVmNFQad1skciXIKlgwtKzfxNR+9KUHASW5nzg==
X-Received: by 2002:a05:6000:200e:b0:3d0:820:6814 with SMTP id ffacd0b85a97d-3d008206caamr1378503f8f.30.1756468762265;
        Fri, 29 Aug 2025 04:59:22 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f1d:100:4f8e:bb13:c3c7:f854? (p200300d82f1d01004f8ebb13c3c7f854.dip0.t-ipconnect.de. [2003:d8:2f1d:100:4f8e:bb13:c3c7:f854])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3d0c344f6casm2018873f8f.36.2025.08.29.04.59.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 29 Aug 2025 04:59:21 -0700 (PDT)
Message-ID: <0dcef56e-0ae7-401b-9453-f6dc6a4dcebf@redhat.com>
Date: Fri, 29 Aug 2025 13:59:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 13/36] mm/hugetlb: cleanup
 hugetlb_folio_init_tail_vmemmap()
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: linux-kernel@vger.kernel.org, Alexander Potapenko <glider@google.com>,
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
References: <20250827220141.262669-1-david@redhat.com>
 <20250827220141.262669-14-david@redhat.com>
 <cebd5356-0fc6-40aa-9bc6-a3a5ffe918f8@lucifer.local>
From: David Hildenbrand <david@redhat.com>
Autocrypt: addr=david@redhat.com; keydata=
 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
 qIws/H2t
In-Reply-To: <cebd5356-0fc6-40aa-9bc6-a3a5ffe918f8@lucifer.local>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: SuGUlAYG8zf4S720SbvRtiXS_n4LhUcPksceSS9-WdE_1756468763
X-Mimecast-Originator: redhat.com
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250829_045927_524946_BA2FDA2D 
X-CRM114-Status: UNSURE (   8.18  )
X-CRM114-Notice: Please train this message.
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

On 28.08.25 17:37, Lorenzo Stoakes wrote:
> On Thu, Aug 28, 2025 at 12:01:17AM +0200, David Hildenbrand wrote:
>> We can now safely iterate over all pages in a folio, so no need for the
>> pfn_to_page().
>>
>> Also, as we already force the refcount in __init_single_page() to 1,
> 
> Mega huge nit (ignore if you want), but maybe worth saying 'via
> init_page_count()'.

Will add, thanks!

-- 
Cheers

David / dhildenb


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
