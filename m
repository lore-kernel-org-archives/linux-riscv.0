Return-Path: <SRS0=VH9+=LQ=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 41BB9C48BE5
	for <linux-riscv@archiver.kernel.org>; Tue, 22 Jun 2021 08:39:16 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0780261356
	for <linux-riscv@archiver.kernel.org>; Tue, 22 Jun 2021 08:39:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0780261356
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=ACULAB.COM
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=B1Yx7KuwDPTh4n8lR8kimeOVEzvFUtnX5koItZEp2qA=; b=Amh+g7pBFgMt6R
	/8Qq3bpCh/Zkc3C8A7o/ckAn3I2FV3mvbDF96YAd4wqBQQC8lUjPzwJGTWCQXtEokTCGh+BvGsHDn
	wmMw7s25f9C5GSimhQKyynW9o+HZ41QZdRtnsh9fwwg1OaOMwWod6usRLGz56VkH96dmIVZ2/Z8Yz
	xm42bsdM2fnXIcAgvwHl7gQekeiZQY1xdaZ75LJjiVD9r4Sm5oqYbgbnnFJoY8KwzV/tjYiASLJJj
	Tys9i+mok3mAslBESP/4iXFQHhN5K3PNB+mcrwzzeAl3Hm6T5Q7BsG1cO6/qy96Z1SVaJjJK4cTMK
	6Y1OKf9iV0gLcB+D00Mg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lvbvv-006GUa-3N; Tue, 22 Jun 2021 08:38:59 +0000
Received: from eu-smtp-delivery-151.mimecast.com ([185.58.86.151])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lvbvr-006GTR-Px
 for linux-riscv@lists.infradead.org; Tue, 22 Jun 2021 08:38:57 +0000
Received: from AcuMS.aculab.com (156.67.243.121 [156.67.243.121]) (Using
 TLS) by relay.mimecast.com with ESMTP id uk-mta-1-aRG45FtSMtWCXO1T3F07Vw-1;
 Tue, 22 Jun 2021 09:38:51 +0100
X-MC-Unique: aRG45FtSMtWCXO1T3F07Vw-1
Received: from AcuMS.Aculab.com (10.202.163.4) by AcuMS.aculab.com
 (10.202.163.4) with Microsoft SMTP Server (TLS) id 15.0.1497.18; Tue, 22 Jun
 2021 09:38:50 +0100
Received: from AcuMS.Aculab.com ([fe80::994c:f5c2:35d6:9b65]) by
 AcuMS.aculab.com ([fe80::994c:f5c2:35d6:9b65%12]) with mapi id
 15.00.1497.018; Tue, 22 Jun 2021 09:38:50 +0100
From: David Laight <David.Laight@ACULAB.COM>
To: 'Nick Kossifidis' <mick@ics.forth.gr>, Matteo Croce
 <mcroce@linux.microsoft.com>
CC: "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-arch@vger.kernel.org" <linux-arch@vger.kernel.org>, Paul Walmsley
 <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
 <aou@eecs.berkeley.edu>, Atish Patra <atish.patra@wdc.com>, "Emil Renner
 Berthing" <kernel@esmil.dk>, Akira Tsukamoto <akira.tsukamoto@gmail.com>,
 Drew Fustini <drew@beagleboard.org>, Bin Meng <bmeng.cn@gmail.com>, Guo Ren
 <guoren@kernel.org>
Subject: RE: [PATCH v3 3/3] riscv: optimized memset
Thread-Topic: [PATCH v3 3/3] riscv: optimized memset
Thread-Index: AQHXZwMJWYnk4yvoiESUZuZXhHkP6qsfsYlg
Date: Tue, 22 Jun 2021 08:38:50 +0000
Message-ID: <d0f11655f21243ad983bd24381cdc245@AcuMS.aculab.com>
References: <20210617152754.17960-1-mcroce@linux.microsoft.com>
 <20210617152754.17960-4-mcroce@linux.microsoft.com>
 <17cd289430f08f2b75b7f04242c646f6@mailhost.ics.forth.gr>
In-Reply-To: <17cd289430f08f2b75b7f04242c646f6@mailhost.ics.forth.gr>
Accept-Language: en-GB, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.202.205.107]
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=C51A453 smtp.mailfrom=david.laight@aculab.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: aculab.com
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210622_013856_159587_0664EAC1 
X-CRM114-Status: GOOD (  21.97  )
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

