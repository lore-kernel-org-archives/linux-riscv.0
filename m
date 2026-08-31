Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AAE8FC61DFD
	for <linux-riscv@archiver.kernel.org>; Mon, 31 Aug 2026 09:14:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:From:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vX2g4HexfOnA5VfV802Xm+vMN9qobkj7DBmaz9Xh1Wk=; b=0wYear/irUluat
	MvnlqqcS2eoq3qek2nQsEBkcXrFZ33JzRx0uSp7FS7s0TUESK/iX9l3CX9F8fOQP4uDdb2TAJjEXq
	RG+yCFIQEL3a/YR891D2Il4sAj4OnMLbaQzJKeL0mhnmw0qPw4mPtj9fSdBMhBKUtJxG+XSSh+4oM
	aHhdZEEOITqe8g61zZ8k+N38zVkuEevGIX9kquZtLrFacBDUTpeZNMCpBKymvljn3rjC/3SOJ4sml
	goBxjbzpMSnyXuKGXE0ao1DqdopqviSMyV9+M5U+r5tq7wjjWI/gonL5RSxq2hVm6Xeq2LTTx3R/5
	4JBa00f4FkMOsmZ0uojw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x0y6I-00000008zui-3FBL;
	Mon, 31 Aug 2026 09:14:46 +0000
Received: from mailout2.w1.samsung.com ([210.118.77.12])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x0y6B-00000008zsY-3j2Q;
	Mon, 31 Aug 2026 09:14:45 +0000
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
	by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20260831091434euoutp029e0b5101b7efbc915a7572eadc0d73b4~Q2QaCPr-v3238632386euoutp02Q;
	Mon, 31 Aug 2026 09:14:34 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20260831091434euoutp029e0b5101b7efbc915a7572eadc0d73b4~Q2QaCPr-v3238632386euoutp02Q
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1788167674;
	bh=iLiAq5/KXSZI20h/rvdNaMKqZ9O3JX0YW/+nEYN+91k=;
	h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
	b=GZlabUyLsSW1C+25w+YhKO0MhPsPRtcYDMi07WTWCTQB3lpOuCDqFZXCQM14Ptsy7
	 TQSbjifeKM68XGtE0BuiOvNLOGCIxiLi+05e3Qnw0OIEva0KuRDANQ/xLyBi4anlm5
	 OmzbdjUJch0CuyvtbCd1SvGFINoXJllFhKXXVFfY=
Received: from eusmtip2.samsung.com (unknown [203.254.199.222]) by
	eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
	20260831091433eucas1p2176fd27eb0eefa971ac954c8ee5c2bd2~Q2QZPHCRf1671916719eucas1p2r;
	Mon, 31 Aug 2026 09:14:33 +0000 (GMT)
Received: from [192.168.1.44] (unknown [106.210.136.40]) by
	eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20260831091431eusmtip24699d34b786382bf1394417845ac07c5~Q2QXht9KL2368923689eusmtip2b;
	Mon, 31 Aug 2026 09:14:31 +0000 (GMT)
Message-ID: <f93b13d4-d6f1-4e75-9fce-926fb0129dca@samsung.com>
Date: Mon, 31 Aug 2026 11:14:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 15/15] MAINTAINERS: Add StarFive JH7110 display
 subsystem entry
To: Icenowy Zheng <uwu@icenowy.me>, Vinod Koul <vkoul@kernel.org>, Neil
	Armstrong <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>, Andrzej Hajda <andrzej.hajda@intel.com>, Robert Foss
	<rfoss@kernel.org>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>, David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>, Maarten Lankhorst
	<maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>, Lee Jones <lee@kernel.org>, Andy
	Yan <andy.yan@rock-chips.com>, Philipp Zabel <p.zabel@pengutronix.de>, Emil
	Renner Berthing <kernel@esmil.dk>, Hal Feng <hal.feng@starfivetech.com>,
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
	<sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>, Heiko Stuebner
	<heiko@sntech.de>, Conor Dooley <conor@kernel.org>, Paul Walmsley
	<pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
	<aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, Dominique
	Belhachemi <db@domibel.de>
Cc: linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
	mfd@lists.linux.dev, linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
	linux-riscv@lists.infradead.org, Andy Yan <andyshrk@163.com>, Marek
	Szyprowski <m.szyprowski@samsung.com>, Maud Spierings
	<maudspierings@gocontroll.com>, Graham Markall <hello@big-grey.co.uk>
Content-Language: en-US
From: Michal Wilczynski <m.wilczynski@samsung.com>
In-Reply-To: <d64ff3f2a03473e4263e2f68823c2cb0f7fd1599.camel@icenowy.me>
X-CMS-MailID: 20260831091433eucas1p2176fd27eb0eefa971ac954c8ee5c2bd2
X-Msg-Generator: CA
X-RootMTR: 20260828134841eucas1p100590973cc6808103c41d0b0fc82573a
X-EPHeader: CA
X-CMS-RootMailID: 20260828134841eucas1p100590973cc6808103c41d0b0fc82573a
References: <20260828-jh7110-clean-send-v2-0-331680c8b9d1@samsung.com>
	<CGME20260828134841eucas1p100590973cc6808103c41d0b0fc82573a@eucas1p1.samsung.com>
	<20260828-jh7110-clean-send-v2-15-331680c8b9d1@samsung.com>
	<d64ff3f2a03473e4263e2f68823c2cb0f7fd1599.camel@icenowy.me>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260831_021440_513265_D6B6E4F7 
X-CRM114-Status: GOOD (  11.59  )
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

