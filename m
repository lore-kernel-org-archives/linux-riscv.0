Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24A84CFD313
	for <linux-riscv@archiver.kernel.org>; Mon, 24 Nov 2025 17:43:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Y/0/pThP1QsIHnmSxeTpc468fqQx6MBnsV0iqxkw5tM=; b=0Ap3WpGjnh8VUk
	6WhBoQDwNw52j+ctBhsz2m0ZdWr/FWNLkcwJLlWH4xNfE1wpM2SvrcgtJuzD1yBSvZ4EHZt/2ZsJ7
	0/98Hv4nnwxACzwkdMiLfyKOrPecAQ7wrgL+nxBWAtcbrLdkUUCXDJ3LhJ0+9C0oUsOpyFQ+9AVOh
	Xfqi5f2eiyuSVafgnWD/cXQh4N1hBWkBppsAdaMd1M3MDtuzKJogQro5tSzvbZgV2WSj5aBDkIst8
	EmjrThQMV+nyB9hazo5Faq2U5aa2LdmvEEIUMgwgSZOs6u0MlPEjgihYMQJpemVO3EUP9ajBF/IRB
	o9GGIiR0lS4R9VtO24mQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNab3-0000000C7bf-0tu7;
	Mon, 24 Nov 2025 17:43:29 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNab2-0000000C7bD-2X61
	for linux-riscv@bombadil.infradead.org;
	Mon, 24 Nov 2025 17:43:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=MIME-Version:Content-Transfer-Encoding
	:Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=yHr20q7gZmlTABXvQBRAafWej6u9u+HA61XCNH7omz8=; b=iC6z+7Hfosa5gmahfOLCSpsmos
	853Bnozvr9amr5EC/VX0nt2q/8awCg0M+6Ogr7pl2OQ+3HNGpXkJ0amv7gbulLKD8McF/zEA6BRai
	wUR/NAigyGGu2QR5ehINKwAwFx0Do8gIMyHtTuqZt4fzYU9Zc/KPUL1P2RqgKTWKQPIeLE25LRPje
	OBy3p04CnfUzAFc6vycj3XlYaw0/IaC0zSw+H5ObjzPcCq5bwvF+lHMKMD4pk18Nm7GzBaagcLt3i
	XBnr32I2ndX42Edn/ObnWXLhwbyvjdth4X05sEh054sB83Dtf13/GoH0E36I9lXbo7HMCPHcHYN+P
	l7IYRSyg==;
Received: from sender3-op-o15.zoho.com ([136.143.184.15])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNZjN-00000004Epx-3Eog
	for linux-riscv@lists.infradead.org;
	Mon, 24 Nov 2025 16:48:04 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1764006172; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=mRcQ5ve7JHZHinstf9NI2Oj36spdkoBiQzNiEcGdBBjdZ86V2mfBVZEWDFczaRGnMEvPE1oJW0pluSaWkt59CpnjujmiyYWgHh9fR6yVHcUYc9V3CMp8RaOmxRlF9MRBHwryTq5lBww1LDX9xTYVwt5e+MIKxMN20xDh6GpYUtw=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1764006172; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=yHr20q7gZmlTABXvQBRAafWej6u9u+HA61XCNH7omz8=; 
	b=baFxRBuUVTDioclaCIGhUX48wGAmFUYVSBbGGhkQ7trMtubU2EkTRg4Vh5/WxqTEjj3nCeAgH2m/3rdbiM6socREZcKA9sFNNLW2l36qqqT8ADuPnvClw0Il4uQc2issZYtk/oj+eyDboP7JbRz3SbhjQPtF2dzdqRZ5QGmm5bc=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=icenowy.me;
	spf=pass  smtp.mailfrom=uwu@icenowy.me;
	dmarc=pass header.from=<uwu@icenowy.me>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1764006172;
	s=zmail2; d=icenowy.me; i=uwu@icenowy.me;
	h=Message-ID:Subject:Subject:From:From:To:To:Cc:Cc:Date:Date:In-Reply-To:References:Content-Type:Content-Transfer-Encoding:MIME-Version:Message-Id:Reply-To;
	bh=yHr20q7gZmlTABXvQBRAafWej6u9u+HA61XCNH7omz8=;
	b=bUM4wSpao8IwcIBLAsnlh+VQiF6ZdfyOs1a4mlAFAh+2RXMmh6zPsyZEjEU0crZD
	4L6oahLGTkkjji5UMRujwKTU4YQcKZW5vJoIuScQOSR+nGrw9hn1+gBS8Nd2M1XNZqn
	TEBnSmNaO8R9lG1hcua83TyNOCKlkuJpS7PxmiPBT0Hfw+sZ8oZGzajlSzIbKpvntQ0
	2u5wgOz+NecxFhAJOz+EIqjvJm+pEympFizvUGj97Hn287baDkzPDDAj2QKJbPuzfgs
	L+CV+OarPZq91gseemZ9Nf4G0JyDmqeRDhi0kPcr/TOQvCiXdgd+ajUoKfMIuFwMwsJ
	bM1dP5C5ng==
