Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC2C9C79FA3
	for <linux-riscv@archiver.kernel.org>; Mon,  5 Jan 2026 16:13:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=N8/Xf7UGi6FYxeFPCFRY/fz/rgaG8ZsB2d1DwbaZVrk=; b=jCt+a1LR//7xH2
	E+SmChwZz9qTylTrvCEXcR6aRD1IrtFx5mWHj+dvVYUVRlk2jOaPP0zUSEXjSgN+vdOlWky5FMa/C
	jpAZSLnA1AJgQnrjfgxNWtG1GqeG1OmUCQA0j/G3Lr9F3mpGHC3FpEEsX7LElJonhMNI4G5EXPqa7
	rv6fY1NzjwOtkpBA6hNkkyw3TE28tN5aP3p/pzKmtTDHJMPGKdXICndsMVPDvUm0gdUBBhAgyxVeu
	xV9tD4Y/s2kp6lSnkEDzn0hC1wzOtqJtRGI8pzxCPysIsDUWAkpYOnH1tgHiYXZTY7eGs83rJ8Cyt
	CoBz5+/AfSvDgH5T5fFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vcnDG-0000000Bi2I-1cnO;
	Mon, 05 Jan 2026 16:13:46 +0000
Received: from sender4-op-o12.zoho.com ([136.143.188.12])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vcnDD-0000000Bi1m-0HQa
	for linux-riscv@lists.infradead.org;
	Mon, 05 Jan 2026 16:13:44 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1767629495; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=HFPkpi3yUt2retBX3XruNmVKRhLugIWUtSku85zjLKmrEPbhagqb6VEPHqvjft5uymwswCMrdMbPUh8kAC+XU8Qt5CK2TPKjkKalykSR0xnplEcfK4AgWNjAVx3uLYlWnwJHvkJBR2gg2URbV9sUh2XU2wI3+XuF3YwJrx6SUQU=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1767629495; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=TsUBNyZy9Y8U68MehXtbryg/+pqq1ZDESAgD5LeM2oE=; 
	b=dvrqO+J+vBouU/c1lunfd4L19pTxn9BJKF9jYYImddGCntzHcCSkJRJoNFvl22N3vsXM1z0C92VHlUMzAZuXyIkDDPah93d+/Wq/QkWU8uPDYvtFeAzHtV3x1KO59NRC9SfUmrxDWNOygYPx0Rr/qr4i0HpY3Y4cIQ30smZdH+M=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=icenowy.me;
	spf=pass  smtp.mailfrom=uwu@icenowy.me;
	dmarc=pass header.from=<uwu@icenowy.me>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1767629495;
	s=zmail2; d=icenowy.me; i=uwu@icenowy.me;
	h=Message-ID:Subject:Subject:From:From:To:To:Cc:Cc:Date:Date:In-Reply-To:References:Content-Type:Content-Transfer-Encoding:MIME-Version:Message-Id:Reply-To;
	bh=TsUBNyZy9Y8U68MehXtbryg/+pqq1ZDESAgD5LeM2oE=;
	b=Zl0RjHbGG4ePiC5rg+Ouv9+o67810a4y9QZkBvPiRX+OJJ7J10dijLKO0ss9sXta
	RKBINZ99rLgumWFz+daBMc/Ti1hLS0CBvX+gICkWe14wGqgvEO61AFfKj62tQ0q37Fy
	DTGVuaPVEHF4UB/yVeBbFc3XZuzYsaPudrkYUYaYRfeanntjEqFUTGnj97v7cXR28JY
	Umc3iToZbX0GyPfiAbm9fzWPcQWjNtYz6+6i2P8Rp89UPCn57I+2nUq5G0ZrKuu1Jci
	weAiS5Or1saJBtv/fN9vWcEb3FHe7A3awgfYLakNokcUsPYHZAi6JRpxDOk4jiTvWAf
	N7ZtTd4Lfg==
Received: by mx.zohomail.com with SMTPS id 1767629491804668.4612361380402;
	Mon, 5 Jan 2026 08:11:31 -0800 (PST)
Message-ID: <a838dc0f8bd39c6d9da95f5fd137eba8c131c58a.camel@icenowy.me>
Subject: Re: [PATCH v4 2/9] dt-bindings: display: add verisilicon,dc
From: Icenowy Zheng <uwu@icenowy.me>
To: Rob Herring <robh@kernel.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Drew Fustini
 <fustini@kernel.org>, Guo Ren <guoren@kernel.org>, Fu Wei
 <wefu@redhat.com>,  Philipp Zabel <p.zabel@pengutronix.de>, Heiko Stuebner
 <heiko@sntech.de>, Andrzej Hajda <andrzej.hajda@intel.com>, Neil Armstrong
 <neil.armstrong@linaro.org>,  Robert Foss <rfoss@kernel.org>, Laurent
 Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman
 <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, Michal
 Wilczynski <m.wilczynski@samsung.com>, Han Gao <rabenda.cn@gmail.com>, Yao
 Zi <ziyao@disroot.org>, dri-devel@lists.freedesktop.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-riscv@lists.infradead.org
