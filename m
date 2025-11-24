Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03095CFA466
	for <linux-riscv@archiver.kernel.org>; Mon, 24 Nov 2025 11:13:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XbEWSFZi20tdstF0mll/I4mIJ71x8exC7gWT4BQK1Ws=; b=CtOiJllDQFeX6y
	90sm+r4HbEcNQzHMSEMMskiSAtNGL/ZpMWr5eTHz42goQkhogjwH3eN58FqJlB9QofhdAhWlkYXF3
	cnpO6HkhaCT7mYXYLvM+2VmMdGr9cdqdmUVDTYJFyMq1BVhNbqcXp7Ec8GYJzup/HB/774EJr1XZA
	LlJykOhHi5dfM6BTtKF1zyM2nASGsRxhwEs8OWH6iKeSP55VshDklMIp1vUM2/ljyN4KodWIwJxgs
	LDzdArczOI572QWq1oooScrHGWXERso4r1zn5MFl8tsu+7aJh/4IRir45M5d+rQ1UtrXbR37XGgEc
	5bxhjm/Pc4FI9xtdQPLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNUVp-0000000BXGD-41iL;
	Mon, 24 Nov 2025 11:13:41 +0000
Received: from sender3-op-o12.zoho.com ([136.143.184.12])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNUVn-0000000BXFW-2FCB
	for linux-riscv@lists.infradead.org;
	Mon, 24 Nov 2025 11:13:40 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1763982799; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=RXGG0wCXRZGCfnQpgXH0Vx2WyGF6c+U5heQ+bWZ3q8Co5IXMzXrW4Uxxyxwfp6V5TizMEc/YXEOWg6hU9fNFUetJPRnzRnFQIhct9hMQb1kiRsTsKTeLL5M7ppv6HyBqP8gUcOeOqvVN+okredYDssoeOmojnjdC94aQQNnq4Ig=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1763982799; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=kQ085CdL/cJtJYr9M6H5J/53z45mKWu6dK2xiNId5tk=; 
	b=VXWiLCSBRdi6gflVB8NgPxyNcDQznN1btwvqYESjn6jz185SMNDRnIFFKZUTEPm0OcyAbkaHjbW7Wl/4A7INVV77fl9Ty3IeWCoUoAFvQZI7ybKwUXdX5chYk4agUCicwTT9L5QGDFOowIxYIxud0d96wX20WfAseLirkJMTGyk=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=icenowy.me;
	spf=pass  smtp.mailfrom=uwu@icenowy.me;
	dmarc=pass header.from=<uwu@icenowy.me>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1763982799;
	s=zmail2; d=icenowy.me; i=uwu@icenowy.me;
	h=Message-ID:Subject:Subject:From:From:To:To:Cc:Cc:Date:Date:In-Reply-To:References:Content-Type:Content-Transfer-Encoding:MIME-Version:Message-Id:Reply-To;
	bh=kQ085CdL/cJtJYr9M6H5J/53z45mKWu6dK2xiNId5tk=;
	b=B0sWsxM/aVwxTiYJV9XdMFQIAvRtdS0pGiTePgWC50Lo5oK4HkV3BNVE3f11DBLd
	FZGvmJ9NCvnvn4c1nape5lWE979Ax1zDs9u3EPAD4r9YLdBNJxcFCI85VGFP6JvEOzb
	xdCPag1Zi4uug6JaqF/bZwKPbkO7RqpApURhXWIWXV7igS/CwKiB37C8xUqikWhqXH+
	7UzSzjenu2IFM0LNe1vasnAnB7mtDmMtcV+kOzMnWDOpskipbQz4gtmwGe6J2ObIWwd
	2LSb2VbiN7H3LsCWc/fOdGmE7I3z/wQiZ+TOp5sDvJ9UyrWPEz5kdlDdxagYDaieKxp
	b8D5K/m9Mg==
Received: by mx.zohomail.com with SMTPS id 1763982796648406.6136890367899;
	Mon, 24 Nov 2025 03:13:16 -0800 (PST)
