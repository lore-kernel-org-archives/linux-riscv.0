Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D356BE7718D
	for <linux-riscv@archiver.kernel.org>; Tue, 24 Dec 2024 08:54:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/Xch+OLmk4BMgbklZ9B/0VzdB3e2M5wNhyVZqoB/OqQ=; b=X79xSbYV7VdDmO
	8oPy9dZJUw0cY9M3H4qTFMH9QhtFmi6zH/WPd660ehVGWnLofzKFuNomPMGd/lvZZZ4sqoUGXpmde
	n1nf2EhjEx2CegmJheFad3fGM+YUesIu6y/BRQYCMnarR3P6E+5BshZP1b2mxvxxAjUFXm+6T2wE1
	UX5IBsPyaiZe4eqkHZaRdtu7FL8MIWbWZ4rtCPm4u2ajfr43nQFMAawuURueDUNDs85foCMsa6cxb
	KS6LSD5X0ZBCMdAboca9XOFUyrrd3WOBvPVrOxkq9zH2AP3nGIB51Qm/vVsQxRW3q0P1zeOhLT0a1
	xD6qqIA1XNAU8OjLbEIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tQ0fx-0000000BXVT-3isi;
	Tue, 24 Dec 2024 08:54:01 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tQ0fg-0000000BXRQ-1jco
	for linux-riscv@lists.infradead.org;
	Tue, 24 Dec 2024 08:53:45 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 1FF535C5D98;
	Tue, 24 Dec 2024 08:53:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E809EC4CED6;
	Tue, 24 Dec 2024 08:53:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1735030423;
	bh=oyUzWxScHY5JktUj76SAcLkQhUMTi1JD+++R1xKImUM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=l7KL2Pd1eMbG7+IT5VzXzp8TwyhFDFBcm23dLtuEz+116n5GY9T5D7jFK0D+erV4/
	 veBzuVbQU42IOdqMG0K3gJhluGz+D3/zi7a5PWcNqaB05v5N9+V/xzK8xbsWC+yVv/
	 rjeRu+DpmOi95fF1JUHmGhuefWos3vvEjkkqJKssLscFggqVdixexfdYHiSC1BEN1t
	 hNa1F7AACRErlNXOJ+X9cWYgZ9RumXmVJ68gq58V5MOZzOdu2vrfCBPYeJi2/vzzyQ
	 k+qqyyyk4N612rDQJEKvdPm7Ppzi+jO6ABhJOuFpyMInHhPtIGo5cs1KvT8tcqVz09
	 HQ1RMLWnIt/+w==
Date: Tue, 24 Dec 2024 09:53:41 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Stephen Boyd <sboyd@kernel.org>
Cc: Michal Wilczynski <m.wilczynski@samsung.com>, airlied@gmail.com, 
	aou@eecs.berkeley.edu, conor+dt@kernel.org, drew@pdp7.com, frank.binns@imgtec.com, 
	guoren@kernel.org, jassisinghbrar@gmail.com, jszhang@kernel.org, krzk+dt@kernel.org, 
	m.szyprowski@samsung.com, maarten.lankhorst@linux.intel.com, matt.coster@imgtec.com, 
	mripard@kernel.org, mturquette@baylibre.com, p.zabel@pengutronix.de, 
	palmer@dabbelt.com, paul.walmsley@sifive.com, robh@kernel.org, simona@ffwll.ch, 
	tzimmermann@suse.de, ulf.hansson@linaro.org, wefu@redhat.com, 
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org, dri-devel@lists.freedesktop.org, linux-pm@vger.kernel.org
Subject: Re: [RFC PATCH v2 01/19] dt-bindings: clock: Add VO subsystem clocks
 and update address requirements
Message-ID: <wjet4yvtcobjaf7c4u7to6rm3ppkvmgyitp6evoqjpndtno6qg@h5xxyukph6y6>
References: <20241223125553.3527812-1-m.wilczynski@samsung.com>
 <CGME20241223125601eucas1p1d274193122638075dc65310a22616bae@eucas1p1.samsung.com>
 <20241223125553.3527812-2-m.wilczynski@samsung.com>
 <2cd0c34fbd14a0d69e689d04c2241938.sboyd@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <2cd0c34fbd14a0d69e689d04c2241938.sboyd@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241224_005344_550561_08BE8645 
X-CRM114-Status: GOOD (  17.12  )
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

