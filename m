Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8737FC3DA61
	for <linux-riscv@archiver.kernel.org>; Tue, 30 Jul 2024 08:48:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OxFKVML4aUEEbVnVKN3BNYOylErQT4Tek9nlH+ZSH3E=; b=MA8j5Vcp5dYT4F
	diEHLMaJGswg//Ow4bj7pjDd2WhakiIlorllLQPbzB1SZE0pi9wFkAIDsGdPmhvzNqIA2Vaxt6ZXh
	mNX6x0MnP4QdpggHjRiElpu0Iy8nvy+sS1D2duXxzVCIzuEKRMRG+VpFr8CvjivOyc0nkK7fAQjjU
	gMNLhz1NGvJ8lrT4+zO02w689Slhqgtf/IwPyo5vriInNIGVaM3vMJepy8KkOu68RjsETfXvqAlzU
	ZnXrfeAxA3mJxI6Ud/MxmxUvvxiWxHIMh/35mWEo8hruHSzYKK4qttKzTtBbEZCIyY+Bhnvd856Ri
	9YyIGcJ63BZ1AOeqaK4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sYiWU-0000000EMWT-1MrO;
	Tue, 30 Jul 2024 08:47:58 +0000
Received: from mta-04.yadro.com ([89.207.88.248])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sYiWQ-0000000EMV0-2WOY
	for linux-riscv@lists.infradead.org;
	Tue, 30 Jul 2024 08:47:56 +0000
DKIM-Filter: OpenDKIM Filter v2.11.0 mta-04.yadro.com 78A55C0003
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=syntacore.com;
	s=mta-04; t=1722329269;
	bh=3qUJoSIAcSLphf5lq7qUs9Umvlhw+1lVbiud34jmqlk=;
	h=From:To:Subject:Date:Message-ID:Content-Type:MIME-Version:From;
	b=g8gAKKYnLCgcv++N0w5MiIY6dGrEPBu2UnqqeUOomGKFr7G/HglzhoyVIVDQewg6T
	 JmjLmF36hyhh1k+6LeuaVX2mJfb0gPyQP7WdZnZZNVitx4pv4+iFqot14lMKyZqtvD
	 1Ozor9lQHogjS23iMqmzhUV3D1cX37K9X5cXaRn1RhvLTz1MNpy184GFNsuaWFn1qV
	 t+wCLeFpNO2HrePZItFoOW7L8aq9Pof2L4OZJsbW6XzpyRXtFxqZIwQcCCf4yhAVRG
	 1eCbQyufSXw48Nyhd51S4mM8havcaO624UvQXD36aw6mGjHLlfubdROJNVuNgd1HWE
	 eTr3kXRvFaSrA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=syntacore.com;
	s=mta-03; t=1722329269;
	bh=3qUJoSIAcSLphf5lq7qUs9Umvlhw+1lVbiud34jmqlk=;
	h=From:To:Subject:Date:Message-ID:Content-Type:MIME-Version:From;
	b=hlLTIQDc4/plXLyqmbNN0FAsIjivBKtV1DgvRtVspGVEDJ93u2ApxIuC36NfTegWS
	 FP5gu4+/ooemZUMcQXCKgpheP6HDmSTsDMNymeSIt+miMqCc6+ZthOf1Nee7Wo07j7
	 6tYUnkf702Ppz4ydXWReK+hcNomqeeyVlyFabbcMUaRJYTr0wKPN4m+N1/n3Va7Ll8
	 JR5JqE+9nWikbNeCsaO//z5eyGdiT8AwLVYT0BCsSXEupGIv4BFiWupAxQFMa2M2cm
	 15gAV5zQSBJ5LU3+fOpKKhGwXX6vZalhObAdzE7HkA58ggZVn4n96G7RFwvDymcwiu
	 UPQ5zp88mXnRw==
