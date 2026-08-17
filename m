Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C882C5B572
	for <linux-riscv@archiver.kernel.org>; Mon, 17 Aug 2026 00:56:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BeQtWwW0XneOIL6SVVZDEjyannyxkxecgrtbxUZLPAc=; b=Iv+Vr8SavIhKxI
	P9tlAzc6EZPxE6kQnnErUScOKhQ4nCOUXmeKJbLP/KTUmqmA845VdM1JmJLEEb0rTFT6aZ8K8a6o2
	Ho1BU/2ukIoQSYMtd5+1p19d/vmV/dz9Up8l5YU566kWbyvGOjwJDCpI5k22HjQxmVdR4OfH5eps3
	NEJyZtszZWdIOZiAwY2S04sUweWqgBVN3q/0SHQkkPNTJeAOpcMW6e6rq56C7df3sWpHrmQ57RUUj
	weiI1BSU4ZLCHC51Zt/1s7RP1zgXi+5XYa1UvQccMGSwseBJulwWRm0+kU7yzOeSCVMXaSuO/jMCe
	2af4HCsKdYORoUPjICmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvle1-00000005EqU-0fsT;
	Mon, 17 Aug 2026 00:56:05 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvldz-00000005EqM-274w
	for linux-riscv@lists.infradead.org;
	Mon, 17 Aug 2026 00:56:03 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 263C9601DE
	for <linux-riscv@lists.infradead.org>; Mon, 17 Aug 2026 00:56:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BE9A61F00ACF
	for <linux-riscv@lists.infradead.org>; Mon, 17 Aug 2026 00:56:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786928161;
	bh=r5Eq/rNnDykdzzrPy34h6zrlHsN1zXEpsuTuZzQJUeU=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=K83dJ6EE3WngNkItbVUPztbGMbxz3gk9xLHZgaDDE7pw/FktUXqN8PMDaHGQoYuha
	 smbqsyK/SKYyidDtJ+/yDe7dJrgH5ie4QUXeieKzRkW3977D+peQbKjy6VaTWUwcIE
	 WyEge/f1vko2T4pvrqueWPiPNmmq6fXy0IxKD3ZqZNnStEBfivMu/oxxnG0rZJStHz
	 6vBi8n7cLMDQZBmvJjkO3Rt11KqwRMtsRNKA5BRJqhzbVGFAZwyLbsMiIY5guB3fms
	 KTAiN3kzV7rmk6hWYCgdcMXE1t2cUhw6SKthc7kvdddgOIe9+ITO1RoS+0pbAx2kwT
	 QmvZIq7fdbi6w==
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-49802c418b5so29651265e9.1
        for <linux-riscv@lists.infradead.org>; Sun, 16 Aug 2026 17:56:01 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RraO1/zHFoM0l/0GHyugTuZ6/qEBWTR4nz2tTTngPn6EAnhuYTeN+I2dg5cDvT5YbrBTSIdJILV1vqquw==@lists.infradead.org
X-Gm-Message-State: AOJu0Yzap8V2IhYFNdZ13ecAclX2U8Z8gBSgytbOINt4QFTZ4Wfq5PEq
	yev0LVQuz/P0fjZTmfsOPF5GUv3H94xMym6SBho1wtjqUxEiaUTMxWrwPDElroiT/X7pISbVKWo
	Qt5t2cs4UUMq04wBiyNEAVLcK07fKO5k=
X-Received: by 2002:a05:600c:19d1:b0:495:4e89:3f30 with SMTP id
 5b1f17b1804b1-499879ae4f4mr313180965e9.15.1786928160326; Sun, 16 Aug 2026
 17:56:00 -0700 (PDT)
