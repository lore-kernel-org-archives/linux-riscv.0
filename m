Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B5A0C282D3
	for <linux-riscv@archiver.kernel.org>; Wed,  5 Mar 2025 08:18:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:From:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3kF6GQZC9Iwccpb0Xzs+FZer+O3aZL6m5v3w939WW1I=; b=mGImtVMvnsa3fB
	bpqr4bWA0ygVLYyfh6ZzGl2yE35yaWGHbrqnINKPueBHR5UwRumZGJ6KGSa5zI9GbZkPMQhSmvL0Q
	nR9t/q6q+iycMSGutpZ2QJ4ya+gcSxBNWqmwqMVOpkdgZRsbdRd2pvYf18eL/0tFJq093ozf+JAfW
	pYYdFgbeoeQt5ymoumYzoE9OACZTGOTeg61eNM+rJssyRvwLX32pjfqwofZA+kyoj+nryTVqYdk0L
	a/d/Q3KmNXX6vAj8PJ4pDco1N7QqocX3qdLixMSfn5vLRp2ovlQSmD0ws08EpXNdr+CSgiwpeYrLE
	9DACxkP3WQentI7QtRlw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpjxW-00000007LYi-2bHZ;
	Wed, 05 Mar 2025 08:18:30 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpjxU-00000007LXY-0usl
	for linux-riscv@bombadil.infradead.org;
	Wed, 05 Mar 2025 08:18:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=References:Content-Type:
	Content-Transfer-Encoding:In-Reply-To:From:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=z4bDXZf0zsJpmZ4gA2EzfPRJzWcAnMN3iUbKKNxEAqw=; b=ESwxdV9LH1m2IsSKKb2CKiO/SD
	UqDN35sVd0B0l1O6EMRIpU2lfb3T6puoH9FtDs8ScafcXlAYLGV/1GkFzidpY2tc2191An0kKJpIj
	jvdtdYQjthbKVsYyA+KrxKakeR/htHRpgNg9AwGfL+P2/fQFuTnmYkzb6Wkmf5irtAn4LUxcW3QFN
	NKQY8ckvBgvKMmA3L3Ffio8pnoulZwOYXslhH8FSP/cL4WwpseAlWFRj6o1iwBnl0y/PFTZsRVm51
	lvDS1yllGn2lss5D9Q6TRgV2Legqc6exySIzkAMxUPWfjuBmoqqMqmZwSqWSCb/bOqssomHfaVVcV
	izoJnAwA==;
Received: from mailout1.w1.samsung.com ([210.118.77.11])
	by casper.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpjxQ-000000055VK-2nvo
	for linux-riscv@lists.infradead.org;
	Wed, 05 Mar 2025 08:18:26 +0000
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
	by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20250305081820euoutp0112f185ea2bdfc89f17a5026e2bd22907~p2kBLO3xs1587715877euoutp01d
	for <linux-riscv@lists.infradead.org>; Wed,  5 Mar 2025 08:18:20 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20250305081820euoutp0112f185ea2bdfc89f17a5026e2bd22907~p2kBLO3xs1587715877euoutp01d
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1741162700;
	bh=z4bDXZf0zsJpmZ4gA2EzfPRJzWcAnMN3iUbKKNxEAqw=;
	h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
	b=U4AZgIbJrV0ftB2eAPxu4/Q1MpiU7XHy4CJk37GMm6A3SKoWflD3QOk6rP9NBpXrD
	 MpOUWrNkmGXu8en1XNJuSblch/tleiU80mgmuBIjMvzQQ0jqBpOpEuRGH+Q9PweUPN
	 8eSZvmr2zf9XYgaxq9FKfhrPJ2ifKJ/5XZkMggU8=
