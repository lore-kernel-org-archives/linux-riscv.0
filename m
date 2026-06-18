Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8709FCD98DE
	for <linux-riscv@archiver.kernel.org>; Thu, 18 Jun 2026 03:48:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=76EY8/KeHybz0c/9e7JfsixAuFhBsJQZB6KFUK1GA18=; b=JdiETBksf7u64+
	wEpBOCPrmLgBinshrnE7UK9KO5gXjyooe6MqRLPtmBBWaaSJjG3XBoAJV2HEZBaqsERO9MndWeT4U
	g08RpmEvAYoyb56Zpu20SEpHre+uKG/Oxk3/+WdgiwceN8LFH15rYNjmKHwhQJ+1craCdzZjdPtHY
	OUOU22H6r1e6l2Z52aKYnwkvqtKAPaaqEzsfoj79ct++FN8fmQ93vepj6LDR44yMj/bJyS54k+TKv
	/xaO0m0F3nGVVjZ70Ejx39HVeGh3k01qaSyD9kY9okbUm+Wl5Xp6f8b+8kmEHQiMxJ3dVnmCCi705
	BPYn7pDbZBTKuh8i4iNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wa3jt-00000000a2y-11K0;
	Thu, 18 Jun 2026 03:48:25 +0000
Received: from sender4-op-o11.zoho.com ([136.143.188.11])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wa3jo-00000000a2M-1pdm
	for linux-riscv@lists.infradead.org;
	Thu, 18 Jun 2026 03:48:23 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1781754477; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=BiSkO6X+CbSlyyv0PKWuBOBKBoJmBDBicT4zKkw9qKECHs/xzC+TrUR4g5ZjKsZ7UbiE/lSQI+riGcCdE2fR+WPH9U25hzFBcmiuTwg0dD4Wf+Rm8b3m3gqll8jIIWJHnyNYiU02KGBdIPv38MtP/q5SySm0H9dLAE9TN6ZAkgg=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1781754477; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=a/FAuDcMrWGnOcei28EPEPjKA2Es2+JGZ7eG60Xhc2o=; 
	b=Jzd+1ym5YIPHuJ1poP7RIsrqz2mE/cGEZfwakFIPf0ETEdyCGBgP4JwgY/F3sHdAEGhJZfVh0/FGL3Yc2j5g0f7PpideF7GX4Htxat4sh1GodcN9Ft02aUPg+wfiEV+M1IRga6pPDg4EPEUPBktFmn8OdmrPC0vGHyc8b2aztOA=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=daniel.almeida@collabora.com;
	dmarc=pass header.from=<daniel.almeida@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1781754477;
	s=zohomail; d=collabora.com; i=daniel.almeida@collabora.com;
	h=From:From:Subject:Subject:Date:Date:Message-Id:Message-Id:MIME-Version:Content-Type:Content-Transfer-Encoding:To:To:Cc:Cc:Reply-To;
	bh=a/FAuDcMrWGnOcei28EPEPjKA2Es2+JGZ7eG60Xhc2o=;
	b=DfzxTsaUd3L6p936K2c7mZaX6NLwGPbFNWt8O68s6IqAdOfgLVUD91pVOyH7ciUq
	OlPyHdHOWWwqPtQSUQ0kTE5bKaL+Fa9HouutzU0w6/OeeKJ5CTKf8hKyAXlI2kHK15V
	KASwqBk0kUJ1KAEpbaQcfFO90zPA9bpSBnGeg88E=
Received: by mx.zohomail.com with SMTPS id 1781754475220300.17079620644984;
	Wed, 17 Jun 2026 20:47:55 -0700 (PDT)
From: Daniel Almeida <daniel.almeida@collabora.com>
Subject: [PATCH v4 0/3] Clk improvements
Date: Thu, 18 Jun 2026 00:46:34 -0300
Message-Id: <20260618-clk-type-state-v4-0-8be082786080@collabora.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/6XQTW7DIBAF4KtErDsVA8WErHqPqgt+xjGqE1KgV
 qPIdy9OWlWKl1m+xftg3oUVypEK220uLNMUS0zHFl6eNswP9rgniKFlJrhQ3HADfvyAej4RlGo
 rgedorQ5BKQyslU6Z+vh9Bd/eW+5zOkAdMtl/RosVMyEgbE3nlNxi12v36tM4WpeyffbpsMhDL
 DXl8/Wnk1j8R7TbPchXVQEc0BntEZ3rJN5Vl5sm+fd6x5HrFSEboXWQJImU8eKemG87Zfr8anv
 X37Hm+QcRS4DljQEAAA==
