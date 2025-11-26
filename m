Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3F61D10397
	for <linux-riscv@archiver.kernel.org>; Wed, 26 Nov 2025 08:58:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=k4NQNVDoG8bfgGwZmvYtTeECYri4gSgQywUVCAprPFI=; b=1T91SVURJf6ass
	6/usU2/vJWDUSg2iKsXxln3m0enT0P4Ses9O/CMTyB3xiawT7mpEOZCVqoI7Y+M4rnx5tsB1Kwimn
	ilA6RPUB+Lfzrs3OMtOlbuEztWvQcSea4CPRjWfy8O1baauXGYigFFAo8wSTG5bqM8o1966LNTCif
	iNwcLpVIID6y8TZDdgRLmFKFD+ruZ8BWWf5iWEknE5k24ftvj0m/HzPjWFO6krgCyw9z8Q//wimXd
	uTQGtQNOt2nrYjPDKjAL6GKqcU5XhHstg5VrYgmzBmSvKwDUX49AHD4RqS3brsOC/IDVr3LAGMhUT
	d43zsaUUMR4Nh4CP6z7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOBLX-0000000Eeqd-25Si;
	Wed, 26 Nov 2025 08:57:55 +0000
Received: from sender3-op-o12.zoho.com ([136.143.184.12])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOBLU-0000000EepP-1TaY
	for linux-riscv@lists.infradead.org;
	Wed, 26 Nov 2025 08:57:53 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1764147438; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=JcI9g0P8uUthq8kwFB86RLLnZ2Vl0mmgpzPBdPOtxjuqutgFgmREVT3G8qkwHkL6vC/DYxpO+fK1EFSBkpAtZ2dHPxsfUvpmOBYETUZzT99NI3lba6wmsErp2hDmCQko6DMpsgKhG7oZSDIOppRqu3J5Ya2gorBedgwOIEZVJVw=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1764147438; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=vjRZmnhqtqpfKrBi5Q+r59FbrMRkIRC2v3OLJ/v0sWc=; 
	b=PV/A6MLuzpM2oGtL6xt7ONONRY4/AsZSUWPqaKjdOsta0I6Ra3bmSVxMxU06L7NIO45N+5JmBNGVdg/oi86XtLl4kzLqGk35Yi8IBsY3Qjl6mwx7Tw7BX4YOKZUnbFaxzbf/76YAoguAPAdaDG0QPf47bExD0L53eqq1uSflSBc=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=icenowy.me;
	spf=pass  smtp.mailfrom=uwu@icenowy.me;
	dmarc=pass header.from=<uwu@icenowy.me>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1764147438;
	s=zmail2; d=icenowy.me; i=uwu@icenowy.me;
	h=Message-ID:Subject:Subject:From:From:To:To:Cc:Cc:Date:Date:In-Reply-To:References:Content-Type:Content-Transfer-Encoding:MIME-Version:Message-Id:Reply-To;
	bh=vjRZmnhqtqpfKrBi5Q+r59FbrMRkIRC2v3OLJ/v0sWc=;
	b=B4dNaGewZpT048lvXVnnDC+SyFZsl9cky/QgG8UJw5tsblBoeIFRpxJCUnAtUQ93
	cvb6exVJXXpoGv7DG/IF2L35XfLEF05j+VPdbgApEnt+AZhhrvj1aaNj7Zh4fiUKoJN
	5NgoDKN8QXKd8AtHWoJRYXleMiR0amZTDqOqSSxFgLXJH0Q8+QRzvrqA0V3Ns4tIm1r
	khBRadtUsCaDdIuN0wnPYIfesA5C5BpPvYuk3ZY+IYq7h1dsQFgM8QRurgago8RutQS
	fwVwIg6FzbmtH5gkBeij7BKdZ9xeOglK5cYQzWJ19Ay3U3O0bHqz7qZ3Nm8g2QnSuaf
	3yx/IDR08A==
