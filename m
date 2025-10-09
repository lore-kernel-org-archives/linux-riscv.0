Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA0BACCA470
	for <linux-riscv@archiver.kernel.org>; Thu,  9 Oct 2025 10:27:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3FugRCP69CfJyrWt0qwU3APizoor0T5+D1zg/qS8/bQ=; b=R7oUeP1fjBraSF
	Fkb6iXyUOzCeFfaK4oR5OGCKOLUKPJXVDnzVToprCFz3V6aFKjneILCf9He9FVMJ97NDvZWdn0iHj
	IgS6mUplspFQMpTsBQn9wk8iQJXUi3J87YXR7BAXa5vHXgyIZ9uTaQ/jiPnbjh4BjEWm8JemlwOSM
	ouYZ3s8UaK1ZFFwvbb6cSwxTvHL8jdtxchkugKuQ5ywD3xhmpSu/ZoUlR7J+BiiqjffjseJ4/G8zn
	eMJS69eBJ6WC9WW2tBC2XchdnIqQ95gouHNZnSBqXUMulg+yyyXmIGxSP5TYsRFUidx/HB4qG3WJe
	y0BJc7qU/9L6rvkmY/Ww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6nrw-00000005n9y-0nmM;
	Thu, 09 Oct 2025 10:27:32 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6nrt-00000005n8V-4B76
	for linux-riscv@lists.infradead.org;
	Thu, 09 Oct 2025 10:27:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1760005648;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=PnaMSwBDtuymaXBhgXecb0+EmYLZhk15irlwltuvb1Y=;
	b=gorcv2kHuKBuohjfXdLCl01tYZFEw7t9MYakKT0fOcXMoG4xG03jwfL38o+6zLCRV1q6Zm
	7jplN3rtAba36PrWCRUIzRe58i5paKk5UVgdkPMFHi3z2DqkB3XkK84z5CX6uIn0Xt/Hh3
	PX3cBbny2ZXczVE7tihr7vNcnfNv1tw=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-76-r5vHjQQ9N2G3hiS-YIuOGw-1; Thu, 09 Oct 2025 06:27:25 -0400
X-MC-Unique: r5vHjQQ9N2G3hiS-YIuOGw-1
X-Mimecast-MFC-AGG-ID: r5vHjQQ9N2G3hiS-YIuOGw_1760005644
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-3ee1365964cso755952f8f.2
        for <linux-riscv@lists.infradead.org>; Thu, 09 Oct 2025 03:27:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760005644; x=1760610444;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PnaMSwBDtuymaXBhgXecb0+EmYLZhk15irlwltuvb1Y=;
        b=inzGvHA6CZiVy/Nv78Y+t7yXo15SQxY52pFJXx95AX20rZg8nlHg0O82aqk1OsongG
         YG/ptiBaPBPkmAF8RgJ8I0tN0rj+8OgvVwuPU2LYNL7hnNsatIaFXWlNTEUuMB4lACKJ
         Ak6IZgR8X6t2I+Q2AkLMuT272vPiQncraOqJDLEhzgEJTMpUpB3aj+oKJZKw40GvmjBd
         g1bxExVdHhm1ZpZl62ubdtx4lGRv5RhkcGiG7211zGA8CwyxUl1v3OOMT0E35r29qCnQ
         tglK/cIvn3oSWS2S6msteBmCEpO5ue3oBL+vxvnaYT824jy3+dPirp2hOWHrBE6m0hbz
         Ub4A==
X-Forwarded-Encrypted: i=1; AJvYcCVuhvrBaO5wjCJVMX1ZGODkyzJYkWBlMlRdTLTJJTtxtfq1qLGLo7KdHmiRMkoULX4u7Sp/gpMSmmddDw==@lists.infradead.org
X-Gm-Message-State: AOJu0YwKgKkIpDOCZN51i/jd/t09ZnQEibuRQNcrMqm/oQzfIItobUhj
	lLhmT1CzLJFJtGo+zbElmN14acc6UyUK/JAN+Cmt5lIE/zoESyopP/IgTe48JZkZzXg5QXG/GRN
	cmfiLzTXy5QmlfUliMlSBt+PD3l2jv1oOtWgjCiwrgJq5J4jeopHDjJjdQPUCZEUFqds/Pw==
