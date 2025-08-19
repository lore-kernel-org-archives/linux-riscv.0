Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06E75CA0EF8
	for <linux-riscv@archiver.kernel.org>; Tue, 19 Aug 2025 09:53:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zGs+FBoRYakvlqtQulbnZhEBTw20rBCwmqoR70Vu7Oo=; b=HZB2tmJkH3w0Rg
	TOCO3y1UC2GTnABa7pzM9RXrCHYTt6QhNxA7lysnre2JMXgEMFeZ2nw13JD1VYEaZqb0Ufot0OISh
	pyNL8dPstVzCAmAZPZYwYAmL1XwJLS2mxhjcRoJl7TLhciG6XF51SyI065mD/+Ew3vsvpdqC8o8MO
	qhj/cBM9sNS4JQzjc6h/BeL7merbUllzqjsmf2WgFgcljZJq/CHKFXTffJXhjWmdfe9i3qEyfCYy3
	1sXLJyZAh1VdyxJwliMZ9TOmj660irTF21yTe6A/uWtTIPx/h5jXiKP4/hkoQ1hG2TFwawe3IjE9C
	75gcI+EGXmg27jM0zr4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoJ1g-0000000A2FQ-37So;
	Tue, 19 Aug 2025 09:53:08 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoIMU-00000009u5h-2cqs
	for linux-riscv@lists.infradead.org;
	Tue, 19 Aug 2025 09:10:34 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id E152B61425;
	Tue, 19 Aug 2025 09:10:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C1689C113D0;
	Tue, 19 Aug 2025 09:10:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755594633;
	bh=1SSq/D6eu62T9bEwfEUnKWuT8GJ3sZYRtk3+0ypHiO8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=dpWA2o8o62EMJn53RjU4ScLXk7JM7wTmqEeQjhWKianQBl/rqaFNZD3r0S3Xma184
	 v6FVm34S8QvvQ7VhIIrYqjfS63GLvHOco/6UC1x/jDA+dG4yoYf0KOLzuqXrKKDDd6
	 kVQbb24xFIRfoGcFU/ru9mVz54XGIQGfnf1V416goKXbz8+wnVOhWGLpSMYPMDD/sj
	 CHFqdjiQMNuBbIOn+KSIMSenwomibyee/XqNcriqihBdnbUYC5JubKajKbMD8UrDdq
	 i1aOios9lF94JuyheDaP5yrqSE66p34pLD75/MoDjCjCtn3DPCSgRI6s4byMfWo+Zt
	 S3kHFp4yRA+aA==
Message-ID: <bfa23779-9861-4ae4-9ced-9f347394f033@kernel.org>
Date: Tue, 19 Aug 2025 11:10:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/3] riscv: dts: eswin: Add clock driver support
To: =?UTF-8?B?6JGj57uq5rSL?= <dongxuyang@eswincomputing.com>,
 mturquette@baylibre.com, sboyd@kernel.org, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
 alex@ghiti.fr, linux-riscv@lists.infradead.org
Cc: ningyu@eswincomputing.com, linmin@eswincomputing.com,
 huangyifeng@eswincomputing.com, pinkesh.vaghela@einfochips.com
References: <20250815093539.975-1-dongxuyang@eswincomputing.com>
 <20250815093754.1143-1-dongxuyang@eswincomputing.com>
 <0ef61f03-0346-491d-ad2a-293e24cbc4a8@kernel.org>
 <3fa3950e.371.198c1770125.Coremail.dongxuyang@eswincomputing.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 a/A=
In-Reply-To: <3fa3950e.371.198c1770125.Coremail.dongxuyang@eswincomputing.com>
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

