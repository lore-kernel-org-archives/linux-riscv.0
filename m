Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA978C83F07
	for <linux-riscv@archiver.kernel.org>; Mon,  7 Jul 2025 10:24:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kipbjqZdlsX0SodW3R/mN4hDGpqVYBprxcUwFLHpBjg=; b=S+jnlndK9uemfm
	YNhjmCmOkPgLGIw2MkvzBwciQnlqCNrHCtovsBV79Xm0/RpR9B5kBreBzctUhUOiE+OVbaPJFekFu
	nIZjJU95uuKEDv59nXj9i+Hszrf2LbW0p+it8enPyNKJFrnYngOVfC4eQd6N3Rey+diGlyQn5deTH
	sPy0CUOcEHHl1eAcXT+4qY/ZDeQeQws5Zt2aJ23u3vPRI0fpHV6eVelcOmAAQA3RG0uKERWW5/kS4
	wYxLWNAObE7pE5jzw7PvOYa1DlQR76sIdLO79F1UTye8rBO35y8JtxtimzmiMuwUaD9lrJeM0f/jY
	HsJsDy4/A6NSGVBtTkaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYj1a-000000028Ve-2co7;
	Mon, 07 Jul 2025 10:24:38 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYiRK-000000021yu-2WwL
	for linux-riscv@lists.infradead.org;
	Mon, 07 Jul 2025 09:47:11 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1uYiR9-0006Q5-1e; Mon, 07 Jul 2025 11:46:59 +0200
Received: from lupine.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::4e] helo=lupine)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1uYiR6-007E6N-2D;
	Mon, 07 Jul 2025 11:46:56 +0200
