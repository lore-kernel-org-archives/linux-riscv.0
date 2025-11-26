Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72575D10F20
	for <linux-riscv@archiver.kernel.org>; Wed, 26 Nov 2025 10:25:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tOLh/0nGgDTbYZBDaSwXKp+4g9blZxyIdLM7yof23X0=; b=wXeBWpmc6spj5B
	Y6lNYA8Fuw0zfe5zay16nT2lt+mpcJz6xSJ0B2S8b3OVkZeYHUwO/8FTT6tgwGOVEBeteytPmemfE
	Pk6i5SKSPvllFAd0FYXFpqAVqzoF5oMh9C3uOBc/esEvGeJdxQtPUVe2TFl/A3F7JkVY8z+Es2ZJp
	64dMvBOqAp2eqW/e4oEiUe4ln3LipDJxQPzZV5ZSDz0zFipZxA6ePjz69c9PfH3286/+hYlzYJhNa
	YLIB6w2PDYnuRuos2pl1PRgQQacBuaMh/GkFftGntkRigQ+U2vhNwoAlG3QOK81wbiHhkLxMRTApT
	fsJhBFbx7TZBHg0syOag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOChr-0000000EmR2-1jVt;
	Wed, 26 Nov 2025 10:25:03 +0000
Received: from sender3-op-o12.zoho.com ([136.143.184.12])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOCho-0000000EmP2-1s6z
	for linux-riscv@lists.infradead.org;
	Wed, 26 Nov 2025 10:25:02 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1764152676; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=GjpN7+0mJ4VallUL9S0o2idcDIIb4RYr7NdY3+Sux97oXTaNHiODNMh7AulUDRcr4khwPlZMS8u7xWMRTnux1eSUG/oBHvhdhBu9xgZp11nqH+kjRmnXqvGrxhH+gxfFohIbKwVC5H5FSywGOmdx0eiGfhIa1PgDBLYTY/PACok=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1764152676; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=CmdPaoLtlgzN/ALPtVg3jWDe/4Z13eJZhKpYdSPlSEA=; 
	b=bj1v56HDVk/YZs7ORWExKkPlUr4hJE8fstR5iWgDFxyqjoSfSYvHg5kGMHw99n/GeISX/melW2lfPlJ84IeLIXOdxgPUJw+yXwOF1+W3BIN0xgRgNRjO+eimytYlQLqQ2u196Hna34fQOeWv3zb9z2LlXQYtiEZCE3bSZa2Fz1g=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=icenowy.me;
	spf=pass  smtp.mailfrom=uwu@icenowy.me;
	dmarc=pass header.from=<uwu@icenowy.me>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1764152676;
	s=zmail2; d=icenowy.me; i=uwu@icenowy.me;
	h=Message-ID:Subject:Subject:From:From:To:To:Cc:Cc:Date:Date:In-Reply-To:References:Content-Type:Content-Transfer-Encoding:MIME-Version:Message-Id:Reply-To;
	bh=CmdPaoLtlgzN/ALPtVg3jWDe/4Z13eJZhKpYdSPlSEA=;
	b=kS0+3EoIO5eOIKrS4MrbD02t/bQzAirAhx/2dMGekxHGKnZDndv/KMZ8A5PdTmUA
	M6vPXqRD0ww1laogJKDhESW12lJjxG8spp4M97biXbXpvrPUrG1Yy7NBEG8TweoC5nl
	5+7FBTTwO4E5i6I0st9V/Z9PBgJXZ3a6VEHz3+4Jrejos5hcY/YGCKUj6NPqXpL/69i
	uIb9tydZpiz0azY/a96DdRCL4smcrov9Sy5jHK1XZuuUaBZlJH6JapeYunlKI2wzttH
	F6DYkJYTS+TfSHYOPqhnbLeSTDHsn5uVa+pQaLBjA+GMeY0zvk5ZR3EVevNCQ1EJqFX
	btTAIuF0VA==
Received: by mx.zohomail.com with SMTPS id 1764152673442929.6477168746331;
	Wed, 26 Nov 2025 02:24:33 -0800 (PST)
Message-ID: <d4f07dbc7edb55d996d4d251acb9631f33e48f5e.camel@icenowy.me>
Subject: Re: [PATCH v3 2/9] dt-bindings: display: add verisilicon,dc
From: Icenowy Zheng <uwu@icenowy.me>
To: Krzysztof Kozlowski <krzk@kernel.org>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Drew
 Fustini <fustini@kernel.org>, Guo Ren <guoren@kernel.org>, Fu Wei
 <wefu@redhat.com>, Philipp Zabel <p.zabel@pengutronix.de>, Heiko Stuebner
 <heiko@sntech.de>, Andrzej Hajda <andrzej.hajda@intel.com>, Neil Armstrong
 <neil.armstrong@linaro.org>,  Robert Foss <rfoss@kernel.org>, Laurent
 Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman
 <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, Michal
 Wilczynski <m.wilczynski@samsung.com>
