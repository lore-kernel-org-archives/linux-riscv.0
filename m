Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2414CA0EC8
	for <linux-riscv@archiver.kernel.org>; Tue, 12 Sep 2023 02:01:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=l2Tqm8Pt3fLPuprJh9fbtDH3mLpJPPmVWbH+tfkkk0s=; b=f4kAwtCdGrovMg
	qv6AwlFOlAHyOz6qWO582/DbGGx3PXuIEgqZb+nrwvZp8Xr3qxcrWsYNLIFqMtxln3ghJ/CcVNXsa
	GGAT7VnZAbsKFNrmPQbm4pqS/GhPogSFhdIzCStijM4BqCNcAGmd/cW17zkeuAOsn5DcrXPnxO+1Z
	nOfiAEpDvrSYtTQL4xIyufmofy19lrLOZAMSP38v1PA8G9sg4zmEtQ7/qfWV6LdRNGQHKnrZwbvFX
	YnA06HRh460KhDtro7a6A+yF20gWxFzUBay2uupgDLxeOVUfDFuScQ+5bRwwB4KCoxOM9RsoNEavo
	LTmAiME1gLz1LUkwvG/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qfsiG-001o8w-2q;
	Tue, 12 Sep 2023 02:01:12 +0000
Received: from ex01.ufhost.com ([61.152.239.75])
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qfsiB-001nzL-1T
	for linux-riscv@lists.infradead.org;
	Tue, 12 Sep 2023 02:01:11 +0000
Received: from EXMBX165.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX165", Issuer "EXMBX165" (not verified))
	by ex01.ufhost.com (Postfix) with ESMTP id 0D38324E267;
	Tue, 12 Sep 2023 10:00:23 +0800 (CST)
Received: from EXMBX168.cuchost.com (172.16.6.78) by EXMBX165.cuchost.com
 (172.16.6.75) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Tue, 12 Sep
 2023 10:00:23 +0800
Received: from [192.168.120.76] (171.223.208.138) by EXMBX168.cuchost.com
 (172.16.6.78) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Tue, 12 Sep
 2023 10:00:22 +0800
Message-ID: <5e7b00c2-7579-04b5-2d37-249ed30ca668@starfivetech.com>
Date: Tue, 12 Sep 2023 10:00:20 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [PATCH v1 1/3] dt-bindings: mmc: Drop unused properties
To: Conor Dooley <conor@kernel.org>, Emil Renner Berthing
	<emil.renner.berthing@canonical.com>
CC: Jessica Clarke <jrtc27@jrtc27.com>, Conor Dooley
	<conor.dooley@microchip.com>, Krzysztof Kozlowski
	<krzysztof.kozlowski@linaro.org>, "open list:OPEN FIRMWARE AND FLATTENED
 DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, LKML
	<linux-kernel@vger.kernel.org>, linux-riscv
	<linux-riscv@lists.infradead.org>, <linux-mmc@vger.kernel.org>, "Emil Renner
 Berthing" <kernel@esmil.dk>, Rob Herring <robh+dt@kernel.org>, Jaehoon Chung
	<jh80.chung@samsung.com>, Ulf Hansson <ulf.hansson@linaro.org>, "Krzysztof
 Kozlowski" <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley
	<conor+dt@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>, "Palmer
 Dabbelt" <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>
References: <20230830031846.127957-2-william.qiu@starfivetech.com>
 <20230830-commence-trickery-40eaa193cb15@wendy>
 <b375b88c-0d9c-30a9-21f6-283083cf3880@linaro.org>
 <20230830-procedure-frostbite-56c751f7c276@wendy>
 <efab6f52-4d7f-ea3c-0fc3-4e3ad03c14c7@starfivetech.com>
 <20230901-remold-sublease-a1ddb1fc6348@spud>
 <9EF26965-10E5-4BCA-AC5E-93C5AA55A0DF@jrtc27.com>
 <20230901-affected-wanting-ab517791a870@spud>
 <dd63bb4f-a59b-0323-08fb-03f8cc048b6e@starfivetech.com>
 <CAJM55Z8XowmB-Hfzr+hBtWu+SGL2v7jya6Nx5_rATf8=5qA4Fg@mail.gmail.com>
 <20230911-implosive-shrill-506d18d9bde2@spud>
