Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D89D9C54798
	for <linux-riscv@archiver.kernel.org>; Sat,  2 Mar 2024 14:14:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KPXueS54RBptK3QP7Bky4iRXfk3b1GfRmYNpBGyWLq0=; b=h50ODUttD7j3Xv
	R7bG4ZwIcvT8UcP0RjTAyAk/5rb9AFt4GA/FB6tOQ8Pq6qclQ6tf9PPeAeV7i/ECVCLS1peGpm6H1
	Hd24IrTtLme76IGjeC4iRtFXUHlhA8k2Sfla/bZxHubpKsYAek+3KIIVt5IFIQzmVGVGXD3/QNyU+
	fNedJEccFl8LvAXRTXWzOmIK9CKWKppK7Z/FXCAc2x7T1xcYICWjKyoQRQzl3e5iGxLXPmXnV8mwP
	opkaxV9s+Cb7ito879mLQ2+nf56cwEHbMtCj7DS8y+R/+AzZUVuJNlhwn8HVGMJskrAbMtkE+q+iK
	a6mIrXFnC71ax10AnQHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rgQ7v-00000003iaW-2Wf0;
	Sat, 02 Mar 2024 14:14:11 +0000
Received: from xry111.site ([89.208.246.23])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rgQ7t-00000003iYo-1w1o
	for linux-riscv@lists.infradead.org;
	Sat, 02 Mar 2024 14:14:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=xry111.site;
	s=default; t=1709388840;
	bh=rrs7FTnn5zBbVusszKQ43BrCp14rs9R6rlivEgH7f50=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=lVTcx+jsGLuJR11oql/QnfWS3jjbEP8a5/zlWwYoC+FHZnei9srvrgdW9IH1WkzQe
	 ppyNY4UBWnKZlEXNFuruHrQymD0WOnE3CxHu1kY7AeJ20LaEQXby6ND544Vi21k+6T
	 KFC42n6IiUbcLE073jvAa2FovXzOa4aHx5SXz11M=
Received: from [127.0.0.1] (unknown [IPv6:2001:470:683e::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-384) server-digest SHA384)
	(Client did not present a certificate)
	(Authenticated sender: xry111@xry111.site)
	by xry111.site (Postfix) with ESMTPSA id DDCBC66B29;
	Sat,  2 Mar 2024 09:13:57 -0500 (EST)
Message-ID: <110fa8d6be78a26ca21cd97c55903f5d62776430.camel@xry111.site>
Subject: Re: [PATCH v8 4/4] riscv: dts: thead: Enable LicheePi 4A eMMC and
 microSD
From: Xi Ruoyao <xry111@xry111.site>
To: Drew Fustini <dfustini@baylibre.com>, Paul Walmsley
 <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
 <aou@eecs.berkeley.edu>, Jisheng Zhang <jszhang@kernel.org>, Guo Ren
 <guoren@kernel.org>, Fu Wei <wefu@redhat.com>, Conor Dooley
 <conor@kernel.org>,  Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>
Cc: Jason Kridner <jkridner@beagleboard.org>, Robert Nelson
	 <robertcnelson@beagleboard.org>, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Date: Sat, 02 Mar 2024 22:13:55 +0800
In-Reply-To: <20231206-th1520_mmc_dts-v8-4-69220e373e8f@baylibre.com>
References: <20231206-th1520_mmc_dts-v8-0-69220e373e8f@baylibre.com>
	 <20231206-th1520_mmc_dts-v8-4-69220e373e8f@baylibre.com>
