Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93842C44536
	for <linux-riscv@archiver.kernel.org>; Thu, 22 Jan 2026 09:24:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wAe6VaOt9THaTSm4TN6/BlGUWZTDKO902ZgzeINCp/c=; b=DJU9qZ5akAgHAH
	fr3pNBz8GwyFWjupYwG1yNWZvH1fNbrgUA76vVe29vNKOseO6HaBOr3+8SHIZSRo/YpNddbJqXW40
	Qh6jpSFRO7NLLQtCXg/pdgVf/xLKKePVvxoOoB6kCs7R9anQ+7H8lb25clFWUowRr8NWoS8F6nS2y
	LGmD6b0ewyZy7l5dsWAqIi/vAvh1ic7Gw7w3Rfbm2LMGy52hNG3evpAgavHf6jYtq4bZqUFk+L1BU
	VkYJH9mlglM0dPmLKPxfuJbsQC8zR4Xqu1yL9LpCGCuEqhqtYrZy4yOQjG9XWBetpXIfnwcSViPbn
	mPi5rNn0dOnOwUZTXm6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viqvJ-00000006jlA-3wWo;
	Thu, 22 Jan 2026 09:24:17 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viqvI-00000006jl2-3xW5
	for linux-riscv@bombadil.infradead.org;
	Thu, 22 Jan 2026 09:24:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=MIME-Version:Content-Transfer-Encoding
	:Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=IbHVXj6EvAWyURsulZzgey0tLztYqyj+R+Rd9hYsBrc=; b=QP6eJVx9Ihk4kkuagXN+9UMR5V
	4tCERb+ApwGgJEPZk0cgY+Jvx+D0jCXxCHLZLnezdCIvkJkTf8HFNYQ7RBp0Qr4WTpZHEtDWQsPV0
	fb0UjyU7fMgjtTs3SjcYgTN8VD1hYZXxU9GXDjBsY4pvLDwDsRE7XyQ0osH+7OM/xhSaeFyTkRlv7
	+bLbX+XJmhn7t9BLtLhIUyEKkT83TrJ3JzlulYiF+EC/6VwOnXgBXOa+xAgJdZ5fittMW7ihgRVE4
	cDVoNwJuly+I34KXB4BcUKAzIFOpD6I/mdevkWORJufutR9+j/5gCfGGgtBjWgTaj1JYSPhfYCK6V
	ifUTNDZw==;
Received: from sender4-pp-e109.zoho.com ([136.143.188.109])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viqvA-000000002W6-1sVv
	for linux-riscv@lists.infradead.org;
	Thu, 22 Jan 2026 09:24:15 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1769073813; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=L5ltR3k8MjdtR1ZQ8aRPu69Epk7gd7HZtE1AD5dIjQ0cbeCmWnrWI6qBb65Vt1wgYY2Lbm7CYdjefv2QNa6EHpoWtgtUeaPgj1DuqOEX43z0VNjP8pX9icVg7OQZJJ+f31J5x/LtFH3soFIyYCi31CTGdzvfFFeCayTYFRhA1ao=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1769073813; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=IbHVXj6EvAWyURsulZzgey0tLztYqyj+R+Rd9hYsBrc=; 
	b=htAo9voUbgFxgQG61stO0SFnTkj0nlqotAdPWTac3m8dqlZMmu/DEMFbs2w1POKl2HSQRRXPR4ztk/kw6C/oO9sp8r6P4js3bPpW6v3m55X3ljJ8ZsAhv3rnR0Rj63iWvc6nxxciXDMOGzPqmkd0z4ORHRMONxOzKfIy+j+FKd4=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=icenowy.me;
	spf=pass  smtp.mailfrom=uwu@icenowy.me;
	dmarc=pass header.from=<uwu@icenowy.me>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1769073813;
	s=zmail2; d=icenowy.me; i=uwu@icenowy.me;
	h=Message-ID:Subject:Subject:From:From:To:To:Cc:Cc:Date:Date:In-Reply-To:References:Content-Type:Content-Transfer-Encoding:MIME-Version:Message-Id:Reply-To;
	bh=IbHVXj6EvAWyURsulZzgey0tLztYqyj+R+Rd9hYsBrc=;
	b=bKWJKpx0fwl7w/YxbvSVEY9bRDoHS6lyQLO7tmoMgKEXx6NZ//TN+M7ICQSxEGg2
	O8Yms5iNLDNx7iivDhsAGvn5uN9u/uySdDSkSSM4zqE+Jr372RReBf/7LR1DUP4dIIW
	xaK90MateKJgRYQzdPMxNaIh9YV6GCDB9DvURJ1mVLaZ0kawVzQ4wmUqKHsJg7sgj7B
	q4hVsGW5RYFkaS6H5m3WO2ECW7CVg/6B7QcXa9inqNR2SdgzdopTsr9kBCYFfqSvXju
	igID6g9O2mgIet02OBgfa7I7qZ8pfx2lK2b2l+fxhBAwHiEbUvwAwi0q1bezyHQAMIq
	XVBZ3r28nw==
