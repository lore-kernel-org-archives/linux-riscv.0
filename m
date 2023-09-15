Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0D71EEB596
	for <linux-riscv@archiver.kernel.org>; Fri, 15 Sep 2023 14:50:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ST7muyRlj0PIACnOYGmWHOdvnJicp1ImHaLzad3kH1c=; b=jwomPaweisZ7SI
	Rih0mHcE2uyaoY/mwzUjwSp199Z4JGU2aG3hwXPQF/6sK2Z2f+yPfXOJtKEaKCxo4CzXbpvXNfJ0/
	eQQ8jyr21+QNFMxJhU16UPGCpQtP2NXio1pQinOBhkbKAbB+a5P7ez9mgtpXhG1WQ0FzXf1Wh93hZ
	TUgBcD52sXCMOA6Fs0zafu5c5gO8uQd2zN3Pp3ra6S4hOkd3QXCwKVJem9sWvBibQeebEmGeonM84
	6Zour9ksMrUCwTBw/M5cHGW4qnWZyOVTGl3gqVbjcEIxYOd/EDOreipyzmoXCIn/pW91J25/2F7U7
	Hp8SRyYYhPExI6SRdr3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qhA8p-00Auwv-19;
	Fri, 15 Sep 2023 14:49:55 +0000
Received: from frasgout.his.huawei.com ([185.176.79.56])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qhA8k-00Auuh-2l;
	Fri, 15 Sep 2023 14:49:52 +0000
Received: from lhrpeml100002.china.huawei.com (unknown [172.18.147.200])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4RnH630yTpz67Nc8;
	Fri, 15 Sep 2023 22:44:59 +0800 (CST)
Received: from lhrpeml500001.china.huawei.com (7.191.163.213) by
 lhrpeml100002.china.huawei.com (7.191.160.241) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.31; Fri, 15 Sep 2023 15:49:41 +0100
Received: from lhrpeml500001.china.huawei.com ([7.191.163.213]) by
 lhrpeml500001.china.huawei.com ([7.191.163.213]) with mapi id 15.01.2507.031;
 Fri, 15 Sep 2023 15:49:41 +0100
From: Salil Mehta <salil.mehta@huawei.com>
To: "Rafael J. Wysocki" <rafael@kernel.org>
CC: "Russell King (Oracle)" <linux@armlinux.org.uk>, Ard Biesheuvel
	<ardb@kernel.org>, Jonathan Cameron <jonathan.cameron@huawei.com>, "James
 Morse" <james.morse@arm.com>, "linux-pm@vger.kernel.org"
	<linux-pm@vger.kernel.org>, "loongarch@lists.linux.dev"
	<loongarch@lists.linux.dev>, "linux-acpi@vger.kernel.org"
	<linux-acpi@vger.kernel.org>, "linux-arch@vger.kernel.org"
	<linux-arch@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-riscv@lists.infradead.org"
	<linux-riscv@lists.infradead.org>, "kvmarm@lists.linux.dev"
	<kvmarm@lists.linux.dev>, "x86@kernel.org" <x86@kernel.org>, "Jean-Philippe
 Brucker" <jean-philippe@linaro.org>, "jianyong.wu@arm.com"
	<jianyong.wu@arm.com>, "justin.he@arm.com" <justin.he@arm.com>
Subject: RE: [RFC PATCH v2 27/35] ACPICA: Add new MADT GICC flags fields [code
 first?]
Thread-Topic: [RFC PATCH v2 27/35] ACPICA: Add new MADT GICC flags fields
 [code first?]
