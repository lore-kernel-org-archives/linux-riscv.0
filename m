Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E167EEEAA44
	for <linux-riscv@archiver.kernel.org>; Thu, 14 Sep 2023 14:15:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=x9g/wy/V2+Q4Bg0s54X2Ufn3PhdrMjeLZ/aM1xV7J1Y=; b=LdQbi6suzgSODI
	yN1I/Q0jjjeYCcuLMx5gwh9UZInkvZhePBw9OBe2QLLzzODFp46AzBeNPuKhjPHq9C2WJ0KhQ3Kft
	76XYrFnopiPkpvxP1LZHmxObOE9GnwWYs/IDvRLIo2cWuwtDGP+Hjqbqy3W1ZjYlC2phdqSO1pBLo
	nPxnYz0S5hIsSTVeLmeKx47UMDV7OlQYxPOf1AZgyCPm+hgfOdO8EA+KwOtbZ7A4JI9tpsXDswi9I
	OhpmeytHIf1qbzsc9Ub6XGYlpsNWR13E08FikHHw0s5bKbHQ9pWkWJdAnwUsmcazb4OlgyZuhWcWQ
	VhIyDQhOO1cLj5Qc6QrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qgn7m-008bhx-2i;
	Thu, 14 Sep 2023 14:15:18 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qgn7j-008bhI-2q
	for linux-riscv@lists.infradead.org;
	Thu, 14 Sep 2023 14:15:17 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 5032EB828B2;
	Thu, 14 Sep 2023 14:15:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 939CCC433C8;
	Thu, 14 Sep 2023 14:15:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1694700913;
	bh=WQKdr2jl9B3J+f1f9twtrgdMNHSlOvO8fP/0voLWkn8=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=TQyzNxnpLtZhTdX0sbl+RKoD7gYvsE4KC7UV2Ols6dLuBLTxKoWecfnKpxjZNGpqk
	 bFz8nJ7pIfT/QXF1kroKmOY+RlgoMCsJkU/DCdzjZC3N6i/7C0Yo7i8PHaQK1afHzI
	 2u7zD7Qwts3BP7m0kQFfJvcvYHXuzo/7uTSQnHVF2MNj1Z6sxLPHmFgwSr/3t7Khtr
	 GIEeS1khXlUJqi6rsazVQmYh4zLglUM1Fxpw9Pg2FOY5ZOOc208856xFJ0WKYt1lxN
	 y6UWMDuRIbB6Kb+o3usC8gW+08s4LrZx2CR3hJ+ULTOTK9ec8rfUD3VTJTamTW/n2e
	 QcUOvFdo+XRyg==
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
Subject: Re: [RFC PATCH 0/6] RISC-V BLAKE2s Vector implementation
In-Reply-To: <20230914-float-uneven-7cd1a18b3978@wendy>
References: <20230912115728.172982-1-bjorn@kernel.org>
 <20230914-roaming-plunging-948c78d9831c@wendy>
 <87pm2kap1p.fsf@all.your.base.are.belong.to.us>
 <20230914-float-uneven-7cd1a18b3978@wendy>
Date: Thu, 14 Sep 2023 16:15:10 +0200
Message-ID: <87zg1o3kpd.fsf@all.your.base.are.belong.to.us>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230914_071516_059886_6108FB44 
X-CRM114-Status: GOOD (  13.88  )
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
aHUsIFNlcCAxNCwgMjAyMyBhdCAwMjo1OTozMFBNICswMjAwLCBCasO2cm4gVMO2cGVsIHdyb3Rl
Ogo+PiBDb25vciBEb29sZXkgPGNvbm9yLmRvb2xleUBtaWNyb2NoaXAuY29tPiB3cml0ZXM6Cj4+
IAo+PiA+IE9uIFR1ZSwgU2VwIDEyLCAyMDIzIGF0IDAxOjU3OjIyUE0gKzAyMDAsIEJqw7ZybiBU
w7ZwZWwgd3JvdGU6Cj4+ID4+IEZyb206IEJqw7ZybiBUw7ZwZWwgPGJqb3JuQHJpdm9zaW5jLmNv
bT4KPj4gPj4gCj4+ID4+IEhpLAo+PiA+PiAKPj4gPj4gVGhpcyBpcyBBbmR5J3Mga2VybmVsIG1v
ZGUgdmVjdG9yIFYyIHNlcmllcyBbMV0sIHdpdGggbXkgQkxBS0Uycwo+PiA+PiBBVlgtNTEyLXRv
LVJJU0MtViB0cmFuc2xhdGlvbiBwYXRjaCBhcHBlbmRlZC4KPj4gPj4gCj4+ID4+IEkndmUgdGFn
Z2VkIGl0IGFzIFJGQywgc2luY2UgQW5keSdzIHNlcmllcyBpcyBzdGlsbCBub3QgaW4tdHJlZSB5
ZXQuCj4+ID4+IAo+PiA+PiBJdCdzIGEgZmlyc3Qgc3RlcCB0b3dhcmRzIGEgVmVjdG9yIGFpZGVk
IFdpcmVndWFyZCEgOy0pCj4+ID4KPj4gPiBUaGlzIGhhcyB0aGUgc2FtZSBwcm9ibGVtcyBhcyBB
bmR5J3Mgc3R1ZmYgJiBkb2Vzbid0IGJ1aWxkIHByb3Blcmx5IGZvciB0aGUKPj4gPiBhdXRvbWF0
aW9uLiBXaGF0IGlzIHRoZSBwbGFuIGJldHdlZW4geW91cnNlbGYgYW5kIEFuZHkgZm9yIHN1Ym1p
dHRpbmcgYQo+PiA+IHZlcnNpb24gb2YgdGhlIGluLWtlcm5lbCB2ZWN0b3Igc3VwcG9ydCB0aGF0
IHBhc3NlcyBidWlsZCB0ZXN0aW5nPwo+PiAKPj4gSSdsbCBzeW5jaCB1cCB3aXRoIEFuZHkhIEkn
bSBub3QgZXZlbiBzdXJlIHRoZSBibGFrZTJzIHBhdGNoIHNob3VsZCBwYXJ0Cj4+IG9mIHRoZSAi
aW4ta2VybmVsIHZlY3RvciIgc2VyaWVzIGF0IGFsbC4KPgo+IFRoZSBpbi1rZXJuZWwgdmVjdG9y
IHN0dWZmIHNob3VsZCBjb21lIHdpdGggYSB1c2VyLCBvdGhlcndpc2UgaXQncyBkZWFkCj4gY29k
ZSA6KQoKU3VyZSwganVzdCBzbyB3ZSdyZSBvbiB0aGUgc2FtZSBwYWdlOyBQYXRjaCAzIChWZWN0
b3IgWE9SKSBpcyBhIHVzZXIKZnJvbSBteSBwZXJzcGVjdGl2ZSwgbm8/CgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxp
c3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFk
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
