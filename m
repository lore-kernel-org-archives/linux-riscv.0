Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACD15D10397
	for <linux-riscv@archiver.kernel.org>; Wed, 26 Nov 2025 09:42:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=foEfKj2FhOdih4mldpUro8gI6Oy52kR3pq/ksa2ek2o=; b=xktL6PR7mSBIHF
	ijzpQeVsTI8n09RKouMCXO0CVtreafWSEPFDPZ1VFI4jy7w2LLIvUIQbh13F5HCJ7f9RUBlbgtHPb
	W0qbU0ga3J8NsV7rcWXmMcfZAskbrU79UJJSdOjlWN0r6d54ARSna2EUOb2WUckWsu3YhM/oZE5FE
	D93pga/3JFIQcl1Nqp+B3/QOhIyBQa8DJBvt9adChY57yQEwjZAmGJN3J7qPqkgkDWjquHV/zGDzj
	m5OsZHgUOB49hj9MLzEC3/3afXx/QUrPvcXCpYEgarZyffwaM3nmsqBbb9ZvU5H1aqFJ908tRe5hX
	MZLZQxuBn8PI5yxuhXBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOC2V-0000000EjJJ-380z;
	Wed, 26 Nov 2025 09:42:19 +0000
Received: from sender3-op-o12.zoho.com ([136.143.184.12])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOC2T-0000000EjIu-1arW
	for linux-riscv@lists.infradead.org;
	Wed, 26 Nov 2025 09:42:19 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1764150109; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=fQBxAXM9o4uD7mKSWOWobL1/ZdnY+XQbfKv1vZ6rTRPzjKDaHeZrpkSXPAta7rI9UYfGQfYaiHGcm4zZzsrJUbe/YSv/5/XIoWELyYGcOmBNRhNSlBMXdzGVs7ID9Fwlm/Gmk670rXZs1jAA7w8NAEfUsWFf7lN/oVTsDlYTkQA=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1764150109; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=HCrXWcCJcuxzIq0iHhld0Os9jJmomNGWdXQFSCiiukQ=; 
	b=Qu4Gvhj4dSxRhdg16XEqh7T7j0fa2PB0tz1AJgQr0Iwk/5pTheiSzmGdIPnfuafXccBrNls+KYdd/rq9EEY9loOUdD0EjMZ2Wn/WsNTvAcWu4KSMbuUrxu2rveia68Kyf5hRFWjIkSv3iI5CIHtssCyjxAhq7TLoQrIS6Xtf/lg=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=icenowy.me;
	spf=pass  smtp.mailfrom=uwu@icenowy.me;
	dmarc=pass header.from=<uwu@icenowy.me>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1764150109;
	s=zmail2; d=icenowy.me; i=uwu@icenowy.me;
	h=Message-ID:Subject:Subject:From:From:To:To:Cc:Cc:Date:Date:In-Reply-To:References:Content-Type:Content-Transfer-Encoding:MIME-Version:Message-Id:Reply-To;
	bh=HCrXWcCJcuxzIq0iHhld0Os9jJmomNGWdXQFSCiiukQ=;
	b=GuoOtMI51ArFwAwWNXFwtknkxYHunWqeynp9ETTHYp93VhUqA9PlnMkRwE+ZPI70
	Jqj886oyv3UKkPNNm+Bdd+QUpH152ZDSKh1X4CVwc0RY/gSkMb7JgkMcniXFlTjPETi
	miDWY/w0OktfRSomKQBXXwS0vv/NRpMETejhKD7ZbNFaCr+j/J6ROTSEoZ61vvXVZ5O
	yuDeCAQhkg5E0spxe0MSeK27T+pRSRGgqIs4bJIvv9EhFlrwEQfZIOof7ji/eMGJQXW
	c4j7Zpwu9UH6htZENs6EeD6v/lcKR+6w/5yeHVt5xHOP7By+Fmz+T0+vOLH5CwZ6dMB
	1w86gnl0JA==
Received: by mx.zohomail.com with SMTPS id 1764150105282785.1586241129531;
	Wed, 26 Nov 2025 01:41:45 -0800 (PST)
Message-ID: <001154b743b9f8364e96b3ebf791ef9920bbfa03.camel@icenowy.me>
Subject: Re: [PATCH RESEND v3 2/9] dt-bindings: display: add verisilicon,dc
From: Icenowy Zheng <uwu@icenowy.me>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Drew Fustini <fustini@kernel.org>, Guo Ren
 <guoren@kernel.org>, Fu Wei <wefu@redhat.com>, Philipp Zabel
 <p.zabel@pengutronix.de>, Heiko Stuebner <heiko@sntech.de>, Andrzej Hajda
 <andrzej.hajda@intel.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
 Robert Foss <rfoss@kernel.org>, Laurent Pinchart
 <Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Michal Wilczynski
 <m.wilczynski@samsung.com>, Han Gao <rabenda.cn@gmail.com>, Yao Zi
 <ziyao@disroot.org>, dri-devel@lists.freedesktop.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-riscv@lists.infradead.org
