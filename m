Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47B27CCD187
	for <linux-riscv@archiver.kernel.org>; Tue, 14 Oct 2025 09:49:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XzuGP1YdFyCm6SkVxpassnV1eKAfR0T64PyP/H6gc3M=; b=Hq5f17f0/lATGL
	ZTpMLpAIAg5n4m/nq0YqKngw4JLZTQoMLEyxsOpYyWU4sGeLPYtBedjyR0uOdgZLlwIkBDw96O1cR
	oZ1pWRJpJyItv0VyNhuiY5sPvdMPfHnD+k9vp+2ASsuTiBbQ8ilgYBXG0S3F45OHtPPimHT8gRi0i
	ap79nnqI3uV39cZAewmlBnppnXzHnpiCaRwn2/J0cwFms7lbpokZy6s/3GOOtpa/xRBrOmvIt0y10
	+knT0zpsHtYEgRpTQiG9aaidPX0vp7lbs8J2gM/LyqkXQCPMSSAQogNWie1p/rRtFlKnAsB336nW8
	L4+YPjVf/w/k+JIAnNzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8bew-0000000Foxq-1X59;
	Tue, 14 Oct 2025 09:49:34 +0000
Received: from layka.disroot.org ([178.21.23.139])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8bes-0000000Fowi-3qcz
	for linux-riscv@lists.infradead.org;
	Tue, 14 Oct 2025 09:49:32 +0000
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id D255B260A3;
	Tue, 14 Oct 2025 11:49:27 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uovdA5KCQ9Xb; Tue, 14 Oct 2025 11:49:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1760435367; bh=8ZOdtFHoqv/rQpLoY48GmoTDS5BQalfi24BFCB1h7e4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=IoHj+x5WYyeUqFeY+0WSwUtV5j8UHcGZo6LEs5W+hwoGC8uuZhp3dqgnQs2N23dSR
	 vAtVe/CXt9eIFI/iXJPEcUr8gc3vKjAe6+rDfM1cozhLQJoQ4njt0rikI8x6zLGtkc
	 svTX++7yslNag10zmvUIAhuwOcfl/zx39XP+sjOz77BxufupbSqSOllbkYksU3/t/7
	 sXTz1yZMcGXOR3oTHAX4YDLL7eaPdJezuq/TfvZklX6i7Sy6R9rmlK5SGIu62ZXTv/
	 3gHGdJzzGAgPo8AhbEzKMmyGE+xnpmjCY2b+sOrKVTyyeDAK811upWwuYn+maSxbb3
	 c3hWa5dzGRQPQ==
Date: Tue, 14 Oct 2025 09:49:07 +0000
From: Yao Zi <ziyao@disroot.org>
To: Drew Fustini <fustini@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Michal Wilczynski <m.wilczynski@samsung.com>,
	Alexandre Ghiti <alex@ghiti.fr>, devicetree@vger.kernel.org,
	Han Gao <gaohan@iscas.ac.cn>, Han Gao <rabenda.cn@gmail.com>,
	linux-kernel@vger.kernel.org, Guo Ren <guoren@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-riscv@lists.infradead.org, Fu Wei <wefu@redhat.com>
Subject: Re: [PATCH v2 2/5] dt-bindings: reset: thead,th1520-reset: Add
 controllers for more subsys
Message-ID: <aO4ck0IhO20T78eN@pie>
References: <20250915095331.53350-1-ziyao@disroot.org>
 <20250915095331.53350-3-ziyao@disroot.org>
 <aOBSOZzOAeelS6Gi@x1>
 <aOCEt7UGpSyWTury@pie>
 <aOGckdJcY44hD4Hn@x1>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <aOGckdJcY44hD4Hn@x1>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251014_024931_546415_05692A5A 
X-CRM114-Status: GOOD (  30.77  )
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

