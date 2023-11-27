Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3CDB2C4167B
	for <linux-riscv@archiver.kernel.org>; Mon, 27 Nov 2023 10:35:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Tsox2PUUvdNSLHeurdInzVrZu5Zr4+NCSsipOWuLoB0=; b=1jVQLSJNPktsU6
	/u0uNQUfkTnDdYG89ec+hKnUPfpxr6kdGQcN7sNDArYr5kpFMqkPadjHz21d9JPZ5ITqYvt3p/K1E
	c/q+FMae7PZzlZEQPIYhp03Eloa6dAv0fRJ8RO4yc/TgTcvwvB1KCsKpdYvkmmP0YyT0oW6YKmvwx
	VjYIIvAGmUEbPZOCgODHOqywSwt6o9+vVsev2ciMBoQ0lxAy6ZKp3pOZg9v6oOz0bGx9dILWGfMoi
	+NGTBEGS84i4g4drK4xDlmlEUQ+clYWzLlQvMlk4vqrfu30ZDBKITRQkv5lsluHb7IcWB40nBhCtg
	Qf6I1Wqv2RJkYWwb+7fw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r7Yxp-0026eX-0G;
	Mon, 27 Nov 2023 10:35:41 +0000
Received: from eu-smtp-delivery-151.mimecast.com ([185.58.85.151])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r7Yxm-0026ck-1i
	for linux-riscv@lists.infradead.org;
	Mon, 27 Nov 2023 10:35:40 +0000
Received: from AcuMS.aculab.com (156.67.243.121 [156.67.243.121]) by
 relay.mimecast.com with ESMTP with both STARTTLS and AUTH (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 uk-mta-304--iAy6FWzNo6bScLr0riqlw-1; Mon, 27 Nov 2023 10:35:32 +0000
X-MC-Unique: -iAy6FWzNo6bScLr0riqlw-1
Received: from AcuMS.Aculab.com (10.202.163.6) by AcuMS.aculab.com
 (10.202.163.6) with Microsoft SMTP Server (TLS) id 15.0.1497.48; Mon, 27 Nov
 2023 10:35:42 +0000
Received: from AcuMS.Aculab.com ([::1]) by AcuMS.aculab.com ([::1]) with mapi
 id 15.00.1497.048; Mon, 27 Nov 2023 10:35:42 +0000
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
Thread-Index: AQHaHsrcAiRrTVkzkEi8HCpEAmrYerCLK9CggALOZICAAAHAIA==
Date: Mon, 27 Nov 2023 10:35:42 +0000
Message-ID: <72fb7d8085a644e4a3e2e540a9ed6847@AcuMS.aculab.com>
References: <20231124113803.165431-1-cleger@rivosinc.com>
 <bf7dfadfc8a94e3f810a8ba238f77543@AcuMS.aculab.com>
 <9cb1fadf-bb83-4e9f-9c29-bff53e30b0c6@rivosinc.com>
In-Reply-To: <9cb1fadf-bb83-4e9f-9c29-bff53e30b0c6@rivosinc.com>
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
X-CRM114-CacheID: sfid-20231127_023538_842656_FF63DC57 
X-CRM114-Status: GOOD (  16.03  )
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

RnJvbTogQ2zDqW1lbnQgTMOpZ2VyDQo+IFNlbnQ6IDI3IE5vdmVtYmVyIDIwMjMgMTA6MjQNCj4g
DQo+IE9uIDI1LzExLzIwMjMgMTY6MzcsIERhdmlkIExhaWdodCB3cm90ZToNCj4gPiAuLi4NCj4g
Pj4gQEAgLTQ5MSw3ICs0ODYsNyBAQCBpbnQgaGFuZGxlX21pc2FsaWduZWRfbG9hZChzdHJ1Y3Qg
cHRfcmVncyAqcmVncykNCj4gPj4NCj4gPj4gIAl2YWwuZGF0YV91NjQgPSAwOw0KPiA+PiAgCWZv
ciAoaSA9IDA7IGkgPCBsZW47IGkrKykgew0KPiA+PiAtCQlpZiAobG9hZF91OChyZWdzLCAodm9p
ZCAqKShhZGRyICsgaSksICZ2YWwuZGF0YV9ieXRlc1tpXSkpDQo+ID4+ICsJCWlmIChsb2FkX3U4
KHJlZ3MsIGFkZHIgKyBpLCAmdmFsLmRhdGFfYnl0ZXNbaV0pKQ0KPiA+PiAgCQkJcmV0dXJuIC0x
Ow0KPiA+PiAgCX0NCj4gPg0KPiA+IEknZCByZWFsbHkgaGF2ZSB0aG91Z2h0IHRoYXQgeW91J2Qg
d2FudCB0byBwdWxsIHRoZSBrZXJuZWwvdXNlcg0KPiA+IGNoZWNrIHdheSBvdXRzaWRlIHRoZSBs
b29wPw0KPiANCj4gSGkgRGF2aWQsDQo+IA0KPiBJIGhvcGUgdGhlIGNvbXBpbGVyIGlzIGFibGUg
dG8gZXh0cmFjdCB0aGF0ICdpZicgb3V0IG9mIHRoZSBsb29wIHNpbmNlDQo+IHJlZ3MgaXNuJ3Qg
bW9kaWZpZWQgaW4gdGhlIGxvb3AuIE5ldmVydGhlbGVzcywgdGhhdCBjb3VsZCBiZSBtb3JlDQo+
ICJjbGVhciIgaWYgcHV0IG91dHNpZGUgaW5kZWVkLg0KDQpJZiBoYXMgYWNjZXNzIHJlZ3MtPnh4
eCB0aGVuIHRoZSBjb21waWxlciBjYW4ndCBkbyBzbyBiZWNhdXNlIGl0DQp3aWxsIG11c3QgYXNz
dW1lIHRoYXQgdGhlIGFzc2lnbm1lbnQgbWlnaHQgYWxpYXMgaW50byAncmVncycuDQpUaGF0IGlz
IGV2ZW4gdHJ1ZSBmb3IgYnl0ZSB3cml0ZXMgaWYgJ3N0cmljdC1hbGlhc2luZycgaXMgZW5hYmxl
ZA0KLSB3aGljaCBpdCBpc24ndCBmb3IgbGludXgga2VybmVsIGJ1aWxkcy4NCg0KSXQgbWlnaHQg
ZG8gc28gaWYgJ3JlZ3MnIHdlcmUgJ2NvbnN0JzsgaXQgdGVuZHMgdG8gYXNzdW1lIHRoYXQgaWYN
Cml0IGNhbid0IGNoYW5nZSAgc29tZXRoaW5nIG5vdGhpbmcgY2FuIC0gYWx0aG91Z2ggdGhhdCBp
c24ndCB0cnVlLg0KDQoJRGF2aWQNCg0KLQ0KUmVnaXN0ZXJlZCBBZGRyZXNzIExha2VzaWRlLCBC
cmFtbGV5IFJvYWQsIE1vdW50IEZhcm0sIE1pbHRvbiBLZXluZXMsIE1LMSAxUFQsIFVLDQpSZWdp
c3RyYXRpb24gTm86IDEzOTczODYgKFdhbGVzKQ0KX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2
QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9saW51eC1yaXNjdgo=
