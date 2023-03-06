Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1191C61DA4
	for <linux-riscv@archiver.kernel.org>; Mon,  6 Mar 2023 03:07:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=C+3fhOYC0IBk7ahUnmcd5Pz2Up0C87QxUNNOa3gd6/s=; b=awb7/d4A2HLJw1
	iJTKSwqPHxjpd6m+EY/dgZ4LubAcqbTqBfOn0ewdHrZjL8SOk81CenAbDFZy+zgihJsh7O5cS+FQt
	gXI/iu0zEw+j8HL7roYViFXLPFGvd3kQwPMqdV1r+vWpxGPVFZcrAot37/xzCEstROdcezYQG4kVz
	FKe61/QKuYYkZdRGi1QhBLz3p37mL9mwna14oi0/6Eg/btqG4saHYa0ZRt0SXh5j/Hl+ebmMFMLQk
	pUW4mhJGyXVUJzFw8HW6AuFEMuWpyel0Nr5Am1L2Rh9JujsQL6oP7Seeze5H5/BlIfs0lxRXcHsHj
	1y7P9JPmz+JUKAsWvx6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZ1C4-00B4f1-AY; Mon, 06 Mar 2023 03:07:20 +0000
Received: from fd01.gateway.ufhost.com ([61.152.239.71])
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZ1Bz-00B4Wi-8x
	for linux-riscv@lists.infradead.org; Mon, 06 Mar 2023 03:07:18 +0000
Received: from EXMBX166.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX166", Issuer "EXMBX166" (not verified))
	by fd01.gateway.ufhost.com (Postfix) with ESMTP id 31FD724E362;
	Mon,  6 Mar 2023 11:06:51 +0800 (CST)
Received: from EXMBX162.cuchost.com (172.16.6.72) by EXMBX166.cuchost.com
 (172.16.6.76) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Mon, 6 Mar
 2023 11:06:51 +0800
Received: from [192.168.120.42] (171.223.208.138) by EXMBX162.cuchost.com
 (172.16.6.72) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Mon, 6 Mar
 2023 11:06:50 +0800
Message-ID: <bc79afab-17d1-8789-3325-8e6d62123dce@starfivetech.com>
Date: Mon, 6 Mar 2023 11:06:49 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v5 08/12] net: stmmac: starfive_dmac: Add phy interface
 settings
Content-Language: en-US
To: Emil Renner Berthing <emil.renner.berthing@canonical.com>
CC: <linux-riscv@lists.infradead.org>, <netdev@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>, "David S .
 Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, "Jakub
 Kicinski" <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Rob Herring
	<robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Emil Renner Berthing <kernel@esmil.dk>,
	Richard Cochran <richardcochran@gmail.com>, Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>, Peter Geis <pgwipeout@gmail.com>,
	Yanhong Wang <yanhong.wang@starfivetech.com>
References: <20230303085928.4535-1-samin.guo@starfivetech.com>
 <20230303085928.4535-9-samin.guo@starfivetech.com>
 <CAJM55Z-3CCY8xx81Qr9UqSSQ+gOer3XXJzOvnAe7yyESk23pQw@mail.gmail.com>
From: Guo Samin <samin.guo@starfivetech.com>
In-Reply-To: <CAJM55Z-3CCY8xx81Qr9UqSSQ+gOer3XXJzOvnAe7yyESk23pQw@mail.gmail.com>
X-Originating-IP: [171.223.208.138]
X-ClientProxiedBy: EXCAS066.cuchost.com (172.16.6.26) To EXMBX162.cuchost.com
 (172.16.6.72)
X-YovoleRuleAgent: yovoleflag
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230305_190715_607337_7AD631EC 
X-CRM114-Status: GOOD (  22.08  )
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

