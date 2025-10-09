Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DB79CCD188
	for <linux-riscv@archiver.kernel.org>; Thu,  9 Oct 2025 09:20:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/lmvpcwW4Oo8hP0YIAvDKoCkpUK/yaovwJw/z5qa8FU=; b=lOcYN3xVsoFa3R
	Sy7b4CgCR0A92R8iPUXTlCWH7JWHALPkrspIdMShOfO9K1emxEabwEqffY4WQ19q47L0Sl/3Sd3dB
	mTVQlEPjUby8PltF22GCEIAxYLxkTvOXc7QrMf/NpA82itG9Pz6Sva2UGkDgAe7GUydfGiUGQqrow
	+xYgA6FPzKp4k1NGvw0pd/q16FypMFKvwei0aQyxxliRFZeugWljy83tH79QootbRms5M3D8CeNIW
	BA2gwQdV4GracNAuT8GgTlq6LF9WuptPsh9oNUSr4sfBD98rlRE6qU6WyCxrAx/4hcM1q1TIu9/Ee
	SzsIJ3Y16ZiRnPyJX5fg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6mpB-00000005dj9-0YDa;
	Thu, 09 Oct 2025 09:20:37 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6mp7-00000005dhe-3hYF
	for linux-riscv@lists.infradead.org;
	Thu, 09 Oct 2025 09:20:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1760001633;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=nig+QThvSoNq9uOJUVuoYK6Ng7PXDFkVUD8omncLNk0=;
	b=gk842VPfyfIwF1lmQC6CnmosL9B2aSk/etE/AWfJEKKMU9sEYftpQgvAAe5rLvs7eD4xTT
	THyEkMUQ2Cdh9b3ie+h5zJfzs4LHIpmuiq1ySj9FsFx0dnCyHHoNDv+bu+V+yu5Qy1nNxY
	7CSdx5z1mWx6H2RUEQ8Ewuvi58mk6lI=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-673-_47OUVb1PQOfXwUmIDtHzQ-1; Thu, 09 Oct 2025 05:20:31 -0400
X-MC-Unique: _47OUVb1PQOfXwUmIDtHzQ-1
X-Mimecast-MFC-AGG-ID: _47OUVb1PQOfXwUmIDtHzQ_1760001630
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-46e2c11b94cso4932295e9.3
        for <linux-riscv@lists.infradead.org>; Thu, 09 Oct 2025 02:20:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760001630; x=1760606430;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nig+QThvSoNq9uOJUVuoYK6Ng7PXDFkVUD8omncLNk0=;
        b=l4lF1nEgWPjSWF8B4osapfIukmrQQSJz9c6Xaw6XHeVC5T4CRJyhQflwGPjEoJNl+n
         wqeajSAF8O+AH0JOzvvWqbZXzd7/luI1TWKW7mBU7SE13xsOBHtvgVjLcnWPoZLQPEEm
         BRZUENB1eeaC7d2UfZKkEGXBYvmEcQTVsvwQ84ibM+eIn72Aq+XYtRUr3E4fS/qVFkxY
         if16Evvalfg/Pk3ryvymogVUJSjj3PKglQY30aPP7exxlfGV2e3+3BBiZTcx5jhpKa2X
         iOlD6meIP1V9oPDGS/nfv6FIXrm9fhQzEMMWIddAaBKld41wSek9SrN7YgjMhDTuT8dU
         z78w==
X-Forwarded-Encrypted: i=1; AJvYcCV11g6PHyFgskk2Cl3JCFuUcvWBmBXD/jpVatpX9bY2OlhzbRADBt9Ch4KjzGkNmKjfirx2JUUohuk+rA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yxlvi2Rnwi3sGWOi322JGso4eFjMFu7F+Omw+/aPUPvaLKVfYlP
	kA5Qz0p0p6vJwnzto8qZM3b/yr9Nghj53BDppxAl8gHcltjJ5NRhjzONqbSaViMHSUOCiKD2BXx
	mtD2+P1qReFly9K0uYrNK6ozPKNSmK/oq+nlFDARDWRv0ZT8U/GNaDgk5CpQDZsXz/CKt2g==
