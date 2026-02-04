Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94F9DE95396
	for <linux-riscv@archiver.kernel.org>; Wed,  4 Feb 2026 12:44:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:References:Message-Id:Cc:Date:
	In-Reply-To:From:Subject:Mime-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=szcggQw2gc4nIvSbe0Xopp0q+7rzHfiLNgLKik1xiWQ=; b=KR77zM/6Q+3F8q
	t4sv5n+9jiu9IRNfXuJ8nmOg/2pGGw1xpPpMwfp45pRj4mKVACK4m5OjfMzZTy6u1DC42W2XFwUIe
	JE/zKU9GwKA5E167JYJDzE6RZYrH+ZbooH62ex/8uctoTH9nsVE0eTu7rp+GJuyS+xLo8XGpAq+bY
	JkvkDneo7NpTdQRBLyfM1jLgEPqOrN7Gr47ICMdCAKtUesQaPA1nDYgSHswbwxcJVPJiWnskqlQ3V
	sLVoy11KQa1Jys3X8/LgSZQNPbhYeyiRrTgqe+nZ43YrZ0F13Mq6CKDirV8Nt50FXnh4YXLQUR6jR
	n9T78FMPU/HsGwbgc0uQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vncFF-00000008STk-1FAj;
	Wed, 04 Feb 2026 12:44:33 +0000
Received: from sender4-pp-f112.zoho.com ([136.143.188.112])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vncFC-00000008STM-236X
	for linux-riscv@lists.infradead.org;
	Wed, 04 Feb 2026 12:44:32 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1770209056; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=VlpkdDeeeuo06wVd3QoFjeQF4Ze/WvqBlenT7Jxm0kIXdrUYyqy7ANv1tLtDRRzzqfLYNdrPNkWVquUaNRftFbw42AH49LYk/zkoDXAH0Ntfo1HhhYgXERyL497cdRdqm1Ex72I7fUcm5KVNgfWVA5+svJoKXiMwu0aq6H6hApQ=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1770209056; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=ZHEfRwCP34SKP/etqf2R3yvPOUYfeiMlExy0k9a0BNk=; 
	b=EY8CFOFttnCRasix3rIcqXqI3UN2g9W04GFEFPR1ZNNP7jOpoKfAPlwvbOXuBrv3ukECbHXQdEntU4zuZB9MoDDQYHSsmIMITHZTSaQnIUbIz/xw2HPCQXTbcSNzzFhJfuJWkqdUlbiIeqlXhHvA8G8g9SXqaQK0wBphiTsMpOs=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=daniel.almeida@collabora.com;
	dmarc=pass header.from=<daniel.almeida@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1770209056;
	s=zohomail; d=collabora.com; i=daniel.almeida@collabora.com;
	h=Content-Type:Mime-Version:Subject:Subject:From:From:In-Reply-To:Date:Date:Cc:Cc:Content-Transfer-Encoding:Message-Id:Message-Id:References:To:To:Reply-To;
	bh=ZHEfRwCP34SKP/etqf2R3yvPOUYfeiMlExy0k9a0BNk=;
	b=D9fY5vsYmDzxbb3wnJ6GeN2NPcWUM3P96dDZwTdg8wRu0RO5UFiU0nieyb+hVJ0q
	yI8/bK2piXW4wuCwLcUWSkwryxH+w1MDZSTV5OJjf4H1/lV+m+0ge2r2zOoB7bn9DUC
	xBaM6iGniq4R2heDGhtciZgJAlf8pNM31KS9AmSI=
