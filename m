Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC188CF258C
	for <linux-riscv@archiver.kernel.org>; Wed, 19 Nov 2025 08:27:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iw284LwKvUvXy82mupFQ28J/0hnRpJ60J2zRGGDo87s=; b=f+I2DRNXxw2Kd8
	IZ0H397sF8d3TCL2+MybdbMjHojDz3NrTx9LSDUwig29HZb5BwsFRp0PfMd2ChH2/c8U0JRos6CK9
	5+aT0nJ1cbjDh+fE8CSihgLC6MnxY66lZiAaDXBbdze5KAdEFQCabeUmX95Zi9poS17BkaoIUU9f+
	Zp0fQomLJqaP0aFS9oJegbhqA2uKnrRXLepSEaVDBI3YX5Xf8MQkLfAVTijW6absUvIIVTz6aKzPh
	1I98aBIVL/gzfDhrZC8mHRn/HV3mgu9B36DRbAXkyp+/pszL7/FGlSklRSmgKYYgxTNsMYnHk+pzZ
	OHdistPamp8nnF8qXPkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLdX0-00000002n4E-0yz3;
	Wed, 19 Nov 2025 08:27:14 +0000
Received: from freeshell.de ([116.202.128.144])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLdWx-00000002n3R-3BgY
	for linux-riscv@lists.infradead.org;
	Wed, 19 Nov 2025 08:27:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=freeshell.de;
	s=s2025; t=1763540782;
	bh=KDATMTQASj0ogtJXDKKKoCaehevGMrQdp6yw0/i9GSk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=PFuYwollG48FOfW+d84zZ37q923IyOP1r5FwLM+qn5Uhyegn00domWLOrj+GUEW5o
	 HkyYwWku3ycCa80xS6Io0GsNCw+Wsw3tnhQL0LWUsvNcY8TLrftdwbaZEZ617YLibC
	 fuiFrDhSZdctwrXGCy+QShFJPsZOqbQhvQF8kZM6oy5ZPbsXLFTX3waokFP5tfIJQx
	 /3NzjoDNXA3SCQbPBzi2eKVN1Z5T7j9yH7epxwIJgl4zghNH7T+Rm+ANQ6io3+xdM8
	 go3cBrUYOhPG+IGvTtIBijU7fETpTvRLl+/5FnPlF7S8joBS6MbA8cciV/jIxQn0ZC
	 HM85dzK71HEIA==
Received: from [192.168.2.54] (unknown [143.105.117.136])
	(Authenticated sender: e)
	by freeshell.de (Postfix) with ESMTPSA id F23AEB2201A7;
	Wed, 19 Nov 2025 09:26:18 +0100 (CET)
Message-ID: <841b4250-0ac6-4b49-8c8e-a6d6bc675a1f@freeshell.de>
Date: Wed, 19 Nov 2025 00:26:16 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/8] Add support for StarFive VisionFive 2 Lite board
To: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>,
 Conor Dooley <conor@kernel.org>, Hal Feng <hal.feng@starfivetech.com>
Cc: Emil Renner Berthing <emil.renner.berthing@canonical.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Bjorn Helgaas <bhelgaas@google.com>,
 Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?=
 <kwilczynski@kernel.org>, Lorenzo Pieralisi <lpieralisi@kernel.org>,
 Manivannan Sadhasivam <mani@kernel.org>, Palmer Dabbelt
 <palmer@dabbelt.com>, Paul Walmsley <pjw@kernel.org>,
 "Rafael J . Wysocki" <rafael@kernel.org>, Rob Herring <robh@kernel.org>,
 Viresh Kumar <viresh.kumar@linaro.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <20251107095530.114775-1-hal.feng@starfivetech.com>
 <CAJM55Z_rczBo4D3HsC90QW1=fp3NWgK-tsEo6LHTZNXEBHTDqA@mail.gmail.com>
 <ZQ2PR01MB13076544E2136E7E7C2EEDA1E6CD2@ZQ2PR01MB1307.CHNPR01.prod.partner.outlook.cn>
 <CAJM55Z9KyNK1n4i9FxbLor4HTQKqK8WKA2svjPVvKXihw_E+sg@mail.gmail.com>
 <4a55301a-ef7e-4b47-8151-621cfba36ddd@freeshell.de>
 <CAJM55Z-bRdNmnRZ7wi3PMOkzGYrxQEGk+7F67Pdu4WXwKmTjCQ@mail.gmail.com>
 <ZQ2PR01MB13075CDDEFC2F03C837E1B31E6C92@ZQ2PR01MB1307.CHNPR01.prod.partner.outlook.cn>
 <b33919e9-e100-4629-92cb-d1ec3dd756a7@freeshell.de>
 <ZQ2PR01MB1307DADE17FFEFCE70C3F391E6D62@ZQ2PR01MB1307.CHNPR01.prod.partner.outlook.cn>
 <20251118-throwing-marina-14a87d65465a@spud>
 <1f96a267-f5c6-498e-a2c4-7a47a73ea7e7@canonical.com>
