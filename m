Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3466DCF0438
	for <linux-riscv@archiver.kernel.org>; Wed,  9 Oct 2024 09:45:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rVNNbLenQUJPFsMIqVYaG2dWT1z4swRQXDQziRXo9kw=; b=n7McbMYuMCuCfB
	Zsl0V1mluN4f0eKW4ydmUODDsvFDDOXT6WYP5ASvwX2rvgpUGi0Pw3M7zQ5UocloFYb04+5zWfZ1Q
	jmtkXxEEZgPb3NSv6q3xqAU9O89IeIwI4EOBrs3Odhp6nt/PbWA9WMVnRzpxChjYrud5DxFS3AZjW
	WdSm0O5vkr+NGcdLBuFpnW0Cz+uuGAFIlhmoQDEBlynoIDPDEUhQH1Kwzi5iyu/LrbBCsiif5vqpB
	om/LqJGwNQNoGZZpJPKP9nirev3FSQWi6tY+hK5v4yxzq8F2s04JRmyj5hfBClxIlmC9pVtOWkWqT
	KU1LBQxyLuNij9BYHRXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1syTGO-00000008jqe-0Tam;
	Wed, 09 Oct 2024 09:45:48 +0000
Received: from relay3-d.mail.gandi.net ([2001:4b98:dc4:8::223])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1syS95-00000008Trq-2mzj
	for linux-riscv@lists.infradead.org;
	Wed, 09 Oct 2024 08:34:14 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 2958560009;
	Wed,  9 Oct 2024 08:34:05 +0000 (UTC)
Message-ID: <850ede17-6eb3-4269-bec6-2a2a0a629eee@ghiti.fr>
Date: Wed, 9 Oct 2024 10:34:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] RISC-V: disallow gcc + rust builds
Content-Language: en-US
To: Conor Dooley <conor@kernel.org>
Cc: linux-riscv@lists.infradead.org, Conor Dooley
 <conor.dooley@microchip.com>, Jason Montleon <jmontleo@redhat.com>,
 ojeda@kernel.org, alex.gaynor@gmail.com, boqun.feng@gmail.com,
 gary@garyguo.net, bjorn3_gh@protonmail.com, benno.lossin@proton.me,
 a.hindborg@kernel.org, aliceryhl@google.com, paul.walmsley@sifive.com,
 palmer@dabbelt.com, nathan@kernel.org, ndesaulniers@google.com,
 morbo@google.com, justinstitt@google.com, rust-for-linux@vger.kernel.org,
 llvm@lists.linux.dev
References: <20241001-playlist-deceiving-16ece2f440f5@spud>
 <250e1e5d-5110-414f-abbd-fb002e715f32@ghiti.fr>
 <c4906bfc-5bc1-428e-a76f-3fb0bb8711ac@ghiti.fr>
 <20241009-tamale-revisit-7d2606c5fdf3@spud>
