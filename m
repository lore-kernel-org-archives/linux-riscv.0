Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB6FDD6D224
	for <linux-riscv@archiver.kernel.org>; Thu, 18 Dec 2025 14:14:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:References:Message-Id:Cc:Date:
	In-Reply-To:From:Subject:Mime-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=S6wfjU11MRsZlcD8Uuv9iM8dwiEs6jNie4anLsylYsM=; b=OGE/kZEhYvP6hl
	6uuHZk3sVBft3YorTd9D4lAZC2UdlbeOLQlnixP4PqnsynMZvJpguWrQMKHTjP4Vq5/B8VPRUErgH
	F9rxIkauC3/J11nuV+BtAO4/33Mh4PyMn5rgTtB6211t4JwJXEELGiwZuqkvPRrEieFeFJ4hU9/aG
	oM0He/xqIx3Osw/lFcWsswLDr9ovRJ+1GKIVm1VI1clDs2cGKOiGI/cdCyt47OFPqs9eupVtyoNek
	bD0Y4bPvTayEuPl1j3S97X59+1a8hGakERBs3ahGSEXaQs/KKJTF3PlEYMvPKxRES62LwynJss4AF
	yO5IAiPVGYvJUSfx5aQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWElM-00000008b9b-2TlM;
	Thu, 18 Dec 2025 14:13:52 +0000
Received: from sender4-pp-f112.zoho.com ([136.143.188.112])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWElK-00000008b9C-15dQ
	for linux-riscv@lists.infradead.org;
	Thu, 18 Dec 2025 14:13:51 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1766067215; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=ZfZ5eleqm2voe9kdBmI29PO93f6wUqNN+f+iNvaUPk8j0MQkYiZsUm7xjLxcPFJhamCZawnVpyEXadmEQIimTx8lJBojOIBCJDlbhhZnKwIvZuMzC4r35vY2TUt0SzxTf1lH8c3VeGI8tgkw9gALjFH7uPSGDihmQcqCfLrSapY=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1766067215; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=no1MqqNDxu5c0uKxqGvlCaZMIOJT2Yq6Z/VFFh5qh14=; 
	b=NCMMHMrpnC23X5ooOFnvzDSX292dqZ0nI8QO0yLgGMt9xzkqf/5qqKEid7BYenKrwirwcnqtdvkI0duCtJSlmilIQLnSlALeK26kGBbUfp344wKwQirVG5NwaylGb4/KskjaCJ+7oW7xf35ImlBvh6c9H7/SoH4GKTze/Wq7qN8=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=daniel.almeida@collabora.com;
	dmarc=pass header.from=<daniel.almeida@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1766067215;
	s=zohomail; d=collabora.com; i=daniel.almeida@collabora.com;
	h=Content-Type:Mime-Version:Subject:Subject:From:From:In-Reply-To:Date:Date:Cc:Cc:Content-Transfer-Encoding:Message-Id:Message-Id:References:To:To:Reply-To;
	bh=no1MqqNDxu5c0uKxqGvlCaZMIOJT2Yq6Z/VFFh5qh14=;
	b=TnnWI1TWhy8QqVml3H3a2+y2hyNOpCTtFnbBqqF1pm1SAOhpTJP54CW/IiwoO//N
	EokaIaqcPt2SXdQQHnerGjVOmo3A3ZAI47srDoaNpa/BDWBf+7ai2zOntYDntd/D1s7
	WbbfHOk5SX9lzARgVHCacnRUVZsbKpwtGB26H9tc=
Received: by mx.zohomail.com with SMTPS id 1766067213618777.221126799302;
	Thu, 18 Dec 2025 06:13:33 -0800 (PST)
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.700.81\))
Subject: Re: [PATCH v3 0/3] Implement Send and Sync for clk
From: Daniel Almeida <daniel.almeida@collabora.com>
In-Reply-To: <20251218-clk-send-sync-v3-0-e48b2e2f1eac@google.com>
Date: Thu, 18 Dec 2025 11:13:14 -0300
Cc: Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Drew Fustini <fustini@kernel.org>,
 Guo Ren <guoren@kernel.org>,
 Fu Wei <wefu@redhat.com>,
 =?utf-8?Q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@kernel.org>,
 Michal Wilczynski <m.wilczynski@samsung.com>,
 Viresh Kumar <viresh.kumar@linaro.org>,
 Miguel Ojeda <ojeda@kernel.org>,
 Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>,
 =?utf-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>,
 Andreas Hindborg <a.hindborg@kernel.org>,
 Trevor Gross <tmgross@umich.edu>,
 Danilo Krummrich <dakr@kernel.org>,
 linux-clk@vger.kernel.org,
 rust-for-linux@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 linux-riscv@lists.infradead.org,
 linux-pwm@vger.kernel.org
