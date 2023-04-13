Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3613C77B61
	for <linux-riscv@archiver.kernel.org>; Thu, 13 Apr 2023 21:11:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9QSBCPk9l+dTkudUs6tk5vwIjLMVvfw8EvowQGkC4VQ=; b=Fl74pvKlL9lnFm
	l7nU6gy5bAwV5BPXblBjwUciYFOqwStZEQzD7yRPS4fCCajinQUpv+StAvIWB3T6VpXzYrAUXC7/r
	CnNS+F/OkjqLxKoXJNnqs+o0VuKEMJnasOjwkKAac9fFl7ty00WBj15WPZ1ZqzOr/3ccpVzbVZZ85
	pPSP9+GIhs9SXjZHz0z/8lVIOLDbg82cjHaeqfbYAghcWfDEyJrwkrgjDvxQYrvM4y1IoHmzcbUDD
	YNdJ4CQnSRFl65iC3NcLL/WV+ikGGgTlvVmmw5taeA7J/Y9iIGF2mWMtAJ0HeQjL2/HzwWexNAdKC
	J6FXXfZuoB606mzg1hWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pn4Df-007A91-2g;
	Thu, 13 Apr 2023 21:11:03 +0000
Received: from eu-smtp-delivery-151.mimecast.com ([147.28.36.151])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pn4DY-007A7C-1o
	for linux-riscv@lists.infradead.org;
	Thu, 13 Apr 2023 21:11:01 +0000
