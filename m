Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A253ED3B7EA
	for <linux-riscv@archiver.kernel.org>; Tue,  9 Dec 2025 13:41:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:From:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dn2Vd0E9JaWkn280Ia/hVc1MPsnPhtdZsCp4YuPpDXw=; b=rL6ztuNh5XF1og
	ZTTDee5VVcq/DfDr4qyVjkbz9bjjqdxS28EyivqhubsbCpO2qAA2f4h6MOzTo9f8bcv9M8aGAZnUB
	KaumPcceDp5GDduTtvQC5r6q4nZoIB2uLXNGcZzlrl+yA+4kZzp1EV8jDaEg7XY0B1wCQ/i4lEz15
	jJZPhZG2hGLRUfhkBIDK6hGPEym9oSoNEVS12Uzw2KcoLXTdUyZJwgJjtCZf2nqh4WLbvb1KFIpIp
	WGJJbeZMRbHnYmw0J0zDW8uEunaiAPdBAW2bTjc9oT70mfuf5frhbbtmgPviwJO8f4tp06+u8b/xe
	Apd/bC7q0BRceSQqaAjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vSxyH-0000000EKY1-0mh0;
	Tue, 09 Dec 2025 13:41:41 +0000
Received: from mailout1.w1.samsung.com ([210.118.77.11])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vSxyD-0000000EKWp-29Ib
	for linux-riscv@lists.infradead.org;
	Tue, 09 Dec 2025 13:41:39 +0000
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
	by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20251209134130euoutp011129929c55462c5d68426d6e11510439~-j809n8xD2260222602euoutp01i
	for <linux-riscv@lists.infradead.org>; Tue,  9 Dec 2025 13:41:30 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20251209134130euoutp011129929c55462c5d68426d6e11510439~-j809n8xD2260222602euoutp01i
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1765287690;
	bh=NYkdWnmHGgFN43Uqa8YF07pn4VK88DvECmSTgJyvBxI=;
	h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
	b=DISYFaX9BUFOZD0EdnhHagJD2E5+Q0kTeKjknFwSLXxzvUE8tmvQlHZadeUUFPmPB
	 k3ni9HrjUkaFzMZLMkGSyXzE2qYCeltzaSbOY8UrSb7STY8webP0tYyB876OQmudaB
	 xVWY66h5qVejbV+pMAY+y4i+rd0PzIbsyQ6FySzY=
Received: from eusmtip1.samsung.com (unknown [203.254.199.221]) by
	eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
	20251209134130eucas1p22a063fe18c5fdccb8e586892570f3895~-j80gIjuJ1957519575eucas1p2P;
	Tue,  9 Dec 2025 13:41:30 +0000 (GMT)
Received: from [192.168.1.44] (unknown [106.210.136.40]) by
	eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20251209134129eusmtip129f83220e2503bac3a89ad1f43f2971a~-j8zxf-hZ0170401704eusmtip1C;
	Tue,  9 Dec 2025 13:41:29 +0000 (GMT)
Message-ID: <5a742181-dff6-4073-ada0-342298da63b6@samsung.com>
Date: Tue, 9 Dec 2025 14:41:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] rust: pwm: Add UnregisteredChip wrapper around Chip
To: Markus Probst <markus.probst@posteo.de>,
	=?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@kernel.org>
Cc: linux-riscv@lists.infradead.org, linux-pwm@vger.kernel.org,
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, Drew Fustini
	<fustini@kernel.org>, Guo Ren <guoren@kernel.org>, Fu Wei <wefu@redhat.com>,
	Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, Boqun
	Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, Benno Lossin
	<lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl
	<aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, Danilo Krummrich
	<dakr@kernel.org>
Content-Language: en-US
From: Michal Wilczynski <m.wilczynski@samsung.com>
In-Reply-To: <a66b337528d700ae92d7940a04c59206e06a8495.camel@posteo.de>
X-CMS-MailID: 20251209134130eucas1p22a063fe18c5fdccb8e586892570f3895
X-Msg-Generator: CA
X-RootMTR: 20251202181800eucas1p18be878cb74d14444f2df8bdcd7a718ee
X-EPHeader: CA
X-CMS-RootMailID: 20251202181800eucas1p18be878cb74d14444f2df8bdcd7a718ee
References: <CGME20251202181800eucas1p18be878cb74d14444f2df8bdcd7a718ee@eucas1p1.samsung.com>
	<20251202-pwm_safe_register-v2-1-7a2e0d1e287f@posteo.de>
	<a3f4e795-e56d-4de0-8b46-5c8ff96d5f77@samsung.com>
	<zdwto7ahccckl2r3qoculu52lsus3dey2lcur2l3ltrxp5nrcf@djusgl5cdfu3>
	<a66b337528d700ae92d7940a04c59206e06a8495.camel@posteo.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251209_054138_122565_5314B47C 
X-CRM114-Status: GOOD (  16.99  )
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

