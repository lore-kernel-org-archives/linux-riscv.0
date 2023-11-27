Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51038C4167B
	for <linux-riscv@archiver.kernel.org>; Mon, 27 Nov 2023 10:53:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HkPzl782I+La2qlGIzEbC2D8bMJMN9IMMqX7AvF36wE=; b=seQ7JnK9+zYp3G
	XOMGOXJSWB5hzKozXJHOzwmA7WnccqPDyu3wiL7IHXsa0wf25p5xsSCznBvd4tHzqcclylP0q4vPI
	JRUJlfk1vA/CeAcZ0TJDICaE1NRFDrFhJzg55q/MstyFssyQ6L21yeHq1VNCnalYBYrF+SVUWUx5w
	cwmWROZirPme/tznxIymSRl7DQ/pWC9LyaJ/D+z+UFglMxqv3nlGjyL772FipcD/weNpCcNupJCe2
	ij3C3qk9SouzhtniVufoE31aFjMaJ6eQOCoYxv7udlOXyGMBX7VICjfQoAspRQunBSts3N/MSeQuE
	P65pFmkv8xzX5k6kt8Pg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r7ZFD-0028vk-2S;
	Mon, 27 Nov 2023 10:53:39 +0000
Received: from eu-smtp-delivery-151.mimecast.com ([185.58.86.151])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r7ZF9-0028uu-32
	for linux-riscv@lists.infradead.org;
	Mon, 27 Nov 2023 10:53:38 +0000
