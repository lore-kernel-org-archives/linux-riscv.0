Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5B3DC4332F
	for <linux-riscv@archiver.kernel.org>; Wed, 13 Dec 2023 09:27:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Uovtfn0Pu1JTTaM4/8adt/flQmMYcvcJsmPKord06a4=; b=P7tb+LQLTaZOfW
	4rcTm5GsS+4uuWFLdnkoKxSxFahPAa+CEohcEb27FJuzWZ/qcFl8IqNbPAV+jVaqXEgB6gqV+0LLB
	RAvAcqtp3HJrKIak8b2PYFRAupmIPp1Pq1Qdkt3WrSHjoWiNslgHr4pfm5lv3v+VJgSPJcn+eLx6r
	1qo6qPOR2abW2F63SmuwWJzzINJCwpOlnl/2cJ0wm4axTSq9vyO3niuBhdDfST/yWbr+bwUazN/sa
	NrI3kyWplFmv5fSMsFrXnkxt5xOS4Ki5BQIkmJIjSRgK7MRXmtTDepu1PTOVRktDsadcgq28C5lcJ
	PiYt+Jyomxr1g0sqPIlw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rDLWs-00E8km-2D;
	Wed, 13 Dec 2023 09:27:46 +0000
Received: from ex01.ufhost.com ([61.152.239.75])
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rDLWp-00E8jl-0M
	for linux-riscv@lists.infradead.org;
	Wed, 13 Dec 2023 09:27:45 +0000
Received: from EXMBX166.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX166", Issuer "EXMBX166" (not verified))
	by ex01.ufhost.com (Postfix) with ESMTP id CE8A924E2A1;
	Wed, 13 Dec 2023 17:27:29 +0800 (CST)
Received: from EXMBX068.cuchost.com (172.16.6.68) by EXMBX166.cuchost.com
 (172.16.6.76) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Wed, 13 Dec
 2023 17:27:29 +0800
Received: from [192.168.120.47] (171.223.208.138) by EXMBX068.cuchost.com
 (172.16.6.68) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Wed, 13 Dec
 2023 17:27:28 +0800
Message-ID: <62bb91ad-5d4b-4ec6-80c8-6c3edf5d25cd@starfivetech.com>
Date: Wed, 13 Dec 2023 17:27:26 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 2/4] pwm: opencores: Add PWM driver support
Content-Language: en-US
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
From: William Qiu <william.qiu@starfivetech.com>
In-Reply-To: <CAL_JsqK8fsAocOu3OBdz1kzNiApf1J0Uc0spn8gfdJaVnomFHQ@mail.gmail.com>
X-Originating-IP: [171.223.208.138]
X-ClientProxiedBy: EXCAS066.cuchost.com (172.16.6.26) To EXMBX068.cuchost.com
 (172.16.6.68)
X-YovoleRuleAgent: yovoleflag
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231213_012743_416243_11A38042 
X-CRM114-Status: GOOD (  15.98  )
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

