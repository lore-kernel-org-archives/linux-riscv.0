Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3609BC77B61
	for <linux-riscv@archiver.kernel.org>; Thu, 27 Apr 2023 05:07:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JN1poyaupbQW/D15isGTjDMjzKJRNMtZM7ZPLlAb6jo=; b=Z2MUnzSccDp3Xu
	CDqAPY67dnRmSRZxGwkwqs3H0S+CL2eVJ/wtpz/fb7EhOFMAwU8/gME88NpZ7PPRg4v2A8zPcAZjd
	dU5rIH6GQ59NJsGkz2VJ5e0XtM+HxxY/AzIbOKomNYJdJToKI18AwiESee+P41TgrgtkVRw33dbik
	BLdFjdKgTYM7TfHJuGDMZlzFBrAPsCFWuV+Cjyq1t7aBpm6hWNkIFWiTeS6a6rQFL663WsuF+rm1h
	smAJVxDF/vkxrnlSCDxl13OCfO4LDSZMou2lqnWUW98HVa/OaiyZFVbC0QyRDu+Tu7I2Bpm93RY8d
	09KZFoXlGxlvPxJE71Ig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1prtr3-005TH3-2P;
	Thu, 27 Apr 2023 05:07:41 +0000
Received: from fd01.gateway.ufhost.com ([61.152.239.71])
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1prtqz-005TEN-0l
	for linux-riscv@lists.infradead.org;
	Thu, 27 Apr 2023 05:07:40 +0000
Received: from EXMBX166.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX166", Issuer "EXMBX166" (not verified))
	by fd01.gateway.ufhost.com (Postfix) with ESMTP id E186C24E12B;
	Thu, 27 Apr 2023 13:06:54 +0800 (CST)
Received: from EXMBX168.cuchost.com (172.16.6.78) by EXMBX166.cuchost.com
 (172.16.6.76) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Thu, 27 Apr
 2023 13:06:54 +0800
Received: from [192.168.155.161] (202.188.176.82) by EXMBX168.cuchost.com
 (172.16.6.78) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Thu, 27 Apr
 2023 13:06:51 +0800
Message-ID: <65fde5d5-6d86-c94e-9985-231e81641386@starfivetech.com>
Date: Thu, 27 Apr 2023 13:06:49 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: Re: [PATCH v6 2/4] crypto: starfive - Add crypto engine support
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
CC: <davem@davemloft.net>, <devicetree@vger.kernel.org>,
	<herbert@gondor.apana.org.au>, <kernel@esmil.dk>,
	<krzysztof.kozlowski+dt@linaro.org>, <linux-crypto@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
	<palmer@dabbelt.com>, <robh+dt@kernel.org>
References: <20230426065848.842221-1-jiajie.ho@starfivetech.com>
 <20230426065848.842221-3-jiajie.ho@starfivetech.com>
 <c3faff36-3698-a137-f007-ff8bca6a2e88@wanadoo.fr>
Content-Language: en-US
From: Jia Jie Ho <jiajie.ho@starfivetech.com>
In-Reply-To: <c3faff36-3698-a137-f007-ff8bca6a2e88@wanadoo.fr>
X-Originating-IP: [202.188.176.82]
X-ClientProxiedBy: EXCAS066.cuchost.com (172.16.6.26) To EXMBX168.cuchost.com
 (172.16.6.78)
X-YovoleRuleAgent: yovoleflag
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230426_220737_693374_76FFCA71 
X-CRM114-Status: GOOD (  11.12  )
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

