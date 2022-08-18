Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63F07C00140
	for <linux-riscv@archiver.kernel.org>; Thu, 18 Aug 2022 20:53:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kfXAWYQB6/v5d2P6Xch7ZTjLElczN0znKG5DZdUQNCs=; b=OG/hSP/tu1xlbI
	5AJg2xYPY+8cMClZpJL3NDH8QfoBLlNj8tifXwfWLiNRs25OoMKwHsyQWHNJbUOEOtFmW+rhpAzfu
	rkIZOArbu8nzcFNBSPqLu0IfRmR4GY7A87m8SqTq6glkH6+DqMsDC2IrTk8Nh1bYRBJtD79iQcegd
	ss7aOt2fe58bXj+ezq3ggpON4OBu6ygIx7GWpRqXEp0N+ytItwR2ACIdhCe7Js44JR6QaeZxdjFeD
	Koi5mxKjkkbM85w7jtDLT3W82yvPS8wTIfMVCV+MZ4Ed1K/h8wMp5iu7YIGXLPjvozW2Pq/936woH
	AxVCARQPJF9CMwpLYF/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oOmVc-009VMb-7s; Thu, 18 Aug 2022 20:52:56 +0000
Received: from mta-02.yadro.com ([89.207.88.252] helo=mta-01.yadro.com)
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oOmVY-009VJn-KU
	for linux-riscv@lists.infradead.org; Thu, 18 Aug 2022 20:52:54 +0000
Received: from localhost (unknown [127.0.0.1])
	by mta-01.yadro.com (Postfix) with ESMTP id 0156C4359F;
	Thu, 18 Aug 2022 20:52:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=yadro.com; h=
	mime-version:content-transfer-encoding:content-id:content-type
	:content-type:content-language:accept-language:in-reply-to
	:references:message-id:date:date:subject:subject:from:from
	:received:received:received:received:received; s=mta-01; t=
	1660855966; x=1662670367; bh=0CuvmfWlSa0wjXgEDCRD47/iNPX9mLuZGhB
	GtCPVZDU=; b=PAzbT42CF4a0YwXgEOwRLtDC3AnjoxQNBz9ZKioTN2q7rQQz+4I
	5fknWt4P6v7CdPqjn+70WmCdMoS7gcv0E2Lu8du0GQz0Gx7dN5PLEy1PCwAVozvH
	CVTzBTxtUgAmfkE6ygXE2Hr1Dg3f96pvgoVG8RH70IFpe044OM+PahGc=
