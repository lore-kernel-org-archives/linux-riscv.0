Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0ABDC41513
	for <linux-riscv@archiver.kernel.org>; Fri,  4 Aug 2023 09:25:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Zql9zMM7Mt9ZbgZFaDi2zf5wuCN107tYE6ptA/wryW8=; b=uJC+4QPPui29A3
	mFh+ER4aqXQjfFCzivEh9L07bgxfDNoLFdMnY8owpHUWKb01eLtL0pk02+xj1s/E0quCDmx7VnM0T
	y+ljKGW+ib8Nc29tXwlE+tviWEjDxWsKeuG5WLe8+JU5IDcIe2CLtq8wBYX4ejBx2rxGFf4Dp7p/G
	WpliDh+QekdvfDYcR1dmm+YS0JY6ALwkyuEZTurL4o0dWnuAU11EWzUWy07bIQnJW2syYp0/Kv7k+
	f+CrlNWvjAQiKieu5bEGEd97ManQsOMCKovYdE+jL4txQtGGDumB3L/yAab3v+gJJhnIqIgDUKzPC
	Ty3byy2wtYZ2SpFRB3xw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qRr3s-00C0Ve-1K;
	Fri, 04 Aug 2023 09:25:32 +0000
Received: from ex01.ufhost.com ([61.152.239.75])
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qRr3o-00C0QM-2n
	for linux-riscv@lists.infradead.org;
	Fri, 04 Aug 2023 09:25:31 +0000
Received: from EXMBX166.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX166", Issuer "EXMBX166" (not verified))
	by ex01.ufhost.com (Postfix) with ESMTP id DB05324E2E3;
	Fri,  4 Aug 2023 17:24:38 +0800 (CST)
Received: from EXMBX061.cuchost.com (172.16.6.61) by EXMBX166.cuchost.com
 (172.16.6.76) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Fri, 4 Aug
 2023 17:24:39 +0800
Received: from [192.168.125.128] (183.27.98.54) by EXMBX061.cuchost.com
 (172.16.6.61) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Fri, 4 Aug
 2023 17:24:37 +0800
Message-ID: <00553fc1-a033-5d4b-e8db-18f265f08492@starfivetech.com>
Date: Fri, 4 Aug 2023 17:20:09 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH v1 3/5] ASoC: dwc: i2s: Add StarFive JH7110 SoC support
Content-Language: en-US
To: Maxim Kochetkov <fido_max@inbox.ru>, Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>, "Takashi
 Iwai" <tiwai@suse.com>, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Conor Dooley
	<conor.dooley@microchip.com>, Emil Renner Berthing
	<emil.renner.berthing@canonical.com>
CC: Jose Abreu <joabreu@synopsys.com>, Paul Walmsley
	<paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
	<aou@eecs.berkeley.edu>, Walker Chen <walker.chen@starfivetech.com>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<alsa-devel@alsa-project.org>, <linux-riscv@lists.infradead.org>
References: <20230802084301.134122-1-xingyu.wu@starfivetech.com>
 <20230802084301.134122-4-xingyu.wu@starfivetech.com>
 <fdd771cc-9354-208b-e8be-50d2ec6a40c9@inbox.ru>
From: Xingyu Wu <xingyu.wu@starfivetech.com>
In-Reply-To: <fdd771cc-9354-208b-e8be-50d2ec6a40c9@inbox.ru>
X-Originating-IP: [183.27.98.54]
X-ClientProxiedBy: EXCAS066.cuchost.com (172.16.6.26) To EXMBX061.cuchost.com
 (172.16.6.61)
X-YovoleRuleAgent: yovoleflag
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230804_022529_247339_1766A93A 
X-CRM114-Status: GOOD (  11.89  )
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

