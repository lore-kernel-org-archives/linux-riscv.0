Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1DA62E77188
	for <linux-riscv@archiver.kernel.org>; Tue, 24 Dec 2024 09:31:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:From:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YQ1TMreu9id88z5pJBMCsYudEf382iF30sgFNGUiqoc=; b=jLTGzlWdoEDo0i
	8xIRlZNNfUJbL+P8Rcs4GbXbQKNYtqWRNak4JzwXjfSToCvtBo+Fx/ObxbXXw7Rod3Mr2Fxcjug2e
	BIdKVPwIc9f2hOAdmipCf9rev55a5nl+DhxK/GLvdHNXdx6pjei9NBtKJmT6ZqA8HlOE0MnX9rxxK
	fraJM/LTYN0ax/veEX5Ag5hMvR/Y3eAhn4+yiAb59I4q07BfHUP5PQNB6Ot85q3R2J7/7WZOVJG42
	D/5ett68CoFi0xjItEFru9fcLbFeG7+ucrbVfxDEMSgChrKv++846tizgOFK0H7Hut1723Oc3MpfZ
	O/PYZXD2nMijn9qBJJug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tQ1Ga-0000000Bb86-0Kie;
	Tue, 24 Dec 2024 09:31:52 +0000
Received: from mailout2.w1.samsung.com ([210.118.77.12])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tQ1GX-0000000Bb7L-3BRJ
	for linux-riscv@lists.infradead.org;
	Tue, 24 Dec 2024 09:31:51 +0000
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
	by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20241224093147euoutp0235c473b470114207877071ca2bc62c75~UEw38l6UE2349223492euoutp02v
	for <linux-riscv@lists.infradead.org>; Tue, 24 Dec 2024 09:31:47 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20241224093147euoutp0235c473b470114207877071ca2bc62c75~UEw38l6UE2349223492euoutp02v
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1735032707;
	bh=3Nu/ij16UUT42lqe5Bh1GBTS2K9+BxVpiEpokJla4rg=;
	h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
	b=I6vW8WMFg4yzE6lIMlgvWHRT5BSP6wyYlygHxO2AKSlWgBTAlguorfQixWWJpbHqY
	 69UwsxSqyUxDgS6wRwPeA4z2semx9C+SEm6FNubMTrnGBFyJKUyWMkoUYHedIcnu5z
	 bSvWRxFSrC/X2ENjxMlbNxZ2h8ze0wpMmmDpVBb4=
Received: from eusmges1new.samsung.com (unknown [203.254.199.242]) by
	eucas1p2.samsung.com (KnoxPortal) with ESMTP id
	20241224093146eucas1p2a8502d1d2cfe9bc9a124c7922a07875e~UEw3SoWR71295412954eucas1p27;
	Tue, 24 Dec 2024 09:31:46 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
	eusmges1new.samsung.com (EUCPMTA) with SMTP id AC.69.20821.28F7A676; Tue, 24
	Dec 2024 09:31:46 +0000 (GMT)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
	eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
	20241224093145eucas1p29ab5546f55e59b9b54873f4eb28b7004~UEw2g_yGH2149421494eucas1p2V;
	Tue, 24 Dec 2024 09:31:45 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
	eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
	20241224093145eusmtrp136f912a8d7b273585e3990bf96361e2b~UEw2gEDwc1635616356eusmtrp1J;
	Tue, 24 Dec 2024 09:31:45 +0000 (GMT)
X-AuditID: cbfec7f2-b11c470000005155-1e-676a7f825839
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
	eusmgms1.samsung.com (EUCPMTA) with SMTP id 31.AB.19920.18F7A676; Tue, 24
	Dec 2024 09:31:45 +0000 (GMT)
Received: from [192.168.1.44] (unknown [106.210.136.40]) by
	eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20241224093144eusmtip27edc20307c19f74a5a9e4811f470707d~UEw1PhWww1893718937eusmtip2C;
	Tue, 24 Dec 2024 09:31:44 +0000 (GMT)
Message-ID: <756031bf-4f81-424d-8cbc-db27ac27f6dd@samsung.com>
Date: Tue, 24 Dec 2024 10:31:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v2 03/19] dt-bindings: power: thead,th1520: Add
 support for power domains
To: Krzysztof Kozlowski <krzk@kernel.org>, mturquette@baylibre.com,
	sboyd@kernel.org, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	drew@pdp7.com, guoren@kernel.org, wefu@redhat.com, jassisinghbrar@gmail.com,
	paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
	frank.binns@imgtec.com, matt.coster@imgtec.com,
	maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
	airlied@gmail.com, simona@ffwll.ch, ulf.hansson@linaro.org,
	jszhang@kernel.org, p.zabel@pengutronix.de, m.szyprowski@samsung.com
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
	dri-devel@lists.freedesktop.org, linux-pm@vger.kernel.org