Received: by mx.zohomail.com with SMTPS id 1769073810256448.23819699193325;
	Thu, 22 Jan 2026 01:23:30 -0800 (PST)
Message-ID: <0eb4b6ba8ef3b47cd28eb8d652b05eb5a6d1409c.camel@icenowy.me>
Subject: Re: [PATCH v5 3/9] drm: verisilicon: add a driver for Verisilicon
 display controllers
From: Icenowy Zheng <uwu@icenowy.me>
To: Thomas Zimmermann <tzimmermann@suse.de>, Andrzej Hajda
 <andrzej.hajda@intel.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
 Robert Foss <rfoss@kernel.org>, Laurent Pinchart
 <Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Rob
 Herring <robh@kernel.org>,  Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor
 Dooley <conor+dt@kernel.org>, Drew Fustini <fustini@kernel.org>, Guo Ren
 <guoren@kernel.org>, Fu Wei <wefu@redhat.com>
Cc: Philipp Zabel <p.zabel@pengutronix.de>, Dmitry Baryshkov
 <lumag@kernel.org>,  Michal Wilczynski <m.wilczynski@samsung.com>, Luca
 Ceresoli <luca.ceresoli@bootlin.com>, Han Gao <rabenda.cn@gmail.com>,  Yao
 Zi <ziyao@disroot.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,  devicetree@vger.kernel.org,
 linux-riscv@lists.infradead.org, Han Gao <gaohan@iscas.ac.cn>
Date: Thu, 22 Jan 2026 17:23:15 +0800
In-Reply-To: <56e1974c-0fe6-4bdb-918d-fcf6a8b866c1@suse.de>
References: <20260116043746.336328-1-zhengxingda@iscas.ac.cn>
	 <20260116043746.336328-4-zhengxingda@iscas.ac.cn>
	 <56e1974c-0fe6-4bdb-918d-fcf6a8b866c1@suse.de>
Organization: Anthon Open-Source Community
User-Agent: Evolution 3.44.4 
MIME-Version: 1.0
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260122_092410_221136_93BEE105 
X-CRM114-Status: GOOD (  18.79  )
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