T24gMjAyMy84LzMgMTM6MTYsIE1heGltIEtvY2hldGtvdiB3cm90ZToKPiAKPiAKPiBPbiAwMi4w
OC4yMDIzIDExOjQyLCBYaW5neXUgV3Ugd3JvdGU6Cj4gCj4+IGRpZmYgLS1naXQgYS9zb3VuZC9z
b2MvZHdjL2R3Yy1pMnMuYyBiL3NvdW5kL3NvYy9kd2MvZHdjLWkycy5jCj4+IGluZGV4IGMwNzYw
OTBhOTg2NC4uNGRmYmQ4ZGRiY2Y1IDEwMDY0NAo+PiAtLS0gYS9zb3VuZC9zb2MvZHdjL2R3Yy1p
MnMuYwo+PiArKysgYi9zb3VuZC9zb2MvZHdjL2R3Yy1pMnMuYwo+PiBAQCAtMTYsNiArMTYsNyBA
QAo+PiDCoCAjaW5jbHVkZSA8bGludXgvaW5pdC5oPgo+PiDCoCAjaW5jbHVkZSA8bGludXgvaW8u
aD4KPj4gwqAgI2luY2x1ZGUgPGxpbnV4L2ludGVycnVwdC5oPgo+PiArI2luY2x1ZGUgPGxpbnV4
L21mZC9zeXNjb24uaD4KPj4gwqAgI2luY2x1ZGUgPGxpbnV4L21vZHVsZS5oPgo+PiDCoCAjaW5j
bHVkZSA8bGludXgvcmVzZXQuaD4KPj4gwqAgI2luY2x1ZGUgPGxpbnV4L3NsYWIuaD4KPj4gQEAg
LTE5OCw3ICsxOTksNyBAQCBzdGF0aWMgdm9pZCBpMnNfc3RhcnQoc3RydWN0IGR3X2kyc19kZXYg
KmRldiwKPj4gwqDCoMKgwqDCoCBlbHNlCj4+IMKgwqDCoMKgwqDCoMKgwqDCoCBpMnNfd3JpdGVf
cmVnKGRldi0+aTJzX2Jhc2UsIElSRVIsIDEpOwo+PiDCoCAtwqDCoMKgIGlmIChkZXYtPnVzZV9w
aW8pCj4+ICvCoMKgwqAgaWYgKGRldi0+dXNlX3BpbyB8fCBkZXYtPmlzX2poNzExMCkKPj4gwqDC
oMKgwqDCoMKgwqDCoMKgIGkyc19lbmFibGVfaXJxcyhkZXYsIHN1YnN0cmVhbS0+c3RyZWFtLCBj
b25maWctPmNoYW5fbnIpOwo+PiDCoMKgwqDCoMKgIGVsc2UKPj4gwqDCoMKgwqDCoMKgwqDCoMKg
IGkyc19lbmFibGVfZG1hKGRldiwgc3Vic3RyZWFtLT5zdHJlYW0pOwo+PiBAQCAtMjE2LDcgKzIx
Nyw3IEBAIHN0YXRpYyB2b2lkIGkyc19zdG9wKHN0cnVjdCBkd19pMnNfZGV2ICpkZXYsCj4+IMKg
wqDCoMKgwqAgZWxzZQo+PiDCoMKgwqDCoMKgwqDCoMKgwqAgaTJzX3dyaXRlX3JlZyhkZXYtPmky
c19iYXNlLCBJUkVSLCAwKTsKPj4gwqAgLcKgwqDCoCBpZiAoZGV2LT51c2VfcGlvKQo+PiArwqDC
oMKgIGlmIChkZXYtPnVzZV9waW8gfHwgZGV2LT5pc19qaDcxMTApCj4+IMKgwqDCoMKgwqDCoMKg
wqDCoCBpMnNfZGlzYWJsZV9pcnFzKGRldiwgc3Vic3RyZWFtLT5zdHJlYW0sIDgpOwo+PiDCoMKg
wqDCoMKgIGVsc2UKPj4gwqDCoMKgwqDCoMKgwqDCoMKgIGkyc19kaXNhYmxlX2RtYShkZXYsIHN1
YnN0cmVhbS0+c3RyZWFtKTsKPiAKPiBXaHkgZG8gd2UgbmVlZCB0byBlbmFibGUgaW50ZXJydXB0
cyBmb3IgRE1BIG1vZGU/CgpUaGlzIGlzIHNwZWNpYWwgbWVjaGFuaXNtIGFib3V0IGRhdGEgdHJh
bnNtaXNzaW9uIGJ5IERNQSBjb250cm9sbGVyIG9uIHRoZQpTdGFyRml2ZSBKSDcxMTAgU29DLgpU
aGUgRE1BIGNvbnRyb2xsZXIgbmVlZHMgdG8gbWFrZSBhIGhhbmRzaGFrZSB3aXRoIEkyUyBpbnRl
cnJ1cHQgYW5kIGNhbm5vdAptb3ZlIHRoZSBhdWRpbyBkYXRhIHdpdGhvdXQgZW5hYmxpbmcgdGhl
IEkyUyBpbnRlcnJ1cHQuClNvIEkgc2hvdWxkIGtlZXAgdGhlIEkyUyBpbnRlcnJ1cHQgZW5hYmxl
ZCBpbiBib3RoIGludGVycnVwdCBvciBETUEgbW9kZS4KCj4gCj4+IEBAIC0yMjcsNiArMjI4LDIx
IEBAIHN0YXRpYyB2b2lkIGkyc19zdG9wKHN0cnVjdCBkd19pMnNfZGV2ICpkZXYsCj4+IMKgwqDC
oMKgwqAgfQo+PiDCoCB9Cj4+IMKgICtzdGF0aWMgaW50IGR3X2kyc19zdGFydHVwKHN0cnVjdCBz
bmRfcGNtX3N1YnN0cmVhbSAqc3Vic3RyZWFtLAo+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqAgc3RydWN0IHNuZF9zb2NfZGFpICpjcHVfZGFpKQo+PiArewo+PiArwqDCoMKgIHN0cnVjdCBk
d19pMnNfZGV2ICpkZXYgPSBzbmRfc29jX2RhaV9nZXRfZHJ2ZGF0YShjcHVfZGFpKTsKPj4gKwo+
PiArwqDCoMKgIGlmIChkZXYtPmlzX2poNzExMCkgewo+PiArwqDCoMKgwqDCoMKgwqAgc3RydWN0
IHNuZF9zb2NfcGNtX3J1bnRpbWUgKnJ0ZCA9IGFzb2Nfc3Vic3RyZWFtX3RvX3J0ZChzdWJzdHJl
YW0pOwo+PiArwqDCoMKgwqDCoMKgwqAgc3RydWN0IHNuZF9zb2NfZGFpX2xpbmsgKmRhaV9saW5r
ID0gcnRkLT5kYWlfbGluazsKPj4gKwo+PiArwqDCoMKgwqDCoMKgwqAgZGFpX2xpbmstPnRyaWdn
ZXJfc3RvcCA9IFNORF9TT0NfVFJJR0dFUl9PUkRFUl9MREM7Cj4+ICvCoMKgwqAgfQo+PiArCj4+
ICvCoMKgwqAgcmV0dXJuIDA7Cj4+ICt9Cj4+ICsKPj4gwqAgc3RhdGljIHZvaWQgZHdfaTJzX2Nv
bmZpZyhzdHJ1Y3QgZHdfaTJzX2RldiAqZGV2LCBpbnQgc3RyZWFtKQo+PiDCoCB7Cj4+IMKgwqDC
oMKgwqAgdTMyIGNoX3JlZzsKPj4gQEAgLTI2Nyw2ICsyODMsMTEgQEAgc3RhdGljIGludCBkd19p
MnNfaHdfcGFyYW1zKHN0cnVjdCBzbmRfcGNtX3N1YnN0cmVhbSAqc3Vic3RyZWFtLAo+PiDCoMKg
wqDCoMKgwqDCoMKgwqAgY29uZmlnLT5kYXRhX3dpZHRoID0gMTY7Cj4+IMKgwqDCoMKgwqDCoMKg
wqDCoCBkZXYtPmNjciA9IDB4MDA7Cj4+IMKgwqDCoMKgwqDCoMKgwqDCoCBkZXYtPnhmZXJfcmVz
b2x1dGlvbiA9IDB4MDI7Cj4+ICvCoMKgwqDCoMKgwqDCoCAvKiBTZXQgRE1BIGJ1c3dpZHRoIG9u
IEpINzExMCAqLwo+PiArwqDCoMKgwqDCoMKgwqAgaWYgKGRldi0+aXNfamg3MTEwKSB7Cj4+ICvC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgIGRldi0+cGxheV9kbWFfZGF0YS5kdC5hZGRyX3dpZHRoID0g
RE1BX1NMQVZFX0JVU1dJRFRIXzJfQllURVM7Cj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGRl
di0+Y2FwdHVyZV9kbWFfZGF0YS5kdC5hZGRyX3dpZHRoID0gRE1BX1NMQVZFX0JVU1dJRFRIXzJf
QllURVM7Cj4+ICvCoMKgwqDCoMKgwqDCoCB9Cj4gCj4gTm90IG5lZWRlZC4KPiBTZWU6IGh0dHBz
Oi8vZ2l0Lmtlcm5lbC5vcmcvcHViL3NjbS9saW51eC9rZXJuZWwvZ2l0L25leHQvbGludXgtbmV4
dC5naXQvY29tbWl0Lz9oPW5leHQtMjAyMzA4MDImaWQ9NmY4MDE5N2Y0MDUxNTg1MzgxNGQwZjIy
ZTUyMDlkNTNmODk5YWI5MQo+IFByb3BlciBidXMgd2lkdGggY2FsY3VsYXRpb25zIGlzIHBlcmZv
cm1lZCBieSBzbmRfaHdwYXJhbXNfdG9fZG1hX3NsYXZlX2NvbmZpZygpCgpXaWxsIHVzZSB0aGlz
IG9wcyBpbnN0ZWFkLgoKPiAKPj4gwqDCoMKgwqDCoMKgwqDCoMKgIGJyZWFrOwo+PiDCoCDCoMKg
wqDCoMKgIGNhc2UgU05EUlZfUENNX0ZPUk1BVF9TMjRfTEU6Cj4+IEBAIC0yNzksNiArMzAwLDEx
IEBAIHN0YXRpYyBpbnQgZHdfaTJzX2h3X3BhcmFtcyhzdHJ1Y3Qgc25kX3BjbV9zdWJzdHJlYW0g
KnN1YnN0cmVhbSwKPj4gwqDCoMKgwqDCoMKgwqDCoMKgIGNvbmZpZy0+ZGF0YV93aWR0aCA9IDMy
Owo+PiDCoMKgwqDCoMKgwqDCoMKgwqAgZGV2LT5jY3IgPSAweDEwOwo+PiDCoMKgwqDCoMKgwqDC
oMKgwqAgZGV2LT54ZmVyX3Jlc29sdXRpb24gPSAweDA1Owo+PiArwqDCoMKgwqDCoMKgwqAgLyog
U2V0IERNQSBidXN3aWR0aCBvbiBKSDcxMTAgKi8KPj4gK8KgwqDCoMKgwqDCoMKgIGlmIChkZXYt
PmlzX2poNzExMCkgewo+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBkZXYtPnBsYXlfZG1hX2Rh
dGEuZHQuYWRkcl93aWR0aCA9IERNQV9TTEFWRV9CVVNXSURUSF80X0JZVEVTOwo+PiArwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoCBkZXYtPmNhcHR1cmVfZG1hX2RhdGEuZHQuYWRkcl93aWR0aCA9IERN
QV9TTEFWRV9CVVNXSURUSF80X0JZVEVTOwo+PiArwqDCoMKgwqDCoMKgwqAgfQo+IAo+IE5vdCBu
ZWVkZWQKV2lsbCBkcm9wLgoKPiAKClRoYW5rcywKWGluZ3l1IFd1CgoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0
CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5v
cmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