CgrlnKggMjAyMy8zLzQgMDo1MDo1NCwgRW1pbCBSZW5uZXIgQmVydGhpbmcg5YaZ6YGTOgo+IE9u
IEZyaSwgMyBNYXIgMjAyMyBhdCAxMDowMSwgU2FtaW4gR3VvIDxzYW1pbi5ndW9Ac3RhcmZpdmV0
ZWNoLmNvbT4gd3JvdGU6Cj4+Cj4+IGR3bWFjIHN1cHBvcnRzIG11bHRpcGxlIG1vZGVzcy4gV2hl
biB3b3JraW5nIHVuZGVyIHJtaWkgYW5kIHJnbWlpLAo+PiB5b3UgbmVlZCB0byBzZXQgZGlmZmVy
ZW50IHBoeSBpbnRlcmZhY2VzLgo+Pgo+PiBBY2NvcmRpbmcgdG8gdGhlIGR3bWFjIGRvY3VtZW50
LCB3aGVuIHdvcmtpbmcgaW4gcm1paSwgaXQgbmVlZHMgdG8gYmUKPj4gc2V0IHRvIDB4NCwgYW5k
IHJnbWlpIG5lZWRzIHRvIGJlIHNldCB0byAweDEuCj4+Cj4+IFRoZSBwaHkgaW50ZXJmYWNlIG5l
ZWRzIHRvIGJlIHNldCBpbiBzeXNjb24sIHRoZSBmb3JtYXQgaXMgYXMgZm9sbG93czoKPj4gc3Rh
cmZpdmUsc3lzY29uOiA8JnN5c2Nvbiwgb2Zmc2V0LCBtYXNrPgo+Pgo+PiBTaWduZWQtb2ZmLWJ5
OiBTYW1pbiBHdW8gPHNhbWluLmd1b0BzdGFyZml2ZXRlY2guY29tPgo+PiAtLS0KPj4gIC4uLi9l
dGhlcm5ldC9zdG1pY3JvL3N0bW1hYy9kd21hYy1zdGFyZml2ZS5jICB8IDQ2ICsrKysrKysrKysr
KysrKysrKysKPj4gIDEgZmlsZSBjaGFuZ2VkLCA0NiBpbnNlcnRpb25zKCspCj4+Cj4+IGRpZmYg
LS1naXQgYS9kcml2ZXJzL25ldC9ldGhlcm5ldC9zdG1pY3JvL3N0bW1hYy9kd21hYy1zdGFyZml2
ZS5jIGIvZHJpdmVycy9uZXQvZXRoZXJuZXQvc3RtaWNyby9zdG1tYWMvZHdtYWMtc3RhcmZpdmUu
Ywo+PiBpbmRleCA1NjYzNzgzMDZmNjcuLjQwZmRkNzAzNjEyNyAxMDA2NDQKPj4gLS0tIGEvZHJp
dmVycy9uZXQvZXRoZXJuZXQvc3RtaWNyby9zdG1tYWMvZHdtYWMtc3RhcmZpdmUuYwo+PiArKysg
Yi9kcml2ZXJzL25ldC9ldGhlcm5ldC9zdG1pY3JvL3N0bW1hYy9kd21hYy1zdGFyZml2ZS5jCj4+
IEBAIC03LDEwICs3LDE1IEBACj4+ICAgKgo+PiAgICovCj4+Cj4+ICsjaW5jbHVkZSA8bGludXgv
bWZkL3N5c2Nvbi5oPgo+PiAgI2luY2x1ZGUgPGxpbnV4L29mX2RldmljZS5oPgo+PiArI2luY2x1
ZGUgPGxpbnV4L3JlZ21hcC5oPgo+Pgo+PiAgI2luY2x1ZGUgInN0bW1hY19wbGF0Zm9ybS5oIgo+
Pgo+PiArI2RlZmluZSBNQUNQSFlDX1BIWV9JTkZUX1JNSUkgIDB4NAo+PiArI2RlZmluZSBNQUNQ
SFlDX1BIWV9JTkZUX1JHTUlJIDB4MQo+IAo+IFBsZWFzZSBwcmVmaXggdGhlc2Ugd2l0aCBzb21l
dGhpbmcgbGlrZSBTVEFSRklWRV9EV01BQ18KPgpIaSwgRW1pbCwgVGhlc2UgZGVmaW5pdGlvbnMg
Y29tZSBmcm9tIHRoZSBkYXRhc2hlZXQgb2YgZHdtYWMuIEhvd2V2ZXIsIGFkZCBTVEFSRFJJVkVf
IERXTUFDIGlzIGEgZ29vZCBpZGVhLiBJIHdpbGwgZml4IGl0LHRoYW5rcy4KPj4gIHN0cnVjdCBz
dGFyZml2ZV9kd21hYyB7Cj4+ICAgICAgICAgc3RydWN0IGRldmljZSAqZGV2Owo+PiAgICAgICAg
IHN0cnVjdCBjbGsgKmNsa190eDsKPj4gQEAgLTUzLDYgKzU4LDQ2IEBAIHN0YXRpYyB2b2lkIHN0
YXJmaXZlX2V0aF9maXhfbWFjX3NwZWVkKHZvaWQgKnByaXYsIHVuc2lnbmVkIGludCBzcGVlZCkK
Pj4gICAgICAgICAgICAgICAgIGRldl9lcnIoZHdtYWMtPmRldiwgImZhaWxlZCB0byBzZXQgdHgg
cmF0ZSAlbHVcbiIsIHJhdGUpOwo+PiAgfQo+Pgo+PiArc3RhdGljIGludCBzdGFyZml2ZV9kd21h
Y19zZXRfbW9kZShzdHJ1Y3QgcGxhdF9zdG1tYWNlbmV0X2RhdGEgKnBsYXRfZGF0KQo+PiArewo+
PiArICAgICAgIHN0cnVjdCBzdGFyZml2ZV9kd21hYyAqZHdtYWMgPSBwbGF0X2RhdC0+YnNwX3By
aXY7Cj4+ICsgICAgICAgc3RydWN0IG9mX3BoYW5kbGVfYXJncyBhcmdzOwo+PiArICAgICAgIHN0
cnVjdCByZWdtYXAgKnJlZ21hcDsKPj4gKyAgICAgICB1bnNpZ25lZCBpbnQgcmVnLCBtYXNrLCBt
b2RlOwo+PiArICAgICAgIGludCBlcnI7Cj4+ICsKPj4gKyAgICAgICBzd2l0Y2ggKHBsYXRfZGF0
LT5pbnRlcmZhY2UpIHsKPj4gKyAgICAgICBjYXNlIFBIWV9JTlRFUkZBQ0VfTU9ERV9STUlJOgo+
PiArICAgICAgICAgICAgICAgbW9kZSA9IE1BQ1BIWUNfUEhZX0lORlRfUk1JSTsKPj4gKyAgICAg
ICAgICAgICAgIGJyZWFrOwo+PiArCj4+ICsgICAgICAgY2FzZSBQSFlfSU5URVJGQUNFX01PREVf
UkdNSUk6Cj4+ICsgICAgICAgY2FzZSBQSFlfSU5URVJGQUNFX01PREVfUkdNSUlfSUQ6Cj4+ICsg
ICAgICAgICAgICAgICBtb2RlID0gTUFDUEhZQ19QSFlfSU5GVF9SR01JSTsKPj4gKyAgICAgICAg
ICAgICAgIGJyZWFrOwo+PiArCj4+ICsgICAgICAgZGVmYXVsdDoKPj4gKyAgICAgICAgICAgICAg
IGRldl9lcnIoZHdtYWMtPmRldiwgIlVuc3VwcG9ydGVkIGludGVyZmFjZSAlZFxuIiwKPj4gKyAg
ICAgICAgICAgICAgICAgICAgICAgcGxhdF9kYXQtPmludGVyZmFjZSk7Cj4+ICsgICAgICAgfQo+
PiArCj4+ICsgICAgICAgZXJyID0gb2ZfcGFyc2VfcGhhbmRsZV93aXRoX2ZpeGVkX2FyZ3MoZHdt
YWMtPmRldi0+b2Zfbm9kZSwKPj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAic3RhcmZpdmUsc3lzY29uIiwgMiwgMCwgJmFyZ3MpOwo+PiArICAgICAgIGlm
IChlcnIpIHsKPj4gKyAgICAgICAgICAgICAgIGRldl9kYmcoZHdtYWMtPmRldiwgInN5c2NvbiBy
ZWcgbm90IGZvdW5kXG4iKTsKPj4gKyAgICAgICAgICAgICAgIHJldHVybiAtRUlOVkFMOwo+PiAr
ICAgICAgIH0KPj4gKwo+PiArICAgICAgIHJlZyA9IGFyZ3MuYXJnc1swXTsKPj4gKyAgICAgICBt
YXNrID0gYXJncy5hcmdzWzFdOwo+PiArICAgICAgIHJlZ21hcCA9IHN5c2Nvbl9ub2RlX3RvX3Jl
Z21hcChhcmdzLm5wKTsKPj4gKyAgICAgICBvZl9ub2RlX3B1dChhcmdzLm5wKTsKPiAKPiBJIHRo
aW5rIHRoZSBhYm92ZSBpcyBiYXNpY2FsbHkKPiB1bnNpZ25lZCBpbnQgYXJnc1syXTsKPiBzeXNj
b25fcmVnbWFwX2xvb2t1cF9ieV9waGFuZGxlX2FyZ3MoZHdtYWMtPmRldl9vZl9ub2RlLAo+ICJz
dGFyZml2ZSxzeXNjb24iLCAyLCBhcmdzKTsKPiAKPiAuLmJ1dCBhcyBBbmRyZXcgcG9pbnRzIG91
dCBhbm90aGVyIHNvbHV0aW9uIGlzIHRvIHVzZSBwbGF0Zm9ybSBtYXRjaAo+IGRhdGEgZm9yIHRo
aXMuIEVnLgo+IAo+IHN0YXRpYyBjb25zdCBzdHJ1Y3Qgc3RhcmZpdmVfZHdtYWNfbWF0Y2hfZGF0
YSBzdGFyZml2ZV9kd21hY19qaDcxMTBfZGF0YSB7Cj4gICAucGh5X2ludGVyZmFjZV9vZmZzZXQg
PSAweGMsCj4gICAucGh5X2ludGVyZmFjZV9tYXNrID0gMHgxYzAwMDAsCj4gfTsKPiAKPiBzdGF0
aWMgY29uc3Qgc3RydWN0IG9mX2RldmljZV9pZCBzdGFyZml2ZV9kd21hY19tYXRjaFtdID0gewo+
ICAgeyAuY29tcGF0aWJsZSA9ICJzdGFyZml2ZSxqaDcxMTAtZHdtYWMiLCAuZGF0YSA9Cj4gJnN0
YXJmaXZlX2R3bWFjX2poNzExMF9kYXRhIH0sCj4gICB7IC8qIHNlbnRpbmVsICovIH0KPiB9Owo+
IAo+IGFuZCBpbiB0aGUgcHJvYmUgZnVuY3Rpb246Cj4gCkhpIEVtaWwsIFllc++8jHRoaXMgaXMg
dXN1YWxseSBhIGdvb2Qgc29sdXRpb24sIGFuZCBJIGhhdmUgY29uc2lkZXJlZCB0aGlzIHBsYW4g
YmVmb3JlLgpIb3dldmVyLCBnbWFjMCBvZiBqaDcxMTAgaXMgZGlmZmVyZW50IGZyb20gdGhlIHJl
Zy9tYXNrIG9mIGdtYWMxLgpZb3UgY2FuIGZpbmQgaXQgaW4gcGF0Y2gtOToKCiZnbWFjMCB7Cglz
dGFyZml2ZSxzeXNjb24gPSA8JmFvbl9zeXNjb24gMHhjIDB4MWMwMDAwPjsKfTsKCiZnbWFjMSB7
CglzdGFyZml2ZSxzeXNjb24gPSA8JnN5c19zeXNjb24gMHg5MCAweDFjPjsKfTsKCkluIHRoaXMg
Y2FzZSwgdXNpbmcgbWF0Y2hfZGF0YSBvZiBzdGFyZml2ZSxqaDcxMTAtZHdtYSBkb2VzIG5vdCBz
ZWVtIHRvIGJlIGNvbXBhdGlibGUuCgo+IHN0cnVjdCBzdGFyZml2ZV9kd21hY19tYXRjaF9kYXRh
ICpwZGF0YSA9IGRldmljZV9nZXRfbWF0Y2hfZGF0YSgmcGRldi0+ZGV2KTsKPiAKPj4gKyAgICAg
ICBpZiAoSVNfRVJSKHJlZ21hcCkpCj4+ICsgICAgICAgICAgICAgICByZXR1cm4gUFRSX0VSUihy
ZWdtYXApOwo+PiArCj4+ICsgICAgICAgcmV0dXJuIHJlZ21hcF91cGRhdGVfYml0cyhyZWdtYXAs
IHJlZywgbWFzaywgbW9kZSA8PCBfX2ZmcyhtYXNrKSk7Cj4+ICt9Cj4+ICsKPj4gIHN0YXRpYyBp
bnQgc3RhcmZpdmVfZHdtYWNfcHJvYmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikKPj4g
IHsKPj4gICAgICAgICBzdHJ1Y3QgcGxhdF9zdG1tYWNlbmV0X2RhdGEgKnBsYXRfZGF0Owo+PiBA
QCAtOTMsNiArMTM4LDcgQEAgc3RhdGljIGludCBzdGFyZml2ZV9kd21hY19wcm9iZShzdHJ1Y3Qg
cGxhdGZvcm1fZGV2aWNlICpwZGV2KQo+PiAgICAgICAgIHBsYXRfZGF0LT5ic3BfcHJpdiA9IGR3
bWFjOwo+PiAgICAgICAgIHBsYXRfZGF0LT5kbWFfY2ZnLT5kY2hlID0gdHJ1ZTsKPj4KPj4gKyAg
ICAgICBzdGFyZml2ZV9kd21hY19zZXRfbW9kZShwbGF0X2RhdCk7Cj4gCj4gVGhlIGZ1bmN0aW9u
IHJldHVybnMgZXJyb3JzIGluIGFuIGludCwgYnV0IHlvdSBuZXZlciBjaGVjayBpdCA6KAo+IApU
aGFuayB5b3UgZm9yIHBvaW50aW5nIG91dCB0aGF0IGl0IHdpbGwgYmUgYWRkZWQgaW4gdGhlIG5l
eHQgdmVyc2lvbi4KPj4gICAgICAgICBlcnIgPSBzdG1tYWNfZHZyX3Byb2JlKCZwZGV2LT5kZXYs
IHBsYXRfZGF0LCAmc3RtbWFjX3Jlcyk7Cj4+ICAgICAgICAgaWYgKGVycikgewo+PiAgICAgICAg
ICAgICAgICAgc3RtbWFjX3JlbW92ZV9jb25maWdfZHQocGRldiwgcGxhdF9kYXQpOwoKCkJlc3Qg
cmVnYXJkcywKU2FtaW4KCj4+IC0tCj4+IDIuMTcuMQo+Pgo+Pgo+PiBfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+PiBsaW51eC1yaXNjdiBtYWlsaW5nIGxp
c3QKPj4gbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwo+PiBodHRwOi8vbGlzdHMuaW5m
cmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2CgotLSAKQmVzdCByZWdhcmRz
LApTYW1pbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
bGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcK
aHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
