Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3166AC7EE39
	for <linux-riscv@archiver.kernel.org>; Thu, 26 Jun 2025 08:56:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4AKwAt9fqrdJbqj4KqdV/hN0JwRMYGECX+3+t33N6Vw=; b=J6Q4Zf6JTdltvv
	ad6CR3wVZhsTNYaFVBpG2Zi0F+my8LNa78TZK6w1xBVFCnaZGpyqd/NQlXT2cyx6sx74a4dgOhfj7
	ebY2ZYiwHlGYNGQMOAih9Oqwnlzbu/gubGlYRm17fJ4gu/Jo/NKW91rkww9SumztNxTwYEqyf56r1
	wLhERVbDWrhNynVFzGX4cUIhHpmkyjjZG+HZvUwUyPaeF45SQFwBz6paUmQEMwJUbtKTvm/VOE0sb
	2P9+Ti0susscopMDVt48IiZokI4MkYLrFUF5HjU1jHx2bebmjkJ3JvVRDTY4Rmwzd9b7OkXFFZUVF
	O0/9koLVO60JNH3YS/Zw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUiP6-0000000B3eZ-32p6;
	Thu, 26 Jun 2025 08:56:20 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUhnL-0000000Aw1y-32Oc
	for linux-riscv@lists.infradead.org;
	Thu, 26 Jun 2025 08:17:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1750925838;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=55+jYEaEhNtGFPfW/0vKnlZGNZZvZBUpEkOyrpcO9hQ=;
	b=I51doo+2FbzXJUee5kVio9RN6k+Ny9DK6CaTsRNjIGWxzHgfaGkV313mxV9FeUlXYMZ6HI
	wWxUFm6NkYSgciuv1uPUNC5+oAGJTsrfqO9eLscFwcjrFrcTUnxzFmpagGZtMXyYTZtw3O
	zVh8EVJkd7u70kvqMLqh2sNwzDCYDKQ=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-360-ahLCfuorNXm26JaoEVsF5w-1; Thu, 26 Jun 2025 04:17:17 -0400
X-MC-Unique: ahLCfuorNXm26JaoEVsF5w-1
X-Mimecast-MFC-AGG-ID: ahLCfuorNXm26JaoEVsF5w_1750925836
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-3a50049f8eeso307432f8f.3
        for <linux-riscv@lists.infradead.org>; Thu, 26 Jun 2025 01:17:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750925836; x=1751530636;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=55+jYEaEhNtGFPfW/0vKnlZGNZZvZBUpEkOyrpcO9hQ=;
        b=fHA2r4gW/Lm9T3wWeu8Tbft8V6+bqGvCbpVvpQuKnWidISTubQCCBQ/v6NHy6EXbFC
         W9ic+2LRKazZyNG7GhTAhuQsdCvc/2RRVgiXrVOZ4tU7/I4jUn12+YiOfAVK7qFxWTkB
         Ff3QRdtKHxeeLbrwNgHnYPZMeXFzYHqTwTaBEozvmTfOg8ciOE+B5qIky8IZ9mlc02mE
         8MbwNr80TxKPipBKnOjajK70H/TWYoai8ZhSKzTwhWy/EMGAKyFXlAfnNuEQnOBJ1hwt
         TvwP9z0iQDSiTf/dfl0HTnNgKH6TRfnJ4rXBF/Ehk4i4SzgypXY0eH700lBji8uinmEs
         vuZw==
X-Forwarded-Encrypted: i=1; AJvYcCVyRVXINPqaq8CnpedbCk6OCD4knRL5zqUknVMYv7Uu9FYaLGE7h5D2G2b1/l7H3XMY6JjpYGD9W2FWXw==@lists.infradead.org
X-Gm-Message-State: AOJu0YwZwD7xeR2zzN5N7qCO3u3fZhwJSK/Rl1cHsg5fBOazdyRIcZZ0
	ULFXMI6aqDUXKHsfi6Z4CRepZxo8tJIwkMZNHUYiwEG5QS4XEx2bvBU0qU8qC+qSXRUTKnAxXiD
	NnIYKibM4QSNHvbdU1FO8DtL5496J9HaI6lWhyq55o5mmNX+HT17b+xiiYbo/Hj/2/N+8ww==
