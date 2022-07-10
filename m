Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E1D2C43334
	for <linux-riscv@archiver.kernel.org>; Sun, 10 Jul 2022 02:26:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=22at5ZQ3XG6GYIVLPFh2r79f2jCKbWir3bl1lc2GzKM=; b=HiqJTjruDo1qYx
	a8YWKpdDbPeIGHWIBXUVZWjJPMiAPEDhVqx18Tt0EeVVHLbb0RMxB+xqpwg0jYVyU4iM9ArjJ+VWJ
	wzLIs+S/rUeiWEidT7Xjrg2gJn6BjaHdnXfmUBulL+M2FkrtAq7oYvUvE4j4MX1/peQJnOBj1NB+3
	GZK5DNBEq6Y76++OHLmYGKx4RdGz5TW1BLDcbab76aea/zXpjoMTw6S26vppa5X0fOC3fvMWg+l7X
	LG3u7FWSEaPjtWsthqZIOUU3C5oUs4OgRWq1qnuMvfFwcZrccQzqvoxe+Oahhgpz7GElcIfy7RQVH
	qsfaobmhzUZ2Fnb6hGIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oAMdq-00AGtz-5Z; Sun, 10 Jul 2022 02:25:50 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oAMdm-00AGt1-Jv
	for linux-riscv@lists.infradead.org; Sun, 10 Jul 2022 02:25:48 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 388F6B806A0
	for <linux-riscv@lists.infradead.org>; Sun, 10 Jul 2022 02:25:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D0FDAC3411C
	for <linux-riscv@lists.infradead.org>; Sun, 10 Jul 2022 02:25:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1657419943;
	bh=kyUpCqjvLCeBEScZobcqPmStMHqGCubVVwf6nmqGj2Y=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=YRMrsq4WVto6lWgijKLlDCYU+j8xoBFpdqpRiMknSpDomUrXU/XNW3yAFLJ4c6HUV
	 jtHZ3WX1/s26k/0rDwgrWDhr6XNuyoU65l+p8aUJrXJwPd3q+brniJINQN8xa9Ic0D
	 knYmkPprOUrUcJsm0wYpjXqAtLseh+NQeIvnWNBYaMAi8WmqSIK5WzKvDIrPL6yVh9
	 9UXSsXQ9G1H438cYGfEfQf8jsR2RjB3tW7ryDOxoGysJMUTyMuUilFGzMdMpbt+IvZ
	 gmEqcdFrBl4ALX48OM5+GZoEvCCDsWDhNVDC152Ywc84u4o6HMpwcSHOPjFds2cM8K
	 L53uY/9yfvCtA==
Received: by mail-vk1-f177.google.com with SMTP id 18so1062774vkz.2
        for <linux-riscv@lists.infradead.org>; Sat, 09 Jul 2022 19:25:43 -0700 (PDT)
X-Gm-Message-State: AJIora+jQ15Ru7+xilVVrC5saQJDtXqp4hsfOCvJq/xbAb+6oJGVaXGx
	XAWzu3Ho+mqzl4lQ2CQmlJzjVRSXZCLf5oQkbxg=
X-Google-Smtp-Source: AGRyM1vRDyvIEoBXkI5gsoLyVmNQJ8sVQYdBMuJvbRrsu2MT7CZUUG5wPwBRPzd60vKBETyH5kpF+rU2FLvGIvCOtLc=
X-Received: by 2002:a1f:1bc8:0:b0:36c:a88c:961a with SMTP id
 b191-20020a1f1bc8000000b0036ca88c961amr4117435vkb.2.1657419942791; Sat, 09
 Jul 2022 19:25:42 -0700 (PDT)
MIME-Version: 1.0
References: <20220705100523.1204595-1-guoren@kernel.org> <20220705100523.1204595-3-guoren@kernel.org>
 <3498257.R56niFO833@diego>
In-Reply-To: <3498257.R56niFO833@diego>
From: Guo Ren <guoren@kernel.org>
Date: Sun, 10 Jul 2022 10:25:31 +0800
X-Gmail-Original-Message-ID: <CAJF2gTTPYMTb9Yy640NMpvLAp2iwbC-700yU5O4victiTOCAQw@mail.gmail.com>
Message-ID: <CAJF2gTTPYMTb9Yy640NMpvLAp2iwbC-700yU5O4victiTOCAQw@mail.gmail.com>
Subject: Re: [RFC PATCH 2/4] riscv: Cleanup ERRATA_THEAD_PBMT for rv32 svpbmt compile
To: =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>
Cc: Palmer Dabbelt <palmer@rivosinc.com>, linux-riscv <linux-riscv@lists.infradead.org>, 
	Guo Ren <guoren@linux.alibaba.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220709_192546_967712_393DE1BB 
X-CRM114-Status: GOOD (  25.69  )
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