Autocrypt: addr=xry111@xry111.site; prefer-encrypt=mutual;
 keydata=mDMEYnkdPhYJKwYBBAHaRw8BAQdAsY+HvJs3EVKpwIu2gN89cQT/pnrbQtlvd6Yfq7egugi0HlhpIFJ1b3lhbyA8eHJ5MTExQHhyeTExMS5zaXRlPoiTBBMWCgA7FiEEkdD1djAfkk197dzorKrSDhnnEOMFAmJ5HT4CGwMFCwkIBwICIgIGFQoJCAsCBBYCAwECHgcCF4AACgkQrKrSDhnnEOPHFgD8D9vUToTd1MF5bng9uPJq5y3DfpcxDp+LD3joA3U2TmwA/jZtN9xLH7CGDHeClKZK/ZYELotWfJsqRcthOIGjsdAPuDgEYnkdPhIKKwYBBAGXVQEFAQEHQG+HnNiPZseiBkzYBHwq/nN638o0NPwgYwH70wlKMZhRAwEIB4h4BBgWCgAgFiEEkdD1djAfkk197dzorKrSDhnnEOMFAmJ5HT4CGwwACgkQrKrSDhnnEOPjXgD/euD64cxwqDIqckUaisT3VCst11RcnO5iRHm6meNIwj0BALLmWplyi7beKrOlqKfuZtCLbiAPywGfCNg8LOTt4iMD
User-Agent: Evolution 3.50.4 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240302_061409_541097_D9673773 
X-CRM114-Status: GOOD (  14.48  )
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