X-Gm-Gg: ASbGncs2gJIayRjX4bYXkpIpqyiRhGyzS6B/PnbX/+17j5oo2OhVNdx5jP7Q/DIgmXS
	5RqWIcvPePqapstBsVmoIlAiRcs3rab2WHa+i4WmH6j9nB9Q2nI02U3h6czqsHNX9yDwkfcNw5z
	SsNNYxuc5n4y/DsC0CMJeZuO03T7AMMlfcEwILNOxryDrzTZCv4vNTBl9kFmUKcXIkNmOd03sur
	MW1W+ZQ0tG9Wd7PIo1fE4MjaP2mOIdIaDDvDn2Gxs2BVWmnCGAOIDn1z+AdfqGvVxCO5baMGBZF
	wrf+9Gzc64TSaN5MaTI1RKQ/orsWvofasQR5DBOrlziMAu7DBFZPbgLc5XXgZUMyVuJqGcuUgLO
	BXTLn2VinlkxkHL05Y9CMUElW8yFrMV6TJMXirJvQBD+CNGkB7A==
X-Received: by 2002:a05:6000:1885:b0:3a1:f564:cd9d with SMTP id ffacd0b85a97d-3a6ed664553mr4593025f8f.36.1750925835694;
        Thu, 26 Jun 2025 01:17:15 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEhcXZypQm7XHMVnXTuYK23gyUnWaEv0Gc3DtKcA7Ooe9VhmSlfjk+Trd4HOr6R6kONFyi0fg==
