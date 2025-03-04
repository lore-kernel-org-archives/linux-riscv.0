Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7516DC021B8
	for <linux-riscv@archiver.kernel.org>; Tue,  4 Mar 2025 07:38:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:From:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=aA5C6MLEzVf8b77wYdByECKFnYzQEDzi+L1WhgfVkdk=; b=PxYyTG4XRv1/mU
	o5sVzcTpym/JLiryezssAeQlMpkyP0oBoO8SYH5HauVJHT0795jEIC0GfDZ5rfEjAQKV0lcnnbGal
	UILY+ZbFnAvw/op+b8TNVpxMPtpPpUJa3AZeykrkLDBroLrJgAy9S7f1wtPebEtT4vek7amF2XXaJ
	bH9VVYbFi2v5mO9SKQmwNPYdSOejtgFP/qnu/vfmuSpkBTXYY0B0GrFf2aQt7gBb4g/nCFNthOXnL
	SgEJMrkq2JC9Y+zK9a9K3Eo77ivhZODfb3g65tB7SGq2fa84WNdNhoRQ1yFzTh9auDxi/Iv4CFWxX
	3gR85yJD/DPk10GK99Tw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpMr8-00000003Shk-29FL;
	Tue, 04 Mar 2025 07:38:22 +0000
Received: from mailout2.w1.samsung.com ([210.118.77.12])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpMr4-00000003SgC-2G6p
	for linux-riscv@lists.infradead.org;
	Tue, 04 Mar 2025 07:38:20 +0000
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
	by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20250304073813euoutp02d1bf86744d468f36d4536fe1c900cc80~piXtPbiZx0043900439euoutp02P
	for <linux-riscv@lists.infradead.org>; Tue,  4 Mar 2025 07:38:13 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20250304073813euoutp02d1bf86744d468f36d4536fe1c900cc80~piXtPbiZx0043900439euoutp02P
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1741073893;
	bh=FQT5t9XP/qXk2cTrhE2jEyDzyfg+dccdB+ublyOMgPE=;
	h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
	b=UVFJYAPS8GJtDQS/u3HEPWiPOZSCOdfX45cJXXaI+vDMPzI0kl7iA6T4BZx3RcjAU
	 njOr4havVtQlrUh/EIBVwBcw8POIRxr+ZZsJscMGjbG9KESYfWr1Aho5uH2E9kvtgX
	 i8UlGs09pPXonqgOiHbz+ZN8iqDOvrBaewYY+5C0=
Received: from eusmges1new.samsung.com (unknown [203.254.199.242]) by
	eucas1p2.samsung.com (KnoxPortal) with ESMTP id
	20250304073812eucas1p276848c08635d2c51ac99656118f6b8b7~piXslpw1y0388203882eucas1p2H;
	Tue,  4 Mar 2025 07:38:12 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
	eusmges1new.samsung.com (EUCPMTA) with SMTP id 53.E5.20821.4EDA6C76; Tue,  4
	Mar 2025 07:38:12 +0000 (GMT)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
	eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
	20250304073812eucas1p15180503dcd7cc128c2f3c06a3425b415~piXsF8AA82194621946eucas1p1L;
	Tue,  4 Mar 2025 07:38:12 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
	eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
	20250304073812eusmtrp1a8bee346d4242d1e3cc0a9553a2edaec~piXsE-O9C2862028620eusmtrp1Q;
	Tue,  4 Mar 2025 07:38:12 +0000 (GMT)
X-AuditID: cbfec7f2-b09c370000005155-f8-67c6ade4b965
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
	eusmgms1.samsung.com (EUCPMTA) with SMTP id E8.CA.19920.4EDA6C76; Tue,  4
	Mar 2025 07:38:12 +0000 (GMT)
Received: from [192.168.1.44] (unknown [106.210.136.40]) by
	eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20250304073811eusmtip2dd48a10474efd786272294b7dc01e293~piXq0DZaX3187031870eusmtip2r;
	Tue,  4 Mar 2025 07:38:11 +0000 (GMT)
Message-ID: <09411368-cd76-479f-ade3-5a87d3f9be38@samsung.com>
Date: Tue, 4 Mar 2025 08:38:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 00/21] Enable drm/imagination BXM-4-64 Support for
 LicheePi 4A
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: mturquette@baylibre.com, sboyd@kernel.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, drew@pdp7.com, guoren@kernel.org,
	wefu@redhat.com, jassisinghbrar@gmail.com, paul.walmsley@sifive.com,
	palmer@dabbelt.com, aou@eecs.berkeley.edu, frank.binns@imgtec.com,
	matt.coster@imgtec.com, maarten.lankhorst@linux.intel.com,
	mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch,
	ulf.hansson@linaro.org, jszhang@kernel.org, p.zabel@pengutronix.de,
	m.szyprowski@samsung.com, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org, dri-devel@lists.freedesktop.org,
	linux-pm@vger.kernel.org