X-Gm-Gg: ASbGnctyR+xtHdqvHNv06EkSEium+qgXHsz/SwzijXfejiFZ/P3bxlaUihfdfhg2lmF
	HbAiuT+I+sYL+4A5supv+S0c4gVEMiVGypaOWVygMvwb5a36jbtD1301uniGmrFALcOVQkPJE0d
	CsQzSPgquTkXLr3ZR3/d/RmJyx57v4EKCCcrv0vrDUs/mmm7KyIqjP1kFNTOZnokm2QtB3vDw5i
	FURQZmxQmTYq7KYHz6R9/ddGzG0S0nKXgoO9VzxiyF9ETx9N1N4HuAkacPM8eivjOhecMJl0NYP
	7lQ3w4CpqwnzmiBgynoqpgYpZoL7S0J8mCCrDwQxThwgGgsB9m3FFydKsWRcegxe9GyX2Wtq/sP
	owXSc3cLy
X-Received: by 2002:a05:6000:26c9:b0:425:74e1:25f7 with SMTP id ffacd0b85a97d-4266e8e6d0amr4383267f8f.62.1760005643648;
        Thu, 09 Oct 2025 03:27:23 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEesLOt7nL3ssClyJORVAYlz8cRc7j7l9rZT7U1D7oG6YdutQizbYz0xgMQfBuUYe2CfhAXag==
X-Received: by 2002:a05:6000:26c9:b0:425:74e1:25f7 with SMTP id ffacd0b85a97d-4266e8e6d0amr4383228f8f.62.1760005643040;
        Thu, 09 Oct 2025 03:27:23 -0700 (PDT)
Received: from [192.168.3.141] (tmo-083-189.customers.d1-online.com. [80.187.83.189])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4255d8ab8fdsm33619939f8f.15.2025.10.09.03.27.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Oct 2025 03:27:22 -0700 (PDT)
Message-ID: <543e9440-8ee0-4d9e-9b05-0107032d665b@redhat.com>
Date: Thu, 9 Oct 2025 12:27:17 +0200
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
 <1db15a30-72d6-4045-8aa1-68bd8411b0ba@redhat.com>
 <0c730c52-97ee-43ea-9697-ac11d2880ab7@csgroup.eu>
From: David Hildenbrand <david@redhat.com>
Autocrypt: addr=david@redhat.com; keydata=
 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
 qIws/H2t
In-Reply-To: <0c730c52-97ee-43ea-9697-ac11d2880ab7@csgroup.eu>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: bgW0taxPkIKZede1auGTMWdES9_xcfJoj510boni0TY_1760005644
X-Mimecast-Originator: redhat.com
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251009_032730_172594_3E45F5CA 
X-CRM114-Status: GOOD (  31.16  )
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

