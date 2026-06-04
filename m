Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB58BCD6E68
	for <linux-riscv@archiver.kernel.org>; Thu,  4 Jun 2026 06:11:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nnupjBmQVeEgQxkQb575XYzD3w750xa7HyAtTk5TfQk=; b=yd3TdxuRME8jn5
	cJyBk8ZHYWNdbYwLGiEiJFjVazNKlbsw8m6vUWzD4wJJOrM2aTqLOsfmJFROC2qDkJpf5TctwmKRR
	2/gP6Th0JccDie2r2gQCAVMFK0/8EW1su7UBXIDsiAs4Pnx9FCiZsk/tFRp7T6euGrSz89Retd2PY
	K1zY12PWq4P9tGi+TbokTvuXc8ACOqAnHMX1Arw4mkR9Uzzt0S79j2c9etDEBHmGk4lLZhxm2uYiM
	JVqzQqroRTx8JIl9ZDZzg2iXczu7WOnOp2y/Cf3/bg47hC37tAhPb7iizlnovgxb9e5M1DB5VF+o6
	/XaYe4uttfPkwSm8O4Ng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wV1Ib-0000000GDF4-1qL9;
	Thu, 04 Jun 2026 06:11:25 +0000
Received: from mout-p-101.mailbox.org ([2001:67c:2050:0:465::101])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wV1IX-0000000GDES-1H4J
	for linux-riscv@lists.infradead.org;
	Thu, 04 Jun 2026 06:11:23 +0000
Received: from smtp2.mailbox.org (smtp2.mailbox.org [IPv6:2001:67c:2050:b231:465::2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4gWDhy3TK1z9tYd;
	Thu,  4 Jun 2026 08:11:14 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1780553474;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=CBYbMz5FezKMMS2rtw4TjIxhbup+kPw5i/fGW3S+F4U=;
	b=r7Y7EfoOtMPl3kOml41+BEJJVGO63Tm/g1xvvvFAu24KxYiqLXDzSVVAfyzouEAbM3uO1c
	yJDB1+Z6RadzKaCn3XAjDE6a1ztN83lAYsU5XuI4zQEQZHaQB1iW3x0LrW3bHn708Lx2XN
	kA5ZUwKc29oC5WzcD/spCQ8gaS/XDysZSZ33W1/c3bu36mlipkdfGuhlBRL7C5tCLNv22c
	mKhUsgK125Tspi/48lcNWSO8dIV0K+8xXa4LLrvG/2s4WzFENqSUU1PpzMR14OlunV9/pY
	PkiXiX6ohvHINxue6aevNjoUDLDCwtaMO+wCM4SB9dgZfWxcL0Tze6p/cyMl0Q==
Message-ID: <50095a4839fdaaf9522a2ccf26d19e3f7bb98866.camel@mailbox.org>
Subject: Re: [PATCH 0/2] rust: clk: Add ExclusiveClk and use it in pwm-th1520
From: Maurice Hieronymus <mhi@mailbox.org>
To: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>,  Miguel Ojeda <ojeda@kernel.org>, Boqun Feng
 <boqun@kernel.org>, Gary Guo <gary@garyguo.net>,  =?ISO-8859-1?Q?Bj=F6rn?=
 Roy Baron	 <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>,
 Andreas Hindborg	 <a.hindborg@kernel.org>, Alice Ryhl
 <aliceryhl@google.com>, Trevor Gross	 <tmgross@umich.edu>, Danilo Krummrich
 <dakr@kernel.org>, Drew Fustini	 <fustini@kernel.org>, Guo Ren
 <guoren@kernel.org>, Fu Wei <wefu@redhat.com>,  Michal Wilczynski
 <m.wilczynski@samsung.com>, Uwe =?ISO-8859-1?Q?Kleine-K=F6nig?=
 <ukleinek@kernel.org>
Cc: linux-clk@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-pwm@vger.kernel.org
Date: Thu, 04 Jun 2026 08:11:06 +0200
In-Reply-To: <20260526-rate-exclusive-get-th1520-v1-0-34cf034e1764@mailbox.org>
References: <20260526-rate-exclusive-get-th1520-v1-0-34cf034e1764@mailbox.org>
MIME-Version: 1.0
X-MBO-RS-ID: b569da53ff35be8ec8c
X-MBO-RS-META: okhenwescwhzk8xbub6q5gdfgio1gcqx
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260603_231121_486866_AF6EE84B 
X-CRM114-Status: UNSURE (   9.97  )
X-CRM114-Notice: Please train this message.
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

T24gVHVlLCAyMDI2LTA1LTI2IGF0IDE5OjA0ICswMjAwLCBNYXVyaWNlIEhpZXJvbnltdXMgdmlh
IEI0IFJlbGF5Cndyb3RlOgo+IEFkZCBhIFJ1c3QgYmluZGluZyBmb3IgY2xrX3JhdGVfZXhjbHVz
aXZlX2dldCgpIC8KPiBjbGtfcmF0ZV9leGNsdXNpdmVfcHV0KCkKPiBhbmQgdXNlIGl0IGluIHB3
bS10aDE1MjAsIHdoaWNoIHByZXZpb3VzbHkgY2FycmllZCBhIFRPRE8gbm90aW5nIHRoZQo+IG1p
c3NpbmcgYmluZGluZy4KPiAKPiBCYXNlZCBvbiBwd20vZm9yLW5leHQuCj4gCj4gU2lnbmVkLW9m
Zi1ieTogTWF1cmljZSBIaWVyb255bXVzIDxtaGlAbWFpbGJveC5vcmc+Cj4gLS0tCj4gTWF1cmlj
ZSBIaWVyb255bXVzICgyKToKPiDCoMKgwqDCoMKgIHJ1c3Q6IGNsazogQWRkIEV4Y2x1c2l2ZUNs
ayB3cmFwcGVyIGZvciBjbGtfcmF0ZV9leGNsdXNpdmVfZ2V0Cj4gwqDCoMKgwqDCoCBwd206IHRo
MTUyMDogTG9jayBjbG9jayByYXRlIHdpdGggY2xrX3JhdGVfZXhjbHVzaXZlX2dldAo+IAo+IMKg
ZHJpdmVycy9wd20vcHdtX3RoMTUyMC5ycyB8wqAgOCArKystLS0KPiDCoHJ1c3Qva2VybmVsL2Ns
ay5yc8KgwqDCoMKgwqDCoMKgIHwgNjUKPiArKysrKysrKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysrKwo+IMKgMiBmaWxlcyBjaGFuZ2VkLCA2OCBpbnNlcnRpb25zKCspLCA1
IGRlbGV0aW9ucygtKQo+IC0tLQo+IGJhc2UtY29tbWl0OiAwZTVlMGRiM2U5NTRiMzJhNDEwYWI0
Zjc0YTRmYWFjN2EwZTg4ODlmCj4gY2hhbmdlLWlkOiAyMDI2MDUyNi1yYXRlLWV4Y2x1c2l2ZS1n
ZXQtdGgxNTIwLTc2NGE5NDlkZTE4ZQo+IAo+IEJlc3QgcmVnYXJkcywKCkFueSBvcGluaW9ucyBv
biB0aGlzIHBhdGNoPwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVh
ZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1y
aXNjdgo=
