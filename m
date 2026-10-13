Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76626CC6B0E
	for <linux-riscv@archiver.kernel.org>; Tue, 13 Oct 2026 17:15:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:References:Message-Id:Cc:Date:
	In-Reply-To:From:Subject:Mime-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FsxnYwkSkZI6Zwp5oqpdvj44NqvnzHAwyqTDtH3NqaQ=; b=MYdM4wQ0RGpnRv
	5zB6UteaqqoV39cnuQJZsSGL7lsmpkdaCXCR1Gpme/JbZPrToELGcL6CvbeiNz2P4/BEh4D9usg5A
	9tbVwWAcUEefK5EKoofrRVzuMYqY75RgAWUqQfBReh7tX2/zqFfD//GJCQXc1wb5SHeuVaJZ/9ZDZ
	v6Qh0gBYFcsvzFywpVXoKSf/CS+gwkzMHnBnwR4PbRlsQpSxWbk1JWpkc4Iwv8qR/J3NjJFzDAlwB
	SiE9GQSW0woiRKKsgaWxREmK6aioGz5wRjiaZwurHi+1ok/x1vxVQONlODvPa36FdmJ2JRJoLbzri
	MvkY8kHqg+FHgNUdBBHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGg67-0000000Dexe-20Bz;
	Tue, 13 Oct 2026 17:15:31 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGg65-0000000Dex7-2PCW
	for linux-riscv@bombadil.infradead.org;
	Tue, 13 Oct 2026 17:15:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=To:References:Message-Id:
	Content-Transfer-Encoding:Cc:Date:In-Reply-To:From:Subject:Mime-Version:
	Content-Type:Sender:Reply-To:Content-ID:Content-Description;
	bh=ooJLDxSCJEcVNbGZxg1axPiit16FO3fuMRpP0KRlDPk=; b=Bn/H+u+US59rYoJfyrbqP0w0Kq
	AcwYoj1WAHpvnPXxpV+QbjzKR9NbTbW4qbQn/dtFHVd7+Od143sdzQW5rivb3fuSgW06TD2AaoGbo
	8aZ9BK7lNs5CGHqjpknIbRJxPDfIoBotS2yzzv3rAIyaYkXm16TCocH8SixSyUpfJTa7j1MQzq1iq
	70jqoTG2rZ6hUoYYUNhEt/T/YsX/p0PkWV29YdwHt4n9fZLCLyskYlmvyelHVZ7/Rkl2skl33ALNa
	UCd0ua4fLHgS9FD1GM8nrC69EIqbmG541W1W4zy/X3RQyexgDh/7NUblgb1mVX/f55G229jUso2RD
	0/JXBn0w==;
Received: from sender5-op-o11.zoho.com ([165.173.182.11])
	by desiato.infradead.org with esmtps (Exim 4.99.5 #2 (Red Hat Linux))
	id 1xGg62-0000000FqN8-37l2
	for linux-riscv@lists.infradead.org;
	Tue, 13 Oct 2026 17:15:28 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1791911689; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=LEUbPmrFFXDtibm9yP4sUR8lKhChibHMPgsjkBJaZp0Bn8BJ0VM7qHrepUd0ZGcJ+4tGxVHTZGfiiJa9X7Hu+rAxX6sHhQxaUb0EhQ1o86YZT6dkqMM274ROs6NkUO5LuujbH9EtLpdsEmOnltkU/Lb8k6zQ62GMaBQ3FTnGLdU=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1791911689; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=ooJLDxSCJEcVNbGZxg1axPiit16FO3fuMRpP0KRlDPk=; 
	b=SkHzPEO07ayq12RR3CekkEHgsVq5BMU3Nk5xwKaDeJipRDEhMnmPLGmY6yzbm928ZOSGqy7xMJu8Mt3Gh2YqMqlSaYdclNSVOk+a8by9VqEc2CvqXKlniNzbKyL79ilXu6DwTf3zdyLA+SwLZIwOlJUYzA9hxVW4yfaryFuQ7ck=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=daniel.almeida@collabora.com;
	dmarc=pass header.from=<daniel.almeida@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1791911689;
	s=zohomail; d=collabora.com; i=daniel.almeida@collabora.com;
	h=Content-Type:Mime-Version:Subject:Subject:From:From:In-Reply-To:Date:Date:Cc:Cc:Content-Transfer-Encoding:Message-Id:Message-Id:To:To:Reply-To;
	bh=ooJLDxSCJEcVNbGZxg1axPiit16FO3fuMRpP0KRlDPk=;
	b=L2snzBiwFRm2Un298G96nKH8dJJlCKmxondKGHWWovfCxW19Q9t75c2+DNbUymRi
	lUFE/oGR6g17iOLdARIo4IlhGOeotfdA9y380MiIEFtE8t4DcC931MmVyL/ZOE9XHkq
	FraynjClPudlBUeIfmeY8/sv9c3Lp08dzOuyZgPU=
Received: by smtp.zohomail.com with SMTPS id 17919116876531023.9332615568634;
	Tue, 13 Oct 2026 10:14:47 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3901.100.1.1.11\))
Subject: Re: [PATCH v6 6/7] rust: clk: add `ExclusiveClk`
From: Daniel Almeida <daniel.almeida@collabora.com>
In-Reply-To: <20261013-clk-type-state-v6-6-a5e9977b3509@collabora.com>
Date: Tue, 13 Oct 2026 14:14:28 -0300
Cc: linux-pm@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 linux-riscv@lists.infradead.org,
 linux-pwm@vger.kernel.org,
 linux-clk@vger.kernel.org,
 rust-for-linux@vger.kernel.org,
 Boris Brezillon <boris.brezillon@collabora.com>,
 =?utf-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>,
 Maurice Hieronymus <mhi@mailbox.org>
