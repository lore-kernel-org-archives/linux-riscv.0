Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8269C0015E
	for <linux-riscv@archiver.kernel.org>; Thu,  3 Aug 2023 07:44:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7ukNRcfR2ej9BjY0cUyBgb3eU2O97lt8SsnOchwvJJk=; b=sMmLwQEEFVNUdR
	Bwr3vBLMvf17iD4M+DTQM5FPJjNXcJDSYwlW+PItRoE6XSe50F+IP63UkGFbsIcc52FNwKPHpnvif
	Ii4bVkmQ49SNgVExQxDgLIIR93Drd8LczrK5/gAg/BRtgm5k4PthuOdImvWqgKB8Ys21UZJ/QVHzn
	tcFUmw/Q8PoI4oL+zSpPA0c/wJm8F1/6e4UVW01ToEBeB6aWVeaqTs4PkKI94vLbCSxyCk9yE0qxY
	QDqnUHm+ZaHtRcnl/YP3EKWJi4/xML0lhzOwlMtTWl7jvZEZAFuDYi3LKOUkmuK/t6T3UIct2Ry/v
	wnRORenqu4eUuMuiQNwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qRT0Z-006uu6-1r;
	Thu, 03 Aug 2023 07:44:31 +0000
Received: from ex01.ufhost.com ([61.152.239.75])
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qRT0U-006uqa-1w
	for linux-riscv@lists.infradead.org;
	Thu, 03 Aug 2023 07:44:29 +0000
Received: from EXMBX166.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX166", Issuer "EXMBX166" (not verified))
	by ex01.ufhost.com (Postfix) with ESMTP id 45F6E24E267;
	Thu,  3 Aug 2023 15:43:49 +0800 (CST)
Received: from EXMBX172.cuchost.com (172.16.6.92) by EXMBX166.cuchost.com
 (172.16.6.76) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Thu, 3 Aug
 2023 15:43:49 +0800
Received: from [192.168.125.136] (183.27.98.54) by EXMBX172.cuchost.com
 (172.16.6.92) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Thu, 3 Aug
 2023 15:43:48 +0800
Message-ID: <dae4bd27-4ea6-43b1-d65c-225be7b5640b@starfivetech.com>
Date: Thu, 3 Aug 2023 15:43:47 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v1 8/9] PCI: PLDA: starfive: Add JH7110 PCIe controller
Content-Language: en-US
To: =?UTF-8?Q?Pali_Roh=c3=a1r?= <pali@kernel.org>
CC: Bjorn Helgaas <helgaas@kernel.org>, Minda Chen
	<minda.chen@starfivetech.com>, Daire McNamara <daire.mcnamara@microchip.com>,
	Conor Dooley <conor@kernel.org>, Rob Herring <robh+dt@kernel.org>, "Krzysztof
 Kozlowski" <krzysztof.kozlowski+dt@linaro.org>, Bjorn Helgaas
	<bhelgaas@google.com>, Lorenzo Pieralisi <lpieralisi@kernel.org>,
	=?UTF-8?Q?Krzysztof_Wilczy=c5=84ski?= <kw@linux.com>, Emil Renner Berthing
	<emil.renner.berthing@canonical.com>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
	<linux-pci@vger.kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>,
	"Palmer Dabbelt" <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
	"Philipp Zabel" <p.zabel@pengutronix.de>, Mason Huo
	<mason.huo@starfivetech.com>, Leyfoon Tan <leyfoon.tan@starfivetech.com>,
	Mika Westerberg <mika.westerberg@linux.intel.com>, "Maciej W. Rozycki"
	<macro@orcam.me.uk>, =?UTF-8?Q?Marek_Beh=c3=ban?= <kabel@kernel.org>
References: <20230802171805.GA62238@bhelgaas>
 <1c546489-40dd-25c5-3ac2-9e3b3fd5a670@starfivetech.com>
 <20230803065835.twdicvx62mgzzzqi@pali>
From: Kevin Xie <kevin.xie@starfivetech.com>
In-Reply-To: <20230803065835.twdicvx62mgzzzqi@pali>
X-Originating-IP: [183.27.98.54]
X-ClientProxiedBy: EXCAS066.cuchost.com (172.16.6.26) To EXMBX172.cuchost.com
 (172.16.6.92)
X-YovoleRuleAgent: yovoleflag
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230803_004427_013225_016A0C28 
X-CRM114-Status: GOOD (  32.03  )
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

