Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69AE9C77B73
	for <linux-riscv@archiver.kernel.org>; Sun,  4 Jun 2023 06:46:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=81mxVT7BcTMLm6jYnlfQ9nTFOBltiJNB0QsD1apy7wA=; b=o6R226qK2Vp2VM
	xqNMuPTALLWM+OEQg+zEvfBe541fKpU49V6HH5XdYb5rjvEB58QKOsxgSh98LmPiy97QwyB7ipr/L
	hwNvdHoWvK+FJxT5Bsk6jsIlylKQGjS8JKo+tp3F9m2s9D7fMP4Xod3ymBd56z6piCm8YFt5XB24U
	tdBjd7LbI2vKf65D5SosG8ADLRtkzB12w53RWlUyVD7lvjUVSUT+4Qp9NSIhn9K1GigHZZqBCexcc
	Qgkj06SC3QsTi19fcgM9Y8nZ745lr8fHIKG6nNA7tJPJEKLaMzUk+s7hYaP3dwU7P36Vrorepifji
	HIODlwStaw3gsAddnHGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q5hVP-00BTzE-37;
	Sun, 04 Jun 2023 06:46:23 +0000
Received: from todd.t-8ch.de ([159.69.126.157])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q5hVM-00BTy3-1m
	for linux-riscv@lists.infradead.org;
	Sun, 04 Jun 2023 06:46:23 +0000
Date: Sun, 4 Jun 2023 08:46:12 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=t-8ch.de; s=mail;
	t=1685861173; bh=Ne4F0pnUd4nHoSVuh0eJZuKjfE4h0WV37TMERYI1N3g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Oe8G5rESwI18KpMmkO7slyOr3AHLTgxLR2xACVrWtQMVLH0jPVK8v/w/SQ9xq5HXG
	 V5hoBazXNS4NwwFruXI0rJCdtrUUY1g/r2CDLIOT5CK2W8BLie7kJWr3lDvqo2jQGV
	 BRnIo3qb1YvEO4UjH/W5VCwxOA9ZFKqNwtMy4KK0=
From: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <thomas@t-8ch.de>
To: Zhangjin Wu <falcon@tinylab.org>
Cc: w@1wt.eu, arnd@arndb.de, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: Re: [PATCH v3 11/12] selftests/nolibc: add new gettimeofday test
 cases
Message-ID: <2fccaff5-2354-4ac0-8389-1004d47d8dc9@t-8ch.de>
References: <cover.1685777982.git.falcon@tinylab.org>
 <68dace9e2532316ff454894697ecfd99e419a523.1685777982.git.falcon@tinylab.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <68dace9e2532316ff454894697ecfd99e419a523.1685777982.git.falcon@tinylab.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230603_234621_236075_AB0EE359 
X-CRM114-Status: GOOD (  14.83  )
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

