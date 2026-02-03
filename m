Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33A9DE7FDCF
	for <linux-riscv@archiver.kernel.org>; Tue,  3 Feb 2026 19:27:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:References:Message-Id:Cc:Date:
	In-Reply-To:From:Subject:Mime-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jjQpJ541WEHoryDgMb4wyxAuIjZnNHEDL5WWh6M3CZg=; b=Ls+zhai6rbhMn/
	IKleJvW/Y9ekh1ZS++ZX5yuve60RnN3D9aRn+u3IHRbWmRUZ4EKiky7gDyKR+my5r9wzfz1ZfUR6B
	PVZBRimXmpmFevHmzrWI6T7IzaADN2TKcvFE96bB4UaJAf3Fm4XLSwDTjGASn87jWHYl+MjlJSxQB
	xC7HE88qVNM9YpiR2OAk5P+enr99m2K9PFY3kkmwoX8vWWMk+C0wjhzsrnnfC4mHNX2kvvU2o5Ng4
	+qJ2jWK0Rb+j0N9aXFvdP6nxp1r0lNrJqm4n8yv2dxRVsNoKNjPzj9D7SUjVAeQqEeMvIjXQN9Y/L
	47V1CKxmtjlbJ+Z13T8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnM3A-00000007EtS-3Wfg;
	Tue, 03 Feb 2026 19:27:00 +0000
Received: from sender4-pp-f112.zoho.com ([136.143.188.112])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnM39-00000007Et9-0Icv
	for linux-riscv@lists.infradead.org;
	Tue, 03 Feb 2026 19:27:00 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1770146803; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=jArGcWPUvr51HjSndXkxQsFSFBo/XWpFDH8zP7rcBIuN85VPd+cDfJ5IhBLQ0hpiD6/o6GRPoB6KiJeYlI3Tk9ZCMgsaa0Fv1ZG6sCRrZ7J6z+w3CFwfQXuZOvOoJxSMFREAZo2LgKDYf9Ix/5Js/JecLAhX4CSn8uaffhF5x4s=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1770146803; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=Ir2ovejfXxhACKMa1+xrpKhVj5sNO/6JMxcXVd/x19E=; 
	b=nqkXgNLF0rTg1cIEafpsgKTpHeK0k81+fRUZ09Xg3b2W04sspv2jbfqwZkj3YMJGznFkRt0+HPG0okOY6s1xheNVUfp0m3+qa8RRJEYfySKUDmv8oEg+clCbF+/9WFPcCXYPGs8J0uahSrAH4qnXUn8ZD2vSwPtHtdUq2p592bY=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=daniel.almeida@collabora.com;
	dmarc=pass header.from=<daniel.almeida@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1770146803;
	s=zohomail; d=collabora.com; i=daniel.almeida@collabora.com;
	h=Content-Type:Mime-Version:Subject:Subject:From:From:In-Reply-To:Date:Date:Cc:Cc:Content-Transfer-Encoding:Message-Id:Message-Id:References:To:To:Reply-To;
	bh=Ir2ovejfXxhACKMa1+xrpKhVj5sNO/6JMxcXVd/x19E=;
	b=CNUreKwLIxNpQqS6Nj9US9lMrHuJkvgZCvFSHXY1lVHLShfQqCg/yIFEepMsIS7y
	XhaDRxH2YnusRbxNVwmbr4Z4GY99Fa2dmgk3+NvThoCutRDDUag+mlWXIIxrzRCmKai
	PfdR428k3dIrrI6qrK4xQYpSmECTZbJR6kBgdaPw=
Received: by mx.zohomail.com with SMTPS id 1770146801318166.33115821304864;
	Tue, 3 Feb 2026 11:26:41 -0800 (PST)
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.700.81\))
Subject: Re: [PATCH v3 1/3] rust: clk: use the type-state pattern
From: Daniel Almeida <daniel.almeida@collabora.com>
In-Reply-To: <DG5HJPIYMS7B.152WPGG9MZZJ5@garyguo.net>
Date: Tue, 3 Feb 2026 16:26:22 -0300
Cc: Boris Brezillon <boris.brezillon@collabora.com>,
 Alice Ryhl <aliceryhl@google.com>,
 Maxime Ripard <mripard@kernel.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 Viresh Kumar <viresh.kumar@linaro.org>,
 Danilo Krummrich <dakr@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>,
 Drew Fustini <fustini@kernel.org>,
 Guo Ren <guoren@kernel.org>,
 Fu Wei <wefu@redhat.com>,
 =?utf-8?Q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>,
 Miguel Ojeda <ojeda@kernel.org>,
 Boqun Feng <boqun.feng@gmail.com>,
 =?utf-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>,
 Andreas Hindborg <a.hindborg@kernel.org>,
 Trevor Gross <tmgross@umich.edu>,
 linux-pm@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 linux-riscv@lists.infradead.org,
 linux-pwm@vger.kernel.org,
 linux-clk@vger.kernel.org,
 rust-for-linux@vger.kernel.org
