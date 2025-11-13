Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61DACCD3445
	for <linux-riscv@archiver.kernel.org>; Thu, 13 Nov 2025 00:49:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HW4Du3ewiRWXvATMhVTgSrBr3dvBCYNOPUsdSnm/fXQ=; b=Z1GRSqUgUm8Y8v
	YV2pACRTTGcY3lq7ZB2xSDsmV++HM8eT4OyAHzabhbsbRtCJJaqQLa/ltae7cIiW/X3J4H46mzlmg
	qDpRJiaiqdgwMlo+pxWqo+w57F4bUQL3ayS4UQmKo4HmMmXWgNAIJnIeHux9THnWUNMC9qWCxl3+A
	CoWOctsN4bX+k7xBxC3ChDHoRWSdmxEftyEQPLffDcQyJz3ZlMkgWCFLdaxHMaPuNhM/+RMz4i8kM
	UjWNXUFAmxFjDYUiTfAl5IeROeClKiu22gu8C55QCBH9CWKq8CmeiSNFm+fgqDu0Vj0WESxMDrHC0
	cRqxxgyRkxuE7pHP0p/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJLWr-00000009gWk-1Msb;
	Thu, 13 Nov 2025 00:49:37 +0000
Received: from sender4-op-o12.zoho.com ([136.143.188.12])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJLWo-00000009gVn-076v;
	Thu, 13 Nov 2025 00:49:35 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1762994927; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=H6LzGbP5dJZM746g0tHRH07iUvv90mFC1ovHkOxCf70dTMiaabPLP6JE4HObK+VFAaIA8aX8VeNn9qhua0P4h6fcM7z/2ObxAYspfjy/0rVOKWFsMtr0krNQ2zUCRhmEkYWBGmNjV2jmcOJ5OkNSWISSpM3OhJOgoCGA6ftkhuY=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1762994927; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=CaqYrXe8Ge+kPBFlhZjMdu1CeT964d9IlL/4u4InQzg=; 
	b=E/uPDJNh+zJVd0hkFHDmkNmRzFnMfMIX+VwdBSR0A57MWSIsiA5AJ+oftIrlyy1wBuKh3cP1sJKHCPjTFkbyD/29zM1YMfUxFpnHBUPegAvFsdLRCod2L0LJL2XpklThhtfxdHdWz3LMTMFktAjKmg3xDzRpeUURSNOVfz+FQAk=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=icenowy.me;
	spf=pass  smtp.mailfrom=uwu@icenowy.me;
	dmarc=pass header.from=<uwu@icenowy.me>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1762994927;
	s=zmail2; d=icenowy.me; i=uwu@icenowy.me;
	h=Message-ID:Subject:Subject:From:From:To:To:Cc:Cc:Date:Date:In-Reply-To:References:Content-Type:Content-Transfer-Encoding:MIME-Version:Message-Id:Reply-To;
	bh=CaqYrXe8Ge+kPBFlhZjMdu1CeT964d9IlL/4u4InQzg=;
	b=e/XQGG6GKNFqKSgfgsMobkmts6s5b2JIFfEeTnauhiARBxrzFOiqcu1y6m50CxBa
	UC0gn0804/nPbVDNvUgFXc/j59KJ0kBqP3mktrx5smdDG3DgMw9DC3fF280ly+cqXO1
	HgwRKOgZMZVEHhR08hjQ0v0ZLjAKhh7fu0UXNbRjU15MzSN03RQQZtrBiIb1Me+wVm6
	ERHC+BkxoP37ZC/xdNyugN4uSw597sCux35E8/jxI9sGdMshHSZa9NvjjoTU8hcDgzG
	t7fOu8ebnKcmH4OqbUe2M8+RWw5cQvKONtcdeNFm8HAkIwMyKBtQXf9CkIamYZ3dGTq
	fpfMqJ17Nw==
Received: by mx.zohomail.com with SMTPS id 176299492610942.753891752546224;
	Wed, 12 Nov 2025 16:48:46 -0800 (PST)
Message-ID: <1d54524d7ef939232b4512ca59c78794484103ca.camel@icenowy.me>
Subject: Re: [PATCH RFC 01/13] dt-bindings: soc: starfive: Add
 vout-subsystem IP block