From: Alexandre Ghiti <alex@ghiti.fr>
In-Reply-To: <20241009-tamale-revisit-7d2606c5fdf3@spud>
X-GND-Sasl: alex@ghiti.fr
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241009_013412_184412_687E728C 
X-CRM114-Status: GOOD (  13.51  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gMDkvMTAvMjAyNCAxMDoyMywgQ29ub3IgRG9vbGV5IHdyb3RlOgo+IE9uIFdlZCwgT2N0IDA5
LCAyMDI0IGF0IDEwOjEwOjE0QU0gKzAyMDAsIEFsZXhhbmRyZSBHaGl0aSB3cm90ZToKPgo+Pj4+
ICwgaXQgaXMgYmV0dGVyCj4+Pj4gdG8gZGlzYWJsZSBnY2MgKyBydXN0IGJ1aWxkcyB0byBtYXRj
aCB0aGUgb3JpZ2luYWwgaW50ZW50LCBhbmQKPj4+PiBzdWJzZXF1ZW50bHkgc3VwcG9ydCBpdCB3
aGVuIGFuIGFwcHJvcHJpYXRlIHNldCBvZiBleHRlbnNpb25zIGNhbiBiZQo+Pj4+IGRlZHVjZWQg
ZnJvbSB0aGUgdmVyc2lvbiBvZiBsaWJjbGFuZy4KPj4+Pgo+Pj4+IENsb3NlczoKPj4+PiBodHRw
czovL2xvcmUua2VybmVsLm9yZy9hbGwvMjAyNDA5MTcwMDA4NDguNzIwNzY1LTItam1vbnRsZW9A
cmVkaGF0LmNvbS8KPj4+PiBbMV0KPj4+PiBMaW5rOgo+Pj4+IGh0dHBzOi8vbG9yZS5rZXJuZWwu
b3JnL2FsbC8yMDI0MDkyNi1iYXR0ZXJpbmctcmV2b2x0LTZjNmE3ODI3NDEzZUBzcHVkLwo+Pj4+
IFsyXQo+Pj4+IEZpeGVzOiA3MGE1N2IyNDcyNTFhICgiUklTQy1WOiBlbmFibGUgYnVpbGRpbmcg
NjQtYml0IGtlcm5lbHMgd2l0aAo+Pj4+IHJ1c3Qgc3VwcG9ydCIpCj4+Cj4+IEkgYWxzbyBmaXhl
ZCB0aGUgRml4ZXMgdGFnIF4sIGl0IGNvbnRhaW5zIDEzIGNoYXJhY3RlcnMgaW5zdGVhZCBvZiAx
MiBhbmQKPj4gYWRkZWQgYSBjYzogc3RhYmxlIHRhZy4KPiBGWUksIGNoZWNrcGF0Y2ggaXMgbm90
IGFuIGFyYml0ZXIgb2YgdHJ1dGgsIGFuZCBJIGludGVudGlvbmFsbHkgbGVmdCB0aGUKPiAxM3Ro
IGNoYXJhY3RlciB0aGF0IGdpdCBkZXRlcm1pbmVkIGl0IG5lZWRlZCB0byBoYXZlIHRoZXJlLiBB
cHBhcmVudGx5Cj4gdGhlIGtlcm5lbCBub3cgaGFzIGVub3VnaCBvYmplY3RzIHRoYXQgdGhlcmUg
Y2FuIGJlIDEyIGNoYXJhY3Rlcgo+IGNvbGxpc2lvbnMuCgoKT2ssIHRoYW5rcyBmb3IgdGhlIGV4
cGxhbmF0aW9uOiBkbyBjaGVja3BhdGNoIGFuZCB0aGUgZG9jdW1lbnRhdGlvbiBuZWVkIAp0byBi
ZSB1cGRhdGVkIHRoZW4/IElzIHRoYXQgYSBrbm93biBpc3N1ZT8KCiBGcm9tIGh0dHBzOi8vZG9j
cy5rZXJuZWwub3JnL3Byb2Nlc3Mvc3VibWl0dGluZy1wYXRjaGVzLmh0bWw6CgoiSWYgeW91ciBw
YXRjaCBmaXhlcyBhIGJ1ZyBpbiBhIHNwZWNpZmljIGNvbW1pdCwgZS5nLiB5b3UgZm91bmQgYW4g
aXNzdWUgCnVzaW5nIGdpdCBiaXNlY3QsIHBsZWFzZSB1c2UgdGhlIOKAmEZpeGVzOuKAmSB0YWcg
d2l0aCB0aGUgZmlyc3QgMTIgCmNoYXJhY3RlcnMgb2YgdGhlIFNIQS0xIElELCBhbmQgdGhlIG9u
ZSBsaW5lIHN1bW1hcnkuIgoKCj4KPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwo+IGxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdAo+IGxpbnV4LXJpc2N2QGxp
c3RzLmluZnJhZGVhZC5vcmcKPiBodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2xpbnV4LXJpc2N2CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5m
cmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xp
bnV4LXJpc2N2Cg==
