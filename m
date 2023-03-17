Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FCC6C6FD1D
	for <linux-riscv@archiver.kernel.org>; Fri, 17 Mar 2023 10:59:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Usi3aTCdC9O4NxgXe7+2XW2E9XBf9ySiNHcpwxJvSCk=; b=sRsVpQYbLq6eYj
	CHiVgHs+MQXFKJA6xxBwIIyyAz4ozZJ3B6DtnGLeHBNR6i4KD8crgVqrMehZ2AoJCSALeO54NyL9p
	zDiNw0DCXGE1rOWsGOLnEgHN6afk/oVsKAijsdBaI2BERHfmQU/9zXrKPmUkvqiXkdQiV46fwXmYd
	PTd9swd1nuZhSBDM81o/sBst0qLu7jruoqlVwc9zezgIhdwfw2nc4gV41MfLce/eBlDAXdOKYOYGB
	gN/1cXqTD1yQaWieAkbjoyMtNj8y8QnGciNeD8FWcfkrAuMViFL+tmz/skCmeFFY+FtK2AvbVNw9M
	OLaQOoV+QWVEWlsqrClA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pd7oG-001yZi-19;
	Fri, 17 Mar 2023 10:59:44 +0000
Received: from ex01.ufhost.com ([61.152.239.75])
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pd7oC-001yXi-25;
	Fri, 17 Mar 2023 10:59:43 +0000
Received: from EXMBX165.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX165", Issuer "EXMBX165" (not verified))
	by ex01.ufhost.com (Postfix) with ESMTP id 164C624DBC2;
	Fri, 17 Mar 2023 18:59:27 +0800 (CST)
Received: from EXMBX071.cuchost.com (172.16.6.81) by EXMBX165.cuchost.com
 (172.16.6.75) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Fri, 17 Mar
 2023 18:59:27 +0800
Received: from [192.168.125.108] (113.72.145.194) by EXMBX071.cuchost.com
 (172.16.6.81) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Fri, 17 Mar
 2023 18:59:26 +0800
Message-ID: <11873190-a8ff-e93d-5c08-8a24903c170d@starfivetech.com>
Date: Fri, 17 Mar 2023 18:59:25 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v3 5/5] dts: usb: add StarFive JH7110 USB dts
 configuration.
Content-Language: en-US
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Emil Renner Berthing
	<emil.renner.berthing@canonical.com>, Conor Dooley <conor@kernel.org>, "Vinod
 Koul" <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>, "Rob
 Herring" <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Pawel Laszczak <pawell@cadence.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Peter Chen
	<peter.chen@kernel.org>, Roger Quadros <rogerq@kernel.org>, Philipp Zabel
	<p.zabel@pengutronix.de>
CC: <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-phy@lists.infradead.org>, <linux-usb@vger.kernel.org>,
	<linux-riscv@lists.infradead.org>, Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>
References: <20230315104411.73614-1-minda.chen@starfivetech.com>
 <20230315104411.73614-6-minda.chen@starfivetech.com>
 <79593668-6ded-7290-f39b-e226d30e6e95@linaro.org>
From: Minda Chen <minda.chen@starfivetech.com>
In-Reply-To: <79593668-6ded-7290-f39b-e226d30e6e95@linaro.org>
X-Originating-IP: [113.72.145.194]
X-ClientProxiedBy: EXCAS066.cuchost.com (172.16.6.26) To EXMBX071.cuchost.com
 (172.16.6.81)
X-YovoleRuleAgent: yovoleflag
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230317_035940_969276_8B180063 
X-CRM114-Status: GOOD (  11.60  )
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

