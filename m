Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD7DAC4332F
	for <linux-riscv@archiver.kernel.org>; Thu,  2 Nov 2023 13:23:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0z0u2VmNm26SFFsMCAWCrGDuTNzeNLecNqLBbLGHTy8=; b=B9UiuBHsF8ZF5Z
	cbLLa3vIWxcuNgdn4ni6qpt7paG9LU5xatdcxg1IIFm5stpJM8BhW7Yl7X7sdYQ/4vhFirDO0B6Sz
	WjVYIxoZwbZeBgSzxxUJHRRT8uxQRleiWG3hb+dWNSwYJDlRNiJSEb9LXmZxKvbbmjZhbBCF89Oqt
	w0l34feNzTYoTw9nYiFb39BLLonmdqaoyDJwd12YGSeDF/ODvq4ayre6k27Qx4b9f4UqQOptz4+o6
	HA6wazIQfDPjiwosDs1nEZbSISt2fOV2sRkklGijEvWIQvs1uFQQd7dZ+yimU7DKVgZCotnUI0jpI
	0DhADFRGul/j1p06kenQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qyXfY-009Wfl-0k;
	Thu, 02 Nov 2023 13:23:32 +0000
Received: from ex01.ufhost.com ([61.152.239.75])
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qyXfS-009WX7-2d
	for linux-riscv@lists.infradead.org;
	Thu, 02 Nov 2023 13:23:30 +0000
Received: from EXMBX166.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX166", Issuer "EXMBX166" (not verified))
	by ex01.ufhost.com (Postfix) with ESMTP id 73D7F24E3F6;
	Thu,  2 Nov 2023 21:22:24 +0800 (CST)
Received: from EXMBX061.cuchost.com (172.16.6.61) by EXMBX166.cuchost.com
 (172.16.6.76) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Thu, 2 Nov
 2023 21:22:24 +0800
Received: from [192.168.125.131] (113.72.146.247) by EXMBX061.cuchost.com
 (172.16.6.61) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Thu, 2 Nov
 2023 21:22:23 +0800
Message-ID: <72ad5029-42b2-481a-887f-8f6079d8859b@starfivetech.com>
Date: Thu, 2 Nov 2023 21:15:56 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 2/3] clocksource: Add JH7110 timer driver
To: Daniel Lezcano <daniel.lezcano@linaro.org>, Thomas Gleixner
	<tglx@linutronix.de>, Emil Renner Berthing
	<emil.renner.berthing@canonical.com>, Christophe JAILLET
	<christophe.jaillet@wanadoo.fr>
CC: <linux-riscv@lists.infradead.org>, <devicetree@vger.kernel.org>, "Rob
 Herring" <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Paul Walmsley
	<paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
	<aou@eecs.berkeley.edu>, Philipp Zabel <p.zabel@pengutronix.de>, Walker Chen
	<walker.chen@starfivetech.com>, Samin Guo <samin.guo@starfivetech.com>,
	<linux-kernel@vger.kernel.org>, Conor Dooley <conor@kernel.org>
References: <20231019053501.46899-1-xingyu.wu@starfivetech.com>
 <20231019053501.46899-3-xingyu.wu@starfivetech.com>
 <3f76f965-7c7b-109e-2ee0-3033e332e84b@linaro.org>
 <bb819333-52d3-49fc-9bb9-1a227bd5ca8f@starfivetech.com>
 <d0e70434-e273-4799-c5ec-bbee1b3f5cc7@linaro.org>
 <540136d4-6f8f-49a6-80ff-cc621f2f462b@starfivetech.com>
 <65c38717-3e0c-46d3-a124-29cae48f1a2e@linaro.org>
Content-Language: en-US
From: Xingyu Wu <xingyu.wu@starfivetech.com>
In-Reply-To: <65c38717-3e0c-46d3-a124-29cae48f1a2e@linaro.org>
X-Originating-IP: [113.72.146.247]
X-ClientProxiedBy: EXCAS062.cuchost.com (172.16.6.22) To EXMBX061.cuchost.com
 (172.16.6.61)
