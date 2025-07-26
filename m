Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62011C87FCA
	for <linux-riscv@archiver.kernel.org>; Sat, 26 Jul 2025 00:29:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+ArUKLnuLHJymBi9YsJtUOFOvzNmRoBno6P++swHbsk=; b=szycoUpyJYMFiZ
	4vVXCqRTGOfD2shyiIA9V0dF7zHwub/6b2iORs1b3+VtsTQr+RsTg5Wu+dsUfBxPNyHm8mdh51nfW
	Ah3g6+NXSo94/aUsOlTccUlB/4x5BYoBt5Ub8cAduMIsjsKIwIB+Kwkf977Pahi9yJC3x3XqOpJ8L
	gQHH+VCmrafVxuOUGBgzfjiPbwm19u6kKhgQ8jq6IPZ+xz7lE5376OWmgspySISFs7KAJQ4trofUu
	7z0LuzxTX2JYJavrjwAIKoHvMrrGrsON0bT8DAiuU3K1c2dRm3UenJPisnhA1Z8dY5gz3ungKLBEg
	VVWojq5yx/GXGLCy8vIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ufSnF-0000000AxcD-24Ts;
	Sat, 26 Jul 2025 00:29:41 +0000
Received: from mail.gentoo.org ([2001:470:ea4a:1:5054:ff:fec7:86e4] helo=smtp.gentoo.org)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ufSlX-0000000AxY2-14cY
	for linux-riscv@lists.infradead.org;
	Sat, 26 Jul 2025 00:27:57 +0000
Received: from localhost (unknown [116.232.48.207])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dlan)
	by smtp.gentoo.org (Postfix) with ESMTPSA id 90FC3340DF2;
	Sat, 26 Jul 2025 00:27:52 +0000 (UTC)
Date: Sat, 26 Jul 2025 08:27:43 +0800
From: Yixun Lan <dlan@gentoo.org>
To: Anand Moon <linux.amoon@gmail.com>
Cc: Alex Elder <elder@riscstar.com>,
	"open list:RISC-V MISC SOC SUPPORT" <linux-riscv@lists.infradead.org>,
	spacemit@lists.linux.dev
Subject: Re: spacemit: P1 PMIC support on Banana pi F3 testing
Message-ID: <20250726002743-GYA752238@gentoo>
References: <CANAwSgT-z-sQoJtT+DVNywObEwnmMSgK4uPXxhk=Bxx8TK483Q@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CANAwSgT-z-sQoJtT+DVNywObEwnmMSgK4uPXxhk=Bxx8TK483Q@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250725_172755_320135_CC9FDAF3 
X-CRM114-Status: GOOD (  21.44  )
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

