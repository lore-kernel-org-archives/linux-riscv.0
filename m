Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D7BDCD4939
	for <linux-riscv@archiver.kernel.org>; Thu, 21 Sep 2023 01:00:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PHFb4HB97K7FuYX2acl5XraWDKx5sZh1BVoxoFZx42o=; b=nCQhXMnOgUzido
	JrOSpn47c6IIW464n/8gnYt+kA/raCSBuTMKoB1DjAraiL8cKjgWlnU7OPyIYNXTUdKA6POgW5/My
	9rtAL+KCZJNoU8zRBMtCExESDu0pLGIz/cmixlyOSFfC+nCPvvgQhEf6igDtFq0gE958SJZJBAiCb
	E3zW2FV34qERgR/cE7osWRjDfUzZaQgIhv0HCBeyR0xoV7pNbQjjODrLqoFkx62Uytf+MxqPTLqvp
	WJCvFnhiqHWPzi1YTqlsrIJVri9hXjrbGY0W4PjaP6BCNHeFVq03fLXY+xdgteQQzYOG6ceLnzAFW
	nI8bhBa7U/q4GY7etTeg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qj83b-004aqa-2Z;
	Thu, 21 Sep 2023 01:00:39 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qj83X-004apD-30
	for linux-riscv@lists.infradead.org;
	Thu, 21 Sep 2023 01:00:37 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 1756AB81E2E;
	Thu, 21 Sep 2023 01:00:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 111C1C433C8;
	Thu, 21 Sep 2023 01:00:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1695258032;
	bh=Z3g98CN97Kp2tDtu7HOQ22hDAtgJ3k/nNvIb2l3ASxk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ouayZvHri60qbbevVV/QKzbmdAaWutHLOCQwtgtjWqsGL+TgDginCgWDh1oCbFUwr
	 +qgSS0dnA2NRzqj2NBpG8SQd0RPXUg2FEtVYfK8GZ1yyWW9e1qtU426ZiEI+uHIony
	 UvQ13+EzeFDyTbfjXT00ftbrdgU7kHnL8us0yKzbzhrpGVMeLX4V9McRrrRxemCY9P
	 Y7SXBuJ7BJkxtuS6zYNcLU2houNa2q66HkZpSBSfLqO2cJ6GfOYqb20jjIOdfBdXmq
	 6Pq+EWwb9xwqijLAv5icVyLGa1WMnMc5LNaWLA36W24Vzty8K9rMQqDnOzMjr+0nHJ
	 vOD9ij632GtEg==
Date: Thu, 21 Sep 2023 08:48:17 +0800
From: Jisheng Zhang <jszhang@kernel.org>
To: =?utf-8?B?5rGq6L6w?= <wangchen20@iscas.ac.cn>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Chen Wang <unicornxw@gmail.com>, aou@eecs.berkeley.edu,
	chao.wei@sophgo.com, conor@kernel.org, devicetree@vger.kernel.org,
	emil.renner.berthing@canonical.com, guoren@kernel.org,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
	palmer@dabbelt.com, paul.walmsley@sifive.com,
	xiaoguang.xing@sophgo.com
Subject: Re: Re: [PATCH v2 03/11] dt-bindings: riscv: add sophgo sg2042
 bindings
Message-ID: <ZQuS0ZE0Y6Lot/UM@xhacker>
References: <cover.1695189879.git.wangchen20@iscas.ac.cn>
 <c6aea83bb1df563b1f2a66c5f230c3861aed1e15.1695189879.git.wangchen20@iscas.ac.cn>
 <ec11eb6a-c37b-08bd-5997-8fc390fd58c8@linaro.org>
 <3d2bba58.29898.18ab279a15c.Coremail.wangchen20@iscas.ac.cn>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <3d2bba58.29898.18ab279a15c.Coremail.wangchen20@iscas.ac.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230920_180036_286103_F4E7E6F8 
