Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8AEA6C6FD1C
	for <linux-riscv@archiver.kernel.org>; Wed, 22 Mar 2023 10:51:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=roopGD0zfSHxgTgxYd6xNO3EpEOs+4wg3l7YKH7UmQI=; b=VBrYDeZuql2ol1
	e/2zcgFeOrdDiYnaqKiORXDHbXby43SqKqXxf87iGWf74FTaflchjWatFGz7YvPxubq8tUKoSAUSh
	iumGdef76RKROLRUJVRL+3G1gvMJjebqiajmCejcs9JwpiSNo1iCpQ/Plj48aO9L7sK+M7bQPk8B3
	Vgzl0Gg1cjH9aJtVeJA9chMQC/A0Da3/uplXEw7iJ50noxGJK79MKIyBCNkyogSH2P8ZBrkpFyoyy
	C161x55sAHWuZSLZZaHNPRxYwZZDZ/xmo7ePWKP7ml8g4C2ryaOJpSxPBns+39pEs57aQRa6mIlrQ
	1dLfG7xqhgTtMwppDxXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pew3i-00FhGG-0d;
	Wed, 22 Mar 2023 10:51:10 +0000
Received: from ex01.ufhost.com ([61.152.239.75])
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pew3c-00FhEC-2i;
	Wed, 22 Mar 2023 10:51:07 +0000
Received: from EXMBX166.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX166", Issuer "EXMBX166" (not verified))
	by ex01.ufhost.com (Postfix) with ESMTP id ADB2F24E1FE;
	Wed, 22 Mar 2023 18:50:39 +0800 (CST)
Received: from EXMBX171.cuchost.com (172.16.6.91) by EXMBX166.cuchost.com
 (172.16.6.76) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Wed, 22 Mar
 2023 18:50:39 +0800
Received: from [192.168.125.108] (183.27.97.64) by EXMBX171.cuchost.com
 (172.16.6.91) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Wed, 22 Mar
 2023 18:50:38 +0800
Message-ID: <6a223f1c-8c8b-8d07-1cf5-9a83949d0fd3@starfivetech.com>
Date: Wed, 22 Mar 2023 18:50:38 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v3 5/5] dts: usb: add StarFive JH7110 USB dts
 configuration.
Content-Language: en-US
To: Roger Quadros <rogerq@kernel.org>, Rob Herring <robh@kernel.org>, "Pawel
 Laszczak" <pawell@cadence.com>
CC: Emil Renner Berthing <emil.renner.berthing@canonical.com>, Conor Dooley
	<conor@kernel.org>, Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I
	<kishon@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Peter Chen
	<peter.chen@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-phy@lists.infradead.org>, <linux-usb@vger.kernel.org>,
	<linux-riscv@lists.infradead.org>, Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>
References: <20230315104411.73614-1-minda.chen@starfivetech.com>
 <20230315104411.73614-6-minda.chen@starfivetech.com>
 <20230320153419.GB1713196-robh@kernel.org>
 <2311a888-8861-ade6-d46f-caff4fc3ec73@starfivetech.com>
 <c3d32c0c-43e0-ee62-d372-27cb09feb82e@kernel.org>
From: Minda Chen <minda.chen@starfivetech.com>
In-Reply-To: <c3d32c0c-43e0-ee62-d372-27cb09feb82e@kernel.org>
X-Originating-IP: [183.27.97.64]
X-ClientProxiedBy: EXCAS066.cuchost.com (172.16.6.26) To EXMBX171.cuchost.com
 (172.16.6.91)
X-YovoleRuleAgent: yovoleflag
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230322_035105_236915_8D849C84 
X-CRM114-Status: GOOD (  19.26  )
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

