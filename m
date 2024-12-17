Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 928CEE7717F
	for <linux-riscv@archiver.kernel.org>; Tue, 17 Dec 2024 14:04:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:From:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Gv6PPt3UgwPkdSbK2KtngLDBKR2by0+nfS0vJ2KCuD8=; b=FQXBjOygY4JhcX
	NY1cNA+V8OZU/j4nK/e2Yd8WYj32fdVmJinzNVqNT1zTlQFQxAQH0fSb1hALzhuViVfeSrXDpAU7j
	/DkC61yDPBlGPB3UuuSaJWie6EkyxoFkH0EZPu/FgO6VviIsT2g0IE9k9RZ0dA8BbLZEDRaK/ffG9
	Pv7ZOKO9IA0FyqZWsz4ojCN5FaroLTY1EIjp2xAVqtWFUZfKN4WX/3aES4dShUWjcxcuBw1engmTx
	sDWie9LOecRpOkmmDgZcmtxjfv6vWdlX2ukaXRRB6z0gVc2mxI1DUwUNfoKKYrAy+a4TapiUftkJJ
	UZf2NDkwyLi/Cwxb2UTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNYBu-0000000DfrQ-0ycQ;
	Tue, 17 Dec 2024 14:04:50 +0000
Received: from mailout1.w1.samsung.com ([210.118.77.11])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNYBf-0000000Dfnl-1HxI
	for linux-riscv@lists.infradead.org;
	Tue, 17 Dec 2024 14:04:37 +0000
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
	by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20241217140430euoutp01afcc7393c085e87f45e485410024cca6~R_9-prOgg0513305133euoutp01O
	for <linux-riscv@lists.infradead.org>; Tue, 17 Dec 2024 14:04:30 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20241217140430euoutp01afcc7393c085e87f45e485410024cca6~R_9-prOgg0513305133euoutp01O
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1734444270;
	bh=KMyUAlqwEJYNzikgeT8+zVNkBY5F3mcA6IWbOkzduSo=;
	h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
	b=Mm6dmctmiSHsvvWOwOMtVUxEWBCc/HEPyuD7bBNoszc5KMaJQMCwwHtLI1eKxilfN
	 7S597k9YSjJ1y/hUbeAXVyrW38aFs1yQ1sq8O3AE52eJ/QR/6m4rBWPOe6h5OnxCUQ
	 qsTkhf6twoPaVpqe6QHyroZHliwolmWM2Bxko2wA=
Received: from eusmges2new.samsung.com (unknown [203.254.199.244]) by
	eucas1p1.samsung.com (KnoxPortal) with ESMTP id
	20241217140429eucas1p12ab179254fb34f6063f244e730341e16~R_9-AstK70900109001eucas1p18;
	Tue, 17 Dec 2024 14:04:29 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
	eusmges2new.samsung.com (EUCPMTA) with SMTP id FE.75.20409.DE481676; Tue, 17
	Dec 2024 14:04:29 +0000 (GMT)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
	eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
	20241217140429eucas1p2259f8da7425cf9d617bced29ae29c828~R_9_hDffx0264202642eucas1p2U;
	Tue, 17 Dec 2024 14:04:29 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
	eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
	20241217140429eusmtrp2417a905469b3246cf3c07377c5ad0bc3~R_9_gR2OC0649406494eusmtrp2Q;
	Tue, 17 Dec 2024 14:04:29 +0000 (GMT)
X-AuditID: cbfec7f4-c39fa70000004fb9-2e-676184edb559
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
	eusmgms2.samsung.com (EUCPMTA) with SMTP id 7A.79.19654.DE481676; Tue, 17
	Dec 2024 14:04:29 +0000 (GMT)
Received: from [192.168.1.44] (unknown [106.210.136.40]) by
	eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20241217140428eusmtip210e3637c3bf3e5e0c3ab5759dfe71186~R_99o_wE91910219102eusmtip2m;
	Tue, 17 Dec 2024 14:04:28 +0000 (GMT)
Message-ID: <f15de5f4-10ab-4ebc-9b71-d81f0ca965c3@samsung.com>
Date: Tue, 17 Dec 2024 15:04:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 3/3] riscv: dts: thead: Add mailbox node
To: Drew Fustini <dfustini@tenstorrent.com>
Cc: drew@pdp7.com, guoren@kernel.org, wefu@redhat.com,
	jassisinghbrar@gmail.com, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, paul.walmsley@sifive.com, palmer@dabbelt.com,
	aou@eecs.berkeley.edu, m.szyprowski@samsung.com, samuel.holland@sifive.com,
	emil.renner.berthing@canonical.com, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	christophe.jaillet@wanadoo.fr