Content-Language: en-US
From: William Qiu <william.qiu@starfivetech.com>
In-Reply-To: <20230911-implosive-shrill-506d18d9bde2@spud>
X-Originating-IP: [171.223.208.138]
X-ClientProxiedBy: EXCAS066.cuchost.com (172.16.6.26) To EXMBX168.cuchost.com
 (172.16.6.78)
X-YovoleRuleAgent: yovoleflag
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230911_190107_948301_A791853B 
X-CRM114-Status: GOOD (  35.25  )
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

CgpPbiAyMDIzLzkvMTIgMDoxNCwgQ29ub3IgRG9vbGV5IHdyb3RlOgo+IE9uIEZyaSwgU2VwIDA4
LCAyMDIzIGF0IDAzOjMyOjM2UE0gKzAyMDAsIEVtaWwgUmVubmVyIEJlcnRoaW5nIHdyb3RlOgo+
PiBPbiBGcmksIDggU2VwdCAyMDIzIGF0IDEyOjAzLCBXaWxsaWFtIFFpdSA8d2lsbGlhbS5xaXVA
c3RhcmZpdmV0ZWNoLmNvbT4gd3JvdGU6Cj4+ID4gT24gMjAyMy85LzIgMTo0MywgQ29ub3IgRG9v
bGV5IHdyb3RlOgo+PiA+ID4gT24gRnJpLCBTZXAgMDEsIDIwMjMgYXQgMDY6MjA6MzhQTSArMDEw
MCwgSmVzc2ljYSBDbGFya2Ugd3JvdGU6Cj4+ID4gPj4gT24gMSBTZXAgMjAyMywgYXQgMTY6NDIs
IENvbm9yIERvb2xleSA8Y29ub3JAa2VybmVsLm9yZz4gd3JvdGU6Cj4+ID4gPj4gPgo+PiA+ID4+
ID4gT24gRnJpLCBTZXAgMDEsIDIwMjMgYXQgMTA6MzM6MTNBTSArMDgwMCwgV2lsbGlhbSBRaXUg
d3JvdGU6Cj4+ID4gPj4gPj4KPj4gPiA+PiA+Pgo+PiA+ID4+ID4+IE9uIDIwMjMvOC8zMCAxNjoz
NCwgQ29ub3IgRG9vbGV5IHdyb3RlOgo+PiA+ID4+ID4+PiBPbiBXZWQsIEF1ZyAzMCwgMjAyMyBh
dCAwOToyOToyMEFNICswMjAwLCBLcnp5c3p0b2YgS296bG93c2tpIHdyb3RlOgo+PiA+ID4+ID4+
Pj4gT24gMzAvMDgvMjAyMyAwODo1MCwgQ29ub3IgRG9vbGV5IHdyb3RlOgo+PiA+ID4+ID4+Pj4+
IE9uIFdlZCwgQXVnIDMwLCAyMDIzIGF0IDExOjE4OjQ0QU0gKzA4MDAsIFdpbGxpYW0gUWl1IHdy
b3RlOgo+PiA+ID4+ID4+Pj4+PiBEdWUgdG8gdGhlIGNoYW5nZSBvZiB0dW5pbmcgaW1wbGVtZW50
YXRpb24sIGl0J3Mgbm8gbG9uZ2VyIG5lY2Vzc2FyeSB0bwo+PiA+ID4+ID4+Pj4+PiB1c2UgdGhl
ICJzdGFyZml2ZSxzeXNyZWciIHByb3BlcnR5IGluIGR0cywgc28gZHJvcCB0aGUgcmVsZXZhbnQK
Pj4gPiA+PiA+Pj4+Pj4gZGVzY3JpcHRpb24gaW4gZHQtYmluZGluZ3MgaGVyZS4KPj4gPiA+PiA+
Pj4+Pgo+PiA+ID4+ID4+Pj4+IEhvdyBkb2VzIGNoYW5naW5nIHlvdXIgc29mdHdhcmUgaW1wbGFu
dGF0aW9uIGludmFsaWRhdGUgYSBkZXNjcmlwdGlvbiBvZgo+PiA+ID4+ID4+Pj4+IHRoZSBoYXJk
d2FyZT8KPj4gPiA+PiA+Pj4+Pgo+PiA+ID4+ID4+Pj4KPj4gPiA+PiA+Pj4+IFdoaWNoIGlzIGtp
bmQgb2YgcHJvb2YgdGhhdCB0aGlzIHN5c2NvbiB3YXMganVzdCB0byBzdWJzdGl0dXRlCj4+ID4g
Pj4gPj4+PiBpbmNvbXBsZXRlIGhhcmR3YXJlIGRlc2NyaXB0aW9uIChlLmcuIG1pc3NpbmcgY2xv
Y2tzIGFuZCBwaHlzKS4gV2UKPj4gPiA+PiA+Pj4+IHNob3VsZCBoYXZlIHJlamVjdGVkIGl0LiBK
dXN0IGxpa2Ugd2Ugc2hvdWxkIHJlamVjdCB0aGVtIGluIHRoZSBmdXR1cmUuCj4+ID4gPj4gPj4+
Cj4+ID4gPj4gPj4+IDpzIEkgZHVubm8gd2hhdCB0byBkbyB3aXRoIHRoaXMuLi4gSSdtIGluY2xp
bmVkIHRvIHNheSBub3QgdG8gcmVtb3ZlIGl0Cj4+ID4gPj4gPj4+IGZyb20gdGhlIGJpbmRpbmcg
b3IgZHRzIGF0IGFsbCAmIG9ubHkgY2hhbmdlIHRoZSBzb2Z0d2FyZS4KPj4gPiA+PiA+Pj4KPj4g
PiA+PiA+Pj4+IFRoZXJlIGFyZSBqdXN0IGZldyBjYXNlcyB3aGVyZSBzeXNjb24gaXMgcmVhc29u
YWJsZS4gQWxsIG90aGVycyBpcyBqdXN0Cj4+ID4gPj4gPj4+PiBsYXppbmVzcy4gSXQncyBub3Qg
b25seSBzdGFyZml2ZXRlY2gsIG9mIGNvdXJzZS4gU2V2ZXJhbCBvdGhlcgo+PiA+ID4+ID4+Pj4g
Y29udHJpYnV0b3JzIGRvIHRoZSBzYW1lLgo+PiA+ID4+ID4+Pgo+PiA+ID4+ID4+PiBJJ20gbm90
IHN1cmUgaWYgbGF6aW5lc3MgaXMgZmFpciwgbGFjayBvZiB1bmRlcnN0YW5kaW5nIGlzIHVzdWFs
bHkgbW9yZQo+PiA+ID4+ID4+PiBsaWtlbHkuCj4+ID4gPj4gPj4KPj4gPiA+PiA+PiBGb3IgdGhp
cywgSSB0ZW5kIHRvIGtlZXAgaXQgaW4gYmluZGluZywgYnV0IHJlbW92ZSBpdCBmcm9tIHJlcXVp
cmVkLiBCZWNhdXNlCj4+ID4gPj4gPj4gd2Ugb25seSBtb2RpZnkgdGhlIHR1bmluZyBpbXBsZW1l
bnRhdGlvbiwgaXQgZG9lc24ndCBtZWFuIHRoYXQgdGhpcyBwcm9wZXJ0eQo+PiA+ID4+ID4+IG5l
ZWQgdG8gYmUgcmVtb3ZlZCwgaXQncyBqdXN0IG5vIGxvbmdlciBiZSB0aGUgcmVxdWlyZWQgb25l
Lgo+PiA+ID4+ID4KPj4gPiA+PiA+IFBsZWFzZSBvbmx5IHJlbW92ZSBpdCBmcm9tIHJlcXVpcmVk
IGlmIHRoZSBjdXJyZW50IGRyaXZlciBkb2Vzbid0IGJyZWFrCj4+ID4gPj4gPiBpZiB0aGUgcmVn
bWFwIGlzIHJlbW92ZWQuCj4+ID4gPj4KPj4gPiA+PiBFaXRoZXIgd2F5IHBsZWFzZSBtYWtlIHN1
cmUgdGhlIGRvY3VtZW50YXRpb24gY2xlYXJseSBzdGF0ZXMg4oCcbmV2ZXIgdXNlCj4+ID4gPj4g
dGhpcywgaWYgeW914oCZcmUgdXNpbmcgaXQgeW914oCZcmUgZG9pbmcgaXQgd3JvbmcsIHRoaXMg
b25seSBleGlzdHMKPj4gPiA+PiBiZWNhdXNlIGl0IHdhcyB3cm9uZ2x5IHVzZWQgaW4gdGhlIHBh
c3TigJ0uIE90aGVyd2lzZSBwZW9wbGUgd3JpdGluZwo+PiA+ID4+IGRyaXZlcnMgZm9yIG90aGVy
IE9TZXMgd2lsbCBwcm9iYWJseSB1c2UgaXQgdG9vIHRoaW5raW5nIHRoZXkgbmVlZCB0by4KPj4g
PiA+Cj4+ID4gPiBNYXliZSB3ZSBzaG91bGQganVzdCBkZWxldGUgaXQgaWYgdGhlIGltcGFjdCBp
cyBnb2luZyB0byBiZSBuZWdsaWdpYmxlLAo+PiA+ID4gc291bmRzIGxpa2UgeW91J3JlIG5vdCB1
c2luZyBpdCBpbiBGcmVlQlNELCB3aGljaCB3YXMgcGFydCBvZiB3aGF0IEkgd2FzCj4+ID4gPiB3
b3JyaWVkIGFib3V0LiBHdWVzcyBpdCBkZXBlbmRzIG9uIHdoYXQgRW1pbCAmIHRoZSBkaXN0cm8g
aGVhZHMgdGhpbmsuCj4+ID4gSGkgQ29ub3IsCj4+ID4KPj4gPiBBZnRlciBkaXNjdXNzaW5nIGl0
IHdpdGggb3VyIGNvbGxlYWd1ZXMsIHdlIGRlY2lkZWQgdGhhdCBkZWxldGluZyBpdCB3YXMgdGhl
IGJlc3QKPj4gPiBjb3Vyc2Ugb2YgYWN0aW9uLiBTaW5jZSB0aGVyZSB3aWxsIG5vIGxvbmdlciBi
ZSBhIHJlbGF0ZWQgaW1wbGVtZW50YXRpb24gb2YKPj4gPiAic3RhcmZpdmUsc3lzcmVnIiBpbiBm
dXR1cmUgZHJpdmVycywgZXZlbiBpZiB0aGUgZHQtYmluZGluZyBpcyBkZXNjcmliZWQsIGl0IHdp
bGwKPj4gPiBiZSAibmV2ZXIgdXNlIiwgc28gSSB0aGluayBpdCBzaG91bGQgYmUgZGVsZXRlZC4K
Pj4gPgo+PiA+IFdoYXQgZG8geW91IHRoaW5rPwo+PiAKPj4gVGhlIGRldmljZSB0cmVlIHNob3Vs
ZCBiZSBhIGRlc2NyaXB0aW9uIG9mIHRoZSBoYXJkd2FyZSBhbmQgdGhlcmUKPj4gcmVhbGx5IGlz
IGEgJ3UwX3NkaW9fZGF0YV9zdHJvYmVfcGhhc2VfY3RybCcgZmllbGQgaW4gdGhlIHN5c3JlZwo+
PiByZWdpc3RlcnNbMV0gb24gdGhlIEpINzExMCB0aGF0IHNlZW1zIHRvIGRvIF9zb21ldGhpbmdf
IHJlbGF0ZWQgdG8gdGhlCj4+IHNkaW8gaW50ZXJmYWNlLiBTbyBJIGRvbid0IHRoaW5rIHRoZSBm
YWN0IHRoYXQgdGhlIExpbnV4IGRyaXZlciBubwo+PiBsb25nZXIgdXNlcyBpdCBpcyBhIGdvb2Qg
cmVhc29uIHRvIHJlbW92ZSBpdCwgYnV0IGlmIHRoZXJlIGFyZSBzb21lCj4+IG90aGVyIHByYWdt
YXRpYyByZWFzb25zIHRvIGRvIHNvIHRoZW4gSSdtIGZpbmUgd2l0aCBpdC4gUmVtb3ZpbmcgaXQK
Pj4gZnJvbSB0aGUgbGlzdCBvZiByZXF1aXJlZCBwcm9wZXJ0aWVzIHNob3VsZCBiZSBmaW5lIHRo
b3VnaC4KPiAKPiBTR1RNLiBDYW4geW91IHVwZGF0ZSB0aGUgcGF0Y2ggdG8gZG8gdGhhdCBwbGVh
c2UgV2lsbGlhbT8KPiAKPiBUaGFua3MsCj4gQ29ub3IuCgpPSywgSSB3aWxsIHVwZGF0ZSB0aGUg
cGF0Y2ggYXMgc3VnZ2VzdGVkIGJ5IEVtaWwuCgpCZXN0IFJlZ2FyZHMsCldpbGxpYW0KCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1h
aWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5p
bmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