X-Gm-Gg: ASbGncuL1N0OUZ2hwAmgjZBKLW55azN1A1ga1L0GMpN3lny5Reys2eK2Lb0fvHnIHAr
	WNE3s7jQ0xPaxZGe1LVGFMtxkzv4vkIPONbouh1TxnzhnQD1KkvQAs05RB+U7lVlrttkO4XkWbe
	UFBTU7CmuoNW93ksWdKjvMhR5badg2Z+345+osSjLlU7E+uSduiy37RQZjZASSbfxMOU/T+9/Qq
	znhSJjgrXuWoSxQCOcdSvQNDpSOjUnQfKeE4u1KPu6FDQZgKEUgyy0U7tKy7ik8sXsKIR/TCpg6
	jJQ4bU8QLFhOzltCTIG689QRRQry/VdCmG9icxO4akrK2xTFrd54Xvqx/N+mL7yTPSRB/SPiz0T
	YkNG5zBFU
X-Received: by 2002:a05:600c:4ed4:b0:45d:f88f:9304 with SMTP id 5b1f17b1804b1-46fa9b0e7b3mr48454895e9.30.1760001630366;
        Thu, 09 Oct 2025 02:20:30 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFH6dryW1Hp7SOcSF5pIq+EEl2O3Y7bdewmy6HJCehEpHpUM9rQ1drgsPXfQB4HV8Mtnkhnzg==
X-Received: by 2002:a05:600c:4ed4:b0:45d:f88f:9304 with SMTP id 5b1f17b1804b1-46fa9b0e7b3mr48454685e9.30.1760001629923;
        Thu, 09 Oct 2025 02:20:29 -0700 (PDT)
Received: from [192.168.3.141] (tmo-083-189.customers.d1-online.com. [80.187.83.189])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4255d8ab8b0sm33676902f8f.18.2025.10.09.02.20.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Oct 2025 02:20:29 -0700 (PDT)
Message-ID: <1db15a30-72d6-4045-8aa1-68bd8411b0ba@redhat.com>
Date: Thu, 9 Oct 2025 11:20:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: (bisected) [PATCH v2 08/37] mm/hugetlb: check for unreasonable
 folio sizes when registering hstate
To: Christophe Leroy <christophe.leroy@csgroup.eu>,
 linux-kernel@vger.kernel.org
Cc: Zi Yan <ziy@nvidia.com>, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 "Liam R. Howlett" <Liam.Howlett@oracle.com>,
 Alexander Potapenko <glider@google.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Brendan Jackman <jackmanb@google.com>, Christoph Lameter <cl@gentwo.org>,
 Dennis Zhou <dennis@kernel.org>, Dmitry Vyukov <dvyukov@google.com>,
 dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 iommu@lists.linux.dev, io-uring@vger.kernel.org,
 Jason Gunthorpe <jgg@nvidia.com>, Jens Axboe <axboe@kernel.dk>,
 Johannes Weiner <hannes@cmpxchg.org>, John Hubbard <jhubbard@nvidia.com>,
 kasan-dev@googlegroups.com, kvm@vger.kernel.org,
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
 wireguard@lists.zx2c4.com, x86@kernel.org,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
References: <20250901150359.867252-1-david@redhat.com>
 <20250901150359.867252-9-david@redhat.com>
 <3e043453-3f27-48ad-b987-cc39f523060a@csgroup.eu>
 <d3fc12d4-0b59-4b1f-bb5c-13189a01e13d@redhat.com>
 <faf62f20-8844-42a0-a7a7-846d8ead0622@csgroup.eu>
 <9361c75a-ab37-4d7f-8680-9833430d93d4@redhat.com>
 <03671aa8-4276-4707-9c75-83c96968cbb2@csgroup.eu>
From: David Hildenbrand <david@redhat.com>
Autocrypt: addr=david@redhat.com; keydata=
 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
 qIws/H2t
