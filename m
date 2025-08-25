Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4CC87CA0EFA
	for <linux-riscv@archiver.kernel.org>; Mon, 25 Aug 2025 14:59:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DhgP1LHzyYa1TcymEdYYDgmvcxxHjMsnTVHoLyHPQtI=; b=lq0fcErkgz5dB2
	hZ+gZ+sDuXvKOgCF4BHIh6w7r4jve1IvVI19zJR0G81yep8LMala1kmj7jOWyKZ1hiH3Po6yKtu8g
	dTe1zf72hNgQ8XAW58ZYsYVUimkOB5hix2EfxOeTqEO3edRFiQWERNrQj6D5ZwCcB5rcC0GpO8Hav
	accUbdK1UL9riAmLX/CYbrKrdDQQK2Bjfn5fvOkDrPUknUtRbIc0miTEiG7xOp2qwzEytFLJW6bUO
	5qi0uxFvcBJ7Og2rnkZgOV67oi+ZP34s8/Y3UAuabMlrvR/yX135+YsXu4iItDu9fYtRdRWMs/EmB
	CtOPVBCnmlcybskyaocw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqYf3-00000008LKD-2PHp;
	Mon, 25 Aug 2025 14:59:05 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqWdF-00000007xbF-3p8E
	for linux-riscv@lists.infradead.org;
	Mon, 25 Aug 2025 12:49:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1756126144;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=3vXE/JZQfiOFAY8LityNc5lKOCwFML9m2hfnchuxSjw=;
	b=HV1nSTp7Q1GCYDLMq+4QqifxDxb7uYS4woQOiYC5rfSiucsVc4NcdRRzILeC5aQoVz5gJ1
	VSYwyFt/6kpVm+Via2f8IpHsZqabREVOTk60SlKbsQICe0pSG1jDTpnt5HFTSNVgTipQaT
	vz7KDhXANuJ5abMoEjjmje7XP3A+SOc=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-465-1mqRvzUAPJSg14bC5dbK9g-1; Mon, 25 Aug 2025 08:49:03 -0400
X-MC-Unique: 1mqRvzUAPJSg14bC5dbK9g-1
X-Mimecast-MFC-AGG-ID: 1mqRvzUAPJSg14bC5dbK9g_1756126142
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-45b51baec92so10317535e9.1
        for <linux-riscv@lists.infradead.org>; Mon, 25 Aug 2025 05:49:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756126142; x=1756730942;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3vXE/JZQfiOFAY8LityNc5lKOCwFML9m2hfnchuxSjw=;
        b=woTG9S2Jq+wMcL6HBDLKBy+j0roNWnDGCyL2WilEWEu99qX3bmesNyWLGtNPD/J/eS
         RlTTvaZyh0zAuZEqxuKsbsmIO18RZAl5Moz95gC7GzB69FAIgPBINr1gpNDpiSc6EGml
         Wp+6huH8Elw6Y9eqygbrh6fkcXVCrlyZbIvCFhczw/Tz+bGyMxOeQwNI3AjEMbU77DlE
         osRi46GSC8nFzn2dtGEoh+y7EMrb0936NeIJQiKkh1HzIMWLZddNQF5wC/WeSF7pX6Pt
         HnqbHPp3rAK0Zd1BJ6NE/CyMjmZpsKKaPYAidBDz1pkL9GPUHFiqbfE/vbHVmUtO+8gd
         UnWw==
X-Forwarded-Encrypted: i=1; AJvYcCVO6wjhlpFhAh5kkSgGF1qcwznEyJf3vWA1tqoPn/IrZO/N5MaJIKJ+Qa1sK8pDPAYvTieic9Jk0n+s2w==@lists.infradead.org
X-Gm-Message-State: AOJu0YwvM8skFkaHd1sE9iTcul9Zwsb6T2H5YEMu1dr7wcw1ntdEyg1h
	nI9usN7qAe/fDfMyIIqFeLOkJQKNAR3JKdmLllNLa/jFENMNpC6/gvSiNujRjB+9KbIIYTpN3ya
	J/XF0zYAGLSxz3C0CRf/32LHhasQ5nIhbrCekhXyKjGL7wah+PgOoE/BjwKs2XGszpMJm7A==
