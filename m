Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 643D4C48BF6
	for <linux-riscv@archiver.kernel.org>; Sun,  3 Mar 2024 08:48:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kz7Ljh7KIEQTSloyBYr2V2Kf/2Kg1rx68CG+SsbBt7w=; b=CQ0mFeMD4GjzJn
	M4koPt3un58nnAy33xuBiE7nu/j6qYS/i/YngrQlK71MpaVKYLavzlP2d78N3hdHGmZtJbEIytqYP
	ZN2NIoP8Ad0DKOktuhJ4Wy6u5IqCItNMl1rL/P516fQAl6YiPU/m068XHTRdhXh2km56rwrJUMhHb
	MST3jzl9DS0eZAI0qacpAGpknb6TLt/Z2bgkDb43KnP2PyVYFI/8nUHUfIcL0dhPmScNFv5p0eBXa
	U8PSD/8Wz/RUIRtzjDi5AIgxqAuofw8GR+JP1vtSmo9TThu1X/GLXCRfKM3HSByTyZ3d1TJh52qoR
	UQ16t395t+2SWD4cThPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rghW3-00000005V5W-0BcQ;
	Sun, 03 Mar 2024 08:48:15 +0000
Received: from xry111.site ([89.208.246.23])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rghW0-00000005V4h-2nSW
	for linux-riscv@lists.infradead.org;
	Sun, 03 Mar 2024 08:48:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=xry111.site;
	s=default; t=1709455686;
	bh=Gv1iB9/klBsQcszgsagn4nngUZ9spriYr0Hq9I0tzrg=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=ZtIUucJHPHIWN1FbeK3l5zBEN1OBLmLEjcmlrRBPBtGVdLB8Zo6oZLCNhBgReurbe
	 IO0A85mv8Re0QTITHPBXofwwesV/AHOL1WfNQ5OkTiJSvFkESirJtW1bHsfYOWa/JJ
	 2HRCuJ1dKFd6t8eH6tWR4yGUOJNNSnsRR6SaSA5o=
Received: from [127.0.0.1] (unknown [IPv6:2001:470:683e::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-384) server-digest SHA384)
	(Client did not present a certificate)
	(Authenticated sender: xry111@xry111.site)
	by xry111.site (Postfix) with ESMTPSA id CA38F66FDE;
	Sun,  3 Mar 2024 03:48:03 -0500 (EST)
Message-ID: <64b50846602e0c4474edee2f3aaafa107527c93e.camel@xry111.site>
Subject: Re: [PATCH v8 4/4] riscv: dts: thead: Enable LicheePi 4A eMMC and
 microSD
From: Xi Ruoyao <xry111@xry111.site>
To: Drew Fustini <dfustini@tenstorrent.com>
Cc: Drew Fustini <dfustini@baylibre.com>, Paul Walmsley
 <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
 <aou@eecs.berkeley.edu>, Jisheng Zhang <jszhang@kernel.org>, Guo Ren
 <guoren@kernel.org>, Fu Wei <wefu@redhat.com>, Conor Dooley
 <conor@kernel.org>,  Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Jason Kridner
 <jkridner@beagleboard.org>, Robert Nelson <robertcnelson@beagleboard.org>, 
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org
Date: Sun, 03 Mar 2024 16:48:02 +0800
In-Reply-To: <ZeNS/g97JetYgXny@x1>
References: <20231206-th1520_mmc_dts-v8-0-69220e373e8f@baylibre.com>
	 <20231206-th1520_mmc_dts-v8-4-69220e373e8f@baylibre.com>
	 <110fa8d6be78a26ca21cd97c55903f5d62776430.camel@xry111.site>
	 <ZeNS/g97JetYgXny@x1>
