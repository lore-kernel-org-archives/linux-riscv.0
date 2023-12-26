Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5E40C3DA6E
	for <linux-riscv@archiver.kernel.org>; Tue, 26 Dec 2023 03:02:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AiAZQFUhP/4+oyaNLeKQR8OufTf7kdWQsuXKXuqfYvw=; b=zKVrrnsV0yGcws
	uq6zQ7fDzOqBCwwLEdeHzKUvV0NdAYbV3fbIjT3ULbT7J+/0S/TcbtcfvgW+7a8+XLDPDaV4WGbQJ
	H+AhdSjaHlwzt0mtVwT7HdAg6oYGmgoJlfqVkZ1RHkIEZAvlvltIqvr6du1UqPX0+o59SiNpRVDFw
	U0M3wRHT5fhOTSJcgBksurNX9pTuzEyV7qYUSj6zmAhudAiS4IQ3NmSBpWP4GOoiSaWB1UpU9Arwj
	IudT66dEiipgH4uz0o7Xj0IeBa1GGjv3n5b4hZEUvUWuWLV4mT1uhYCahAkvEu0vmIPfsmFS49Oed
	oHL35xcviqXDY/i9B03Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rHxiA-00Bc7t-27;
	Tue, 26 Dec 2023 03:02:30 +0000
Received: from 60-248-80-70.hinet-ip.hinet.net ([60.248.80.70] helo=Atcsqr.andestech.com)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rHxi5-00Bc7U-1X;
	Tue, 26 Dec 2023 03:02:27 +0000
Received: from mail.andestech.com (ATCPCS16.andestech.com [10.0.1.222])
	by Atcsqr.andestech.com with ESMTP id 3BQ301qO075346;
	Tue, 26 Dec 2023 11:00:01 +0800 (+08)
	(envelope-from peterlin@andestech.com)
Received: from APC323 (10.0.12.98) by ATCPCS16.andestech.com (10.0.1.222) with
 Microsoft SMTP Server id 14.3.498.0; Tue, 26 Dec 2023 11:00:00 +0800
Date: Tue, 26 Dec 2023 10:59:55 +0800
From: Yu-Chien Peter Lin <peterlin@andestech.com>
To: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Subject: Re: [PATCH v6 00/16] Support Andes PMU extension
Message-ID: <ZYpBqwbI8vMwIpXH@APC323>
References: <20231225103308.1557548-1-peterlin@andestech.com>
 <CA+V-a8t7g8ctPQrwdB9tgtmgtGfqQ-k2N-1sSwnjB-b1F71-AQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CA+V-a8t7g8ctPQrwdB9tgtmgtGfqQ-k2N-1sSwnjB-b1F71-AQ@mail.gmail.com>
User-Agent: Mutt/2.2.12 (2023-09-09)
X-Originating-IP: [10.0.12.98]
X-DNSRBL: 
X-MAIL: Atcsqr.andestech.com 3BQ301qO075346
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231225_190225_975032_3C4FD7ED 
X-CRM114-Status: GOOD (  22.21  )
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
Cc: mark.rutland@arm.com, irogers@google.com, heiko@sntech.de, geert+renesas@glider.be, alexander.shishkin@linux.intel.com, paul.walmsley@sifive.com, linux-kernel@vger.kernel.org, conor.dooley@microchip.com, guoren@kernel.org, krzysztof.kozlowski+dt@linaro.org, linux-riscv@lists.infradead.org, will@kernel.org, linux-renesas-soc@vger.kernel.org, tim609@andestech.com, samuel@sholland.org, anup@brainfault.org, dminus@andestech.com, magnus.damm@gmail.com, jernej.skrabec@gmail.com, peterz@infradead.org, wens@csie.org, mingo@redhat.com, linux-arm-kernel@lists.infradead.org, inochiama@outlook.com, linux-sunxi@lists.linux.dev, ajones@ventanamicro.com, devicetree@vger.kernel.org, conor+dt@kernel.org, aou@eecs.berkeley.edu, andre.przywara@arm.com, locus84@andestech.com, acme@kernel.org, prabhakar.mahadev-lad.rj@bp.renesas.com, robh+dt@kernel.org, atishp@atishpatra.org, namhyung@kernel.org, tglx@linutronix.de, jszhang@kernel.org, ycliang@andestech.com, n.shubin@yadro.com, rdunlap@infradead.org, chao.wei@sophgo.com, adrian.hunter@intel.com, conor@kernel.org, linux-perf-users@vger.kernel.org, evan@rivosinc.com, palmer@dabbelt.com, jolsa@kernel.org, unicorn_wang@outlook.com, wefu@redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