X-Gm-Gg: ASbGncsAVobfMrCCEHYagvcQFAE4MHyTlloWBUKP2aBEElGzAbEsr8H0T4fxD0ZQV7v
	l+vifQUvFnFAJZ3lFkX/JMVRBFHEXRS8zDRh+kGiJ2j3qA4eD7l5KJ8G+xe8gEyZF6b+Ct1V2q7
	URqKU4J5wFrPpDFfuJ386h+ftOrV1aiKNpPRvnaGM2GRb/bT5T24xQxK/PcZkm7fd3/GLMqvFci
	ExVT74tqkHXFfAQIuuxszbcuzwWw2yljSd/acmgOcJ/KIqh2JPWMRpDSyzj9ufgqkTaOUJH/wzn
	BpAa/Bmx4EL2hEEaRZ96F9vbucRa6OiH7mKMSn3TRjsn3U9386bXvcVl6U+UP10bvG6CB8dmDqf
	h0937/gRQQwdXpTAh9U8XgDC+iLkck1po2Poh1g5PTaSt3NG6M4n7mKPub7C32jye7Uw=
X-Received: by 2002:a05:600c:3b0f:b0:43c:fe5e:f03b with SMTP id 5b1f17b1804b1-45b517d4d50mr117582205e9.30.1756126141759;
        Mon, 25 Aug 2025 05:49:01 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFXxc8CWovMYNQS1+MbZ/J1HLlRjFi84VTIxSAk5gdBYVSg2EOk3SSNbd5GU03jnCMkyvwvPg==
X-Received: by 2002:a05:600c:3b0f:b0:43c:fe5e:f03b with SMTP id 5b1f17b1804b1-45b517d4d50mr117581475e9.30.1756126141263;
        Mon, 25 Aug 2025 05:49:01 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f4f:1300:42f1:98e5:ddf8:3a76? (p200300d82f4f130042f198e5ddf83a76.dip0.t-ipconnect.de. [2003:d8:2f4f:1300:42f1:98e5:ddf8:3a76])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3c70ea81d38sm11742640f8f.17.2025.08.25.05.48.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 25 Aug 2025 05:49:00 -0700 (PDT)
Message-ID: <a90cf9a3-d662-4239-ad54-7ea917c802a5@redhat.com>
Date: Mon, 25 Aug 2025 14:48:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 10/35] mm/hugetlb: cleanup
 hugetlb_folio_init_tail_vmemmap()
To: Mike Rapoport <rppt@kernel.org>
Cc: =?UTF-8?Q?Mika_Penttil=C3=A4?= <mpenttil@redhat.com>,
 linux-kernel@vger.kernel.org, Alexander Potapenko <glider@google.com>,
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
 linux-scsi@vger.kernel.org, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 Marco Elver <elver@google.com>, Marek Szyprowski <m.szyprowski@samsung.com>,
 Michal Hocko <mhocko@suse.com>, Muchun Song <muchun.song@linux.dev>,
 netdev@vger.kernel.org, Oscar Salvador <osalvador@suse.de>,
 Peter Xu <peterx@redhat.com>, Robin Murphy <robin.murphy@arm.com>,
 Suren Baghdasaryan <surenb@google.com>, Tejun Heo <tj@kernel.org>,
 virtualization@lists.linux.dev, Vlastimil Babka <vbabka@suse.cz>,
 wireguard@lists.zx2c4.com, x86@kernel.org, Zi Yan <ziy@nvidia.com>
References: <20250821200701.1329277-1-david@redhat.com>
 <20250821200701.1329277-11-david@redhat.com>
 <9156d191-9ec4-4422-bae9-2e8ce66f9d5e@redhat.com>
 <7077e09f-6ce9-43ba-8f87-47a290680141@redhat.com>
 <aKmDBobyvEX7ZUWL@kernel.org>
From: David Hildenbrand <david@redhat.com>
Autocrypt: addr=david@redhat.com; keydata=
 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
 qIws/H2t