From: Icenowy Zheng <uwu@icenowy.me>
To: Conor Dooley <conor@kernel.org>
Cc: Michal Wilczynski <m.wilczynski@samsung.com>, Rob Herring
 <robh@kernel.org>,  Krzysztof Kozlowski <krzk+dt@kernel.org>, Emil Renner
 Berthing <kernel@esmil.dk>, Hal Feng <hal.feng@starfivetech.com>, Michael
 Turquette <mturquette@baylibre.com>,  Stephen Boyd <sboyd@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Xingyu Wu <xingyu.wu@starfivetech.com>,
  Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Neil Armstrong
 <neil.armstrong@linaro.org>,  Robert Foss <rfoss@kernel.org>, Laurent
 Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman
 <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, Lee Jones <lee@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, Paul Walmsley
 <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
 <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, Marek Szyprowski
 <m.szyprowski@samsung.com>, Maud Spierings <maudspierings@gocontroll.com>, 
 Andy Yan <andyshrk@163.com>, Heiko Stuebner <heiko@sntech.de>,
 devicetree@vger.kernel.org,  linux-kernel@vger.kernel.org,
 linux-clk@vger.kernel.org,  linux-phy@lists.infradead.org,
 dri-devel@lists.freedesktop.org,  linux-riscv@lists.infradead.org
Date: Thu, 13 Nov 2025 08:48:33 +0800
In-Reply-To: <20251112-skating-robust-81be8dee0a8b@spud>
References: <20251108-jh7110-clean-send-v1-0-06bf43bb76b1@samsung.com>
	 <CGME20251108010453eucas1p2403ec0dd2c69ae7f3eabe19cf686f345@eucas1p2.samsung.com>
	 <20251108-jh7110-clean-send-v1-1-06bf43bb76b1@samsung.com>
	 <20251111-massager-twistable-1e88f03d82f8@spud>
	 <20251111-unsaid-rockslide-67b88b2e34bd@spud>
	 <0d8e3a626b037dd348378e5ebca8005c1e715871.camel@icenowy.me>
	 <20251112-skating-robust-81be8dee0a8b@spud>
Organization: Anthon Open-Source Community
User-Agent: Evolution 3.44.4 
MIME-Version: 1.0
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251112_164934_122011_23C6DD1A 
X-CRM114-Status: GOOD (  22.04  )
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

