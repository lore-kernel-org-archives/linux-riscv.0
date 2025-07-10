Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D7F5C83F1B
	for <linux-riscv@archiver.kernel.org>; Thu, 10 Jul 2025 16:26:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:Subject:From:
	To:Message-Id:Date:Mime-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=O9ie+7OZc9ENY+nCcznwwHEk6QxgybgFemFRapuGMxA=; b=c5Ud+PuN/MCiF/
	7Tj1Itt+do4gLcpdTsFjGZp/JlyL1J3Ah0gWoNnJwQeTbWASya1jrr6ZqMfFSmbVKYnfk0ZA8cvhT
	Y2gY4jK29Eiyfao8JnEB5csrIfkJ19LktYMhQyctFRPHvpUkOMSC+y2UknPvAB2H2xIQ3NE6QHOiI
	tnU14FZgtcY4nS83DF+NiH8VM2ZtAwO8rF8pms0Km/y2SdKPKVCd7jiuLWuZWnMqv7TIZvHWUVsc4
	BMJIpHoip7WITSmiWju3eiEkUm5zWoBGsqMh1qCO7DA8aAu8eVIZ41ypeO6IXJJkRPNozjOfKyCz2
	1kaIwlktQTSKHriigzMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZu6G-0000000COGf-0GTX;
	Thu, 10 Jul 2025 16:26:20 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZrXB-0000000Byhn-3T3z
	for linux-riscv@lists.infradead.org;
	Thu, 10 Jul 2025 13:41:58 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 08AF9A54ACE;
	Thu, 10 Jul 2025 13:41:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7B423C4CEE3;
	Thu, 10 Jul 2025 13:41:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752154916;
	bh=SlMbXo298xvQjkFJyCKDy58mImmJ1m24txuya44+l64=;
	h=Date:To:From:Subject:Cc:References:In-Reply-To:From;
	b=qnatzMaX9jyeMlbtDSEDGQ07J49VSiUNdF+y1WazyHlLZV2GgDtI9RcZhYCPMCTf4
	 L8NKGsccmI494iYQNXLWTHQx9yuXRJ22gB5/PFdV8vk1xW+uwYh8KGxWRMhhNIB3so
	 xYjo5/tiLvjFAOpfGqhtKMliOdmm3o0I/TPpoANt7U8fT8VHZwBteo18iBi68Df2NX
	 KDzIKmz9RousA36qqfDWNGr+bwQPvWJ7XT5fyr9RvSVZpE1uQxNEvIcAPLUYT1wCdh
	 3SAGXOTU1G8EbIYacwTLVeMzqsm7qY4W+d86IdE7yZZdxnsWF63i39LMlaN13d/YSt
	 Fk5lmQRLqokMw==
Mime-Version: 1.0
Date: Thu, 10 Jul 2025 15:41:49 +0200
Message-Id: <DB8F2T9YIJ1B.13Q6T3CW0MV6U@kernel.org>
To: =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@kernel.org>
From: "Danilo Krummrich" <dakr@kernel.org>
Subject: Re: [PATCH v10 0/7] Rust Abstractions for PWM subsystem with TH1520
 PWM driver
Cc: "Michal Wilczynski" <m.wilczynski@samsung.com>, "Miguel Ojeda"
 <ojeda@kernel.org>, "Alex Gaynor" <alex.gaynor@gmail.com>, "Boqun Feng"
 <boqun.feng@gmail.com>, "Gary Guo" <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>,
 "Trevor Gross" <tmgross@umich.edu>, "Guo Ren" <guoren@kernel.org>, "Fu Wei"
 <wefu@redhat.com>, "Rob Herring" <robh@kernel.org>, "Krzysztof Kozlowski"
 <krzk+dt@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>, "Paul Walmsley"
 <paul.walmsley@sifive.com>, "Palmer Dabbelt" <palmer@dabbelt.com>, "Albert
 Ou" <aou@eecs.berkeley.edu>, "Alexandre Ghiti" <alex@ghiti.fr>, "Marek
 Szyprowski" <m.szyprowski@samsung.com>, "Benno Lossin" <lossin@kernel.org>,
 "Michael Turquette" <mturquette@baylibre.com>, "Drew Fustini"
 <fustini@kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-pwm@vger.kernel.org>, <rust-for-linux@vger.kernel.org>,
 <linux-riscv@lists.infradead.org>, <devicetree@vger.kernel.org>, "Krzysztof
 Kozlowski" <krzysztof.kozlowski@linaro.org>