Message-Id: <FCA1D99F-AB7A-414E-AF99-BCCDF2B54FF3@collabora.com>
References: <20261013-clk-type-state-v6-0-a5e9977b3509@collabora.com>
 <20261013-clk-type-state-v6-6-a5e9977b3509@collabora.com>
To: "Rafael J. Wysocki" <rafael@kernel.org>,
 Viresh Kumar <viresh.kumar@linaro.org>,
 Danilo Krummrich <dakr@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>,
 Michal Wilczynski <m.wilczynski@samsung.com>,
 Drew Fustini <fustini@kernel.org>,
 Guo Ren <guoren@kernel.org>,
 Fu Wei <wefu@redhat.com>,
 =?utf-8?Q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@kernel.org>,
 Stephen Boyd <sboyd@kernel.org>,
 Brian Masney <bmasney+clk@redhat.com>,
 Jerome Brunet <jbrunet+clk@baylibre.com>,
 Miguel Ojeda <ojeda@kernel.org>,
 Boqun Feng <boqun@kernel.org>,
 Gary Guo <gary@garyguo.net>,
 =?utf-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>,
 Andreas Hindborg <a.hindborg@kernel.org>,
 Trevor Gross <tmgross@umich.edu>,
 Tamir Duberstein <tamird@kernel.org>,
 Alexandre Courbot <acourbot@nvidia.com>
X-Mailer: Apple Mail (2.3901.100.1.1.11)
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261013_181527_102350_B70FFE74 
X-CRM114-Status: GOOD (  11.29  )
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

Cgo+IE9uIDEzIE9jdCAyMDI2LCBhdCAxNDowNywgRGFuaWVsIEFsbWVpZGEgPGRhbmllbC5hbG1l
aWRhQGNvbGxhYm9yYS5jb20+IHdyb3RlOgo+IAo+IFNvbWUgZHJpdmVycyBkZXJpdmUgdGhlaXIg
Y29uZmlndXJhdGlvbiBmcm9tIGEgY2xvY2sgcmF0ZSBhbmQgY2Fubm90Cj4gdG9sZXJhdGUgdGhl
IHJhdGUgY2hhbmdpbmcgdW5kZXJuZWF0aCB0aGVtLiBJbiBDLCB0aGV5IGNsYWltIHJhdGUKPiBl
eGNsdXNpdml0eSB3aXRoIGNsa19yYXRlX2V4Y2x1c2l2ZV9nZXQoKSwgYWZ0ZXIgd2hpY2ggdGhl
IGNsb2NrCj4gZnJhbWV3b3JrIHJlZnVzZXMgcmF0ZSBjaGFuZ2VzIGZyb20gb3RoZXIgY29uc3Vt
ZXJzIHVudGlsCj4gY2xrX3JhdGVfZXhjbHVzaXZlX3B1dCgpIGlzIGNhbGxlZC4KPiAKPiBBZGQg
RXhjbHVzaXZlQ2xrPFQ+LCB3aGljaCB0YWtlcyBhIENsazxUPiBpbiBhbnkgc3RhdGUgYW5kIGhv
bGRzIHJhdGUKPiBleGNsdXNpdml0eSB1bnRpbCBpdCBpcyBkcm9wcGVkLiBFeGNsdXNpdmVDbGs6
Om5ldygpIGNhbGxzCj4gY2xrX3JhdGVfZXhjbHVzaXZlX2dldCgpLCBhbmQgZHJvcHBpbmcgdGhl
IEV4Y2x1c2l2ZUNsayBvciBjYWxsaW5nCj4gRXhjbHVzaXZlQ2xrOjppbnRvX2lubmVyKCkgY2Fs
bHMgY2xrX3JhdGVfZXhjbHVzaXZlX3B1dCgpLgo+IEV4Y2x1c2l2ZUNsayBkZXJlZmVyZW5jZXMg
dG8gdGhlIENsazxUPiwgc28gdGhlIHJhdGUgY2FuIHN0aWxsIGJlIHJlYWQKPiBhbmQgY2hhbmdl
ZCB0aHJvdWdoIGl0LiBTaW5jZSBhIENsayBjYW5ub3QgYmUgY2xvbmVkLCB0aGUgRXhjbHVzaXZl
Q2xrCj4gaXMgdGhlIG9ubHkgaGFuZGxlIHRvIHRoZSBjb25zdW1lciB0aGF0IGhvbGRzIHRoZSBl
eGNsdXNpdml0eS4KPiAKPiBwd20tdGgxNTIwIGlzIHRoZSBmaXJzdCB1c2VyLCBpbiB0aGUgbmV4
dCBwYXRjaC4KPiAKPiBDby1kZXZlbG9wZWQtYnk6IE1hdXJpY2UgSGllcm9ueW11cyA8bWhpQG1h
aWxib3gub3JnPgo+IFNpZ25lZC1vZmYtYnk6IE1hdXJpY2UgSGllcm9ueW11cyA8bWhpQG1haWxi
b3gub3JnPgoKTWF1cmljZSwgSSBjaGFuZ2VkIGEgZmV3IHRoaW5ncyBpbiB0aGUgZGVzaWduLCBz
byBJIHRvb2sgb3duZXJzaGlwIHdpdGgKeW91ciBjby1kZXZlbG9wZWQtYnkgdGFnLgoKTGV0IG1l
IGtub3cgaWYgdGhhdCB3b3JrcyBmb3IgeW91LCBvciB3aGF0IHlvdSB3b3VsZCByYXRoZXIgc2Vl
IGluc3RlYWQuCgrigJQgRGFuaWVsCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5p
bmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8v
bGludXgtcmlzY3YK
