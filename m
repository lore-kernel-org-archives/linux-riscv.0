Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7ED3AC77B73
	for <linux-riscv@archiver.kernel.org>; Tue,  2 May 2023 07:58:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0100d61DloJbifu3WVcEpQzY+a4PL4RvW2bva+oLLwQ=; b=oZAaH9QjrOIdPj
	3TIUgHO3UYKqX1APnKjoBwvPEzVaaM9Apr5wuxPkxl+Lnp4JvHv7DRUhmlIMsX0buMBkUO7GP55o1
	eWoHpTN1EWKc+S1E4UCAOQaoCkFrDGrEdMD0PHYP7ds3AxIW80xGECm9SscxOcaFfhj7y+c3TJYAf
	6B2J5xYgv+AoIF+gdYRhvE3S5wQZhdQWAFVZ/OgnO9mq1gQ0RHJt6UP7Wua6eLqvik9RHPx+WFjYs
	pQeLg4wP/Ncw0AtPfREBxwJOwcdh9ulGVTHYwkjyrWDjLq5EwPpsG3YEY4S8F16PpS/DRQ9wvKyxF
	0PfNRweB47RES8oXVMew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1ptkuL-000XXE-2C;
	Tue, 02 May 2023 07:58:45 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1ptkuI-000XWp-25
	for linux-riscv@lists.infradead.org;
	Tue, 02 May 2023 07:58:43 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 2E23A61572;
	Tue,  2 May 2023 07:58:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 461B0C433D2;
	Tue,  2 May 2023 07:58:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1683014321;
	bh=Di+CY58Mv1cLOwK0+fli+h3/RPyphg1Iwtqi2Gwr6eA=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=kcVYZpebOC6xC0QkmQBTYDQZYx5R33S7Ypws5NSx3jDLx2wILj8ros1iIGVyB7rPs
	 8WRstCiJXKIaOhMLY6oKD/z1kijc5O88vABkRo1TaI8rydX/+BYPprUpgiLoAuUTgn
	 BLf3rP2MarCUvLyDgUrRZK/xDZrh9untWS461OKBnK7yFZIz32vbGyUhDATfuV7aNO
	 egqLj0a183XPG/4veOvev3w5gRR7kCyHAWYUxq3WOIaSYiqzhjvfhrZTQmsmQ2MH4B
	 Y7+wZc6c4KMbmODxcptwzIP0pTmDjW4U6hKA+mukEy4epQXSF0WFqwcq5F8S6iRgkI
	 Tg7fUgBSoId4Q==
From: =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
To: Philipp Tomsich <philipp.tomsich@vrull.eu>, Jessica Clarke
 <jrtc27@jrtc27.com>
Cc: Heiko Stuebner <heiko@sntech.de>, Palmer Dabbelt <palmer@dabbelt.com>,
 linux-riscv <linux-riscv@lists.infradead.org>, Paul Walmsley
 <paul.walmsley@sifive.com>, Kito Cheng <kito.cheng@sifive.com>, Conor
 Dooley <conor.dooley@microchip.com>, matthias.bgg@gmail.com, Heinrich
 Schuchardt <heinrich.schuchardt@canonical.com>, Greentime Hu
 <greentime.hu@sifive.com>, nick.knight@sifive.com,
 christoph.muellner@vrull.eu, richard.henderson@linaro.org, arnd@arndb.de,
 linux-kernel@vger.kernel.org, Heiko Stuebner <heiko.stuebner@vrull.eu>
Subject: Re: [PATCH 0/4] Expose the isa-string via the AT_BASE_PLATFORM aux
 vector
In-Reply-To: <CAAeLtUADqnwrgBjhDd+iNfwhMU6YBiMUZzeopVMAh0Jq19W9JA@mail.gmail.com>
References: <20230424194911.264850-1-heiko.stuebner@vrull.eu>
 <87ednz7roh.fsf@all.your.base.are.belong.to.us>
 <7DD2C38C-CBB3-41EE-A195-50E4C2451B7E@jrtc27.com>
 <CAAeLtUADqnwrgBjhDd+iNfwhMU6YBiMUZzeopVMAh0Jq19W9JA@mail.gmail.com>
Date: Tue, 02 May 2023 09:58:38 +0200
Message-ID: <87jzxrnp01.fsf@all.your.base.are.belong.to.us>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230502_005842_738682_6C7F6D80 
X-CRM114-Status: GOOD (  10.50  )
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

UGhpbGlwcCBUb21zaWNoIDxwaGlsaXBwLnRvbXNpY2hAdnJ1bGwuZXU+IHdyaXRlczoKCj4gSXQg
aXMgYSBwaXR5IHRoYXQgdGhlIGN1cnJlbnQgaW50ZXJmYWNlIHdhcyBkZXNpZ25lZCB3aXRob3V0
IGludm9sdmluZwo+IFJWSSAoYW5kIHRoYXQgSSBoYWQgdG8gYXNrIG15IHRlYW0gdG8gcHV0IHRv
Z2V0aGVyIGEgcGF0Y2ggc2V0IGZvcgo+IGZ1cnRoZXIgZGlzY3Vzc2lvbiwgZ2l2ZW4gdGhhdCBu
b25lIG9mIHRoZSBvdGhlciBtYWpvciB2ZW5kb3JzIGluIFJWSQo+IHN0ZXBwZWQgZm9yd2FyZCku
ICBJIGd1YXJhbnRlZSB0aGF0IHBsZW50eSBvZiByZXZpZXdlcnMgd291bGQgaGF2ZQo+IGhpZ2hs
aWdodGVkIHRoYXQgYSBjZW50cmFsIHJlZ2lzdHJ5IChldmVuIGlmIGl0IGlzIGp1c3QgYSBrZXJu
ZWwKPiBoZWFkZXIpIHNob3VsZCBiZSBhdm9pZGVkLgoKQXJlIHlvdSBjbGFpbWluZyB0aGF0IHRo
ZSBod3Byb2JlIHdvcmsgd2FzIG5vdCBkb25lIGluIHRoZSBvcGVuLCBidXQKc2VjcmV0bHkgbWVy
Z2VkPyBUaGF0IGlzIG5vdCBvbmx5IGluY29ycmVjdCwgYnV0IHJ1ZGUgdG8gdXBzdHJlYW0gUklT
Qy1WCkxpbnV4IGRldmVsb3BlcnMuIEkgc3VnZ2VzdCB5b3UgcmV2aWV3IGhvdyB5b3UgaW50ZXJh
Y3Qgd2l0aCB1cHN0cmVhbQprZXJuZWwgd29yay4KCldoeSBkaWRuJ3QgUlZJIGdldCBpbnZvbHZl
ZCBpbiB0aGUgcmV2aWV3IG9mIHRoZSBzZXJpZXM/IFRoZSBleHBlY3RhdGlvbgpjYW5ub3QgYmUg
dGhhdCBhbGwgb3BlbiBzb3VyY2UgcHJvamVjdHMgZ28gdG8gUlZJLCBidXQgcmF0aGVyIHRoZSBv
dGhlcgp3YXkgYXJvdW5kLgoKVGFrZSBhIGxvb2sgYXQgY29tbWl0IGVhM2RlOWNlOGFhMiAoIlJJ
U0MtVjogQWRkIGEgc3lzY2FsbCBmb3IgSFcKcHJvYmluZyIpLiBZb3VyIHRlYW0gd2FzIHZlcnkg
bXVjaCBpbnZvbHZlZCBpbiB0aGUgcmV2aWV3LgoKCkJqw7ZybgoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0Cmxp
bnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcv
bWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
