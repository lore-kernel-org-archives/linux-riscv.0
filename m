Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8AD1AC7115B
	for <linux-riscv@archiver.kernel.org>; Mon, 23 Jun 2025 21:44:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:From:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3BRWb1u509P5sNT6JQZoI+P6ZruY8ce1tNj3877kXik=; b=vRNm7LPv4XzQVJ
	bxnp0b67Vr4b6xkiTPBlrdtscEImVgeVs+3mMJeii+D/gsThMci/AKu1ono7LnknHOCi9zu7oiCCN
	3hzPszTziPzcyc6mLBe3EviPzQLiefaeUJU3cwZU1dYQuqV5fM5M6Cotulu13CoFp9BX3EOsJLWj9
	bm5hfmxA2UNVjdIH6IOLuNk/6Ozmqc8T0A57I36vagV0+HPqjzRP2AONMBfF69WVK6zR+OhgyfE8X
	ArucQkto8N+4ua2uxpi8BhZzKfmi35LpiHvQqa5xhZlLdooVHn2oKcWYnaBLWUopT4DMoUdrCws9V
	KOIEzl4kxbU6u9nZJCDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uToxO-0000000420d-1xy6;
	Mon, 23 Jun 2025 21:44:02 +0000
Received: from mailout1.w1.samsung.com ([210.118.77.11])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTkqr-00000003XTR-40vd
	for linux-riscv@lists.infradead.org;
	Mon, 23 Jun 2025 17:21:06 +0000
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
	by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20250623172056euoutp017edaa0ec71e63dfd439900e3042bf584~Lu7Kt-T7w1445714457euoutp01B
	for <linux-riscv@lists.infradead.org>; Mon, 23 Jun 2025 17:20:56 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20250623172056euoutp017edaa0ec71e63dfd439900e3042bf584~Lu7Kt-T7w1445714457euoutp01B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1750699256;
	bh=8lEUjCtED9a5kJctvyEu/cj7uPsV5HrpplbBsVN6N5c=;
	h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
	b=B9Joi7KzcXhbXkt7ESn9LBW17c8hZBnCUZW0dCLSSAX85xn9L37lTqPliprzJep18
	 E4QvZWgjOqmYiY/etAalqUSNMiCq71X+FbeQ43lHiegdy1Rlaa4exbV76xK8DsGDlf
	 9gz/MTRkf35DVXHIZOPJwKX854xtkgSPjraX3OLE=
Received: from eusmtip2.samsung.com (unknown [203.254.199.222]) by
	eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
	20250623172055eucas1p18f485c150a28ebb6bc819962a527f652~Lu7KEXSux0826908269eucas1p1r;
	Mon, 23 Jun 2025 17:20:55 +0000 (GMT)
Received: from [192.168.1.44] (unknown [106.210.136.40]) by
	eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20250623172054eusmtip2b03dc4b23ebdde5b132e7ca2374fdf75~Lu7JD55kE0081800818eusmtip2R;
	Mon, 23 Jun 2025 17:20:54 +0000 (GMT)
Message-ID: <f41cd747-eb57-4e17-a3b1-8b30e0c6e84c@samsung.com>
Date: Mon, 23 Jun 2025 19:20:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 1/8] power: sequencing: Add T-HEAD TH1520 GPU power
 sequencer driver
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Drew Fustini <drew@pdp7.com>, Guo Ren <guoren@kernel.org>, Fu Wei
	<wefu@redhat.com>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
	<krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Philipp Zabel
	<p.zabel@pengutronix.de>, Frank Binns <frank.binns@imgtec.com>, Matt Coster
	<matt.coster@imgtec.com>, Maarten Lankhorst
	<maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>, Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>, Ulf Hansson <ulf.hansson@linaro.org>, Marek
	Szyprowski <m.szyprowski@samsung.com>, linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Language: en-US