Received: from pza by lupine with local (Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1uYiR6-000IDo-1x;
	Mon, 07 Jul 2025 11:46:56 +0200
Message-ID: <3732050b6b756868543012c1a1cebbe7cce74d61.camel@pengutronix.de>
Subject: Re: [GIT PULL] Immutable tag between SpacemiT's reset and clock
 trees for v6.17
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Yixun Lan <dlan@gentoo.org>
Cc: Stephen Boyd <sboyd@kernel.org>, Michael Turquette
 <mturquette@baylibre.com>,  Alex Elder <elder@riscstar.com>,
 linux-clk@vger.kernel.org, spacemit@lists.linux.dev, 
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Date: Mon, 07 Jul 2025 11:46:56 +0200
In-Reply-To: <20250706040646-GYA408198@gentoo>
References: <20250703151823-GYA312602@gentoo>
	 <daf9ddad1aa24ee18abdc11a9b26ef03bdcbae16.camel@pengutronix.de>
	 <20250706040646-GYA408198@gentoo>
User-Agent: Evolution 3.46.4-2 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250707_024710_637656_173ECF5B 
X-CRM114-Status: GOOD (  21.95  )
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

T24gU28sIDIwMjUtMDctMDYgYXQgMDQ6MDYgKzAwMDAsIFlpeHVuIExhbiB3cm90ZToKPiBIaSBQ
aGlsaXBwLAo+IAo+IE9uIDEyOjAyIEZyaSAwNCBKdWwgICAgICwgUGhpbGlwcCBaYWJlbCB3cm90
ZToKPiA+IE9uIERvLCAyMDI1LTA3LTAzIGF0IDE1OjE4ICswMDAwLCBZaXh1biBMYW4gd3JvdGU6
Cj4gPiA+IEhpIFBoaWxpcHAsCj4gPiA+IAo+ID4gPiBQbGVhc2UgcHVsbCB0aGUgZm9sbG93aW5n
IGNoYW5nZSBpbnRvIHRoZSByZXNldCB0cmVlLiBUaGlzCj4gPiA+IGFsbG93cyB5b3UgdG8gYXBw
bHkgdGhlIHBhdGNoIDUgb2YgdGhlIFNwYWNlbWlUIHJlc2V0IGRyaXZlciBbMV0uCj4gPiA+IAo+
ID4gPiBUaGFua3MsCj4gPiA+IFlpeHVuIExhbgo+ID4gPiAKPiA+ID4gTGluazogaHR0cHM6Ly9s
b3JlLmtlcm5lbC5vcmcvci8yMDI1MDcwMjExMzcwOS4yOTE3NDgtNi1lbGRlckByaXNjc3Rhci5j
b20gWzFdCj4gPiAKPiA+IFNvcnJ5IEkgZGlkbid0IG5vdGljZSBiZWZvcmUsIHRoaXMgaXMgbWlz
c2luZyBrMS1zeXNjb24uaCBmcm9tIFBhdGNoIDIuCj4gPiDCoAo+IG5vIHByb2JsZW0KPiAKPiA+
IENhbiB3ZSBnZXQgYSBjbG9jayBtYWludGFpbmVyIGFjayB0byBwbGFjZSBwYXRjaCAyIGluIHRo
ZSBzaGFyZWQgdGFnIGFzCj4gPiB3ZWxsPyBPdGhlcndpc2UgeW91IGNvdWxkIHNwbGl0IHBhdGNo
IDIgaW50byBzb2MgYW5kIGNsayBwYXJ0cy4KPiBmb3IgdGhlIGFjaywgSSdkIGFzc3VtZSBTdGVw
aGVuIGhhdmUgbm8gb2JqZWN0aW9uIChDYyBoaW0gZXhwbGljaXRseSkKPiAKPiB0ZWNobmljYWxs
eSwgdGhlcmUgaXMgbm8gcHJvYmxlbSB0byBwbGFjZSBtb3JlIHBhdGNoZXMgaW4gdGhlIHNoYXJl
ZAo+IHRhZywgc2luY2UgdGhlIHRhZyB3aWxsIGJlIGJvdGggc2VudChieSBtZSkgdG8gY2xvY2sg
YW5kIHJlc2V0IHRyZWUsCj4gc28gbm8gY29uZmxpY3RzIGluIHRoZSBlbmQuCj4gCj4gaWYgeW91
IGV4cGVjdCB0byBhdCBsZWFzdCBwYXNzIGNvbXBpbGluZyB0ZXN0IHdpdGggcGF0Y2ggNSBpbiBy
ZXNldAo+IGJyYW5jaCBvbmx5LCB0aGVuIHBhdGNoIDEsIDIsIDMgc2hvdWxkIGJlIGluY2x1ZGVk
LCBvdGhlcndpc2UgbmVlZCB0bwo+IHB1bGwgY2xrIGJyYW5jaCBmb3IgYWRkaXRpb25hbCBkZXBl
bmRlbmN5IHBhdGNoZXMuCgozIGFzIHdlbGw/IE9oLCB0aGF0J3MgZm9yIHN0cnVjdCBzcGFjZW1p
dF9jY3VfYWRldi4gSU1ITyB0aGlzIHBhdGNoCnNlcmllcyBpcyBub3Qgd2VsbCBzdHJ1Y3R1cmVk
IGZvciBhcHBseWluZyBhY3Jvc3MgdHJlZXMuIFRoaXMgc2hvdWxkCmhhdmUgYmVlbiBhIHNpbmds
ZSBwYXRjaCB0aGF0IGFkZHMgaW5jbHVkZS9zb2Mvc3BhY2VtaXQvazEtc3lzY29uLmgsIHRvCmJl
IHNoYXJlZCBieSBib3RoIGNsayBhbmQgcmVzZXQgdHJlZXMsIGFuZCBubyBvdGhlciBkZXBlbmRl
bmNpZXMKYmV0d2VlbiBjbGsgYW5kIHJlc2V0IHBhdGNoZXMgZm9yIHRoaXMgdG8gd29yayB3ZWxs
LgoKPiBJIHdvdWxkIHByb3Bvc2UgdG8gaGF2ZSBzaGFyZWQgdGFnIHRvIGluY2x1ZGUgcGF0Y2gg
MS00LCB0aGVuIHlvdSBjYW4KPiBwaWNrIHBhdGNoIDUsIGluIHRoaXMgd2F5LCBpdCBzaG91bGQg
Ym90aCBwYXNzIGFsbCB0ZXN0cyAoYm90aAo+IGNvbXBpbGUtdGltZSBhbmQgcnVuLXRpbWUpd291
bGQgd291bGQgCgpTaW5jZSB0aGlzIGlzIGEgbmV3IGRyaXZlciwgcGFzc2luZyBydW4tdGltZSB0
ZXN0cyBpcyBub3QgYSBjb25jZXJuLgpDb21waWxlLXRpbWUgaXMsIHNpbmNlIHRoYXQgd291bGQg
YnJlYWsgYmlzZWN0YWJpbGl0eSBmb3IgZXZlcnlvbmUuCgo+IHdoYXQgZG8geW91IHRoaW5rPwoK
SSBmZWVsIGxpa2UgaXQncyBlYXNpZXIgYW5kIHNhZmVyIGZvciB0aGUgd2hvbGUgc2VyaWVzIHRv
IGJlIG1lcmdlZCB2aWEKdGhlIGNsayB0cmVlLiBTaW5jZSB0aGlzIGFkZHMgYSBuZXcgcmVzZXQg
ZHJpdmVyLCB0aGUgb25seSBwb3NzaWJsZQptZXJnZSBjb25mbGljdHMgYXJlIHRyaXZpYWwgb25l
cyBpbiBkcml2ZXJzL3Jlc2V0L3tLY29uZmlnLE1ha2VmaWxlfS4KCnJlZ2FyZHMKUGhpbGlwcAoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlz
Y3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xp
c3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
