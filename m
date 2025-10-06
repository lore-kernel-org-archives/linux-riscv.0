Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC794CAC5B8
	for <linux-riscv@archiver.kernel.org>; Mon,  6 Oct 2025 16:34:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tgxS1Nwn5pyHKevNtQ10vGtuXK0yMAQPROVrbvLvWdo=; b=fmGQITJp+dKzsW
	1f5QbVSPd1vY1XqeesqSvU/vufQuDZag1UfAEbak0TA7V3GVm+CSq6DCKdpVePIzX2lCihQ8b6qxm
	rWWMnWrHC7szgcbpYMDUhU+p8QOTA1UQq1IixiN97NZyf+O9d+DotZu0vNRPGEr0wt0RHGOYD+0Mu
	zF8QZSfJnHxAFJJlyaCPjIe0DIgvNjE7B5+i1ITqnKcehLN52zh0xJt+b2jbEqEwqRwmD+nWN0olG
	tY2/G3+avqL4AYHejPTtBYwvsPxDDIKC3shWwOduZPBUAuKwmlCAnSmjWBamRqdfzPgSpBW1Y9Eh3
	SDJnJhewgg5d9P67i5OA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v5oA2-00000000Ph5-0DqF;
	Mon, 06 Oct 2025 16:34:06 +0000
Received: from sender4-op-o15.zoho.com ([136.143.188.15])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v5oA0-00000000Pgh-1m84
	for linux-riscv@lists.infradead.org;
	Mon, 06 Oct 2025 16:34:05 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1759768404; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=cg8w3Yx8IggkB+zBhluhjMbMmUsvUcFTp8sS3UkaQyPYCI+kKozce/VxlfQIH2kNKZz+W0TluZmqZOpSaXRnxQ1cOJ+yTbkxSfzRBBXWK7yKp4QCfWtFhM78+uyDIvTeyLvbj/29T87jf7C50Lzs89v25R4fVUL1Zt1jFDtjdHM=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1759768404; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=j89+y91SMmY2hlRzBk7eDWdVkd7Zq8mu43vpMSD6zW4=; 
	b=OKZEpyRFbGh8q0dvfbB6gCs7d7Vv6TvpHKJTBq+scm1/FFn8ekZ3oBgww6Tj/9vsZYaLUX+J5ORw2je/Hbe9WmstHKtyUQhpA691sUYrAFmWGaCkO1wQFo5wRqRWOsm/ngVNOWtfN10LdPDfEjnfwdZ28oQg+xm0Qps0SKF0uHM=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=icenowy.me;
	spf=pass  smtp.mailfrom=uwu@icenowy.me;
	dmarc=pass header.from=<uwu@icenowy.me>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1759768404;
	s=zmail2; d=icenowy.me; i=uwu@icenowy.me;
	h=Message-ID:Subject:Subject:From:From:To:To:Cc:Cc:Date:Date:In-Reply-To:References:Content-Type:Content-Transfer-Encoding:MIME-Version:Message-Id:Reply-To;
	bh=j89+y91SMmY2hlRzBk7eDWdVkd7Zq8mu43vpMSD6zW4=;
	b=ZxUUdVw5ekZSbUQcOuicx0i81q5Ne2CN2GTkN+P9+TzORpuUWT48oYwY2qN3n94D
	NcaPbfAOo1GJ1ROqgWm2oXT4ScJIuTwwGfYIVdUeTdyWAT3i3zgO0hg0BHNP0W5xJ6u
	/iHwUj/UL1EtopJU9rpHyD7F403dOU4zyMjHpdppeZpt1fBST16KibUP+C29P59aY66
	tUWF3wUtxCJar/Vz3YdCjqiuwPMibhErxftYJkse8jhGBp4fNBkccmNlPLudBVq9Og4
	kyzbOaiIFCclZUOKKinsM2ZhcnNft0fz8xkk7N+UTQgkki+ficqGLYE0+kWNopyrpUa
	77Vtb0vN1g==