References: <CGME20250707094926eucas1p155bd967b6986c4a999776839b1aa1fc6@eucas1p1.samsung.com> <20250707-rust-next-pwm-working-fan-for-sending-v10-0-d0c5cf342004@samsung.com> <e8a4a821-e7e4-4bcd-a2ac-f6b684b6ceea@samsung.com> <DB8AQ15RTAJ2.3QXX8Q2FTFGCP@kernel.org> <e494422b-b989-4dc3-9828-b080dbf4c34d@samsung.com> <judbbl4d3z7nd2wi3grlwf3cmqgdycb5ljyyqx6r4w2zluhmwy@yxrqnf2hcnzw>
In-Reply-To: <judbbl4d3z7nd2wi3grlwf3cmqgdycb5ljyyqx6r4w2zluhmwy@yxrqnf2hcnzw>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250710_064157_925549_E895C5F9 
X-CRM114-Status: GOOD (  10.13  )
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

T24gVGh1IEp1bCAxMCwgMjAyNSBhdCAzOjM2IFBNIENFU1QsIFV3ZSBLbGVpbmUtS8O2bmlnIHdy
b3RlOgo+IE9uIFRodSwgSnVsIDEwLCAyMDI1IGF0IDEyOjI5OjU5UE0gKzAyMDAsIE1pY2hhbCBX
aWxjenluc2tpIHdyb3RlOgo+PiBPbiA3LzEwLzI1IDEyOjE3LCBEYW5pbG8gS3J1bW1yaWNoIHdy
b3RlOgo+PiA+IEkgc2VlIHRoYXQgdGhlcmUgaXMgYSBuZXcgTUFJTlRBSU5FUlMgZW50cnk6Cj4+
ID4gCj4+ID4gCVBXTSBTVUJTWVNURU0gQklORElOR1MgW1JVU1RdCj4+ID4gCU06CU1pY2hhbCBX
aWxjenluc2tpIDxtLndpbGN6eW5za2lAc2Ftc3VuZy5jb20+Cj4+ID4gCVM6CU1haW50YWluZWQK
Pj4gPiAJRjoJcnVzdC9oZWxwZXJzL3B3bS5jCj4+ID4gCUY6CXJ1c3Qva2VybmVsL3B3bS5ycwo+
PiA+IAo+PiA+IEkgYXNzdW1lIHRoaXMgaXMgYWdyZWVkIHdpdGggVXdlPwo+Cj4gSSBzdWdnZXN0
IHRvIGFkZAo+Cj4gCUw6CWxpbnV4LXB3bUB2Z2VyLmtlcm5lbC5vcmcKPgo+IHRoZW4gSSdtIGhh
cHB5IHdpdGggaXQuIEknbSBkZWZpbml0aXZlbHkgbm90IGNhcGFibGUgdG8gcmV2aWV3IHRoZSBS
dXN0Cj4gZGV0YWlscyBvZiBSdXN0IGNvZGUuIEJ1dCBJIHRoaW5rIFJ1c3QgaXMgcmVhZGFibGUg
ZW5vdWdoIHRoYXQgSSBjYW4KPiBqdWRnZSB0aGUgYWxnb3JpdGhtaWMgcGFydHMuCgpXaGF0IGFi
b3V0IHRoZSBtZXJnZSBzdHJhdGVneT8gRG8geW91IHdhbnQgdG8gcGljayB1cCBwYXRjaGVzIHlv
dXJzZWxmICh0aHJvdWdoCnlvdXIgdHJlZSksIHJlY2VpdmUgUFJzIGZyb20gTWljaGFsIG9yIG5v
bmUgb2YgdGhvc2U/CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFk
Lm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJp
c2N2Cg==