Date: Wed, 26 Nov 2025 17:41:35 +0800
In-Reply-To: <b57207ab-a69e-4dad-98ca-f4923cebdf81@kernel.org>
References: <20251126045233.218286-1-zhengxingda@iscas.ac.cn>
	 <20251126045233.218286-3-zhengxingda@iscas.ac.cn>
	 <20251126-gifted-zircon-ibex-a9f1d8@kuoka>
	 <e2b72b8ef4c2911c4ea44a80f42182bbc78d5626.camel@icenowy.me>
	 <b57207ab-a69e-4dad-98ca-f4923cebdf81@kernel.org>
Organization: Anthon Open-Source Community
User-Agent: Evolution 3.44.4 
MIME-Version: 1.0
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251126_014217_615332_42D6A9DB 
X-CRM114-Status: GOOD (  19.52  )
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

5ZyoIDIwMjUtMTEtMjbmmJ/mnJ/kuInnmoQgMTA6MzcgKzAxMDDvvIxLcnp5c3p0b2YgS296bG93
c2tp5YaZ6YGT77yaCj4gT24gMjYvMTEvMjAyNSAwOTo1NywgSWNlbm93eSBaaGVuZyB3cm90ZToK
PiA+IOWcqCAyMDI1LTExLTI25pif5pyf5LiJ55qEIDA5OjUxICswMTAw77yMS3J6eXN6dG9mIEtv
emxvd3NraeWGmemBk++8mgo+ID4gPiBPbiBXZWQsIE5vdiAyNiwgMjAyNSBhdCAxMjo1MjoyNlBN
ICswODAwLCBJY2Vub3d5IFpoZW5nIHdyb3RlOgo+ID4gPiA+IEZyb206IEljZW5vd3kgWmhlbmcg
PHV3dUBpY2Vub3d5Lm1lPgo+ID4gPiA+IAo+ID4gPiA+IFZlcmlzaWxpY29uIGhhcyBhIHNlcmll
cyBvZiBkaXNwbGF5IGNvbnRyb2xsZXJzIHByZWZpeGVkIHdpdGgKPiA+ID4gPiBEQwo+ID4gPiA+
IGFuZAo+ID4gPiA+IHdpdGggc2VsZi1pZGVudGlmaWNhdGlvbiBmYWNpbGl0eSBsaWtlIHRoZWly
IEdDIHNlcmllcyBHUFVzLgo+ID4gPiA+IAo+ID4gPiA+IEFkZCBhIGRldmljZSB0cmVlIGJpbmRp
bmcgZm9yIGl0Lgo+ID4gPiA+IAo+ID4gPiA+IERlcGVuZHMgb24gdGhlIHNwZWNpZmljIERDIG1v
ZGVsLCBpdCBjYW4gaGF2ZSBlaXRoZXIgb25lIG9yIHR3bwo+ID4gPiA+IGRpc3BsYXkKPiA+ID4g
PiBvdXRwdXRzLCBhbmQgZWFjaCBkaXNwbGF5IG91dHB1dCBjb3VsZCBiZSBzZXQgdG8gRFBJIHNp
Z25hbCBvcgo+ID4gPiA+ICJEUCIKPiA+ID4gPiBzaWduYWwgKHdoaWNoIHNlZW1zIHRvIGJlIHNv
bWUgcGxhaW4gcGFyYWxsZWwgYnVzIHRvIEhETUkKPiA+ID4gPiBjb250cm9sbGVycykuCj4gPiA+
ID4gCj4gPiA+ID4gU2lnbmVkLW9mZi1ieTogSWNlbm93eSBaaGVuZyA8dXd1QGljZW5vd3kubWU+
Cj4gPiA+ID4gU2lnbmVkLW9mZi1ieTogSWNlbm93eSBaaGVuZyA8emhlbmd4aW5nZGFAaXNjYXMu
YWMuY24+Cj4gPiA+ID4gLS0tCj4gPiA+IAo+ID4gPiBZb3UgYWxyZWFkeSByZWNlaXZlZCByZXZp
ZXcgb24gdGhpcy4gRG9uJ3Qgc2VuZCB0aGUgc2FtZS4gUmVhZAo+ID4gPiB0aGUKPiA+ID4gcmV2
aWV3Lgo+ID4gCj4gPiBQbGVhc2Ugc2VlIHRoZSBzZW5kZXIgKG1haWwgaGVhZGVyIEZyb20pIG9m
IHRoaXMgdGltZS4KPiAKPiBUaGlzIGltcHJvdmVkLiBJIGFtIHNwZWFraW5nIGFib3V0IHRoZSBy
ZXN0IG9mIHJldmlldy4KCldlbGwgdGhpcyBpcyB3aHkgdGhpcyBpcyBhIHYzIHJlc2VuZCwgbm90
IHY0LgoKSSB3aWxsIGFkZHJlc3MgdGhlc2UgaXNzdWVzIGluIHY0LgoKPiAKPiBCZXN0IHJlZ2Fy
ZHMsCj4gS3J6eXN6dG9mCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJh
ZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51
eC1yaXNjdgo=