T24gRnJpLCBKdWwgOCwgMjAyMiBhdCA0OjUxIFBNIEhlaWtvIFN0w7xibmVyIDxoZWlrb0BzbnRl
Y2guZGU+IHdyb3RlOgo+Cj4gSGkgR3VvLAo+Cj4gQW0gRGllbnN0YWcsIDUuIEp1bGkgMjAyMiwg
MTI6MDU6MjEgQ0VTVCBzY2hyaWViIGd1b3JlbkBrZXJuZWwub3JnOgo+ID4gRnJvbTogR3VvIFJl
biA8Z3VvcmVuQGxpbnV4LmFsaWJhYmEuY29tPgo+ID4KPiA+IE1ha2UgY29tcGlsZSBjbGVhbmVy
IGFuZCBkb24ndCByZWZlcmVuY2UgdGhlIFRIRUFEX1BCTVQgZGF0YSBzdHJ1Y3Qgd2hlbgo+ID4g
Q09ORklHX0VSUkFUQV9USEVBRF9QQk1UPXkuIE5leHQsIHdlIGNvdWxkIGNsZWFubHkgbWFrZSBz
dnBibXQgdG8KPiA+IHN1cHBvcnQgcnYzMi4KPiA+Cj4gPiBTaWduZWQtb2ZmLWJ5OiBHdW8gUmVu
IDxndW9yZW5AbGludXguYWxpYmFiYS5jb20+Cj4gPiBTaWduZWQtb2ZmLWJ5OiBHdW8gUmVuIDxn
dW9yZW5Aa2VybmVsLm9yZz4KPiA+IC0tLQo+ID4gIGFyY2gvcmlzY3YvaW5jbHVkZS9hc20vZXJy
YXRhX2xpc3QuaCB8IDExICsrKysrKysrKystCj4gPiAgMSBmaWxlIGNoYW5nZWQsIDEwIGluc2Vy
dGlvbnMoKyksIDEgZGVsZXRpb24oLSkKPiA+Cj4gPiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9p
bmNsdWRlL2FzbS9lcnJhdGFfbGlzdC5oIGIvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9lcnJhdGFf
bGlzdC5oCj4gPiBpbmRleCA0MTZlYWQwZjlhNjUuLjQ3MTc1ZDkxNzczZCAxMDA2NDQKPiA+IC0t
LSBhL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vZXJyYXRhX2xpc3QuaAo+ID4gKysrIGIvYXJjaC9y
aXNjdi9pbmNsdWRlL2FzbS9lcnJhdGFfbGlzdC5oCj4gPiBAQCAtNDcsNiArNDcsOCBAQCBhc20o
QUxURVJOQVRJVkUoInNmZW5jZS52bWEgJTAiLCAic2ZlbmNlLnZtYSIsIFNJRklWRV9WRU5ET1Jf
SUQsICAgIFwKPiA+ICAgKiBpbiB0aGUgZGVmYXVsdCBjYXNlLgo+ID4gICAqLwo+ID4gICNkZWZp
bmUgQUxUX1NWUEJNVF9TSElGVCA2MQo+ID4gKwo+ID4gKyNpZmRlZiBDT05GSUdfRVJSQVRBX1RI
RUFEX1BCTVQKPgo+IEkgZG9uJ3QgcmVhbGx5IHRoaW5rIHRoYXQgaXMgbmVjZXNzYXJ5IGFuZCBh
Y3R1YWxseSBtYWtlcyB0aGUgY29kZQo+IG1vcmUgY29tcGxleCB0aGFuIG5lZWRlZC4KPgo+IEVh
Y2ggYWx0ZXJuYXRpdmUtZW50cnkgYWxyZWFkeSBoYXMgdGhlIGRlcGVuZGVuY3kgb24KPiBDT05G
SUdfKiAuLi4gaS5lLiBDT05GSUdfUklTQ1ZfSVNBX1NWUEJNVCBhbmQgQ09ORklHX0VSUkFUQV9U
SEVBRF9QQk1UCj4KPiBXaGVuIHlvdSBsb29rIGF0IGFsdGVybmF0aXZlLW1hY3Jvcy5oIHlvdSds
bCBzZWUgdGhpcyB0cmFuc2xhdGluZyB0byB0aGUKPiBlbmFibGUgYXJndW1lbnQgaW4gQUxUX05F
V19DT05URU5ULgo+Cj4gU28gb25seSB3aGVuIHRoYXQgaXMgYWN0aXZlIGlzIHRoZSBhbHRlcm5h
dGl2ZSBzZWN0aW9uIGFkZGVkIHRvIHRoZSBidWlsZC4KPiBJLmUuIHRoYXQgdHJhbnNsYXRlcyB0
bzoKPgo+ICAgICAgICAgLmlmIElTX0VOQUJMRUQoQ09ORklHX0VSUkFUQV9USEVBRF9QQk1UKQo+
ICAgICAgICAgLnB1c2hzZWN0aW9uIC5hbHRlcm5hdGl2ZSwgImEiCj4gICAgICAgICAuLi4KCkFi
b3ZlIGNhbid0IGFmZmVjdCB0aGUgYmVsb3c6CiAgICAgICAgICAgICAgICA6ICJJIihwcm90IyNf
U1ZQQk1UID4+IEFMVF9TVlBCTVRfU0hJRlQpLCAgICAgICAgICAgICAgIFwKICAgICAgICAgICAg
ICAgICAgIkkiKHByb3QjI19USEVBRCA+PiBBTFRfVEhFQURfUEJNVF9TSElGVCksICAgICAgICAg
ICAgXAogICAgICAgICAgICAgICAgICAiSSIoQUxUX1NWUEJNVF9TSElGVCksICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICBcCiAgICAgICAgICAgICAgICAgICJJIihBTFRfVEhFQURfUEJN
VF9TSElGVCkpCgpTbyBDT05GSUdfRVJSQVRBX1RIRUFEX1BCTVQgaXMgbm90IGNsZWFuIGFzIHlv
dSB0aGluaywgY29tcGlsZXIgc3RpbGwKcHJvY2VzcyB0aGUgICJJIihwcm90IyNfVEhFQUQgPj4g
QUxUX1RIRUFEX1BCTVRfU0hJRlQpIiAmCiJJIihBTFRfVEhFQURfUEJNVF9TSElGVCkuCgo+Cj4g
U28gd2hlbiBDT05GSUdfRVJSQVRBX1RIRUFEX1BCTVQgaXMgZGlzYWJsZWQgdGhlIHdob2xlIGFs
dGVybmF0aXZlCj4gcGFydCBuZXZlciBnZXRzIGFkZGVkIGFscmVhZHksIHNvIHRoZXJlIHNob3Vs
ZG4ndCBiZSBhbnkgbmVlZCB0byBtYWtlIHRoZQo+IHNvdXJjZSBtb3JlIGNvbXBsaWNhdGVkLgo+
Cj4KPiBIZWlrbwo+Cj4gPiAgI2RlZmluZSBBTFRfVEhFQURfUEJNVF9TSElGVCA1OQo+ID4gICNk
ZWZpbmUgQUxUX1NWUEJNVChfdmFsLCBwcm90KSAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgXAo+ID4gIGFzbShBTFRFUk5BVElWRV8yKCJsaSAlMCwgMFx0XG5u
b3AiLCAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFwKPiA+IEBAIC02MCw3ICs2Miw2
IEBAIGFzbShBTFRFUk5BVElWRV8yKCJsaSAlMCwgMFx0XG5ub3AiLCAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICBcCj4gPiAgICAgICAgICAgICAgICAgIkkiKEFMVF9TVlBC
TVRfU0hJRlQpLCAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgXAo+ID4gICAgICAgICAg
ICAgICAgICJJIihBTFRfVEhFQURfUEJNVF9TSElGVCkpCj4gPgo+ID4gLSNpZmRlZiBDT05GSUdf
RVJSQVRBX1RIRUFEX1BCTVQKPiA+ICAvKgo+ID4gICAqIElPL05PQ0FDSEUgbWVtb3J5IHR5cGVz
IGFyZSBoYW5kbGVkIHRvZ2V0aGVyIHdpdGggc3ZwYm10LAo+ID4gICAqIHNvIG9uIFQtSGVhZCBj
aGlwcywgY2hlY2sgaWYgbm8gb3RoZXIgbWVtb3J5IHR5cGUgaXMgc2V0LAo+ID4gQEAgLTkwLDYg
KzkxLDE0IEBAIGFzbSB2b2xhdGlsZShBTFRFUk5BVElWRSggICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICBcCj4gPiAgICAgICAgICJJIihBTFRfVEhFQURfUEJNVF9TSElG
VCkgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgXAo+ID4gICAgICAgOiAidDMi
KQo+ID4gICNlbHNlCj4gPiArI2RlZmluZSBBTFRfU1ZQQk1UKF92YWwsIHByb3QpICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBcCj4gPiArYXNtKEFMVEVSTkFU
SVZFKCJsaSAlMCwgMFx0XG5ub3AiLCAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
XAo+ID4gKyAgICAgICAgICAgICAgImxpICUwLCAlMVx0XG5zbGxpICUwLCUwLCUyIiwgMCwgICAg
ICAgICAgICAgICAgICAgICAgIFwKPiA+ICsgICAgICAgICAgICAgICAgICAgICBDUFVGRUFUVVJF
X1NWUEJNVCwgQ09ORklHX1JJU0NWX0lTQV9TVlBCTVQpICAgICBcCj4gPiArICAgICAgICAgICAg
IDogIj1yIihfdmFsKSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
XAo+ID4gKyAgICAgICAgICAgICA6ICJJIihwcm90IyNfU1ZQQk1UID4+IEFMVF9TVlBCTVRfU0hJ
RlQpLCAgICAgICAgICAgICAgIFwKPiA+ICsgICAgICAgICAgICAgICAiSSIoQUxUX1NWUEJNVF9T
SElGVCkpCj4gPiArCj4gPiAgI2RlZmluZSBBTFRfVEhFQURfUE1BKF92YWwpCj4gPiAgI2VuZGlm
Cj4gPgo+ID4KPgo+Cj4KPgoKCi0tIApCZXN0IFJlZ2FyZHMKIEd1byBSZW4KCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcg
bGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRl
YWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
