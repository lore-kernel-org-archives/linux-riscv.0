Return-Path: <SRS0=pb0J=OH=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EF718C43441
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 28 Nov 2018 21:34:09 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BEAC520832
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 28 Nov 2018 21:34:09 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="sulby3qv";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AvwQPkc4"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BEAC520832
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jN+k7osnVZ7qFoUfKjfk4Q39/o9W/c5NGOPUTaEQ4QI=; b=sulby3qvW7jMbo
	ZAPFo3JzKzF/Ia+O2al1/uBgaQ51ypklcpbHU2whvayAFol8uavUesTHufy26KVnkO7eaFGGBXUs/
	48TzXsMZeLbuoV0XMynuag4LfcmoGxTjCSOXcjfeYKMp05PSvR/E874B5Qv1c8F1wbzyMd7ZK2SrI
	xCFOPtGTJOfv+/lNRgtm/ajhzQquss5wyI1hl8EITh2rwMDdopjqDTAdpihA2O+5WThB4gGGr3Rwh
	wjdYVC97ipRqU064jj6cdZigoMlqiaDLlP8JP+FqiWcQBZqo4tIDCIFZC8EvJ+naYkGHtmqytmDWx
	jLFDmMYU5BuqwotqdS1A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gS7TF-00032i-0G; Wed, 28 Nov 2018 21:34:09 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gS7TB-0002vA-6j
 for linux-riscv@lists.infradead.org; Wed, 28 Nov 2018 21:34:07 +0000
Received: by mail-wr1-x430.google.com with SMTP id q18so27800507wrx.9
 for <linux-riscv@lists.infradead.org>; Wed, 28 Nov 2018 13:33:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=0jua4ohHarymDilJvf+9N1OGOxVFDeJYtrC99WQES18=;
 b=AvwQPkc4n2QM4meiCabWuExt/hYJ7TCsp57ICtVn+846l5JySAWOXIroKL5PWlHy0W
 vDvHnfpprmUWv0wZX6wUJHNQHOUtuYrMMHm8Rea2IQNHuw1PXnjk8HmCO8ZZqVxjPowU
 R8NtJifa4G/GL4ekUgY0LEBo76GGNhQSsawNp5eipnzBpLGk8f6B1l/iN6zbr5hYYEWX
 B7zppXf7EupXGe9rMhzX/jgKy6zdxdq3AjSKmzWbAiUqktPp7DVOwlJR9wFevIP3ksy3
 7+xvw7cLYihVfzDXBZNNd4/xBYmnI5pRFIHmfnQceEWCZdj5zAnOMwaexh+nYXlHj/wS
 /PeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=0jua4ohHarymDilJvf+9N1OGOxVFDeJYtrC99WQES18=;
 b=K+dz6FzeanFOkYQPIGbzzk81XFAAhZZaxUmXjOCEFtKQUFK4yB6xYOie4bV/OBI1hy
 3JNirb3Z+T3P4JAp8DKjsI7o0i3gluTUXCkPnH3j1KTBZFWKRXbTLSFUQ9CFHojKSBqG
 WwHOLiYLqiPPJ6O3fvl8cBmicq4wzj0AxlgqLFCY8sZoCu4oGmfn/lsl5xlJrORskJiI
 AFnDdlPeRD3wTQCivj7hk+LCrRULhBJzO0sRgRlti4U2smJN/LiSlh9i4h0FvBtWpJtb
 Ndc30Qy8c90HuQrWjE+S9ebACzU+J5q4l8dXMl6TN1ZS5UPlbHPtZTAhsnzSkZ+TDmJ2
 4MnA==
X-Gm-Message-State: AA+aEWbIZLBbxmLSGFQGGc6QE5sOMoBnqWe7lNT3a9Gqe1BpqhKWUaIL
 GQ3VrcBIjJ1Jplkka2/WZr7bgwFw
X-Google-Smtp-Source: AFSGD/WyIpC55Vr3/r8htlnJsNa0LNnvvDM11OzmGiyIQ+nv6QyYuIEPTsg1bYAmLVmKscU5XAoLyQ==
X-Received: by 2002:a5d:4f10:: with SMTP id c16mr33567976wru.177.1543440833113; 
 Wed, 28 Nov 2018 13:33:53 -0800 (PST)
