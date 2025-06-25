Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DC28C7EE2A
	for <linux-riscv@archiver.kernel.org>; Wed, 25 Jun 2025 16:12:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pK16iYvACOTJoiu8garJQH2l8XLNlK0o7kRPXT5v4O0=; b=U5xrgzxdZtN6ZO
	uYsnOuFSIirM7F9biOumkKJCqD4e9fiWBRbG2BuE7TLtFO0B7rz2DQGBOHaj1AXvWdDZuZ5cNLW8Q
	snt1hIAKpoP1F5uh7rnR2JKlXVBU5b++iNbEsaJ7ax75GktB+oDithkxx0CZKEYOM9xLOgFRmZkRc
	fJY4iXYhbWfZhlibBecE+6pOCuR+km5ChcaBqgQisvjQjpupJTwMzPePGbxrGUDI6EuNpyvE5nMvo
	ZDF8ObdxdG3ZvAxfHOLSQ2vXIQaX27CP/i5fbU3I5NE+Mmke7R3jw4nygruUo/lHljzrFV6utQFgU
	D3fTjHP5fm2HR37MJG1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUSjs-00000009EmV-36hN;
	Wed, 25 Jun 2025 16:12:44 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUOHn-00000008TCZ-3FyM
	for linux-riscv@bombadil.infradead.org;
	Wed, 25 Jun 2025 11:27:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=2cLBLs61fmVkpMJh9Lz8gzYvn7EwqgxCk09zQo5cN1k=; b=LLSAUKNBZCR/YWeU4BT9MKtQMw
	s5aWG6zrksNKicCtKEpXStjdXmoqkSR46RXHXzd6i0QBzrmNh03eHUDv2IrsyvIQDt+SIvH8tkdyz
	KQVy3nHGMdBVuVcQpeWYDpJsHvfWtpMeci3I0mO9MzBkqmcbelU1n69PxTLj9GlXgUe7kuCz5HPD/
	bNQIG+ypkvSlu9qZj+bV3tF3bQ7LM6youiqq0gYcKNfLetCgMTcj1T8XVYAquVy3y9SSHQDbcdzH6
	Z7C2nygvlUhFsP3sIha0b1FToqd+td4Ndo4WGFgS/PcXtH0IOKnnnwx8cUKnJeeVUfm/EjinA4gC5
	2lHPVV8Q==;
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUOHl-00000005pDu-07v8
	for linux-riscv@lists.infradead.org;
	Wed, 25 Jun 2025 11:27:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1750850842;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=2cLBLs61fmVkpMJh9Lz8gzYvn7EwqgxCk09zQo5cN1k=;
	b=CdYzh6fpJHe9Ogzfbbkd8snGjoKEEX9IRWpqL4hJ/hiYwF0DqqrMSfUWqHlX7Ry9qlI7IZ
	KtfRQDAxxzgdIwAJTr5FJn4PW0EPpnn+JPhWqbWJPf8ZqF9zsgv9T3Wy433vpmABVyf71c
	UCql3L/SnNZwSVy734nke/KWGn48xKo=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1750850843;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=2cLBLs61fmVkpMJh9Lz8gzYvn7EwqgxCk09zQo5cN1k=;
	b=OVB+MCDWyDmW9RVe+JtZLWgCWp482kO3D+jdWKgAHLyf1ejNNpe6prnG/10uvfCDcQb5k+
	pcEN7F6jb7j+9ETBeWcvMz9WKpbLtA8lng5xjCEz1lhtqBLyZiFse6+ZDDwegZdbU5d1yR
	7BEfKHbvmj+5rS1gv8TGZ0P+8x7gG3E=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-663-wJ2ms6agOka3AnvIAqKs0g-1; Wed, 25 Jun 2025 07:27:21 -0400