T24gMTkvMDgvMjAyNSAxMDozNCwg6JGj57uq5rSLIHdyb3RlOgo+IEhpIEtyenlzenRvZiwKPiAK
PiBUaGFuayB5b3UgdmVyeSBtdWNoIGZvciB5b3VyIGNvbnN0cnVjdGl2ZSBzdWdnZXN0aW9ucy4K
PiAKPj4+Cj4+PiBBZGQgY2xvY2sgZGV2aWNlIHRyZWUgc3VwcG9ydCBmb3IgZWljNzcwMCBTb0Mu
Cj4+Pgo+Pj4gU2lnbmVkLW9mZi1ieTogWWlmZW5nIEh1YW5nIDxodWFuZ3lpZmVuZ0Blc3dpbmNv
bXB1dGluZy5jb20+Cj4+PiBTaWduZWQtb2ZmLWJ5OiBYdXlhbmcgRG9uZyA8ZG9uZ3h1eWFuZ0Bl
c3dpbmNvbXB1dGluZy5jb20+Cj4+PiAtLS0KPj4+ICBhcmNoL3Jpc2N2L2Jvb3QvZHRzL2Vzd2lu
L2VpYzc3MDAtY2xvY2tzLmR0c2kgfCAyMjgzICsrKysrKysrKysrKysrKysrCj4+PiAgMSBmaWxl
IGNoYW5nZWQsIDIyODMgaW5zZXJ0aW9ucygrKQo+Pj4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBhcmNo
L3Jpc2N2L2Jvb3QvZHRzL2Vzd2luL2VpYzc3MDAtY2xvY2tzLmR0c2kKPj4+Cj4+PiBkaWZmIC0t
Z2l0IGEvYXJjaC9yaXNjdi9ib290L2R0cy9lc3dpbi9laWM3NzAwLWNsb2Nrcy5kdHNpIGIvYXJj
aC9yaXNjdi9ib290L2R0cy9lc3dpbi9laWM3NzAwLWNsb2Nrcy5kdHNpCj4+PiBuZXcgZmlsZSBt
b2RlIDEwMDY0NAo+Pj4gaW5kZXggMDAwMDAwMDAwMDAwLi40MDVkMDZmOTE5MGUKPj4+IC0tLSAv
ZGV2L251bGwKPj4+ICsrKyBiL2FyY2gvcmlzY3YvYm9vdC9kdHMvZXN3aW4vZWljNzcwMC1jbG9j
a3MuZHRzaQo+Pj4gQEAgLTAsMCArMSwyMjgzIEBACj4+PiArLy8gU1BEWC1MaWNlbnNlLUlkZW50
aWZpZXI6IChHUEwtMi4wIE9SIE1JVCkKPj4+ICsvKgo+Pj4gKyAqIENvcHlyaWdodCAoYykgMjAy
NSwgQmVpamluZyBFU1dJTiBDb21wdXRpbmcgVGVjaG5vbG9neSBDby4sIEx0ZC4KPj4+ICsgKi8K
Pj4+ICsKPj4+ICsvIHsKPj4+ICsJY2xvY2stY29udHJvbGxlckA1MTgyODAwMCB7Cj4+PiArCQlj
b21wYXRpYmxlID0gImVzd2luLGVpYzc3MDAtY2xvY2siOwo+Pj4gKwkJcmVnID0gPDB4MDAwMDAw
IDB4NTE4MjgwMDAgMHgwMDAwMDAgMHg4MDAwMD47Cj4+PiArCQkjY2xvY2stY2VsbHMgPSA8MD47
Cj4+PiArCQkjYWRkcmVzcy1jZWxscyA9IDwxPjsKPj4+ICsJCSNzaXplLWNlbGxzID0gPDA+Owo+
Pj4gKwo+Pj4gKwkJLyogZml4ZWQgY2xvY2sgKi8KPj4+ICsJCWZpeGVkX3JhdGVfY2xrX2FwbGxf
Zm91dDI6IGZpeGVkLXJhdGUtYXBsbC1mb3V0MiB7Cj4+Cj4+IFN1Y2ggcGF0dGVybiB3YXMgeWVh
cnMgYWdvIE5BS2VkLgo+Pgo+PiBObywgZG9uJ3QgZXZlciBicmluZyBub2RlcyBwZXIgY2xvY2su
Cj4+Cj4gV2UgaGF2ZSBkZWZpbmVkIGEgbGFyZ2UgbnVtYmVyIG9mIGNsb2NrIGRldmljZXMuwqAK
PiBUaGUgY29tbWVudCBvZiB2MyBpcyAiRHJpdmVyIGlzIGFsc28gd2F5IHRvbyBiaWcgZm9yIHNp
bXBsZSBjbG9jayBkcml2ZXIgYW5kIEnCoAo+IGFtIHN1cnByaXNlZCB0byBzZWUgc28gbWFueSBy
ZWR1bmRhbmNpZXMuIi4gVGhlcmVmb3JlLCB3ZSBtb2RpZmllZCB0aGUgY2xvY2vCoAo+IGRyaXZl
ciBjb2RlIGFuZCBtb3ZlZCB0aGUgZGVzY3JpcHRpb24gb2YgY2xvY2sgZGV2aWNlIGZyb20gdGhl
IGRyaXZlciB0byB0aGUgRFRTLgo+IAo+IEJ1dCwgdGhpcyBjb21tZW50IGlzIHRoYXQgZG9uJ3Qg
ZXZlciBicmluZyBub2RlcyBwZXIgY2xvY2suIFdl4oCZdmUgcnVuIGludG8gc29tZQoKQW5kPyBX
aGF0IGlzIHVuY2xlYXIgaW4gdGhhdCBjb21tZW50PwoKPiB0cm91YmxlIGFuZCBhcmVu4oCZdCBz
dXJlIHdoaWNoIGFwcHJvYWNoIGFsaWducyBiZXR0ZXIgd2l0aCBjb21tdW5pdHkgZ3VpZGVsaW5l
cy7CoAo+IENvdWxkIHlvdSBzaGFyZSB5b3VyIGFkdmljZSBvciBzdWdnZXN0aW9ucyBvbiB0aGUg
YmVzdCB3YXkgZm9yd2FyZD8KCkxvb2sgYXQgYW55IG90aGVyIHJlY2VudCBjbG9jayBkcml2ZXJz
LgoKQmVzdCByZWdhcmRzLApLcnp5c3p0b2YKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBs
aXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlz
dGluZm8vbGludXgtcmlzY3YK
