Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09C62C71136
	for <linux-riscv@archiver.kernel.org>; Tue, 17 Jun 2025 09:49:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Qi2WfF3r3exe0agnx/yGbsxicq9GhwClw4ZHB0u0AuA=; b=tiMDI+u+cf96MU
	a/lX3hwiZyp6VV1kQA+hIpLNZfSyesjaRrrTg0vzJjCZ6udMwWCwOlf8AeF29WrILLwCuMqBO7pFl
	ZCi0jjtnsS2BKZ5VA9Y22S9kawM3WOeIEKihPOiEaL6cMOo1+vZMEEDQhUy7xirRdX4jeUk2tDpZd
	CK+MWZcG9YtfzgqQXcBSe0t47HJ4dG94I5JycvunYxkjPfHUSUFC4lpB8QmGDyGS2ouGKorxUr70m
	arJMDuQSuugwkPghML2aZyJ2cMbgLIOZ9beSA760yaiBRn2hW4LL4+wfFjJafv5T7gh0Jd18EGtea
	BLpmpeW/mh9QAMPsC5pQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRSwu-00000006oq8-19Xr;
	Tue, 17 Jun 2025 09:49:48 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRSjZ-00000006mCK-0JsR
	for linux-riscv@lists.infradead.org;
	Tue, 17 Jun 2025 09:36:01 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 3B077629F6;
	Tue, 17 Jun 2025 09:35:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 75F0BC4CEE3;
	Tue, 17 Jun 2025 09:35:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750152958;
	bh=5+Hk/dvoHi+dJCSxoObqNt9FLvtu4FJvjhKLYDy0rD0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=UrdK4TNZQwO5Nf4sfMJcuj3gpzDoZDnQU1rj9mmAnbW8syqpKIzvTT58TIPG5Nzuq
	 dqOeeXK1RqlLY3MtS/hVlxOlh8UCuLZhZcEpTwlli+fVOTmHOaSpb06bFtYWQE01c7
	 auv8gQNyUk8UBh8AbZKO4mgTIxCUph2fT1M66/jRtmX5tGF7mv0dEkrkGjoXcyW0Bh
	 vyuDr87jWUgSan9Y5CXGkdNSiIJtPkVf7EisPgy5bz5B31vK0OPsXmvbkqLMeRS1mH
	 51dhPi4VysJsa+k5QSvjy5CJbBmFIg4ycaVRqK0WdlxONwZ+WqQ5UjOYP9pDIhdztS
	 he/U6m1DgFSyA==
Message-ID: <2dc8ab35-4f58-49d3-8e8b-3e463fa592ae@kernel.org>
Date: Tue, 17 Jun 2025 11:35:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC] riscv: dts: spacemit: Add DMA translation buses for
 K1
To: Vivian Wang <wangruikang@iscas.ac.cn>, Yixun Lan <dlan@gentoo.org>,
 Guodong Xu <guodong@riscstar.com>, Ze Huang <huangze@whut.edu.cn>,
 spacemit@lists.linux.dev
Cc: Vivian Wang <uwu@dram.page>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>, devicetree@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20250617-k1-dma-buses-rfc-wip-v1-1-c8ec192fbf58@iscas.ac.cn>
 <74e3c488-4457-4026-9597-806b98fd4e11@kernel.org>
 <10ab212f-e06b-4214-99cd-a687659fcf71@iscas.ac.cn>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 a/A=
In-Reply-To: <10ab212f-e06b-4214-99cd-a687659fcf71@iscas.ac.cn>
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