X-MC-Unique: wJ2ms6agOka3AnvIAqKs0g-1
X-Mimecast-MFC-AGG-ID: wJ2ms6agOka3AnvIAqKs0g_1750850840
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-450d6768d4dso41464365e9.2
        for <linux-riscv@lists.infradead.org>; Wed, 25 Jun 2025 04:27:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750850840; x=1751455640;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=2cLBLs61fmVkpMJh9Lz8gzYvn7EwqgxCk09zQo5cN1k=;
        b=II2i41EbXm8FQZeVhxD22qS4KPOr5Kop9bLbXsna56CEZq8gbZLu5OxNrFGMUzwf1n
         loHMxqJ0KswGowtMlxdR4qMJmF68tmQfozfYzvE4nXeRFtRMSJBDvYghi5auXjg04VPf
         NQWFN9pbK3P1UyAlhOGX+FvPWpRySojDBhHOJzHelNAcbdxj6nQjbeJi34eaRKEf41/w
         phbIuCnTwFdPnWNW38GtznnnuSshAOz19aUBAG8UGee/gxmbZWR5n1if+l/FP7UzqP7b
         WtWZzPNKXqOH4vTUfnaOF81uMdmFN5pY/R9gzSqegFR5KJ9dllzq9VvMMbG+VvEXgn9t
         4qDg==
X-Forwarded-Encrypted: i=1; AJvYcCWnW154WbFzPs+vzFVxTqhX3KjUu3B73qZPNgnjYFokRSVrSk3uUvGfuuq0hqoKXj6MV/8wCxhy9L6T3Q==@lists.infradead.org
X-Gm-Message-State: AOJu0Yyts0iUnLOT0FIAUVRblywLKPUnnIoroe0ZOP4F4rco7vLfnyV8
	m9YDEWK6hpZDVYvf3SpsrphckuddbMlJKUTgsFN/aVZZAY/PUDBMZYVc0cUqZe84vmY6g3+VwgU
	sXt8YXw56qHA2qf+dgnry9152PgZXMj3ZSpXvkFzldlHpxO2oHai3vC7B3Gfa70TOlN9Ttg==
X-Gm-Gg: ASbGnctknF4GCpqNGToJVo5PgVat56u+7SnK+XkshCvmFlvtzvHeVDLZDYeg+XTjMtr
	+uCQmCLsMkImK9kTLiAt4xNlPgmTn0JTmLNshqsf3TdsjOEHx8h36AiylaBV04/T7aZdrnodEP4
	Ev3u8k4JphFm2eURTuPz17u7Yksyg4Y+KWdmDi9RN9CaR0TR6S7iXiolHXTMytyFZyHEB42Sl+5
	8OZqgLFxDVrphfAmmjJodpKBBmc/LDi97QgfDp3yUwfKAAB+Zefs+DTOLE0K+Fla94F/xLAv6us
	4A97W3wjCCm89chJwnYA/2/uNboRtKYeQylk3ilDstLNqFpZLJgFjgGwcZWUXJcHPY/KV2zmCqa
	scTg4dWqf5eU+EmiAnHpa9lHcKiolqWmUlpCy0/JpwIzq
X-Received: by 2002:a05:600c:3b22:b0:442:d9fb:d9f1 with SMTP id 5b1f17b1804b1-45381aaf875mr25988615e9.4.1750850840369;
        Wed, 25 Jun 2025 04:27:20 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEoZiTBEcCkWCjyMQABswYmQ/cZK3GG5K1vJNhxZ1zZMmUbm+2zizv6I23kRwoq2jAaGsbxuQ==
X-Received: by 2002:a05:600c:3b22:b0:442:d9fb:d9f1 with SMTP id 5b1f17b1804b1-45381aaf875mr25988305e9.4.1750850839985;
        Wed, 25 Jun 2025 04:27:19 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f12:1b00:5d6b:db26:e2b7:12? (p200300d82f121b005d6bdb26e2b70012.dip0.t-ipconnect.de. [2003:d8:2f12:1b00:5d6b:db26:e2b7:12])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45382349758sm17255505e9.9.2025.06.25.04.27.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Jun 2025 04:27:19 -0700 (PDT)
Message-ID: <6179dd30-5351-4a79-b0d6-f0e85650a926@redhat.com>
Date: Wed, 25 Jun 2025 13:27:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/4] mm: Support batched unmap for lazyfree large
 folios during reclamation
To: Barry Song <21cnbao@gmail.com>
Cc: Lance Yang <lance.yang@linux.dev>, akpm@linux-foundation.org,
 baolin.wang@linux.alibaba.com, chrisl@kernel.org, kasong@tencent.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, linux-riscv@lists.infradead.org,
 lorenzo.stoakes@oracle.com, ryan.roberts@arm.com, v-songbaohua@oppo.com,
 x86@kernel.org, ying.huang@intel.com, zhengtangquan@oppo.com,
 Lance Yang <ioworker0@gmail.com>
