Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2747CCDB465
	for <linux-riscv@archiver.kernel.org>; Mon, 16 Oct 2023 09:33:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MQREAic/0ezCcwwolhxjYqdAxB99Xhqpzk1Igov4PFU=; b=HI+yaZUmEtF4NK
	oDCPCn5xvhaF63f6vQP1KyuLMCsx3mAq+11DLD5Zt7dEpKBHtrUQ2/1k9LjrTDbQrG77QION+z6uV
	mBIDCIfvUdfQoy28CHiNd0Py8+oV62anN99tN5xf91UKTGRZKT2eemcl8h9Yde0WKPoNWLbRCWlB2
	LIJ/IMKAY87vzGU5JdIRLbpqiYomn2IQWeYVG18vHNNsJUHkff7PBaRbSmnA8HoANH2EYfDCE/tgO
	2DkK7FRTcSpdqjfY+QLmSCSsxW4FgomP+ntuab6yUWHC06adRFqj+Vp9URUiV8XJNIqrgMYd6aKfO
	FKgy5xUtTjRxtn53baUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qsJyr-0091w1-1W;
	Mon, 16 Oct 2023 09:33:45 +0000
Received: from ex01.ufhost.com ([61.152.239.75])
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qsJyn-0091sX-2Z
	for linux-riscv@lists.infradead.org;
	Mon, 16 Oct 2023 09:33:44 +0000
Received: from EXMBX166.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX166", Issuer "EXMBX166" (not verified))
	by ex01.ufhost.com (Postfix) with ESMTP id 4B68B24E43C;
	Mon, 16 Oct 2023 17:33:17 +0800 (CST)
Received: from EXMBX061.cuchost.com (172.16.6.61) by EXMBX166.cuchost.com
 (172.16.6.76) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Mon, 16 Oct
 2023 17:33:17 +0800
Received: from [192.168.125.131] (183.27.98.194) by EXMBX061.cuchost.com
 (172.16.6.61) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Mon, 16 Oct
 2023 17:33:16 +0800
Message-ID: <d127c7ff-8883-4069-9cc9-407be1b6feaf@starfivetech.com>
Date: Mon, 16 Oct 2023 17:27:10 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 2/3] clocksource: Add JH7110 timer driver
Content-Language: en-US
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
 <926ee8c7-fab9-49d5-831e-48c886c4bc44@starfivetech.com>
 <276ed249-9ee8-4dc9-871f-9c449eb00bcf@wanadoo.fr>
From: Xingyu Wu <xingyu.wu@starfivetech.com>
In-Reply-To: <276ed249-9ee8-4dc9-871f-9c449eb00bcf@wanadoo.fr>
X-Originating-IP: [183.27.98.194]
X-ClientProxiedBy: EXCAS062.cuchost.com (172.16.6.22) To EXMBX061.cuchost.com
 (172.16.6.61)
X-YovoleRuleAgent: yovoleflag
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231016_023342_289962_B6E4E898 
X-CRM114-Status: GOOD (  20.36  )
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

