Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7629FD1D896
	for <linux-riscv@archiver.kernel.org>; Tue, 15 Oct 2024 18:44:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:From:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PjYxZwDwG0KKu0MPi+j/ToCS559kBcLtlWgW2rqSiH4=; b=o/1CjXX/b6+dw1
	wSBFrxKv5YrlEBBL2b+rA6E+emKCsetXQArS6FUpCN3vHQQOYyJkKo8HOZrXk9AgfMrgS2Y7SmkWk
	+6kA+KnEIZsdLOw2fgth0rF0WCrBvdtu42/6sQvDD4qgfq4z/QdNRiAKmyHD5lzytz01xvodkEzGh
	vdUKTuqNbZfHGSRK/WT3c2SEg0Y1z3LXMmUftJ5LVgDWKRblpSw7sAG0pAlIPEEhJEIVHViJhEc1i
	IR7CsnTOWrOK4/2EFTGXI/RvAmpGzjZ/U5rLI4ZcoVwoBqrEDLalxaoij02mqtIS8VGlngPA8kRr5
	LHFv1nJv3JG6x/EE8jJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t0mWm-00000009Gik-19Am;
	Tue, 15 Oct 2024 18:44:16 +0000
Received: from mailout2.w1.samsung.com ([210.118.77.12])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t0mWf-00000009Ghr-0fhx
	for linux-riscv@lists.infradead.org;
	Tue, 15 Oct 2024 18:44:13 +0000
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
	by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20241015184402euoutp02c0760937dfc7a0ad415fa7f96ab80b6e~_tJE17XRU3256532565euoutp02W
	for <linux-riscv@lists.infradead.org>; Tue, 15 Oct 2024 18:44:02 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20241015184402euoutp02c0760937dfc7a0ad415fa7f96ab80b6e~_tJE17XRU3256532565euoutp02W
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1729017842;
	bh=HuC5Q9IVnT9C9ZqpNbJeHd8wdpadVR4wwXRjo0qvcnM=;
	h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
	b=AevDnAo6B7wHZsA2xvIcI64Mm82mRWL2WInyQE0EPt1iZlGNSlwZj7Axw+sFD37a+
	 x5OE7uW4iQC2hBkQDu/15MbmVoJy+Rb8NoVrPHPGmUaEQjnsgTZKqZhYwqaspgSqwz
	 a+S4mbeHdhNcnnKaWcRvBPoRo1KerWN2fcWO8ubM=
Received: from eusmges2new.samsung.com (unknown [203.254.199.244]) by
	eucas1p2.samsung.com (KnoxPortal) with ESMTP id
	20241015184402eucas1p25b7f6832596302aa419497c9e7c73915~_tJEkmmoB0374103741eucas1p2B;
	Tue, 15 Oct 2024 18:44:02 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
	eusmges2new.samsung.com (EUCPMTA) with SMTP id 6A.1D.09875.2F7BE076; Tue, 15
	Oct 2024 19:44:02 +0100 (BST)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
	eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
	20241015184401eucas1p2a9a19f6e99a7b47f20574fcef500313f~_tJD4YnTg1034210342eucas1p2R;
	Tue, 15 Oct 2024 18:44:01 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
	eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
	20241015184401eusmtrp1ec0fd5726de5a734ef78a03bd4a68f38~_tJDpQbyS0484904849eusmtrp14;
	Tue, 15 Oct 2024 18:44:01 +0000 (GMT)
X-AuditID: cbfec7f4-131ff70000002693-09-670eb7f276f2
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
	eusmgms1.samsung.com (EUCPMTA) with SMTP id 5F.54.14621.1F7BE076; Tue, 15
	Oct 2024 19:44:01 +0100 (BST)
Received: from [192.168.1.44] (unknown [106.210.136.40]) by
	eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20241015184400eusmtip2cb3004d5575998c9688dbea89091a9ab~_tJC7Olvv0203102031eusmtip2i;
	Tue, 15 Oct 2024 18:44:00 +0000 (GMT)