Content-Language: en-US
From: Michal Wilczynski <m.wilczynski@samsung.com>
In-Reply-To: <Z1u2vsoCmmcNm82V@x1>
X-Brightmail-Tracker: H4sIAAAAAAAAA02SfUwTdxjH87u73l27FY8C8qybI+mCiaKgqOESCS/LNg4NDpVlyeiijdzK
	O9qCOkNcnRVbBUec6HabsEQnhULIalvANxw4G4KrrECBZiAzxgiDNaywDTE4yunGf5/n+7w/
	eWhc8Y9ESecVl/K6Yk2hipQRzrtz7vVTRo12wy8/bGEd8wLFOn68KGGbbroxtu6OW8LevlHK
	jnrsGOsxWxD75OYxgvVaLlLsuDBKsn3XviVZZ8BIss13Rha1vkqcrRBWsM9vtFGs1d1PsMaO
	c0SKghMMVSQ3OT5OcF2mGYprF0YoztZoJrmrlz/jjM13Mc5/a4DkztgbEec5PkhxF0yPKS5g
	e5MLjLRIMuUfyRJz+MK8g7wuLmmvLNfYN03tv6I8bDnWghtQ9cpTiKaB2QwtJ+EUktEKxoLA
	UTuCicYMgrHeBkI0AggM96fQywyjnRX1egQ2s1MiGlMIhusXFjOktJxJAp9pHg8ywUSD67aZ
	EvVQ6P760VJMBBMFD3xfLelhTDJ875sngxzOxEB7z6WlzjjTjEOPx4yCDpyJBN+jOizIJBMP
	Y/V1kiBLGRV0ecRC+GLR445v8GAyMBNSOOG7tzQFMO+A3VshETkMJlx2SuQ34Hm7WBSYEhhz
	/PkivhzaK10veCv86n5KBtfHmTXQci1OlFNhYW5IIl4lBIamQsURQuCs8wIuynIwVSjE6NVQ
	U1n1X1O3xYlVI5Ww7CrCsiWFZcsI//f9DhGNKJIv0xdpeX18MX8oVq8p0pcVa2P3lRTZ0OJz
	9iy4ZtpQ/cR0bCfCaNSJgMZV4fL31mi0CnmO5tMjvK5kj66skNd3otdpQhUpj86J4hWMVlPK
	F/D8fl730ovRUqUBi4+JUOMPX3GPf2FLT9xZ/tR6eO1wYF0DTH6+EXG7t5Fdvaezeoc3S6m4
	5LZbVsqXcNa7pXfWZM2YjDxyfc6Rr9yx6ServCMqJXzT1fi/39oh7dhXUKNWdx5yZdVuJ1qz
	Vnlf+yulwK+uEcwauyLvevSgoTE73Ny0Tm3oTl/5bkxTxvn8rYrk4YShxBMKot8Z4lqV1BrT
	kPr2fFrr0fJ7sldXPPtk17kPTv9hmU6bLd1OZf/8+3myJjNj8NLOZx2rz8CVhYO/lYfWbvs4
	t9J/YCL7/sMD7/szS9K9o+tTH/fnmzaEjoVVK5PSPkyw755+MDvgrhodMBzt8ucETj6p6o74
	Uqci9LmajWtxnV7zL5yEjPcLBAAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFupmleLIzCtJLcpLzFFi42I5/e/4Pd23LYnpBrfOCFls/T2L3WLrwbms
	Fmv2nmOymH/kHKvFgT0lFvcubWGyuNS5gtHixd5GFotrK+ayW7ycdY/N4vKuOWwW2z63sFms
	PXIXKHa5h9mibRa/xf89O9gtVp+7wmLRsn8Ki4OQx6yGXjaPNy9fsngc7vjC7rFz1l12j02r
	Otk8Ni+p92hZe4zJ4/2+q2wefVtWMXpcar7O7jG94xm7x+dNch6f765nDeCN0rMpyi8tSVXI
	yC8usVWKNrQw0jO0tNAzMrHUMzQ2j7UyMlXSt7NJSc3JLEst0rdL0MtoufyRvWCZVMWKxvXM
	DYwTxLoYOTgkBEwkWrZYdDFycQgJLGWUaHp3gbmLkRMoLiNxrfslC4QtLPHnWhcbRNFrRok5
	37sZQRK8AnYStzp+gzWwCKhKHD/QyQ4RF5Q4OfMJWLOogLzE/VszwOLCAvYSS2/9ZgOxRQS0
	JXaeXswCMpRZYC2zxLu2l4wQG3qZJLpubQLrYBYQl7j1ZD4TiM0mYCTxYPl8VhCbU0BJ4vAl
	kKkcQDXqEuvnCUGUy0s0b53NPIFRaBaSO2YhmTQLoWMWko4FjCyrGEVSS4tz03OLjfSKE3OL
	S/PS9ZLzczcxAlPFtmM/t+xgXPnqo94hRiYOxkOMEhzMSiK8bpqJ6UK8KYmVValF+fFFpTmp
	xYcYTYFhMZFZSjQ5H5is8kriDc0MTA1NzCwNTC3NjJXEedmunE8TEkhPLEnNTk0tSC2C6WPi
	4JRqYLLt+NevvGLanCJHuWgfrVkMZ48zR996PsU+s8Izj/Xh39A55qL2jsceT/L5fvxi9Rrl
	hUKTOL6LLj7McSP6/BFD7saTl45Ob+SeJDVjs9eu2f+rvi+Y4FJpd/JtsRVbmH44Z6OJ5c1J
	ZsW7BMV8gpYtXDMpOFZqq9bCB4rrd7Fs/3+yUWO15MJDBm4ZaqqW///s/Wi5+mtpd4h9mmn0
	7S0sj8+vaJ5SOvf39+3GvFwbFBb23LNlaOk9NsH/3cKNXizFWzqDYxZcz1r6PEhguZ3x24bT
	CYX5n/zyd7e9qpPQLtQXWiQvJX1v2fflb6REVbKUHvDuTliUtEh4jurki/VLr9ctzkm9NDP3
	NfNcpcdKLMUZiYZazEXFiQCCdfdRngMAAA==
