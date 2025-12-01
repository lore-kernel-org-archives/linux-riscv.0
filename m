Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1081BD116F5
	for <linux-riscv@archiver.kernel.org>; Mon,  1 Dec 2025 12:09:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bQF99GE1IjWeHjdWVnUK1F5jYIcFEBjxD8QwoFV5UWQ=; b=POaQzNU0I+R454
	i8L/1UKOLuS8CP3SEFxVj1D9zb7tUXO3xVNhHhfjk23ciNfsG+mle3CdX7MHy0KLqfwR1MpotPWDk
	/QtNpS1hZOddzrrt1fPFLJN2dEVhWadgCE9flTbQfQeh/jDloiyy5ZezYmt0iN5TOuMMa9nWDZPdJ
	6kKGpiyN7xTDbvv8Aj1DUXpS1nm1DJSUCfvyDFIzDEZVzfy2eqTyG4US6+E+WI7+Y0mwnUouMBhal
	LWdp6g4Xxm12EXyKA5L7GlwfCZZankXQE3C/1LVqOue9DIxBSOOHyivV3PWkyDFQ9dwAvnT1l4RDt
	/zi1LoPxPNMRySDFapRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQ2il-00000003WJ7-2vHL;
	Mon, 01 Dec 2025 12:09:35 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQ2ik-00000003WIv-2RGG
	for linux-riscv@lists.infradead.org;
	Mon, 01 Dec 2025 12:09:34 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 678A460183
	for <linux-riscv@lists.infradead.org>; Mon,  1 Dec 2025 12:09:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DFA35C2BCB0
	for <linux-riscv@lists.infradead.org>; Mon,  1 Dec 2025 12:09:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764590972;
	bh=V7/+ERyp4pNIFjCspoz+ZgEfK/xlH8w1gbN3iPr+wDA=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=l09Kox3uckV32NzqZoBP49CTltrQrS9tJ30UkMTZH+O8lM+1eWB6CQ0blIT6V7l7Z
	 MaxITZEHDLg5JyjbU/IpQMUAultHUHb+MxK+kkivjUBhGUewI3JVhWT1LDzjxfXCvT
	 WIKzzu11+OIJjwiijArJwqX5YWJshASqrYMysX5JZCWmSVTi06+AUMnPmeTq2vHkz3
	 ldQ9sRa5vZHKJmKoy9vwzQzhPg2lVwvRUaJOyWwJZscCVTIfzxRcaGuMuLBZtut9jX
	 T/Y/2rlNSKn2rI18j1DVBqsT3/xUBgDgEGlFHaysvdr74lBh0NHqBQ+WlgAYgdP9QW
	 /suIX4RgjygNA==
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-645a13e2b17so438508a12.2
        for <linux-riscv@lists.infradead.org>; Mon, 01 Dec 2025 04:09:32 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWtojZm5n749945e9IlEPv+q/Au88BdDEvKX1nC/DzAePriw5NrROqbEnVVP3CV8/U5mEzLEhvtQOLbTg==@lists.infradead.org
X-Gm-Message-State: AOJu0YwW5r5e247TfdoYwFPqKj1uTPRnmfrW0SzQDHeC5SgDZYQCzWaP
	+JuKf7vwfwdUtJOyQN4AkX2HBipt5CeyDCKFpksK1jWE/Z6pXFqFDVnFybMcjaHS/NsJdVFRb/U
	njsKGYXo1oGJdCSogy40BIccP9YsxPA==
X-Google-Smtp-Source: AGHT+IEcDturveeXbAPOvI03t+2mfqN/gd2vN2Z1+zAFtx92TBPjSq1v9AIskB1QKnZO/wMhbOKRn/nC/N68SlC2IZA=
X-Received: by 2002:a05:6402:24d4:b0:647:550a:2f3a with SMTP id
 4fb4d7f45d1cf-647550a2f6dmr10431326a12.5.1764590971288; Mon, 01 Dec 2025
 04:09:31 -0800 (PST)
MIME-Version: 1.0
References: <fbe6fc3657070fe2df7f0529043542b52b827449.1763116833.git.geert+renesas@glider.be>
 <dyaqe3ssrn65r5xndlwe7tlbiw2lbwvu3q3lzusfgr5mgycp6h@gfzyxk7uyva7>