Message-ID: <4825037e-08e6-4946-9aee-a19512fb2346@samsung.com>
Date: Tue, 15 Oct 2024 20:44:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/3] riscv: dts: thead: Add mailbox node
To: Emil Renner Berthing <emil.renner.berthing@canonical.com>,
	drew@pdp7.com, guoren@kernel.org, wefu@redhat.com, jassisinghbrar@gmail.com,
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
	m.szyprowski@samsung.com
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Content-Language: en-US
From: Michal Wilczynski <m.wilczynski@samsung.com>
In-Reply-To: <CAJM55Z-bzivMZWUsHiii+2tw2-kdRe7kqtVa+MvPEAVTmOvChg@mail.gmail.com>
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrAKsWRmVeSWpSXmKPExsWy7djPc7qftvOlG0y8IWKx9fcsdos1e88x
	Wcw/co7V4t6lLUwWlzpXMFq82NvIYnFtxVx2i5ez7rFZXN41h81i2+cWNou1R+4CxS73MFu0
	zeK3+L9nB7tFy/4pLA78HrMaetk83rx8yeJxuOMLu8fOWXfZPTat6mTz2Lyk3qNl7TEmj/f7
	rrJ59G1Zxehxqfk6u8fnTXIB3FFcNimpOZllqUX6dglcGa+3XWcveClfsaWnla2BsV+qi5GT
	Q0LAROLegzvsXYxcHEICKxglDh64zgaSEBL4wiixbV0uROIzo0Tj2u9sMB03G3uhOpYzSsw4
	M40NwnnLKHHjUw8TSBWvgJ3El1N3wDpYBFQlLj16zQgRF5Q4OfMJC4gtKiAvcf/WDKBJHBzC
	AvYSG7sEQeaICKxmkth4tQlsDrNAvMTjKRegbHGJW0/mg9lsAkYSD5bPZwWxOQUCJWbO2wpV
	Iy/RvHU2M8ggCYH9nBKvp19ihjjbReLyzj+sELawxKvjW9ghbBmJ05N7WCDsfIkHWz9B1ddI
	7Ow5DmVbS9w594sN5FBmAU2J9bv0IcKOEtuXXgcLSwjwSdx4KwhxAp/EpG3TmSHCvBIdbUIQ
	1WoSU3t64ZaeW7GNaQKj0iykQJmF5MlZSJ6ZhbB3ASPLKkbx1NLi3PTUYqO81HK94sTc4tK8
	dL3k/NxNjMBEePrf8S87GJe/+qh3iJGJg/EQowQHs5II76Qu3nQh3pTEyqrUovz4otKc1OJD
	jNIcLErivKop8qlCAumJJanZqakFqUUwWSYOTqkGJu78+xdd5LZrnbzDHfDux7IdXPNijz7I
	v7Z+od2Ep3y3F1/vT/zXU2mcKP5mlmD4pW3zpxvkbzQNrby6a9OcnGAr/r3rTR/Ui2wRmTFr
	qWpZ+Z+ks2vTXt5S8o165R/3pHh9R9Px/e6P5HkKbm+ZucJm5+a4u+1vW1L397rIf7uY/nPD
	tOQLH1etkLOVj+QNrrX/ZerqenLPEcucqye4JvyvdVHhkZR/+P3pD8Mnf7WPyLjy/mt4JdkZ
	+ZZX+sZjD8dLNr8Oum55xHhm6dJ4PdvjHzNYGlR+Guzy+RkUkvHUx6browp7a6Bp89ml6xvv
	FjP6+F54UvxJ8EiMZtm6nui4N13tmd38LcpnFk55eV2JpTgj0VCLuag4EQCpNp7n8wMAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrIIsWRmVeSWpSXmKPExsVy+t/xe7oft/OlG5w7KWax9fcsdos1e88x
	Wcw/co7V4t6lLUwWlzpXMFq82NvIYnFtxVx2i5ez7rFZXN41h81i2+cWNou1R+4CxS73MFu0
	zeK3+L9nB7tFy/4pLA78HrMaetk83rx8yeJxuOMLu8fOWXfZPTat6mTz2Lyk3qNl7TEmj/f7
	rrJ59G1Zxehxqfk6u8fnTXIB3FF6NkX5pSWpChn5xSW2StGGFkZ6hpYWekYmlnqGxuaxVkam
	Svp2NimpOZllqUX6dgl6Ga+3XWcveClfsaWnla2BsV+qi5GTQ0LAROJmYy97FyMXh5DAUkaJ
	pdc3M0MkZCSudb9kgbCFJf5c62KDKHrNKDG99xU7SIJXwE7iy6k7bCA2i4CqxKVHrxkh4oIS
	J2c+AWsWFZCXuH9rBlA9B4ewgL3Exi5BkLCIwGomiVOPIkHCzALxEhtuKkOMn8Akce3ZIlaQ
	GmYBcYlbT+YzgdhsAkYSD5bPB4tzCgRKzJy3lQmiV11i/TwhiHJ5ieats5knMArNQnLELCST
	ZiF0zELSsYCRZRWjSGppcW56brGhXnFibnFpXrpecn7uJkZg3G879nPzDsZ5rz7qHWJk4mA8
	xCjBwawkwjupizddiDclsbIqtSg/vqg0J7X4EKMpMCAmMkuJJucDE09eSbyhmYGpoYmZpYGp
	pZmxkjiv2+XzaUIC6YklqdmpqQWpRTB9TBycUg1MEk2Cm7m2OBT02pe+uHmI7bGCvVFI45KD
	taGWB/yCY6+6lv4wZ463nV4kXSHgclL/n+XL2dZ/H2X9+rterfC5qKedlydbvLnBfi6ezMpV
	TqdaZ5he/PfXer6x+jHfkusxG5+5/2t6sn8hdz8Tk9TOPUIzugva/3R/v9GzvvHRUtkPxfuf
	3sm+HXc2/AjffT/720z/j2xNFrr0+MKGedwthudsIhcZ/T825VMoU6dn0NFp3357t/zemuM4
	J/lt97wynS9pNpdPXfuuVf+l816UftPDy4kyx7y/3WOZcsJYQF5td3H7PU7ZvvUH0g7PrdLh
	X5ZhEHR9mliKWaxr61wWnSBHy2cyamcmCdXHqhopsRRnJBpqMRcVJwIAZ8em64QDAAA=
