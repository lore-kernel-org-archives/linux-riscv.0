Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00980C7EE31
	for <linux-riscv@archiver.kernel.org>; Fri, 27 Jun 2025 10:31:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XMOrD5blzClAVkgC972yuumb0EnZtb79LAlu2Te+0V8=; b=NNga+UljZkvh6G
	16VhXSBxSLdc1CDoihcj47J/xjTtw7dRu0wT1SbqeU7HA/Wwj/kIr1eCvMiB/rzz5QQBycw9/AOz0
	WoQvBgyOEgKivAvHPqEM785ETQl3L0DX9JlEPVCTfN9Ai39w+XYovjMxL99GEI89Jl7EcrIINm6zS
	aqwQ+C4640Jl36RpY2KYAkrfMPF171iWHANZZ8JkdiiP+UMzrJuKWNhgN6OsMXrk+sH2v41+bh1fh
	gqVqi169WAl8MPnM1zXIvcGJlstTquUH2L2kI9ZV8Lrce92+kRQnkK10VoZHvwfecurQnH3VYVn4L
	KqGUZ3wOGpVdIkoDUZyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uV6MO-0000000EHwA-1uoM;
	Fri, 27 Jun 2025 10:31:08 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uV65i-0000000EE0I-2EV4
	for linux-riscv@lists.infradead.org;
	Fri, 27 Jun 2025 10:13:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751019233;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=KZOtGlJHl7pysCsWvdDm+kjLTw4XFJasuxqQA3N5P+s=;
	b=Asff2ubKYQeLUjxUQeQWddG4hq+ZBzdbyfz3bKIAfL1nOS13PoJJXnTBQDC0/pl9+cQ8ih
	XeWtpFzGW6H+k7jDUjAhJYBXV0AOrm+eegDV60CAdWAmG/0yw6YFcRrytf1i8GLFVNFoSg
	jL64zqcTT7ZvMw0s+O6yFyKTzUs1x7A=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-631-Ae9qTUs6PC2-8qhfZJmKLA-1; Fri, 27 Jun 2025 06:13:52 -0400
X-MC-Unique: Ae9qTUs6PC2-8qhfZJmKLA-1
X-Mimecast-MFC-AGG-ID: Ae9qTUs6PC2-8qhfZJmKLA_1751019231
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-4535d300d2dso15864375e9.1
        for <linux-riscv@lists.infradead.org>; Fri, 27 Jun 2025 03:13:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751019231; x=1751624031;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=KZOtGlJHl7pysCsWvdDm+kjLTw4XFJasuxqQA3N5P+s=;
        b=JbbkCtnFkz9bJi7Nxp/dgsWSZ5P4CuJhkesVZDmVoF158XPMVYqeSb3sQ0QJzMjND1
         5PkegLNUCLysRLpuAcb/jYRyOD/5YbshCw8jcumnFklvbei8VqhNy2cFmI/yxkVzXSE3
         ARA91rqjkPyw+4e1UoRZdvf/nmKYFxRbI5VE/XzZn0gxfF2BSp95bW2D+HF+cpST7/Tx
         QZHClVzZyyQQBV0OIAsp7Q0FoJ0WDHmFisg2FdUDMge/vtclvJnMe2TFi+E57fWEJEDI
         9enc8a6g1IHJV2EiX0FzxY0e0ZhP+aZED6yzyhV21HigGI3KWh8xS3yb884bqu9pfT3y
         rF1w==
X-Forwarded-Encrypted: i=1; AJvYcCVnslNkIAy9hjnzbQHjoJ6IE79TVYc1XSYOvWOBDuQBw6dFPknTJDp6DeuePJz3TZ6SFQeec4pCV2U52g==@lists.infradead.org
X-Gm-Message-State: AOJu0Yy1M6q9mFoPm0aFkvoMkPQvyi/kHeHLl7skXHuJxS2KElC0y4jt
	OddRdwcZqblqASuGFjtqaUqq/8WutwnGPIL8sqEuFlsiQ6ZAHyKGxc8m1v1Ah7/YBlud/roKXTm
	R9MQAgzxqmvv7Y26qHHsBWSHLmHciPgUItYnLZtVHHuceGJzPRaOP3gaMyWGrcn0yRD8SHQ==
