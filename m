Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB739D6CFAC
	for <linux-riscv@archiver.kernel.org>; Fri, 23 Jan 2026 00:31:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:References:Message-Id:Cc:Date:
	In-Reply-To:From:Subject:Mime-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=53fdBU7hpFavCO3nc0BHNBy3UbgErm2TyaWEPjovrWg=; b=3TgCAVGaMwVjyg
	qwyP1mxjv5sq4u2k5fVtIpEMyzOjTEA1VHxo0Tl1WPqa/sttz6ZDzWS+/TABjZeGxHKKPjTBjXbzv
	QfmQUDTisSMXYwqjFXHrC1PnwyypRCgfygEgVHYWvyhTc9rmN+wNlGRiEW2XXFUHL0F5Xd1rsepqy
	sOGivHaDxH8J+wRAHzc140JYXmEMVyBed0h8HUqUeEgS0vy0liCl/4H8vXCaox8t0AYivm3AHRbf1
	DQJ//0EehtACIOckxPVJowGxhgRKIuCUareHKhkPkDyv/zKmuTTtmza/5rych0yP8nlr3adCEkgx0
	ysSrohux86T0jK65u24g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vj54W-00000007vxL-04XL;
	Fri, 23 Jan 2026 00:30:44 +0000
Received: from sender4-pp-f112.zoho.com ([136.143.188.112])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vj54T-00000007vx0-1l9b
	for linux-riscv@lists.infradead.org;
	Fri, 23 Jan 2026 00:30:42 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1769128221; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=IZX+1LsCpQQ+Rl7KDSFtZgqKtr0PFsWoY/u+das8x/TXSxh+Ln1Hk9x+LvhBnMOhhD04WoVYYpE5cQ7UuNgeA7XlHCsKB5IjjWyZ1BvfungO69wQ/8scKUuKaVt01w89ed8KawoVYjMdgiGCZoTubcf9rarqe8R+8TI2Y8+77dc=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1769128221; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=/yeziewaw15H86mUs/MvNCnEniIqbrsf9kqGH0zpSXc=; 
	b=Tt3GOU/H/cyscwd7myazOyzRW77JnO56/aqYeAt/Zkpoe1vOTJYpVVs//RrL8nLiVC50uAxu8dPVbEFPFncY3Zi8ScUHJFG/fTrevf7PE1rmXyegT6LtmAMu7xKcFSitHRUUDmxCOgHUfHdefBNj9kz+/maGAMxgCUlPa0Xryes=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=daniel.almeida@collabora.com;
	dmarc=pass header.from=<daniel.almeida@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1769128221;
	s=zohomail; d=collabora.com; i=daniel.almeida@collabora.com;
	h=Content-Type:Mime-Version:Subject:Subject:From:From:In-Reply-To:Date:Date:Cc:Cc:Content-Transfer-Encoding:Message-Id:Message-Id:References:To:To:Reply-To;
	bh=/yeziewaw15H86mUs/MvNCnEniIqbrsf9kqGH0zpSXc=;
	b=JFVN7vr2V3WZMOROff8QAPjioTjWXyMphmAFlpev66SuROF3067M31vA00BA9Qdv
	9k2102LwLuyRGbUhXPt7+F8xLhnysIan5A9yTTYnFciNuqWiFEWVWPUEbWV9s4yDnMX
	8Y0Hf0auyWwWFoUrq7zk34PewHnWOptInla8L9JM=