In-Reply-To: <dyaqe3ssrn65r5xndlwe7tlbiw2lbwvu3q3lzusfgr5mgycp6h@gfzyxk7uyva7>
From: Rob Herring <robh@kernel.org>
Date: Mon, 1 Dec 2025 06:09:19 -0600
X-Gmail-Original-Message-ID: <CAL_JsqJ4q2=UJbuhfbvsbr2T+SRGXsPSXCLk6iXZid_qwYrN4g@mail.gmail.com>
X-Gm-Features: AWmQ_bll_oC_tgf1b5ZIAhVC1cA-X0XmZsvsQaxWAPl7DDgn0OlVRlT9HA5H8IM
Message-ID: <CAL_JsqJ4q2=UJbuhfbvsbr2T+SRGXsPSXCLk6iXZid_qwYrN4g@mail.gmail.com>
Subject: Re: [PATCH v2] of/irq: Ignore interrupt parent for nodes without interrupts
To: Ioana Ciornei <ioana.ciornei@nxp.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>, Saravana Kannan <saravanak@google.com>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Samuel Holland <samuel@sholland.org>, Marc Zyngier <maz@kernel.org>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	Magnus Damm <magnus.damm@gmail.com>, devicetree@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org
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

T24gRnJpLCBOb3YgMjgsIDIwMjUgYXQgMTA6NDPigK9BTSBJb2FuYSBDaW9ybmVpIDxpb2FuYS5j
aW9ybmVpQG54cC5jb20+IHdyb3RlOgo+Cj4gT24gRnJpLCBOb3YgMTQsIDIwMjUgYXQgMTE6NDc6
NTRBTSArMDEwMCwgR2VlcnQgVXl0dGVyaG9ldmVuIHdyb3RlOgo+ID4gVGhlIERldmljZXRyZWUg
U3BlY2lmaWNhdGlvbiBzdGF0ZXM6Cj4gPgo+ID4gICAgIFRoZSByb290IG9mIHRoZSBpbnRlcnJ1
cHQgdHJlZSBpcyBkZXRlcm1pbmVkIHdoZW4gdHJhdmVyc2FsIG9mIHRoZQo+ID4gICAgIGludGVy
cnVwdCB0cmVlIHJlYWNoZXMgYW4gaW50ZXJydXB0IGNvbnRyb2xsZXIgbm9kZSB3aXRob3V0IGFu
Cj4gPiAgICAgaW50ZXJydXB0cyBwcm9wZXJ0eSBhbmQgdGh1cyBubyBleHBsaWNpdCBpbnRlcnJ1
cHQgcGFyZW50Lgo+ID4KPiA+IEhvd2V2ZXIsIG9mX2lycV9pbml0KCkgZ3JhdHVpdG91c2x5IGFz
c3VtZXMgdGhhdCBhIG5vZGUgd2l0aG91dAo+ID4gaW50ZXJydXB0cyBoYXMgYW4gYWN0dWFsIGlu
dGVycnVwdCBwYXJlbnQgaWYgaXQgZmluZHMgYW4KPiA+IGludGVycnVwdC1wYXJlbnQgcHJvcGVy
dHkgaGlnaGVyIHVwIGluIHRoZSBkZXZpY2UgdHJlZS4gIEhlbmNlIHdoZW4gc3VjaAo+ID4gYSBw
cm9wZXJ0eSBpcyBwcmVzZW50IChlLmcuIGluIHRoZSByb290IG5vZGUpLCB0aGUgcm9vdCBpbnRl
cnJ1cHQKPiA+IGNvbnRyb2xsZXIgbWF5IG5vdCBiZSBkZXRlY3RlZCBhcyBzdWNoLCBjYXVzaW5n
IGEgcGFuaWM6Cj4gPgo+ID4gICAgIE9GOiBvZl9pcnFfaW5pdDogY2hpbGRyZW4gcmVtYWluLCBi
dXQgbm8gcGFyZW50cwo+ID4gICAgIEtlcm5lbCBwYW5pYyAtIG5vdCBzeW5jaW5nOiBObyBpbnRl
cnJ1cHQgY29udHJvbGxlciBmb3VuZC4KPiA+Cj4gPiBDb21taXQgZTkxMDMzNjIxZDU2ZTA1NSAo
Im9mL2lycTogVXNlIGludGVycnVwdHMtZXh0ZW5kZWQgdG8gZmluZAo+ID4gcGFyZW50IikgYWxy
ZWFkeSBmaXhlZCBhIGZpcnN0IHBhcnQsIGJ5IGNoZWNraW5nIGZvciB0aGUgcHJlc2VuY2Ugb2Yg
YW4KPiA+IGludGVycnVwdHMtZXh0ZW5kZWQgcHJvcGVydHkuICBGaXggdGhlIHNlY29uZCBwYXJ0
IGJ5IG9ubHkgY2FsbGluZwo+ID4gb2ZfaXJxX2ZpbmRfcGFyZW50KCkgd2hlbiBhbiBpbnRlcnJ1
cHRzIHByb3BlcnR5IGlzIHByZXNlbnQuCj4gPgo+ID4gU2lnbmVkLW9mZi1ieTogR2VlcnQgVXl0
dGVyaG9ldmVuIDxnZWVydCtyZW5lc2FzQGdsaWRlci5iZT4KPiA+IHYyOgo+ID4gICAtIFNwbGl0
IG9mZiBmcm9tIHNlcmllcyAiW1BBVENIL1JGQyAwLzJdIG9mL2lycTogRml4IHJvb3QgaW50ZXJy
dXB0Cj4gPiAgICAgY29udHJvbGxlciBoYW5kbGluZyJbMV0gdG8gcmVsYXggZGVwZW5kZW5jaWVz
LAo+ID4gICAtIERyb3AgUkZDLgo+ID4KPiA+IFsxXSBodHRwczovL2xvcmUua2VybmVsLm9yZy9h
bGwvY292ZXIuMTc1OTQ4NTY2OC5naXQuZ2VlcnQrcmVuZXNhc0BnbGlkZXIuYmUKPiA+IC0tLQo+
ID4gIGRyaXZlcnMvb2YvaXJxLmMgfCAyICstCj4gPiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0
aW9uKCspLCAxIGRlbGV0aW9uKC0pCj4gPgo+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvb2YvaXJx
LmMgYi9kcml2ZXJzL29mL2lycS5jCj4gPiBpbmRleCBiMTc0ZWMyOTY0ODk1NWM2Li41Y2IxY2E4
OWMxZDg3MjVkIDEwMDY0NAo+ID4gLS0tIGEvZHJpdmVycy9vZi9pcnEuYwo+ID4gKysrIGIvZHJp
dmVycy9vZi9pcnEuYwo+ID4gQEAgLTYxMyw3ICs2MTMsNyBAQCB2b2lkIF9faW5pdCBvZl9pcnFf
aW5pdChjb25zdCBzdHJ1Y3Qgb2ZfZGV2aWNlX2lkICptYXRjaGVzKQo+ID4gICAgICAgICAgICAg
ICAgKiBhcmUgdGhlIHNhbWUgZGlzdGFuY2UgYXdheSBmcm9tIHRoZSByb290IGlycSBjb250cm9s
bGVyLgo+ID4gICAgICAgICAgICAgICAgKi8KPiA+ICAgICAgICAgICAgICAgZGVzYy0+aW50ZXJy
dXB0X3BhcmVudCA9IG9mX3BhcnNlX3BoYW5kbGUobnAsICJpbnRlcnJ1cHRzLWV4dGVuZGVkIiwg
MCk7Cj4gPiAtICAgICAgICAgICAgIGlmICghZGVzYy0+aW50ZXJydXB0X3BhcmVudCkKPiA+ICsg
ICAgICAgICAgICAgaWYgKCFkZXNjLT5pbnRlcnJ1cHRfcGFyZW50ICYmIG9mX3Byb3BlcnR5X3By
ZXNlbnQobnAsICJpbnRlcnJ1cHRzIikpCj4gPiAgICAgICAgICAgICAgICAgICAgICAgZGVzYy0+
aW50ZXJydXB0X3BhcmVudCA9IG9mX2lycV9maW5kX3BhcmVudChucCk7Cj4gPiAgICAgICAgICAg
ICAgIGlmIChkZXNjLT5pbnRlcnJ1cHRfcGFyZW50ID09IG5wKSB7Cj4gPiAgICAgICAgICAgICAg
ICAgICAgICAgb2Zfbm9kZV9wdXQoZGVzYy0+aW50ZXJydXB0X3BhcmVudCk7Cj4gPiAtLQo+ID4g
Mi40My4wCj4gPgo+ID4KPgo+IFRoaXMgY2hhbmdlIGlycS1scy1leHRpcnEgYW5kIGNvbW1pdCA2
YmE1MWI3YjM0Y2EgKCJvZi9pcnE6IEhhbmRsZQo+IGV4cGxpY2l0IGludGVycnVwdCBwYXJlbnQi
KSBkb2VzIG5vdCBoZWxwIHdpdGggdGhlIGlzc3VlLgo+Cj4gVGhpcyBpcyBob3cgdGhlIERUIG5v
ZGUgaW4gbHgyMTYwYS5kdHNpIGxvb2tzIGxpa2U6Cgpscy1leHRpcnEgc3RyaWtlcyBhZ2FpbiEK
CkkgdGhpbmsgc29tZXRoaW5nIGxpa2UgdGhpcyBzaG91bGQgZml4IGl0OgoKZGlmZiAtLWdpdCBh
L2RyaXZlcnMvb2YvaXJxLmMgYi9kcml2ZXJzL29mL2lycS5jCmluZGV4IDIyNzExMTBiNWY3Yy4u
YzA2Yzc0YWVmODAxIDEwMDY0NAotLS0gYS9kcml2ZXJzL29mL2lycS5jCisrKyBiL2RyaXZlcnMv
b2YvaXJxLmMKQEAgLTU5Myw3ICs1OTMsOCBAQCB2b2lkIF9faW5pdCBvZl9pcnFfaW5pdChjb25z
dCBzdHJ1Y3Qgb2ZfZGV2aWNlX2lkICptYXRjaGVzKQogICAgICAgICAgICAgICAgICogYXJlIHRo
ZSBzYW1lIGRpc3RhbmNlIGF3YXkgZnJvbSB0aGUgcm9vdCBpcnEgY29udHJvbGxlci4KICAgICAg
ICAgICAgICAgICAqLwogICAgICAgICAgICAgICAgZGVzYy0+aW50ZXJydXB0X3BhcmVudCA9IG9m
X3BhcnNlX3BoYW5kbGUobnAsCiJpbnRlcnJ1cHRzLWV4dGVuZGVkIiwgMCk7Ci0gICAgICAgICAg
ICAgICBpZiAoIWRlc2MtPmludGVycnVwdF9wYXJlbnQgJiYgb2ZfcHJvcGVydHlfcHJlc2VudChu
cCwKImludGVycnVwdHMiKSkKKyAgICAgICAgICAgICAgIGlmICghZGVzYy0+aW50ZXJydXB0X3Bh
cmVudCAmJgorICAgICAgICAgICAgICAgICAgIChvZl9wcm9wZXJ0eV9wcmVzZW50KG5wLCAiaW50
ZXJydXB0cyIpIHx8Cm9mX3Byb3BlcnR5X3ByZXNlbnQobnAsICJpbnRlcnJ1cHQtbWFwIikpCiAg
ICAgICAgICAgICAgICAgICAgICAgIGRlc2MtPmludGVycnVwdF9wYXJlbnQgPSBvZl9pcnFfZmlu
ZF9wYXJlbnQobnApOwogICAgICAgICAgICAgICAgZWxzZSBpZiAoIWRlc2MtPmludGVycnVwdF9w
YXJlbnQpCiAgICAgICAgICAgICAgICAgICAgICAgIGRlc2MtPmludGVycnVwdF9wYXJlbnQgPSBv
Zl9wYXJzZV9waGFuZGxlKG5wLAoiaW50ZXJydXB0LXBhcmVudCIsIDApOwoKCkJ1dCByZWFsbHks
IGF0IHNvbWUgcG9pbnQgaXQgc2hvdWxkIGJlIGNvbnZlcnRlZCB0byBhIHByb3BlciBkcml2ZXIg
YXMKdGhlcmUncyBubyByZWFzb24gZXh0aXJxIG5lZWRzIHRvIGJlIGluaXRpYWxpemVkIGVhcmx5
LgoKUm9iCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwps
aW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpo
dHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