Received: from eusmges3new.samsung.com (unknown [203.254.199.245]) by
	eucas1p1.samsung.com (KnoxPortal) with ESMTP id
	20250305081820eucas1p18a6b69372f0a694f81bb00b333eef309~p2kA06VGb2579125791eucas1p1Z;
	Wed,  5 Mar 2025 08:18:20 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
	eusmges3new.samsung.com (EUCPMTA) with SMTP id 6C.C7.20397.CC808C76; Wed,  5
	Mar 2025 08:18:20 +0000 (GMT)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
	eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
	20250305081819eucas1p1ad27dd6b7ef53e4ea95adfad46d9dca3~p2kAXXGKD2578725787eucas1p1b;
	Wed,  5 Mar 2025 08:18:19 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
	eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
	20250305081819eusmtrp14276678062258e5a01766bbc121cbd9f~p2kAWl2PV0646206462eusmtrp1R;
	Wed,  5 Mar 2025 08:18:19 +0000 (GMT)
X-AuditID: cbfec7f5-ed1d670000004fad-c5-67c808cc7540
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
	eusmgms2.samsung.com (EUCPMTA) with SMTP id 2D.4B.19654.BC808C76; Wed,  5
	Mar 2025 08:18:19 +0000 (GMT)
Received: from [192.168.1.44] (unknown [106.210.136.40]) by
	eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20250305081818eusmtip26ea063d1e2190b225e572c1a657e70ab~p2j-XBYUu0942709427eusmtip2F;
	Wed,  5 Mar 2025 08:18:18 +0000 (GMT)
Message-ID: <8ffa6276-299c-4a95-8c7d-cbe39c1a1457@samsung.com>
Date: Wed, 5 Mar 2025 09:18:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 0/4] Add T-Head TH1520 VO clock support for LicheePi
 4A GPU enablement
