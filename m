Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14DE0C3DA6E
	for <linux-riscv@archiver.kernel.org>; Sat, 23 Dec 2023 10:31:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EUcx1jBrZy6gHVSslbjl1z5xTunFbCDwynsf05qjThM=; b=SNri6Tqn1BMRxv
	xTRK6XYIk2HySDPrF2dt7iTEwSrBgMyLPvCbQ98f0l21I+N8+XVds+9XRjOXDCppU2VKXoheaXoSf
	fHz48SiKTtnfUeXuftV4y8W5hxBS+j3C93NHZ2gPcLwVOtSqdoxeI+DDWZOBt5j08GsdFubtSm48c
	s/6wfuul7q4VA5l3Qd3N9G0Tm1fn4b2I2UKoELKLSnP+6nw06e9sibQwFG9r4+14HKZ2GQjGVKqKa
	pYvRdC/CGBYnT3iViXxvFBC4zIxXvoBEcmBCXCOlPmxrWNLM7k3jhxceYdbenirPL7jXUp152OVqB
	0LRWyDfeIzRRCI2Th9cw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rGzIC-007g2j-2k;
	Sat, 23 Dec 2023 10:31:40 +0000
Received: from eu-smtp-delivery-151.mimecast.com ([185.58.85.151])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rGzI9-007g1n-1f
	for linux-riscv@lists.infradead.org;
	Sat, 23 Dec 2023 10:31:39 +0000
Received: from AcuMS.aculab.com (156.67.243.121 [156.67.243.121]) by
 relay.mimecast.com with ESMTP with both STARTTLS and AUTH (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 uk-mta-228-U5G35-zWOAaFHs2mKPMClw-1; Sat, 23 Dec 2023 10:31:31 +0000
X-MC-Unique: U5G35-zWOAaFHs2mKPMClw-1
Received: from AcuMS.Aculab.com (10.202.163.6) by AcuMS.aculab.com
 (10.202.163.6) with Microsoft SMTP Server (TLS) id 15.0.1497.48; Sat, 23 Dec
 2023 10:31:16 +0000
Received: from AcuMS.Aculab.com ([::1]) by AcuMS.aculab.com ([::1]) with mapi
 id 15.00.1497.048; Sat, 23 Dec 2023 10:31:16 +0000
From: David Laight <David.Laight@ACULAB.COM>
To: 'Guo Ren' <guoren@kernel.org>
CC: Leonardo Bras <leobras@redhat.com>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "paul.walmsley@sifive.com"
	<paul.walmsley@sifive.com>, "palmer@dabbelt.com" <palmer@dabbelt.com>,
	"alexghiti@rivosinc.com" <alexghiti@rivosinc.com>, "charlie@rivosinc.com"
	<charlie@rivosinc.com>, "xiao.w.wang@intel.com" <xiao.w.wang@intel.com>,
	"david@redhat.com" <david@redhat.com>, "panqinglin2020@iscas.ac.cn"
	<panqinglin2020@iscas.ac.cn>, "rick.p.edgecombe@intel.com"
	<rick.p.edgecombe@intel.com>, "willy@infradead.org" <willy@infradead.org>,
	"bjorn@rivosinc.com" <bjorn@rivosinc.com>, "conor.dooley@microchip.com"
	<conor.dooley@microchip.com>, "cleger@rivosinc.com" <cleger@rivosinc.com>,
	"linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>, Guo Ren
	<guoren@linux.alibaba.com>
Subject: RE: [PATCH V2 4/4] riscv: mm: Optimize TASK_SIZE definition
Thread-Topic: [PATCH V2 4/4] riscv: mm: Optimize TASK_SIZE definition
Thread-Index: AQHaNMmXQnV6P1CryUOzF1IfQQ8rsbC1Lv+wgAD9mACAAH0Z4A==
Date: Sat, 23 Dec 2023 10:31:15 +0000
Message-ID: <9d4d15e8e3e944b8bd18e8bc1d54f59c@AcuMS.aculab.com>
References: <20231221154702.2267684-1-guoren@kernel.org>
 <20231221154702.2267684-5-guoren@kernel.org> <ZYUZ8QUJxCL93Fgv@LeoBras>
 <CAJF2gTTX7AjexoRUw=ZS34HEWno7H3zvnXA+Q7TYsztNU=k2cg@mail.gmail.com>
 <e3f1521a9f04463587d07d0c99534d5a@AcuMS.aculab.com>
 <CAJF2gTRD827Fbs_2FxBP=Z8yudfAAqG6dA+a9eq74RMOz2WDnw@mail.gmail.com>
In-Reply-To: <CAJF2gTRD827Fbs_2FxBP=Z8yudfAAqG6dA+a9eq74RMOz2WDnw@mail.gmail.com>
Accept-Language: en-GB, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.202.205.107]
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: aculab.com
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231223_023137_846191_5BA332D7 
X-CRM114-Status: GOOD (  14.63  )
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