T24gMjAyMy8xMC8xNCAyOjAyLCBDaHJpc3RvcGhlIEpBSUxMRVQgd3JvdGU6Cj4gTGUgMTMvMTAv
MjAyMyDDoCAxMTozNCwgWGluZ3l1IFd1IGEgw6ljcml0wqA6Cj4+IE9uIDIwMjMvMTAvMTMgMTo1
MywgQ2hyaXN0b3BoZSBKQUlMTEVUIHdyb3RlOgo+Pj4gTGUgMTIvMTAvMjAyMyDDoCAxMDoxMCwg
WGluZ3l1IFd1IGEgw6ljcml0wqA6Cj4+Pj4gQWRkIHRpbWVyIGRyaXZlciBmb3IgdGhlIFN0YXJG
aXZlIEpINzExMCBTb0MuCj4+Pj4KPj4+PiBTaWduZWQtb2ZmLWJ5OiBYaW5neXUgV3UgPHhpbmd5
dS53dS1iT05yTTQ1S1dGT1htTVhqSkJwV3FnLVhNRDV5SkRiZE1TdHUzY0xUY3ZWSXdAcHVibGlj
LmdtYW5lLm9yZ2Uub3JnPgo+Pj4KPj4+IC4uLgo+Pgo+PiBJdCBsb29rcyBub3JtYWwgaW4gbXkg
ZW1haWwgYW5kIHRoZSB3ZWIuIElzIHRoaXMgZHVlIHRvIHNvbWUgc2V0dGluZ3M/Cj4gCj4gSGks
Cj4gCj4gSSB1c2UgZ21hbmUub3JnIGFuZCBhIG5ld3MgcmVhZGVyIChUaHVuZGVyYmlyZCkuCj4g
R21hbmUgc29tZXRpbWVzIChub3QgYWx3YXlzISkgb2JmdXNjYXRlIGUtbWFpbCBhZGRyZXNzZXMu
Cj4gCj4gRG8gbm90IHBheSBhdHRhbnRpb24gdG8gdGhlc2Ugc3RyYW5nZSByZXdyaXR0ZW4gYWRk
cmVzc2VzLgo+IAo+Pgo+Pj4KPj4+PiArc3RhdGljIGludCBqaDcxMTBfdGltZXJfcHJvYmUoc3Ry
dWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikKPj4+PiArewo+Pj4+ICvCoMKgwqAgc3RydWN0IGpo
NzExMF9jbGtldnQgKmNsa2V2dFtKSDcxMTBfVElNRVJfQ0hfTUFYXTsKPj4+PiArwqDCoMKgIGNo
YXIgbmFtZVs0XTsKPj4+PiArwqDCoMKgIHN0cnVjdCBjbGsgKnBjbGs7Cj4+Pj4gK8KgwqDCoCBz
dHJ1Y3QgcmVzZXRfY29udHJvbCAqcnN0Owo+Pj4+ICvCoMKgwqAgaW50IGNoOwo+Pj4+ICvCoMKg
wqAgaW50IHJldDsKPj4+PiArwqDCoMKgIHZvaWQgX19pb21lbSAqYmFzZTsKPj4+PiArCj4+Pj4g
K8KgwqDCoCBiYXNlID0gZGV2bV9wbGF0Zm9ybV9pb3JlbWFwX3Jlc291cmNlKHBkZXYsIDApOwo+
Pj4+ICvCoMKgwqAgaWYgKElTX0VSUihiYXNlKSkKPj4+PiArwqDCoMKgwqDCoMKgwqAgcmV0dXJu
IGRldl9lcnJfcHJvYmUoJnBkZXYtPmRldiwgUFRSX0VSUihiYXNlKSwKPj4+PiArwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAiZmFpbGVkIHRvIG1hcCByZWdpc3RlcnNc
biIpOwo+Pj4+ICsKPj4+PiArwqDCoMKgIHJzdCA9IGRldm1fcmVzZXRfY29udHJvbF9nZXRfZXhj
bHVzaXZlKCZwZGV2LT5kZXYsICJhcGIiKTsKPj4+PiArwqDCoMKgIGlmIChJU19FUlIocnN0KSkK
Pj4+PiArwqDCoMKgwqDCoMKgwqAgcmV0dXJuIGRldl9lcnJfcHJvYmUoJnBkZXYtPmRldiwgUFRS
X0VSUihyc3QpLCAiZmFpbGVkIHRvIGdldCBhcGIgcmVzZXRcbiIpOwo+Pj4+ICsKPj4+PiArwqDC
oMKgIHBjbGsgPSBkZXZtX2Nsa19nZXRfZW5hYmxlZCgmcGRldi0+ZGV2LCAiYXBiIik7Cj4+Pj4g
K8KgwqDCoCBpZiAoSVNfRVJSKHBjbGspKQo+Pj4+ICvCoMKgwqDCoMKgwqDCoCByZXR1cm4gZGV2
X2Vycl9wcm9iZSgmcGRldi0+ZGV2LCBQVFJfRVJSKHBjbGspLAo+Pj4+ICvCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgICJmYWlsZWQgdG8gZ2V0ICYgZW5hYmxlIGFwYiBj
bG9ja1xuIik7Cj4+Pj4gKwo+Pj4+ICvCoMKgwqAgcmV0ID0gcmVzZXRfY29udHJvbF9kZWFzc2Vy
dChyc3QpOwo+Pj4+ICvCoMKgwqAgaWYgKHJldCkKPj4+PiArwqDCoMKgwqDCoMKgwqAgcmV0dXJu
IGRldl9lcnJfcHJvYmUoJnBkZXYtPmRldiwgcmV0LCAiZmFpbGVkIHRvIGRlYXNzZXJ0IGFwYiBy
ZXNldFxuIik7Cj4+Pgo+Pj4gSGksCj4+Pgo+Pj4gSSdtIG5vdCB2ZXJ5IGZhbWlsaWFyIHdpdGgg
dGhlIHJlc2V0X2NvbnRyb2xfW2RlXWFzc2VydCgpIGZ1bmN0aW9ucywgYnV0IHNob3VsZG4ndCB0
aGlzIGJlIHVuZG9uZSBieSBhIHJlc2V0X2NvbnRyb2xfYXNzZXJ0KCkgY2FsbCBpZiBhbiBlcnJv
ciBvY2N1cnMgbGF0ZXI/Cj4+Cj4+IEluIHRoaXMgY2FzZSwgdGhlIHJlc2V0IGNvbnRyb2xsZXIg
aXMgc2V0IGZyb20gJ2Fzc2VydCcgc3RhdGUgdG8gJ2RlYXNzZXJ0JyBzdGF0ZS4gSWYgaXQgaXMg
ZmFpbGVkIGFuZCBzdGlsbCAnYXNzZXJ0JyBzdGF0ZSwgSSBkb24ndCB0aGluayBpdCBuZWVkIHRv
IGNhbGwgcmVzZXRfY29udHJvbF9hc3NlcnQoKS4KPiAKPiBFbWlsIGFscmVhZHkgZXhwbGFpbmVk
IHdoYXQgSSBtZWFuZWQgKHNvcnJ5IGZvciBub3QgYmVpbmcgY2xlYXIgZW5vdWdoKS4KPiBJIGRv
IGFncmVlIHdpdGggaGlzIHByb3Bvc2VkIGFwcHJvYWNoLgo+IAo+Pgo+Pj4KPj4+PiArCj4+Pj4g
K8KgwqDCoCBmb3IgKGNoID0gMDsgY2ggPCBKSDcxMTBfVElNRVJfQ0hfTUFYOyBjaCsrKSB7Cj4+
Pj4gK8KgwqDCoMKgwqDCoMKgIGNsa2V2dFtjaF0gPSBkZXZtX2t6YWxsb2MoJnBkZXYtPmRldiwg
c2l6ZW9mKCpjbGtldnRbY2hdKSwgR0ZQX0tFUk5FTCk7Cj4+Pj4gK8KgwqDCoMKgwqDCoMKgIGlm
ICghY2xrZXZ0W2NoXSkKPj4+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCByZXR1cm4gLUVOT01F
TTsKPj4+PiArCj4+Pj4gK8KgwqDCoMKgwqDCoMKgIHNucHJpbnRmKG5hbWUsIHNpemVvZihuYW1l
KSwgImNoJWQiLCBjaCk7Cj4+Pj4gKwo+Pj4+ICvCoMKgwqDCoMKgwqDCoCBjbGtldnRbY2hdLT5i
YXNlID0gYmFzZSArIEpINzExMF9USU1FUl9DSF9CQVNFKGNoKTsKPj4+PiArwqDCoMKgwqDCoMKg
wqAgLyogRW5zdXJlIHRpbWVyIGlzIGRpc2FibGVkICovCj4+Pj4gK8KgwqDCoMKgwqDCoMKgIGpo
NzExMF90aW1lcl9kaXNhYmxlKGNsa2V2dFtjaF0pOwo+Pj4+ICsKPj4+PiArwqDCoMKgwqDCoMKg
wqAgcnN0ID0gZGV2bV9yZXNldF9jb250cm9sX2dldF9leGNsdXNpdmUoJnBkZXYtPmRldiwgbmFt
ZSk7Cj4+Pj4gK8KgwqDCoMKgwqDCoMKgIGlmIChJU19FUlIocnN0KSkKPj4+PiArwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoCByZXR1cm4gUFRSX0VSUihyc3QpOwo+Pj4+ICsKPj4+PiArwqDCoMKgwqDC
oMKgwqAgY2xrZXZ0W2NoXS0+Y2xrID0gZGV2bV9jbGtfZ2V0X2VuYWJsZWQoJnBkZXYtPmRldiwg
bmFtZSk7Cj4+Pj4gK8KgwqDCoMKgwqDCoMKgIGlmIChJU19FUlIoY2xrZXZ0W2NoXS0+Y2xrKSkK
Pj4+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCByZXR1cm4gUFRSX0VSUihjbGtldnRbY2hdLT5j
bGspOwo+Pj4+ICsKPj4+PiArwqDCoMKgwqDCoMKgwqAgcmV0ID0gcmVzZXRfY29udHJvbF9kZWFz
c2VydChyc3QpOwo+Pj4+ICvCoMKgwqDCoMKgwqDCoCBpZiAocmV0KQo+Pj4+ICvCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgIHJldHVybiByZXQ7Cj4+Pgo+Pj4gU2FtZSBoZXJlLgo+Pj4KPj4+PiArCj4+
Pj4gK8KgwqDCoMKgwqDCoMKgIGNsa2V2dFtjaF0tPmV2dC5pcnEgPSBwbGF0Zm9ybV9nZXRfaXJx
KHBkZXYsIGNoKTsKPj4+PiArwqDCoMKgwqDCoMKgwqAgaWYgKGNsa2V2dFtjaF0tPmV2dC5pcnEg
PCAwKQo+Pj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHJldHVybiBjbGtldnRbY2hdLT5ldnQu
aXJxOwo+Pj4+ICsKPj4+PiArwqDCoMKgwqDCoMKgwqAgc25wcmludGYoY2xrZXZ0W2NoXS0+bmFt
ZSwgc2l6ZW9mKGNsa2V2dFtjaF0tPm5hbWUpLCAiJXMuY2glZCIsIHBkZXYtPm5hbWUsIGNoKTsK
Pj4+PiArwqDCoMKgwqDCoMKgwqAgamg3MTEwX2Nsb2NrZXZlbnRzX3JlZ2lzdGVyKGNsa2V2dFtj
aF0pOwo+Pj4+ICsKPj4+PiArwqDCoMKgwqDCoMKgwqAgcmV0ID0gZGV2bV9yZXF1ZXN0X2lycSgm
cGRldi0+ZGV2LCBjbGtldnRbY2hdLT5ldnQuaXJxLCBqaDcxMTBfdGltZXJfaW50ZXJydXB0LAo+
Pj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBJUlFGX1RJ
TUVSIHwgSVJRRl9JUlFQT0xMLAo+Pj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoCBjbGtldnRbY2hdLT5uYW1lLCAmY2xrZXZ0W2NoXS0+ZXZ0KTsKPj4+PiAr
wqDCoMKgwqDCoMKgwqAgaWYgKHJldCkKPj4+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCByZXR1
cm4gcmV0Owo+Pj4+ICsKPj4+PiArwqDCoMKgwqDCoMKgwqAgcmV0ID0gamg3MTEwX2Nsb2Nrc291
cmNlX2luaXQoY2xrZXZ0W2NoXSk7Cj4+Pgo+Pj4gRG9lcyBzb21ldGhpbmcgc2hvdWxkIGJlIGRv
bmUgaWYgdGhpcyBmYWlscz8KPj4+Cj4+PiBDSgo+Pgo+PiBZZXMsIGl0IHNob3VsZCBiZSBjYWxs
IHJlc2V0X2NvbnRyb2xfYXNzZXJ0KCkgaGVyZSBhbmQgSSB3aWxsIGFkZCBpdCBpbiBuZXh0IHZl
cnNpb24uCj4gCj4gTXkgcG9pbnQgd2FzIGZvciB0aGUgYWJvdmUgcmVzZXRfY29udHJvbF9hc3Nl
cnQoKSBidXQgYWxzbyBmb3IgdGhlIHJlc291cmNlcyBhbGxvY2F0ZWQgd2l0aGluIHRoaXMgZm9y
IGxvb3AuCj4gCj4gSSBoYXZlIG5vdCBjaGVja2VkIGFsbCBwYXRocywgYnV0IGluIGNhc2Ugb2Yg
ZXJyb3IgaW4gdGhlIHByb2JlOgo+IMKgIC0gVGhlcmUgaXMgYW5vdGhlciByZXNldF9jb250cm9s
X2RlYXNzZXJ0KCkKPiAKPiDCoCAtIGpoNzExMF9jbG9ja3NvdXJjZV9pbml0KCkgLS0+IGpoNzEx
MF90aW1lcl9pbnRfaW5pdF9lbmFibGUoKSAtLT4gamg3MTEwX3RpbWVyX2VuYWJsZSgpCj4gwqDC
oMKgIFNob3VsZCBqaDcxMTBfdGltZXJfZGlzYWJsZSgpIGJlIGNhbGxlZD8KPiAKPiDCoCAtIGpo
NzExMF9jbG9ja3NvdXJjZV9pbml0KCkgLS0+IGNsb2Nrc291cmNlX3JlZ2lzdGVyX2h6KCkuCj4g
wqDCoMKgIFNob3VsZCBjbG9ja3NvdXJjZV91bnJlZ2lzdGVyKCkgYmUgY2FsbGVkPwo+IAo+IElm
IEknbSBjb3JyZWN0IGFuZCBkZXBlbmRpbmcgb24gaG93IHlvdSB1cGRhdGUgdGhlIGNvZGUsIGEg
LnJlbW92ZSBmdW5jdGlvbiBtYXkgYmUgbmVlZGVkIGFzIHdlbGwuCj4gCj4gQ0oKPiAKCkdyZWF0
LiBJJ20gZ29pbmcgdG8gYWRkIGEgYWN0aW9uIHdoaWNoIEVtaWwgaGFkIHNhaWQgdG8gZG8gdGhp
cyBqb2Igd2hlbiByZW1vdmUgb3IgbWFrZSB0aGUgZXJyb3IgaW4gdGhlIGxvb3AuIAoKVGhhbmtz
LApYaW5neXUgV3UKCj4+Cj4+Pgo+Pj4+ICvCoMKgwqDCoMKgwqDCoCBpZiAocmV0KQo+Pj4+ICvC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgIHJldHVybiByZXQ7Cj4+Pj4gK8KgwqDCoCB9Cj4+Pj4gKwo+
Pj4+ICvCoMKgwqAgcmV0dXJuIDA7Cj4+Pj4gK30KPj4+PiArCj4+Pj4gK3N0YXRpYyBjb25zdCBz
dHJ1Y3Qgb2ZfZGV2aWNlX2lkIGpoNzExMF90aW1lcl9tYXRjaFtdID0gewo+Pj4+ICvCoMKgwqAg
eyAuY29tcGF0aWJsZSA9ICJzdGFyZml2ZSxqaDcxMTAtdGltZXIiLCB9LAo+Pj4+ICvCoMKgwqAg
eyAvKiBzZW50aW5lbCAqLyB9Cj4+Pj4gK307Cj4+Pj4gK01PRFVMRV9ERVZJQ0VfVEFCTEUob2Ys
IGpoNzExMF90aW1lcl9tYXRjaCk7Cj4+Pj4gKwo+Pj4+ICtzdGF0aWMgc3RydWN0IHBsYXRmb3Jt
X2RyaXZlciBqaDcxMTBfdGltZXJfZHJpdmVyID0gewo+Pj4+ICvCoMKgwqAgLnByb2JlID0gamg3
MTEwX3RpbWVyX3Byb2JlLAo+Pj4+ICvCoMKgwqAgLmRyaXZlciA9IHsKPj4+PiArwqDCoMKgwqDC
oMKgwqAgLm5hbWUgPSAiamg3MTEwLXRpbWVyIiwKPj4+PiArwqDCoMKgwqDCoMKgwqAgLm9mX21h
dGNoX3RhYmxlID0gamg3MTEwX3RpbWVyX21hdGNoLAo+Pj4+ICvCoMKgwqAgfSwKPj4+PiArfTsK
Pj4+PiArbW9kdWxlX3BsYXRmb3JtX2RyaXZlcihqaDcxMTBfdGltZXJfZHJpdmVyKTsKPj4+PiAr
Cj4+Pj4gK01PRFVMRV9BVVRIT1IoIlhpbmd5dSBXdSA8eGluZ3l1Lnd1LWJPTnJNNDVLV0ZPWG1N
WGpKQnBXcWctWE1ENXlKRGJkTVJTNW42L1JraWFKQUBwdWJsaWMuZ21hbmUub3JnbmUub3JnPiIp
Owo+Pj4+ICtNT0RVTEVfREVTQ1JJUFRJT04oIlN0YXJGaXZlIEpINzExMCB0aW1lciBkcml2ZXIi
KTsKPj4+PiArTU9EVUxFX0xJQ0VOU0UoIkdQTCIpOwo+Pj4KPj4KPj4gVGhhbmtzLAo+PiBYaW5n
eXUgV3UKPj4KPj4KPj4KPiAKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5m
cmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xp
bnV4LXJpc2N2Cg==