References: <2c19a6cf-0b42-477b-a672-ed8c1edd4267@redhat.com>
 <20250624162503.78957-1-ioworker0@gmail.com>
 <27d174e0-c209-4851-825a-0baeb56df86f@redhat.com>
 <938c4726-b93e-46df-bceb-65c7574714a6@linux.dev>
 <CAGsJ_4y1GObH-C7R=FQL=UWe3kF6qhKoRqPxNPYx0k7uwocc+g@mail.gmail.com>
 <5ba95609-302b-456a-a863-2bd5df51baf2@redhat.com>
 <CAGsJ_4zSGT05GjxM1H6JwSa5MhgtxaiYVa1Wtvm8+SmYkm=jmQ@mail.gmail.com>
From: David Hildenbrand <david@redhat.com>
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <CAGsJ_4zSGT05GjxM1H6JwSa5MhgtxaiYVa1Wtvm8+SmYkm=jmQ@mail.gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: kgvN067o8ZHa_AXkykpTuFV93MHr8iIzy_m6wz9kyBg_1750850840
X-Mimecast-Originator: redhat.com
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250625_122725_268006_60AF6C22 
X-CRM114-Status: GOOD (  17.79  )
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

T24gMjUuMDYuMjUgMTM6MTUsIEJhcnJ5IFNvbmcgd3JvdGU6Cj4gT24gV2VkLCBKdW4gMjUsIDIw
MjUgYXQgMTE6MDHigK9QTSBEYXZpZCBIaWxkZW5icmFuZCA8ZGF2aWRAcmVkaGF0LmNvbT4gd3Jv
dGU6Cj4+Cj4+IE9uIDI1LjA2LjI1IDEyOjU3LCBCYXJyeSBTb25nIHdyb3RlOgo+Pj4+Pgo+Pj4+
PiBOb3RlIHRoYXQgSSBkb24ndCBxdWl0ZSB1bmRlcnN0YW5kIHdoeSB3ZSBoYXZlIHRvIGJhdGNo
IHRoZSB3aG9sZSB0aGluZwo+Pj4+PiBvciBmYWxsYmFjayB0bwo+Pj4+PiBpbmRpdmlkdWFsIHBh
Z2VzLiBXaHkgY2FuJ3Qgd2UgcGVyZm9ybSBvdGhlciBiYXRjaGVzIHRoYXQgc3BhbiBvbmx5IHNv
bWUKPj4+Pj4gUFRFcz8gV2hhdCdzIHNwZWNpYWwKPj4+Pj4gYWJvdXQgMSBQVEUgdnMuIDIgUFRF
cyB2cy4gYWxsIFBURXM/Cj4+Pj4KPj4+PiBUaGF0J3MgYSBnb29kIHBvaW50IGFib3V0IHRoZSAi
YWxsLW9yLW5vdGhpbmciIGJhdGNoaW5nIGxvZ2ljIDspCj4+Pj4KPj4+PiBJdCBzZWVtcyB0aGUg
ImFsbC1vci1ub3RoaW5nIiBhcHByb2FjaCBpcyBzcGVjaWZpYyB0byB0aGUgbGF6eWZyZWUgdXNl
Cj4+Pj4gY2FzZSwgd2hpY2ggbmVlZHMgdG8gdW5tYXAgdGhlIGVudGlyZSBmb2xpbyBmb3IgcmVj
bGFtYXRpb24uIElmIHRoYXQncwo+Pj4+IG5vdCBwb3NzaWJsZSwgaXQgZmFsbHMgYmFjayB0byB0
aGUgc2luZ2xlLXBhZ2Ugc2xvdyBwYXRoLgo+Pj4KPj4+IE90aGVyIGNhc2VzIGFkdmFuY2UgdGhl
IFBURSB0aGVtc2VsdmVzLCB3aGlsZSB0cnlfdG9fdW5tYXBfb25lKCkgcmVsaWVzCj4+PiBvbiBw
YWdlX3ZtYV9tYXBwZWRfd2FsaygpIHRvIGFkdmFuY2UgdGhlIFBURS4gVW5sZXNzIHdlIHdhbnQg
dG8gbWFudWFsbHkKPj4+IG1vZGlmeSBwdm13LnB0ZSBhbmQgcHZtdy5hZGRyZXNzIG91dHNpZGUg
b2YgcGFnZV92bWFfbWFwcGVkX3dhbGsoKSwgd2hpY2gKPj4+IHRvIG1lIHNlZW1zIGxpa2UgYSB2
aW9sYXRpb24gb2YgbGF5ZXJzLiA6LSkKPj4KPj4gUGxlYXNlIGV4cGxhaW4gdG8gbWUgd2h5IHRo
ZSBmb2xsb3dpbmcgaXMgbm90IGNsZWFyZXIgYW5kIGJldHRlcjoKPiAKPiBUaGlzIHBhcnQgaXMg
bXVjaCBjbGVhcmVyLCBidXQgdGhhdCBkb2VzbuKAmXQgbmVjZXNzYXJpbHkgaW1wcm92ZSB0aGUg
b3ZlcmFsbAo+IHBpY3R1cmUuIFRoZSBtYWluIGNoYWxsZW5nZSBpcyBob3cgdG8gZXhpdCB0aGUg
aXRlcmF0aW9uIG9mCj4gd2hpbGUgKHBhZ2Vfdm1hX21hcHBlZF93YWxrKCZwdm13KSkuCgpPa2F5
LCBJIGdldCB3aGF0IHlvdSBtZWFuIG5vdy4KCj4gCj4gUmlnaHQgbm93LCB3ZSBoYXZlIGl0IGxh
aWQgb3V0IHF1aXRlIHN0cmFpZ2h0Zm9yd2FyZGx5Ogo+ICAgICAgICAgICAgICAgICAgLyogV2Ug
aGF2ZSBhbHJlYWR5IGJhdGNoZWQgdGhlIGVudGlyZSBmb2xpbyAqLwo+ICAgICAgICAgICAgICAg
ICAgaWYgKG5yX3BhZ2VzID4gMSkKPiAgICAgICAgICAgICAgICAgICAgICAgICAgZ290byB3YWxr
X2RvbmU7CgoKR2l2ZW4gdGhhdCB0aGUgY29tbWVudCBpcyBjb21wbGV0ZWx5IGNvbmZ1c2luZyB3
aGVucyBzZWVpbmcgdGhlIGNoZWNrIC4uLiA6KQoKLyoKICAqIElmIHdlIGFyZSBzdXJlIHRoYXQg
d2UgYmF0Y2hlZCB0aGUgZW50aXJlIGZvbGlvIGFuZCBjbGVhcmVkIGFsbCBQVEVzLAogICogd2Ug
Y2FuIGp1c3Qgb3B0aW1pemUgYW5kIHN0b3AgcmlnaHQgaGVyZS4KICAqLwppZiAobnJfcGFnZXMg
PT0gZm9saW9fbnJfcGFnZXMoZm9saW8pKQoJZ290byB3YWxrX2RvbmU7Cgp3b3VsZCBtYWtlIHRo
ZSBjb21tZW50IG1hdGNoLgoKPiAKPiB3aXRoIGFueSBuciBiZXR3ZWVuIDEgYW5kIGZvbGlvX25y
X3BhZ2VzKCksIHdlIGhhdmUgdG8gY29uc2lkZXIgdHdvIGlzc3VlczoKPiAxLiBIb3cgdG8gc2tp
cCBQVEUgY2hlY2tzIGluc2lkZSBwYWdlX3ZtYV9tYXBwZWRfd2FsayBmb3IgZW50cmllcyB0aGF0
Cj4gd2VyZSBhbHJlYWR5IGhhbmRsZWQgaW4gdGhlIHByZXZpb3VzIGJhdGNoOwoKVGhleSBhcmUg
Y2xlYXJlZCBpZiB3ZSByZWFjaCB0aGF0IHBvaW50LiBTbyB0aGUgcHRlX25vbmUoKSBjaGVja3Mg
d2lsbCAKc2ltcGx5IHNraXAgdGhlbT8KCj4gMi4gSG93IHRvIGJyZWFrIHRoZSBpdGVyYXRpb24g
d2hlbiB0aGlzIGJhdGNoIGhhcyBhcnJpdmVkIGF0IHRoZSBlbmQuCgpwYWdlX3ZtYV9tYXBwZWRf
d2FsaygpIHNob3VsZCBiZSBkb2luZyB0aGF0PwoKLS0gCkNoZWVycywKCkRhdmlkIC8gZGhpbGRl
bmIKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51
eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRw
Oi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