Date: Tue, 06 Jan 2026 00:11:16 +0800
In-Reply-To: <20260105154656.GA2585570-robh@kernel.org>
References: <20251224161205.1132149-1-zhengxingda@iscas.ac.cn>
	 <20251224161205.1132149-3-zhengxingda@iscas.ac.cn>
	 <20260105154656.GA2585570-robh@kernel.org>
Organization: Anthon Open-Source Community
User-Agent: Evolution 3.44.4 
MIME-Version: 1.0
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260105_081343_187936_30BCAF35 
X-CRM114-Status: GOOD (  28.73  )
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

5ZyoIDIwMjYtMDEtMDXmmJ/mnJ/kuIDnmoQgMDk6NDYgLTA2MDDvvIxSb2IgSGVycmluZ+WGmemB
k++8mgo+IE9uIFRodSwgRGVjIDI1LCAyMDI1IGF0IDEyOjExOjU4QU0gKzA4MDAsIEljZW5vd3kg
Wmhlbmcgd3JvdGU6Cj4gPiBGcm9tOiBJY2Vub3d5IFpoZW5nIDx1d3VAaWNlbm93eS5tZT4KPiA+
IAo+ID4gVmVyaXNpbGljb24gaGFzIGEgc2VyaWVzIG9mIGRpc3BsYXkgY29udHJvbGxlcnMgcHJl
Zml4ZWQgd2l0aCBEQwo+ID4gYW5kCj4gPiB3aXRoIHNlbGYtaWRlbnRpZmljYXRpb24gZmFjaWxp
dHkgbGlrZSB0aGVpciBHQyBzZXJpZXMgR1BVcy4KPiA+IAo+ID4gQWRkIGEgZGV2aWNlIHRyZWUg
YmluZGluZyBmb3IgaXQuCj4gPiAKPiA+IERlcGVuZHMgb24gdGhlIHNwZWNpZmljIERDIG1vZGVs
LCBpdCBjYW4gaGF2ZSBlaXRoZXIgb25lIG9yIHR3bwo+ID4gZGlzcGxheQo+ID4gb3V0cHV0cywg
YW5kIGVhY2ggZGlzcGxheSBvdXRwdXQgY291bGQgYmUgc2V0IHRvIERQSSBzaWduYWwgb3IgIkRQ
Igo+ID4gc2lnbmFsICh3aGljaCBzZWVtcyB0byBiZSBzb21lIHBsYWluIHBhcmFsbGVsIGJ1cyB0
byBIRE1JCj4gPiBjb250cm9sbGVycykuCj4gPiAKPiA+IFNpZ25lZC1vZmYtYnk6IEljZW5vd3kg
WmhlbmcgPHV3dUBpY2Vub3d5Lm1lPgo+ID4gU2lnbmVkLW9mZi1ieTogSWNlbm93eSBaaGVuZyA8
emhlbmd4aW5nZGFAaXNjYXMuYWMuY24+Cj4gPiAtLS0KPiA+IENoYW5nZXMgaW4gdjQ6Cj4gPiAt
IEFkZGVkIGEgY29tbWVudCBmb3IgInZlcmlzaWxpY29uLGRjIiB0aGF0IHNheXMgdGhlIElEL3Jl
dmlzaW9uIGlzCj4gPiDCoCBkaXNjb3ZlcmFibGUgdmlhIHJlZ2lzdGVycy4KPiA+IC0gUmVtb3Zl
ZCBjbG9jayBtaW5JdGVtcyBjb25zdHJhaW50IHcvbyBzcGVjaWZpYyBjb21wYXRpYmxlCj4gPiBz
dHJpbmdzLgo+ID4gCj4gPiBDaGFuZ2VzIGluIHYzOgo+ID4gLSBBZGRlZCBTb0Mtc3BlY2lmaWMg
Y29tcGF0aWJsZSBzdHJpbmcsIGFuZCBhcm0gdGhlIGJpbmRpbmcgd2l0aAo+ID4gY2xvY2sgLwo+
ID4gwqAgcG9ydCBjaGVja2luZyBmb3IgdGhlIHNwZWNpZmljIFNvQyAod2l0aCBhIDItb3V0cHV0
IERDKS4KPiA+IAo+ID4gQ2hhbmdlcyBpbiB2MjoKPiA+IC0gRml4ZWQgbWlzc3BlbHQgInZlcnNp
bGljb24iIGluIHRpdGxlLgo+ID4gLSBNb3ZlZCBtaW5JdGVtcyBpbiBjbG9jayBwcm9wZXJ0aWVz
IHRvIGJlIGVhcmxpZXIgdGhhbiBpdGVtcy4KPiA+IC0gUmUtYWxpZ25lZCBtdWx0aS1saW5lIGNs
b2NrcyBhbmQgcmVzZXRzIGluIGV4YW1wbGUuCj4gPiAKPiA+IMKgLi4uL2JpbmRpbmdzL2Rpc3Bs
YXkvdmVyaXNpbGljb24sZGMueWFtbMKgwqDCoMKgwqAgfCAxNDQKPiA+ICsrKysrKysrKysrKysr
KysrKwo+ID4gwqAxIGZpbGUgY2hhbmdlZCwgMTQ0IGluc2VydGlvbnMoKykKPiA+IMKgY3JlYXRl
IG1vZGUgMTAwNjQ0Cj4gPiBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxh
eS92ZXJpc2lsaWNvbixkYy55YW1sCj4gPiAKPiA+IGRpZmYgLS1naXQKPiA+IGEvRG9jdW1lbnRh
dGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvdmVyaXNpbGljb24sZGMueWFtbAo+ID4g
Yi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS92ZXJpc2lsaWNvbixk
Yy55YW1sCj4gPiBuZXcgZmlsZSBtb2RlIDEwMDY0NAo+ID4gaW5kZXggMDAwMDAwMDAwMDAwMC4u
ZmU2NGNjMTQ2NjY5MAo+ID4gLS0tIC9kZXYvbnVsbAo+ID4gKysrIGIvRG9jdW1lbnRhdGlvbi9k
ZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvdmVyaXNpbGljb24sZGMueWFtbAo+ID4gQEAgLTAs
MCArMSwxNDQgQEAKPiA+ICsjIFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiAoR1BMLTIuMCBPUiBC
U0QtMi1DbGF1c2UpCj4gPiArJVlBTUwgMS4yCj4gPiArLS0tCj4gPiArJGlkOiBodHRwOi8vZGV2
aWNldHJlZS5vcmcvc2NoZW1hcy9kaXNwbGF5L3ZlcmlzaWxpY29uLGRjLnlhbWwjCj4gPiArJHNj
aGVtYTogaHR0cDovL2RldmljZXRyZWUub3JnL21ldGEtc2NoZW1hcy9jb3JlLnlhbWwjCj4gPiAr
Cj4gPiArdGl0bGU6IFZlcmlzaWxpY29uIERDLXNlcmllcyBkaXNwbGF5IGNvbnRyb2xsZXJzCj4g
PiArCj4gPiArbWFpbnRhaW5lcnM6Cj4gPiArwqAgLSBJY2Vub3d5IFpoZW5nIDx1d3VAaWNlbm93
eS5tZT4KPiA+ICsKPiA+ICtwcm9wZXJ0aWVzOgo+ID4gK8KgICRub2RlbmFtZToKPiA+ICvCoMKg
wqAgcGF0dGVybjogIl5kaXNwbGF5QFswLTlhLWZdKyQiCj4gPiArCj4gPiArwqAgY29tcGF0aWJs
ZToKPiA+ICvCoMKgwqAgaXRlbXM6Cj4gPiArwqDCoMKgwqDCoCAtIGVudW06Cj4gPiArwqDCoMKg
wqDCoMKgwqDCoMKgIC0gdGhlYWQsdGgxNTIwLWRjODIwMAo+ID4gK8KgwqDCoMKgwqAgLSBjb25z
dDogdmVyaXNpbGljb24sZGMgIyBEQyBJUHMgaGF2ZSBkaXNjb3ZlcmFibGUKPiA+IElEL3Jldmlz
aW9uIHJlZ2lzdGVycwo+ID4gKwo+ID4gK8KgIHJlZzoKPiA+ICvCoMKgwqAgbWF4SXRlbXM6IDEK
PiA+ICsKPiA+ICvCoCBpbnRlcnJ1cHRzOgo+ID4gK8KgwqDCoCBtYXhJdGVtczogMQo+ID4gKwo+
ID4gK8KgIGNsb2NrczoKPiA+ICvCoMKgwqAgaXRlbXM6Cj4gPiArwqDCoMKgwqDCoCAtIGRlc2Ny
aXB0aW9uOiBEQyBDb3JlIGNsb2NrCj4gPiArwqDCoMKgwqDCoCAtIGRlc2NyaXB0aW9uOiBETUEg
QVhJIGJ1cyBjbG9jawo+ID4gK8KgwqDCoMKgwqAgLSBkZXNjcmlwdGlvbjogQ29uZmlndXJhdGlv
biBBSEIgYnVzIGNsb2NrCj4gPiArwqDCoMKgwqDCoCAtIGRlc2NyaXB0aW9uOiBQaXhlbCBjbG9j
ayBvZiBvdXRwdXQgMAo+ID4gK8KgwqDCoMKgwqAgLSBkZXNjcmlwdGlvbjogUGl4ZWwgY2xvY2sg
b2Ygb3V0cHV0IDEKPiA+ICsKPiA+ICvCoCBjbG9jay1uYW1lczoKPiA+ICvCoMKgwqAgaXRlbXM6
Cj4gPiArwqDCoMKgwqDCoCAtIGNvbnN0OiBjb3JlCj4gPiArwqDCoMKgwqDCoCAtIGNvbnN0OiBh
eGkKPiA+ICvCoMKgwqDCoMKgIC0gY29uc3Q6IGFoYgo+ID4gK8KgwqDCoMKgwqAgLSBjb25zdDog
cGl4MAo+ID4gK8KgwqDCoMKgwqAgLSBjb25zdDogcGl4MQo+ID4gKwo+ID4gK8KgIHJlc2V0czoK
PiA+ICvCoMKgwqAgaXRlbXM6Cj4gPiArwqDCoMKgwqDCoCAtIGRlc2NyaXB0aW9uOiBEQyBDb3Jl
IHJlc2V0Cj4gPiArwqDCoMKgwqDCoCAtIGRlc2NyaXB0aW9uOiBETUEgQVhJIGJ1cyByZXNldAo+
ID4gK8KgwqDCoMKgwqAgLSBkZXNjcmlwdGlvbjogQ29uZmlndXJhdGlvbiBBSEIgYnVzIHJlc2V0
Cj4gPiArCj4gPiArwqAgcmVzZXQtbmFtZXM6Cj4gPiArwqDCoMKgIGl0ZW1zOgo+ID4gK8KgwqDC
oMKgwqAgLSBjb25zdDogY29yZQo+ID4gK8KgwqDCoMKgwqAgLSBjb25zdDogYXhpCj4gPiArwqDC
oMKgwqDCoCAtIGNvbnN0OiBhaGIKPiA+ICsKPiA+ICvCoCBwb3J0czoKPiA+ICvCoMKgwqAgJHJl
ZjogL3NjaGVtYXMvZ3JhcGgueWFtbCMvcHJvcGVydGllcy9wb3J0cwo+ID4gKwo+ID4gK8KgwqDC
oCBwcm9wZXJ0aWVzOgo+ID4gK8KgwqDCoMKgwqAgcG9ydEAwOgo+ID4gK8KgwqDCoMKgwqDCoMKg
ICRyZWY6IC9zY2hlbWFzL2dyYXBoLnlhbWwjL3Byb3BlcnRpZXMvcG9ydAo+ID4gK8KgwqDCoMKg
wqDCoMKgIGRlc2NyaXB0aW9uOiBUaGUgZmlyc3Qgb3V0cHV0IGNoYW5uZWwgLCBlbmRwb2ludCAw
IHNob3VsZAo+ID4gYmUKPiAKPiBObyBzcGFjZSBiZWZvcmUgY29tbWEuIE9yIHBlcmhhcHMgc2hv
dWxkIGJlIGEgcGVyaW9kIGluc3RlYWQuCgpXZWxsIEkgZG9uJ3Qga25vdyB3aHkgSSBpbnNlcnRl
ZCBzdWNoIGEgc3BhY2UsIHdpbGwgcmVtb3ZlIGl0LgoKPiAKPiAKPiA+ICvCoMKgwqDCoMKgwqDC
oMKgwqAgdXNlZCBmb3IgRFBJIGZvcm1hdCBvdXRwdXQgYW5kIGVuZHBvaW50IDEgc2hvdWxkIGJl
IHVzZWQKPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqAgZm9yIERQIGZvcm1hdCBvdXRwdXQuCj4gPiAr
Cj4gPiArwqDCoMKgwqDCoCBwb3J0QDE6Cj4gPiArwqDCoMKgwqDCoMKgwqAgJHJlZjogL3NjaGVt
YXMvZ3JhcGgueWFtbCMvcHJvcGVydGllcy9wb3J0Cj4gPiArwqDCoMKgwqDCoMKgwqAgZGVzY3Jp
cHRpb246IFRoZSBzZWNvbmQgb3V0cHV0IGNoYW5uZWwgaWYgdGhlIERDIHZhcmlhbnQKPiA+ICvC
oMKgwqDCoMKgwqDCoMKgwqAgc3VwcG9ydHMuIEZvbGxvdyB0aGUgc2FtZSBlbmRwb2ludCBhZGRy
ZXNzaW5nIHJ1bGUgd2l0aAo+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoCB0aGUgZmlyc3QgcG9ydC4K
PiA+ICsKPiA+ICvCoMKgwqAgcmVxdWlyZWQ6Cj4gPiArwqDCoMKgwqDCoCAtIHBvcnRAMAo+ID4g
Kwo+ID4gK3JlcXVpcmVkOgo+ID4gK8KgIC0gY29tcGF0aWJsZQo+ID4gK8KgIC0gcmVnCj4gPiAr
wqAgLSBpbnRlcnJ1cHRzCj4gPiArwqAgLSBjbG9ja3MKPiA+ICvCoCAtIGNsb2NrLW5hbWVzCj4g
PiArwqAgLSBwb3J0cwo+ID4gKwo+ID4gK2FsbE9mOgo+ID4gK8KgIC0gaWY6Cj4gPiArwqDCoMKg
wqDCoCBwcm9wZXJ0aWVzOgo+ID4gK8KgwqDCoMKgwqDCoMKgIGNvbXBhdGlibGU6Cj4gPiArwqDC
oMKgwqDCoMKgwqDCoMKgIGNvbnRhaW5zOgo+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgY29u
c3Q6IHRoZWFkLHRoMTUyMC1kYzgyMDAKPiA+ICvCoMKgwqAgdGhlbjoKPiA+ICvCoMKgwqDCoMKg
IHByb3BlcnRpZXM6Cj4gPiArwqDCoMKgwqDCoMKgwqAgY2xvY2tzOgo+ID4gK8KgwqDCoMKgwqDC
oMKgwqDCoCBtaW5JdGVtczogNQo+IAo+IFRoYXQncyBhbHJlYWR5IGltcGxpY2l0bHkgdGhlIG1p
bi4gUGVyaGFwcyB5b3Ugd2FudGVkICdtaW5JdGVtczogNCcKPiBvbiAKPiB0aGUgY2xvY2tzIGFu
ZCBjbG9jay1uYW1lcyBkZWZpbml0aW9ucyBmb3IgdmVyc2lvbnMgd2l0aCBvbmx5IDEKPiBvdXRw
dXQ/CgpQcmV2aW91c2x5IEkgc3BlY2lmaWVkIG1pbkl0ZW1zOiA0IGluIHRoZSBnZW5lcmFsIHBh
cnQsIGhvd2V2ZXIgdGhpcwpkb2VzIG5vdCBwbGF5IHdlbGwgd2hlbiBzb21lIG9mIGNvcmUvYXhp
L2FoYiBjbG9ja3MgYXJlIG5vdCBwcmVzZW50LgoKPiAKPiA+ICvCoMKgwqDCoMKgwqDCoCBwb3J0
czoKPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqAgcmVxdWlyZWQ6Cj4gPiArwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoCAtIHBvcnRAMAo+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgLSBwb3J0QDEKPiAK
PiBJdCBpcyB2YWxpZCB0byBvbWl0IHRoZXNlIGlmIHRoZSBvdXRwdXQgaXMgcHJlc2VudCwgYnV0
IHVudXNlZC4KCldlbGwgdGhpcyBzb3VuZHMgcmVhc29uYWJsZSwgYWx0aG91Z2ggbXkgZHJpdmVy
IGRvZXMgbm90IHBsYXkgd2VsbCBpZgpvbmx5IGEgcG9ydEAxIGlzIGRlZmluZWQgdy9vIHBvcnRA
MCAuCgpDb25zaWRlcmluZyB0aGUgcHJldmlvdXMgdHdvIHNuaXBwZXRzLCBzaG91bGQgSSBqdXN0
IHJlbW92ZSB0aGlzIGlmCnBhcnQ/Cgo+IAo+ID4gKwo+ID4gK2FkZGl0aW9uYWxQcm9wZXJ0aWVz
OiBmYWxzZQo+ID4gKwo9PT09PT0gODwgPT09PT09PT0KCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1y
aXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxt
YW4vbGlzdGluZm8vbGludXgtcmlzY3YK