Received: from AcuMS.aculab.com (156.67.243.121 [156.67.243.121]) by
 relay.mimecast.com with ESMTP with both STARTTLS and AUTH (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 uk-mtapsc-7-m_tqE__5NZGwoxcnVdDhBA-1; Mon, 27 Nov 2023 10:52:29 +0000
X-MC-Unique: m_tqE__5NZGwoxcnVdDhBA-1
Received: from AcuMS.Aculab.com (10.202.163.6) by AcuMS.aculab.com
 (10.202.163.6) with Microsoft SMTP Server (TLS) id 15.0.1497.48; Mon, 27 Nov
 2023 10:51:16 +0000
Received: from AcuMS.Aculab.com ([::1]) by AcuMS.aculab.com ([::1]) with mapi
 id 15.00.1497.048; Mon, 27 Nov 2023 10:51:16 +0000
From: David Laight <David.Laight@ACULAB.COM>
To: =?utf-8?B?J0Nsw6ltZW50IEzDqWdlcic=?= <cleger@rivosinc.com>, Paul Walmsley
	<paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
	<aou@eecs.berkeley.edu>, "linux-riscv@lists.infradead.org"
	<linux-riscv@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
CC: Christoph Hellwig <hch@infradead.org>, Ben Dooks
	<ben.dooks@codethink.co.uk>, kernel test robot <lkp@intel.com>
Subject: RE: [PATCH v2] riscv: fix incorrect use of __user pointer
Thread-Topic: [PATCH v2] riscv: fix incorrect use of __user pointer
Thread-Index: AQHaHsrcAiRrTVkzkEi8HCpEAmrYerCLK9CggALOZICAAAHAIIAAAeUAgAABpPA=
Date: Mon, 27 Nov 2023 10:51:16 +0000
Message-ID: <40a577e9f0b54e8eab0a1f78114dffa8@AcuMS.aculab.com>
References: <20231124113803.165431-1-cleger@rivosinc.com>
 <bf7dfadfc8a94e3f810a8ba238f77543@AcuMS.aculab.com>
 <9cb1fadf-bb83-4e9f-9c29-bff53e30b0c6@rivosinc.com>
 <72fb7d8085a644e4a3e2e540a9ed6847@AcuMS.aculab.com>
 <603c39d4-2764-4f85-b173-069ced2a3a13@rivosinc.com>
In-Reply-To: <603c39d4-2764-4f85-b173-069ced2a3a13@rivosinc.com>
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
X-CRM114-CacheID: sfid-20231127_025337_050751_BC0AA5D2 
X-CRM114-Status: GOOD (  21.51  )
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

RnJvbTogQ2zDqW1lbnQgTMOpZ2VyDQo+IFNlbnQ6IDI3IE5vdmVtYmVyIDIwMjMgMTA6MzcNCj4g
DQo+IE9uIDI3LzExLzIwMjMgMTE6MzUsIERhdmlkIExhaWdodCB3cm90ZToNCj4gPiBGcm9tOiBD
bMOpbWVudCBMw6lnZXINCj4gPj4gU2VudDogMjcgTm92ZW1iZXIgMjAyMyAxMDoyNA0KPiA+Pg0K
PiA+PiBPbiAyNS8xMS8yMDIzIDE2OjM3LCBEYXZpZCBMYWlnaHQgd3JvdGU6DQo+ID4+PiAuLi4N
Cj4gPj4+PiBAQCAtNDkxLDcgKzQ4Niw3IEBAIGludCBoYW5kbGVfbWlzYWxpZ25lZF9sb2FkKHN0
cnVjdCBwdF9yZWdzICpyZWdzKQ0KPiA+Pj4+DQo+ID4+Pj4gIAl2YWwuZGF0YV91NjQgPSAwOw0K
PiA+Pj4+ICAJZm9yIChpID0gMDsgaSA8IGxlbjsgaSsrKSB7DQo+ID4+Pj4gLQkJaWYgKGxvYWRf
dTgocmVncywgKHZvaWQgKikoYWRkciArIGkpLCAmdmFsLmRhdGFfYnl0ZXNbaV0pKQ0KPiA+Pj4+
ICsJCWlmIChsb2FkX3U4KHJlZ3MsIGFkZHIgKyBpLCAmdmFsLmRhdGFfYnl0ZXNbaV0pKQ0KPiA+
Pj4+ICAJCQlyZXR1cm4gLTE7DQo+ID4+Pj4gIAl9DQo+ID4+Pg0KPiA+Pj4gSSdkIHJlYWxseSBo
YXZlIHRob3VnaHQgdGhhdCB5b3UnZCB3YW50IHRvIHB1bGwgdGhlIGtlcm5lbC91c2VyDQo+ID4+
PiBjaGVjayB3YXkgb3V0c2lkZSB0aGUgbG9vcD8NCj4gPj4NCj4gPj4gSGkgRGF2aWQsDQo+ID4+
DQo+ID4+IEkgaG9wZSB0aGUgY29tcGlsZXIgaXMgYWJsZSB0byBleHRyYWN0IHRoYXQgJ2lmJyBv
dXQgb2YgdGhlIGxvb3Agc2luY2UNCj4gPj4gcmVncyBpc24ndCBtb2RpZmllZCBpbiB0aGUgbG9v
cC4gTmV2ZXJ0aGVsZXNzLCB0aGF0IGNvdWxkIGJlIG1vcmUNCj4gPj4gImNsZWFyIiBpZiBwdXQg
b3V0c2lkZSBpbmRlZWQuDQo+ID4NCj4gPiBJZiBoYXMgYWNjZXNzIHJlZ3MtPnh4eCB0aGVuIHRo
ZSBjb21waWxlciBjYW4ndCBkbyBzbyBiZWNhdXNlIGl0DQo+ID4gd2lsbCBtdXN0IGFzc3VtZSB0
aGF0IHRoZSBhc3NpZ25tZW50IG1pZ2h0IGFsaWFzIGludG8gJ3JlZ3MnLg0KPiA+IFRoYXQgaXMg
ZXZlbiB0cnVlIGZvciBieXRlIHdyaXRlcyBpZiAnc3RyaWN0LWFsaWFzaW5nJyBpcyBlbmFibGVk
DQo+ID4gLSB3aGljaCBpdCBpc24ndCBmb3IgbGludXgga2VybmVsIGJ1aWxkcy4NCj4gPg0KPiA+
IEl0IG1pZ2h0IGRvIHNvIGlmICdyZWdzJyB3ZXJlICdjb25zdCc7IGl0IHRlbmRzIHRvIGFzc3Vt
ZSB0aGF0IGlmDQo+ID4gaXQgY2FuJ3QgY2hhbmdlICBzb21ldGhpbmcgbm90aGluZyBjYW4gLSBh
bHRob3VnaCB0aGF0IGlzbid0IHRydWUuDQo+IA0KPiBPaywgZ29vZCB0byBrbm93ICEgQXMgSSBz
YWlkLCBJJ2xsIG1vZGlmeSB0aGF0IGluIGEgc3Vic2VxdWVudCBwYXRjaC4NCg0KQWN0dWFsbHkg
dGhlIGZvbGxvd2luZyBsb29wcyB3aWxsIChwcm9iYWJseSkgZ2VuZXJhdGUgbXVjaCBiZXR0ZXIg
Y29kZToNCgkvLyBSZWFkIGtlcm5lbA0KCXZhbCA9IDA7DQoJZm9yIChpID0gMDsgaSA8IGxlbjsg
aSsrKQ0KCQl2YWwgfD0gYWRkcltpXSA8PCAoaSAqIDgpOw0KCS8vIHdyaXRlIGtlcm5lbA0KCWZv
ciAoaSA9IDA7IGkgPCBsZW47IGkrKywgdmFsID4+PSA4KQ0KCQlhZGRyW2ldID0gdmFsOw0KRm9y
IHVzZXIgdXNpbmcgX19nZXQvcHV0X3VzZXIoKSBhcyBhcHByb3ByaWF0ZS4NCkkgdGhpbmsgdGhl
cmUgaXMgYSAnZ290bycgdmFyaWFudCBvZiB0aGUgdXNlciBhY2Nlc3MgZnVuY3Rpb25zDQp0aGF0
IHByb2JhYmx5IG1ha2UgdGhlIGNvZGUgY2xlYXJlci4NCg0KCURhdmlkDQoNCi0NClJlZ2lzdGVy
ZWQgQWRkcmVzcyBMYWtlc2lkZSwgQnJhbWxleSBSb2FkLCBNb3VudCBGYXJtLCBNaWx0b24gS2V5
bmVzLCBNSzEgMVBULCBVSw0KUmVnaXN0cmF0aW9uIE5vOiAxMzk3Mzg2IChXYWxlcykNCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1h
aWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5p
bmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