Received: by mx.zohomail.com with SMTPS id 1769128219741646.6810529308862;
	Thu, 22 Jan 2026 16:30:19 -0800 (PST)
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.700.81\))
Subject: Re: [PATCH v3 1/3] rust: clk: use the type-state pattern
From: Daniel Almeida <daniel.almeida@collabora.com>
In-Reply-To: <20260122-majestic-masterful-jaguarundi-d0abde@houat>
Date: Thu, 22 Jan 2026 21:29:30 -0300
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
Message-Id: <2F3D3A40-6EF9-46FC-A769-E5A3AAF67E65@collabora.com>
References: <20260107-clk-type-state-v3-0-77d3e3ee59c2@collabora.com>
 <20260107-clk-type-state-v3-1-77d3e3ee59c2@collabora.com>
 <20260108-delectable-fennec-of-sunshine-ffca19@houat>
 <98CD0BF6-3350-40B9-B8A9-F569AE3E3220@collabora.com>
 <20260119-thundering-tested-robin-4be817@houat> <aW4lCfUyumOKRRJm@google.com>
 <518D8B09-B9A1-4DB4-85CD-37A2DD3D5FB1@collabora.com>
 <DFSLCI9U4NCW.2HI2UPUI7G134@kernel.org>
 <20260119-weightless-pelican-of-anger-190db0@houat>
 <DFSN4FDCYHMW.3J3237PEBV2ZP@kernel.org>
 <20260122-majestic-masterful-jaguarundi-d0abde@houat>
To: Maxime Ripard <mripard@kernel.org>
X-Mailer: Apple Mail (2.3826.700.81)
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260122_163041_489731_5A4EFAF2 
X-CRM114-Status: GOOD (  24.66  )
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