X-YovoleRuleAgent: yovoleflag
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231102_062327_348145_3E97C088 
X-CRM114-Status: GOOD (  31.46  )
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

T24gMjAyMy8xMC8yNyAyMTozNCwgRGFuaWVsIExlemNhbm8gd3JvdGU6Cj4gCj4gT24gMjcvMTAv
MjAyMyAxMToxNywgWGluZ3l1IFd1IHdyb3RlOgo+PiBPbiAyMDIzLzEwLzI1IDIyOjM5LCBEYW5p
ZWwgTGV6Y2FubyB3cm90ZToKPj4+Cj4+PiBIaSBYaW5neXUsCj4+Pgo+Pj4KPj4+IE9uIDI1LzEw
LzIwMjMgMTE6MDQsIFhpbmd5dSBXdSB3cm90ZToKPj4+PiBPbiAyMDIzLzEwLzI0IDIyOjU2LCBE
YW5pZWwgTGV6Y2FubyB3cm90ZToKPj4+Pj4KPj4+Pj4gSGkgWGluZ3l1LAo+Pj4+Pgo+Pj4+Pgo+
Pj4+PiBPbiAxOS8xMC8yMDIzIDA3OjM1LCBYaW5neXUgV3Ugd3JvdGU6Cj4+Pj4+PiBBZGQgdGlt
ZXIgZHJpdmVyIGZvciB0aGUgU3RhckZpdmUgSkg3MTEwIFNvQy4KPj4+Pj4KPj4+Pj4gQXMgaXQg
aXMgYSBuZXcgdGltZXIsIHBsZWFzZSBhZGQgYSBwcm9wZXIgbmljZSBkZXNjcmlwdGlvbgo+Pj4+
PiBleHBsYWluaW5nIHRoZSB0aW1lciBoYXJkd2FyZSwgdGhhbmtzLgo+Pj4+Cj4+Pj4gT0suIFdp
bGwgYWRkIHRoZSBkZXNjcmlwdGlvbiBpbiBuZXh0IHZlcnNpb24uCj4+Pj4KPj4+Pj4KPj4+Pj4+
IFNpZ25lZC1vZmYtYnk6IFhpbmd5dSBXdSA8eGluZ3l1Lnd1QHN0YXJmaXZldGVjaC5jb20+IC0t
LSBNQUlOVEFJTkVSU8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqAgfMKgwqAgNyArIGRyaXZlcnMvY2xvY2tzb3VyY2UvS2NvbmZpZ8KgwqDCoMKgwqDCoMKgIHzC
oCAxMSArIGRyaXZlcnMvY2xvY2tzb3VyY2UvTWFrZWZpbGXCoMKgwqDCoMKgwqAgfMKgwqAgMSAr
IGRyaXZlcnMvY2xvY2tzb3VyY2UvdGltZXItamg3MTEwLmMgfCAzODAKPj4+Pj4+ICsrKysrKysr
KysrKysrKysrKysrKysrKysrKysrIDQgZmlsZXMgY2hhbmdlZCwgMzk5Cj4+Pj4+PiBpbnNlcnRp
b25zKCspIGNyZWF0ZSBtb2RlIDEwMDY0NAo+Pj4+Pj4gZHJpdmVycy9jbG9ja3NvdXJjZS90aW1l
ci1qaDcxMTAuYwo+Pj4+Pj4KPj4+Pj4+IGRpZmYgLS1naXQgYS9NQUlOVEFJTkVSUyBiL01BSU5U
QUlORVJTIGluZGV4Cj4+Pj4+PiA3YTdiZDhiZDgwZTkuLjkxYzA5YjM5OTEzMSAxMDA2NDQgLS0t
IGEvTUFJTlRBSU5FUlMgKysrCj4+Pj4+PiBiL01BSU5UQUlORVJTIEBAIC0yMDQ3Myw2ICsyMDQ3
MywxMyBAQCBTOsKgwqDCoCBNYWludGFpbmVkIEY6Cj4+Pj4+PiBEb2N1bWVudGF0aW9uL2Rldmlj
ZXRyZWUvYmluZGluZ3Mvc291bmQvc3RhcmZpdmUsamg3MTEwLXRkbS55YW1sCj4+Pj4+Pgo+Pj4+
Pj4KPiBGOsKgwqDCoCBzb3VuZC9zb2Mvc3RhcmZpdmUvamg3MTEwX3RkbS5jCj4+Pj4+PiArU1RB
UkZJVkUgSkg3MTEwIFRJTUVSIERSSVZFUiArTTrCoMKgwqAgU2FtaW4gR3VvCj4+Pj4+PiA8c2Ft
aW4uZ3VvQHN0YXJmaXZldGVjaC5jb20+ICtNOsKgwqDCoCBYaW5neXUgV3UKPj4+Pj4+IDx4aW5n
eXUud3VAc3RhcmZpdmV0ZWNoLmNvbT4gK1M6wqDCoMKgIFN1cHBvcnRlZCArRjoKPj4+Pj4+IERv
Y3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy90aW1lci9zdGFyZml2ZSxqaDcxMTAtdGlt
ZXIueWFtbAo+Pj4+Pj4KPj4+Pj4+Cj4gK0Y6wqDCoMKgIGRyaXZlcnMvY2xvY2tzb3VyY2UvdGlt
ZXItamg3MTEwLmMKPj4+Pj4+ICsgU1RBUkZJVkUgSkg3MVgwIENMT0NLIERSSVZFUlMgTTrCoMKg
wqAgRW1pbCBSZW5uZXIgQmVydGhpbmcKPj4+Pj4+IDxrZXJuZWxAZXNtaWwuZGs+IE06wqDCoMKg
IEhhbCBGZW5nIDxoYWwuZmVuZ0BzdGFyZml2ZXRlY2guY29tPiBkaWZmIC0tZ2l0IGEvZHJpdmVy
cy9jbG9ja3NvdXJjZS9LY29uZmlnCj4+Pj4+PiBiL2RyaXZlcnMvY2xvY2tzb3VyY2UvS2NvbmZp
ZyBpbmRleAo+Pj4+Pj4gMGJhMGRjNGVjZjA2Li44MjFhYmNjMWU1MTcgMTAwNjQ0IC0tLQo+Pj4+
Pj4gYS9kcml2ZXJzL2Nsb2Nrc291cmNlL0tjb25maWcgKysrCj4+Pj4+PiBiL2RyaXZlcnMvY2xv
Y2tzb3VyY2UvS2NvbmZpZyBAQCAtNjQxLDYgKzY0MSwxNyBAQCBjb25maWcKPj4+Pj4+IFJJU0NW
X1RJTUVSIGlzIGFjY2Vzc2VkIHZpYSBib3RoIHRoZSBTQkkgYW5kIHRoZSByZGN5Y2xlCj4+Pj4+
PiBpbnN0cnVjdGlvbi7CoCBUaGlzIGlzIHJlcXVpcmVkIGZvciBhbGwgUklTQy1WIHN5c3RlbXMu
ICtjb25maWcgU1RBUkZJVkVfSkg3MTEwX1RJTUVSICvCoMKgwqAgYm9vbCAiVGltZXIgZm9yIHRo
ZQo+Pj4+Pj4gU1RBUkZJVkUgSkg3MTEwIFNvQyIgK8KgwqDCoCBkZXBlbmRzIG9uIEFSQ0hfU1RB
UkZJVkUgfHwKPj4+Pj4+IENPTVBJTEVfVEVTVAo+Pj4+Pgo+Pj4+PiBZb3UgbWF5IHdhbnQgdG8g
dXNlIEFSQ0hfU1RBUkZJVkUgb25seSBpZiB0aGUgcGxhdGZvcm0gY2FuIG1ha2UKPj4+Pj4gdGhp
cyB0aW1lciBvcHRpb25hbC4gT3RoZXJ3aXNlLCBzZXQgdGhlIG9wdGlvbiBmcm9tIHRoZQo+Pj4+
PiBwbGF0Zm9ybSBLY29uZmlnIGFuZCBwdXQgdGhlIGJvb2wgImJsYSBibGEiIGlmIENPTVBJTEVf
VEVTVAo+Pj4+Cj4+Pj4gWWVzLCB0aGlzIHRpbWVyIG9ubHkgYmUgdXNlZCBvbiB0aGUgU3RhckZp
dmUgU29DLiBTbyBJIGludGVuZCB0bwo+Pj4+IG1vZGlmeSB0byB0aGlzOgo+Pj4+Cj4+Pj4gYm9v
bCAiVGltZXIgZm9yIHRoZSBTVEFSRklWRSBKSDcxMTAgU29DIiBpZiBDT01QSUxFX1RFU1QgZGVw
ZW5kcwo+Pj4+IG9uIEFSQ0hfU1RBUkZJVkUKPj4+Cj4+PiBJbiB0aGlzIGNhc2UsIHlvdSBzaG91
bGQgY2hhbmdlIHRoZSBwbGF0Zm9ybSBjb25maWcgYW5kIHNlbGVjdCB0aGUKPj4+IHRpbWVyIGZy
b20gdGhlcmUuIFJlbW92ZSB0aGUgZGVwZW5kcyBvbiBBUkNIX1NUQVJGSVZFIHNvIGl0IGlzCj4+
PiBwb3NzaWJsZSBlbmFibGUgY3Jvc3MgdGVzdCBjb21waWxhdGlvbi4gT3RoZXJ3aXNlIENPTVBJ
TEVfVEVTVCB3aWxsCj4+PiBub3Qgd29yayBvbiBvdGhlciBwbGF0Zm9ybXMuCj4+Pgo+Pj4gWyAu
Li4gXQo+Pj4KPj4KPj4gSXQgaXMgbm90IGEga2VybmVsIHRpbWVyIG9yIGNsb2Nrc291cmNlLiBJ
dCB3aWxsIG5vdCB3b3JrIG9uIG90aGVyCj4+IHBsYXRmb3JtcyBhbmQgaXMganVzdCB1c2VkIG9u
IHRoZSBKSDcxMTAgU29DLiBJIHRoaW5rIEkgbmVlZG4ndAo+PiByZW1vdmUgaXQuIE1heWJlIEkg
bW9kaWZ5IHRvIHRoaXM6Cj4+Cj4+IGJvb2wgIlRpbWVyIGZvciB0aGUgU1RBUkZJVkUgSkg3MTEw
IFNvQyIgaWYgQ09NUElMRV9URVNUIGRlcGVuZHMgb24KPj4gQVJDSF9TVEFSRklWRSB8fCBDT01Q
SUxFX1RFU1QKPiAKPiBJIHRoaW5rIHRoZXJlIGlzIGEgbWlzdW5kZXJzdGFuZGluZy4KPiAKPiBJ
ZiB3ZSB3YW50IHRvIGNvbXBpbGUgb24geDg2IGRyaXZlcnMgZm9yIG90aGVyIHBsYXRmb3Jtcywg
d2Ugc2VsZWN0IENPTVBJTEVfVEVTVCBzbyB3ZSBjYW4gZW5hYmxlIHRoZSB0aW1lciBhbmQgZG8g
Y29tcGlsYXRpb24gdGVzdGluZy4KPiAKPiBJbiB0aGlzIGNhc2UsIHdlIG1heSB3YW50IHRvIGNv
bXBpbGUgdGhlIFNUQVJGSVZFIEpINzExMCBvbiB4ODYganVzdCB0byBkb3VibGUgY2hlY2sgaXQg
aXMgY29ycmVjdGx5IGNvbXBpbGluZyAoZWcuIHdlIGRvIGNoYW5nZXMgaW1wYWN0aW5nIGFsbCB0
aGUgZHJpdmVycykuIElmIHRoZSBBUkNIX1NUQVJGSVZFIGRlcGVuZGVuY3kgaXMgc2V0LCB0aGVu
IHRoYXQgd29uJ3QgYmUgcG9zc2libGUuCj4gCj4gU28gaXQgc2hvdWxkIGJlOgo+IAo+IGJvb2wg
IlRpbWVyIGZvciB0aGUgU1RBUkZJVkUgSkg3MTEwIFNvQyIgaWYgQ09NUElMRV9URVNUCj4gLi4u
Cj4gCj4gQW5kIGluIGFyY2gvcmlzY3YvS2NvbmZpZy5zb2NzCj4gCj4gY29uZmlnIFNPQ19TVEFS
RklWRQo+IMKgwqDCoCAuLi4KPiDCoMKgwqAgc2VsZWN0IFNUQVJGSVZFX0pINzExMF9USU1FUgo+
IMKgwqDCoCAuLi4KPiAKPj4+Pj4+ICtzdHJ1Y3Qgamg3MTEwX2Nsa2V2dCB7ICvCoMKgwqAgc3Ry
dWN0IGNsb2NrX2V2ZW50X2RldmljZSBldnQ7ICsKPj4+Pj4+IHN0cnVjdCBjbG9ja3NvdXJjZSBj
czsgK8KgwqDCoCBib29sIGNzX2lzX3ZhbGlkOyArwqDCoMKgIHN0cnVjdCBjbGsKPj4+Pj4+ICpj
bGs7ICvCoMKgwqAgc3RydWN0IHJlc2V0X2NvbnRyb2wgKnJzdDsgK8KgwqDCoCB1MzIgcmF0ZTsg
K8KgwqDCoCB1MzIKPj4+Pj4+IHJlbG9hZF92YWw7ICvCoMKgwqAgdm9pZCBfX2lvbWVtICpiYXNl
OyArwqDCoMKgIGNoYXIKPj4+Pj4+IG5hbWVbc2l6ZW9mKCJqaDcxMTAtdGltZXIuY2hYIildOyAr
fTsgKyArc3RydWN0Cj4+Pj4+PiBqaDcxMTBfdGltZXJfcHJpdiB7ICvCoMKgwqAgc3RydWN0IGNs
ayAqcGNsazsgK8KgwqDCoCBzdHJ1Y3QKPj4+Pj4+IHJlc2V0X2NvbnRyb2wgKnByc3Q7ICvCoMKg
wqAgc3RydWN0IGpoNzExMF9jbGtldnQKPj4+Pj4+IGNsa2V2dFtKSDcxMTBfVElNRVJfQ0hfTUFY
XTsKPj4+Pj4KPj4+Pj4gV2h5IGRvIHlvdSBuZWVkIHNldmVyYWwgY2xvY2sgZXZlbnRzIGFuZCBj
bG9jayBzb3VyY2VzID8KPj4+Pgo+Pj4+IFRoaXMgdGltZXIgaGFzIGZvdXIgY291bnRlcnMgKGNo
YW5uZWxzKSB3aGljaCBydW4gaW5kZXBlbmRlbnRseS4KPj4+PiBTbyBlYWNoIGNvdW50ZXIgY2Fu
IGhhdmUgaXRzIG93biBjbG9jayBldmVudCBhbmQgY2xvY2sgc291cmNlIHRvCj4+Pj4gY29uZmln
dXJlIGRpZmZlcmVudCBzZXR0aW5ncy4KPj4+Cj4+PiBUaGUga2VybmVsIG9ubHkgbmVlZHMgb25l
IGNsb2Nrc291cmNlLiBVc3VhbGx5IG11bHRpcGxlIGNsb2NrZXZlbnRzCj4+PiBhcmUgcGVyLWNw
dSBiYXNlZCBzeXN0ZW0uCj4+Pgo+Pj4gVGhlIGRyaXZlciBkb2VzIG5vdCBzZWVtIHRvIGhhdmUg
YSBwZXIgY3B1IHRpbWVyIGJ1dCBqdXN0Cj4+PiBpbml0aWFsaXppbmcgbXVsdGlwbGUgY2xvY2tl
dmVudHMgd2hpY2ggd2lsbCBlbmQgdXAgdW51c2VkLCB3YXN0aW5nCj4+PiBlbmVyZ3kuCj4+Pgo+
Pj4KPj4KPj4gVGhlIGJvYXJkIG9mIHRoZSBTdGFyRml2ZSBKSDcxMTAgU29DIGhhcyB0d28gdHlw
ZXMgb2YgdGltZXIgOgo+PiByaXNjdi10aW1lciBhbmQgamg3MTEwLXRpbWVyLiBJdCBib290cyBi
eSByaXNjdi10aW1lcihjbG9ja3NvdXJjZSkKPj4gYW5kIHRoZSBqaDcxMTAtdGltZXIgaXMgb3B0
aW9uYWwgYW5kIGFkZGl0aW9uYWwuIEkgdGhpbmsgSSBzaG91bGQKPj4gaW5pdGlhbGl6ZSB0aGUg
Zm91ciBjaGFubmVscyBvZiBqaDcxMTAtdGltZXIgYXMgY2xvY2tldmVudHMgbm90Cj4+IGNsb2Nr
c291cmNlIHByZS1jcHUuCj4gCj4gSWYgbm8gY2xvY2tzb3VyY2UgaXMgbmVlZGVkIG9uIHRoaXMg
U29DIGJlY2F1c2UgcmlzY3YgdGltZXJzIGFyZSB1c2VkLCB0aGVuIGl0IGlzIG5vdCB1c2VmdWwg
dG8gcmVnaXN0ZXIgYSBjbG9ja3NvdXJjZSBmb3IgdGhpcyB0aW1lciBhbmQgdGhlIGNvcnJlc3Bv
bmRpbmcgY29kZSBjYW4gZ28gYXdheS4KPiAKPiBJZiB0aGUgY2xvY2tldmVudCBpcyBvcHRpb25h
bCB3aHkgZG8geW91IG5lZWQgdGhpcyBkcml2ZXIgYXQgYWxsPwo+IAo+IAo+IAoKSGkgRGFuaWVs
LAoKU29ycnksIG1heWJlIEkgZGlkbid0IGV4cHJlc3MgaXQgY2xlYXJseSBlbm91Z2guIEkgdXNl
IHRoaXMgamg3MTEwLXRpbWVyIGFzIGEgZ2xvYmFsIHRpbWVyIG9uIHRoZSBTb0MgYW5kIHJpc2N2
LXRpbWVyIGFzIGNwdSBsb2NhbCB0aW1lci4gU28gdGhlc2UgYXJlIHNvbWV0aGluZyBkaWZmZXJl
bnQuCgpUaGVzZSBmb3VyIGNvdW50ZXJzIGluIHRoaXMgamg3MTEwLXRpbWVyIGFyZSBleGFjdGx5
IHRoZSBzYW1lIGFuZCBpbmRlcGVuZGVudCBvZiBlYWNoIG90aGVyLiBJZiB0aGlzIHRpbWVyIGlz
IHVzZWQgYXMgYSBnbG9iYWwgdGltZXIsIGRvIEkgdXNlIG9ubHkgb25lIG9yIGFsbCBvZiB0aGUg
Y291bnRlcnMgdG8gcmVnaXN0ZXIgY2xvY2tzb3VyY2UgYW5kIGNsb2NrZXZlbnQ/CgpUaGFua3Ms
Clhpbmd5dSBXdQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5v
cmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNj
dgo=
