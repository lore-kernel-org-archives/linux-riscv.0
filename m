Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DEB7C369C2
	for <linux-riscv@archiver.kernel.org>; Wed, 16 Apr 2025 11:22:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:From:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yRFNcsqaPVcrdYBVVUOdeHx2UfciDLImUeR+Hwot0SU=; b=RldNCxET2govAv
	fzRb8o7ELdh9FjYskVuEtXW/wq0nBS29b1kFEchNii165kBNp45TRLzM4z6Bk7IeLM0j970ZyD2N7
	xdC976aljqONDfwBqaAshpHHoMDVTaq5W1lIlQ7vEr5i0yORxoII7uPPlz0q8vxhO7b4jNCv3d3CT
	ij/I/c5QvZ2nLhbWxzrFwIshwQmtbLTc+yIS4BiKbzjTA2BjSSYCtQ4WbbO9FPivhcNDgE3fhO1q/
	NUhchplDOxZiWsgIPBi5Xo/6uxYmAVHZGqkWe52lMckO2+XGsz/BCON/BWUHJOG6LoX4Al303ai45
	7P/hOBe7wyO+7oHD8TFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u50qr-00000009KaQ-0hWd;
	Wed, 16 Apr 2025 11:22:45 +0000
Received: from mailout2.w1.samsung.com ([210.118.77.12])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u50ql-00000009KZt-3t8g
	for linux-riscv@lists.infradead.org;
	Wed, 16 Apr 2025 11:22:43 +0000
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
	by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20250416112234euoutp021805aab77542e3cf7bd2e86a79005dc3~2yK3fBY0O1783417834euoutp028
	for <linux-riscv@lists.infradead.org>; Wed, 16 Apr 2025 11:22:34 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20250416112234euoutp021805aab77542e3cf7bd2e86a79005dc3~2yK3fBY0O1783417834euoutp028
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1744802554;
	bh=o/JZlQdMxe3Mo96yx/aJSrBGKnbJT9wWiAHIxzblxxQ=;
	h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
	b=AxZYzZ9YXRriyj+u6GV4T3daSjhmA0EkHr+2pGi+tfWsfBsq2pZhGIK/ULw+DhMq6
	 WelXZ4Yw6GGYMWhiB+3LytLiq05iA/y9IQNJkbmT8/ZuYC+azzKxiU8uE+Ivy5ZqM/
	 Z50NBO+4FcKoxg26bq8P2y3ZX0/8RqwKEIy7s9Dc=
Received: from eusmges1new.samsung.com (unknown [203.254.199.242]) by
	eucas1p2.samsung.com (KnoxPortal) with ESMTP id
	20250416112234eucas1p208c7db55a031e7309e207c39b3fd2822~2yK2-DgQC2586025860eucas1p2f;
	Wed, 16 Apr 2025 11:22:34 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
	eusmges1new.samsung.com (EUCPMTA) with SMTP id F4.96.20821.AF29FF76; Wed, 16
	Apr 2025 12:22:34 +0100 (BST)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
	eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
	20250416112233eucas1p10bb8e43a0c391392501d48c7dace23b6~2yK2YMxp11951519515eucas1p1y;
	Wed, 16 Apr 2025 11:22:33 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
	eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
	20250416112233eusmtrp10af3df9bf1f76b1c37a2f539cc012007~2yK2XMO-p2331123311eusmtrp1F;
	Wed, 16 Apr 2025 11:22:33 +0000 (GMT)
X-AuditID: cbfec7f2-b11c470000005155-43-67ff92fa36dd
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
	eusmgms1.samsung.com (EUCPMTA) with SMTP id E0.19.19920.9F29FF76; Wed, 16
	Apr 2025 12:22:33 +0100 (BST)
Received: from [192.168.1.44] (unknown [106.210.136.40]) by
	eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20250416112232eusmtip2f05b1e8bb84da2e08f38a19a071633bc~2yK1D-LF52910429104eusmtip2i;
	Wed, 16 Apr 2025 11:22:32 +0000 (GMT)
Message-ID: <02e21251-5c02-420d-81f2-d6f241e0212d@samsung.com>
Date: Wed, 16 Apr 2025 13:22:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 19/21] riscv: dts: thead: Introduce power domain
 nodes with aon firmware