T24gMjAyMy0wNi0wMyAxNjoxNjowNyswODAwLCBaaGFuZ2ppbiBXdSB3cm90ZToKPiBUaGVzZSAy
IHRlc3QgY2FzZXMgYXJlIGFkZGVkIHRvIGNvdmVyIHRoZSBub3JtYWwgdXNpbmcgc2NlbmVzIG9m
Cj4gZ2V0dGltZW9mZGF5KCkuCj4gCj4gVGhleSBoYXZlIGJlZW4gdXNlZCB0byB0cmlnZ2VyIGFu
ZCBmaXggdXAgc3VjaCBpc3N1ZSB3aXRoIG5vbGliYzoKPiAKPiAgICAgbm9saWJjLXRlc3QuYzoo
LnRleHQuZ2V0dGltZW9mZGF5KzB4NTQpOiB1bmRlZmluZWQgcmVmZXJlbmNlIHRvIGBfX2FlYWJp
X2xkaXZtb2QnCj4gCj4gVGhpcyBpc3N1ZSBoYXBwZW5zIHdoaWxlIHRoZXJlIGlzIG5vICJ1bnNp
Z25lZCBpbnQiIGNvbnZlcnNpb24gaW4gdGhlCj4gY29taW5nIG5ldyBjbG9ja19nZXR0aW1lIC8g
Y2xvY2tfZ2V0dGltZTY0IHN5c2NhbGwgcGF0aCBvZgo+IGdldHRpbWVvZmRheSgpOgo+IAo+ICAg
ICB0di0+dHZfdXNlYyA9IHRzLnR2X25zZWMgLyAxMDAwOwoKQXMgbWVudGlvbmVkIGJlZm9yZSB0
aGlzIGxvb2tzIHRvIG1lIGxpa2UgYW4gaXNzdWUgaW4gdGhlIGJ1aWxkIHNldHVwLgpDb3VsZCB5
b3UgcHJvdmlkZSByZXByb2R1Y3Rpb24gc3RlcHM/CgpOZXZlcnRoZWxlc3MgSSBndWVzcyB0aGUg
dGVzdHMgdGhlbXNlbHZlcyBhcmUgZmluZSB0byBoYXZlLgoKPiBTdWdnZXN0ZWQtYnk6IFRob21h
cyBXZWnDn3NjaHVoIDxsaW51eEB3ZWlzc3NjaHVoLm5ldD4KPiBMaW5rOiBodHRwczovL2xvcmUu
a2VybmVsLm9yZy9saW51eC1yaXNjdi8yODA4NjdhOC03NjAxLTRhOTYtOWI4NS04NzY2OGUxZjEy
ODJAdC04Y2guZGUvCj4gU2lnbmVkLW9mZi1ieTogWmhhbmdqaW4gV3UgPGZhbGNvbkB0aW55bGFi
Lm9yZz4KPiAtLS0KPiAgdG9vbHMvdGVzdGluZy9zZWxmdGVzdHMvbm9saWJjL25vbGliYy10ZXN0
LmMgfCA0ICsrKysKPiAgMSBmaWxlIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKQo+IAo+IGRpZmYg
LS1naXQgYS90b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy9ub2xpYmMvbm9saWJjLXRlc3QuYyBiL3Rv
b2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL25vbGliYy9ub2xpYmMtdGVzdC5jCj4gaW5kZXggYmY2M2Zj
NjZlNDg2Li5lNjhjNTY5MmVjNTQgMTAwNjQ0Cj4gLS0tIGEvdG9vbHMvdGVzdGluZy9zZWxmdGVz
dHMvbm9saWJjL25vbGliYy10ZXN0LmMKPiArKysgYi90b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy9u
b2xpYmMvbm9saWJjLXRlc3QuYwo+IEBAIC01MzMsNiArNTMzLDggQEAgc3RhdGljIGludCB0ZXN0
X3N0YXRfdGltZXN0YW1wcyh2b2lkKQo+ICAgKi8KPiAgaW50IHJ1bl9zeXNjYWxsKGludCBtaW4s
IGludCBtYXgpCj4gIHsKPiArCXN0cnVjdCB0aW1ldmFsIHR2Owo+ICsJc3RydWN0IHRpbWV6b25l
IHR6Owo+ICAJc3RydWN0IHN0YXQgc3RhdF9idWY7Cj4gIAlpbnQgZXVpZDA7Cj4gIAlpbnQgcHJv
YzsKPiBAQCAtNTg4LDYgKzU5MCw4IEBAIGludCBydW5fc3lzY2FsbChpbnQgbWluLCBpbnQgbWF4
KQo+ICAJCUNBU0VfVEVTVChnZXRkZW50czY0X3Jvb3QpOyAgIEVYUEVDVF9TWVNORSgxLCB0ZXN0
X2dldGRlbnRzNjQoIi8iKSwgLTEpOyBicmVhazsKPiAgCQlDQVNFX1RFU1QoZ2V0ZGVudHM2NF9u
dWxsKTsgICBFWFBFQ1RfU1lTRVIoMSwgdGVzdF9nZXRkZW50czY0KCIvZGV2L251bGwiKSwgLTEs
IEVOT1RESVIpOyBicmVhazsKPiAgCQlDQVNFX1RFU1QoZ2V0dGltZW9mZGF5X251bGwpOyBFWFBF
Q1RfU1lTWlIoMSwgZ2V0dGltZW9mZGF5KE5VTEwsIE5VTEwpKTsgYnJlYWs7Cj4gKwkJQ0FTRV9U
RVNUKGdldHRpbWVvZmRheV90dik7ICAgRVhQRUNUX1NZU1pSKDEsIGdldHRpbWVvZmRheSgmdHYs
IE5VTEwpKTsgYnJlYWs7Cj4gKwkJQ0FTRV9URVNUKGdldHRpbWVvZmRheV90dl90eik7RVhQRUNU
X1NZU1pSKDEsIGdldHRpbWVvZmRheSgmdHYsICZ0eikpOyBicmVhazsKPiAgCQlDQVNFX1RFU1Qo
Z2V0cGFnZXNpemUpOyAgICAgICBFWFBFQ1RfU1lTWlIoMSwgdGVzdF9nZXRwYWdlc2l6ZSgpKTsg
YnJlYWs7Cj4gIAkJQ0FTRV9URVNUKGlvY3RsX3Rpb2NpbnEpOyAgICAgRVhQRUNUX1NZU1pSKDEs
IGlvY3RsKDAsIFRJT0NJTlEsICZ0bXApKTsgYnJlYWs7Cj4gIAkJQ0FTRV9URVNUKGlvY3RsX3Rp
b2NpbnEpOyAgICAgRVhQRUNUX1NZU1pSKDEsIGlvY3RsKDAsIFRJT0NJTlEsICZ0bXApKTsgYnJl
YWs7Cj4gLS0gCj4gMi4yNS4xCj4gCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMu
aW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2xpbnV4LXJpc2N2Cg==