Received: by mx.zohomail.com with SMTPS id 1764006170521583.7022266150989;
	Mon, 24 Nov 2025 09:42:50 -0800 (PST)
Message-ID: <920b6864f30777640ebaceee1808e96978e6161a.camel@icenowy.me>
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
Date: Tue, 25 Nov 2025 01:42:41 +0800
In-Reply-To: <ee1e4f94-ff9a-4227-b705-74a7eb806ff0@kernel.org>
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
	 <a8089e458bdf6fbad45cd6be838b4cf75396918f.camel@icenowy.me>
	 <ee1e4f94-ff9a-4227-b705-74a7eb806ff0@kernel.org>
Organization: Anthon Open-Source Community
User-Agent: Evolution 3.44.4 
MIME-Version: 1.0
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251124_164802_008425_D3B4F61D 
X-CRM114-Status: GOOD (  22.16  )
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

5ZyoIDIwMjUtMTEtMjTmmJ/mnJ/kuIDnmoQgMTg6NDAgKzAxMDDvvIxLcnp5c3p0b2YgS296bG93
c2tp5YaZ6YGT77yaCj4gT24gMjQvMTEvMjAyNSAxNjoyNSwgSWNlbm93eSBaaGVuZyB3cm90ZToK
PiA+IOWcqCAyMDI1LTExLTI05pif5pyf5LiA55qEIDEzOjMxICswMTAw77yMS3J6eXN6dG9mIEtv
emxvd3NraeWGmemBk++8mgo+ID4gPiBPbiAyNC8xMS8yMDI1IDEzOjIwLCBDb25vciBEb29sZXkg
d3JvdGU6Cj4gPiA+ID4gT24gTW9uLCBOb3YgMjQsIDIwMjUgYXQgMDE6MDg6MDBQTSArMDEwMCwg
S3J6eXN6dG9mIEtvemxvd3NraQo+ID4gPiA+IHdyb3RlOgo+ID4gPiA+ID4gT24gMjQvMTEvMjAy
NSAxMzowNSwgQ29ub3IgRG9vbGV5IHdyb3RlOgo+ID4gPiA+ID4gPiAKPiA+ID4gPiA+ID4gSSBk
b24ndCByZWFsbHkgZ2V0IHdoYXQgdGhlIGZ1c3MgaXMgd2l0aCB0aGUgZHVhbCBzaWdub2ZmLAo+
ID4gPiA+ID4gPiB3aGF0J3MgdGhlCj4gPiA+ID4gPiA+IHBvaW50IGhhdmluZyBib3RoIHdoZW4g
dGhleSByZXByZXNlbnQgdGhlIHNhbWUgcGVyc29uPwo+ID4gPiA+ID4gPiBQcmV0dHkKPiA+ID4g
PiA+ID4gc3VyZSBpdAo+ID4gPiA+ID4gPiB3YXMgeW91IChLcnp5c3p0b2YpIGFuZCBBcm5kIHRo
YXQgdG9sZCBtZSBub3QgdG8gYm90aCBkb2luZwo+ID4gPiA+ID4gPiB0aGUKPiA+ID4gPiA+ID4g
ZG91YmxlCj4gPiA+ID4gPiA+IHNpZ25vZmYuCj4gPiA+ID4gPiAKPiA+ID4gPiA+IEkgZG8gbm90
IG9iamVjdCBoYXZpbmcgb3Igbm90IGhhdmluZyBkdWFsIHNpZ25lZCBvZmYgSEVSRS4KPiA+ID4g
PiA+IAo+ID4gPiA+ID4gSSBuZXZlciBzYWlkIHRoYXQuIEp1c3QgbGlrZSBJIG5ldmVyIHNhaWQg
IkZyb20iIGhhcyB0byBiZQo+ID4gPiA+ID4gY2hhbmdlZC4KPiA+ID4gPiAKPiA+ID4gPiBJIGRp
ZG4ndCBzYXkgeW91IG9iamVjdGVkIHRvIGJvdGggYmVpbmcgdGhlcmUuICpJKiBhbSBzYXlpbmcK
PiA+ID4gPiB0aGF0Cj4gPiA+ID4gaXQgaXMKPiA+ID4gCj4gPiA+IEFoLCBzdXJlLiBZZXMsIGlm
IGJvdGggaWRlbnRpdGllcyB3b3JrIEkgd291bGQgcHJvcG9zZSB0byBza2lwCj4gPiA+IHNlY29u
ZAo+ID4gPiBTb0IuIEJ1dCBJIGFsc28gc3RvcHBlZCBvYmplY3Rpbmcgb2YgaGF2aW5nIHR3byBp
ZGVudGl0aWVzCj4gPiA+IGxpc3RlZCwgYXMKPiA+ID4gbG9uZyBhcyB0aGV5IGFyZSBjb3JyZWN0
Lgo+ID4gCj4gPiBXZWxsIGl0J3MgdW5mb3J0dW5hdGUgdGhhdCBzb21lIHBvbGljeSBub3cgcmVx
dWlyZXMgbWUgdG8gbGlzdCB0aGUKPiA+IHNlY29uZCBpZGVudGl0eS4KPiAKPiBObyBwb2xpY3kg
YXNrZWQgeW91Li4uCgpMb2NhbCBwb2xpY3kgaGVyZSwgc2lnaC4uLgoKPiAKPiA+IAo+ID4gU2hv
dWxkIEkgcmVzZW5kIHRoZSB3aG9sZSBwYXRjaHNldCB3aXRoIHRoZSBJU0NBUyBtYWlsPwo+IAo+
IFlvdSBjYW4sIGl0IHByb2JhYmx5IHdvdWxkIHNvbHZlIHRoZSBpc3N1ZSwgdW5sZXNzIHlvdSBj
aGFuZ2UgdGhlCj4gYXV0aG9yLCBidXQgd2h5IHlvdSBjYW5ub3QgZG8gd2hhdCBJIGFza2VkIGF0
IHRoZSBiZWdpbm5pbmcgLSBzZXQKPiBjb3JyZWN0IG9yZGVyIG9mIFNvQnMsIHNvIHRoZSBAaWNl
bm93eS5tZSBiZWluZyB0aGUgbGFzdD8KCldlbGwgYmVjYXVzZSBwcmV2aW91cyByZXZpc2lvbnMg
b2YgdGhlIHBhdGNoIGNvbWVzIHdpdGggb25seQpAaWNlbm93eS5tZSBTb0IsIGFuZCBJIHRoaW5r
IFNvQiBpcyBhcHBlbmQtb25seS4uLgoKPiAKPiAKPiBCZXN0IHJlZ2FyZHMsCj4gS3J6eXN6dG9m
CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgt
cmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDov
L2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