CgpPbiAyMDIzLzgvMyAxNDo1OCwgUGFsaSBSb2jDoXIgd3JvdGU6Cj4gT24gVGh1cnNkYXkgMDMg
QXVndXN0IDIwMjMgMTA6MjM6NDcgS2V2aW4gWGllIHdyb3RlOgo+PiBPbiAyMDIzLzgvMyAxOjE4
LCBCam9ybiBIZWxnYWFzIHdyb3RlOgo+PiA+IE9uIFR1ZSwgQXVnIDAxLCAyMDIzIGF0IDAzOjA1
OjQ2UE0gKzA4MDAsIEtldmluIFhpZSB3cm90ZToKPj4gPj4gT24gMjAyMy84LzEgNzoxMiwgQmpv
cm4gSGVsZ2FhcyB3cm90ZToKPj4gPj4gLi4uCj4+ID4gCj4+ID4+ID4gVGhlIGRlbGF5IHJlcXVp
cmVkIGJ5IHNlYyA2LjYuMSBpcyBhIG1pbmltdW0gb2YgMTAwbXMgZm9sbG93aW5nIGV4aXQKPj4g
Pj4gPiBmcm9tIHJlc2V0IG9yLCBmb3IgZmFzdCBsaW5rcywgMTAwbXMgYWZ0ZXIgbGluayB0cmFp
bmluZyBjb21wbGV0ZXMuCj4+ID4+ID4gCj4+ID4+ID4gVGhlIGNvbW1lbnQgYXQgdGhlIGNhbGwg
b2YgYWR2a19wY2llX3dhaXRfZm9yX2xpbmsoKSBbMl0gc2F5cyBpdCBpcwo+PiA+PiA+IHRoZSBk
ZWxheSByZXF1aXJlZCBieSBzZWMgNi42LjEsIGJ1dCB0aGF0IGRvZXNuJ3Qgc2VlbSByaWdodCB0
byBtZS4KPj4gPj4gPiAKPj4gPj4gPiBGb3Igb25lIHRoaW5nLCBJIGRvbid0IHRoaW5rIDYuNi4x
IHNheXMgYW55dGhpbmcgYWJvdXQgImxpbmsgdXAiIGJlaW5nCj4+ID4+ID4gdGhlIGVuZCBvZiBh
IGRlbGF5LiAgU28gaWYgd2Ugd2FudCB0byBkbyB0aGUgZGVsYXkgcmVxdWlyZWQgYnkgNi42LjEs
Cj4+ID4+ID4gIndhaXRfZm9yX2xpbmsoKSIgZG9lc24ndCBzZWVtIGxpa2UgcXVpdGUgdGhlIHJp
Z2h0IG5hbWUuCj4+ID4+ID4gCj4+ID4+ID4gRm9yIGFub3RoZXIsIGFsbCB0aGUgKl93YWl0X2Zv
cl9saW5rKCkgZnVuY3Rpb25zIGNhbiByZXR1cm4gc3VjY2Vzcwo+PiA+PiA+IGFmdGVyIDBtcywg
OTBtcywgMTgwbXMsIGV0Yy4gIFRoZXkncmUgdW5saWtlbHkgdG8gcmV0dXJuIGFmdGVyIDBtcywK
Pj4gPj4gPiBidXQgOTBtcyBpcyBxdWl0ZSBwb3NzaWJsZS4gIElmIHdlIGF2b2lkZWQgdGhlIDBt
cyByZXR1cm4gYW5kCj4+ID4+ID4gTElOS19XQUlUX1VTTEVFUF9NSU4gd2VyZSAxMDBtcyBpbnN0
ZWFkIG9mIDkwbXMsIHRoYXQgc2hvdWxkIGJlIGVub3VnaAo+PiA+PiA+IGZvciBzbG93IGxpbmtz
LCB3aGVyZSB3ZSBuZWVkIDEwMG1zIGZvbGxvd2luZyAiZXhpdCBmcm9tIHJlc2V0LiIKPj4gPj4g
PiAKPj4gPj4gPiBCdXQgaXQncyBzdGlsbCBub3QgZW5vdWdoIGZvciBmYXN0IGxpbmtzIHdoZXJl
IHdlIG5lZWQgMTAwbXMgImFmdGVyCj4+ID4+ID4gbGluayB0cmFpbmluZyBjb21wbGV0ZXMiIGJl
Y2F1c2Ugd2UgZG9uJ3Qga25vdyB3aGVuIHRyYWluaW5nCj4+ID4+ID4gY29tcGxldGVkLiAgSWYg
dHJhaW5pbmcgY29tcGxldGVkIDg5bXMgaW50byAqX3dhaXRfZm9yX2xpbmsoKSwgd2Ugb25seQo+
PiA+PiA+IGRlbGF5IDFtcyBhZnRlciB0aGF0Lgo+PiA+PiAKPj4gPj4gVGhhdCdzIHRoZSBwb2lu
dCwgd2Ugd2lsbCBhZGQgYSBleHRyYSAxMDBtcyBhZnRlciBQRVJTVCMgZGUtYXNzZXJ0Cj4+ID4+
IGluIHRoZSBwYXRjaC12MyBhY2NvcmRpbmcgdG8gQmFzZSBTcGVjIHI2LjAgLSA2LjYuMToKPj4g
Pj4gICAgICAgICBtc2xlZXAoMTAwKTsKPj4gPj4gICAgICAgICBncGlvZF9zZXRfdmFsdWVfY2Fu
c2xlZXAocGNpZS0+cmVzZXRfZ3BpbywgMCk7Cj4+ID4+IAo+PiA+PiArICAgICAgIC8qIEFzIHRo
ZSByZXF1aXJlbWVudCBpbiBQQ0llIGJhc2Ugc3BlYyByNi4wLCBzeXN0ZW0gbXVzdCB3YWl0IGEK
Pj4gPj4gKyAgICAgICAgKiBtaW5pbXVtIG9mIDEwMCBtcyBmb2xsb3dpbmcgZXhpdCBmcm9tIGEg
Q29udmVudGlvbmFsIFJlc2V0Cj4+ID4+ICsgICAgICAgICogYmVmb3JlIHNlbmRpbmcgYSBDb25m
aWd1cmF0aW9uIFJlcXVlc3QgdG8gdGhlIGRldmljZS4qLwo+PiA+PiArICAgICAgIG1zbGVlcCgx
MDApOwo+PiA+PiArCj4+ID4+ICAgICAgICAgaWYgKHN0YXJmaXZlX3BjaWVfaG9zdF93YWl0X2Zv
cl9saW5rKHBjaWUpKQo+PiA+PiAgICAgICAgICAgICAgICAgcmV0dXJuIC1FSU87Cj4+ID4gCj4+
ID4gRm9yIGZhc3QgbGlua3MgKGxpbmtzIHRoYXQgc3VwcG9ydCA+IDUuMCBHVC9zKSwgdGhlIDEw
MG1zIHN0YXJ0cwo+PiA+ICphZnRlciogbGluayB0cmFpbmluZyBjb21wbGV0ZXMuICBUaGUgYWJv
dmUgbG9va3MgT0sgaWYgc3RhcmZpdmUgb25seQo+PiA+IHN1cHBvcnRzIHNsb3cgbGlua3MsIGJ1
dCB0aGVuIEknbSBub3Qgc3VyZSB3aHkgd2Ugd291bGQgbmVlZAo+PiA+IHN0YXJmaXZlX3BjaWVf
aG9zdF93YWl0X2Zvcl9saW5rKCkuCj4+ID4gCj4+IFllcywgdGhlIG1heGltdW0gc3BlZWQgb2Yg
Skg3MTEwIFBDSWUgaXMgNS4wIEdUL3MgKEdlbjJ4MSkuCj4+IAo+PiBBYm91dCBzdGFyZml2ZV9w
Y2llX2hvc3Rfd2FpdF9mb3JfbGluaygpOgo+PiBKSDcxMTAgU29DIG9ubHkgaGFzIG9uZSByb290
IHBvcnQgaW4gZWFjaCBQQ0llIGNvbnRyb2xsZXIgKDIgaW4gdG90YWwpCj4+IGFuZCB0aGV5IGRv
IG5vdCBzdXBwb3J0IGhvdC1wbHVnIHlldC4KPiAKPiBCZXdhcmUgdGhhdCBldmVuIGlmIEhXIGRv
ZXMgbm90IHN1cHBvcnQgaG90cGx1ZywgZW5kcG9pbnQgUENJZSBjYXJkCj4gc3RpbGwgbWF5IGRy
b3AgdGhlIGxpbmsgZG93biBhbmQgbGF0ZXIgcHV0IGl0IHVwIChmb3IgZXhhbXBsZSBpZiBGVyBp
bgo+IHRoZSBjYXJkIGNyYXNoZXMgb3Igd2hlbiBjYXJkIHdhbnQgdG8gZG8gaW50ZXJuYWwgcmVz
ZXQsIGV0Yy4uLjsgdGhpcyBpcwo+IHZlcnkgY29tbW9uIGZvciB3aWZpIGNhcmRzKS4gU28gZHJp
dmVycyBmb3Igbm9uLWhvdHBsdWcgY29udHJvbGxlcnMKPiBzdGlsbCBoYXZlIHRvIGhhbmRsZSBo
b3RwbHVnIGV2ZW50cyBnZW5lcmF0ZWQgYnkgbGluayB1cC9kb3duIHN0YXRlLgo+IAo+IFNvIGl0
IG1lYW5zIHRoYXQsIGlmIGVuZHBvaW50IFBDSWUgY2FyZCBpcyBub3QgZGV0ZWN0ZWQgZHVyaW5n
IHByb2JlCj4gdGltZSwgaXQgbWF5IGJlIGRldGVjdGVkIGxhdGVyLiBTbyB0aGlzIGNoZWNrIHRv
IGNvbXBsZXRlbHkgc3RvcAo+IHJlZ2lzdGVyaW5nIGNvbnRyb2xsZXIgaXMgbm90IGEgZ29vZCBp
ZGVhLiBOb3RlIHRoYXQgdXNlcnNwYWNlIGNhbgo+IHRlbGwga2VybmVsICh2aWEgc3lzZnMpIHRv
IHJlc2NhbiBhbGwgUENJZSBidXNlcyBhbmQgdHJ5IHRvIGRpc2NvdmVyIG5ldwo+IFBDSWVhIGRl
dmljZXMuCj4gCgpZZXMsIHdlIHNob3VsZCBub3QgaWdub3JlZCB0aGlzIHNpdHVhdGlvbi4KCj4+
IFRodXMsIFdlIGFkZCBzdGFyZml2ZV9wY2llX2hvc3Rfd2FpdF9mb3JfbGluaygpIHRvIHBvbGwg
aWYgaXQgaXMgYSBlbXB0eSBzbG90Lgo+PiBJZiBub3RoaW5nIGhlcmUsIHdlIHdpbGwgZXhpdCB0
aGUgcHJvYmUoKSBvZiB0aGlzIGNvbnRyb2xsZXIsIGFuZCBpdCB3aWxsIG5vdAo+PiBnbyBpbnRv
IHBjaV9ob3N0X3Byb2JlKCkgdG9vLgo+PiBUaGlzIG1heSBub3QgYmUgYSB2ZXJ5IHN0YW5kYXJk
IGxvZ2ljLCBzaG91bGQgd2UgcmVtb3ZlIGl0IG9yIHJld3JpdGUgaW4gYSBiZXR0ZXIgd2F5Pwo+
PiAKPj4gPiBCam9ybgo+IAo+IFJhdGhlciB0byByZW1vdmUgdGhpcyBzdGFyZml2ZV9wY2llX2hv
c3Rfd2FpdF9mb3JfbGluayBsb2dpYy4KPiAKPiBCZXR0ZXIgb3B0aW9uIHdvdWxkIGJlIHRvIHRl
YWNoIFBDSSBjb3JlIGNvZGUgdG8gd2FpdCBmb3IgdGhlIGxpbmsKPiBiZWZvcmUgdHJ5aW5nIHRv
IHJlYWQgdmVuZG9yL2RldmljZSBpZHMsIGxpa2UgSSBkZXNjcmliZWQgaW4gbXkgb2xkCj4gcHJv
cG9zYWwuCgpZZXMsIHRoZSBwcm9wb3NhbCBjYW4gcHJldmVudCB1cyBmcm9tIHdyaXRpbmcgdGhl
IHdyb25nIHRpbWluZy4KSG93ZXZlciwgYXMgdGhpbmdzIHN0YW5kLCB3ZSBoYXZlIHRvIGRvIHRo
ZSB3YWl0aW5nIGluIGhvc3QgY29udHJvbGxlciBkcml2ZXIgbm93LgpXZSB3aWxsIGtlZXAgdGhl
IHdhaXQgZm9yIHRoZSBsaW5rLCBidXQgZG9uJ3QgcmV0dXJuIGVycm9yIHdoZW4gdGhlIGxpbmsg
aXMgZG93biwKc3VjaCBhczoKICAgIGlmIChzdGFyZml2ZV9wY2llX2hvc3Rfd2FpdF9mb3JfbGlu
ayhwY2llKSkKCWRldl9pbmZvKGRldiwgInBvcnQgbGluayBkb3duXG4iKTsKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcg
bGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRl
YWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
