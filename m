Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B697E77188
	for <linux-riscv@archiver.kernel.org>; Tue, 24 Dec 2024 09:27:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:From:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uiB9vDEV6VLdY3UAgCtC/2OnHAd4sK7X7o7GQs2WyXA=; b=qlG0lHqSKCUePa
	Nkx0c1KYxezgwgb/OGNql7u4lX9mEYZdkQpR+2HU0XxBWO3n0LTSHFXm0v44P6xj4K2wNCZ1AtMUA
	0o5DaIbx2xkp/Aoa5Wc2MPUXF0rRsuItip/tcT7IGGltwZPwSmFsV7iQ1PEXO9OZqDsf/FauCtkid
	rBOcjRjtSmvvCMR7pQWO8bs6BfDZem8Rv0HFJkQluI6qq1JBshchyMmIHcEy+tf74hAoKTDPFW0el
	mtcnBQxr5BgXQLn84nRXYwouJnJyIqK0ERmpDyTrW9J7Q08jpihailrfnctRdw+4PSE/Zxp0StCF1
	fLWmaQaJb7DYT/TBpYPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tQ1Bl-0000000BaAZ-1QIJ;
	Tue, 24 Dec 2024 09:26:53 +0000
Received: from mailout2.w1.samsung.com ([210.118.77.12])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tQ18W-0000000BZpI-0ced
	for linux-riscv@lists.infradead.org;
	Tue, 24 Dec 2024 09:23:35 +0000
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
	by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20241224092327euoutp02835da41343c6c4201b6661ad486e9a68~UEpmExfzh1554715547euoutp02I
	for <linux-riscv@lists.infradead.org>; Tue, 24 Dec 2024 09:23:27 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20241224092327euoutp02835da41343c6c4201b6661ad486e9a68~UEpmExfzh1554715547euoutp02I
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1735032207;
	bh=CT2LjMsvQK3WeyDfvFPXgtfccMOoBoYCxpw/ibKFJpo=;
	h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
	b=HN1GkHY4p8oH+1ybH6mEMXkSiQB67tfNPyRL1zdM2I/QvGp28V+jzvfAEfoUt/ekW
	 fqY3t2M66s3bG+p5hP2cxzPMZ1YsJKYcnPB0DIyPFj+WoBp7lTFq/3dZUNreZ8vNLy
	 adkAOnOTl9Eg90ZbMmoFERELUfzJguao8m24ZJ1k=
Received: from eusmges2new.samsung.com (unknown [203.254.199.244]) by
	eucas1p1.samsung.com (KnoxPortal) with ESMTP id
	20241224092326eucas1p1f4f75608b215db9b334d5565da46c897~UEplaSOUC2771027710eucas1p1G;
	Tue, 24 Dec 2024 09:23:26 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
	eusmges2new.samsung.com (EUCPMTA) with SMTP id 2E.0E.20409.E8D7A676; Tue, 24
	Dec 2024 09:23:26 +0000 (GMT)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
	eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
	20241224092325eucas1p26ee00a131762a9f84e9e664825badeb2~UEpk8g0gZ1296012960eucas1p2F;
	Tue, 24 Dec 2024 09:23:25 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
	eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
	20241224092325eusmtrp24c38df110972e48c124839503473da55~UEpk6vi7l2656126561eusmtrp2A;
	Tue, 24 Dec 2024 09:23:25 +0000 (GMT)
X-AuditID: cbfec7f4-c39fa70000004fb9-55-676a7d8ed08f
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
	eusmgms1.samsung.com (EUCPMTA) with SMTP id 68.BA.19920.D8D7A676; Tue, 24
	Dec 2024 09:23:25 +0000 (GMT)
Received: from [192.168.1.44] (unknown [106.210.136.40]) by
	eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20241224092324eusmtip2ab49005b6b39ee6c5c0dcce8544a43bc~UEpjl3rZ-0443004430eusmtip2I;
	Tue, 24 Dec 2024 09:23:24 +0000 (GMT)
Message-ID: <c17c75c0-ef13-48df-9095-67fbf31bb817@samsung.com>
Date: Tue, 24 Dec 2024 10:23:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v2 01/19] dt-bindings: clock: Add VO subsystem
 clocks and update address requirements
To: Krzysztof Kozlowski <krzk@kernel.org>, Stephen Boyd <sboyd@kernel.org>
Cc: airlied@gmail.com, aou@eecs.berkeley.edu, conor+dt@kernel.org,
	drew@pdp7.com, frank.binns@imgtec.com, guoren@kernel.org,
	jassisinghbrar@gmail.com, jszhang@kernel.org, krzk+dt@kernel.org,
	m.szyprowski@samsung.com, maarten.lankhorst@linux.intel.com,
	matt.coster@imgtec.com, mripard@kernel.org, mturquette@baylibre.com,
	p.zabel@pengutronix.de, palmer@dabbelt.com, paul.walmsley@sifive.com,
	robh@kernel.org, simona@ffwll.ch, tzimmermann@suse.de,
	ulf.hansson@linaro.org, wefu@redhat.com, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org, dri-devel@lists.freedesktop.org,
	linux-pm@vger.kernel.org
