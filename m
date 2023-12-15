Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1641FC4332F
	for <linux-riscv@archiver.kernel.org>; Fri, 15 Dec 2023 08:18:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:CC:To:From:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tObstRKFMkd75W0u9uwqzNVqKj30+o8HNw5OeWs7/bg=; b=Ebq+2a1zpIw0VX
	Pv+H9xwcPk6AYsDKSneaLH4uaXoZ3i3Zun56u6a1OYqW/oltLs9WOgxXVsGklLti44MVXHpzTjyR4
	Ohu4NpLn5hXH7kbHwdE7Na/5ejLViG/mWlJFS0femCIiXo0Jm/YrlXItV65G0jw2l4oVCCbzrBJox
	FBXBhGinCwecANExGJzp5m6l/EmOaCOZDqpyMWH7VM6kz/BaPVPZeurzTFN/BYGicdUYt8EslahIA
	4r4KeoITEz8NSJL7nbd8epF+44EuUbGXHWwzVMVkrnU7+OBj3ORPUTCjxBkJ4zvxeca1xhO1jQ0Ma
	GIX5OHw6US+pkvsGQ2ew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rE3Oj-002RGw-0k;
	Fri, 15 Dec 2023 08:18:17 +0000
Received: from fd01.gateway.ufhost.com ([61.152.239.71])
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rE3Of-002RER-0p
	for linux-riscv@lists.infradead.org;
	Fri, 15 Dec 2023 08:18:16 +0000
Received: from EXMBX165.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX165", Issuer "EXMBX165" (not verified))
	by fd01.gateway.ufhost.com (Postfix) with ESMTP id 569D17FE2;
	Fri, 15 Dec 2023 16:17:29 +0800 (CST)
Received: from EXMBX068.cuchost.com (172.16.6.68) by EXMBX165.cuchost.com
 (172.16.6.75) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Fri, 15 Dec
 2023 16:17:29 +0800
Received: from [192.168.120.47] (171.223.208.138) by EXMBX068.cuchost.com
 (172.16.6.68) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Fri, 15 Dec
 2023 16:17:28 +0800
Message-ID: <1c26fe9b-20f9-4b03-b263-ca030d20a5ce@starfivetech.com>
Date: Fri, 15 Dec 2023 16:17:27 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 2/4] pwm: opencores: Add PWM driver support
Content-Language: en-US
From: William Qiu <william.qiu@starfivetech.com>
To: Rob Herring <robh+dt@kernel.org>
CC: <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-riscv@lists.infradead.org>, <linux-pwm@vger.kernel.org>, "Emil Renner
 Berthing" <kernel@esmil.dk>, Thierry Reding <thierry.reding@gmail.com>,
	Philipp Zabel <p.zabel@pengutronix.de>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>,
	=?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>, Hal Feng
	<hal.feng@starfivetech.com>, Paul Walmsley <paul.walmsley@sifive.com>,
	"Palmer Dabbelt" <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>
References: <20231208094209.1910934-1-william.qiu@starfivetech.com>
 <20231208094209.1910934-3-william.qiu@starfivetech.com>
 <CAL_JsqK8fsAocOu3OBdz1kzNiApf1J0Uc0spn8gfdJaVnomFHQ@mail.gmail.com>
 <62bb91ad-5d4b-4ec6-80c8-6c3edf5d25cd@starfivetech.com>
In-Reply-To: <62bb91ad-5d4b-4ec6-80c8-6c3edf5d25cd@starfivetech.com>
X-Originating-IP: [171.223.208.138]
X-ClientProxiedBy: EXCAS066.cuchost.com (172.16.6.26) To EXMBX068.cuchost.com
 (172.16.6.68)
X-YovoleRuleAgent: yovoleflag
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231215_001813_577941_7E6DE89E 
X-CRM114-Status: GOOD (  14.62  )
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