Received: by mx.zohomail.com with SMTPS id 1770209055218580.5695590716871;
	Wed, 4 Feb 2026 04:44:15 -0800 (PST)
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.700.81\))
Subject: Re: [PATCH v3 1/3] rust: clk: use the type-state pattern
From: Daniel Almeida <daniel.almeida@collabora.com>
In-Reply-To: <20260204-nickel-seal-of-poetry-8fdefb@houat>
Date: Wed, 4 Feb 2026 09:43:55 -0300
Cc: Danilo Krummrich <dakr@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 Viresh Kumar <viresh.kumar@linaro.org>,
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
 Gary Guo <gary@garyguo.net>,
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
Message-Id: <91A92D84-1F2E-45F3-82EC-6A97D32E2A78@collabora.com>
References: <20260108-delectable-fennec-of-sunshine-ffca19@houat>
 <98CD0BF6-3350-40B9-B8A9-F569AE3E3220@collabora.com>
 <20260119-thundering-tested-robin-4be817@houat> <aW4lCfUyumOKRRJm@google.com>
 <518D8B09-B9A1-4DB4-85CD-37A2DD3D5FB1@collabora.com>
 <DFSLCI9U4NCW.2HI2UPUI7G134@kernel.org>
 <20260119-weightless-pelican-of-anger-190db0@houat>
 <DFSN4FDCYHMW.3J3237PEBV2ZP@kernel.org>
 <20260122-majestic-masterful-jaguarundi-d0abde@houat>
 <2F3D3A40-6EF9-46FC-A769-E5A3AAF67E65@collabora.com>
 <20260204-nickel-seal-of-poetry-8fdefb@houat>
To: Maxime Ripard <mripard@kernel.org>
X-Mailer: Apple Mail (2.3826.700.81)
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260204_044430_583677_3A7158C9 
X-CRM114-Status: GOOD (  18.25  )
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

