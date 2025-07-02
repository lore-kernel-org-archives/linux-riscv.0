Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1E65C83F05
	for <linux-riscv@archiver.kernel.org>; Wed,  2 Jul 2025 10:57:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Van5q2VE5wsb1TAkh+Y5C5L1HE02olDOj9zdzjD6StI=; b=UbTIXX8UjdVuAZ
	ieJZxss0XizIDigBH12B3/Xxhp8YOm0ax6ZqslumScvvn0E3QwyUFLaSl8z4CkLW+4ZgfmiNpnNrJ
	1Bm47hFZ0WoR634jChZV/eJgrgZFaOEZ0L9lJyDERY0NAMWswUAKw9ej2Vgxn8t8H5TbnnV2H51pt
	pMpYHhz0WzYq1UFFPzUuGHHpKRbAyeFnAXWAVD3OyVIpzD9j3z6pJy7NpotMiaZT5pq+3lMUZK7p7
	qa53TUewxH3at74Kxy2bipCHXXUpdH/C/xadDSvcgjLeZ02idtVMESCpj3+yris9RFz5SHQ5Ru8GX
	K2fpzD0/cqLR3lZjNEqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWv9f-000000082AA-3yAz;
	Wed, 02 Jul 2025 10:57:31 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWuTy-00000007uhA-0x0b
	for linux-riscv@lists.infradead.org;
	Wed, 02 Jul 2025 10:14:27 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1uWuTe-0001VL-Qj; Wed, 02 Jul 2025 12:14:06 +0200
Received: from lupine.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::4e] helo=lupine)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1uWuTc-006Q4b-2S;
	Wed, 02 Jul 2025 12:14:04 +0200