T24gU2F0LCBPY3QgMDQsIDIwMjUgYXQgMDM6MTU6NDVQTSAtMDcwMCwgRHJldyBGdXN0aW5pIHdy
b3RlOgo+IE9uIFNhdCwgT2N0IDA0LCAyMDI1IGF0IDAyOjIxOjQzQU0gKzAwMDAsIFlhbyBaaSB3
cm90ZToKPiA+IE9uIEZyaSwgT2N0IDAzLCAyMDI1IGF0IDAzOjQ2OjE3UE0gLTA3MDAsIERyZXcg
RnVzdGluaSB3cm90ZToKPiA+ID4gT24gTW9uLCBTZXAgMTUsIDIwMjUgYXQgMDk6NTM6MjhBTSAr
MDAwMCwgWWFvIFppIHdyb3RlOgo+ID4gPiA+IFRIMTUyMCBTb0MgaXMgZGl2aWRlZCBpbnRvIHNl
dmVyYWwgc3Vic3lzdGVtcywgbW9zdCBvZiB0aGVtIGhhdmUKPiA+ID4gPiBkaXN0aW5jdCByZXNl
dCBjb250cm9sbGVycy4gTGV0J3MgZG9jdW1lbnQgcmVzZXQgY29udHJvbGxlcnMgb3RoZXIgdGhh
bgo+ID4gPiA+IHRoZSBvbmUgZm9yIFZPIHN1YnN5c3RlbSBhbmQgSURzIGZvciB0aGVpciByZXNl
dCBzaWduYWxzLgo+ID4gPiA+IAo+ID4gPiA+IFNpZ25lZC1vZmYtYnk6IFlhbyBaaSA8eml5YW9A
ZGlzcm9vdC5vcmc+Cj4gPiA+IAo+ID4gPiBUaGFua3MgZm9yIHNlbmRpbmcgdGhlc2UgcGF0Y2hl
cy4KPiA+ID4gCj4gPiA+ID4gLS0tCj4gPiA+ID4gIC4uLi9iaW5kaW5ncy9yZXNldC90aGVhZCx0
aDE1MjAtcmVzZXQueWFtbCAgICB8ICAgOCArLQo+ID4gPiA+ICAuLi4vZHQtYmluZGluZ3MvcmVz
ZXQvdGhlYWQsdGgxNTIwLXJlc2V0LmggICAgfCAyMTYgKysrKysrKysrKysrKysrKysrCj4gPiA+
ID4gIDIgZmlsZXMgY2hhbmdlZCwgMjIzIGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKPiA+
ID4gPiAKPiA+ID4gW3NuaXBdCj4gPiA+ID4gZGlmZiAtLWdpdCBhL2luY2x1ZGUvZHQtYmluZGlu
Z3MvcmVzZXQvdGhlYWQsdGgxNTIwLXJlc2V0LmggYi9pbmNsdWRlL2R0LWJpbmRpbmdzL3Jlc2V0
L3RoZWFkLHRoMTUyMC1yZXNldC5oCj4gPiA+ID4gaW5kZXggZTUxZDYzMTRkMTMxLi42OGFjNTJl
ZDY5ZGUgMTAwNjQ0Cj4gPiA+ID4gLS0tIGEvaW5jbHVkZS9kdC1iaW5kaW5ncy9yZXNldC90aGVh
ZCx0aDE1MjAtcmVzZXQuaAo+ID4gPiA+ICsrKyBiL2luY2x1ZGUvZHQtYmluZGluZ3MvcmVzZXQv
dGhlYWQsdGgxNTIwLXJlc2V0LmgKPiA+ID4gPiBAQCAtNyw2ICs3LDIwMCBAQAo+ID4gPiA+ICAj
aWZuZGVmIF9EVF9CSU5ESU5HU19USDE1MjBfUkVTRVRfSAo+ID4gPiA+ICAjZGVmaW5lIF9EVF9C
SU5ESU5HU19USDE1MjBfUkVTRVRfSAo+ID4gPiBbc25pcF0KPiA+ID4gPiArLyogRFNQIFN1YnN5
c3RlbSAqLwo+ID4gPiA+ICsjZGVmaW5lIFRIMTUyMF9SRVNFVF9JRF9YMlhfRFNQMQkwCj4gPiA+
ID4gKyNkZWZpbmUgVEgxNTIwX1JFU0VUX0lEX1gyWF9EU1AwCTEKPiA+ID4gPiArI2RlZmluZSBU
SDE1MjBfUkVTRVRfSURfWDJYX1NMQVZFX0RTUDEJMgo+ID4gPiA+ICsjZGVmaW5lIFRIMTUyMF9S
RVNFVF9JRF9YMlhfU0xBVkVfRFNQMAkzCj4gPiA+ID4gKyNkZWZpbmUgVEgxNTIwX1JFU0VUX0lE
X0RTUDBfQ09SRQk0Cj4gPiA+ID4gKyNkZWZpbmUgVEgxNTIwX1JFU0VUX0lEX0RTUDBfREVCVUcJ
NQo+ID4gPiA+ICsjZGVmaW5lIFRIMTUyMF9SRVNFVF9JRF9EU1AwX0FQQgk2Cj4gPiA+ID4gKyNk
ZWZpbmUgVEgxNTIwX1JFU0VUX0lEX0RTUDFfQ09SRQk0Cj4gPiA+ID4gKyNkZWZpbmUgVEgxNTIw
X1JFU0VUX0lEX0RTUDFfREVCVUcJNQo+ID4gPiA+ICsjZGVmaW5lIFRIMTUyMF9SRVNFVF9JRF9E
U1AxX0FQQgk2Cj4gPiA+ID4gKyNkZWZpbmUgVEgxNTIwX1JFU0VUX0lEX0RTUFNZU19BUEIJNwo+
ID4gPiA+ICsjZGVmaW5lIFRIMTUyMF9SRVNFVF9JRF9BWEk0X0RTUFNZU19TTFYJOAo+ID4gPiA+
ICsjZGVmaW5lIFRIMTUyMF9SRVNFVF9JRF9BWEk0X0RTUFNZUwk5Cj4gPiA+ID4gKyNkZWZpbmUg
VEgxNTIwX1JFU0VUX0lEX0FYSTRfRFNQX1JTCTEwCj4gPiA+IAo+ID4gPiBUaGlzIGRvZXNuJ3Qg
c2VlbSByaWdodC4gVGhlIG51bWJlcnMgZm9yIGVhY2ggc3Vic3lzdGVtIHNob3VsZCBub3QKPiA+
ID4gcmVwZWF0LiBIZXJlIHRoZSBEU1AwIGFuZCBEU1AxIGl0ZW1zIGhhdmUgdGhlIHNhbWUgbnVt
YmVyczogNCwgNSwgNi4KPiA+ID4gCj4gPiA+IFRoaXMgY2F1c2VzIGJvdGggY2xhbmcgYW5kIHNw
YXJzZSB0byBjb21wbGFpbi4gSSB0aGluayB5b3UgY2FuIGp1c3QKPiA+ID4gY2hhbmdlIHRoaXMg
c28gdGhhdCBUSDE1MjBfUkVTRVRfSURfRFNQMV9DT1JFIGlzIDcgYW5kIHNvIG9uLiBUaGUKPiA+
ID4gaW5kZXhlcyBkb24ndCByZWFsbHkgaGF2ZSBhbnkgY29uY3JldGUgbWVhbmluZyBvdGhlciB0
aGFuIGhvdyB0aGV5IGFyZQo+ID4gPiB1c2VkIGFzIHVuaXF1ZSBrZXlzLgo+ID4gCj4gPiBZb3Un
cmUgY29ycmVjdCwgaXQncyBhIGNvcHktcGFzdGUgZXJyb3IsIGp1c3QgbGlrZSB0aGUgb25lIHNw
b3R0ZWQgaW4gdjEKPiA+IG9mIHRoZSBzZXJpZXMuLi4KPiA+IAo+ID4gSSdtIG5vdCBzdXJlIHdo
eSBlaXRoZXIgbXkgR0NDIG9yIHNwYXJzZSB5aWVsZGVkIG5vIHdhcm5pbmcgYWJvdXQgdGhlbS4K
PiA+IFdpbGwgZmlndXJlIGl0IG91dCBhbmQgc2VuZCB2MyB3aXRoIHRoaXMgZml4ZWQuIE11Y2gg
c29ycnkgZm9yIHRoZXNlCj4gPiBzdHVwaWQgbWlzdGFrZXMuCj4gPiAKPiA+IEJlc3QgcmVnYXJk
cywKPiA+IFlhbyBaaQo+IAo+IEhhdmUgeW91IHRyaWVkIHVzaW5nIFc9MT8KPiAKPiBJIGRvIHNl
ZSB0aGUgd2FybmluZyBpbiBnY2Mgd2l0aCB0aGF0Ogo+IAo+IHBkcDdAdGhlbGlvOn4vbGludXgk
IHJtIGRyaXZlcnMvcmVzZXQvcmVzZXQtdGgxNTIwLm8KPiBwZHA3QHRoZWxpbzp+L2xpbnV4JCBt
YWtlIFc9MSBDUk9TU19DT01QSUxFPXJpc2N2NjQtbGludXgtZ251LSBBUkNIPXJpc2N2IEM9MSAt
ajE2Cj4gICBDQUxMICAgIHNjcmlwdHMvY2hlY2tzeXNjYWxscy5zaAo+IERvY3VtZW50YXRpb24v
LnJlbmFtZXMudHh0OiB3YXJuaW5nOiBpZ25vcmVkIGJ5IG9uZSBvZiB0aGUgLmdpdGlnbm9yZSBm
aWxlcwo+ICAgQ0MgICAgICBkcml2ZXJzL3Jlc2V0L3Jlc2V0LXRoMTUyMC5vCj4gZHJpdmVycy9y
ZXNldC9yZXNldC10aDE1MjAuYzo2NTU6Mzk6IHdhcm5pbmc6IGluaXRpYWxpemVkIGZpZWxkIG92
ZXJ3cml0dGVuIFstV292ZXJyaWRlLWluaXRdCj4gICA2NTUgfCAgICAgICAgIFtUSDE1MjBfUkVT
RVRfSURfRFNQMV9DT1JFXSA9IHsKPiAgICAgICB8ICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgXgo+IGRyaXZlcnMvcmVzZXQvcmVzZXQtdGgxNTIwLmM6NjU1OjM5OiBub3Rl
OiAobmVhciBpbml0aWFsaXphdGlvbiBmb3Ig4oCYdGgxNTIwX2RzcF9yZXNldHNbNF3igJkpCj4g
ZHJpdmVycy9yZXNldC9yZXNldC10aDE1MjAuYzo2NTk6NDA6IHdhcm5pbmc6IGluaXRpYWxpemVk
IGZpZWxkIG92ZXJ3cml0dGVuIFstV292ZXJyaWRlLWluaXRdCj4gICA2NTkgfCAgICAgICAgIFtU
SDE1MjBfUkVTRVRfSURfRFNQMV9ERUJVR10gPSB7Cj4gICAgICAgfCAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICBeCj4gZHJpdmVycy9yZXNldC9yZXNldC10aDE1MjAuYzo2
NTk6NDA6IG5vdGU6IChuZWFyIGluaXRpYWxpemF0aW9uIGZvciDigJh0aDE1MjBfZHNwX3Jlc2V0
c1s1XeKAmSkKPiBkcml2ZXJzL3Jlc2V0L3Jlc2V0LXRoMTUyMC5jOjY2MzozODogd2FybmluZzog
aW5pdGlhbGl6ZWQgZmllbGQgb3ZlcndyaXR0ZW4gWy1Xb3ZlcnJpZGUtaW5pdF0KPiAgIDY2MyB8
ICAgICAgICAgW1RIMTUyMF9SRVNFVF9JRF9EU1AxX0FQQl0gPSB7Cj4gICAgICAgfCAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgXgo+IGRyaXZlcnMvcmVzZXQvcmVzZXQtdGgx
NTIwLmM6NjYzOjM4OiBub3RlOiAobmVhciBpbml0aWFsaXphdGlvbiBmb3Ig4oCYdGgxNTIwX2Rz
cF9yZXNldHNbNl3igJkpCj4gICBDSEVDSyAgIGRyaXZlcnMvcmVzZXQvcmVzZXQtdGgxNTIwLmMK
PiBkcml2ZXJzL3Jlc2V0L3Jlc2V0LXRoMTUyMC5jOjY0MzoxMDogd2FybmluZzogSW5pdGlhbGl6
ZXIgZW50cnkgZGVmaW5lZCB0d2ljZQo+IGRyaXZlcnMvcmVzZXQvcmVzZXQtdGgxNTIwLmM6NjU1
OjEwOiAgIGFsc28gZGVmaW5lZCBoZXJlCgpUaGFua3MsIGJ1aWxkaW5nIHdpdGggVz0xIGRvZXMg
c3BvdCB0aGUgaXNzdWUuIFNvbWVob3cgbXkgbG9jYWwgc2V0dXAgb2YKc3BhcnNlIGNhbm5vdCBm
aW5kIHRoZSBkdXBsaWNhdGVkIElEcyBmb3IgZWl0aGVyIHYxIG9yIHYyIG9mIHRoaXMKc2VyaWVz
LCBidXQgR0NDIHdpdGggVz0xIGNvdWxkLgoKV2lsbCBzZW5kIHYzIG9mIHRoZSBzZXJpZXMgd2l0
aCB0aGVzZSBkdXBsaWNhdGVkIElEcyBmaXhlZC4gUmVhbGx5CnRoYW5rcyBmb3IgZmluZGluZyB0
aGUgaXNzdWUuCgpCZXN0IHJlZ2FyZHMKWWFvIFppCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlz
Y3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
