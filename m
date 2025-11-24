Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76901CFD313
	for <linux-riscv@archiver.kernel.org>; Mon, 24 Nov 2025 15:25:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=D7OAl+hXDOE9DUGM2fJBITFft3OtfOHLjZD5y+VUN+0=; b=n/gze4zpycHPlv
	xx4hLgXJ1W8iNftqNcGvqV7C9OtejFhMqbsO8yCikZ1zuK0rGUE9Kt4u2asYFe8wYtNjxw4oplBZM
	XDdjz9wFgzZo05sjISYKC05CWCPhU0hr9/7sh9GIdV1wnZwRUu0giqJV33d9lDgE5BKkq7HDc0F2D
	yD17gOrXW6cOsurbkD0WpbsmaWXEv9n1zJT/rbkBGBUIHiqOn/i6nVZ8pMJysCkBxz+ISqEuWVQ35
	fKoSWX2ZB3E16jKIodzYc1aABwkjbhWZBSsiDPPLtxqe7jKJplZP5+Ql/BDe/qnIb2KonedIfQwW+
	j0OSstYNtM/R6Eq8eI+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNYRl-0000000BuxM-0sLi;
	Mon, 24 Nov 2025 15:25:45 +0000
Received: from sender3-op-o15.zoho.com ([136.143.184.15])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNYRi-0000000Buwj-2qvS
	for linux-riscv@lists.infradead.org;
	Mon, 24 Nov 2025 15:25:43 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1763997913; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=BoF2M2Wfa7fxNa63L6l9fuhGh1RijOFFOpjze+41b9gBdOXbUqdNRe3fYKzpJ93fkR8++ODjptwR7Z6gYPHqdpzTLjOYXjUL8dFIqf9dxjTwJrds0yU8tY8+ks2G2kx+1f3E/o6B5GpvpLmGnZ6YE0zkFX3VOA0KZz/KsVpi4rM=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1763997913; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=Gw82Jscaoqj86UtCGprjhdJTu0e3qFarxjApT64NFMQ=; 
	b=cu2ByMmuL1BTth2U3NDPfpdmmNZZJWfuCoOmAOXFOEalZTO34kpdn1havFGg1R+vhVBrhJhSE6DTFiqf/TNnses5dbt0fqGsjqrsMO2QuRj46Lfr/STdl2CrgMoBlEhENazylWhlaMCsfi8JLomSJO5gUMTPeX5RzpOWRKES3Jw=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=icenowy.me;
	spf=pass  smtp.mailfrom=uwu@icenowy.me;
	dmarc=pass header.from=<uwu@icenowy.me>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1763997913;
	s=zmail2; d=icenowy.me; i=uwu@icenowy.me;
	h=Message-ID:Subject:Subject:From:From:To:To:Cc:Cc:Date:Date:In-Reply-To:References:Content-Type:Content-Transfer-Encoding:MIME-Version:Message-Id:Reply-To;
	bh=Gw82Jscaoqj86UtCGprjhdJTu0e3qFarxjApT64NFMQ=;
	b=NMf41nulIwDiqe3dOLpz3Jfnns6W8DywDTAnyge+2CBYirl3ZrEosLzHfe1uTJ6/
	cvthR8xGtCu5zWq7nfvm7QctByVFVLISgQfPVdJ2xYi/jypg4rMsimYVgbas6Q2wl48
	6YwwxVpTWq9K8Ao9gI0eozJP6HCAA0GwzIqvv/1Griv0NkY2XouQMAi10ESmllTfytd
	xCnJQ6SvvA6lrjoJmXrxQh/jP1ICwE/nTMgjyQQ6h1h7HD21OJSIYScDGP/ivL4wK3x
	7pPUzBDTwrVgbdU89NNU6BrHehlhj+nVjPSWm9qWuDwXCMcPTm3OqWV/OY0R3UvYR6U
	JBs8bVczfA==
Received: by mx.zohomail.com with SMTPS id 1763997911169406.72711179768885;
	Mon, 24 Nov 2025 07:25:11 -0800 (PST)
Message-ID: <a8089e458bdf6fbad45cd6be838b4cf75396918f.camel@icenowy.me>
Subject: Re: [PATCH v3 2/9] dt-bindings: display: add verisilicon,dc
From: Icenowy Zheng <uwu@icenowy.me>
To: Krzysztof Kozlowski <krzk@kernel.org>, Conor Dooley <conor@kernel.org>
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
Date: Mon, 24 Nov 2025 23:25:01 +0800
In-Reply-To: <390caea1-bc75-4cde-bd6d-9bc15a12f32d@kernel.org>
References: <20251124105226.2860845-1-uwu@icenowy.me>
	 <20251124105226.2860845-3-uwu@icenowy.me>
	 <d4cfe8bb-5ca2-40a9-bfe0-96e7ded5586c@kernel.org>
	 <f7bbb57180866a0674fc1d72d4bd3279c7b1c1e9.camel@icenowy.me>
	 <c26dabfb-c4af-428b-a1d4-d626f37ff559@kernel.org>
	 <f944f0b28f62233b1874e0f00c0a130d71845417.camel@icenowy.me>
	 <6ceb41bc-0597-4ea5-84be-51f53e3bc2d8@kernel.org>
	 <20251124-said-overvalue-8a8f49d6c99d@spud>
	 <477bbcbe-17d9-40ae-be10-be4fd107687e@kernel.org>
	 <20251124-pulp-pound-a2b6d749dcfc@spud>
	 <390caea1-bc75-4cde-bd6d-9bc15a12f32d@kernel.org>