X-CMS-MailID: 20241015184401eucas1p2a9a19f6e99a7b47f20574fcef500313f
X-Msg-Generator: CA
X-RootMTR: 20241014123412eucas1p2144768f373a2e2de7f6d00e7b67f9328
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20241014123412eucas1p2144768f373a2e2de7f6d00e7b67f9328
References: <20241014123314.1231517-1-m.wilczynski@samsung.com>
	<CGME20241014123412eucas1p2144768f373a2e2de7f6d00e7b67f9328@eucas1p2.samsung.com>
	<20241014123314.1231517-4-m.wilczynski@samsung.com>
	<CAJM55Z-bzivMZWUsHiii+2tw2-kdRe7kqtVa+MvPEAVTmOvChg@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241015_114411_763327_8BB6A0D2 
X-CRM114-Status: GOOD (  24.60  )
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

CgpPbiAxMC8xNC8yNCAxNjo1NywgRW1pbCBSZW5uZXIgQmVydGhpbmcgd3JvdGU6Cj4gTWljaGFs
IFdpbGN6eW5za2kgd3JvdGU6Cj4+IEFkZCBtYWlsYm94IGRldmljZSB0cmVlIG5vZGUuIFRoaXMg
d29yayBpcyBiYXNlZCBvbiB0aGUgdmVuZG9yIGtlcm5lbCBbMV0uCj4+Cj4+IExpbms6IGh0dHBz
Oi8vcHJvdGVjdDIuZmlyZWV5ZS5jb20vdjEvdXJsP2s9MGJjOTVmMjUtNTQ1MjY3ZDgtMGJjOGQ0
NmEtMDAwYmFiZmYzMTdiLTg1YTUyZWFiMjFkYjlkMjImcT0xJmU9NjNhNDlhY2QtZTM0My00M2Qy
LWE1N2QtYjRmNmZjZDIzYjYxJnU9aHR0cHMlM0ElMkYlMkZnaXRodWIuY29tJTJGcmV2eW9zJTJG
dGhlYWQta2VybmVsLmdpdCBbMV0KPj4KPj4gU2lnbmVkLW9mZi1ieTogTWljaGFsIFdpbGN6eW5z
a2kgPG0ud2lsY3p5bnNraUBzYW1zdW5nLmNvbT4KPj4gLS0tCj4+ICBhcmNoL3Jpc2N2L2Jvb3Qv
ZHRzL3RoZWFkL3RoMTUyMC5kdHNpIHwgMTIgKysrKysrKysrKysrCj4+ICAxIGZpbGUgY2hhbmdl
ZCwgMTIgaW5zZXJ0aW9ucygrKQo+Pgo+PiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9ib290L2R0
cy90aGVhZC90aDE1MjAuZHRzaSBiL2FyY2gvcmlzY3YvYm9vdC9kdHMvdGhlYWQvdGgxNTIwLmR0
c2kKPj4gaW5kZXggNjk5MjA2MGU2YTU0Li40MzVmMGFiMDE3NGQgMTAwNjQ0Cj4+IC0tLSBhL2Fy
Y2gvcmlzY3YvYm9vdC9kdHMvdGhlYWQvdGgxNTIwLmR0c2kKPj4gKysrIGIvYXJjaC9yaXNjdi9i
b290L2R0cy90aGVhZC90aDE1MjAuZHRzaQo+PiBAQCAtNTU1LDUgKzU1NSwxNyBAQCBwb3J0Zjog
Z3Bpby1jb250cm9sbGVyQDAgewo+PiAgCQkJCWludGVycnVwdHMgPSA8NTUgSVJRX1RZUEVfTEVW
RUxfSElHSD47Cj4+ICAJCQl9Owo+PiAgCQl9Owo+PiArCj4+ICsJCW1ib3hfOTEwdDogbWFpbGJv
eEBmZmZmYzM4MDAwIHsKPiAKPiBIaSBNaWNoYWwsCj4gCj4gVGhhbmtzIGZvciB5b3VyIHBhdGNo
ISBQbGVhc2Ugc29ydCB0aGlzIGJ5IGFkZHJlc3Mgc2ltaWxhciB0byB0aGUgb3RoZXIgbm9kZXMu
CgpUaGFuayB5b3UgZm9yIHlvdXIgcmV2aWV3LiBXaWxsIGRvLgoKPiAKPj4gKwkJICAgICAgIGNv
bXBhdGlibGUgPSAidGhlYWQsdGgxNTIwLW1ib3giOwo+PiArCQkgICAgICAgcmVnID0gPDB4ZmYg
MHhmZmMzODAwMCAweDAgMHg0MDAwPiwKPiAKPiBUaGUgZG9jdW1lbnRhdGlvblsxXSBjYWxscyB0
aGlzIGFyZWEgTUJPWDBfVCwgYnV0IGl0IHNheXMgaXQncyAyNGtCIGxvbmcuCj4gCj4gWzFdOiBo
dHRwczovL3Byb3RlY3QyLmZpcmVleWUuY29tL3YxL3VybD9rPTE4MmI2OGQ2LTQ3YjA1MDJiLTE4
MmFlMzk5LTAwMGJhYmZmMzE3Yi1kMmIwNWY5N2I4NWEwOWZmJnE9MSZlPTYzYTQ5YWNkLWUzNDMt
NDNkMi1hNTdkLWI0ZjZmY2QyM2I2MSZ1PWh0dHBzJTNBJTJGJTJGZ2l0LmJlYWdsZWJvYXJkLm9y
ZyUyRmJlYWdsZXYtYWhlYWQlMkZiZWFnbGV2LWFoZWFkJTJGLSUyRmJsb2IlMkZtYWluJTJGZG9j
cyUyRlRIMTUyMCUyNTIwU3lzdGVtJTI1MjBVc2VyJTI1MjBNYW51YWwucGRmCj4gCj4+ICsJCQkg
ICAgIDwweGZmIDB4ZmZjNDQwMDAgMHgwIDB4MTAwMD4sCj4gCj4gQWNjb3JkaW5nIHRvIHRoZSBk
b2N1bWVudGF0aW9uIHRoaXMgaXMgaW5zaWRlIHRoZSAyNGtCIE1CT1gxX1QgYXJlYS4KPiAKPj4g
KwkJCSAgICAgPDB4ZmYgMHhmZmM0YzAwMCAweDAgMHgxMDAwPiwKPiAKPiBUaGlzIGlzIGNhbGxv
ZCBNQk9YMl9ULCBidXQgaXMgOGtCIGxvbmcuCj4gCj4+ICsJCQkgICAgIDwweGZmIDB4ZmZjNTQw
MDAgMHgwIDB4MTAwMD47Cj4gCj4gVGhpcyBpcyBjYWxsb2QgTUJPWDNfVCwgYnV0IGlzIDhrQiBs
b25nLgo+IAo+PiArCQkgICAgICAgcmVnLW5hbWVzID0gImxvY2FsIiwgInJlbW90ZS1pY3UwIiwg
InJlbW90ZS1pY3UxIiwgInJlbW90ZS1pY3UyIjsKPiAKPiBNYXliZSB0aGVzZSBzaG91bGQgbWF0
Y2ggdGhlIE1CT1huX1QgbmFtZXMgaW4gdGhlIGRvY3VtZW50YXRpb24/CgpJbmRlZWQsIHRob3Nl
IGFyZSBleGNlbGxlbnQgcG9pbnRzLiBJIHdvbmRlcmVkIGFib3V0IHRoaXMgdG9kYXksIHRyeWlu
Zwp0byB1bmRlcnN0YW5kIHdoeSB0aGUgbWFwcGluZyB3YXMgZG9uZSB0aGlzIHdheS4KCkZvciB0
aGUgTUJPWDBfVCBtYXBwaW5nLCB0aGUgbWFpbGJveCBkcml2ZXIgbmVlZHMgdG8gbWFwIHRoZSBN
MF8qCnJlZ2lzdGVycywgaW5jbHVkaW5nIHRoZSBNMF9DbiByZWdpc3RlcnMsIHdoZXJlIG90aGVy
IGNvcmVzIHdyaXRlIHRoZWlyCm1lc3NhZ2VzLiBUaGlzIHNldHVwIHJlcXVpcmVzIGEgdG90YWwg
b2YgMTZLQiwgd2l0aCBhbiBhZGRpdGlvbmFsIDhLQgp0aGF0IHJlbWFpbnMgdW51c2VkLgoKUmVn
YXJkaW5nIE1CT1gxX1QsIE1CT1gyX1QsIGFuZCBNQk9YM19ULCBvbmx5IG9uZSBzZXQgb2YgcmVn
aXN0ZXJzIGlzCm5lY2Vzc2FyeSAtIHNwZWNpZmljYWxseSwgTW5fQzAgc2luY2UgdGhlIGtlcm5l
bCBhbHdheXMgc2VuZHMgbWVzc2FnZXMKZnJvbSB0aGUgOTEwdCBjb3JlIHdpdGggQ1BVX0lEWD0w
LgoKVGhlIE1CT1gxX1QgbWFwcGluZyBpcyBwYXJ0aWN1bGFybHkgY29uZnVzaW5nLCBhcyB0aGUg
cmVsZXZhbnQKcmVnaXN0ZXJzLCBNMV9DMCosIHN0YXJ0IHdpdGggYW4gb2Zmc2V0IG9mIDB4NDAw
MCByZWxhdGl2ZSB0byB0aGUKYmVnaW5uaW5nIG9mIHRoZSBtYXBwaW5nLgoKRm9yIE1CT1gyX1Qg
YW5kIE1CT1gzX1QsIHRoZSBuZWNlc3NhcnkgcmVnaXN0ZXIgc2V0cywgTTJfQzAgYW5kIE0zX0Mw
LAplYWNoIG9jY3VweSA0S0Igb2YgYWRkcmVzcyBzcGFjZSwgbGVhdmluZyBleHRyYSA0a0IgdW51
c2VkLgoKSSBhc3N1bWUgdGhlIGhhcmR3YXJlIGRlc2lnbmVycyBmb3VuZCB0aGVzZSBtYXBwaW5n
cyBtb3JlCnN0cmFpZ2h0Zm9yd2FyZCB0byBpbXBsZW1lbnQgdGhpcyB3YXkuIEnigJltIGZhaXJs
eSBjb25maWRlbnQgdGhhdCB0aGVzZQpudW1iZXJzIGFyZSBhY2N1cmF0ZSwgYXMgSSBoYXZlIHRl
c3RlZCB0aGVtIGFuZCBjb25maXJtZWQgdGhleSB3b3JrLgoKPiAKPj4gKwkJICAgICAgIGludGVy
cnVwdC1wYXJlbnQgPSA8JnBsaWM+Owo+PiArCQkgICAgICAgaW50ZXJydXB0cyA9IDwyOCBJUlFf
VFlQRV9MRVZFTF9ISUdIPjsKPiAKPiBZb3Ugc2hvdWxkIHByb2JhYmx5IGFsc28gYWRkIHRoZSBj
bG9ja3MgaGVyZToKPiAKPiAJY2xvY2tzID0gPCZjbGsgQ0xLX01CT1gwPiwgIC4uLCA8JmNsayBD
TEtfTUJPWDM+Owo+IAo+IC4uYW5kIGNsYWltIHRoZW0gaW4gdGhlIGRyaXZlci4gT3RoZXJ3aXNl
IHRoZSBjbG9jayBmcmFtZXdvcmsgd2lsbCBjb25zaWRlcgo+IHRoZW0gdW51c2VkIGFuZCB0dXJu
IHRoZW0gb2ZmIHdpdGhvdXQgdGhlIGNsa19pZ25vcmVfdW5lc2VkIGtlcm5lbCBjb21tYW5kCj4g
bGluZS4KClRoYW5rcyBmb3IgdGhlIHN1Z2dlc3Rpb24hIEnigJlsbCByZS10ZXN0IHdpdGggdGhl
IGNsb2NrcyBhZGRlZC4gSSBoYWQKY2xrX2lnbm9yZV91bnVzZWQgZW5hYmxlZCBwZXJtYW5lbnRs
eSBpbiBteSBVLUJvb3QgY29uZmlndXJhdGlvbiwgc28gSQptaWdodCBoYXZlIG92ZXJsb29rZWQg
dGhpcyBkZXRhaWwuCgo+IAo+IC9FbWlsCj4gCj4+ICsJCSAgICAgICAjbWJveC1jZWxscyA9IDwy
PjsKPj4gKwkJfTsKPj4gIAl9Owo+PiAgfTsKPj4gLS0KPj4gMi4zNC4xCj4+Cj4+Cj4+IF9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4+IGxpbnV4LXJpc2N2
IG1haWxpbmcgbGlzdAo+PiBsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCj4+IGh0dHBz
Oi8vcHJvdGVjdDIuZmlyZWV5ZS5jb20vdjEvdXJsP2s9Y2IxYTFiYmEtOTQ4MTIzNDctY2IxYjkw
ZjUtMDAwYmFiZmYzMTdiLTNmZTA3MWZjODAzNzM5MGUmcT0xJmU9NjNhNDlhY2QtZTM0My00M2Qy
LWE1N2QtYjRmNmZjZDIzYjYxJnU9aHR0cCUzQSUyRiUyRmxpc3RzLmluZnJhZGVhZC5vcmclMkZt
YWlsbWFuJTJGbGlzdGluZm8lMkZsaW51eC1yaXNjdgo+IAoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4
LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFp
bG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