X-Gm-Gg: ASbGncscBrzSJFPnsfEowpKTib4+KV8QvU3vsGNebhytNulhrXDwTgM7r+SHfO1MwYH
	SqZoYnpG8cwA1p/yYqE2+tA26NI3ujSPuWOAwIYsNRZPf65yDdddhy5JbN7bzwvP9eDzILMeTH6
	PoaHUOLn/EQBgH3PyaBAG0dzuh/Ksz/kr6UWgkL3wjvqeozWSvXakf5Z+ue3R9PD5rnOVqhag21
	12g4uj+Ae9Pt19oxHvMpzvhx6HuuuqkAPNmddqnz6nHG3zy+pf/stVFwCDEoFQbp7Oqm7JfAOGQ
	nVrLYIllzXetGCB1YcjA85xijxZjxZ5C66PUwTLliDhSwnj/eXHyPSWvEoUqPURiRzz8LCvvPaD
	MmfcFCaWyuie7rDHglbLo78tZCyAGkxxoaqzFzDhbF1WUz7xR8Q==
X-Received: by 2002:a05:600c:8708:b0:44b:eb56:1d45 with SMTP id 5b1f17b1804b1-4538ee2e912mr29848315e9.15.1751019230712;
        Fri, 27 Jun 2025 03:13:50 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGoFr5pJO+kYCvYJKu8sYkytHU0j+qo27L0z7AMqLyXeJU0yjZd3M142HS3OwbrgII1pTrdBw==
X-Received: by 2002:a05:600c:8708:b0:44b:eb56:1d45 with SMTP id 5b1f17b1804b1-4538ee2e912mr29847855e9.15.1751019230246;
        Fri, 27 Jun 2025 03:13:50 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f2d:5d00:f1a3:2f30:6575:9425? (p200300d82f2d5d00f1a32f3065759425.dip0.t-ipconnect.de. [2003:d8:2f2d:5d00:f1a3:2f30:6575:9425])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a892e59659sm2258050f8f.77.2025.06.27.03.13.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Jun 2025 03:13:49 -0700 (PDT)
Message-ID: <609409c7-91a8-4898-ab29-fa00eb36df02@redhat.com>
Date: Fri, 27 Jun 2025 12:13:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/1] mm/rmap: fix potential out-of-bounds page table
 access during batched unmap
To: Barry Song <21cnbao@gmail.com>, Lance Yang <lance.yang@linux.dev>
Cc: akpm@linux-foundation.org, baolin.wang@linux.alibaba.com,
 chrisl@kernel.org, kasong@tencent.com, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 linux-riscv@lists.infradead.org, lorenzo.stoakes@oracle.com,
 ryan.roberts@arm.com, v-songbaohua@oppo.com, x86@kernel.org,
 huang.ying.caritas@gmail.com, zhengtangquan@oppo.com, riel@surriel.com,
 Liam.Howlett@oracle.com, vbabka@suse.cz, harry.yoo@oracle.com,
 mingzhe.yang@ly.com, stable@vger.kernel.org, Lance Yang <ioworker0@gmail.com>
References: <20250627062319.84936-1-lance.yang@linux.dev>
 <CAGsJ_4xQW3O=-VoC7aTCiwU4NZnK0tNsG1faAUgLvf4aZSm8Eg@mail.gmail.com>
 <CAGsJ_4z+DU-FhNk9vkS-epdxgUMjrCvh31ZBwoAs98uWnbTK-A@mail.gmail.com>
 <1d39b66e-4009-4143-a8fa-5d876bc1f7e7@linux.dev>
 <CAGsJ_4xX+kW1msaXpEPqX7aQ-GYG9QVMo+JYBc18BfLCs8eFyA@mail.gmail.com>
From: David Hildenbrand <david@redhat.com>
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <CAGsJ_4xX+kW1msaXpEPqX7aQ-GYG9QVMo+JYBc18BfLCs8eFyA@mail.gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 8h8jIx1zWevmUFo-HGIaCv21Y2ySAXgwUyKoYl5nvgA_1751019231
X-Mimecast-Originator: redhat.com
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250627_031354_639126_42C4274E 
X-CRM114-Status: GOOD (  19.41  )
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

