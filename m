Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3CD89CA553C
	for <linux-riscv@archiver.kernel.org>; Thu, 14 Sep 2023 12:57:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yxgYX5EhxzFN2xqB6h9Sh2gj8sRZ/B+CTqvgkpiVeKE=; b=c0/oQl5nr0iM7C
	Gr9qBB/CwNs1pmqtg4kURLkXM45UfOS3P/GhHJGn8AqQiYvnlK6npIdY7TMizSWKThUvPLgD6VTVZ
	iDmBmO0MCxB8uT1fovHRh2VIOE0MEq5RbFBPC83Dt6uulpHRliO90L+T7hZUfbviucsTgGiLKifSf
	ad6/UQkSzoyd7BuMRa6rOhZCp0QGPoEjuhlHmO8fn0lgXcpZCYf7henfNNDU5P76G4OcBTdD/fOCK
	vFrRZtrh3XLKgEMCU7ihByMJSxQzddOGS2oTReO5nkJ6Kem2sVGZ9rW+88siUZ9uc2Y+hD1ILX4BU
	iXP42hKPn/KDtYzm4JZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qgluq-008O7x-14;
	Thu, 14 Sep 2023 12:57:52 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qglun-008O79-2c
	for linux-riscv@lists.infradead.org;
	Thu, 14 Sep 2023 12:57:51 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by sin.source.kernel.org (Postfix) with ESMTPS id A2BB1CE26C7;
	Thu, 14 Sep 2023 12:57:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8A8AFC433C9;
	Thu, 14 Sep 2023 12:57:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1694696262;
	bh=bEWpEOswiPbLYKfV+TIbeO5QDeJGZGbGxZIpsvQY95c=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=WHxEWxZl9dQszH48IbDchUBVOe7U/R31FkcnrCnum0FQinJN68j1w1IcKWic7ccP5
	 q9IaR5YCTJ0DxuDmf5fUKN82xJZPpndj/3SndgZIcxlYhnvnDfFUE8ekk3cUUFaOlZ
	 3n8LuTKgU30m9QujKdLBlmYBDarHnC1fgbrSDhGWOgqq7A3tdBsdK9C//X7lndby1p
	 XQ1wGamDUKfod/AMzihUOGx4Ed7NORIA+w4LQLeX59RQkX4bNL7uIAUpt0yD4e3v0n
	 p8G3HPh3pB5ZCufOrhswVpPTNYrz4nH1qnCKxu07ijZID4dOYC6BgWmF0WMPwPvmoe
	 AFkftxKmmblKg==
From: =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
To: Conor Dooley <conor.dooley@microchip.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 linux-riscv@lists.infradead.org, Andy Chiu <andy.chiu@sifive.com>,
 Greentime Hu <greentime.hu@sifive.com>, "Jason A . Donenfeld"
 <Jason@zx2c4.com>, Samuel Neves <sneves@dei.uc.pt>, =?utf-8?B?QmrDtnJu?=
 =?utf-8?B?IFTDtnBlbA==?=
 <bjorn@rivosinc.com>, Heiko Stuebner <heiko@sntech.de>, Herbert Xu
 <herbert@gondor.apana.org.au>, "David S. Miller" <davem@davemloft.net>,
 linux-crypto@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH 6/6] riscv: Add BLAKE2s V implementation
In-Reply-To: <20230914-charting-detector-3d2b615393b9@wendy>
References: <20230912115728.172982-1-bjorn@kernel.org>
 <20230912115728.172982-7-bjorn@kernel.org>
 <20230914-charting-detector-3d2b615393b9@wendy>
Date: Thu, 14 Sep 2023 14:57:39 +0200
Message-ID: <87ttrwap4s.fsf@all.your.base.are.belong.to.us>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230914_055750_047300_D8A47A5A 
X-CRM114-Status: GOOD (  11.06  )
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