CgpPbiAyMDIzLzMvMjIgMTY6MDAsIFJvZ2VyIFF1YWRyb3Mgd3JvdGU6Cj4gSGkgTWluZGEsCj4g
Cj4gT24gMjEvMDMvMjAyMyAxNDozNSwgTWluZGEgQ2hlbiB3cm90ZToKPj4gCj4+IAo+PiBPbiAy
MDIzLzMvMjAgMjM6MzQsIFJvYiBIZXJyaW5nIHdyb3RlOgo+Pj4gT24gV2VkLCBNYXIgMTUsIDIw
MjMgYXQgMDY6NDQ6MTFQTSArMDgwMCwgTWluZGEgQ2hlbiB3cm90ZToKPj4+PiBVU0IgR2x1ZSBs
YXllciBhbmQgQ2FkZW5jZSBVU0Igc3Vibm9kZSBjb25maWd1cmF0aW9uLAo+Pj4+IGFsc28gaW5j
bHVkZXMgVVNCIGFuZCBQQ0llIHBoeSBkdHMgY29uZmlndXJhdGlvbi4KPj4+Pgo+Pj4+IFNpZ25l
ZC1vZmYtYnk6IE1pbmRhIENoZW4gPG1pbmRhLmNoZW5Ac3RhcmZpdmV0ZWNoLmNvbT4KPj4+PiAt
LS0KPj4+PiAgLi4uL2poNzExMC1zdGFyZml2ZS12aXNpb25maXZlLTIuZHRzaSAgICAgICAgIHwg
IDcgKysrCj4+Pj4gIGFyY2gvcmlzY3YvYm9vdC9kdHMvc3RhcmZpdmUvamg3MTEwLmR0c2kgICAg
ICB8IDU0ICsrKysrKysrKysrKysrKysrKysKPj4+PiAgMiBmaWxlcyBjaGFuZ2VkLCA2MSBpbnNl
cnRpb25zKCspCj4+Pj4KPj4+PiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9ib290L2R0cy9zdGFy
Zml2ZS9qaDcxMTAtc3RhcmZpdmUtdmlzaW9uZml2ZS0yLmR0c2kgYi9hcmNoL3Jpc2N2L2Jvb3Qv
ZHRzL3N0YXJmaXZlL2poNzExMC1zdGFyZml2ZS12aXNpb25maXZlLTIuZHRzaQo+Pj4+IGluZGV4
IGExMzJkZWJiOWI1My4uYzY0NDc2YWViYzFhIDEwMDY0NAo+Pj4+IC0tLSBhL2FyY2gvcmlzY3Yv
Ym9vdC9kdHMvc3RhcmZpdmUvamg3MTEwLXN0YXJmaXZlLXZpc2lvbmZpdmUtMi5kdHNpCj4+Pj4g
KysrIGIvYXJjaC9yaXNjdi9ib290L2R0cy9zdGFyZml2ZS9qaDcxMTAtc3RhcmZpdmUtdmlzaW9u
Zml2ZS0yLmR0c2kKPj4+PiBAQCAtMjM2LDMgKzIzNiwxMCBAQAo+Pj4+ICAJcGluY3RybC0wID0g
PCZ1YXJ0MF9waW5zPjsKPj4+PiAgCXN0YXR1cyA9ICJva2F5IjsKPj4+PiAgfTsKPj4+PiArCj4+
Pj4gKyZ1c2IwIHsKPj4+PiArCXN0YXR1cyA9ICJva2F5IjsKPj4+PiArCXVzYmRyZF9jZG5zMzog
dXNiQDAgewo+Pj4+ICsJCWRyX21vZGUgPSAicGVyaXBoZXJhbCI7Cj4+Pj4gKwl9Owo+Pj4+ICt9
Owo+Pj4+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2Jvb3QvZHRzL3N0YXJmaXZlL2poNzExMC5k
dHNpIGIvYXJjaC9yaXNjdi9ib290L2R0cy9zdGFyZml2ZS9qaDcxMTAuZHRzaQo+Pj4+IGluZGV4
IGY3MGE0ZWQ0N2ViNC4uMTc3MjJmZDFiZTYyIDEwMDY0NAo+Pj4+IC0tLSBhL2FyY2gvcmlzY3Yv
Ym9vdC9kdHMvc3RhcmZpdmUvamg3MTEwLmR0c2kKPj4+PiArKysgYi9hcmNoL3Jpc2N2L2Jvb3Qv
ZHRzL3N0YXJmaXZlL2poNzExMC5kdHNpCj4+Pj4gQEAgLTM2Miw2ICszNjIsNjAgQEAKPj4+PiAg
CQkJc3RhdHVzID0gImRpc2FibGVkIjsKPj4+PiAgCQl9Owo+Pj4+ICAKPj4+PiArCQl1c2IwOiB1
c2JAMTAxMDAwMDAgewo+Pj4+ICsJCQljb21wYXRpYmxlID0gInN0YXJmaXZlLGpoNzExMC11c2Ii
Owo+Pj4+ICsJCQljbG9ja3MgPSA8JnN0Z2NyZyBKSDcxMTBfU1RHQ0xLX1VTQjBfTFBNPiwKPj4+
PiArCQkJCSA8JnN0Z2NyZyBKSDcxMTBfU1RHQ0xLX1VTQjBfU1RCPiwKPj4+PiArCQkJCSA8JnN0
Z2NyZyBKSDcxMTBfU1RHQ0xLX1VTQjBfQVBCPiwKPj4+PiArCQkJCSA8JnN0Z2NyZyBKSDcxMTBf
U1RHQ0xLX1VTQjBfQVhJPiwKPj4+PiArCQkJCSA8JnN0Z2NyZyBKSDcxMTBfU1RHQ0xLX1VTQjBf
VVRNSV9BUEI+Owo+Pj4+ICsJCQljbG9jay1uYW1lcyA9ICJscG0iLCAic3RiIiwgImFwYiIsICJh
eGkiLCAidXRtaV9hcGIiOwo+Pj4+ICsJCQlyZXNldHMgPSA8JnN0Z2NyZyBKSDcxMTBfU1RHUlNU
X1VTQjBfUFdSVVA+LAo+Pj4+ICsJCQkJIDwmc3RnY3JnIEpINzExMF9TVEdSU1RfVVNCMF9BUEI+
LAo+Pj4+ICsJCQkJIDwmc3RnY3JnIEpINzExMF9TVEdSU1RfVVNCMF9BWEk+LAo+Pj4+ICsJCQkJ
IDwmc3RnY3JnIEpINzExMF9TVEdSU1RfVVNCMF9VVE1JX0FQQj47Cj4+Pj4gKwkJCXN0YXJmaXZl
LHN0Zy1zeXNjb24gPSA8JnN0Z19zeXNjb24gMHg0IDB4YzQgMHgxNDggMHgxZjQ+Owo+Pj4+ICsJ
CQlzdGFyZml2ZSxzeXMtc3lzY29uID0gPCZzeXNfc3lzY29uIDB4MTg+Owo+Pj4+ICsJCQlzdGF0
dXMgPSAiZGlzYWJsZWQiOwo+Pj4+ICsJCQkjYWRkcmVzcy1jZWxscyA9IDwxPjsKPj4+PiArCQkJ
I3NpemUtY2VsbHMgPSA8MT47Cj4+Pj4gKwkJCXJhbmdlcyA9IDwweDAgMHgwIDB4MTAxMDAwMDAg
MHgxMDAwMDA+Owo+Pj4+ICsKPj4+PiArCQkJdXNiZHJkX2NkbnMzOiB1c2JAMCB7Cj4+Pj4gKwkJ
CQljb21wYXRpYmxlID0gImNkbnMsdXNiMyI7Cj4+Pgo+Pj4gVGhpcyBwYXR0ZXJuIG9mIFVTQiB3
cmFwcGVyIGFuZCB0aGVuIGEgImdlbmVyaWMiIElQIG5vZGUgaXMgZGlzY291cmFnZWQgCj4+PiBp
ZiBpdCBpcyBqdXN0IGNsb2NrcywgcmVzZXRzLCBwb3dlci1kb21haW5zLCBldGMuIElPVywgdW5s
ZXNzIHRoZXJlJ3MgYW4gCj4+PiBhY3R1YWwgd3JhcHBlciBoL3cgYmxvY2sgd2l0aCBpdHMgb3du
IHJlZ2lzdGVycywgdGhlbiBkb24ndCBkbyB0aGlzIAo+Pj4gc3BsaXQuIE1lcmdlIGl0IGFsbCBp
bnRvIGEgc2luZ2xlIG5vZGUuCj4+Pgo+PiBJIGFtIGFmcmFpZCBpdCBpcyBkaWZmaWN1bHQgdG8g
bWVyZ2UgaW4gb25lIHNpbmdsZSBub2RlLiAKPj4gCj4+IDEuSWYgY2FkZW5jZTMgdXNiIGRldmlj
ZSBpcyBzdGlsbCB0aGUgc3ViIGRldmljZS4gQWxsIHRoZSBkdHMgc2V0dGluZyBhcmUgaW4KPj4g
U3RhckZpdmUgbm9kZS4gVGhpcyBjYW4gbm90IHdvcmsuCj4+IFN0YXJGaXZlIGRyaXZlciBjb2Rl
IFVzaW5nIHBsYXRmb3JtX2RldmljZV9hZGQgZ2VuZXJhdGUgY2FkZW5jMyB1c2IgcGxhdGZvcm0g
ZGV2aWNlLiAKPj4gRXZlbiBJTyBtZW1vcnkgc3BhY2Ugc2V0dGluZyBjYW4gYmUgcGFzc2VkIHRv
IGNhZGVuY2UzIFVTQiwgUEhZIHNldHRpbmcgY2FuIG5vdCBiZSBwYXNzZWQuCj4+IEZvciB0aGUg
UEhZIGRyaXZlciB1c2luZyBkdHMgbm93LiBCdXQgaW4gdGhpcyBjYXNlLCBDYWRlbmNlMyBVU0Ig
bm8gZHRzIGNvbmZpZ3VyZS4KPj4gCj4+IDIuIEp1c3Qgb25lIFVTQiBDYWRlbmNlIHBsYXRmb3Jt
IGRldmljZS4KPj4gTWF5YmUgdGhpcyBjYW4gd29yay4gQnV0IENhZGVuY2UgVVNCIGRyaXZlciBj
b2RlIGNkbnMzLXBsYXQuYyByZXF1aXJlZCB0byBjaGFuZ2VkLgo+PiAKPj4gSGkgUGV0ZXIgUGF3
ZWwgYW5kIFJvZ2VyCj4+ICAgIFRoZXJlIGlzIGEgInBsYXRmb3JtX3N1c3BlbmQiIGZ1bmN0aW9u
IHBvaW50ZXIgaW4gInN0cnVjdCBjZG5zM19wbGF0Zm9ybV9kYXRhIu+8jAo+PiAgICBBZGQgInBs
YXRmb3JtX2luaXQiIGFuZCAicGxhdGZvcm1fZXhpdCIgZm9yIG91ciBKSDcxMTAgcGxhdGZvcm0u
IE1heWJlIGl0IGNhbiB3b3JrLgo+PiAgICBJcyBpdCBPSz8gICAKPiAKPiBPbmNlIHlvdSBtb3Zl
IGFsbCB0aGUgc3lzY29uIHJlZ2lzdGVyIG1vZGlmaWNhdGlvbnMgZnJvbSB5b3VyIHdyYXBwZXIg
ZHJpdmVyCj4gdG8geW91ciBQSFkgZHJpdmVyLCBvbmx5IGNsb2NrIGFuZCByZXNldCBjb250cm9s
IGFyZSBsZWZ0IGluIHlvdXIgd3JhcHBlciBkcml2ZXIuCj4gVGhpcyBpcyBnZW5lcmljIGVub3Vn
aCB0byBiZSBkb25lIGluIHRoZSBjZG5zMyx1c2IgZHJpdmVyIGl0c2VsZiBzbyB5b3UgZG9uJ3Qg
bmVlZCBhCj4gd3JhcHBlciBub2RlLgo+IAo+IFBhd2VsLCBkbyB5b3UgYWdyZWU/Cj4gIAptb3Zl
IGFsbCB0aGUgc3lzY29uIGNvZGVzIHRvIFBIWSBkcml2ZXIgaXMgb2suIEkgZm91bmQgZHdjMy9k
d2MzLW9mLXNpbXBsZS5jIGlzIHB1YmxpYyBjb2RlcwphbmQgY29udGFpbiBqdXN0IGNsb2NrIGFu
ZCByZXNldCBjb250cm9sIGNvZGVzLiBJIGNhbiBjaGFuZ2UgdGhlIHJlc2lkdWFsIGNvZGVzIHRv
IHB1YmxpYyBjb2Rlcy4KQnV0IEkgZm91bmQgcm9ja2NoaXAgMzM5OSB1c2IgZHRzIHdoaWNoIGlz
IG9uZSBvZiBkd2MzIHNpbXBsZSBwbGF0Zm9ybSBzdGlsbCBjb250YWluIHR3byBub2Rlcy4KU2Vl
IERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy91c2Ivcm9ja2NoaXAscmszMzk5LWR3
YzMueWFtbAo+Pj4+ICsJCQkJcmVnID0gPDB4MCAweDEwMDAwPiwKPj4+PiArCQkJCSAgICAgIDww
eDEwMDAwIDB4MTAwMDA+LAo+Pj4+ICsJCQkJICAgICAgPDB4MjAwMDAgMHgxMDAwMD47Cj4+Pj4g
KwkJCQlyZWctbmFtZXMgPSAib3RnIiwgInhoY2kiLCAiZGV2IjsKPj4+PiArCQkJCWludGVycnVw
dHMgPSA8MTAwPiwgPDEwOD4sIDwxMTA+Owo+Pj4+ICsJCQkJaW50ZXJydXB0LW5hbWVzID0gImhv
c3QiLCAicGVyaXBoZXJhbCIsICJvdGciOwo+Pj4+ICsJCQkJcGh5cyA9IDwmdXNicGh5MD47Cj4+
Pj4gKwkJCQlwaHktbmFtZXMgPSAiY2RuczMsdXNiMi1waHkiOwo+Pj4KPj4+IE5vIG5lZWQgZm9y
ICotbmFtZXMgd2hlbiB0aGVyZSBpcyBvbmx5IDEgZW50cnkuIE5hbWVzIGFyZSBsb2NhbCB0byB0
aGUgCj4+PiBkZXZpY2UgYW5kIG9ubHkgdG8gZGlzdGluZ3Vpc2ggZW50cmllcywgc28gJ3VzYjIn
IHdvdWxkIGJlIHN1ZmZpY2llbnQgCj4+PiBoZXJlLgo+Pj4KPj4gVGhlIFBIWSBuYW1lICdjZG5z
Myx1c2IyLXBoeScgIGlzIGRlZmluZWQgaW4gY2FkZW5jZTMgdXNiIGRyaXZlciBjb2RlLgo+PiBD
YWRlbmNlIFVTQjMgZHJpdmVyIGNvZGUgdXNpbmcgdGhpcyBuYW1lIHRvIGdldCBQSFkgaW5zdGFu
Y2UuCj4+IEFuZCBhbGwgdGhlIFBIWSBvcHMgdXNlZCBpbiBDYWRlbmNlMyBVU0Igc3ViIGRldmlj
ZS4gCj4+Pj4gKwkJCQltYXhpbXVtLXNwZWVkID0gInN1cGVyLXNwZWVkIjsKPj4+PiArCQkJfTsK
Pj4+PiArCQl9Owo+Pj4+ICsKPj4+PiArCQl1c2JwaHkwOiBwaHlAMTAyMDAwMDAgewo+Pj4+ICsJ
CQljb21wYXRpYmxlID0gInN0YXJmaXZlLGpoNzExMC11c2ItcGh5IjsKPj4+PiArCQkJcmVnID0g
PDB4MCAweDEwMjAwMDAwIDB4MCAweDEwMDAwPjsKPj4+PiArCQkJY2xvY2tzID0gPCZzeXNjcmcg
Skg3MTEwX1NZU0NMS19VU0JfMTI1TT4sCj4+Pj4gKwkJCQkgPCZzdGdjcmcgSkg3MTEwX1NUR0NM
S19VU0IwX0FQUF8xMjU+Owo+Pj4+ICsJCQljbG9jay1uYW1lcyA9ICIxMjVtIiwgImFwcF8xMjUi
Owo+Pj4+ICsJCQkjcGh5LWNlbGxzID0gPDA+Owo+Pj4+ICsJCX07Cj4+Pj4gKwo+Pj4+ICsJCXBj
aWVwaHkwOiBwaHlAMTAyMTAwMDAgewo+Pj4+ICsJCQljb21wYXRpYmxlID0gInN0YXJmaXZlLGpo
NzExMC1wY2llLXBoeSI7Cj4+Pj4gKwkJCXJlZyA9IDwweDAgMHgxMDIxMDAwMCAweDAgMHgxMDAw
MD47Cj4+Pj4gKwkJCSNwaHktY2VsbHMgPSA8MD47Cj4+Pj4gKwkJfTsKPj4+PiArCj4+Pj4gKwkJ
cGNpZXBoeTE6IHBoeUAxMDIyMDAwMCB7Cj4+Pj4gKwkJCWNvbXBhdGlibGUgPSAic3RhcmZpdmUs
amg3MTEwLXBjaWUtcGh5IjsKPj4+PiArCQkJcmVnID0gPDB4MCAweDEwMjIwMDAwIDB4MCAweDEw
MDAwPjsKPj4+PiArCQkJI3BoeS1jZWxscyA9IDwwPjsKPj4+PiArCQl9Owo+Pj4+ICsKPj4+PiAg
CQlzdGdjcmc6IGNsb2NrLWNvbnRyb2xsZXJAMTAyMzAwMDAgewo+Pj4+ICAJCQljb21wYXRpYmxl
ID0gInN0YXJmaXZlLGpoNzExMC1zdGdjcmciOwo+Pj4+ICAJCQlyZWcgPSA8MHgwIDB4MTAyMzAw
MDAgMHgwIDB4MTAwMDA+Owo+Pj4+IC0tIAo+Pj4+IDIuMTcuMQo+Pj4+Cj4gCj4gY2hlZXJzLAo+
IC1yb2dlcgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
bGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcK
aHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
