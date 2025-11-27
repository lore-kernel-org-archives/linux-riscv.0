Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 872D2D11183
	for <linux-riscv@archiver.kernel.org>; Thu, 27 Nov 2025 13:48:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RYfIy+zGtKCW5J0NWlU48vn2dPRpsg4Xj/nSCsXbc/w=; b=Qtv+iBIbHoRATg
	VMINMWd4tDyTGTi22ne9gofJLblVksQA44RrKnHMecER7aGoiGPbpw/XkHvpU9bm5v/JkRJ79jhlA
	ZUIU1905vzQrTePRXqyRdEumnBwFocAKx5is8xaDKEH+d0ifqLsFm08eOnIuIjNxQ0yHaNGG61WMw
	fYJ3m00ovFLfU5xg6lwK3vzDJUNL5Xzyy4jt/6h+YrxvXAWIBqabxhG3f91tT6nR83RkffX0caP1E
	HUPOQA0vXakUrWGgraCFvnWLXwcXxdVLdh/LZ/EnQpMCPlQInE5TnywkxMPamJDCGzHWtwpdxMxG5
	Q10wD+BONabj2KsuDFgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOcLz-0000000GiEr-1IVa;
	Thu, 27 Nov 2025 13:48:11 +0000
Received: from sender3-op-o12.zoho.com ([136.143.184.12])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOcLw-0000000GiEI-1d1I
	for linux-riscv@lists.infradead.org;
	Thu, 27 Nov 2025 13:48:09 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1764251255; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=AMwSHeQ/vxT8K1YbNvYUSgylTjKlArp4r4fiaGvm/cKDv4dbjwctTi2yaqWmZM6jhAjFqYDOF0Dj1UEV2d5SEFmnkkfDhk4tvycGdn5RMxD4BD5tr25eiAZELRy92Lsw6Qbmi7tNl3213hU7tO8NxwGrwVzuI7uYL3vi4bvc6sQ=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1764251255; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=b0oMnunnjuobG7eO1qvntmjm1GhyPkGJUrptzNeT38o=; 
	b=Mo9WfSq+g0Y1vhrbyK04/qyxAhbaUDVNbty788sHNudiHszZWuGQdWhPs3X1MHlnAEAwH2+effveKIICSGYbIE98uFhaGibmAoekoIbCqNJBOTsEt1lymitxYAuY718/gw1B56aXVl6akGW0TRx6CgVYKlLHeZ8wzqHOh1Yfgto=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=icenowy.me;
	spf=pass  smtp.mailfrom=uwu@icenowy.me;
	dmarc=pass header.from=<uwu@icenowy.me>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1764251255;
	s=zmail2; d=icenowy.me; i=uwu@icenowy.me;
	h=Message-ID:Subject:Subject:From:From:To:To:Cc:Cc:Date:Date:In-Reply-To:References:Content-Type:Content-Transfer-Encoding:MIME-Version:Message-Id:Reply-To;
	bh=b0oMnunnjuobG7eO1qvntmjm1GhyPkGJUrptzNeT38o=;
	b=NevznnIIn59XEHlVsufetcVaa7qfNmwKdJLGscdLrhvL/rJhsbh+zKjlDzPYGDnn
	V0SwbK4ECYIb3eC849j5CX32dSlOqdPZlD3QjYehC6NvCo9DwnZN0tjza431fXhTKRq
	9fV9FZxWzvrE46QSslYmerkr2/E8fKzMhSVzU+8lqc7oaHhJ9EzUsfnHev4cqWMqI2h
	Dx+dHQt6a2cyuwJQUUXvb9+oj2RRxEsRrhj1uZk4zq350udzqwAVo/NKsSKtJsaPotz
	6KpnXzeV+NmAE5jMUSlGWV/O3sWqKlp+b9Y9wK9OQ0T4ZMzxZfw5uB6oI852mF8ITdC
	l6LveB5DmQ==
Received: by mx.zohomail.com with SMTPS id 1764251253052907.8324349863465;
	Thu, 27 Nov 2025 05:47:33 -0800 (PST)
