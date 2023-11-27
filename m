Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8AF4DC4167B
	for <linux-riscv@archiver.kernel.org>; Mon, 27 Nov 2023 10:37:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FPPQGqk9ggSgtJB6jug5WN+h/sN0iXI1Fv7QdQX4CjY=; b=DYggeezncaugNI
	ElbLaXsdoN0lxOip2CH9y3zfNlZWyUz2ao/3a+j95ZpLmE9RZ9wLldUIEmd4FCMuvRQ2B9CVj7m+p
	JoHclMor+C17wdbKUfgjdb9ZiV/Z2pq/zesnuhXQ4kCtTPhisSCOLzh7Wa7xt/0nZxjYwrtsxBVHX
	CqwMMpU4XcZi0frfUvO3Y3Dm5SIJNVNjbT5WsmERRAbNOtcQNCHTzEHEVPxAJis03KGKHL/T+61le
	C8qP2sjjmkabE9hlmTwEqzPS5wB2Kp/ZfkPuhOrwjmOXANWzYBnMRtFNoObuzF4b0b1uoF8kfDSZM
	u7/1zsCWcmAJBdC8zXjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r7Yzd-002742-1J;
	Mon, 27 Nov 2023 10:37:33 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r7Yzb-002739-0c
	for linux-riscv@lists.infradead.org;
	Mon, 27 Nov 2023 10:37:32 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-407acb21f27so3977615e9.0
        for <linux-riscv@lists.infradead.org>; Mon, 27 Nov 2023 02:37:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1701081449; x=1701686249; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=WwIyasNfIAcPjx/IdeRHiVql5CVlCc1OjrkJjoCKOOg=;
        b=pmsSHEsHtvMG94fOmJz/cPVk0Quchj171O2YvTX3a5ygtxBS/6OMKLkggydwzeW2+4
         91I9/XhK5zHYEI8pPeHG9Mf6afpQ6ryPwICV65PmYaAaqPydJRguzWMYSlRxAgMAVBQB
         hJXrEWSgGf0jcq+IyYs9vnYCSoWsBbL8hK3YilUbqt1N1GUBLYtXMHd8sFtVLytQoIeN
         PaGYvj/B5dxvEJI+R9+npWmE+tqC4wFk5PJfUlUmAR3f3pqHfw2NoHd9bCmiVTdUyMtz
         sfMFo35WrlyXmwTbzshwex9z+Lq2yBVN1Bp1nsFfW9DDHEOe34ahnEDDP27yzajies4p
         dBIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701081449; x=1701686249;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WwIyasNfIAcPjx/IdeRHiVql5CVlCc1OjrkJjoCKOOg=;
        b=tOrm6MAfpZCdTB6wxuJ40M9YH85t6p7rVrOBlUzNG1DA6MzHBfx8SsEorxhbopLs2+
         RUJJdoxcYRjYn6qTfbJvLF6iZxsP/kgk82xBR2BI5c4iqVN13dg+m19gc8FWI+IeYJ5z
         sZVEPWsERCyA5mL6ELSQwrVKMH6oDvUMTdXZ/GJ0ZfzrL4MElwD7xYlWVSUJV68gRrZk
         BBlkLTF5LWlON6mYj8wO/h8ro8nxFv2gLa5pmauY9UZod/ONt3kATLZoOZyFU2phLmCw
         TLz5rlxtbc83Tvv2UkrfmXJLYFXIJcWqcEXmqAa0emviakGZM6glrS7vNdLfutStCLHa
         vkjw==
X-Gm-Message-State: AOJu0YxMwP9z1Gx471n+/KQmZf5KIckhjDZ5uf5JPP6wGXyNAVMxgBMY
	KhfsCS0yljI809144QdQwUl/cg==
X-Google-Smtp-Source: AGHT+IEAEBm/57tYeRAJVKRhhb7Pa23fplEZDBTI7FQXChqci9y/hUk3AXOX7mcg7jjeCWpriCTIRw==
X-Received: by 2002:a05:600c:524d:b0:40b:46b5:4960 with SMTP id fc13-20020a05600c524d00b0040b46b54960mr1428453wmb.3.1701081449091;
        Mon, 27 Nov 2023 02:37:29 -0800 (PST)
Received: from ?IPV6:2a01:e0a:999:a3a0:1a67:8e18:5d34:ea1b? ([2a01:e0a:999:a3a0:1a67:8e18:5d34:ea1b])
        by smtp.gmail.com with ESMTPSA id jg28-20020a05600ca01c00b004063cd8105csm14071976wmb.22.2023.11.27.02.37.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Nov 2023 02:37:28 -0800 (PST)
Message-ID: <603c39d4-2764-4f85-b173-069ced2a3a13@rivosinc.com>
Date: Mon, 27 Nov 2023 11:37:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] riscv: fix incorrect use of __user pointer
Content-Language: en-US
To: David Laight <David.Laight@ACULAB.COM>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Cc: Christoph Hellwig <hch@infradead.org>,
 Ben Dooks <ben.dooks@codethink.co.uk>, kernel test robot <lkp@intel.com>