T24gMjYvNC8yMDIzIDM6NTYgcG0sIENocmlzdG9waGUgSkFJTExFVCB3cm90ZToKPiBMZSAyNi8w
NC8yMDIzIMOgIDA4OjU4LCBKaWEgSmllIEhvIGEgw6ljcml0wqA6Cj4+IEFkZGluZyBkZXZpY2Ug
cHJvYmUgYW5kIERNQSBpbml0IGZvciBTdGFyRml2ZSBjcnlwdG9ncmFwaGljIG1vZHVsZS4KPj4K
Pj4gQ28tZGV2ZWxvcGVkLWJ5OiBIdWFuIEZlbmcgPGh1YW4uZmVuZy1iT05yTTQ1S1dGT1htTVhq
SkJwV3FnQHB1YmxpYy5nbWFuZS5vcmc+Cj4+IFNpZ25lZC1vZmYtYnk6IEh1YW4gRmVuZyA8aHVh
bi5mZW5nLWJPTnJNNDVLV0ZPWG1NWGpKQnBXcWdAcHVibGljLmdtYW5lLm9yZz4KPj4gU2lnbmVk
LW9mZi1ieTogSmlhIEppZSBIbyA8amlhamllLmhvLWJPTnJNNDVLV0ZPWG1NWGpKQnBXcWdAcHVi
bGljLmdtYW5lLm9yZz4KPj4gLS0tCj4+IMKgIE1BSU5UQUlORVJTwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB8wqDCoCA3ICsKPj4gwqAgZHJpdmVy
cy9jcnlwdG8vS2NvbmZpZ8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB8wqDCoCAxICsK
Pj4gwqAgZHJpdmVycy9jcnlwdG8vTWFrZWZpbGXCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
IHzCoMKgIDEgKwo+PiDCoCBkcml2ZXJzL2NyeXB0by9zdGFyZml2ZS9LY29uZmlnwqDCoMKgwqDC
oMKgIHzCoCAxNyArKysKPj4gwqAgZHJpdmVycy9jcnlwdG8vc3RhcmZpdmUvTWFrZWZpbGXCoMKg
wqDCoMKgIHzCoMKgIDQgKwo+PiDCoCBkcml2ZXJzL2NyeXB0by9zdGFyZml2ZS9qaDcxMTAtY3J5
cC5jIHwgMTk5ICsrKysrKysrKysrKysrKysrKysrKysrKysrCj4+IMKgIGRyaXZlcnMvY3J5cHRv
L3N0YXJmaXZlL2poNzExMC1jcnlwLmggfMKgIDYzICsrKysrKysrCj4+IMKgIDcgZmlsZXMgY2hh
bmdlZCwgMjkyIGluc2VydGlvbnMoKykKPj4gwqAgY3JlYXRlIG1vZGUgMTAwNjQ0IGRyaXZlcnMv
Y3J5cHRvL3N0YXJmaXZlL0tjb25maWcKPj4gwqAgY3JlYXRlIG1vZGUgMTAwNjQ0IGRyaXZlcnMv
Y3J5cHRvL3N0YXJmaXZlL01ha2VmaWxlCj4+IMKgIGNyZWF0ZSBtb2RlIDEwMDY0NCBkcml2ZXJz
L2NyeXB0by9zdGFyZml2ZS9qaDcxMTAtY3J5cC5jCj4+IMKgIGNyZWF0ZSBtb2RlIDEwMDY0NCBk
cml2ZXJzL2NyeXB0by9zdGFyZml2ZS9qaDcxMTAtY3J5cC5oCj4+CgpbLi4uXQoKPj4gKwo+PiAr
c3RhdGljIGludCBzdGFyZml2ZV9kbWFfaW5pdChzdHJ1Y3Qgc3RhcmZpdmVfY3J5cF9kZXYgKmNy
eXApCj4+ICt7Cj4+ICvCoMKgwqAgZG1hX2NhcF9tYXNrX3QgbWFzazsKPj4gKwo+PiArwqDCoMKg
IGNyeXAtPnR4ID0gTlVMTDsKPj4gK8KgwqDCoCBjcnlwLT5yeCA9IE5VTEw7Cj4gCj4gSGFybWxl
c3MsIGJ1dCAnY3J5cHQnIGlzIGt6YWxsb2MoKSdlZCwgc28gdGhlc2UgZmllbGRzIGFyZSBhbHJl
YWR5IE5VTEwuCj4KCkhpIENocmlzdG9waGUsCkknbGwgcmVtb3ZlIHRoZXNlIGluIHRoZSBuZXh0
IHZlcnNpb24uCiAKPj4gKwo+PiArwqDCoMKgIGRtYV9jYXBfemVybyhtYXNrKTsKPj4gK8KgwqDC
oCBkbWFfY2FwX3NldChETUFfU0xBVkUsIG1hc2spOwo+PiArCj4+ICvCoMKgwqAgY3J5cC0+dHgg
PSBkbWFfcmVxdWVzdF9jaGFuKGNyeXAtPmRldiwgInR4Iik7Cj4+ICvCoMKgwqAgaWYgKElTX0VS
UihjcnlwLT50eCkpCj4+ICvCoMKgwqDCoMKgwqDCoCByZXR1cm4gZGV2X2Vycl9wcm9iZShjcnlw
LT5kZXYsIFBUUl9FUlIoY3J5cC0+dHgpLAo+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoCAiRXJyb3IgcmVxdWVzdGluZyB0eCBkbWEgY2hhbm5lbC5cbiIpOwo+PiAr
Cj4+ICvCoMKgwqAgY3J5cC0+cnggPSBkbWFfcmVxdWVzdF9jaGFuKGNyeXAtPmRldiwgInJ4Iik7
Cj4+ICvCoMKgwqAgaWYgKElTX0VSUihjcnlwLT5yeCkpIHsKPj4gK8KgwqDCoMKgwqDCoMKgIGRt
YV9yZWxlYXNlX2NoYW5uZWwoY3J5cC0+dHgpOwo+PiArwqDCoMKgwqDCoMKgwqAgcmV0dXJuIGRl
dl9lcnJfcHJvYmUoY3J5cC0+ZGV2LCBQVFJfRVJSKGNyeXAtPnJ4KSwKPj4gK8KgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgIkVycm9yIHJlcXVlc3RpbmcgcnggZG1hIGNo
YW5uZWwuXG4iKTsKPj4gK8KgwqDCoCB9Cj4+ICsKPj4gK8KgwqDCoCByZXR1cm4gMDsKPj4gK30K
Pj4gKwo+PiArc3RhdGljIHZvaWQgc3RhcmZpdmVfZG1hX2NsZWFudXAoc3RydWN0IHN0YXJmaXZl
X2NyeXBfZGV2ICpjcnlwKQo+PiArewo+PiArwqDCoMKgIGRtYV9yZWxlYXNlX2NoYW5uZWwoY3J5
cC0+dHgpOwo+PiArwqDCoMKgIGRtYV9yZWxlYXNlX2NoYW5uZWwoY3J5cC0+cngpOwo+PiArfQo+
PiArCj4+ICtzdGF0aWMgaW50IHN0YXJmaXZlX2NyeXBfcHJvYmUoc3RydWN0IHBsYXRmb3JtX2Rl
dmljZSAqcGRldikKPj4gK3sKClsuLi5dCgo+PiArCj4+ICvCoMKgwqAgcmV0ID0gY3J5cHRvX2Vu
Z2luZV9zdGFydChjcnlwLT5lbmdpbmUpOwo+PiArwqDCoMKgIGlmIChyZXQpCj4+ICvCoMKgwqDC
oMKgwqDCoCBnb3RvIGVycl9lbmdpbmVfc3RhcnQ7Cj4+ICsKPj4gK8KgwqDCoCByZXR1cm4gMDsK
Pj4gKwo+PiArZXJyX2VuZ2luZV9zdGFydDoKPj4gK8KgwqDCoCBjcnlwdG9fZW5naW5lX2V4aXQo
Y3J5cC0+ZW5naW5lKTsKPj4gK2Vycl9lbmdpbmU6Cj4+ICvCoMKgwqAgc3RhcmZpdmVfZG1hX2Ns
ZWFudXAoY3J5cCk7Cj4+ICtlcnJfZG1hX2luaXQ6Cj4+ICvCoMKgwqAgc3Bpbl9sb2NrKCZkZXZf
bGlzdC5sb2NrKTsKPj4gK8KgwqDCoCBsaXN0X2RlbCgmY3J5cC0+bGlzdCk7Cj4+ICvCoMKgwqAg
c3Bpbl91bmxvY2soJmRldl9saXN0LmxvY2spOwo+IAo+IEkgdGhpbmsgdGhhdCB0aGVyZSBzaG91
bGQgYmU6Cj4gwqDCoMKgwqBjbGtfZGlzYWJsZV91bnByZXBhcmUoY3J5cC0+aGNsayk7Cj4gwqDC
oMKgwqBjbGtfZGlzYWJsZV91bnByZXBhcmUoY3J5cC0+YWhiKTsKPiDCoMKgwqDCoHJlc2V0X2Nv
bnRyb2xfYXNzZXJ0KGNyeXAtPnJzdCk7Cj4gCj4gYXMgaW4gdGhlIHJlbW92ZSBmdW5jdGlvbi4K
PiAKCldpbGwgYWRkIHRoZXNlIGluIG5leHQgdmVyc2lvbi4KCj4+ICsKPj4gK8KgwqDCoCByZXR1
cm4gcmV0Owo+PiArfQo+PiArCj4+ICtzdGF0aWMgaW50IHN0YXJmaXZlX2NyeXBfcmVtb3ZlKHN0
cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpCj4+ICt7Cj4+ICvCoMKgwqAgc3RydWN0IHN0YXJm
aXZlX2NyeXBfZGV2ICpjcnlwID0gcGxhdGZvcm1fZ2V0X2RydmRhdGEocGRldik7Cj4+ICsKPj4g
K8KgwqDCoCBpZiAoIWNyeXApCj4+ICvCoMKgwqDCoMKgwqDCoCByZXR1cm4gLUVOT0RFVjsKPiAK
PiBJIGRvbid0IHRoaW5rIHRoYXQgdGhpcyBjYW4gaGFwcGVuLgo+IAoKSSdsbCB1cGRhdGUgdGhp
cyB0b28gYWxvbmcgd2l0aCB5b3VyIG90aGVyIGNvbW1lbnRzLgpUaGFua3MgZm9yIHRha2luZyB0
aW1lIHJldmlld2luZyB0aGlzIHBhdGNoIHNlcmllcy4KCkJlc3QgcmVnYXJkcywKSmlhIEppZQoK
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1y
aXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8v
bGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