X-Virus-Scanned: amavisd-new at yadro.com
Received: from mta-01.yadro.com ([127.0.0.1])
	by localhost (mta-01.yadro.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id j1cUcN1NzEhB; Thu, 18 Aug 2022 23:52:46 +0300 (MSK)
Received: from T-EXCH-02.corp.yadro.com (t-exch-02.corp.yadro.com [172.17.10.102])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mta-01.yadro.com (Postfix) with ESMTPS id BF0C943595;
	Thu, 18 Aug 2022 23:52:45 +0300 (MSK)
Received: from T-Exch-05.corp.yadro.com (172.17.10.109) by
 T-EXCH-02.corp.yadro.com (172.17.10.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id
 15.1.669.32; Thu, 18 Aug 2022 23:52:45 +0300
Received: from T-EXCH-08.corp.yadro.com (172.17.11.58) by
 T-Exch-05.corp.yadro.com (172.17.10.109) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.9; Thu, 18 Aug 2022 23:52:44 +0300
Received: from T-EXCH-08.corp.yadro.com ([172.17.11.58]) by
 T-EXCH-08.corp.yadro.com ([172.17.11.58]) with mapi id 15.02.1118.009; Thu,
 18 Aug 2022 23:52:44 +0300
From: Sergei Miroshnichenko <s.miroshnichenko@yadro.com>
To: "jrtc27@jrtc27.com" <jrtc27@jrtc27.com>
CC: "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
	"samuel@sholland.org" <samuel@sholland.org>, "linux@yadro.com"
	<linux@yadro.com>, "heiko@sntech.de" <heiko@sntech.de>, "palmer@dabbelt.com"
	<palmer@dabbelt.com>
Subject: Re: [PATCH] riscv: dma-mapping: Use conventional cache operations for
 dma_sync*()
Thread-Topic: [PATCH] riscv: dma-mapping: Use conventional cache operations
 for dma_sync*()
Thread-Index: AQHYsyLMX3Tk8ykg506+8AwsN9WIu620w7UAgAAsp4A=
Date: Thu, 18 Aug 2022 20:52:44 +0000
Message-ID: <0fb64928174f49f81f4a9b97760b2771cbcdbf14.camel@yadro.com>
References: <20220818165105.99746-1-s.miroshnichenko@yadro.com>
	 <1B438F95-364E-4125-B2EE-D673E0B4BEB3@jrtc27.com>
In-Reply-To: <1B438F95-364E-4125-B2EE-D673E0B4BEB3@jrtc27.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [172.17.15.136]
Content-ID: <838ED1A93C68684FAEFE6AFC4C0F36A5@yadro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220818_135253_068521_B75F85D0 
X-CRM114-Status: GOOD (  38.80  )
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

SGkgSmVzcywNCg0KT24gVGh1LCAyMDIyLTA4LTE4IGF0IDE5OjEyICswMTAwLCBKZXNzaWNhIENs
YXJrZSB3cm90ZToNCj4gT24gMTggQXVnIDIwMjIsIGF0IDE3OjUxLCBTZXJnZWkgTWlyb3Nobmlj
aGVua28NCj4gPHMubWlyb3NobmljaGVua29AeWFkcm8uY29tPiB3cm90ZToNCj4gPiANCj4gPiBT
dXBwb3J0IG9mIGFyY2hfc3luY19kbWFfZm9yX3tkZXZpY2UsY3B1fSgpIGZvciBSSVNDLVYgd2Fz
IGFkZGVkDQo+ID4gcmVjZW50bHkuDQo+ID4gDQo+ID4gQ3VycmVudGx5LCBmb3JfY3B1KEZST01f
REVWSUNFKSB1c2VzIHRoZSBmbHVzaCAod3JpdGViYWNrIHBsdXMNCj4gPiBpbnZhbGlkYXRlKQ0K
PiA+IGNhY2hlIG9wZXJhdGlvbiwgd2hpY2ggY2FuIG92ZXJ3cml0ZSB0aGUgZGF0YSAocmVjZWl2
ZWQgZnJvbSBhDQo+ID4gZGV2aWNlIHZpYQ0KPiA+IERNQSkgd2l0aCBkaXJ0eSBjYWNoZSBsaW5l
cy4gUmVwbGFjZSBpdCB3aXRoIHRoZSBpbnZhbCB0byBhdm9pZA0KPiA+IGRhdGENCj4gPiBjb3Jy
dXB0aW9ucy4NCj4gPiANCj4gPiBUaGUgc2FtZSBnb2VzIGZvciBmb3JfY3B1KEJJRElSRUNUSU9O
QUwpLCBpdCB3YXMgYWxzbyBmbHVzaGluZyB0aGUNCj4gPiBjYWNoZSwNCj4gPiBidXQgaXQgaXMg
Y2FsbGVkIGFmdGVyIHRoZSBkZXZpY2UgaGFkIG93bmVkIHRoZSBidWZmZXIuIFNvIGluIG9yZGVy
DQo+ID4gdG8gbm90DQo+ID4gbG9vc2UgdGhlIHJlY2VpdmVkIGRhdGEsIHN0aWNrIHRvIHRoZSBp
bnZhbCBoZXJlIGFzIHdlbGwuDQo+ID4gDQo+ID4gQXMgb2YgZm9yX2RldmljZShGUk9NX0RFVklD
RSksIGFjY29yZGluZyB0byB0aGUgaW5zcGlyYXRpb25hbA0KPiA+IGRpc2N1c3Npb24NCj4gPiBh
Ym91dCBtYXRjaGluZyB0aGUgRE1BIEFQSSBhbmQgY2FjaGUgb3BlcmF0aW9ucyBbMV0sIHRoZSBp
bnZhbCBvciBhDQo+ID4gbm8tb3ANCj4gPiBzaG91bGQgYmUgaGVyZSwgYW5kIHRoaXMgd291bGQg
cmVzb25hdGUgd2l0aCBtb3N0IG90aGVyIGFyY2hlcy4gQnV0DQo+ID4gaW4gYQ0KPiA+IGxhdGVy
IGRpc2N1c3Npb24gWzJdIGl0IHdhcyBkZWNpZGVkIHRoYXQgdGhlIGNsZWFuICh3aGljaCBpcyB1
c2VkDQo+ID4gbm93KSBpcw0KPiA+IGluZGVlZCBwcmVmZXJhYmxlIGFuZCBzYWZlciwgdGhvdWdo
IHNsb3dlci4gVGhlIGFybTY0IGhhcyBiZWVuDQo+ID4gcmVjZW50bHkNCj4gPiBjaGFuZ2VkIGlu
IHRoZSBzYW1lIHdheSBbM10uDQo+IA0KPiBGbHVzaCBpcyBhbHdheXMgYSB2YWxpZCB3YXkgdG8g
aW1wbGVtZW50IGludmFsaWRhdGUsIGFuZCBpZiBpdCBkb2VzDQo+IG5vdA0KPiB3b3JrIHRoZW4g
eW91IGhhdmUgYnVncyBlbHNld2hlcmUsIHNpbmNlIHRoZSBDUFUgaXMgZnJlZSB0byB3cml0ZSBv
dXQNCj4gdGhlIGRpcnR5IGNhY2hlIGxpbmVzIGF0IGFueSBwb2ludCBiZWZvcmUgYW4gaW52YWxp
ZGF0ZS4gU28gd2hpbHN0DQo+IGl04oCZcw0KPiBtb3JlIGVmZmljaWVudCB0byB1c2UgaW52YWxp
ZGF0ZSBhbmQgaGludCB0byB0aGUgY29yZSB0aGF0IGl0IGRvZXMNCj4gbm90DQo+IG5lZWQgdG8g
ZG8gYW55IHdyaXRpbmcsIGl0IGlzIG5vIG1vcmUgY29ycmVjdCwgYW5kIHRoaXMgdGhpcyBwYXRj
aA0KPiBkZXNjcmlwdGlvbiBpcyBtaXNndWlkZWQuIFlvdSBldmVuIG1pZ2h0IHdpc2ggdG8gdXNl
IHRoZSBmYWN0IHRoYXQgaXQNCj4gaXMgY3VycmVudGx5IGEgZmx1c2ggYXMgYSBjb252ZW5pZW50
IHNhbml0aXNlciBmb3Igd2hhdGV2ZXIgaXMNCj4gY3VycmVudGx5IHZpb2xhdGluZyB0aGUgbm9u
LWNvaGVyZW50IERNQSBydWxlcyBhbmQgZml4IHRoYXQgYmVmb3JlDQo+IGl04oCZcw0KPiBzd2l0
Y2hlZCB0byBpbnZhbGlkYXRlIGFuZCBwYXBlcnMgb3ZlciB0aGUgaXNzdWUgKGF0IGxlYXN0IGlu
DQo+IHdoYXRldmVyDQo+IGltcGxlbWVudGF0aW9uIHlvdeKAmXJlIHJ1bm5pbmcgb24pLg0KDQpZ
b3UgYXJlIHJpZ2h0LCB0aGFuayB5b3UsIHRoZSBkZXNjcmlwdGlvbiAqaXMqIG1pc2xlYWRpbmc6
IGNhY2hlIGxpbmVzDQpjYW4ndCBnZXQgZGlydHkgYmVmb3JlIGZvcl9jcHUoKSwgYXMgdGhleSBh
cmUgY2xlYW5lZCBkdXJpbmcNCmZvcl9kZXZpY2UoKSwgYW5kIGFyZSBub3Qgd3JpdHRlbiB0byBi
eSB0aGUgQ1BVIGluIGJldHdlZW4uDQoNCkkgZ2F2ZSBpdCBhbm90aGVyIHRob3VnaHQ6IHRoZSBy
ZWFzb24gdG8gaW52YWxpZGF0ZSBpbiBmb3JfY3B1KCkgaXMNCnRoYXQgdGhlIENQVSBjYW4gc3Bl
Y3VsYXRpdmVseSBwcmVmZXRjaCB0aGUgYnVmZmVyIGFmdGVyDQptYXAoKS9mb3JfZGV2aWNlKCkg
YnV0IGJlZm9yZSB0aGUgRE1BIGlzIGZpbmlzaGVkLg0KDQpFdmVuIGlmIHJlcGxhY2UgdGhlIGNs
ZWFuIGluIGZvcl9kZXZpY2UoRlJPTV9ERVZJQ0UpIHdpdGggdGhlIGZsdXNoLCBhDQpwcmVmZXRj
aCBzdGlsbCBtYXkgaGFwcGVuLCByZXF1aXJpbmcgYW4gaW52YWxpZGF0aW9uLg0KDQpTZXJnZQ0K
DQo+IA0KPiBKZXNzDQo+IA0KPiA+IFsxXSBkbWFfc3luY18qX2Zvcl9jcHUgYW5kIGRpcmVjdGlv
bj1UT19ERVZJQ0UNCj4gPiBMaW5rOiBodHRwczovL2xrbWwub3JnL2xrbWwvMjAxOC81LzE4Lzk3
OQ0KPiA+IA0KPiA+IFsyXSBDYWNoZSBtYWludGVuYW5jZSBmb3Igbm9uLWNvaGVyZW50IERNQSBp
bg0KPiA+IGFyY2hfc3luY19kbWFfZm9yX2RldmljZSgpDQo+ID4gTGluazoNCj4gPiBodHRwczov
L2xvcmUua2VybmVsLm9yZy9hbGwvMjAyMjA2MDYxNTIxNTAuR0EzMTU2OEB3aWxsaWUtdGhlLXRy
dWNrLw0KPiA+IA0KPiA+IFszXSBjb21taXQgYzUwZjExYzYxOTZmICgiYXJtNjQ6IG1tOiBEb24n
dCBpbnZhbGlkYXRlIEZST01fREVWSUNFDQo+ID4gYnVmZmVycyBhdCBzdGFydCBvZiBETUEgdHJh
bnNmZXIiKQ0KPiA+IA0KPiA+IEZpeGVzOiAxNjMxYmExMjU5ZDYgKCJyaXNjdjogQWRkIHN1cHBv
cnQgZm9yIG5vbi1jb2hlcmVudCBkZXZpY2VzDQo+ID4gdXNpbmcgemljYm9tIGV4dGVuc2lvbiIp
DQo+ID4gU2lnbmVkLW9mZi1ieTogU2VyZ2VpIE1pcm9zaG5pY2hlbmtvIDxzLm1pcm9zaG5pY2hl
bmtvQHlhZHJvLmNvbT4NCj4gPiAtLS0NCj4gPiBhcmNoL3Jpc2N2L21tL2RtYS1ub25jb2hlcmVu
dC5jIHwgMiArLQ0KPiA+IDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlv
bigtKQ0KPiA+IA0KPiA+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L21tL2RtYS1ub25jb2hlcmVu
dC5jIGIvYXJjaC9yaXNjdi9tbS9kbWEtDQo+ID4gbm9uY29oZXJlbnQuYw0KPiA+IGluZGV4IGNk
MjIyNTMwNGM4Mi4uMmE4ZjYxMjQwMjFmIDEwMDY0NA0KPiA+IC0tLSBhL2FyY2gvcmlzY3YvbW0v
ZG1hLW5vbmNvaGVyZW50LmMNCj4gPiArKysgYi9hcmNoL3Jpc2N2L21tL2RtYS1ub25jb2hlcmVu
dC5jDQo+ID4gQEAgLTQ1LDcgKzQ1LDcgQEAgdm9pZCBhcmNoX3N5bmNfZG1hX2Zvcl9jcHUocGh5
c19hZGRyX3QgcGFkZHIsDQo+ID4gc2l6ZV90IHNpemUsDQo+ID4gwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqAgYnJlYWs7DQo+ID4gwqDCoMKgwqDCoCBjYXNlIERNQV9GUk9NX0RFVklDRToNCj4g
PiDCoMKgwqDCoMKgIGNhc2UgRE1BX0JJRElSRUNUSU9OQUw6DQo+ID4gLcKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoCBBTFRfQ01PX09QKGZsdXNoLCB2YWRkciwgc2l6ZSwNCj4gPiByaXNjdl9jYm9t
X2Jsb2NrX3NpemUpOw0KPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgQUxUX0NNT19PUChp
bnZhbCwgdmFkZHIsIHNpemUsDQo+ID4gcmlzY3ZfY2JvbV9ibG9ja19zaXplKTsNCj4gPiDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBicmVhazsNCj4gPiDCoMKgwqDCoMKgIGRlZmF1bHQ6DQo+
ID4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgYnJlYWs7DQo+ID4gLS0NCj4gPiAyLjM3LjIN
Cj4gPiANCj4gPiANCj4gPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXw0KPiA+IGxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdA0KPiA+IGxpbnV4LXJpc2N2QGxp
c3RzLmluZnJhZGVhZC5vcmcNCj4gPiBodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2xpbnV4LXJpc2N2DQo+IA0KDQpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZA
bGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2xpbnV4LXJpc2N2Cg==
