Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D748C021A1
	for <linux-riscv@archiver.kernel.org>; Tue, 11 Feb 2025 09:26:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PI4pp/M7i8+OdqfteDs+7b3WFCr8typBVLZ403Z58+M=; b=LYDbMz4eGYTruG
	fJjUzKrXxLRQenmEfOEYnSNvpu4V/ILR2y8M/sHcPXEvEJsdMW2Nlh2ObURPE9HOn4IEgkSF+6/vQ
	F8sqJHK6fp6tEvPBELqhjoAsxCarKHgqafnVF+qO/hCrJehi0vZezTpc1DmCnrEw9yWjE9kxcX67Z
	AawLhrl8FerNu2QNh9mwf4IUauRsfeopraWbgT7M3KkJ/7sSLpMUFWeGJF/lVivAaY6J4lE2hpzma
	f8n4CiIN/02KQ0BYhm1tDZyGgInpUwyMT5OV/37QGQyNBpBvyjiyDtlLRkuP6KO/Zrzoh8rc/2wQ+
	ix/pEAa59Frs5JZNSxnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thmWh-000000039rz-2wmm;
	Tue, 11 Feb 2025 09:25:55 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thlK3-00000002wSp-1g1e;
	Tue, 11 Feb 2025 08:08:48 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 401515C041E;
	Tue, 11 Feb 2025 08:08:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A78CEC4CEE4;
	Tue, 11 Feb 2025 08:08:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739261326;
	bh=g6TTE3m9NjTz7Ln6gbbV9EUq6t8mfTc4AEapJWltUgs=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=FYQq3tj5+nT8FU9Y72jpY9LX81MJEntaazoLlM4HNq+QKkCSBKTn8EYvsBxqyjxfP
	 wjOCrvy7ZDnI1NyQpjycTZimjI9JCHecXwNSFlxbYhFn1F5IEjNwW52SRy9CzNDxbe
	 +mi1SEvvGASztHuhaupmvVUt02HEvsJeWxQoVgx/ui0lcHm3G40fxhJ+NbOSc9nghS
	 XfjRxuSKdH8wSbDMolJKV2KyM7RoBGpNeg7ROguW9Cz0K45fvm53FSEqTML6WKOpeH
	 AXMcvSCCA0pyMo5YVkfPhokbztq+RyldCoBtM2dAd+ITrWCoBZIlB2mNbARV+0mycj
	 PPh62rQisdc0w==
Message-ID: <3f548621-6f66-41ee-a23f-ae4a8345061a@kernel.org>
Date: Tue, 11 Feb 2025 09:08:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 02/10] riscv: dts: sophgo: cv18xx: Split into CPU core and
 peripheral parts
To: Alexander Sverdlin <alexander.sverdlin@gmail.com>, soc@lists.linux.dev
Cc: Chen Wang <unicorn_wang@outlook.com>,
 Inochi Amaoto <inochiama@outlook.com>, linux-riscv@lists.infradead.org,
 devicetree@vger.kernel.org, Haylen Chu <heylenay@outlook.com>,
 linux-arm-kernel@lists.infradead.org,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Arnd Bergmann <arnd@arndb.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
References: <20250209220646.1090868-1-alexander.sverdlin@gmail.com>
 <20250209220646.1090868-3-alexander.sverdlin@gmail.com>
 <dda5297c-fdf3-494f-854f-71a5000729e5@kernel.org>
 <7fa3501bd59697e65ab1387e25cb815180c3378c.camel@gmail.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 fv0=
In-Reply-To: <7fa3501bd59697e65ab1387e25cb815180c3378c.camel@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250211_000847_527346_71365A19 
X-CRM114-Status: GOOD (  14.26  )
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