From: Dmitry Shifrin <dmitry.shifrin@syntacore.com>
To: "alex@ghiti.fr" <alex@ghiti.fr>, "atishp@rivosinc.com"
	<atishp@rivosinc.com>
CC: "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>
Subject: Re: perf: riscv: Fix selecting counters in legacy mode
Thread-Topic: perf: riscv: Fix selecting counters in legacy mode
Thread-Index: AQHa4eH9E1bIhyhYGkmZlFOVInzX0LIN0QyAgADzMoA=
Date: Tue, 30 Jul 2024 08:47:47 +0000
Message-ID: <1669f66ced4a33b3e5df9803e528bb9cc4ca03fa.camel@syntacore.com>
References: <20240729180554.1711718-1-atishp@rivosinc.com>
	 <1bc5172b-6f86-4a13-a664-755c82cfa37b@ghiti.fr>
In-Reply-To: <1bc5172b-6f86-4a13-a664-755c82cfa37b@ghiti.fr>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
Content-ID: <AC8EF0943617444EAE191004B47E2B35@yadro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240730_014754_998888_E3953509 
X-CRM114-Status: GOOD (  26.37  )
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

SGkgQWxleGFuZHJlLA0KDQpPbiBNb24sIDIwMjQtMDctMjkgYXQgMjA6MTcgKzAyMDAsIEFsZXhh
bmRyZSBHaGl0aSB3cm90ZToNCj4gSGkgRG1pdHJ5LA0KPiANCj4gT24gMjkvMDcvMjAyNCAyMDow
NSwgQXRpc2ggUGF0cmEgd3JvdGU6DQo+ID4gPiBJdCBpcyByZXF1aXJlZCB0byBjaGVjayBldmVu
dCB0eXBlIGJlZm9yZSBjaGVja2luZyBldmVudCBjb25maWcuDQo+ID4gPiBFdmVudHMgd2l0aCB0
aGUgZGlmZmVyZW50IHR5cGVzIGNhbiBoYXZlIHRoZSBzYW1lIGNvbmZpZy4NCj4gPiA+IFRoaXMg
Y2hlY2sgaXMgbWlzc2VkIGZvciBsZWdhY3kgbW9kZSBjb2RlDQo+ID4gPiANCj4gPiA+IEZvciBz
dWNoIHBlcmYgdXNhZ2U6DQo+ID4gPiDCoMKgwqDCoCBzeXNjdGwgLXcga2VybmVsLnBlcmZfdXNl
cl9hY2Nlc3M9Mg0KPiA+ID4gwqDCoMKgwqAgcGVyZiBzdGF0IC1lIGN5Y2xlcyxMMS1kY2FjaGUt
bG9hZHMgLS0NCj4gPiA+IGRyaXZlciB3aWxsIHRyeSB0byBmb3JjZSBib3RoIGV2ZW50cyB0byBD
WUNMRSBjb3VudGVyLg0KPiA+ID4gDQo+ID4gPiBUaGlzIGNvbW1pdCBpbXBsZW1lbnRzIGV2ZW50
IHR5cGUgY2hlY2sgYmVmb3JlIGZvcmNpbmcNCj4gPiA+IGV2ZW50cyBvbiB0aGUgc3BlY2lhbCBj
b3VudGVycy4NCj4gPiA+IA0KPiA+ID4gU2lnbmVkLW9mZi1ieTogU2hpZnJpbiBEbWl0cnkgPGRt
aXRyeS5zaGlmcmluQHN5bnRhY29yZS5jb20+DQo+ID4gPiAtLS0NCj4gPiA+IMKgIGRyaXZlcnMv
cGVyZi9yaXNjdl9wbXVfc2JpLmMgfCAyICstDQo+ID4gPiDCoCAxIGZpbGUgY2hhbmdlZCwgMSBp
bnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkNCj4gPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3Bl
cmYvcmlzY3ZfcG11X3NiaS5jIGIvZHJpdmVycy9wZXJmL3Jpc2N2X3BtdV9zYmkuYw0KPiA+ID4g
aW5kZXggMzZkMTI4ZmYxNjZmLi5iZjE0YWIyODJlMTEgMTAwNjQ0DQo+ID4gPiAtLS0gYS9kcml2
ZXJzL3BlcmYvcmlzY3ZfcG11X3NiaS5jDQo+ID4gPiArKysgYi9kcml2ZXJzL3BlcmYvcmlzY3Zf
cG11X3NiaS5jDQo+ID4gPiBAQCAtNDE2LDcgKzQxNiw3IEBAIHN0YXRpYyBpbnQgcG11X3NiaV9j
dHJfZ2V0X2lkeChzdHJ1Y3QgcGVyZl9ldmVudCAqZXZlbnQpDQo+ID4gPiDCoMKgwqDCoMKgwqDC
oMKgICogYnV0IG5vdCBpbiB0aGUgdXNlciBhY2Nlc3MgbW9kZSBhcyB3ZSB3YW50IHRvIHVzZSB0
aGUgb3RoZXIgY291bnRlcnMNCj4gPiA+IMKgwqDCoMKgwqDCoMKgwqAgKiB0aGF0IHN1cHBvcnQg
c2FtcGxpbmcvZmlsdGVyaW5nLg0KPiA+ID4gwqDCoMKgwqDCoMKgwqDCoCAqLw0KPiA+ID4gLcKg
wqDCoMKgwqDCoMKgaWYgKGh3Yy0+ZmxhZ3MgJiBQRVJGX0VWRU5UX0ZMQUdfTEVHQUNZKSB7DQo+
ID4gPiArwqDCoMKgwqDCoMKgwqBpZiAoKGh3Yy0+ZmxhZ3MgJiBQRVJGX0VWRU5UX0ZMQUdfTEVH
QUNZKSAmJiAoZXZlbnQtPmF0dHIudHlwZSA9PSBQRVJGX1RZUEVfSEFSRFdBUkUpKSB7DQo+ID4g
PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoGlmIChldmVudC0+YXR0ci5jb25maWcg
PT0gUEVSRl9DT1VOVF9IV19DUFVfQ1lDTEVTKSB7DQo+ID4gPiDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBjZmxhZ3MgfD0gU0JJX1BNVV9DRkdfRkxBR19T
S0lQX01BVENIOw0KPiA+ID4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgY21hc2sgPSAxOw0KPiA+ID4gDQo+ID4gTmljZSBjYXRjaC4NCj4gPiBSZXZpZXdl
ZC1ieTogQXRpc2ggUGF0cmEgPGF0aXNocEByaXZvc2luYy5jb20+DQo+IA0KPiANCj4gQ2FuIHlv
dSBhZGQgYSBGaXhlcyB0YWc/IE5vIG5lZWQgdG8gc2VuZCBhbm90aGVyIHZlcnNpb24sIGp1c3Qg
cmVwbHkgDQo+IHdpdGggdGhlIGNvcnJlc3BvbmRpbmcgdGFnIGFuZCBiNCB3aWxsIGdyYWIgaXQu
DQo+IA0KDQpGaXhlczogY2M0YzA3Yzg5YWFkICgiZHJpdmVyczogcGVyZjogSW1wbGVtZW50IHBl
cmYgZXZlbnQgbW1hcCBzdXBwb3J0IGluIHRoZSBTQkkgYmFja2VuZCIpDQoNClRoYW5rcywgRG1p
dHJ5DQo+IFRoYW5rcyENCj4gDQo+IEFsZXgNCj4gDQo+IA0KPiA+IA0KPiA+IF9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fDQo+ID4gbGludXgtcmlzY3YgbWFp
bGluZyBsaXN0DQo+ID4gbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZw0KPiA+IGh0dHA6
Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YNCg0KX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3Yg
bWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3Rz
LmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