Content-Language: en-US
From: Michal Wilczynski <m.wilczynski@samsung.com>
In-Reply-To: <wjet4yvtcobjaf7c4u7to6rm3ppkvmgyitp6evoqjpndtno6qg@h5xxyukph6y6>
X-Brightmail-Tracker: H4sIAAAAAAAAA01Se0xTVxzeub29t5RVbquGE9mGkumcyQCbZTmKYU6HuRIzWeLGYNlmJzeV
	jYdpRRi4zA3GChaYFLdRkIcW2qDIZluklUcslaJzrSi0gPKYUbY2KKmwOmXAaC9u/Pfle/x+
	3+/k8DgiC7GGl5pxmJFlSNIiCD7e2vPE8Vrpl59Jo12+YNTrOo0h46yaROc67Biqtdq5aPSm
	AUP9f00R6Pz9GyT6s+NrHDl1p0iU39NCILd6lEAOx88k8ipHueiWuZpA0yVWgFqnCwjUbB0h
	Ub3XiCNNmxmgwqJGLuq7FodGRntx5L6l5KBCdQhaaG8j0bzzFxxVPewikWHyBBfZmhNRQVcF
	vv0lemrwW5KedLtxulsxQ9IdvjqcNqlHSFppug7oC01FBH3H2U7QNVffpceO2zBar/mKLmju
	weiyuWh6qnOAoEsNTYC+me8iE0TJ/G0pTFrqEUYWFbuff/C36afEoTNUzvnvnmDHQIOgGATx
	IPU6nBuYw4sBnyeidADWNlbhfkFEzQBY3ghZYRpAvfk0+SwxWOkgWUEL4B9mxVL8AYCTl1yB
	uICKhbcrF7h+jFPrYbXpPsnyQni18l7As5oKh2PDPwX4lVQmHKpTEX68ioqHPcMVhH8oh2ri
	QqPGFTBxqFA4fK8W82OCEsNxbW1gQRD1DrQXDOGsJxzmG6s4/jCk+vhQdc3EZXu/DX3z+qUb
	VkKPzbCEX4ALJnYoXGwxbnzEYfFRaFLalnAMvGN/utiIt7jgVdhijmLpt6BSlQ/8NKRWwMEH
	QrbCClje+iOHpQVQUShi3RvgSWXJf0vtulbsexChXvYq6mVHqpcdo/5/bx3Am0AokyVPlzJy
	cQaTHSmXpMuzMqSRBzLTL4DFb/7rvG2mDWg93kgLwHjAAiCPE7FKYBGlSkWCFMkXuYws8xNZ
	Vhojt4AwHh4RKlifEs6IKKnkMPM5wxxiZM9UjBe05hj2PravL2r7XaHTobYkOCdi+Tu9zUTN
	ur36vJzHow1S5cvn3F292cHwdkZ4b+euLfHJx3e/90pkLFORvPBhpi44JNmx1uvTJJcL6n0l
	/4ROhBd7ijeGJe1ijN4K4YatP4gTTmx78fmaveID9ugwX5r3sfZj8am+3UWhZybtezau/Sjx
	zb8pxdbsSzR0csf3fJCkMXhLW7o6rujO7ujMUU0EhXjqErXjA2+sG5qyttX3KxI8Dd5vcjsv
	f/pcfbuwuvvkjSuzm+3x7os7r+9rsHp23BVPuceOXp480j2bNJK3//e8RIGqrH91XLUmF6U4
	YwqoqosPY/RlW5JUZ+O6zaZNj7AIXH5QsnkTRyaX/AtkeGD+VQQAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrKKsWRmVeSWpSXmKPExsVy+t/xe7q9tVnpBms/qFucuL6IyWLr71ns
	Fmv2nmOymH/kHKvFvUtbmCyufH3PZrHu6QV2ixd7G1ksrq2Yy27RfGw9m8XLWffYLM6f38Bu
	8bHnHqvF5V1z2Cw+9x5htNj2uYXNYu2Ru+wWCz9uZbFYsmMXo0Vb5zJWi4unXC3u3jvBYvHy
	cg+zRdssfov/e3awW/y7tpHFYva7/ewWW95MZLU4vjbcomX/FBYHOY/3N1rZPd68fMnicbjj
	C7vH3m8LWDx2zrrL7tGz8wyjx6ZVnWwed67tYfOYdzLQ4373cSaPzUvqPVrWHmPy6P9r4PF+
	31U2j74tqxg9LjVfZw8QitKzKcovLUlVyMgvLrFVija0MNIztLTQMzKx1DM0No+1MjJV0rez
	SUnNySxLLdK3S9DLOPv5F1vBYoGKde0/mRoYl/J2MXJySAiYSNyYeZ69i5GLQ0hgKaPEyofL
	WSASMhLXul9C2cISf651sUEUvWaUmHxgGjNIglfATuL2zP+sIDaLgKrEnJ1P2SHighInZz4B
	axYVkJe4f2sGWFxYIF9i7e6ZYPUiAl4Sx25NARvKLLCKVeL82kWsEBsOM0nsW7QBrIpZQFzi
	1pP5TCA2m4CRxIPl88HinAJ+EudabgJt4ACqUZdYP08IolxeonnrbOYJjEKzkNwxC8mkWQgd
	s5B0LGBkWcUoklpanJueW2yoV5yYW1yal66XnJ+7iRGYvrYd+7l5B+O8Vx/1DjEycTAeYpTg
	YFYS4T0klJkuxJuSWFmVWpQfX1Sak1p8iNEUGBYTmaVEk/OBCTSvJN7QzMDU0MTM0sDU0sxY
	SZzX7fL5NCGB9MSS1OzU1ILUIpg+Jg5OqQYmsy2SX/ee3/V36nJ1t0U9Lydk9QvJ73/NO1vb
	dNmdsLkeO3gvSTz+HZsv4nVy6/qfAo84WVdqSEnsMNL2i1Q87zhxh7/7wTspj90vSXI9YGiV
	srq4j+2Gwk/xI4knJ2pLLczj1Jj19OnRCKMKAY/M5FqZJmXjKp6Z9etslN6b76qz/JS6s+Bk
	0ZK80N76OZ+urQh8/TbPJHXuQf691osWrW0+cbj9dYJKVlRJ6Y95Lm9Of/kuYx2roVGpmXBF
	+ffLGROZ/z2e6yOcKlR/IdT29sIlL0IV0j+8zjhSfeWA1jOj2bq7Pkdabdhs8UyTax5jrIuK
	S+bVm4ZdlrMOhS86Ycv7f8ud90vZ+Wq2rLl2T4mlOCPRUIu5qDgRAIEEWcXoAwAA
