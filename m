Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BDFD5CDB47E
	for <linux-riscv@archiver.kernel.org>; Fri, 13 Oct 2023 09:41:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9+QtKe2R/ThOlNYGaElHVP/cstKOygS66G3sdaXIfHo=; b=AVcuQttoHAtbml
	7HoFYbbPhp5xKpjkvXnww1hX1d2LFq6dKeHqJ0cw4Tkpj4LkdwbG9CK84MTd+wEIB8VYlnIt4EIGn
	gH1jfAN3ZyatAhPl+rdtvQ+xgN4+sjj8GwUXQjElJxaPHnkoWPfHL+U+grv0BubfvFgZR2pXWQMEr
	B5kGGyrVwsEitJSWH4ZsKVwZkqBTLTkabj+0p4esfM7MXuntiouHFeeUbY9N+uIWmUQ0KKavAvWcr
	gOQIZuIicA9IulfBMfH3imcwueH9Y1FG4rJX+WkSGlcBiMBkukPWR7ln/h8MpeEJWHs/smSsdFtpr
	esd/PrjEAcp6pRrECQLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qrEfw-002zLj-0m;
	Fri, 13 Oct 2023 09:41:44 +0000
Received: from ex01.ufhost.com ([61.152.239.75])
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qrEfr-002zIQ-26
	for linux-riscv@lists.infradead.org;
	Fri, 13 Oct 2023 09:41:42 +0000
Received: from EXMBX166.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX166", Issuer "EXMBX166" (not verified))
	by ex01.ufhost.com (Postfix) with ESMTP id BB46224E373;
	Fri, 13 Oct 2023 17:40:53 +0800 (CST)
Received: from EXMBX061.cuchost.com (172.16.6.61) by EXMBX166.cuchost.com
 (172.16.6.76) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Fri, 13 Oct
 2023 17:40:53 +0800
Received: from [192.168.125.131] (183.27.96.95) by EXMBX061.cuchost.com
 (172.16.6.61) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Fri, 13 Oct
 2023 17:40:52 +0800
Message-ID: <926ee8c7-fab9-49d5-831e-48c886c4bc44@starfivetech.com>
Date: Fri, 13 Oct 2023 17:34:51 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 2/3] clocksource: Add JH7110 timer driver
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
CC: <aou@eecs.berkeley.edu>, <conor@kernel.org>, <daniel.lezcano@linaro.org>,
	<devicetree@vger.kernel.org>, <emil.renner.berthing@canonical.com>,
	<krzysztof.kozlowski+dt@linaro.org>, <linux-kernel@vger.kernel.org>,
	<linux-riscv@lists.infradead.org>, <p.zabel@pengutronix.de>,
	<palmer@dabbelt.com>, <paul.walmsley@sifive.com>, <robh+dt@kernel.org>,
	<samin.guo@starfivetech.com>, <tglx@linutronix.de>,
	<walker.chen@starfivetech.com>
References: <20231012081015.33121-1-xingyu.wu@starfivetech.com>
 <20231012081015.33121-3-xingyu.wu@starfivetech.com>
 <338544e7-0be8-47c1-a7d7-89990da305d3@wanadoo.fr>
Content-Language: en-US
From: Xingyu Wu <xingyu.wu@starfivetech.com>
In-Reply-To: <338544e7-0be8-47c1-a7d7-89990da305d3@wanadoo.fr>
X-Originating-IP: [183.27.96.95]
X-ClientProxiedBy: EXCAS062.cuchost.com (172.16.6.22) To EXMBX061.cuchost.com
 (172.16.6.61)
X-YovoleRuleAgent: yovoleflag
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231013_024139_974762_F83F5537 
X-CRM114-Status: GOOD (  14.48  )
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

