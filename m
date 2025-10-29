Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57A46CCF9EE
	for <linux-riscv@archiver.kernel.org>; Wed, 29 Oct 2025 18:52:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:From:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9+Qoi+pe1dRLq36LMVp6Ki2kX7z4IzkBFigPYOEhKBw=; b=KNCFUY7sEr9El+
	BReHqdiqBPKN2FY5z4nFQbvjRdH7ANjkDusKq0VwHcSW0DdOzRS/h9ySwom+9ZRZ6W+DRKWLUg1Am
	0i8S/FM1/O0TQCJJVJgvbQg12kACdoVc536ZX77O1GlxrrNvafTC7mLvpm9UZiQx+j/NbT+mcC1EG
	J+5yhHnq/zZkS+1sQ4zhGgXYsPm6wHyWIb9ppjptVVLcBoLOVx8bsZb19Lr1SkgAWLWYlQORO3GCZ
	RFYtInoqrQdhsXpTG3VPtul3cAreqUWEMyuwvtZYzPh1hOHFPpmhARNpmuVz/A6M4X4e34NtmgVDv
	eND/8oGF+sG3jPC59bMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEBH6-00000002T0Q-0A8m;
	Wed, 29 Oct 2025 18:52:00 +0000
Received: from mailout2.w1.samsung.com ([210.118.77.12])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEBH2-00000002Sz5-3t2I
	for linux-riscv@lists.infradead.org;
	Wed, 29 Oct 2025 18:51:59 +0000
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
	by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20251029185152euoutp02f7874da2db5d311c7a5760013b2d53de~zCvGe8TdF1104711047euoutp02R
	for <linux-riscv@lists.infradead.org>; Wed, 29 Oct 2025 18:51:52 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20251029185152euoutp02f7874da2db5d311c7a5760013b2d53de~zCvGe8TdF1104711047euoutp02R
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1761763912;
	bh=bQNGVhOQyRYDAT6f5LbiqaQukE8P3fTErRwmbu+uxa0=;
	h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
	b=YFumTbjG41C6tu1h2AUDSfornvKlbUCc8GAUJqm8oid7casxs71+RYNRvPHlNqyv6
	 1mtSDA459GHvBRsbZsN5QcKz+KUPGDzvN2lPaObSEeQLGe0E5p404Gsb9mFBbZopkR
	 Hf8AvMOgG6UVxHkmQu/Fh4s4oeHx3Avqn4wgy+C0=
Received: from eusmtip1.samsung.com (unknown [203.254.199.221]) by
	eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
	20251029185151eucas1p1d0537f2fc24d4dbc400c773168f20bb8~zCvFn56t52969429694eucas1p1m;
	Wed, 29 Oct 2025 18:51:51 +0000 (GMT)
Received: from [192.168.1.44] (unknown [106.210.136.40]) by
	eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20251029185150eusmtip13980126f40913ce41b484d6f44f45dde~zCvE0SljI2995129951eusmtip1b;
	Wed, 29 Oct 2025 18:51:50 +0000 (GMT)
Message-ID: <1287f917-dc25-4c80-8b09-3d0a7bc8eb6b@samsung.com>
Date: Wed, 29 Oct 2025 19:51:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/4] Introduce import_ns support for Rust
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
	=?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@kernel.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, Benno Lossin
	<lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl
	<aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, Danilo Krummrich
	<dakr@kernel.org>, Drew Fustini <fustini@kernel.org>, Guo Ren
	<guoren@kernel.org>, Fu Wei <wefu@redhat.com>, Stephen Rothwell
	<sfr@canb.auug.org.au>, rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-pwm@vger.kernel.org,
	linux-riscv@lists.infradead.org
Content-Language: en-US
From: Michal Wilczynski <m.wilczynski@samsung.com>
In-Reply-To: <CANiq72n8QvygNsdHjaMgYrXiErT82BkWm1XMkc3eUZB1Xy_uAQ@mail.gmail.com>
X-CMS-MailID: 20251029185151eucas1p1d0537f2fc24d4dbc400c773168f20bb8
X-Msg-Generator: CA
X-RootMTR: 20251028122315eucas1p159b65037cf6f3f710c1917e2464399b5
X-EPHeader: CA
X-CMS-RootMailID: 20251028122315eucas1p159b65037cf6f3f710c1917e2464399b5
References: <CGME20251028122315eucas1p159b65037cf6f3f710c1917e2464399b5@eucas1p1.samsung.com>
	<20251028-pwm_fixes-v1-0-25a532d31998@samsung.com>
	<2dedlnknikkrwg5f6ocuvjrogdjuqyg4sg6zkkao4w4yyvvsje@dkt7rco3fen3>
	<CANiq72n8QvygNsdHjaMgYrXiErT82BkWm1XMkc3eUZB1Xy_uAQ@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251029_115157_557004_77988349 