CgpPbiAyMDIzLzEyLzEzIDE3OjI3LCBXaWxsaWFtIFFpdSB3cm90ZToKPiAKPiAKPiBPbiAyMDIz
LzEyLzEyIDE6NDEsIFJvYiBIZXJyaW5nIHdyb3RlOgo+PiBPbiBGcmksIERlYyA4LCAyMDIzIGF0
IDM6NDLigK9BTSBXaWxsaWFtIFFpdSA8d2lsbGlhbS5xaXVAc3RhcmZpdmV0ZWNoLmNvbT4gd3Jv
dGU6Cj4+Pgo+Pj4gQWRkIGRyaXZlciBmb3IgT3BlbkNvcmVzIFBXTSBDb250cm9sbGVyLiBBbmQg
YWRkIGNvbXBhdGliaWxpdHkgY29kZQo+Pj4gd2hpY2ggYmFzZWQgb24gU3RhckZpdmUgU29DLgo+
Pj4KPj4+IENvLWRldmVsb3BlZC1ieTogSGFsIEZlbmcgPGhhbC5mZW5nQHN0YXJmaXZldGVjaC5j
b20+Cj4+PiBTaWduZWQtb2ZmLWJ5OiBIYWwgRmVuZyA8aGFsLmZlbmdAc3RhcmZpdmV0ZWNoLmNv
bT4KPj4+IFNpZ25lZC1vZmYtYnk6IFdpbGxpYW0gUWl1IDx3aWxsaWFtLnFpdUBzdGFyZml2ZXRl
Y2guY29tPgo+Pj4gLS0tCj4+PiAgTUFJTlRBSU5FUlMgICAgICAgICAgICAgIHwgICA3ICsrCj4+
PiAgZHJpdmVycy9wd20vS2NvbmZpZyAgICAgIHwgIDEyICsrCj4+PiAgZHJpdmVycy9wd20vTWFr
ZWZpbGUgICAgIHwgICAxICsKPj4+ICBkcml2ZXJzL3B3bS9wd20tb2NvcmVzLmMgfCAyMjkgKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrCj4+PiAgNCBmaWxlcyBjaGFuZ2Vk
LCAyNDkgaW5zZXJ0aW9ucygrKQo+Pj4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBkcml2ZXJzL3B3bS9w
d20tb2NvcmVzLmMKPj4+Cj4+PiBkaWZmIC0tZ2l0IGEvTUFJTlRBSU5FUlMgYi9NQUlOVEFJTkVS
Uwo+Pj4gaW5kZXggNzg4YmU5YWI1YjczLi43YTExYTIyZGEwOWUgMTAwNjQ0Cj4+PiAtLS0gYS9N
QUlOVEFJTkVSUwo+Pj4gKysrIGIvTUFJTlRBSU5FUlMKPj4+IEBAIC0xNjIwNCw2ICsxNjIwNCwx
MyBAQCBGOiAgICAgRG9jdW1lbnRhdGlvbi9pMmMvYnVzc2VzL2kyYy1vY29yZXMucnN0Cj4+PiAg
RjogICAgIGRyaXZlcnMvaTJjL2J1c3Nlcy9pMmMtb2NvcmVzLmMKPj4+ICBGOiAgICAgaW5jbHVk
ZS9saW51eC9wbGF0Zm9ybV9kYXRhL2kyYy1vY29yZXMuaAo+Pj4KPj4+ICtPUEVOQ09SRVMgUFdN
IERSSVZFUgo+Pj4gK006ICAgICBXaWxsaWFtIFFpdSA8d2lsbGlhbS5xaXVAc3RhcmZpdmV0ZWNo
LmNvbT4KPj4+ICtNOiAgICAgSGFsIEZlbmcgPGhhbC5mZW5nQHN0YXJmaXZldGVjaC5jb20+Cj4+
PiArUzogICAgIFN1cHBvcnRlZAo+Pj4gK0Y6ICAgICBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUv
YmluZGluZ3MvcHdtL29wZW5jb3Jlcyxwd20ueWFtbAo+Pj4gK0Y6ICAgICBkcml2ZXJzL3B3bS9w
d20tb2NvcmVzLmMKPj4+ICsKPj4+ICBPUEVOUklTQyBBUkNISVRFQ1RVUkUKPj4+ICBNOiAgICAg
Sm9uYXMgQm9ubiA8am9uYXNAc291dGhwb2xlLnNlPgo+Pj4gIE06ICAgICBTdGVmYW4gS3Jpc3Rp
YW5zc29uIDxzdGVmYW4ua3Jpc3RpYW5zc29uQHNhdW5hbGFodGkuZmk+Cj4+PiBkaWZmIC0tZ2l0
IGEvZHJpdmVycy9wd20vS2NvbmZpZyBiL2RyaXZlcnMvcHdtL0tjb25maWcKPj4+IGluZGV4IDRi
OTU2ZDY2MTc1NS4uZDg3ZTFiYjM1MGJhIDEwMDY0NAo+Pj4gLS0tIGEvZHJpdmVycy9wd20vS2Nv
bmZpZwo+Pj4gKysrIGIvZHJpdmVycy9wd20vS2NvbmZpZwo+Pj4gQEAgLTQ0NCw2ICs0NDQsMTgg
QEAgY29uZmlnIFBXTV9OVFhFQwo+Pj4gICAgICAgICAgIGNvbnRyb2xsZXIgZm91bmQgaW4gY2Vy
dGFpbiBlLWJvb2sgcmVhZGVycyBkZXNpZ25lZCBieSB0aGUgb3JpZ2luYWwKPj4+ICAgICAgICAg
ICBkZXNpZ24gbWFudWZhY3R1cmVyIE5ldHJvbml4Lgo+Pj4KPj4+ICtjb25maWcgUFdNX09DT1JF
Uwo+Pj4gKyAgICAgICB0cmlzdGF0ZSAiT3BlbkNvcmVzIFBXTSBzdXBwb3J0Igo+Pj4gKyAgICAg
ICBkZXBlbmRzIG9uIEhBU19JT01FTSAmJiBPRgo+Pj4gKyAgICAgICBkZXBlbmRzIG9uIENPTU1P
Tl9DTEsgJiYgUkVTRVRfQ09OVFJPTExFUgo+Pj4gKyAgICAgICBkZXBlbmRzIG9uIEFSQ0hfU1RB
UkZJVkUgfHwgQ09NUElMRV9URVNUCj4+PiArICAgICAgIGhlbHAKPj4+ICsgICAgICAgICBJZiB5
b3Ugc2F5IHllcyB0byB0aGlzIG9wdGlvbiwgc3VwcG9ydCB3aWxsIGJlIGluY2x1ZGVkIGZvciB0
aGUKPj4+ICsgICAgICAgICBPcGVuQ29yZXMgUFdNLiBGb3IgZGV0YWlscyBzZWUgaHR0cHM6Ly9v
cGVuY29yZXMub3JnL3Byb2plY3RzL3B0Yy4KPj4+ICsKPj4+ICsgICAgICAgICBUbyBjb21waWxl
IHRoaXMgZHJpdmVyIGFzIGEgbW9kdWxlLCBjaG9vc2UgTSBoZXJlOiB0aGUgbW9kdWxlCj4+PiAr
ICAgICAgICAgd2lsbCBiZSBjYWxsZWQgcHdtLW9jb3Jlcy4KPj4+ICsKPj4+ICBjb25maWcgUFdN
X09NQVBfRE1USU1FUgo+Pj4gICAgICAgICB0cmlzdGF0ZSAiT01BUCBEdWFsLU1vZGUgVGltZXIg
UFdNIHN1cHBvcnQiCj4+PiAgICAgICAgIGRlcGVuZHMgb24gT0YKPj4+IGRpZmYgLS1naXQgYS9k
cml2ZXJzL3B3bS9NYWtlZmlsZSBiL2RyaXZlcnMvcHdtL01ha2VmaWxlCj4+PiBpbmRleCBjNWVj
OWUxNjhlZTcuLjUxN2M0ZjY0MzA1OCAxMDA2NDQKPj4+IC0tLSBhL2RyaXZlcnMvcHdtL01ha2Vm
aWxlCj4+PiArKysgYi9kcml2ZXJzL3B3bS9NYWtlZmlsZQo+Pj4gQEAgLTQwLDYgKzQwLDcgQEAg
b2JqLSQoQ09ORklHX1BXTV9NSUNST0NISVBfQ09SRSkgICAgICArPSBwd20tbWljcm9jaGlwLWNv
cmUubwo+Pj4gIG9iai0kKENPTkZJR19QV01fTVRLX0RJU1ApICAgICArPSBwd20tbXRrLWRpc3Au
bwo+Pj4gIG9iai0kKENPTkZJR19QV01fTVhTKSAgICAgICAgICArPSBwd20tbXhzLm8KPj4+ICBv
YmotJChDT05GSUdfUFdNX05UWEVDKSAgICAgICAgICAgICAgICArPSBwd20tbnR4ZWMubwo+Pj4g
K29iai0kKENPTkZJR19QV01fT0NPUkVTKSAgICAgICArPSBwd20tb2NvcmVzLm8KPj4+ICBvYmot
JChDT05GSUdfUFdNX09NQVBfRE1USU1FUikgKz0gcHdtLW9tYXAtZG10aW1lci5vCj4+PiAgb2Jq
LSQoQ09ORklHX1BXTV9QQ0E5Njg1KSAgICAgICs9IHB3bS1wY2E5Njg1Lm8KPj4+ICBvYmotJChD
T05GSUdfUFdNX1BYQSkgICAgICAgICAgKz0gcHdtLXB4YS5vCj4+PiBkaWZmIC0tZ2l0IGEvZHJp
dmVycy9wd20vcHdtLW9jb3Jlcy5jIGIvZHJpdmVycy9wd20vcHdtLW9jb3Jlcy5jCj4+PiBuZXcg
ZmlsZSBtb2RlIDEwMDY0NAo+Pj4gaW5kZXggMDAwMDAwMDAwMDAwLi45OTZjYTM4MDU5MDEKPj4+
IC0tLSAvZGV2L251bGwKPj4+ICsrKyBiL2RyaXZlcnMvcHdtL3B3bS1vY29yZXMuYwo+Pj4gQEAg
LTAsMCArMSwyMjkgQEAKPj4+ICsvLyBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogR1BMLTIuMAo+
Pj4gKy8qCj4+PiArICogT3BlbkNvcmVzIFBXTSBEcml2ZXIKPj4+ICsgKgo+Pj4gKyAqIGh0dHBz
Oi8vb3BlbmNvcmVzLm9yZy9wcm9qZWN0cy9wdGMKPj4+ICsgKgo+Pj4gKyAqIENvcHlyaWdodCAo
QykgMjAxOC0yMDIzIFN0YXJGaXZlIFRlY2hub2xvZ3kgQ28uLCBMdGQuCj4+PiArICoKPj4+ICsg
KiBMaW1pdGF0aW9uczoKPj4+ICsgKiAtIFRoZSBoYXJkd2FyZSBvbmx5IGRvIGludmVydGVkIHBv
bGFyaXR5Lgo+Pj4gKyAqIC0gVGhlIGhhcmR3YXJlIG1pbmltdW0gcGVyaW9kIC8gZHV0eV9jeWNs
ZSBpcyAoMSAvIHB3bV9hcGIgY2xvY2sgZnJlcXVlbmN5KSBucy4KPj4+ICsgKiAtIFRoZSBoYXJk
d2FyZSBtYXhpbXVtIHBlcmlvZCAvIGR1dHlfY3ljbGUgaXMgKFUzMl9NQVggLyBwd21fYXBiIGNs
b2NrIGZyZXF1ZW5jeSkgbnMuCj4+PiArICovCj4+PiArCj4+PiArI2luY2x1ZGUgPGxpbnV4L2Ns
ay5oPgo+Pj4gKyNpbmNsdWRlIDxsaW51eC9pby5oPgo+Pj4gKyNpbmNsdWRlIDxsaW51eC9tb2R1
bGUuaD4KPj4+ICsjaW5jbHVkZSA8bGludXgvb2YuaD4KPj4+ICsjaW5jbHVkZSA8bGludXgvb2Zf
ZGV2aWNlLmg+Cj4+IAo+PiBZb3UgcHJvYmFibHkgZG9uJ3QgbmVlZCB0aGlzIGhlYWRlciBhbmQg
dGhlIGltcGxpY2l0IGluY2x1ZGVzIGl0IG1ha2VzCj4+IGFyZSBkcm9wcGVkIG5vdyBpbiBsaW51
eC1uZXh0LiBQbGVhc2UgY2hlY2sgd2hhdCB5b3UgYWN0dWFsbHkgbmVlZCBhbmQKPj4gbWFrZSB0
aGVtIGV4cGxpY2l0Lgo+PiAKPj4gUm9iCj4gV2lsbCBkcm9wLgo+IAo+IFRoYW5rIHlvdSBmb3Ig
c3BlbmRpbmcgdGltZSBvbiB0aGlzIHBhdGNoc2V0Lgo+IAo+IEJlc3QgUmVnYXJkcwo+IFdpbGxp
YW0KSGkgUm9iLAoKQWZ0ZXIgY2hlY2tpbmcsIEkgbmVlZCB0byB1c2Ugb2ZfbWF0Y2hfZGV2aWNl
KCkgaW4gb2ZfZGV2aWNlLmgsIHNvIHRoaXMKaW50ZXJmYWNlIHdpbGwgYmUgbW92ZWQgdG8gd2hp
Y2ggaGVhZGVyIGluIGxpbnV4LW5leHQ/CgpUaGFua3MsCldpbGxpYW0KCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlz
dApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQu
b3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