RnJvbTogR3VvIFJlbg0KPiBTZW50OiAyMyBEZWNlbWJlciAyMDIzIDAyOjUzDQo+IA0KPiBPbiBG
cmksIERlYyAyMiwgMjAyMyBhdCA3OjUy4oCvUE0gRGF2aWQgTGFpZ2h0IDxEYXZpZC5MYWlnaHRA
YWN1bGFiLmNvbT4gd3JvdGU6DQo+ID4NCj4gPiBGcm9tOiBHdW8gUmVuDQo+ID4gPiBTZW50OiAy
MiBEZWNlbWJlciAyMDIzIDExOjI1DQo+ID4gLi4uDQo+ID4gPiA+ID4gKyNkZWZpbmUgVEFTS19T
SVpFICAgIChpc19jb21wYXRfdGFzaygpID8gXA0KPiA+ID4gPiA+ICAgICAgICAgICAgICAgICAg
ICAgICAgVEFTS19TSVpFXzMyIDogVEFTS19TSVpFXzY0KQ0KPiA+ID4gSSB3b3VsZCByZW1vdmUg
aXNfY29tcGF0X3Rhc2soKSBpbiB0aGUgbmV4dCB2ZXJzaW9uIGJlY2F1c2UgeW91ciBwYXRjaA0K
PiA+ID4gY29udGFpbnMgdGhhdC4NCj4gPg0KPiA+IERvZXMgVEFTS19TSVpFIGdldCB1c2VkIGlu
IGFjY2Vzc19vaygpID8NCj4gPiBJZiBzbyB0aGUgcmVwZWF0ZWQgZXhwYW5zaW9uIG9mIHRoYXQg
J21lc3MnIHdpbGwgc2xvdyB0aGluZ3MgZG93bi4NCj4gPg0KPiA+IE9UT0ggYWNjZXNzX29rKHB0
ciwgbGVuKSBjYW4ganVzdCBjaGVjayAocHRyIHwgKHB0ciArIGxlbikpIDwgMCkNCj4gPiBhbmQg
cmVseSBvbiB0aGUgcGFnZSBmYXVsdHMgZm9yIGV2ZXJ5dGhpbmcgZWxzZS4NCj4gT3IgZG8geW91
IHdhbnQgdG8gZGlzY3VzcyB0aGUgYmFkIHNpZGUgZWZmZWN0IG9mIGlzX2NvbXBhdF90YXNrKCk/
DQo+IA0KPiBZZXMsIHRlc3RfdGhyZWFkX2ZsYWcoVElGXzMyQklUKSB3b3VsZCBzbG93IGRvd24g
YWNjZXNzX29rKCkuIEJ1dCBpZg0KPiB3ZSB1c2UgVEFTS19TSVpFX01BWCwgVkFfQklUUyBzdGls
bCBuZWVkcyBwZ3RhYmxlX2w1X2VuYWJsZWQsDQo+IHBndGFibGVfbDRfZW5hYmxlZCBkZXRlY3Rh
dGlvbiBmb3IgcmlzY3YuDQo+IA0KPiBJdCdzIG5vdCBvbmx5IGZvciBjb21wYXQgbW9kZSwgYnV0
IGFsc28gU3YzOSwgU3Y0OCwgU3Y1Ny4gQWxsIHRyZWF0DQo+IFRBU0tfU0laRV9NQVggYXMgMHg4
MDAwMDAwMDAwMDAwMDAwLCByaWdodD8gVGhlbjoNCj4gYWNjZXNzX29rKHB0ciwgbGVuKSBjYW4g
anVzdCBjaGVjayAocHRyIHwgKHB0ciArIGxlbikpIDwgMCkNCj4gDQo+IEl0J3MgYW5vdGhlciBm
ZWF0dXJlIGFuZCBkb2VzIG5vdCByZWxhdGUgdG8gY29tcGF0IG1vZGUuDQoNCkNvbXBhdCBtb2Rl
IGp1c3QgbWFrZXMgaXQgd29yc2UuLi4NCg0KT25lIHBvc3NpYmlsaXR5IHdvdWxkIGJlIHRvIHNh
dmUgdGhlIHRhc2sncyBtYXggdXNlciBhZGRyZXNzDQppbiB0aGUgdGFzayBzdHJ1Y3R1cmUgaXRz
ZWxmIC0gdGhhdCB3b3VsZCBzYXZlIGFsbCB0aGUgY29uZGl0aW9uYWxzDQphdCBhIGNvc3Qgb2Yg
YW4gZXh0cmEgdmFsdWUgaW4gdGhlIHRhc2sgc3RydWN0dXJlLg0KDQpUaGVyZSBpcyBhbHNvIHRo
ZSBxdWVzdGlvbiBvZiB3aGV0aGVyIGEgbm9ybWFsbHkgNjQtYml0IHRhc2sNCmNhbiBhY3R1YWxs
eSBtYWtlIHRoZSBjb21wYXQgbW1hcCgpIHN5c3RlbSBjYWxsPw0KT24geDg2IHRoYXQgaXMgY2Vy
dGFpbmx5IHBvc3NpYmxlIChJSVJDIHdpbmUgZG9lcyBpdCksIHg4Ng0KdXNlcnNwYWNlIGNhbiBm
bGlwIGJldHdlZW4gMzJiaXQgYW5kIDYzYml0IG1vZGUgd2l0aG91dCBhDQpzeXN0ZW0gY2FsbC4N
Cg0KCURhdmlkDQoNCi0NClJlZ2lzdGVyZWQgQWRkcmVzcyBMYWtlc2lkZSwgQnJhbWxleSBSb2Fk
LCBNb3VudCBGYXJtLCBNaWx0b24gS2V5bmVzLCBNSzEgMVBULCBVSw0KUmVnaXN0cmF0aW9uIE5v
OiAxMzk3Mzg2IChXYWxlcykNCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZy
YWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGlu
dXgtcmlzY3YK
