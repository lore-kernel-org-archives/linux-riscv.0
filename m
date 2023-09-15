Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6DA7BEE6447
	for <linux-riscv@archiver.kernel.org>; Fri, 15 Sep 2023 09:35:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Xhu17KyqgkY/1jRvKYz9NuzSQv5beq6MAsYPx6JMwpY=; b=4SXXfW6DS/da7i
	c+OHCKANIU5GjYX5eGalM58u+MfALOY/ur8+npktOktcw+y80j9IHRm33nZi3g/WliMz8P5wqmOdQ
	r4QVwivsdMGxfbhEYWwY5mLoKuNYEHDFzuo0XTluTCk0OUGtEaP4fO1dabfCPrKRxwI8Q5ljnZydT
	ULMYL+wIySuwzBJ56l3ozmyemJ/Fi1HXkpD5wARn7vlZmtdCc15KUT2XlvPV0BcOxYjf6xAJCpety
	nck8XHVagCh5CNxLEmY5qQmZ1ptdQWe+S32deye5m0bL9sLvhj/S+uK3Tj/cmC5PBVCR/sgPrIAv8
	XvwgvFW7pmdR4dc+d6Qg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qh5EB-00AHw1-1o;
	Fri, 15 Sep 2023 09:35:07 +0000
Received: from frasgout.his.huawei.com ([185.176.79.56])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qh5E6-00AHv6-0w;
	Fri, 15 Sep 2023 09:35:04 +0000
Received: from lhrpeml100004.china.huawei.com (unknown [172.18.147.207])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4Rn86g6pjjz6D9DT;
	Fri, 15 Sep 2023 17:30:03 +0800 (CST)
Received: from lhrpeml500001.china.huawei.com (7.191.163.213) by
 lhrpeml100004.china.huawei.com (7.191.162.219) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.31; Fri, 15 Sep 2023 10:34:46 +0100
Received: from lhrpeml500001.china.huawei.com ([7.191.163.213]) by
 lhrpeml500001.china.huawei.com ([7.191.163.213]) with mapi id 15.01.2507.031;
 Fri, 15 Sep 2023 10:34:46 +0100
From: Salil Mehta <salil.mehta@huawei.com>
To: "Rafael J. Wysocki" <rafael@kernel.org>, "Russell King (Oracle)"
	<linux@armlinux.org.uk>
CC: Ard Biesheuvel <ardb@kernel.org>, Jonathan Cameron
	<jonathan.cameron@huawei.com>, James Morse <james.morse@arm.com>,
	"linux-pm@vger.kernel.org" <linux-pm@vger.kernel.org>,
	"loongarch@lists.linux.dev" <loongarch@lists.linux.dev>,
	"linux-acpi@vger.kernel.org" <linux-acpi@vger.kernel.org>,
	"linux-arch@vger.kernel.org" <linux-arch@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-riscv@lists.infradead.org"
	<linux-riscv@lists.infradead.org>, "kvmarm@lists.linux.dev"
	<kvmarm@lists.linux.dev>, "x86@kernel.org" <x86@kernel.org>, "Jean-Philippe
 Brucker" <jean-philippe@linaro.org>, "jianyong.wu@arm.com"
	<jianyong.wu@arm.com>, "justin.he@arm.com" <justin.he@arm.com>
Subject: RE: [RFC PATCH v2 27/35] ACPICA: Add new MADT GICC flags fields [code
 first?]
Thread-Topic: [RFC PATCH v2 27/35] ACPICA: Add new MADT GICC flags fields
 [code first?]
Thread-Index: AQHZ5mDqpYLh+nkhC0mj9mPBt3XEBLAZ5MMAgAB0lICAAAsFgIAAEfIQgADzSoCAABq9gIAAG4DQ
Date: Fri, 15 Sep 2023 09:34:46 +0000
Message-ID: <80e36ff513504a0382a1cbce83e42295@huawei.com>
References: <20230913163823.7880-1-james.morse@arm.com>
	<20230913163823.7880-28-james.morse@arm.com>
	<CAMj1kXHRAt7ecB9p_dm3MjDL5wZkAsVh30hMY2SV_XUe=bm6Vg@mail.gmail.com>
	<20230914155459.00002dba@Huawei.com>
	<CAMj1kXFquiLGCMow3iujHUU4GBZx2t9KfKy1R9iqjBFjY+acaA@mail.gmail.com>
	<f5d9beea95e149ab89364dcdb0f8bf69@huawei.com>
	<ZQQDJT6MOaIOPmq5@shell.armlinux.org.uk>
 <CAJZ5v0jUQ+4G5ArYAtu1gvYF4356CK_QVTO4oWn0ukwdOiZaHA@mail.gmail.com>
In-Reply-To: <CAJZ5v0jUQ+4G5ArYAtu1gvYF4356CK_QVTO4oWn0ukwdOiZaHA@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.126.174.239]
MIME-Version: 1.0
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230915_023502_617666_F3089BD1 
X-CRM114-Status: GOOD (  24.32  )
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