T24gMTAvMDIvMjAyNSAxNDo0NSwgQWxleGFuZGVyIFN2ZXJkbGluIHdyb3RlOgo+IFRoYW5rcyBm
b3IgcXVpY2sgcmV2aWV3IEtyenlzenRvZiEKPiAKPiBPbiBNb24sIDIwMjUtMDItMTAgYXQgMDk6
NDMgKzAxMDAsIEtyenlzenRvZiBLb3psb3dza2kgd3JvdGU6Cj4+IE9uIDA5LzAyLzIwMjUgMjM6
MDYsIEFsZXhhbmRlciBTdmVyZGxpbiB3cm90ZToKPj4+IE1ha2UgdGhlIHBlcmlwaGVyYWwgZGV2
aWNlIHRyZWUgcmUtdXNhYmxlIG9uIEFSTTY0IHBsYXRmb3JtIGJ5IHNwbGl0dGluZyBpdAo+Pj4g
aW50byBDUFUtY29yZSBzcGVjaWZpYyBhbmQgcGVyaXBoZXJhbCBwYXJ0cy4KPj4+Cj4+PiBBZGQg
U09DX1BFUklQSEVSQUxfSVJRKCkgbWFjcm8gd2hpY2ggZXhwbGljaXRseSBtYXBzIHBlcmlwaGVy
YWwgbnViZXJpbmcKPj4+IGludG8gInBsaWMiIGludGVycnVwdC1jb250cm9sbGVyIG51bWJlcmlu
Zy4KPj4+Cj4+PiBTaWduZWQtb2ZmLWJ5OiBBbGV4YW5kZXIgU3ZlcmRsaW4gPGFsZXhhbmRlci5z
dmVyZGxpbkBnbWFpbC5jb20+Cj4+PiAtLS0KPj4+IMKgIGFyY2gvcmlzY3YvYm9vdC9kdHMvc29w
aGdvL2N2MTgxeC5kdHNpwqDCoMKgwqDCoMKgwqAgfMKgwqAgMiArLQo+Pj4gwqAgYXJjaC9yaXNj
di9ib290L2R0cy9zb3BoZ28vY3YxOHh4LXBlcmlwaC5kdHNpIHwgMzEzICsrKysrKysrKysrKysr
KysrKwo+Pj4gwqAgYXJjaC9yaXNjdi9ib290L2R0cy9zb3BoZ28vY3YxOHh4LmR0c2nCoMKgwqDC
oMKgwqDCoCB8IDMwNSArLS0tLS0tLS0tLS0tLS0tLQo+ICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgIF5eXl5eXl5eXl5eCj4gWzFdCj4gCj4+PiAtLS0gL2Rldi9udWxsCj4+PiArKysg
Yi9hcmNoL3Jpc2N2L2Jvb3QvZHRzL3NvcGhnby9jdjE4eHgtcGVyaXBoLmR0c2kKPj4+IEBAIC0w
LDAgKzEsMzEzIEBACj4+PiArLy8gU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IChHUEwtMi4wIE9S
IE1JVCkKPj4+ICsvKgo+Pj4gKyAqIENvcHlyaWdodCAoQykgMjAyMyBKaXNoZW5nIFpoYW5nIDxq
c3poYW5nQGtlcm5lbC5vcmc+Cj4+PiArICogQ29weXJpZ2h0IChDKSAyMDIzIElub2NoaSBBbWFv
dG8gPGlub2NoaWFtYUBvdXRsb29rLmNvbT4KPj4+ICsgKi8KPj4+ICsKPj4+ICsjaW5jbHVkZSA8
ZHQtYmluZGluZ3MvY2xvY2svc29waGdvLGN2MTgwMC5oPgo+Pj4gKyNpbmNsdWRlIDxkdC1iaW5k
aW5ncy9ncGlvL2dwaW8uaD4KPj4+ICsjaW5jbHVkZSA8ZHQtYmluZGluZ3MvaW50ZXJydXB0LWNv
bnRyb2xsZXIvaXJxLmg+Cj4+PiArCj4+PiArLyB7Cj4+PiArCW9zYzogb3NjaWxsYXRvciB7Cj4+
PiArCQljb21wYXRpYmxlID0gImZpeGVkLWNsb2NrIjsKPj4KPj4gSSByZWFsbHkgZG91YnQgdGhh
dCBleHRlcm5hbCBvc2NpbGxhdG9yIGlzIGEgcGVyaXBoZXJhbC4gVGhpcyBpcyBlaXRoZXIKPj4g
cGFydCBvZiBib2FyZCBvciB0aGUgU29DLgo+IAo+IFRoaXMgaXMgYWN0dWFsbHkgYSBwcm9ibGVt
IG9mIHRoZSBvcmlnaW5hbCBjdjE4eHguZHRzaSBbMV0uIERvIHlvdSB0aGluawo+IEkgbmVlZCB0
byBmaXggaXQgYXMgcGFydCBvZiBteSBzZXJpZXM/IFRoaXMgd291bGQgdG91Y2ggYWxsIHRoZSBw
dXJlCj4gUmlzY1YgYm9hcmRzICh1c2luZyBDVjE4eHggU29Dcywgbm90IFNHMjAweCBTb0NzKSwg
d2hpY2ggSSBjb3VsZCBhdm9pZAo+IG90aGVyd2lzZS4KCllvdSBhcmUgbW92aW5nIHRoZSBub2Rl
IG91dCBvZiBjdjE4eHguZHRzaSwgc28geW91IGNhbiBtb3ZlIGl0IHRvIGZpbmFsCnBsYWNlIGZv
ciBleGFtcGxlLiBCdXQgSSBkbyBub3QgaW5zaXN0LCBiZWNhdXNlIEkgYWxzbyBkbyBub3Qga25v
dyB0aGUKZmluYWwgKHRydWx5IGNvcnJlY3QpIHBsYWNlIC0gZG9uJ3Qga25vdyB0aGUgaGFyZHdh
cmUgaGVyZS4KCkJlc3QgcmVnYXJkcywKS3J6eXN6dG9mCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgt
cmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