Received: by mx.zohomail.com with SMTPS id 1764147434759601.659033320605;
	Wed, 26 Nov 2025 00:57:14 -0800 (PST)
Message-ID: <e2b72b8ef4c2911c4ea44a80f42182bbc78d5626.camel@icenowy.me>
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
Date: Wed, 26 Nov 2025 16:57:04 +0800
In-Reply-To: <20251126-gifted-zircon-ibex-a9f1d8@kuoka>
References: <20251126045233.218286-1-zhengxingda@iscas.ac.cn>
	 <20251126045233.218286-3-zhengxingda@iscas.ac.cn>
	 <20251126-gifted-zircon-ibex-a9f1d8@kuoka>
Organization: Anthon Open-Source Community
User-Agent: Evolution 3.44.4 
MIME-Version: 1.0
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251126_005752_474939_1FFAF33C 
X-CRM114-Status: GOOD (  15.11  )
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

5ZyoIDIwMjUtMTEtMjbmmJ/mnJ/kuInnmoQgMDk6NTEgKzAxMDDvvIxLcnp5c3p0b2YgS296bG93
c2tp5YaZ6YGT77yaCj4gT24gV2VkLCBOb3YgMjYsIDIwMjUgYXQgMTI6NTI6MjZQTSArMDgwMCwg
SWNlbm93eSBaaGVuZyB3cm90ZToKPiA+IEZyb206IEljZW5vd3kgWmhlbmcgPHV3dUBpY2Vub3d5
Lm1lPgo+ID4gCj4gPiBWZXJpc2lsaWNvbiBoYXMgYSBzZXJpZXMgb2YgZGlzcGxheSBjb250cm9s
bGVycyBwcmVmaXhlZCB3aXRoIERDCj4gPiBhbmQKPiA+IHdpdGggc2VsZi1pZGVudGlmaWNhdGlv
biBmYWNpbGl0eSBsaWtlIHRoZWlyIEdDIHNlcmllcyBHUFVzLgo+ID4gCj4gPiBBZGQgYSBkZXZp
Y2UgdHJlZSBiaW5kaW5nIGZvciBpdC4KPiA+IAo+ID4gRGVwZW5kcyBvbiB0aGUgc3BlY2lmaWMg
REMgbW9kZWwsIGl0IGNhbiBoYXZlIGVpdGhlciBvbmUgb3IgdHdvCj4gPiBkaXNwbGF5Cj4gPiBv
dXRwdXRzLCBhbmQgZWFjaCBkaXNwbGF5IG91dHB1dCBjb3VsZCBiZSBzZXQgdG8gRFBJIHNpZ25h
bCBvciAiRFAiCj4gPiBzaWduYWwgKHdoaWNoIHNlZW1zIHRvIGJlIHNvbWUgcGxhaW4gcGFyYWxs
ZWwgYnVzIHRvIEhETUkKPiA+IGNvbnRyb2xsZXJzKS4KPiA+IAo+ID4gU2lnbmVkLW9mZi1ieTog
SWNlbm93eSBaaGVuZyA8dXd1QGljZW5vd3kubWU+Cj4gPiBTaWduZWQtb2ZmLWJ5OiBJY2Vub3d5
IFpoZW5nIDx6aGVuZ3hpbmdkYUBpc2Nhcy5hYy5jbj4KPiA+IC0tLQo+IAo+IFlvdSBhbHJlYWR5
IHJlY2VpdmVkIHJldmlldyBvbiB0aGlzLiBEb24ndCBzZW5kIHRoZSBzYW1lLiBSZWFkIHRoZQo+
IHJldmlldy4KClBsZWFzZSBzZWUgdGhlIHNlbmRlciAobWFpbCBoZWFkZXIgRnJvbSkgb2YgdGhp
cyB0aW1lLgoKPiAKPiBOQUsKPiAKPiBCZXN0IHJlZ2FyZHMsCj4gS3J6eXN6dG9mCj4gCgoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3Yg
bWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3Rz
LmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