Thread-Index: AQHZ5mDqpYLh+nkhC0mj9mPBt3XEBLAZ5MMAgAB0lICAAAsFgIAAEfIQgADzSoCAABq9gIAAG4DQ////VACAAFZdgA==
Date: Fri, 15 Sep 2023 14:49:41 +0000
Message-ID: <cec8f4ad16434c2daa0b5db7f6d60a6b@huawei.com>
References: <20230913163823.7880-1-james.morse@arm.com>
	<20230913163823.7880-28-james.morse@arm.com>
	<CAMj1kXHRAt7ecB9p_dm3MjDL5wZkAsVh30hMY2SV_XUe=bm6Vg@mail.gmail.com>
	<20230914155459.00002dba@Huawei.com>
	<CAMj1kXFquiLGCMow3iujHUU4GBZx2t9KfKy1R9iqjBFjY+acaA@mail.gmail.com>
	<f5d9beea95e149ab89364dcdb0f8bf69@huawei.com>
	<ZQQDJT6MOaIOPmq5@shell.armlinux.org.uk>
	<CAJZ5v0jUQ+4G5ArYAtu1gvYF4356CK_QVTO4oWn0ukwdOiZaHA@mail.gmail.com>
	<80e36ff513504a0382a1cbce83e42295@huawei.com>
 <CAJZ5v0gou9Pdj_CPC=vLJ-6S-hz+0VY+GMgXcRJk=6t9mL1ykw@mail.gmail.com>
In-Reply-To: <CAJZ5v0gou9Pdj_CPC=vLJ-6S-hz+0VY+GMgXcRJk=6t9mL1ykw@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.126.174.239]
MIME-Version: 1.0
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230915_074951_194760_DE4A1842 
X-CRM114-Status: GOOD (  21.12  )
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

