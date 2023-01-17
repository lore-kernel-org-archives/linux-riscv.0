Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5897FC63797
	for <linux-riscv@archiver.kernel.org>; Tue, 17 Jan 2023 12:39:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YSyuHd7uq5dlYLzstSpD/aI1n7zkiZGkzLxLef4f7EA=; b=0b+TGaO3y90s79
	JU4ExB09XNZQNIhEHUkSESLHaQ37753PSR4ga0eUJzxuiF2ThInPrhhzWhkAahSGnYxJETaOCPlDQ
	1pCm/cyrusLmWB3TMXwLAbAdOz5eAiIYPjJmGkBsoh8Oqc45S3rjZQNTMSU8H5s90gPRlnR0NOIcH
	/LXblWPG4/Q0K3Q86EVi6mZ3nfWKNWlAEDQQznXnjXroDBcdDNyjY02xSjPxiPpk75ewVt+jkNjEX
	o9CjXPZztb9GtYS17cnlFo0XFalRNNkP3igxiThD5EmVWm7XwfAay8L2Df7ZJ6k2r8h06wWbn6UuJ
	UokJsRSYL3jNygjXnc/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pHlFH-00EC4C-Ei; Tue, 17 Jan 2023 12:39:19 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pHlF5-00EC0k-Ti; Tue, 17 Jan 2023 12:39:09 +0000
Received: from [192.168.1.15] (91-154-32-225.elisa-laajakaista.fi [91.154.32.225])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id B5E8310C;
	Tue, 17 Jan 2023 13:38:59 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1673959141;
	bh=0xanUWyMoxJnvXqqNZ5UOGy3oyg6sQdr/aJLg0bLmX0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=lhXA6EOBtju3hz7RVGApa3gFkm8IjwyEevWIttJjwuSssA6tWWX3VMk4dP6KCwshf
	 D1TXAw5l8b9t1Vd5W0sbVT1fBO26Skg59JiGVMd89TgWhDkXbpcp0S0PTFKKS9B67y
	 fFirV+o2rzHN81rIAuhffeTrNvXXekunotwKsK54=
Message-ID: <808e831f-4282-0e58-ebb2-2f556aaeaca4@ideasonboard.com>
Date: Tue, 17 Jan 2023 14:38:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [RFC PATCH 3/4] dt-bindings: panel: Introduce dual-link LVDS
 panel
Content-Language: en-US
To: Aradhya Bhatia <a-bhatia1@ti.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Jyri Sarha <jyri.sarha@iki.fi>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 Maxime Ripard <maxime@cerno.tech>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Matthias Brugger <matthias.bgg@gmail.com>, Guo Ren <guoren@kernel.org>
Cc: DRI Development List <dri-devel@lists.freedesktop.org>,
 Devicetree List <devicetree@vger.kernel.org>,
 Linux Kernel List <linux-kernel@vger.kernel.org>,
 Linux RISC-V List <linux-riscv@lists.infradead.org>,
 Linux ARM Kernel List <linux-arm-kernel@lists.infradead.org>,
 Linux Mediatek List <linux-mediatek@lists.infradead.org>,
 Linux C-SKY Arch List <linux-csky@vger.kernel.org>,
 Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>,
 Rahul T R <r-ravikumar@ti.com>, Devarsh Thakkar <devarsht@ti.com>,
 Jai Luthra <j-luthra@ti.com>, Jayesh Choudhary <j-choudhary@ti.com>
References: <20230103064615.5311-1-a-bhatia1@ti.com>
 <20230103064615.5311-4-a-bhatia1@ti.com>
 <09f1ca83-c7d5-a186-6fa6-09cdd7a0b9cc@collabora.com>
 <431ddd82-055b-2526-3d5e-f6563e48d264@ti.com>
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
In-Reply-To: <431ddd82-055b-2526-3d5e-f6563e48d264@ti.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230117_043908_177615_878225DE 
X-CRM114-Status: GOOD (  25.83  )
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

