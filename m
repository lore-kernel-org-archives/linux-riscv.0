Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 877A3C3064D
	for <linux-riscv@archiver.kernel.org>; Tue, 25 Jun 2024 03:56:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pdiItRe0ThQRp9b3yAJKAOWaoZMz8OEm/HJkuE+Omfo=; b=PgVcpY7tCf08f8
	WviUXk+BNF+dpcQkzZMbr2oj7O/INav/e3Auy/vbqmRgSUZhskteFM80jIY+gh8KCEgQRHMXaHTLk
	SPreZFsySsw1a3VWh/a8745kZt9fxe8eZfGP0aPCmzcqS7a7DyDoWQiPWbRJfzM31PpQ+XVx2wwoN
	+zYeWYWTJOxATlYOqWr1dLt2xp2zSIuxrJ/XTsY5HS9HgpPT69Iv2yRnTNhKTSlmGA2xn40gGzj2y
	X7nlt4pLETZOdeBpN3aeTxhZsDUMmFd4anC4eFFJLpUmY5+ARcNIzAEdhQdJtzihDu7BPzjZgi3bw
	VA6L2C64EvC5SIzNBulA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sLxHe-00000001Vot-0lYV;
	Tue, 25 Jun 2024 03:55:54 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sLxHb-00000001Vo4-0bEm
	for linux-riscv@lists.infradead.org;
	Tue, 25 Jun 2024 03:55:53 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 84929CE17BE
	for <linux-riscv@lists.infradead.org>; Tue, 25 Jun 2024 03:55:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3D620C4AF11
	for <linux-riscv@lists.infradead.org>; Tue, 25 Jun 2024 03:55:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719287747;
	bh=cQaTKnbbQKLHRvFAP0Ke1Gk/g4E7YkyDRfUGaWmHRtE=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=CtN0VewRu6rSd7ETBhqeZb9oIsW9ianhZG2gpxnYGznwuXP6NtkFzCg5rxnrb2g/B
	 pJrKZLJD/VQ0nTodyJ9MpaCAh0W4ks3FJH8NXNvWMcTaN9btIhwfGA1UUR3cPYZcMp
	 g3c2CcGNzpHMqNc7Vgdu83ca8t4kcXR6xn1Va9kde3fhATTwrJcAAWrrSGJmWayEdk
	 NBw58IY6QicXI3wst7P/9PdWdNa7Za8w9sq1yXGWxgxTSwTYdZn3rERWGDB2XYrcRq
	 HiOmCArbD1ig07LK8oX6/wOd7p9wvNX+NtNQslosF0Odp95WOaJOwAlK4NxjqoYDrn
	 dC4OyGwAjuLnA==
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-a62ef52e837so611791366b.3
        for <linux-riscv@lists.infradead.org>; Mon, 24 Jun 2024 20:55:47 -0700 (PDT)
X-Gm-Message-State: AOJu0YxZ65GKWp9P+UugpQAlW4xPy99FSZVLqQH0tsTrx5oBMXOVx/bp
	capSx9PHOij00gK5P2QOngkitIAk84JTuGGeWxMrHFAf394ja8rlyBNCnyuqv0Y2jr4uWzIK1Rb
	UytstczIWNYKJeiX3zwu4XLeGucs=
X-Google-Smtp-Source: AGHT+IFpMrmDvhxYYpFAqoCj+v/ziYjdVaIIAkZShbx9udkdSPZQ9vpFAE6n7C6kUJa0fixtVlDWWvqsRB4url4vpsw=
X-Received: by 2002:a17:906:bcf3:b0:a6e:fb9b:6769 with SMTP id
 a640c23a62f3a-a7242d2ac25mr496698666b.75.1719287745662; Mon, 24 Jun 2024
 20:55:45 -0700 (PDT)
MIME-Version: 1.0
References: <tencent_22BA0425B4DF1CA1713B62E4423C1BFBF809@qq.com>
 <20240410-unwoven-march-299a9499f5f4@spud> <20240619-hammock-drum-04bfc16a8ef6@spud>
 <CAJF2gTRYpDLij1aQoftz6ZqEgXDrfhNA39KiFVrwm7qc4WH6Fg@mail.gmail.com> <20240623-graveyard-consonant-97eff0f11808@spud>