Message-Id: <B94452FD-5F6F-44D4-80D8-4D4B7004C4B5@collabora.com>
References: <20260107-clk-type-state-v3-0-77d3e3ee59c2@collabora.com>
 <20260107-clk-type-state-v3-1-77d3e3ee59c2@collabora.com>
 <20260108-delectable-fennec-of-sunshine-ffca19@houat>
 <98CD0BF6-3350-40B9-B8A9-F569AE3E3220@collabora.com>
 <20260119-thundering-tested-robin-4be817@houat> <aW4lCfUyumOKRRJm@google.com>
 <20260203113902.501e5803@fedora>
 <E7286D12-0BD9-4726-B072-FE5A040312B1@collabora.com>
 <20260203150855.77c93e22@fedora>
 <4DD13AE1-C85F-450F-93F2-C7C75766E518@collabora.com>
 <DG5HJPIYMS7B.152WPGG9MZZJ5@garyguo.net>
To: Gary Guo <gary@garyguo.net>
X-Mailer: Apple Mail (2.3826.700.81)
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260203_112659_200464_7AA78C57 
X-CRM114-Status: UNSURE (   8.73  )
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

Cj4gCj4gSSB0aGluayBpdCdzIGZpbmUgdG8gaGF2ZSBhbGwgb2YgdGhlc2U6Cj4gKiBgQ2xvbmVg
IGltcGwKPiAqIGBlbmFibGVgIHdoaWNoIGNvbnN1bWVzIGBDbGs8UHJlcGFyZWQ+YCBieSB2YWx1
ZSBhbmQgc3BpdCBvdXQgYENsazxFbmFibGVkPmAKPiAqIGB3aXRoX2VuYWJsZWRgIHRoYXQgZ2l2
ZXMgYCZDbGs8RW5hYmxlZD5gCj4gCj4gVGhpcyB3YXksIGlmIHlvdSBvbmx5IHdhbnQgdG8gZW5h
YmxlIGluIHNob3J0IHRpbWUsIHlvdSBjYW4gZG8gYHdpdGhfZW5hYmxlZGAuCj4gSWYgdGhlIGNs
b3N1cmUgY2FsbGJhY2sgd2FudHMgdG8ga2VlcCBjbG9jayBlbmFibGVkIGZvciBsb25nZXIsIGl0
IGNhbiBqdXN0IGRvCj4gYC5jbG9uZSgpYCBpbnNpZGUgdGhlIGNsb3N1cmUgYW5kIG9idGFpbiBh
biBvd25lZCBgQ2xrPEVuYWJsZWQ+YC4KPiAKPiBJZiB0aGUgdXNlciBqdXN0IGhhdmUgYSByZWZl
cmVuY2UgYW5kIHdhbnQgdG8gZW5hYmxlIHRoZSBjYWxsYmFjayB0aGV5IGNhbiBkbwo+IGBwcmVw
YXJlZF9jbGsuY2xvbmUoKS5lbmFibGUoKWAgd2hpY2ggZ2l2ZXMgYW4gb3duZWQgYENsazxFbmFi
bGVkPmAuIFRob3VnaHRzPwo+IAo+IEJlc3QsCj4gR2FyeQoKCknigJltIG9rIHdpdGggd2hhdCB5
b3UgcHJvcG9zZWQgYWJvdmUuIFRoZSBvbmx5IHByb2JsZW0gaXMgdGhhdCBpbXBsZW1lbnRpbmcK
Y2xvbmUoKSBpcyBkb25lIHRocm91Z2ggYW4gQXJjPCptdXQgYmluZGluZ3M6OmNsaz4gIGluIEJv
cmlz4oCZIGN1cnJlbnQKZGVzaWduLCBzbyB0aGlzIHJlcXVpcmVzIGFuIGV4dHJhIGFsbG9jYXRp
b24uCgrigJQgRGFuaWVsCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRl
YWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgt
cmlzY3YK