T24gMDkvMDEvMjAyMyAxODoyMSwgQXJhZGh5YSBCaGF0aWEgd3JvdGU6Cj4gSGkgQW5nZWxvLAo+
IAo+IFRoYW5rcyBmb3IgdGFraW5nIGEgbG9vayBhdCB0aGUgcGF0Y2hlcyEKPiAKPiBPbiAwMy1K
YW4tMjMgMTc6MjEsIEFuZ2Vsb0dpb2FjY2hpbm8gRGVsIFJlZ25vIHdyb3RlOgo+PiBJbCAwMy8w
MS8yMyAwNzo0NiwgQXJhZGh5YSBCaGF0aWEgaGEgc2NyaXR0bzoKPj4+IER1YWwtbGluayBMVkRT
IGludGVyZmFjZXMgaGF2ZSAyIGxpbmtzLCB3aXRoIGV2ZW4gcGl4ZWxzIHRyYXZlbGluZyBvbgo+
Pj4gb25lIGxpbmssIGFuZCBvZGQgcGl4ZWxzIG9uIHRoZSBvdGhlci4gVGhlc2UgcGFuZWxzIGFy
ZSBhbHNvIGdlbmVyaWMgaW4KPj4+IG5hdHVyZSwgd2l0aCBubyBkb2N1bWVudGVkIGNvbnN0cmFp
bnRzLCBtdWNoIGxpa2UgdGhlaXIgc2luZ2xlLWxpbmsKPj4+IGNvdW50ZXJwYXJ0cywgInBhbmVs
LWx2ZHMiLgo+Pj4KPj4+IEFkZCBhIG5ldyBjb21wYXRpYmxlLCAicGFuZWwtZHVhbC1sdmRzIiwg
YW5kIGEgZHQtYmluZGluZyBkb2N1bWVudCBmb3IKPj4+IHRoZXNlIHBhbmVscy4KPj4+Cj4+PiBT
aWduZWQtb2ZmLWJ5OiBBcmFkaHlhIEJoYXRpYSA8YS1iaGF0aWExQHRpLmNvbT4KPj4+IC0tLQo+
Pj4gwqAgLi4uL2Rpc3BsYXkvcGFuZWwvcGFuZWwtZHVhbC1sdmRzLnlhbWzCoMKgwqDCoMKgwqDC
oCB8IDE1NyArKysrKysrKysrKysrKysrKysKPj4+IMKgIE1BSU5UQUlORVJTwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAg
fMKgwqAgMSArCj4+PiDCoCAyIGZpbGVzIGNoYW5nZWQsIDE1OCBpbnNlcnRpb25zKCspCj4+PiDC
oCBjcmVhdGUgbW9kZSAxMDA2NDQgCj4+PiBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGlu
Z3MvZGlzcGxheS9wYW5lbC9wYW5lbC1kdWFsLWx2ZHMueWFtbAo+Pj4KPj4+IGRpZmYgLS1naXQg
Cj4+PiBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L3BhbmVsL3Bh
bmVsLWR1YWwtbHZkcy55YW1sIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rp
c3BsYXkvcGFuZWwvcGFuZWwtZHVhbC1sdmRzLnlhbWwKPj4+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0
Cj4+PiBpbmRleCAwMDAwMDAwMDAwMDAuLjg4YTdhYTI0MTBiZQo+Pj4gLS0tIC9kZXYvbnVsbAo+
Pj4gKysrIAo+Pj4gYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9w
YW5lbC9wYW5lbC1kdWFsLWx2ZHMueWFtbAo+Pj4gQEAgLTAsMCArMSwxNTcgQEAKPj4+ICsjIFNQ
RFgtTGljZW5zZS1JZGVudGlmaWVyOiAoR1BMLTIuMC1vbmx5IE9SIEJTRC0yLUNsYXVzZSkKPj4+
ICslWUFNTCAxLjIKPj4+ICstLS0KPj4+ICskaWQ6IGh0dHA6Ly9kZXZpY2V0cmVlLm9yZy9zY2hl
bWFzL2Rpc3BsYXkvcGFuZWwvcGFuZWwtZHVhbC1sdmRzLnlhbWwjCj4+PiArJHNjaGVtYTogaHR0
cDovL2RldmljZXRyZWUub3JnL21ldGEtc2NoZW1hcy9jb3JlLnlhbWwjCj4+PiArCj4+PiArdGl0
bGU6IEdlbmVyaWMgRHVhbC1MaW5rIExWRFMgRGlzcGxheSBQYW5lbAo+Pj4gKwo+Pj4gK21haW50
YWluZXJzOgo+Pj4gK8KgIC0gQXJhZGh5YSBCaGF0aWEgPGEtYmhhdGlhMUB0aS5jb20+Cj4+PiAr
wqAgLSBUaGllcnJ5IFJlZGluZyA8dGhpZXJyeS5yZWRpbmdAZ21haWwuY29tPgo+Pj4gKwo+Pj4g
K2Rlc2NyaXB0aW9uOiB8Cj4+PiArwqAgQSBkdWFsLUxWRFMgaW50ZXJmYWNlIGlzIGEgZHVhbC1s
aW5rIGNvbm5lY3Rpb24gd2l0aCB0aGUgZXZlbiBwaXhlbHMKPj4+ICvCoCB0cmF2ZWxpbmcgb24g
b25lIGxpbmssIGFuZCB0aGUgb2RkIHBpeGVscyB0cmF2ZWxpbmcgb24gdGhlIG90aGVyLgo+Pj4g
Kwo+Pj4gK2FsbE9mOgo+Pj4gK8KgIC0gJHJlZjogcGFuZWwtY29tbW9uLnlhbWwjCj4+PiArwqAg
LSAkcmVmOiAvc2NoZW1hcy9kaXNwbGF5L2x2ZHMueWFtbC8jCj4+PiArCj4+PiArcHJvcGVydGll
czoKPj4+ICvCoCBjb21wYXRpYmxlOgo+Pj4gK8KgwqDCoCBvbmVPZjoKPj4+ICvCoMKgwqDCoMKg
IC0gaXRlbXM6Cj4+PiArwqDCoMKgwqDCoMKgwqDCoMKgIC0gZW51bToKPj4+ICvCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoCAtIGxpbmNvbG50ZWNoLGxjZDE4NS0xMDFjdAo+Pj4gK8KgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgIC0gbWljcm90aXBzLDEzLTEwMWhpZWIwaGYwLXMKPj4+ICvCoMKg
wqDCoMKgwqDCoMKgwqAgLSBjb25zdDogcGFuZWwtZHVhbC1sdmRzCj4+PiArwqDCoMKgwqDCoCAt
IGNvbnN0OiBwYW5lbC1kdWFsLWx2ZHMKPj4+ICsKPj4+ICvCoCBwb3J0czoKPj4+ICvCoMKgwqAg
JHJlZjogL3NjaGVtYXMvZ3JhcGgueWFtbCMvcHJvcGVydGllcy9wb3J0cwo+Pj4gKwo+Pj4gK8Kg
wqDCoCBwcm9wZXJ0aWVzOgo+Pj4gK8KgwqDCoMKgwqAgcG9ydEAwOgo+Pj4gK8KgwqDCoMKgwqDC
oMKgICRyZWY6IC9zY2hlbWFzL2dyYXBoLnlhbWwjLyRkZWZzL3BvcnQtYmFzZQo+Pj4gK8KgwqDC
oMKgwqDCoMKgIHVuZXZhbHVhdGVkUHJvcGVydGllczogZmFsc2UKPj4+ICvCoMKgwqDCoMKgwqDC
oCBkZXNjcmlwdGlvbjogVGhlIHNpbmsgZm9yIGZpcnN0IHNldCBvZiBMVkRTIHBpeGVscy4KPj4+
ICsKPj4+ICvCoMKgwqDCoMKgwqDCoCBwcm9wZXJ0aWVzOgo+Pj4gK8KgwqDCoMKgwqDCoMKgwqDC
oCBkdWFsLWx2ZHMtb2RkLXBpeGVsczoKPj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHR5cGU6
IGJvb2xlYW4KPj4+ICsKPj4+ICvCoMKgwqDCoMKgwqDCoMKgwqAgZHVhbC1sdmRzLWV2ZW4tcGl4
ZWxzOgo+Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgdHlwZTogYm9vbGVhbgo+Pj4gKwo+Pj4g
K8KgwqDCoMKgwqDCoMKgIG9uZU9mOgo+Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoCAtIHJlcXVpcmVk
OiBbZHVhbC1sdmRzLW9kZC1waXhlbHNdCj4+Cj4+IE9uZSBxdWVzdGlvbjogd2h5IGRvIHdlIG5l
ZWQgYSAicGFuZWwtZHVhbC1sdmRzIiBjb21wYXRpYmxlPwo+PiBBIER1YWwtTFZEUyBwYW5lbCBp
cyBhIExWRFMgcGFuZWwgdXNpbmcgdHdvIHBvcnRzLCBoZW5jZSBzdGlsbCBhIAo+PiBwYW5lbC1s
dmRzLgo+Pgo+PiBJZiB5b3UncmUgZG9pbmcgdGhpcyB0byBjbGVhcmx5IGRpc3Rpbmd1aXNoLCBm
b3IgaHVtYW4gcmVhZGFiaWxpdHkgCj4+IHB1cnBvc2VzLAo+PiBzaW5nbGUtbGluayB2cyBkdWFs
LWxpbmsgcGFuZWxzLCBJIHRoaW5rIHRoYXQgdGhpcyB3b3VsZCBzdGlsbCBiZSAKPj4gY2xlYXIg
ZXZlbgo+PiBpZiB3ZSB1c2UgcGFuZWwtbHZkcyBhbG9uZSBiZWNhdXNlIGR1YWwtbGluayBwYW5l
bHMsIGFzIHlvdSB3cm90ZSBpbiB0aGlzCj4+IGJpbmRpbmcsIGRvZXMgKnJlcXVpcmUqIHR3byBw
b3J0cywgd2l0aCAiZHVhbC1sdmRzLXtvZGQsZXZlbn0tcGl4ZWxzIiAKPj4gcHJvcGVydGllcy4K
PiAKPiBZZXMsIHdoaWxlIHRoZXkgYXJlIGJvdGggTFZEUyBiYXNlZCBwYW5lbHMgdGhlIGV4dHJh
IExWRFMgc2luayBpbiB0aGVzZQo+IHBhbmVscywgYW5kIHRoZSBjYXBhYmlsaXR5IHRvIGRlY29k
ZSBhbmQgZGlzcGxheSB0aGUgMiBzZXRzIG9mIHNpZ25hbHMKPiBhcmUgZW5vdWdoIGhhcmR3YXJl
IGRpZmZlcmVuY2VzIHRoYXQgd2FycmFudCBmb3IgYW4gYWRkaXRpb24gb2YgYSBuZXcKPiBjb21w
YXRpYmxlLgo+IAo+Pgo+PiBTby4uLiB0aGUgZGV2aWNldHJlZSBub2RlIHdvdWxkIGxvb2sgbGlr
ZSB0aGlzOgo+Pgo+PiBwYW5lbCB7Cj4+IMKgwqDCoMKgwqBjb21wYXRpYmxlID0gInZlbmRvcixw
YW5lbCIsICJwYW5lbC1sdmRzIjsKPj4gwqDCoMKgwqDCoC4uLi4KPj4gwqDCoMKgwqDCoHBvcnRz
IHsKPj4gwqDCoMKgwqDCoMKgwqDCoCBwb3J0QDAgewo+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqAgLi4uLi4KPj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIC0+IGR1YWwtbHZkcy1vZGQtcGl4
ZWxzIDwtCj4+IMKgwqDCoMKgwqDCoMKgwqAgfQo+Pgo+PiDCoMKgwqDCoMKgwqDCoMKgIHBvcnRA
MSB7Cj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAuLi4uLgo+PiDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqAgLT4gZHVhbC1sdmRzLWV2ZW4tcGl4ZWxzIDwtCj4+IMKgwqDCoMKgwqDCoMKgwqAg
fTsKPj4gwqDCoMKgwqDCoH07Cj4+IH07Cj4+Cj4+PiArwqDCoMKgwqDCoMKgwqDCoMKgIC0gcmVx
dWlyZWQ6IFtkdWFsLWx2ZHMtZXZlbi1waXhlbHNdCj4+Cj4+IC4uLlRob3VnaCwgaWYgeW91IGV4
cGVjdCBkdWFsLWx2ZHMgcGFuZWxzIHRvIGdldCBvdGhlciBxdWlya3MgaW4gdGhlIAo+PiBmdXR1
cmUsCj4+IHRoYXQncyBhIHdob2xlIGRpZmZlcmVudCBzdG9yeSBhbmQgeW91IG1heSBhY3R1YWxs
eSBuZWVkIHRoZSAKPj4gcGFuZWwtZHVhbC1sdmRzCj4+IGNvbXBhdGlibGUuCj4gCj4gWWVzLCBl
eGFjdGx5LiBFdmVuIHdoaWxlIGJlaW5nIG5vbi1zbWFydCwgdGhlcmUgYXJlIGdvaW5nIHRvIGJl
IG1vcmUKPiBxdWlya3MgaW4gZnV0dXJlLiBBbmQgaXQgd291bGQgYmUgYmV0dGVyIGlmIHRoZXkg
aGF2ZSB0aGVpciBvd24KPiBjb21wYXRpYmxlL2JpbmRpbmcsIGFuZCBhcmUgbm90IGdldHRpbmcg
YXBwZW5kZWQgaW4gYW4gZXZlci1ncm93aW5nCj4gaWYtZWxzZSBsYWRkZXIuIDopCgpJIGNhbiBp
bWFnaW5lIGEgcGFuZWwgd2hpY2ggeW91IGNhbiB1c2Ugd2l0aCBhIHNpbmdsZSBMVkRTIGxpbmsg
aWYgdGhlIApjbG9jayBpcyBoaWdoIGVub3VnaCwgb3IgdHdvIExWRFMgbGlua3MgaWYgdGhlIGNs
b2NrIGhhcyB0byBiZSBsb3dlci4gSXMgCnRoYXQgYSBkdWFsLWx2ZHMgcGFuZWw/ID0pCgpCdXQg
cHJvYmFibHkgdGhhdCBzaXR1YXRpb24gaXMgbm8gZGlmZmVyZW50IHRoYW4gYSBwYW5lbCB0aGF0
IGNhbiB3b3JrIAp3aXRoIERTSSBvciBEUEkgaW5wdXQuCgpTdGlsbCwgSSdtIGFncmVlIHdpdGgg
QW5nZWxvIGluIHRoYXQgYSBuZXcgY29tcGF0aWJsZSBzdHJpbmcgZm9yIGR1YWwgCmxpbmsgbHZk
cyBmZWVscyBhIGJpdCBvZGQuIFRoYXQgc2FpZCwgaXQncyBwb3NzaWJsZSB0aGUgcGFuZWwtbHZk
cyAKYmluZGluZ3MgbWlnaHQgZ2V0IHJhdGhlciBjb25mdXNpbmcuIFNvIEkgZG9uJ3QgaGF2ZSBh
IHN0cm9uZyBmZWVsaW5nIGhlcmUuCgogIFRvbWkKCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlz
Y3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