To: Drew Fustini <drew@pdp7.com>
Cc: mturquette@baylibre.com, sboyd@kernel.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, guoren@kernel.org, wefu@redhat.com,
	jassisinghbrar@gmail.com, paul.walmsley@sifive.com, palmer@dabbelt.com,
	aou@eecs.berkeley.edu, frank.binns@imgtec.com, matt.coster@imgtec.com,
	maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
	airlied@gmail.com, simona@ffwll.ch, ulf.hansson@linaro.org,
	jszhang@kernel.org, p.zabel@pengutronix.de, m.szyprowski@samsung.com,
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
	dri-devel@lists.freedesktop.org, linux-pm@vger.kernel.org
Content-Language: en-US
From: Michal Wilczynski <m.wilczynski@samsung.com>
In-Reply-To: <Z/6p6MQDS8ZlQv5r@x1>
X-Brightmail-Tracker: H4sIAAAAAAAAA02Te0xTVxzHOffe3luaFa7F0TOHkVwdiW4DBBNOtsXANrJrTDaIkiUmTBu5
	KQYKrhVRgwECdODKUB5xa+d4zEnHBgRWKq08HFTKa50C41EeugQXS3jIq51s0tFet/Hf5/s7
	3/N75RwhLmkjdwnPpJ3jlGmyVIYUEcaeZ7Y3N0rd8nDXHRL1jtVgqOUvLYV+bLdhqNJiE6CZ
	IQOGRtaXSNTw+D6FnrTnEmhUf4NCeT2NJHJoZ0i0rJkRoGHz1yRaLbYAZFzNJ1G9ZZpC1cst
	BLrZagZIXXRLgB70x6LpmV4COYY1OFJr/ZG7rZVCm6NNBNItdlLIMH9NgKz1H6P8znIieje7
	NF5AsfMOB8F2F65RbLuzimBN2mmK1ZgGAdtcV0SyU6NtJPtNXzz78HMrxv50M5vNr+/B2JLn
	4exSx28k+4WhDrBDeWNUnOSE6J0kLvXMeU4ZdviUKHmu4Hf8bI30woIrOQc0BVwBQiGkD0HL
	vb1XgEgoofUA6tXrJC/WAJyf68B5sQrgqDpvS/h6b2wOfUfwB7UAfrtupXixAKDLfg/zuMT0
	Ydi7VEp5mKBfg39OVgn4+A7Y99Us4eGX6T3wof1LryeAlsEJg4n08E46GNr0Q5gnKU7/IICW
	u6vepDgthfbZSi+TdAR8VFvpTepLM/CXTTfJe/bAvBadt29I94mgursI4/t+H9YuLJA8B8A5
	q4HiOQgOlGkIntPho5aVF3NmQZPG+oLfhlO2DdKzMZzeDxvNYXw4Bo4NPCb4RfrB8YUdfAt+
	sNR4HefDYliolvDuEFihKf6vqE1vxK4CRrttK9ptQ2q3DaP9v24VIOqAlMtQKeSc6mAalxmq
	kilUGWny0NPpimaw9cAHNq0rreDG3HJoF8CEoAtAIc7sFNuiNuUScZLs4iVOmX5SmZHKqbrA
	q0KCkYprOgvkElouO8elcNxZTvnvKSb03ZWD7dtdduF0QnD0XZFuv2ImMFxbOYjr4sP8EtOY
	TyNDxvVqc4zoiN45uH75wfNjny0fr451RpX02liyIcZdPet71d2peK980hEi8LmYUozFJdzO
	ynMpExXR5pSJA1zy1leCU9mZ6r8DmWlpU8do1NGRjhMoN+kD86EPHR8FWqqC/hg2hV5/K9M/
	y9n/bqBPiU+b72JN+RP7MZ1fd9ea4RpTXTZZsXIprux25J37G8m/Vmh/jjipiMb2EgmvvNEo
	72WEOcEN3z81jlS5LrsI/2ehT4+IFhW1roSIyET7J68XCir7T0XFjsXPBzXlDkz0NQ/1hMe5
	fc47bXZ1Rja1cuslhlAlyw4ewJUq2T8MHt+WTwQAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrPKsWRmVeSWpSXmKPExsVy+t/xe7o/J/1PN7iyW9LixPVFTBZbf89i
	t1iz9xyTxfwj51gt7l3awmRx5et7Not1Ty+wW7zY28hicW3FXHaL5mPr2SxezrrHZvGx5x6r
	xeVdc9gsPvceYbTY9rmFzWLtkbvsFgs/bmWxWLJjF6NFW+cyVouLp1wt7t47wWLx8nIPs0Xb
	LH6L/3t2sFv8u7aRxWL2u/3sFlveTGS1OL423KJl/xQWB1mP9zda2T3evHzJ4nG44wu7x95v
	C1g8ds66y+7Rs/MMo8emVZ1sHneu7WHzmHcy0ON+93Emj81L6j1a1h5j8uj/a+Dxft9VNo++
	LasYPS41X2cPEIrSsynKLy1JVcjILy6xVYo2tDDSM7S00DMysdQzNDaPtTIyVdK3s0lJzcks
	Sy3St0vQy3jV+pC5YJF4xdvvGQ2MG4W7GDk5JARMJP5dWsrSxcjFISSwlFHi4cHr7BAJGYlr
	3S9ZIGxhiT/Xutggil4zStyc+o0RJMErYCdx4v0ksAYWAVWJH7cXsELEBSVOznwC1iwqIC9x
	/9YMsBphgUSJaWsgFogIKEicW3GJCWQos8BqVonlX+8yQmz4wSixbMNFJpAqZgFxiVtP5oPZ
	bAJGEg+WzwfbwCmgJHH233+gkziAatQl1s8TgiiXl2jeOpt5AqPQLCR3zEIyaRZCxywkHQsY
	WVYxiqSWFuem5xYb6hUn5haX5qXrJefnbmIEpqxtx35u3sE479VHvUOMTByMhxglOJiVRHjP
	mf9LF+JNSaysSi3Kjy8qzUktPsRoCgyLicxSosn5wKSZVxJvaGZgamhiZmlgamlmrCTO63b5
	fJqQQHpiSWp2ampBahFMHxMHp1QDU0yFxBpPd1M2P87bZtd0FQ/M7J0y6WHS4T6e8DSV630v
	98e8v6f+cOWxs79Y7u1tWPBpcmVsXs2lhfIvzBtmbQm+EDLJMS+2+RV31qTLLc8uv2i8rjzH
	VjQydgrLWqlFb2cf2S0poHlBVuBtlO5PkR/nDzXZJax8vFdt2ZnzlgFaL8p/MGnFaj75z9Zo
	W/JBtjLk8T+Lk9+eLuP/GuKap1S17HT0G+bO0+1fuw9tKxcwm8JhMtlPR1rwE49uyppiG1nD
	I9GaAYmnTJsZnNZWf/ix+cR6hi270tbHd6i3/WOeIhq3USb/yJc9rcnSbFXzNykeM9Nme9no
	b13ZO7t0to7eUqZVbWV7ZK2XSOelKbEUZyQaajEXFScCAHoYScPiAwAA
