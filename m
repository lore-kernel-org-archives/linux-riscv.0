Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CADCDD6CFA6
	for <linux-riscv@archiver.kernel.org>; Thu, 22 Jan 2026 22:10:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WUWRRv7b/4NKfTJ2m9J8Lf7oSzeanQumQPqDD9dinK8=; b=tQ1LUP8lmvKPw/
	zRdFDHI7HzQBJuHP4kQ4RuQl4kcZpeqNgQnhZpwFAY75Lr/lw6r2MJfFuoMS9aFwB9Xctnri3BopM
	PpuhDF6IgjxYYnCgfNJyXwJx5j9A+xu1zPNaEW6qTINWWzh5op5KIZSwZSn0woeqW8buT88h+eluT
	kqf4B4wzEmfUzZu/ZF6C0THAC367LJwwDv75e8f8wN0jRAg3+pvMPOEOTpiuZEnAx+sZyh1E/8EYR
	EmEqQ415YF0okVGvdVlDoq/Tax5ZVXQvx0jOTPaiH6dA/SI1E6KDB3X7zGRCzxz9PodcN9Io7FSA/
	7NFPG939aY5RuVPImyDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vj2rp-00000007pfi-0p8U;
	Thu, 22 Jan 2026 22:09:29 +0000
Received: from woodpecker.gentoo.org ([140.211.166.183] helo=smtp.gentoo.org)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vj2rm-00000007pfJ-0Wah
	for linux-riscv@lists.infradead.org;
	Thu, 22 Jan 2026 22:09:27 +0000
Received: from localhost (unknown [116.232.27.242])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dlan)
	by smtp.gentoo.org (Postfix) with ESMTPSA id 33B77340F21;
	Thu, 22 Jan 2026 22:09:22 +0000 (UTC)
Date: Fri, 23 Jan 2026 06:09:18 +0800
From: Yixun Lan <dlan@gentoo.org>
To: Guodong Xu <guodong@riscstar.com>
Cc: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
	Alex Elder <elder@riscstar.com>, Lee Jones <lee@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Troy Mitchell <troy.mitchell@linux.spacemit.com>,
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev, devicetree@vger.kernel.org
Subject: Re: [PATCH 0/4] regulator: spacemit-p1: Fix voltage ranges and
 support board power tree
Message-ID: <20260122220918-GYA69249@gentoo.org>
References: <20260122-spacemit-p1-v1-0-309be27fbff9@riscstar.com>
 <20260122101122-GYA63789@gentoo.org>
 <77bc5a5f-666d-4beb-ab78-99a242d72a39@sirena.org.uk>
 <20260122121223-GYC63789@gentoo.org>
 <CAH1PCMaRqXHBZQLY02DY=C1rorMc2DZzzE2ziADofWoAQW8Mzg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAH1PCMaRqXHBZQLY02DY=C1rorMc2DZzzE2ziADofWoAQW8Mzg@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260122_140926_185739_2B172E21 
X-CRM114-Status: GOOD (  17.33  )
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

SGkgR3VvZG9uZywKCk9uIDIyOjU1IFRodSAyMiBKYW4gICAgICwgR3VvZG9uZyBYdSB3cm90ZToK
PiBPbiBUaHUsIEphbiAyMiwgMjAyNiBhdCA4OjEy4oCvUE0gWWl4dW4gTGFuIDxkbGFuQGdlbnRv
by5vcmc+IHdyb3RlOgo+ID4KPiA+IEhpIE1hcmssCj4gPgo+ID4gT24gMTE6MjcgVGh1IDIyIEph
biAgICAgLCBNYXJrIEJyb3duIHdyb3RlOgo+ID4gPiBPbiBUaHUsIEphbiAyMiwgMjAyNiBhdCAw
NjoxMToyMlBNICswODAwLCBZaXh1biBMYW4gd3JvdGU6Cj4gPiA+ID4gT24gMTc6NDMgVGh1IDIy
IEphbiAgICAgLCBHdW9kb25nIFh1IHdyb3RlOgo+ID4gPgo+ID4gPiA+ID4gUGF0Y2ggMSwgbl92
b2x0YWdlcyBpcyBjb3JyZWN0ZWQgdG8gbWF0Y2ggaGFyZHdhcmUgcmVnaXN0ZXIgd2lkdGhzLCBh
cyB0aGUKPiA+ID4gPiA+IHByZXZpb3VzIHZhbHVlcyBwcmV2ZW50ZWQgcmVndWxhdG9ycyBmcm9t
IHJlYWNoaW5nIGhpZ2hlciBvcGVyYXRpb25hbAo+ID4gPiA+ID4gdm9sdGFnZXMgKGUuZy4sIDMu
M1Ygb24gTERPcykuCj4gPiA+Cj4gPiA+ID4gVGhpcyBwYXRjaCBicmluZyBzeXN0ZW0td2lkZSBj
aGFuZ2UgdGhhdCBub3Qgb25seSBhZmZlY3QgQmFuYW5hcGkgRjMuLgo+ID4gPgo+ID4gPiA+IFBs
ZWFzZSBhbHNvIHByb3ZpZGUgZml4IGZvciBvdGhlciBib2FyZHMsIEkgdGhpbmsgeW91IG1heSBu
b3QgYmUgYWJsZQo+ID4gPiA+IHRvIHRlc3QgYWxsIGJvYXJkcywgYnV0IG1ha2Ugc3VyZSB0aGUg
cGF0Y2hlcyBhcmUgYXZhaWxhYmxlLCBzbyBwZW9wbGUKPiA+ID4gPiB3aG8gaW50ZXJlc3RlZCBj
YW4gdGVzdCwgUC5TIEkgY2FuIGhlbHAgb24gbWlsa3YganVwaXRlciBib2FyZAo+ID4gPgo+ID4g
PiBQYXRjaCAxIGxvb2tzIGxpa2UgaXQgc2hvdWxkIGJlIE9LIGFzIGlzPwo+ID4gdGhlbiB3aXRo
IHBhdGNoIDMsIGFuZCBmb3Igb3RoZXIgYm9hcmRzIChtaWxrdiBqdXBpdGVyKSwgc2hvdWxkIGhh
dmUgc2ltaWxhcgo+ID4gRFQgZml4IGFzIHBhdGNoIDQuLgo+IAo+IFRoZXJlIGlzIG5vICJzcGFj
ZW1pdCxwMSIgbm9kZSBpbiBvdGhlciBrMSBib2FyZHMgKG1pbGt2IGp1cGl0ZXIpLgo+IAp5ZXMs
IHRoZXJlIGlzIG9uZSB3aGljaCBhY2NlcHRlZCBkdXJpbmcgdGhpcyBtZXJnZSB3aW5kb3csIGFu
ZCB3aWxsIHNob3cgdXAKaW4gdjYuMjAsIHBsZWFzZSBjaGVjayBzcGFjZW1pdCB0cmVlIFsxXSBv
ciBbMl0KCkxpbms6IGh0dHBzOi8vZ2l0aHViLmNvbS9zcGFjZW1pdC1jb20vbGludXgvdHJlZS9r
MS9kdC1mb3ItbmV4dCBbMV0KTGluazogaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvci8xNzY2MTgw
MTY5NzYuNzY2MzguMTEyMjExMjczNzcwMDc3NTg1NzUuYjQtdHlAZ2VudG9vLm9yZyBbMl0KCi0t
IApZaXh1biBMYW4gKGRsYW4pCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5m
cmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xp
bnV4LXJpc2N2Cg==