PiAKPiBJJ20gcHJvYmFibHkgbWlzc2luZyBzb21ldGhpbmcgdGhlbiwgYnV0IGxldCdzIGFzc3Vt
ZSB5b3UgaGF2ZSBhIGRyaXZlcgo+IHRoYXQgd2FudHMgaXRzIGNsb2NrIHByZXBhcmVkIGFuZCBl
bmFibGVkIGluIGFuIGh5cG90aGV0aWNhbCBlbmFibGUoKQo+IGNhbGxiYWNrLCBhbmQgZGlzYWJs
ZWQgLyB1bnByZXBhcmVkIGluIGEgZGlzYWJsZSgpIGNhbGxiYWNrLgo+IAo+IEZyb20gYSBQTSBt
YW5hZ2VtZW50IHBlcnNwZWN0aXZlLCB0aGlzIHVzZWNhc2UgbWFrZXMgdG90YWwgc2Vuc2UsIGlz
IGEKPiB2YWxpZCB1c2VjYXNlLCBpcyB3aWRlbHkgdXNlZCBpbiB0aGUga2VybmVsLCBhbmQgaXMg
Y3VycmVudGx5IHN1cHBvcnRlZAo+IGJ5IGJvdGggdGhlIEMgYW5kIFJ1c3QgY2xrIEFQSXMuCj4g
Cj4gVGhlIG9ubHkgc29sdXRpb24gdG8gdGhpcyB5b3Ugc3VnZ2VzdGVkIHNvIGZhciAoSSB0aGlu
az8pIHRvIGltcGxlbWVudAo+IHRoaXMgb24gdG9wIG9mIHRoZSBuZXcgY2xrIEFQSSB5b3UgcHJv
cG9zZSBpcyB0byBoYXZlIGEgZHJpdmVyIHNwZWNpZmljCj4gZW51bSB0aGF0IHdvdWxkIHN0b3Jl
IGVhY2ggb2YgdGhlIHBvc3NpYmxlIHN0YXRlIHRyYW5zaXRpb24uCgpZZXMsIHlvdSBuZWVkIGFu
IGVudW0gX2lmXyB5b3Ugd2FudCB0byBtb2RlbCB0cmFuc2l0aW9ucyBhdCBydW50aW1lLiBJSVVD
IHlvdQpvbmx5IG5lZWQgdHdvIHZhcmlhbnRzIHRvIGltcGxlbWVudCB0aGUgcGF0dGVybiB5b3Ug
ZGVzY3JpYmVkLiBJIGRvIG5vdApjb25zaWRlciB0aGlzICDigJxib2lsZXJwbGF0ZeKAnSwgYnV0
IHJhdGhlciBhIHNtYWxsIGNvc3QgdG8gcGF5LgoKSSB3b3VsZCB1bmRlcnN0YW5kIGlmIHRoaXMg
d2FzIHNvbWUgZWxhYm9yYXRlIHBhdHRlcm4gdGhhdCBoYWQgdG8gYmUKaW1wbGVtZW50ZWQgYnkg
YWxsIGRyaXZlcnMsIGJ1dCBhIHR3by12YXJpYW50IGVudW0gaXMgYXMgc3RyYWlnaHRmb3J3YXJk
IGFzIGl0CmdldHMuCgoKPiAKPiBUaGF0J3MgdGhlIGJvaWxlcnBsYXRlIEknbSB0YWxraW5nIGFi
b3V0LiBJZiBldmVyeSBkcml2ZXIgd2FudGluZyB0bwo+IGltcGxlbWVudCB0aGF0IHBhdHRlcm4g
aGFzIHRvIG1ha2Ugc3VjaCBhbiBlbnVtLCB3aXRoIGFsbCB0aGUgcmVsZXZhbnQKPiB0cmFpdHMg
aW1wbGVtZW50YXRpb24gdGhhdCBtaWdodCBjb21lIHdpdGggaXQsIHdlIGdvIGZyb20gYW4gQVBJ
IHdoZXJlCj4gZXZlcnl0aGluZyB3b3JrcyBhdCBuby1jb3N0IGZyb20gYSBjb2RlLXNpemUgcGVy
c3BlY3RpdmUgdG8gYSBzaXR1YXRpb24KPiB3aGVyZSBldmVyeSBkcml2ZXIgaGFzIHRvIGRldmVs
b3AgYW5kIG1haW50YWluIHRoYXQgZW51bS4KPiAKPiBNYXhpbWUKClRoZXJlIGFyZSBubyAidHJh
aXRzIHRoYXQgY29tZSB3aXRoIGl0Ii4gSXQncyBqdXN0IGFuIGVudW0sIHdpdGggdHdvIHZhcmlh
bnRzLgoKPiBBUEkgd2hlcmUgZXZlcnl0aGluZyB3b3JrcyBhdCBuby1jb3N0CgpUaGUgcHJldmlv
dXMgQVBJIHdhcyBmYXIgZnJvbSDigJxldmVyeXRoaW5nIHdvcmtz4oCdLiBJdCB3YXMgZnVuZGFt
ZW50YWxseQpicm9rZW4gYnkgZGVzaWduIGluIG11bHRpcGxlIHdheXMsIGkuZS46Cgo+IGEpIEl0
IG9ubHkga2VlcHMgdHJhY2sgb2YgYSBjb3VudCB0byBjbGtfZ2V0KCksIHdoaWNoIG1lYW5zIHRo
YXQgdXNlcnMgaGF2ZQo+IHRvIG1hbnVhbGx5IGNhbGwgZGlzYWJsZSgpIGFuZCB1bnByZXBhcmUo
KSwgb3IgYSB2YXJpYXRpb24gb2YgdGhvc2UsIGxpa2UKPiBkaXNhYmxlX3VucHJlcGFyZSgpLgo+
IAo+IGIpIEl0IGFsbG93cyByZXBlYXRlZCBjYWxscyB0byBwcmVwYXJlKCkgb3IgZW5hYmxlKCks
IGJ1dCBpdCBrZWVwcyBubyB0cmFjawo+IG9mIGhvdyBvZnRlbiB0aGVzZSB3ZXJlIGNhbGxlZCwg
aS5lLiwgaXQncyBjdXJyZW50bHkgbGVnYWwgdG8gd3JpdGUgdGhlCj4gZm9sbG93aW5nOgo+IAo+
IGNsay5wcmVwYXJlKCk7Cj4gY2xrLnByZXBhcmUoKTsKPiBjbGsuZW5hYmxlKCk7Cj4gY2xrLmVu
YWJsZSgpOwo+IAo+IEFuZCBub3RoaW5nIGdldHMgdW5kb25lIG9uIGRyb3AoKS4KCklNSE8sIHdo
YXQgd2UgaGF2ZSBoZXJlIGlzIGFuIGltcHJvdmVtZW50IHRoYXQgaGFzIGJlZW4gbG9uZyBvdmVy
ZHVlLgoK4oCUIERhbmllbApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFk
ZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4
LXJpc2N2Cg==