MIME-Version: 1.0
References: <20260816074125.2105828-1-guoren@kernel.org> <20260816084034-GKC318749@kernel.org>
In-Reply-To: <20260816084034-GKC318749@kernel.org>
From: Guo Ren <guoren@kernel.org>
Date: Mon, 17 Aug 2026 08:55:48 +0800
X-Gmail-Original-Message-ID: <CAJF2gTTXn6HMGcUFsm2y1FekRXHEOockTv3JWDwq3OfJRJ8k8w@mail.gmail.com>
X-Gm-Features: AcwNN1XdN1EseW_kz3Aepyd6qgzvXrqCYj75XYIr84-1wXSCGEE2tintqRNc3Jk
Message-ID: <CAJF2gTTXn6HMGcUFsm2y1FekRXHEOockTv3JWDwq3OfJRJ8k8w@mail.gmail.com>
Subject: Re: [PATCH] riscv: dts: spacemit: k3: fix IMSIC guest parameters
To: Yixun Lan <dlan@kernel.org>
Cc: Junhui Liu <junhui.liu@pigmoral.tech>, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	spacemit@lists.linux.dev, stable@vger.kernel.org, 
	Guodong Xu <docular.xu@gmail.com>
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

T24gU3VuLCBBdWcgMTYsIDIwMjYgYXQgNDo0MOKAr1BNIFlpeHVuIExhbiA8ZGxhbkBrZXJuZWwu
b3JnPiB3cm90ZToKPgo+IGhpIEd1bywKPgo+IE9uIDA3OjQxIFN1biAxNiBBdWcgICAgICwgR3Vv
IFJlbiB3cm90ZToKPiA+IEZyb206ICJHVU8gUmVuIChYdWFuVGllKSIgPGd1b3JlbkBrZXJuZWwu
b3JnPgo+ID4KPiA+IFRoZSBpbml0aWFsIEszIGRldmljZSB0cmVlIHVzZWQgZ2VuZXJpYy9wbGFj
ZWhvbGRlciB2YWx1ZXMgZm9yIHRoZQo+ID4gSU1TSUMgZ3Vlc3QgY29uZmlndXJhdGlvbjoKPiA+
Cj4gPiAgIHJpc2N2LGd1ZXN0LWluZGV4LWJpdHMgPSA8Nj47Cj4gPiAgIHJpc2N2LG51bS1ndWVz
dC1pZHMgICAgPSA8NTExPjsKPiA+Cj4gPiBBY2NvcmRpbmcgdG8gdGhlIFNwYWNlbWlUIEszIFVz
ZXIgTWFudWFsIFsxXSB0aGVzZSB2YWx1ZXMgYXJlCj4gPiBpbmNvcnJlY3QgZm9yIHRoZSBYMTAw
IGNvcmVzOgo+ID4KPiA+ICAtIEh5cGVydmlzb3IgRXh0ZW5zaW9uOiBSVkggMS4wLCBHRUlMRU4g
PSA4Cj4gPiAgLSBBZHZhbmNlZCBJbnRlcnJ1cHQgQXJjaGl0ZWN0dXJlIChBSUEpOgo+ID4gICAg
IC0gTS1tb2RlIE1TSTogNTEyCj4gPiAgICAgLSBTLW1vZGUgTVNJOiA1MTIKPiA+ICAgICAtIFZT
LW1vZGUgTVNJOiA2NAo+ID4KPiA+IFRoZXJlZm9yZToKPiA+Cj4gPiAtIFMtbW9kZSBJTVNJQyAo
c2ltc2ljKSBvbmx5IG5lZWRzIGd1ZXN0LWluZGV4LWJpdHMgPSAzICh0byBjb3Zlcgo+ID4gICBH
RUlMRU4gPSA4KSBhbmQgbnVtLWd1ZXN0LWlkcyA9IDYzLgo+IC4uCj4gPiAtIE0tbW9kZSBJTVNJ
QyAobWltc2ljKSBkb2VzIG5vdCBpbXBsZW1lbnQgZ3Vlc3QgaW50ZXJydXB0IGZpbGVzIGF0Cj4g
PiAgIGFsbCwgc28gdGhlIGd1ZXN0LXJlbGF0ZWQgcHJvcGVydGllcyBtdXN0IGJlIG9taXR0ZWQu
Cj4gPgo+IENjIEp1bmh1aQo+Cj4gVGhlcmUgaXMgYWxyZWFkeSBvbmUgZml4IGZvciBJTVNJQyBb
MV0sIGJ1dCBpdCdzIGFjdHVhbGx5IHRvbyBsYXRlIHRvCj4gcGljayBmb3IgdjcuMyAuLiBJJ20g
bm90IHN1cmUgaG93IGJlc3QgdG8gaGFuZGxlIHRoaXMsIHdvdWxkIGl0IHBvc3NpYmxlCkl0J3Mg
bm90IGZvciB2Ny4zOyB3ZSBjb3VsZCBtZXJnZSBpdCBpbiB0aGUgbmV4dCB3aW5kb3cuClRoZSBt
aW1zaWMgcGFydCBpcyBhIHNlcGFyYXRlIGZpeDsgd2UgY291bGQgZG8gdGhlc2Ugc2VwYXJhdGVs
eS4KCj4gb24geW91ciBzaWRlIHRvIHBpY2sgSnVuaHVpJ3MgcGF0Y2ggYW5kIHJld29yayB0byBj
b21iaW5lIHRoZW0gdG8KPiBzZW5kIGEgVjI/IG9yIEkgY291bGQgcGljayBoaXMgcGF0Y2ggZmly
c3QgLi4KCkkgd291bGQgcmVtb3ZlIHRoZSBtaW1zaWMgcGFydCwgYnV0IEkgd29uJ3QgaW5jbHVk
ZSBpdCBpbiB2Mi4gQmVjYXVzZQp0aGVyZSBpcyBubyB1cGRhdGUgZm9yIHRoZSBtaW1zaWMgcGF0
Y2gsIHYyIG1ha2VzIGl0IGNvbmZ1c2luZy4KCj4KPiBodHRwczovL2xvcmUua2VybmVsLm9yZy9h
bGwvMjAyNjA3MjktazMtbWltc2ljLWZpeC12MS0xLTM2OGMwYWVjMDRiOUBwaWdtb3JhbC50ZWNo
Lwo+Cj4gPiBBbHRob3VnaCB0aGUgS1ZNIEFJQSBkcml2ZXIgd2lsbCByZS1kZXRlY3QgdGhlIGFj
dHVhbCBudW1iZXIgb2YgZ3Vlc3QKPiA+IGludGVycnVwdCBmaWxlcyB2aWEgaGdlaWUgYW5kIGNv
cnJlY3QgZ3Vlc3QtaW5kZXgtYml0cyBhdCBydW50aW1lLCB0aGUKPiA+IGRldmljZSB0cmVlIHNo
b3VsZCBzdGlsbCBkZXNjcmliZSB0aGUgY29ycmVjdCBoYXJkd2FyZSBwYXJhbWV0ZXJzLgo+ID4K
PiA+IFVwZGF0ZSB0aGUgZGV2aWNlIHRyZWUgdG8gbWF0Y2ggdGhlIHNpbGljb24uCj4gPgo+IC4u
Cj4gPiBbMV0gaHR0cHM6Ly93d3cuc3BhY2VtaXQuY29tL2NvbW11bml0eS9kb2N1bWVudC9pbmZv
P2xhbmc9ZW4mbm9kZXBhdGg9aGFyZHdhcmUva2V5X3N0b25lL2szL2szX2RvY3MvazNfdXNlcm1h
bnVhbC8wOF9jcHUubWQKPiA+Cj4gbm8gYmxhbmsgbGluZSBhbmQgdXNlICJMaW5rOiBodHRwczov
Ly4uIFsxXSIgZm9ybWF0Cj4KPiA+IEZpeGVzOiA1NmYzN2UzOTFhNjIgKCJyaXNjdjogZHRzOiBz
cGFjZW1pdDogYWRkIGluaXRpYWwgc3VwcG9ydCBmb3IgSzMgU29DIikKPiA+IENjOiBzdGFibGVA
dmdlci5rZXJuZWwub3JnCj4gPiBDYzogR3VvZG9uZyBYdSA8ZG9jdWxhci54dUBnbWFpbC5jb20+
Cj4gPiBDYzogWWl4dW4gTGFuIDxkbGFuQGtlcm5lbC5vcmc+Cj4gPiBTaWduZWQtb2ZmLWJ5OiBH
VU8gUmVuIChYdWFuVGllKSA8Z3VvcmVuQGtlcm5lbC5vcmc+Cj4gPiAtLS0KPiA+ICBhcmNoL3Jp
c2N2L2Jvb3QvZHRzL3NwYWNlbWl0L2szLmR0c2kgfCA2ICsrLS0tLQo+ID4gIDEgZmlsZSBjaGFu
Z2VkLCAyIGluc2VydGlvbnMoKyksIDQgZGVsZXRpb25zKC0pCj4gPgo+ID4gZGlmZiAtLWdpdCBh
L2FyY2gvcmlzY3YvYm9vdC9kdHMvc3BhY2VtaXQvazMuZHRzaSBiL2FyY2gvcmlzY3YvYm9vdC9k
dHMvc3BhY2VtaXQvazMuZHRzaQo+ID4gaW5kZXggMTlmYzliNDk2NjhlLi40MTIwZWIwYzQwODMg
MTAwNjQ0Cj4gPiAtLS0gYS9hcmNoL3Jpc2N2L2Jvb3QvZHRzL3NwYWNlbWl0L2szLmR0c2kKPiA+
ICsrKyBiL2FyY2gvcmlzY3YvYm9vdC9kdHMvc3BhY2VtaXQvazMuZHRzaQo+ID4gQEAgLTExMjcs
OSArMTEyNyw5IEBAIHNpbXNpYzogaW50ZXJydXB0LWNvbnRyb2xsZXJAZTA0MDAwMDAgewo+ID4g
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICA8JmNwdTRfaW50YyA5
PiwgPCZjcHU1X2ludGMgOT4sCj4gPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgIDwmY3B1Nl9pbnRjIDk+LCA8JmNwdTdfaW50YyA5PjsKPiA+ICAgICAgICAgICAg
ICAgICAgICAgICBtc2ktY29udHJvbGxlcjsKPiA+IC0gICAgICAgICAgICAgICAgICAgICByaXNj
dixndWVzdC1pbmRleC1iaXRzID0gPDY+Owo+ID4gKyAgICAgICAgICAgICAgICAgICAgIHJpc2N2
LGd1ZXN0LWluZGV4LWJpdHMgPSA8Mz47Cj4gPiAgICAgICAgICAgICAgICAgICAgICAgcmlzY3Ys
aGFydC1pbmRleC1iaXRzID0gPDQ+Owo+ID4gLSAgICAgICAgICAgICAgICAgICAgIHJpc2N2LG51
bS1ndWVzdC1pZHMgPSA8NTExPjsKPiA+ICsgICAgICAgICAgICAgICAgICAgICByaXNjdixudW0t
Z3Vlc3QtaWRzID0gPDYzPjsKPiA+ICAgICAgICAgICAgICAgICAgICAgICByaXNjdixudW0taWRz
ID0gPDUxMT47Cj4gPiAgICAgICAgICAgICAgIH07Cj4gPgo+ID4gQEAgLTExNjgsOSArMTE2OCw3
IEBAIG1pbXNpYzogaW50ZXJydXB0LWNvbnRyb2xsZXJAZjEwMDAwMDAgewo+ID4gICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICA8JmNwdTRfaW50YyAxMT4sIDwmY3B1
NV9pbnRjIDExPiwKPiA+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgPCZjcHU2X2ludGMgMTE+LCA8JmNwdTdfaW50YyAxMT47Cj4gPiAgICAgICAgICAgICAgICAg
ICAgICAgbXNpLWNvbnRyb2xsZXI7Cj4gPiAtICAgICAgICAgICAgICAgICAgICAgcmlzY3YsZ3Vl
c3QtaW5kZXgtYml0cyA9IDw2PjsKPiA+ICAgICAgICAgICAgICAgICAgICAgICByaXNjdixoYXJ0
LWluZGV4LWJpdHMgPSA8ND47Cj4gPiAtICAgICAgICAgICAgICAgICAgICAgcmlzY3YsbnVtLWd1
ZXN0LWlkcyA9IDw1MTE+Owo+ID4gICAgICAgICAgICAgICAgICAgICAgIHJpc2N2LG51bS1pZHMg
PSA8NTExPjsKPiA+ICAgICAgICAgICAgICAgICAgICAgICBzdGF0dXMgPSAicmVzZXJ2ZWQiOwo+
ID4gICAgICAgICAgICAgICB9Owo+ID4gLS0KPiA+IDIuNDMuMAo+ID4KPgo+IC0tCj4gWWl4dW4g
TGFuIChkbGFuKQoKCgotLSAKQmVzdCBSZWdhcmRzCiBHdW8gUmVuCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QK
bGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
