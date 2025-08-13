Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8549C87FCF
	for <linux-riscv@archiver.kernel.org>; Wed, 13 Aug 2025 19:44:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=khFhQiMF4n4Uhv6BWDsavz6Wufg/pK+jFCKPMV4EnIg=; b=YThxAFB0zx7F27
	ejfv6ZpeDlvuxcaD80kx2f++wQqAQJWbEV+o+eqk0v0wAPYhvlwWHY3bNo12/aBgyHOOVdnPdGr3h
	cGJIKJ9GxgtV/TmYctkNWC6pGD2oe+l4Ml6OGYn4j/IRDa4cUxo8EpKlfGd5z11ZV63Lq5uqjAAPC
	n7l7w2hOO5IYqUWY5lSAp0KCEFHARPU32YnoVKbNcXjbF3OxPq2sNKTONVKkisrime8FQMrUvAioh
	X6wAdgkCOh/fo6U7pIWhtQ1NcDh7yRF44LEm88Jdi6Mv1GC+WDicfjvqnGtGfyeMqkiNf+QNSJnop
	WWyEAVCmjCWOMB/0A1xw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umHP1-0000000Epwp-2ulG;
	Wed, 13 Aug 2025 19:44:51 +0000
Received: from sender4-op-o15.zoho.com ([136.143.188.15])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umF5R-0000000EZHW-2pfn
	for linux-riscv@lists.infradead.org;
	Wed, 13 Aug 2025 17:16:31 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1755105383; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=jCQPNJr6Utb/IlNo0c8yh/wBg6V3a4jV4YOu499PaP5V9JNEo+37DQdj1L8DDWz6x9MtSmbbSkcvgdXVSXYhbrLavEUw+9QqHBcEZ7hR8aZ9VOd643rMtBnKa4P4UPiI+d//GI8cP5rNSDQzk9kqaunePIashDXg/JWkXjWWeBA=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1755105383; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=/vzN8wPcA9iD7oRNZZjvZq9B0/vfABdMxfyd+edq4jg=; 
	b=fzIOjNerQkYl18WMmAC95Xva0mnqlL85u99Fb2jQn5i4MUfbGEbfZzFART+YdTWbL63X8R1zaRMKziXHIZZlXjr09fUGsFTEj5VXChsJS0SNNYc0zQwPKwoyej/HkEsTethv8vCv+03hYFYGXBmE8IsvEboYLYivWrhixtG9XGU=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=icenowy.me;
	spf=pass  smtp.mailfrom=uwu@icenowy.me;
	dmarc=pass header.from=<uwu@icenowy.me>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1755105383;
	s=zmail2; d=icenowy.me; i=uwu@icenowy.me;
	h=Message-ID:Subject:Subject:From:From:To:To:Cc:Cc:Date:Date:In-Reply-To:References:Content-Type:Content-Transfer-Encoding:MIME-Version:Message-Id:Reply-To;
	bh=/vzN8wPcA9iD7oRNZZjvZq9B0/vfABdMxfyd+edq4jg=;
	b=hRsC4Ts2ejnqno6bRuz+O9Q/ODtnrI0mKpm0GFsGLwoZHtwuVM+pe5GydElQxCgM
	17N169BmTmgSC0N0gGho9RSnrg8cwH3cIfQI9H4HIXiTsfDFziFaYOZowCyW6SaS0Pl
	AQdQI3VJ3vsBnmEsMt1WWESs69+Yv6GysbI3W6GqvhbZIYC+8vcDHcfTUbNaGkDQdQS
	ewG9cCUxSrO36kQuIpb+BqZjBicn3q64ybDiSObDyk7sYdOTcQ+T1EqBAz/+RewdvKw
	qrLdtmJl+ZFdoW7SSygBQ2DpLay8Nz9kxEXAxdPLguJQbTFuwBYsIGANNoCYEKwRA90
	TGWvmJh+6w==
Received: by mx.zohomail.com with SMTPS id 1755105381384154.6661811070984;
	Wed, 13 Aug 2025 10:16:21 -0700 (PDT)
Message-ID: <eedd44480a76840e1fec73d4433c772c5bdc7011.camel@icenowy.me>
Subject: Re: [PATCH 0/2] clk: thead: th1520-ap: allow gate cascade and fix
 padctrl0
From: Icenowy Zheng <uwu@icenowy.me>
To: Drew Fustini <fustini@kernel.org>, Guo Ren <guoren@kernel.org>, Fu Wei
 <wefu@redhat.com>, Michael Turquette <mturquette@baylibre.com>, Stephen
 Boyd <sboyd@kernel.org>
Cc: Michal Wilczynski <m.wilczynski@samsung.com>, Yao Zi
 <ziyao@disroot.org>,  Han Gao <rabenda.cn@gmail.com>,
 linux-riscv@lists.infradead.org, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org