Received: from [10.0.2.15] ([192.19.228.250])
 by smtp.gmail.com with ESMTPSA id h62sm95924wmf.11.2018.11.28.13.33.50
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 28 Nov 2018 13:33:52 -0800 (PST)
Subject: Re: macb: probe of 10090000.ethernet failed with error -110
To: Atish Patra <atish.patra@wdc.com>, Andreas Schwab <schwab@suse.de>,
 Nicolas Ferre <nicolas.ferre@microchip.com>
References: <mvmefb5fr6d.fsf@suse.de>
 <f1e5d078-bc4d-910e-8717-f5870a0e994a@wdc.com>
From: Florian Fainelli <f.fainelli@gmail.com>
Message-ID: <2e17bba6-d932-37b2-5dca-0963fc50f5e6@gmail.com>
Date: Wed, 28 Nov 2018 13:33:47 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.2.1
MIME-Version: 1.0
In-Reply-To: <f1e5d078-bc4d-910e-8717-f5870a0e994a@wdc.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181128_133405_253287_D8D0AA41 
X-CRM114-Status: GOOD (  14.04  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
 hkallweit1@gmail.com,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Andrew Lunn <andrew@lunn.ch>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
Message-ID: <20181128213347.sGKs4heN655gXZpbr-yPAyxE2ICJAr_quJCIMztjXTo@z>

K0FuZHJldywgSGVpbmVyLAoKT24gMTEvMjgvMTggMTA6MTUgQU0sIEF0aXNoIFBhdHJhIHdyb3Rl
Ogo+IE9uIDExLzI4LzE4IDI6MTEgQU0sIEFuZHJlYXMgU2Nod2FiIHdyb3RlOgo+PiBUaGUgUEhZ
IHByb2Jpbmcgb2YgdGhlIG1hY2IgZHJpdmVyIGFwcGVhcnMgdG8gYmUgcmF0aGVyIHVucmVsaWFi
bGUuCj4+IE1vc3Qgb2YgdGhlIHRpbWUgaXQgZG9lc24ndCB3b3JrIHRoZSBmaXJzdCB0aW1lLCBJ
IGhhdmUgdG8gcmVsb2FkIHRoZQo+PiBtb2R1bGUgc2V2ZXJhbCB0aW1lcyB0byBsZXQgaXQgc3Vj
Y2VlZC4KPj4KPj4gW8KgwqAgNDAuNTMwMDAwXSBtYWNiOiBHRU0gZG9lc24ndCBzdXBwb3J0IGhh
cmR3YXJlIHB0cC4KPj4gW8KgwqAgNDAuNTMwMDAwXSBsaWJwaHk6IE1BQ0JfbWlpX2J1czogcHJv
YmVkCj4+IFvCoMKgIDQxLjQ1MDAwMF0gbWFjYiAxMDA5MDAwMC5ldGhlcm5ldCAodW5uYW1lZCBu
ZXRfZGV2aWNlKQo+PiAodW5pbml0aWFsaXplZCk6IENvdWxkIG5vdCBhdHRhY2ggdG8gUEhZCj4+
IFvCoMKgIDQxLjUxMDAwMF0gbWFjYjogcHJvYmUgb2YgMTAwOTAwMDAuZXRoZXJuZXQgZmFpbGVk
IHdpdGggZXJyb3IgLTExMAo+PiBbIDEzNTQuNDAwMDAwXSBtYWNiOiBHRU0gZG9lc24ndCBzdXBw
b3J0IGhhcmR3YXJlIHB0cC4KPj4gWyAxMzU0LjQxMDAwMF0gbGlicGh5OiBNQUNCX21paV9idXM6
IHByb2JlZAo+PiBbIDEzNTUuMjYwMDAwXSBtYWNiIDEwMDkwMDAwLmV0aGVybmV0ICh1bm5hbWVk
IG5ldF9kZXZpY2UpCj4+ICh1bmluaXRpYWxpemVkKTogQ291bGQgbm90IGF0dGFjaCB0byBQSFkK
Pj4gWyAxMzU1LjMwMDAwMF0gbWFjYjogcHJvYmUgb2YgMTAwOTAwMDAuZXRoZXJuZXQgZmFpbGVk
IHdpdGggZXJyb3IgLTExMAo+PiBbIDEzNTguMTAwMDAwXSBtYWNiOiBHRU0gZG9lc24ndCBzdXBw
b3J0IGhhcmR3YXJlIHB0cC4KPj4gWyAxMzU4LjExMDAwMF0gbGlicGh5OiBNQUNCX21paV9idXM6
IHByb2JlZAo+PiBbIDEzNTguMzEwMDAwXSBNaWNyb3NlbWkgVlNDODU0MSBTeW5jRSAxMDA5MDAw
MC5ldGhlcm5ldC1mZmZmZmZmZjowMDoKPj4gYXR0YWNoZWQgUEhZIGRyaXZlciBbTWljcm9zZW1p
IFZTQzg1NDEgU3luY0VdCj4+IChtaWlfYnVzOnBoeV9hZGRyPTEwMDkwMDAwLmV0aGVybmV0LWZm
ZmZmZmZmOjAwLCBpcnE9UE9MTCkKPj4gWyAxMzU4LjMyMDAwMF0gbWFjYiAxMDA5MDAwMC5ldGhl
cm5ldCBldGgwOiBDYWRlbmNlIEdFTSByZXYgMHgxMDA3MDEwOQo+PiBhdCAweDEwMDkwMDAwIGly
cSAxMiAoNzA6YjM6ZDU6OTI6ZjE6MDcpCj4+Cj4+IFRoaXMgaXMgNC4yMC1yYzQgb24gYSBIaUZp
dmUtVS4KPj4KPj4gQW5kcmVhcy4KPj4KPiAKPiBIZXJlIGlzIG15IHByZXZpb3VzIGFuYWx5c2lz
IG9uIHRoZSBpc3N1ZS4KPiBodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9waXBlcm1haWwvbGlu
dXgtcmlzY3YvMjAxOC1TZXB0ZW1iZXIvMDAxNTAzLmh0bWwKPiAKPiBOb3Qgc3VyZSBpZiB5b3Ug
aGF2ZSB0cmllZCB0aGUgaGFjayBhbHJlYWR5LiBCdXQgaGVyZSBpdCBpcyBhbnl3YXlzLgo+IGh0
dHBzOi8vZ2l0aHViLmNvbS9hdGlzaHAwNC9yaXNjdi1saW51eC9jb21taXQvYWEyMzBlN2RjMmFi
MDFkYjViNjMwZjQyN2U1NzI5N2ZmYzI1Yzg4NAoKQW5kcmV3IGFuZCBJIHdlcmUgZGlzY3Vzc2lu
ZyBhYm91dCB0aGlzIGFuZCB3ZSB3b3VsZCByZWNvbW1lbmQgdGhhdCB5b3UKbG9jYWxpemUgdGhl
IHdvcmthcm91bmQgd2l0aGluIHRoZSBWaXRlc3NlIFBIWSBkcml2ZXIgYW5kIHdpdGhpbiB0aGUK
ZHJpdmVyJ3MgcHJvYmUgZnVuY3Rpb24uIEluIG9yZGVyIHRvIGF2b2lkIGEgY2hpY2tlbiBhbmQg
ZWdnIHByb2JsZW0KdGhvdWdoLCB5b3UgbWlnaHQgaGF2ZSB0byBjaGFuZ2UgdGhlIFBIWSdzIGNv
bXBhdGlibGUgc3RyaW5nIGluIHRoZQpEZXZpY2UgVHJlZSB0byBpbmNsdWRlIGl0cyBQSFkgT1VJ
LCBlLmc6Cgpjb21wYXRpYmxlID0gImV0aGVybmV0LXBoeS0xMjM0LjU2NzgiIHdoaWNoIHdpbGwg
Zm9yY2UgdGhlIE9GIGxheWVyCnJlZ2lzdGVyaW5nIE1ESU8vUEhZIGRldmljZXMgdG8gcHJvYmUg
dG8gdGhlIHNwZWNpZmljIGRyaXZlciB0aGF0Cm1hdGNoZXMgdGhhdCBQSFkuIExldCB1cyBrbm93
IGlmIHRoaXMgZG9lcyBub3Qgd29yaywgaW4gd2hpY2ggY2FzZSB3ZQptaWdodCBoYXZlIHRvIGlu
dHJvZHVjZSBhbm90aGVyIERUIHByb3BlcnR5IHRoYXQgaW5kaWNhdGUgYSAiZG91YmxlCnJlc2V0
IiBpcyByZXF1aXJlZC4KLS0gCkZsb3JpYW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBs
aXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlz
dGluZm8vbGludXgtcmlzY3YK
