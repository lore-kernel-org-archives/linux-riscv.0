Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0412606A31A
	for <linux-riscv@archiver.kernel.org>; Tue, 20 Oct 2026 13:04:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=uoRXXNNb;
	dkim=fail reason="signature verification failed" (1024-bit key, unprotected) header.d=collabora.com header.i=daniel.almeida@collabora.com header.a=rsa-sha256 header.s=zohomail header.b=hxzfNk2G
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:References:Message-Id:Cc:Date:
	In-Reply-To:From:Subject:Mime-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=coW+AoD0hoYUqlin2NilvNItcn6uLU0jXLUp7Yzpcuw=; b=uoRXXNNb80B06R
	wHdG4LpjLoOy5VaX4bjuIL1LXSgEpTGOY+DLbIPNmo6g7Gx5TsyP+OIFbByT0OHdLb+vj8+DBES7I
	y84YCSGs6oDAjyQlu4lsRGGDthL1ws6rBZbjJXLOxPoZM4WgyOonDiiKKzYxEIiA+RdsFfK+OZUn2
	xCw7G+5W1ap9UsWayNLtMpMK6+iPmZRmHNaXZ2buBQnyARkLCpIGA89Y4JyNvokzDNFquzOBcggQG
	irlBhZvgVycu5qa3AJVhhCZOlADsiUN2itgh/4Tt+M0agQRNi/1yNqvaixt5UBDoAlxCvxPmzNbps
	x+3x032ysADT2Dg59urw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJ9W7-00000009jlI-1jiX;
	Tue, 20 Oct 2026 13:04:35 +0000
Received: from sender6-op-o11.zoho.com ([165.173.180.11])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJ9W5-00000009jkw-134n
	for linux-riscv@lists.infradead.org;
	Tue, 20 Oct 2026 13:04:34 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1792501449; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=fWnXbwa8JLtt61TkI+u2U22uYOVL1FMZfCRinthKZiu2rgwJQWQGmKuptFwrJRhzyRZbBvKOLTY+9I69wSWHPdTBgpwVGOM2uTWbzqInopmDYEg7s/lftjBdO2OYu5MY6BE4zcz9EcN+zMneKPIdzRBqh4edHHCObobh2aE8EjU=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1792501449; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=60yzROzme+I8oXG1X8cG4tnHO5f5LLKhunxRbjPCyxw=; 
	b=Wq+sEjzawdc3he6bhmx2rrIVcwB8VxkKMVkvSR1kzOAQE7ftGy5Vd1ccZq9eM3EY/BVUH+sTq8aIcwXXxTZCHO/Tx9cSEOJ0rjdDfzckDO7uMITAoUTpNjfi8FEfbkRNmzbwOUK7m3uatDdK3aSjU1WMPV6QS+V++OBDpdnntl8=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=daniel.almeida@collabora.com;
	dmarc=pass header.from=<daniel.almeida@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1792501449;
	s=zohomail; d=collabora.com; i=daniel.almeida@collabora.com;
	h=Content-Type:Mime-Version:Subject:Subject:From:From:In-Reply-To:Date:Date:Cc:Cc:Content-Transfer-Encoding:Message-Id:Message-Id:To:To:Reply-To;
	bh=60yzROzme+I8oXG1X8cG4tnHO5f5LLKhunxRbjPCyxw=;
	b=hxzfNk2G0UJiaJbbgHSfz558NINKje8EcCOdws8+o/pUT1VqCZdd6K2Vnxc9Ei5V
	yHEZk74LPD2TyLmwpJtK2iwzKLJwsORf92Jx3j9BQEyIJTBLWGobbNOC4lsOjNCBbrd
	d7sCVu4RCZVFc+J2RWBMK6YAun8kDl1cnQKYwIZg=
Received: by smtp.zohomail.com with SMTPS id 1792501446453909.1476462693812;
	Tue, 20 Oct 2026 06:04:06 -0700 (PDT)
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3901.100.1.1.11\))
Subject: Re: [PATCH v4 0/2] rust: clk: Add ExclusiveClk and use it in
 pwm-th1520
From: Daniel Almeida <daniel.almeida@collabora.com>
In-Reply-To: <atdlfNRiza3gA1iD@monoceros>
Date: Tue, 20 Oct 2026 10:03:47 -0300
Cc: Maurice Hieronymus <mhi@mailbox.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>,
 Miguel Ojeda <ojeda@kernel.org>,
 Boqun Feng <boqun@kernel.org>,
 Gary Guo <gary@garyguo.net>,
 =?utf-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>,
 Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>,
 Trevor Gross <tmgross@umich.edu>,
 Danilo Krummrich <dakr@kernel.org>,
 Drew Fustini <fustini@kernel.org>,
 Guo Ren <guoren@kernel.org>,
 Fu Wei <wefu@redhat.com>,
 Michal Wilczynski <m.wilczynski@samsung.com>,
 Brian Masney <bmasney@redhat.com>,
 linux-clk@vger.kernel.org,
 rust-for-linux@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org,
 linux-pwm@vger.kernel.org
Message-Id: <8625DA25-1F59-4175-81A6-BAA16C961557@collabora.com>
References: <20260711-rate-exclusive-get-th1520-v4-0-8244a0666a71@mailbox.org>
 <atdlfNRiza3gA1iD@monoceros>