PiBGcm9tOiBSYWZhZWwgSi4gV3lzb2NraSA8cmFmYWVsQGtlcm5lbC5vcmc+DQo+IFNlbnQ6IEZy
aWRheSwgU2VwdGVtYmVyIDE1LCAyMDIzIDExOjIxIEFNDQo+IFRvOiBTYWxpbCBNZWh0YSA8c2Fs
aWwubWVodGFAaHVhd2VpLmNvbT4NCj4gQ2M6IFJhZmFlbCBKLiBXeXNvY2tpIDxyYWZhZWxAa2Vy
bmVsLm9yZz47IFJ1c3NlbGwgS2luZyAoT3JhY2xlKQ0KPiA8bGludXhAYXJtbGludXgub3JnLnVr
PjsgQXJkIEJpZXNoZXV2ZWwgPGFyZGJAa2VybmVsLm9yZz47IEpvbmF0aGFuIENhbWVyb24NCj4g
PGpvbmF0aGFuLmNhbWVyb25AaHVhd2VpLmNvbT47IEphbWVzIE1vcnNlIDxqYW1lcy5tb3JzZUBh
cm0uY29tPjsgbGludXgtDQo+IHBtQHZnZXIua2VybmVsLm9yZzsgbG9vbmdhcmNoQGxpc3RzLmxp
bnV4LmRldjsgbGludXgtYWNwaUB2Z2VyLmtlcm5lbC5vcmc7DQo+IGxpbnV4LWFyY2hAdmdlci5r
ZXJuZWwub3JnOyBsaW51eC1rZXJuZWxAdmdlci5rZXJuZWwub3JnOyBsaW51eC1hcm0tDQo+IGtl
cm5lbEBsaXN0cy5pbmZyYWRlYWQub3JnOyBsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3Jn
Ow0KPiBrdm1hcm1AbGlzdHMubGludXguZGV2OyB4ODZAa2VybmVsLm9yZzsgSmVhbi1QaGlsaXBw
ZSBCcnVja2VyIDxqZWFuLQ0KPiBwaGlsaXBwZUBsaW5hcm8ub3JnPjsgamlhbnlvbmcud3VAYXJt
LmNvbTsganVzdGluLmhlQGFybS5jb20NCj4gU3ViamVjdDogUmU6IFtSRkMgUEFUQ0ggdjIgMjcv
MzVdIEFDUElDQTogQWRkIG5ldyBNQURUIEdJQ0MgZmxhZ3MgZmllbGRzDQo+IFtjb2RlIGZpcnN0
P10NCj4gDQo+IE9uIEZyaSwgU2VwIDE1LCAyMDIzIGF0IDExOjM04oCvQU0gU2FsaWwgTWVodGEg
PHNhbGlsLm1laHRhQGh1YXdlaS5jb20+DQo+IHdyb3RlOg0KPiA+DQo+ID4NCj4gPiA+IEZyb206
IFJhZmFlbCBKLiBXeXNvY2tpIDxyYWZhZWxAa2VybmVsLm9yZz4NCj4gPiA+IFNlbnQ6IEZyaWRh
eSwgU2VwdGVtYmVyIDE1LCAyMDIzIDk6NDUgQU0NCj4gPiA+IFRvOiBSdXNzZWxsIEtpbmcgKE9y
YWNsZSkgPGxpbnV4QGFybWxpbnV4Lm9yZy51az4NCj4gPiA+IENjOiBTYWxpbCBNZWh0YSA8c2Fs
aWwubWVodGFAaHVhd2VpLmNvbT47IEFyZCBCaWVzaGV1dmVsIDxhcmRiQGtlcm5lbC5vcmc+Ow0K
PiA+ID4gSm9uYXRoYW4gQ2FtZXJvbiA8am9uYXRoYW4uY2FtZXJvbkBodWF3ZWkuY29tPjsgSmFt
ZXMgTW9yc2UgDQo+ID4gPiA8amFtZXMubW9yc2VAYXJtLmNvbT47IGxpbnV4LXBtQHZnZXIua2Vy
bmVsLm9yZzsgbG9vbmdhcmNoQGxpc3RzLmxpbnV4LmRldjsNCj4gPiA+IGxpbnV4LWFjcGlAdmdl
ci5rZXJuZWwub3JnOyBsaW51eC1hcmNoQHZnZXIua2VybmVsLm9yZzsgbGludXgtDQo+ID4gPiBr
ZXJuZWxAdmdlci5rZXJuZWwub3JnOyBsaW51eC1hcm0ta2VybmVsQGxpc3RzLmluZnJhZGVhZC5v
cmc7IGxpbnV4LQ0KPiA+ID4gcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZzsga3ZtYXJtQGxpc3Rz
LmxpbnV4LmRldjsgeDg2QGtlcm5lbC5vcmc7DQo+IEplYW4tDQo+ID4gPiBQaGlsaXBwZSBCcnVj
a2VyIDxqZWFuLXBoaWxpcHBlQGxpbmFyby5vcmc+OyBqaWFueW9uZy53dUBhcm0uY29tOw0KPiA+
ID4ganVzdGluLmhlQGFybS5jb20NCj4gPiA+IFN1YmplY3Q6IFJlOiBbUkZDIFBBVENIIHYyIDI3
LzM1XSBBQ1BJQ0E6IEFkZCBuZXcgTUFEVCBHSUNDIGZsYWdzDQo+IGZpZWxkcw0KPiA+ID4gW2Nv
ZGUgZmlyc3Q/XQ0KPiA+ID4NCj4gPiA+IE9uIEZyaSwgU2VwIDE1LCAyMDIzIGF0IDk6MDnigK9B
TSBSdXNzZWxsIEtpbmcgKE9yYWNsZSkNCj4gPiA+IDxsaW51eEBhcm1saW51eC5vcmcudWs+IHdy
b3RlOg0KPiA+ID4gPg0KPiA+ID4gPiBPbiBGcmksIFNlcCAxNSwgMjAyMyBhdCAwMjoyOToxM0FN
ICswMDAwLCBTYWxpbCBNZWh0YSB3cm90ZToNCj4gPiA+ID4gPiBPbiB4ODYsIGR1cmluZyBpbml0
LCBpZiB0aGUgTUFEVCBlbnRyeSBmb3IgTEFQSUMgaXMgZm91bmQgdG8gYmUNCj4gPiA+ID4gPiBv
bmxpbmUtY2FwYWJsZSBhbmQgaXMgZW5hYmxlZCBhcyB3ZWxsIHRoZW4gcG9zc2libGUgYW5kIHBy
ZXNlbnQNCj4gPiA+ID4NCj4gPiA+ID4gTm90ZSB0aGF0IHRoZSBBQ1BJIHNwZWMgc2F5cyBlbmFi
bGVkICsgb25saW5lLWNhcGFibGUgaXNuJ3QgZGVmaW5lZC4NCj4gPiA+ID4NCj4gPiA+ID4gIlRo
ZSBpbmZvcm1hdGlvbiBjb252ZXllZCBieSB0aGlzIGJpdCBkZXBlbmRzIG9uIHRoZSB2YWx1ZSBv
ZiB0aGUNCj4gPiA+ID4gRW5hYmxlZCBiaXQuIElmIHRoZSBFbmFibGVkIGJpdCBpcyBzZXQsIHRo
aXMgYml0IGlzIHJlc2VydmVkIGFuZA0KPiA+ID4gPiBtdXN0IGJlIHplcm8uIg0KPiA+ID4gPg0K
PiA+ID4gPiBTbywgaWYgeDg2IGlzIGRvaW5nIHNvbWV0aGluZyB3aXRoIHRoZSBlbmFibGVkICYm
IG9ubGluZS1jYXBhYmxlDQo+ID4gPiA+IHN0YXRlIChvdGhlciB0aGFuIGlnbm9yaW5nIHRoZSBv
bmxpbmUtY2FwYWJsZSkgdGhlbiB0ZWNobmljYWxseSBpdA0KPiA+ID4gPiBpcyBkb2luZyBzb21l
dGhpbmcgdGhhdCB0aGUgc3BlYyBkb2Vzbid0IGRlZmluZQ0KPiA+ID4NCj4gPiA+IEFuZCBzbyBp
dCBpcyB3cm9uZy4NCj4gPg0KPiA+DQo+ID4gT3IgbWF5YmUsIHNwZWNpZmljYXRpb24gaGFzIG5v
dCBiZWVuIHVwZGF0ZWQgeWV0LiBjb2RlLWZpcnN0Pw0KPiANCj4gV2VsbCwgaWYgeW91IGFyZSBh
d2FyZSBvZiBhbnkgY2hhbmdlIHJlcXVlc3RzIHJlbGF0ZWQgdG8gdGhpcyBhbmQNCj4gcG9zdGVk
IGFzIGNvZGUtZmlyc3QsIHBsZWFzZSBsZXQgbWUga25vdy4NCg0KSSBhbSBub3QgYXdhcmUgb2Yg
YW55IG9uIHg4Ni4gTWF5YmUgd2UgY2FuIGRvIGl0IG9uIEFSTSBmaXJzdCBhbmQNCmxldCBvdGhl
ciBBcmNoIHBpdGNoLWluIHRoZWlyIG9iamVjdGlvbiBsYXRlcj8gQWZ0ZXJhbGwsIHRoZXJlIGlz
DQphIGxlZ2l0aW1hdGUgdXNlLWNhc2UgaW4gY2FzZSBvZiBBUk0uIEhhdmluZyBtdXR1YWxseSBl
eGNsdXNpdmUNCmJpdHMgYnJlYWtzIGNlcnRhaW4gdXNlLWNhc2VzIGFuZCB3ZSBoYXZlIHRvIGRv
IHRoZSB0cmFkZW9mZnMuIA0KDQpUaGlzIGNhbiBiZSBkb25lIGluIHBhcmFsbGVsIHdoaWxlIG90
aGVyIHBhdGNoZXMgYXJlIGdldHRpbmcNCnJldmlld2VkIGFuZCBtb21lbnRhcmlseSBsaXZpbmcg
d2l0aCB0aGUgdHJhZGVvZmZzIHRpbGwNCnNwZWNpZmljYXRpb24gaXMgc29ydGVkLiBCdXQgb2Yg
Y291cnNlIGl0IGRlcGVuZHMgdXBvbiB3aGF0DQpvdGhlciBzdGFrZSBob2xkZXJzIGFuZCBtb3N0
IGltcG9ydGFudGx5IHdoYXQgQVJNIEFyY2ggcGVvcGxlDQp0aGluayBvZiBpdC4NCg0KVGhhbmtz
DQpTYWxpbC4NCg0KICANCg0KDQoNCg0KDQoNCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBs
aXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlz
dGluZm8vbGludXgtcmlzY3YK