T24gTW9uLCBEZWMgMjMsIDIwMjQgYXQgMTI6NTA6NTlQTSAtMDgwMCwgU3RlcGhlbiBCb3lkIHdy
b3RlOgo+IFF1b3RpbmcgTWljaGFsIFdpbGN6eW5za2kgKDIwMjQtMTItMjMgMDQ6NTU6MzUpCj4g
PiBUaGUgVC1IZWFkIFRIMTUyMCBTb0PigJlzIEFQIGNsb2NrIGNvbnRyb2xsZXIgbm93IG5lZWRz
IHR3byBhZGRyZXNzIHJhbmdlcwo+ID4gdG8gbWFuYWdlIGJvdGggdGhlIEFwcGxpY2F0aW9uIFBy
b2Nlc3NvciAoQVApIGFuZCBWaWRlbyBPdXRwdXQgKFZPKQo+ID4gc3Vic3lzdGVtIGNsb2Nrcy4g
VXBkYXRlIHRoZSBkZXZpY2UgdHJlZSBiaW5kaW5ncyB0byByZXF1aXJlIHR3byBgcmVnYAo+ID4g
ZW50cmllcywgb25lIGZvciB0aGUgQVAgY2xvY2tzIGFuZCBvbmUgZm9yIHRoZSBWTyBjbG9ja3Mu
Cj4gPiAKPiA+IEFkZGl0aW9uYWxseSwgaW50cm9kdWNlIG5ldyBWTyBzdWJzeXN0ZW0gY2xvY2sg
Y29uc3RhbnRzIGluIHRoZSBoZWFkZXIKPiA+IGZpbGUuIFRoZXNlIGNvbnN0YW50cyB3aWxsIGJl
IHVzZWQgYnkgdGhlIGRyaXZlciB0byBjb250cm9sIFZPLXJlbGF0ZWQKPiA+IGNvbXBvbmVudHMg
c3VjaCBhcyBkaXNwbGF5IGFuZCBncmFwaGljcyB1bml0cy4KPiA+IAo+ID4gU2lnbmVkLW9mZi1i
eTogTWljaGFsIFdpbGN6eW5za2kgPG0ud2lsY3p5bnNraUBzYW1zdW5nLmNvbT4KPiA+IC0tLQo+
IFsuLi5dCj4gPiBkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdz
L2Nsb2NrL3RoZWFkLHRoMTUyMC1jbGstYXAueWFtbCBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJl
ZS9iaW5kaW5ncy9jbG9jay90aGVhZCx0aDE1MjAtY2xrLWFwLnlhbWwKPiA+IGluZGV4IDAxMjli
ZDBiYTRiMy4uZjBkZjk3YTQ1MGVmIDEwMDY0NAo+ID4gLS0tIGEvRG9jdW1lbnRhdGlvbi9kZXZp
Y2V0cmVlL2JpbmRpbmdzL2Nsb2NrL3RoZWFkLHRoMTUyMC1jbGstYXAueWFtbAo+ID4gKysrIGIv
RG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Nsb2NrL3RoZWFkLHRoMTUyMC1jbGst
YXAueWFtbAo+ID4gQEAgLTQ3LDcgKzU0LDkgQEAgZXhhbXBsZXM6Cj4gPiAgICAgICNpbmNsdWRl
IDxkdC1iaW5kaW5ncy9jbG9jay90aGVhZCx0aDE1MjAtY2xrLWFwLmg+Cj4gPiAgICAgIGNsb2Nr
LWNvbnRyb2xsZXJAZWYwMTAwMDAgewo+ID4gICAgICAgICAgY29tcGF0aWJsZSA9ICJ0aGVhZCx0
aDE1MjAtY2xrLWFwIjsKPiA+IC0gICAgICAgIHJlZyA9IDwweGVmMDEwMDAwIDB4MTAwMD47Cj4g
PiArICAgICAgICByZWcgPSA8MHhlZjAxMDAwMCAweDEwMDA+LAo+ID4gKyAgICAgICAgICAgICAg
PDB4ZmYwMTAwMDAgMHgxMDAwPjsKPiAKPiBJIGRvbid0IGdldCBpdC4gV2h5IG5vdCBoYXZlIHR3
byBub2RlcyBhbmQgdHdvIGRldmljZXM/IFRoZXkgaGF2ZQo+IGRpZmZlcmVudCByZWdpc3RlciBy
ZWdpb25zIHNvIGxpa2VseSB0aGV5J3JlIGRpZmZlcmVudCBkZXZpY2VzIG9uIHRoZQo+IGludGVy
bmFsIFNvQyBidXMuIFRoZXkgbWF5IGhhdmUgdGhlIHNhbWUgaW5wdXQgY2xrcywgYnV0IG90aGVy
d2lzZSBJCj4gZG9uJ3Qgc2VlIGhvdyB0aGV5J3JlIHRoZSBzYW1lIG5vZGUuCgpUaGF0J3MgYSBn
b29kIHBvaW50LiBBcmVuJ3QgaGVyZSBzaW1wbHkgdHdvIGRpZmZlcmVudCBjbG9jayBjb250cm9s
bGVycz8KCkJlc3QgcmVnYXJkcywKS3J6eXN6dG9mCgoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJp
c2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1h
bi9saXN0aW5mby9saW51eC1yaXNjdgo=
