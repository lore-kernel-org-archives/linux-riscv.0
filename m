Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2344EC38159
	for <linux-riscv@archiver.kernel.org>; Fri, 20 Jan 2023 04:59:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5ty4MqxkkffGQSjotgvMTr4TD6KTB15U2amiEygS8A0=; b=pWNfTy3wlP+ezb
	YG0b9614csYbHEdtBn/VnAFk/+w1XvQJePhnUDvaVEZE7jKnMkYjjaAVbVSqk2CoqpskHBKXOSV/v
	6CINxUDRQCYJwlOn4TU4N5oPcCSRWhNqT+7WuNMQAHR9GmQS+d4zfoVVcYbCJnOhoDDyrAFmlQWzo
	qiglDZMiUMdFBHf0bzsyCoypKRm3GWEzyO0a5+2oSWCLk8PBCuvN8ld1J267gXfFc/IrmOQzrJ5D/
	J8k08SSxJWR7z5JrR2JqaQsm4gbuY5zRalOWPCFvdA6ENiuhuBhKVTPOq6um+n9BejJjxkeOlkwFt
	ghoIsYv2mwDPUsdGADug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pIjV6-008Pbm-2W; Fri, 20 Jan 2023 04:59:40 +0000
Received: from fllv0015.ext.ti.com ([198.47.19.141])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pIjV2-008Paq-J2; Fri, 20 Jan 2023 04:59:38 +0000
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 30K4wwaL059217;
	Thu, 19 Jan 2023 22:58:58 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1674190738;
	bh=FhdMm8snS4EyWglAxG9HV9C8rgTh2MdCa/PV2daai+0=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=IQIjXef8eot9FsusDlpnq4ExSa3ShrotvDLKZTWVWjFVwfIti0C44gBEdKYHbZ941
	 d4FgjRzaupR90M0pb3/LnJq5dmc3YnXkhoE3pJDNHx0Qr1bjWPdqMFChFPaLYKEnYn
	 t+rnl+NLCidenbOG2q/xjWzNgOKMsVQqdVS3O2H4=