Content-Language: en-US
From: E Shattow <e@freeshell.de>
In-Reply-To: <1f96a267-f5c6-498e-a2c4-7a47a73ea7e7@canonical.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251119_002712_276818_0C392D03 
X-CRM114-Status: GOOD (  35.21  )
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

Ck9uIDExLzE4LzI1IDIzOjA0LCBIZWlucmljaCBTY2h1Y2hhcmR0IHdyb3RlOgo+IE9uIDExLzE5
LzI1IDAwOjEwLCBDb25vciBEb29sZXkgd3JvdGU6Cj4+IE9uIFR1ZSwgTm92IDE4LCAyMDI1IGF0
IDAyOjEyOjU4QU0gKzAwMDAsIEhhbCBGZW5nIHdyb3RlOgo+Pj4+IEFsbCwKPj4+Pgo+Pj4+IEkg
cmVwZWF0IHRoYXQgdGhlIHN1Z2dlc3Rpb24gd2FzIG1hZGUgbW9udGhzIGFnbyAoYnkgSGFsKSB0
byBzcGxpdAo+Pj4+IG91dCB0aGUKPj4+PiBPUFAgdGFibGVzIHBlci1ib2FyZCBmcm9tIHRoZSBw
ZXJpb2Qgb2YgdGltZSB3aGVuIEkgd2FzIGNvbXBsYWluaW5nCj4+Pj4gYWJvdXQKPj4+PiAxLjVH
SHogSkgtNzExMCBvcGVyYXRpb24gcHVzaGluZyBURFAgaW50byBvdmVyLXRlbXBlcmF0dXJlIHRo
ZXJtYWwKPj4+PiBsaW1pdAo+Pj4+IG9uIE1pbGstViBNYXJzIENNIFNvTS4KPj4+Pgo+Pj4+IFdo
ZXRoZXIgb3Igbm90IEpINzExMFMgaXMgYSBuZXcgY29tcGF0aWJsZSBzaG91bGQgZm9sbG93IHBy
ZWNlZGVuY2UgaW4KPj4+PiBMaW51eCBkZXZlbG9wbWVudC4gSkgtNzExMFMgaXMgZXZpZGVudGx5
IHRoZSBzYW1lIHRhcGUtb3V0IGFzCj4+Pj4gSkgtNzExMCBhbmQKPj4+PiBob3dldmVyIHlvdSBk
ZWFsIHdpdGggdGhhdCBpbiBMaW51eCBpcyB0aGUgYXBwcm9wcmlhdGUgd2F5IHRvIGRlYWwKPj4+
PiB3aXRoIHRoYXQKPj4+PiBoZXJlLiBTZWxlY3Rpb24gb2YgT1BQIHRhYmxlIGZvciBjb3JyZWN0
IG9wZXJhdGlvbiB3aWxsIGJlCj4+Pj4gZGV0ZXJtaW5lZCBieQo+Pj4+IGJvb3Rsb2FkZXIsIHdo
ZXJlLCBpdCBpcyBkZW1vbnN0cmF0ZWQgYnkgcGF0Y2ggc2VyaWVzIHNlbnQgdG8gVS1Cb290Cj4+
Pj4gdXBzdHJlYW0gdG8gYmUgc2VsZWN0ZWQgKiogcGVyLWJvYXJkICoqIGJhc2VkIG9uIEVFUFJP
TSBjb250ZW50IGFzCj4+Pj4gaWYgaXQKPj4+PiB3YXMgYW55IG90aGVyIEpILTcxMTAgYm9hcmQg
ZGVjaWRpbmcgZHRzIGJhc2VkIG9uIEVFUFJPTSBjb250ZW50LiBHaXZlbgo+Pj4+IHRoYXQgaXQg
aXMgdGhlIHNhbWUgdGFwZS1vdXQgSSBkbyBub3QgZmluZCBhIHZhbGlkIGp1c3RpZmljYXRpb24g
Zm9yCj4+Pj4gYSBuZXcKPj4+PiBjb21wYXRpYmxlIGluIHRoZSBzdGFjayBvZiBhZGphY2VudCBz
b2Z0d2FyZSBiZXNpZGVzIGdvaW5nIGFsb25nCj4+Pj4gd2l0aCBzb21lCj4+Pj4ga2luZCBvZiBt
YXJrZXRpbmctZHJpdmVuIGFuc3dlciBhYm91dCB3aGV0aGVyIG9yIG5vdCB0aGlzIGlzIGEgbmV3
IFNvQy4KPj4+Pgo+Pj4+IFdoYXQgSSBjYXJlIGFib3V0IG5vdyBpcyB0aGF0IHRoZSBWaXNpb25G
aXZlIDIgTGl0ZSBzZXJpZXMgaXMgaW4KPj4+PiBnb29kIGVub3VnaAo+Pj4+IHNoYXBlIGFuZCB0
aGVyZSdzIGEgcG9zc2liaWxpdHkgdG8gYWN0IG9uIHRoaXMgbW9udGhzLW9sZCBzdWdnZXN0aW9u
Cj4+Pj4gdG8gc3BsaXQgb3V0Cj4+Pj4gdGhlIE9QUCB0YWJsZXMgd2hpY2ggYXMgd2UgaGF2ZSBj
b25maXJtZWQgdGhlIEpINzExMFMgaXMgdGhlIHNhbWUKPj4+PiBTb0MgYXMKPj4+PiBKSDcxMTAg
aXQgbWFrZXMgYSBsb3Qgb2Ygc2Vuc2UgdG8gZG8uCj4+Pj4KPj4+PiBIb3cgaXMgaXQgc3VwcG9z
ZWQgdG8gd29yayBmb3IgYmlubmVkIHNpbGljb24gaW4gTGludXg/Cj4+Pgo+Pj4gSGksIENvbm9y
LMKgIEVtaWwsCj4+Pgo+Pj4gV2hhdCBkbyB5b3UgdGhpbmsgYWJvdXQgdGhpcz8gSG9wZSB0byBo
ZWFyIGZyb20geW91Lgo+Pgo+PiBDYW4gc29tZW9uZSBqdXN0IGdpdmUgbWUgYSB5ZXMvbm8gcXVl
c3Rpb24gb3V0IG9mIHRoaXMgdGhyZWFkPyBJJ20gbm90Cj4+IHJlYWxseSBpbW1lZGlhdGVseSBz
dXJlIHdoYXQncyBiZWluZyBhc2tlZCBvZiBtZS4gV2hhdCBleGFjdGx5IGRvIHlvdQo+PiB3YW50
IHRvIGRvIHdpdGggdGhlIG9wcC10YWJsZXM/ICJTcGxpdCBvdXQiIGlzbid0IHN1cGVyIGNsZWFy
LiBEb2VzIHRoYXQKPj4gbWVhbiBpbnRvIGJvYXJkIGZpbGVzPyBJIGFtIGd1ZXNzaW5nIGl0IGRv
ZXMsIHNpbmNlIHlvdSdyZSBzYXlpbmcgdGhhdCBhCj4+IHBhcnRpY3VsYXIgYm9hcmQgY2Fubm90
IHN1cHBvcnQgdGhlIDEuNSBHSHogbW9kZS4gSXQncyBub3QgdW51c3VhbAo+PiB0aG91Z2ggdG8g
dXNlIGRlbGV0ZSBub2RlIGZvciB1bnN1cHBvcnRlZCBvcHAtdGFibGUgZW50cmllcywgY291bGQg
dGhhdAo+PiBiZSBkb25lIGluc3RlYWQ/Cj4+Cj4+IEZXSVcsIHRoaXMgd2Vla2VuZCBpcyAtcmM3
LCBzbyBJIHdvbid0IGJlIGFwcGx5aW5nIGFueSBuZXcgbWF0ZXJpYWwKPj4gYWZ0ZXIgdGhhdC4K
Pj4KPiAKPiBUaGVyZSB3YXMgYWdyZWVtZW50IHRoYXQgdGhlIEpINzExMCBhbmQgSkg3MTEwUyBu
ZWVkIGRpZmZlcmVudCBvcGVyYXRpbmcKPiBwb2ludHMuIFRoaXMgaXMgcmVhbGl6ZWQgdmlhIHRo
ZSBkaWZmZXJlbnQgaW5jbHVkZXMgZm9yIHRoZSBWaXNpb25GaXZlIDIKPiBMaXRlIGJvYXJkcyBh
bmQgdGhlIG90aGVyIGJvYXJkcy4KPiAKPiBTdXBwb3J0IGZvciB0aGUgbmV3IGNvbXBhdGlibGUg
c3RyaW5nICJzdGFyZml2ZSxqaDcxMTBzIiB1c2VkIGJ5IHRoZQo+IFZpc2lvbkZpdmUgMiBMaXRl
IGlzIGFscmVhZHkgaW1wbGVtZW50ZWQgaW4gT3BlblNCSSB3aGVyZSBpdCBpcyBuZWVkZWQKPiBm
b3IgcGxhdGZvcm0gc3VwcG9ydCAoc3BlY2lmaWNhbGx5IHJlYm9vdCkuIEl0IGlzIGFsc28gdXNl
ZCBpbiB0YWcKPiBuZXh0LTIwMjUxMTE5IGluIGRyaXZlcnMvY3B1ZnJlcS9jcHVmcmVxLWR0LXBs
YXRkZXYuYy4gVGhlcmUgaXMgbm8KPiB0ZWNobmljYWwgbmVlZCB0byByb2xlIHRoaXMgYmFjay4K
PiAKPiBUaGUgY2hhbmdlcyBpbiBPcGVuU0JJIGFuZCB0aGUgY3B1IGZyZXF1ZW5jeSBkcml2ZXIg
Y291bGQgaGF2ZSBiZWVuCj4gYXZvaWRlZCBieSB1c2luZwo+IAo+IGNvbXBhdGlibGUgPSAic3Rh
cmZpdmUsdmlzaW9uZml2ZS0yLWxpdGUtZW1tYyIsICJzdGFyZml2ZSxqaDcxMTBzIiwKPiAic3Rh
cmZpdmUsamg3MTEwIgo+IAo+IHRvIGluZGljYXRlIHRoYXQgSkg3MTEwcyBpcyBqdXN0IGEgdmFy
aWV0eSBvZiBKSDcxMTAuIFRoaXMgYWxzbyB3b3VsZAo+IG1hdGNoIHRoZSBiZXN0IHByYWN0aWNl
IGV4YW1wbGUgaW4gRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL3VzYWdlLQo+IG1vZGVsLnJzdDoK
PiAKPiDCoMKgwqAgY29tcGF0aWJsZSA9ICJ0aSxvbWFwMy1iZWFnbGVib2FyZCIsICJ0aSxvbWFw
MzQ1MCIsICJ0aSxvbWFwMyI7Cj4gCj4gSSBndWVzcyB3ZSBjb3VsZCBhZGQgdGhhdCB0aGlyZCBj
b21wYXRpYmxlIHZhbHVlIGluIGEgbGF0ZXIgcGF0Y2guCgpObywgaG93IGFib3V0IGRvaW5nIHRo
YXQgbm93IGluc3RlYWQgb2YgcHVzaGluZyBvdXQgdGhlIHdyb25nIHJlc3VsdD8KCj4gCj4gQXMg
VS1Cb290IHVzZXMgdGhlIExpbnV4IGRldmljZS10cmVlcyB0b28sIEkgaGF2ZSBidWlsdCBVLUJv
b3Qgd2l0aCB0aGUKPiB1cGRhdGVkIGRldmljZS10cmVlcyBhbmQgaGFkIG5vIHByb2JsZW0gdG8g
Ym9vdCBhbGwgc3VwcG9ydGVkIEpINzExMCBhbmQKPiBKSDcxMTBTIGRldmljZXMgaW5jbHVkaW5n
IHRoZSBTdGFyRml2ZSBWaXNpb25GaXZlIDIgTGl0ZS4KPiAKClllcyB0aGF0IGlzIGNsZWFyIHdo
ZW4gcmVhZGluZyB0aGUgZG9jdW1lbnRhdGlvbiwgc291bmRzIGdvb2QgdG8gbWUgaWYKZm9sbG93
aW5nIHRoZSBkb2NzLgoKPiBBIGJvb3RwaC1wcmUtcmFtIHByb3BlcnR5IGZvciBib290aW5nIGZy
b20gU0QtY2FyZCB0aGF0IHdhcyBhbHJlYWR5Cj4gbWlzc2luZyBiZWZvcmUgdGhlIHNlcmllcyBj
YW4gYmUgYWRkZWQgdmlhIGEgc2VwYXJhdGUgcGF0Y2guCgpZb3UgYXJlIHJlZmVycmluZyB0byBi
b290aW5nIFUtQm9vdCBTUEwgZnJvbSBTRC1jYXJkLiBUaGUgc3VwcG9ydGVkCm1ldGhvZCBmb3Ig
bmV3IGRlc2lnbnMgKFN0YXJGaXZlIFZpc2lvbkZpdmUgMiBMaXRlIGlzIGEgbmV3IGRlc2lnbikg
aXMKdG8gYm9vdCBVLUJvb3QgU1BMIGZyb20gVUFSVCBzZXJpYWwgb3IgU1BJIEZsYXNoLiBVLUJv
b3QgTWFpbiBoYXMgdGhlCmZ1bGwgdW5maWx0ZXJlZCBkZXZpY2V0cmVlIGF2YWlsYWJsZSBhbmQg
ZG9lcyBpbiBmYWN0IGJvb3QgTGludXggZnJvbQpTRC1jYXJkIGFzLWlzIHdpdGhvdXQgd2hhdCB5
b3UgcmVmZXIgdG8uCgpIb3cgdGhlbiBpcyBVLUJvb3QgU1BMIGJvb3QgZnJvbSBTRC1jYXJkIHBv
c3NpYmxlIG9uIFN0YXJGaXZlIFZpc2lvbkZpdmUKMiBMaXRlPyBUaGVyZSBpcyBvbmx5IGEgYm9v
dCBidXR0b24gKHNlcmlhbCBvciBzcGkgZmxhc2ggc2VsZWN0KS4gSXMKdGhpcyBmb3IgYSBkZXZl
bG9wZXIgYm9hcmQgd2l0aCBNU0VMIERJUCwgb3Igc29tZSBvdGhlciBib290IHNlbGVjdGlvbgpp
biBoYXJkd2FyZSBub3QgbWVudGlvbmVkPwoKPiAKPiBJIHRoaW5rIHdlIHNob3VsZCBnbyBhaGVh
ZCBhcyBpcy4KClRoaXMgaXMgdGhlIHJldmlldyBmZWVkYmFjayBJIHdpc2ggd2UnZCBoYWQgZm9y
IEhhbCB3aXRoIHRoZSBSRkMgYW5kIHYxCm9mIHRoaXMgc2VyaWVzLiBJIHdvdWxkIG5vdyBsaWtl
IHRoZSBpZGVudGlmaWVkIGNoYW5nZXMgdG8gYmUgYXBwbGllZCB0bwp0aGUgZGV2aWNldHJlZS4g
SXQgc2F5cyByaWdodCB0aGVyZSBpbiB0aGUgZG9jdW1lbnRhdGlvbiBob3cgdG8gZG8gaXQsCnRo
YW5rIHlvdS4KCj4gCj4gQmVzdCByZWdhcmRzCj4gCj4gSGVpbnJpY2gKCkIuUi4sCgotRQoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3Yg
bWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3Rz
LmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
