Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56AC0C4167B
	for <linux-riscv@archiver.kernel.org>; Thu,  7 Dec 2023 11:32:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dTUi6E/enYsAp5EW7nfkYRD9p8Ay3SwkM2uEr6L25w4=; b=v3iIyTKUR7gNSJ
	aQFF50wAn2l8LTcX9dqY0dVjuvaJAggq3HIoHDSZ1PZweGDq9dCwLdnPBzmaqvDKx+46XuoKLy3Mh
	IUD9mwkHkPa5Y3te5FO6zemgc5cMsF7xaJ7c1L/SICiwIHRRllqgijU9edJEplfV0QX4IVg6thaC0
	HVvtFKKlE9k9Vs0sQhSStpZigkxP5hDUN63bdQKtNKIllb8ScWr3cGRsFuNhFFIp3DciTvXGQIr7+
	/zIgpa0kiDbz4Fcmste/z/ZI5ye1dmdWGX5HNxYVYHUculgeiGBORuu4VnivKkmZ50wyp8l2h/njp
	gTS65b/CGXs1X0ojbxcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rBCc9-00ChKR-0Y;
	Thu, 07 Dec 2023 11:32:21 +0000
Received: from ex01.ufhost.com ([61.152.239.75])
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rBCc5-00ChJW-0V
	for linux-riscv@lists.infradead.org;
	Thu, 07 Dec 2023 11:32:20 +0000
Received: from EXMBX166.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX166", Issuer "EXMBX166" (not verified))
	by ex01.ufhost.com (Postfix) with ESMTP id 9F85524E317;
	Thu,  7 Dec 2023 19:31:44 +0800 (CST)
Received: from EXMBX061.cuchost.com (172.16.6.61) by EXMBX166.cuchost.com
 (172.16.6.76) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Thu, 7 Dec
 2023 19:31:44 +0800
Received: from [192.168.60.132] (180.164.60.184) by EXMBX061.cuchost.com
 (172.16.6.61) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Thu, 7 Dec
 2023 19:31:46 +0800
Message-ID: <580e13ab-a73e-4ce7-999a-8a8685faf2dd@starfivetech.com>
Date: Thu, 7 Dec 2023 19:31:43 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [v3 4/6] drm/vs: Add KMS crtc&plane
Content-Language: en-US
To: Icenowy Zheng <uwu@icenowy.me>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "dri-devel@lists.freedesktop.org"
	<dri-devel@lists.freedesktop.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-riscv@lists.infradead.org"
	<linux-riscv@lists.infradead.org>
CC: "aou@eecs.berkeley.edu" <aou@eecs.berkeley.edu>, "suijingfeng@loongson.cn"
	<suijingfeng@loongson.cn>, "tzimmermann@suse.de" <tzimmermann@suse.de>,
	"paul.walmsley@sifive.com" <paul.walmsley@sifive.com>, "mripard@kernel.org"
	<mripard@kernel.org>, Xingyu Wu <xingyu.wu@starfivetech.com>, Jack Zhu
	<jack.zhu@starfivetech.com>, "palmer@dabbelt.com" <palmer@dabbelt.com>,
	"krzysztof.kozlowski+dt@linaro.org" <krzysztof.kozlowski+dt@linaro.org>,
	William Qiu <william.qiu@starfivetech.com>, Shengyang Chen
	<shengyang.chen@starfivetech.com>, Changhuang Liang
	<changhuang.liang@starfivetech.com>
References: <20231204123315.28456-1-keith.zhao@starfivetech.com>
 <20231204123315.28456-5-keith.zhao@starfivetech.com>
 <7acd5af8fd4c5bf6ee0614f72cf6cb6751c89dc3.camel@icenowy.me>
From: Keith Zhao <keith.zhao@starfivetech.com>
In-Reply-To: <7acd5af8fd4c5bf6ee0614f72cf6cb6751c89dc3.camel@icenowy.me>
X-Originating-IP: [180.164.60.184]
X-ClientProxiedBy: EXCAS062.cuchost.com (172.16.6.22) To EXMBX061.cuchost.com
 (172.16.6.61)