Received: from pza by lupine with local (Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1uWuTc-000DK0-27;
	Wed, 02 Jul 2025 12:14:04 +0200
Message-ID: <0580d4e254705be3765be168ce17c8a1c2e12f8f.camel@pengutronix.de>
Subject: Re: [PATCH v11 0/6] reset: spacemit: add K1 reset support
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Yixun Lan <dlan@gentoo.org>
Cc: Alex Elder <elder@riscstar.com>, robh@kernel.org, krzk+dt@kernel.org, 
 conor+dt@kernel.org, mturquette@baylibre.com, sboyd@kernel.org, 
 paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
 alex@ghiti.fr,  heylenay@4d2.org, inochiama@outlook.com,
 guodong@riscstar.com,  devicetree@vger.kernel.org,
 linux-clk@vger.kernel.org, spacemit@lists.linux.dev, 
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Date: Wed, 02 Jul 2025 12:14:04 +0200
In-Reply-To: <20250702061717-GYA304216@gentoo>
References: <20250613011139.1201702-1-elder@riscstar.com>
	 <20250618111737-GYA157089@gentoo> <20250702061717-GYA304216@gentoo>
User-Agent: Evolution 3.46.4-2 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250702_031426_267763_8B2F095C 
X-CRM114-Status: GOOD (  23.02  )
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

T24gTWksIDIwMjUtMDctMDIgYXQgMDY6MTcgKzAwMDAsIFlpeHVuIExhbiB3cm90ZToKPiBIaSBQ
aGlsaXBwLAo+IAo+IE9uIDExOjE3IFdlZCAxOCBKdW4gICAgICwgWWl4dW4gTGFuIHdyb3RlOgo+
ID4gSGkgQUxMLAo+ID4gICBBcyB0aGUgcmVzZXQgZHJpdmVyIGdvaW5nIHRocm91Z2ggc2V2ZXJh
bCByZXZpZXcgY3ljbGVzLAo+ID4gaXQgYmVjb21lcyBxdWl0ZSBjYWxtIGRvd24gbm93LCBJJ2Qg
bGlrZSB0byByZXF1ZXN0IHRvIG1lcmdlCj4gPiBpdCBpbnRvIHY2LjE3LCBiZWNhdXNlIHZhcmlv
dXMgZHJpdmVycyAocHdtLCBlbWFjLi4pIHdpbGwgZGVwZW5kCj4gPiBvbiBpdCwgZXZlbiBpbiB0
aGUgd29yc3QgY2FzZSBpZiB0aGVyZSBpcyBwcm9ibGVtLCBJIGJlbGlldmUgQWxleAo+ID4gd2ls
bCBoZWxwIHRvIGFkZHJlc3MuLgo+ID4gCj4gPiBIaSBQaGlsaXBwLAo+ID4gICBJJ2QgbGlrZSB0
byBxdWVyeSBpZiB5b3Ugd2lsbGluZyB0byB0YWtlIHRoZSByZXNldCBkcml2ZXIgLQo+ID4gcGF0
Y2ggWzUvNl0gdGhyb3VnaCB0aGUgcmVzZXQgdHJlZT8gSXQgc291bmRzIG1vcmUgaW50dWl0aXZl
LAo+ID4gd2hpY2ggYWxzbyB3aWxsIGF2b2lkIHBvdGVudGlhbCBjb25mbGljdHMgd2l0aCBLY29u
ZmlnL01ha2VmaWxlLi4KPiA+ICAgSSd2ZSBjcmVhdGVkIGEgcHJlcmVxdWlzaXRlIGltbXV0YWJs
ZSB0YWcgd2hpY2ggY291bGQgYmUKPiA+IHNoYXJlZCBiZXR3ZWVuIGNsb2NrIGFuZCByZXNldCBz
dWJzeXRlbS4gSXQncyB0YWcgLQo+ID4gc3BhY2VtaXQtcmVzZXQtZGVwcy1mb3ItNi4xNyBhdCBT
cGFjZW1pVCdzIFNvQyB0cmVlIFsxXSwgd2hpY2ggCj4gPiBlZmZlY3RpdmVseSBhcmUgcGF0Y2hl
cyBbMS00XSBvZiB0aGlzIHNlcmllcy4KPiA+IEJ1dCwgdG8gbWFrZSB5b3VyIGxpZmUgZWFzeSwg
SSd2ZSBhbHNvIGFwcGxpZWQgcGF0Y2ggWzUvNl0gYXQgdGFnCj4gPiBzcGFjZW1pdC1yZXNldC1k
cnYtZm9yLTYuMTcgWzJdIHdoaWNoIGhhcyBhIHNtYWxsIG1hY3JvIGFkanVzdG1lbnQKPiA+IHJl
cXVlc3RlZCBieSBBbGV4IGF0IFszXQo+ID4gICBMZXQgbWUga25vdyB3aGF0IHlvdSB0aGluayBv
ZiB0aGlzLCB0aGFua3MKPiA+IAo+IEp1c3Qgd2FudCB0byBwaW5nIHRoaXMsIHdoYXQgZG8geW91
IHdhbnQgZnJvbSBteSBzaWRlIHRvIHByb2NlZWQ/Cj4gCj4gb3IgZG8geW91IHdhbnQgbWUgdG8g
c2VuZCBhIG1vcmUgZm9ybWFsIFB1bGwtUmVxdWVzdCBmb3IgWzFdLAo+IHRoZW4geW91IGNhbiBh
cHBseSBwYXRjaCBbNS82XSAoc3RpbGwgbmVlZCB0byBmaXggdGhlIG1hY3JvIG9mIFszXSkKClBs
ZWFzZSBzZW5kIGEgdjEyLCBzbyB0aGF0IHRoZSBsYXRlc3QgbW9kaWZpY2F0aW9ucyBhcmUgb24g
dGhlIGxpc3QuCgpJJ2QgcHJlZmVywqB0byBlaXRoZXIgcGljayBwYXRjaGVzIDEgYW5kIDUgZnJv
bSB0aGUgbGlzdCwgb3IsIGlmIHlvdQpwcm92aWRlIGEgdGFnIHdpdGggb25seSBwYXRjaCAxIHRv
IGJlIHB1bGxlZCBpbnRvIGJvdGggY2xrIGFuZCByZXNldAp0cmVlcywgdG8gbWVyZ2UgdGhhdCBh
bmQgdGhlbiBwaWNrIHBhdGNoIDUuCgpyZWdhcmRzClBoaWxpcHAKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdAps
aW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3Jn
L21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