Received: by mx.zohomail.com with SMTPS id 1759768399312157.2926223095094;
	Mon, 6 Oct 2025 09:33:19 -0700 (PDT)
Message-ID: <c7d79542aedb6c074c4be21eaa15c71a53e87da4.camel@icenowy.me>
Subject: Re: [PATCH v2 2/8] dt-bindings: display: add verisilicon,dc
From: Icenowy Zheng <uwu@icenowy.me>
To: Christian Gmeiner <christian.gmeiner@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Lucas Stach <l.stach@pengutronix.de>, 
 Russell King <linux+etnaviv@armlinux.org.uk>, moderated for non-subscribers
 <etnaviv@lists.freedesktop.org>,  Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Drew Fustini <fustini@kernel.org>, Guo
 Ren <guoren@kernel.org>, Fu Wei <wefu@redhat.com>, Philipp Zabel
 <p.zabel@pengutronix.de>, Heiko Stuebner <heiko@sntech.de>, Andrzej Hajda
 <andrzej.hajda@intel.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
 Robert Foss <rfoss@kernel.org>, Laurent Pinchart
 <Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Michal Wilczynski
 <m.wilczynski@samsung.com>, Han Gao <rabenda.cn@gmail.com>, Yao Zi
 <ziyao@disroot.org>, dri-devel@lists.freedesktop.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-riscv@lists.infradead.org
Date: Tue, 07 Oct 2025 00:33:06 +0800
In-Reply-To: <84566b33d0d08ad070c3aa8a01e07f3a0e3bff50.camel@icenowy.me>
References: <20250921083446.790374-1-uwu@icenowy.me>
	 <20250921083446.790374-3-uwu@icenowy.me>
	 <20250922204349.GA1290045-robh@kernel.org>
	 <1ac8c72206abf9f3e0a13e1fcf44be5c605f6372.camel@icenowy.me>
	 <36040a0a40311cb1e871075f0c5ad175342ed5db.camel@icenowy.me>
	 <CAH9NwWdx-Ut35RvhmNsdQbC4vfm3rH1VPN7H2uDBRsmsFjZU_Q@mail.gmail.com>
	 <84566b33d0d08ad070c3aa8a01e07f3a0e3bff50.camel@icenowy.me>
Organization: Anthon Open-Source Community
User-Agent: Evolution 3.44.4 
MIME-Version: 1.0
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251006_093404_478022_21DD48C1 
X-CRM114-Status: GOOD (  37.26  )
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

