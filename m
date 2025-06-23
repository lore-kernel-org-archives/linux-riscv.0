Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07B24C77B7F
	for <linux-riscv@archiver.kernel.org>; Mon, 23 Jun 2025 12:35:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:From:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zvA1Dy2YS/MLaRm0GnzEL5egPlsANEzO2984G26USMk=; b=hjzgpnItQvKjbR
	7ImXenV+3iWFhBrHiECkGHkvys/FU6hkxP9ckU4g6q+S3kram6aywQfI5bEkyLY5bEWS8qQeWGmy+
	hslYLrao6RcrB+ZG8ICsIaRUunWvIEot1VQ+NmvOpQ8Sv4QyHEV6cr7uzKFv8sdEAMlLfG4h9lPH/
	c6tL9JRWaB3J+obycX/EIbKFipdus94ozLWsTa9t5EPO6TB/oN9LsEoM7FKS6mM+n+QqVi4iBE4Kr
	RH7/3xHoby2mBWOMf1OCa1a4PHVq1NJYtDuaBWEuzlk18n2+DYziD8NC5uYHShO4uFtoPZlrf0B80
	xMzKGASwYGpjtsmYaM2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTgOG-00000002i3F-3ykl;
	Mon, 23 Jun 2025 12:35:12 +0000
Received: from mailout1.w1.samsung.com ([210.118.77.11])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTecr-00000002Op6-0Y0r
	for linux-riscv@lists.infradead.org;
	Mon, 23 Jun 2025 10:42:11 +0000
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
	by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20250623104204euoutp012401a2774c3ecc6088173c26bf10b1ec~Lpe6VQh3p2279622796euoutp012;
	Mon, 23 Jun 2025 10:42:04 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20250623104204euoutp012401a2774c3ecc6088173c26bf10b1ec~Lpe6VQh3p2279622796euoutp012
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1750675324;
	bh=ZgC7RmHblf1sf7WhXqmx7u6LQrZhsQXE/footszyEW0=;
	h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
	b=GzKVBdPw94wRPygDILO19gR4YjbJe52ce42rJk/B3hzlaWlrRlfdwI8nsZzPkDiQR
	 oHaiH1lEGlhXsfloz3SwuT/GSfXbXvhOrUWgy+NKZPTMSNBdHMWEf8RvcPeRf9TVzb
	 iloMNZJkhXyEyTut7qAzHEx/iDzsnRv5iMjOI6wE=
Received: from eusmtip1.samsung.com (unknown [203.254.199.221]) by
	eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
	20250623104203eucas1p1ad615a6dbbfc1e4a493d4eb81b68d666~Lpe52oEhj0250002500eucas1p1v;
	Mon, 23 Jun 2025 10:42:03 +0000 (GMT)
Received: from [192.168.1.44] (unknown [106.210.136.40]) by
	eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20250623104202eusmtip1432554c88ece7735183b4593540639d1~Lpe4jGdCu1485414854eusmtip1Q;
	Mon, 23 Jun 2025 10:42:02 +0000 (GMT)
Message-ID: <962be35f-65be-4589-a844-cb613ea40286@samsung.com>
Date: Mon, 23 Jun 2025 12:42:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 0/9] Rust Abstractions for PWM subsystem with TH1520
 PWM driver
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>, Drew Fustini
	<fustini@kernel.org>
Cc: =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@kernel.org>, Miguel Ojeda
	<ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng
	<boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
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
	devicetree@vger.kernel.org, linux-clk@vger.kernel.org, Krzysztof Kozlowski
	<krzysztof.kozlowski@linaro.org>
Content-Language: en-US
From: Michal Wilczynski <m.wilczynski@samsung.com>
In-Reply-To: <CANiq72=YsoFSSm9QU0W2ZQseeQTWFNkXYVR1mODdv3HHg-0PAQ@mail.gmail.com>
X-CMS-MailID: 20250623104203eucas1p1ad615a6dbbfc1e4a493d4eb81b68d666
X-Msg-Generator: CA
X-RootMTR: 20250618122801eucas1p2f9ca464e9e5c8d954d5150500952aeed
X-EPHeader: CA
X-CMS-RootMailID: 20250618122801eucas1p2f9ca464e9e5c8d954d5150500952aeed
References: <CGME20250618122801eucas1p2f9ca464e9e5c8d954d5150500952aeed@eucas1p2.samsung.com>
	<20250618-rust-next-pwm-working-fan-for-sending-v4-0-a6a28f2b6d8a@samsung.com>
	<aFSw44++s7xMkJ9I@x1>
	<CANiq72=YsoFSSm9QU0W2ZQseeQTWFNkXYVR1mODdv3HHg-0PAQ@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250623_034209_664441_6759A8A9 
X-CRM114-Status: UNSURE (   9.84  )
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

CgpPbiA2LzIxLzI1IDE0OjIxLCBNaWd1ZWwgT2plZGEgd3JvdGU6Cj4gT24gRnJpLCBKdW4gMjAs
IDIwMjUgYXQgMjo1MuKAr0FNIERyZXcgRnVzdGluaSA8ZnVzdGluaUBrZXJuZWwub3JnPiB3cm90
ZToKPj4KPj4gRGlkIEkgZG8gc29tZXRoaW5nIHdyb25nPwo+IAo+IE5vIC0tIHRoZSBmaWxlIGp1
c3QgZG9lc24ndCBleGlzdCBpbiB0aGUgcGF0Y2hlcy4KClllYWggSSBkaWQgc29tZXRoaW5nIHdy
b25nLCBJIG1pc3NlZCBpdCBkdXJpbmcgdGhlIGNvbW1pdCBzcGxpdCwgYW5kIGZvcgptZSBjb21w
aWxhdGlvbiB3b3JrZWQgYXMgSSBoYWQgbWFueSB1bnRyYWNrZWQgZmlsZXMgaW4gdGhlIHJlcG9z
aXRvcnkKYW5kIHdlcmUgY29tcGlsaW5nIHdpdGggcHdtLmMgYXMgb25lIG9mIHRoZW0uCgo+IAo+
IENoZWVycywKPiBNaWd1ZWwKPiAKCkJlc3QgcmVnYXJkcywKLS0gCk1pY2hhbCBXaWxjenluc2tp
IDxtLndpbGN6eW5za2lAc2Ftc3VuZy5jb20+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZA
bGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2xpbnV4LXJpc2N2Cg==