X-CRM114-Status: GOOD (  15.49  )
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

CgpPbiAxMC8yOS8yNSAxOToxOCwgTWlndWVsIE9qZWRhIHdyb3RlOgo+IE9uIFdlZCwgT2N0IDI5
LCAyMDI1IGF0IDExOjA04oCvQU0gVXdlIEtsZWluZS1Lw7ZuaWcgPHVrbGVpbmVrQGtlcm5lbC5v
cmc+IHdyb3RlOgo+Pgo+PiBJZiB5b3UgY291bGQgbWVudGlvbiB0aGUgY29tbWFuZCB0aGF0IG1h
a2VzIHRoaXMgd2FybmluZyB2aXNpYmxlLCBJJ2QgYmUKPj4gZ2xhZCB0byBhZGQgdGhhdCB0byBt
eSByZXBlcnRvaXJlIG9mIGJ1aWxkIGNoZWNrcy4KPiAKPiBZZWFoLCBwbGVhc2UgZG8hCj4gCj4g
SSBkbyBteSBiZXN0IHRvIGtlZXAgZXZlbiBsaW51eC1uZXh0IGFuZCBzdGFibGUga2VybmVscyBD
bGlwcHkgY2xlYW4KPiBhcyBtdWNoIGFzIHBvc3NpYmxlLCBzbyBpdCB3b3VsZCBiZSBuaWNlIHRv
IGhhdmUgdGhhdCBDbGlwcHkgZml4IGFkZGVkCj4gdG8gLW5leHQgc29vbi4KPiAKPiBJIGhhdmUg
b3RoZXIgc3RlcHMgdGhhdCBtYWludGFpbmVycy9jb250cmlidXRvcnMgc2hvdWxkIHJ1biBoZXJl
Ogo+IAo+ICAgICBodHRwczovL3Byb3RlY3QyLmZpcmVleWUuY29tL3YxL3VybD9rPTBkMzVlMGQz
LTZkZDc3ZDhlLTBkMzQ2YjljLTAwMGJhYmQ5ZjFiYS1lNWQyN2JiYmNjZDk5N2NhJnE9MSZlPWQ0
YTY0Yzk5LWFhYjYtNDc0MS05NzQ3LTYzZjEwZTYzYWVkNCZ1PWh0dHBzJTNBJTJGJTJGcnVzdC1m
b3ItbGludXguY29tJTJGY29udHJpYnV0aW5nJTIzc3VibWl0LWNoZWNrbGlzdC1hZGRlbmR1bQo+
IAo+IEVzc2VudGlhbGx5IC8gbW9zdCBpbXBvcnRhbnRseTogYHJ1c3RmbXRgLCBgcnVzdGRvY2Ag
YW5kIGBDTElQUFk9MWAuCgpPaCB5ZWFoIEkgdGhpbmsgSSByZW1lbWJlcmVkIHRvIHJ1biAncnVz
dGZtdCcgY291cGxlIG1vbnRocyBhZ28sIGJ1dApvdmVyIHRpbWUgd2hlbiBzZW5kaW5nIHJldmlz
aW9ucyBmb3Jnb3QgYWJvdXQgdGhhdCwgc29ycnkuIEkgZ3Vlc3MgaXQKd291bGQgYmUgZ3JlYXQg
dG8gZXh0ZW5kICdiNCBwcmVwIC0tY2hlY2snIGZvciB0aG9zZSBjaGVja3MgYXMgd2VsbC4KCj4g
Cj4gSSBhbSBzZW5kaW5nIGEgY291cGxlIGZpeGVzIGZvciB0aG9zZS4KPiAKPiBUaGFua3MhCj4g
Cj4gQ2hlZXJzLAo+IE1pZ3VlbAo+IAoKQmVzdCByZWdhcmRzLAotLSAKTWljaGFsIFdpbGN6eW5z
a2kgPG0ud2lsY3p5bnNraUBzYW1zdW5nLmNvbT4KCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNj
dkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4v
bGlzdGluZm8vbGludXgtcmlzY3YK