Received: from DLEE106.ent.ti.com (dlee106.ent.ti.com [157.170.170.36])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 30K4wwvM108629
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 19 Jan 2023 22:58:58 -0600
Received: from DLEE101.ent.ti.com (157.170.170.31) by DLEE106.ent.ti.com
 (157.170.170.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16; Thu, 19
 Jan 2023 22:58:57 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE101.ent.ti.com
 (157.170.170.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16 via
 Frontend Transport; Thu, 19 Jan 2023 22:58:57 -0600
Received: from [172.24.223.178] (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 30K4wmmo100309;
	Thu, 19 Jan 2023 22:58:49 -0600
Message-ID: <36fe032b-a00c-dad1-a3db-bea1f15726c0@ti.com>
Date: Fri, 20 Jan 2023 10:28:48 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [RFC PATCH 3/4] dt-bindings: panel: Introduce dual-link LVDS
 panel
Content-Language: en-US
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        AngeloGioacchino Del
 Regno <angelogioacchino.delregno@collabora.com>,
        Rob Herring
	<robh+dt@kernel.org>,
        Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>,
        Jyri Sarha <jyri.sarha@iki.fi>, David
 Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Laurent Pinchart
	<laurent.pinchart@ideasonboard.com>,
        Thierry Reding
	<thierry.reding@gmail.com>,
        Sam Ravnborg <sam@ravnborg.org>, Maxime Ripard
	<maxime@cerno.tech>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown
	<broonie@kernel.org>,
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
 <431ddd82-055b-2526-3d5e-f6563e48d264@ti.com>
 <808e831f-4282-0e58-ebb2-2f556aaeaca4@ideasonboard.com>
From: Aradhya Bhatia <a-bhatia1@ti.com>
In-Reply-To: <808e831f-4282-0e58-ebb2-2f556aaeaca4@ideasonboard.com>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230119_205936_749463_458779E8 
X-CRM114-Status: GOOD (  26.27  )
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

SGkgVG9taSwKClRoYW5rIHlvdSBmb3IgdGFraW5nIGEgbG9vayBhdCB0aGUgcGF0Y2hlcyEKCk9u
IDE3LUphbi0yMyAxODowOCwgVG9taSBWYWxrZWluZW4gd3JvdGU6Cj4gT24gMDkvMDEvMjAyMyAx
ODoyMSwgQXJhZGh5YSBCaGF0aWEgd3JvdGU6Cj4+IEhpIEFuZ2VsbywKPj4KPj4gVGhhbmtzIGZv
ciB0YWtpbmcgYSBsb29rIGF0IHRoZSBwYXRjaGVzIQo+Pgo+PiBPbiAwMy1KYW4tMjMgMTc6MjEs
IEFuZ2Vsb0dpb2FjY2hpbm8gRGVsIFJlZ25vIHdyb3RlOgo+Pj4gSWwgMDMvMDEvMjMgMDc6NDYs
IEFyYWRoeWEgQmhhdGlhIGhhIHNjcml0dG86Cj4+Pj4gRHVhbC1saW5rIExWRFMgaW50ZXJmYWNl
cyBoYXZlIDIgbGlua3MsIHdpdGggZXZlbiBwaXhlbHMgdHJhdmVsaW5nIG9uCj4+Pj4gb25lIGxp
bmssIGFuZCBvZGQgcGl4ZWxzIG9uIHRoZSBvdGhlci4gVGhlc2UgcGFuZWxzIGFyZSBhbHNvIGdl
bmVyaWMgaW4KPj4+PiBuYXR1cmUsIHdpdGggbm8gZG9jdW1lbnRlZCBjb25zdHJhaW50cywgbXVj
aCBsaWtlIHRoZWlyIHNpbmdsZS1saW5rCj4+Pj4gY291bnRlcnBhcnRzLCAicGFuZWwtbHZkcyIu
Cj4+Pj4KPj4+PiBBZGQgYSBuZXcgY29tcGF0aWJsZSwgInBhbmVsLWR1YWwtbHZkcyIsIGFuZCBh
IGR0LWJpbmRpbmcgZG9jdW1lbnQgZm9yCj4+Pj4gdGhlc2UgcGFuZWxzLgo+Pj4+Cj4+Pj4gU2ln
bmVkLW9mZi1ieTogQXJhZGh5YSBCaGF0aWEgPGEtYmhhdGlhMUB0aS5jb20+Cj4+Pj4gLS0tCj4+
Pj4gwqAgLi4uL2Rpc3BsYXkvcGFuZWwvcGFuZWwtZHVhbC1sdmRzLnlhbWzCoMKgwqDCoMKgwqDC
oCB8IDE1NyAKPj4+PiArKysrKysrKysrKysrKysrKysKPj4+PiDCoCBNQUlOVEFJTkVSU8KgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgIHzCoMKgIDEgKwo+Pj4+IMKgIDIgZmlsZXMgY2hhbmdlZCwgMTU4IGluc2VydGlvbnMo
KykKPj4+PiDCoCBjcmVhdGUgbW9kZSAxMDA2NDQgCj4+Pj4gRG9jdW1lbnRhdGlvbi9kZXZpY2V0
cmVlL2JpbmRpbmdzL2Rpc3BsYXkvcGFuZWwvcGFuZWwtZHVhbC1sdmRzLnlhbWwKPj4+Pgo+Pj4+
IGRpZmYgLS1naXQgCj4+Pj4gYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlz
cGxheS9wYW5lbC9wYW5lbC1kdWFsLWx2ZHMueWFtbCBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJl
ZS9iaW5kaW5ncy9kaXNwbGF5L3BhbmVsL3BhbmVsLWR1YWwtbHZkcy55YW1sCj4+Pj4gbmV3IGZp
bGUgbW9kZSAxMDA2NDQKPj4+PiBpbmRleCAwMDAwMDAwMDAwMDAuLjg4YTdhYTI0MTBiZQo+Pj4+
IC0tLSAvZGV2L251bGwKPj4+PiArKysgCj4+Pj4gYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUv
YmluZGluZ3MvZGlzcGxheS9wYW5lbC9wYW5lbC1kdWFsLWx2ZHMueWFtbAo+Pj4+IEBAIC0wLDAg
KzEsMTU3IEBACj4+Pj4gKyMgU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IChHUEwtMi4wLW9ubHkg
T1IgQlNELTItQ2xhdXNlKQo+Pj4+ICslWUFNTCAxLjIKPj4+PiArLS0tCj4+Pj4gKyRpZDogaHR0
cDovL2RldmljZXRyZWUub3JnL3NjaGVtYXMvZGlzcGxheS9wYW5lbC9wYW5lbC1kdWFsLWx2ZHMu
eWFtbCMKPj4+PiArJHNjaGVtYTogaHR0cDovL2RldmljZXRyZWUub3JnL21ldGEtc2NoZW1hcy9j
b3JlLnlhbWwjCj4+Pj4gKwo+Pj4+ICt0aXRsZTogR2VuZXJpYyBEdWFsLUxpbmsgTFZEUyBEaXNw
bGF5IFBhbmVsCj4+Pj4gKwo+Pj4+ICttYWludGFpbmVyczoKPj4+PiArwqAgLSBBcmFkaHlhIEJo
YXRpYSA8YS1iaGF0aWExQHRpLmNvbT4KPj4+PiArwqAgLSBUaGllcnJ5IFJlZGluZyA8dGhpZXJy
eS5yZWRpbmdAZ21haWwuY29tPgo+Pj4+ICsKPj4+PiArZGVzY3JpcHRpb246IHwKPj4+PiArwqAg
QSBkdWFsLUxWRFMgaW50ZXJmYWNlIGlzIGEgZHVhbC1saW5rIGNvbm5lY3Rpb24gd2l0aCB0aGUg
ZXZlbiBwaXhlbHMKPj4+PiArwqAgdHJhdmVsaW5nIG9uIG9uZSBsaW5rLCBhbmQgdGhlIG9kZCBw
aXhlbHMgdHJhdmVsaW5nIG9uIHRoZSBvdGhlci4KPj4+PiArCj4+Pj4gK2FsbE9mOgo+Pj4+ICvC
oCAtICRyZWY6IHBhbmVsLWNvbW1vbi55YW1sIwo+Pj4+ICvCoCAtICRyZWY6IC9zY2hlbWFzL2Rp
c3BsYXkvbHZkcy55YW1sLyMKPj4+PiArCj4+Pj4gK3Byb3BlcnRpZXM6Cj4+Pj4gK8KgIGNvbXBh
dGlibGU6Cj4+Pj4gK8KgwqDCoCBvbmVPZjoKPj4+PiArwqDCoMKgwqDCoCAtIGl0ZW1zOgo+Pj4+
ICvCoMKgwqDCoMKgwqDCoMKgwqAgLSBlbnVtOgo+Pj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoCAtIGxpbmNvbG50ZWNoLGxjZDE4NS0xMDFjdAo+Pj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoCAtIG1pY3JvdGlwcywxMy0xMDFoaWViMGhmMC1zCj4+Pj4gK8KgwqDCoMKgwqDCoMKg
wqDCoCAtIGNvbnN0OiBwYW5lbC1kdWFsLWx2ZHMKPj4+PiArwqDCoMKgwqDCoCAtIGNvbnN0OiBw
YW5lbC1kdWFsLWx2ZHMKPj4+PiArCj4+Pj4gK8KgIHBvcnRzOgo+Pj4+ICvCoMKgwqAgJHJlZjog
L3NjaGVtYXMvZ3JhcGgueWFtbCMvcHJvcGVydGllcy9wb3J0cwo+Pj4+ICsKPj4+PiArwqDCoMKg
IHByb3BlcnRpZXM6Cj4+Pj4gK8KgwqDCoMKgwqAgcG9ydEAwOgo+Pj4+ICvCoMKgwqDCoMKgwqDC
oCAkcmVmOiAvc2NoZW1hcy9ncmFwaC55YW1sIy8kZGVmcy9wb3J0LWJhc2UKPj4+PiArwqDCoMKg
wqDCoMKgwqAgdW5ldmFsdWF0ZWRQcm9wZXJ0aWVzOiBmYWxzZQo+Pj4+ICvCoMKgwqDCoMKgwqDC
oCBkZXNjcmlwdGlvbjogVGhlIHNpbmsgZm9yIGZpcnN0IHNldCBvZiBMVkRTIHBpeGVscy4KPj4+
PiArCj4+Pj4gK8KgwqDCoMKgwqDCoMKgIHByb3BlcnRpZXM6Cj4+Pj4gK8KgwqDCoMKgwqDCoMKg
wqDCoCBkdWFsLWx2ZHMtb2RkLXBpeGVsczoKPj4+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB0
eXBlOiBib29sZWFuCj4+Pj4gKwo+Pj4+ICvCoMKgwqDCoMKgwqDCoMKgwqAgZHVhbC1sdmRzLWV2
ZW4tcGl4ZWxzOgo+Pj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHR5cGU6IGJvb2xlYW4KPj4+
PiArCj4+Pj4gK8KgwqDCoMKgwqDCoMKgIG9uZU9mOgo+Pj4+ICvCoMKgwqDCoMKgwqDCoMKgwqAg
LSByZXF1aXJlZDogW2R1YWwtbHZkcy1vZGQtcGl4ZWxzXQo+Pj4KPj4+IE9uZSBxdWVzdGlvbjog
d2h5IGRvIHdlIG5lZWQgYSAicGFuZWwtZHVhbC1sdmRzIiBjb21wYXRpYmxlPwo+Pj4gQSBEdWFs
LUxWRFMgcGFuZWwgaXMgYSBMVkRTIHBhbmVsIHVzaW5nIHR3byBwb3J0cywgaGVuY2Ugc3RpbGwg
YSAKPj4+IHBhbmVsLWx2ZHMuCj4+Pgo+Pj4gSWYgeW91J3JlIGRvaW5nIHRoaXMgdG8gY2xlYXJs
eSBkaXN0aW5ndWlzaCwgZm9yIGh1bWFuIHJlYWRhYmlsaXR5IHB1cnBvc2VzLAo+Pj4gc2luZ2xl
LWxpbmsgdnMgZHVhbC1saW5rIHBhbmVscywgSSB0aGluayB0aGF0IHRoaXMgd291bGQgc3RpbGwg
YmUgY2xlYXIgZXZlbgo+Pj4gaWYgd2UgdXNlIHBhbmVsLWx2ZHMgYWxvbmUgYmVjYXVzZSBkdWFs
LWxpbmsgcGFuZWxzLCBhcyB5b3Ugd3JvdGUgaW4gdGhpcwo+Pj4gYmluZGluZywgZG9lcyAqcmVx
dWlyZSogdHdvIHBvcnRzLCB3aXRoICJkdWFsLWx2ZHMte29kZCxldmVufS1waXhlbHMiIHByb3Bl
cnRpZXMuCj4+Cj4+IFllcywgd2hpbGUgdGhleSBhcmUgYm90aCBMVkRTIGJhc2VkIHBhbmVscyB0
aGUgZXh0cmEgTFZEUyBzaW5rIGluIHRoZXNlCj4+IHBhbmVscywgYW5kIHRoZSBjYXBhYmlsaXR5
IHRvIGRlY29kZSBhbmQgZGlzcGxheSB0aGUgMiBzZXRzIG9mIHNpZ25hbHMKPj4gYXJlIGVub3Vn
aCBoYXJkd2FyZSBkaWZmZXJlbmNlcyB0aGF0IHdhcnJhbnQgZm9yIGFuIGFkZGl0aW9uIG9mIGEg
bmV3Cj4+IGNvbXBhdGlibGUuCj4+Cj4+Pgo+Pj4gU28uLi4gdGhlIGRldmljZXRyZWUgbm9kZSB3
b3VsZCBsb29rIGxpa2UgdGhpczoKPj4+Cj4+PiBwYW5lbCB7Cj4+PiDCoMKgwqDCoMKgY29tcGF0
aWJsZSA9ICJ2ZW5kb3IscGFuZWwiLCAicGFuZWwtbHZkcyI7Cj4+PiDCoMKgwqDCoMKgLi4uLgo+
Pj4gwqDCoMKgwqDCoHBvcnRzIHsKPj4+IMKgwqDCoMKgwqDCoMKgwqAgcG9ydEAwIHsKPj4+IMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAuLi4uLgo+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
IC0+IGR1YWwtbHZkcy1vZGQtcGl4ZWxzIDwtCj4+PiDCoMKgwqDCoMKgwqDCoMKgIH0KPj4+Cj4+
PiDCoMKgwqDCoMKgwqDCoMKgIHBvcnRAMSB7Cj4+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAg
Li4uLi4KPj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAtPiBkdWFsLWx2ZHMtZXZlbi1waXhl
bHMgPC0KPj4+IMKgwqDCoMKgwqDCoMKgwqAgfTsKPj4+IMKgwqDCoMKgwqB9Owo+Pj4gfTsKPj4+
Cj4+Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoCAtIHJlcXVpcmVkOiBbZHVhbC1sdmRzLWV2ZW4tcGl4
ZWxzXQo+Pj4KPj4+IC4uLlRob3VnaCwgaWYgeW91IGV4cGVjdCBkdWFsLWx2ZHMgcGFuZWxzIHRv
IGdldCBvdGhlciBxdWlya3MgaW4gdGhlIGZ1dHVyZSwKPj4+IHRoYXQncyBhIHdob2xlIGRpZmZl
cmVudCBzdG9yeSBhbmQgeW91IG1heSBhY3R1YWxseSBuZWVkIHRoZSBwYW5lbC1kdWFsLWx2ZHMK
Pj4+IGNvbXBhdGlibGUuCj4+Cj4+IFllcywgZXhhY3RseS4gRXZlbiB3aGlsZSBiZWluZyBub24t
c21hcnQsIHRoZXJlIGFyZSBnb2luZyB0byBiZSBtb3JlCj4+IHF1aXJrcyBpbiBmdXR1cmUuIEFu
ZCBpdCB3b3VsZCBiZSBiZXR0ZXIgaWYgdGhleSBoYXZlIHRoZWlyIG93bgo+PiBjb21wYXRpYmxl
L2JpbmRpbmcsIGFuZCBhcmUgbm90IGdldHRpbmcgYXBwZW5kZWQgaW4gYW4gZXZlci1ncm93aW5n
Cj4+IGlmLWVsc2UgbGFkZGVyLiA6KQo+IAo+IEkgY2FuIGltYWdpbmUgYSBwYW5lbCB3aGljaCB5
b3UgY2FuIHVzZSB3aXRoIGEgc2luZ2xlIExWRFMgbGluayBpZiB0aGUgCj4gY2xvY2sgaXMgaGln
aCBlbm91Z2gsIG9yIHR3byBMVkRTIGxpbmtzIGlmIHRoZSBjbG9jayBoYXMgdG8gYmUgbG93ZXIu
IElzIAo+IHRoYXQgYSBkdWFsLWx2ZHMgcGFuZWw/ID0pCgpIbW0sIEkgY2FuIHNlZSB3aGF0IHlv
dSBhcmUgc2F5aW5nIGhlcmUuCgpJZiBvbmUgd2FudHMgdG8gcnVuIGEgZHVhbC1saW5rIHBhbmVs
LCB3aXRoIDEgbGluayAoZ2l2ZW4gZW5vdWdoIGNsb2NrCmZyZXF1ZW5jeSksIHRoZW4gdGhlIGJp
bmRpbmdzIGhlcmUgd2lsbCAqbm90KiBhbGxvdyBmb3IgYSBzaW5nbGUgcG9ydAp3aXRoIHRoZSBv
ZGQvZXZlbiBwcm9wZXJ0aWVzIGFic2VudC4KCkluIHN1Y2ggYSBjYXNlLCB0aGUgY29tcGF0aWJs
ZSB3aWxsIGluZGVlZCBuZWVkIHRvIGJlIGNoYW5nZWQgdG8KInBhbmVsLWx2ZHMiLgoKV2hpbGUg
aXQgZG9lcyBmZWVsIGEgdGFkIGJpdCBvZGQsIEkgYmVsaWV2ZSBpdCBpcyBzdGlsbCB3b3J0aApt
YWludGFpbmluZyB0aGUgY2xhcml0eSBhbmQgSFcgZGlmZmVyZW5jZXMgYmV0d2VlbiB0aGUgc2lu
Z2xlIGFuZCBkdWFsCmxpbmsgcGFuZWxzLiA6KQoKPiAKPiBCdXQgcHJvYmFibHkgdGhhdCBzaXR1
YXRpb24gaXMgbm8gZGlmZmVyZW50IHRoYW4gYSBwYW5lbCB0aGF0IGNhbiB3b3JrIAo+IHdpdGgg
RFNJIG9yIERQSSBpbnB1dC4KPiAKPiBTdGlsbCwgSSdtIGFncmVlIHdpdGggQW5nZWxvIGluIHRo
YXQgYSBuZXcgY29tcGF0aWJsZSBzdHJpbmcgZm9yIGR1YWwgCj4gbGluayBsdmRzIGZlZWxzIGEg
Yml0IG9kZC4gVGhhdCBzYWlkLCBpdCdzIHBvc3NpYmxlIHRoZSBwYW5lbC1sdmRzICA+IGJpbmRp
bmdzIG1pZ2h0IGdldCByYXRoZXIgY29uZnVzaW5nLiBTbyBJIGRvbid0IGhhdmUgYSBzdHJvbmcg
ZmVlbGluZyAKaGVyZS4KClJlZ2FyZHMKQXJhZGh5YQoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJp
c2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1h
bi9saXN0aW5mby9saW51eC1yaXNjdgo=
