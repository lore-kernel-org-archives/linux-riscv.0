Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EA78606A31A
	for <linux-riscv@archiver.kernel.org>; Mon, 23 Nov 2026 16:35:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=mKF8rJ1t;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=zohomail header.b=GAI6E7T6
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:References:Message-Id:Cc:Date:
	In-Reply-To:From:Subject:Mime-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=bEYLY8Xq9wCerYztsux35UBehYb3rUfyfzRNQWCqDYQ=; b=mKF8rJ1tgLVBgiUpucSYw+GpYb
	WhPQCH7bVvT/8bjSWd3jNrA5SYbe6gzOTOekyEL1mHtKCYKWQOgpkkCUmaAVL8lbZ6NK8Fhg70yZq
	C0GJk+bEhEyDLyaXEKy15TLWCfk4XGcqekTIjeczSU2ASJeHLhpsQhuHCTvK9JTb20pZDolG+DUk2
	mCRMZWiBpF97B402NB5SpILzEWCtzffocVs8TN0+r4m+uLiHQtkN5c2d9iWaeTv+jLwJSTBgxfOzE
	a3aCfH1/7yUuK23RKdhOr/qwZ3FOH4OLQLiDYt6S0gRjtl3OrrTfFNMMh1847AoPMl4S1tBF+284i
	wzQx8rNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVX0W-00000004DNF-4AKU;
	Mon, 23 Nov 2026 16:35:08 +0000
Received: from sender5-op-o11.zoho.com ([165.173.182.11])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVX0T-00000004DMG-0fr9
	for linux-riscv@lists.infradead.org;
	Mon, 23 Nov 2026 16:35:07 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1795451652; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=ZbOvI+mjMOJdnFUKfoizUppJ6Ex6hbrHj2jxYtGHugqpZ/j92pi6Tu8fPa6z+YesJmcS5LTOgGJXZUsQEQZeANA77QkFFntTa8oUCzlsIRNbUxNOQscyMFVdMuM9wp1aeymCBkDSvpK6lYGDi7Ry7l5QcSyo0GF5tP1Us9l4sho=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1795451652; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=QonMcWfZhIMNw5CEeHP+f4vnHBs+VjAaV445fAEQw3U=; 
	b=eueo9JlUODZxmwySjUsVy3NbbUU3IYimCIEQg5PbyjbjMsD/n4RzU9wTVwSr13IHzmxhOyT9Dr/ukXJqbz6vbb7xT/EH+DjjWoI9wZWEnsaR5adGXRNq3fdI0PRVX9q86X6sV9j2TzQ2/MJsY3Jg68cMCskDUSgt8s1xS1AijdY=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=daniel.almeida@collabora.com;
	dmarc=pass header.from=<daniel.almeida@collabora.com>
DKIM-Signature: a=rsa-sha256; b=GAI6E7T6ob6Nh6q2zHxKPJSqCvgf5vpe25pUS58M/13XUUw2gND7vz4tmSwlpFi/h7R/lAgfsRj9i+/r7Totl7fqnIyBRHU7OcXoxH3I7xTnNpAO3NAWGfg3QFMRRlMi5Tc6rS84L8JVg1WvfeNHFhFhPe5TjibnvVfcQD9RHpQ=; c=relaxed/relaxed; s=zohomail; d=collabora.com; v=1; bh=QonMcWfZhIMNw5CEeHP+f4vnHBs+VjAaV445fAEQw3U=; h=Content-Description:Content-ID:Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:List-Subscribe:List-Post:List-Owner:List-Id:List-Archive:List-Help:List-Unsubscribe:MIME-Version:Message-ID:Resent-Sender:Resent-Cc:Resent-Date:Resent-To:Reply-To:Resent-Message-ID:Resent-From:Sender:Subject:To:Date:From:Message-Id:Reply-To:Subject:To:Cc;
Received: by smtp.zohomail.com with SMTPS id 1795451645257569.0456820205015;
	Mon, 23 Nov 2026 08:34:05 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3901.200.71.1.16\))