5ZyoIDIwMjYtMDEtMjHmmJ/mnJ/kuInnmoQgMTM6NTYgKzAxMDDvvIxUaG9tYXMgWmltbWVybWFu
buWGmemBk++8mgoKPT09PT09PT09PT09PT09IDg8ID09PT09PT09PT09PT09PT09PT0KPiA+ICsK
PiA+ICvCoMKgwqDCoMKgwqDCoGRldl9pbmZvKGRldiwgIkRDJXggcmV2ICV4IGN1c3RvbWVyICV4
XG4iLCBkYy0KPiA+ID5pZGVudGl0eS5tb2RlbCwKPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqAgZGMtPmlkZW50aXR5LnJldmlzaW9uLCBkYy0+aWRlbnRpdHkuY3VzdG9tZXJfaWQp
Owo+IAo+IGRybV9kYmcoKS7CoCBEcml2ZXJzIHNob3VsZCBiZSBxdWl0ZSBieSBkZWZhdWx0LgoK
V2VsbCBmb3IgdGhpcyBraW5kIG9mIGlkZW50aWZpY2F0aW9uIGluZm9ybWF0aW9uIEkgdGhpbmsg
ZHJpdmVyIGlzCnVzdWFsbHkgbm90IHF1aWV0LCBhdCBsZWFzdCBhbWRncHUgKHdoZW4gZG9pbmcg
SVAgZGlzY292ZXJ5KSwgcGFuZnJvc3QKYW5kIGV0bmF2aXYgKHdoaWNoIHNoYXJlcyB0aGUgc2Ft
ZSBzZXQgb2YgaWRlbnRpZmljYXRpb24gcmVnaXN0ZXJzIHdpdGgKdGhpcyBkcml2ZXIpIGlzIHJl
cG9ydGluZyBpdC4KCj4gCj4gPiArCj4gPiArwqDCoMKgwqDCoMKgwqBpZiAocG9ydF9jb3VudCA+
IGRjLT5pZGVudGl0eS5kaXNwbGF5X2NvdW50KSB7Cj4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgZGV2X2VycihkZXYsICJ0b28gbWFueSBkb3duc3RyZWFtIHBvcnRzIHRoYW4gSFcK
PiA+IGNhcGFiaWxpdHlcbiIpOwo+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoHJl
dCA9IC1FSU5WQUw7Cj4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgZ290byBlcnJf
cnN0X2Fzc2VydDsKPiA+ICvCoMKgwqDCoMKgwqDCoH0KPiA+ICsKPT09PT09PT09PT09PT09IDg8
ID09PT09PT09PT09PT09PT09PT0KPiA+ICsKPiA+ICvCoMKgwqDCoMKgwqDCoGlmICghc3RhdGUt
PnZpc2libGUgfHwgIWZiKSB7Cj4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgcmVn
bWFwX3dyaXRlKGRjLT5yZWdzLCBWU0RDX0ZCX0NPTkZJRyhvdXRwdXQpLCAwKTsKPiA+ICvCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqByZWdtYXBfd3JpdGUoZGMtPnJlZ3MsIFZTRENfRkJf
Q09ORklHX0VYKG91dHB1dCksCj4gPiAwKTsKPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqBnb3RvIGNvbW1pdDsKPiA+ICvCoMKgwqDCoMKgwqDCoH0gZWxzZSB7Cj4gPiArwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgcmVnbWFwX3NldF9iaXRzKGRjLT5yZWdzLAo+ID4gVlNE
Q19GQl9DT05GSUdfRVgob3V0cHV0KSwKPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoFZTRENfRkJfQ09ORklHX0VYX0ZCX0VO
KTsKPiA+ICvCoMKgwqDCoMKgwqDCoH0KPiAKPiBTaW5jZSB5b3UgaGFuZGxlIHRoZSBwbGFuZSBv
bi9wbGFuZSBvZmYgY2FzZXMgaGVyZSwgSSdkIGFkdmlzZSB0byAKPiBpbXBsZW1lbnQgYXRvbWlj
X2VuYWJsZSBhbmQgYXRvbWljX2Rpc2FibGUgZm9yIHRoZSBwbGFuZSwgaWYgdGhlIAo+IGhhcmR3
YXJlIGFsbG93cyBpdC4gKFRoZXJlIGlzIGhhcmR3YXJlIHdlcmUgdGhlIGN1cnJlbnQgcGF0dGVy
biBtYWtlcwo+IHNlbnNlIHRob3VnaC4pCgpJZiBhdG9taWNfKmFibGUgaXMgZ29pbmcgdG8gYmUg
aW1wbGVtZW50ZWQsIHNob3VsZCBhdG9taWNfdXBkYXRlKCkga2VlcAp0aGUgcGxhbmUgb24vb2Zm
IGNvZGU/CgpCVFcgaXQgc2VlbXMgdGhhdCBEQzgyMDAgaGFzIHRoZSBzaGFkb3cgcmVnaXN0ZXIg
Y2FwYWJpbGl0eSB0aGF0IGNvdWxkCmJlIG1hbnVhbGx5IGNvbW1pdGVkIGJ1dCB0aGUgb2xkZXIg
REM4MDAwIGhhcyBubyAodGhlClZTRENfRkJfQ09ORklHX0VYX0NPTU1JVCBiaXQgd3JpdHRlbiBi
ZWxvdyBpcyBhIG5ldyB0aGluZykgLS0gdGhlClZTRENfRkJfQ09ORklHIHJlZ2lzdGVyIG9uIERD
ODAwMCBoYXMgYSB3cml0ZS1vbmx5IGJpdCB0aGF0IHdoZW4Kd3JpdHRlbiB3aXRoIDAgdGhlIGRp
c3BsYXkgaXMgcHV0IHRvIHJlc2V0IGFuZCB3aGVuIHdyaXR0ZW4gd2l0aCAxIHRoZQpkaXNwbGF5
IHdpbGwgc3RhcnQgdG8gcnVuLiBUaGlzIHBhdHRlcm4gc2VlbXMgdG8gYmUgbm90IGFibGUgdG8g
a2VlcAp0aGUgZW5hYmxlZCBzdGF0ZSB3aGlsZSBwcm9ncmFtbWluZyAoYXQgbGVhc3QgcGFydCBv
ZikgbmV3IHBsYW5lCmNvbmZpZ3VyYXRpb24sIHNlZSBbMV0uCgpbMV0KaHR0cHM6Ly9naXRodWIu
Y29tL21pbGt2LW1lZ3Jlei9yb2Nrb3MtdS1ib290L2Jsb2IvYzkyMjFjZjJmYTc3ZDM5YzBiMjQx
YWI0YjAzMGM3MDhlN2ViZTI3OS9kcml2ZXJzL3ZpZGVvL2Vzd2luL2Vzd2luX2RjX3JlZy5oI0wz
NTc5Cgo+IAo+ID4gKwo+ID4gK8KgwqDCoMKgwqDCoMKgZHJtX2Zvcm1hdF90b192c19mb3JtYXQo
c3RhdGUtPmZiLT5mb3JtYXQtPmZvcm1hdCwgJmZtdCk7Cj4gPiArCj4gPiArwqDCoMKgwqDCoMKg
wqByZWdtYXBfdXBkYXRlX2JpdHMoZGMtPnJlZ3MsIFZTRENfRkJfQ09ORklHKG91dHB1dCksCj4g
PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgVlNE
Q19GQl9DT05GSUdfRk1UX01BU0ssCj4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqAgVlNEQ19GQl9DT05GSUdfRk1UKGZtdC5jb2xvcikpOwo+ID4g
K8KgwqDCoMKgwqDCoMKgcmVnbWFwX3VwZGF0ZV9iaXRzKGRjLT5yZWdzLCBWU0RDX0ZCX0NPTkZJ
RyhvdXRwdXQpLAo+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgIFZTRENfRkJfQ09ORklHX1NXSVpaTEVfTUFTSywKPiA+ICvCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBWU0RDX0ZCX0NPTkZJR19TV0la
WkxFKGZtdC5zd2l6emxlKSk7Cj4gPiArwqDCoMKgwqDCoMKgwqByZWdtYXBfYXNzaWduX2JpdHMo
ZGMtPnJlZ3MsIFZTRENfRkJfQ09ORklHKG91dHB1dCksCj4gPiArwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgVlNEQ19GQl9DT05GSUdfVVZfU1dJWlpM
RV9FTiwKPiA+IGZtdC51dl9zd2l6emxlKTsKPiA+ICsKPiA+ICvCoMKgwqDCoMKgwqDCoC8qIEdl
dCB0aGUgcGh5c2ljYWwgYWRkcmVzcyBvZiB0aGUgYnVmZmVyIGluIG1lbW9yeSAqLwo+ID4gK8Kg
wqDCoMKgwqDCoMKgZ2VtID0gZHJtX2ZiX2RtYV9nZXRfZ2VtX29iaihmYiwgMCk7Cj4gPiArCj4g
PiArwqDCoMKgwqDCoMKgwqAvKiBDb21wdXRlIHRoZSBzdGFydCBvZiB0aGUgZGlzcGxheWVkIG1l
bW9yeSAqLwo+ID4gK8KgwqDCoMKgwqDCoMKgYnBwID0gZmItPmZvcm1hdC0+Y3BwWzBdOwo+ID4g
K8KgwqDCoMKgwqDCoMKgZG1hX2FkZHIgPSBnZW0tPmRtYV9hZGRyICsgZmItPm9mZnNldHNbMF07
Cj4gPiArCj4gPiArwqDCoMKgwqDCoMKgwqAvKiBGaXh1cCBmcmFtZWJ1ZmZlciBhZGRyZXNzIGZv
ciBzcmMgY29vcmRpbmF0ZXMgKi8KPiA+ICvCoMKgwqDCoMKgwqDCoGRtYV9hZGRyICs9IChzdGF0
ZS0+c3JjLngxID4+IDE2KSAqIGJwcDsKPiAKPiBicHAgaXMgZGVwcmVjYXRlZCBhbmQgc2hvdWxk
IGJlIGF2b2lkZWQgaW4gbmV3IGNvZGUuIFlvdSBjYW4gY29tcHV0ZQo+IHRoZSAKPiBvZmZzZXQg
d2l0aCBkcm1fZm9ybWF0X21pbl9waXRjaCgpOgo+IAo+IGRybV9mb3JtYXRfbWluX3BpdGNoKGZi
LT5mb3JtYXQsIDAsIHN0YXRlLT5zcmMueDEgPj4gMTYgKQo+IAo+IEJlc3QgcmVnYXJkcwo+IFRo
b21hcwo+IAo+ID4gK8KgwqDCoMKgwqDCoMKgZG1hX2FkZHIgKz0gKHN0YXRlLT5zcmMueTEgPj4g
MTYpICogZmItPnBpdGNoZXNbMF07Cj4gPiArCj4gPiArwqDCoMKgwqDCoMKgwqByZWdtYXBfd3Jp
dGUoZGMtPnJlZ3MsIFZTRENfRkJfQUREUkVTUyhvdXRwdXQpLAo+ID4gK8KgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGxvd2VyXzMyX2JpdHMoZG1hX2FkZHIpKTsKPiA+ICvC
oMKgwqDCoMKgwqDCoHJlZ21hcF93cml0ZShkYy0+cmVncywgVlNEQ19GQl9TVFJJREUob3V0cHV0
KSwKPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBmYi0+cGl0Y2hl
c1swXSk7Cj4gPiArCj4gPiArwqDCoMKgwqDCoMKgwqByZWdtYXBfd3JpdGUoZGMtPnJlZ3MsIFZT
RENfRkJfVE9QX0xFRlQob3V0cHV0KSwKPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoCBWU0RDX01BS0VfUExBTkVfUE9TKHN0YXRlLT5jcnRjX3gsIHN0YXRlLQo+ID4g
PmNydGNfeSkpOwo+ID4gK8KgwqDCoMKgwqDCoMKgcmVnbWFwX3dyaXRlKGRjLT5yZWdzLCBWU0RD
X0ZCX0JPVFRPTV9SSUdIVChvdXRwdXQpLAo+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgIFZTRENfTUFLRV9QTEFORV9QT1Moc3RhdGUtPmNydGNfeCArIHN0YXRlLQo+
ID4gPmNydGNfdywKPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgc3RhdGUtPmNydGNfeSArIHN0
YXRlLQo+ID4gPmNydGNfaCkpOwo+ID4gK8KgwqDCoMKgwqDCoMKgcmVnbWFwX3dyaXRlKGRjLT5y
ZWdzLCBWU0RDX0ZCX1NJWkUob3V0cHV0KSwKPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoCBWU0RDX01BS0VfUExBTkVfU0laRShzdGF0ZS0+Y3J0Y193LCBzdGF0ZS0K
PiA+ID5jcnRjX2gpKTsKPiA+ICsKPiA+ICvCoMKgwqDCoMKgwqDCoHJlZ21hcF93cml0ZShkYy0+
cmVncywgVlNEQ19GQl9CTEVORF9DT05GSUcob3V0cHV0KSwKPiA+ICvCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBWU0RDX0ZCX0JMRU5EX0NPTkZJR19CTEVORF9ESVNBQkxF
KTsKPiA+ICtjb21taXQ6Cj4gPiArwqDCoMKgwqDCoMKgwqByZWdtYXBfc2V0X2JpdHMoZGMtPnJl
Z3MsIFZTRENfRkJfQ09ORklHX0VYKG91dHB1dCksCj4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoFZTRENfRkJfQ09ORklHX0VYX0NPTU1JVCk7Cj4gPiAr
fQo+ID4gKwo9PT09PT09PT09PT09PT0gODwgPT09PT09PT09PT09PT09PT09PQpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5n
IGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFk
ZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
