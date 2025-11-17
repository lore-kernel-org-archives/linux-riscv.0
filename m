Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79580CE8D6B
	for <linux-riscv@archiver.kernel.org>; Mon, 17 Nov 2025 11:09:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=w9tXRNNJxO9XzPBklGG/LB8ZpByWfcSp9KrHXwRs93s=; b=jY1riwBWDinkMz
	I+LTKOLOSPnBfiJwdhz1XspnY1T5pd/QehNnj8IsU/uaI0W5WFJRgGHnRswQW0zADZPmXT482z0dd
	1eGjaCeijdasQvBOjQozTf4xuqEy/+GUPaoGSOhLrgIJCfHuj5yWDy0mmkEw7iA6o2AA0W/LYXwQ0
	5sUtJFdl0BksbSrB2q7BFs/Wx0CLGJbd9wmslhRzyARN5UrwkIogeLPjVAc/QGB6zi/90gqUVo2jE
	6bP2DSfsRonOxVstG+Ve4wnizDhtAKasPK1fWIjxTqJISNQ+W8f5Utnj6U63IPb0CzdABK7ryageB
	WlYSwOVerg0BOHWZnGCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vKx6P-0000000FwoY-0OBO;
	Mon, 17 Nov 2025 11:08:57 +0000
Received: from s2.avantea.pl ([46.242.128.95])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vKx6L-0000000FwnV-3TJ3;
	Mon, 17 Nov 2025 11:08:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=szczodrzynski.pl; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To
	:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=5vQb0kOt03xdg4mAHFEyfGbNg93voYMkCIDEWmXv3sI=; b=NLxuGAVPYfKBLjm4HnYWIROAnw
	vT+06H8WujBGR7lc09kFGCBepd4Dd9c3qIavE9GdezJcI2PEJEwezcKKK9+8gVcPj/joeHBsXFKlo
	6b8yTpe9dRV7Ix1CMyGZHZ7edl2it8qDxYd+j5zy4ycaCWIw8Es9K/N9Vzd16VBMYtyOox1raf64h
	tREEzAV2+hHOnQVp3Trjdtk1gN/rF5pjpgoTXx/3a5wzzh6IshemL0ZZSDFazANJhUYF7rzZj4fUC
	DcIbErlQPnj5VR+V+kMPmZqDsl5mFDpPujp5Q3VDq3qzyhZMy9oiXsFY3mwPFQiVHSL9F3pdl/Hi0
	JWLoRscg==;
Received: from d100-116.icpnet.pl ([77.65.100.116] helo=[192.168.0.120])
	by s2.avantea.pl with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.98.1)
	(envelope-from <kuba@szczodrzynski.pl>)
	id 1vKx6F-0000000GvqE-1Xuy;
	Mon, 17 Nov 2025 12:08:47 +0100
Message-ID: <a0347d10-475d-4dd2-b53e-ca7905869887@szczodrzynski.pl>
Date: Mon, 17 Nov 2025 12:08:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/6] dt-bindings: display: sun4i: Add D1s/T113 combo
 D-PHY bindings
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Maxime Ripard <mripard@kernel.org>, Samuel Holland <samuel@sholland.org>,
 Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-phy@lists.infradead.org,
 devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
 parthiban@linumiz.com, paulk@sys-base.io
References: <20251116134609.447043-1-kuba@szczodrzynski.pl>
 <20251116134943.447443-1-kuba@szczodrzynski.pl>
 <20251117-faithful-unique-millipede-d8bae5@kuoka>
Content-Language: pl
From: =?UTF-8?Q?Kuba_Szczodrzy=C5=84ski?= <kuba@szczodrzynski.pl>
Autocrypt: addr=kuba@szczodrzynski.pl; keydata=
 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
In-Reply-To: <20251117-faithful-unique-millipede-d8bae5@kuoka>
X-Authenticated-Id: kuba@szczodrzynski.pl
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251117_030854_037670_DFD76E58 
X-CRM114-Status: GOOD (  15.12  )
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