X-Change-ID: 20250909-clk-type-state-c01aa7dd551d
To: "Rafael J. Wysocki" <rafael@kernel.org>, 
 Viresh Kumar <viresh.kumar@linaro.org>, Danilo Krummrich <dakr@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Drew Fustini <fustini@kernel.org>, Guo Ren <guoren@kernel.org>, 
 Fu Wei <wefu@redhat.com>, 
 =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
 Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Trevor Gross <tmgross@umich.edu>, 
 Daniel Almeida <daniel.almeida@collabora.com>, 
 Michal Wilczynski <m.wilczynski@samsung.com>, 
 Brian Masney <bmasney@redhat.com>, Boqun Feng <boqun@kernel.org>, 
 Boqun Feng <boqun@kernel.org>
Cc: linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linux-riscv@lists.infradead.org, 
 linux-pwm@vger.kernel.org, linux-clk@vger.kernel.org, 
 rust-for-linux@vger.kernel.org, 
 Boris Brezillon <boris.brezillon@collabora.com>
X-Mailer: b4 0.15.2
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260617_204820_515766_5C40F901 
X-CRM114-Status: GOOD (  18.29  )
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

VGhpcyBzZXJpZXMgY29udGFpbnMgYSBmZXcgaW1wcm92ZW1lbnRzIHRoYXQgc2ltcGxpZmllcyBj
bG9jayBoYW5kbGluZyBmb3IKZHJpdmVycy4KClBhdGNoIDEgaW1wbGVtZW50cyB0aGUgc2FtZSB0
eXBlc3RhdGUgcGF0dGVybiB0aGF0IGhhcyBiZWVuIHVzZWQKc3VjY2Vzc2Z1bGx5IGZvciBSZWd1
bGF0b3JzLiBUaGlzIGlzIG5lZWRlZCBiZWNhdXNlIG90aGVyd2lzZSBkcml2ZXJzCndpbGwgYmUg
cmVzcG9uc2libGUgZm9yIHVucHJlcGFyaW5nIGFuZCBkaXNhYmxpbmcgY2xvY2tzIHRoZW1zZWx2
ZXMgYW5kCnVsdGltYXRlbHkgaGFuZGxpbmcgdGhlIHJlZmVyZW5jZSBjb3VudHMgb24gdGhlaXIg
b3duLiBUaGlzIGlzCnVuZGVzaXJhYmxlLiBUaGUgcGF0Y2ggYXV0b21hdGljYWxseSBlbmNvZGVz
IHRoaXMgaW5mb3JtYXRpb24gdXNpbmcgdGhlCnR5cGUgc3lzdGVtIHNvIHRoYXQgbm8gbWlzdXNl
IGNhbiBvY2N1ci4KClBhdGNoIDIgbWFrZXMgdGhpbmdzIG1vcmUgY29udmVuaWVudCBieSBvZmZl
cmluZyBkZXZyZXMtbWFuYWdlZCBBUElzLiBUaGlzCmxldHMgZHJpdmVycyBzZXQgY2xvY2sgcGFy
YW1ldGVycyBvbmNlIGFuZCBmb3JnZXQgYWJvdXQgbGlmZXRpbWUKbWFuYWdlbWVudC4KClBhdGNo
IDMgY29udmVydHMgY2xrLnJzIHRvIHRoZSBuZXdlciBrZXJuZWwtdmVydGljYWwgc3R5bGUgaW4g
b3JkZXIgdG8gbWFrZQpmdXR1cmUgY2hhbmdlcyBlYXNpZXIuCgpBbGljZSBSeWhsJ3MgInJ1c3Q6
IGNsazogaW1wbGVtZW50IFNlbmQgYW5kIFN5bmMiIHNlcmllcywgd2hpY2ggdGhpcyB1c2VkIHRv
CmRlcGVuZCBvbiwgaGFzIHNpbmNlIGJlZW4gbWVyZ2VkLCBzbyB0aGlzIHNlcmllcyBub3cgYXBw
bGllcyBkaXJlY3RseSBvbgpjbGstbmV4dC4KCi0tLQpDaGFuZ2VzIGluIHY0OgotIFJlYmFzZWQg
b250byBjbGstbmV4dC4gQWxpY2UgUnlobCdzICJydXN0OiBjbGs6IGltcGxlbWVudCBTZW5kIGFu
ZCBTeW5jIgogIHNlcmllcyBpcyBub3cgbWVyZ2VkIHVwc3RyZWFtLCBzbyBpdCBpcyBubyBsb25n
ZXIgY2FycmllZCBhcyBhIGRlcGVuZGVuY3kuCi0gRml4ZWQgdGhlIGJ1aWxkIHdpdGggQ09ORklH
X0NQVUZSRVFfRFRfUlVTVD15LiBUaGUgZ2VuZXJpYyBEVCBjcHVmcmVxCiAgZHJpdmVyIG9ubHkg
aGFzIHRoZSAodW5ib3VuZCkgcGVyLUNQVSBkZXZpY2UsIHNvIGl0IGNhbm5vdCBoYW5kIGEKICAm
RGV2aWNlPEJvdW5kPiB0byBQb2xpY3k6OnNldF9jbGsoKS4gQWRkZWQgYSBwdWIoY3JhdGUpIENs
azo6Z2V0X3VuYm91bmQoKQogIGZvciB0aGUgZmV3IGluLXRyZWUgYWJzdHJhY3Rpb25zIHRoYXQg
b3BlcmF0ZSBvbiBhIGRldmljZSBvdXRzaWRlIGEgYmluZAogIHNjb3BlOyBzZXRfY2xrKCkgbm93
IHRha2VzICZEZXZpY2UgYW5kIHVzZXMgaXQuIENsazo6Z2V0KCkvZ2V0X29wdGlvbmFsKCkKICBh
bmQgdGhlIGRldm1fKiBoZWxwZXJzIHN0aWxsIHJlcXVpcmUgJkRldmljZTxCb3VuZD4uCi0gQWRk
ZWQgaW1wbCBGcm9tPEVycm9yPFN0YXRlPj4gZm9yIGtlcm5lbDo6ZXJyb3I6OkVycm9yLCBzbyB0
aGUgZmFsbGlibGUKICBzdGF0ZSB0cmFuc2l0aW9ucyBjYW4gYmUgdXNlZCB3aXRoIGA/YCAoYW5k
IGNoYWluZWQpIGluc3RlYWQgb2YKICAubWFwX2Vycih8ZXwgZS5lcnJvcikuCi0gQWRkZWQgQ2xr
Ojo8UHJlcGFyZWQ+Ojp3aXRoX2VuYWJsZWQoKSwgd2hpY2ggcnVucyBhIGNsb3N1cmUgd2l0aCB0
aGUgY2xvY2sKICB0ZW1wb3JhcmlseSBlbmFibGVkLCBzY29waW5nIHRoZSBFbmFibGVkIHN0YXRl
IHdpdGhvdXQgZ2l2aW5nIHVwIHRoZQogIHByZXBhcmVkIGNsb2NrLgotIERvY3VtZW50ZWQgaG93
IHRvIGNoYW5nZSBhIGNsb2NrJ3Mgc3RhdGUgYXQgcnVudGltZSB2aWEgYW4gZW51bSwgZm9yCiAg
ZHJpdmVycyB0aGF0IGVuYWJsZS9kaXNhYmxlIGFjcm9zcyByZXN1bWUvc3VzcGVuZC4KLSBMaW5r
IHRvIHYzOiBodHRwczovL2xvcmUua2VybmVsLm9yZy9yLzIwMjYwMTA3LWNsay10eXBlLXN0YXRl
LXYzLTAtNzdkM2UzZWU1OWMyQGNvbGxhYm9yYS5jb20KCkNoYW5nZXMgaW4gdjM6Ci0gUmViYXNl
ZCBvbiB0b3Agb2YgNi4xOS1yYzQKLSBEcm9wcGVkIHBhdGNoIDEgKGZyb20gQWxpY2UpLCBhZGRl
ZCBoZXIgc2VyaWVzIGFzIGEgZGVwZW5kZW5jeSBpbnN0ZWFkCi0gRml4ZWQgVHlyLCBQV01fVEgx
NTIwIGRyaXZlcnMKLSBDaGFuZ2VkIGNsay5ycyBpbXBvcnRzIHRvIGtlcm5lbC12ZXJ0aWNhbCBz
dHlsZQotIEFkZGVkIHN1cHBvcnQgZ2V0X29wdGlvbmFsIHNob3J0Y3V0IGZvciBQcmVwYXJlZCBh
bmQgRW5hYmxlZCAoaS5lLjoKICBDbGs6OjxFbmFibGVkPjo6Z2V0X29wdGlvbmFsKCkpCi0gRml4
ZWQgbWlzcGxhY2VkICNbaW5saW5lXSB0YWcKClRoYW5rcywgRGFuaWxvIHsKICAtIE1vdmVkIHRo
ZSBkZXZyZXMgY2hhbmdlcyBpbnRvIGl0cyBvd24gcGF0Y2gKICAtIFJlcXVpcmUgJkRldmljZTxC
b3VuZD4gZm9yIGFsbCBmdW5jdGlvbnMgd2hlcmUgYSAmRGV2aWNlIGlzIHVzZWQKICAtIEFjY291
bnQgZm9yIGNvbl9pbiBpbiBTQUZFVFkgY29tbWVudHMgd2hlcmUgYXBwbGljYWJsZQogIC0gQWRk
ZWQgYmFja3RpY2tzCn0KCi0gTGluayB0byB2MjogaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvci8y
MDI1MDkxMC1jbGstdHlwZS1zdGF0ZS12Mi0wLTFiOTdjMTFiYjYzMUBjb2xsYWJvcmEuY29tCgpD
aGFuZ2VzIGluIHYyOgotIEFkZGVkIEFsaWNlJ3MgcGF0Y2ggYXMgcGF0Y2ggMSwgc2luY2UgaXQg
aXMgYSBkZXBlbmRlbmN5LgotIEFkZGVkIGRldm0gaGVscGVycyAobGlrZSB3ZSBkaWQgZm9yIFJl
Z3VsYXRvcjxUPikKLSBGaXhlZCBtaXNzaW5nIGNsa19wdXQoKSBjYWxsIGluIERyb3AgKERhbmls
bykKLSBGaXhlZCBtaXNzaW5nIHBhcmVudGhlc2lzIGFuZCB3cm9uZyBkb2NzIChWaXJlc2gpCi0g
UmVtb3ZlZCBleHRyYSAiZGV2IiBwYXJhbWV0ZXIgZnJvbSAic2h1dGRvd24iIGV4YW1wbGUgKERh
bmlsbykKLSBSZW1vdmVkIHVzZWxlc3MgdHlwZSBhbm5vdGF0aW9uIGZyb20gZXhhbXBsZSAoRGFu
aWxvKQotIExpbmsgdG8gdjE6IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL3J1c3QtZm9yLWxpbnV4
LzIwMjUwNzI5LWNsay10eXBlLXN0YXRlLXYxLTEtODk2YjUzODE2ZjdiQGNvbGxhYm9yYS5jb20v
I3IKClRvOiAiUmFmYWVsIEouIFd5c29ja2kiIDxyYWZhZWxAa2VybmVsLm9yZz4KVG86IFZpcmVz
aCBLdW1hciA8dmlyZXNoLmt1bWFyQGxpbmFyby5vcmc+ClRvOiBEYW5pbG8gS3J1bW1yaWNoIDxk
YWtyQGtlcm5lbC5vcmc+ClRvOiBBbGljZSBSeWhsIDxhbGljZXJ5aGxAZ29vZ2xlLmNvbT4KVG86
IERhbmllbCBBbG1laWRhIDxkYW5pZWwuYWxtZWlkYUBjb2xsYWJvcmEuY29tPgpUbzogRGF2aWQg
QWlybGllIDxhaXJsaWVkQGdtYWlsLmNvbT4KVG86IFNpbW9uYSBWZXR0ZXIgPHNpbW9uYUBmZnds
bC5jaD4KVG86IERyZXcgRnVzdGluaSA8ZnVzdGluaUBrZXJuZWwub3JnPgpUbzogR3VvIFJlbiA8
Z3VvcmVuQGtlcm5lbC5vcmc+ClRvOiBGdSBXZWkgPHdlZnVAcmVkaGF0LmNvbT4KVG86IE1pY2hh
bCBXaWxjenluc2tpIDxtLndpbGN6eW5za2lAc2Ftc3VuZy5jb20+ClRvOiBVd2UgS2xlaW5lLUvD
tm5pZyA8dWtsZWluZWtAa2VybmVsLm9yZz4KVG86IE1pY2hhZWwgVHVycXVldHRlIDxtdHVycXVl
dHRlQGJheWxpYnJlLmNvbT4KVG86IFN0ZXBoZW4gQm95ZCA8c2JveWRAa2VybmVsLm9yZz4KVG86
IEJyaWFuIE1hc25leSA8Ym1hc25leUByZWRoYXQuY29tPgpUbzogTWlndWVsIE9qZWRhIDxvamVk
YUBrZXJuZWwub3JnPgpUbzogQm9xdW4gRmVuZyA8Ym9xdW5Aa2VybmVsLm9yZz4KVG86IEdhcnkg
R3VvIDxnYXJ5QGdhcnlndW8ubmV0PgpUbzogQmrDtnJuIFJveSBCYXJvbiA8Ympvcm4zX2doQHBy
b3Rvbm1haWwuY29tPgpUbzogQmVubm8gTG9zc2luIDxsb3NzaW5Aa2VybmVsLm9yZz4KVG86IEFu
ZHJlYXMgSGluZGJvcmcgPGEuaGluZGJvcmdAa2VybmVsLm9yZz4KVG86IFRyZXZvciBHcm9zcyA8
dG1ncm9zc0B1bWljaC5lZHU+CkNjOiBsaW51eC1wbUB2Z2VyLmtlcm5lbC5vcmcKQ2M6IGxpbnV4
LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmcKQ2M6IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5v
cmcKQ2M6IGxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKQ2M6IGxpbnV4LXB3bUB2Z2Vy
Lmtlcm5lbC5vcmcKQ2M6IGxpbnV4LWNsa0B2Z2VyLmtlcm5lbC5vcmcKQ2M6IHJ1c3QtZm9yLWxp
bnV4QHZnZXIua2VybmVsLm9yZwpDYzogQm9yaXMgQnJlemlsbG9uIDxib3Jpcy5icmV6aWxsb25A
Y29sbGFib3JhLmNvbT4KCi0tLQpEYW5pZWwgQWxtZWlkYSAoMyk6CiAgICAgIHJ1c3Q6IGNsazog
dXNlIHRoZSB0eXBlLXN0YXRlIHBhdHRlcm4KICAgICAgcnVzdDogY2xrOiBhZGQgZGV2cmVzLW1h
bmFnZWQgY2xrcwogICAgICBydXN0OiBjbGs6IHVzZSAna2VybmVsIHZlcnRpY2FsIHN0eWxlJyBm
b3IgaW1wb3J0cwoKIGRyaXZlcnMvY3B1ZnJlcS9yY3B1ZnJlcV9kdC5ycyB8ICAgMiArLQogZHJp
dmVycy9ncHUvZHJtL3R5ci9kcml2ZXIucnMgIHwgIDMxICstLQogZHJpdmVycy9wd20vcHdtX3Ro
MTUyMC5ycyAgICAgIHwgIDE3ICstCiBydXN0L2tlcm5lbC9jbGsucnMgICAgICAgICAgICAgfCA1
OTUgKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKy0tLS0tLS0tLS0KIHJ1c3Qva2VybmVs
L2NwdWZyZXEucnMgICAgICAgICB8ICAgOCArLQogNSBmaWxlcyBjaGFuZ2VkLCA0NzcgaW5zZXJ0
aW9ucygrKSwgMTc2IGRlbGV0aW9ucygtKQotLS0KYmFzZS1jb21taXQ6IDhkMDNjYzQyYTQyYjFh
M2YxNTM1NzU3ZjY1YmZiNzRhOTc1Mzk1M2YKY2hhbmdlLWlkOiAyMDI1MDkwOS1jbGstdHlwZS1z
dGF0ZS1jMDFhYTdkZDU1MWQKCkJlc3QgcmVnYXJkcywKLS0gIApEYW5pZWwgQWxtZWlkYSA8ZGFu
aWVsLmFsbWVpZGFAY29sbGFib3JhLmNvbT4KCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZA
bGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2xpbnV4LXJpc2N2Cg==
