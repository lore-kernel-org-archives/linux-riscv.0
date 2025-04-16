Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6814FC369BA
	for <linux-riscv@archiver.kernel.org>; Wed, 16 Apr 2025 15:33:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=X9gmeXxyHrRQc4k3Jgqtk6jUFscILMgDIHxVlH3/ba4=; b=llVeD+FJDk2FMr
	BhBOpJLGpg8evz2ovhopFaH9us7FBJewRbe8ePT57v3NaCUhCrNhOpzaIctlVkTYJpm4tNkGDOwzl
	/Qm/B3snM4qZKGvh53Zdd4MBXZkawt3ha3my/c3Ow5nmNEiqACxN9Uop5SeKbl+bpvhUo6uN+VgmM
	dxQyvaOnIIwgxY3ueLsHxG+8GrkjP5NlileXEL+l8b/K81QhhZEQ0gO/V12GhWSMoHZa0Jl0b+ZZK
	6W3YzAlr9qBa/Tx2VJc8wmlfXzRiX3vUk4j2dXE2+hOPj3MWBZSpASg2xu/zUaC11wsC0/BHOOxFn
	LFkYWLnvtmoddrgt0c6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u54l3-0000000A5f7-1Xes;
	Wed, 16 Apr 2025 15:33:01 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u543y-00000009xIT-3lyV
	for linux-riscv@lists.infradead.org;
	Wed, 16 Apr 2025 14:48:32 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 6D403437CF
	for <linux-riscv@lists.infradead.org>; Wed, 16 Apr 2025 14:48:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 616B0C4CEE4
	for <linux-riscv@lists.infradead.org>; Wed, 16 Apr 2025 14:48:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744814910;
	bh=JDV0aZmLpKhamx6ABdVktv5X6IcQxFLMwisZNz0CLvg=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=QE5u6qJeR7TRKSMANkwDFBCaNM1dWHnbunlYUjvdtcIkcL3BkF6n1eHKUHHqcpID4
	 k/o2DpLENg2vaTpfXeAakthdEH13BfnN7+i8yyxu/m2tl1+wjtFHCoK5kTx8FHYoAm
	 EmBjlFVD+zGoz2a+B34iF9JKTT+8g0Pqzgh9e1S1IE9mxUrxjHbR/SBrBuClLF5MVX
	 x8wKpKQBRlsMNe1kY/jubKckiwJsPCU4LtNahJ/6Jppm608fybGkOAu2ztg1MyAxBK
	 JGAYTLzTeqSKPSTCT7STz8pi4hBLuynvGl73zqvq1UHZpJypgt7qIeBNj1dWbnvjs/
	 Us8HhSDBqoBsA==
Received: by mail-oa1-f54.google.com with SMTP id 586e51a60fabf-2c2bb447e5eso3733297fac.0
        for <linux-riscv@lists.infradead.org>; Wed, 16 Apr 2025 07:48:30 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCU0m9cUondZKE+i0k4eZosQX1x0G35+gmPT4hrKP/F8zEhA6HBPPQ4PgaAnKrLi7gdt63gMeCDU0ovD7Q==@lists.infradead.org
X-Gm-Message-State: AOJu0YxQxX35hJa3AwvtRWPCOCmZNy0srm1UTGr9UTB2xeDMdk2WjpAo
	cG0P1dfP5qV5JkYCKNrWb/6kA6w9keppY/Nl6mLYKrVq8QYgt3/7EgAq5VQdZkBbTGS0RQM734C
	bIt1PD/NRzVcWdRZnOUUuEDnF0eo=
X-Google-Smtp-Source: AGHT+IFdOsYf3iLaqn2AOVXB9JgmqvlR+FlopMhZdQ/oyI1KkOKZUA99g88s0TEkNSW1AHhhviEm86XcXoV4znOgyQg=
X-Received: by 2002:a05:6871:7245:b0:29e:3921:b1ea with SMTP id
 586e51a60fabf-2d4d2d1c621mr1206668fac.30.1744814909669; Wed, 16 Apr 2025
 07:48:29 -0700 (PDT)
