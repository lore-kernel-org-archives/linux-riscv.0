Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19EB7C0219D
	for <linux-riscv@archiver.kernel.org>; Tue, 11 Feb 2025 12:49:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HUBPagny8gYsgp+BRYnEZi64wPPt9qMrRLcSDCsg6X4=; b=zre+bsleybO32E
	ZnHyvnWDF3IqZ0WqqD5l8yiquDCK/uXZb00GMqDrjO1+E+hZpMYZOBjiS6Fw/Adp9DdSq46Lrg4gn
	vfR70xoNCn1Ps5I8hoSj8gQvU2iLpnDAuT3IF46VGa4BOG2HO8LEHhOn75bZRYl2zD7qx72+ZJc4l
	/VyVgV+c4F0BVnH7Ctu1x9ROoNaWdnTdYVY6noBPZPWv9tPDRk82+9wTEko0ufMkDcruimaUv1Ej2
	2KvGTyfqOeV0v0TlyaD/vKlkJZbJWvtVeWKtoJQv1fpD7bknuYH2n/JqTl7q/5iNjwV3MQXp/9V1H
	cGpQnAEIXGTznG0StyQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thphz-00000003pkq-19fm;
	Tue, 11 Feb 2025 12:49:47 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thow2-00000003fl2-1DUz
	for linux-riscv@lists.infradead.org;
	Tue, 11 Feb 2025 12:00:15 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1thovX-0000Xi-9K; Tue, 11 Feb 2025 12:59:43 +0100
Received: from lupine.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::4e] helo=lupine)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1thovT-000PPU-3A;
	Tue, 11 Feb 2025 12:59:39 +0100
