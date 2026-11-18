Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36327606A32A
	for <linux-riscv@archiver.kernel.org>; Wed, 18 Nov 2026 14:48:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=obIXA3Ct;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=zohomail header.b=EdUk8q0V
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:References:Message-Id:Cc:Date:
	In-Reply-To:From:Subject:Mime-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=kehcbPxWlvpnPnMxW+pEKOPLxW8wEh4fyP4rqViEcY0=; b=obIXA3CtBP5BiCKjyg/SC0Qdc0
	CRo0L8QjpP0dGZlxxrqn9FRB6BnNDfzV5etHW+b1FNLscB13EdtxcJHreTnN4IHgrRLYMlQAQL+Gn
	wlNRXJPP8R5qzz1X0F4U2GPgt7T9aDUvuMe7NS9bX24mT8WwuAqF9n9VApRQoBiKu7HcKIeTGLcnD
	MCMlc0JJ2aSpF5Oo05atw7cRy0KYcQM3b+VmBz/ahUCJRjQ15sxnSymp7nHD+83PxjYBDZ2HB61NH
	bJor6NZW90zpOtU4a1UCbpNzjqV8UAfIX3Iulsy3qfylZluW5CP4eMW5JU2MoJn5ePj0qPIHPVMIF
	0ojuOyCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTgxN-0000000997n-2bZc;
	Wed, 18 Nov 2026 14:48:17 +0000
Received: from sender6-op-o11.zoho.com ([165.173.180.11])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTgxK-0000000996r-1zFU
	for linux-riscv@lists.infradead.org;
	Wed, 18 Nov 2026 14:48:16 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1795013248; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=OosozSG/m/6BH6LExb9WEQA9mQQDkOxmd2Y8kPDeXNAZWleSLQhMtNY2+uI8KhawaXUHYr47f8oAZn0N964ZgBYyXGCiT02s/Z74UIIxHA+2ECCTad4PExBsP1KYPsM1p9d/LWebw8uDaFCDFSfC3n7dR4fPjhnjaVOjF4NtA3U=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1795013248; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=6zB/RMHWdIa7W8+VTnT+QTtr7Bbpj33D57C4R1EDlas=; 
	b=cqe8Ny8ZQEg4ksL1wtnrt586k9283grpoxwjSmD4McSWu3wPIRDkuHOA1YRK5ZfamqOnqyNI78DibXRqLPs819yV6gD11Jo/arIUzj9zNJTH1COBGfE2j8gwXErFqQhmzCI9MFRRYLnAAbL6QecoLNE8t7leM49RtAMFWWbX1HM=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=daniel.almeida@collabora.com;
	dmarc=pass header.from=<daniel.almeida@collabora.com>
DKIM-Signature: a=rsa-sha256; b=EdUk8q0VINosLxs21gOjRZn+nKLBqNq/iD5Npp0a0jH8Z7xTEQiaI5c3FegTTZMmf/wb4MixKQZxLGUPje7g1RDUnmXE3pAolvscDKNbqpVN641LJ1RB8Sh+t8DmYbQwsHocvRaTHw2a1WuFiaFP/IhlYOQog8lN6H29wfWIJUM=; c=relaxed/relaxed; s=zohomail; d=collabora.com; v=1; bh=6zB/RMHWdIa7W8+VTnT+QTtr7Bbpj33D57C4R1EDlas=; h=Content-Description:Content-ID:Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:List-Subscribe:List-Post:List-Owner:List-Id:List-Archive:List-Help:List-Unsubscribe:MIME-Version:Message-ID:Resent-Sender:Resent-Cc:Resent-Date:Resent-To:Reply-To:Resent-Message-ID:Resent-From:Sender:Subject:To:Date:From:Message-Id:Reply-To:Subject:To:Cc;
Received: by smtp.zohomail.com with SMTPS id 1795013246789416.0565019034008;
	Wed, 18 Nov 2026 06:47:26 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3901.200.71.1.16\))
Subject: Re: [PATCH v6 5/7] rust: clk: add devres-managed clks
From: Daniel Almeida <daniel.almeida@collabora.com>
In-Reply-To: <DMYELN5M09W3.1SYPKW7DZ70E1@garyguo.net>
Date: Wed, 18 Nov 2026 11:47:04 -0300
Cc: "Rafael J. Wysocki" <rafael@kernel.org>,
 Viresh Kumar <viresh.kumar@linaro.org>,
 Danilo Krummrich <dakr@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>,
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
 =?utf-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>,
 Andreas Hindborg <a.hindborg@kernel.org>,
 Trevor Gross <tmgross@umich.edu>,
 Tamir Duberstein <tamird@kernel.org>,
 Alexandre Courbot <acourbot@nvidia.com>,
 linux-pm@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 linux-riscv@lists.infradead.org,
 linux-pwm@vger.kernel.org,
 linux-clk@vger.kernel.org,
 rust-for-linux@vger.kernel.org,
 Boris Brezillon <boris.brezillon@collabora.com>,
 =?utf-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>,
 Maurice Hieronymus <mhi@mailbox.org>