In-Reply-To: <20240623-graveyard-consonant-97eff0f11808@spud>
From: Guo Ren <guoren@kernel.org>
Date: Tue, 25 Jun 2024 11:55:32 +0800
X-Gmail-Original-Message-ID: <CAJF2gTS_KkQjyQPubc2+naYiammLjN8jJyptGtCe8Z56MAmT2A@mail.gmail.com>
Message-ID: <CAJF2gTS_KkQjyQPubc2+naYiammLjN8jJyptGtCe8Z56MAmT2A@mail.gmail.com>
Subject: Re: (subset) [PATCH RESEND v8 0/6] riscv: add initial support for
 Canaan Kendryte K230
To: Conor Dooley <conor@kernel.org>
Cc: linux-riscv@lists.infradead.org, Yangyu Chen <cyy@cyyself.name>, 
	Conor Dooley <conor.dooley@microchip.com>, Damien Le Moal <dlemoal@kernel.org>, 
	Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	Dan Carpenter <dan.carpenter@linaro.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240624_205551_649326_38C4EB42 
X-CRM114-Status: GOOD (  30.56  )
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

T24gTW9uLCBKdW4gMjQsIDIwMjQgYXQgMTozMuKAr0FNIENvbm9yIERvb2xleSA8Y29ub3JAa2Vy
bmVsLm9yZz4gd3JvdGU6Cj4KPiBPbiBNb24sIEp1biAyNCwgMjAyNCBhdCAwMTowNzo1NUFNICsw
ODAwLCBHdW8gUmVuIHdyb3RlOgo+ID4gT24gV2VkLCBKdW4gMTksIDIwMjQgYXQgNjo0NeKAr1BN
IENvbm9yIERvb2xleSA8Y29ub3JAa2VybmVsLm9yZz4gd3JvdGU6Cj4gPiA+Cj4gPiA+IE9uIFdl
ZCwgQXByIDEwLCAyMDI0IGF0IDExOjMwOjI1QU0gKzAxMDAsIENvbm9yIERvb2xleSB3cm90ZToK
PiA+ID4gPiBGcm9tOiBDb25vciBEb29sZXkgPGNvbm9yLmRvb2xleUBtaWNyb2NoaXAuY29tPgo+
ID4gPiA+Cj4gPiA+ID4gT24gTW9uLCAwOCBBcHIgMjAyNCAwMDoyNjo1OCArMDgwMCwgWWFuZ3l1
IENoZW4gd3JvdGU6Cj4gPiA+ID4gPiBLMjMwIGlzIGFuIGlkZWFsIGNoaXAgZm9yIFJJU0MtViBW
ZWN0b3IgMS4wIGV2YWx1YXRpb24gbm93LiBBZGQgaW5pdGlhbAo+ID4gPiA+ID4gc3VwcG9ydCBm
b3IgaXQgdG8gYWxsb3cgbW9yZSBwZW9wbGUgdG8gcGFydGljaXBhdGUgaW4gYnVpbGRpbmcgZHJp
dmVycwo+ID4gPiA+ID4gdG8gbWFpbmxpbmUgZm9yIGl0Lgo+ID4gPiA+ID4KPiA+ID4gPiA+IFRo
aXMga2VybmVsIGhhcyBiZWVuIHRlc3RlZCB1cG9uIGZhY3RvcnkgU0RLIFsxXSB3aXRoCj4gPiA+
ID4gPiBrMjMwX2V2Yl9vbmx5X2xpbnV4X2RlZmNvbmZpZyBhbmQgcGF0Y2hlZCBtYWlubGluZSBv
cGVuc2JpIFsyXSB0byBza2lwCj4gPiA+ID4gPiBsb2NrZWQgcG1wIGFuZCBzdWNjZXNzZnVsbHkg
Ym9vdGVkIHRvIGJ1c3lib3ggb24gaW5pdHJkIHdpdGggdGhpcyBsb2cgWzNdLgo+ID4gPiA+ID4K
PiA+ID4gPiA+IFsuLi5dCj4gPiA+ID4KPiA+ID4gPiBBcHBsaWVkIHRvIHJpc2N2LWR0LWZvci1u
ZXh0LCB0aGFua3MhCj4gPiA+ID4KPiA+ID4gPiBbMS82XSBkdC1iaW5kaW5nczogcmlzY3Y6IEFk
ZCBULUhFQUQgQzkwOCBjb21wYXRpYmxlCj4gPiA+ID4gICAgICAgaHR0cHM6Ly9naXQua2VybmVs
Lm9yZy9jb25vci9jLzY0Y2JjNDZiYjg1NAo+ID4gPiA+IFsyLzZdIGR0LWJpbmRpbmdzOiBhZGQg
Q2FuYWFuIEsyMzAgYm9hcmRzIGNvbXBhdGlibGUgc3RyaW5ncwo+ID4gPiA+ICAgICAgIGh0dHBz
Oi8vZ2l0Lmtlcm5lbC5vcmcvY29ub3IvYy9iMDY1ZGExM2VhOWMKPiA+ID4gPiBbMy82XSBkdC1i
aW5kaW5nczogdGltZXI6IEFkZCBDYW5hYW4gSzIzMCBDTElOVAo+ID4gPiA+ICAgICAgIGh0dHBz
Oi8vZ2l0Lmtlcm5lbC5vcmcvY29ub3IvYy9iM2FlNzk2ZDBhNGYKPiA+ID4gPiBbNC82XSBkdC1i
aW5kaW5nczogaW50ZXJydXB0LWNvbnRyb2xsZXI6IEFkZCBDYW5hYW4gSzIzMCBQTElDCj4gPiA+
ID4gICAgICAgaHR0cHM6Ly9naXQua2VybmVsLm9yZy9jb25vci9jL2RiNTRmZGExMWIxMwo+ID4g
PiA+IFs1LzZdIHJpc2N2OiBkdHM6IGFkZCBpbml0aWFsIGNhbm12LWsyMzAgYW5kIGsyMzAtZXZi
IGR0cwo+ID4gPiA+ICAgICAgIGh0dHBzOi8vZ2l0Lmtlcm5lbC5vcmcvY29ub3IvYy81ZGIyYzRk
YzQxM2UKPiA+ID4KPiA+ID4gQWZ0ZXIgc29tZSBkaXNjdXNzaW9uIG9uIHRoZSBrMSB0aHJlYWQK
PiA+ID4gKGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2FsbC9abkVPVTdEMDBKOEp6eS0xQHhoYWNr
ZXIvLCBodHRwczovL2xvcmUua2VybmVsLm9yZy9hbGwvWm5BNnBaTGtJMlN0UDhIaEB4aGFja2Vy
LykKPiA+ID4gSSBhbSBnb2luZyB0byBkcm9wIHRoaXMgc2VyaWVzLiBJdCdzIG5vdCB2ZXJ5IHVz
ZWZ1bCBpbiB0aGUgY3VycmVudAo+ID4gPiBzdGF0ZSBhbmQgdGhlcmUncyBub3QgcmVhbGx5IGJl
ZW4gYW55IGludGVyZXN0IGZyb20gcGVvcGxlIGluIGdldHRpbmcKPiA+ID4gdGhlIHBsYXRmb3Jt
IHRvIGEgbW9yZSBjb21wbGV0ZSBzdGF0ZS4gSmlzaGVuZyBtYWRlIHNvbWUgZ29vZCBwb2ludHMg
aW4KPiA+ID4gdGhlIGsxIHRocmVhZCBhYm91dCB0aGUgbWlzc2luZyBjbG9jayBjb250cm9sbGVy
IHN0dWZmLCBhbmQgSSB0aGluayBJJ20KPiA+ID4gZ29pbmcgdG8gbWFrZSBoYXZpbmcgYmFzaWMg
dGhpbmdzIGxpa2UgY2xvY2tzIGFuZCB3aGVyZSBhcHBsaWNhYmxlCj4gPiA+IHJlc2V0cyBhbmQg
cGluY3RybCB0aGUgbWluaW11bSByZXF1aXJlbWVudCBmb3IgdGhlIHBsYXRmb3JtcyBJJ20gbG9v
a2luZwo+ID4gPiBhZnRlci4KPiA+IEhlcmUgaXMgdGhlIGsyMzAgY2xvY2sgZHJpdmVyIGJhc2Vk
IG9uIExpbnV4LTYuNjoKPiA+IGh0dHBzOi8vZ2l0aHViLmNvbS9ydXlpc2RrL2xpbnV4LXh1YW50
aWUta2VybmVsL2NvbW1pdC8xOTYyNDJmZDliOWI0YTE5MWRhYjBjN2MzYzViZjg1MWVkODU3ZDhk
Cj4gPgo+ID4gcGluY3RybDoKPiA+IGh0dHBzOi8vZ2l0aHViLmNvbS9ydXlpc2RrL2xpbnV4LXh1
YW50aWUta2VybmVsL2NvbW1pdC9iYWYyNmI2NjIyYzlkZTJmZjY0YTZlZDU4ZWVlYjk4YzhiMmM4
MjhiCj4gPgo+ID4gTm8gcmVzZXQgZHJpdmVyLgo+ID4KPiA+IE1vc3Qgb2YgdGhlIGsyMzAgZHJp
dmVycyBhcmUgdW5kZXIgTGludXgtNS4xMCwgYW5kIHdlIGFyZSBwb3J0aW5nIHRoZW0KPiA+IGlu
dG8gdGhlIG5ld2VzdCB2ZXJzaW9uIG9mIExpbnV4LCB3aGljaCB0YWtlcyB0aW1lLgo+ID4KPiA+
IFNvLCBpZiB0aGUgY2xvY2sgJiBwdW5jdHVhbCBkcml2ZXJzIG1lbnRpb25lZCBhYm92ZSBjb3Vs
ZCBzYXRpc2Z5IHRoZQo+ID4gbWluaW11bSByZXF1aXJlbWVudHMgZm9yIHRoZSBwbGF0Zm9ybXMs
IHdlIHdpbGwgdXBkYXRlIHRoZSB2ZXJzaW9uIG9mCj4gPiB0aGlzIHNlcmllcyBhcyBhIHN1cHBs
ZW1lbnQuCj4gPgo+ID4gSXMgdGhhdCBva2F5Pwo+Cj4gSSBkb24ndCB1bmRlcnN0YW5kIGhvdyB0
aGF0IGNoYW5nZXMgYW55dGhpbmcsIHRoZXNlIGFyZSBhbGwgb3V0IG9mIHRyZWUKPiBkcml2ZXJz
IGJhc2VkIG9uIGFuIG9sZCBrZXJuZWwuIEkga25vdyB0aGF0IHRoZXJlIGFyZSBkcml2ZXJzIGZv
ciBhIGxvdAo+IG9mIHRoZSBwZXJpcGhlcmFscyB0aGF0IGFyZSBpbi11c2UgaW4gdGhlIHZlbmRv
ciB0cmVlIGV0Yy4gV2hhdCBJIGFtCj4gbG9va2luZyB0byBoYXBwZW4sIGJlZm9yZSBJIGFwcGx5
IHBhdGNoZXMgZm9yIHRoZSBrMjMwLCBpcyB0aGF0IHRoZSBjbG9jawo+IGR0LWJpbmRpbmdzIHdp
bGwgaGF2ZSBsYW5kZWQgaW4gbGludXgtbmV4dCAtIGFuZCBpZGVhbGx5IHRoZSBwaW5jdHJsIG9u
ZXMKPiB0b28uCk9rYXksIGNsb2NrICYgcGluY3RybCwgdGhlIHJlcGx5IGlzIGNsZWFyIHRvIG1l
LiBUaHguCgo+Cj4gVGhhbmtzLAo+IENvbm9yLgoKCgotLSAKQmVzdCBSZWdhcmRzCiBHdW8gUmVu
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1y
aXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8v
bGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
