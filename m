Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EDB0FEB64DA
	for <linux-riscv@archiver.kernel.org>; Wed, 19 Jul 2023 06:32:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1k+HXJPQde/zgbEk0HDkK0IiPobGpZlqAejelQkmz4U=; b=tX+FwGmWtueXhs
	88OHHsPE2hj5HdexOfCXcqQfzqbD2zvOV53XgzVmMxfHiftd1Kgkw43UgIDeoab+spmMI9e9HMNQU
	52RyFN6imKBvETk7bnI91rZwteOfOyEOu3VP4L+FvirJKYaL7giWtQD4BrZasA4KRa9N4lee0mTJW
	DNpyKOqsPdP/0UnNN/Zx1hPhzBN77azubgH/rnrJSauDFPk8xx1rWuNeNeuOJRZAJIOMDaZZEWN/h
	R9o8/rZluEsSDXqVnmm68j1biaRAccCujOHp69q8huC0DNIr0JEN17cFaUkWe4Xqhs55nV3j7dei/
	+AQTF3TofVWKty9kmJlw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qM0jC-005lZF-0j;
	Wed, 19 Jul 2023 06:32:02 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qM0jA-005lXu-2a
	for linux-riscv@bombadil.infradead.org;
	Wed, 19 Jul 2023 06:32:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=iNRpIcDd/9dhqKfYNzLog9gZkrwk768RA/IMO9wTf8s=; b=aA+N4yuZmRWgX6iUR1y+J1I0PT
	hxwAAP0fQnFG3sJE+cuxfJCfxTJHK6IH5sIgUcjsYlQzqR5S9Ji3dY+5HapERnIbEOAAMLdRpWoCZ
	9BZHWfHQYYWj6fliro+YdNd+Dmm96MYtOdUku/TDcmgZkWFHTMlsQmZEgRGUSA43jP1AYyEk1dCyu
	umHm63XBFr/3yXFUNL8OyCgZdMDa/sv7hgNYcA9iakccAqCWMcmTGAXLx1YTgjb5xTrcE/VJ0/eTm
	lrAwZ4Ktcz6JwVHqVdTrmaw5Hib+d4fHc3TOXJd6Dcgoi3LUkoQqURJ7fZyuJNIMK3k/vscU2dB6o
	KjjvHOPQ==;
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qLuJU-00CEy1-2f
	for linux-riscv@lists.infradead.org;
	Tue, 18 Jul 2023 23:41:12 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 516CB61519
	for <linux-riscv@lists.infradead.org>; Tue, 18 Jul 2023 23:41:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B1477C433CC
	for <linux-riscv@lists.infradead.org>; Tue, 18 Jul 2023 23:40:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1689723659;
	bh=DRh2FHZCzUx96KLTXcTCK0u1TO+iirQ1LzrX8lftc1E=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=d8TRYo6DvYZ0iN7seeckDNZjYusIFnpLA1F1v+O209G2BEKGF2z1QsIK7R7Ee7k6C
	 wV50snzfO80fItw6pFd0d6PpNbenD202za+AcaZkyXupCRmeMTpCtotVHoI/osrE4p
	 gnfOjU/IwzR74mInqSdVOrCnHm8YTFFjV/TEH7RCTnSSDj0MBTgOmMzDD9AMJUM7aG
	 HZocnnM4uK4yscLH6XXexohygWbtlOcYYkOdXKTLFEN6z+gwE6csBiUqTP88oIFVDB
	 KMiW5HK+xHQZNlmfmW8R6a7UNQVGAMgqu7vevk3BNG8EONZQ6jY4PzJ6RPZHqKQI5/
	 RbEsCr8OIl0uw==
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-4fdd31bf179so1013103e87.2
        for <linux-riscv@lists.infradead.org>; Tue, 18 Jul 2023 16:40:59 -0700 (PDT)