5ZyoIDIwMjUtMTEtMTLmmJ/mnJ/kuInnmoQgMTg6MzYgKzAwMDDvvIxDb25vciBEb29sZXnlhpnp
gZPvvJoKPiBPbiBXZWQsIE5vdiAxMiwgMjAyNSBhdCAwMjozNDozOVBNICswODAwLCBJY2Vub3d5
IFpoZW5nIHdyb3RlOgo+ID4g5ZyoIDIwMjUtMTEtMTHmmJ/mnJ/kuoznmoQgMTg6MzYgKzAwMDDv
vIxDb25vciBEb29sZXnlhpnpgZPvvJoKPiA+ID4gT24gVHVlLCBOb3YgMTEsIDIwMjUgYXQgMDY6
MTg6MTZQTSArMDAwMCwgQ29ub3IgRG9vbGV5IHdyb3RlOgo+ID4gPiA+IE9uIFNhdCwgTm92IDA4
LCAyMDI1IGF0IDAyOjA0OjM1QU0gKzAxMDAsIE1pY2hhbCBXaWxjenluc2tpCj4gPiA+ID4gd3Jv
dGU6Cj4gPiA+ID4gPiBBZGQgdGhlIGR0LWJpbmRpbmcgZG9jdW1lbnRhdGlvbiBmb3IgdGhlIFN0
YXJGaXZlIEpINzExMAo+ID4gPiA+ID4gVmlkZW8KPiAKPiA+ID4gPiA+ICtwYXR0ZXJuUHJvcGVy
dGllczoKPiA+ID4gPiA+ICvCoCAiXmRpc3BsYXlAWzAtOWEtZl0rJCI6Cj4gPiA+ID4gCj4gPiA+
ID4gUGVyc29uYWxseSBJJ2QgbGlrZSB0byBzZWUgdGhlc2UgYmVpbmcgcmVndWxhciBwcm9wZXJ0
aWVzLAo+ID4gPiA+IHNpbmNlCj4gPiA+ID4gdGhlcmUncwo+ID4gPiA+IGV4YWN0bHkgb25lIHBv
c3NpYmxlIHNldHVwIGZvciB0aGlzLgo+ID4gPiA+IAo+ID4gPiA+ID4gK8KgwqDCoCB0eXBlOiBv
YmplY3QKPiA+ID4gPiA+ICvCoMKgwqAgZGVzY3JpcHRpb246IFZlcmlzaWxpY29uIERDODIwMCBE
aXNwbGF5IENvbnRyb2xsZXIgbm9kZS4KPiA+ID4gPiAKPiA+ID4gPiBDYW4geW91IGFkZCB0aGUg
cmVsZXZhbnQgcmVmZXJlbmNlcyBoZXJlIGluc3RlYWQgb2YgYWxsb3dpbmcKPiA+ID4gPiBhbnkK
PiA+ID4gPiBvYmplY3Q/Cj4gPiA+IAo+ID4gPiBJIGRvbid0IHRoaW5rIHRoYXQgaWYgeW91IGRp
ZCwgdGhpcyB3b3VsZCBwYXNzIHRoZSBiaW5kaW5nCj4gPiA+IGNoZWNrcywKPiA+ID4gYmVjYXVz
ZSB0aGVyZSdzIG5vICJ2ZXJpc2lsaWNvbixkYyIgYmluZGluZy4gSSB0aGluayBJIHNhdyBvbmUg
aW4KPiA+ID4gcHJvZ3Jlc3MsIGJ1dCB3aXRob3V0IHRoZSBzb2Mtc3BlY2lmaWMgY29tcGF0aWJs
ZSB0aGF0IEkgYW0gZ29pbmcKPiA+ID4gdG8KPiA+ID4gcmVxdWlyZSBoZXJlIC0gaWYgZm9yIG5v
IHJlYXNvbiBvdGhlciB0aGFuIG1ha2luZyBzdXJlIHRoYXQgdGhlCj4gPiA+IGNsb2Nrcwo+ID4g
PiBldGMgYXJlIHByb3ZpZGVkIGNvcnJlY3RseSBmb3IgdGhpcyBkZXZpY2UuCj4gPiAKPiA+IFdl
bGwgSSBkaWRuJ3Qgc3BlY2lmeSBhbnkgc29jLXNwZWNpZmljIGNvbXBhdGlibGUgYmVjYXVzZSB0
aGF0IElQCj4gPiBoYXMKPiA+IGl0cyBvd24gaWRlbnRpZmljYXRpb24gcmVnaXN0ZXJzLgo+IAo+
IEkgc3RpbGwgcmVxdWlyZSBvbmUgYmVjYXVzZSBJIHdhbnQgdG8gbWFrZSBzdXJlIHRoYXQgY2xv
Y2tzIGV0YyBhcmUKPiBoYW5kbGVkIGNvcnJlY3RseS4gWW91IGNhbiBpZ25vcmUgaXQgaW4gdGhl
IGRyaXZlciBpZiB5b3Ugd2lzaCwgYnV0Cj4gd2hlbgo+IHRoZSBuZXh0IHVzZXIgY29tZXMgYWxv
bmcgd2l0aCBvbmUgbW9yZSBvciBsZXNzIGNsb2NrLCBJIHdhbnQgdGhlCj4gamg3MTEwIG9uZSB0
byBiZSBmb3JjZWQgdG8gdXNlIHRoZSBjb3JyZWN0IGNvbmZpZ3VyYXRpb24uCgpJIGRvbid0IHRo
aW5rIGZvciB0aG9zZSBnZW5lcmljIElQcyByZXF1aXJpbmcgYSBTb0Mtc3BlY2lmaWMgY29tcGF0
aWJsZQppcyBhIGdvb2QgaWRlYS4KCkluIGFkZGl0aW9uLCBgdml2YW50ZSxnY2AgcmVxdWlyZXMg
bm8gU29DLXNwZWNpZmljIG9yIGV2ZW4gbW9kZWwtCm51bWJlci1zcGVjaWZpYyBjb21wYXRpYmxl
IHN0cmluZ3MgdG9vLCBhbmQgYHZlcmlzaWxpY29uLGRjYCBpcyBmcm9tCnRoZSBzYW1lIElQIHZl
bmRvciBbMV0gYW5kIGZlYXR1cmVzIHRoZSBzYW1lIHNldCBvZiBpZGVudGlmaWNhdGlvbgpyZWdp
c3RlcnMgKHNlZSBhbHNvIGFsbCBHQ18gcHJlZml4ZWQgaWRlbnRpZmljYXRpb24gcmVnaXN0ZXJz
IGluIFsyXSkuCgpbMV0KaHR0cHM6Ly93d3cuZGVzaWduLXJldXNlLmNvbS9uZXdzLzIwMjUyNzQ0
Ni12ZXJpc2lsaWNvbi1jb21wbGV0ZXMtYWNxdWlzaXRpb24tb2Ytdml2YW50ZS8KWzJdCmh0dHBz
Oi8vZ2l0aHViLmNvbS9taWxrdi1tZWdyZXovcm9ja29zLXUtYm9vdC9ibG9iL2M5MjIxY2YyZmE3
N2QzOWMwYjI0MWFiNGIwMzBjNzA4ZTdlYmUyNzkvZHJpdmVycy92aWRlby9lc3dpbi9lc3dpbl9k
Y19yZWcuaAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
bGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcK
aHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