References: <20231124113803.165431-1-cleger@rivosinc.com>
 <bf7dfadfc8a94e3f810a8ba238f77543@AcuMS.aculab.com>
 <9cb1fadf-bb83-4e9f-9c29-bff53e30b0c6@rivosinc.com>
 <72fb7d8085a644e4a3e2e540a9ed6847@AcuMS.aculab.com>
From: =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>
In-Reply-To: <72fb7d8085a644e4a3e2e540a9ed6847@AcuMS.aculab.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231127_023731_225147_C1A893DB 
X-CRM114-Status: GOOD (  16.17  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

CgpPbiAyNy8xMS8yMDIzIDExOjM1LCBEYXZpZCBMYWlnaHQgd3JvdGU6Cj4gRnJvbTogQ2zDqW1l
bnQgTMOpZ2VyCj4+IFNlbnQ6IDI3IE5vdmVtYmVyIDIwMjMgMTA6MjQKPj4KPj4gT24gMjUvMTEv
MjAyMyAxNjozNywgRGF2aWQgTGFpZ2h0IHdyb3RlOgo+Pj4gLi4uCj4+Pj4gQEAgLTQ5MSw3ICs0
ODYsNyBAQCBpbnQgaGFuZGxlX21pc2FsaWduZWRfbG9hZChzdHJ1Y3QgcHRfcmVncyAqcmVncykK
Pj4+Pgo+Pj4+ICAJdmFsLmRhdGFfdTY0ID0gMDsKPj4+PiAgCWZvciAoaSA9IDA7IGkgPCBsZW47
IGkrKykgewo+Pj4+IC0JCWlmIChsb2FkX3U4KHJlZ3MsICh2b2lkICopKGFkZHIgKyBpKSwgJnZh
bC5kYXRhX2J5dGVzW2ldKSkKPj4+PiArCQlpZiAobG9hZF91OChyZWdzLCBhZGRyICsgaSwgJnZh
bC5kYXRhX2J5dGVzW2ldKSkKPj4+PiAgCQkJcmV0dXJuIC0xOwo+Pj4+ICAJfQo+Pj4KPj4+IEkn
ZCByZWFsbHkgaGF2ZSB0aG91Z2h0IHRoYXQgeW91J2Qgd2FudCB0byBwdWxsIHRoZSBrZXJuZWwv
dXNlcgo+Pj4gY2hlY2sgd2F5IG91dHNpZGUgdGhlIGxvb3A/Cj4+Cj4+IEhpIERhdmlkLAo+Pgo+
PiBJIGhvcGUgdGhlIGNvbXBpbGVyIGlzIGFibGUgdG8gZXh0cmFjdCB0aGF0ICdpZicgb3V0IG9m
IHRoZSBsb29wIHNpbmNlCj4+IHJlZ3MgaXNuJ3QgbW9kaWZpZWQgaW4gdGhlIGxvb3AuIE5ldmVy
dGhlbGVzcywgdGhhdCBjb3VsZCBiZSBtb3JlCj4+ICJjbGVhciIgaWYgcHV0IG91dHNpZGUgaW5k
ZWVkLgo+IAo+IElmIGhhcyBhY2Nlc3MgcmVncy0+eHh4IHRoZW4gdGhlIGNvbXBpbGVyIGNhbid0
IGRvIHNvIGJlY2F1c2UgaXQKPiB3aWxsIG11c3QgYXNzdW1lIHRoYXQgdGhlIGFzc2lnbm1lbnQg
bWlnaHQgYWxpYXMgaW50byAncmVncycuCj4gVGhhdCBpcyBldmVuIHRydWUgZm9yIGJ5dGUgd3Jp
dGVzIGlmICdzdHJpY3QtYWxpYXNpbmcnIGlzIGVuYWJsZWQKPiAtIHdoaWNoIGl0IGlzbid0IGZv
ciBsaW51eCBrZXJuZWwgYnVpbGRzLgo+IAo+IEl0IG1pZ2h0IGRvIHNvIGlmICdyZWdzJyB3ZXJl
ICdjb25zdCc7IGl0IHRlbmRzIHRvIGFzc3VtZSB0aGF0IGlmCj4gaXQgY2FuJ3QgY2hhbmdlICBz
b21ldGhpbmcgbm90aGluZyBjYW4gLSBhbHRob3VnaCB0aGF0IGlzbid0IHRydWUuCgpPaywgZ29v
ZCB0byBrbm93ICEgQXMgSSBzYWlkLCBJJ2xsIG1vZGlmeSB0aGF0IGluIGEgc3Vic2VxdWVudCBw
YXRjaC4KClRoYW5rcywKCkNsw6ltZW50Cgo+IAo+IAlEYXZpZAo+IAo+IC0KPiBSZWdpc3RlcmVk
IEFkZHJlc3MgTGFrZXNpZGUsIEJyYW1sZXkgUm9hZCwgTW91bnQgRmFybSwgTWlsdG9uIEtleW5l
cywgTUsxIDFQVCwgVUsKPiBSZWdpc3RyYXRpb24gTm86IDEzOTczODYgKFdhbGVzKQoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFp
bGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmlu
ZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
