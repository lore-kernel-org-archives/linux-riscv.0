Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D6C6C282C5
	for <linux-riscv@archiver.kernel.org>; Mon,  3 Mar 2025 08:42:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:From:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/BmmeDAMF8+UsoDmBprFUrYEWD2WxO3g6RbB9Aoby/I=; b=l2oqdPYLIeBmjN
	PG/ZJtqNbBQYGh9GKgIKxSjc4UuJlvx5ISSa18N2Mhcj3vTle/dBcKQ8/eajRguv3/v/C64uIKEGG
	vP2xTiAEsKSt42f1gK+iAs4Yd2Bm4v9JF4UZQg7o2doiw+I6PSg7tRWM9RrUSy9MQNDdRHGuNoRUV
	sr+YicOPygzMkTZUodhMR5r1f5ElXLKH0fLuyi09wxKqDTDFnghfP5zMnJhclGNvXiDJ5MWetA6hX
	5FzhhZGkf8M0e+wTFh77D5sP+BvpnLQGMvUQJmKZlfRoA/1SulXwMOCs6DjVxHSoUNApYiTc89EeO
	UIk8pT+pAlrHrpb9hP7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tp1NY-0000000HZNe-1hbG;
	Mon, 03 Mar 2025 08:42:24 +0000
Received: from [210.118.77.11] (helo=mailout1.w1.samsung.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tp1KE-0000000HYfM-1FUS
	for linux-riscv@lists.infradead.org;
	Mon, 03 Mar 2025 08:39:01 +0000
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
	by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20250303083852euoutp01977e5c4c742e859a97dadbefd9e80f16~pPjX3LBL92188021880euoutp01I
	for <linux-riscv@lists.infradead.org>; Mon,  3 Mar 2025 08:38:52 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20250303083852euoutp01977e5c4c742e859a97dadbefd9e80f16~pPjX3LBL92188021880euoutp01I
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1740991132;
	bh=9d2xtceGlzz2l6obFD6JjP2Tn3LQZNmuBGvk5P8FyW4=;
	h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
	b=IwtzZyETtTKMgOfIMbIuIZmOvgzUKf1RV6oX886ux8NexvtR7nDpGhEqoIOpC+duB
	 w4/RYmu6uZxoHTiVBgX29Rug5dmEvFXT9ovDrD3sWQcrbeiZDnP+RmsDoy+KBJw4o5
	 DH919GR1gRZC+ds3xAPk5l1AdEzNnBjVC77U5v+4=
Received: from eusmges2new.samsung.com (unknown [203.254.199.244]) by
	eucas1p1.samsung.com (KnoxPortal) with ESMTP id
	20250303083852eucas1p1f3250a4c27d32330c50cda3d51477492~pPjXi4mjh2913229132eucas1p1P;
	Mon,  3 Mar 2025 08:38:52 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
	eusmges2new.samsung.com (EUCPMTA) with SMTP id 0C.F7.20409.B9A65C76; Mon,  3
	Mar 2025 08:38:51 +0000 (GMT)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
	eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
	20250303083851eucas1p214cdd6ace6341a00a3db3012065843e7~pPjW1o4Ib1194011940eucas1p2d;
	Mon,  3 Mar 2025 08:38:51 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
	eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
	20250303083851eusmtrp2de127490ec65dd43e7799366dcb80f33~pPjW0nbcV0443604436eusmtrp2T;
	Mon,  3 Mar 2025 08:38:51 +0000 (GMT)
X-AuditID: cbfec7f4-c39fa70000004fb9-e9-67c56a9be489
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
	eusmgms1.samsung.com (EUCPMTA) with SMTP id 6A.30.19920.B9A65C76; Mon,  3
	Mar 2025 08:38:51 +0000 (GMT)
Received: from [192.168.1.44] (unknown [106.210.136.40]) by
	eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20250303083849eusmtip2237adb2f5e3a1e502ca5bc8c7c07482d~pPjVXQtNR3254732547eusmtip2I;
	Mon,  3 Mar 2025 08:38:49 +0000 (GMT)
Message-ID: <90d0d409-f374-4e06-bc69-b9bf0622959d@samsung.com>
Date: Mon, 3 Mar 2025 09:38:49 +0100
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
In-Reply-To: <20250221-eminent-squirrel-of-honor-dee80d@krzk-bin>
X-Brightmail-Tracker: H4sIAAAAAAAAA01Sa1BUZRjuO3v2nGUTPKwYn5ShizYhCQiNfhMOSZadyUpqLJpywp04s5AL
	2B4Qa1KRW8IuoXGT5SZgwqAgl90dQJC4rgguJLcdBxZlgAClnY3bqFyCPVj8e97nfd7nfZ9v
	PgFP1Eg4CIJCwhh5iEQmJoS4tvWpfnfm9y1S94GMd9Cd/nwMaZ6rSHSjTo+h3GY9HxnvqzHU
	M2siUOloF4nG687jqK8om0TRrTcJNKEyEqizs4xEZqWRj7prsgg0ndgMkHY6hkAlzYMkyjNr
	cHS1qgaguPhrfPTn3Q/QoPEOjia6lTwUp9qIlmurSLTUV46jzL/rSaR+comPdCV+KKY+BT/w
	Om0yxJL0k4kJnG66MEPSdXNXcLpaNUjSyuoOQFcUxxP0QF8tQee0fUYPKXQYXXn1HB1T0orR
	SYvutOl2L0H/qi4G9P3oftJX9LVwfwAjCzrFyN28jwsDlbe6iJMtwtP5WWGRQCdIAFYCSL0N
	yxYb8AQgFIioIgAViXMEV8wA+FiRslZMA2ioMpMvRpqS2kmuUQigeeHe2vwUgDHFj/irKmvK
	Gz5KSMZXMU7tgFHjCwTH28K2jBELv5lyhEMPLltcN1F+8A/jL9gqtqOcYf/iPH/VlEfV8mFa
	SpnFlEfZwwcjuRYRQXnAh4W5Ft6K8oEVN1IwTuMIozWZvNVhSPUKYXR7BZ+7+304n1m+lmET
	nNSp1/BrcLmaM4VUKHyo+YfH4Z9htVK3hr3ggP7ZSgLBygJneLPGjaN9YE9SqoWGlA00TNly
	J9jA37TpPI62hhfiRJz6DZiqTPxvqb5Ii10EYtW6V1GtC6laF0b1/94rAC8G9kw4GyxlWI8Q
	JsKVlQSz4SFS1+9CgyvAyjdvX9LNVIHCSbNrI8AEoBFAAU9sZ/3D581SkXWA5MefGHmovzxc
	xrCN4FUBLra3zq+PlYooqSSMOcEwJxn5iy4msHKIxGzHythXJszDhZozbuVK9vKIT7LOiXBB
	X04d+qssJ0cWn9Zm67JHIXbZxkiN3x7V9G05Hey5Yf+JlzpEEe4YKWt7a6F8rml0y1n149SP
	Yk1Rs3ZL2p2m7KhlDT2mDrw7a/hq6xfKp+eyzi7mBdwr+eSI4yWb7Ye1Wxv8xw6wnc+h4che
	8fDQhvTu8JYzPdqL1z7el/7y5DGH8SDdYuW7GZtrnBSnZrMP+o0UmG73fFi5sXSf16dip6mj
	nvqhhmMR2Q4737yVpixIzvtm3OO8p6Fm+w6vrNLdvTNde03+vvOjBQvHfTVF2ZFNlR3X3xtm
	D29L+P1Zy1Sz93ikMd951/XlQ7KlXjHOBkr27OLJWcm/h1A4JVUEAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrMKsWRmVeSWpSXmKPExsVy+t/xe7qzs46mG0zs4LU4cX0Rk8XW37PY
	LdbsPcdkMf/IOVaLe5e2MFlc+fqezWLd0wvsFi/2NrJYXFsxl92i+dh6NouXs+6xWZw/v4Hd
	4mPPPVaLy7vmsFl87j3CaLHtcwubxdojd9ktFn7cymKxZMcuRou2zmWsFhdPuVrcvXeCxeLl
	5R5mi7ZZ/Bb/9+xgt/h3bSOLxex3+9kttryZyGpxfG24Rcv+KSwOch7vb7Sye7x5+ZLF43DH
	F3aPvd8WsHjsnHWX3aNn5xlGj02rOtk87lzbw+Yx72Sgx/3u40wem5fUe7SsPcbk0f/XwOP9
	vqtsHn1bVjF6XGq+zh4gFKVnU5RfWpKqkJFfXGKrFG1oYaRnaGmhZ2RiqWdobB5rZWSqpG9n
	k5Kak1mWWqRvl6CX0bP7AlvBUa6KRXNKGhiPc3QxcnJICJhIHO4/zd7FyMUhJLCUUWJP4zt2
	iISMxLXulywQtrDEn2tdbBBFrxkl3ixfwAqS4BWwk3jYNRmsiEVARaLpxR82iLigxMmZT8Di
	ogLyEvdvzQAbKiwQLnHgXjsTiC0ioClx/e93VpChzAJ7WCUOb/4M1iwkcIpR4uzpDBCbWUBc
	4taT+WANbAJGEg+WzwdbzCngKLFpzRSgOAdQjbrE+nlCEOXyEs1bZzNPYBSaheSMWUgmzULo
	mIWkYwEjyypGkdTS4tz03GJDveLE3OLSvHS95PzcTYzA1LXt2M/NOxjnvfqod4iRiYPxEKME
	B7OSCG9h0JF0Id6UxMqq1KL8+KLSnNTiQ4ymwKCYyCwlmpwPTJ55JfGGZgamhiZmlgamlmbG
	SuK8bpfPpwkJpCeWpGanphakFsH0MXFwSjUwxb+9fft9m0GJ0JUj5c01/rmucwMKXpssMcps
	O7NIccdTYeEb28NOhtskbXto256nceZT16KjzCd55k38NHdLlvJdsz37DQ7FOWd8WiKzfH1i
	9B2B+UcrGutip6pUvmF2OK8pcevbI5Yrf74ufWzwfvG17rYvkjVGE0JLYhfdVxA+G3ts29Oe
	ZxM8Tk3xPTM/d92SwNQZL9XfTjii3vlPeKL2qSf3n8lorNxx7dwT3sjv7/4U2VZy7OP8dOOV
	7zUbsVD3A54R04rF0xmfubtNXNN6IvjfH7OuOYlzrpZp/FqfmrTx28ZJk/+fdzTVjnsb43l2
	leGnCWlLjwQ0HY/aoOS25fgpRYePs6ffDtpbZVqjxFKckWioxVxUnAgAqtL6T+YDAAA=
X-CMS-MailID: 20250303083851eucas1p214cdd6ace6341a00a3db3012065843e7
X-Msg-Generator: CA
X-RootMTR: 20250219140249eucas1p1291eb86c932373c847a3314ae54789d5
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20250219140249eucas1p1291eb86c932373c847a3314ae54789d5
References: <CGME20250219140249eucas1p1291eb86c932373c847a3314ae54789d5@eucas1p1.samsung.com>
	<20250219140239.1378758-1-m.wilczynski@samsung.com>
	<20250221-eminent-squirrel-of-honor-dee80d@krzk-bin>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250303_003858_958470_889B6D28 
X-CRM114-Status: GOOD (  14.62  )
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

CgpPbiAyLzIxLzI1IDEwOjEyLCBLcnp5c3p0b2YgS296bG93c2tpIHdyb3RlOgo+IE9uIFdlZCwg
RmViIDE5LCAyMDI1IGF0IDAzOjAyOjE4UE0gKzAxMDAsIE1pY2hhbCBXaWxjenluc2tpIHdyb3Rl
Ogo+PiBUaGUgTGljaGVlUGkgNEEgYm9hcmQsIGZlYXR1cmluZyB0aGUgVC1IRUFEIFRIMTUyMCBT
b0MsIGluY2x1ZGVzIGFuIEltYWdpbmF0aW9uCj4+IFRlY2hub2xvZ2llcyBCWE0tNC02NCBHUFUu
IEluaXRpYWwgc3VwcG9ydCBmb3IgdGhpcyBHUFUgd2FzIHByb3ZpZGVkIHRocm91Z2ggYQo+PiBk
b3duc3RyZWFtIGRyaXZlciBbMV0uIFJlY2VudGx5LCBlZmZvcnRzIGhhdmUgYmVlbiBtYWRlIHRv
IHVwc3RyZWFtIHN1cHBvcnQgZm9yCj4+IHRoZSBSb2d1ZSBmYW1pbHkgR1BVcywgd2hpY2ggdGhl
IEJYTS00LTY0IGlzIHBhcnQgb2YgWzJdLgo+Pgo+PiBXaGlsZSB0aGUgaW5pdGlhbCB1cHN0cmVh
bSBkcml2ZXIgZm9jdXNlZCBvbiB0aGUgQVhFLTEtMTYgR1BVLCBuZXdlciBwYXRjaGVzCj4+IGhh
dmUgaW50cm9kdWNlZCBzdXBwb3J0IGZvciB0aGUgQlhTLTQtNjQgR1BVIFszXS4gVGhlIG1vZGVy
biB1cHN0cmVhbQo+PiBkcm0vaW1hZ2luYXRpb24gZHJpdmVyIGlzIGV4cGVjdGVkIHRvIHN1cHBv
cnQgdGhlIEJYTS00LTY0IGFzIHdlbGwgWzRdWzVdLiBBcwo+PiB0aGlzIHN1cHBvcnQgaXMgYmVp
bmcgZGV2ZWxvcGVkLCBpdCdzIGNydWNpYWwgdG8gdXBzdHJlYW0gdGhlIG5lY2Vzc2FyeSBnbHVl
Cj4+IGNvZGUgaW5jbHVkaW5nIGNsb2NrIGFuZCBwb3dlci1kb21haW4gZHJpdmVycyBzbyB0aGV5
J3JlIHJlYWR5IGZvciBpbnRlZ3JhdGlvbgo+PiB3aXRoIHRoZSBkcm0vaW1hZ2luYXRpb24gZHJp
dmVyLgo+Pgo+IAo+IFRoaXMgaXMgdjUgb2YgYmlnIHBhdGNoc2V0IHdoaWNoIGJlY2FtZSBodWdl
LiBJIHVuZGVyc3RhbmQgeW91IGRpZCBsaWtlCj4gdGhhdCBmb3IgdjEgd2hpY2ggd2FzIFJGQy4g
QnV0IGl0IHN0b3BwZWQgYmVpbmcgUkZDLgo+IAo+IFNwbGl0IHlvdXIgcGF0Y2hzZXQsIGtlZXBp
bmcgdmVyc2lvbmluZyBhbmQgY2hhbmdlbG9nLCBwZXIgc3Vic3lzdGVtLgoKU29ycnkgZm9yIHRo
ZSBsYXRlIHJlcGx54oCUSSBkaWRuJ3QgaGF2ZSBhY2Nlc3MgdG8gZW1haWwuIEkgYWdyZWUgd2l0
aAp5b3VyIHN1Z2dlc3Rpb24gYW5kIHdpbGwgc2VuZCB0aGUgY2xvY2sgY2hhbmdlcywgZmlybXdh
cmUvcG93ZXIgZG9tYWluLApyZXNldCwgYW5kIGRybS9pbWFnaW5hdGlvbiB1cGRhdGVzIGFzIHNl
cGFyYXRlIHBhdGNoc2V0cyBmb3IgbWVyZ2luZy4KCj4gCj4gQmVzdCByZWdhcmRzLAo+IEtyenlz
enRvZgo+IAo+IAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5v
cmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNj
dgo=
