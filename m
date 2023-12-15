Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A4C8C4167B
	for <linux-riscv@archiver.kernel.org>; Fri, 15 Dec 2023 21:10:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TqcsTkelUjpWHJp46vG8lo0fbMbgmZaEkHRxu4xx6rw=; b=f0bucjtRGmyUpb
	D1iTbvEuvsMHBj31JcOEGDZRkiRSBlSA+89JYjs8py5pSC2xnP+Ygv9qNGGherwKwYDl5ReKEwfEc
	jilGChHBNOJH8JMtDeI6RwCgRDRGkXqenIEXLnGVmN3kdT987YBrqor/jxFFhBve+bnrOejHQi29e
	sLh1KbPuvuh0jRs7uZNbnH2AaQ/du6OtgkqNXNVhhUs+SHX8ZgmEqmOdb+K4zBDezR6E+Eucu6YA2
	IYb/lIrOf6CLK9kAAZ9RY6D8ehMso+anXOf6xb+WfhqJLU82Rc1h67QKSnS7lseBoJG3axXGb5EHU
	1Kn7NbUiPR1RIWGIX2Bg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rEFRV-004Zjh-2M;
	Fri, 15 Dec 2023 21:09:57 +0000
Received: from out2-smtp.messagingengine.com ([66.111.4.26])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rEFRS-004Zj1-0U;
	Fri, 15 Dec 2023 21:09:55 +0000
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailout.nyi.internal (Postfix) with ESMTP id 08D615C01B4;
	Fri, 15 Dec 2023 16:09:49 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
  by compute5.internal (MEProxy); Fri, 15 Dec 2023 16:09:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sholland.org; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1702674589;
	 x=1702760989; bh=+9pLPYjGFzgfQNqnSkxnhSaHWO67M+0iAl8v+uqZUn0=; b=
	qRat0JjUuSP+CfpfIN2pUKpArcFwNph/k3XRmvINBOoHN7pB4D8n7pkE8iBHA0Qk
	odXJPgXteR0Xm5RtvWlDCYGtYMAyFMhF7pXJlrFvsJEgzuJBUmrxnIQ/h9GGJkjN
	AGllPtoiPQ1HfYI38BcYwoCaVwaXYsYM3Tm/3Ue9M8yhshedBOFofOzWZuP0zTRH
	yoSAxvbBB0bEnEMgotajZaiTr/OvB019lYMFqK70HQXJR10SlhyMmmObJ9am4Y2W
	GBrwGsxQuhzD4ndPWNnD0ftTtGDpoIydMftL78GEid9ydKYWP0b2TrvbhSwoSP1q
	BT/On1G6mHYrRMvC06NsDA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1702674589; x=
	1702760989; bh=+9pLPYjGFzgfQNqnSkxnhSaHWO67M+0iAl8v+uqZUn0=; b=b
	TJSsJXYOMfo+ayDWdjBB5rX0z+IaPLykp8Ix+V7WgrTdZYVwjG8gfMG4b9OTbfjq
	BvN1l2in5uzVkegf4KRXbfwPKmH6xOjdHfMTZFBX+geQfbINDI09rw2YAk4rVOYm
	pAy/TrpjkteeXFBBWnpA3dEZ4gA0UF3LIFDizumOqDWUkto/fUg9ac7PNcWu5m1U
	nv9UKqi4YQgf+evBIuqDQ3gj/HfUupEs8dyeH47PUMFPs7lroHF3jKdhPKns5PWu
	f80ah+Ujds+y5aFrz+912p6PJU4tnF8p+er+N4rj+IgENkr/OsfyyCIVPfZSFDxg
	+HyD5PD9PgXUGHZeZ++qA==
X-ME-Sender: <xms:nMB8ZZEuYE7BXDpGFfbOk_4c1rdExyb3dPRpgkHivUzKCxO6A-QLYA>
    <xme:nMB8ZeU1bLyUJmYrQJ60LyUUDXmr1R6AUGGdS2N5QOvPi48nCTejAqM8UEQZe0TfF
    FGZu0hOzSA4KQ1wLQ>
X-ME-Received: <xmr:nMB8ZbII-66LC2gnpfa7Wn4D_icvvn3BPx7bVDbylIuSFNwX0_2BAFdLU-pXqiH_1k2yFEk_fBlzsJ3clBLKt_56v6nHM76vKNe1tLxog3LYC1o76O_g8zktoQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvkedrvddtvddgudeghecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpefkffggfgfuvfevfhfhjggtgfesthekredttddvjeenucfhrhhomhepufgr
    mhhuvghlucfjohhllhgrnhguuceoshgrmhhuvghlsehshhholhhlrghnugdrohhrgheqne
    cuggftrfgrthhtvghrnhepteevhffhteegfeehteehhfevgfejtdehudehvdejveetgedt
    ffejjefhffehudffnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilh
    hfrhhomhepshgrmhhuvghlsehshhholhhlrghnugdrohhrgh
X-ME-Proxy: <xmx:nMB8ZfELrq8xAznZrAp53-LvFGhKOEdj4xfr1b1x7PB9_8EzoQwECQ>
    <xmx:nMB8ZfVfRWgzryaISqCJQAgWBuk81px9I4pWUvrfQJcsVQhdVwG_yw>
    <xmx:nMB8ZaOVgiaKi2SjWVQBwKssdcB0_9tRhb0QlVXnGAX-fa1Sqk7f2g>
    <xmx:ncB8ZTmp8MMBx-462eITdqMgyHG8rDd6oz_R_LOFOWw2517D1T7oEA>