5ZyoIDIwMjUtMDktMjXmmJ/mnJ/lm5vnmoQgMTM6NTcgKzA4MDDvvIxJY2Vub3d5IFpoZW5n5YaZ
6YGT77yaCj4g5ZyoIDIwMjUtMDktMjTmmJ/mnJ/kuInnmoQgMjA6MTUgKzAyMDDvvIxDaHJpc3Rp
YW4gR21laW5lcuWGmemBk++8mgo+ID4gPiA+ID4gPiBWZXJpc2lsaWNvbiBoYXMgYSBzZXJpZXMg
b2YgZGlzcGxheSBjb250cm9sbGVycyBwcmVmaXhlZAo+ID4gPiA+ID4gPiB3aXRoCj4gPiA+ID4g
PiA+IERDCj4gPiA+ID4gPiA+IGFuZAo+ID4gPiA+ID4gPiB3aXRoIHNlbGYtaWRlbnRpZmljYXRp
b24gZmFjaWxpdHkgbGlrZSB0aGVpciBHQyBzZXJpZXMKPiA+ID4gPiA+ID4gR1BVcy4KPiA+ID4g
PiA+ID4gCj4gPiA+ID4gPiA+IEFkZCBhIGRldmljZSB0cmVlIGJpbmRpbmcgZm9yIGl0Lgo+ID4g
PiA+ID4gPiAKPiA+ID4gPiA+ID4gRGVwZW5kcyBvbiB0aGUgc3BlY2lmaWMgREMgbW9kZWwsIGl0
IGNhbiBoYXZlIGVpdGhlciBvbmUgb3IKPiA+ID4gPiA+ID4gdHdvCj4gPiA+ID4gPiA+IGRpc3Bs
YXkKPiA+ID4gPiA+ID4gb3V0cHV0cywgYW5kIGVhY2ggZGlzcGxheSBvdXRwdXQgY291bGQgYmUg
c2V0IHRvIERQSSBzaWduYWwKPiA+ID4gPiA+ID4gb3IKPiA+ID4gPiA+ID4gIkRQIgo+ID4gPiA+
ID4gPiBzaWduYWwgKHdoaWNoIHNlZW1zIHRvIGJlIHNvbWUgcGxhaW4gcGFyYWxsZWwgYnVzIHRv
IEhETUkKPiA+ID4gPiA+ID4gY29udHJvbGxlcnMpLgo+ID4gPiA+ID4gPiAKPiA+ID4gPiA+ID4g
U2lnbmVkLW9mZi1ieTogSWNlbm93eSBaaGVuZyA8dXd1QGljZW5vd3kubWU+Cj4gPiA+ID4gPiA+
IC0tLQo+ID4gPiA+ID4gPiBDaGFuZ2VzIGluIHYyOgo+ID4gPiA+ID4gPiAtIEZpeGVkIG1pc3Nw
ZWx0ICJ2ZXJzaWxpY29uIiBpbiB0aXRsZS4KPiA+ID4gPiA+ID4gLSBNb3ZlZCBtaW5JdGVtcyBp
biBjbG9jayBwcm9wZXJ0aWVzIHRvIGJlIGVhcmxpZXIgdGhhbgo+ID4gPiA+ID4gPiBpdGVtcy4K
PiA+ID4gPiA+ID4gLSBSZS1hbGlnbmVkIG11bHRpLWxpbmUgY2xvY2tzIGFuZCByZXNldHMgaW4g
ZXhhbXBsZS4KPiA+ID4gPiA+ID4gCj4gPiA+ID4gPiA+IMKgLi4uL2JpbmRpbmdzL2Rpc3BsYXkv
dmVyaXNpbGljb24sZGMueWFtbMKgwqDCoMKgwqAgfCAxMjcKPiA+ID4gPiA+ID4gKysrKysrKysr
KysrKysrKysrCj4gPiA+ID4gPiA+IMKgMSBmaWxlIGNoYW5nZWQsIDEyNyBpbnNlcnRpb25zKCsp
Cj4gPiA+ID4gPiA+IMKgY3JlYXRlIG1vZGUgMTAwNjQ0Cj4gPiA+ID4gPiA+IERvY3VtZW50YXRp
b24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L3ZlcmlzaWxpY29uLGRjLnlhCj4gPiA+ID4g
PiA+IG1sCj4gPiA+ID4gPiA+IAo+ID4gPiA+ID4gPiBkaWZmIC0tZ2l0Cj4gPiA+ID4gPiA+IGEv
RG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvdmVyaXNpbGljb24sZGMu
Cj4gPiA+ID4gPiA+IHlhCj4gPiA+ID4gPiA+IG1sCj4gPiA+ID4gPiA+IGIvRG9jdW1lbnRhdGlv
bi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvdmVyaXNpbGljb24sZGMuCj4gPiA+ID4gPiA+
IHlhCj4gPiA+ID4gPiA+IG1sCj4gPiA+ID4gPiA+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0Cj4gPiA+
ID4gPiA+IGluZGV4IDAwMDAwMDAwMDAwMDAuLjA3ZmVkYzRjN2NjMTMKPiA+ID4gPiA+ID4gLS0t
IC9kZXYvbnVsbAo+ID4gPiA+ID4gPiArKysKPiA+ID4gPiA+ID4gYi9Eb2N1bWVudGF0aW9uL2Rl
dmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS92ZXJpc2lsaWNvbixkYy4KPiA+ID4gPiA+ID4geWEK
PiA+ID4gPiA+ID4gbWwKPiA+ID4gPiA+ID4gQEAgLTAsMCArMSwxMjcgQEAKPiA+ID4gPiA+ID4g
KyMgU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IChHUEwtMi4wIE9SIEJTRC0yLUNsYXVzZSkKPiA+
ID4gPiA+ID4gKyVZQU1MIDEuMgo+ID4gPiA+ID4gPiArLS0tCj4gPiA+ID4gPiA+ICskaWQ6Cj4g
PiA+ID4gPiA+IGh0dHA6Ly9kZXZpY2V0cmVlLm9yZy9zY2hlbWFzL2Rpc3BsYXkvdmVyaXNpbGlj
b24sZGMueWFtbCMKPiA+ID4gPiA+ID4gKyRzY2hlbWE6IGh0dHA6Ly9kZXZpY2V0cmVlLm9yZy9t
ZXRhLXNjaGVtYXMvY29yZS55YW1sIwo+ID4gPiA+ID4gPiArCj4gPiA+ID4gPiA+ICt0aXRsZTog
VmVyaXNpbGljb24gREMtc2VyaWVzIGRpc3BsYXkgY29udHJvbGxlcnMKPiA+ID4gPiA+ID4gKwo+
ID4gPiA+ID4gPiArbWFpbnRhaW5lcnM6Cj4gPiA+ID4gPiA+ICvCoCAtIEljZW5vd3kgWmhlbmcg
PHV3dUBpY2Vub3d5Lm1lPgo+ID4gPiA+ID4gPiArCj4gPiA+ID4gPiA+ICtwcm9wZXJ0aWVzOgo+
ID4gPiA+ID4gPiArwqAgJG5vZGVuYW1lOgo+ID4gPiA+ID4gPiArwqDCoMKgIHBhdHRlcm46ICJe
ZGlzcGxheUBbMC05YS1mXSskIgo+ID4gPiA+ID4gPiArCj4gPiA+ID4gPiA+ICvCoCBjb21wYXRp
YmxlOgo+ID4gPiA+ID4gPiArwqDCoMKgIGNvbnN0OiB2ZXJpc2lsaWNvbixkYwo+ID4gPiA+ID4g
Cj4gPiA+ID4gPiBUaGlzIG5lZWRzIGFuIFNvQyBzcGVjaWZpYyBjb21wYXRpYmxlLiBHZW5lcmFs
bHkgbGljZW5zZWQgSVAKPiA+ID4gPiA+IGNvbXBhdGlibGVzCj4gPiA+ID4gPiBhcmUgdXNlbGVz
cyBiZWNhdXNlIHRoZSBzcGVjcyBhcmVuJ3QgcHVibGljIGFuZCB0aGVyZSdzCj4gPiA+ID4gPiBh
bHdheXMKPiA+ID4gPiA+IGludGVncmF0aW9uIHF1aXJrcy4KPiA+ID4gPiAKPiA+ID4gPiBUaGlz
IG1pbWljcyB0aGUgR1BVIElQcyBieSB0aGUgc2FtZSB2ZW5kb3IsIHNlZQo+ID4gPiA+IGdwdS92
aXZhbnRlLGdjLnlhbWwgLAo+ID4gPiA+IHdoaWNoIGNvbnRhaW4gdGhlIGV4YWN0IHNhbWUgc2V0
IG9mIGlkZW50aWZpY2F0aW9uIHJlZ2lzdGVycwo+ID4gPiA+IChpbmNsdWRpbmcKPiA+ID4gPiBh
ICJjdXN0b21lciBpZCIgb25lIHRoYXQgY2FuIGRpZmZlcmllbmF0ZSB0aGUgc2FtZSBjb25maWd1
cmVkCj4gPiA+ID4gSVAKPiA+ID4gPiBvbgo+ID4gPiA+IFN0YXJGaXZlIEpINzExMCBhbmQgVC1I
ZWFkIFRIMTUyMCkuCj4gPiA+ID4gCj4gPiA+ID4gSWYgd2UgY2FuIGdldCB2aXZhbnRlLGdjIHRv
IHdvcmsgdy9vIFNvQyBzcGVjaWZpYyBjb21wYXRpYmxlLAo+ID4gPiA+IHRoZW4gd2UKPiA+ID4g
PiBzaG91bGQgYmUgYWJsZSB0byBnZXQgdmVyaXNpbGljb24sZGMgdG8gd29yayB0b28uCj4gPiA+
IAo+ID4gPiBXZWxsIG1heWJlIEkgc2hvdWxkIGFkZCBldG5hdml2IHBlb3BsZSB0byB0aGUgcmVj
aXBpZW50IGxpc3QsIHRvCj4gPiA+IGFsbG93Cj4gPiA+IHRoZW0gdG8gdGVsbCB1cyB0aGUgbWFn
aWMgYmVoaW5kIHZpdmFudGUsZ2MgLgo+ID4gPiAKPiA+IAo+ID4gVml2YW50ZSBHUFVzIGFyZSBz
cGVjaWFsIGJlY2F1c2UgdGhleSBjb250YWluIHJlZ2lzdGVycyB0aGF0IGFsbG93Cj4gPiB0aGVt
IHRvCj4gPiBiZSBmdWxseSBpZGVudGlmaWVkIC0gc2VlIGV0bmF2aXZfaHdfaWRlbnRpZnkoLi4p
Lgo+ID4gCj4gPiBXZSBjYW4gcmVhZCBvdXQgdGhlIGZvbGxvd2luZyBpbmZvcm1hdGlvbjoKPiA+
IMKgLSBtb2RlbAo+ID4gwqAtIHJldmlzaW9uCj4gPiDCoC0gcHJvZHVjdF9pZAo+ID4gwqAtIGN1
c3RvbWVyX2lkCj4gPiDCoC0gZWNvX2lkCj4gCj4gV2VsbCBWZXJpc2lsaWNvbiBEQ3MgKHNvbWV0
aW1lcyBhbHNvIGNhbGxlZCBWaXZhbnRlIERDcyBiZWNhdXNlCj4gVml2YW50ZQo+IGlzIG5vdyBw
YXJ0IG9mIFZlcmlzaWxpY29uKSBleGNlcHQgRENOYW5vIGhhdmUgdGhlIHNhbWUgc2V0IG9mIElE
Cj4gcmVnaXN0ZXJzIChJbiBmYWN0IHRoZSByZWdpc3RlcnMgYmVmb3JlIDB4MTUwMCBzZWVtIHRv
IGhhdmUgbW9zdGx5Cj4gdGhlCj4gc2FtZSBtZWFuaW5nIHdpdGggR1BVcywgc2VlIFsxXSwgaGVy
ZSB0aGUgcmVnaXN0ZXJzIGFyZSBldmVuIG5hbWVkCj4gR0N7LFJFR31feHh4KSwgc28gaXQncyB3
aHkgSSBhc3N1bWUgInZlcmlzaWxpY29uLGRjIiB3aWxsIHdvcmsgaGVyZS4KPiAKPiBBbiBleGFt
cGxlIG9mIGlkZW50aWZpY2F0aW9uIHJlZ2lzdGVycyByZWFkb3V0IG9uIFRIMTUxMCBpcyBzaG93
bgo+IGJlbG93OiAodGhlIHJlZ2lzdGVyIG5hbWVzIGFyZSBmcm9tIGV0bmF2aXYgc3RhdGVfaGku
eG1sKQo+IGBgYAo+IHJvb3RAbHBpNGE2NiBbIH4gXSAjIGJ1c3lib3ggZGV2bWVtIDB4ZmZlZjYw
MDAyMCAjIE1PREVMwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAKPiAweDAwMDA4MjAwCj4gcm9v
dEBscGk0YTY2IFsgfiBdICMgYnVzeWJveCBkZXZtZW0gMHhmZmVmNjAwMDI0ICMgUkVWCj4gMHgw
MDAwNTcyMAo+IHJvb3RAbHBpNGE2NiBbIH4gXSAjIGJ1c3lib3ggZGV2bWVtIDB4ZmZlZjYwMDAy
OCAjIERBVEUKPiAweDIwMjEwMjAxCj4gcm9vdEBscGk0YTY2IFsgfiBdICMgYnVzeWJveCBkZXZt
ZW0gMHhmZmVmNjAwMDJjICMgVElNRQo+IDB4MTExMzMwMDAKPiByb290QGxwaTRhNjYgWyB+IF0g
IyBidXN5Ym94IGRldm1lbSAweGZmZWY2MDAwMzAgIyBDVVNUT01FUl9JRAo+IDB4MDAwMDAzMEEK
PiByb290QGxwaTRhNjYgWyB+IF0gIyBidXN5Ym94IGRldm1lbSAweGZmZWY2MDAwYTggIyBQUk9E
VUNUX0lECj4gMHgwMjA4MjAwMAo+IHJvb3RAbHBpNGE2NiBbIH4gXSAjIGJ1c3lib3ggZGV2bWVt
IDB4ZmZlZjYwMDBlOCAjIEVDT19JRAo+IDB4MDAwMDAwMDAKPiBgYGAKPiAKClJvYiwKCklzIHRo
aXMgYW4gYWNjZXB0YWJsZSBhbnN3ZXIgb2Ygbm90IGhhdmluZyBhIHZlbmRvci1zcGVjaWZpYwpj
b21wYXRpYmxlPwoKSWYgaXQgaXNuJ3QsIEkgd2lsbCBhZGQgdmVuZG9yLXNwZWNpZmljIGNvbXBh
dGlibGUgc3RyaW5ncyB0byB0aGUgbmV4dApyZXZpc2lvbiBvZiB0aGUgYmluZGluZywgYW5kIG1h
eWJlIGFsc28gdHJ5IHRvIGFkZCB0aGVtIGZvciB2aXZhbnRlLGdjLgoKVGhhbmtzLApJY2Vub3d5
Cgo+IEJ1dCBhcyBSb2IgcG9pbnRlZCBvdXQsIG1heWJlIGFjcXVpcmluZyBpbmZvcm1hdGlvbnMg
ZnJvbSB0aGUgSURzCj4gY2Fubm90IHNvbHZlIGFsbCB0aGUgcHJvYmxlbSBvZiBpbnRlZ3JhdGlv
biBxdWlya3M/IEFzIHRoZXNlIElEcyBhcmUKPiBhbHJlYWR5IGRldGVybWluZWQgd2hlbiBWZXJp
c2lsaWNvbiBnZW5lcmF0ZXMgdGhlIFJUTCBmb3IgdGhlCj4gY3VzdG9tZXIsCj4gaXQncyBwb3Nz
aWJsZSBmb3IgdGhlbSB0byByZXVzZSB0aGUgUlRMIHR3aWNlLCBtZXNzIHVwIHNvbWV0aGluZyBp
bgo+IG9uZQo+IHNpbGljb24gYW5kIGhhdmUgdGhlIGlzc3VlcyBmaXhlZCBpbiBhbm90aGVyLgo+
IAo+IFsxXQo+IGh0dHBzOi8vZ2l0aHViLmNvbS9taWxrdi1tZWdyZXovcm9ja29zLXUtYm9vdC9i
bG9iL2M5MjIxY2YyZmE3N2QzOWMwYjI0MWFiNGIwMzBjNzA4ZTdlYmUyNzkvZHJpdmVycy92aWRl
by9lc3dpbi9lc3dpbl9kY19yZWcuaAo+IAo+ID4gCj4gPiBUaGlzIGluZm9ybWF0aW9uLCBpbiBj
b21iaW5hdGlvbiB3aXRoIGEgaGFyZHdhcmUgZGF0YWJhc2UgKGh3ZGIpIGluCj4gPiBrZXJuZWwv
dXNlcnNwYWNlLCBpcyBlbm91Z2ggdG8gc3VwcG9ydCB0aGVzZSBHUFVzL05QVXMgYWNyb3NzCj4g
PiBkaWZmZXJlbnQgU29DIHZlbmRvcnMuCj4gPiAKPiAKCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgt
cmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