SGkgQW5hbmQsCgpPbiAxNToyNiBUaHUgMjQgSnVsICAgICAsIEFuYW5kIE1vb24gd3JvdGU6Cj4g
SGkgQWxleCwKPiAKPiBUaGFuayB5b3UgZm9yIHlvdXIgd29yayBvbiB0aGUgUDEgUE1JQyBwYXRj
aCBmb3IgU3BhY2VtaXQgSzEgU29DIC0gQmFuYW5hIFBpIEYzLgo+IAo+IEkndmUgYmVlbiB0ZXN0
aW5nIHlvdXIgcGF0Y2ggc2VyaWVzIGZvciB0aGUgQmFuYW5hIFBpIEYzIFswXSB0byBlbmFibGUg
U0QgY2FyZAo+IGFuZCBlTU1DIGZ1bmN0aW9uYWxpdHksCj4gCj4gWzBdIGh0dHBzOi8vcGF0Y2hl
dy5vcmcvbGludXgvMjAyNTA3MTAxNzUxMDcuMTI4MDIyMS0xLWVsZGVyQHJpc2NzdGFyLmNvbS8K
PiAKPiBXaGlsZSBkZWJ1Z2dpbmcsIEkgY3Jvc3MtcmVmZXJlbmNlZCB0aGUgcGF0Y2ggd2l0aCB0
aGUgQlBJLUYzLVYzIGJvYXJkCj4gc2NoZW1hdGljIFsxXQo+IGFuZCBub3RpY2VkIHNldmVyYWwg
ZGlzY3JlcGFuY2llcyBpbiB0aGUgcG93ZXIgY29uZmlndXJhdGlvbjoKPiAKPiBbMV0gaHR0cHM6
Ly9kcml2ZS5nb29nbGUuY29tL2ZpbGUvZC8xOWlMSjV4bkNCX29LOFZlUWprUEdqekFuMzlXWXl5
bHYvdmlldwo+IAo+IEluY29ycmVjdCBWb2x0YWdlIFJhbmdlczogVGhlIG1pbmltdW0gYW5kIG1h
eGltdW0gdm9sdGFnZSB2YWx1ZXMgZm9yCj4gbXVsdGlwbGUgcmVndWxhdG9ycwo+IChpbmNsdWRp
bmcgQlVDS3MsIEFMRE9zLCBhbmQgRExET3MpIEluIHRoZSBwYXRjaCwgZG8gbm90IG1hdGNoIHRo
ZQo+IHNwZWNpZmljYXRpb25zIGluCj4gdGhlIHNjaGVtYXRpYydzIHBvd2VyIHRyZWUuCj4gCj4g
TWlzc2luZy9JbmNvcnJlY3QgTGFiZWxzOiBNYW55IHJlZ3VsYXRvcnMgYXJlIG1pc3NpbmcgYWNj
dXJhdGUgbGFiZWxzIGFuZCBuYW1lcywKPiB3aGljaCBtYWtlcyBtYXBwaW5nIHRoZW0gdG8gdGhl
IGhhcmR3YXJlIGRpZmZpY3VsdC4KPiAKPiBEZXZpY2UgVHJlZSBNYXBwaW5nOiBUbyBjb25maWd1
cmUgdGhlIHBvd2VyIHNvdXJjZXMgY29ycmVjdGx5LCB0aGUgazEKPiB1c2VyIG5hbWVzIGZyb20K
PiB0aGUgc2NoZW1hdGljIG5lZWRzIHRvIGJlIHByb3Blcmx5IG1hcHBlZCB0byBpdHMgY29ycmVz
cG9uZGluZyBkZXZpY2UKPiB0cmVlIG5vZGVzLgo+IAo+IEnigJl2ZSBwdXQgdG9nZXRoZXIgYSBz
ZXQgb2YgbG9jYWwgY2hhbmdlcyB0byBiZXR0ZXIgYWxpZ24gdGhlIHJlZ3VsYXRvcgo+IGRlZmlu
aXRpb25zIHdpdGggdGhlIGJvYXJkIHNjaGVtYXRpYy4KPiBUaGVzZSBhZGp1c3RtZW50cyBoZWxw
IGltcHJvdmUgdGhlIGhhcmR3YXJlIG1hcHBpbmcgdG8gdGhlIFBNSUMKPiByZWd1bGF0b3JzLCB0
aG91Z2ggc29tZSBkZXRhaWxzCj4gbWF5IHN0aWxsIG5lZWQgcmVmaW5lbWVudC4gSWYgeW91IGZp
bmQgdGhlIGNoYW5nZXMgaGVscGZ1bCwgcGxlYXNlCj4gY29uc2lkZXIgaW5jb3Jwb3JhdGluZyB0
aGVtIGludG8KPiB0aGUgbmV4dCByZXZpc2lvbiBvZiB0aGUgcGF0Y2guCj4gCj4gSeKAmWQgYmUg
Z3JhdGVmdWwgaWYgeW91IGNvdWxkIENjIG1lIG9uIGFueSBmdXR1cmUgY29tbXVuaWNhdGlvbgo+
IHJlZ2FyZGluZyB0ZXN0aW5nLgo+IGFzIEkgZGlkbuKAmXQgcmVjZWl2ZSB0aGlzIHBhdGNoIHNl
cmllcyBpbiBteSBpbmJveC4KPiAKPiBUaGFua3MKPiAtQW5hbmQKPiAKPiBIZXJlIGlzIHRoZSBi
b290IGxvZyBbMl0gaHR0cHM6Ly9wYXN0ZWJpbi5jb20vY1h5YmJWYXIKPiAKPiBJdCdzIG5vdCB3
b3JraW5nIG9uIG15IGVuZC4sIE5laXRoZXIgdGhlIGVNTUMgbm9yIHRoZSBTRCBjYXJkIGlzCj4g
Z2V0dGluZyBkZXRlY3RlZC4KdGhlIG1haW5saW5lIGRyaXZlciBpbiB0cmVlIGhhcyBubyBTRCBj
YXJkIHN1cHBvcnQsIGJ1dCBlTU1DCnNvLCB5b3UgY291bGQgb25seSB0ZXN0IGVNTUMgZm9yIG5v
dy4KCi0tIApZaXh1biBMYW4gKGRsYW4pCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlz
dHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2xpbnV4LXJpc2N2Cg==