T24gMTcvMDYvMjAyNSAxMDo0OCwgVml2aWFuIFdhbmcgd3JvdGU6Cj4gSGkgS3J6eXN6dG9mLAo+
IAo+IE9uIDYvMTcvMjUgMTQ6MjEsIEtyenlzenRvZiBLb3psb3dza2kgd3JvdGU6Cj4+IE9uIDE3
LzA2LzIwMjUgMDc6MjEsIFZpdmlhbiBXYW5nIHdyb3RlOgo+Pj4gVGhlIFNwYWNlbWlUIEsxIGhh
cyB2YXJpb3VzIHN0YXRpYyB0cmFuc2xhdGlvbnMgb2YgRE1BIGFjY2Vzc2VzLiBBZGQKPj4+IHRo
ZXNlIGFzIHNpbXBsZS1idXMgbm9kZXMuIERldmljZXMgYWN0dWFsbHkgdXNpbmcgdGhlc2UgdHJh
bnNsYXRpb24gd2lsbAo+Pj4gYmUgYWRkZWQgaW4gbGF0ZXIgcGF0Y2hlcy4KPj4+Cj4+PiBUaGUg
YnVzIG5hbWVzIGFyZSBhc3NpZ25lZCBhY2NvcmRpbmcgdG8gY29uc2Vuc3VzIHdpdGggU3BhY2Vt
aVQgWzFdLgo+Pgo+PiBSZWFkIHRoZSBmZWVkYmFjayB0aGVyZToKPj4KPj4gIlNvLCBhcyB5b3Ug
YXJlIHN1Ym1pdHRpbmcgdGhlIGZpcnN0IG5vZGUocykgdW5kZXIgbmV0d29ya19idXM6IGJ1c0A1
LCB5b3UKPj4gc2hvdWxkIGhhdmUgdGhpcyBhZGRlZCBpbnRvIHlvdXIgcGF0Y2hzZXQsIGluc3Rl
YWQgb2Ygc2VuZGluZyBvdXQgd2l0aAo+PiBub25lLiIKPiBBcyBtZW50aW9uZWQgaW4gdGhlIHBh
dGNoIGV4dHJhIG1lc3NhZ2UsIHRoaXMgaXMgYW4gUkZDIG1lYW50IGZvcgo+IGFjaGlldmluZyBj
b25zZW5zdXMgb24gd2hhdCB0aGUgYnVzIG5vZGVzIHNob3VsZCBsb29rIGxpa2UsIG5vdCBhbgo+
IGFjdHVhbCBwYXRjaCBtZWFudCB0byBiZSB0YWtlbi4gSSB3YXMgaG9waW5nIEkgd2FzIGNsZWFy
IG9uIHRoYXQsIGJ1dCBJCj4gZ3Vlc3MgdGhhdCBwYXJhZ3JhcGggd2FzIGJ1cmllZCB0b28gZGVl
cC4gV2VsbC4uLgo+PiBQbHVzIHNpbXBsZSBidXMgd2l0aGluIE1NSU8gbm9kZSBuZWVkcyB1bml0
IGFkZHJlc3MuIElPVywgZG9uJ3QgbWl4IE1NSU8KPj4gd2l0aCBub24tTU1JTy4gSSBhbHNvIHN1
c3BlY3QgdGhpcyBkb2VzIG5vdCBwYXNzIGNoZWNrcywgc28gdGhlIHRvb2xzCj4+IGNhbiBkbyBv
dXIgcmV2aWV3Li4uCj4gCj4gVGhpcyBEVCBwYXNzZXMgIm1ha2UgZHRic19jaGVjayIgZmluZSwg
d2l0aCBvbmx5IHVucmVsYXRlZCB3YXJuaW5ncyBvbgo+IHNlY191YXJ0MSB0aGF0IHdhcyBhbHJl
YWR5IHRoZXJlIGJlZm9yZToKPiAKPiDCoCBEVEMgW0NdIGFyY2gvcmlzY3YvYm9vdC9kdHMvc3Bh
Y2VtaXQvazEtYmFuYW5hcGktZjMuZHRiCj4gLi4uL2FyY2gvcmlzY3YvYm9vdC9kdHMvc3BhY2Vt
aXQvazEtYmFuYW5hcGktZjMuZHRiOiBzZXJpYWxAZjA2MTIwMDAKPiAoc3BhY2VtaXQsazEtdWFy
dCk6ICdjbG9jay1uYW1lcycgaXMgYSByZXF1aXJlZCBwcm9wZXJ0eQo+IMKgwqDCoMKgwqDCoMKg
IGZyb20gc2NoZW1hICRpZDogaHR0cDovL2RldmljZXRyZWUub3JnL3NjaGVtYXMvc2VyaWFsLzgy
NTAueWFtbCMKPiDCoCBEVEMgW0NdIGFyY2gvcmlzY3YvYm9vdC9kdHMvc3BhY2VtaXQvazEtbWls
a3YtanVwaXRlci5kdGIKPiAuLi4vYXJjaC9yaXNjdi9ib290L2R0cy9zcGFjZW1pdC9rMS1taWxr
di1qdXBpdGVyLmR0Yjogc2VyaWFsQGYwNjEyMDAwCj4gKHNwYWNlbWl0LGsxLXVhcnQpOiAnY2xv
Y2stbmFtZXMnIGlzIGEgcmVxdWlyZWQgcHJvcGVydHkKPiDCoMKgwqDCoMKgwqDCoCBmcm9tIHNj
aGVtYSAkaWQ6IGh0dHA6Ly9kZXZpY2V0cmVlLm9yZy9zY2hlbWFzL3NlcmlhbC84MjUwLnlhbWwj
Cj4gCj4gVG8gYmUgaG9uZXN0LCBJIGRvbid0IHVuZGVyc3RhbmQgd2hhdCAid2l0aGluIE1NSU8g
bm9kZSIgbWVhbnMgaGVyZS4KPiBTaG91bGQgdGhlIGJ1c2VzIGJlIHRha2VuIG91dCBvZiAvc29j
IGFuZCBhZGRlZCBhcyBpdHMgc2libGluZ3M/ClRoZXNlIGxvb2tzIGxpa2UgY2hpbGRyZW4gb2Yg
c2ltcGxlLWJ1cy4gSWYgdGhhdCdzIHJpZ2h0OiBjaGlsZHJlbiBvZgpzaW1wbGUtYnVzIGFyZSBz
dXBwb3NlZCB0byBoYXZlIHVuaXQgYWRkcmVzc2VzIChzZWUgYWxzbyBzaW1wbGUtYnVzIGluCnRo
ZSBEVCBzY2hlbWEpLgoKQmVzdCByZWdhcmRzLApLcnp5c3p0b2YKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdAps
aW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3Jn
L21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