To: mturquette@baylibre.com, sboyd@kernel.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, drew@pdp7.com, guoren@kernel.org,
	wefu@redhat.com, paul.walmsley@sifive.com, palmer@dabbelt.com,
	aou@eecs.berkeley.edu, alex@ghiti.fr, jszhang@kernel.org,
	p.zabel@pengutronix.de, m.szyprowski@samsung.com
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
Content-Language: en-US
From: Michal Wilczynski <m.wilczynski@samsung.com>
In-Reply-To: <20250303143629.400583-1-m.wilczynski@samsung.com>
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrOKsWRmVeSWpSXmKPExsWy7djPc7pnOE6kG1x8ymXx7M5XVoutv2ex
	W6zZe47JYv6Rc6wW9y5tYbJ4sbeRxaL52Ho2i5ez7rFZfOy5x2pxedccNottn1vYLNYeuctu
	cfGUq8XdeydYLF5e7mG2aJvFb/F/zw52i3/XNrJYtOyfwuIg7PH+Riu7x5uXL1k8Dnd8Yfe4
	d2Iaq8emVZ1sHpuX1Hu0rD3G5NH/18Dj/b6rbB59W1Yxelxqvs7u8XmTXABPFJdNSmpOZllq
	kb5dAlfG875WloJzUhWH795jb2A8KtrFyMkhIWAi8f/YLMYuRi4OIYEVjBKv959jgnC+MErc
	atjJDOF8ZpT41P+eEabl9e7TYLaQwHJGicVHayCK3jJKbGh6zwKS4BWwk2jf/IoNxGYRUJGY
	tKeHCSIuKHFy5hOwGlEBeYn7t2awg9jCAvESq+6tZgcZJCKwh0ni+/efzCAJZoEqiR33b7BD
	2OISt57MBxvEJmAk8WD5fFYQm1PAXuLQ9QYWiBp5ieats8HOlhB4ximxbM5qoAYOIMdF4uZe
	dogPhCVeHd8CZctInJ7cwwJh50s82PqJGcKukdjZcxzKtpa4c+4XG8gYZgFNifW79CHCjhI/
	r89hg5jOJ3HjrSDEBXwSk7ZNZ4YI80p0tAlBVKtJTO3phVt6bsU2pgmMSrOQAmUWkh9nIfll
	FsLeBYwsqxjFU0uLc9NTi43zUsv1ihNzi0vz0vWS83M3MQLT5ul/x7/uYFzx6qPeIUYmDsZD
	jBIczEoivK9PHU8X4k1JrKxKLcqPLyrNSS0+xCjNwaIkzrtof2u6kEB6YklqdmpqQWoRTJaJ
	g1OqgSnpG2foPjvGUyUTO033uRqu8zfoi5uusfvR7TsPTM+vtmsN5RKbIvf4tmD3j4sOITrH
	Lk0SiSksNfkhx35pqQjHm9jwx999lzzKE1PrP7O+2uqc1mEetd+Se0K1PjIeubgioWPT3e0X
	npuUJLryvn8086Wx3IMZvleePJOdMWnx3okdN068XKioslbIrJjjdtu2jQfVOrOnuxxRsar5
	tnpvLKPewl8xs+dmilztFf/Tn+H44XJNy/k3r5feP7A4dVnMsydn2oLePxDY9OAV8wnPP5pP
	J5Qe4xc8/OiJ89IUt79PTWZUvvqms+XPs/Z71e8XndUIP65yepXguuCsO00cLF+W8LQrfbb0
	/H1Vp7KmXomlOCPRUIu5qDgRACgaknMKBAAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFupileLIzCtJLcpLzFFi42I5/e/4Pd3THCfSDS63q1g8u/OV1WLr71ns
	Fmv2nmOymH/kHKvFvUtbmCxe7G1ksWg+tp7N4uWse2wWH3vusVpc3jWHzWLb5xY2i7VH7rJb
	XDzlanH33gkWi5eXe5gt2mbxW/zfs4Pd4t+1jSwWLfunsDgIe7y/0cru8eblSxaPwx1f2D3u
	nZjG6rFpVSebx+Yl9R4ta48xefT/NfB4v+8qm0ffllWMHpear7N7fN4kF8ATpWdTlF9akqqQ
	kV9cYqsUbWhhpGdoaaFnZGKpZ2hsHmtlZKqkb2eTkpqTWZZapG+XoJfxvK+VpeCcVMXhu/fY
	GxiPinYxcnJICJhIvN59mrGLkYtDSGApo8SOs5fZIRIyEte6X7JA2MISf651sUEUvWaUuP74
	GhtIglfATqJ98yswm0VARWLSnh4miLigxMmZT8CaRQXkJe7fmgE0lINDWCBeonGqNcgcEYE9
	TBJ/p8wD62UWqJI4v/cKK8SCSYwSLVeWMUMkxCVuPZkPNpRNwEjiwfL5rCA2p4C9xKHrDSwg
	Q5kF1CXWzxOCKJeXaN46m3kCo9AsJGfMQjJpFkLHLCQdCxhZVjGKpJYW56bnFhvpFSfmFpfm
	pesl5+duYgQmim3Hfm7Zwbjy1Ue9Q4xMHIyHGCU4mJVEeF+fOp4uxJuSWFmVWpQfX1Sak1p8
	iNEUGBQTmaVEk/OBqSqvJN7QzMDU0MTM0sDU0sxYSZyX7cr5NCGB9MSS1OzU1ILUIpg+Jg5O
	qQYm/8TgDc/Y+kVnKxw0/Ve37wN//vmDD9o/V+5+M637mbvJswmMy1eWlQi8Lbj0f3VR0imj
	61E5oV9mfJSN+FS0pOb37brWQ8mHGiveOomc/reu4WlZ69HKyGqTQ+t/7QxSi7804Wa3ypki
	qbash2ZnZ3qUPpHcE2txIuiEut+a5aVfPa6wNocuZOzmCI+KPFoV3vvBxZDleK1o878NCUmP
	D9lX9L57fvTPkiCp/3dfpMm8uzM3ReG08kurYyliTh4HJCZXljUu36914n//DHm/jf82BO1X
	4Hybd68muWdniCN7s+im/4p/gsJDKza2d5+bc+eUy7zJdw/xFRiHh55cfIs3QLFULKD2Wlu9
	sa6ZEktxRqKhFnNRcSIAeuKmp50DAAA=