CgpPbiA4LzI4LzI2IDE2OjAxLCBJY2Vub3d5IFpoZW5nIHdyb3RlOgo+IOWcqCAyMDI2LTA4LTI4
5LqU55qEIDE1OjQ3ICswMjAw77yMTWljaGFsIFdpbGN6eW5za2nlhpnpgZPvvJoKPj4gVGhlIEpI
NzExMCBkaXNwbGF5IHN1YnN5c3RlbSBzcGFucyBhIFBIWSBkcml2ZXIsIGEgRFJNIGJyaWRnZSBk
cml2ZXIsCj4+IGEgcGFyZW50IGRldmljZSBhbmQgdGhlaXIgYmluZGluZ3MsIGFuZCBoYXMgbm8g
ZXhpc3RpbmcgbWFpbnRhaW5lcgo+PiBlbnRyeS4KPj4KPj4gQWRkIGFuIGVudHJ5IGNvdmVyaW5n
IHRoZW0gc28gcGF0Y2hlcyByZWFjaCBzb21lb25lIHdobyBjYW4gcmV2aWV3Cj4+IHRoZW0uCj4+
Cj4+IFNpZ25lZC1vZmYtYnk6IE1pY2hhbCBXaWxjenluc2tpIDxtLndpbGN6eW5za2lAc2Ftc3Vu
Zy5jb20+Cj4+IC0tLQo+PiAgTUFJTlRBSU5FUlMgfCAxMCArKysrKysrKysrCj4+ICAxIGZpbGUg
Y2hhbmdlZCwgMTAgaW5zZXJ0aW9ucygrKQo+Pgo+PiBkaWZmIC0tZ2l0IGEvTUFJTlRBSU5FUlMg
Yi9NQUlOVEFJTkVSUwo+PiBpbmRleAo+PiA4MDE0YjlmODI1M2VkZjE1MjMxZGYyMTVkMWIxNDA2
M2E1NGE1NWVjLi44NGFjNWNmZTYxY2RmNzc1MTY3Y2Y5MDMzODYKPj4gMjcyNGMzNzk0NmE1ZiAx
MDA2NDQKPj4gLS0tIGEvTUFJTlRBSU5FUlMKPj4gKysrIGIvTUFJTlRBSU5FUlMKPj4gQEAgLTI1
Nzc4LDYgKzI1Nzc4LDE2IEBAIFM6CU1haW50YWluZWQKPj4gIEY6CURvY3VtZW50YXRpb24vZGV2
aWNldHJlZS9iaW5kaW5ncy9uZXQvc3RhcmZpdmUsamg3MTEwLQo+PiBkd21hYy55YW1sCj4+ICBG
Oglkcml2ZXJzL25ldC9ldGhlcm5ldC9zdG1pY3JvL3N0bW1hYy9kd21hYy1zdGFyZml2ZS5jCj4+
ICAKPj4gK1NUQVJGSVZFIEpINzExMCBESVNQTEFZIFNVQlNZU1RFTQo+PiArTToJTWljaGFsIFdp
bGN6eW5za2kgPG0ud2lsY3p5bnNraUBzYW1zdW5nLmNvbT4KPiAKPiBGZWVsIGZyZWUgdG8gYWRk
Cj4gCj4gYGBgCj4gUjogSWNlbm93eSBaaGVuZyA8emhlbmd4aW5nZGFAaXNjYXMuYWMuY24+Cj4g
YGBgCj4gCj4gaWYgeW91IHdhbnQuIEkgYW0gaW50ZXJlc3RlZCBpbiB0aGlzLgoKU3VyZSwgYWxs
IGhlbHAgaXMgZ3JlYXRseSBhcHByZWNpYXRlZCAhCgpCZXN0IHJlZ2FyZHMsCi0tIApNaWNoYWwg
V2lsY3p5bnNraSA8bS53aWxjenluc2tpQHNhbXN1bmcuY29tPgoKPiAKPiBUaGFua3MsCj4gSWNl
bm93eQo+IAo+PiArUzoJTWFpbnRhaW5lZAo+PiArRjoJRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVl
L2JpbmRpbmdzL2Rpc3BsYXkvYnJpZGdlL3N0YXJmaXZlLGpoCj4+IDcxMTAtaW5uby1oZG1pLWNv
bnRyb2xsZXIueWFtbAo+PiArRjoJRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL21m
ZC9zdGFyZml2ZSxqaDcxMTAtaGRtaS0KPj4gc3Vic3lzdGVtLnlhbWwKPj4gK0Y6CURvY3VtZW50
YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9waHkvc3RhcmZpdmUsamg3MTEwLWlubm8tCj4+IGhk
bWktcGh5LnlhbWwKPj4gK0Y6CWRyaXZlcnMvZ3B1L2RybS9icmlkZ2Uvamg3MTEwLWlubm8taGRt
aS5jCj4+ICtGOglkcml2ZXJzL3BoeS9zdGFyZml2ZS9waHktamg3MTEwLWlubm8taGRtaS5jCj4+
ICtGOglkcml2ZXJzL3NvYy9zdGFyZml2ZS9qaDcxMTAtaGRtaS1zdWJzeXN0ZW0uYwo+PiArCj4+
ICBTVEFSRklWRSBKSDcxMTAgRFBIWSBSWCBEUklWRVIKPj4gIE06CUphY2sgWmh1IDxqYWNrLnpo
dUBzdGFyZml2ZXRlY2guY29tPgo+PiAgTToJQ2hhbmdodWFuZyBMaWFuZyA8Y2hhbmdodWFuZy5s
aWFuZ0BzdGFyZml2ZXRlY2guY29tPgo+IAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBs
aXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlz
dGluZm8vbGludXgtcmlzY3YK