In-Reply-To: <aKmDBobyvEX7ZUWL@kernel.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: GD74E8oDMv699oQfisfLUc54LI-9rT5V8OQWeAafJgw_1756126142
X-Mimecast-Originator: redhat.com
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250825_054906_024033_66C31682 
X-CRM114-Status: GOOD (  14.25  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gMjMuMDguMjUgMTA6NTksIE1pa2UgUmFwb3BvcnQgd3JvdGU6Cj4gT24gRnJpLCBBdWcgMjIs
IDIwMjUgYXQgMDg6MjQ6MzFBTSArMDIwMCwgRGF2aWQgSGlsZGVuYnJhbmQgd3JvdGU6Cj4+IE9u
IDIyLjA4LjI1IDA2OjA5LCBNaWthIFBlbnR0aWzDpCB3cm90ZToKPj4+Cj4+PiBPbiA4LzIxLzI1
IDIzOjA2LCBEYXZpZCBIaWxkZW5icmFuZCB3cm90ZToKPj4+Cj4+Pj4gQWxsIHBhZ2VzIHdlcmUg
YWxyZWFkeSBpbml0aWFsaXplZCBhbmQgc2V0IHRvIFBhZ2VSZXNlcnZlZCgpIHdpdGggYQo+Pj4+
IHJlZmNvdW50IG9mIDEgYnkgTU0gaW5pdCBjb2RlLgo+Pj4KPj4+IEp1c3QgdG8gYmUgc3VyZSwg
aG93IGlzIHRoaXMgd29ya2luZyB3aXRoIE1FTUJMT0NLX1JTUlZfTk9JTklULCB3aGVyZSBNTSBp
cyBzdXBwb3NlZCBub3QgdG8KPj4+IGluaXRpYWxpemUgc3RydWN0IHBhZ2VzPwo+Pgo+PiBFeGNl
bGxlbnQgcG9pbnQsIEkgZGlkIG5vdCBrbm93IGFib3V0IHRoYXQgb25lLgo+Pgo+PiBTcG90dGlu
ZyB0aGF0IHdlIGRvbid0IGRvIHRoZSBzYW1lIGZvciB0aGUgaGVhZCBwYWdlIG1hZGUgbWUgYXNz
dW1lIHRoYXQKPj4gaXQncyBqdXN0IGEgbWlzdXNlIG9mIF9faW5pdF9zaW5nbGVfcGFnZSgpLgo+
Pgo+PiBCdXQgdGhlIG5hc3R5IHRoaW5nIGlzIHRoYXQgd2UgdXNlIG1lbWJsb2NrX3Jlc2VydmVk
X21hcmtfbm9pbml0KCkgdG8gb25seQo+PiBtYXJrIHRoZSB0YWlsIHBhZ2VzIC4uLgo+IAo+IEFu
ZCBldmVuIG5hc3RpZXIgdGhpbmcgaXMgdGhhdCB3aGVuIENPTkZJR19ERUZFUlJFRF9TVFJVQ1Rf
UEFHRV9JTklUIGlzCj4gZGlzYWJsZWQgc3RydWN0IHBhZ2VzIGFyZSBpbml0aWFsaXplZCByZWdh
cmRsZXNzIG9mCj4gbWVtYmxvY2tfcmVzZXJ2ZWRfbWFya19ub2luaXQoKS4KPiAKPiBJIHRoaW5r
IHRoaXMgcGF0Y2ggc2hvdWxkIGdvIGluIGJlZm9yZSB5b3VyIHVwZGF0ZXM6CgpTaG91bGRuJ3Qg
d2UgZml4IHRoaXMgaW4gbWVtYmxvY2sgY29kZT8KCkhhY2tpbmcgYXJvdW5kIHRoYXQgaW4gdGhl
IG1lbWJsb2NrX3Jlc2VydmVkX21hcmtfbm9pbml0KCkgdXNlciBzb3VuZCAKd3JvbmcgLS0gYW5k
IG5vdGhpbmcgaW4gdGhlIGRvYyBvZiBtZW1ibG9ja19yZXNlcnZlZF9tYXJrX25vaW5pdCgpIApz
cGVsbHMgdGhhdCBiZWhhdmlvciBvdXQuCgotLSAKQ2hlZXJzCgpEYXZpZCAvIGRoaWxkZW5iCgoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlz
Y3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xp
c3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