DQo+IEZyb206IFJhZmFlbCBKLiBXeXNvY2tpIDxyYWZhZWxAa2VybmVsLm9yZz4NCj4gU2VudDog
RnJpZGF5LCBTZXB0ZW1iZXIgMTUsIDIwMjMgOTo0NSBBTQ0KPiBUbzogUnVzc2VsbCBLaW5nIChP
cmFjbGUpIDxsaW51eEBhcm1saW51eC5vcmcudWs+DQo+IENjOiBTYWxpbCBNZWh0YSA8c2FsaWwu
bWVodGFAaHVhd2VpLmNvbT47IEFyZCBCaWVzaGV1dmVsIDxhcmRiQGtlcm5lbC5vcmc+Ow0KPiBK
b25hdGhhbiBDYW1lcm9uIDxqb25hdGhhbi5jYW1lcm9uQGh1YXdlaS5jb20+OyBKYW1lcyBNb3Jz
ZQ0KPiA8amFtZXMubW9yc2VAYXJtLmNvbT47IGxpbnV4LXBtQHZnZXIua2VybmVsLm9yZzsgbG9v
bmdhcmNoQGxpc3RzLmxpbnV4LmRldjsNCj4gbGludXgtYWNwaUB2Z2VyLmtlcm5lbC5vcmc7IGxp
bnV4LWFyY2hAdmdlci5rZXJuZWwub3JnOyBsaW51eC0NCj4ga2VybmVsQHZnZXIua2VybmVsLm9y
ZzsgbGludXgtYXJtLWtlcm5lbEBsaXN0cy5pbmZyYWRlYWQub3JnOyBsaW51eC0NCj4gcmlzY3ZA
bGlzdHMuaW5mcmFkZWFkLm9yZzsga3ZtYXJtQGxpc3RzLmxpbnV4LmRldjsgeDg2QGtlcm5lbC5v
cmc7IEplYW4tDQo+IFBoaWxpcHBlIEJydWNrZXIgPGplYW4tcGhpbGlwcGVAbGluYXJvLm9yZz47
IGppYW55b25nLnd1QGFybS5jb207DQo+IGp1c3Rpbi5oZUBhcm0uY29tDQo+IFN1YmplY3Q6IFJl
OiBbUkZDIFBBVENIIHYyIDI3LzM1XSBBQ1BJQ0E6IEFkZCBuZXcgTUFEVCBHSUNDIGZsYWdzIGZp
ZWxkcw0KPiBbY29kZSBmaXJzdD9dDQo+IA0KPiBPbiBGcmksIFNlcCAxNSwgMjAyMyBhdCA5OjA5
4oCvQU0gUnVzc2VsbCBLaW5nIChPcmFjbGUpDQo+IDxsaW51eEBhcm1saW51eC5vcmcudWs+IHdy
b3RlOg0KPiA+DQo+ID4gT24gRnJpLCBTZXAgMTUsIDIwMjMgYXQgMDI6Mjk6MTNBTSArMDAwMCwg
U2FsaWwgTWVodGEgd3JvdGU6DQo+ID4gPiBPbiB4ODYsIGR1cmluZyBpbml0LCBpZiB0aGUgTUFE
VCBlbnRyeSBmb3IgTEFQSUMgaXMgZm91bmQgdG8gYmUNCj4gPiA+IG9ubGluZS1jYXBhYmxlIGFu
ZCBpcyBlbmFibGVkIGFzIHdlbGwgdGhlbiBwb3NzaWJsZSBhbmQgcHJlc2VudA0KPiA+DQo+ID4g
Tm90ZSB0aGF0IHRoZSBBQ1BJIHNwZWMgc2F5cyBlbmFibGVkICsgb25saW5lLWNhcGFibGUgaXNu
J3QgZGVmaW5lZC4NCj4gPg0KPiA+ICJUaGUgaW5mb3JtYXRpb24gY29udmV5ZWQgYnkgdGhpcyBi
aXQgZGVwZW5kcyBvbiB0aGUgdmFsdWUgb2YgdGhlDQo+ID4gRW5hYmxlZCBiaXQuIElmIHRoZSBF
bmFibGVkIGJpdCBpcyBzZXQsIHRoaXMgYml0IGlzIHJlc2VydmVkIGFuZA0KPiA+IG11c3QgYmUg
emVyby4iDQo+ID4NCj4gPiBTbywgaWYgeDg2IGlzIGRvaW5nIHNvbWV0aGluZyB3aXRoIHRoZSBl
bmFibGVkICYmIG9ubGluZS1jYXBhYmxlDQo+ID4gc3RhdGUgKG90aGVyIHRoYW4gaWdub3Jpbmcg
dGhlIG9ubGluZS1jYXBhYmxlKSB0aGVuIHRlY2huaWNhbGx5IGl0DQo+ID4gaXMgZG9pbmcgc29t
ZXRoaW5nIHRoYXQgdGhlIHNwZWMgZG9lc24ndCBkZWZpbmUNCj4gDQo+IEFuZCBzbyBpdCBpcyB3
cm9uZy4NCg0KDQpPciBtYXliZSwgc3BlY2lmaWNhdGlvbiBoYXMgbm90IGJlZW4gdXBkYXRlZCB5
ZXQuIGNvZGUtZmlyc3Q/DQoNCg0KPiANCj4gPiAtIGFuZCBpdCdzDQo+ID4gY29tcGxldGVseSBm
aW5lIGlmIGFhcmNoNjQgZG9lcyBzb21ldGhpbmcgZWxzZSAobWF5YmUgdHJlYXRpbmcgaXQNCj4g
PiBzdHJpY3RseSBhcyBwZXIgdGhlIHNwZWMgYW5kIGlnbm9yaW5nIG9ubGluZS1jYXBhYmxlLikN
Cj4gDQo+IFRoYXQgYWN0dWFsbHkgaXMgdGhlIG9ubHkgY29tcGxpYW50IHRoaW5nIHRoYXQgY2Fu
IGJlIGRvbmUuDQoNClllcywgYnV0IHRoZSBxdWVzdGlvbiBpcyBpdCB3aGF0IGlzIHJlcXVpcmVk
IGFuZCBkb2VzIGl0IHNvbHZlcw0KdGhlIHByb2JsZW0gb2YgSG90cGx1Zy4gSSB0aGluayBuby4g
DQoNCkJ5IGNvbXBseWluZyB3aXRoIHdoYXQgaXMgdGhlcmUgaW4gdGhlIHNwZWMgbWVhbnMgd2Ug
aGF2ZSB0bw0KZG8gdGhlIHRyYWRlb2ZmIGJldHdlZW4gaGF2aW5nIG5vdCB0byBzdXBwb3J0IGhv
dCh1bilwbHVnZ2luZw0Kb2YgdGhlIGNvbGQtcGx1Z2dlZCBDUFVzIFZzIHJpc2sgb2YgYnJlYWtp
bmcgdGhlIGxlZ2FjeSBPUw0KYXR0ZW1wdGluZyB0byB1c2UgbmV3ZXIgcGxhdGZvcm1zIHdpdGgg
SG90cGx1ZyBzdXBwb3J0LiBMYXRlcg0KaXMgbW9yZSBvZiBhIEFSTSBwcm9ibGVtIGFzIHdlIGFy
ZSBub3QgYWxsb3dlZCB0byB0d2VhayB0aGUNCkFDUEkgdGFibGVzIG9uY2UgdGhlIHN5c3RlbSBo
YXMgYm9vdGVkLg0KDQoNCj4gDQo+IEFzIHBlciB0aGUgc3BlYyAocXVvdGVkIGFib3ZlKSwgYSBw
bGF0Zm9ybSBmaXJtd2FyZSBzZXR0aW5nDQo+IG9ubGluZS1jYXBhYmxlIHRvIDEgd2hlbiBFbmFi
bGVkIGlzIHNldCBpcyBub3QgY29tcGxpYW50IGFuZCBpdCBpcw0KPiBpbnZhbGlkIHRvIHRyZWF0
IHRoaXMgYXMgbWVhbmluZ2Z1bCBkYXRhLg0KDQpDb3JyZWN0LiBidXQgaXMgaXQgcmVhbGx5IHdo
YXQgd2UgbmVlZD8gV2UgbmVlZCBib3RoIG9mIHRoZQ0KQml0cyB0byBiZSBzZXQgZm9yIHN1cHBv
cnRpbmcgaG90KHVuKXBsdWdnaW5nIG9mIGNvbGQgYm9vdGVkDQpDUFVzLg0KDQoNCj4gDQo+IEFz
IGN1cnJlbnRseSBkZWZpbmVkLCBvbmxpbmUtY2FwYWJsZSBpcyBvbmx5IGFwcGxpY2FibGUgdG8g
Q1BVcyB0aGF0DQo+IGFyZSBub3QgZW5hYmxlZCB0byBzdGFydCB3aXRoIGFuZCBpdHMgcm9sZSBp
cyB0byBtYWtlIGl0IGNsZWFyIHdoZXRoZXINCj4gb3Igbm90IHRoZXkgY2FuIGJlIGVuYWJsZWQg
bGF0ZXIgQUZBSUNTLg0KDQpDb3JyZWN0Lg0KDQo+IA0KPiBJZiB0aGVyZSBpcyBhIG5lZWQgdG8g
cmVwcmVzZW50IHRoZSBjYXNlIGluIHdoaWNoIGEgQ1BJIHRoYXQgaXMNCj4gZW5hYmxlZCB0byBz
dGFydCB3aXRoIGNhbiBiZSBkaXNhYmxlZCwgYnV0IGNhbm5vdCBiZSBlbmFibGVkIGFnYWluLA0K
PiB0aGUgc3BlYyBuZWVkcyB0byBiZSB1cGRhdGVkLg0KDQpBYnNvbHV0ZWx5LiBBbmQgdGhhdOKA
mXMgd2hhdCBteSBodW1ibGUgc3VnZ2VzdGlvbiBpcyBhcyB3ZWxsLg0KDQoNClRoYW5rcw0KU2Fs
aWwuDQoNCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxp
bnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0
dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