Autocrypt: addr=xry111@xry111.site; prefer-encrypt=mutual;
 keydata=mDMEYnkdPhYJKwYBBAHaRw8BAQdAsY+HvJs3EVKpwIu2gN89cQT/pnrbQtlvd6Yfq7egugi0HlhpIFJ1b3lhbyA8eHJ5MTExQHhyeTExMS5zaXRlPoiTBBMWCgA7FiEEkdD1djAfkk197dzorKrSDhnnEOMFAmJ5HT4CGwMFCwkIBwICIgIGFQoJCAsCBBYCAwECHgcCF4AACgkQrKrSDhnnEOPHFgD8D9vUToTd1MF5bng9uPJq5y3DfpcxDp+LD3joA3U2TmwA/jZtN9xLH7CGDHeClKZK/ZYELotWfJsqRcthOIGjsdAPuDgEYnkdPhIKKwYBBAGXVQEFAQEHQG+HnNiPZseiBkzYBHwq/nN638o0NPwgYwH70wlKMZhRAwEIB4h4BBgWCgAgFiEEkdD1djAfkk197dzorKrSDhnnEOMFAmJ5HT4CGwwACgkQrKrSDhnnEOPjXgD/euD64cxwqDIqckUaisT3VCst11RcnO5iRHm6meNIwj0BALLmWplyi7beKrOlqKfuZtCLbiAPywGfCNg8LOTt4iMD
User-Agent: Evolution 3.50.4 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240303_004812_810217_D4522113 
X-CRM114-Status: GOOD (  21.42  )
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

