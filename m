Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94546E7718B
	for <linux-riscv@archiver.kernel.org>; Mon, 23 Dec 2024 20:51:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:To:Cc:From:Subject:References:
	In-Reply-To:MIME-Version:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IWCOtYoh9pK8NzXpY9+PN3DbL1mYpYxr8TNa7McnT3I=; b=w5jZxRY0c9M2x+
	QNRV8W10m/FDCq9flc85bZ3ZSqvtzvbV3moKOonpwcB+qqE9r2vUxQmRE0JG5jDu5seDG6V2DCdGt
	T1Ug0H4sbzD01KYT6mHeW++SakjxJi93yuTPogDfFLHkCQf+LoEYz5o0kCFFPmTNeZatXpK4ClT9I
	e9FXDhwoR3l2cnoxOdy5lyQg1a1LpX9TgZEBYDFUTsAE2N+xaYu75B3RGxS/qLlckjgz//vswXCWp
	WsH2TT3IjsG2BVcUanlJls/m2wrTgniv8hRRIM8LpjutDeELnC5Gm3p7MQ1c5ca4gMX7DIhiHTRbH
	5WeoYID+z5EdMKdm8AMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tPpOP-0000000AjIA-1hWN;
	Mon, 23 Dec 2024 20:51:09 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tPpOJ-0000000AjHR-2ZBz
	for linux-riscv@lists.infradead.org;
	Mon, 23 Dec 2024 20:51:08 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 6B07E5C5BAE;
	Mon, 23 Dec 2024 20:50:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C4109C4CED3;
	Mon, 23 Dec 2024 20:51:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734987061;
	bh=7vXp6bg3mIjFXJtB/znIi7nXzs2VzEStHvDISKqmwas=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=sSOCwWnLvbLB7dADE52q5aALdUxvb09wMkoarI/KHYD6xnMZCS9HA0QgYGvJeVPvC
	 4jT9A4kyA/stK3cZITP0N3WB1YFxk0FDAs2fglyqg3HwQK2tV727ewQ4MGed2Rg4RY
	 btCD6CqdOm2cdAUrdryVpUklmsJXvW4awF0LN6dV2FgK7dQwxof3qdeH93xKvie8NL
	 XBizgv1/9TFlJ9Ws9wiSeJQJ3aCRcOoLRUA2103q171a3ojEi8sinaB6XYqOKxk8aq
	 QmuXfwf5aH893lR84Uqqq742Wfkw5Wq/EEYRZkMhxFQShUQ2o1xHQK7eYNc6X8xB8u
	 ds4jlVT/frsPg==
Message-ID: <2cd0c34fbd14a0d69e689d04c2241938.sboyd@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20241223125553.3527812-2-m.wilczynski@samsung.com>
References: <20241223125553.3527812-1-m.wilczynski@samsung.com> <CGME20241223125601eucas1p1d274193122638075dc65310a22616bae@eucas1p1.samsung.com> <20241223125553.3527812-2-m.wilczynski@samsung.com>
Subject: Re: [RFC PATCH v2 01/19] dt-bindings: clock: Add VO subsystem clocks and update address requirements
From: Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, dri-devel@lists.freedesktop.org, linux-pm@vger.kernel.org, Michal Wilczynski <m.wilczynski@samsung.com>
To: Michal Wilczynski <m.wilczynski@samsung.com>, airlied@gmail.com, aou@eecs.berkeley.edu, conor+dt@kernel.org, drew@pdp7.com, frank.binns@imgtec.com, guoren@kernel.org, jassisinghbrar@gmail.com, jszhang@kernel.org, krzk+dt@kernel.org, m.szyprowski@samsung.com, maarten.lankhorst@linux.intel.com, matt.coster@imgtec.com, mripard@kernel.org, mturquette@baylibre.com, p.zabel@pengutronix.de, palmer@dabbelt.com, paul.walmsley@sifive.com, robh@kernel.org, simona@ffwll.ch, tzimmermann@suse.de, ulf.hansson@linaro.org, wefu@redhat.com
Date: Mon, 23 Dec 2024 12:50:59 -0800
User-Agent: alot/0.12.dev1+gaa8c22fdeedb
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241223_125103_700231_23286F5B 
X-CRM114-Status: GOOD (  13.45  )
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