Content-Language: en-US
From: Michal Wilczynski <m.wilczynski@samsung.com>
In-Reply-To: <db2987c2-53fc-4d3a-b85c-f5683f74e7a0@kernel.org>
X-Brightmail-Tracker: H4sIAAAAAAAAA02Se0xTVxzHc25v7y24smuBcQQDWtQE5qCaLZ4xonPZ424JUbI5t7noGrhW
	tBTWgo9lC7J2WFgRUBGtqyCywZBSQVoK4TEeoQVs63jJnFSz6FgrjPCocRBg0Isb/31+39/3
	nO/vd3J4HEEHEcxLkqUxcplYKiR8cVPXP45Xvs04KhHdLFqHrHdLMWSc05KoqtmOoeJOOxc5
	++owNOCZIFD14zsk+qs5E0dDFToSKbsMBHJpnQRyOG6SaFLj5KL+xh8INJ3bCZBpWkUgfecI
	ia5NGnFUZm4EKCv7Jy76tecdNOK04sjVr+GgLO2LaLHJTKKFoRocXfm7lUR1YwVcZNHvR6rW
	C/ibofTE8HckPeZy4XSHeoakm5+W4HSDdoSkNQ23AV1bmU3Q94eaCPpqdzz94HsLRt8qy6BV
	+i6MzpsX0RMtgwR9tq4S0H3Ku+RewWe+sYmMNOk4I4/e+YXvkcs9Djy1ijrpcf+GnwbnXsgB
	PjxIvQqnMvPwHODLE1AVABqe6jG2mAGwbVC3UkwDWGK7w31+5Bf9DQ7bKAewZ0BJsMU4gFWl
	FeSyi0/thM2LHi/j1GbYVtiLs/pa2H35kZcDqTD44N4lr8efSoCGCyqwfFEAVYVD92i5N45D
	1QNovc1nOQjee1SMLTNBbYcPy4u9Hp+lMI/tyYo/DCqNV7zjQWrQFzovOXB27rfhxEIxybI/
	dFvqVng97D2vWfGkwIfGKQ7LX8MGjWWF34D37bNLa/KWAiKgoTGalXfDOtcUd1mGlB8cHl/L
	juAHz5mKOKzMh+osAeveAgs1uf+F2itMWD4Qale9inbVktpVy2j/zy0BeCUIYtIVyRJGsU3G
	nIhSiJMV6TJJVEJKci1Y+ue9C5YpM9C5J6PaAcYD7QDyOMIAfrsgSSLgJ4pPfcXIUw7J06WM
	oh2E8HBhEH9zYhgjoCTiNOYYw6Qy8uddjOcTfBoLTy4jZJqIgCewpn7c7fjgkLo25eTPswPv
	H9TEqDnHEuOSWo3K2Iw4Zn9Bx7XGaZMh0lgzL95nK61urd2z4cvcgmFjaHiCPfxi/2tZMdXm
	lut+W7v9v/n4IJkTOJJ54Drn02j61Oh7M3tvGT8/YFUe3ze6K7+Fd/Qt7rO0wvlN2/02SPK3
	WNUqaWpoiOhMdo858HWRcmvR2egTzPo/F8esCzHrdJHWGCYi8Pfw3PjDsrm+D6mx6cd/0Klt
	6k8MF7UZwRVxe8yTO4iIJtuNNRtjz88erncWeXYEaD/a9S5s320Sr6n8MUFYb9cZ8mwvWTeO
	hszpx0SF0njly1JQKTvzLFaIK46It0Vy5Arxv1AwNKtWBAAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrKKsWRmVeSWpSXmKPExsVy+t/xe7qN9VnpBjsvqFicuL6IyWLr71ns
	Fmv2nmOymH/kHKvFvUtbmCyufH3PZrHu6QV2ixd7G1ksrq2Yy27RfGw9m8XLWffYLM6f38Bu
	8bHnHqvF5V1z2Cw+9x5htNj2uYXNYu2Ru+wWCz9uZbFYsmMXo0Vb5zJWi4unXC3u3jvBYvHy
	cg+zRdssfov/e3awW/y7tpHFYva7/ewWW95MZLU4vjbcomX/FBYHOY/3N1rZPd68fMnicbjj
	C7vH3m8LWDx2zrrL7tGz8wyjx6ZVnWwed67tYfOYdzLQ4373cSaPzUvqPVrWHmPy6P9r4PF+
	31U2j74tqxg9LjVfZw8QitKzKcovLUlVyMgvLrFVija0MNIztLTQMzKx1DM0No+1MjJV0rez
	SUnNySxLLdK3S9DLmHnqPEvBGoGKr69usjQwTuLpYuTkkBAwkTiwdjUziC0ksJRR4s/kDIi4
	jMS17pcsELawxJ9rXWxdjFxANa8ZJda/fwGW4BWwk9j7/ys7iM0ioCpxcOppqLigxMmZT8Bs
	UQF5ifu3ZoDVCAskS6yf0sIIMkhEYA2LxNV3U1lBHGaB7YwSG2ZOZYRY8ZdRYvasB2wgLcwC
	4hK3nsxnArHZBIwkHiyfzwpicwKt/nr2NZDNAVSjLrF+nhBEubxE89bZzBMYhWYhOWQWkkmz
	EDpmIelYwMiyilEktbQ4Nz232FCvODG3uDQvXS85P3cTIzB9bTv2c/MOxnmvPuodYmTiYDzE
	KMHBrCTCe0goM12INyWxsiq1KD++qDQntfgQoykwMCYyS4km5wMTaF5JvKGZgamhiZmlgaml
	mbGSOK/b5fNpQgLpiSWp2ampBalFMH1MHJxSDUyyD578OngpN8Ep9mTI6yWnJVyu7LjjdIxr
	fXGHXfl6JTajex57jqW8OfXpyyku+X7J1PxPYSvEVzytu3T06NysfeYam36c1fpSf6i4NKSI
	8/H1Z0YHfJf2dLJq1Of3TXu8xi3j1SNz8akOd2XKTxl2745dv2q3RVid29QJotETtxmU87wv
	PLgtKzczJnbaY7NNRn8sKl590T+n1yjaWvj09tsnT4R9szMKUw/LMgvu3twY2iXm8YSDf0GE
	ob/y0kL+Tf+uWa0IzF/CrnFx2i4/2+UOOi/2Lgnhj1u9o9uDZ///veKKUeVhuhl/9NbMFU9X
	Oe4hFjOz4PWHTnXlogXfJJ9tfaGUGLO2+/quC7FKLMUZiYZazEXFiQALa9nU6AMAAA==