MIME-Version: 1.0
References: <CGME20250414185314eucas1p1ae57b937773a2ed4ce8d52d5598eb028@eucas1p1.samsung.com>
 <20250414-apr_14_for_sending-v2-0-70c5af2af96c@samsung.com>
 <20250414-apr_14_for_sending-v2-1-70c5af2af96c@samsung.com>
 <CAJZ5v0irRq8_p35vf41_ZgomW0X=KZN+0HqwU2K9PvPRm8iZQA@mail.gmail.com> <b9c4182d-38c2-4173-a35a-0e1773c8f2ed@samsung.com>
In-Reply-To: <b9c4182d-38c2-4173-a35a-0e1773c8f2ed@samsung.com>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Wed, 16 Apr 2025 16:48:18 +0200
X-Gmail-Original-Message-ID: <CAJZ5v0gE0anjW_mDSwNXY8xoZ_0=bDDxiSbUq1GP7-NycDojrQ@mail.gmail.com>
X-Gm-Features: ATxdqUHImP3IxzcDVOQelXbHBno9Ueli1k7m_bFezgDgj8FwN4tMxWCc_OjKQlw
Message-ID: <CAJZ5v0gE0anjW_mDSwNXY8xoZ_0=bDDxiSbUq1GP7-NycDojrQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/4] PM: device: Introduce platform_resources_managed flag
To: Michal Wilczynski <m.wilczynski@samsung.com>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>, Pavel Machek <pavel@kernel.org>, 
	Drew Fustini <drew@pdp7.com>, Guo Ren <guoren@kernel.org>, Fu Wei <wefu@redhat.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Ulf Hansson <ulf.hansson@linaro.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Frank Binns <frank.binns@imgtec.com>, Matt Coster <matt.coster@imgtec.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	m.szyprowski@samsung.com, linux-kernel@vger.kernel.org, 
	linux-pm@vger.kernel.org, linux-riscv@lists.infradead.org, 
	devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250416_074830_985135_D34CAEB7 
X-CRM114-Status: GOOD (  40.37  )
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

