Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53BB9CCD195
	for <linux-riscv@archiver.kernel.org>; Tue, 14 Oct 2025 16:48:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=v6aEkfl5R3wLZ/+GL9scHgTzXotd/n1whPb3jCFswoQ=; b=BM04TXUSwTQ4vq
	+UuvZb7Zr9o8Nsqm05lh4k5tozOBtwGlMOaAlygL9NuRFJ68493/2QWQSP8pz22YK1WUNWxN5JzCf
	Tblv3NwxzjPrP5H0b7/4A0lvFyrNtoBvWoMQcamZft3Mej/sXEQt2dYy4eZCiIsu/NEFtz3js4CGS
	PFoEgJWn4rSBwayH9QP6KVrfFPQ9lv4GR5KV/4OvwkkobW6o+52It9aJeeQSoIOKYTZimIXICWnqi
	u9piR2ntm8Bg/y/Q5egs1S5zCbk/ADnAUrdBfWI8XzVviYymH4FokNqDAScIjj27A2mxHt/tGM7O6
	Hrkpl+AvDYM+NVkC95iQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8iBu-0000000H1ol-0l0x;
	Tue, 14 Oct 2025 16:48:02 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8iBr-0000000H1oH-3e7y;
	Tue, 14 Oct 2025 16:48:00 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id CC5D962366;
	Tue, 14 Oct 2025 16:47:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9F4FBC4CEF9;
	Tue, 14 Oct 2025 16:47:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760460478;
	bh=l8eLRFVMqE9fpiqrKqMylM/MEdNRiawD7W1mbhHYUUA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=eGSA3pgaOhHGfOTcRgObQgFAXRmOW61i/dlmHQrwQtYq+xQu+Ft19yt6twH4meYJQ
	 pWh4Zv2yemKHxTklIE0SZgp3LMws95vKHPuayVyCrSzSO/TuzlIKgKlN/9AzmSYXI+
	 VDWj2WvV3uEOaZ0+mpeTKD3MLGvDFT3ttd2kKoAg8mFv263krvh8pHzQF2S8h0d4ww
	 mm+3rI11mjJHFue72xqUgh8qpTfrAldmagVOJzzCXqrhyFjsfIqCa5+MRQvPB9RG+W
	 jCXWH/AKVd0lxrKcHaX4aoIX3SXFgHU9WqNVNS2owUSOkfqBwuBB2vnN+AirnG+X8m
	 oq6U4gwpx/A1w==
Date: Tue, 14 Oct 2025 09:47:55 -0700
From: Josh Poimboeuf <jpoimboe@kernel.org>
To: Ard Biesheuvel <ardb@kernel.org>
Cc: Huacai Chen <chenhuacai@kernel.org>, 
	Tiezhu Yang <yangtiezhu@loongson.cn>, loongarch@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-efi@vger.kernel.org, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] efistub: Only link libstub to final vmlinux
Message-ID: <rhnei6wovxmoqs36wdysomfsul3faxtmgde73wrrqdt3qo3b2j@akd7vzne76rq>
References: <8091e8fa-3483-af39-2f7a-e4eb62b0944f@loongson.cn>
 <CAAhV-H4+UGLSkbjHbq9MerWfxnq0a13x+uzNfTsCoe1UxjbWsg@mail.gmail.com>
 <CAMj1kXH-rK0bRyHXdJ-crAyMyvJHApH0WR7_8Qd8vrSPBLK+yg@mail.gmail.com>
 <0c9b8e6a-96a6-91d4-946f-2109f48a529b@loongson.cn>
 <CAAhV-H41m96fvEWG5NqAE=tykPjyzt=50CseJDeCqdG-c_WMrQ@mail.gmail.com>
 <CAMj1kXEs5=VRi_rJwgHUrQWos-27PBbr3c4fYnmkV8Ahi8HZgw@mail.gmail.com>
 <CAAhV-H7HN128du-b1Rk_9qbYBq7gMSwo0s31909N4pTou6wzew@mail.gmail.com>
 <CAMj1kXGvSnCMRVCW7eAxgLRWMEV3QRj3Dqg3PmZchZJNpnLK9w@mail.gmail.com>
 <CAAhV-H4UKdso0BokAqvjYeBLr-jbjFAaQX4z=1ztpBamqrOEEg@mail.gmail.com>
 <CAMj1kXEXDC_oq4aWbkR5dqYBix2d1xJEdaj-v747e1nOA0Q_Yg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAMj1kXEXDC_oq4aWbkR5dqYBix2d1xJEdaj-v747e1nOA0Q_Yg@mail.gmail.com>
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