Message-Id: <59982B51-0CCF-46CB-9DF1-2A5BE3645636@collabora.com>
References: <20251218-clk-send-sync-v3-0-e48b2e2f1eac@google.com>
To: Alice Ryhl <aliceryhl@google.com>
X-Mailer: Apple Mail (2.3826.700.81)
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251218_061350_349266_A8BA45EE 
X-CRM114-Status: GOOD (  14.24  )
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

Cgo+IE9uIDE4IERlYyAyMDI1LCBhdCAxMDoyNywgQWxpY2UgUnlobCA8YWxpY2VyeWhsQGdvb2ds
ZS5jb20+IHdyb3RlOgo+IAo+IFRoZSBDbGsgdHlwZSBpcyB0aHJlYWQtc2FmZSwgc28gbGV0J3Mg
bWFyayBpdCBhcyB0aHJlYWQtc2FmZSBpbiB0aGUgdHlwZQo+IHN5c3RlbS4gVGhpcyBsZXRzIHVz
IGdldCByaWQgb2YgaGFja3MgaW4gZHJpdmVycy4KPiAKPiBGb3IgU3RlcGhlbidzIGNsayB0cmVl
Lgo+IAo+IFNpZ25lZC1vZmYtYnk6IEFsaWNlIFJ5aGwgPGFsaWNlcnlobEBnb29nbGUuY29tPgo+
IC0tLQo+IENoYW5nZXMgaW4gdjM6Cj4gLSBSZWJhc2Ugb24gdjYuMTktcmMxLgo+IC0gUGljayB1
cCB0YWdzLgo+IC0gQWRkIGZpeCBmb3IgcHdtIGRyaXZlciBhcyB3ZWxsLgo+IC0gTGluayB0byB2
MjogaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvci8yMDI1MTAyMC1jbGstc2VuZC1zeW5jLXYyLTAt
NDRhYjUzM2FlMDg0QGdvb2dsZS5jb20KPiAKPiBDaGFuZ2VzIGluIHYyOgo+IC0gUmViYXNlIG9u
IHY2LjE4LXJjMS4KPiAtIEFkZCBwYXRjaCB0byB0eXIgZHJpdmVyLgo+IC0gTGluayB0byB2MTog
aHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvci8yMDI1MDkwNC1jbGstc2VuZC1zeW5jLXYxLTEtNDhk
MDIzMzIwZWI4QGdvb2dsZS5jb20KPiAKPiAtLS0KPiBBbGljZSBSeWhsICgzKToKPiAgICAgIHJ1
c3Q6IGNsazogaW1wbGVtZW50IFNlbmQgYW5kIFN5bmMKPiAgICAgIHR5cjogcmVtb3ZlIGltcGwg
U2VuZC9TeW5jIGZvciBUeXJEYXRhCj4gICAgICBwd206IHRoMTUyMDogcmVtb3ZlIGltcGwgU2Vu
ZC9TeW5jIGZvciBUaDE1MjBQd21Ecml2ZXJEYXRhCj4gCj4gZHJpdmVycy9ncHUvZHJtL3R5ci9k
cml2ZXIucnMgfCAxMiAtLS0tLS0tLS0tLS0KPiBkcml2ZXJzL3B3bS9wd21fdGgxNTIwLnJzICAg
ICB8IDE1IC0tLS0tLS0tLS0tLS0tLQo+IHJ1c3Qva2VybmVsL2Nsay5ycyAgICAgICAgICAgIHwg
IDcgKysrKysrKwo+IDMgZmlsZXMgY2hhbmdlZCwgNyBpbnNlcnRpb25zKCspLCAyNyBkZWxldGlv
bnMoLSkKPiAtLS0KPiBiYXNlLWNvbW1pdDogOGYwYjRjY2U0NDgxZmIyMjY1MzY5N2NjZWQ4ZDBk
MDQwMjdjYjFlOAo+IGNoYW5nZS1pZDogMjAyNTA5MDQtY2xrLXNlbmQtc3luYy0zY2ZhN2Y0ZTFj
ZTIKPiAKPiBCZXN0IHJlZ2FyZHMsCj4gLS0gCj4gQWxpY2UgUnlobCA8YWxpY2VyeWhsQGdvb2ds
ZS5jb20+Cj4gCgpJIHRob3VnaHQgdGhpcyBoYWQgbGFuZGVkIGFscmVhZHkuCgpJ4oCZbGwgcmVz
dW1lIG15IG92ZXJoYXVsIG9mIGNsayAucnMgZHVyaW5nIHRoaXMgY3ljbGUgYnkgdGhlIHdheS4K
CkZvciBwYXRjaCAzOgoKUmV2aWV3ZWQtYnk6IERhbmllbCBBbG1laWRhIDxkYW5pZWwuYWxtZWlk
YUBjb2xsYWJvcmEuY29tPgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZy
YWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGlu
dXgtcmlzY3YK