X-Gm-Message-State: ABy/qLau/vwgA82INMR8c1fCaz4ZqbNu8jgD28Fki8aBtR2Y0SQn0FA4
	IU5Umu0t7UXF2p5niWsU/R4St0hZzZPMCTVsw5Y=
X-Google-Smtp-Source: APBJJlEImN9uPdbo58WUltonLKZ018auQOFm5qSKBq4+c7OS2ZWjghv07EZij1SX+ehsOn6+kGBHQuLLandLCPb9JJA=
X-Received: by 2002:a05:6512:3414:b0:4fb:7b2a:78de with SMTP id
 i20-20020a056512341400b004fb7b2a78demr852126lfr.45.1689723657633; Tue, 18 Jul
 2023 16:40:57 -0700 (PDT)
MIME-Version: 1.0
References: <20230718210037.250665-1-CoelacanthusHex@gmail.com>
In-Reply-To: <20230718210037.250665-1-CoelacanthusHex@gmail.com>
From: Guo Ren <guoren@kernel.org>
Date: Wed, 19 Jul 2023 07:40:45 +0800
X-Gmail-Original-Message-ID: <CAJF2gTRf0UOYhqwUm6=1YMvZt8q_72WRUHqN=L+nOWaipL+H1Q@mail.gmail.com>
Message-ID: <CAJF2gTRf0UOYhqwUm6=1YMvZt8q_72WRUHqN=L+nOWaipL+H1Q@mail.gmail.com>
Subject: Re: [PATCH v3] riscv: entry: set a0 = -ENOSYS only when syscall != -1
To: Celeste Liu <coelacanthushex@gmail.com>, Huacai Chen <chenhuacai@kernel.org>
Cc: Palmer Dabbelt <palmer@rivosinc.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@rivosinc.com>, 
	Conor Dooley <conor.dooley@microchip.com>, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Felix Yan <felixonmars@archlinux.org>, 
	Ruizhe Pan <c141028@gmail.com>, Shiqi Zhang <shiqi@isrc.iscas.ac.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230719_004110_622275_21E2F619 
X-CRM114-Status: GOOD (  22.51  )
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