T24gMDkuMTAuMjUgMTI6MDEsIENocmlzdG9waGUgTGVyb3kgd3JvdGU6Cj4gCj4gCj4gTGUgMDkv
MTAvMjAyNSDDoCAxMToyMCwgRGF2aWQgSGlsZGVuYnJhbmQgYSDDqWNyaXTCoDoKPj4gT24gMDku
MTAuMjUgMTE6MTYsIENocmlzdG9waGUgTGVyb3kgd3JvdGU6Cj4+Pgo+Pj4KPj4+IExlIDA5LzEw
LzIwMjUgw6AgMTA6MTQsIERhdmlkIEhpbGRlbmJyYW5kIGEgw6ljcml0wqA6Cj4+Pj4gT24gMDku
MTAuMjUgMTA6MDQsIENocmlzdG9waGUgTGVyb3kgd3JvdGU6Cj4+Pj4+Cj4+Pj4+Cj4+Pj4+IExl
IDA5LzEwLzIwMjUgw6AgMDk6MjIsIERhdmlkIEhpbGRlbmJyYW5kIGEgw6ljcml0wqA6Cj4+Pj4+
PiBPbiAwOS4xMC4yNSAwOToxNCwgQ2hyaXN0b3BoZSBMZXJveSB3cm90ZToKPj4+Pj4+PiBIaSBE
YXZpZCwKPj4+Pj4+Pgo+Pj4+Pj4+IExlIDAxLzA5LzIwMjUgw6AgMTc6MDMsIERhdmlkIEhpbGRl
bmJyYW5kIGEgw6ljcml0wqA6Cj4+Pj4+Pj4+IGRpZmYgLS1naXQgYS9tbS9odWdldGxiLmMgYi9t
bS9odWdldGxiLmMKPj4+Pj4+Pj4gaW5kZXggMWU3NzdjYzUxYWQwNC4uZDM1NDJlOTJhNzEyZSAx
MDA2NDQKPj4+Pj4+Pj4gLS0tIGEvbW0vaHVnZXRsYi5jCj4+Pj4+Pj4+ICsrKyBiL21tL2h1Z2V0
bGIuYwo+Pj4+Pj4+PiBAQCAtNDY1Nyw2ICs0NjU3LDcgQEAgc3RhdGljIGludCBfX2luaXQgaHVn
ZXRsYl9pbml0KHZvaWQpCj4+Pj4+Pj4+ICDCoMKgwqDCoMKgwqDCoMKgIEJVSUxEX0JVR19PTihz
aXplb2ZfZmllbGQoc3RydWN0IHBhZ2UsIHByaXZhdGUpICoKPj4+Pj4+Pj4gQklUU19QRVJfQllU
RSA8Cj4+Pj4+Pj4+ICDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBfX05SX0hQQUdF
RkxBR1MpOwo+Pj4+Pj4+PiArwqDCoMKgIEJVSUxEX0JVR19PTl9JTlZBTElEKEhVR0VUTEJfUEFH
RV9PUkRFUiA+IE1BWF9GT0xJT19PUkRFUik7Cj4+Pj4+Pj4+ICDCoMKgwqDCoMKgwqDCoMKgIGlm
ICghaHVnZXBhZ2VzX3N1cHBvcnRlZCgpKSB7Cj4+Pj4+Pj4+ICDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqAgaWYgKGh1Z2V0bGJfbWF4X2hzdGF0ZSB8fAo+Pj4+Pj4+PiBkZWZhdWx0X2hzdGF0ZV9t
YXhfaHVnZV9wYWdlcykKPj4+Pj4+Pj4gQEAgLTQ3NDAsNiArNDc0MSw3IEBAIHZvaWQgX19pbml0
IGh1Z2V0bGJfYWRkX2hzdGF0ZSh1bnNpZ25lZCBpbnQKPj4+Pj4+Pj4gb3JkZXIpCj4+Pj4+Pj4+
ICDCoMKgwqDCoMKgwqDCoMKgIH0KPj4+Pj4+Pj4gIMKgwqDCoMKgwqDCoMKgwqAgQlVHX09OKGh1
Z2V0bGJfbWF4X2hzdGF0ZSA+PSBIVUdFX01BWF9IU1RBVEUpOwo+Pj4+Pj4+PiAgwqDCoMKgwqDC
oMKgwqDCoCBCVUdfT04ob3JkZXIgPCBvcmRlcl9iYXNlXzIoX19OUl9VU0VEX1NVQlBBR0UpKTsK
Pj4+Pj4+Pj4gK8KgwqDCoCBXQVJOX09OKG9yZGVyID4gTUFYX0ZPTElPX09SREVSKTsKPj4+Pj4+
Pj4gIMKgwqDCoMKgwqDCoMKgwqAgaCA9ICZoc3RhdGVzW2h1Z2V0bGJfbWF4X2hzdGF0ZSsrXTsK
Pj4+Pj4+Pj4gIMKgwqDCoMKgwqDCoMKgwqAgX19tdXRleF9pbml0KCZoLT5yZXNpemVfbG9jaywg
InJlc2l6ZSBtdXRleCIsICZoLQo+Pj4+Pj4+Pj4gcmVzaXplX2tleSk7Cj4+Pj4+Pj4+ICDCoMKg
wqDCoMKgwqDCoMKgIGgtPm9yZGVyID0gb3JkZXI7Cj4+Pj4+Pgo+Pj4+Pj4gV2UgZW5kIHVwIHJl
Z2lzdGVyaW5nIGh1Z2V0bGIgZm9saW9zIHRoYXQgYXJlIGJpZ2dlciB0aGFuCj4+Pj4+PiBNQVhf
Rk9MSU9fT1JERVIuIFNvIHdlIGhhdmUgdG8gZmlndXJlIG91dCBob3cgYSBjb25maWcgY2FuIHRy
aWdnZXIKPj4+Pj4+IHRoYXQKPj4+Pj4+IChhbmQgaWYgd2UgaGF2ZSB0byBzdXBwb3J0IHRoYXQp
Lgo+Pj4+Pj4KPj4+Pj4KPj4+Pj4gTUFYX0ZPTElPX09SREVSIGlzIGRlZmluZWQgYXM6Cj4+Pj4+
Cj4+Pj4+ICNpZmRlZiBDT05GSUdfQVJDSF9IQVNfR0lHQU5USUNfUEFHRQo+Pj4+PiAjZGVmaW5l
IE1BWF9GT0xJT19PUkRFUsKgwqDCoMKgwqDCoMKgIFBVRF9PUkRFUgo+Pj4+PiAjZWxzZQo+Pj4+
PiAjZGVmaW5lIE1BWF9GT0xJT19PUkRFUsKgwqDCoMKgwqDCoMKgIE1BWF9QQUdFX09SREVSCj4+
Pj4+ICNlbmRpZgo+Pj4+Pgo+Pj4+PiBNQVhfUEFHRV9PUkRFUiBpcyB0aGUgbGltaXQgZm9yIGR5
bmFtaWMgY3JlYXRpb24gb2YgaHVnZXBhZ2VzIHZpYQo+Pj4+PiAvc3lzL2tlcm5lbC9tbS9odWdl
cGFnZXMvIGJ1dCBiaWdnZXIgcGFnZXMgY2FuIGJlIGNyZWF0ZWQgYXQgYm9vdHRpbWUKPj4+Pj4g
d2l0aCBrZXJuZWwgYm9vdCBwYXJhbWV0ZXJzIHdpdGhvdXQgQ09ORklHX0FSQ0hfSEFTX0dJR0FO
VElDX1BBR0U6Cj4+Pj4+Cj4+Pj4+ICDCoMKgwqDCoCBodWdlcGFnZXN6PTY0bSBodWdlcGFnZXM9
MSBodWdlcGFnZXN6PTI1Nm0gaHVnZXBhZ2VzPTEKPj4+Pj4KPj4+Pj4gR2l2ZXM6Cj4+Pj4+Cj4+
Pj4+IEh1Z2VUTEI6IHJlZ2lzdGVyZWQgMS4wMCBHaUIgcGFnZSBzaXplLCBwcmUtYWxsb2NhdGVk
IDAgcGFnZXMKPj4+Pj4gSHVnZVRMQjogMCBLaUIgdm1lbW1hcCBjYW4gYmUgZnJlZWQgZm9yIGEg
MS4wMCBHaUIgcGFnZQo+Pj4+PiBIdWdlVExCOiByZWdpc3RlcmVkIDY0LjAgTWlCIHBhZ2Ugc2l6
ZSwgcHJlLWFsbG9jYXRlZCAxIHBhZ2VzCj4+Pj4+IEh1Z2VUTEI6IDAgS2lCIHZtZW1tYXAgY2Fu
IGJlIGZyZWVkIGZvciBhIDY0LjAgTWlCIHBhZ2UKPj4+Pj4gSHVnZVRMQjogcmVnaXN0ZXJlZCAy
NTYgTWlCIHBhZ2Ugc2l6ZSwgcHJlLWFsbG9jYXRlZCAxIHBhZ2VzCj4+Pj4+IEh1Z2VUTEI6IDAg
S2lCIHZtZW1tYXAgY2FuIGJlIGZyZWVkIGZvciBhIDI1NiBNaUIgcGFnZQo+Pj4+PiBIdWdlVExC
OiByZWdpc3RlcmVkIDQuMDAgTWlCIHBhZ2Ugc2l6ZSwgcHJlLWFsbG9jYXRlZCAwIHBhZ2VzCj4+
Pj4+IEh1Z2VUTEI6IDAgS2lCIHZtZW1tYXAgY2FuIGJlIGZyZWVkIGZvciBhIDQuMDAgTWlCIHBh
Z2UKPj4+Pj4gSHVnZVRMQjogcmVnaXN0ZXJlZCAxNi4wIE1pQiBwYWdlIHNpemUsIHByZS1hbGxv
Y2F0ZWQgMCBwYWdlcwo+Pj4+PiBIdWdlVExCOiAwIEtpQiB2bWVtbWFwIGNhbiBiZSBmcmVlZCBm
b3IgYSAxNi4wIE1pQiBwYWdlCj4+Pj4KPj4+PiBJIHRoaW5rIGl0J3MgYSB2aW9sYXRpb24gb2Yg
Q09ORklHX0FSQ0hfSEFTX0dJR0FOVElDX1BBR0UuIFRoZSBleGlzdGluZwo+Pj4+IGZvbGlvX2R1
bXAoKSBjb2RlIHdvdWxkIG5vdCBoYW5kbGUgaXQgY29ycmVjdGx5IGFzIHdlbGwuCj4+Pgo+Pj4g
SSdtIHRyeWluZyB0byBkaWcgaW50byBoaXN0b3J5IGFuZCB3aGVuIGxvb2tpbmcgYXQgY29tbWl0
IDRlYjA3MTZlODY4ZQo+Pj4gKCJodWdldGxiOiBhbGxvdyB0byBmcmVlIGdpZ2FudGljIHBhZ2Vz
IHJlZ2FyZGxlc3Mgb2YgdGhlCj4+PiBjb25maWd1cmF0aW9uIikgSSB1bmRlcnN0YW5kIHRoYXQg
Q09ORklHX0FSQ0hfSEFTX0dJR0FOVElDX1BBR0UgaXMKPj4+IG5lZWRlZCB0byBiZSBhYmxlIHRv
IGFsbG9jYXRlIGdpZ2FudGljIHBhZ2VzIGF0IHJ1bnRpbWUuIEl0IGlzIG5vdAo+Pj4gbmVlZGVk
IHRvIHJlc2VydmUgZ2lnYW50aWMgcGFnZXMgYXQgYm9vdHRpbWUuCj4+Pgo+Pj4gV2hhdCBhbSBJ
IG1pc3NpbmcgPwo+Pgo+PiBUaGF0IENPTkZJR19BUkNIX0hBU19HSUdBTlRJQ19QQUdFIGhhcyBu
b3RoaW5nIHJ1bnRpbWUtc3BlY2lmaWMgaW4gaXRzCj4+IG5hbWUuCj4gCj4gSW4gaXRzIG5hbWUg
Zm9yIHN1cmUsIGJ1dCB0aGUgY29tbWl0IEkgbWVudGlvbiBzYXlzOgo+IAo+ICAgICAgIE9uIHN5
c3RlbXMgd2l0aG91dCBDT05USUdfQUxMT0MgYWN0aXZhdGVkIGJ1dCB0aGF0IHN1cHBvcnQgZ2ln
YW50aWMKPiBwYWdlcywKPiAgICAgICBib290dGltZSByZXNlcnZlZCBnaWdhbnRpYyBwYWdlcyBj
YW4gbm90IGJlIGZyZWVkIGF0IGFsbC4gIFRoaXMgcGF0Y2gKPiAgICAgICBzaW1wbHkgZW5hYmxl
cyB0aGUgcG9zc2liaWxpdHkgdG8gaGFuZCBiYWNrIHRob3NlIHBhZ2VzIHRvIG1lbW9yeQo+ICAg
ICAgIGFsbG9jYXRvci4KClJpZ2h0LCBJIHRoaW5rIGl0IHdhcyBhIGhpc3RvcmljYWwgYXJ0aWZh
Y3QuCgo+IAo+IEFuZCBvbmUgb2YgdGhlIGh1bmtzIGlzOgo+IAo+IGRpZmYgLS1naXQgYS9hcmNo
L2FybTY0L0tjb25maWcgYi9hcmNoL2FybTY0L0tjb25maWcKPiBpbmRleCA3ZjdmYmQ4YmQ5ZDVi
Li43YTFhYTUzZDE4OGQzIDEwMDY0NAo+IC0tLSBhL2FyY2gvYXJtNjQvS2NvbmZpZwo+ICsrKyBi
L2FyY2gvYXJtNjQvS2NvbmZpZwo+IEBAIC0xOSw3ICsxOSw3IEBAIGNvbmZpZyBBUk02NAo+ICAg
ICAgICAgICBzZWxlY3QgQVJDSF9IQVNfRkFTVF9NVUxUSVBMSUVSCj4gICAgICAgICAgIHNlbGVj
dCBBUkNIX0hBU19GT1JUSUZZX1NPVVJDRQo+ICAgICAgICAgICBzZWxlY3QgQVJDSF9IQVNfR0NP
Vl9QUk9GSUxFX0FMTAo+IC0gICAgICAgc2VsZWN0IEFSQ0hfSEFTX0dJR0FOVElDX1BBR0UgaWYg
Q09OVElHX0FMTE9DCj4gKyAgICAgICBzZWxlY3QgQVJDSF9IQVNfR0lHQU5USUNfUEFHRQo+ICAg
ICAgICAgICBzZWxlY3QgQVJDSF9IQVNfS0NPVgo+ICAgICAgICAgICBzZWxlY3QgQVJDSF9IQVNf
S0VFUElOSVRSRAo+ICAgICAgICAgICBzZWxlY3QgQVJDSF9IQVNfTUVNQkFSUklFUl9TWU5DX0NP
UkUKPiAKPiBTbyBJIHVuZGVyc3RhbmQgZnJvbSB0aGUgY29tbWl0IG1lc3NhZ2UgdGhhdCBpdCB3
YXMgcG9zc2libGUgYXQgdGhhdAo+IHRpbWUgdG8gaGF2ZSBnaWdhbnRpYyBwYWdlcyB3aXRob3V0
IEFSQ0hfSEFTX0dJR0FOVElDX1BBR0UgYXMgbG9uZyBhcwo+IHlvdSBkaWRuJ3QgaGF2ZSB0byBi
ZSBhYmxlIHRvIGZyZWUgdGhlbSBkdXJpbmcgcnVudGltZS4KClllcywgSSBhZ3JlZS4KCj4gCj4+
Cj4+IENhbid0IHdlIGp1c3Qgc2VsZWN0IENPTkZJR19BUkNIX0hBU19HSUdBTlRJQ19QQUdFIGZv
ciB0aGUgcmVsZXZhbnQKPj4gaHVnZXRsYiBjb25maWcgdGhhdCBhbGxvd3MgZm9yICpnaWdhbnRp
YyBwYWdlcyouCj4+Cj4gCj4gV2UgcHJvYmFibHkgY2FuLCBidXQgSSdkIHJlYWxseSBsaWtlIHRv
IHVuZGVyc3RhbmQgaGlzdG9yeSBhbmQgaG93IHdlCj4gZW5kZWQgdXAgaW4gdGhlIHNpdHVhdGlv
biB3ZSBhcmUgbm93Lgo+IEJlY2F1c2UgYmxpbmQgZml4ZXMgb2Z0ZW4gbGVhZCB0byBtb3JlIHBy
b2JsZW1zLgoKWWVzLCBsZXQncyBmaWd1cmUgb3V0IGhvdyB0byB0byBpdCBjbGVhbmx5LgoKPiAK
PiBJZiBJIGZvbGxvdyB0aGluZ3MgY29ycmVjdGx5IEkgc2VlIGEgaGVscGVyIGdpZ2FudGljX3Bh
Z2Vfc3VwcG9ydGVkKCkKPiBhZGRlZCBieSBjb21taXQgOTQ0ZDlmZWM4ZDdhICgiaHVnZXRsYjog
YWRkIHN1cHBvcnQgZm9yIGdpZ2FudGljIHBhZ2UKPiBhbGxvY2F0aW9uIGF0IHJ1bnRpbWUiKS4K
PiAKPiBBbmQgdGhlbiBjb21taXQgNDYxYTcxODQzMjBhICgibW0vaHVnZXRsYjogaW50cm9kdWNl
Cj4gQVJDSF9IQVNfR0lHQU5USUNfUEFHRSIpIGlzIGFkZGVkIHRvIHdyYXAgZ2lnYW50aWNfcGFn
ZV9zdXBwb3J0ZWQoKQo+IAo+IFRoZW4gY29tbWl0IDRlYjA3MTZlODY4ZSAoImh1Z2V0bGI6IGFs
bG93IHRvIGZyZWUgZ2lnYW50aWMgcGFnZXMKPiByZWdhcmRsZXNzIG9mIHRoZSBjb25maWd1cmF0
aW9uIikgY2hhbmdlZCBnaWdhbnRpY19wYWdlX3N1cHBvcnRlZCgpIHRvCj4gZ2lnYW50aWNfcGFn
ZV9ydW50aW1lX3N1cHBvcnRlZCgpCj4gCj4gU28gd2hlcmUgYXJlIHdlIG5vdyA/CgpJbgoKY29t
bWl0IGZhZTdkODM0YzQzY2NkYjlmY2VjYWY0ZDBmMzMxNDVkODg0YjNlNWMKQXV0aG9yOiBNYXR0
aGV3IFdpbGNveCAoT3JhY2xlKSA8d2lsbHlAaW5mcmFkZWFkLm9yZz4KRGF0ZTogICBUdWUgRmVi
IDI3IDE5OjIzOjMxIDIwMjQgKzAwMDAKCiAgICAgbW06IGFkZCBfX2R1bXBfZm9saW8oKQoKCldl
IHN0YXJ0ZWQgYXNzdW1pbmcgdGhhdCBhIGZvbGlvIGluIHRoZSBzeXN0ZW0gKGJvb3R0aW1lLCBk
eW5hbWljLCB3aGF0ZXZlcikKaGFzIGEgbWF4aW11bSBvZiBNQVhfRk9MSU9fTlJfUEFHRVMuCgpB
bnkgb3RoZXIgaW50ZXJwcmV0YXRpb24gZG9lc24ndCBtYWtlIGFueSBzZW5zZSBmb3IgTUFYX0ZP
TElPX05SX1BBR0VTLgoKClNvIHdlIGhhdmUgdHdvIHF1ZXN0aW9uczoKCjEpIEhvdyB0byB0ZWFj
aCBNQVhfRk9MSU9fTlJfUEFHRVMgdGhhdCBodWdldGxiIHN1cHBvcnRzIGdpZ2FudGljIHBhZ2Vz
CgoyKSBIb3cgZG8gd2UgaGFuZGxlIENPTkZJR19BUkNIX0hBU19HSUdBTlRJQ19QQUdFCgoKV2Ug
aGF2ZSB0aGUgZm9sbG93aW5nIG9wdGlvbnMKCihBKSBSZW5hbWUgZXhpc3RpbmcgQ09ORklHX0FS
Q0hfSEFTX0dJR0FOVElDX1BBR0UgdG8gc29tZXRoaW5nIGVsc2UgdGhhdCBpcwpjbGVhcmVyIGFu
ZCBhZGQgYSBuZXcgQ09ORklHX0FSQ0hfSEFTX0dJR0FOVElDX1BBR0UuCgooQikgUmVuYW1lIGV4
aXN0aW5nIENPTkZJR19BUkNIX0hBU19HSUdBTlRJQ19QQUdFIC0+IHRvIHNvbWV0aGluZyBlbHNl
IHRoYXQgaXMKY2xlYXJlciBhbmQgZGVyaXZlIHNvbWVob3cgZWxzZSB0aGF0IGh1Z2V0bGIgaW4g
dGhhdCBjb25maWcgc3VwcG9ydHMgZ2lnYW50aWMgcGFnZXMuCgooYykgSnVzdCB1c2UgQ09ORklH
X0FSQ0hfSEFTX0dJR0FOVElDX1BBR0UgaWYgaHVnZXRsYiBvbiBhbiBhcmNoaXRlY3R1cmUKc3Vw
cG9ydHMgZ2lnYW50aWMgcGFnZXMuCgoKSSBkb24ndCBxdWl0ZSBzZWUgd2h5IGFuIGFyY2hpdGVj
dHVyZSBzaG91bGQgYmUgYWJsZSB0byBvcHQgaW4gaW50byBkeW5hbWljYWxseQphbGxvY2F0aW5n
K2ZyZWVpbmcgZ2lnYW50aWMgcGFnZXMuIFRoYXQncyBqdXN0IENPTlRJR19BTExPQyBtYWdpYyBh
bmQgbm90IHNvbWUKYXJjaC1zcGVjaWZpYyB0aGluZyBJSVJDLgoKCk5vdGUgdGhhdCBpbiBtbS9o
dWdldGxiLmMgaXQgaXMKCgkjaWZkZWYgQ09ORklHX0FSQ0hfSEFTX0dJR0FOVElDX1BBR0UKCSNp
ZmRlZiBDT05GSUdfQ09OVElHX0FMTE9DCgpNZWFuaW5nIHRoYXQgYXQgbGVhc3QgdGhlIGFsbG9j
YXRpb24gc2lkZSBpcyBndWFyZGVkIGJ5IENPTlRJR19BTExPQy4KClNvIEkgdGhpbmsgKEMpIGlz
IGp1c3QgdGhlIHJpZ2h0IHRoaW5nIHRvIGRvLgoKZGlmZiAtLWdpdCBhL2ZzL0tjb25maWcgYi9m
cy9LY29uZmlnCmluZGV4IDBiZmRhZWNhYTg3NzUuLjEyYzExZWI5Mjc5ZDMgMTAwNjQ0Ci0tLSBh
L2ZzL0tjb25maWcKKysrIGIvZnMvS2NvbmZpZwpAQCAtMjgzLDYgKzI4Myw4IEBAIGNvbmZpZyBI
VUdFVExCX1BNRF9QQUdFX1RBQkxFX1NIQVJJTkcKICAgICAgICAgZGVmX2Jvb2wgSFVHRVRMQl9Q
QUdFCiAgICAgICAgIGRlcGVuZHMgb24gQVJDSF9XQU5UX0hVR0VfUE1EX1NIQVJFICYmIFNQTElU
X1BNRF9QVExPQ0tTCiAgCisjIEFuIGFyY2hpdGVjdHVyZSBtdXN0IHNlbGVjdCB0aGlzIG9wdGlv
biBpZiB0aGVyZSBpcyBhbnkgbWVjaGFuaXNtIChlc3AuIGh1Z2V0bGIpCisjIGNvdWxkIG9idGFp
biBnaWdhbnRpYyBmb2xpb3MuCiAgY29uZmlnIEFSQ0hfSEFTX0dJR0FOVElDX1BBR0UKICAgICAg
ICAgYm9vbAogIAoKCi0tIApDaGVlcnMKCkRhdmlkIC8gZGhpbGRlbmIKCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxp
c3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFk
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