X-CMS-MailID: 20250416112233eucas1p10bb8e43a0c391392501d48c7dace23b6
X-Msg-Generator: CA
X-RootMTR: 20250219140315eucas1p10f08d297580edd114f4c487c1fbffa8d
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20250219140315eucas1p10f08d297580edd114f4c487c1fbffa8d
References: <20250219140239.1378758-1-m.wilczynski@samsung.com>
	<CGME20250219140315eucas1p10f08d297580edd114f4c487c1fbffa8d@eucas1p1.samsung.com>
	<20250219140239.1378758-20-m.wilczynski@samsung.com> <Z/2+rbhsaBP0DQop@x1>
	<Z/6p6MQDS8ZlQv5r@x1>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250416_042240_524177_4FF4ABDF 
X-CRM114-Status: GOOD (  17.50  )
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

CgpPbiA0LzE1LzI1IDIwOjQ4LCBEcmV3IEZ1c3Rpbmkgd3JvdGU6Cj4gT24gTW9uLCBBcHIgMTQs
IDIwMjUgYXQgMDc6MDQ6MjlQTSAtMDcwMCwgRHJldyBGdXN0aW5pIHdyb3RlOgo+PiBPbiBXZWQs
IEZlYiAxOSwgMjAyNSBhdCAwMzowMjozN1BNICswMTAwLCBNaWNoYWwgV2lsY3p5bnNraSB3cm90
ZToKPj4+IFRoZSBEUk0gSW1hZ2luYXRpb24gR1BVIHJlcXVpcmVzIGEgcG93ZXItZG9tYWluIGRy
aXZlci4gSW4gdGhlIFQtSEVBRAo+Pj4gVEgxNTIwIFNvQyBpbXBsZW1lbnRzIHBvd2VyIG1hbmFn
ZW1lbnQgY2FwYWJpbGl0aWVzIHRocm91Z2ggdGhlIEU5MDIKPj4+IGNvcmUsIHdoaWNoIGNhbiBi
ZSBjb21tdW5pY2F0ZWQgd2l0aCB0aHJvdWdoIHRoZSBtYWlsYm94LCB1c2luZyBmaXJtd2FyZQo+
Pj4gcHJvdG9jb2wuCj4+Pgo+Pj4gQWRkIEFPTiBub2RlLCB3aGljaCBzZXJ2ZXJzIGFzIGEgcG93
ZXItZG9tYWluIGNvbnRyb2xsZXIuCj4+Pgo+Pj4gU2lnbmVkLW9mZi1ieTogTWljaGFsIFdpbGN6
eW5za2kgPG0ud2lsY3p5bnNraUBzYW1zdW5nLmNvbT4KPj4+IC0tLQo+Pj4gIGFyY2gvcmlzY3Yv
Ym9vdC9kdHMvdGhlYWQvdGgxNTIwLmR0c2kgfCA4ICsrKysrKysrCj4+PiAgMSBmaWxlIGNoYW5n
ZWQsIDggaW5zZXJ0aW9ucygrKQo+Pj4KPj4+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2Jvb3Qv
ZHRzL3RoZWFkL3RoMTUyMC5kdHNpIGIvYXJjaC9yaXNjdi9ib290L2R0cy90aGVhZC90aDE1MjAu
ZHRzaQo+Pj4gaW5kZXggMTk3ZGYxZjMyYjI1Li40NzRmMzE1NzZhMWIgMTAwNjQ0Cj4+PiAtLS0g
YS9hcmNoL3Jpc2N2L2Jvb3QvZHRzL3RoZWFkL3RoMTUyMC5kdHNpCj4+PiArKysgYi9hcmNoL3Jp
c2N2L2Jvb3QvZHRzL3RoZWFkL3RoMTUyMC5kdHNpCj4+PiBAQCAtNiw2ICs2LDcgQEAKPj4+ICAK
Pj4+ICAjaW5jbHVkZSA8ZHQtYmluZGluZ3MvaW50ZXJydXB0LWNvbnRyb2xsZXIvaXJxLmg+Cj4+
PiAgI2luY2x1ZGUgPGR0LWJpbmRpbmdzL2Nsb2NrL3RoZWFkLHRoMTUyMC1jbGstYXAuaD4KPj4+
ICsjaW5jbHVkZSA8ZHQtYmluZGluZ3MvcG93ZXIvdGhlYWQsdGgxNTIwLXBvd2VyLmg+Cj4+PiAg
Cj4+PiAgLyB7Cj4+PiAgCWNvbXBhdGlibGUgPSAidGhlYWQsdGgxNTIwIjsKPj4+IEBAIC0yMjks
NiArMjMwLDEzIEBAIHN0bW1hY19heGlfY29uZmlnOiBzdG1tYWMtYXhpLWNvbmZpZyB7Cj4+PiAg
CQlzbnBzLGJsZW4gPSA8MCAwIDY0IDMyIDAgMCAwPjsKPj4+ICAJfTsKPj4+ICAKPj4+ICsJYW9u
OiBhb24gewo+Pj4gKwkJY29tcGF0aWJsZSA9ICJ0aGVhZCx0aDE1MjAtYW9uIjsKPj4+ICsJCW1i
b3hlcyA9IDwmbWJveF85MTB0IDE+Owo+Pj4gKwkJbWJveC1uYW1lcyA9ICJhb24iOwo+Pj4gKwkJ
I3Bvd2VyLWRvbWFpbi1jZWxscyA9IDwxPjsKPj4+ICsJfTsKPj4+ICsKPj4+ICAJc29jIHsKPj4+
ICAJCWNvbXBhdGlibGUgPSAic2ltcGxlLWJ1cyI7Cj4+PiAgCQlpbnRlcnJ1cHQtcGFyZW50ID0g
PCZwbGljPjsKPj4+IC0tIAo+Pj4gMi4zNC4xCj4+Pgo+Pgo+PiBSZXZpZXdlZC1ieTogRHJldyBG
dXN0aW5pIDxkcmV3QHBkcDcuY29tPgo+Pgo+PiBJIHRlc3RlZCB0aGlzIG9uIHRvcCBvZiA2LjE1
LXJjMSBhbmQgZm91bmQgbm8gaXNzdWVzLgo+Pgo+PiAtRHJldwo+IAo+IEkndmUgYXBwbGllZCB0
byB0aGVhZC1kdC1mb3ItbmV4dDoKPiBodHRwczovL3Byb3RlY3QyLmZpcmVleWUuY29tL3YxL3Vy
bD9rPTJmM2I3NDFiLTRlYjA2MTNiLTJmM2FmZjU0LTc0ZmU0ODVmYjM0Ny1iZWVhYzAwNzc3M2E5
ODJjJnE9MSZlPWViNmI0ZGRhLWMwMmEtNGUwYS04MzFhLWEyOGQwNDg5ZjZjMyZ1PWh0dHBzJTNB
JTJGJTJGZ2l0aHViLmNvbSUyRnBkcDclMkZsaW51eCUyRmNvbW1pdCUyRjJiYWU0NmUzZGUyYTY0
ZmUzYTYxOWQ2MWIxNmRhMGMwMWI4ZGYyYTEKPiAKPiBNaWNoYWwgLSBhcmUgdGhlcmUgYW55IG90
aGVyIGR0cyBwYXRjaGVzIHRoYXQgSSBzaG91bGQgY29uc2lkZXIgZm9yIDYuMTYKPiBQUj8gIEkg
d291bGQgcHJvYmFibHkgc2VuZCB0byBBcm5kIGFyb3VuZCA2LjE1LXJjMyBvciA2LjE1LXJjNC4K
ClRoYW5rcyBmb3IgdGhlIGhlYWRzLXVwLgoKSSB0aGluayB0aGUgcmVzZXQgRFQgbm9kZSB3b3Vs
ZCBiZSBhIGdvb2QgY2FuZGlkYXRlIGZvciBpbmNsdXNpb24gWzFdLgpEZXBlbmRpbmcgb24gaG93
IHRoZSBjbG9jayBzZXJpZXMgZXZvbHZlcywgd2UgbWlnaHQgYWxzbyBjb25zaWRlciB0aGlzCmNv
bW1pdCB3aXRob3V0IHRoZSByZXNldCBwYXJ0IFsyXS4gU2ltaWxhcmx5LCBpZiB0aGUgUE0gc2Vy
aWVzIGxhbmRzIGluCnRpbWUsIHdlIG1heSB3YW50IHRvIHVwZGF0ZSB0aGUgYW9uIG5vZGUgdG8g
aW5jbHVkZSB0aGUgcmVzZXQgWzNdLgoKVG8gYXZvaWQgYW55IGxhc3QtbWludXRlIGlzc3Vlcywg
SSBjYW4gc2VuZCBhIHNlcGFyYXRlIERULW9ubHkgc2VyaWVzCnRoYXQgaW5jbHVkZXMgYWxsIHJl
bGV2YW50IHBhdGNoZXMgdGFyZ2V0aW5nIHRoZSBuZXh0IHJlbGVhc2UuIEp1c3QgZ2l2ZQptZSBh
IGhlYWRzLXVwIGEgZmV3IGRheXMgYmVmb3JlIHlvdXIgUFIsIGFuZCBJ4oCZbGwgbWFrZSBzdXJl
IGV2ZXJ5dGhpbmcKaXMgcmVhZHkuCgpCZXN0IHJlZ2FyZHMsCk1pY2hhxYIKClsxXSAtIGh0dHBz
Oi8vbG9yZS5rZXJuZWwub3JnL2FsbC8yMDI1MDIxOTE0MDIzOS4xMzc4NzU4LTIxLW0ud2lsY3p5
bnNraUBzYW1zdW5nLmNvbS8KWzJdIC0gaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvYWxsLzIwMjUw
MjE5MTQwMjM5LjEzNzg3NTgtMTktbS53aWxjenluc2tpQHNhbXN1bmcuY29tLwpbM10gLSBodHRw
czovL2xvcmUua2VybmVsLm9yZy9hbGwvMjAyNTA0MTQtYXByXzE0X2Zvcl9zZW5kaW5nLXYyLTIt
NzBjNWFmMmFmOTZjQHNhbXN1bmcuY29tLwoKPiAKPiBUaGFua3MsCj4gRHJldwo+IAoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFp
bGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmlu
ZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
