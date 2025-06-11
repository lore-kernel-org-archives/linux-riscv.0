Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9DDAC71135
	for <linux-riscv@archiver.kernel.org>; Wed, 11 Jun 2025 22:36:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:Cc:To:From:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2VkXcdGWweYh3MMNpd1uj1H09UbmR8C+QIJQ+5MCwLk=; b=LszY72Ha6y9jSV
	kcAJ0x54Zwu1xmJ4sGAcqnkaggVq+4Mj5CJi1KU2FfZuh8RYSLyP43CPogX0uvyLLAE7qn8DkiVEC
	PJTxKhqKGw1WnJd6NSZkZi63SbyXzBqbWP+XizG68+uD+q/xSaGV7rpJivFqZ9vhImj+dtZgX5cTl
	D5eo/fZG/iZlB82fsTYjAVAwVtNDB6EM+1LxxS6GNzgTcOIsexiaxclf8LabINXiTeXiOI/DALG80
	t/rwiH3HnxUfz/1QHTxLVAMQvPLtObnvoWMd7bB1qbrqX5Pp4g7jgJVAUQTvw5Y3mvmoLL0Yf1AqB
	K2IhBd6S36pfKO5wA2rQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPU3R-0000000BUXa-21RP;
	Wed, 11 Jun 2025 22:36:21 +0000
Received: from mailout2.w1.samsung.com ([210.118.77.12])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPSnr-0000000BGEa-1gZq
	for linux-riscv@lists.infradead.org;
	Wed, 11 Jun 2025 21:16:14 +0000
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
	by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20250611211602euoutp02b3370e27c6cdc3119ffcf443b3028750~IGZA3VdSB0236402364euoutp02M
	for <linux-riscv@lists.infradead.org>; Wed, 11 Jun 2025 21:16:02 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20250611211602euoutp02b3370e27c6cdc3119ffcf443b3028750~IGZA3VdSB0236402364euoutp02M
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1749676562;
	bh=gJSx6fFWCab1L0dG4hF/wx4spo5Eingwx2AqpslewPk=;
	h=Date:Subject:From:To:Cc:In-Reply-To:References:From;
	b=bp0W74LhifQr+oDb85bFPnIvLOvQj11U4xNBK2Ctc3WQbNvMXWHlyVld+paX8aOnx
	 jHUXOFqS4Gqc31gj9khxT2dS4yO5XFKlDvzNkeeaiVcPU7iuznz807UwDsOtlRhIGI
	 wMx6yzURpEnZd1OPa2nu1tm7/icJkWPXwRhDOr4M=
Received: from eusmtip1.samsung.com (unknown [203.254.199.221]) by
	eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
	20250611211600eucas1p13784b73e9c0257e670846320bca0a2f9~IGY-b_FYG1491714917eucas1p1X;
	Wed, 11 Jun 2025 21:16:00 +0000 (GMT)
Received: from [192.168.1.44] (unknown [106.210.136.40]) by
	eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20250611211558eusmtip17a546ce3e5256d611175ed66f1a5dc7a~IGY8xpr_31879718797eusmtip1c;
	Wed, 11 Jun 2025 21:15:57 +0000 (GMT)
Message-ID: <02e480b9-68eb-47e7-97f5-54e49d259f84@samsung.com>
Date: Wed, 11 Jun 2025 23:15:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/7] pwm: Add Rust driver for T-HEAD TH1520 SoC
From: Michal Wilczynski <m.wilczynski@samsung.com>
To: =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@kernel.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, Andreas
	Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, Trevor
	Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, Drew Fustini
	<drew@pdp7.com>, Guo Ren <guoren@kernel.org>, Fu Wei <wefu@redhat.com>, Rob
	Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor
	Dooley <conor+dt@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>, Marek Szyprowski
	<m.szyprowski@samsung.com>, Benno Lossin <lossin@kernel.org>, Michael
	Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>,
	linux-kernel@vger.kernel.org, linux-pwm@vger.kernel.org,
	rust-for-linux@vger.kernel.org, linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org, linux-clk@vger.kernel.org
Content-Language: en-US
In-Reply-To: <1d9bba9e-0f30-4039-812e-60b160271e6b@samsung.com>
X-CMS-MailID: 20250611211600eucas1p13784b73e9c0257e670846320bca0a2f9
X-Msg-Generator: CA
X-RootMTR: 20250610125333eucas1p16126b64a0f447a5e9a5ad553d9d7d79d
X-EPHeader: CA
X-CMS-RootMailID: 20250610125333eucas1p16126b64a0f447a5e9a5ad553d9d7d79d
References: <20250610-rust-next-pwm-working-fan-for-sending-v2-0-753e2955f110@samsung.com>
	<CGME20250610125333eucas1p16126b64a0f447a5e9a5ad553d9d7d79d@eucas1p1.samsung.com>
	<20250610-rust-next-pwm-working-fan-for-sending-v2-2-753e2955f110@samsung.com>
	<jbm3qvowi5vskhnjyqlp3xek36gzzqjt35m66eayxi6lmi525t@iefevopxjl53>
	<1d9bba9e-0f30-4039-812e-60b160271e6b@samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250611_141612_039663_412CC406 
X-CRM114-Status: GOOD (  11.34  )
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

CgpPbiA2LzExLzI1IDIyOjA0LCBNaWNoYWwgV2lsY3p5bnNraSB3cm90ZToKPiAKPiAKPiBPbiA2
LzExLzI1IDA4OjU4LCBVd2UgS2xlaW5lLUvDtm5pZyB3cm90ZToKPj4gSGVsbG8sCj4+Cj4+Cj4+
IFdoYXQgZG9lcyAudW53cmFwX29yKDApIGRvPyBZb3UgbmVlZCB0byByb3VuZCB1cCBpbiB0aGlz
IG11bF9kaXYKPj4gb3BlcmF0aW9uLgoKWWVhaCBhbmQgSSdtIHRoaW5raW5nIHRoYXQgdGhlIGhl
bHBlciBuZWVkcyB0byBiZSB1cGRhdGVkIG9yIG5ldyBvbmUKYWRkZWQgbGlrZSBtdWxfZGl2X3Jv
dW5kX3VwLCB0byBkbyB0aGUgcm91bmRpbmcKCj4gCj4gVGhlIC51bndyYXBfb3IoMCkgaXMgdG8g
aGFuZGxlIHRoZSBjYXNlIHdoZXJlIHRoZSBtdWxfZGl2IGhlbHBlciByZXR1cm5zCj4gTm9uZSwg
d2hpY2ggY2FuIGhhcHBlbiBpZiB0aGUgZGl2aXNvciAocmF0ZV9oeikgaXMgemVyby4gSW4gdGhh
dCBjYXNlLAo+IHRoZSBwZXJpb2QgIGJlY29tZXMgMC4gVGhlIG11bF9kaXYgaGVscGVyIGlzIGlu
dHJvZHVjZWQgaW4gdGhpcyBjb21taXQKPiBbMV0uCj4gCj4gWzFdIC0gaHR0cHM6Ly9sb3JlLmtl
cm5lbC5vcmcvYWxsLzIwMjUwNjA5LW1hdGgtcnVzdC12MS12MS0xLTI4NWZhYzAwMDMxZkBzYW1z
dW5nLmNvbS8KPiAKCgpCZXN0IHJlZ2FyZHMsCi0tIApNaWNoYWwgV2lsY3p5bnNraSA8bS53aWxj
enluc2tpQHNhbXN1bmcuY29tPgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmlu
ZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9s
aW51eC1yaXNjdgo=