Content-Language: en-US
From: Michal Wilczynski <m.wilczynski@samsung.com>
In-Reply-To: <7ba53937-7922-41da-a7ed-909ce620db1f@kernel.org>
X-Brightmail-Tracker: H4sIAAAAAAAAA01SbUxTVxjOaW/vLR3FS8Fx1AlZh8YuisIGHp0hLA5ykyVDsh9kLkbruCs4
	vmylA7YMRyufRRCLbJc6xBlBBFGkDSBQA8iXjAoIZR0UfnTTEoTwNRwojPbixr/nfd7nPc/7
	vDl8rqgV386PiT9Hy+OlsWJcgBk6/jHts1V3yA6UvQpAXebrHKRfYQhU1dzHQaXtfTxkHajj
	oKeLMzi68+cTAj1v/hFDwxVXCaTqqMGRnbHiyGS6S6BZjZWHBht1OJrPawfIMK/GUXX7GIHK
	ZvUYulHfCFBG9k0e6u8JRWPWLgzZBzVclMFsQWtN9QRaHb6HoZJpI4Hqpi7xUGd1JFIbtViI
	NzUzcoGgpux2jGrLWiCo5r+vYVQDM0ZQmoZeQNVWZuPU6HATTv3SHUGN53ZyqPs30ih1dQeH
	yn99gJppGcKpi3WVgBpQmYljouOCI1F0bIySlu8PPiWIftZVzE2cFyZ3G8LOg/K3coALH5If
	Qm3XLSwHCPgisgLAv0aauWyxAKDaUrDRmV8vVGXgzUi2vRawjXIA84xrOFu8ALDh/u+4QyUk
	g+FKwaATY6QvzDJX8VjeHXb/bMMceCvpA8ctPxEO7EFGwofWTI4De5ISaH69xHM8yiWbePCK
	9q5zmEt6QYut1CnCyQA4UV7q5F3WzexlORir8YEqfYkzBCT7BVBnq8HYvT+BhZM9Gxk84GRn
	HcHid+Djy5oNTQKc0M9xWfw9bNB0buCP4Gjf8noa/rqBBNY07mfpj+HT/CInDUk3OPLCnV3B
	DRYairksLYRZGSJWvRsWafL+M+2rMHAKgJjZdBVmU0hmUxjmf99rAKsEXnSSIk5GK/zj6W/9
	FNI4RVK8zO+rhLhasP7NH692ztWDq5Ozfq2AwwetAPK5Yk+hJfORTCSMkqak0vKEk/KkWFrR
	CnbwMbGX8LrxgkxEyqTn6G9oOpGWv+ly+C7bz3P2HGbcT6a4plP4TsvOCqN7MuOtfDnuO9RW
	zBTpZpczC0v0oSdoJdXQtnpIGjTnmR4TJA7XKhYlS0dy8eOq8FMrOzIffBcWafoN3xak2tsV
	HXgseG9I1SHb+Cu3t4+eiOhdcPOP0592N5x5GPju7XT5r/kve0dHUgJbLvXcTryp8m0Rm/Jc
	tU8s+Z9LXEfv8D5bXlwLeRbDlLdNS07blmHY84Pq0DSPLyfHz0y/lzS8RVm1rTI1MPnrMHNq
	f9XhNSbC3N++6w/si13hyw8k0VMBFl1fyZLPwUflP9zyHPIvDt6958o+79yz9yZjSi7qBtKO
	ZpcqJzx8XT+YU5yNaoKfKraKMUW01P99rlwh/RcRosxdVQQAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrMKsWRmVeSWpSXmKPExsVy+t/xe7pP1h5LNzj2QtjixPVFTBZbf89i
	t1iz9xyTxfwj51gt7l3awmRx5et7Not1Ty+wW7zY28hicW3FXHaL5mPr2SxezrrHZnH+/AZ2
	i48991gtLu+aw2bxufcIo8W2zy1sFmuP3GW3WPhxK4vFkh27GC3aOpexWlw85Wpx994JFouX
	l3uYLdpm8Vv837OD3eLftY0sFrPf7We32PJmIqvF8bXhFi37p7A4yHm8v9HK7vHm5UsWj8Md
	X9g99n5bwOKxc9Zddo+enWcYPTat6mTzuHNtD5vHvJOBHve7jzN5bF5S79Gy9hiTR/9fA4/3
	+66yefRtWcXocan5OnuAUJSeTVF+aUmqQkZ+cYmtUrShhZGeoaWFnpGJpZ6hsXmslZGpkr6d
	TUpqTmZZapG+XYJexvMT05kLPvNWnNzm1sC4nLuLkZNDQsBEovPlJkYQW0hgKaPE12XsEHEZ
	iWvdL1kgbGGJP9e62LoYuYBqXjNKPHh2E6yIV8BO4veEy2wgNouAikTH9TWsEHFBiZMzn4A1
	iwrIS9y/NQOsXlggXOLAvXYmEFtEQFPi+t/vrCBDmQX2sEoc3vwZasNmJon5rQuYQaqYBcQl
	bj2ZD9bBJmAk8WD5fLANnECbXy7sAtrAAVSjLrF+nhBEubxE89bZzBMYhWYhuWMWkkmzEDpm
	IelYwMiyilEktbQ4Nz232FCvODG3uDQvXS85P3cTIzB1bTv2c/MOxnmvPuodYmTiYDzEKMHB
	rCTCe6v9aLoQb0piZVVqUX58UWlOavEhRlNgWExklhJNzgcmz7ySeEMzA1NDEzNLA1NLM2Ml
	cV63y+fThATSE0tSs1NTC1KLYPqYODilGpiYo/WWdH+RlJnx7UKw6sv3fJkf9TSPfAh6pND1
	R1A9vvntv3g/4YYenfPRhZb1L5blmUetDzBeXpUz/bjhujOzVlm99iplNTVY0Hdwq7dVgtpO
	1m/yQUEnGPgf3qm4rxg9s/nQ6fNMhgy6DFd3f70npuWdq/nm3a0LPzcuvOV//tfvp5emnnMS
	PvlY3WPriwUVDNVaCt29x/Qyzk6NXjh7y2L9Rbs/i604XOF2S5l/Vl7sAen0Tdt+hcXdqzq8
	4tQj7t/CJhI/XHbktrAd0/j/6/yOnSrFPv1Bb9e5RnS86DgpqXHp4YOpmi7CDE0O8u+F/ry/
	KqVi3lZupLNQrv+rzYLupd9ndbdsYdBez8CgxFKckWioxVxUnAgAez73NOYDAAA=