UXVvdGluZyBNaWNoYWwgV2lsY3p5bnNraSAoMjAyNC0xMi0yMyAwNDo1NTozNSkKPiBUaGUgVC1I
ZWFkIFRIMTUyMCBTb0PigJlzIEFQIGNsb2NrIGNvbnRyb2xsZXIgbm93IG5lZWRzIHR3byBhZGRy
ZXNzIHJhbmdlcwo+IHRvIG1hbmFnZSBib3RoIHRoZSBBcHBsaWNhdGlvbiBQcm9jZXNzb3IgKEFQ
KSBhbmQgVmlkZW8gT3V0cHV0IChWTykKPiBzdWJzeXN0ZW0gY2xvY2tzLiBVcGRhdGUgdGhlIGRl
dmljZSB0cmVlIGJpbmRpbmdzIHRvIHJlcXVpcmUgdHdvIGByZWdgCj4gZW50cmllcywgb25lIGZv
ciB0aGUgQVAgY2xvY2tzIGFuZCBvbmUgZm9yIHRoZSBWTyBjbG9ja3MuCj4gCj4gQWRkaXRpb25h
bGx5LCBpbnRyb2R1Y2UgbmV3IFZPIHN1YnN5c3RlbSBjbG9jayBjb25zdGFudHMgaW4gdGhlIGhl
YWRlcgo+IGZpbGUuIFRoZXNlIGNvbnN0YW50cyB3aWxsIGJlIHVzZWQgYnkgdGhlIGRyaXZlciB0
byBjb250cm9sIFZPLXJlbGF0ZWQKPiBjb21wb25lbnRzIHN1Y2ggYXMgZGlzcGxheSBhbmQgZ3Jh
cGhpY3MgdW5pdHMuCj4gCj4gU2lnbmVkLW9mZi1ieTogTWljaGFsIFdpbGN6eW5za2kgPG0ud2ls
Y3p5bnNraUBzYW1zdW5nLmNvbT4KPiAtLS0KWy4uLl0KPiBkaWZmIC0tZ2l0IGEvRG9jdW1lbnRh
dGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Nsb2NrL3RoZWFkLHRoMTUyMC1jbGstYXAueWFtbCBi
L0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9jbG9jay90aGVhZCx0aDE1MjAtY2xr
LWFwLnlhbWwKPiBpbmRleCAwMTI5YmQwYmE0YjMuLmYwZGY5N2E0NTBlZiAxMDA2NDQKPiAtLS0g
YS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvY2xvY2svdGhlYWQsdGgxNTIwLWNs
ay1hcC55YW1sCj4gKysrIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Nsb2Nr
L3RoZWFkLHRoMTUyMC1jbGstYXAueWFtbAo+IEBAIC00Nyw3ICs1NCw5IEBAIGV4YW1wbGVzOgo+
ICAgICAgI2luY2x1ZGUgPGR0LWJpbmRpbmdzL2Nsb2NrL3RoZWFkLHRoMTUyMC1jbGstYXAuaD4K
PiAgICAgIGNsb2NrLWNvbnRyb2xsZXJAZWYwMTAwMDAgewo+ICAgICAgICAgIGNvbXBhdGlibGUg
PSAidGhlYWQsdGgxNTIwLWNsay1hcCI7Cj4gLSAgICAgICAgcmVnID0gPDB4ZWYwMTAwMDAgMHgx
MDAwPjsKPiArICAgICAgICByZWcgPSA8MHhlZjAxMDAwMCAweDEwMDA+LAo+ICsgICAgICAgICAg
ICAgIDwweGZmMDEwMDAwIDB4MTAwMD47CgpJIGRvbid0IGdldCBpdC4gV2h5IG5vdCBoYXZlIHR3
byBub2RlcyBhbmQgdHdvIGRldmljZXM/IFRoZXkgaGF2ZQpkaWZmZXJlbnQgcmVnaXN0ZXIgcmVn
aW9ucyBzbyBsaWtlbHkgdGhleSdyZSBkaWZmZXJlbnQgZGV2aWNlcyBvbiB0aGUKaW50ZXJuYWwg
U29DIGJ1cy4gVGhleSBtYXkgaGF2ZSB0aGUgc2FtZSBpbnB1dCBjbGtzLCBidXQgb3RoZXJ3aXNl
IEkKZG9uJ3Qgc2VlIGhvdyB0aGV5J3JlIHRoZSBzYW1lIG5vZGUuCgo+ICsgICAgICAgIHJlZy1u
YW1lcyA9ICJhcC1jbGtzIiwgInZvLWNsa3MiOwo+ICAgICAgICAgIGNsb2NrcyA9IDwmb3NjPjsK
PiAgICAgICAgICAjY2xvY2stY2VsbHMgPSA8MT47Cj4gICAgICB9OwoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0
CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5v
cmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