T24gMjAyMy8xMC8xMyAxOjUzLCBDaHJpc3RvcGhlIEpBSUxMRVQgd3JvdGU6Cj4gTGUgMTIvMTAv
MjAyMyDDoCAxMDoxMCwgWGluZ3l1IFd1IGEgw6ljcml0wqA6Cj4+IEFkZCB0aW1lciBkcml2ZXIg
Zm9yIHRoZSBTdGFyRml2ZSBKSDcxMTAgU29DLgo+Pgo+PiBTaWduZWQtb2ZmLWJ5OiBYaW5neXUg
V3UgPHhpbmd5dS53dS1iT05yTTQ1S1dGT1htTVhqSkJwV3FnQHB1YmxpYy5nbWFuZS5vcmc+Cj4g
Cj4gLi4uCgpJdCBsb29rcyBub3JtYWwgaW4gbXkgZW1haWwgYW5kIHRoZSB3ZWIuIElzIHRoaXMg
ZHVlIHRvIHNvbWUgc2V0dGluZ3M/Cgo+IAo+PiArc3RhdGljIGludCBqaDcxMTBfdGltZXJfcHJv
YmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikKPj4gK3sKPj4gK8KgwqDCoCBzdHJ1Y3Qg
amg3MTEwX2Nsa2V2dCAqY2xrZXZ0W0pINzExMF9USU1FUl9DSF9NQVhdOwo+PiArwqDCoMKgIGNo
YXIgbmFtZVs0XTsKPj4gK8KgwqDCoCBzdHJ1Y3QgY2xrICpwY2xrOwo+PiArwqDCoMKgIHN0cnVj
dCByZXNldF9jb250cm9sICpyc3Q7Cj4+ICvCoMKgwqAgaW50IGNoOwo+PiArwqDCoMKgIGludCBy
ZXQ7Cj4+ICvCoMKgwqAgdm9pZCBfX2lvbWVtICpiYXNlOwo+PiArCj4+ICvCoMKgwqAgYmFzZSA9
IGRldm1fcGxhdGZvcm1faW9yZW1hcF9yZXNvdXJjZShwZGV2LCAwKTsKPj4gK8KgwqDCoCBpZiAo
SVNfRVJSKGJhc2UpKQo+PiArwqDCoMKgwqDCoMKgwqAgcmV0dXJuIGRldl9lcnJfcHJvYmUoJnBk
ZXYtPmRldiwgUFRSX0VSUihiYXNlKSwKPj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqAgImZhaWxlZCB0byBtYXAgcmVnaXN0ZXJzXG4iKTsKPj4gKwo+PiArwqDCoMKg
IHJzdCA9IGRldm1fcmVzZXRfY29udHJvbF9nZXRfZXhjbHVzaXZlKCZwZGV2LT5kZXYsICJhcGIi
KTsKPj4gK8KgwqDCoCBpZiAoSVNfRVJSKHJzdCkpCj4+ICvCoMKgwqDCoMKgwqDCoCByZXR1cm4g
ZGV2X2Vycl9wcm9iZSgmcGRldi0+ZGV2LCBQVFJfRVJSKHJzdCksICJmYWlsZWQgdG8gZ2V0IGFw
YiByZXNldFxuIik7Cj4+ICsKPj4gK8KgwqDCoCBwY2xrID0gZGV2bV9jbGtfZ2V0X2VuYWJsZWQo
JnBkZXYtPmRldiwgImFwYiIpOwo+PiArwqDCoMKgIGlmIChJU19FUlIocGNsaykpCj4+ICvCoMKg
wqDCoMKgwqDCoCByZXR1cm4gZGV2X2Vycl9wcm9iZSgmcGRldi0+ZGV2LCBQVFJfRVJSKHBjbGsp
LAo+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAiZmFpbGVkIHRv
IGdldCAmIGVuYWJsZSBhcGIgY2xvY2tcbiIpOwo+PiArCj4+ICvCoMKgwqAgcmV0ID0gcmVzZXRf
Y29udHJvbF9kZWFzc2VydChyc3QpOwo+PiArwqDCoMKgIGlmIChyZXQpCj4+ICvCoMKgwqDCoMKg
wqDCoCByZXR1cm4gZGV2X2Vycl9wcm9iZSgmcGRldi0+ZGV2LCByZXQsICJmYWlsZWQgdG8gZGVh
c3NlcnQgYXBiIHJlc2V0XG4iKTsKPiAKPiBIaSwKPiAKPiBJJ20gbm90IHZlcnkgZmFtaWxpYXIg
d2l0aCB0aGUgcmVzZXRfY29udHJvbF9bZGVdYXNzZXJ0KCkgZnVuY3Rpb25zLCBidXQgc2hvdWxk
bid0IHRoaXMgYmUgdW5kb25lIGJ5IGEgcmVzZXRfY29udHJvbF9hc3NlcnQoKSBjYWxsIGlmIGFu
IGVycm9yIG9jY3VycyBsYXRlcj8KCkluIHRoaXMgY2FzZSwgdGhlIHJlc2V0IGNvbnRyb2xsZXIg
aXMgc2V0IGZyb20gJ2Fzc2VydCcgc3RhdGUgdG8gJ2RlYXNzZXJ0JyBzdGF0ZS4gSWYgaXQgaXMg
ZmFpbGVkIGFuZCBzdGlsbCAnYXNzZXJ0JyBzdGF0ZSwgSSBkb24ndCB0aGluayBpdCBuZWVkIHRv
IGNhbGwgcmVzZXRfY29udHJvbF9hc3NlcnQoKS4gCgo+IAo+PiArCj4+ICvCoMKgwqAgZm9yIChj
aCA9IDA7IGNoIDwgSkg3MTEwX1RJTUVSX0NIX01BWDsgY2grKykgewo+PiArwqDCoMKgwqDCoMKg
wqAgY2xrZXZ0W2NoXSA9IGRldm1fa3phbGxvYygmcGRldi0+ZGV2LCBzaXplb2YoKmNsa2V2dFtj
aF0pLCBHRlBfS0VSTkVMKTsKPj4gK8KgwqDCoMKgwqDCoMKgIGlmICghY2xrZXZ0W2NoXSkKPj4g
K8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgcmV0dXJuIC1FTk9NRU07Cj4+ICsKPj4gK8KgwqDCoMKg
wqDCoMKgIHNucHJpbnRmKG5hbWUsIHNpemVvZihuYW1lKSwgImNoJWQiLCBjaCk7Cj4+ICsKPj4g
K8KgwqDCoMKgwqDCoMKgIGNsa2V2dFtjaF0tPmJhc2UgPSBiYXNlICsgSkg3MTEwX1RJTUVSX0NI
X0JBU0UoY2gpOwo+PiArwqDCoMKgwqDCoMKgwqAgLyogRW5zdXJlIHRpbWVyIGlzIGRpc2FibGVk
ICovCj4+ICvCoMKgwqDCoMKgwqDCoCBqaDcxMTBfdGltZXJfZGlzYWJsZShjbGtldnRbY2hdKTsK
Pj4gKwo+PiArwqDCoMKgwqDCoMKgwqAgcnN0ID0gZGV2bV9yZXNldF9jb250cm9sX2dldF9leGNs
dXNpdmUoJnBkZXYtPmRldiwgbmFtZSk7Cj4+ICvCoMKgwqDCoMKgwqDCoCBpZiAoSVNfRVJSKHJz
dCkpCj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHJldHVybiBQVFJfRVJSKHJzdCk7Cj4+ICsK
Pj4gK8KgwqDCoMKgwqDCoMKgIGNsa2V2dFtjaF0tPmNsayA9IGRldm1fY2xrX2dldF9lbmFibGVk
KCZwZGV2LT5kZXYsIG5hbWUpOwo+PiArwqDCoMKgwqDCoMKgwqAgaWYgKElTX0VSUihjbGtldnRb
Y2hdLT5jbGspKQo+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCByZXR1cm4gUFRSX0VSUihjbGtl
dnRbY2hdLT5jbGspOwo+PiArCj4+ICvCoMKgwqDCoMKgwqDCoCByZXQgPSByZXNldF9jb250cm9s
X2RlYXNzZXJ0KHJzdCk7Cj4+ICvCoMKgwqDCoMKgwqDCoCBpZiAocmV0KQo+PiArwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoCByZXR1cm4gcmV0Owo+IAo+IFNhbWUgaGVyZS4KPiAKPj4gKwo+PiArwqDC
oMKgwqDCoMKgwqAgY2xrZXZ0W2NoXS0+ZXZ0LmlycSA9IHBsYXRmb3JtX2dldF9pcnEocGRldiwg
Y2gpOwo+PiArwqDCoMKgwqDCoMKgwqAgaWYgKGNsa2V2dFtjaF0tPmV2dC5pcnEgPCAwKQo+PiAr
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoCByZXR1cm4gY2xrZXZ0W2NoXS0+ZXZ0LmlycTsKPj4gKwo+
PiArwqDCoMKgwqDCoMKgwqAgc25wcmludGYoY2xrZXZ0W2NoXS0+bmFtZSwgc2l6ZW9mKGNsa2V2
dFtjaF0tPm5hbWUpLCAiJXMuY2glZCIsIHBkZXYtPm5hbWUsIGNoKTsKPj4gK8KgwqDCoMKgwqDC
oMKgIGpoNzExMF9jbG9ja2V2ZW50c19yZWdpc3RlcihjbGtldnRbY2hdKTsKPj4gKwo+PiArwqDC
oMKgwqDCoMKgwqAgcmV0ID0gZGV2bV9yZXF1ZXN0X2lycSgmcGRldi0+ZGV2LCBjbGtldnRbY2hd
LT5ldnQuaXJxLCBqaDcxMTBfdGltZXJfaW50ZXJydXB0LAo+PiArwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgSVJRRl9USU1FUiB8IElSUUZfSVJRUE9MTCwKPj4g
K8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGNsa2V2dFtjaF0t
Pm5hbWUsICZjbGtldnRbY2hdLT5ldnQpOwo+PiArwqDCoMKgwqDCoMKgwqAgaWYgKHJldCkKPj4g
K8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgcmV0dXJuIHJldDsKPj4gKwo+PiArwqDCoMKgwqDCoMKg
wqAgcmV0ID0gamg3MTEwX2Nsb2Nrc291cmNlX2luaXQoY2xrZXZ0W2NoXSk7Cj4gCj4gRG9lcyBz
b21ldGhpbmcgc2hvdWxkIGJlIGRvbmUgaWYgdGhpcyBmYWlscz8KPiAKPiBDSgoKWWVzLCBpdCBz
aG91bGQgYmUgY2FsbCByZXNldF9jb250cm9sX2Fzc2VydCgpIGhlcmUgYW5kIEkgd2lsbCBhZGQg
aXQgaW4gbmV4dCB2ZXJzaW9uLgoKPiAKPj4gK8KgwqDCoMKgwqDCoMKgIGlmIChyZXQpCj4+ICvC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgIHJldHVybiByZXQ7Cj4+ICvCoMKgwqAgfQo+PiArCj4+ICvC
oMKgwqAgcmV0dXJuIDA7Cj4+ICt9Cj4+ICsKPj4gK3N0YXRpYyBjb25zdCBzdHJ1Y3Qgb2ZfZGV2
aWNlX2lkIGpoNzExMF90aW1lcl9tYXRjaFtdID0gewo+PiArwqDCoMKgIHsgLmNvbXBhdGlibGUg
PSAic3RhcmZpdmUsamg3MTEwLXRpbWVyIiwgfSwKPj4gK8KgwqDCoCB7IC8qIHNlbnRpbmVsICov
IH0KPj4gK307Cj4+ICtNT0RVTEVfREVWSUNFX1RBQkxFKG9mLCBqaDcxMTBfdGltZXJfbWF0Y2gp
Owo+PiArCj4+ICtzdGF0aWMgc3RydWN0IHBsYXRmb3JtX2RyaXZlciBqaDcxMTBfdGltZXJfZHJp
dmVyID0gewo+PiArwqDCoMKgIC5wcm9iZSA9IGpoNzExMF90aW1lcl9wcm9iZSwKPj4gK8KgwqDC
oCAuZHJpdmVyID0gewo+PiArwqDCoMKgwqDCoMKgwqAgLm5hbWUgPSAiamg3MTEwLXRpbWVyIiwK
Pj4gK8KgwqDCoMKgwqDCoMKgIC5vZl9tYXRjaF90YWJsZSA9IGpoNzExMF90aW1lcl9tYXRjaCwK
Pj4gK8KgwqDCoCB9LAo+PiArfTsKPj4gK21vZHVsZV9wbGF0Zm9ybV9kcml2ZXIoamg3MTEwX3Rp
bWVyX2RyaXZlcik7Cj4+ICsKPj4gK01PRFVMRV9BVVRIT1IoIlhpbmd5dSBXdSA8eGluZ3l1Lnd1
LWJPTnJNNDVLV0ZPWG1NWGpKQnBXcWdAcHVibGljLmdtYW5lLm9yZz4iKTsKPj4gK01PRFVMRV9E
RVNDUklQVElPTigiU3RhckZpdmUgSkg3MTEwIHRpbWVyIGRyaXZlciIpOwo+PiArTU9EVUxFX0xJ
Q0VOU0UoIkdQTCIpOwo+IAoKVGhhbmtzLApYaW5neXUgV3UKCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGlu
dXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