X-CMS-MailID: 20241217140429eucas1p2259f8da7425cf9d617bced29ae29c828
X-Msg-Generator: CA
X-RootMTR: 20241104100801eucas1p27cd0d7b9b5b4500604470664884c42fb
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20241104100801eucas1p27cd0d7b9b5b4500604470664884c42fb
References: <20241104100734.1276116-1-m.wilczynski@samsung.com>
	<CGME20241104100801eucas1p27cd0d7b9b5b4500604470664884c42fb@eucas1p2.samsung.com>
	<20241104100734.1276116-4-m.wilczynski@samsung.com> <Z1oO5ewIOMFco4KI@x1>
	<Z1uiWXWo9szbgfx9@x1> <Z1u2vsoCmmcNm82V@x1>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241217_060435_608144_C14E017E 
X-CRM114-Status: GOOD (  16.22  )
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

CgpPbiAxMi8xMy8yNCAwNToyMywgRHJldyBGdXN0aW5pIHdyb3RlOgo+IE9uIFRodSwgRGVjIDEy
LCAyMDI0IGF0IDA2OjU2OjI1UE0gLTA4MDAsIERyZXcgRnVzdGluaSB3cm90ZToKPj4gT24gV2Vk
LCBEZWMgMTEsIDIwMjQgYXQgMDI6MTU6MDFQTSAtMDgwMCwgRHJldyBGdXN0aW5pIHdyb3RlOgo+
Pj4gT24gTW9uLCBOb3YgMDQsIDIwMjQgYXQgMTE6MDc6MzRBTSArMDEwMCwgTWljaGFsIFdpbGN6
eW5za2kgd3JvdGU6Cj4+Pj4gQWRkIG1haWxib3ggZGV2aWNlIHRyZWUgbm9kZS4gVGhpcyB3b3Jr
IGlzIGJhc2VkIG9uIHRoZSB2ZW5kb3Iga2VybmVsIFsxXS4KPj4+Pgo+Pj4+IExpbms6IGh0dHBz
Oi8vcHJvdGVjdDIuZmlyZWV5ZS5jb20vdjEvdXJsP2s9ZGE0NzhlYjMtYmJjYzliOGEtZGE0NjA1
ZmMtMDAwYmFiZmZhZTEwLWE1ZDlmYzQyMzdiMTg1ZTMmcT0xJmU9NDY1YzUzMDItM2Q5ZS00NzEz
LWIyMTktMzAxODFlNTk0NGMyJnU9aHR0cHMlM0ElMkYlMkZnaXRodWIuY29tJTJGcmV2eW9zJTJG
dGhlYWQta2VybmVsLmdpdCBbMV0KPj4+Pgo+Pj4+IFNpZ25lZC1vZmYtYnk6IE1pY2hhbCBXaWxj
enluc2tpIDxtLndpbGN6eW5za2lAc2Ftc3VuZy5jb20+Cj4+Pj4gLS0tCj4+Pj4gIGFyY2gvcmlz
Y3YvYm9vdC9kdHMvdGhlYWQvdGgxNTIwLmR0c2kgfCAxNiArKysrKysrKysrKysrKysrCj4+Pj4g
IDEgZmlsZSBjaGFuZ2VkLCAxNiBpbnNlcnRpb25zKCspCj4+Pj4KPj4+PiBkaWZmIC0tZ2l0IGEv
YXJjaC9yaXNjdi9ib290L2R0cy90aGVhZC90aDE1MjAuZHRzaSBiL2FyY2gvcmlzY3YvYm9vdC9k
dHMvdGhlYWQvdGgxNTIwLmR0c2kKPj4+PiBpbmRleCA2OTkyMDYwZTZhNTQuLjg5ZGU1NjM0ZDNk
MyAxMDA2NDQKPj4+PiAtLS0gYS9hcmNoL3Jpc2N2L2Jvb3QvZHRzL3RoZWFkL3RoMTUyMC5kdHNp
Cj4+Pj4gKysrIGIvYXJjaC9yaXNjdi9ib290L2R0cy90aGVhZC90aDE1MjAuZHRzaQo+Pj4+IEBA
IC01MjAsNiArNTIwLDIyIEBAIHRpbWVyNzogdGltZXJAZmZmZmMzMzAzYyB7Cj4+Pj4gIAkJCXN0
YXR1cyA9ICJkaXNhYmxlZCI7Cj4+Pj4gIAkJfTsKPj4+PiAgCj4+Pj4gKwkJbWJveF85MTB0OiBt
YWlsYm94QGZmZmZjMzgwMDAgewo+Pj4+ICsJCQljb21wYXRpYmxlID0gInRoZWFkLHRoMTUyMC1t
Ym94IjsKPj4+PiArCQkJcmVnID0gPDB4ZmYgMHhmZmMzODAwMCAweDAgMHg2MDAwPiwKPj4+PiAr
CQkJICAgICAgPDB4ZmYgMHhmZmM0MDAwMCAweDAgMHg2MDAwPiwKPj4+PiArCQkJICAgICAgPDB4
ZmYgMHhmZmM0YzAwMCAweDAgMHgyMDAwPiwKPj4+PiArCQkJICAgICAgPDB4ZmYgMHhmZmM1NDAw
MCAweDAgMHgyMDAwPjsKPj4+PiArCQkJcmVnLW5hbWVzID0gImxvY2FsIiwgInJlbW90ZS1pY3Uw
IiwgInJlbW90ZS1pY3UxIiwgInJlbW90ZS1pY3UyIjsKPj4+PiArCQkJY2xvY2tzID0gPCZjbGsg
Q0xLX01CT1gwPiwgPCZjbGsgQ0xLX01CT1gxPiwgPCZjbGsgQ0xLX01CT1gyPiwKPj4+PiArCQkJ
CSA8JmNsayBDTEtfTUJPWDM+Owo+Pj4+ICsJCQljbG9jay1uYW1lcyA9ICJjbGstbG9jYWwiLCAi
Y2xrLXJlbW90ZS1pY3UwIiwgImNsay1yZW1vdGUtaWN1MSIsCj4+Pj4gKwkJCQkgICAgICAiY2xr
LXJlbW90ZS1pY3UyIjsKPj4+PiArCQkJaW50ZXJydXB0LXBhcmVudCA9IDwmcGxpYz47Cj4+Pj4g
KwkJCWludGVycnVwdHMgPSA8MjggSVJRX1RZUEVfTEVWRUxfSElHSD47Cj4+Pj4gKwkJCSNtYm94
LWNlbGxzID0gPDE+Owo+Pj4+ICsJCX07Cj4+Pj4gKwo+Pj4+ICAJCWFvX2dwaW8wOiBncGlvQGZm
ZmZmNDEwMDAgewo+Pj4+ICAJCQljb21wYXRpYmxlID0gInNucHMsZHctYXBiLWdwaW8iOwo+Pj4+
ICAJCQlyZWcgPSA8MHhmZiAweGZmZjQxMDAwIDB4MCAweDEwMDA+Owo+Pj4+IC0tIAo+Pj4+IDIu
MzQuMQo+Pj4+Cj4+Pgo+Pj4gUmV2aWV3ZWQtYnk6IERyZXcgRnVzdGluaSA8ZGZ1c3RpbmlAdGVu
c3RvcnJlbnQuY29tPgo+Pj4KPj4+IGR0X2JpbmRpbmdfY2hlY2sgYW5kIGR0YnNfY2hlY2sgYXJl
IGNsZWFuIHdoZW4gSSBhcHBseSB0aGlzIHBhdGNoIHRvCj4+PiB2Ni4xMy1yYzEuIFRoZXJlIGlz
IHRyaXZpYWwgY29uZmxpY3QgZHVlIHRvIHRoZSBncGlvIG5vZGUgbGFiZWwgaGF2aW5nCj4+PiBj
aGFuZ2VkLiBJJ2xsIHJlc29sdmUgaXQgd2hlbiBJIGFwcGx5IHRoZSBwYXRjaCB0byB0aGVhZC1k
dC1mb3ItbmV4dC4KPj4KPj4gSSd2ZSBhcHBsaWVkIHRoaXMgcGF0Y2ggdG8gdGhlYWQtZHQtZm9y
LW5leHQgWzFdLgoKVGhhbmtzIGZvciBjb25maXJtaW5nLiBJ4oCZbSBjdXJyZW50bHkgcHJlcGFy
aW5nIHYyIG9mIHRoZSBzZXJpZXMgWzJdLiBJbgphZGRpdGlvbiB0byB0aGUgY2hhbmdlcyBhbHJl
YWR5IGRpc2N1c3NlZCwgSSBwbGFuIHRvIGJyb2FkZW4gdGhlIHNjb3BlCnRvIGluY2x1ZGUgdGhl
IHBvd2VyLWRvbWFpbiB1c2VyIG9mIHRoZSBtYWlsYm94IGZvciBjb21wbGV0ZW5lc3MsIHNvCkkn
bGwgaW5jbHVkZSB0aGlzIGNvbW1pdCBpbiBteSBzZXJpZXMgYXMgd2VsbC4gSeKAmWxsIGFsc28g
ZW5zdXJlIHRoYXQKeW91ciBSZXZpZXdlZC1ieSB0YWcgaXMgaW5jbHVkZWQgaW4gdGhlIHVwZGF0
ZWQgY29tbWl0LiBUaGFua3MgYWdhaW4gZm9yCnRoZSByZXZpZXcgYW5kIHlvdXIgb25nb2luZyBz
dXBwb3J0LgoKWzJdIC0gaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvYWxsLzIwMjQxMjAzMTM0MTM3
LjIxMTQ4NDctMS1tLndpbGN6eW5za2lAc2Ftc3VuZy5jb20vCgpNaWNoYcWCCj4+Cj4+IFRoYW5r
cywKPj4gRHJldwo+Pgo+PiBbMV0gaHR0cHM6Ly9wcm90ZWN0Mi5maXJlZXllLmNvbS92MS91cmw/
az1kZWQxMDQ0ZS1iZjVhMTE3Ny1kZWQwOGYwMS0wMDBiYWJmZmFlMTAtYTQzMDIxZTAwOTE4NjRm
YyZxPTEmZT00NjVjNTMwMi0zZDllLTQ3MTMtYjIxOS0zMDE4MWU1OTQ0YzImdT1odHRwcyUzQSUy
RiUyRmdpdGh1Yi5jb20lMkZwZHA3JTJGbGludXglMkZjb21taXQlMkY5ODA2NGFmMzZjYmMwYzIx
NmQwYTJkMTFkYTVlMzc0NmE1N2NjY2U3Cj4gCj4gSSBmb3Jnb3QgbXkgU29CIHNvIGl0IGlzIG5v
dyBhIG5ldyBoYXNoIFsxXS4KPiAKPiAtRHJldwo+IAo+IFsxXSBodHRwczovL3Byb3RlY3QyLmZp
cmVleWUuY29tL3YxL3VybD9rPTIxYmNmNTRhLTQwMzdlMDczLTIxYmQ3ZTA1LTAwMGJhYmZmYWUx
MC0yNDA4ZDM1YzQ3MjNlZTZkJnE9MSZlPTQ2NWM1MzAyLTNkOWUtNDcxMy1iMjE5LTMwMTgxZTU5
NDRjMiZ1PWh0dHBzJTNBJTJGJTJGZ2l0aHViLmNvbSUyRnBkcDclMkZsaW51eCUyRmNvbW1pdCUy
RmM5NWMxMzYyZTViY2Q5MGM0NTk4NzgyOGJiZWYwMjIzNmQxODFmZmQKPiAKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcg
bGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRl
YWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