X-CMS-MailID: 20250304073812eucas1p15180503dcd7cc128c2f3c06a3425b415
X-Msg-Generator: CA
X-RootMTR: 20250219140249eucas1p1291eb86c932373c847a3314ae54789d5
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20250219140249eucas1p1291eb86c932373c847a3314ae54789d5
References: <CGME20250219140249eucas1p1291eb86c932373c847a3314ae54789d5@eucas1p1.samsung.com>
	<20250219140239.1378758-1-m.wilczynski@samsung.com>
	<20250221-eminent-squirrel-of-honor-dee80d@krzk-bin>
	<90d0d409-f374-4e06-bc69-b9bf0622959d@samsung.com>
	<7ba53937-7922-41da-a7ed-909ce620db1f@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250303_233819_135196_FB441ACD 
X-CRM114-Status: GOOD (  15.14  )
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

CgpPbiAzLzMvMjUgMTg6NDMsIEtyenlzenRvZiBLb3psb3dza2kgd3JvdGU6Cj4gT24gMDMvMDMv
MjAyNSAwOTozOCwgTWljaGFsIFdpbGN6eW5za2kgd3JvdGU6Cj4+Cj4+Cj4+IE9uIDIvMjEvMjUg
MTA6MTIsIEtyenlzenRvZiBLb3psb3dza2kgd3JvdGU6Cj4+PiBPbiBXZWQsIEZlYiAxOSwgMjAy
NSBhdCAwMzowMjoxOFBNICswMTAwLCBNaWNoYWwgV2lsY3p5bnNraSB3cm90ZToKPj4+PiBUaGUg
TGljaGVlUGkgNEEgYm9hcmQsIGZlYXR1cmluZyB0aGUgVC1IRUFEIFRIMTUyMCBTb0MsIGluY2x1
ZGVzIGFuIEltYWdpbmF0aW9uCj4+Pj4gVGVjaG5vbG9naWVzIEJYTS00LTY0IEdQVS4gSW5pdGlh
bCBzdXBwb3J0IGZvciB0aGlzIEdQVSB3YXMgcHJvdmlkZWQgdGhyb3VnaCBhCj4+Pj4gZG93bnN0
cmVhbSBkcml2ZXIgWzFdLiBSZWNlbnRseSwgZWZmb3J0cyBoYXZlIGJlZW4gbWFkZSB0byB1cHN0
cmVhbSBzdXBwb3J0IGZvcgo+Pj4+IHRoZSBSb2d1ZSBmYW1pbHkgR1BVcywgd2hpY2ggdGhlIEJY
TS00LTY0IGlzIHBhcnQgb2YgWzJdLgo+Pj4+Cj4+Pj4gV2hpbGUgdGhlIGluaXRpYWwgdXBzdHJl
YW0gZHJpdmVyIGZvY3VzZWQgb24gdGhlIEFYRS0xLTE2IEdQVSwgbmV3ZXIgcGF0Y2hlcwo+Pj4+
IGhhdmUgaW50cm9kdWNlZCBzdXBwb3J0IGZvciB0aGUgQlhTLTQtNjQgR1BVIFszXS4gVGhlIG1v
ZGVybiB1cHN0cmVhbQo+Pj4+IGRybS9pbWFnaW5hdGlvbiBkcml2ZXIgaXMgZXhwZWN0ZWQgdG8g
c3VwcG9ydCB0aGUgQlhNLTQtNjQgYXMgd2VsbCBbNF1bNV0uIEFzCj4+Pj4gdGhpcyBzdXBwb3J0
IGlzIGJlaW5nIGRldmVsb3BlZCwgaXQncyBjcnVjaWFsIHRvIHVwc3RyZWFtIHRoZSBuZWNlc3Nh
cnkgZ2x1ZQo+Pj4+IGNvZGUgaW5jbHVkaW5nIGNsb2NrIGFuZCBwb3dlci1kb21haW4gZHJpdmVy
cyBzbyB0aGV5J3JlIHJlYWR5IGZvciBpbnRlZ3JhdGlvbgo+Pj4+IHdpdGggdGhlIGRybS9pbWFn
aW5hdGlvbiBkcml2ZXIuCj4+Pj4KPj4+Cj4+PiBUaGlzIGlzIHY1IG9mIGJpZyBwYXRjaHNldCB3
aGljaCBiZWNhbWUgaHVnZS4gSSB1bmRlcnN0YW5kIHlvdSBkaWQgbGlrZQo+Pj4gdGhhdCBmb3Ig
djEgd2hpY2ggd2FzIFJGQy4gQnV0IGl0IHN0b3BwZWQgYmVpbmcgUkZDLgo+Pj4KPj4+IFNwbGl0
IHlvdXIgcGF0Y2hzZXQsIGtlZXBpbmcgdmVyc2lvbmluZyBhbmQgY2hhbmdlbG9nLCBwZXIgc3Vi
c3lzdGVtLgo+Pgo+PiBTb3JyeSBmb3IgdGhlIGxhdGUgcmVwbHnigJRJIGRpZG4ndCBoYXZlIGFj
Y2VzcyB0byBlbWFpbC4gSSBhZ3JlZSB3aXRoCj4+IHlvdXIgc3VnZ2VzdGlvbiBhbmQgd2lsbCBz
ZW5kIHRoZSBjbG9jayBjaGFuZ2VzLCBmaXJtd2FyZS9wb3dlciBkb21haW4sCj4+IHJlc2V0LCBh
bmQgZHJtL2ltYWdpbmF0aW9uIHVwZGF0ZXMgYXMgc2VwYXJhdGUgcGF0Y2hzZXRzIGZvciBtZXJn
aW5nLgo+IAo+IAo+IEhvdyBkaWQgeW91IGltcGxlbWVudCBhYm92ZSBjb21tZW50PyBZb3UgZGlk
IHRoZSBzcGxpdCwgcmlnaHQ/IFdoZXJlIGlzCj4gdmVyc2lvbmluZyBhbmQgd2hlcmUgYXJlIGNo
YW5nZWxvZ3M/CgpTbyBJIHRob3VnaHQgdGhlIHN1Yi1zZXJpZXMgc2hvdWxkIGJlIHZlcnNpb25l
ZCBpbmRlcGVuZGVudGx5IGZyb20gdjEgPwpUaGVuIGxpbmtlZCB0aGUgcHJldmlvdXMgZGlzY3Vz
c2lvbnMgaW4gdGhlIGNvdmVyIGxldHRlciwgd2l0aG91dApjb3B5aW5nIHRoZW0uCgo+IAo+IAo+
IEJlc3QgcmVnYXJkcywKPiBLcnp5c3p0b2YKPiAKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNj
dkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4v
bGlzdGluZm8vbGludXgtcmlzY3YK