CgpPbiAyMDIzLzEyLzEyIDE6NDEsIFJvYiBIZXJyaW5nIHdyb3RlOgo+IE9uIEZyaSwgRGVjIDgs
IDIwMjMgYXQgMzo0MuKAr0FNIFdpbGxpYW0gUWl1IDx3aWxsaWFtLnFpdUBzdGFyZml2ZXRlY2gu
Y29tPiB3cm90ZToKPj4KPj4gQWRkIGRyaXZlciBmb3IgT3BlbkNvcmVzIFBXTSBDb250cm9sbGVy
LiBBbmQgYWRkIGNvbXBhdGliaWxpdHkgY29kZQo+PiB3aGljaCBiYXNlZCBvbiBTdGFyRml2ZSBT
b0MuCj4+Cj4+IENvLWRldmVsb3BlZC1ieTogSGFsIEZlbmcgPGhhbC5mZW5nQHN0YXJmaXZldGVj
aC5jb20+Cj4+IFNpZ25lZC1vZmYtYnk6IEhhbCBGZW5nIDxoYWwuZmVuZ0BzdGFyZml2ZXRlY2gu
Y29tPgo+PiBTaWduZWQtb2ZmLWJ5OiBXaWxsaWFtIFFpdSA8d2lsbGlhbS5xaXVAc3RhcmZpdmV0
ZWNoLmNvbT4KPj4gLS0tCj4+ICBNQUlOVEFJTkVSUyAgICAgICAgICAgICAgfCAgIDcgKysKPj4g
IGRyaXZlcnMvcHdtL0tjb25maWcgICAgICB8ICAxMiArKwo+PiAgZHJpdmVycy9wd20vTWFrZWZp
bGUgICAgIHwgICAxICsKPj4gIGRyaXZlcnMvcHdtL3B3bS1vY29yZXMuYyB8IDIyOSArKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysKPj4gIDQgZmlsZXMgY2hhbmdlZCwgMjQ5
IGluc2VydGlvbnMoKykKPj4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBkcml2ZXJzL3B3bS9wd20tb2Nv
cmVzLmMKPj4KPj4gZGlmZiAtLWdpdCBhL01BSU5UQUlORVJTIGIvTUFJTlRBSU5FUlMKPj4gaW5k
ZXggNzg4YmU5YWI1YjczLi43YTExYTIyZGEwOWUgMTAwNjQ0Cj4+IC0tLSBhL01BSU5UQUlORVJT
Cj4+ICsrKyBiL01BSU5UQUlORVJTCj4+IEBAIC0xNjIwNCw2ICsxNjIwNCwxMyBAQCBGOiAgICAg
RG9jdW1lbnRhdGlvbi9pMmMvYnVzc2VzL2kyYy1vY29yZXMucnN0Cj4+ICBGOiAgICAgZHJpdmVy
cy9pMmMvYnVzc2VzL2kyYy1vY29yZXMuYwo+PiAgRjogICAgIGluY2x1ZGUvbGludXgvcGxhdGZv
cm1fZGF0YS9pMmMtb2NvcmVzLmgKPj4KPj4gK09QRU5DT1JFUyBQV00gRFJJVkVSCj4+ICtNOiAg
ICAgV2lsbGlhbSBRaXUgPHdpbGxpYW0ucWl1QHN0YXJmaXZldGVjaC5jb20+Cj4+ICtNOiAgICAg
SGFsIEZlbmcgPGhhbC5mZW5nQHN0YXJmaXZldGVjaC5jb20+Cj4+ICtTOiAgICAgU3VwcG9ydGVk
Cj4+ICtGOiAgICAgRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3B3bS9vcGVuY29y
ZXMscHdtLnlhbWwKPj4gK0Y6ICAgICBkcml2ZXJzL3B3bS9wd20tb2NvcmVzLmMKPj4gKwo+PiAg
T1BFTlJJU0MgQVJDSElURUNUVVJFCj4+ICBNOiAgICAgSm9uYXMgQm9ubiA8am9uYXNAc291dGhw
b2xlLnNlPgo+PiAgTTogICAgIFN0ZWZhbiBLcmlzdGlhbnNzb24gPHN0ZWZhbi5rcmlzdGlhbnNz
b25Ac2F1bmFsYWh0aS5maT4KPj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvcHdtL0tjb25maWcgYi9k
cml2ZXJzL3B3bS9LY29uZmlnCj4+IGluZGV4IDRiOTU2ZDY2MTc1NS4uZDg3ZTFiYjM1MGJhIDEw
MDY0NAo+PiAtLS0gYS9kcml2ZXJzL3B3bS9LY29uZmlnCj4+ICsrKyBiL2RyaXZlcnMvcHdtL0tj
b25maWcKPj4gQEAgLTQ0NCw2ICs0NDQsMTggQEAgY29uZmlnIFBXTV9OVFhFQwo+PiAgICAgICAg
ICAgY29udHJvbGxlciBmb3VuZCBpbiBjZXJ0YWluIGUtYm9vayByZWFkZXJzIGRlc2lnbmVkIGJ5
IHRoZSBvcmlnaW5hbAo+PiAgICAgICAgICAgZGVzaWduIG1hbnVmYWN0dXJlciBOZXRyb25peC4K
Pj4KPj4gK2NvbmZpZyBQV01fT0NPUkVTCj4+ICsgICAgICAgdHJpc3RhdGUgIk9wZW5Db3JlcyBQ
V00gc3VwcG9ydCIKPj4gKyAgICAgICBkZXBlbmRzIG9uIEhBU19JT01FTSAmJiBPRgo+PiArICAg
ICAgIGRlcGVuZHMgb24gQ09NTU9OX0NMSyAmJiBSRVNFVF9DT05UUk9MTEVSCj4+ICsgICAgICAg
ZGVwZW5kcyBvbiBBUkNIX1NUQVJGSVZFIHx8IENPTVBJTEVfVEVTVAo+PiArICAgICAgIGhlbHAK
Pj4gKyAgICAgICAgIElmIHlvdSBzYXkgeWVzIHRvIHRoaXMgb3B0aW9uLCBzdXBwb3J0IHdpbGwg
YmUgaW5jbHVkZWQgZm9yIHRoZQo+PiArICAgICAgICAgT3BlbkNvcmVzIFBXTS4gRm9yIGRldGFp
bHMgc2VlIGh0dHBzOi8vb3BlbmNvcmVzLm9yZy9wcm9qZWN0cy9wdGMuCj4+ICsKPj4gKyAgICAg
ICAgIFRvIGNvbXBpbGUgdGhpcyBkcml2ZXIgYXMgYSBtb2R1bGUsIGNob29zZSBNIGhlcmU6IHRo
ZSBtb2R1bGUKPj4gKyAgICAgICAgIHdpbGwgYmUgY2FsbGVkIHB3bS1vY29yZXMuCj4+ICsKPj4g
IGNvbmZpZyBQV01fT01BUF9ETVRJTUVSCj4+ICAgICAgICAgdHJpc3RhdGUgIk9NQVAgRHVhbC1N
b2RlIFRpbWVyIFBXTSBzdXBwb3J0Igo+PiAgICAgICAgIGRlcGVuZHMgb24gT0YKPj4gZGlmZiAt
LWdpdCBhL2RyaXZlcnMvcHdtL01ha2VmaWxlIGIvZHJpdmVycy9wd20vTWFrZWZpbGUKPj4gaW5k
ZXggYzVlYzllMTY4ZWU3Li41MTdjNGY2NDMwNTggMTAwNjQ0Cj4+IC0tLSBhL2RyaXZlcnMvcHdt
L01ha2VmaWxlCj4+ICsrKyBiL2RyaXZlcnMvcHdtL01ha2VmaWxlCj4+IEBAIC00MCw2ICs0MCw3
IEBAIG9iai0kKENPTkZJR19QV01fTUlDUk9DSElQX0NPUkUpICAgICAgKz0gcHdtLW1pY3JvY2hp
cC1jb3JlLm8KPj4gIG9iai0kKENPTkZJR19QV01fTVRLX0RJU1ApICAgICArPSBwd20tbXRrLWRp
c3Aubwo+PiAgb2JqLSQoQ09ORklHX1BXTV9NWFMpICAgICAgICAgICs9IHB3bS1teHMubwo+PiAg
b2JqLSQoQ09ORklHX1BXTV9OVFhFQykgICAgICAgICAgICAgICAgKz0gcHdtLW50eGVjLm8KPj4g
K29iai0kKENPTkZJR19QV01fT0NPUkVTKSAgICAgICArPSBwd20tb2NvcmVzLm8KPj4gIG9iai0k
KENPTkZJR19QV01fT01BUF9ETVRJTUVSKSArPSBwd20tb21hcC1kbXRpbWVyLm8KPj4gIG9iai0k
KENPTkZJR19QV01fUENBOTY4NSkgICAgICArPSBwd20tcGNhOTY4NS5vCj4+ICBvYmotJChDT05G
SUdfUFdNX1BYQSkgICAgICAgICAgKz0gcHdtLXB4YS5vCj4+IGRpZmYgLS1naXQgYS9kcml2ZXJz
L3B3bS9wd20tb2NvcmVzLmMgYi9kcml2ZXJzL3B3bS9wd20tb2NvcmVzLmMKPj4gbmV3IGZpbGUg
bW9kZSAxMDA2NDQKPj4gaW5kZXggMDAwMDAwMDAwMDAwLi45OTZjYTM4MDU5MDEKPj4gLS0tIC9k
ZXYvbnVsbAo+PiArKysgYi9kcml2ZXJzL3B3bS9wd20tb2NvcmVzLmMKPj4gQEAgLTAsMCArMSwy
MjkgQEAKPj4gKy8vIFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiBHUEwtMi4wCj4+ICsvKgo+PiAr
ICogT3BlbkNvcmVzIFBXTSBEcml2ZXIKPj4gKyAqCj4+ICsgKiBodHRwczovL29wZW5jb3Jlcy5v
cmcvcHJvamVjdHMvcHRjCj4+ICsgKgo+PiArICogQ29weXJpZ2h0IChDKSAyMDE4LTIwMjMgU3Rh
ckZpdmUgVGVjaG5vbG9neSBDby4sIEx0ZC4KPj4gKyAqCj4+ICsgKiBMaW1pdGF0aW9uczoKPj4g
KyAqIC0gVGhlIGhhcmR3YXJlIG9ubHkgZG8gaW52ZXJ0ZWQgcG9sYXJpdHkuCj4+ICsgKiAtIFRo
ZSBoYXJkd2FyZSBtaW5pbXVtIHBlcmlvZCAvIGR1dHlfY3ljbGUgaXMgKDEgLyBwd21fYXBiIGNs
b2NrIGZyZXF1ZW5jeSkgbnMuCj4+ICsgKiAtIFRoZSBoYXJkd2FyZSBtYXhpbXVtIHBlcmlvZCAv
IGR1dHlfY3ljbGUgaXMgKFUzMl9NQVggLyBwd21fYXBiIGNsb2NrIGZyZXF1ZW5jeSkgbnMuCj4+
ICsgKi8KPj4gKwo+PiArI2luY2x1ZGUgPGxpbnV4L2Nsay5oPgo+PiArI2luY2x1ZGUgPGxpbnV4
L2lvLmg+Cj4+ICsjaW5jbHVkZSA8bGludXgvbW9kdWxlLmg+Cj4+ICsjaW5jbHVkZSA8bGludXgv
b2YuaD4KPj4gKyNpbmNsdWRlIDxsaW51eC9vZl9kZXZpY2UuaD4KPiAKPiBZb3UgcHJvYmFibHkg
ZG9uJ3QgbmVlZCB0aGlzIGhlYWRlciBhbmQgdGhlIGltcGxpY2l0IGluY2x1ZGVzIGl0IG1ha2Vz
Cj4gYXJlIGRyb3BwZWQgbm93IGluIGxpbnV4LW5leHQuIFBsZWFzZSBjaGVjayB3aGF0IHlvdSBh
Y3R1YWxseSBuZWVkIGFuZAo+IG1ha2UgdGhlbSBleHBsaWNpdC4KPiAKPiBSb2IKV2lsbCBkcm9w
LgoKVGhhbmsgeW91IGZvciBzcGVuZGluZyB0aW1lIG9uIHRoaXMgcGF0Y2hzZXQuCgpCZXN0IFJl
Z2FyZHMKV2lsbGlhbQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVh
ZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1y
aXNjdgo=
