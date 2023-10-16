Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C736CDB465
	for <linux-riscv@archiver.kernel.org>; Mon, 16 Oct 2023 07:17:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fzfqj51YOO+L42601WxDKgrFIqE94UrkMJ/q6kcHam0=; b=Va0xfpiuHy+G2S
	FWEM6O1/1OTvRKuJzgTVeLIcxQnKDQQzNgtDngUQ379G0TNuKVS5gL5JsTjbUTc0XR+Ths/AoCVpa
	T/ObnERONUz18GfOaLggjBV9uXwzUEo5fPMRiqqnZp5sIJ9fFaovNRhGi1+od9bvZI60SUEC5L3mX
	sCNiHQBXiSVzOCWITRzMaGAAs0WgTmbY4R0z+nX/ZhpxggY+kcZn89mfTRi+iqWVOLvBH7uITzcJG
	uoB0USiHUIk3Hx5EoKTHI0CbCFAjJYcNeclqwLjKzvk/cpjTh09lJ1wE9PzghokHf5IDXW/kPC08Y
	mkXnayZi0LaHEo77x56g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qsHqi-008cUW-0O;
	Mon, 16 Oct 2023 07:17:12 +0000
Received: from fd01.gateway.ufhost.com ([61.152.239.71])
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qsHqd-008cSN-2N
	for linux-riscv@lists.infradead.org;
	Mon, 16 Oct 2023 07:17:10 +0000
Received: from EXMBX166.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX166", Issuer "EXMBX166" (not verified))
	by fd01.gateway.ufhost.com (Postfix) with ESMTP id E5B8880B2;
	Mon, 16 Oct 2023 15:16:22 +0800 (CST)
Received: from EXMBX061.cuchost.com (172.16.6.61) by EXMBX166.cuchost.com
 (172.16.6.76) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Mon, 16 Oct
 2023 15:16:23 +0800
Received: from [192.168.125.131] (183.27.98.194) by EXMBX061.cuchost.com
 (172.16.6.61) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Mon, 16 Oct
 2023 15:16:21 +0800
Message-ID: <51cd7454-566f-4319-835d-ec0401f562df@starfivetech.com>
Date: Mon, 16 Oct 2023 15:10:15 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 2/3] clocksource: Add JH7110 timer driver
To: Emil Renner Berthing <emil.renner.berthing@canonical.com>, "Christophe
 JAILLET" <christophe.jaillet@wanadoo.fr>
CC: <aou@eecs.berkeley.edu>, <conor@kernel.org>, <daniel.lezcano@linaro.org>,
	<devicetree@vger.kernel.org>, <krzysztof.kozlowski+dt@linaro.org>,
	<linux-kernel@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
	<p.zabel@pengutronix.de>, <palmer@dabbelt.com>, <paul.walmsley@sifive.com>,
	<robh+dt@kernel.org>, <samin.guo@starfivetech.com>, <tglx@linutronix.de>,
	<walker.chen@starfivetech.com>
References: <20231012081015.33121-1-xingyu.wu@starfivetech.com>
 <20231012081015.33121-3-xingyu.wu@starfivetech.com>
 <338544e7-0be8-47c1-a7d7-89990da305d3@wanadoo.fr>
 <926ee8c7-fab9-49d5-831e-48c886c4bc44@starfivetech.com>
 <CAJM55Z-hsebX9e3+MNc0GcXO=ao7OB=EYWXp865VQg3L3gyPJw@mail.gmail.com>
Content-Language: en-US
From: Xingyu Wu <xingyu.wu@starfivetech.com>
In-Reply-To: <CAJM55Z-hsebX9e3+MNc0GcXO=ao7OB=EYWXp865VQg3L3gyPJw@mail.gmail.com>
X-Originating-IP: [183.27.98.194]
X-ClientProxiedBy: EXCAS066.cuchost.com (172.16.6.26) To EXMBX061.cuchost.com
 (172.16.6.61)
X-YovoleRuleAgent: yovoleflag
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231016_001708_272169_EED88998 
X-CRM114-Status: GOOD (  20.40  )
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