X-CMS-MailID: 20241224092325eucas1p26ee00a131762a9f84e9e664825badeb2
X-Msg-Generator: CA
X-RootMTR: 20241223125601eucas1p1d274193122638075dc65310a22616bae
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20241223125601eucas1p1d274193122638075dc65310a22616bae
References: <20241223125553.3527812-1-m.wilczynski@samsung.com>
	<CGME20241223125601eucas1p1d274193122638075dc65310a22616bae@eucas1p1.samsung.com>
	<20241223125553.3527812-2-m.wilczynski@samsung.com>
	<2cd0c34fbd14a0d69e689d04c2241938.sboyd@kernel.org>
	<wjet4yvtcobjaf7c4u7to6rm3ppkvmgyitp6evoqjpndtno6qg@h5xxyukph6y6>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241224_012332_666073_D8101978 
X-CRM114-Status: GOOD (  16.77  )
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

CgpPbiAxMi8yNC8yNCAwOTo1MywgS3J6eXN6dG9mIEtvemxvd3NraSB3cm90ZToKPiBPbiBNb24s
IERlYyAyMywgMjAyNCBhdCAxMjo1MDo1OVBNIC0wODAwLCBTdGVwaGVuIEJveWQgd3JvdGU6Cj4+
IFF1b3RpbmcgTWljaGFsIFdpbGN6eW5za2kgKDIwMjQtMTItMjMgMDQ6NTU6MzUpCj4+PiBUaGUg
VC1IZWFkIFRIMTUyMCBTb0PigJlzIEFQIGNsb2NrIGNvbnRyb2xsZXIgbm93IG5lZWRzIHR3byBh
ZGRyZXNzIHJhbmdlcwo+Pj4gdG8gbWFuYWdlIGJvdGggdGhlIEFwcGxpY2F0aW9uIFByb2Nlc3Nv
ciAoQVApIGFuZCBWaWRlbyBPdXRwdXQgKFZPKQo+Pj4gc3Vic3lzdGVtIGNsb2Nrcy4gVXBkYXRl
IHRoZSBkZXZpY2UgdHJlZSBiaW5kaW5ncyB0byByZXF1aXJlIHR3byBgcmVnYAo+Pj4gZW50cmll
cywgb25lIGZvciB0aGUgQVAgY2xvY2tzIGFuZCBvbmUgZm9yIHRoZSBWTyBjbG9ja3MuCj4+Pgo+
Pj4gQWRkaXRpb25hbGx5LCBpbnRyb2R1Y2UgbmV3IFZPIHN1YnN5c3RlbSBjbG9jayBjb25zdGFu
dHMgaW4gdGhlIGhlYWRlcgo+Pj4gZmlsZS4gVGhlc2UgY29uc3RhbnRzIHdpbGwgYmUgdXNlZCBi
eSB0aGUgZHJpdmVyIHRvIGNvbnRyb2wgVk8tcmVsYXRlZAo+Pj4gY29tcG9uZW50cyBzdWNoIGFz
IGRpc3BsYXkgYW5kIGdyYXBoaWNzIHVuaXRzLgo+Pj4KPj4+IFNpZ25lZC1vZmYtYnk6IE1pY2hh
bCBXaWxjenluc2tpIDxtLndpbGN6eW5za2lAc2Ftc3VuZy5jb20+Cj4+PiAtLS0KPj4gWy4uLl0K
Pj4+IGRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvY2xvY2sv
dGhlYWQsdGgxNTIwLWNsay1hcC55YW1sIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRp
bmdzL2Nsb2NrL3RoZWFkLHRoMTUyMC1jbGstYXAueWFtbAo+Pj4gaW5kZXggMDEyOWJkMGJhNGIz
Li5mMGRmOTdhNDUwZWYgMTAwNjQ0Cj4+PiAtLS0gYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUv
YmluZGluZ3MvY2xvY2svdGhlYWQsdGgxNTIwLWNsay1hcC55YW1sCj4+PiArKysgYi9Eb2N1bWVu
dGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvY2xvY2svdGhlYWQsdGgxNTIwLWNsay1hcC55YW1s
Cj4+PiBAQCAtNDcsNyArNTQsOSBAQCBleGFtcGxlczoKPj4+ICAgICAgI2luY2x1ZGUgPGR0LWJp
bmRpbmdzL2Nsb2NrL3RoZWFkLHRoMTUyMC1jbGstYXAuaD4KPj4+ICAgICAgY2xvY2stY29udHJv
bGxlckBlZjAxMDAwMCB7Cj4+PiAgICAgICAgICBjb21wYXRpYmxlID0gInRoZWFkLHRoMTUyMC1j
bGstYXAiOwo+Pj4gLSAgICAgICAgcmVnID0gPDB4ZWYwMTAwMDAgMHgxMDAwPjsKPj4+ICsgICAg
ICAgIHJlZyA9IDwweGVmMDEwMDAwIDB4MTAwMD4sCj4+PiArICAgICAgICAgICAgICA8MHhmZjAx
MDAwMCAweDEwMDA+Owo+Pgo+PiBJIGRvbid0IGdldCBpdC4gV2h5IG5vdCBoYXZlIHR3byBub2Rl
cyBhbmQgdHdvIGRldmljZXM/IFRoZXkgaGF2ZQo+PiBkaWZmZXJlbnQgcmVnaXN0ZXIgcmVnaW9u
cyBzbyBsaWtlbHkgdGhleSdyZSBkaWZmZXJlbnQgZGV2aWNlcyBvbiB0aGUKPj4gaW50ZXJuYWwg
U29DIGJ1cy4gVGhleSBtYXkgaGF2ZSB0aGUgc2FtZSBpbnB1dCBjbGtzLCBidXQgb3RoZXJ3aXNl
IEkKPj4gZG9uJ3Qgc2VlIGhvdyB0aGV5J3JlIHRoZSBzYW1lIG5vZGUuCj4gCj4gVGhhdCdzIGEg
Z29vZCBwb2ludC4gQXJlbid0IGhlcmUgc2ltcGx5IHR3byBkaWZmZXJlbnQgY2xvY2sgY29udHJv
bGxlcnM/CgpZZWFoIHRoZXJlIGFyZSB0d28gY2xvY2sgY29udHJvbGxlcnMsIGJhc2VkIG9uIHRo
ZSByZXZpZXcgY29tbWVudHMgSSB3YXMKdHJ5aW5nIHRvIHJlLXVzZSB0aGUgZHJpdmVyLCBidXQg
dGhlIGRyaXZlciBjYW4gYWxzbyBiZSByZS11c2VkIHRvIHNlcnZlCm11bHRpcGxlIG5vZGVzIGFu
ZCBtdWx0aXBsZSBjb21wYXRpYmxlIGFuZCAuZGF0YSBwcm9wZXJ0aWVzLCBpZiB0aGF0J3MKZmlu
ZSB3aXRoIHlvdSB0aGF0J3MgaG93IGl0IHdpbGwgbG9vayBsaWtlIGluIHYzLgoKVGhhbmtzLApN
aWNoYcWCCj4gCj4gQmVzdCByZWdhcmRzLAo+IEtyenlzenRvZgo+IAo+IAoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBs
aXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVh
ZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