X-CMS-MailID: 20250305081819eucas1p1ad27dd6b7ef53e4ea95adfad46d9dca3
X-Msg-Generator: CA
X-RootMTR: 20250303143634eucas1p269281f72bdc4d764edd54b9427f68787
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20250303143634eucas1p269281f72bdc4d764edd54b9427f68787
References: <CGME20250303143634eucas1p269281f72bdc4d764edd54b9427f68787@eucas1p2.samsung.com>
	<20250303143629.400583-1-m.wilczynski@samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250305_081824_754980_1558F687 
X-CRM114-Status: GOOD (  20.18  )
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

CgpPbiAzLzMvMjUgMTU6MzYsIE1pY2hhbCBXaWxjenluc2tpIHdyb3RlOgo+IFRoaXMgaXMgYSBz
dWJzZXQgb2YgYSBsYXJnZXIgcGF0Y2ggc2VyaWVzIGVuYWJsaW5nIHRoZSBJbWFnaW5hdGlvbiBC
WE0tNC02NCBHUFUKPiBvbiB0aGUgTGljaGVlUGkgNEEgYm9hcmQsIHdoaWNoIGlzIHBvd2VyZWQg
YnkgdGhlIFQtSEVBRCBUSDE1MjAgU29DLiBXaGlsZSB0aGUKPiBmdWxsIHNlcmllcyBpbmNsdWRl
cyBwb3dlci1kb21haW4sIHJlc2V0LCBhbmQgZmlybXdhcmUgY2hhbmdlcywgdGhpcyBwYXJ0Cj4g
Zm9jdXNlcyBzb2xlbHkgb24gdGhlIGNsb2NrIHN1YnN5c3RlbSBuZWVkZWQgZm9yIHRoZSBHUFUg
YW5kIG90aGVyIFZPICh2aWRlbwo+IG91dHB1dCkgYmxvY2tzLiBCeSBtZXJnaW5nIHRoZXNlIGNs
b2NrIHBhdGNoZXMgaW5kZXBlbmRlbnRseSwgd2UgcHJlcGFyZSB0aGUKPiBncm91bmR3b3JrIGZv
ciBmdXR1cmUgR1BVIGludGVncmF0aW9uIHZpYSB0aGUgYGRybS9pbWFnaW5hdGlvbmAgZHJpdmVy
Lgo+IAo+IFRoZSBULUhFQUQgVEgxNTIwIFNvQyBmZWF0dXJlcyBtdWx0aXBsZSBjbG9jayBjb250
cm9sbGVycy4gSW5pdGlhbGx5LCBvbmx5IHRoZQo+IEFQIGNsb2NrIGNvbnRyb2xsZXIgd2FzIHN1
cHBvcnRlZCB1cHN0cmVhbS4gVGhlIHBhdGNoZXMgYmVsb3cgYWRkIHN1cHBvcnQgZm9yCj4gdGhl
IFZPICh2aWRlbyBvdXRwdXQpIGNsb2NrIGNvbnRyb2xsZXIsIHdoaWNoIG1hbmFnZXMgR1BVLXJl
bGF0ZWQgZ2F0ZXMsIEhETUksCj4gYW5kIG90aGVyIG11bHRpbWVkaWEgY2xvY2tzLiBBZGRpdGlv
bmFsbHksIHRoZXkgaW50cm9kdWNlIGEgbWVjaGFuaXNtIHRvCj4gcHJvdmlkZSBuby1vcCBvcGVy
YXRpb25zIGZvciB0aGUgR1BVJ3MgIm1lbSIgY2xvY2sgZ2F0ZSAoZG9jdW1lbnRlZCBhcwo+IOKA
nFJlc2VydmVk4oCdIGluIHRoZSBoYXJkd2FyZSBtYW51YWwpIGFuZCBjb29yZGluYXRlIHRoZSBH
UFUgQ0xLR0VOIHJlc2V0IGluIHRoZQo+IGNsb2NrIGRyaXZlci4KPiAKPiBCaWdnZXIgc2VyaWVz
IGNvdmVyIGxldHRlcjoKPiAKPiBodHRwczovL2xvcmUua2VybmVsLm9yZy9hbGwvMjAyNTAyMTkx
NDAyMzkuMTM3ODc1OC0xLW0ud2lsY3p5bnNraUBzYW1zdW5nLmNvbS8KClRoaXMgc2VyaWVzIHNo
b3VsZCBiZSB2ZXJzaW9uZWQgYXMgdjYsIHRvIG1haW50YWluIGNvbnRpbnVpdHkgd2l0aCB0aGUK
YmlnZ2VyIHBhdGNoc2V0IGl0IGlzIGEgc3Vic2VyaWVzIG9mLiBQbGVhc2UgZmluZCBiZWxvdyBh
IGNoYW5nZWxvZyBmb3IKdGhlIGNsb2NrIHN1Yi1zZXJpZXM6Cgp2NjoKLSBzcXVhc2hlZCB0aGUg
ImR0LWJpbmRpbmdzOiBjbG9jazogdGhlYWQ6IEFkZCBHUFUgY2xrZ2VuIHJlc2V0IHByb3BlcnR5
IgogIHdpdGggdGhlICJkdC1iaW5kaW5nczogY2xvY2s6IHRoZWFkOiBBZGQgVEgxNTIwIFZPIGNs
b2NrIGNvbnRyb2xsZXIiLiBBcwogIGEgcmVzdWx0LCBhbHNvIHJlbW92ZWQgdGhlIFJldmlld2Vk
LWJ5IGZyb20gS3J6eXN6dG9mLCBzaW5jZSB0aGUgbmV3CiAgcmVzZXRzIHByb3BlcnR5IGhhcyBi
ZWVuIGludHJvZHVjZWQsIHdoaWNoIGlzIG1hbmRhdG9yeSBpbiB0aGUgVk8KICBjYXNlCgp2NToK
LSBpbnRyb2R1Y2VkIGEgbmV3IG1hY3JvIENDVV9HQVRFX0NMS19PUFMsIHdoaWNoIGFsbG93cyBw
cm92aWRpbmcgY3VzdG9tIGNsa19vcHMuCiAgSW4gdGhlIGNhc2Ugb2YgdGhlICdNRU0nIGNsb2Nr
LCBpdCBwcm92aWRlcyBlbXB0eSBjbGtfbm9wcy4gTGF0ZXIsIHRoaXMgY2xvY2sKICBpcyBwcm92
aWRlZCB0byB0aGUgR1BVIG5vZGUsIHRoZXJlYnkgYXZvaWRpbmcgYW55IEFCSSBicmVha2FnZQot
IHVzZWQgdGhlIENDVV9HQVRFX0NMS19PUFMgbWFjcm8gdG8gaW1wbGVtZW50IGEgd29ya2Fyb3Vu
ZCBmb3IgZGUtYXNzZXJ0aW5nCiAgdGhlIGNsa2dlbiByZXNldCBvbmx5IGFmdGVyIGJvdGggY29y
ZSBhbmQgc3lzIGNsb2NrcyBhcmUgZW5hYmxlZC4gVGhpcwogIHNlcXVlbmNlIGlzIHJlcXVpcmVk
IHRvIHByb3Blcmx5IGluaXRpYWxpemUgdGhlIEdQVQoKdjQ6CiAtIGVuaGFuY2VkIGRvY3VtZW50
YXRpb24gZm9yIG5ldyBWaWRlbyBPdXRwdXQgKFZPKSBjbG9jayBpbnB1dHMgaW4gZGV2aWNlIHRy
ZWUKICAgYmluZGluZ3MKCnYzOgogLSByZXdvcmtlZCBkcml2ZXIgdG8gc3VwcG9ydCBtdWx0aXBs
ZSBjbG9jayBjb250cm9sbGVycyB0aHJvdWdoIC5jb21wYXRpYmxlCiAgIGFuZCAuZGF0YSBpbnN0
ZWFkIG9mIHVzaW5nIG11bHRpcGxlIGFkZHJlc3Mgc3BhY2VzIGluIGR0LWJpbmRpbmcuIFRoaXMg
Y2hhbmdlCiAgIGFsbG93cyB0byByZS11c2UgdGhlIGRyaXZlciBjb2RlIGZvciBtdWx0aXBsZSBj
bG9jayBjb250cm9sbGVycwoKdjI6CiAtIHJlbW92ZWQgQVBfU1VCU1lTIGNsb2NrIHJlZmFjdG9y
aW5nIGNvbW1pdHMgKDEtNik6CiAtIGluc3RlYWQgb2YgcmVmYWN0b3JpbmcsIEkgb3B0ZWQgdG8g
ZXh0ZW5kIHRoZSBjdXJyZW50IGRyaXZlciBhbmQgaXRzCiAgIGFzc29jaWF0ZWQgZGV2aWNlIHRy
ZWUgbm9kZSB0byBpbmNsdWRlIHN1cHBvcnQgZm9yIGEgc2Vjb25kIGFkZHJlc3Mgc3BhY2UuCiAt
IHJlc29sdmVkIGFsbCBjaGVja3BhdGNoIGlzc3VlcyB1c2luZyAtLXN0cmljdCwgZXhjZXB0IGZv
ciB0aGUgY2FsbCB0bwogICBkZXZtX2Nsa19od19yZWdpc3Rlcl9nYXRlX3BhcmVudF9kYXRhKCku
ICBUaGUgY3VycmVudCBpbXBsZW1lbnRhdGlvbiByZW1haW5zCiAgIHByZWZlcmFibGUgaW4gdGhp
cyBjb250ZXh0LCBhbmQgY2xhbmctZm9ybWF0IGFsaWducyB3aXRoIHRoaXMgY2hvaWNlCgo+IAo+
IE1pY2hhbCBXaWxjenluc2tpICg0KToKPiAgIGR0LWJpbmRpbmdzOiBjbG9jazogdGhlYWQ6IEFk
ZCBUSDE1MjAgVk8gY2xvY2sgY29udHJvbGxlcgo+ICAgY2xrOiB0aGVhZDogQWRkIGNsb2NrIHN1
cHBvcnQgZm9yIFZPIHN1YnN5c3RlbSBpbiBULUhlYWQgVEgxNTIwIFNvQwo+ICAgY2xrOiB0aGVh
ZDogQWRkIHN1cHBvcnQgZm9yIGN1c3RvbSBvcHMgaW4gQ0NVX0dBVEVfQ0xLX09QUyBtYWNybwo+
ICAgY2xrOiB0aGVhZDogQWRkIEdQVSBjbG9jayBnYXRlIGNvbnRyb2wgd2l0aCBDTEtHRU4gcmVz
ZXQgc3VwcG9ydAo+IAo+ICAuLi4vYmluZGluZ3MvY2xvY2svdGhlYWQsdGgxNTIwLWNsay1hcC55
YW1sICAgfCAgMzMgKy0KPiAgZHJpdmVycy9jbGsvdGhlYWQvY2xrLXRoMTUyMC1hcC5jICAgICAg
ICAgICAgIHwgMjk4ICsrKysrKysrKysrKysrKystLQo+ICAuLi4vZHQtYmluZGluZ3MvY2xvY2sv
dGhlYWQsdGgxNTIwLWNsay1hcC5oICAgfCAgMzQgKysKPiAgMyBmaWxlcyBjaGFuZ2VkLCAzMzQg
aW5zZXJ0aW9ucygrKSwgMzEgZGVsZXRpb25zKC0pCj4gCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgt
cmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
