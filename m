Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 243BDC54EBD
	for <linux-riscv@archiver.kernel.org>; Mon,  9 Jan 2023 16:21:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qMFtCpZnyE1WKHcW9f9LBc2oH8nl8u0Fjf+Y4CuzpGE=; b=SCh8GKjJOAo8zL
	alJYgQs04n4TMSYzS5Up4fELeSQaykHDsF6TAaU0H1xeHHiXM8F3I0Mo5Vpg11vMElEep2SXER8Ko
	Iwp54pROzDck8B5ykvBcG3o55FBKPAxxbKTvDNxBImUC0TQau5YRskLwH9ohqI78D3/p8hay3Kj72
	jQgeIx1w1Te7ZjgCYtZpLzYqhoqK1fRVMNu4tqd8qKHqqI+v/+zK+jqZz7vJ0aj3Osued9jaBnbsU
	LeaVdou8ElzD7nmR/mACOrw/ASvxqiC46pLVO0iUalQztclokeg+Hu1ZertjAdpmcXw12SOar2Z8C
	zLvAEE2N2OmL1U8uy4QQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pEuuA-002YNF-DT; Mon, 09 Jan 2023 16:21:46 +0000
Received: from lelv0143.ext.ti.com ([198.47.23.248])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pEuu6-002YL9-HZ; Mon, 09 Jan 2023 16:21:44 +0000
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 309GLBjO115220;
	Mon, 9 Jan 2023 10:21:11 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1673281271;
	bh=Pn0x0PUzOG1Nvv4uHwUprL4noTeFPolAuH0p0G35kzw=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=ujuLBGa8GIXkzhgLCqx5SZOW1tq6Nmo/FJklVTGE/9EpwZTkBdXF4OQuFvmuz2sxj
	 rjrZ5CraNnwmBJIMjPBZW4Z6DULfypCY2Po/yhenjCjHJkZrFSZ6RL7Gg6LzLxOXWy
	 gAilse7dcHQ9KpHfIFSx+Y/WIAFBcuw/uTWkeZvw=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 309GLBQ0004753
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 9 Jan 2023 10:21:11 -0600
Received: from DFLE110.ent.ti.com (10.64.6.31) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16; Mon, 9
 Jan 2023 10:21:11 -0600
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE110.ent.ti.com
 (10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16 via
 Frontend Transport; Mon, 9 Jan 2023 10:21:11 -0600
Received: from [10.250.234.21] (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 309GL0ut002438;
	Mon, 9 Jan 2023 10:21:01 -0600
Message-ID: <431ddd82-055b-2526-3d5e-f6563e48d264@ti.com>
Date: Mon, 9 Jan 2023 21:51:00 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [RFC PATCH 3/4] dt-bindings: panel: Introduce dual-link LVDS
 panel
Content-Language: en-US
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        Rob
 Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>,
        Tomi Valkeinen <tomba@kernel.org>, Jyri
 Sarha <jyri.sarha@iki.fi>,
        David Airlie <airlied@gmail.com>, Daniel Vetter
	<daniel@ffwll.ch>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Sam Ravnborg <sam@ravnborg.org>, Maxime Ripard <maxime@cerno.tech>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark
 Brown <broonie@kernel.org>,
        Lad Prabhakar
	<prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Paul Walmsley
	<paul.walmsley@sifive.com>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou
	<aou@eecs.berkeley.edu>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Guo Ren
	<guoren@kernel.org>
CC: DRI Development List <dri-devel@lists.freedesktop.org>,
        Devicetree List
	<devicetree@vger.kernel.org>,
        Linux Kernel List
	<linux-kernel@vger.kernel.org>,
        Linux RISC-V List
	<linux-riscv@lists.infradead.org>,
        Linux ARM Kernel List
	<linux-arm-kernel@lists.infradead.org>,
        Linux Mediatek List
	<linux-mediatek@lists.infradead.org>,
        Linux C-SKY Arch List
	<linux-csky@vger.kernel.org>,
        Nishanth Menon <nm@ti.com>, Vignesh Raghavendra
	<vigneshr@ti.com>,
        Rahul T R <r-ravikumar@ti.com>, Devarsh Thakkar
	<devarsht@ti.com>,
        Jai Luthra <j-luthra@ti.com>, Jayesh Choudhary
	<j-choudhary@ti.com>
References: <20230103064615.5311-1-a-bhatia1@ti.com>
 <20230103064615.5311-4-a-bhatia1@ti.com>
 <09f1ca83-c7d5-a186-6fa6-09cdd7a0b9cc@collabora.com>
From: Aradhya Bhatia <a-bhatia1@ti.com>
In-Reply-To: <09f1ca83-c7d5-a186-6fa6-09cdd7a0b9cc@collabora.com>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230109_082142_688078_EEA444EA 
X-CRM114-Status: GOOD (  22.56  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

SGkgQW5nZWxvLAoKVGhhbmtzIGZvciB0YWtpbmcgYSBsb29rIGF0IHRoZSBwYXRjaGVzIQoKT24g
MDMtSmFuLTIzIDE3OjIxLCBBbmdlbG9HaW9hY2NoaW5vIERlbCBSZWdubyB3cm90ZToKPiBJbCAw
My8wMS8yMyAwNzo0NiwgQXJhZGh5YSBCaGF0aWEgaGEgc2NyaXR0bzoKPj4gRHVhbC1saW5rIExW
RFMgaW50ZXJmYWNlcyBoYXZlIDIgbGlua3MsIHdpdGggZXZlbiBwaXhlbHMgdHJhdmVsaW5nIG9u
Cj4+IG9uZSBsaW5rLCBhbmQgb2RkIHBpeGVscyBvbiB0aGUgb3RoZXIuIFRoZXNlIHBhbmVscyBh
cmUgYWxzbyBnZW5lcmljIGluCj4+IG5hdHVyZSwgd2l0aCBubyBkb2N1bWVudGVkIGNvbnN0cmFp
bnRzLCBtdWNoIGxpa2UgdGhlaXIgc2luZ2xlLWxpbmsKPj4gY291bnRlcnBhcnRzLCAicGFuZWwt
bHZkcyIuCj4+Cj4+IEFkZCBhIG5ldyBjb21wYXRpYmxlLCAicGFuZWwtZHVhbC1sdmRzIiwgYW5k
IGEgZHQtYmluZGluZyBkb2N1bWVudCBmb3IKPj4gdGhlc2UgcGFuZWxzLgo+Pgo+PiBTaWduZWQt
b2ZmLWJ5OiBBcmFkaHlhIEJoYXRpYSA8YS1iaGF0aWExQHRpLmNvbT4KPj4gLS0tCj4+IMKgIC4u
Li9kaXNwbGF5L3BhbmVsL3BhbmVsLWR1YWwtbHZkcy55YW1swqDCoMKgwqDCoMKgwqAgfCAxNTcg
KysrKysrKysrKysrKysrKysrCj4+IMKgIE1BSU5UQUlORVJTwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfMKgwqAgMSAr
Cj4+IMKgIDIgZmlsZXMgY2hhbmdlZCwgMTU4IGluc2VydGlvbnMoKykKPj4gwqAgY3JlYXRlIG1v
ZGUgMTAwNjQ0IAo+PiBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9w
YW5lbC9wYW5lbC1kdWFsLWx2ZHMueWFtbAo+Pgo+PiBkaWZmIC0tZ2l0IAo+PiBhL0RvY3VtZW50
YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L3BhbmVsL3BhbmVsLWR1YWwtbHZkcy55
YW1sIAo+PiBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L3BhbmVs
L3BhbmVsLWR1YWwtbHZkcy55YW1sCj4+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0Cj4+IGluZGV4IDAw
MDAwMDAwMDAwMC4uODhhN2FhMjQxMGJlCj4+IC0tLSAvZGV2L251bGwKPj4gKysrIAo+PiBiL0Rv
Y3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L3BhbmVsL3BhbmVsLWR1YWwt
bHZkcy55YW1sCj4+IEBAIC0wLDAgKzEsMTU3IEBACj4+ICsjIFNQRFgtTGljZW5zZS1JZGVudGlm
aWVyOiAoR1BMLTIuMC1vbmx5IE9SIEJTRC0yLUNsYXVzZSkKPj4gKyVZQU1MIDEuMgo+PiArLS0t
Cj4+ICskaWQ6IGh0dHA6Ly9kZXZpY2V0cmVlLm9yZy9zY2hlbWFzL2Rpc3BsYXkvcGFuZWwvcGFu
ZWwtZHVhbC1sdmRzLnlhbWwjCj4+ICskc2NoZW1hOiBodHRwOi8vZGV2aWNldHJlZS5vcmcvbWV0
YS1zY2hlbWFzL2NvcmUueWFtbCMKPj4gKwo+PiArdGl0bGU6IEdlbmVyaWMgRHVhbC1MaW5rIExW
RFMgRGlzcGxheSBQYW5lbAo+PiArCj4+ICttYWludGFpbmVyczoKPj4gK8KgIC0gQXJhZGh5YSBC
aGF0aWEgPGEtYmhhdGlhMUB0aS5jb20+Cj4+ICvCoCAtIFRoaWVycnkgUmVkaW5nIDx0aGllcnJ5
LnJlZGluZ0BnbWFpbC5jb20+Cj4+ICsKPj4gK2Rlc2NyaXB0aW9uOiB8Cj4+ICvCoCBBIGR1YWwt
TFZEUyBpbnRlcmZhY2UgaXMgYSBkdWFsLWxpbmsgY29ubmVjdGlvbiB3aXRoIHRoZSBldmVuIHBp
eGVscwo+PiArwqAgdHJhdmVsaW5nIG9uIG9uZSBsaW5rLCBhbmQgdGhlIG9kZCBwaXhlbHMgdHJh
dmVsaW5nIG9uIHRoZSBvdGhlci4KPj4gKwo+PiArYWxsT2Y6Cj4+ICvCoCAtICRyZWY6IHBhbmVs
LWNvbW1vbi55YW1sIwo+PiArwqAgLSAkcmVmOiAvc2NoZW1hcy9kaXNwbGF5L2x2ZHMueWFtbC8j
Cj4+ICsKPj4gK3Byb3BlcnRpZXM6Cj4+ICvCoCBjb21wYXRpYmxlOgo+PiArwqDCoMKgIG9uZU9m
Ogo+PiArwqDCoMKgwqDCoCAtIGl0ZW1zOgo+PiArwqDCoMKgwqDCoMKgwqDCoMKgIC0gZW51bToK
Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIC0gbGluY29sbnRlY2gsbGNkMTg1LTEwMWN0
Cj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAtIG1pY3JvdGlwcywxMy0xMDFoaWViMGhm
MC1zCj4+ICvCoMKgwqDCoMKgwqDCoMKgwqAgLSBjb25zdDogcGFuZWwtZHVhbC1sdmRzCj4+ICvC
oMKgwqDCoMKgIC0gY29uc3Q6IHBhbmVsLWR1YWwtbHZkcwo+PiArCj4+ICvCoCBwb3J0czoKPj4g
K8KgwqDCoCAkcmVmOiAvc2NoZW1hcy9ncmFwaC55YW1sIy9wcm9wZXJ0aWVzL3BvcnRzCj4+ICsK
Pj4gK8KgwqDCoCBwcm9wZXJ0aWVzOgo+PiArwqDCoMKgwqDCoCBwb3J0QDA6Cj4+ICvCoMKgwqDC
oMKgwqDCoCAkcmVmOiAvc2NoZW1hcy9ncmFwaC55YW1sIy8kZGVmcy9wb3J0LWJhc2UKPj4gK8Kg
wqDCoMKgwqDCoMKgIHVuZXZhbHVhdGVkUHJvcGVydGllczogZmFsc2UKPj4gK8KgwqDCoMKgwqDC
oMKgIGRlc2NyaXB0aW9uOiBUaGUgc2luayBmb3IgZmlyc3Qgc2V0IG9mIExWRFMgcGl4ZWxzLgo+
PiArCj4+ICvCoMKgwqDCoMKgwqDCoCBwcm9wZXJ0aWVzOgo+PiArwqDCoMKgwqDCoMKgwqDCoMKg
IGR1YWwtbHZkcy1vZGQtcGl4ZWxzOgo+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB0eXBlOiBi
b29sZWFuCj4+ICsKPj4gK8KgwqDCoMKgwqDCoMKgwqDCoCBkdWFsLWx2ZHMtZXZlbi1waXhlbHM6
Cj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHR5cGU6IGJvb2xlYW4KPj4gKwo+PiArwqDCoMKg
wqDCoMKgwqAgb25lT2Y6Cj4+ICvCoMKgwqDCoMKgwqDCoMKgwqAgLSByZXF1aXJlZDogW2R1YWwt
bHZkcy1vZGQtcGl4ZWxzXQo+IAo+IE9uZSBxdWVzdGlvbjogd2h5IGRvIHdlIG5lZWQgYSAicGFu
ZWwtZHVhbC1sdmRzIiBjb21wYXRpYmxlPwo+IEEgRHVhbC1MVkRTIHBhbmVsIGlzIGEgTFZEUyBw
YW5lbCB1c2luZyB0d28gcG9ydHMsIGhlbmNlIHN0aWxsIGEgcGFuZWwtbHZkcy4KPiAKPiBJZiB5
b3UncmUgZG9pbmcgdGhpcyB0byBjbGVhcmx5IGRpc3Rpbmd1aXNoLCBmb3IgaHVtYW4gcmVhZGFi
aWxpdHkgcHVycG9zZXMsCj4gc2luZ2xlLWxpbmsgdnMgZHVhbC1saW5rIHBhbmVscywgSSB0aGlu
ayB0aGF0IHRoaXMgd291bGQgc3RpbGwgYmUgY2xlYXIgZXZlbgo+IGlmIHdlIHVzZSBwYW5lbC1s
dmRzIGFsb25lIGJlY2F1c2UgZHVhbC1saW5rIHBhbmVscywgYXMgeW91IHdyb3RlIGluIHRoaXMK
PiBiaW5kaW5nLCBkb2VzICpyZXF1aXJlKiB0d28gcG9ydHMsIHdpdGggImR1YWwtbHZkcy17b2Rk
LGV2ZW59LXBpeGVscyIgcHJvcGVydGllcy4KClllcywgd2hpbGUgdGhleSBhcmUgYm90aCBMVkRT
IGJhc2VkIHBhbmVscyB0aGUgZXh0cmEgTFZEUyBzaW5rIGluIHRoZXNlCnBhbmVscywgYW5kIHRo
ZSBjYXBhYmlsaXR5IHRvIGRlY29kZSBhbmQgZGlzcGxheSB0aGUgMiBzZXRzIG9mIHNpZ25hbHMK
YXJlIGVub3VnaCBoYXJkd2FyZSBkaWZmZXJlbmNlcyB0aGF0IHdhcnJhbnQgZm9yIGFuIGFkZGl0
aW9uIG9mIGEgbmV3CmNvbXBhdGlibGUuCgo+IAo+IFNvLi4uIHRoZSBkZXZpY2V0cmVlIG5vZGUg
d291bGQgbG9vayBsaWtlIHRoaXM6Cj4gCj4gcGFuZWwgewo+ICDCoMKgwqDCoGNvbXBhdGlibGUg
PSAidmVuZG9yLHBhbmVsIiwgInBhbmVsLWx2ZHMiOwo+ICDCoMKgwqDCoC4uLi4KPiAgwqDCoMKg
wqBwb3J0cyB7Cj4gIMKgwqDCoMKgwqDCoMKgIHBvcnRAMCB7Cj4gIMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqAgLi4uLi4KPiAgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAtPiBkdWFsLWx2ZHMtb2RkLXBp
eGVscyA8LQo+ICDCoMKgwqDCoMKgwqDCoCB9Cj4gCj4gIMKgwqDCoMKgwqDCoMKgIHBvcnRAMSB7
Cj4gIMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgLi4uLi4KPiAgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oCAtPiBkdWFsLWx2ZHMtZXZlbi1waXhlbHMgPC0KPiAgwqDCoMKgwqDCoMKgwqAgfTsKPiAgwqDC
oMKgwqB9Owo+IH07Cj4gCj4+ICvCoMKgwqDCoMKgwqDCoMKgwqAgLSByZXF1aXJlZDogW2R1YWwt
bHZkcy1ldmVuLXBpeGVsc10KPiAKPiAuLi5UaG91Z2gsIGlmIHlvdSBleHBlY3QgZHVhbC1sdmRz
IHBhbmVscyB0byBnZXQgb3RoZXIgcXVpcmtzIGluIHRoZSBmdXR1cmUsCj4gdGhhdCdzIGEgd2hv
bGUgZGlmZmVyZW50IHN0b3J5IGFuZCB5b3UgbWF5IGFjdHVhbGx5IG5lZWQgdGhlIHBhbmVsLWR1
YWwtbHZkcwo+IGNvbXBhdGlibGUuCgpZZXMsIGV4YWN0bHkuIEV2ZW4gd2hpbGUgYmVpbmcgbm9u
LXNtYXJ0LCB0aGVyZSBhcmUgZ29pbmcgdG8gYmUgbW9yZQpxdWlya3MgaW4gZnV0dXJlLiBBbmQg
aXQgd291bGQgYmUgYmV0dGVyIGlmIHRoZXkgaGF2ZSB0aGVpciBvd24KY29tcGF0aWJsZS9iaW5k
aW5nLCBhbmQgYXJlIG5vdCBnZXR0aW5nIGFwcGVuZGVkIGluIGFuIGV2ZXItZ3Jvd2luZwppZi1l
bHNlIGxhZGRlci4gOikKCgpSZWdhcmRzCkFyYWRoeWEKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1y
aXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxt
YW4vbGlzdGluZm8vbGludXgtcmlzY3YK