T24gU2F0LCAyMDI0LTAzLTAyIGF0IDA4OjI1IC0wODAwLCBEcmV3IEZ1c3Rpbmkgd3JvdGU6Cj4g
T24gU2F0LCBNYXIgMDIsIDIwMjQgYXQgMTA6MTM6NTVQTSArMDgwMCwgWGkgUnVveWFvIHdyb3Rl
Ogo+ID4gT24gV2VkLCAyMDIzLTEyLTA2IGF0IDAwOjA5IC0wODAwLCBEcmV3IEZ1c3Rpbmkgd3Jv
dGU6Cj4gPiA+IEFkZCBlbW1jIG5vZGUgcHJvcGVydGllcyBmb3IgdGhlIGVNTUMgZGV2aWNlIGFu
ZCBhZGQgc2RpbzAgbm9kZQo+ID4gPiBwcm9wZXJ0aWVzIGZvciB0aGUgbWljcm9TRCBzbG90LiBT
ZXQgdGhlIGZyZXF1ZW5jeSBmb3IgdGhlIHNkaGNpCj4gPiA+IHJlZmVyZW5jZSBjbG9jay4KPiA+
IAo+ID4gSGkgRHJldywKPiA+IAo+ID4gSSd2ZSBiZWVuIHVzaW5nIHRoZSBlbW1jIG9uIExpY2hl
ZVBpIDRBIGZvciBhIHdoaWxlIHdpdGhvdXQgYW55IHByb2JsZW0sCj4gPiBidXQgd2hlbiBJIHRy
eSB0aGUgbWljcm9TRCBzbG90IEkgZ2V0Ogo+ID4gCj4gPiBbwqDCoMKgIDAuNTMxODA0XSBtbWMx
OiBTREhDSSBjb250cm9sbGVyIG9uIGZmZTcwOTAwMDAubW1jIFtmZmU3MDkwMDAwLm1tY10gdXNp
bmcgQURNQSA2NC1iaXQKPiA+IFvCoMKgwqAgMC44NDI2NzRdIG1tYzE6IFR1bmluZyBmYWlsZWQs
IGZhbGxpbmcgYmFjayB0byBmaXhlZCBzYW1wbGluZyBjbG9jawo+ID4gW8KgwqDCoCAwLjg1NTEz
OV0gbW1jMTogdHVuaW5nIGV4ZWN1dGlvbiBmYWlsZWQ6IC01Cj4gPiBbwqDCoMKgIDAuODU5NjA5
XSBtbWMxOiBlcnJvciAtNSB3aGlsc3QgaW5pdGlhbGlzaW5nIFNEIGNhcmQKPiA+IFvCoMKgIDEx
LjM1OTg3OV0gbW1jMTogVGltZW91dCB3YWl0aW5nIGZvciBoYXJkd2FyZSBjbWQgaW50ZXJydXB0
Lgo+ID4gW8KgwqAgMTEuMzY1NjYxXSBtbWMxOiBzZGhjaTogPT09PT09PT09PT09IFNESENJIFJF
R0lTVEVSIERVTVAgPT09PT09PT09PT0KPiA+IFvCoMKgIDExLjM3MjEwNV0gbW1jMTogc2RoY2k6
IFN5cyBhZGRyOsKgIDB4MDAwMDAwMDEgfCBWZXJzaW9uOsKgIDB4MDAwMDAwMDUKPiA+IFvCoMKg
IDExLjM3ODU0N10gbW1jMTogc2RoY2k6IEJsayBzaXplOsKgIDB4MDAwMDcwNDAgfCBCbGsgY250
OsKgIDB4MDAwMDAwMDAKPiA+IFvCoMKgIDExLjM4NDk4OV0gbW1jMTogc2RoY2k6IEFyZ3VtZW50
OsKgIDB4MDAwMDAwMDAgfCBUcm4gbW9kZTogMHgwMDAwMDAxMAo+ID4gW8KgwqAgMTEuMzkxNDMy
XSBtbWMxOiBzZGhjaTogUHJlc2VudDrCoMKgIDB4MDNmZjAwMDAgfCBIb3N0IGN0bDogMHgwMDAw
MDAxNwo+ID4gW8KgwqAgMTEuMzk3ODczXSBtbWMxOiBzZGhjaTogUG93ZXI6wqDCoMKgwqAgMHgw
MDAwMDAwZiB8IEJsayBnYXA6wqAgMHgwMDAwMDAwMAo+ID4gW8KgwqAgMTEuNDA0MzEyXSBtbWMx
OiBzZGhjaTogV2FrZS11cDrCoMKgIDB4MDAwMDAwMDAgfCBDbG9jazrCoMKgwqAgMHgwMDAwMDAw
Zgo+ID4gW8KgwqAgMTEuNDEwNzUzXSBtbWMxOiBzZGhjaTogVGltZW91dDrCoMKgIDB4MDAwMDAw
MDQgfCBJbnQgc3RhdDogMHgwMDAwMDAwMAo+ID4gW8KgwqAgMTEuNDE3MTkyXSBtbWMxOiBzZGhj
aTogSW50IGVuYWI6wqAgMHgwMDAwMDAyMCB8IFNpZyBlbmFiOiAweDAwMDAwMDIwCj4gPiBbwqDC
oCAxMS40MjM2MzNdIG1tYzE6IHNkaGNpOiBBQ21kIHN0YXQ6IDB4MDAwMDAwMDAgfCBTbG90IGlu
dDogMHgwMDAwMDAwMAo+ID4gW8KgwqAgMTEuNDMwMDczXSBtbWMxOiBzZGhjaTogQ2FwczrCoMKg
wqDCoMKgIDB4M2Y2OWM4ODEgfCBDYXBzXzE6wqDCoCAweDA4MDA4MTc3Cj4gPiBbwqDCoCAxMS40
MzY1MTNdIG1tYzE6IHNkaGNpOiBDbWQ6wqDCoMKgwqDCoMKgIDB4MDAwMDAxMDIgfCBNYXggY3Vy
cjogMHgwMDE5MTkxOQo+ID4gW8KgwqAgMTEuNDQyOTU0XSBtbWMxOiBzZGhjaTogUmVzcFswXTrC
oMKgIDB4MDAwMDA5MDAgfCBSZXNwWzFdOsKgIDB4MDc3MjVmN2YKPiA+IFvCoMKgIDExLjQ0OTM5
NF0gbW1jMTogc2RoY2k6IFJlc3BbMl06wqDCoCAweDMyZGI3OTAwIHwgUmVzcFszXTrCoCAweDAw
NDAwZTAwCj4gPiBbwqDCoCAxMS40NTU4MzVdIG1tYzE6IHNkaGNpOiBIb3N0IGN0bDI6IDB4MDAw
MDMwMGIKPiA+IFvCoMKgIDExLjQ2MDI4MF0gbW1jMTogc2RoY2k6IEFETUEgRXJyOsKgIDB4MDAw
MDAwMDAgfCBBRE1BIFB0cjogMHgwMDAwMDAwMDAwODgyMjIwCj4gPiBbwqDCoCAxMS40Njc0MTZd
IG1tYzE6IHNkaGNpOiA9PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PQo+ID4gW8KgwqAgMTEuNTYzODI4XSBtbWMxOiBUdW5pbmcgZmFpbGVkLCBmYWxsaW5nIGJhY2sg
dG8gZml4ZWQgc2FtcGxpbmcgY2xvY2sKPiA+IFvCoMKgIDExLjU3NjA1M10gbW1jMTogdHVuaW5n
IGV4ZWN1dGlvbiBmYWlsZWQ6IC01Cj4gPiBbwqDCoCAxMS42NDY0MzhdIG1tYzE6IG5ldyBoaWdo
IHNwZWVkIFNEWEMgY2FyZCBhdCBhZGRyZXNzIGFhYWEKPiA+IFvCoMKgIDExLjY1MzE3MF0gbW1j
YmxrMTogbW1jMTphYWFhIFNSMjU2IDIzOCBHaUIKPiA+IAo+ID4gSSBjYW4gd3JpdGUgc29tZXRo
aW5nIGludG8gdGhlIFNEIGNhcmQgYW5kIHJlYWQgaXQgYmFjayB0aG91Z2guwqAgQnV0Cj4gPiB0
aGlzIG1ha2VzIG1lIHJlbHVjdGFudCB0byB1c2UgdGhlIFNEIGNhcmQgZm9yICJzb21lIHJlYWwg
dGhpbmciIGFmcmFpZAo+ID4gb2YgYSBkYXRhIGxvc3MuCj4gPiAKPiA+IFRoZSBTRCBjYXJkIGlz
IGEgU2FuRGlzayBFeHRyZW1lIFBybyAyNTZHQiAocmF0ZWQgIlUzLCBBMiwgVjMwIikuCj4gPiAK
PiA+IEFueSBpZGVhIGhvdyB0byBkZWJ1ZyB0aGlzIGlzc3VlIGZ1cnRoZXI/wqAgKE1heWJlIEkg
c2hvdWxkIHRyeSBjaGFuZ2UKPiA+IHRoZSBTRCBjYXJkIGZpcnN0IGJ1dCBJJ2QgbGlrZSB0byBk
aXNjdXNzIHRoZSBpc3N1ZSBiZWZvcmUgcGF5aW5nIG1vbmV5Cj4gPiBmb3IgYW5vdGhlciBjYXJk
LikKPiAKPiBSZXZ5IGluZm9ybWVkIG1lIHRoYXQgZG93bmNsb2NraW5nIGZyb20gMTk4IE1IeiB0
byAxMDAgTUh6IFsxXSBoYXMgYmVlbgo+IG9ic2VydmVkIHRvIHNvbHZlIHRoaXMgcHJvYmxlbS4g
Q291bGQgeW91IHRyeSB0aGUgZm9sbG93aW5nIGR0cyBwYXRjaD8KCkknbSBzdGlsbCBnZXR0aW5n
IHRoZSBzYW1lIGVycm9yLgoKPiBBbHNvLCBJIGhhdmUgbm90aWNlZCB0aGUgVC1IZWFkJ3MgNS4x
MCB2ZW5kb3Iga2VybmVsIGRvZXMgaGF2ZSBzb21lCj4gdXBkYXRlcyBpbiBzZGhjaS1vZi1kd2Nt
c2hjLmMgcmVsYXRlZCB0byB0dW5pbmcuIEknbGwgbG9vayBhdCBwb3J0aW5nCj4gdGhvc2UgdG8g
dGhlIHVwc3RyZWFtIGRyaXZpbmcuCgpNYXliZSB0byBzb2x2ZSB0aGUgcHJvYmxlbSB3ZSBuZWVk
IGJvdGggdGhlIGRvd25jbG9ja2luZyBhbmQgdGhlc2UKY2hhbmdlcyB0aGVuLi4uCgotLSAKWGkg
UnVveWFvIDx4cnkxMTFAeHJ5MTExLnNpdGU+ClNjaG9vbCBvZiBBZXJvc3BhY2UgU2NpZW5jZSBh
bmQgVGVjaG5vbG9neSwgWGlkaWFuIFVuaXZlcnNpdHkKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1y
aXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxt
YW4vbGlzdGluZm8vbGludXgtcmlzY3YK