T24gV2VkLCBKdWwgMTksIDIwMjMgYXQgNTowMeKAr0FNIENlbGVzdGUgTGl1IDxjb2VsYWNhbnRo
dXNoZXhAZ21haWwuY29tPiB3cm90ZToKPgo+IFdoZW4gd2UgdGVzdCBzZWNjb21wIHdpdGggNi40
IGtlcm5lbCwgd2UgZm91bmQgZXJybm8gaGFzIHdyb25nIHZhbHVlLgo+IElmIHdlIGRlbnkgTkVU
TElOS19BVURJVCB3aXRoIEVBRk5PU1VQUE9SVCwgYWZ0ZXIgZjBiZGRmNTA1ODZkLCB3ZSB3aWxs
Cj4gZ2V0IEVOT1NZUyBpbnN0ZWFkLiBXZSBnb3Qgc2FtZSByZXN1bHQgd2l0aCBjb21taXQgOWMy
NTk4ZDQzNTEwICgicmlzY3Y6IGVudHJ5Ogo+IFNhdmUgYTAgcHJpb3Igc3lzY2FsbF9lbnRlcl9m
cm9tX3VzZXJfbW9kZSgpIikuCj4KPiBBZnRlciBhbmFseXNpbmcgY29kZSwgd2UgdGhpbmsgdGhh
dCByZWdzLT5hMCA9IC1FTk9TWVMgc2hvdWxkIG9ubHkgYmUgZXhlY3V0ZWQKPiB3aGVuIHN5c2Nh
bGwgIT0gLTEgSW4gX19zZWNjb21wX2ZpbHRlciwgd2hlbiBzZWNjb21wIHJlamVjdGVkIHRoaXMg
c3lzY2FsbCB3aXRoCj4gc3BlY2lmaWVkIGVycm5vLCB0aGV5IHdpbGwgc2V0IGEwIHRvIHJldHVy
biBudW1iZXIgYXMgc3lzY2FsbCBBQkksIGFuZCB0aGVuCj4gcmV0dXJuIC0xLiBUaGlzIHJldHVy
biBudW1iZXIgaXMgZmluYWxseSBwYXNzIGFzIHJldHVybiBudW1iZXIgb2YKPiBzeXNjYWxsX2Vu
dGVyX2Zyb21fdXNlcl9tb2RlLCBhbmQgdGhlbiBpcyBjb21wYXJlZCB3aXRoIE5SX3N5c2NhbGxz
IGFmdGVyCj4gY29udmVydGVkIHRvIHVsb25nIChzbyBpdCB3aWxsIGJlIFVMT05HX01BWCkuIFRo
ZSBjb25kaXRpb24KPiBzeXNjYWxsIDwgTlJfc3lzY2FsbHMgd2lsbCBhbHdheXMgYmUgZmFsc2Us
IHNvIHJlZ3MtPmEwID0gLUVOT1NZUyBpcyBhbHdheXMKPiBleGVjdXRlZC4gSXQgY292ZXJlZCBh
MCBzZXQgYnkgc2VjY29tcCwgc28gd2UgYWx3YXlzIGdldCBFTk9TWVMgd2hlbiBtYXRjaAo+IHNl
Y2NvbXAgUkVUX0VSUk5PIHJ1bGUuCj4KPiBGaXhlczogZjBiZGRmNTA1ODZkICgicmlzY3Y6IGVu
dHJ5OiBDb252ZXJ0IHRvIGdlbmVyaWMgZW50cnkiKQo+IFJlcG9ydGVkLWJ5OiBGZWxpeCBZYW4g
PGZlbGl4b25tYXJzQGFyY2hsaW51eC5vcmc+Cj4gQ28tZGV2ZWxvcGVkLWJ5OiBSdWl6aGUgUGFu
IDxjMTQxMDI4QGdtYWlsLmNvbT4KPiBTaWduZWQtb2ZmLWJ5OiBSdWl6aGUgUGFuIDxjMTQxMDI4
QGdtYWlsLmNvbT4KPiBDby1kZXZlbG9wZWQtYnk6IFNoaXFpIFpoYW5nIDxzaGlxaUBpc3JjLmlz
Y2FzLmFjLmNuPgo+IFNpZ25lZC1vZmYtYnk6IFNoaXFpIFpoYW5nIDxzaGlxaUBpc3JjLmlzY2Fz
LmFjLmNuPgo+IFNpZ25lZC1vZmYtYnk6IENlbGVzdGUgTGl1IDxDb2VsYWNhbnRodXNIZXhAZ21h
aWwuY29tPgo+IFRlc3RlZC1ieTogRmVsaXggWWFuIDxmZWxpeG9ubWFyc0BhcmNobGludXgub3Jn
Pgo+IC0tLQo+Cj4gdjIgLT4gdjM6IHVzZSBpZi1zdGF0ZW1lbnQgaW5zdGVhZCBvZiBzZXQgZGVm
YXVsdCB2YWx1ZSwKPiAgICAgICAgICAgY2xhcmlmeSB0aGUgdHlwZSBvZiBzeXNjYWxsCj4gdjEg
LT4gdjI6IGFkZGVkIGV4cGxhbmF0aW9uIG9uIHdoeSBhbHdheXMgZ290IEVOT1NZUwo+Cj4gIGFy
Y2gvcmlzY3Yva2VybmVsL3RyYXBzLmMgfCA2ICsrKysrLQo+ICAxIGZpbGUgY2hhbmdlZCwgNSBp
bnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCj4KPiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9r
ZXJuZWwvdHJhcHMuYyBiL2FyY2gvcmlzY3Yva2VybmVsL3RyYXBzLmMKPiBpbmRleCBmOTEwZGZj
Y2JmNWQyLi41Y2VmNzI4NzQ1NDIwIDEwMDY0NAo+IC0tLSBhL2FyY2gvcmlzY3Yva2VybmVsL3Ry
YXBzLmMKPiArKysgYi9hcmNoL3Jpc2N2L2tlcm5lbC90cmFwcy5jCj4gQEAgLTI5Nyw2ICsyOTcs
MTAgQEAgYXNtbGlua2FnZSBfX3Zpc2libGUgX190cmFwX3NlY3Rpb24gdm9pZCBkb190cmFwX2Jy
ZWFrKHN0cnVjdCBwdF9yZWdzICpyZWdzKQo+ICBhc21saW5rYWdlIF9fdmlzaWJsZSBfX3RyYXBf
c2VjdGlvbiB2b2lkIGRvX3RyYXBfZWNhbGxfdShzdHJ1Y3QgcHRfcmVncyAqcmVncykKPiAgewo+
ICAgICAgICAgaWYgKHVzZXJfbW9kZShyZWdzKSkgewo+ICsgICAgICAgICAgICAgICAvKgo+ICsg
ICAgICAgICAgICAgICAgKiBDb252ZXJ0IG5lZ2F0aXZlIG51bWJlcnMgdG8gdmVyeSBoaWdoIGFu
ZCB0aHVzIG91dCBvZiByYW5nZQo+ICsgICAgICAgICAgICAgICAgKiBudW1iZXJzIGZvciBjb21w
YXJpc29ucy4KPiArICAgICAgICAgICAgICAgICovCj4gICAgICAgICAgICAgICAgIHVsb25nIHN5
c2NhbGwgPSByZWdzLT5hNzsKPgo+ICAgICAgICAgICAgICAgICByZWdzLT5lcGMgKz0gNDsKPiBA
QCAtMzA4LDcgKzMxMiw3IEBAIGFzbWxpbmthZ2UgX192aXNpYmxlIF9fdHJhcF9zZWN0aW9uIHZv
aWQgZG9fdHJhcF9lY2FsbF91KHN0cnVjdCBwdF9yZWdzICpyZWdzKQo+Cj4gICAgICAgICAgICAg
ICAgIGlmIChzeXNjYWxsIDwgTlJfc3lzY2FsbHMpCj4gICAgICAgICAgICAgICAgICAgICAgICAg
c3lzY2FsbF9oYW5kbGVyKHJlZ3MsIHN5c2NhbGwpOwo+IC0gICAgICAgICAgICAgICBlbHNlCj4g
KyAgICAgICAgICAgICAgIGVsc2UgaWYgKChsb25nKXN5c2NhbGwgIT0gLTFMKQpNYXliZSB3ZSBz
aG91bGQgZGVmaW5lIGFuIGV4cGxpY2l0IG1hY3JvIGZvciB0aGlzIEVSUk5PIGluCl9fc2VjY29t
cF9maWx0ZXIsIGFuZCB0aGlzIHN0eWxlIG9iZXlzIHRoZSBjb2RpbmcgY29udmVudGlvbi4KCkZv
ciB0aGlzIHBhdGNoOgpSZXZpZXdlZC1ieTogR3VvIFJlbiA8Z3VvcmVuQGtlcm5lbC5vcmc+CgpD
YzogbG9vbmdhcmNoIGd1eSwgcGxlYXNlIGNoZWNrIGxvb25nYXJjaCdzIGNvZGUuIDopCgo+ICAg
ICAgICAgICAgICAgICAgICAgICAgIHJlZ3MtPmEwID0gLUVOT1NZUzsKPgo+ICAgICAgICAgICAg
ICAgICBzeXNjYWxsX2V4aXRfdG9fdXNlcl9tb2RlKHJlZ3MpOwo+IC0tCj4gMi40MS4wCj4KCgot
LSAKQmVzdCBSZWdhcmRzCiBHdW8gUmVuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlz
dHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2xpbnV4LXJpc2N2Cg==