Organization: Anthon Open-Source Community
User-Agent: Evolution 3.44.4 
MIME-Version: 1.0
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251124_072542_801060_AF327BB9 
X-CRM114-Status: GOOD (  19.54  )
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

5ZyoIDIwMjUtMTEtMjTmmJ/mnJ/kuIDnmoQgMTM6MzEgKzAxMDDvvIxLcnp5c3p0b2YgS296bG93
c2tp5YaZ6YGT77yaCj4gT24gMjQvMTEvMjAyNSAxMzoyMCwgQ29ub3IgRG9vbGV5IHdyb3RlOgo+
ID4gT24gTW9uLCBOb3YgMjQsIDIwMjUgYXQgMDE6MDg6MDBQTSArMDEwMCwgS3J6eXN6dG9mIEtv
emxvd3NraQo+ID4gd3JvdGU6Cj4gPiA+IE9uIDI0LzExLzIwMjUgMTM6MDUsIENvbm9yIERvb2xl
eSB3cm90ZToKPiA+ID4gPiAKPiA+ID4gPiBJIGRvbid0IHJlYWxseSBnZXQgd2hhdCB0aGUgZnVz
cyBpcyB3aXRoIHRoZSBkdWFsIHNpZ25vZmYsCj4gPiA+ID4gd2hhdCdzIHRoZQo+ID4gPiA+IHBv
aW50IGhhdmluZyBib3RoIHdoZW4gdGhleSByZXByZXNlbnQgdGhlIHNhbWUgcGVyc29uPyBQcmV0
dHkKPiA+ID4gPiBzdXJlIGl0Cj4gPiA+ID4gd2FzIHlvdSAoS3J6eXN6dG9mKSBhbmQgQXJuZCB0
aGF0IHRvbGQgbWUgbm90IHRvIGJvdGggZG9pbmcgdGhlCj4gPiA+ID4gZG91YmxlCj4gPiA+ID4g
c2lnbm9mZi4KPiA+ID4gCj4gPiA+IEkgZG8gbm90IG9iamVjdCBoYXZpbmcgb3Igbm90IGhhdmlu
ZyBkdWFsIHNpZ25lZCBvZmYgSEVSRS4KPiA+ID4gCj4gPiA+IEkgbmV2ZXIgc2FpZCB0aGF0LiBK
dXN0IGxpa2UgSSBuZXZlciBzYWlkICJGcm9tIiBoYXMgdG8gYmUKPiA+ID4gY2hhbmdlZC4KPiA+
IAo+ID4gSSBkaWRuJ3Qgc2F5IHlvdSBvYmplY3RlZCB0byBib3RoIGJlaW5nIHRoZXJlLiAqSSog
YW0gc2F5aW5nIHRoYXQKPiA+IGl0IGlzCj4gCj4gQWgsIHN1cmUuIFllcywgaWYgYm90aCBpZGVu
dGl0aWVzIHdvcmsgSSB3b3VsZCBwcm9wb3NlIHRvIHNraXAgc2Vjb25kCj4gU29CLiBCdXQgSSBh
bHNvIHN0b3BwZWQgb2JqZWN0aW5nIG9mIGhhdmluZyB0d28gaWRlbnRpdGllcyBsaXN0ZWQsIGFz
Cj4gbG9uZyBhcyB0aGV5IGFyZSBjb3JyZWN0LgoKV2VsbCBpdCdzIHVuZm9ydHVuYXRlIHRoYXQg
c29tZSBwb2xpY3kgbm93IHJlcXVpcmVzIG1lIHRvIGxpc3QgdGhlCnNlY29uZCBpZGVudGl0eS4K
ClNob3VsZCBJIHJlc2VuZCB0aGUgd2hvbGUgcGF0Y2hzZXQgd2l0aCB0aGUgSVNDQVMgbWFpbD8K
CihUaGUgcHJvYmxlbSB3aXRoIGl0IGlzIHRoYXQgaXQgZm9yY2VzIGFwcGxpY2F0aW9uLXNwZWNp
ZmljIHBhc3N3b3JkLAphbmQgd2l0aCBnaXQtc2VuZC1lbWFpbCBsYWNraW5nIGEgcHJvcGVyIGtl
eSBzdG9yZSwgdGhpcyBtYWtlcyB0aGUKcGFzc3dvcmQgYSBvbmUtdGltZSBvbmUuKQoKPiAKPiA+
IHByb2JhYmx5IG5vdCB3b3J0aCBkb2luZy4gVGhhdCdzIGVzcGVjaWFsbHkgdGhlIGNhc2Ugd2hl
biBpdCBpcwo+ID4gYWRkaW5nCj4gPiBjb21wbGljYXRpb24gYWJvdXQgY29ycmVjdCBvcmRlcmlu
ZyBvZiBzaWdub2ZmcyBhbmQgbWF5YmUKPiA+IGludGVyYWN0aW5nIHdpdGgKPiA+IGhvdyBnaXQt
c2VuZC1lbWFpbCBkZWNpZGVzIHRvIGluc2VydCBGcm9tOiBmaWVsZHMuCj4gPiAKPiAKPiAKPiAK
PiBCZXN0IHJlZ2FyZHMsCj4gS3J6eXN6dG9mCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2
QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9saW51eC1yaXNjdgo=