X-CMS-MailID: 20241224093145eucas1p29ab5546f55e59b9b54873f4eb28b7004
X-Msg-Generator: CA
X-RootMTR: 20241223125604eucas1p26b870756eeaf2a5666b70de3f7554c13
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20241223125604eucas1p26b870756eeaf2a5666b70de3f7554c13
References: <20241223125553.3527812-1-m.wilczynski@samsung.com>
	<CGME20241223125604eucas1p26b870756eeaf2a5666b70de3f7554c13@eucas1p2.samsung.com>
	<20241223125553.3527812-4-m.wilczynski@samsung.com>
	<db2987c2-53fc-4d3a-b85c-f5683f74e7a0@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241224_013150_197724_E6F7AC03 
X-CRM114-Status: GOOD (  15.22  )
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

CgpPbiAxMi8yMy8yNCAxNzowOSwgS3J6eXN6dG9mIEtvemxvd3NraSB3cm90ZToKPiBPbiAyMy8x
Mi8yMDI0IDEzOjU1LCBNaWNoYWwgV2lsY3p5bnNraSB3cm90ZToKPj4gKyAgY29tcGF0aWJsZToK
Pj4gKyAgICBjb25zdDogdGhlYWQsdGgxNTIwLXBkCj4+ICsKPj4gKyAgIiNwb3dlci1kb21haW4t
Y2VsbHMiOgo+PiArICAgIGNvbnN0OiAxCj4+ICsKPj4gK2FkZGl0aW9uYWxQcm9wZXJ0aWVzOiBm
YWxzZQo+PiArCj4+ICtyZXF1aXJlZDoKPj4gKyAgLSBjb21wYXRpYmxlCj4+ICsgIC0gIiNwb3dl
ci1kb21haW4tY2VsbHMiCj4+ICsKPj4gK2V4YW1wbGVzOgo+PiArICAtIHwKPj4gKyAgICBmaXJt
d2FyZSB7Cj4gCj4gRHJvcAo+IAo+PiArICAgICAgICBhb246IGFvbiB7Cj4+ICsgICAgICAgICAg
ICBjb21wYXRpYmxlID0gInRoZWFkLHRoMTUyMC1hb24iOwo+PiArICAgICAgICAgICAgbWJveGVz
ID0gPCZtYm94XzkxMHQgMT47Cj4+ICsgICAgICAgICAgICBtYm94LW5hbWVzID0gImFvbiI7Cj4g
Cj4gRHJvcCBhb24gbm9kZS4uLiBidXQgdGhlIG1haW4gcHJvYmxlbSBpcyB5b3UgZG8gbm90IGhh
dmUgYW55IHJlc291cmNlcwo+IGluIHlvdXIgcG93ZXItZG9tYWluIGRldmljZSBub2RlLCBhc3N1
bWluZyB5b3VyIGJpbmRpbmcgaXMgY29tcGxldGUuCj4gVGhpcyBzdWdnZXN0cyB0aGF0IHRoaXMg
aXMgcGFydCBvZiBhb24sIG5vdCBzZXBhcmF0ZSBkZXZpY2UuIEZvbGQgdGhlCj4gZGV2aWNlIG5v
ZGUgaW50byBpdHMgcGFyZW50IChzbyBldmVyeXRoaW5nIGdvZXMgdG8gQU9OKS4KCk1lcmdpbmcg
ZXZlcnl0aGluZyB0byBBT04gbm9kZSB3b3VsZCBkZWZpbml0ZWx5IHdvcmsuIEkgd2FzIGxvb2tp
bmcgYXQKdGhlIG90aGVyIGltcGxlbWVudGF0aW9ucyBvZiBmaXJtd2FyZSBwcm90b2NvbHMgZm9y
IGV4YW1wbGUsIGFuZCB0aGF0J3MKaG93IEkgZmlndXJlZCB0aGUgY3VycmVudCBpbXBsZW1lbnRh
dGlvbjoKCmFyY2gvYXJtL2Jvb3QvZHRzL2Jyb2FkY29tL2JjbTI4MzUtcnBpLmR0c2kKc29jIHsK
CWZpcm13YXJlOiBmaXJtd2FyZSB7CgkJY29tcGF0aWJsZSA9ICJyYXNwYmVycnlwaSxiY20yODM1
LWZpcm13YXJlIiwgInNpbXBsZS1tZmQiOwoJCW1ib3hlcyA9IDwmbWFpbGJveD47CgoJCWZpcm13
YXJlX2Nsb2NrczogY2xvY2tzIHsKCQkJY29tcGF0aWJsZSA9ICJyYXNwYmVycnlwaSxmaXJtd2Fy
ZS1jbG9ja3MiOwoJCQkjY2xvY2stY2VsbHMgPSA8MT47CgkJfTsKCX07CgoJcG93ZXI6IHBvd2Vy
IHsKCQljb21wYXRpYmxlID0gInJhc3BiZXJyeXBpLGJjbTI4MzUtcG93ZXIiOwoJCWZpcm13YXJl
ID0gPCZmaXJtd2FyZT47CgkJI3Bvd2VyLWRvbWFpbi1jZWxscyA9IDwxPjsKCX07Cn07CgpUaGlz
IGlzIGZhaXJseSBzaW1pbGFyLCBhcyB0aGUgZmlybXdhcmUgaXMgcGFzc2VkIGFzIHByb3BlcnR5
LCBpbnN0ZWFkCmFzIGluIGEgcGFyZW50LWNoaWxkIHJlbGF0aW9uc2hpcC4gV291bGQgeW91IGNv
bnNpZGVyIGl0IG1vcmUgY2Fub25pY2FsCj8KCkkgd291bGQgYmUgaGFwcHkgdG8gbWVyZ2UgZXZl
cnl0aGluZyB0byBBT04gbm9kZSwgYW5kIG1lcmdlIHRoZQpwb3dlci1kb21haW4gZHJpdmVyIGFu
ZCBBT04gZHJpdmVyIHRvZ2V0aGVyLCBidXQgaXQgc2VlbWVkIHRvIG1lIGxpa2UKdGhvc2UgY291
bGQgdXNlIHNvbWUgc2VwYXJhdGlvbiwgYW5kIHNpbmNlIHBvd2VyLWRvbWFpbiBhbmQgdGhlIEFP
TgpyZXByZXNlbnQgYWN0dWFsIEhXIGl0J3MgZmluZSB0byByZXByZXNlbnQgdGhlbSBpbiB0aGUg
ZGV2aWNlIHRyZWUuCgpUaGFua3MsCk1pY2hhxYIKPiAKPj4gKwo+PiArICAgICAgICAgICAgcGQ6
IHBvd2VyLWRvbWFpbiB7Cj4+ICsgICAgICAgICAgICAgICAgY29tcGF0aWJsZSA9ICJ0aGVhZCx0
aDE1MjAtcGQiOwo+PiArICAgICAgICAgICAgICAgICNwb3dlci1kb21haW4tY2VsbHMgPSA8MT47
Cj4+ICsgICAgICAgICAgICB9Owo+PiArICAgICAgICB9Owo+PiArICAgIH07Cj4gCj4gQmVzdCBy
ZWdhcmRzLAo+IEtyenlzenRvZgo+IAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3Rz
LmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5m
by9saW51eC1yaXNjdgo=