X-YovoleRuleAgent: yovoleflag
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231207_033217_529097_54C49F10 
X-CRM114-Status: GOOD (  14.05  )
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

CgpPbiAyMDIzLzEyLzcgMTY6NDEsIEljZW5vd3kgWmhlbmcgd3JvdGU6Cj4g5ZyoIDIwMjMtMTIt
MDTmmJ/mnJ/kuIDnmoQgMjA6MzMgKzA4MDDvvIxLZWl0aCBaaGFv5YaZ6YGT77yaCj4gKnNuaXAq
Cj4gCj4+ICtzdGF0aWMgdm9pZCB1cGRhdGVfY3Vyc29yX3BsYW5lKHN0cnVjdCB2c19kYyAqZGMs
IHN0cnVjdCB2c19wbGFuZQo+PiAqcGxhbmUsCj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoHN0cnVjdCBkcm1fcGxhbmUgKmRy
bV9wbGFuZSwKPj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgc3RydWN0IGRybV9hdG9taWNfc3RhdGUgKmRybV9zdGF0ZSkKPj4g
K3sKPj4gK8KgwqDCoMKgwqDCoMKgc3RydWN0IGRybV9wbGFuZV9zdGF0ZSAqc3RhdGUgPQo+PiBk
cm1fYXRvbWljX2dldF9uZXdfcGxhbmVfc3RhdGUoZHJtX3N0YXRlLAo+PiArwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoAo+PiDCoCBkcm1fcGxhbmUpOwo+PiArwqDCoMKgwqDCoMKgwqBzdHJ1Y3QgdnNf
cGxhbmVfc3RhdGUgKnBsYW5lX3N0YXRlID0KPj4gdG9fdnNfcGxhbmVfc3RhdGUoc3RhdGUpOwo+
PiArwqDCoMKgwqDCoMKgwqBzdHJ1Y3QgZHJtX2ZyYW1lYnVmZmVyICpkcm1fZmIgPSBzdGF0ZS0+
ZmI7Cj4+ICvCoMKgwqDCoMKgwqDCoHN0cnVjdCBkY19od19jdXJzb3IgY3Vyc29yOwo+PiArCj4+
ICvCoMKgwqDCoMKgwqDCoGN1cnNvci5hZGRyZXNzID0gcGxhbmVfc3RhdGUtPmRtYV9hZGRyWzBd
Owo+PiArwqDCoMKgwqDCoMKgwqBjdXJzb3IueCA9IHN0YXRlLT5jcnRjX3g7Cj4+ICvCoMKgwqDC
oMKgwqDCoGN1cnNvci55ID0gc3RhdGUtPmNydGNfeTsKPiAKPiBGcm9tIG15IGV4cGVyaW1lbnRz
IG9uIHBva2luZyB3aXRoIHJlZ2lzdGVycyBvbiBULUhlYWQgVEgxNTIwIChhbHNvCj4gdXNlcyBE
QzgyMDAgZGlzcGxheSBjb250cm9sbGVyIGFuZCBhIHNpbWlsYXIgZHJpdmVyKSwgdGhlIERDODIw
MAo+IGhhcmR3YXJlIGhhdmUgYSBkaWZmZXJlbnQgZGVmaW5pdGlvbiBvZiBjdXJzb3IgcG9zaXRp
b24gWCBhbmQgWSB3aXRoCj4gdGhlIENSVEMgcGxhbmUgc3RhdGUuCj4gCj4gRm9yIENSVEMgcGxh
bmUgc3RhdGUsIGhvdF94IGFuZCBob3RfeSBhcmUgb25seSBwcm92aWRlZCBhcyByZWZlcmVuY2Us
Cj4gYW5kIHRoZSBjdXJzb3Igc2hvdWxkIGJlIGRpc3BsYXllZCB3aXRoIGl0cyAoMCwwKSBkcmF3
biB0byAoY3J0Y194LAo+IGNydGNfeSkgKFtYWV1fY3J0YyBhcmUgdmFsdWVzIHNwZWNpZmllZCBp
biBDUlRDIHN0YXRlLCB0aGUgcmlnaHQgcGFydAo+IG9mIHRoZSBhc3NpZ25tZW50cyBoZXJlKSwg
d2hlbiB0aGUgY3Vyc29yIGlzIG1vdmVkIHRvICgwLDApIGJ1dCB0aGUgaG90Cj4gcG9pbnQgaXMg
bm90ICgwLDApLCBpdCBjb3VsZCBiZSBuZWdhdGl2ZS4KPiAKPiBIb3dldmVyLCBmb3IgREM4MjAw
IHJlZ2lzdGVycyBkZWZpbml0aW9uLCBjdXJzb3IgWFkgcG9zaXRpb24gY291bGQgbm90Cj4gYmUg
bmVnYXRpdmUgLS0gdGhlIGN1cnNvciB3aWxsIGRpc2FwcGVhciB0aGVuOyBiZWNhdXNlIGluIGl0
cwo+IGRlZmluaXRpb24sIHRoZSBjdXJzb3IgWFkgcG9zaXRpb24gc2hvdWxkIGJlIHdoZXJlIHRo
ZSBjdXJzb3IgaXMKPiBwb2ludGluZyB0bywgaW5zdGVhZCBvZiBpdHMgKDAsMCkuIERDODIwMCB3
aWxsIGRyYXcgKDAsMCkgb2YgdGhlIGN1cnNvcgo+IHRvICh4IC0gaG90X3gsIHkgLSBob3RfeSku
IFNvIHRvIG1ldCB0aGUgZXhwZWN0YXRpb24gb2YgdGhlIEtNUyBwbGFuZQo+IHNldHRpbmdzLCB0
aGUgREM4MjAwIHBvc2l0aW9uIHNob3VsZCBiZSBzZXQgdG8gKGNydGNfeCArIGhvdF94LCBjcnRj
X3kKPiArIGhvdF95KSBpbnN0ZWFkLiBUaHVzIHRoZXNlIHR3byBsaW5lcyBvZiBjb2RlIHNob3Vs
ZCBiZToKPiAKPiBgYGAKPiAgICAgICAgIGN1cnNvci54ID0gc3RhdGUtPmNydGNfeCArIGRybV9m
Yi0+aG90X3g7Cj4gICAgICAgICBjdXJzb3IueSA9IHN0YXRlLT5jcnRjX3kgKyBkcm1fZmItPmhv
dF95Owo+IGBgYAo+IAo+IAo+PiArwqDCoMKgwqDCoMKgwqBjdXJzb3IuaG90X3ggPSBkcm1fZmIt
PmhvdF94Owo+PiArwqDCoMKgwqDCoMKgwqBjdXJzb3IuaG90X3kgPSBkcm1fZmItPmhvdF95Owo+
PiArwqDCoMKgwqDCoMKgwqBjdXJzb3IuZGlzcGxheV9pZCA9IHRvX3ZzX2Rpc3BsYXlfaWQoZGMs
IHN0YXRlLT5jcnRjKTsKPj4gK8KgwqDCoMKgwqDCoMKgdXBkYXRlX2N1cnNvcl9zaXplKHN0YXRl
LCAmY3Vyc29yKTsKPj4gK8KgwqDCoMKgwqDCoMKgY3Vyc29yLmVuYWJsZSA9IHRydWU7Cj4+ICsK
Pj4gK8KgwqDCoMKgwqDCoMKgZGNfaHdfdXBkYXRlX2N1cnNvcigmZGMtPmh3LCBjdXJzb3IuZGlz
cGxheV9pZCwgJmN1cnNvcik7Cj4+ICt9Cj4gKnNuaXAKaGVsbG8gSWNlbm93eToKeW91IGFyZSBk
ZWVwIHVuZGVyc3RhbmRpbmcgb24gZGM4MjAwLgpieSB0aGUgd2F5IG9mIHByYWN0aWNlCkkgdGVz
dGVkIHRoaXMgY2hhbmdlIG9uIHRoZSBkZWJpYW4gZGVza3RvcCwgaXMgdGhlcmUgYSB3YXkgdG8g
Y29tcGFyZSB0aGUgY3Vyc29yIGJlaGF2aW9yIGNoYW5nZT8KVGhhbmtzCgoKCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5n
IGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFk
ZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
