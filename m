Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BBCCC369AB
	for <linux-riscv@archiver.kernel.org>; Tue, 15 Apr 2025 11:45:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:From:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Jt8FUtKIJCs/xKz22BrTC3HGGLwVcZ6b5nJ+gIeHATY=; b=TuXJn1CXuperRk
	kSDu2W22jyhSIET/OaobUb3E/tW8AeF1aaS4jrs9qzjR2Zz+emi//Br0YAnDVpBumIoeyfBk4Kfer
	ItHUT3Fi5XtRc/8AxLOepYtomqaKscX9vkIA6/XPxZNFP7rA26nLmH6S83I+dO3iLGKv9+NqyJFWd
	UMcPnjSMI1I/it2yxAKk0xJIZucMutFjshhKyPXkcN6vU2lJzpzyFqqV/CXhaDzQfQYUZRLaS5A7T
	+P03JCW+i6omC37fzES8jtEIUIWVYY0J9+TJHYA9kvkgb3w0BNAkupXvrqFc6ToH7Mo7D8D1eFwYK
	Mt0yxyN+1yMET2Iq9Yiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4ejZ-00000005bcn-0ZWe;
	Tue, 15 Apr 2025 11:45:45 +0000
Received: from mailout2.w1.samsung.com ([210.118.77.12])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4e6W-00000005SFr-33TS
	for linux-riscv@lists.infradead.org;
	Tue, 15 Apr 2025 11:05:26 +0000
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
	by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20250415110520euoutp02a05745c51a53e0ab0a208d78d15ba3df~2eShiOjvA0774207742euoutp02f
	for <linux-riscv@lists.infradead.org>; Tue, 15 Apr 2025 11:05:19 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20250415110520euoutp02a05745c51a53e0ab0a208d78d15ba3df~2eShiOjvA0774207742euoutp02f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1744715120;
	bh=aLn/AEFMpttKdygzkWg+Y5Dq2mkLBesLmZHzH94VPGc=;
	h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
	b=uY6cyIVadW/vgbiERrhcIxL0GHwfXF31yDhVUYAvyQjf4f0ZBze5MMNdVXABC54Il
	 BgM0uPxBSRO+OSBgN5TEnYa4T50QSJSPnv73eBtPsk04igBUThWdJlCnOme7XmITU7
	 CJ30e5WDBNWA3tM2NKhLvd93N+yqw4bmhFPiSWYM=
Received: from eusmges2new.samsung.com (unknown [203.254.199.244]) by
	eucas1p1.samsung.com (KnoxPortal) with ESMTP id
	20250415110519eucas1p13d350463a1db089b07e6f07975d75457~2eShF3vr-1800318003eucas1p1M;
	Tue, 15 Apr 2025 11:05:19 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
	eusmges2new.samsung.com (EUCPMTA) with SMTP id 21.CB.20409.F6D3EF76; Tue, 15
	Apr 2025 12:05:19 +0100 (BST)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
	eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
	20250415110519eucas1p282dfd609fa94c8d7dc2f8c5582124fe7~2eSgnW5bQ0518205182eucas1p2E;
	Tue, 15 Apr 2025 11:05:19 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
	eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
	20250415110518eusmtrp225a31cef6c14e09144833c668f90dac0~2eSgmFd9S2890028900eusmtrp2h;
	Tue, 15 Apr 2025 11:05:18 +0000 (GMT)
X-AuditID: cbfec7f4-c39fa70000004fb9-b9-67fe3d6fce8c
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
	eusmgms1.samsung.com (EUCPMTA) with SMTP id 46.17.19920.E6D3EF76; Tue, 15
	Apr 2025 12:05:18 +0100 (BST)
Received: from [192.168.1.44] (unknown [106.210.136.40]) by
	eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20250415110517eusmtip2fcfb3b74759928d6aab8b3af31fed6a3~2eSfcbQPF1773317733eusmtip2w;
	Tue, 15 Apr 2025 11:05:17 +0000 (GMT)