Feedback-ID: i0ad843c9:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 15 Dec 2023 16:09:47 -0500 (EST)
Message-ID: <11b5aea1-7c6e-4be5-ae01-9c4c869dc98c@sholland.org>
Date: Fri, 15 Dec 2023 15:09:46 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/5] cpufreq: Add support for RISC-V CPU Frequency scaling
 drivers
To: Brandon Cheo Fusi <fusibrandon13@gmail.com>, viresh.kumar@linaro.org
Cc: aou@eecs.berkeley.edu, conor+dt@kernel.org, devicetree@vger.kernel.org,
 jernej.skrabec@gmail.com, krzysztof.kozlowski+dt@linaro.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-pm@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-sunxi@lists.linux.dev, palmer@dabbelt.com, paul.walmsley@sifive.com,
 rafael@kernel.org, robh+dt@kernel.org, tiny.windzz@gmail.com, wens@csie.org
References: <20231214111702.xdd7qlcrpqh74i3j@vireshk-i7>
 <20231215151723.46409-1-fusibrandon13@gmail.com>
Content-Language: en-US
From: Samuel Holland <samuel@sholland.org>
In-Reply-To: <20231215151723.46409-1-fusibrandon13@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231215_130954_458502_5E34808D 
X-CRM114-Status: GOOD (  13.49  )
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

SGkgQnJhbmRvbiwKCk9uIDEyLzE1LzIzIDA5OjE3LCBCcmFuZG9uIENoZW8gRnVzaSB3cm90ZToK
PiBPbiBUaHUsIERlYyAxNCwgMjAyMyBhdCAxMjoxN+KAr1BNIFZpcmVzaCBLdW1hciA8dmlyZXNo
Lmt1bWFyQGxpbmFyby5vcmc+IHdyb3RlOgo+Pgo+PiBPbiAxNC0xMi0yMywgMTE6MzMsIEJyYW5k
b24gQ2hlbyBGdXNpIHdyb3RlOgo+Pj4gQWRkIEtjb25maWcgZmlsZSBmb3IgY3B1ZnJlcSBzY2Fs
aW5nIGRyaXZlcnMgdGhhdCBjYW4gaGFuZGxlIFJJU0MtVgo+Pj4gQ1BVcy4gQW4gZW50cnkgaXMg
aW5jbHVkZWQgZm9yIHRoZSBBbGx3aW5uZXIgSDYgY3B1ZnJlcSBkcml2ZXIgdGhhdAo+Pj4gd29y
a3Mgd2l0aCBEMS4KPj4+Cj4+PiBTaWduZWQtb2ZmLWJ5OiBCcmFuZG9uIENoZW8gRnVzaSA8ZnVz
aWJyYW5kb24xM0BnbWFpbC5jb20+Cj4+PiAtLS0KPj4+ICBkcml2ZXJzL2NwdWZyZXEvS2NvbmZp
ZyAgICAgICB8ICA0ICsrKysKPj4+ICBkcml2ZXJzL2NwdWZyZXEvS2NvbmZpZy5yaXNjdiB8IDE2
ICsrKysrKysrKysrKysrKysKPj4+ICAyIGZpbGVzIGNoYW5nZWQsIDIwIGluc2VydGlvbnMoKykK
Pj4+ICBjcmVhdGUgbW9kZSAxMDA2NDQgZHJpdmVycy9jcHVmcmVxL0tjb25maWcucmlzY3YKPj4K
Pj4gV2UgZG9uJ3QgaGF2ZSBhIHNlcGFyYXRlIGtjb25maWcgZmlsZSBmb3IgZWFjaCBhcmNoaXRl
Y3R1cmUuIE9ubHkgaWYKPj4gdGhlcmUgYXJlIHRvbyBtYW55IGVudHJpZXMgZm9yIGFuIGFyY2hp
dGVjdHVyZSwgd2UgYWRkIGEgbmV3IGZpbGUuCj4+Cj4+IC0tCj4+IHZpcmVzaAo+IAo+IFRoZSBz
dW41MGkgY3B1ZnJlcSBkcml2ZXIgaXMgY3VycmVudGx5IG9ubHkgYXZhaWxhYmxlIHdoZW4gQ09O
RklHX0FSTSBvcgo+IENPTkZJR19BUk02NCBpcyBzZWxlY3RlZCwgc28gdGhpcyB3YXMgdGhlIG9u
bHkgZGVjZW50IHdheSBJIGNvdWxkIHRoaW5rCj4gb2YgbWFraW5nIGl0IGFjY2Vzc2libGUgb24g
ZWl0aGVyIG9uZSBvZiBDT05GSUdfKEFSTSB8IEFSTTY0IHwgUklTQy1WKS4KPiBBbnkgc3VnZ2Vz
dGlvbnMgZm9yIGEgYmV0dGVyIHdvcmthcm91bmQgPwoKTW92ZSB0aGUgb3B0aW9uIHRvIHRoZSBt
YWluIGRyaXZlcnMvY3B1ZnJlcS9LY29uZmlnLCBsaWtlIFFPUklRX0NQVUZSRVEsCndoaWNoIGlz
IGFsc28gdXNlZCB3aXRoIG11bHRpcGxlIGFyY2hpdGVjdHVyZXMgKFBvd2VyUEMgYW5kIEFSTSwg
aW4gdGhhdApjYXNlKS4gV2UgZG9uJ3Qgd2FudCB0d28gb3B0aW9ucyBmb3IgdGhlIHNhbWUgZHJp
dmVyLgoKUmVnYXJkcywKU2FtdWVsCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3Rz
LmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5m
by9saW51eC1yaXNjdgo=