T24gMjcuMDYuMjUgMDk6MzYsIEJhcnJ5IFNvbmcgd3JvdGU6Cj4gT24gRnJpLCBKdW4gMjcsIDIw
MjUgYXQgNzoxNeKAr1BNIExhbmNlIFlhbmcgPGxhbmNlLnlhbmdAbGludXguZGV2PiB3cm90ZToK
Pj4KPj4KPj4KPj4gT24gMjAyNS82LzI3IDE0OjU1LCBCYXJyeSBTb25nIHdyb3RlOgo+Pj4gT24g
RnJpLCBKdW4gMjcsIDIwMjUgYXQgNjo1MuKAr1BNIEJhcnJ5IFNvbmcgPDIxY25iYW9AZ21haWwu
Y29tPiB3cm90ZToKPj4+Pgo+Pj4+IE9uIEZyaSwgSnVuIDI3LCAyMDI1IGF0IDY6MjPigK9QTSBM
YW5jZSBZYW5nIDxpb3dvcmtlcjBAZ21haWwuY29tPiB3cm90ZToKPj4+Pj4KPj4+Pj4gRnJvbTog
TGFuY2UgWWFuZyA8bGFuY2UueWFuZ0BsaW51eC5kZXY+Cj4+Pj4+Cj4+Pj4+IEFzIHBvaW50ZWQg
b3V0IGJ5IERhdmlkWzFdLCB0aGUgYmF0Y2hlZCB1bm1hcCBsb2dpYyBpbiB0cnlfdG9fdW5tYXBf
b25lKCkKPj4+Pj4gY2FuIHJlYWQgcGFzdCB0aGUgZW5kIG9mIGEgUFRFIHRhYmxlIGlmIGEgbGFy
Z2UgZm9saW8gaXMgbWFwcGVkIHN0YXJ0aW5nIGF0Cj4+Pj4+IHRoZSBsYXN0IGVudHJ5IG9mIHRo
YXQgdGFibGUuIEl0IHdvdWxkIGJlIHF1aXRlIHJhcmUgaW4gcHJhY3RpY2UsIGFzCj4+Pj4+IE1B
RFZfRlJFRSB0eXBpY2FsbHkgc3BsaXRzIHRoZSBsYXJnZSBmb2xpbyA7KQo+Pj4+Pgo+Pj4+PiBT
byBsZXQncyBmaXggdGhlIHBvdGVudGlhbCBvdXQtb2YtYm91bmRzIHJlYWQgYnkgcmVmYWN0b3Jp
bmcgdGhlIGxvZ2ljIGludG8KPj4+Pj4gYSBuZXcgaGVscGVyLCBmb2xpb191bm1hcF9wdGVfYmF0
Y2goKS4KPj4+Pj4KPj4+Pj4gVGhlIG5ldyBoZWxwZXIgbm93IGNvcnJlY3RseSBjYWxjdWxhdGVz
IHRoZSBzYWZlIG51bWJlciBvZiBwYWdlcyB0byBzY2FuIGJ5Cj4+Pj4+IGxpbWl0aW5nIHRoZSBv
cGVyYXRpb24gdG8gdGhlIGJvdW5kYXJpZXMgb2YgdGhlIGN1cnJlbnQgVk1BIGFuZCB0aGUgUFRF
Cj4+Pj4+IHRhYmxlLgo+Pj4+Pgo+Pj4+PiBJbiBhZGRpdGlvbiwgdGhlICJhbGwtb3Itbm90aGlu
ZyIgYmF0Y2hpbmcgcmVzdHJpY3Rpb24gaXMgcmVtb3ZlZCB0bwo+Pj4+PiBzdXBwb3J0IHBhcnRp
YWwgYmF0Y2hlcy4gVGhlIHJlZmVyZW5jZSBjb3VudGluZyBpcyBhbHNvIGNsZWFuZWQgdXAgdG8g
dXNlCj4+Pj4+IGZvbGlvX3B1dF9yZWZzKCkuCj4+Pj4+Cj4+Pj4+IFsxXSBodHRwczovL2xvcmUu
a2VybmVsLm9yZy9saW51eC1tbS9hNjk0Mzk4Yy05ZjAzLTQ3MzctODFiOS03ZTQ5Yzg1N2ZjYmVA
cmVkaGF0LmNvbQo+Pj4+Pgo+Pj4+Cj4+Pj4gV2hhdCBhYm91dCA/Cj4+Pj4KPj4+PiBBcyBwb2lu
dGVkIG91dCBieSBEYXZpZFsxXSwgdGhlIGJhdGNoZWQgdW5tYXAgbG9naWMgaW4gdHJ5X3RvX3Vu
bWFwX29uZSgpCj4+Pj4gbWF5IHJlYWQgcGFzdCB0aGUgZW5kIG9mIGEgUFRFIHRhYmxlIHdoZW4g
YSBsYXJnZSBmb2xpbyBzcGFucyBhY3Jvc3MgdHdvIFBNRHMsCj4+Pj4gcGFydGljdWxhcmx5IGFm
dGVyIGJlaW5nIHJlbWFwcGVkIHdpdGggbXJlbWFwKCkuIFRoaXMgcGF0Y2ggZml4ZXMgdGhlCj4+
Pj4gcG90ZW50aWFsIG91dC1vZi1ib3VuZHMgYWNjZXNzIGJ5IGNhcHBpbmcgdGhlIGJhdGNoIGF0
IHZtX2VuZCBhbmQgdGhlIFBNRAo+Pj4+IGJvdW5kYXJ5Lgo+Pj4+Cj4+Pj4gSXQgYWxzbyByZWZh
Y3RvcnMgdGhlIGxvZ2ljIGludG8gYSBuZXcgaGVscGVyLCBmb2xpb191bm1hcF9wdGVfYmF0Y2go
KSwKPj4+PiB3aGljaCBzdXBwb3J0cyBiYXRjaGluZyBiZXR3ZWVuIDEgYW5kIGZvbGlvX25yX3Bh
Z2VzLiBUaGlzIGltcHJvdmVzIGNvZGUKPj4+PiBjbGFyaXR5LiBOb3RlIHRoYXQgc3VjaCBjYXNl
cyBhcmUgcmFyZSBpbiBwcmFjdGljZSwgYXMgTUFEVl9GUkVFIHR5cGljYWxseQo+Pj4+IHNwbGl0
cyBsYXJnZSBmb2xpb3MuCj4+Pgo+Pj4gU29ycnksIEkgbWVhbnQgdGhhdCBNQURWX0ZSRUUgdHlw
aWNhbGx5IHNwbGl0cyBsYXJnZSBmb2xpb3MgaWYgdGhlIHNwZWNpZmllZAo+Pj4gcmFuZ2UgZG9l
c24ndCBjb3ZlciB0aGUgZW50aXJlIGZvbGlvLgo+Pgo+PiBIbW0uLi4gSSBnb3QgaXQgd3Jvbmcg
YXMgd2VsbCA6KCBJdCdzIHRoZSBwYXJ0aWFsIGNvdmVyYWdlIHRoYXQgdHJpZ2dlcnMKPj4gdGhl
IHNwbGl0Lgo+Pgo+PiBob3cgYWJvdXQgdGhpcyByZXZpc2VkIHZlcnNpb246Cj4+Cj4+IEFzIHBv
aW50ZWQgb3V0IGJ5IERhdmlkWzFdLCB0aGUgYmF0Y2hlZCB1bm1hcCBsb2dpYyBpbiB0cnlfdG9f
dW5tYXBfb25lKCkKPj4gbWF5IHJlYWQgcGFzdCB0aGUgZW5kIG9mIGEgUFRFIHRhYmxlIHdoZW4g
YSBsYXJnZSBmb2xpbyBzcGFucyBhY3Jvc3MgdHdvCj4+IFBNRHMsIHBhcnRpY3VsYXJseSBhZnRl
ciBiZWluZyByZW1hcHBlZCB3aXRoIG1yZW1hcCgpLiBUaGlzIHBhdGNoIGZpeGVzCj4+IHRoZSBw
b3RlbnRpYWwgb3V0LW9mLWJvdW5kcyBhY2Nlc3MgYnkgY2FwcGluZyB0aGUgYmF0Y2ggYXQgdm1f
ZW5kIGFuZCB0aGUKPj4gUE1EIGJvdW5kYXJ5Lgo+Pgo+PiBJdCBhbHNvIHJlZmFjdG9ycyB0aGUg
bG9naWMgaW50byBhIG5ldyBoZWxwZXIsIGZvbGlvX3VubWFwX3B0ZV9iYXRjaCgpLAo+PiB3aGlj
aCBzdXBwb3J0cyBiYXRjaGluZyBiZXR3ZWVuIDEgYW5kIGZvbGlvX25yX3BhZ2VzLiBUaGlzIGlt
cHJvdmVzIGNvZGUKPj4gY2xhcml0eS4gTm90ZSB0aGF0IHN1Y2ggYm91bmRhcnktc3RyYWRkbGlu
ZyBjYXNlcyBhcmUgcmFyZSBpbiBwcmFjdGljZSwgYXMKPj4gTUFEVl9GUkVFIHdpbGwgdHlwaWNh
bGx5IHNwbGl0IGEgbGFyZ2UgZm9saW8gaWYgdGhlIGFkdmljZSByYW5nZSBkb2VzIG5vdAo+PiBj
b3ZlciB0aGUgZW50aXJlIGZvbGlvLgo+IAo+IEkgYXNzdW1lIHRoZSBvdXQtb2YtYm91bmRzIGFj
Y2VzcyBtdXN0IGJlIGZpeGVkLCBldmVuIHRob3VnaCBpdCBpcyB2ZXJ5Cj4gdW5saWtlbHkuIEl0
IG1pZ2h0IG9jY3VyIGFmdGVyIGEgbGFyZ2UgZm9saW8gaXMgbWFya2VkIHdpdGggTUFEVl9GUkVF
IGFuZAo+IHRoZW4gcmVtYXBwZWQgdG8gYW4gdW5hbGlnbmVkIGFkZHJlc3MsIHBvdGVudGlhbGx5
IGNyb3NzaW5nIHR3byBQVEUgdGFibGVzLgoKUmlnaHQuIElmIGl0IGNhbiBiZSB0cmlnZ2VyZWQg
ZnJvbSB1c2Vyc3BhY2UsIGl0IGRvZXNuJ3QgbWF0dGVyIGhvdyAKbGlrZWx5L2NvbW1vbi93aGF0
ZXZlciBpdCBpcy4gSXQgbXVzdCBiZSBmaXhlZC4KCj4gCj4gQSBiYXRjaCBzaXplIGJldHdlZW4g
MiBhbmQgbnJfcGFnZXMgLSAxIGlzIHByYWN0aWNhbGx5IHJhcmUsIGFzIHdlIHR5cGljYWxseQo+
IHNwbGl0IGxhcmdlIGZvbGlvcyB3aGVuIE1BRFZfRlJFRSBkb2VzIG5vdCBjb3ZlciB0aGUgZW50
aXJlIGZvbGlvIHJhbmdlLgo+IENhc2VzIHdoZXJlIGEgYmF0Y2ggb2Ygc2l6ZSAyIG9yIG5yX3Bh
Z2VzIC0gMSBvY2N1cnMgbWF5IG9ubHkgaGFwcGVuIGlmIGEKPiBsYXJnZSBmb2xpbyBpcyBwYXJ0
aWFsbHkgdW5tYXBwZWQgYWZ0ZXIgYmVpbmcgbWFya2VkIE1BRFZfRlJFRSwgd2hpY2ggaXMKPiBx
dWl0ZSBhbiB1bnVzdWFsIHBhdHRlcm4gaW4gdXNlcnNwYWNlLgoKSSB0aGluayB0aGUgcG9pbnQg
aXMgcmF0aGVyICJTaW1wbGlmeSB0aGUgY29kZSBieSBub3Qgc3BlY2lhbC1jYXNpbmcgZm9yIApj
b21wbGV0ZWx5IG1hcHBlZCBmb2xpb3MsIHRoZXJlIGlzIG5vIHJlYWwgcmVhc29uIHdoeSB3ZSBj
YW5ub3QgYmF0Y2ggCnJhbmdlcyB0aGF0IGRvbid0IGNvdmVyIHRoZSBjb21wbGV0ZSBmb2xpby4i
LgoKLS0gCkNoZWVycywKCkRhdmlkIC8gZGhpbGRlbmIKCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgt
cmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