Message-ID: <f944f0b28f62233b1874e0f00c0a130d71845417.camel@icenowy.me>
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
Date: Mon, 24 Nov 2025 19:13:08 +0800
In-Reply-To: <c26dabfb-c4af-428b-a1d4-d626f37ff559@kernel.org>
References: <20251124105226.2860845-1-uwu@icenowy.me>
	 <20251124105226.2860845-3-uwu@icenowy.me>
	 <d4cfe8bb-5ca2-40a9-bfe0-96e7ded5586c@kernel.org>
	 <f7bbb57180866a0674fc1d72d4bd3279c7b1c1e9.camel@icenowy.me>
	 <c26dabfb-c4af-428b-a1d4-d626f37ff559@kernel.org>
Organization: Anthon Open-Source Community
User-Agent: Evolution 3.44.4 
MIME-Version: 1.0
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251124_031339_654885_E90F2F39 
X-CRM114-Status: GOOD (  26.72  )
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

5ZyoIDIwMjUtMTEtMjTmmJ/mnJ/kuIDnmoQgMTI6MDkgKzAxMDDvvIxLcnp5c3p0b2YgS296bG93
c2tp5YaZ6YGT77yaCj4gT24gMjQvMTEvMjAyNSAxMjowNCwgSWNlbm93eSBaaGVuZyB3cm90ZToK
PiA+IOWcqCAyMDI1LTExLTI05pif5pyf5LiA55qEIDEyOjAxICswMTAw77yMS3J6eXN6dG9mIEtv
emxvd3NraeWGmemBk++8mgo+ID4gPiBPbiAyNC8xMS8yMDI1IDExOjUyLCBJY2Vub3d5IFpoZW5n
IHdyb3RlOgo+ID4gPiA+IFZlcmlzaWxpY29uIGhhcyBhIHNlcmllcyBvZiBkaXNwbGF5IGNvbnRy
b2xsZXJzIHByZWZpeGVkIHdpdGgKPiA+ID4gPiBEQwo+ID4gPiA+IGFuZAo+ID4gPiA+IHdpdGgg
c2VsZi1pZGVudGlmaWNhdGlvbiBmYWNpbGl0eSBsaWtlIHRoZWlyIEdDIHNlcmllcyBHUFVzLgo+
ID4gPiA+IAo+ID4gPiA+IEFkZCBhIGRldmljZSB0cmVlIGJpbmRpbmcgZm9yIGl0Lgo+ID4gPiA+
IAo+ID4gPiA+IERlcGVuZHMgb24gdGhlIHNwZWNpZmljIERDIG1vZGVsLCBpdCBjYW4gaGF2ZSBl
aXRoZXIgb25lIG9yIHR3bwo+ID4gPiA+IGRpc3BsYXkKPiA+ID4gPiBvdXRwdXRzLCBhbmQgZWFj
aCBkaXNwbGF5IG91dHB1dCBjb3VsZCBiZSBzZXQgdG8gRFBJIHNpZ25hbCBvcgo+ID4gPiA+ICJE
UCIKPiA+ID4gPiBzaWduYWwgKHdoaWNoIHNlZW1zIHRvIGJlIHNvbWUgcGxhaW4gcGFyYWxsZWwg
YnVzIHRvIEhETUkKPiA+ID4gPiBjb250cm9sbGVycykuCj4gPiA+ID4gPiBTaWduZWQtb2ZmLWJ5
OiBJY2Vub3d5IFpoZW5nIDx1d3VAaWNlbm93eS5tZT4KPiA+ID4gPiBTaWduZWQtb2ZmLWJ5OiBJ
Y2Vub3d5IFpoZW5nIDx6aGVuZ3hpbmdkYUBpc2Nhcy5hYy5jbj4KPiA+ID4gCj4gPiA+IFdyb25n
IERDTyBjaGFpbiBvcmRlci4gWW91IHNlbmQgaXQgYXMgaWNlbm93eS5tZSwgc28gdGhpcyBtdXN0
IGJlCj4gPiA+IGxhc3QKPiA+ID4gU29CLiBUaGlzIGlkZW50aXR5IGlzIHRoZSBsYXN0IG9uZSBj
ZXJ0aWZ5aW5nIERDTy4gUGxlYXNlIGtpbmRseQo+ID4gPiByZWFkCj4gPiA+IHN1Ym1pdHRpbmcg
cGF0Y2hlcywgc28geW91IGtub3cgd2hhdCB5b3UgYXJlIGNlcnRpZnlpbmcgaGVyZS4KPiA+IAo+
ID4gV2VsbCBJIG1hcHBlZCB0aGUgQGlzY2FzLmFjLmNuIG1haWwgdG8gdGhlIEBpY2Vub3d5Lm1l
IG9uZSBpbiB0aGUKPiA+IGxhc3QKPiA+IHBhdGNoLgo+ID4gCj4gPiBPciBtYXliZSBJIHNob3Vs
ZCBtYWtlIGl0IHRoZSBmaXJzdCBwYXRjaD8KPiAKPiAubWFpbG1hcCBoYXMgZWZmZWN0IG9uIGI0
IGFuZCBnaXQgc2VuZC1lbWFpbCwgc28gbWF5YmUgdGhhdCdzIHRoZQo+IGFuc3dlci4gVGhlIHBy
b2JsZW0gaXMgdGhhdDoKPiAxLiBUaGlzIGVtYWlsIGhhcyBzZW5kZXIgYWRkcmVzcyBAaWNlbm93
eS5tZQo+IDIuIEl0J3MgU29CIGlzIG5vdCB0aGUgbGFzdCBvbmUuCgpXZWxsLCBJIHRoaW5rIGEg
cGF0Y2ggdGhhdCBpcyBhbHJlYWR5IHNlbnQgc2hvdWxkbid0IGhhdmUgdGhlIEZyb20KZmllbGQg
Y2hhbmdpbmcgd2hlbiBidW1waW5nIHJldmlzaW9uLCBhbmQgYSBwYXRjaCBtb2RpZmllZCBieSBv
bmUKaWRlbnRpdHkgc2hvdWxkIGhhdmUgdGhlIG1vZGlmeWluZyBvbmUncyBTb0IgYWRkZWQuCgpT
byBoZXJlIEkgYW0gdXNpbmcgdGhlIEBpY2Vub3d5Lm1lIG1haWwgKHdoaWNoIGNhbiByZXByZXNl
bnQgdGhlCkBpc2Nhcy5hYy5jbiBtYWlsIGFjY29yZGluZyB0byB0aGUgbWFpbG1hcCkgdG8gc2Vu
ZCB0aGUgcGF0Y2ggdGhhdCBpcwpwcm9jZXNzZWQgYnkgQGlzY2FzLmFjLmNuIG1haWwuCgpTZW5k
aW5nIHRoZSBwYXRjaCB3aXRoIEBpc2Nhcy5hYy5jbiBtYWlsIG5lZWRzIHNvbWUgZXh0cmEgc2V0
dXAKKGJlY2F1c2Ugb2Ygc29tZSB3ZWlyZCBzZWN1cml0eSByZXF1aXJlbWVudCkuCgo+IAo+IFRo
aXMgbmVlZHMgdG8gYmUgZml4ZWQuIFRoZSBvcmRlciBvZiBwYXRjaGVzIGZvciBtZSBkb2VzIG5v
dCBtYXR0ZXIsCj4gSQo+IGRvbid0IHRoaW5rIGl0IHdvdWxkIGZpeCB0aGUgaXNzdWUgaGVyZSBl
aXRoZXIuCj4gCj4gQW55d2F5LCBwbGVhc2UgdHJpbSB5b3VyIHJlc3BvbnNlcywgc28gSSB3aWxs
IG5vdCBoYXZlIHRvIHNjcm9sbAo+IHRocm91Z2gKPiBsaW5lcyBvZiBjb2RlIHRvIGZpbmQgdGhh
dCB5b3UgZGlkIG5vdCByZXNwb25kIHRoZXJlLgo+IAo+IAo+IAo+IEJlc3QgcmVnYXJkcywKPiBL
cnp5c3p0b2YKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9y
ZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2
Cg==