Message-Id: <189F36A9-D1C1-478A-A195-F94D037E4376@collabora.com>
References: <20261013-clk-type-state-v6-0-a5e9977b3509@collabora.com>
 <20261013-clk-type-state-v6-5-a5e9977b3509@collabora.com>
 <DMYELN5M09W3.1SYPKW7DZ70E1@garyguo.net>
To: Gary Guo <gary@garyguo.net>
X-Mailer: Apple Mail (2.3901.200.71.1.16)
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261118_064815_040690_1238610E 
X-CRM114-Status: GOOD (  10.10  )
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
X-Spam-Status: No, score=-8.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Cgo+IE9uIDE4IE5vdiAyMDI2LCBhdCAxMToyNCwgR2FyeSBHdW8gPGdhcnlAZ2FyeWd1by5uZXQ+
IHdyb3RlOgo+IAo+IE9uIFR1ZSBPY3QgMTMsIDIwMjYgYXQgNjowNyBQTSBCU1QsIERhbmllbCBB
bG1laWRhIHdyb3RlOgo+PiBNYW55IGRyaXZlcnMgb25seSBuZWVkIGEgY2xvY2sgcnVubmluZyBm
b3IgYXMgbG9uZyBhcyB0aGUgZGV2aWNlIGlzCj4+IGJvdW5kIGFuZCBuZXZlciB0b3VjaCBpdCBh
ZnRlcndhcmRzLiBJbiBDLCBkZXZtX2Nsa19nZXRfZW5hYmxlZCgpIGFuZAo+PiBkZXZtX2Nsa19n
ZXRfb3B0aW9uYWxfZW5hYmxlZCgpIGNvdmVyIHRoaXMgY2FzZS4KPj4gCj4+IEFkZCBkZXZtX2Vu
YWJsZSgpLCBkZXZtX2VuYWJsZV9vcHRpb25hbCgpIGFuZAo+PiBkZXZtX2VuYWJsZV9vcHRpb25h
bF93aXRoX3JhdGUoKSwgd2hpY2ggd3JhcCB0aGUgQyBoZWxwZXJzLiBUaGV5IHJldHVybgo+PiBu
byBoYW5kbGUsIHNvIHRoZSBkcml2ZXIga2VlcHMgbm90aGluZyBpbiBpdHMgZGF0YSBhbmQgY2Fu
bm90IGNoYW5nZSB0aGUKPj4gc3RhdGUgb2YgdGhlIGNsb2NrLiBUaGUgY2xvY2sgaXMgZGlzYWJs
ZWQsIHVucHJlcGFyZWQgYW5kIHB1dCB3aGVuIHRoZQo+PiBkZXZpY2UgaXMgdW5ib3VuZC4KPj4g
Cj4+IFRoaXMgbWlycm9ycyByZWd1bGF0b3I6OmRldm1fZW5hYmxlKCkgYW5kIGRldm1fZW5hYmxl
X29wdGlvbmFsKCkuCj4+IAo+PiBSZXZpZXdlZC1ieTogQWxleGFuZHJlIENvdXJib3QgPGFjb3Vy
Ym90QG52aWRpYS5jb20+Cj4+IFNpZ25lZC1vZmYtYnk6IERhbmllbCBBbG1laWRhIDxkYW5pZWwu
YWxtZWlkYUBjb2xsYWJvcmEuY29tPgo+IAo+IEdpdmVuIGFsbCB0aGUgZGV2aWNlIHJlc291cmNl
IGxpZmV0aW1lIGNoYW5nZXMsIGRvIHdlIHN0aWxsIG5lZWQgdGhpcyBub3csIG9yCj4gd291bGQg
cHV0dGluZyBhIGd1YXJkIGluIGRyaXZlciBwcml2YXRlIGRhdGEgdG8gYmUgZHJvcHBlZCBhdXRv
bWF0aWNhbGx5IHVwb24KPiB1bmJpbmQgYmUgc3VmZmljaWVudD8KCkkgdGhpbmsgd2Ugc2hvdWxk
IHN0aWxsIHByb3ZpZGUgdGhpcy4gTWFueSBkcml2ZXJzIG9ubHkgY2FyZSB0aGF0IHRoZSBjbG9j
ayBiZQplbmFibGVkIGF0IGEgZ2l2ZW4gcmF0ZSwgYW5kIGRvIG5vdCBjYXJlIGFib3V0IHRoZSBo
YW5kbGUuIEkgdGhpbmsgdGhpcyBoYXMKbGl0dGxlIHRvIGRvIHdpdGggQyBvciBSdXN0IGFuZCBz
aG91bGQgYmUgc3VwcG9ydGVkIGluIFJ1c3QgdG9vLgoK4oCUIERhbmllbApfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxp
c3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFk
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