T24gV2VkLCBBcHIgMTYsIDIwMjUgYXQgMzozMuKAr1BNIE1pY2hhbCBXaWxjenluc2tpCjxtLndp
bGN6eW5za2lAc2Ftc3VuZy5jb20+IHdyb3RlOgo+Cj4gT24gNC8xNS8yNSAxODo0MiwgUmFmYWVs
IEouIFd5c29ja2kgd3JvdGU6Cj4gPiBPbiBNb24sIEFwciAxNCwgMjAyNSBhdCA4OjUz4oCvUE0g
TWljaGFsIFdpbGN6eW5za2kKPiA+IDxtLndpbGN6eW5za2lAc2Ftc3VuZy5jb20+IHdyb3RlOgo+
ID4+Cj4gPj4gSW50cm9kdWNlIGEgbmV3IGRldl9wbV9pbmZvIGZsYWcgLSBwbGF0Zm9ybV9yZXNv
dXJjZXNfbWFuYWdlZCwgdG8KPiA+PiBpbmRpY2F0ZSB3aGV0aGVyIHBsYXRmb3JtIFBNIHJlc291
cmNlcyBzdWNoIGFzIGNsb2NrcyBvciByZXNldHMgYXJlCj4gPj4gbWFuYWdlZCBleHRlcm5hbGx5
IChlLmcuIGJ5IGEgZ2VuZXJpYyBwb3dlciBkb21haW4gZHJpdmVyKSBpbnN0ZWFkIG9mCj4gPj4g
ZGlyZWN0bHkgYnkgdGhlIGNvbnN1bWVyIGRldmljZSBkcml2ZXIuCj4gPgo+ID4gSSB0aGluayB0
aGF0IHRoaXMgaXMgZ2VucGQtc3BlY2lmaWMgYW5kIHNvIEkgZG9uJ3QgdGhpbmsgaXQgYmVsb25n
cyBpbgo+ID4gc3RydWN0IGRldl9wbV9pbmZvLgo+ID4KPiA+IFRoZXJlIGlzIGRldi0+cG93ZXIu
c3Vic3lzX2RhdGEtPmRvbWFpbl9kYXRhLCB3aHkgbm90IHVzZSBpdCBmb3IgdGhpcz8KPgo+IEhp
IFJhZmFlbCwKPgo+IFRoYW5rcyBmb3IgdGhlIGZlZWRiYWNrLgo+Cj4gWW91J3JlIHJpZ2h0IOKA
lCB0aGlzIGJlaGF2aW9yIGlzIHNwZWNpZmljIHRvIGdlbnBkLCBzbyBlbWJlZGRpbmcgdGhlIGZs
YWcKPiBkaXJlY3RseSBpbiBzdHJ1Y3QgZGV2X3BtX2luZm8gbWF5IG5vdCBiZSB0aGUgYmVzdCBj
aG9pY2UuIFVzaW5nCj4gZGV2LT5wb3dlci5zdWJzeXNfZGF0YS0+ZG9tYWluX2RhdGEgbWFrZXMg
bW9yZSBzZW5zZSBhbmQgYXZvaWRzIGJsb2F0aW5nCj4gdGhlIGNvcmUgUE0gc3RydWN0dXJlLgo+
Cj4gPgo+ID4gQWxzbywgaXQgc2hvdWxkIGJlIGRvY3VtZW50ZWQgd2F5IG1vcmUgY29tcHJlaGVu
c2l2ZWx5IElNVi4KPiA+Cj4gPiBXaG8gaXMgc3VwcG9zZWQgdG8gc2V0IGl0IGFuZCB3aGVuPyAg
V2hhdCBkb2VzIGl0IG1lYW4gd2hlbiBpdCBpcyBzZXQ/Cj4KPiBUbyBjbGFyaWZ5IHRoZSBpbnRl
bmRlZCB1c2FnZSwgSSB3b3VsZCBwcm9wb3NlIGFkZGluZyB0aGUgZm9sbG93aW5nCj4gZXhwbGFu
YXRpb24gdG8gdGhlIGNvbW1pdCBtZXNzYWdlOgo+Cj4gIlRoaXMgZmxhZyBpcyBpbnRlbmRlZCB0
byBiZSBzZXQgYnkgYSBnZW5lcmljIFBNIGRvbWFpbiBkcml2ZXIgKGUuZy4sCj4gZnJvbSB3aXRo
aW4gaXRzIGF0dGFjaF9kZXYgY2FsbGJhY2spIHRvIGluZGljYXRlIHRoYXQgaXQgd2lsbCBtYW5h
Z2UKPiBwbGF0Zm9ybSBzcGVjaWZpYyBydW50aW1lIHBvd2VyIG1hbmFnZW1lbnQgcmVzb3VyY2Vz
IOKAlCBzdWNoIGFzIGNsb2Nrcwo+IGFuZCByZXNldHMg4oCUIG9uIGJlaGFsZiBvZiB0aGUgY29u
c3VtZXIgZGV2aWNlLiBUaGlzIGltcGxpZXMgYSBkZWxlZ2F0aW9uCj4gb2YgcnVudGltZSBQTSBj
b250cm9sIHRvIHRoZSBQTSBkb21haW4sIHR5cGljYWxseSBpbXBsZW1lbnRlZCB0aHJvdWdoCj4g
aXRzIHN0YXJ0IGFuZCBzdG9wIGNhbGxiYWNrcy4KPgo+IFdoZW4gdGhpcyBmbGFnIGlzIHNldCwg
dGhlIGNvbnN1bWVyIGRyaXZlciAoZS5nLiwgZHJtL2ltYWdpbmF0aW9uKSBjYW4KPiBjaGVjayBp
dCBhbmQgc2tpcCBtYW5hZ2luZyBzdWNoIHJlc291cmNlcyBpbiBpdHMgcnVudGltZSBQTSBjYWxs
YmFja3MKPiAocnVudGltZV9zdXNwZW5kLCBydW50aW1lX3Jlc3VtZSksIGF2b2lkaW5nIGNvbmZs
aWN0cyBvciByZWR1bmRhbnQKPiBvcGVyYXRpb25zLiIKClRoaXMgc291bmRzIGdvb2QgYW5kIEkg
d291bGQgYWxzbyBwdXQgaXQgaW50byBhIGNvZGUgY29tbWVudCBzb21ld2hlcmUuCgpJIGd1ZXNz
IHlvdSdsbCBuZWVkIGhlbHBlcnMgZm9yIHNldHRpbmcgYW5kIHRlc3RpbmcgdGhpcyBmbGFnLCBz
bwp0aGVpciBrZXJuZWxkb2MgY29tbWVudHMgY2FuIGJlIHVzZWQgZm9yIHRoYXQuCgo+IFRoaXMg
Y291bGQgYWxzbyBiZSBpbmNsdWRlZCBhcyBhIGNvZGUgY29tbWVudCBuZWFyIHRoZSBmbGFnIGRl
ZmluaXRpb24KPiBpZiB5b3UgdGhpbmsgdGhhdOKAmXMgYXBwcm9wcmlhdGUuCj4KPiBBbHNvLCBh
cyBkaXNjdXNzZWQgZWFybGllciB3aXRoIE1heGltZSBhbmQgTWF0dCBbMV0sIHRoaXMgaXMgbm90
IGFib3V0Cj4gZnVsbCAicmVzb3VyY2Ugb3duZXJzaGlwLCIgYnV0IG1vcmUgYWJvdXQgZGVsZWdh
dGluZyBydW50aW1lIGNvbnRyb2wgb2YKPiBQTSByZXNvdXJjZXMgbGlrZSBjbG9ja3MvcmVzZXRz
IHRvIHRoZSBnZW5wZC4gVGhhdCBudWFuY2UgbWF5IGJlIHdvcnRoCj4gcmVmbGVjdGluZyBpbiB0
aGUgZmxhZyBuYW1lIGFzIHdlbGwsIEkgd291bGQgcmVuYW1lIGl0IHRvIGxldCdzIHNheQo+ICdy
dW50aW1lX3BtX3BsYXRmb3JtX3Jlc19kZWxlZ2F0ZWQnLCBvciBtb3JlIGNvbmNpc2UKPiAncnVu
dGltZV9wbV9kZWxlZ2F0ZWQnLgoKT3IganVzdCAicnBtX2RlbGVnYXRlZCIgSSBzdXBwb3NlLgoK
QnV0IGlmIHRoZSBnZW5wZCBkcml2ZXIgaXMgZ29pbmcgdG8gc2V0IHRoYXQgZmxhZywgaXQgd2ls
bCByYXRoZXIgbWVhbgp0aGF0IHRoaXMgZHJpdmVyIHdpbGwgbm93IGNvbnRyb2wgdGhlIHJlc291
cmNlcyBpbiBxdWVzdGlvbiwgc28gdGhlCmRyaXZlciBzaG91bGQgbm90IGF0dGVtcHQgdG8gbWFu
aXB1bGF0ZSB0aGVtIGRpcmVjdGx5LiAgSXMgbXkKdW5kZXJzdGFuZGluZyBjb3JyZWN0PwoKQXNz
dW1pbmcgdGhhdCBpdCBpcyBjb3JyZWN0LCBob3cgaXMgdGhlIGRldmljZSBkcml2ZXIgZ29pbmcg
dG8ga25vdwp3aGljaCByZXNvdXJjZXMgaW4gcGFydGljdWxhciBhcmUgbm93IGNvbnRyb2xsZWQg
YnkgdGhlIGdlbnBkIGRyaXZlcj8KCkFsc28gInJwbV90YWtlb3ZlciIgbWF5IGJlIGEgYmV0dGVy
IG5hbWUgZm9yIHRoZSBmbGFnIGluIHRoYXQgY2FzZS4KCj4gWzFdIC0gaHR0cHM6Ly9sb3JlLmtl
cm5lbC5vcmcvYWxsL2EzMTQyMjU5LTFjNzItNDViOS1iMTQ4LTVlNWU2YmVmODdmOUBzYW1zdW5n
LmNvbS8KPgo+ID4KPiA+PiBUaGlzIGZsYWcgZW5hYmxlcyBkZXZpY2UgZHJpdmVycyB0byBjb29w
ZXJhdGUgd2l0aCBTb0Mtc3BlY2lmaWMgUE0KPiA+PiBkb21haW5zIGJ5IGNvbmRpdGlvbmFsbHkg
c2tpcHBpbmcgbWFuYWdlbWVudCBvZiBjbG9ja3MgYW5kIHJlc2V0cyB3aGVuCj4gPj4gdGhlIHBs
YXRmb3JtIG93bnMgdGhlbS4KPiA+Pgo+ID4+IFRoaXMgaWRlYSB3YXMgZGlzY3Vzc2VkIG9uIHRo
ZSBtYWlsaW5nIGxpc3QgWzFdLgo+ID4+Cj4gPj4gWzFdIC0gaHR0cHM6Ly9sb3JlLmtlcm5lbC5v
cmcvYWxsL0NBUER5S0ZxPUJGNWYyaV9TcjFjbVZxdFZBTWdyPTBGcXNrc0w3UkhaTEtuKyt5MHV3
Z0BtYWlsLmdtYWlsLmNvbS8KPiA+Pgo+ID4+IFNpZ25lZC1vZmYtYnk6IE1pY2hhbCBXaWxjenlu
c2tpIDxtLndpbGN6eW5za2lAc2Ftc3VuZy5jb20+Cj4gPj4gLS0tCj4gPj4gIGluY2x1ZGUvbGlu
dXgvZGV2aWNlLmggfCAxMSArKysrKysrKysrKwo+ID4+ICBpbmNsdWRlL2xpbnV4L3BtLmggICAg
IHwgIDEgKwo+ID4+ICAyIGZpbGVzIGNoYW5nZWQsIDEyIGluc2VydGlvbnMoKykKPiA+Pgo+ID4+
IGRpZmYgLS1naXQgYS9pbmNsdWRlL2xpbnV4L2RldmljZS5oIGIvaW5jbHVkZS9saW51eC9kZXZp
Y2UuaAo+ID4+IGluZGV4IDc5ZTQ5ZmU0OTRiN2M0YzcwZDkwMjg4NmRiNjNjNGNmZTViNGRlNGYu
LjNlN2EzNmRkODc0Y2ZiNmI5OGUyNDUxYzdhODc2OTg5YWE5ZjE5MTMgMTAwNjQ0Cj4gPj4gLS0t
IGEvaW5jbHVkZS9saW51eC9kZXZpY2UuaAo+ID4+ICsrKyBiL2luY2x1ZGUvbGludXgvZGV2aWNl
LmgKPiA+PiBAQCAtODgxLDYgKzg4MSwxNyBAQCBzdGF0aWMgaW5saW5lIGJvb2wgZGV2aWNlX2Fz
eW5jX3N1c3BlbmRfZW5hYmxlZChzdHJ1Y3QgZGV2aWNlICpkZXYpCj4gPj4gICAgICAgICByZXR1
cm4gISFkZXYtPnBvd2VyLmFzeW5jX3N1c3BlbmQ7Cj4gPj4gIH0KPiA+Pgo+ID4+ICtzdGF0aWMg
aW5saW5lIGJvb2wgZGV2aWNlX3BsYXRmb3JtX3Jlc291cmNlc19wbV9tYW5hZ2VkKHN0cnVjdCBk
ZXZpY2UgKmRldikKPiA+Cj4gPiBDb3VsZCB0aGlzIGZ1bmN0aW9uIG5hbWUgYmUgc2hvcnRlcj8K
Pgo+IE1heWJlOgo+Cj4gc3RhdGljIGlubGluZSBib29sIGRldl9pc19ydW50aW1lX3BtX2RlbGVn
YXRlZChzdHJ1Y3QgZGV2aWNlICpkZXYpOwo+IHN0YXRpYyBpbmxpbmUgdm9pZCBkZXZfc2V0X3J1
bnRpbWVfcG1fZGVsZWdhdGVkKHN0cnVjdCBkZXZpY2UgKmRldiwgYm9vbCB2YWwpOwoKV2hhdCBh
Ym91dAoKZGV2X3BtX2dlbnBkX3JwbV9kZWxlZ2F0ZWQoKQpkZXZfcG1fZ2VucGRfc2V0X3JwbV9k
ZWxlZ2F0ZWQoKQoKcmVzcGVjdGl2ZWx5IChvciBhbmFsb2dvdXNseSB3aXRoIHRoZSAidGFrZW92
ZXIiIHZhcmlhbnQpPwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVh
ZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1y
aXNjdgo=