X-CRM114-Status: GOOD (  17.71  )
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

T24gV2VkLCBTZXAgMjAsIDIwMjMgYXQgMDg6MDM6NTBQTSArMDgwMCwg5rGq6L6wIHdyb3RlOgo+
IFNvcnJ5LCBteSBtaXN0YWtlIHRvIGZvcmdldCBhZGRpbmcgdGhlIHRhZywgd2lsbCBhZGQgaW4g
bmV4dCByZXZpc2lvbi4KCkhpIENoZW4sCgpTb2Z0IHJlbWluZDogSW4gbWFpbGlzdCwgdG9wIHBv
c3Qgc2hvdWxkIGJlIGF2b2lkZWQuCgo+IAo+IAo+ICZndDsgLS0tLS3ljp/lp4vpgq7ku7YtLS0t
LQoKQW5kIGl0IGxvb2tzIGxpa2UgeW91ciBlbWFpbCBjbGllbnQgaXMgd3JvbmcsIEkgZHVubm8g
aG93IHlvdXIgcmVwbHkKbG9va3MgaW4gb3RoZXIgcGVvcGxlJ3MgZW1haWwgY2xpZW50LCBidXQg
aXQgbG9va3MgbGlrZSBodG1sIG9yCnJpY2ggdGV4dCBpbiBtdXR0LgoKPiAmZ3Q7IOWPkeS7tuS6
ujogIktyenlzenRvZiBLb3psb3dza2kiIDxrcnp5c3p0b2Yua296bG93c2tpQGxpbmFyby5vcmc+
Cj4gJmd0OyDlj5HpgIHml7bpl7Q6IDIwMjMtMDktMjAgMTk6NTU6MzAgKOaYn+acn+S4iSkKPiAm
Z3Q7IOaUtuS7tuS6ujogIkNoZW4gV2FuZyIgPHVuaWNvcm54d0BnbWFpbC5jb20+LCBhb3VAZWVj
cy5iZXJrZWxleS5lZHUsIGNoYW8ud2VpQHNvcGhnby5jb20sIGNvbm9yQGtlcm5lbC5vcmcsIGRl
dmljZXRyZWVAdmdlci5rZXJuZWwub3JnLCBlbWlsLnJlbm5lci5iZXJ0aGluZ0BjYW5vbmljYWwu
Y29tLCBndW9yZW5Aa2VybmVsLm9yZywganN6aGFuZ0BrZXJuZWwub3JnLCBrcnp5c3p0b2Yua296
bG93c2tpK2R0QGxpbmFyby5vcmcsIGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmcsIGxpbnV4
LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcsIHBhbG1lckBkYWJiZWx0LmNvbSwgcGF1bC53YWxt
c2xleUBzaWZpdmUuY29tLCByb2JoK2R0QGtlcm5lbC5vcmcsIHhpYW9ndWFuZy54aW5nQHNvcGhn
by5jb20KPiAmZ3Q7IOaKhOmAgTogIkNoZW4gV2FuZyIgPHdhbmdjaGVuMjBAaXNjYXMuYWMuY24+
Cj4gJmd0OyDkuLvpopg6IFJlOiBbUEFUQ0ggdjIgMDMvMTFdIGR0LWJpbmRpbmdzOiByaXNjdjog
YWRkIHNvcGhnbyBzZzIwNDIgYmluZGluZ3MKPiAmZ3Q7IAo+ICZndDsgT24gMjAvMDkvMjAyMyAw
ODozNywgQ2hlbiBXYW5nIHdyb3RlOgo+ICZndDsgJmd0OyBBZGQgRFQgYmluZGluZyBkb2N1bWVu
dGF0aW9uIGZvciB0aGUgU29waGdvIFNHMjA0MiBTb2MgWzFdIGFuZCB0aGUKPiAmZ3Q7ICZndDsg
TWlsay1WIFBpb25lZXIgYm9hcmQgWzJdLgo+ICZndDsgJmd0OyAKPiAmZ3Q7ICZndDsgWzFdOiBo
dHRwczovL2VuLnNvcGhnby5jb20vcHJvZHVjdC9pbnRyb2R1Y2Uvc2cyMDQyLmh0bWwKPiAmZ3Q7
ICZndDsgWzJdOiBodHRwczovL21pbGt2LmlvL3Bpb25lZXIKPiAmZ3Q7IAo+ICZndDsgVGhpcyBp
cyBhIGZyaWVuZGx5IHJlbWluZGVyIGR1cmluZyB0aGUgcmV2aWV3IHByb2Nlc3MuCj4gJmd0OyAK
PiAmZ3Q7IEl0IGxvb2tzIGxpa2UgeW91IHJlY2VpdmVkIGEgdGFnIGFuZCBmb3Jnb3QgdG8gYWRk
IGl0Lgo+ICZndDsgCj4gJmd0OyBJZiB5b3UgZG8gbm90IGtub3cgdGhlIHByb2Nlc3MsIGhlcmUg
aXMgYSBzaG9ydCBleHBsYW5hdGlvbjoKPiAmZ3Q7IFBsZWFzZSBhZGQgQWNrZWQtYnkvUmV2aWV3
ZWQtYnkvVGVzdGVkLWJ5IHRhZ3Mgd2hlbiBwb3N0aW5nIG5ldwo+ICZndDsgdmVyc2lvbnMsIHVu
ZGVyIG9yIGFib3ZlIHlvdXIgU2lnbmVkLW9mZi1ieSB0YWcuIFRhZyBpcyAicmVjZWl2ZWQiLCB3
aGVuCj4gJmd0OyBwcm92aWRlZCBpbiBhIG1lc3NhZ2UgcmVwbGllZCB0byB5b3Ugb24gdGhlIG1h
aWxpbmcgbGlzdC4gVG9vbHMgbGlrZSBiNAo+ICZndDsgY2FuIGhlbHAgaGVyZS4gSG93ZXZlciwg
dGhlcmUncyBubyBuZWVkIHRvIHJlcG9zdCBwYXRjaGVzICpvbmx5KiB0byBhZGQKPiAmZ3Q7IHRo
ZSB0YWdzLiBUaGUgdXBzdHJlYW0gbWFpbnRhaW5lciB3aWxsIGRvIHRoYXQgZm9yIHRhZ3MgcmVj
ZWl2ZWQgb24gdGhlCj4gJmd0OyB2ZXJzaW9uIHRoZXkgYXBwbHkuCj4gJmd0OyAKPiAmZ3Q7IGh0
dHBzOi8vZWxpeGlyLmJvb3RsaW4uY29tL2xpbnV4L3Y2LjUtcmMzL3NvdXJjZS9Eb2N1bWVudGF0
aW9uL3Byb2Nlc3Mvc3VibWl0dGluZy1wYXRjaGVzLnJzdCNMNTc3Cj4gJmd0OyAKPiAmZ3Q7IElm
IGEgdGFnIHdhcyBub3QgYWRkZWQgb24gcHVycG9zZSwgcGxlYXNlIHN0YXRlIHdoeSBhbmQgd2hh
dCBjaGFuZ2VkLgo+ICZndDsgCj4gJmd0OyBCZXN0IHJlZ2FyZHMsCj4gJmd0OyBLcnp5c3p0b2YK
PiAKPiAKPiAtLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KPiAKPiBCZXN0IFJlZ2FyZHMg
Cj4gIAo+ICDmsarovrAoV2FuZyBDaGVuKSAKPiAKPiA8L3dhbmdjaGVuMjBAaXNjYXMuYWMuY24+
PC91bmljb3JueHdAZ21haWwuY29tPjwva3J6eXN6dG9mLmtvemxvd3NraUBsaW5hcm8ub3JnPgoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlz
Y3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xp
c3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