X-Received: by 2002:a05:6000:1885:b0:3a1:f564:cd9d with SMTP id ffacd0b85a97d-3a6ed664553mr4593002f8f.36.1750925835318;
        Thu, 26 Jun 2025 01:17:15 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f3c:2f00:8afc:23fe:3813:776c? (p200300d82f3c2f008afc23fe3813776c.dip0.t-ipconnect.de. [2003:d8:2f3c:2f00:8afc:23fe:3813:776c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4538a3a6716sm11886905e9.11.2025.06.26.01.17.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Jun 2025 01:17:14 -0700 (PDT)
Message-ID: <a5b5b0aa-21c4-4abf-b323-63af96aabcd5@redhat.com>
Date: Thu, 26 Jun 2025 10:17:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/4] mm: Support batched unmap for lazyfree large
 folios during reclamation
To: Lance Yang <lance.yang@linux.dev>, Barry Song <21cnbao@gmail.com>
Cc: akpm@linux-foundation.org, baolin.wang@linux.alibaba.com,
 chrisl@kernel.org, kasong@tencent.com, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 linux-riscv@lists.infradead.org, lorenzo.stoakes@oracle.com,
 ryan.roberts@arm.com, v-songbaohua@oppo.com, x86@kernel.org,
 ying.huang@intel.com, zhengtangquan@oppo.com,
 Lance Yang <ioworker0@gmail.com>
References: <2c19a6cf-0b42-477b-a672-ed8c1edd4267@redhat.com>
 <20250624162503.78957-1-ioworker0@gmail.com>
 <27d174e0-c209-4851-825a-0baeb56df86f@redhat.com>
 <938c4726-b93e-46df-bceb-65c7574714a6@linux.dev>
 <CAGsJ_4y1GObH-C7R=FQL=UWe3kF6qhKoRqPxNPYx0k7uwocc+g@mail.gmail.com>
 <5ba95609-302b-456a-a863-2bd5df51baf2@redhat.com>
 <CAGsJ_4zSGT05GjxM1H6JwSa5MhgtxaiYVa1Wtvm8+SmYkm=jmQ@mail.gmail.com>
 <6179dd30-5351-4a79-b0d6-f0e85650a926@redhat.com>
 <CAGsJ_4yTH5ngM++e=c+P7g0fXs-QQsOk2oxd1RWa3Qww97Knrw@mail.gmail.com>
 <5db6fb4c-079d-4237-80b3-637565457f39@redhat.com>
 <42f1d84f-2d17-43b7-8fa2-83322fcca44f@linux.dev>
 <9bb1e917-891d-4e1b-915f-98cdd5fc578b@redhat.com>
 <CAGsJ_4woYd_TmZU94nedH=x_+HTwLxz94ih1jFmxoj4CxuhqzQ@mail.gmail.com>
 <42343413-7089-404e-8ce0-dd0025dca04c@linux.dev>
From: David Hildenbrand <david@redhat.com>
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <42343413-7089-404e-8ce0-dd0025dca04c@linux.dev>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: S_F4fsOQRM1yPti7DtJyp88a4ChY2Bh80pJih5I7Z3Q_1750925836
X-Mimecast-Originator: redhat.com
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250626_011719_831917_9DC00544 
X-CRM114-Status: GOOD (  11.25  )
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

T24gMjYuMDYuMjUgMDM6MTcsIExhbmNlIFlhbmcgd3JvdGU6Cj4gCj4gCj4gT24gMjAyNS82LzI2
IDA1OjAzLCBCYXJyeSBTb25nIHdyb3RlOgo+PiBPbiBUaHUsIEp1biAyNiwgMjAyNSBhdCAxMjoy
NeKAr0FNIERhdmlkIEhpbGRlbmJyYW5kIDxkYXZpZEByZWRoYXQuY29tPiB3cm90ZToKPj4+Cj4+
PiBPbiAyNS4wNi4yNSAxNDoyMCwgTGFuY2UgWWFuZyB3cm90ZToKPj4gWy4uLl0KPj4+PiBIbW0u
Li4gSSBoYXZlIGEgcXVlc3Rpb24gYWJvdXQgdGhlIHJlZmVyZW5jZSBjb3VudGluZyBoZXJlIC4u
Lgo+Pj4+Cj4+Pj4gICAgICAgICAgICAgICAgIGlmICh2bWEtPnZtX2ZsYWdzICYgVk1fTE9DS0VE
KQo+Pj4+ICAgICAgICAgICAgICAgICAgICAgICAgIG1sb2NrX2RyYWluX2xvY2FsKCk7Cj4+Pj4g
ICAgICAgICAgICAgICAgIGZvbGlvX3B1dChmb2xpbyk7Cj4+Pj4gICAgICAgICAgICAgICAgIC8q
IFdlIGhhdmUgYWxyZWFkeSBiYXRjaGVkIHRoZSBlbnRpcmUgZm9saW8gKi8KPj4+Pgo+Pj4+IERv
ZXMgYW55b25lIGVsc2Ugc3RpbGwgaG9sZCBhIHJlZmVyZW5jZSB0byB0aGlzIGZvbGlvIGFmdGVy
IGZvbGlvX3B1dCgpPwo+Pj4KPj4+IFRoZSBjYWxsZXIgb2YgdGhlIHVubWFwIG9wZXJhdGlvbiBz
aG91bGQgYmV0dGVyIGhvbGQgYSByZWZlcmVuY2UgOikKPj4+Cj4+PiBBbHNvLCBJIGFtIG5vdCBz
dXJlIHdoeSB3ZSBkb24ndCBwZXJmb3JtIGEKPj4+Cj4+PiBmb2xpb19wdXRfcmVmcyhmb2xpbywg
bnJfcGFnZXMpOwo+Pgo+PiBCZWNhdXNlIHdlJ3ZlIGFscmVhZHkgY2FsbGVkIGZvbGlvX3JlZl9z
dWIoZm9saW8sIG5yX3BhZ2VzIC0gMSk7Cj4+IExvb2tpbmcgYmFjaywgaXTigJlzIGtpbmQgb2Yg
dWdseSwgaHVoLgo+Pgo+PiBkaXNjYXJkOgo+PiAgICAgICAgICAgICAgICAgICBpZiAodW5saWtl
bHkoZm9saW9fdGVzdF9odWdldGxiKGZvbGlvKSkpIHsKPj4gICAgICAgICAgICAgICAgICAgICAg
ICAgICBodWdldGxiX3JlbW92ZV9ybWFwKGZvbGlvKTsKPj4gICAgICAgICAgICAgICAgICAgfSBl
bHNlIHsKPj4gICAgICAgICAgICAgICAgICAgICAgICAgICBmb2xpb19yZW1vdmVfcm1hcF9wdGVz
KGZvbGlvLCBzdWJwYWdlLCBucl9wYWdlcywgdm1hKTsKPj4gICAgICAgICAgICAgICAgICAgICAg
ICAgICBmb2xpb19yZWZfc3ViKGZvbGlvLCBucl9wYWdlcyAtIDEpOwo+PiAgICAgICAgICAgICAg
ICAgICB9Cj4+Cj4+IEkgYXNzdW1lIExhbmNlIHdpbGwgc2VuZCBhIHBhdGNoPyBJZiBzbywgcmVt
ZW1iZXIgdG8gcmVtb3ZlIHRoaXMKPj4gd2hlbiBzd2l0Y2hpbmcgdG8gZm9saW9fcHV0X3JlZnMo
Zm9saW8sIG5yX3BhZ2VzKTsKPiAKPiBBaCwgZ290IGl0LiBUaGFua3MgZm9yIHBvaW50aW5nIHRo
YXQgb3V0IQoKT2J2aW91c2x5IEkgd2FzIGhpbnRpbmcgdGhhdCB0aGUgc3BsaXQgcmVmY291bnQg
dXBkYXRlIGNhbiBiZSBtZXJnZWQgCmludG8gYSBzaW5nbGUgcmVmY291bnQgdXBkYXRlIDopCgot
LSAKQ2hlZXJzLAoKRGF2aWQgLyBkaGlsZGVuYgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNj
dkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4v
bGlzdGluZm8vbGludXgtcmlzY3YK