T24gV2VkLCAyMDIzLTEyLTA2IGF0IDAwOjA5IC0wODAwLCBEcmV3IEZ1c3Rpbmkgd3JvdGU6Cj4g
QWRkIGVtbWMgbm9kZSBwcm9wZXJ0aWVzIGZvciB0aGUgZU1NQyBkZXZpY2UgYW5kIGFkZCBzZGlv
MCBub2RlCj4gcHJvcGVydGllcyBmb3IgdGhlIG1pY3JvU0Qgc2xvdC4gU2V0IHRoZSBmcmVxdWVu
Y3kgZm9yIHRoZSBzZGhjaQo+IHJlZmVyZW5jZSBjbG9jay4KCkhpIERyZXcsCgpJJ3ZlIGJlZW4g
dXNpbmcgdGhlIGVtbWMgb24gTGljaGVlUGkgNEEgZm9yIGEgd2hpbGUgd2l0aG91dCBhbnkgcHJv
YmxlbSwKYnV0IHdoZW4gSSB0cnkgdGhlIG1pY3JvU0Qgc2xvdCBJIGdldDoKClsgICAgMC41MzE4
MDRdIG1tYzE6IFNESENJIGNvbnRyb2xsZXIgb24gZmZlNzA5MDAwMC5tbWMgW2ZmZTcwOTAwMDAu
bW1jXSB1c2luZyBBRE1BIDY0LWJpdApbICAgIDAuODQyNjc0XSBtbWMxOiBUdW5pbmcgZmFpbGVk
LCBmYWxsaW5nIGJhY2sgdG8gZml4ZWQgc2FtcGxpbmcgY2xvY2sKWyAgICAwLjg1NTEzOV0gbW1j
MTogdHVuaW5nIGV4ZWN1dGlvbiBmYWlsZWQ6IC01ClsgICAgMC44NTk2MDldIG1tYzE6IGVycm9y
IC01IHdoaWxzdCBpbml0aWFsaXNpbmcgU0QgY2FyZApbICAgMTEuMzU5ODc5XSBtbWMxOiBUaW1l
b3V0IHdhaXRpbmcgZm9yIGhhcmR3YXJlIGNtZCBpbnRlcnJ1cHQuClsgICAxMS4zNjU2NjFdIG1t
YzE6IHNkaGNpOiA9PT09PT09PT09PT0gU0RIQ0kgUkVHSVNURVIgRFVNUCA9PT09PT09PT09PQpb
ICAgMTEuMzcyMTA1XSBtbWMxOiBzZGhjaTogU3lzIGFkZHI6ICAweDAwMDAwMDAxIHwgVmVyc2lv
bjogIDB4MDAwMDAwMDUKWyAgIDExLjM3ODU0N10gbW1jMTogc2RoY2k6IEJsayBzaXplOiAgMHgw
MDAwNzA0MCB8IEJsayBjbnQ6ICAweDAwMDAwMDAwClsgICAxMS4zODQ5ODldIG1tYzE6IHNkaGNp
OiBBcmd1bWVudDogIDB4MDAwMDAwMDAgfCBUcm4gbW9kZTogMHgwMDAwMDAxMApbICAgMTEuMzkx
NDMyXSBtbWMxOiBzZGhjaTogUHJlc2VudDogICAweDAzZmYwMDAwIHwgSG9zdCBjdGw6IDB4MDAw
MDAwMTcKWyAgIDExLjM5Nzg3M10gbW1jMTogc2RoY2k6IFBvd2VyOiAgICAgMHgwMDAwMDAwZiB8
IEJsayBnYXA6ICAweDAwMDAwMDAwClsgICAxMS40MDQzMTJdIG1tYzE6IHNkaGNpOiBXYWtlLXVw
OiAgIDB4MDAwMDAwMDAgfCBDbG9jazogICAgMHgwMDAwMDAwZgpbICAgMTEuNDEwNzUzXSBtbWMx
OiBzZGhjaTogVGltZW91dDogICAweDAwMDAwMDA0IHwgSW50IHN0YXQ6IDB4MDAwMDAwMDAKWyAg
IDExLjQxNzE5Ml0gbW1jMTogc2RoY2k6IEludCBlbmFiOiAgMHgwMDAwMDAyMCB8IFNpZyBlbmFi
OiAweDAwMDAwMDIwClsgICAxMS40MjM2MzNdIG1tYzE6IHNkaGNpOiBBQ21kIHN0YXQ6IDB4MDAw
MDAwMDAgfCBTbG90IGludDogMHgwMDAwMDAwMApbICAgMTEuNDMwMDczXSBtbWMxOiBzZGhjaTog
Q2FwczogICAgICAweDNmNjljODgxIHwgQ2Fwc18xOiAgIDB4MDgwMDgxNzcKWyAgIDExLjQzNjUx
M10gbW1jMTogc2RoY2k6IENtZDogICAgICAgMHgwMDAwMDEwMiB8IE1heCBjdXJyOiAweDAwMTkx
OTE5ClsgICAxMS40NDI5NTRdIG1tYzE6IHNkaGNpOiBSZXNwWzBdOiAgIDB4MDAwMDA5MDAgfCBS
ZXNwWzFdOiAgMHgwNzcyNWY3ZgpbICAgMTEuNDQ5Mzk0XSBtbWMxOiBzZGhjaTogUmVzcFsyXTog
ICAweDMyZGI3OTAwIHwgUmVzcFszXTogIDB4MDA0MDBlMDAKWyAgIDExLjQ1NTgzNV0gbW1jMTog
c2RoY2k6IEhvc3QgY3RsMjogMHgwMDAwMzAwYgpbICAgMTEuNDYwMjgwXSBtbWMxOiBzZGhjaTog
QURNQSBFcnI6ICAweDAwMDAwMDAwIHwgQURNQSBQdHI6IDB4MDAwMDAwMDAwMDg4MjIyMApbICAg
MTEuNDY3NDE2XSBtbWMxOiBzZGhjaTogPT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT0KWyAgIDExLjU2MzgyOF0gbW1jMTogVHVuaW5nIGZhaWxlZCwgZmFsbGluZyBi
YWNrIHRvIGZpeGVkIHNhbXBsaW5nIGNsb2NrClsgICAxMS41NzYwNTNdIG1tYzE6IHR1bmluZyBl
eGVjdXRpb24gZmFpbGVkOiAtNQpbICAgMTEuNjQ2NDM4XSBtbWMxOiBuZXcgaGlnaCBzcGVlZCBT
RFhDIGNhcmQgYXQgYWRkcmVzcyBhYWFhClsgICAxMS42NTMxNzBdIG1tY2JsazE6IG1tYzE6YWFh
YSBTUjI1NiAyMzggR2lCCgpJIGNhbiB3cml0ZSBzb21ldGhpbmcgaW50byB0aGUgU0QgY2FyZCBh
bmQgcmVhZCBpdCBiYWNrIHRob3VnaC4gIEJ1dAp0aGlzIG1ha2VzIG1lIHJlbHVjdGFudCB0byB1
c2UgdGhlIFNEIGNhcmQgZm9yICJzb21lIHJlYWwgdGhpbmciIGFmcmFpZApvZiBhIGRhdGEgbG9z
cy4KClRoZSBTRCBjYXJkIGlzIGEgU2FuRGlzayBFeHRyZW1lIFBybyAyNTZHQiAocmF0ZWQgIlUz
LCBBMiwgVjMwIikuCgpBbnkgaWRlYSBob3cgdG8gZGVidWcgdGhpcyBpc3N1ZSBmdXJ0aGVyPyAg
KE1heWJlIEkgc2hvdWxkIHRyeSBjaGFuZ2UKdGhlIFNEIGNhcmQgZmlyc3QgYnV0IEknZCBsaWtl
IHRvIGRpc2N1c3MgdGhlIGlzc3VlIGJlZm9yZSBwYXlpbmcgbW9uZXkKZm9yIGFub3RoZXIgY2Fy
ZC4pCgo+IFNpZ25lZC1vZmYtYnk6IERyZXcgRnVzdGluaSA8ZGZ1c3RpbmlAYmF5bGlicmUuY29t
Pgo+IC0tLQo+IMKgLi4uL2Jvb3QvZHRzL3RoZWFkL3RoMTUyMC1saWNoZWUtbW9kdWxlLTRhLmR0
c2nCoMKgwqDCoMKgIHwgMjAgKysrKysrKysrKysrKysrKysrKysKPiDCoDEgZmlsZSBjaGFuZ2Vk
LCAyMCBpbnNlcnRpb25zKCspCj4gCj4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3YvYm9vdC9kdHMv
dGhlYWQvdGgxNTIwLWxpY2hlZS1tb2R1bGUtNGEuZHRzaSBiL2FyY2gvcmlzY3YvYm9vdC9kdHMv
dGhlYWQvdGgxNTIwLWxpY2hlZS1tb2R1bGUtNGEuZHRzaQo+IGluZGV4IGE4MDJhYjExMDQyOS4u
MTM2NWQzYTUxMmEzIDEwMDY0NAo+IC0tLSBhL2FyY2gvcmlzY3YvYm9vdC9kdHMvdGhlYWQvdGgx
NTIwLWxpY2hlZS1tb2R1bGUtNGEuZHRzaQo+ICsrKyBiL2FyY2gvcmlzY3YvYm9vdC9kdHMvdGhl
YWQvdGgxNTIwLWxpY2hlZS1tb2R1bGUtNGEuZHRzaQo+IEBAIC0yOSw2ICsyOSwxMCBAQCAmYXBi
X2NsayB7Cj4gwqAJY2xvY2stZnJlcXVlbmN5ID0gPDYyNTAwMDAwPjsKPiDCoH07Cj4gwqAKPiAr
JnNkaGNpX2NsayB7Cj4gKwljbG9jay1mcmVxdWVuY3kgPSA8MTk4MDAwMDAwPjsKPiArfTsKPiAr
Cj4gwqAmdWFydF9zY2xrIHsKPiDCoAljbG9jay1mcmVxdWVuY3kgPSA8MTAwMDAwMDAwPjsKPiDC
oH07Cj4gQEAgLTM2LDMgKzQwLDE5IEBAICZ1YXJ0X3NjbGsgewo+IMKgJmRtYWMwIHsKPiDCoAlz
dGF0dXMgPSAib2theSI7Cj4gwqB9Owo+ICsKPiArJmVtbWMgewo+ICsJYnVzLXdpZHRoID0gPDg+
Owo+ICsJbWF4LWZyZXF1ZW5jeSA9IDwxOTgwMDAwMDA+Owo+ICsJbW1jLWhzNDAwLTFfOHY7Cj4g
Kwlub24tcmVtb3ZhYmxlOwo+ICsJbm8tc2RpbzsKPiArCW5vLXNkOwo+ICsJc3RhdHVzID0gIm9r
YXkiOwo+ICt9Owo+ICsKPiArJnNkaW8wIHsKPiArCWJ1cy13aWR0aCA9IDw0PjsKPiArCW1heC1m
cmVxdWVuY3kgPSA8MTk4MDAwMDAwPjsKPiArCXN0YXR1cyA9ICJva2F5IjsKPiArfTsKCi0tIApY
aSBSdW95YW8gPHhyeTExMUB4cnkxMTEuc2l0ZT4KU2Nob29sIG9mIEFlcm9zcGFjZSBTY2llbmNl
IGFuZCBUZWNobm9sb2d5LCBYaWRpYW4gVW5pdmVyc2l0eQoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4
LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFp
bG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