CgpPbiAxMi85LzI1IDEzOjI2LCBNYXJrdXMgUHJvYnN0IHdyb3RlOgo+IE9uIFR1ZSwgMjAyNS0x
Mi0wOSBhdCAwOTowOCArMDEwMCwgVXdlIEtsZWluZS1Lw7ZuaWcgd3JvdGU6Cj4+IE9uIFN1biwg
RGVjIDA3LCAyMDI1IGF0IDExOjE2OjU5UE0gKzAxMDAsIE1pY2hhbCBXaWxjenluc2tpIHdyb3Rl
Ogo+Pj4gT24gMTIvMi8yNSAxOToxNywgTWFya3VzIFByb2JzdCB3cm90ZToKPj4gV2hhdCBkb2Vz
ICJub3QgYWJsZSB0byBzdWNjZXNzZnVsbHkgY29tcGlsZSBkcml2ZXJzL3B3bS9wd21fdGgxNTIw
LnJzIgo+PiBtZWFuPyBZb3Ugd2VyZSB1bmFibGUgdG8gZmluZCBhIC5jb25maWcgdGhhdCBpbmNs
dWRlZCBDT05GSUdfUFdNX1RIMTUyMCwKPj4gb3IgeW91IGdvdCBhIGNvbXBpbGVyIGVycm9yPyBJ
ZiBpdCdzIHRoZSBsYXR0ZXIsIC4uLgo+Pgo+Pj4gSSBzdXNwZWN0IHlvdXIga2VybmVsIGNvbmZp
Z3VyYXRpb24gaXMgbWlzc2luZyBDT05GSUdfQ09NTU9OX0NMSy4KPj4KPj4gLi4uIGFyZSB3ZSBt
aXNzaW5nIGEgZGVwZW5kZW5jeSBmb3IgdGhlIGRyaXZlcj8KPiBJIGdvdCBhIGNvbXBpbGVyIGVy
cm9yLiBFbmFibGluZyBDT05GSUdfQ09NTU9OX0NMSyBpbmRlZWQgZml4ZXMgaXQuCj4gCj4gV2l0
aG91dCBpdDoKPiAgIENMSVBQWSAgICAgZHJpdmVycy9wd20vcHdtX3RoMTUyMC5vCj4gZXJyb3Jb
RTA0MzJdOiB1bnJlc29sdmVkIGltcG9ydCBga2VybmVsOjpjbGs6OkNsa2AKPiAgIC0tPiBkcml2
ZXJzL3B3bS9wd21fdGgxNTIwLnJzOjI2OjUKPiAgICB8Cj4gMjYgfCAgICAgY2xrOjpDbGssCj4g
ICAgfCAgICAgXl5eXl5eXl4gbm8gYENsa2AgaW4gYGNsa2AKPiAKPiBlcnJvcjogYWJvcnRpbmcg
ZHVlIHRvIDEgcHJldmlvdXMgZXJyb3IKPiAKPiBGb3IgbW9yZSBpbmZvcm1hdGlvbiBhYm91dCB0
aGlzIGVycm9yLCB0cnkgYHJ1c3RjIC0tZXhwbGFpbiBFMDQzMmAuCj4gbWFrZVs0XTogKioqIFtz
Y3JpcHRzL01ha2VmaWxlLmJ1aWxkOjM1NDogZHJpdmVycy9wd20vcHdtX3RoMTUyMC5vXQo+IEVy
cm9yIDEKPiBtYWtlWzNdOiAqKiogW3NjcmlwdHMvTWFrZWZpbGUuYnVpbGQ6NTU2OiBkcml2ZXJz
L3B3bV0gRXJyb3IgMgo+IG1ha2VbMl06ICoqKiBbc2NyaXB0cy9NYWtlZmlsZS5idWlsZDo1NTY6
IGRyaXZlcnNdIEVycm9yIDIKPiBtYWtlWzFdOiAqKiogWy9ob21lL21hcmt1c3RpZWdlci9idWls
ZC9zeW5vbG9neS9saW51eC0KPiB1cHN0cmVhbS9NYWtlZmlsZToyMDEwOiAuXSBFcnJvciAyCj4g
bWFrZTogKioqIFtNYWtlZmlsZToyNDg6IF9fc3ViLW1ha2VdIEVycm9yIDIKPiAKPiBBIHNpbXBs
ZSBmaXggd291bGQgYmUgdG8gYWRkICJkZXBlbmRzIG9uIENPTU1PTl9DTEsiIGluCj4gZHJpdmVy
cy9wd20vS2NvbmZpZyBmb3IgUFdNX1RIMTUyMC4KCQpXaGlsZSBhdCBpdCBJIHRoaW5rIHdlIHNo
b3VsZCBhbHNvIGFkZCBkZXBlbmRlbmN5IG9uIEFSQ0hfVEhFQUQgfApDT01QSUxFX1RFU1QgYXMg
d2VsbCBhcyBIQVNfSU9NRU0gaW4gbXkgb3Bpbmlvbi4gSSB0aGluayBzb21lIG9mIHRob3NlCmRl
cGVuZGVuY2llcyB3ZXJlIGxvc3Qgd2hlbiB3ZSB3ZXJlIGl0ZXJhdGluZyBvbiB0aGUgcGF0Y2hz
ZXQgZm9yIHNvbWUKcmVhc29uLCBjYW4ndCByZWNhbGwgd2hlbiBleGFjdGx5LgoKSWYgeW91IHBs
YW4gdG8gc2VuZCBhIHBhdGNoIGluY2x1ZGUgdGhvc2UgYXMgd2VsbC4gT3RoZXJ3aXNlIGxldCBt
ZSBrbm93CmFuZCBJIHNlbmQgYSBwYXRjaC4KCj4gCj4gVGhhbmtzCj4gLSBNYXJrdXMgUHJvYnN0
CkJlc3QgcmVnYXJkcywKLS0gCk1pY2hhbCBXaWxjenluc2tpIDxtLndpbGN6eW5za2lAc2Ftc3Vu
Zy5jb20+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwps
aW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpo
dHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