Q29ub3IgRG9vbGV5IDxjb25vci5kb29sZXlAbWljcm9jaGlwLmNvbT4gd3JpdGVzOgoKPiBPbiBU
dWUsIFNlcCAxMiwgMjAyMyBhdCAwMTo1NzoyOFBNICswMjAwLCBCasO2cm4gVMO2cGVsIHdyb3Rl
Ogo+PiBGcm9tOiBCasO2cm4gVMO2cGVsIDxiam9ybkByaXZvc2luYy5jb20+Cj4+IAo+PiBCTEFL
RTJzIGlzIHVzZWQgaW4gdmFyaW91cyBwbGFjZXMsIG1vc3Qgbm90YWJseSBpbiBXaXJlZ3VhcmQs
IGFuZCBhcwo+PiBvZiB2NS4xNyBpbiBkcml2ZXJzL2NoYXIvcmFuZG9tLgo+PiAKPj4gQWRkIGEg
QkxBS0UycyBpbXBsZW1lbnRhdGlvbiB1c2luZyB0aGUgVi1leHRlbnNpb24uIFRoaXMgaXMgYQo+
PiB0cmFuc2xhdGlvbiBvZiB0aGUgeDg2LTY0IEFWWDUxMiB2YXJpYW50Cj4+IChhcmNoL3g4Ni9j
cnlwdG8vYmxha2Uycy1jb3JlLlMpIHRvIHRoZSBSSVNDLVYgVi1leHRlbnNpb24uCj4+IAo+PiBU
aGUgQVZYNTEyIHZhcmlhbnQgcmVxdWlyZXMgcmVnaXN0ZXJzID49IDI1NmIgKHltbSopLCBhbmQg
aGVuY2UgdGhpcwo+PiBpbXBsZW1lbnRhdGlvbiByZXF1aXJlcyBhIFZMRU4gb2YgPj0yNTYuCj4+
IAo+PiBUaGUgaW1wbGVtZW50YXRpb24gcGFzc2VzIHRoZSBrZXJuZWwgQkxBS0UycyBzZWxmdGVz
dCwgYW5kIGhhcyBiZWVuCj4+IHRlc3RlZCBvbiBzcGlrZSBhbmQgcWVtdS4KPj4gCj4+IEluc3Ry
dWN0aW9uLXdpc2UsIHRoZSBWLXZhcmlhbnQgdXNlcyA2MCUgbGVzcyBpbnN0cnVjdGlvbnMgdGhh
biB0aGUKPj4gZ2VuZXJpYywgQy1iYXNlZCwgaW1wbGVtZW50YXRpb24uCj4+IAo+PiBTaWduZWQt
b2ZmLWJ5OiBCasO2cm4gVMO2cGVsIDxiam9ybkByaXZvc2luYy5jb20+Cj4KPj4gIGFyY2gvcmlz
Y3YvY3J5cHRvL2JsYWtlMnMtdi5TICAgIHwgMTY0ICsrKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysKPgo+Cj4gVGhpcyBmaWxlIGlzIGN1cnJlbnRseSBiZWluZyBidWlsdCBmb3IgIVJJU0NW
X0lTQV9WLCBsZWFkaW5nIHRvIGJ1aWxkIGVycm9ycwo+IGZvciBvYnZpb3VzIHJlYXNvbnMuIEVn
Ogo+IC4uL2FyY2gvcmlzY3YvY3J5cHRvL2JsYWtlMnMtdi5TOjYyOjI6IGVycm9yOiBpbnN0cnVj
dGlvbiByZXF1aXJlcyB0aGUKPiBmb2xsb3dpbmc6ICdWJyAoVmVjdG9yIEV4dGVuc2lvbiBmb3Ig
QXBwbGljYXRpb24gUHJvY2Vzc29ycyksICdadmUzMngnCj4gb3IgJ1p2ZTY0eCcgKFZlY3RvciBF
eHRlbnNpb25zIGZvciBFbWJlZGRlZCBQcm9jZXNzb3JzKQoKVGhhbmtzLCBub3RlZCBmb3IgdGhl
IG5leHQgcmV2IQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5v
cmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNj
dgo=