To: =?utf-8?Q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@kernel.org>
X-Mailer: Apple Mail (2.3901.100.1.1.11)
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261020_060433_345019_9583FD64 
X-CRM114-Status: GOOD (  12.18  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-14.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Cgo+IE9uIDIwIE9jdCAyMDI2LCBhdCAwOTo1OSwgVXdlIEtsZWluZS1Lw7ZuaWcgPHVrbGVpbmVr
QGtlcm5lbC5vcmc+IHdyb3RlOgo+IAo+IEhlbGxvLAo+IAo+IE9uIFNhdCwgSnVsIDExLCAyMDI2
IGF0IDEyOjE2OjI4UE0gKzAyMDAsIE1hdXJpY2UgSGllcm9ueW11cyB3cm90ZToKPj4gQWRkIGEg
UnVzdCBiaW5kaW5nIGZvciBjbGtfcmF0ZV9leGNsdXNpdmVfZ2V0KCkgLyBjbGtfcmF0ZV9leGNs
dXNpdmVfcHV0KCkKPj4gYW5kIHVzZSBpdCBpbiBwd20tdGgxNTIwLCB3aGljaCBwcmV2aW91c2x5
IGNhcnJpZWQgYSBUT0RPIG5vdGluZyB0aGUKPj4gbWlzc2luZyBiaW5kaW5nLgo+PiAKPj4gU2ln
bmVkLW9mZi1ieTogTWF1cmljZSBIaWVyb255bXVzIDxtaGlAbWFpbGJveC5vcmc+Cj4+IC0tLQo+
PiBbLi4uXQo+PiAtLS0KPj4gTWF1cmljZSBIaWVyb255bXVzICgyKToKPj4gICAgICBydXN0OiBj
bGs6IEFkZCBgRXhjbHVzaXZlQ2xrYCB3cmFwcGVyIGZvciBgY2xrX3JhdGVfZXhjbHVzaXZlX2dl
dGAKPj4gICAgICBwd206IHRoMTUyMDogTG9jayBjbG9jayByYXRlIHdpdGggY2xrX3JhdGVfZXhj
bHVzaXZlX2dldAo+PiAKPj4gZHJpdmVycy9wd20vcHdtX3RoMTUyMC5ycyB8IDE4ICsrKysrKysr
LS0tLS0KPj4gcnVzdC9rZXJuZWwvY2xrLnJzICAgICAgICB8IDY3ICsrKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysrCj4+IDIgZmlsZXMgY2hhbmdlZCwgNzkgaW5z
ZXJ0aW9ucygrKSwgNiBkZWxldGlvbnMoLSkKPj4gLS0tCj4+IGJhc2UtY29tbWl0OiA5MjAxMDIy
OWM0YjM4ODk3ZjEzMTlkMjYwMTYyZDJmOTY5MjVlZDE3Cj4+IGNoYW5nZS1pZDogMjAyNjA1MjYt
cmF0ZS1leGNsdXNpdmUtZ2V0LXRoMTUyMC03NjRhOTQ5ZGUxOGUKPj4gcHJlcmVxdWlzaXRlLWNo
YW5nZS1pZDogMjAyNTA5MDktY2xrLXR5cGUtc3RhdGUtYzAxYWE3ZGQ1NTFkOnY1Cj4+IHByZXJl
cXVpc2l0ZS1wYXRjaC1pZDogMmQzZGM0NWMyNDFkOTA2MmEwZDI1NDZlYzY0OWVlYzc5NzBmYTUw
YQo+PiBwcmVyZXF1aXNpdGUtcGF0Y2gtaWQ6IDY3YWQ1MzVmZTExMDIwN2ViYzc5MDQ1YmEwMjJl
YmI3MTM3YjAzMDkKPj4gcHJlcmVxdWlzaXRlLXBhdGNoLWlkOiAzZDFkOGVlNWMyYTQ5NTdlZGQw
ODA3YjdhNWNiNjVkYWJhYjM0NWI1Cj4+IHByZXJlcXVpc2l0ZS1wYXRjaC1pZDogZTI2NTkwMzdi
OGFhZjUxODMxZGEwOTljYzU2OGFkNWIzYzI0YTRkZAo+IAo+IEkgZGlkbid0IHRyYWNrIHRoZXNl
IGRlcGVuZGVuY2llcywgYnV0IHRoZSBjaGFuZ2UgbG9va3MgZmluZSBmb3IgbWUuIFdobwo+IGlz
IHN1cHBvc2VkIHRvIG1lcmdlIGl0PyBJIGNhbiB0YWtlIGl0IHZpYSBwd20sIGJ1dCBJIGd1ZXNz
IGEgcnVzdCB0cmVlCj4gaXMgbW9yZSBhcHByb3ByaWF0ZT8hCj4gCj4gQmVzdCByZWdhcmRzCj4g
VXdlCgpQbGVhc2Ugbm8sCgpTZWUgWzBdIGluc3RlYWQsIHdoaWNoIGFsc28gaW5jbHVkZXMgYSBu
ZXdlciB2ZXJzaW9uIG9mIHRoaXMgcGF0Y2guCgpbMF06IGh0dHBzOi8vbG9yZS5rZXJuZWwub3Jn
L3J1c3QtZm9yLWxpbnV4LzIwMjYxMDEzLWNsay10eXBlLXN0YXRlLXY2LTEtYTVlOTk3N2IzNTA5
QGNvbGxhYm9yYS5jb20vCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJh
ZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51
eC1yaXNjdgo=