Message-ID: <b7b9396950cb92c227acef5461941020a282e551.camel@icenowy.me>
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
Date: Thu, 27 Nov 2025 21:47:23 +0800
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
X-CRM114-CacheID: sfid-20251127_054808_474132_C270F6C1 
X-CRM114-Status: GOOD (  25.77  )
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
aGUgZ2VuZXJpYwo+IGNvbXBhdGlibGUgaXMgYWxsb3dlZCBmb3IgdGhlbSBhcyB3ZWxsLgoKSSBj
YW1lIGFjcm9zcyBhIGNvbW1lbnQgb24gTWFsaSBWYWxoYWxsIGJpbmRpbmdzIHRoYXQgc2F5cyBg
TWFsaQpWYWxoYWxsIEdQVSBtb2RlbC9yZXZpc2lvbiBpcyBmdWxseSBkaXNjb3ZlcmFibGVgLCBq
dXN0IGFmdGVyIHRoZQpjb21wYXRpYmxlIHN0cmluZy4KClNob3VsZCBJIGFkZCBhIGNvbW1lbnQg
bGlrZSB0aGlzLCBvciBzaG91bGQgSSBtYWtlIHRoaW5ncyBtb3JlIGNsZWFyIGluCnRoZSBjb21t
aXQgbWVzc2FnZT8KCj4gCj4gPiAKPiA+ID4gCj4gPiA+ID4gKwo+ID4gPiA+ICvCoCByZWc6Cj4g
PiA+ID4gK8KgwqDCoCBtYXhJdGVtczogMQo+ID4gPiA+ICsKPiA+ID4gPiArwqAgaW50ZXJydXB0
czoKPiA+ID4gPiArwqDCoMKgIG1heEl0ZW1zOiAxCj4gPiA+ID4gKwo+ID4gPiA+ICvCoCBjbG9j
a3M6Cj4gPiA+ID4gK8KgwqDCoCBtaW5JdGVtczogNAo+ID4gPiAKPiA+ID4gVGhpcyBpcyBub3Qg
ZmxleGlibGUuIERldmljZSBlaXRoZXIgaGFzIG9yIGhhcyBub3QgdGhlc2UgY2xvY2tzLgo+ID4g
Cj4gPiBUaGUgZXhpc3RlbmNlIG9mIGFsbCB0aGVzZSBjbG9ja3MgYXJlIHZlcmlmaWVkIGJ5IGRp
YWdyYW1zIGluCj4gPiBtYW51YWxzCj4gCj4gU28gbm90IGZsZXhpYmxlLCB0aGVuOgo+IAo+ID4g
b2YgdHdvIGRpZmZlcmVudCBTb0NzIHdpdGggREM4MjAwIChULUhlYWQgVEgxNTIwIGFuZCBTdGFy
Rml2ZQo+ID4gSkg3MTEwKS4KPiA+IAo+ID4gTWF5YmUgYSBleHBsaWNpdCBgbWF4SXRlbXM6IDVg
IGlzIG5lZWRlZCBoZXJlLCBidXQgYXMgbXkgRFQgcGFzc2VzCj4gPiBkdGJzX2NoZWNrLCBJIGRv
bid0IHRoaW5rIGl0J3MgbmVjZXNzYXJ5Pwo+IAo+IE5vLCBkcm9wIG1pbkl0ZW1zIG9ubHkuCj4g
Cj4gPiAKPiA+IE9yIG1heWJlIEkgc2hvdWxkIGRyb3AgdGhlIGZsZXhpYmlsaXR5IG5vdyBhbmQg
dXNlIGEgYG1pbkl0ZW1zOiA1YAo+ID4gaGVyZQo+ID4gKGFuZCBsZWF2ZSBEQzgwMDAgc3VwcG9y
dCBhcyBhbm90aGVyIHN0b3J5KT8gKFRoZSBFc3dpbiBFSUM3NzAwCj4gPiBtYW51YWwKPiA+IGRv
ZXMgbm90IGhhdmUgYSBkaWFncmFtIHNob3dpbmcgZXh0ZXJuYWwgY29ubmVjdGlvbnMgb2YgdGhl
IERDLAo+ID4gbGlrZQo+ID4gdGhlIHR3byBTb0NzIEkgbWVudGlvbmVkIGFib3ZlKS4KPiAKPiBZ
b3UgZG9jdW1lbnQgaGVyZSBvbmx5IHRoZSBkZXZpY2VzIGV4cGxpY2l0bHkgbWVudGlvbmVkIGlu
IHRoZQo+IGJpbmRpbmcuCj4gWW91IGNhbm5vdCBhZGQgaGVyZSBjb25zdHJhaW50cyBvciBjbG9j
a3MgZm9yIHNvbWUgZGV2aWNlIHdoaWNoIGlzCj4gbm90Cj4gaW4gdGhlIGJpbmRpbmcgYW5kIEkg
c2VlIG9ubHkgdGgxNTIwIGluIHRoZSBiaW5kaW5nLgo+IAo+IEJlc3QgcmVnYXJkcywKPiBLcnp5
c3p0b2YKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwps
aW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpo
dHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