Received: from AcuMS.aculab.com (156.67.243.121 [156.67.243.121]) by
 relay.mimecast.com with ESMTP with both STARTTLS and AUTH (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 uk-mta-1-IpWHsB8NM7ugMmOTQXH9Pg-1; Thu, 13 Apr 2023 22:10:48 +0100
X-MC-Unique: IpWHsB8NM7ugMmOTQXH9Pg-1
Received: from AcuMS.Aculab.com (10.202.163.6) by AcuMS.aculab.com
 (10.202.163.6) with Microsoft SMTP Server (TLS) id 15.0.1497.48; Thu, 13 Apr
 2023 22:10:46 +0100
Received: from AcuMS.Aculab.com ([::1]) by AcuMS.aculab.com ([::1]) with mapi
 id 15.00.1497.048; Thu, 13 Apr 2023 22:10:46 +0100
From: David Laight <David.Laight@ACULAB.COM>
To: 'Atish Patra' <atishp@atishpatra.org>, Alexandre Ghiti
	<alexghiti@rivosinc.com>
CC: Jonathan Corbet <corbet@lwn.net>, Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>, Arnaldo Carvalho de Melo <acme@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>, Alexander Shishkin
	<alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, "Namhyung
 Kim" <namhyung@kernel.org>, Ian Rogers <irogers@google.com>, Paul Walmsley
	<paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
	<aou@eecs.berkeley.edu>, Anup Patel <anup@brainfault.org>, Will Deacon
	<will@kernel.org>, Rob Herring <robh@kernel.org>, "linux-doc@vger.kernel.org"
	<linux-doc@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-perf-users@vger.kernel.org"
	<linux-perf-users@vger.kernel.org>, "linux-riscv@lists.infradead.org"
	<linux-riscv@lists.infradead.org>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>
Subject: RE: [PATCH 0/4] riscv: Allow userspace to directly access perf
 counters
Thread-Topic: [PATCH 0/4] riscv: Allow userspace to directly access perf
 counters
Thread-Index: AQHZbjzyrjlAD1jWcEaLGLNw35Pifq8pufOQ
Date: Thu, 13 Apr 2023 21:10:46 +0000
Message-ID: <aadca595b4a24e36932ba41e61f4e263@AcuMS.aculab.com>
References: <20230413161725.195417-1-alexghiti@rivosinc.com>
 <CAOnJCU+72PV1=o1c_TpogkmBT36278BneVWEMr1=tqX0CZi+ag@mail.gmail.com>
In-Reply-To: <CAOnJCU+72PV1=o1c_TpogkmBT36278BneVWEMr1=tqX0CZi+ag@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20230413_141056_868546_3ADDA836 
X-CRM114-Status: GOOD (  18.28  )
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

RnJvbTogQXRpc2ggUGF0cmENCj4gU2VudDogMTMgQXByaWwgMjAyMyAyMDoxOA0KPiANCj4gT24g
VGh1LCBBcHIgMTMsIDIwMjMgYXQgOTo0N+KAr1BNIEFsZXhhbmRyZSBHaGl0aSA8YWxleGdoaXRp
QHJpdm9zaW5jLmNvbT4gd3JvdGU6DQo+ID4NCj4gPiByaXNjdiB1c2VkIHRvIGFsbG93IGRpcmVj
dCBhY2Nlc3MgdG8gY3ljbGUvdGltZS9pbnN0cmV0IGNvdW50ZXJzLA0KPiA+IGJ5cGFzc2luZyB0
aGUgcGVyZiBmcmFtZXdvcmssIHRoaXMgcGF0Y2hzZXQgaW50ZW5kcyB0byBhbGxvdyB0aGUgdXNl
ciB0bw0KPiA+IG1tYXAgYW55IGNvdW50ZXIgd2hlbiBhY2Nlc3NlZCB0aHJvdWdoIHBlcmYuIEJ1
dCB3ZSBjYW4ndCBicmVhayB0aGUNCj4gPiBleGlzdGluZyBiZWhhdmlvdXIgc28gd2UgaW50cm9k
dWNlIGEgc3lzY3RsIHBlcmZfdXNlcl9hY2Nlc3MgbGlrZSBhcm02NA0KPiA+IGRvZXMsIHdoaWNo
IGRlZmF1bHRzIHRvIHRoZSBsZWdhY3kgbW9kZSBkZXNjcmliZWQgYWJvdmUuDQo+ID4NCj4gDQo+
IEl0IHdvdWxkIGJlIGdvb2QgcHJvdmlkZSBhZGRpdGlvbmFsIGRpcmVjdGlvbiBmb3IgdXNlciBz
cGFjZSBwYWNrYWdlczoNCj4gDQo+IFRoZSBsZWdhY3kgYmVoYXZpb3IgaXMgc3VwcG9ydGVkIGZv
ciBub3cgaW4gb3JkZXIgdG8gYXZvaWQgYnJlYWtpbmcNCj4gZXhpc3Rpbmcgc29mdHdhcmUuDQo+
IEhvd2V2ZXIsIHJlYWRpbmcgY291bnRlcnMgZGlyZWN0bHkgd2l0aG91dCBwZXJmIGludGVyYWN0
aW9uIG1heQ0KPiBwcm92aWRlIGluY29ycmVjdCB2YWx1ZXMgd2hpY2gNCj4gdGhlIHVzZXJzcGFj
ZSBzb2Z0d2FyZSBtdXN0IGF2b2lkLiBXZSBhcmUgaG9waW5nIHRoYXQgdGhlIHVzZXIgc3BhY2UN
Cj4gcGFja2FnZXMgd2hpY2gNCj4gcmVhZCB0aGUgY3ljbGUvaW5zdHJldCBkaXJlY3RseSwgd2ls
bCBtb3ZlIHRvIHRoZSBwcm9wZXIgaW50ZXJmYWNlDQo+IGV2ZW50dWFsbHkgaWYgdGhleSBhY3R1
YWxseSBuZWVkIGl0Lg0KPiBNb3N0IG9mIHRoZSB1c2VycyBhcmUgc3VwcG9zZWQgdG8gcmVhZCAi
dGltZSIgaW5zdGVhZCBvZiAiY3ljbGUiIGlmDQo+IHRoZXkgaW50ZW5kIHRvIHJlYWQgdGltZXN0
YW1wcy4NCg0KSWYgeW91IGFyZSB0cnlpbmcgdG8gbWVhc3VyZSB0aGUgcGVyZm9ybWFuY2Ugb2Yg
c2hvcnQgY29kZQ0KZnJhZ21lbnRzIHRoZW4geW91IG5lZWQgcHJldHR5IG11Y2ggcmF3IGFjY2Vz
cyBkaXJlY3RseSB0bw0KdGhlIGN5Y2xlL2Nsb2NrIGNvdW50IHJlZ2lzdGVyLg0KDQpJJ3ZlIGRv
bmUgdGhpcyBvbiB4ODYgdG8gY29tcGFyZSB0aGUgYWN0dWFsIGN5Y2xlIHRpbWVzDQpvZiBkaWZm
ZXJlbnQgaW1wbGVtZW50YXRpb25zIG9mIHRoZSBJUCBjaGVja3N1bSBsb29wDQooYW5kIGNvbXBh
cmUgdGhlbSB0byB0aGUgdGhlb3JldGljYWwgbGltaXQpLg0KVGhlIHBlcmYgZnJhbWV3b3JrIGp1
c3QgYWRkZWQgZmFyIHRvbyBtdWNoIGxhdGVuY3ksDQpvbmx5IGRpcmVjdGx5IHJlYWRpbmcgdGhl
IGNwdSByZWdpc3RlcnMgZ2F2ZSBhbnl0aGluZw0KbGlrZSByZWxpYWJsZSAoYW5kIGNvbnNpc3Rl
bnQpIGFuc3dlcnMuDQoNCkNsZWFybHkgcHJvY2VzcyBzd2l0Y2hlcyAoZXNwZWNpYWxseSBjcHUg
bWlncmF0aW9ucykgY2F1c2UNCnByb2JsZW1zLCBidXQgdGhleSBhcmUgb2J2aW91c2x5IGludmFs
aWQgdmFsdWVzIGFuZCBjYW4NCmJlIGlnbm9yZWQuDQoNClNvIHdoaWxlIGEgbG90IG9mIHVzZXMg
bWF5IGJlICdoYXBweScgd2l0aCB0aGUgdmFsdWVzIHRoZQ0KcGVyZiBmcmFtZXdvcmsgZ2l2ZXMs
IHNvbWV0aW1lcyB5b3UgZG8gbmVlZCB0byBkaXJlY3RseQ0KcmVhZCB0aGUgcmVsZXZhbnQgcmVn
aXN0ZXJzLg0KDQoJRGF2aWQNCg0KLQ0KUmVnaXN0ZXJlZCBBZGRyZXNzIExha2VzaWRlLCBCcmFt
bGV5IFJvYWQsIE1vdW50IEZhcm0sIE1pbHRvbiBLZXluZXMsIE1LMSAxUFQsIFVLDQpSZWdpc3Ry
YXRpb24gTm86IDEzOTczODYgKFdhbGVzKQ0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxp
c3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0
aW5mby9saW51eC1yaXNjdgo=