VyBkbml1IDIwMjUtMTEtMTcgb8KgMDg6MDU6MzMsIEtyenlzenRvZiBLb3psb3dza2kgcGlzemU6
DQoNCj4gT24gU3VuLCBOb3YgMTYsIDIwMjUgYXQgMDI6NDk6NDNQTSArMDEwMCwgS3ViYSBTemN6
b2RyennFhHNraSB3cm90ZToNCj4+IFRoZSBzdW40aSBUQ09OIG5lZWRzIGEgcmVmZXJlbmNlIHRv
IHRoZSBELVBIWSBpbiBvcmRlciB0byBzdXBwb3J0IExWRFMNCj4+IG9uIEFsbHdpbm5lciBEMXMv
VDExMy4NCj4+DQo+PiBBZGQgcGh5cyBhbmQgcGh5LW5hbWVzIHRvIERUIGJpbmRpbmdzLg0KPiBE
byBub3QgYXR0YWNoICh0aHJlYWQpIHlvdXIgcGF0Y2hzZXRzIHRvIHNvbWUgb3RoZXIgdGhyZWFk
cyAodW5yZWxhdGVkDQo+IG9yIG9sZGVyIHZlcnNpb25zKS4gVGhpcyBidXJpZXMgdGhlbSBkZWVw
IGluIHRoZSBtYWlsYm94IGFuZCBtaWdodA0KPiBpbnRlcmZlcmUgd2l0aCBhcHBseWluZyBlbnRp
cmUgc2V0cy4gU2VlIGFsc286DQo+IGh0dHBzOi8vZWxpeGlyLmJvb3RsaW4uY29tL2xpbnV4L3Y2
LjE2LXJjMi9zb3VyY2UvRG9jdW1lbnRhdGlvbi9wcm9jZXNzL3N1Ym1pdHRpbmctcGF0Y2hlcy5y
c3QjTDgzMA0KDQpJJ2xsIHJlc2VuZCB2NCBhcyBhIG5ldyBwYXRjaHNldC4NCg0KPg0KPj4gU2ln
bmVkLW9mZi1ieTogS3ViYSBTemN6b2RyennFhHNraSA8a3ViYUBzemN6b2Ryenluc2tpLnBsPg0K
Pj4gLS0tDQo+PiAgIC4uLi9iaW5kaW5ncy9kaXNwbGF5L2FsbHdpbm5lcixzdW40aS1hMTAtdGNv
bi55YW1sICAgICAgICAgIHwgNiArKysrKysNCj4+ICAgMSBmaWxlIGNoYW5nZWQsIDYgaW5zZXJ0
aW9ucygrKQ0KPj4NCj4+IGRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmlu
ZGluZ3MvZGlzcGxheS9hbGx3aW5uZXIsc3VuNGktYTEwLXRjb24ueWFtbCBiL0RvY3VtZW50YXRp
b24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L2FsbHdpbm5lcixzdW40aS1hMTAtdGNvbi55
YW1sDQo+PiBpbmRleCA3MjRkOTNiOTEuLjUyNTg5MzQxZiAxMDA2NDQNCj4+IC0tLSBhL0RvY3Vt
ZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L2FsbHdpbm5lcixzdW40aS1hMTAt
dGNvbi55YW1sDQo+PiArKysgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlz
cGxheS9hbGx3aW5uZXIsc3VuNGktYTEwLXRjb24ueWFtbA0KPj4gQEAgLTExNSw2ICsxMTUsMTIg
QEAgcHJvcGVydGllczoNCj4+ICAgICAgICAgICAgIC0gY29uc3Q6IGVkcA0KPj4gICAgICAgICAg
ICAgLSBjb25zdDogbHZkcw0KPj4gICANCj4+ICsgIHBoeXM6DQo+PiArICAgIG1heEl0ZW1zOiAx
DQo+PiArDQo+PiArICBwaHktbmFtZXM6DQo+PiArICAgIGNvbnN0OiBjb21iby1waHkNCj4gRHJv
cCBwaHkgc3VmZml4LiBDYW4gYSAicGh5IiBwcm9wZXJ0eSBob2xkIHJlZmVyZW5jZSB0byBzb21l
dGhpbmcgZWxzZQ0KPiB0aGFuIHBoeT8NCg0KV2lsbCBkby4NCg0KPiBZb3UgZG9uJ3QgbmVlZCBu
YW1lcyBpbiB0aGUgZmlyc3QgcGxhY2UsIHlvdSBoYXZlIG9ubHkgb25lDQo+IGVudHJ5Lg0KDQpI
b3dldmVyLCBwaHktbmFtZXMgd2FzIGFkZGVkIGJlY2F1c2Ugb2YgaG93IG90aGVyIGJpbmRpbmdz
IGFyZSBtYWRlLCBzdWNoIGFzICJhbGx3aW5uZXIsc3VuNGktYTEwLW11c2IiIChzaW5nbGUgcGh5
IGVudHJ5IHdpdGggY29uc3QgbmFtZSkuDQoNClNvIEkgdGhpbmsgaXQgbWFrZXMgc2Vuc2UgdG8g
a2VlcCBpdCwgaW4gbGluZSB3aXRoIG90aGVyIGRyaXZlcnMuDQoNClJlZ2FyZHMNCkt1YmENCg0K
Pg0KPiBCZXN0IHJlZ2FyZHMsDQo+IEtyenlzenRvZg0KPg0KX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4
LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFp
bG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