SGkgUHJhYmhha2FyLAoKT24gTW9uLCBEZWMgMjUsIDIwMjMgYXQgMDk6MDY6MDRQTSArMDAwMCwg
TGFkLCBQcmFiaGFrYXIgd3JvdGU6Cj4gSGkgTGluLXNhbiwKPiAKPiBPbiBNb24sIERlYyAyNSwg
MjAyMyBhdCAxMDozN+KAr0FNIFl1IENoaWVuIFBldGVyIExpbgo+IDxwZXRlcmxpbkBhbmRlc3Rl
Y2guY29tPiB3cm90ZToKPiA+Cj4gPiBIaSBBbGwsCj4gPgo+ID4gVGhpcyBwYXRjaCBzZXJpZXMg
aW50cm9kdWNlcyB0aGUgQW5kZXMgUE1VIGV4dGVuc2lvbiwgd2hpY2ggc2VydmVzCj4gPiB0aGUg
c2FtZSBwdXJwb3NlIGFzIFNzY29mcG1mLiBUbyB1c2UgRkRULWJhc2VkIHByb2JpbmcgZm9yIGhh
cmR3YXJlCj4gPiBzdXBwb3J0IG9mIHRoZSBQTVUgZXh0ZW5zaW9ucywgd2UgZmlyc3QgY29udmVy
dCBULUhlYWQncyBQTVUgdG8gQ1BVCj4gPiBmZWF0dXJlIGFsdGVybmF0aXZlLCB0aGVuIGFkZCBB
bmRlcyBQTVUgYWx0ZXJuYXRpdmVzLgo+ID4KPiA+IEl0cyBub24tc3RhbmRhcmQgbG9jYWwgaW50
ZXJydXB0IGlzIGFzc2lnbmVkIHRvIGJpdCAxOCBpbiB0aGUKPiA+IGN1c3RvbSBTLW1vZGUgbG9j
YWwgaW50ZXJydXB0IGVuYWJsZS9wZW5kaW5nIHJlZ2lzdGVycyAoc2xpZS9zbGlwKSwKPiA+IHdo
aWxlIHRoZSBpbnRlcnJ1cHQgY2F1c2UgaXMgKDI1NiArIDE4KS4KPiA+Cj4gPiBNYWlubGluZSBP
cGVuU0JJIGhhcyBzdXBwb3J0ZWQgQW5kZXMgUE1VIGV4dGVuc2lvbjoKPiA+IC0gaHR0cHM6Ly9n
aXRodWIuY29tL3Jpc2N2LXNvZnR3YXJlLXNyYy9vcGVuc2JpL3RyZWUvbWFzdGVyCj4gPiBMaW51
eCBwYXRjaGVzIChiYXNlZCBvbiB2Ni43LXJjNykgY2FuIGJlIGZvdW5kIG9uIEFuZGVzIFRlY2hu
b2xvZ3kgR2l0SHViCj4gPiAtIGh0dHBzOi8vZ2l0aHViLmNvbS9hbmRlc3RlY2gvbGludXgvY29t
bWl0cy9hbmRlcy1wbXUtc3VwcG9ydC12Ngo+ID4KPiA+IFRoZSBQTVUgZGV2aWNlIHRyZWUgbm9k
ZSB1c2VkIG9uIEFYNDVNUDoKPiA+IC0gaHR0cHM6Ly9naXRodWIuY29tL3Jpc2N2LXNvZnR3YXJl
LXNyYy9vcGVuc2JpL2Jsb2IvbWFzdGVyL2RvY3MvcG11X3N1cHBvcnQubWQjZXhhbXBsZS0zCj4g
Pgo+ID4gTG9jdXMgV2VpLUhhbiBDaGVuICgxKToKPiA+ICAgcmlzY3Y6IGFuZGVzOiBTdXBwb3J0
IHNwZWNpZnlpbmcgc3ltYm9saWMgZmlybXdhcmUgYW5kIGhhcmR3YXJlIHJhdwo+ID4gICAgIGV2
ZW50cwo+ID4KPiA+IFl1IENoaWVuIFBldGVyIExpbiAoMTUpOgo+ID4gICByaXNjdjogZXJyYXRh
OiBSZW5hbWUgZGVmaW5lcyBmb3IgQW5kZXMKPiA+ICAgaXJxY2hpcC9yaXNjdi1pbnRjOiBBbGxv
dyBsYXJnZSBub24tc3RhbmRhcmQgaW50ZXJydXB0IG51bWJlcgo+ID4gICBpcnFjaGlwL3Jpc2N2
LWludGM6IEludHJvZHVjZSBBbmRlcyBoYXJ0LWxldmVsIGludGVycnVwdCBjb250cm9sbGVyCj4g
PiAgIGR0LWJpbmRpbmdzOiByaXNjdjogQWRkIEFuZGVzIGludGVycnVwdCBjb250cm9sbGVyIGNv
bXBhdGlibGUgc3RyaW5nCj4gPiAgIHJpc2N2OiBkdHM6IHJlbmVzYXM6IHI5YTA3ZzA0M2Y6IFVw
ZGF0ZSBjb21wYXRpYmxlIHN0cmluZyB0byB1c2UgQW5kZXMKPiA+ICAgICBJTlRDCj4gPiAgIHBl
cmY6IFJJU0MtVjogRWxpbWluYXRlIHJlZHVuZGFudCBpbnRlcnJ1cHQgZW5hYmxlL2Rpc2FibGUg
b3BlcmF0aW9ucwo+ID4gICBSSVNDLVY6IE1vdmUgVC1IZWFkIFBNVSB0byBDUFUgZmVhdHVyZSBh
bHRlcm5hdGl2ZSBmcmFtZXdvcmsKPiA+ICAgcGVyZjogUklTQy1WOiBJbnRyb2R1Y2UgQW5kZXMg
UE1VIGZvciBwZXJmIGV2ZW50IHNhbXBsaW5nCj4gPiAgIGR0LWJpbmRpbmdzOiByaXNjdjogQWRk
IFQtSGVhZCBQTVUgZXh0ZW5zaW9uIGRlc2NyaXB0aW9uCj4gPiAgIGR0LWJpbmRpbmdzOiByaXNj
djogQWRkIEFuZGVzIFBNVSBleHRlbnNpb24gZGVzY3JpcHRpb24KPiA+ICAgcmlzY3Y6IGR0czog
YWxsd2lubmVyOiBBZGQgVC1IZWFkIFBNVSBleHRlbnNpb24gZm9yIHN1bjIwaS1kMXMKPiA+ICAg
cmlzY3Y6IGR0czogc29waGdvOiBBZGQgVC1IZWFkIFBNVSBleHRlbnNpb24gZm9yIGN2MTgwMGIK
PiA+ICAgcmlzY3Y6IGR0czogc29waGdvOiBBZGQgVC1IZWFkIFBNVSBleHRlbnNpb24gZm9yIHNn
MjA0Mgo+ID4gICByaXNjdjogZHRzOiB0aGVhZDogQWRkIFQtSGVhZCBQTVUgZXh0ZW5zaW9uIGZv
ciB0aDE1MjAKPiA+ICAgcmlzY3Y6IGR0czogcmVuZXNhczogQWRkIEFuZGVzIFBNVSBleHRlbnNp
b24gZm9yIHI5YTA3ZzA0M2YKPiA+Cj4gVGhlIGFib3ZlIHBhdGNoZXMgZG9udCBhcHBseSBjbGVh
bmx5IG9uIHRvcCBvZiBiZWxvdyBicmFuY2hlcy4gQ2FuIHlvdQo+IHBsZWFzZSByZWJhc2UgYW5k
IHJlLXNlbmQuCgpTdXJlLCB3aWxsIGRvLgoKPiBodHRwczovL2dpdC5rZXJuZWwub3JnL3B1Yi9z
Y20vbGludXgva2VybmVsL2dpdC9wYWxtZXIvbGludXguZ2l0L2xvZy8/aD1maXhlcwo+IGh0dHBz
Oi8vZ2l0Lmtlcm5lbC5vcmcvcHViL3NjbS9saW51eC9rZXJuZWwvZ2l0L3BhbG1lci9saW51eC5n
aXQvbG9nLz9oPWZvci1uZXh0Cj4gaHR0cHM6Ly9naXQua2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4
L2tlcm5lbC9naXQvZ2VlcnQvcmVuZXNhcy1kZXZlbC5naXQvbG9nLz9oPXJlbmVzYXMtZHRzLWZv
ci12Ni44CgpUaGFua3MgZm9yIHRoZSBwb2ludGVycy4KCkJlc3QgcmVnYXJkcywKUGV0ZXIgTGlu
Cgo+IENoZWVycywKPiBQcmFiaGFrYXIKPiAKPiA+ICAuLi4vZGV2aWNldHJlZS9iaW5kaW5ncy9y
aXNjdi9jcHVzLnlhbWwgICAgICAgfCAgIDYgKy0KPiA+ICAuLi4vZGV2aWNldHJlZS9iaW5kaW5n
cy9yaXNjdi9leHRlbnNpb25zLnlhbWwgfCAgMTMgKysKPiA+ICBhcmNoL3Jpc2N2L0tjb25maWcu
ZXJyYXRhICAgICAgICAgICAgICAgICAgICAgfCAgMTMgLS0KPiA+ICBhcmNoL3Jpc2N2L2Jvb3Qv
ZHRzL2FsbHdpbm5lci9zdW4yMGktZDFzLmR0c2kgfCAgIDIgKy0KPiA+ICBhcmNoL3Jpc2N2L2Jv
b3QvZHRzL3JlbmVzYXMvcjlhMDdnMDQzZi5kdHNpICAgfCAgIDQgKy0KPiA+ICBhcmNoL3Jpc2N2
L2Jvb3QvZHRzL3NvcGhnby9jdjE4MDBiLmR0c2kgICAgICAgfCAgIDIgKy0KPiA+ICBhcmNoL3Jp
c2N2L2Jvb3QvZHRzL3NvcGhnby9zZzIwNDItY3B1cy5kdHNpICAgfCAxMjggKysrKysrKysrLS0t
LS0tLS0tCj4gPiAgYXJjaC9yaXNjdi9ib290L2R0cy90aGVhZC90aDE1MjAuZHRzaSAgICAgICAg
IHwgICA4ICstCj4gPiAgYXJjaC9yaXNjdi9lcnJhdGEvYW5kZXMvZXJyYXRhLmMgICAgICAgICAg
ICAgIHwgIDEwICstCj4gPiAgYXJjaC9yaXNjdi9lcnJhdGEvdGhlYWQvZXJyYXRhLmMgICAgICAg
ICAgICAgIHwgIDE5IC0tLQo+ID4gIGFyY2gvcmlzY3YvaW5jbHVkZS9hc20vZXJyYXRhX2xpc3Qu
aCAgICAgICAgICB8ICAxOSArLS0KPiA+ICBhcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2h3Y2FwLmgg
ICAgICAgICAgICAgICAgfCAgIDIgKwo+ID4gIGFyY2gvcmlzY3YvaW5jbHVkZS9hc20vdmVuZG9y
aWRfbGlzdC5oICAgICAgICB8ICAgMiArLQo+ID4gIGFyY2gvcmlzY3Yva2VybmVsL2FsdGVybmF0
aXZlLmMgICAgICAgICAgICAgICB8ICAgMiArLQo+ID4gIGFyY2gvcmlzY3Yva2VybmVsL2NwdWZl
YXR1cmUuYyAgICAgICAgICAgICAgICB8ICAgMiArCj4gPiAgZHJpdmVycy9pcnFjaGlwL2lycS1y
aXNjdi1pbnRjLmMgICAgICAgICAgICAgIHwgIDg5ICsrKysrKysrKystLQo+ID4gIGRyaXZlcnMv
cGVyZi9LY29uZmlnICAgICAgICAgICAgICAgICAgICAgICAgICB8ICAyNyArKysrCj4gPiAgZHJp
dmVycy9wZXJmL3Jpc2N2X3BtdV9zYmkuYyAgICAgICAgICAgICAgICAgIHwgIDQ3ICsrKysrLS0K
PiA+ICBpbmNsdWRlL2xpbnV4L3NvYy9hbmRlcy9pcnEuaCAgICAgICAgICAgICAgICAgfCAgMTgg
KysrCj4gPiAgLi4uL2FyY2gvcmlzY3YvYW5kZXMvYXg0NS9maXJtd2FyZS5qc29uICAgICAgIHwg
IDY4ICsrKysrKysrKysKPiA+ICAuLi4vYXJjaC9yaXNjdi9hbmRlcy9heDQ1L2luc3RydWN0aW9u
cy5qc29uICAgfCAxMjcgKysrKysrKysrKysrKysrKysKPiA+ICAuLi4vYXJjaC9yaXNjdi9hbmRl
cy9heDQ1L21lbW9yeS5qc29uICAgICAgICAgfCAgNTcgKysrKysrKysKPiA+ICAuLi4vYXJjaC9y
aXNjdi9hbmRlcy9heDQ1L21pY3JvYXJjaC5qc29uICAgICAgfCAgNzcgKysrKysrKysrKysKPiA+
ICB0b29scy9wZXJmL3BtdS1ldmVudHMvYXJjaC9yaXNjdi9tYXBmaWxlLmNzdiAgfCAgIDEgKwo+
ID4gIDI0IGZpbGVzIGNoYW5nZWQsIDU5MiBpbnNlcnRpb25zKCspLCAxNTEgZGVsZXRpb25zKC0p
Cj4gPiAgY3JlYXRlIG1vZGUgMTAwNjQ0IGluY2x1ZGUvbGludXgvc29jL2FuZGVzL2lycS5oCj4g
PiAgY3JlYXRlIG1vZGUgMTAwNjQ0IHRvb2xzL3BlcmYvcG11LWV2ZW50cy9hcmNoL3Jpc2N2L2Fu
ZGVzL2F4NDUvZmlybXdhcmUuanNvbgo+ID4gIGNyZWF0ZSBtb2RlIDEwMDY0NCB0b29scy9wZXJm
L3BtdS1ldmVudHMvYXJjaC9yaXNjdi9hbmRlcy9heDQ1L2luc3RydWN0aW9ucy5qc29uCj4gPiAg
Y3JlYXRlIG1vZGUgMTAwNjQ0IHRvb2xzL3BlcmYvcG11LWV2ZW50cy9hcmNoL3Jpc2N2L2FuZGVz
L2F4NDUvbWVtb3J5Lmpzb24KPiA+ICBjcmVhdGUgbW9kZSAxMDA2NDQgdG9vbHMvcGVyZi9wbXUt
ZXZlbnRzL2FyY2gvcmlzY3YvYW5kZXMvYXg0NS9taWNyb2FyY2guanNvbgo+ID4KPiA+IC0tCj4g
PiAyLjM0LjEKPiA+Cj4gPgo+ID4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KPiA+IGxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdAo+ID4gbGludXgtcmlzY3ZA
bGlzdHMuaW5mcmFkZWFkLm9yZwo+ID4gaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1h
bi9saXN0aW5mby9saW51eC1yaXNjdgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3Rz
LmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5m
by9saW51eC1yaXNjdgo=