Date: Thu, 14 Aug 2025 01:16:16 +0800
In-Reply-To: <20250813171136.2213309-1-uwu@icenowy.me>
References: <20250813171136.2213309-1-uwu@icenowy.me>
Organization: Anthon Open-Source Community
User-Agent: Evolution 3.44.4 
MIME-Version: 1.0
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250813_101629_796052_F091FC91 
X-CRM114-Status: GOOD (  11.44  )
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

5ZyoIDIwMjUtMDgtMTTmmJ/mnJ/lm5vnmoQgMDE6MTEgKzA4MDDvvIxJY2Vub3d5IFpoZW5n5YaZ
6YGT77yaCj4gQ3VycmVudCBjY3VfZ2F0ZSBpbXBsZW1lbnRhdGlvbiBkb2VzIG5vdCBlYXNpbHkg
YWxsb3cgZ2F0ZXMgdG8gYmUKPiBjbG9jawo+IHBhcmVudHMgYmVjYXVzZSBvZiB0aGUgd2FzdGUg
b2Ygc3RydWN0IGNsa19odyBpbiBzdHJ1Y3QgY2N1X2dhdGU7Cj4gaG93ZXZlciBpdCdzIGZvdW5k
IHRoYXQgdGhlIHBhZGN0cmwwIGFwYiBjbG9jayBnYXRlIHNlZW1zIHRvIGJlCj4gZG93bnN0cmVh
bSBvZiBwZXJpc3lzLWFwYjQtaGNsaywgZ2F0aW5nIHRoZSBsYXR0ZXIgdy9vIGdhdGluZyB0aGUK
PiBmb3JtZXIKPiBtYWtlcyB0aGUgcGFkY3RybDAgcmVnaXN0ZXJzIGluYWNjZXNzaWJsZSB0b28u
Cj4gCj4gRml4IHRoaXMgYnkgcmVmYWN0b3IgY2N1X2dhdGUgY29kZSwgbWltaWNpbmcgd2hhdCBZ
YW8gWmkgZGlkIG9uCj4gY2N1X211eDsgYW5kIHRoZW4gYXNzaWduIHBlcmlzeXMtYXBiNC1oY2xr
IGFzIHBhcmVudCBvZiBwYWRjdHJsMCBidXMKPiBnYXRlLgoKRm9yZ290IHRvIG1lbnRpb24gYSBl
YXN5IHRlc3Qgb2YgdGhpcyBwYXRjaHNldDoKCkp1c3QgaW5zdGFsbCBgZ3Bpb3NldGAgZnJvbSBg
bGliZ3Bpb2RgIG9uIGEgTGljaGVlIFBpIDRBLCBwbHVnIGEgZmFuIHRvCml0cyBmYW4gcG9ydCwg
YW5kIHJ1biBgZ3Bpb3NldCAzIDM9MWAuIFRoZSBleHBlY3RlZCBiZWhhdmlvciBpcyB0aGUgZmFu
CnN0YXJ0cyB0byBzcGluIChiZWNhdXNlIEdQSU8zXzMgaXMgdGhlIHBpbiBjb250cm9sbGluZyB0
aGUgZmFuKSwKaG93ZXZlciB3aXRob3V0IHRoaXMgcGF0Y2hzZXQgTGludXggd2lsbCBmYWlsIHRv
IHN3aXRjaCB0aGF0IHBpbi4KCj4gCj4gVGhpcyBwYXRjaHNldCBkZXBlbmRzIG9uIHRoZSBkaXNw
bGF5IGNsb2NrIHBhdGNoc2V0IGF0IFsxXSwgYWx0aG91Z2gKPiBhCj4gcmViYXNpbmcgdG8gZ2V0
IHJpZCBvZiB0aGlzIGRlcGVuZGVuY3kgaXMgcG9zc2libGUuCj4gCj4gWzFdCj4gaHR0cHM6Ly9s
b3JlLmtlcm5lbC5vcmcvbGludXgtcmlzY3YvMjAyNTA4MTMwNzI3MDIuMjE3Njk5My0xLXV3dUBp
Y2Vub3d5Lm1lLwo+IAo+IEljZW5vd3kgWmhlbmcgKDIpOgo+IMKgIGNsazogdGhlYWQ6IHRoMTUy
MC1hcDogZGVzY3JpYmUgZ2F0ZSBjbG9ja3Mgd2l0aCBjbGtfZ2F0ZQo+IMKgIGNsazogdGhlYWQ6
IHRoMTUyMC1hcDogZml4IHBhcmVudCBvZiBwYWRjdHJsMCBjbG9jawo+IAo+IMKgZHJpdmVycy9j
bGsvdGhlYWQvY2xrLXRoMTUyMC1hcC5jIHwgMzg1ICsrKysrKysrKysrKysrKy0tLS0tLS0tLS0t
LS0KPiAtLQo+IMKgMSBmaWxlIGNoYW5nZWQsIDE4OCBpbnNlcnRpb25zKCspLCAxOTcgZGVsZXRp
b25zKC0pCj4gCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5v
cmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNj
dgo=