RnJvbTogTmljayBLb3NzaWZpZGlzDQo+IFNlbnQ6IDIyIEp1bmUgMjAyMSAwMjowOA0KPiANCj4g
zqPPhM65z4IgMjAyMS0wNi0xNyAxODoyNywgTWF0dGVvIENyb2NlIM6tzrPPgc6xz4jOtToNCj4g
PiArDQo+ID4gK3ZvaWQgKl9fbWVtc2V0KHZvaWQgKnMsIGludCBjLCBzaXplX3QgY291bnQpDQo+
ID4gK3sNCj4gPiArCXVuaW9uIHR5cGVzIGRlc3QgPSB7IC51OCA9IHMgfTsNCj4gPiArDQo+ID4g
KwlpZiAoY291bnQgPj0gTUlOX1RIUkVTSE9MRCkgew0KPiA+ICsJCWNvbnN0IGludCBieXRlc19s
b25nID0gQklUU19QRVJfTE9ORyAvIDg7DQo+IA0KPiBZb3UgY291bGQgbWFrZSAnY29uc3QgaW50
IGJ5dGVzX2xvbmcgPSBCSVRTX1BFUl9MT05HIC8gODsnDQoNCldoYXQgaXMgd3Jvbmcgd2l0aCBz
aXplb2YgKGxvbmcpID8NCi4uLg0KPiA+ICsJCXVuc2lnbmVkIGxvbmcgY3UgPSAodW5zaWduZWQg
bG9uZyljOw0KPiA+ICsNCj4gPiArCQkvKiBDb21wb3NlIGFuIHVsb25nIHdpdGggJ2MnIHJlcGVh
dGVkIDQvOCB0aW1lcyAqLw0KPiA+ICsJCWN1IHw9IGN1IDw8IDg7DQo+ID4gKwkJY3UgfD0gY3Ug
PDwgMTY7DQo+ID4gKyNpZiBCSVRTX1BFUl9MT05HID09IDY0DQo+ID4gKwkJY3UgfD0gY3UgPDwg
MzI7DQo+ID4gKyNlbmRpZg0KPiA+ICsNCj4gDQo+IFlvdSBkb24ndCBoYXZlIHRvIGNyZWF0ZSBj
dSBoZXJlLCB5b3UnbGwgZmlsbCBkZXN0IGJ1ZmZlciB3aXRoICdjJw0KPiBhbnl3YXkgc28gYWZ0
ZXIgZmlsbGluZyB1cCBlbm91Z2ggJ2MncyB0byBiZSBhYmxlIHRvIGdyYWIgYW4gYWxpZ25lZA0K
PiB3b3JkIGZ1bGwgb2YgdGhlbSBmcm9tIGRlc3QsIHlvdSBjYW4ganVzdCBncmFiIHRoYXQgd29y
ZCBhbmQga2VlcA0KPiBmaWxsaW5nIHVwIGRlc3Qgd2l0aCBpdC4NCg0KVGhhdCB3aWxsIGJlIGEg
bG90IHNsb3dlciAtIGVzcGVjaWFsbHkgaWYgcnVuIG9uIHNvbWV0aGluZyBsaWtlIHg4Ni4NCkEg
d3JpdGUtcmVhZCBvZiB0aGUgc2FtZSBzaXplIGlzIG9wdGltaXNlZCBieSB0aGUgc3RvcmUtbG9h
ZCBmb3J3YXJkZXIuDQpCdXQgdGhlIGJ5dGUgd3JpdGUsIHdvcmQgcmVhZCB3aWxsIGhhdmUgdG8g
Z28gdmlhIHRoZSBjYWNoZS4NCg0KWW91IGNhbiBqdXN0IHdyaXRlOg0KCWN1ID0gKHVuc2lnbmVk
IGxvbmcpYyAqIDB4MDEwMTAxMDEwMTAxMDEwMXVsbDsNCmFuZCBsZXQgdGhlIGNvbXBpbGVyIHNv
cnQgb3V0IHRoZSBiZXN0IHdheSB0byBnZW5lcmF0ZSB0aGUgY29uc3RhbnQuDQoNCj4gDQo+ID4g
KyNpZm5kZWYgQ09ORklHX0hBVkVfRUZGSUNJRU5UX1VOQUxJR05FRF9BQ0NFU1MNCj4gPiArCQkv
KiBGaWxsIHRoZSBidWZmZXIgb25lIGJ5dGUgYXQgdGltZSB1bnRpbCB0aGUgZGVzdGluYXRpb24N
Cj4gPiArCQkgKiBpcyBhbGlnbmVkIG9uIGEgMzIvNjQgYml0IGJvdW5kYXJ5Lg0KPiA+ICsJCSAq
Lw0KPiA+ICsJCWZvciAoOyBjb3VudCAmJiBkZXN0LnVwdHIgJSBieXRlc19sb25nOyBjb3VudC0t
KQ0KPiANCj4gWW91IGNvdWxkIHJldXNlICYgbWFzayBoZXJlIGluc3RlYWQgb2YgJSBieXRlc19s
b25nLg0KPiANCj4gPiArCQkJKmRlc3QudTgrKyA9IGM7DQo+ID4gKyNlbmRpZg0KPiANCj4gSSBu
b3RpY2VkIHlvdSBhbHNvIHVzZWQgQ09ORklHX0hBVkVfRUZGSUNJRU5UX1VOQUxJR05FRF9BQ0NF
U1Mgb24geW91cg0KPiBtZW1jcHkgcGF0Y2gsIGlzIGl0IHdvcnRoIGl0IGhlcmUgPyBUbyBiZWdp
biB3aXRoIHJpc2N2IGRvZXNuJ3Qgc2V0IGl0DQo+IGFuZCBldmVuIGlmIGl0IGRpZCB3ZSBhcmUg
dGFsa2luZyBhYm91dCBhIGxvb3AgdGhhdCB3aWxsIHJ1biBqdXN0IGEgZmV3DQo+IHRpbWVzIHRv
IHJlYWNoIHRoZSBhbGlnbm1lbnQgYm91bmRhcnkgKHdvcnN0IGNhc2Ugc2NlbmFyaW8gaXQnbGwg
cnVuIDcNCj4gdGltZXMpLCBJIGRvbid0IHRoaW5rIHdlIGdhaW4gbXVjaCBoZXJlLCBldmVuIGZv
ciBhcmNocyB0aGF0IGhhdmUNCj4gZWZmaWNpZW50IHVuYWxpZ25lZCBhY2Nlc3MuDQoNCldpdGgg
Q09ORklHX0hBVkVfRUZGSUNJRU5UX1VOQUxJR05FRF9BQ0NFU1MgaXQgcHJvYmFibHkgaXNuJ3Qg
d29ydGgNCmV2ZW4gY2hlY2tpbmcgdGhlIGFsaWdubWVudC4NCldoaWxlIGFsaWduaW5nIHRoZSBj
b3B5IHdpbGwgYmUgcXVpY2tlciBmb3IgYW4gdW5hbGlnbmVkIGJ1ZmZlciB0aGV5DQphbG1vc3Qg
Y2VydGFpbmx5IGRvbid0IGhhcHBlbiBvZnRlbiBlbm91Z2ggdG8gd29ycnkgYWJvdXQuDQpJbiBh
bnkgY2FzZSB5b3UnZCB3YW50IHRvIGRvIGEgbWlzYWxpZ25lZCB3b3JkIHdyaXRlIHRvIHRoZSBz
dGFydA0Kb2YgdGhlIGJ1ZmZlciAtIG5vdCBzZXBhcmF0ZSBieXRlIHdyaXRlcy4NClByb3ZpZGVk
IHRoZSBidWZmZXIgaXMgbG9uZyBlbm91Z2ggeW91IGNhbiBhbHNvIGRvIGEgbWlzYWxpZ25lZCB3
cml0ZQ0KdG8gdGhlIGVuZCBvZiB0aGUgYnVmZmVyIGJlZm9yZSBmaWxsaW5nIGZyb20gdGhlIHN0
YXJ0Lg0KDQpJIHN1c3BlY3QgeW91IG1heSBuZWVkIGVpdGhlciBiYXJyaWVyKCkgb3IgdXNlIGEg
cHRyIHRvIHBhY2tlZA0KdG8gYXZvaWQgdGhlIHBlcnZlcnRlZCAndW5kZWZpbmVkIGJlaGF2aW91
cicgZnViYXIuJw0KDQoJRGF2aWQNCg0KLQ0KUmVnaXN0ZXJlZCBBZGRyZXNzIExha2VzaWRlLCBC
cmFtbGV5IFJvYWQsIE1vdW50IEZhcm0sIE1pbHRvbiBLZXluZXMsIE1LMSAxUFQsIFVLDQpSZWdp
c3RyYXRpb24gTm86IDEzOTczODYgKFdhbGVzKQ0KX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2
QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9saW51eC1yaXNjdgo=