Cc: Han Gao <rabenda.cn@gmail.com>, Yao Zi <ziyao@disroot.org>, 
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
Date: Wed, 26 Nov 2025 18:24:22 +0800
In-Reply-To: <0b7ba974-d8d5-4417-8182-3e9299315058@kernel.org>
References: <20251124105226.2860845-1-uwu@icenowy.me>
	 <20251124105226.2860845-3-uwu@icenowy.me>
	 <d4cfe8bb-5ca2-40a9-bfe0-96e7ded5586c@kernel.org>
	 <544ae21cc1b5f488d03a5650d9275ff22b237d63.camel@icenowy.me>
	 <0b7ba974-d8d5-4417-8182-3e9299315058@kernel.org>
Organization: Anthon Open-Source Community
User-Agent: Evolution 3.44.4 
MIME-Version: 1.0
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251126_022500_630654_FFA9F901 
X-CRM114-Status: GOOD (  24.10  )
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

5ZyoIDIwMjUtMTEtMjbmmJ/mnJ/kuInnmoQgMTE6MjIgKzAxMDDvvIxLcnp5c3p0b2YgS296bG93
c2tp5YaZ6YGT77yaCj4gT24gMjYvMTEvMjAyNSAxMDo1MCwgSWNlbm93eSBaaGVuZyB3cm90ZToK
PiA+ID4gPiArbWFpbnRhaW5lcnM6Cj4gPiA+ID4gK8KgIC0gSWNlbm93eSBaaGVuZyA8dXd1QGlj
ZW5vd3kubWU+Cj4gPiA+ID4gKwo+ID4gPiA+ICtwcm9wZXJ0aWVzOgo+ID4gPiA+ICvCoCAkbm9k
ZW5hbWU6Cj4gPiA+ID4gK8KgwqDCoCBwYXR0ZXJuOiAiXmRpc3BsYXlAWzAtOWEtZl0rJCIKPiA+
ID4gPiArCj4gPiA+ID4gK8KgIGNvbXBhdGlibGU6Cj4gPiA+ID4gK8KgwqDCoCBpdGVtczoKPiA+
ID4gPiArwqDCoMKgwqDCoCAtIGVudW06Cj4gPiA+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoCAtIHRo
ZWFkLHRoMTUyMC1kYzgyMDAKPiA+ID4gPiArwqDCoMKgwqDCoCAtIGNvbnN0OiB2ZXJpc2lsaWNv
bixkYwo+ID4gPiAKPiA+ID4gSSBkbyBub3Qgc2VlIGFueSBleHBsYW5hdGlvbiBvZiBleGNlcHRp
b24gZm9yIGdlbmVyaWMKPiA+ID4gY29tcGF0aWJsZXMsCj4gPiA+IG1heWJlCj4gPiA+IGV4Y2Vw
dCAic2VsZi1pZGVudGlmaWNhdGlvbiIgcmVtYXJrLiBSb2IgYWxyZWFkeSBwb2ludGVkIHRoaXMK
PiA+ID4gb3V0LCBzbwo+ID4gPiBiZQo+ID4gPiBleHBsaWNpdCBpbiBjb21taXQgbXNnIHdoeSB5
b3UgYXJlIHVzaW5nIGEgZ2VuZXJpYyBjb21wYXRpYmxlLgo+ID4gCj4gPiBXZWxsIEkgb25seSBn
ZXQgdGhlIG1lYW5pbmcgb2YgImEgU29DIHNwZWNpZmljIGNvbXBhdGlibGUgaXMKPiA+IHJlcXVp
cmVkIgo+ID4gaW4gaGlzIHJldmlldyBtZXNzYWdlLgo+ID4gCj4gPiBJIHRoaW5rIG15IGJpbmRp
bmcgbm93IHJlcXVpcmVzIGJvdGggYSBTb0Mtc3BlY2lmaWMgY29tcGF0aWJsZSBhbmQKPiA+IGEK
PiA+IGdlbmVyaWMgY29tcGF0aWJsZSwgd2hpY2ggc2hvdWxkIGJlIG9rYXkgdG8gc2F0aXNmeSBS
b2IncyBvcmlnaW5hbAo+ID4gcmV2aWV3Lgo+IAo+IFlvdSB3aWxsIGdldCB0aGVuIHRoZSBzYW1l
IHF1ZXN0aW9ucyBmb3IgbWUgLSB3aGF0IGp1c3RpZmllcyBnZW5lcmljCj4gY29tcGF0aWJsZS4g
WW91IHNob3VsZCBiZSBvbiB0aGlzIGV4cGxpY2l0LCBiZWNhdXNlIG90aGVyd2lzZSBwZW9wbGUK
PiBtaXNpbnRlcnByZXQgc29tZSBjb21taXRzIGFuZCBwYXRjaGVzLCBhbmQgdGhleSB0aGluayB0
aGUgZ2VuZXJpYwo+IGNvbXBhdGlibGUgaXMgYWxsb3dlZCBmb3IgdGhlbSBhcyB3ZWxsLgo+IAo+
ID4gCj4gPiA+IAo+ID4gPiA+ICsKPiA+ID4gPiArwqAgcmVnOgo+ID4gPiA+ICvCoMKgwqAgbWF4
SXRlbXM6IDEKPiA+ID4gPiArCj4gPiA+ID4gK8KgIGludGVycnVwdHM6Cj4gPiA+ID4gK8KgwqDC
oCBtYXhJdGVtczogMQo+ID4gPiA+ICsKPiA+ID4gPiArwqAgY2xvY2tzOgo+ID4gPiA+ICvCoMKg
wqAgbWluSXRlbXM6IDQKPiA+ID4gCj4gPiA+IFRoaXMgaXMgbm90IGZsZXhpYmxlLiBEZXZpY2Ug
ZWl0aGVyIGhhcyBvciBoYXMgbm90IHRoZXNlIGNsb2Nrcy4KPiA+IAo+ID4gVGhlIGV4aXN0ZW5j
ZSBvZiBhbGwgdGhlc2UgY2xvY2tzIGFyZSB2ZXJpZmllZCBieSBkaWFncmFtcyBpbgo+ID4gbWFu
dWFscwo+IAo+IFNvIG5vdCBmbGV4aWJsZSwgdGhlbjoKPiAKPiA+IG9mIHR3byBkaWZmZXJlbnQg
U29DcyB3aXRoIERDODIwMCAoVC1IZWFkIFRIMTUyMCBhbmQgU3RhckZpdmUKPiA+IEpINzExMCku
Cj4gPiAKPiA+IE1heWJlIGEgZXhwbGljaXQgYG1heEl0ZW1zOiA1YCBpcyBuZWVkZWQgaGVyZSwg
YnV0IGFzIG15IERUIHBhc3Nlcwo+ID4gZHRic19jaGVjaywgSSBkb24ndCB0aGluayBpdCdzIG5l
Y2Vzc2FyeT8KPiAKPiBObywgZHJvcCBtaW5JdGVtcyBvbmx5LgoKV2VsbCwgb2theSwgc291bmRz
IHJlYXNvbmFibGUuCgo+IAo+ID4gCj4gPiBPciBtYXliZSBJIHNob3VsZCBkcm9wIHRoZSBmbGV4
aWJpbGl0eSBub3cgYW5kIHVzZSBhIGBtaW5JdGVtczogNWAKPiA+IGhlcmUKPiA+IChhbmQgbGVh
dmUgREM4MDAwIHN1cHBvcnQgYXMgYW5vdGhlciBzdG9yeSk/IChUaGUgRXN3aW4gRUlDNzcwMAo+
ID4gbWFudWFsCj4gPiBkb2VzIG5vdCBoYXZlIGEgZGlhZ3JhbSBzaG93aW5nIGV4dGVybmFsIGNv
bm5lY3Rpb25zIG9mIHRoZSBEQywKPiA+IGxpa2UKPiA+IHRoZSB0d28gU29DcyBJIG1lbnRpb25l
ZCBhYm92ZSkuCj4gCj4gWW91IGRvY3VtZW50IGhlcmUgb25seSB0aGUgZGV2aWNlcyBleHBsaWNp
dGx5IG1lbnRpb25lZCBpbiB0aGUKPiBiaW5kaW5nLgo+IFlvdSBjYW5ub3QgYWRkIGhlcmUgY29u
c3RyYWludHMgb3IgY2xvY2tzIGZvciBzb21lIGRldmljZSB3aGljaCBpcwo+IG5vdAo+IGluIHRo
ZSBiaW5kaW5nIGFuZCBJIHNlZSBvbmx5IHRoMTUyMCBpbiB0aGUgYmluZGluZy4KPiAKPiBCZXN0
IHJlZ2FyZHMsCj4gS3J6eXN6dG9mCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3Rz
LmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5m
by9saW51eC1yaXNjdgo=