Message-ID: <a3142259-1c72-45b9-b148-5e5e6bef87f9@samsung.com>
Date: Tue, 15 Apr 2025 13:05:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/4] drm/imagination: Skip clocks if platform PM
 manages resources
To: Matt Coster <Matt.Coster@imgtec.com>, Maxime Ripard <mripard@kernel.org>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, Danilo Krummrich
	<dakr@kernel.org>, Pavel Machek <pavel@kernel.org>, Drew Fustini
	<drew@pdp7.com>, Guo Ren <guoren@kernel.org>, Fu Wei <wefu@redhat.com>, Rob
	Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor
	Dooley <conor+dt@kernel.org>, Ulf Hansson <ulf.hansson@linaro.org>, Philipp
	Zabel <p.zabel@pengutronix.de>, Frank Binns <Frank.Binns@imgtec.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Thomas Zimmermann
	<tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter
	<simona@ffwll.ch>, "m.szyprowski@samsung.com" <m.szyprowski@samsung.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-pm@vger.kernel.org" <linux-pm@vger.kernel.org>,
	"linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Content-Language: en-US
From: Michal Wilczynski <m.wilczynski@samsung.com>
In-Reply-To: <1226d261-247a-4a7c-a414-7db4a24fab9e@imgtec.com>
X-Brightmail-Tracker: H4sIAAAAAAAAA01SfUxTVxzNfe/xXlsseRYnV2G6NXMLMlDApTcKZl3MfIYt0USzRVhYM58t
	jFLTWrc5jEUqX9JRl8GkOEDGxIDdEtoiJVZmRSorKwY/mIavoeVLGCDI2IZ0tA83/jvnd889
	53duLg8XlZHreWmZR1l1pixDTAqIxra/PNGqxEX51vIRiG51V2PossODoSelUySqbPUEob4u
	K4buPpsk0Y/e2xQacWQTaNTUR6I7zedJNGNoBahxRk8ic2svhS5M2whU09QMUG7BxSDU23eL
	QPmTOhx9N1uCI9/VJgqV/9FCIev42SDkMn+A9C3fEG9DxjFXRTB2Uy/FFNk7ANNQV0AyPfev
	kkxF+z6m/4wLYyw1Jxm9uQ1jip9vZSav3SOZr6x1gLG4v2RmGjbsDTkoSDjEZqQdY9Vbdn4s
	UNwe9GJHciI+d7oZHRhdWwj4PEhvg48W/sQLgYAnoi8B+GDOSHJkFsCuAiPFkRkAx30l4MWV
	0dxHy6paAIftFwiOTABYfLMG86uE9E5YPKsP8mOC3gTLr+fh3Hw1bC97TPjxS/RG2P/wHOXH
	oXQyNJvPBTRr6PfgQP8g5jfF6XsUHPH6AtE4HQYfPq4MBJB0HByorQwE8JfC6utdGKfZCHNs
	5YFGkC4RQOMZ3VICb4nsghU5kVyFUDjmslIcjoA+O+cJaRUcsD3FOZwF7UWuZbwD9nj+Jv02
	OB0Jf2rewo2l8J8HUzjnHgJ/m1jNbRACv278dnkshPm5Ik79OiwpMvwX6rnUiBmB2LTiUUwr
	OppWdDH9n1sFiDoQxmo1SjmrictkP4vRyJQabaY85hOVsgEs/V73omu2CdSOTcc4AcYDTgB5
	uHiN0CNZlIuEh2RfHGfVqlS1NoPVOEE4jxCHCatbTstFtFx2lP2UZY+w6henGI+/XocFJ0VG
	O7M6ReEuKqkwqk2sWzfklTtTwgddJ/Lu8FNCpYezsr5XTwpf80jm4EScPSr/d4fkF6H1h7OG
	7F8lb1lTO7xlJ4NF18MXDCrK5pPOG1Aqybe4z79yyjfx6oHazYrEjlVD2fWV65Lw0hsZ764F
	80V7lFdu7nk2ZaGHxm9clC0+feN4T3vy5X1m0TXYGf3+R0N1yfGbWu+e2LZr1c+6aS27vdCR
	3j12umy38YDCfcqnaP/Q2lHK16ftjY/OdrwTvBDV25Kg7ZZapMPKiq5OZ/7+xKoE/nZJyv34
	w+nzZGzI7mNPDs4/3297ebg4Qm6MHWCrI64kWvLS1Rve3MEXExqFLHYzrtbI/gXYpfatLAQA
	AA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrDKsWRmVeSWpSXmKPExsVy+t/xe7p5tv/SDc6dNrE4cX0Rk8WaveeY
	LF5P+8BmMf/IOVaLe5e2MFlc+fqezWLd0wvsFi/2NrJYvJx1j83i8q45bBafe48wWmz73MJm
	sfbIXXaLhR+3slgs2bGL0aKtcxmrxd17J1gsOt43MFvM/TKV2eL/nh3sFrPf7We32PJmIqvF
	8bXhFi37p7A4SHjs/baAxWPnrLvsHj07zzB6bFrVyeZx59oeNo95JwM97ncfZ/LYvKTeo2Xt
	MSaP/r8GHu/3XWXz6NuyitFj8+lqj8+b5AL4ovRsivJLS1IVMvKLS2yVog0tjPQMLS30jEws
	9QyNzWOtjEyV9O1sUlJzMstSi/TtEvQyLjx6ylTQLFNx6LRHA+NLsS5GTg4JAROJl22P2boY
	uTiEBJYySjxY84kdIiEjca37JQuELSzx51oXVNFrRonGW3eYQRK8AnYS/V9aWEFsFgFVidkH
	26HighInZz4BaxYVkJe4f2sG2FBhgWiJtWtngNWICPhIPLj/iAlkKLPAbXaJmx+msUBs2Msk
	sXtuL1g3s4C4xK0n85lAbDYBI4kHy+eDbeME2rx69XGgOAdQjbrE+nlCEOXyEs1bZzNPYBSa
	heSOWUgmzULomIWkYwEjyypGkdTS4tz03GJDveLE3OLSvHS95PzcTYzAZLPt2M/NOxjnvfqo
	d4iRiYPxEKMEB7OSCO8583/pQrwpiZVVqUX58UWlOanFhxhNgWExkVlKNDkfmO7ySuINzQxM
	DU3MLA1MLc2MlcR53S6fTxMSSE8sSc1OTS1ILYLpY+LglGpg2n0mbPpWl+LNEfO5Zh0S+PW+
	/9ENuwrhs9vkpezVz0Zcvmu8U3j1mo/l0hJPQmdOcuYrcPope7iues3L5m+LWesKDPZO0O5r
	5wt9tezaW63G+dfaFaM/nqpNbWCxuZr18azF3YQ7XDMdtHV0D/7Tkz09UWf+JiaGY5u37dm1
	gG/dvLJfhTFbLrLH2x9Yti66O6b8WnNA6NoWn5Ut4k1b5jFkrteeKmC6bl7bHHu18AMf9sh7
	KohsjGALXOBZuCNR161gZ8x0X/Nl3q+7H7q3X2zpUI43qXX2ucQxzatd2d1uqbTAtFVac/hf
	ld0od1hvvnL+f26bNzxSh37dP53BJMC4v4RJ4+belvpjPs2blFiKMxINtZiLihMBJxWbGL8D
	AAA=