T24gTW9uLCBPY3QgMTMsIDIwMjUgYXQgMDQ6MzY6NDlQTSArMDIwMCwgQXJkIEJpZXNoZXV2ZWwg
d3JvdGU6Cj4gT24gTW9uLCAxMyBPY3QgMjAyNSBhdCAxNjowOSwgSHVhY2FpIENoZW4gPGNoZW5o
dWFjYWlAa2VybmVsLm9yZz4gd3JvdGU6Cj4gPiBPbiBTYXQsIE9jdCAxMSwgMjAyNSBhdCAxMTo1
OeKAr1BNIEFyZCBCaWVzaGV1dmVsIDxhcmRiQGtlcm5lbC5vcmc+IHdyb3RlOgo+ID4gPiBJdCBp
cyBhbiBvYmp0b29sIGlzc3VlIGluIGVzc2VuY2UuCj4gPiA+Cj4gPiA+IFRoZSBnZW5lcmF0ZWQg
Y29kZSBsb29rcyBsaWtlIHRoaXMKPiA+ID4KPiA+ID4gOTAwMDAwMDAwMTc0MzA4MDogZmYgYjcg
ZmUgNTcgICBibCAgICAgIC0zMzIgPF9fZWZpc3R1Yl9rZXJuZWxfZW50cnlfYWRkcmVzcz4KPiA+
ID4gOTAwMDAwMDAwMTc0MzA4NDogMjYgMDMgYzAgMjggICBsZC5kICAgICRhMiwgJHMyLCAwCj4g
PiA+IDkwMDAwMDAwMDE3NDMwODg6IDg3IDAwIDE1IDAwICAgbW92ZSAgICAkYTMsICRhMAo+ID4g
PiA5MDAwMDAwMDAxNzQzMDhjOiAwNCAwNCA4MCAwMyAgIG9yaSAgICAgJGEwLCAkemVybywgMQo+
ID4gPiA5MDAwMDAwMDAxNzQzMDkwOiBjNSAwMiAxNSAwMCAgIG1vdmUgICAgJGExLCAkZnAKPiA+
ID4gOTAwMDAwMDAwMTc0MzA5NDogZTEgMDAgMDAgNGMgICBqaXJsICAgICRyYSwgJGEzLCAwCj4g
PiA+Cj4gPiA+IDkwMDAwMDAwMDE3NDMwOTggPF9fZWZpc3R1Yl9leGl0X2Jvb3RfZnVuYz46Cj4g
PiA+IDkwMDAwMDAwMDE3NDMwOTg6IDYzIGMwIGZmIDAyICAgYWRkaS5kICAkc3AsICRzcCwgLTE2
Cj4gPiA+Cj4gPiA+IFRoZXJlIGlzIG5vdGhpbmcgd3Jvbmcgd2l0aCB0aGlzIGNvZGUsIGdpdmVu
IHRoYXQgdGhlIGluZGlyZWN0IGNhbGwgaXMKPiA+ID4gdG8gYSBfX25vcmV0dXJuIGZ1bmN0aW9u
LCBhbmQgc28gdGhlIGZhY3QgdGhhdCBpdCBmYWxscyB0aHJvdWdoIGludG8KPiA+ID4gX19lZmlz
dHViX2V4aXRfYm9vdF9mdW5jKCkgaXMgbm90IGEgcHJvYmxlbS4KPiA+ID4KPiA+ID4gRXZlbiB0
aG91Z2ggdGhlIGNvbXBpbGVyIGRvZXMgbm90aGluZyB3cm9uZyBoZXJlLCBpdCB3b3VsZCBiZSBu
aWNlIGlmCj4gPiA+IGl0IHdvdWxkIGVtaXQgc29tZSBraW5kIG9mIFVEIG9yIEJSSyBpbnN0cnVj
dGlvbiBhZnRlciBzdWNoIGEgY2FsbCwgaWYKPiA+ID4gb25seSB0byBtYWtlIHRoZSBiYWNrdHJh
Y2UgbW9yZSByZWxpYWJsZS4gQnV0IHRoZSBjb2RlIGlzIGZpbmUsIGFuZAo+ID4gPiBvYmp0b29s
IHNpbXBseSBkb2VzIG5vdCBoYXZlIHRoZSBpbmZvcm1hdGlvbiBpdCBuZWVkcyB0byBkZXRlcm1p
bmUKPiA+ID4gdGhhdCB0aGUgaW5kaXJlY3QgY2FsbCBpcyBvZiBhIHZhcmlldHkgdGhhdCBuZXZl
ciByZXR1cm5zLgo+ID4gU28gdGhlIGJlc3Qgd2F5IGlzIHRvIGZpeCB0aGUgb2JqdG9vbD8KPiA+
Cj4gCj4gSSB0aGluayB0aGUgYmVzdCBzb2x1dGlvbiBpcyB0byBmaXggdGhlIGNvbXBpbGVyLCBh
bmQgZW5zdXJlIHRoYXQgY2FsbAo+IGluc3RydWN0aW9ucyBhcmUgYWx3YXlzIGZvbGxvd2VkIGJ5
IHNvbWUgdW5kZWZpbmVkIG9yIGRlYnVnL2JyZWFrCj4gb3Bjb2RlLiBUaGlzIHdvcmtzIGFyb3Vu
ZCB0aGlzIHByb2JsZW0sIGJ1dCBpdCBhbHNvIGVuc3VyZXMgdGhhdCB0aGUKPiByZXR1cm4gYWRk
cmVzcyBkb2VzIG5vdCBwb2ludCB0byB0aGUgd3JvbmcgZnVuY3Rpb24sIHdoaWNoIG1heSBjYXVz
ZQo+IGNvbmZ1c2lvbiBpbiBiYWNrdHJhY2VzLgoKSSB0aGluayB0aGUgY29tcGlsZXIgZm9sa3Mg
d2lsbCBzYXkgdGhhdCdzIHdvcmtpbmcgYXMgZGVzaWduZWQuICBUaGUKd2hvbGUgcG9pbnQgb2Yg
X19ub3JldHVybiBpcyB0byBlbGltaW5hdGUgdW5lY2Vzc2FyeSBjb2RlIGFmdGVyIHRoZQpjYWxs
LgoKVW53aW5kZXJzIGFyZSBhbHJlYWR5IGRlc2lnbmVkIHRvIGhhbmRsZSB0aGF0IGNhc2UgYW55
d2F5LgoKSWYgeW91IGRvbid0IHdhbnQgdG8gb3B0aW1pemUgb3V0IHRoZSBjb2RlIGFmdGVyIHRo
ZSBjYWxsIHRoZW4ganVzdApyZW1vdmUgdGhlIF9fbm9yZXR1cm4gYW5ub3RhdGlvbiBmcm9tIHRo
ZSBmdW5jdGlvbiBwb2ludGVyLgoKPiA+ID4gU28gSSBkb24ndCBtaW5kIGZpeGluZyBpdCBpbiB0
aGUgY29kZSwgYnV0IG9ubHkgZm9yIExvb25nQXJjaCwgZ2l2ZW4KPiA+ID4gdGhhdCB0aGUgcHJv
YmxlbSBkb2VzIG5vdCBleGlzdCBvbiBhcm02NCBvciBSSVNDLVYuCj4gPiBZb3UgYmVsaWV2ZSB0
aGlzIHByb2JsZW0gd29uJ3QgZXhpc3QgZXZlbiBpZiB0aGV5IGFkZCBvYmp0b29sIHN1cHBvcnQK
PiA+IChiZWNhdXNlIHRoZWlyIG9ianRvb2wgd2lsbCBiZSBzYW5lKT8KPiA+Cj4gCj4gSXQgZGVw
ZW5kcyBvbiB0aGUgY29tcGlsZXIuCgpJIGRvbid0IHRoaW5rIHNvLCBhbGwgY29tcGlsZXJzIGRv
IHRoaXMuLi4KCk15IHN1Z2dlc3Rpb24gKHdoaWNoIHByb21wdGVkIHRoaXMgdjIgcGF0Y2gpIHdh
cyB0byBtb3ZlIHRoZSBsaWJzdHViCmNvZGUgb3V0IG9mIHZtbGludXgubyAoYnV0IHN0aWxsIGtl
ZXAgaXQgaW4gdm1saW51eCksIHRvIG1ha2UgaXQKY29uc2lzdGVudCB3aXRoIHdoYXQgeDg2IGFs
cmVhZHkgZG9lcy4KClRoZSBpZGVhIGlzIHRoYXQgbGlic3R1YiBjb2RlIGRvZXNuJ3QgYmVsb25n
IGluIHZtbGludXgubyBiZWNhdXNlIGl0J3MKbm90IGEgcGFydCBvZiB0aGUga2VybmVsIHByb3Bl
ciwgYW5kIGRvZXNuJ3QgbmVlZCB0byBiZSB2YWxpZGF0ZWQgb3IKbW9kaWZpZWQgYnkgb2JqdG9v
bCBmb3IgYW55IHJlYXNvbi4KCi0tIApKb3NoCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZA
bGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2xpbnV4LXJpc2N2Cg==