From: Michal Wilczynski <m.wilczynski@samsung.com>
In-Reply-To: <CAMRc=MfPLZ7oMVjLv+_GMoC8X+O=k+mMrQKxELho0=+Z7=HApQ@mail.gmail.com>
X-CMS-MailID: 20250623172055eucas1p18f485c150a28ebb6bc819962a527f652
X-Msg-Generator: CA
X-RootMTR: 20250623114430eucas1p2a5bb2bbc0049186ff25e1b3e1a131ca2
X-EPHeader: CA
X-CMS-RootMailID: 20250623114430eucas1p2a5bb2bbc0049186ff25e1b3e1a131ca2
References: <CGME20250623114430eucas1p2a5bb2bbc0049186ff25e1b3e1a131ca2@eucas1p2.samsung.com>
	<20250623-apr_14_for_sending-v6-0-6583ce0f6c25@samsung.com>
	<20250623-apr_14_for_sending-v6-1-6583ce0f6c25@samsung.com>
	<CAMRc=MfPLZ7oMVjLv+_GMoC8X+O=k+mMrQKxELho0=+Z7=HApQ@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250623_102102_984615_34A0968F 
X-CRM114-Status: GOOD (  18.12  )
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

CgpPbiA2LzIzLzI1IDE2OjMyLCBCYXJ0b3N6IEdvbGFzemV3c2tpIHdyb3RlOgo+IE9uIE1vbiwg
SnVuIDIzLCAyMDI1IGF0IDE6NDTigK9QTSBNaWNoYWwgV2lsY3p5bnNraQo+IDxtLndpbGN6eW5z
a2lAc2Ftc3VuZy5jb20+IHdyb3RlOgo+Pgo+PiBJbnRyb2R1Y2UgdGhlIHB3cnNlcS10aGVhZC1n
cHUgZHJpdmVyLCBhIHBvd2VyIHNlcXVlbmNlciBwcm92aWRlciBmb3IKPj4gdGhlIEltYWdpbmF0
aW9uIEJYTS00LTY0IEdQVSBvbiB0aGUgVC1IRUFEIFRIMTUyMCBTb0MuIFRoaXMgZHJpdmVyCj4+
IGNvbnRyb2xzIGFuIGF1eGlsaWFyeSBkZXZpY2UgaW5zdGFudGlhdGVkIGJ5IHRoZSBBT04gcG93
ZXIgZG9tYWluLgo+Pgo+PiBUaGUgVEgxNTIwIEdQVSByZXF1aXJlcyBhIHNwZWNpZmljIHNlcXVl
bmNlIHRvIGNvcnJlY3RseSBpbml0aWFsaXplIGFuZAo+PiBwb3dlciBkb3duIGl0cyByZXNvdXJj
ZXM6Cj4+ICAtIEVuYWJsZSBHUFUgY2xvY2tzIChjb3JlIGFuZCBzeXMpLgo+PiAgLSBEZS1hc3Nl
cnQgdGhlIEdQVSBjbG9jayBnZW5lcmF0b3IgcmVzZXQgKGNsa2dlbl9yZXNldCkuCj4+ICAtIElu
dHJvZHVjZSBhIHNob3J0IGhhcmR3YXJlLXJlcXVpcmVkIGRlbGF5Lgo+PiAgLSBEZS1hc3NlcnQg
dGhlIEdQVSBjb3JlIHJlc2V0LiBUaGUgcG93ZXItZG93biBzZXF1ZW5jZSBwZXJmb3JtcyB0aGVz
ZQo+PiAgICBzdGVwcyBpbiByZXZlcnNlLgo+Pgo+PiBJbXBsZW1lbnQgdGhpcyBzZXF1ZW5jZSB2
aWEgdGhlIHB3cnNlcV9wb3dlcl9vbiBhbmQgcHdyc2VxX3Bvd2VyX29mZgo+PiBjYWxsYmFja3Mu
Cj4+Cj4+IENydWNpYWxseSwgdGhlIGRyaXZlcidzIG1hdGNoIGZ1bmN0aW9uIGlzIGNhbGxlZCB3
aGVuIGEgY29uc3VtZXIgKHRoZQo+PiBJbWFnaW5hdGlvbiBHUFUgZHJpdmVyKSByZXF1ZXN0cyB0
aGUgImdwdS1wb3dlciIgdGFyZ2V0LiBEdXJpbmcgdGhpcwo+PiBtYXRjaCwgdGhlIHNlcXVlbmNl
ciB1c2VzIGNsa19idWxrX2dldCgpIGFuZAo+PiByZXNldF9jb250cm9sX2dldF9leGNsdXNpdmUo
KSBvbiB0aGUgY29uc3VtZXIncyBkZXZpY2UgdG8gb2J0YWluIGhhbmRsZXMKPj4gdG8gdGhlIEdQ
VSdzICJjb3JlIiBhbmQgInN5cyIgY2xvY2tzLCBhbmQgdGhlIEdQVSBjb3JlIHJlc2V0LiAgVGhl
c2UsCj4+IGFsb25nIHdpdGggY2xrZ2VuX3Jlc2V0IG9idGFpbmVkIGZyb20gcGFyZW50IGFvbiBu
b2RlLCBhbGxvdyBpdCB0bwo+PiBwZXJmb3JtIHRoZSBjb21wbGV0ZSBzZXF1ZW5jZS4KPj4KPj4g
UmV2aWV3ZWQtYnk6IFVsZiBIYW5zc29uIDx1bGYuaGFuc3NvbkBsaW5hcm8ub3JnPgo+PiBTaWdu
ZWQtb2ZmLWJ5OiBNaWNoYWwgV2lsY3p5bnNraSA8bS53aWxjenluc2tpQHNhbXN1bmcuY29tPgo+
PiAtLS0KPiAKPiBbc25pcF0KPiAKPj4gKwo+PiArICAgICAgIC8qIEFkZGl0aW9uYWxseSB2ZXJp
ZnkgY29uc3VtZXIgZGV2aWNlIGhhcyBBT04gYXMgcG93ZXItZG9tYWluICovCj4+ICsgICAgICAg
aWYgKHB3cl9zcGVjLm5wICE9IGN0eC0+YW9uX25vZGUgfHwgcHdyX3NwZWMuYXJnc1swXSAhPSBU
SDE1MjBfR1BVX1BEKSB7Cj4+ICsgICAgICAgICAgICAgICBvZl9ub2RlX3B1dChwd3Jfc3BlYy5u
cCk7Cj4+ICsgICAgICAgICAgICAgICByZXR1cm4gMDsKPj4gKyAgICAgICB9Cj4+ICsKPj4gKyAg
ICAgICBvZl9ub2RlX3B1dChwd3Jfc3BlYy5ucCk7Cj4+ICsKPj4gKyAgICAgICAvKiBJZiBhIGNv
bnN1bWVyIGlzIGFscmVhZHkgYm91bmQsIG9ubHkgYWxsb3cgYSByZS1tYXRjaCBmcm9tIGl0ICov
Cj4+ICsgICAgICAgaWYgKGN0eC0+Y29uc3VtZXJfbm9kZSkKPj4gKyAgICAgICAgICAgICAgIHJl
dHVybiBjdHgtPmNvbnN1bWVyX25vZGUgPT0gZGV2LT5vZl9ub2RlOwo+PiArCj4gCj4gVGhhdCBz
aG91bGQgYmUgYCEhKGN0eC0+Y29uc3VtZXJfbm9kZSA9PSBkZXYtPm9mX25vZGUpYCBvciBwcmVm
ZXJhYmx5Cj4gYGN0eC0+Y29uc3VtZXJfbm9kZSA9PSBkZXYtPm9mX25vZGUgPyAxIDogMGAuIEkg
Y2FuIGFtZW5kIGl0IHdoZW4KPiBhcHBseWluZyBpZiB5b3UgaGF2ZSBubyBvYmplY3Rpb25zLiBU
aGUgcmVzdCBsb29rcyBnb29kIHRvIG1lIGFuZCBJJ2QKPiBsaWtlIHRvIHBpY2sgaXQgdXAgaW50
byBwd3JzZXEvZm9yLW5leHQgaW4gdGhlIG5leHQgdHdvIGRheXMuCgpTdXJlLApUaGFua3MgIQoK
PiAKPiBCYXJ0Cj4gCj4gW3NuaXBdCj4gCgpCZXN0IHJlZ2FyZHMsCi0tIApNaWNoYWwgV2lsY3p5
bnNraSA8bS53aWxjenluc2tpQHNhbXN1bmcuY29tPgoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJp
c2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1h
bi9saXN0aW5mby9saW51eC1yaXNjdgo=