Cgo+IE9uIDIyIEphbiAyMDI2LCBhdCAxMDo0NCwgTWF4aW1lIFJpcGFyZCA8bXJpcGFyZEBrZXJu
ZWwub3JnPiB3cm90ZToKPiAKPiBPbiBNb24sIEphbiAxOSwgMjAyNiBhdCAwMzozNzoxN1BNICsw
MTAwLCBEYW5pbG8gS3J1bW1yaWNoIHdyb3RlOgo+PiBPbiBNb24gSmFuIDE5LCAyMDI2IGF0IDM6
MTggUE0gQ0VULCBNYXhpbWUgUmlwYXJkIHdyb3RlOgo+Pj4gT24gTW9uLCBKYW4gMTksIDIwMjYg
YXQgMDI6MTM6NDhQTSArMDEwMCwgRGFuaWxvIEtydW1tcmljaCB3cm90ZToKPj4+PiBPbiBNb24g
SmFuIDE5LCAyMDI2IGF0IDE6NTQgUE0gQ0VULCBEYW5pZWwgQWxtZWlkYSB3cm90ZToKPj4+Pj4+
IE9uIDE5IEphbiAyMDI2LCBhdCAwOTozNSwgQWxpY2UgUnlobCA8YWxpY2VyeWhsQGdvb2dsZS5j
b20+IHdyb3RlOgo+Pj4+Pj4gSSB0aGluayB0aGF0IGlmIHlvdSBzdGlsbCB3YW50IGFuIEFQSSB3
aGVyZSB5b3UganVzdCBjYWxsIGVuYWJsZS9kaXNhYmxlCj4+Pj4+PiBkaXJlY3RseSBvbiBpdCB3
aXRoIG5vIHByb3RlY3Rpb24gYWdhaW5zdCB1bmJhbGFuY2VkIGNhbGxzLCB0aGVuIHRoYXQKPj4+
Pj4+IHNob3VsZCBiZSB0aGUgc3BlY2lhbCBBUEkuIFByb2JhYmx5IGNhbGxlZCBSYXdDbGsgYW5k
IGZ1bmN0aW9ucyBtYXJrZWQKPj4+Pj4+IHVuc2FmZS4gVW5iYWxhbmNlZCBjYWxscyBzZWVtIHJl
YWxseSBkYW5nZXJvdXMgYW5kIHVzZSBzaG91bGQgbm90IGJlCj4+Pj4+PiBlbmNvdXJhZ2VkLgo+
Pj4+IAo+Pj4+ICsxOyBhbmQgdW5sZXNzIHRoZXJlIGlzIGEgdXNlLWNhc2UgdGhhdCByZXF1aXJl
cyBvdGhlcndpc2UsIGl0IHNob3VsZCBub3QgZXZlbgo+Pj4+IGJlIHBvc3NpYmxlIHRvIGRvIHRo
aXMgYXQgYWxsIC0tIGF0IGxlYXN0IGZvciBkcml2ZXIgY29kZS4KPj4+IAo+Pj4gSSBtZWFuLCBp
dCdzIGdyZWF0LCBpdCdzIHNhZmUsIGV0Yy4gYnV0IGl0J3MgYWxzbyBzdWJvcHRpbWFsIGZyb20g
YSBQTQo+Pj4gcGVyc3BlY3RpdmUgb24gbWFueSBwbGF0Zm9ybXMuIEl0J3MgdG90YWxseSBmaW5l
IHRvIHByb3ZpZGUgbmljZSwgc2FmZSwKPj4+IGVyZ29ub21pYyB3cmFwcGVycyBmb3IgdGhlIGRy
aXZlcnMgdGhhdCBkb24ndCBjYXJlIChvciBjYW4ndCwgcmVhbGx5KSwKPj4+IGJ1dCB0cmVhdGlu
ZyBhIGxlZ2l0aW1hdGUgb3B0aW1pc2F0aW9uIGFzIHNvbWV0aGluZyB3ZSBzaG91bGQgY29uc2lk
ZXIKPj4+IGltcG9zc2libGUgdG8gZG8gaXMganVzdCB3ZWlyZCB0byBtZS4KPj4gCj4+IEkgc2Fp
ZCB0aGF0IGFuIHVuc2FmZSBBUEkgd2l0aCBwb3RlbnRpYWxseSB1bmJhbGFuY2VkIGNhbGxzIGlz
IHNvbWV0aGluZyB3ZQo+PiBzaG91bGQgY2xlYXJseSBhdm9pZCBmb3IgZHJpdmVycy4gVGhpcyBp
cyAqbm90KiBlcXVpdmFsZW50IHRvICJ0cmVhdGluZyBhCj4+IGxlZ2l0aW1hdGUgb3B0aW1pc2F0
aW9uIGFzIHNvbWV0aGluZyB3ZSBzaG91bGQgY29uc2lkZXIgaW1wb3NzaWJsZSIuCj4+IAo+PiBJ
ZiB3ZSBkaXNjb3ZlciB1c2UtY2FzZXMgd2hlcmUgdGhlIGN1cnJlbnQgQVBJIGRvZXNuJ3Qgd29y
ayB3ZWxsLCB3ZSBjYW4KPj4gaW52ZW5zdGlnYXRlIGZ1cnRoZXIuCj4gCj4gSSdtIG5vdCBzdXJl
IEknbSBmb2xsb3dpbmcgd2hhdCB5b3UncmUgc2F5aW5nLCBzb3JyeS4gSSd2ZSBwb2ludGVkIG91
dAo+IHN1Y2ggYSB1c2UtY2FzZSBhbHJlYWR5Lgo+IAo+Pj4+PiBJIHRoaW5rIHdlIHNob3VsZCBk
aXNjb3VyYWdlIFJhd0NsayBpZiBhdCBhbGwgcG9zc2libGUuIEJ1dCBpZiB0aGUgY29uc2Vuc3Vz
Cj4+Pj4+IGlzIHRoYXQgd2UgKnJlYWxseSogbmVlZCB0aGlzIGVhc2lseS1hYnVzZWQgdGhpbmcs
IEkgY2FuIHByb3ZpZGUgYSBmb2xsb3ctdXAuCj4+Pj4gCj4+Pj4gSSB0aGluayB3ZSBzaG91bGQg
b25seSBkbyB0aGlzIGlmIHRoZXJlIGFyZSB1c2UtY2FzZSB3aXRoIG5vIGFsdGVybmF0aXZlLCBz
byBmYXIKPj4+PiB0aGVyZSBoYXZlbid0IGJlZW4gYW55IEFGQUlLLgo+Pj4gCj4+PiBJIGRvbid0
IHJlYWxseSBjYXJlIGFib3V0IHdoaWNoIGFsdGVybmF0aXZlIHdlIGNvbWUgdXAgd2l0aCwgYnV0
IGxvb2sgYXQKPj4+IGRldm1fcmVnbWFwX2luaXRfbW1pb19jbGsgZm9yIGV4YW1wbGUuIEl0IGlz
IGEgdmFsaWQgdXNlLWNhc2UgdGhhdAo+Pj4gYWxyZWFkeSBleGlzdHMgdG9kYXksIGFuZCBoYXMg
aGFkIGZvciBtb3JlIHRoYW4gYSBkZWNhZGUgYXQgdGhpcyBwb2ludC4KPj4gCj4+IEkgZG9uJ3Qg
c2VlIHRoZSBpc3N1ZSB3aXRoIGRldm1fcmVnbWFwX2luaXRfbW1pb19jbGsoKT8gSXQgdGFrZXMg
YSByZWZlcmVuY2UKPj4gY291bnQgb2YgdGhlIGNsb2NrIGFuZCBwcmVwYXJlcyBpdCB3aGVuIGNh
bGxlZCBhbmQgdW5wcmVwYXJlcyB0aGUgY2xrIGluIGRyb3BzCj4+IGl0cyByZWZlcmVuY2UgaW4g
cmVnbWFwX21taW9fZnJlZV9jb250ZXh0KCkgY2FsbGVkIGZyb20gdGhlIGRldnJlcyBjYWxsYmFj
ay4KPj4gCj4+IFRoYXQgc29tZXRoaW5nIHdlIGNhbiBlYXNpbHkgZG8gd2l0aCB0aGUgY3VycmVu
dCBBUEksIG5vPwo+IAo+IFRoZSBjdXJyZW50IG9uZSwgeWVzLiBEb2luZyB0aGF0IGluIHRoZSBB
UEkgc3VnZ2VzdGVkIGhlcmUgd291bGQgaW52b2x2ZQo+IHNvbWUgYm9pbGVycGxhdGUgaW4gYWxs
IHRob3NlIGRyaXZlcnMgdGhleSBkb24ndCBoYXZlIHJpZ2h0IG5vdy4KPiAKPiBNYXhpbWUKCk1h
eGltZSwgSSBrbm93IHlvdeKAmXZlIGFscmVhZHkgcG9pbnRlZCBvdXQgYSB1c2UtY2FzZSwgYnV0
IEkgdGhpbmsgdGhlCmNvbmZ1c2lvbiBzdGVtcyBmcm9tIHdoeSB5b3Ugc2VlbSB0byB0aGluayB0
aGF0IHRoZSBjdXJyZW50IHNvbHV0aW9uIGNhbm5vdApjYXRlciB0byB0aGUgQVBJIHlvdSBtZW50
aW9uZWQgaW4gYSBjbGVhbiB3YXkuIFlvdSBzZWVtIHRvIGltcGx5IHRoYXQgdGhlcmUKd2lsbCBi
ZSBhIGxvdCBvZiBib2lsZXJwbGF0ZSBpbnZvbHZlZCwgYnV0IHdlIChvciBJKSBjYW5ub3Qgc2Vl
IHRoaXMuIFBlcmhhcHMKaXQgd291bGQgaGVscCBpZiB5b3UgaGlnaGxpZ2h0ZWQgaG93IGV4YWN0
bHkgdGhlIHR5cGUgc3RhdGUgc29sdXRpb24gd291bGQgYmUKdmVyYm9zZSB1c2luZyBzb21lIHBz
ZXVkb2NvZGUuIEkgZ3Vlc3MgdGhhdCB3b3VsZCBtYWtlIHlvdXIgcG9pbnQgY2xlYXJlciBmb3IK
dXMuCgrigJQgRGFuaWVsCgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZy
YWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGlu
dXgtcmlzY3YK