In-Reply-To: <03671aa8-4276-4707-9c75-83c96968cbb2@csgroup.eu>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: f2PURDp0ySLRbvZhDcpg98HADIcs73S6ASv1BpwJXhA_1760001630
X-Mimecast-Originator: redhat.com
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251009_022033_996380_09DB5A8B 
X-CRM114-Status: GOOD (  16.52  )
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

T24gMDkuMTAuMjUgMTE6MTYsIENocmlzdG9waGUgTGVyb3kgd3JvdGU6Cj4gCj4gCj4gTGUgMDkv
MTAvMjAyNSDDoCAxMDoxNCwgRGF2aWQgSGlsZGVuYnJhbmQgYSDDqWNyaXTCoDoKPj4gT24gMDku
MTAuMjUgMTA6MDQsIENocmlzdG9waGUgTGVyb3kgd3JvdGU6Cj4+Pgo+Pj4KPj4+IExlIDA5LzEw
LzIwMjUgw6AgMDk6MjIsIERhdmlkIEhpbGRlbmJyYW5kIGEgw6ljcml0wqA6Cj4+Pj4gT24gMDku
MTAuMjUgMDk6MTQsIENocmlzdG9waGUgTGVyb3kgd3JvdGU6Cj4+Pj4+IEhpIERhdmlkLAo+Pj4+
Pgo+Pj4+PiBMZSAwMS8wOS8yMDI1IMOgIDE3OjAzLCBEYXZpZCBIaWxkZW5icmFuZCBhIMOpY3Jp
dMKgOgo+Pj4+Pj4gZGlmZiAtLWdpdCBhL21tL2h1Z2V0bGIuYyBiL21tL2h1Z2V0bGIuYwo+Pj4+
Pj4gaW5kZXggMWU3NzdjYzUxYWQwNC4uZDM1NDJlOTJhNzEyZSAxMDA2NDQKPj4+Pj4+IC0tLSBh
L21tL2h1Z2V0bGIuYwo+Pj4+Pj4gKysrIGIvbW0vaHVnZXRsYi5jCj4+Pj4+PiBAQCAtNDY1Nyw2
ICs0NjU3LDcgQEAgc3RhdGljIGludCBfX2luaXQgaHVnZXRsYl9pbml0KHZvaWQpCj4+Pj4+PiAg
wqDCoMKgwqDCoMKgwqAgQlVJTERfQlVHX09OKHNpemVvZl9maWVsZChzdHJ1Y3QgcGFnZSwgcHJp
dmF0ZSkgKgo+Pj4+Pj4gQklUU19QRVJfQllURSA8Cj4+Pj4+PiAgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgIF9fTlJfSFBBR0VGTEFHUyk7Cj4+Pj4+PiArwqDCoMKgIEJVSUxEX0JVR19P
Tl9JTlZBTElEKEhVR0VUTEJfUEFHRV9PUkRFUiA+IE1BWF9GT0xJT19PUkRFUik7Cj4+Pj4+PiAg
wqDCoMKgwqDCoMKgwqAgaWYgKCFodWdlcGFnZXNfc3VwcG9ydGVkKCkpIHsKPj4+Pj4+ICDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgIGlmIChodWdldGxiX21heF9oc3RhdGUgfHwgZGVmYXVsdF9oc3Rh
dGVfbWF4X2h1Z2VfcGFnZXMpCj4+Pj4+PiBAQCAtNDc0MCw2ICs0NzQxLDcgQEAgdm9pZCBfX2lu
aXQgaHVnZXRsYl9hZGRfaHN0YXRlKHVuc2lnbmVkIGludAo+Pj4+Pj4gb3JkZXIpCj4+Pj4+PiAg
wqDCoMKgwqDCoMKgwqAgfQo+Pj4+Pj4gIMKgwqDCoMKgwqDCoMKgIEJVR19PTihodWdldGxiX21h
eF9oc3RhdGUgPj0gSFVHRV9NQVhfSFNUQVRFKTsKPj4+Pj4+ICDCoMKgwqDCoMKgwqDCoCBCVUdf
T04ob3JkZXIgPCBvcmRlcl9iYXNlXzIoX19OUl9VU0VEX1NVQlBBR0UpKTsKPj4+Pj4+ICvCoMKg
wqAgV0FSTl9PTihvcmRlciA+IE1BWF9GT0xJT19PUkRFUik7Cj4+Pj4+PiAgwqDCoMKgwqDCoMKg
wqAgaCA9ICZoc3RhdGVzW2h1Z2V0bGJfbWF4X2hzdGF0ZSsrXTsKPj4+Pj4+ICDCoMKgwqDCoMKg
wqDCoCBfX211dGV4X2luaXQoJmgtPnJlc2l6ZV9sb2NrLCAicmVzaXplIG11dGV4IiwgJmgtPnJl
c2l6ZV9rZXkpOwo+Pj4+Pj4gIMKgwqDCoMKgwqDCoMKgIGgtPm9yZGVyID0gb3JkZXI7Cj4+Pj4K
Pj4+PiBXZSBlbmQgdXAgcmVnaXN0ZXJpbmcgaHVnZXRsYiBmb2xpb3MgdGhhdCBhcmUgYmlnZ2Vy
IHRoYW4KPj4+PiBNQVhfRk9MSU9fT1JERVIuIFNvIHdlIGhhdmUgdG8gZmlndXJlIG91dCBob3cg
YSBjb25maWcgY2FuIHRyaWdnZXIgdGhhdAo+Pj4+IChhbmQgaWYgd2UgaGF2ZSB0byBzdXBwb3J0
IHRoYXQpLgo+Pj4+Cj4+Pgo+Pj4gTUFYX0ZPTElPX09SREVSIGlzIGRlZmluZWQgYXM6Cj4+Pgo+
Pj4gI2lmZGVmIENPTkZJR19BUkNIX0hBU19HSUdBTlRJQ19QQUdFCj4+PiAjZGVmaW5lIE1BWF9G
T0xJT19PUkRFUsKgwqDCoMKgwqDCoMKgIFBVRF9PUkRFUgo+Pj4gI2Vsc2UKPj4+ICNkZWZpbmUg
TUFYX0ZPTElPX09SREVSwqDCoMKgwqDCoMKgwqAgTUFYX1BBR0VfT1JERVIKPj4+ICNlbmRpZgo+
Pj4KPj4+IE1BWF9QQUdFX09SREVSIGlzIHRoZSBsaW1pdCBmb3IgZHluYW1pYyBjcmVhdGlvbiBv
ZiBodWdlcGFnZXMgdmlhCj4+PiAvc3lzL2tlcm5lbC9tbS9odWdlcGFnZXMvIGJ1dCBiaWdnZXIg
cGFnZXMgY2FuIGJlIGNyZWF0ZWQgYXQgYm9vdHRpbWUKPj4+IHdpdGgga2VybmVsIGJvb3QgcGFy
YW1ldGVycyB3aXRob3V0IENPTkZJR19BUkNIX0hBU19HSUdBTlRJQ19QQUdFOgo+Pj4KPj4+ICDC
oMKgwqAgaHVnZXBhZ2Vzej02NG0gaHVnZXBhZ2VzPTEgaHVnZXBhZ2Vzej0yNTZtIGh1Z2VwYWdl
cz0xCj4+Pgo+Pj4gR2l2ZXM6Cj4+Pgo+Pj4gSHVnZVRMQjogcmVnaXN0ZXJlZCAxLjAwIEdpQiBw
YWdlIHNpemUsIHByZS1hbGxvY2F0ZWQgMCBwYWdlcwo+Pj4gSHVnZVRMQjogMCBLaUIgdm1lbW1h
cCBjYW4gYmUgZnJlZWQgZm9yIGEgMS4wMCBHaUIgcGFnZQo+Pj4gSHVnZVRMQjogcmVnaXN0ZXJl
ZCA2NC4wIE1pQiBwYWdlIHNpemUsIHByZS1hbGxvY2F0ZWQgMSBwYWdlcwo+Pj4gSHVnZVRMQjog
MCBLaUIgdm1lbW1hcCBjYW4gYmUgZnJlZWQgZm9yIGEgNjQuMCBNaUIgcGFnZQo+Pj4gSHVnZVRM
QjogcmVnaXN0ZXJlZCAyNTYgTWlCIHBhZ2Ugc2l6ZSwgcHJlLWFsbG9jYXRlZCAxIHBhZ2VzCj4+
PiBIdWdlVExCOiAwIEtpQiB2bWVtbWFwIGNhbiBiZSBmcmVlZCBmb3IgYSAyNTYgTWlCIHBhZ2UK
Pj4+IEh1Z2VUTEI6IHJlZ2lzdGVyZWQgNC4wMCBNaUIgcGFnZSBzaXplLCBwcmUtYWxsb2NhdGVk
IDAgcGFnZXMKPj4+IEh1Z2VUTEI6IDAgS2lCIHZtZW1tYXAgY2FuIGJlIGZyZWVkIGZvciBhIDQu
MDAgTWlCIHBhZ2UKPj4+IEh1Z2VUTEI6IHJlZ2lzdGVyZWQgMTYuMCBNaUIgcGFnZSBzaXplLCBw
cmUtYWxsb2NhdGVkIDAgcGFnZXMKPj4+IEh1Z2VUTEI6IDAgS2lCIHZtZW1tYXAgY2FuIGJlIGZy
ZWVkIGZvciBhIDE2LjAgTWlCIHBhZ2UKPj4KPj4gSSB0aGluayBpdCdzIGEgdmlvbGF0aW9uIG9m
IENPTkZJR19BUkNIX0hBU19HSUdBTlRJQ19QQUdFLiBUaGUgZXhpc3RpbmcKPj4gZm9saW9fZHVt
cCgpIGNvZGUgd291bGQgbm90IGhhbmRsZSBpdCBjb3JyZWN0bHkgYXMgd2VsbC4KPiAKPiBJJ20g
dHJ5aW5nIHRvIGRpZyBpbnRvIGhpc3RvcnkgYW5kIHdoZW4gbG9va2luZyBhdCBjb21taXQgNGVi
MDcxNmU4NjhlCj4gKCJodWdldGxiOiBhbGxvdyB0byBmcmVlIGdpZ2FudGljIHBhZ2VzIHJlZ2Fy
ZGxlc3Mgb2YgdGhlCj4gY29uZmlndXJhdGlvbiIpIEkgdW5kZXJzdGFuZCB0aGF0IENPTkZJR19B
UkNIX0hBU19HSUdBTlRJQ19QQUdFIGlzCj4gbmVlZGVkIHRvIGJlIGFibGUgdG8gYWxsb2NhdGUg
Z2lnYW50aWMgcGFnZXMgYXQgcnVudGltZS4gSXQgaXMgbm90Cj4gbmVlZGVkIHRvIHJlc2VydmUg
Z2lnYW50aWMgcGFnZXMgYXQgYm9vdHRpbWUuCj4gCj4gV2hhdCBhbSBJIG1pc3NpbmcgPwoKVGhh
dCBDT05GSUdfQVJDSF9IQVNfR0lHQU5USUNfUEFHRSBoYXMgbm90aGluZyBydW50aW1lLXNwZWNp
ZmljIGluIGl0cyBuYW1lLgoKQ2FuJ3Qgd2UganVzdCBzZWxlY3QgQ09ORklHX0FSQ0hfSEFTX0dJ
R0FOVElDX1BBR0UgZm9yIHRoZSByZWxldmFudCAKaHVnZXRsYiBjb25maWcgdGhhdCBhbGxvd3Mg
Zm9yICpnaWdhbnRpYyBwYWdlcyouCgotLSAKQ2hlZXJzCgpEYXZpZCAvIGRoaWxkZW5iCgoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3Yg
bWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3Rz
LmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
