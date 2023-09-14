Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7148CA553C
	for <linux-riscv@archiver.kernel.org>; Thu, 14 Sep 2023 12:59:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QjAKWm7U5B6c5n1uXQmce08Kjn+otA3NlTFlM9bzw2s=; b=YOaiOto83QaPMe
	jUfUXvGI55K90fzuJ4l/gP4T2B2U9YkN6aU2TT9k3UwBygZMcdwD0AdC4Q7PqMt6ruJk3OzADEL4h
	9N6pXuQQGTQykrAa0UEiz+7XOvAsO6iKM5rMVbLwYDqZng5U6NOKQ333DpK5HMDqQOtDdOtXLHe7B
	EyBfZ7plX1X+aeH+iJ5EGw5s9Glxul/m6bII/OPDm+0WDcLEwIYTlmYfZZ/uN9aKESz3koMmMiNZc
	VIpKuYvJ02iznH40Ftx2T/CD/mXefEJWElHVyvRpL3UR8I/XJD4qM41JTWBKioTXpkQgzS5z1dGb4
	wqOgukvmcAeadw25+78g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qglwZ-008OOx-16;
	Thu, 14 Sep 2023 12:59:39 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qglwX-008ONu-0J
	for linux-riscv@lists.infradead.org;
	Thu, 14 Sep 2023 12:59:38 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by sin.source.kernel.org (Postfix) with ESMTPS id 0C525CE26C7;
	Thu, 14 Sep 2023 12:59:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D35FEC433C7;
	Thu, 14 Sep 2023 12:59:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1694696373;
	bh=7vDP4g7jMMD/RN1sC/k/VT5TGJ/WVi77BDoNV/0fFWE=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=akOU2uK04oc6pz08pJcQmp/jc3wstHcgLS41MvhzK9nmEk7WS64SThd+WBOcGmfNU
	 COCgTsB9O8Ummya+Y6fj4Rax9Kf2TjyXj4uLbSOd2jZxfGn5tUM0y3s6m4nwckHbn6
	 YTcIqQAPdBlxCRiIut1SAeel8Ad3TB5hosq2pAVZkh91C1Amn2J0MZ6ikYUkWyc1zL
	 2j53lCMx5paGTcvluuwn8sbFcPnW1IhnEhyXQsdMw6HE+BfZQ+IJyZ1rtWWCzRu54Y
	 RcLivIFavDnc2+2Rt3gZmi1slV3ep/8zOx4eeK/kMCsW16doT3BOkV20IJrlwMfgps
	 VXD3TYzeFKrDg==
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
In-Reply-To: <20230914-roaming-plunging-948c78d9831c@wendy>
References: <20230912115728.172982-1-bjorn@kernel.org>
 <20230914-roaming-plunging-948c78d9831c@wendy>
Date: Thu, 14 Sep 2023 14:59:30 +0200
Message-ID: <87pm2kap1p.fsf@all.your.base.are.belong.to.us>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230914_055937_306486_A8AF8231 
X-CRM114-Status: GOOD (  10.72  )
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
dWUsIFNlcCAxMiwgMjAyMyBhdCAwMTo1NzoyMlBNICswMjAwLCBCasO2cm4gVMO2cGVsIHdyb3Rl
Ogo+PiBGcm9tOiBCasO2cm4gVMO2cGVsIDxiam9ybkByaXZvc2luYy5jb20+Cj4+IAo+PiBIaSwK
Pj4gCj4+IFRoaXMgaXMgQW5keSdzIGtlcm5lbCBtb2RlIHZlY3RvciBWMiBzZXJpZXMgWzFdLCB3
aXRoIG15IEJMQUtFMnMKPj4gQVZYLTUxMi10by1SSVNDLVYgdHJhbnNsYXRpb24gcGF0Y2ggYXBw
ZW5kZWQuCj4+IAo+PiBJJ3ZlIHRhZ2dlZCBpdCBhcyBSRkMsIHNpbmNlIEFuZHkncyBzZXJpZXMg
aXMgc3RpbGwgbm90IGluLXRyZWUgeWV0Lgo+PiAKPj4gSXQncyBhIGZpcnN0IHN0ZXAgdG93YXJk
cyBhIFZlY3RvciBhaWRlZCBXaXJlZ3VhcmQhIDstKQo+Cj4gVGhpcyBoYXMgdGhlIHNhbWUgcHJv
YmxlbXMgYXMgQW5keSdzIHN0dWZmICYgZG9lc24ndCBidWlsZCBwcm9wZXJseSBmb3IgdGhlCj4g
YXV0b21hdGlvbi4gV2hhdCBpcyB0aGUgcGxhbiBiZXR3ZWVuIHlvdXJzZWxmIGFuZCBBbmR5IGZv
ciBzdWJtaXR0aW5nIGEKPiB2ZXJzaW9uIG9mIHRoZSBpbi1rZXJuZWwgdmVjdG9yIHN1cHBvcnQg
dGhhdCBwYXNzZXMgYnVpbGQgdGVzdGluZz8KCkknbGwgc3luY2ggdXAgd2l0aCBBbmR5ISBJJ20g
bm90IGV2ZW4gc3VyZSB0aGUgYmxha2UycyBwYXRjaCBzaG91bGQgcGFydApvZiB0aGUgImluLWtl
cm5lbCB2ZWN0b3IiIHNlcmllcyBhdCBhbGwuCgpUaGFua3MsCkJqw7ZybgoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBs
aXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVh
ZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