CgpPbiAyMDIzLzMvMTcgMTY6NDQsIEtyenlzenRvZiBLb3psb3dza2kgd3JvdGU6Cj4gT24gMTUv
MDMvMjAyMyAxMTo0NCwgTWluZGEgQ2hlbiB3cm90ZToKPj4gVVNCIEdsdWUgbGF5ZXIgYW5kIENh
ZGVuY2UgVVNCIHN1Ym5vZGUgY29uZmlndXJhdGlvbiwKPj4gYWxzbyBpbmNsdWRlcyBVU0IgYW5k
IFBDSWUgcGh5IGR0cyBjb25maWd1cmF0aW9uLgo+PiAKPj4gU2lnbmVkLW9mZi1ieTogTWluZGEg
Q2hlbiA8bWluZGEuY2hlbkBzdGFyZml2ZXRlY2guY29tPgo+IAo+IFVzZSBzdWJqZWN0IHByZWZp
eGVzIG1hdGNoaW5nIHRoZSBzdWJzeXN0ZW0gKHdoaWNoIHlvdSBjYW4gZ2V0IGZvcgo+IGV4YW1w
bGUgd2l0aCBgZ2l0IGxvZyAtLW9uZWxpbmUgLS0gRElSRUNUT1JZX09SX0ZJTEVgIG9uIHRoZSBk
aXJlY3RvcnkKPiB5b3VyIHBhdGNoIGlzIHRvdWNoaW5nKS4KPm9rCj4+IC0tLQo+PiAgLi4uL2po
NzExMC1zdGFyZml2ZS12aXNpb25maXZlLTIuZHRzaSAgICAgICAgIHwgIDcgKysrCj4+ICBhcmNo
L3Jpc2N2L2Jvb3QvZHRzL3N0YXJmaXZlL2poNzExMC5kdHNpICAgICAgfCA1NCArKysrKysrKysr
KysrKysrKysrCj4+ICAyIGZpbGVzIGNoYW5nZWQsIDYxIGluc2VydGlvbnMoKykKPj4gCj4+IGRp
ZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2Jvb3QvZHRzL3N0YXJmaXZlL2poNzExMC1zdGFyZml2ZS12
aXNpb25maXZlLTIuZHRzaSBiL2FyY2gvcmlzY3YvYm9vdC9kdHMvc3RhcmZpdmUvamg3MTEwLXN0
YXJmaXZlLXZpc2lvbmZpdmUtMi5kdHNpCj4+IGluZGV4IGExMzJkZWJiOWI1My4uYzY0NDc2YWVi
YzFhIDEwMDY0NAo+PiAtLS0gYS9hcmNoL3Jpc2N2L2Jvb3QvZHRzL3N0YXJmaXZlL2poNzExMC1z
dGFyZml2ZS12aXNpb25maXZlLTIuZHRzaQo+PiArKysgYi9hcmNoL3Jpc2N2L2Jvb3QvZHRzL3N0
YXJmaXZlL2poNzExMC1zdGFyZml2ZS12aXNpb25maXZlLTIuZHRzaQo+PiBAQCAtMjM2LDMgKzIz
NiwxMCBAQAo+PiAgCXBpbmN0cmwtMCA9IDwmdWFydDBfcGlucz47Cj4+ICAJc3RhdHVzID0gIm9r
YXkiOwo+PiAgfTsKPj4gKwo+PiArJnVzYjAgewo+PiArCXN0YXR1cyA9ICJva2F5IjsKPj4gKwl1
c2JkcmRfY2RuczM6IHVzYkAwIHsKPiAKPiBZb3Ugc2hvdWxkIHJhdGhlciBvdmVycmlkZSBieSBw
aGFuZGxlIHRoaXMgYXMgd2VsbC4KPiAKSSB3aWxsIHJlbW92ZSB0aGUgd3JhcHBlciBub2RlICd1
c2IwJy4gCgpKdXN0IGxpa2UgdGhpcyA6CismdXNiZHJkX2NkbnMzIHsKKyAgICAgICBkcl9tb2Rl
ID0gInBlcmlwaGVyYWwiOworfTsKCgrvvIhzaW1pbGFyIGNvbmZpZ3VyYXRpb24gaW4gYXJjaC9h
cm02NC9ib290L2R0cy90aS9rMy1qNzIxZS1zay5kdHMsIHVzYjEgbm9kZSkKICAgJnVzYjEgewog
ICAgICAgIGRyX21vZGUgPSAiaG9zdCI7CiAgICAgICAgLi4uLgogIAo+PiArCQlkcl9tb2RlID0g
InBlcmlwaGVyYWwiOwo+PiArCX07Cj4+ICt9Owo+PiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9i
b290L2R0cy9zdGFyZml2ZS9qaDcxMTAuZHRzaSBiL2FyY2gvcmlzY3YvYm9vdC9kdHMvc3RhcmZp
dmUvamg3MTEwLmR0c2kKPj4gaW5kZXggZjcwYTRlZDQ3ZWI0Li4xNzcyMmZkMWJlNjIgMTAwNjQ0
Cj4+IC0tLSBhL2FyY2gvcmlzY3YvYm9vdC9kdHMvc3RhcmZpdmUvamg3MTEwLmR0c2kKPj4gKysr
IGIvYXJjaC9yaXNjdi9ib290L2R0cy9zdGFyZml2ZS9qaDcxMTAuZHRzaQo+PiBAQCAtMzYyLDYg
KzM2Miw2MCBAQAo+PiAgCQkJc3RhdHVzID0gImRpc2FibGVkIjsKPj4gIAkJfTsKPj4gIAo+PiAr
CQl1c2IwOiB1c2JAMTAxMDAwMDAgewo+PiArCQkJY29tcGF0aWJsZSA9ICJzdGFyZml2ZSxqaDcx
MTAtdXNiIjsKPj4gKwkJCWNsb2NrcyA9IDwmc3RnY3JnIEpINzExMF9TVEdDTEtfVVNCMF9MUE0+
LAo+PiArCQkJCSA8JnN0Z2NyZyBKSDcxMTBfU1RHQ0xLX1VTQjBfU1RCPiwKPj4gKwkJCQkgPCZz
dGdjcmcgSkg3MTEwX1NUR0NMS19VU0IwX0FQQj4sCj4+ICsJCQkJIDwmc3RnY3JnIEpINzExMF9T
VEdDTEtfVVNCMF9BWEk+LAo+PiArCQkJCSA8JnN0Z2NyZyBKSDcxMTBfU1RHQ0xLX1VTQjBfVVRN
SV9BUEI+Owo+PiArCQkJY2xvY2stbmFtZXMgPSAibHBtIiwgInN0YiIsICJhcGIiLCAiYXhpIiwg
InV0bWlfYXBiIjsKPj4gKwkJCXJlc2V0cyA9IDwmc3RnY3JnIEpINzExMF9TVEdSU1RfVVNCMF9Q
V1JVUD4sCj4+ICsJCQkJIDwmc3RnY3JnIEpINzExMF9TVEdSU1RfVVNCMF9BUEI+LAo+PiArCQkJ
CSA8JnN0Z2NyZyBKSDcxMTBfU1RHUlNUX1VTQjBfQVhJPiwKPj4gKwkJCQkgPCZzdGdjcmcgSkg3
MTEwX1NUR1JTVF9VU0IwX1VUTUlfQVBCPjsKPj4gKwkJCXN0YXJmaXZlLHN0Zy1zeXNjb24gPSA8
JnN0Z19zeXNjb24gMHg0IDB4YzQgMHgxNDggMHgxZjQ+Owo+PiArCQkJc3RhcmZpdmUsc3lzLXN5
c2NvbiA9IDwmc3lzX3N5c2NvbiAweDE4PjsKPj4gKwkJCXN0YXR1cyA9ICJkaXNhYmxlZCI7Cj4+
ICsJCQkjYWRkcmVzcy1jZWxscyA9IDwxPjsKPj4gKwkJCSNzaXplLWNlbGxzID0gPDE+Owo+PiAr
CQkJcmFuZ2VzID0gPDB4MCAweDAgMHgxMDEwMDAwMCAweDEwMDAwMD47Cj4gCj4gcmVnIGFuZCBy
YW5nZXMgc2hvdWxkIGJlIHNlY29uZCBwcm9wZXJ0eS4gVGhpcyBhbHNvIGFwcGxpZXMgdG8geW91
cgo+IGJpbmRpbmcgZXhhbXBsZS4KPiAKPiAKb2ssIHRoYW5rcwo+IEJlc3QgcmVnYXJkcywKPiBL
cnp5c3p0b2YKPiAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQu
b3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlz
Y3YK