Received: from pza by lupine with local (Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1thovT-0005DW-2n;
	Tue, 11 Feb 2025 12:59:39 +0100
Message-ID: <945fb7e913a9c3dcb40697328b7e9842b75fea5c.camel@pengutronix.de>
Subject: Re: [PATCH v4 09/18] reset: thead: Add TH1520 reset controller
 driver
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Michal Wilczynski <m.wilczynski@samsung.com>, Matt Coster
 <Matt.Coster@imgtec.com>, "mturquette@baylibre.com"
 <mturquette@baylibre.com>,  "sboyd@kernel.org" <sboyd@kernel.org>,
 "robh@kernel.org" <robh@kernel.org>, "krzk+dt@kernel.org"
 <krzk+dt@kernel.org>, "conor+dt@kernel.org" <conor+dt@kernel.org>, 
 "drew@pdp7.com" <drew@pdp7.com>, "guoren@kernel.org" <guoren@kernel.org>,
 "wefu@redhat.com" <wefu@redhat.com>, "jassisinghbrar@gmail.com"
 <jassisinghbrar@gmail.com>,  "paul.walmsley@sifive.com"
 <paul.walmsley@sifive.com>, "palmer@dabbelt.com" <palmer@dabbelt.com>, 
 "aou@eecs.berkeley.edu" <aou@eecs.berkeley.edu>, Frank Binns
 <Frank.Binns@imgtec.com>,  "maarten.lankhorst@linux.intel.com"
 <maarten.lankhorst@linux.intel.com>, "mripard@kernel.org"
 <mripard@kernel.org>,  "tzimmermann@suse.de" <tzimmermann@suse.de>,
 "airlied@gmail.com" <airlied@gmail.com>,  "simona@ffwll.ch"
 <simona@ffwll.ch>, "ulf.hansson@linaro.org" <ulf.hansson@linaro.org>, 
 "jszhang@kernel.org" <jszhang@kernel.org>, "m.szyprowski@samsung.com"
 <m.szyprowski@samsung.com>
Cc: "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>, 
	"devicetree@vger.kernel.org"
	 <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	 <linux-kernel@vger.kernel.org>, "linux-riscv@lists.infradead.org"
	 <linux-riscv@lists.infradead.org>, "dri-devel@lists.freedesktop.org"
	 <dri-devel@lists.freedesktop.org>, "linux-pm@vger.kernel.org"
	 <linux-pm@vger.kernel.org>
Date: Tue, 11 Feb 2025 12:59:39 +0100
In-Reply-To: <7d8a3f8d-f369-47dd-8c5f-dcff8d692ea8@samsung.com>
References: <20250128194816.2185326-1-m.wilczynski@samsung.com>
	 <CGME20250128194836eucas1p151c4fc83a17173fd1b79bfc959976301@eucas1p1.samsung.com>
	 <20250128194816.2185326-10-m.wilczynski@samsung.com>
	 <816db99d-7088-4c1a-af03-b9a825ac09dc@imgtec.com>
	 <e83ea320-23f0-41ed-934c-2f1687b55ec1@samsung.com>
	 <48261cdfab6e0bc16e5327664b06728e1894422a.camel@pengutronix.de>
	 <7d8a3f8d-f369-47dd-8c5f-dcff8d692ea8@samsung.com>
User-Agent: Evolution 3.46.4-2 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250211_040014_330937_08A832FC 
X-CRM114-Status: GOOD (  35.55  )
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

T24gTW8sIDIwMjUtMDItMTAgYXQgMTk6MTcgKzAxMDAsIE1pY2hhbCBXaWxjenluc2tpIHdyb3Rl
Ogo+IE9uIDIvNC8yNSAxODoxOCwgUGhpbGlwcCBaYWJlbCB3cm90ZToKPiA+IE9uIE1vLCAyMDI1
LTAyLTAzIGF0IDE5OjE1ICswMTAwLCBNaWNoYWwgV2lsY3p5bnNraSB3cm90ZToKWy4uLl0KPiA+
ID4gSSB0aGluayB0aGlzIGlzIHJlcXVpcmVkIGJlY2F1c2UgdGhlIE1FTSBjbG9jayBnYXRlIGlz
IHNvbWVob3cgYnJva2VuCj4gPiA+IGFuZCBtYXJrZWQgYXMgJ3Jlc2VydmVkJyBpbiBtYW51YWws
IHNvIGluc3RlYWQgYXMgYSB3b3JrYXJvdW5kLCBzaW5jZSB3ZQo+ID4gPiBjYW4ndCByZWxpYWJs
eSBlbmFibGUgdGhlICdtZW0nIGNsb2NrIGl0J3MgYSBnb29kIGlkZWEgdG8gcmVzZXQgdGhlCj4g
PiA+IHdob2xlIENMS0dFTiBvZiB0aGUgR1BVLgo+ID4gCj4gPiBJZiB0aGlzIGlzIGEgd29ya2Fy
b3VuZCBmb3IgYnJva2VuIGdhdGluZyBvZiB0aGUgIm1lbSIgY2xvY2ssIHdvdWxkIGl0Cj4gPiBi
ZSBwb3NzaWJsZSAoYW5kIHJlYXNvbmFibGUpIHRvIG1ha2UgdGhpcyBhIHNlcGFyYXRlIHJlc2V0
IGNvbnRyb2wgdGhhdAo+ID4gaXMgaGFuZGxlZCBieSB0aGUgY2xvY2sgZHJpdmVyPyAuLi4KPiAK
PiBUaGFuayB5b3UgZm9yIHRoZSBkZXRhaWxlZCBmZWVkYmFjaywgUGhpbGlwcC4KPiAKPiBBZnRl
ciBmdXJ0aGVyIGNvbnNpZGVyYXRpb24sIEkgYmVsaWV2ZSBrZWVwaW5nIHRoZSBjdXJyZW50IHJl
c2V0IGRyaXZlcgo+IGltcGxlbWVudGF0aW9uIHdvdWxkIGJlIHByZWZlcmFibGUgdG8gbW92aW5n
IHRoZSBDTEtHRU4gcmVzZXQgaGFuZGxpbmcKPiB0byB0aGUgY2xvY2sgZHJpdmVyLiBXaGlsZSBp
dCdzIHRlY2huaWNhbGx5IHBvc3NpYmxlIHRvIGltcGxlbWVudCB0aGlzCj4gaW4gdGhlIGNsb2Nr
IGRyaXZlciwgSSBoYXZlIGNvbmNlcm5zIGFib3V0IHRoZSBhZGRlZCBjb21wbGV4aXR5Ogo+IAo+
IDEuIFdlJ2QgbmVlZCB0byBleHBvc2UgdGhlIENMS0dFTiByZXNldCBzZXBhcmF0ZWx5IGluIHRo
ZSByZXNldCBkcml2ZXIKCkknZCBleHBlY3QgdGhpcyB0byBzaW1wbGlmeSB0aGUgcmVzZXQgZHJp
dmVyLgoKPiAyLiBUaGUgY2xvY2sgZHJpdmVyJ3MgZHQtYmluZGluZ3Mgd291bGQgbmVlZCBtb2Rp
ZmljYXRpb24gdG8gYWRkIGFuCj4gICAgb3B0aW9uYWwgcmVzZXRzIHByb3BlcnR5CgpJZiBpdCBk
ZXNjcmliZXMgdGhlIGhhcmR3YXJlIGNvcnJlY3RseSwgdGhhdCBzaG91bGQgYmUgZmluZS4KCj4g
My4gV2UnZCBuZWVkIGN1c3RvbSBjbGtfb3BzIGZvciBhbGwgdGhyZWUgY2xvY2sgZ2F0ZXMgKGlu
Y2x1ZGluZyBhIGR1bW15Cj4gICAgJ21lbScgZ2F0ZSkKPiA0LiBFYWNoIGNsb2NrIGdhdGUncyAu
ZW5hYmxlIG9wZXJhdGlvbiB3b3VsZCBuZWVkIHRvIGhhbmRsZSBDTEtHRU4gcmVzZXQKPiAgICBk
ZWFzc2VydGlvbgoKSSBhY2NlcHQgdGhlc2UgYXJndW1lbnRzLCBhcyBJIGhhdmUgbm8gZ29vZCBm
ZWVsaW5nIGZvciBob3cgbXVjaApjb21wbGV4aXR5IHRoaXMgd291bGQgYWN0dWFsbHkgYWRkLgoK
SW4gbXkgbWluZCBpdCBzaG91bGRuJ3QgYmUgbXVjaDogdGhlIEdQVSBjbG9ja3MgY291bGQgYWxs
IHNoYXJlIHRoZQpzYW1lIHJlZmNvdW50ZWQgaW1wbGVtZW50YXRpb24uIFRoZSBmaXJzdCBjbG9j
ayB0byBnZXQgZW5hYmxlZCB3b3VsZAp1bmdhdGUgYm90aCBHUFVfQ09SRSBhbmQgR1BVX0NGR19B
Q0xLIGdhdGVzIGFuZCBkZWFzc2VydApHUFVfU1dfQ0xLR0VOX1JTVCwgYWxsIGluIG9uZSBwbGFj
ZS4gVGhlIHJlbWFpbmluZyBlbmFibGUocykgd291bGQgYmUKbm8tb3BzLiBXb3VsZCB0aGF0IHdv
cms/CgpXaGV0aGVyIGEgc2VwYXJhdGUgImR1bW15IiBNRU0gY2xvY2sgZm9yIHRoZSBEVCBiaW5k
aW5ncyBpcyBhZGRlZCBvcgpub3Qgd291bGQgbm90IG1ha2UgYSBkaWZmZXJlbmNlLgoKPiBXaGls
ZSB0aGUgY2xvY2sgZnJhbWV3b3JrIGNvdWxkIHRoZW9yZXRpY2FsbHkgaGFuZGxlIHRoaXMsIHRo
ZXJlJ3Mgbm8KPiBjbGVhbiB3YXkgdG8gZXhwcmVzcyB0aGUgcmVxdWlyZW1lbnQgdGhhdCB0aGUg
Q0xLR0VOIHJlc2V0IHNob3VsZCBvbmx5Cj4gYmUgZGVhc3NlcnRlZCBhZnRlciBhbGwgY2xvY2tz
IGluIHRoZSBncm91cCBhcmUgZW5hYmxlZC4gV2UgY291bGQKPiBpbXBsZW1lbnQgdGhpcyBleHBs
aWNpdGx5LCBidXQgaXQgd291bGQgbWFrZSB0aGUgY29kZSBtb3JlIGNvbXBsZXggYW5kCj4gaGFy
ZGVyIHRvIHVuZGVyc3RhbmQuCgpEb2luZyB0aGlzIGluIHRoZSBjbG9jayBkcml2ZXIgd291bGQg
aGF2ZSB0aGUgYWR2YW50YWdlIG9mIGNsa19lbmFibGVkCkdQVSBjbG9ja3MgYWN0dWFsbHkgc3Rh
eWluZyBwaHlzaWNhbGx5IGVuYWJsZWQsIHdpdGhvdXQgdGhlIHJlc2V0CmRyaXZlciBkaXNhYmxp
bmcgdGhlbSB2aWEgR1BVX1NXX0NMS0dFTl9SU1QgZnJvbSB0aGUgb3V0c2lkZS4KCj4gVGhlIGN1
cnJlbnQgc29sdXRpb24gaW4gdGhlIHJlc2V0IGRyaXZlciBpcyBzaW1wbGVyIGFuZCBjbGVhcmVy
IC0gaXQKPiB0cmVhdHMgdGhpcyBhcyB3aGF0IGl0IHJlYWxseSBpczogYSBUSDE1MjAtc3BlY2lm
aWMgcmVzZXQgc2VxdWVuY2UuCgpZZXMuIFdoYXQgdGhpcyBhbHNvIGlzOiBhIHdvcmthcm91bmQg
Zm9yIGEgU29DIHNwZWNpZmljIGRlZmVjdCBpbiB0aGUKY2xvY2sgdHJlZS4gSSB0aGluayBpdCBi
ZWxvbmdzIGluIHRoZSBjbG9jayBkcml2ZXIgYmVjYXVzZSBvZiB0aGlzLgoKClsuLi5dCj4gUmVn
YXJkaW5nIHRoZSBkZWxheSBiZXR3ZWVuIGNsb2NrIGVuYWJsZSBhbmQgcmVzZXQgZGVhc3NlcnQg
LSBmb3IgU29Dcwo+IGxpa2UgQlBJLUYzIHdpdGggYSBzaW5nbGUgcmVzZXQgbGluZSwgaW1wbGVt
ZW50aW5nIHRoaXMgaW4gdGhlIEdQVQo+IGNvbnN1bWVyIGRyaXZlciBtYWtlcyBwZXJmZWN0IHNl
bnNlLiBIb3dldmVyLCBmb3IgdGhlIFQtSEVBRCBTb0MsIG1vdmluZwo+IHRoZSBkZWxheSB0aGVy
ZSB3b3VsZCBhY3R1YWxseSBjb21wbGljYXRlIHRoaW5ncyBzaW5jZSB3ZSBuZWVkIHRvIG1hbmFn
ZQo+IGJvdGggdGhlIENMS0dFTiBhbmQgR1BVIHJlc2V0IGxpbmVzIGluIGEgc3BlY2lmaWMgc2Vx
dWVuY2UuIEhhdmluZyB0aGlzCj4gaGFuZGxlZCBlbnRpcmVseSB3aXRoaW4gdGhlIHJlc2V0IGRy
aXZlciBrZWVwcyB0aGUgaW1wbGVtZW50YXRpb24KPiBjbGVhbmVyLgoKWW91IGNvdWxkIGRlbGF5
IGluIGJvdGggcGxhY2VzLCBpdCdzIGp1c3QgYSBtaWNyb3NlY29uZCBhZnRlciBhbGwuCldoZXRo
ZXIgdGhlIHdvcmthcm91bmQgaXMgaW1wbGVtZW50ZWQgaW4gdGhlIHJlc2V0IGRyaXZlciBvciBp
biB0aGUKY2xvY2sgZHJpdmVyLMKgSSB3b3VsZG4ndCB3YW50IHRoZSBHUFUgZHJpdmVyIHRvIGhh
dmUgdG8gY2FycnkgYSBzcGVjaWFsCmNhc2UgZm9yIFRIMTUyMC4KCj4gRG9lcyB0aGlzIHJlYXNv
bmluZyBhbGlnbiB3aXRoIHlvdXIgdGhvdWdodHM/IEknbSBoYXBweSB0byBleHBsb3JlIHRoZQo+
IGNsb2NrIGRyaXZlciBhcHByb2FjaCBmdXJ0aGVyIGlmIHlvdSBzdGlsbCBzZWUgc2lnbmlmaWNh
bnQgYWR2YW50YWdlcyB0bwo+IHRoYXQgc29sdXRpb24uCgpJIHdvbid0IG9iamVjdCB0byBjYXJy
eSB0aGlzIGluIHRoZSByZXNldCBkcml2ZXIgaWYgdGhlIGNsb2NrCmltcGxlbWVudGF0aW9uIHR1
cm5zIG91dCB0byBiZSB1bnJlYXNvbmFibHkgY29tcGxleCwgYnV0IEkgY3VycmVudGx5CmRvbid0
IGV4cGVjdCB0aGF0IHRvIGJlIHRoZSBjYXNlLiBQbGVhc2UgZ2l2ZSBpdCBhIHNob3QuCgpyZWdh
cmRzClBoaWxpcHAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQu
b3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlz
Y3YK