T24gMjAyMy8xMC8xMyAxOToxNiwgRW1pbCBSZW5uZXIgQmVydGhpbmcgd3JvdGU6Cj4gWGluZ3l1
IFd1IHdyb3RlOgo+PiBPbiAyMDIzLzEwLzEzIDE6NTMsIENocmlzdG9waGUgSkFJTExFVCB3cm90
ZToKPj4gPiBMZSAxMi8xMC8yMDIzIMOgIDEwOjEwLCBYaW5neXUgV3UgYSDDqWNyaXTCoDoKPj4g
Pj4gQWRkIHRpbWVyIGRyaXZlciBmb3IgdGhlIFN0YXJGaXZlIEpINzExMCBTb0MuCj4+ID4+Cj4+
ID4+IFNpZ25lZC1vZmYtYnk6IFhpbmd5dSBXdSA8eGluZ3l1Lnd1LWJPTnJNNDVLV0ZPWG1NWGpK
QnBXcWdAcHVibGljLmdtYW5lLm9yZz4KPj4gPgo+PiA+IC4uLgo+Pgo+PiBJdCBsb29rcyBub3Jt
YWwgaW4gbXkgZW1haWwgYW5kIHRoZSB3ZWIuIElzIHRoaXMgZHVlIHRvIHNvbWUgc2V0dGluZ3M/
Cj4+Cj4+ID4KPj4gPj4gK3N0YXRpYyBpbnQgamg3MTEwX3RpbWVyX3Byb2JlKHN0cnVjdCBwbGF0
Zm9ybV9kZXZpY2UgKnBkZXYpCj4+ID4+ICt7Cj4+ID4+ICvCoMKgwqAgc3RydWN0IGpoNzExMF9j
bGtldnQgKmNsa2V2dFtKSDcxMTBfVElNRVJfQ0hfTUFYXTsKPj4gPj4gK8KgwqDCoCBjaGFyIG5h
bWVbNF07Cj4+ID4+ICvCoMKgwqAgc3RydWN0IGNsayAqcGNsazsKPj4gPj4gK8KgwqDCoCBzdHJ1
Y3QgcmVzZXRfY29udHJvbCAqcnN0Owo+PiA+PiArwqDCoMKgIGludCBjaDsKPj4gPj4gK8KgwqDC
oCBpbnQgcmV0Owo+PiA+PiArwqDCoMKgIHZvaWQgX19pb21lbSAqYmFzZTsKPj4gPj4gKwo+PiA+
PiArwqDCoMKgIGJhc2UgPSBkZXZtX3BsYXRmb3JtX2lvcmVtYXBfcmVzb3VyY2UocGRldiwgMCk7
Cj4+ID4+ICvCoMKgwqAgaWYgKElTX0VSUihiYXNlKSkKPj4gPj4gK8KgwqDCoMKgwqDCoMKgIHJl
dHVybiBkZXZfZXJyX3Byb2JlKCZwZGV2LT5kZXYsIFBUUl9FUlIoYmFzZSksCj4+ID4+ICvCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgICJmYWlsZWQgdG8gbWFwIHJlZ2lz
dGVyc1xuIik7Cj4+ID4+ICsKPj4gPj4gK8KgwqDCoCByc3QgPSBkZXZtX3Jlc2V0X2NvbnRyb2xf
Z2V0X2V4Y2x1c2l2ZSgmcGRldi0+ZGV2LCAiYXBiIik7Cj4+ID4+ICvCoMKgwqAgaWYgKElTX0VS
Uihyc3QpKQo+PiA+PiArwqDCoMKgwqDCoMKgwqAgcmV0dXJuIGRldl9lcnJfcHJvYmUoJnBkZXYt
PmRldiwgUFRSX0VSUihyc3QpLCAiZmFpbGVkIHRvIGdldCBhcGIgcmVzZXRcbiIpOwo+PiA+PiAr
Cj4+ID4+ICvCoMKgwqAgcGNsayA9IGRldm1fY2xrX2dldF9lbmFibGVkKCZwZGV2LT5kZXYsICJh
cGIiKTsKPj4gPj4gK8KgwqDCoCBpZiAoSVNfRVJSKHBjbGspKQo+PiA+PiArwqDCoMKgwqDCoMKg
wqAgcmV0dXJuIGRldl9lcnJfcHJvYmUoJnBkZXYtPmRldiwgUFRSX0VSUihwY2xrKSwKPj4gPj4g
K8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgImZhaWxlZCB0byBnZXQg
JiBlbmFibGUgYXBiIGNsb2NrXG4iKTsKPj4gPj4gKwo+PiA+PiArwqDCoMKgIHJldCA9IHJlc2V0
X2NvbnRyb2xfZGVhc3NlcnQocnN0KTsKPj4gPj4gK8KgwqDCoCBpZiAocmV0KQo+PiA+PiArwqDC
oMKgwqDCoMKgwqAgcmV0dXJuIGRldl9lcnJfcHJvYmUoJnBkZXYtPmRldiwgcmV0LCAiZmFpbGVk
IHRvIGRlYXNzZXJ0IGFwYiByZXNldFxuIik7Cj4+ID4KPj4gPiBIaSwKPj4gPgo+PiA+IEknbSBu
b3QgdmVyeSBmYW1pbGlhciB3aXRoIHRoZSByZXNldF9jb250cm9sX1tkZV1hc3NlcnQoKSBmdW5j
dGlvbnMsIGJ1dCBzaG91bGRuJ3QgdGhpcyBiZSB1bmRvbmUgYnkgYSByZXNldF9jb250cm9sX2Fz
c2VydCgpIGNhbGwgaWYgYW4gZXJyb3Igb2NjdXJzIGxhdGVyPwo+Pgo+PiBJbiB0aGlzIGNhc2Us
IHRoZSByZXNldCBjb250cm9sbGVyIGlzIHNldCBmcm9tICdhc3NlcnQnIHN0YXRlIHRvICdkZWFz
c2VydCcgc3RhdGUuIElmIGl0IGlzIGZhaWxlZCBhbmQgc3RpbGwgJ2Fzc2VydCcgc3RhdGUsIEkg
ZG9uJ3QgdGhpbmsgaXQgbmVlZCB0byBjYWxsIHJlc2V0X2NvbnRyb2xfYXNzZXJ0KCkuCj4gCj4g
VGhlIHByb2JsZW0gaXMgaWYgdGhlIGFzc2VydCBzdWNjZWVkcywgYnV0IHRoZSBwcm9iZSBmdW5j
dGlvbiBmYWlscyBsYXRlci4gVGhlbgo+IHRoZXJlIGlzIG5vdGhpbmcgdG8gdW5kbyB0aGUgZGVh
c3NlcnQuIEEgY29tbW9uIHBhdHRlcm4gSSBzZWUgaXMgc29tZXRoaW5nIGxpa2UKPiB0aGlzOgo+
IAo+IHN0YXRpYyB2b2lkIGpoNzExMF90aW1lcl9yZXNldF9jb250cm9sX2Fzc2VydCh2b2lkICpk
YXRhKQo+IHsKPiAJcmVzZXRfY29udHJvbF9hc3NlcnQoZGF0YSk7Cj4gfQo+IAo+IC4uLgo+IAo+
IAlyZXQgPSByZXNldF9jb250cm9sX2RlYXNzZXJ0KHJzdCk7Cj4gCWlmIChyZXQpCj4gCQlyZXR1
cm4gZGV2X2Vycl9wcm9iZSguLi4pOwo+IAo+IAlyZXQgPSBkZXZtX2FkZF9hY3Rpb25fb3JfcmVz
ZXQoJnBkZXYtPmRldiwKPiBqaDcxMTBfdGltZXJfcmVzZXRfY29udHJvbF9hc3NlcnQsIHJzdCk7
Cj4gCWlmIChyZXQpCj4gCQlyZXR1cm4gcmV0Owo+IAo+IC9FbWlsCgpJdCBpcyBhIGdvb2QgaWRl
YSEgTGV0IG1lIHRyeSBpdC4KClRoYW5rcywKWGluZ3l1IFd1Cgo+IAo+PiA+Cj4+ID4+ICsKPj4g
Pj4gK8KgwqDCoCBmb3IgKGNoID0gMDsgY2ggPCBKSDcxMTBfVElNRVJfQ0hfTUFYOyBjaCsrKSB7
Cj4+ID4+ICvCoMKgwqDCoMKgwqDCoCBjbGtldnRbY2hdID0gZGV2bV9remFsbG9jKCZwZGV2LT5k
ZXYsIHNpemVvZigqY2xrZXZ0W2NoXSksIEdGUF9LRVJORUwpOwo+PiA+PiArwqDCoMKgwqDCoMKg
wqAgaWYgKCFjbGtldnRbY2hdKQo+PiA+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCByZXR1cm4g
LUVOT01FTTsKPj4gPj4gKwo+PiA+PiArwqDCoMKgwqDCoMKgwqAgc25wcmludGYobmFtZSwgc2l6
ZW9mKG5hbWUpLCAiY2glZCIsIGNoKTsKPj4gPj4gKwo+PiA+PiArwqDCoMKgwqDCoMKgwqAgY2xr
ZXZ0W2NoXS0+YmFzZSA9IGJhc2UgKyBKSDcxMTBfVElNRVJfQ0hfQkFTRShjaCk7Cj4+ID4+ICvC
oMKgwqDCoMKgwqDCoCAvKiBFbnN1cmUgdGltZXIgaXMgZGlzYWJsZWQgKi8KPj4gPj4gK8KgwqDC
oMKgwqDCoMKgIGpoNzExMF90aW1lcl9kaXNhYmxlKGNsa2V2dFtjaF0pOwo+PiA+PiArCj4+ID4+
ICvCoMKgwqDCoMKgwqDCoCByc3QgPSBkZXZtX3Jlc2V0X2NvbnRyb2xfZ2V0X2V4Y2x1c2l2ZSgm
cGRldi0+ZGV2LCBuYW1lKTsKPj4gPj4gK8KgwqDCoMKgwqDCoMKgIGlmIChJU19FUlIocnN0KSkK
Pj4gPj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgcmV0dXJuIFBUUl9FUlIocnN0KTsKPj4gPj4g
Kwo+PiA+PiArwqDCoMKgwqDCoMKgwqAgY2xrZXZ0W2NoXS0+Y2xrID0gZGV2bV9jbGtfZ2V0X2Vu
YWJsZWQoJnBkZXYtPmRldiwgbmFtZSk7Cj4+ID4+ICvCoMKgwqDCoMKgwqDCoCBpZiAoSVNfRVJS
KGNsa2V2dFtjaF0tPmNsaykpCj4+ID4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHJldHVybiBQ
VFJfRVJSKGNsa2V2dFtjaF0tPmNsayk7Cj4+ID4+ICsKPj4gPj4gK8KgwqDCoMKgwqDCoMKgIHJl
dCA9IHJlc2V0X2NvbnRyb2xfZGVhc3NlcnQocnN0KTsKPj4gPj4gK8KgwqDCoMKgwqDCoMKgIGlm
IChyZXQpCj4+ID4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHJldHVybiByZXQ7Cj4+ID4KPj4g
PiBTYW1lIGhlcmUuCj4+ID4KPj4gPj4gKwo+PiA+PiArwqDCoMKgwqDCoMKgwqAgY2xrZXZ0W2No
XS0+ZXZ0LmlycSA9IHBsYXRmb3JtX2dldF9pcnEocGRldiwgY2gpOwo+PiA+PiArwqDCoMKgwqDC
oMKgwqAgaWYgKGNsa2V2dFtjaF0tPmV2dC5pcnEgPCAwKQo+PiA+PiArwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoCByZXR1cm4gY2xrZXZ0W2NoXS0+ZXZ0LmlycTsKPj4gPj4gKwo+PiA+PiArwqDCoMKg
wqDCoMKgwqAgc25wcmludGYoY2xrZXZ0W2NoXS0+bmFtZSwgc2l6ZW9mKGNsa2V2dFtjaF0tPm5h
bWUpLCAiJXMuY2glZCIsIHBkZXYtPm5hbWUsIGNoKTsKPj4gPj4gK8KgwqDCoMKgwqDCoMKgIGpo
NzExMF9jbG9ja2V2ZW50c19yZWdpc3RlcihjbGtldnRbY2hdKTsKPj4gPj4gKwo+PiA+PiArwqDC
oMKgwqDCoMKgwqAgcmV0ID0gZGV2bV9yZXF1ZXN0X2lycSgmcGRldi0+ZGV2LCBjbGtldnRbY2hd
LT5ldnQuaXJxLCBqaDcxMTBfdGltZXJfaW50ZXJydXB0LAo+PiA+PiArwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgSVJRRl9USU1FUiB8IElSUUZfSVJRUE9MTCwK
Pj4gPj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGNsa2V2
dFtjaF0tPm5hbWUsICZjbGtldnRbY2hdLT5ldnQpOwo+PiA+PiArwqDCoMKgwqDCoMKgwqAgaWYg
KHJldCkKPj4gPj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgcmV0dXJuIHJldDsKPj4gPj4gKwo+
PiA+PiArwqDCoMKgwqDCoMKgwqAgcmV0ID0gamg3MTEwX2Nsb2Nrc291cmNlX2luaXQoY2xrZXZ0
W2NoXSk7Cj4+ID4KPj4gPiBEb2VzIHNvbWV0aGluZyBzaG91bGQgYmUgZG9uZSBpZiB0aGlzIGZh
aWxzPwo+PiA+Cj4+ID4gQ0oKPj4KPj4gWWVzLCBpdCBzaG91bGQgYmUgY2FsbCByZXNldF9jb250
cm9sX2Fzc2VydCgpIGhlcmUgYW5kIEkgd2lsbCBhZGQgaXQgaW4gbmV4dCB2ZXJzaW9uLgo+Pgo+
PiA+Cj4+ID4+ICvCoMKgwqDCoMKgwqDCoCBpZiAocmV0KQo+PiA+PiArwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoCByZXR1cm4gcmV0Owo+PiA+PiArwqDCoMKgIH0KPj4gPj4gKwo+PiA+PiArwqDCoMKg
IHJldHVybiAwOwo+PiA+PiArfQo+PiA+PiArCj4+ID4+ICtzdGF0aWMgY29uc3Qgc3RydWN0IG9m
X2RldmljZV9pZCBqaDcxMTBfdGltZXJfbWF0Y2hbXSA9IHsKPj4gPj4gK8KgwqDCoCB7IC5jb21w
YXRpYmxlID0gInN0YXJmaXZlLGpoNzExMC10aW1lciIsIH0sCj4+ID4+ICvCoMKgwqAgeyAvKiBz
ZW50aW5lbCAqLyB9Cj4+ID4+ICt9Owo+PiA+PiArTU9EVUxFX0RFVklDRV9UQUJMRShvZiwgamg3
MTEwX3RpbWVyX21hdGNoKTsKPj4gPj4gKwo+PiA+PiArc3RhdGljIHN0cnVjdCBwbGF0Zm9ybV9k
cml2ZXIgamg3MTEwX3RpbWVyX2RyaXZlciA9IHsKPj4gPj4gK8KgwqDCoCAucHJvYmUgPSBqaDcx
MTBfdGltZXJfcHJvYmUsCj4+ID4+ICvCoMKgwqAgLmRyaXZlciA9IHsKPj4gPj4gK8KgwqDCoMKg
wqDCoMKgIC5uYW1lID0gImpoNzExMC10aW1lciIsCj4+ID4+ICvCoMKgwqDCoMKgwqDCoCAub2Zf
bWF0Y2hfdGFibGUgPSBqaDcxMTBfdGltZXJfbWF0Y2gsCj4+ID4+ICvCoMKgwqAgfSwKPj4gPj4g
K307Cj4+ID4+ICttb2R1bGVfcGxhdGZvcm1fZHJpdmVyKGpoNzExMF90aW1lcl9kcml2ZXIpOwo+
PiA+PiArCj4+ID4+ICtNT0RVTEVfQVVUSE9SKCJYaW5neXUgV3UgPHhpbmd5dS53dS1iT05yTTQ1
S1dGT1htTVhqSkJwV3FnQHB1YmxpYy5nbWFuZS5vcmc+Iik7Cj4+ID4+ICtNT0RVTEVfREVTQ1JJ
UFRJT04oIlN0YXJGaXZlIEpINzExMCB0aW1lciBkcml2ZXIiKTsKPj4gPj4gK01PRFVMRV9MSUNF
TlNFKCJHUEwiKTsKPj4gPgo+Pgo+PiBUaGFua3MsCj4+IFhpbmd5dSBXdQo+Pgo+Pgo+PiBfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+PiBsaW51eC1yaXNj
diBtYWlsaW5nIGxpc3QKPj4gbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwo+PiBodHRw
Oi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2CgoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3Yg
bWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3Rz
LmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