Subject: Re: [PATCH v6 3/7] rust: clk: use the type-state pattern
From: Daniel Almeida <daniel.almeida@collabora.com>
In-Reply-To: <179519333138.3795820.61438010297111723.b4-review@b4>
Date: Mon, 23 Nov 2026 13:33:47 -0300
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
 Gary Guo <gary@garyguo.net>,
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
Message-Id: <4FF31142-6624-4A90-9BE2-F654D896EF22@collabora.com>
References: <20261013-clk-type-state-v6-0-a5e9977b3509@collabora.com>
 <20261013-clk-type-state-v6-3-a5e9977b3509@collabora.com>
 <179519333138.3795820.61438010297111723.b4-review@b4>
To: Jerome Brunet <jbrunet@baylibre.com>
X-Mailer: Apple Mail (2.3901.200.71.1.16)
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261123_083505_248297_BC1D67A8 
X-CRM114-Status: GOOD (  26.14  )
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
X-Spam-Status: No, score=-3.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

SGkgSmVyb21lLAoKCj4gT24gMjAgTm92IDIwMjYsIGF0IDEzOjQ4LCBKZXJvbWUgQnJ1bmV0IDxq
YnJ1bmV0QGJheWxpYnJlLmNvbT4gd3JvdGU6Cj4gCj4+IGNsay5wcmVwYXJlKCk7Cj4+IGNsay5l
bmFibGUoKTsKPj4gY2xrLmVuYWJsZSgpOwo+IAo+IFRoaXMgcGFydGljdWxhciBzZXF1ZW5jZSBp
cyBpbmRlZWQgYWxsb3dlZCBpbiBDLiBJIGRvbid0IGdldCB3aHkgaXQgc2hvdWxkIG5vdAo+IGJl
ID8gKGluIGdlbmVyYWwgYW5kL29yIGluIHJ1c3QpCj4gCj4gSWYgeW91IGRpcy1hbGxvdyB0aGlz
IGluIHJ1c3QsIHRoZSAyIHNpZGVzIGRyaWZ0IGFwYXJ0LCBkb24ndCB0aGV5ID8KPiBJIG1lYW4g
dGhleSBzdGFydCBiZWhhdmluZyBkaWZmZXJlbnRseS4gSSBzdXBwb3NlIHRoaXMgaXMgbm90IHNv
bWV0aGluZwo+IGRlc2lyYWJsZSA/CgoKVGhlIHByb2JsZW0gd2l0aCB0aGUgY3VycmVudCBBUEkg
aXMgdGhhdCBpdCBkb2VzIG5vdCBlbmZvcmNlIGEgcHJvcGVyCm9yZGVyIGZvciB0aGUgY2FsbHMs
IGkuZS46IHByZXBhcmUoKSAtPiBlbmFibGUoKSAtPiBkaXNhYmxlKCkgLT4KdW5wcmVwYXJlKCku
CgpGb3IgZXhhbXBsZSwgZ2V0dGluZyBhIGNsayBhbmQgcmVwZWF0ZWRseSBkaXNhYmxpbmcgaXQg
aXMgYWxsb3dlZDoKCndoaWxlIHRydWUgewogIGNsay5kaXNhYmxlKCk7Cn0KClRoZXJlIGlzIGFs
c28gYSBwcm9ibGVtIG9mIGJhbGFuY2luZyB0aGUgcmVmY291bnRzLiBBcyB5b3UgY2FuIHNlZSBm
cm9tCnRoZSBleGFtcGxlIGFib3ZlLCBpdCBpcyB0cml2aWFsIHRvIGhhdmUgYSBkZWNyZW1lbnQg
d2l0aG91dCBhCmNvcnJlc3BvbmRpbmcgaW5jcmVtZW50LCBvciB0aGUgb3RoZXIgd2F5IGFyb3Vu
ZC4KCldoYXQgdGhpcyBzZXJpZXMgYWltcyB0byBkbyBpcyB1c2UgUnVzdCdzIHR5cGUgc3lzdGVt
IHRvIGFkZHJlc3MgdGhlIHR3bwpwb2ludHMgYWJvdmUgYnkgZW5mb3JjaW5nIGEgbGVnYWwgdHJh
bnNpdGlvbiBiZXR3ZWVuIHN0YXRlcyB1c2luZyBhCnNtYWxsIEZTTSB2aWEgdGhpcyAidHlwZXN0
YXRlIiB0ZWNobmlxdWUuIEFzIGEgYm9udXMsIHRoaXMgYWxzbyBzb2x2ZXMKdGhlIGJhbGFuY2lu
ZyBwcm9ibGVtLCBiZWNhdXNlIGVhY2ggc3RhdGUgb3ducyB0aGUgYXBwcm9wcmlhdGUgY291bnQu
CgpXaXRoIHRoaXMgc2VyaWVzLCB0aGUgYnJva2VuIGV4YW1wbGUgYWJvdmUgZG9lc27igJl0IGV2
ZW4gY29tcGlsZSBhbnltb3JlLgoKTm90ZSB0aGF0IHRha2luZyBtb3JlIHRoYW4gb25lIGNvdW50
IGlzIHN0aWxsIHBvc3NpYmxlLiBQYXRjaCA0IGFkZHMKZ3VhcmRzIGZvciB0aGF0OiBlYWNoIGVu
YWJsZV9ndWFyZCgpIGRvZXMgYSBjbGtfZW5hYmxlKCksIGFuZCB0aGUKbWF0Y2hpbmcgY2xrX2Rp
c2FibGUoKSBoYXBwZW5zIHdoZW4gdGhhdCBndWFyZCBnb2VzIGF3YXkuIFNvIHRoZQpzZXF1ZW5j
ZSB5b3UgcXVvdGVkIGNhbiBzdGlsbCBiZSB3cml0dGVuLiBXaGF0IHlvdSBjYW4gbm8gbG9uZ2Vy
IGRvIGlzCmNhbGwgZGlzYWJsZSgpIHdpdGhvdXQgaGF2aW5nIGNhbGxlZCBlbmFibGUoKSBmaXJz
dCwgb3IgZm9yZ2V0IHRvCnJlbGVhc2UgdGhlIHByZXBhcmUvZW5hYmxlZCBjb3VudHMgeW91IGFj
cXVpcmVkLgoKTm90aWNlIHRoYXQgdGhpcyBkb2Vzbid0LCBpbiBhbmQgb2YgaXRzZWxmLCBwcmVj
bHVkZSB0aGUgdXNhZ2Ugb2YgdGhlCm9sZCBBUEkuIFNvbWVvbmUgY2FuIGFkZCBhIG5ldyBzdGF0
ZSB0aGF0IGFsbG93cyB0aGUgb2xkIGJlaGF2aW9yLCBhcyBhCkNsazxVbmtub3duPiBvciBzb21l
IG90aGVyIG5hbWUsIGJ1dCBpZiBzbywgdGhleSBzaG91bGQgcHJvdmlkZSBhIHVzZXIsCmFuZCB3
ZSBzaG91bGQgX3JlYWxseV8gZW5zdXJlIHRoYXQgdGhlaXIgdXNlY2FzZSBjYW4ndCBiZSBhZGVx
dWF0ZWx5CmRlc2NyaWJlZCBieSB0aGUgc2FmZXIgQVBJIGFib3ZlLgoKU28gbm8sIEkgZG8gbm90
IHRoaW5rIGl0IGlzIGEgZGV2aWF0aW9uIGZyb20gQywgbW9yZSBsaWtlIGEgc2FmZXIKdmVuZWVy
LCBiZWNhdXNlIFJ1c3QgbWFrZXMgaXQgbXVjaCBlYXNpZXIgZm9yIHVzIHRvIHByb3ZpZGUgb25l
LgoKCgo+IAo+PiAKPj4gQW5kIG5vdGhpbmcgZ2V0cyB1bmRvbmUgb24gZHJvcCgpLgo+PiAKPj4g
YykgSXQgZG9lcyBub3QgbGV0IGEgdXNlciBleHByZXNzIHRoZSBzdGF0ZSBvZiB0aGUgY2xrIHRo
cm91Z2ggdGhlCj4+IHR5cGUgc3lzdGVtLiBGb3IgZXhhbXBsZSwgdGhlcmUgaXMgY3VycmVudGx5
IG5vIHdheSB0byBlbmNvZGUgdGhhdCBhIENsayBpcwo+PiBlbmFibGVkIHZpYSB0aGUgdHlwZSBz
eXN0ZW0gYWxvbmUuCj4+IAo+PiBGb2xsb3dpbmcgdGhlIFJlZ3VsYXRvciBhYnN0cmFjdGlvbiwg
c3dpdGNoIHRoaXMgYWJzdHJhY3Rpb24gdG8gdXNlIHRoZQo+PiB0eXBlLXN0YXRlIHBhdHRlcm4g
aW5zdGVhZC4gSXQgc29sdmVzIGJvdGggYSkgYW5kIGIpIGJ5IGVzdGFibGlzaGluZyBhCj4+IG51
bWJlciBvZiBzdGF0ZXMgYW5kIHRoZSB2YWxpZCB3YXlzIHRvIHRyYW5zaXRpb24gYmV0d2VlbiB0
aGVtLiBJdCBhbHNvCj4+IGF1dG9tYXRpY2FsbHkgdW5kb2VzIGFueSBjYWxsIHRvIGNsa19nZXQo
KSwgY2xrX3ByZXBhcmUoKSBhbmQgY2xrX2VuYWJsZSgpCj4+IGFzIGFwcGxpY2FibGUgb24gZHJv
cCgpLCBzbyB1c2VycyBkbyBub3QgaGF2ZSB0byBkbyBhbnl0aGluZyBzcGVjaWFsCj4+IGJlZm9y
ZSBDbGsgZ29lcyBvdXQgb2Ygc2NvcGUuCj4gCj4gU28gdGhlIHBvaW50IHRoZSBpcyBhdXRvbWF0
aWNhbGx5IGNsZWFuLXVwIChhcyBpbiBkaXNhYmxlKCkpIGNsb2NrIHdoZW4gdGhleQo+IGdvIG91
dCBvZiBzY29wZSA/IEluIEMsIHRoZSBlcXVpdmFsZW50IHdvdWxkIGJlIGNhbGxpbmcgY2xrX3B1
dCgpIHdpdGggYSBub24KPiBOVUxMIGVuYWJsZS9wcmVwYXJlIGNvdW50LiBXZSBkbyBjb21wbGFp
biBsb3VkbHkgd2hlbiB0aGlzIGhhcHBlbi4gSSBkb24ndAo+IHBlb3BsZSBzaG91bGQgZW5jb3Vy
YWdlZCB0byBub3QgYWN0aXZlbHkgY2FyZSBmb3IgdGhpcy4KPiAKPiAtLSAKPiBKZXJvbWUKCkFj
dHVhbGx5LCB0aGUgcG9pbnQgd291bGQgYmUgdG8gZm9yYmlkIHRoaXMgdXNpbmcgdGhlIHR5cGUg
c3lzdGVtLiBCeQp1c2luZyB0aGUgbmV3IHR5cGVzLCB0aGUgYWJzdHJhY3Rpb24ga25vd3Mgd2hp
Y2ggY291bnRzIGl0IG11c3QKcmVsZWFzZSBiZWZvcmUgY2FsbGluZyBjbGtfcHV0LgoKSU9XLCBh
IENsazxFbmFibGVkPiBrbm93cywgb24gZHJvcCwgdGhhdCBpdCBtdXN0IHJlbGVhc2Ugb25lIGNv
dW50IG9mCmVuYWJsZSwgYW5kIG9uZSBjb3VudCBvZiBwcmVwYXJlIGJlZm9yZSBjbGtfcHV0IGlz
IGNhbGxlZC4gQ2xrPFByZXBhcmVkPgprbm93cyBpdCBtdXN0IHJlbGVhc2Ugb25lIGNvdW50IG9m
IHByZXBhcmUgYmVmb3JlIGNsa19wdXQgaXMgY2FsbGVkLCBhbmQKQ2xrPFVucHJlcGFyZWQ+IGNh
biBzaW1wbHkgY2FsbCBjbGtfcHV0IGRpcmVjdGx5LiBUaGUgdHlwZSBzdGF0ZXMgbWFrZQp0aGUg
c2l0dWF0aW9uIHlvdSBkZXNjcmliZWQgdW5yZXByZXNlbnRhYmxlIGluIFJ1c3QuCgpUaGlzIGlz
IG5vdCBuZXcgb24gdGhlIEMgc2lkZSBlaXRoZXI6IGRldm1fY2xrX2dldF9lbmFibGVkKCkgYWxy
ZWFkeQpydW5zIGNsa19kaXNhYmxlX3VucHJlcGFyZSgpIGFuZCBjbGtfcHV0KCkgb24gaXRzIG93
biB3aGVuIHRoZSBkZXZpY2UKaXMgdW5ib3VuZC4gSGVyZSB0aGUgc2FtZSBoYXBwZW5zIHdoZW4g
dGhlIHZhbHVlIGdvZXMgYXdheS4KCuKAlCBEYW5pZWwKCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgt
cmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