X-CMS-MailID: 20250415110519eucas1p282dfd609fa94c8d7dc2f8c5582124fe7
X-Msg-Generator: CA
X-RootMTR: 20250414185317eucas1p139284a38dc4418ac90bd081c2825142a
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20250414185317eucas1p139284a38dc4418ac90bd081c2825142a
References: <20250414-apr_14_for_sending-v2-0-70c5af2af96c@samsung.com>
	<CGME20250414185317eucas1p139284a38dc4418ac90bd081c2825142a@eucas1p1.samsung.com>
	<20250414-apr_14_for_sending-v2-4-70c5af2af96c@samsung.com>
	<20250415-poetic-magenta-cicada-9d1ee7@houat>
	<1226d261-247a-4a7c-a414-7db4a24fab9e@imgtec.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250415_040525_364763_B36883E4 
X-CRM114-Status: GOOD (  27.54  )
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

CgpPbiA0LzE1LzI1IDExOjE1LCBNYXR0IENvc3RlciB3cm90ZToKPiBPbiAxNS8wNC8yMDI1IDA5
OjU1LCBNYXhpbWUgUmlwYXJkIHdyb3RlOgo+PiBPbiBNb24sIEFwciAxNCwgMjAyNSBhdCAwODo1
Mjo1OFBNICswMjAwLCBNaWNoYWwgV2lsY3p5bnNraSB3cm90ZToKPj4+IFVwZGF0ZSB0aGUgSW1h
Z2luYXRpb24gUFZSIGRyaXZlciB0byBza2lwIGNsb2NrIG1hbmFnZW1lbnQgZHVyaW5nCj4+PiBp
bml0aWFsaXphdGlvbiBpZiB0aGUgcGxhdGZvcm0gUE0gaGFzIGluZGljYXRlZCB0aGF0IGl0IG1h
bmFnZXMgcGxhdGZvcm0KPj4+IHJlc291cmNlcy4KPj4+Cj4+PiBUaGlzIGlzIG5lY2Vzc2FyeSBm
b3IgcGxhdGZvcm1zIGxpa2UgdGhlIFQtSEVBRCBUSDE1MjAsIHdoZXJlIHRoZSBHUFUncwo+Pj4g
Y2xvY2tzIGFuZCByZXNldHMgYXJlIG1hbmFnZWQgdmlhIGEgUE0gZG9tYWluLCBhbmQgc2hvdWxk
IG5vdCBiZQo+Pj4gbWFuaXB1bGF0ZWQgZGlyZWN0bHkgYnkgdGhlIEdQVSBkcml2ZXIuCj4+Pgo+
Pj4gU2lnbmVkLW9mZi1ieTogTWljaGFsIFdpbGN6eW5za2kgPG0ud2lsY3p5bnNraUBzYW1zdW5n
LmNvbT4KPj4+IC0tLQo+Pj4gIGRyaXZlcnMvZ3B1L2RybS9pbWFnaW5hdGlvbi9wdnJfZGV2aWNl
LmMgfCAxNCArKysrKysrKysrLS0tLQo+Pj4gIDEgZmlsZSBjaGFuZ2VkLCAxMCBpbnNlcnRpb25z
KCspLCA0IGRlbGV0aW9ucygtKQo+Pj4KPj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0v
aW1hZ2luYXRpb24vcHZyX2RldmljZS5jIGIvZHJpdmVycy9ncHUvZHJtL2ltYWdpbmF0aW9uL3B2
cl9kZXZpY2UuYwo+Pj4gaW5kZXggMTcwNGMwMjY4NTg5YmRlYjY1ZmE2NTM1ZjllYzYzMTgyYjBh
M2U5NC4uZjQwNDY4Yjk5Y2YxNGRhNDE4YWVlY2RlMDg2ZjAwOTY5NWZmODc3YyAxMDA2NDQKPj4+
IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9pbWFnaW5hdGlvbi9wdnJfZGV2aWNlLmMKPj4+ICsrKyBi
L2RyaXZlcnMvZ3B1L2RybS9pbWFnaW5hdGlvbi9wdnJfZGV2aWNlLmMKPj4+IEBAIC01MDQsMTAg
KzUwNCwxNiBAQCBwdnJfZGV2aWNlX2luaXQoc3RydWN0IHB2cl9kZXZpY2UgKnB2cl9kZXYpCj4+
PiAgCWlmIChlcnIpCj4+PiAgCQlyZXR1cm4gZXJyOwo+Pj4gIAo+Pj4gLQkvKiBFbmFibGUgYW5k
IGluaXRpYWxpemUgY2xvY2tzIHJlcXVpcmVkIGZvciB0aGUgZGV2aWNlIHRvIG9wZXJhdGUuICov
Cj4+PiAtCWVyciA9IHB2cl9kZXZpY2VfY2xrX2luaXQocHZyX2Rldik7Cj4+PiAtCWlmIChlcnIp
Cj4+PiAtCQlyZXR1cm4gZXJyOwo+Pj4gKwkvKgo+Pj4gKwkgKiBPbmx5IGluaXRpYWxpemUgY2xv
Y2tzIGlmIHRoZXkgYXJlIG5vdCBtYW5hZ2VkIGJ5IHRoZSBwbGF0Zm9ybSdzCj4+PiArCSAqIFBN
IGRvbWFpbi4KPj4+ICsJICovCj4+PiArCWlmICghZGV2aWNlX3BsYXRmb3JtX3Jlc291cmNlc19w
bV9tYW5hZ2VkKGRldikpIHsKPj4+ICsJCS8qIEVuYWJsZSBhbmQgaW5pdGlhbGl6ZSBjbG9ja3Mg
cmVxdWlyZWQgZm9yIHRoZSBkZXZpY2UgdG8gb3BlcmF0ZS4gKi8KPj4+ICsJCWVyciA9IHB2cl9k
ZXZpY2VfY2xrX2luaXQocHZyX2Rldik7Cj4+PiArCQlpZiAoZXJyKQo+Pj4gKwkJCXJldHVybiBl
cnI7Cj4+PiArCX0KPj4KPj4gU28sIGhvdyBkb2VzIHRoYXQgd29yayBmb3IgZGV2ZnJlcT8gSSBj
YW4gdW5kZXJzdGFuZCB0aGUgcmF0aW9uYWxlIGZvcgo+PiByZXNldHMgYW5kIHRoZSBzeXMgY2xv
Y2ssIGJ1dCB0aGUgY29yZSBjbG9jayBhdCBsZWFzdCBzaG91bGQgcmVhbGx5IGJlCj4+IGhhbmRs
ZWQgYnkgdGhlIGRyaXZlci4KCkhpIE1heGltZSwgTWF0dCwKClRoYW5rcyBmb3IgdGhlIGZlZWRi
YWNrLgoKVGhpcyBjb21taXQgaXMgdHJ5aW5nIHRvIHByZXZlbnQgdGhlIHB2ciBSVU5USU1FX1BN
X09QUyBmcm9tIGNvbnRyb2xsaW5nIHRoZQpjbG9ja3Mgb3IgcmVzZXRzLCBhcyB0aGVyZSBpcyBh
IGN1c3RvbSBzdGFydC9zdG9wIHNlcXVlbmNlIG5lZWRlZCBmb3IKdGhlIFRIMTUyMCBTb0MgY29k
ZWQgaW4gcGF0Y2ggMyBvZiB0aGlzIHNlcmllcy4KCnN0YXRpYyBjb25zdCBzdHJ1Y3QgZGV2X3Bt
X29wcyBwdnJfcG1fb3BzID0gewoJUlVOVElNRV9QTV9PUFMocHZyX3Bvd2VyX2RldmljZV9zdXNw
ZW5kLCBwdnJfcG93ZXJfZGV2aWNlX3Jlc3VtZSwgcHZyX3Bvd2VyX2RldmljZV9pZGxlKQp9OwoK
U28sIGlmIHRoZSBjb3JlIGNsb2NrIG5lZWRzIHRvIGJlIHVzZWQgZm9yIG90aGVyIHB1cnBvc2Vz
IGxpa2UgZGV2ZnJlcSwKd2UgY291bGQgbW92ZSB0aGUgZGV2aWNlX3BsYXRmb3JtX3Jlc291cmNl
c19wbV9tYW5hZ2VkKCkgY2hlY2sgdG8gdGhlCnB2cl9wb3dlcl8qIGZ1bmN0aW9ucyBpbnN0ZWFk
LiBUaGlzIHdvdWxkIHByZXZlbnQgdGhlIGNsb2NrcyBhbmQgcmVzZXRzCmZyb20gYmVpbmcgbWFu
YWdlZCBpbiBydW50aW1lIFBNIGluIHRoZSBjb25zdW1lciBkcml2ZXIsIHdoaWxlIHN0aWxsCmFs
bG93aW5nIHRoZSBHUFUgZHJpdmVyIHRvIGFjY2VzcyBhbmQgY29udHJvbCBjbG9ja3MgbGlrZSB0
aGUgY29yZSBjbG9jawphcyBuZWVkZWQgZm9yIG90aGVyIHB1cnBvc2VzLgoKVGhhdCB3YXksIGNs
b2NrcyBjb3VsZCBiZSBzYWZlbHkgc2hhcmVkIGJldHdlZW4gdGhlIFBNIGRvbWFpbiBkcml2ZXIg
YW5kIHRoZQpkZXZpY2UgZHJpdmVyLCB3aXRoIGdlbmVyaWMgUE0gZHJpdmVyIGNvbnRyb2xsaW5n
IHRoZSBzdGFydC9zdG9wCnNlcXVlbmNlIGZvciByZXNldCBhbmQgY2xvY2tzLiBXZSB3b3VsZCBw
cm9iYWJseSBuZWVkIHRvIGZpbmQgYQpiZXR0ZXIgbmFtZSBmb3IgdGhlIGZsYWcgdGhlbiwgdG8g
bW9yZSBjbGVhcmx5IHJlZmxlY3QgdGhhdCBpdCdzIGFib3V0CmRlbGVnYXRpbmcgY2xvY2svcmVz
ZXQgUE0gcnVudGltZSBjb250cm9sLCByYXRoZXIgdGhhbiBmdWxsIHJlc291cmNlCm93bmVyc2hp
cC4KCj4gCj4gSSBhZ3JlZSwgdGhpcyBmZWVscyBhIGJpdCAiYWxsIG9yIG5vdGhpbmciIHRvIG1l
LiBUaGVyZSdzIG9ubHkgb25lIGNsb2NrCj4gb24gdGhpcyBwbGF0Zm9ybSB0aGF0IGhhcyBpc3N1
ZXMsIHdlIGNhbiBzdGlsbCBjb250cm9sIHRoZSBvdGhlciB0d28KPiBqdXN0IGZpbmUuCj4gCj4g
SSB0aG91Z2h0IGZpeGVkIGNsb2NrcyB3ZXJlIHRoZSBzdGFuZGFyZCBtZWNoYW5pc20gZm9yIGV4
cG9zaW5nCj4gbm9uLWNvbnRyb2xsYWJsZSBjbG9ja3MgdG8gZGV2aWNlIGRyaXZlcnM/CgpUaGF0
J3MgY29ycmVjdCDigJQgYW5kIGl0J3Mgbm90IHJlYWxseSBhYm91dCB0aGUgTUVNIGNsb2NrIGF0
IHRoaXMgcG9pbnQuClRoZSBtYWluIGdvYWwgaXMgdG8gZW5zdXJlIHRoZSBjdXN0b20gcG93ZXIt
dXAgc2VxdWVuY2UgZm9yIHRoZSBUSDE1MjAKU29DIGlzIGZvbGxvd2VkLiBUaGF0IHNlcXVlbmNl
IGlzIGltcGxlbWVudGVkIGluCnRoMTUyMF9ncHVfZG9tYWluX3N0YXJ0KCkgaW4gcGF0Y2ggMyBv
ZiB0aGlzIHNlcmllcy4KClJlZ2FyZHMsCk1pY2hhxYIKCj4gCj4gQ2hlZXJzLAo+IE1hdHQKPiAK
Pj4KPj4gTWF4aW1lCj4gCj4gCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5m
cmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xp
bnV4LXJpc2N2Cg==
