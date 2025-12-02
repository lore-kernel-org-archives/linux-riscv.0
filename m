Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D411D116F5
	for <linux-riscv@archiver.kernel.org>; Tue,  2 Dec 2025 21:19:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=w8dwGBuqZZuid/9Gfx7ry4n0OgBPkZT7OUShhY/wim0=; b=mDL+izoPrftUuS
	6wBaQAnclGziOaqEjqj5mqbc7hgH/+pKBF/QSkrgYUveIp3nBvL/vBa+ItkDycRE0uzLTcncY24PE
	1GP3UEYeXAj6L1J44K/QBtv4v4Qy8sRizis23a+1YK133TUcpWI5XYLxYmR0Zvx9LK5hUMOQzj9pl
	/mHq0N88dc8JC8aeLixhtSjbnQshR4nvhj5COgir0olbGP8eOY8hIUxsz/WlGWv1cfWk+gRkmcsaw
	rT8OkzAvAcRV6v4fEa0aldDzAfJt7KMWfC8hbRvuHCHzJBsiNtbdC/zyFHM57slWYPO+2h7eDlSAy
	Ki3EFqG7A40YkyrHc/Og==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQXmY-00000005qFy-0OBv;
	Tue, 02 Dec 2025 21:19:34 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQXmV-00000005qFZ-1YBj
	for linux-riscv@lists.infradead.org;
	Tue, 02 Dec 2025 21:19:32 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 7B3AD44286
	for <linux-riscv@lists.infradead.org>; Tue,  2 Dec 2025 21:19:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5A78BC2BCB0
	for <linux-riscv@lists.infradead.org>; Tue,  2 Dec 2025 21:19:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764710370;
	bh=AZASaj5aXBVLP8FVAp2pUANC9RpCBKlvtMSjV9a7KLY=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=kuWVE5xAUKf/RoJrUZHluwZNMMyyIOEbqPK1wJPuyFMYKRYusp9GI4o8NFuwoZVmO
	 QvVt9ok0NJiQFISw9ZZDaPsPjH9aStDkI7LjAox9GjKIKPs9orNnuuUsxUrbwgDhiG
	 hR2u1kZy/fe+OvZ9G3gxySVxgXRy8UYMgaaW6iw5UQeRxfMtGr1wytKBoRKT00eLwu
	 dHykF3EJz2qTNpN0cPrq4eoaO/zqenlv6FUzBDdN8ygent2GYGucY9049YsB8gk3Fa
	 8Tao9s1xqW8SCfddD8KKZL1O7+HnnSooIZ3l5b3IBMH4DfLJhqgvYPDTn2In96Fs+J
	 myQTVRC5tvVPQ==
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-b734fcbf1e3so802599166b.3
        for <linux-riscv@lists.infradead.org>; Tue, 02 Dec 2025 13:19:30 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXL4vu1jgc9Xo/S/GB9J14y3udwlEcWGdslc3xNqeCRtW2YIIJfni11ktZlNvP/yvBTXv3ZuxGe7s1BNQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yz/0tvoY/Lw+397VgDeAKEH1CHjGfcpZ+SDQdXt6Us4fslZSujp
	KvGsl9WJSguGmloIrqP3uW/0mSeu+DyztXeySsFRwINrgWfWdUFFRhpntKZfcYQLmIL8YyY5U9h
	A+usG+LLDXVIIQlGqhHm7nzV0i9WDhg==
X-Google-Smtp-Source: AGHT+IGSvertTLJx8KV/G+O5qP6vmOOBt66zoC19fcl1TNbrYXNS/rPJp4BO31NUjhkWZrh153Dkp7jy+quBZlZ+Dig=
X-Received: by 2002:a17:906:b84b:b0:b76:7b85:f630 with SMTP id
 a640c23a62f3a-b767b8643d6mr3409596366b.34.1764710368753; Tue, 02 Dec 2025
 13:19:28 -0800 (PST)
MIME-Version: 1.0
References: <fbe6fc3657070fe2df7f0529043542b52b827449.1763116833.git.geert+renesas@glider.be>
 <dyaqe3ssrn65r5xndlwe7tlbiw2lbwvu3q3lzusfgr5mgycp6h@gfzyxk7uyva7>
 <CAL_JsqJ4q2=UJbuhfbvsbr2T+SRGXsPSXCLk6iXZid_qwYrN4g@mail.gmail.com> <bgieskezxsscyg65ihbzq45opwfjavcfut7bz7ywsvufeeaoqe@47hx5fvmsi22>
In-Reply-To: <bgieskezxsscyg65ihbzq45opwfjavcfut7bz7ywsvufeeaoqe@47hx5fvmsi22>
From: Rob Herring <robh@kernel.org>
Date: Tue, 2 Dec 2025 15:19:17 -0600
X-Gmail-Original-Message-ID: <CAL_JsqJ9YUe6cy0YEMLvQhGTGmog6onTA9W5owQBP4q1viijug@mail.gmail.com>
X-Gm-Features: AWmQ_bmTQVJ_hL0pc9x1GncG71ibSKGCHF04s-qMqZd6-07jLgk75ahA_73hYM4
Message-ID: <CAL_JsqJ9YUe6cy0YEMLvQhGTGmog6onTA9W5owQBP4q1viijug@mail.gmail.com>
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
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251202_131931_477944_89CF9B62 
X-CRM114-Status: GOOD (  40.46  )
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

T24gVHVlLCBEZWMgMiwgMjAyNSBhdCAxMDozNuKAr0FNIElvYW5hIENpb3JuZWkgPGlvYW5hLmNp
b3JuZWlAbnhwLmNvbT4gd3JvdGU6Cj4KPiBPbiBNb24sIERlYyAwMSwgMjAyNSBhdCAwNjowOTox
OUFNIC0wNjAwLCBSb2IgSGVycmluZyB3cm90ZToKPiA+IE9uIEZyaSwgTm92IDI4LCAyMDI1IGF0
IDEwOjQz4oCvQU0gSW9hbmEgQ2lvcm5laSA8aW9hbmEuY2lvcm5laUBueHAuY29tPiB3cm90ZToK
PiA+ID4KPiA+ID4gT24gRnJpLCBOb3YgMTQsIDIwMjUgYXQgMTE6NDc6NTRBTSArMDEwMCwgR2Vl
cnQgVXl0dGVyaG9ldmVuIHdyb3RlOgo+ID4gPiA+IFRoZSBEZXZpY2V0cmVlIFNwZWNpZmljYXRp
b24gc3RhdGVzOgo+ID4gPiA+Cj4gPiA+ID4gICAgIFRoZSByb290IG9mIHRoZSBpbnRlcnJ1cHQg
dHJlZSBpcyBkZXRlcm1pbmVkIHdoZW4gdHJhdmVyc2FsIG9mIHRoZQo+ID4gPiA+ICAgICBpbnRl
cnJ1cHQgdHJlZSByZWFjaGVzIGFuIGludGVycnVwdCBjb250cm9sbGVyIG5vZGUgd2l0aG91dCBh
bgo+ID4gPiA+ICAgICBpbnRlcnJ1cHRzIHByb3BlcnR5IGFuZCB0aHVzIG5vIGV4cGxpY2l0IGlu
dGVycnVwdCBwYXJlbnQuCj4gPiA+ID4KPiA+ID4gPiBIb3dldmVyLCBvZl9pcnFfaW5pdCgpIGdy
YXR1aXRvdXNseSBhc3N1bWVzIHRoYXQgYSBub2RlIHdpdGhvdXQKPiA+ID4gPiBpbnRlcnJ1cHRz
IGhhcyBhbiBhY3R1YWwgaW50ZXJydXB0IHBhcmVudCBpZiBpdCBmaW5kcyBhbgo+ID4gPiA+IGlu
dGVycnVwdC1wYXJlbnQgcHJvcGVydHkgaGlnaGVyIHVwIGluIHRoZSBkZXZpY2UgdHJlZS4gIEhl
bmNlIHdoZW4gc3VjaAo+ID4gPiA+IGEgcHJvcGVydHkgaXMgcHJlc2VudCAoZS5nLiBpbiB0aGUg
cm9vdCBub2RlKSwgdGhlIHJvb3QgaW50ZXJydXB0Cj4gPiA+ID4gY29udHJvbGxlciBtYXkgbm90
IGJlIGRldGVjdGVkIGFzIHN1Y2gsIGNhdXNpbmcgYSBwYW5pYzoKPiA+ID4gPgo+ID4gPiA+ICAg
ICBPRjogb2ZfaXJxX2luaXQ6IGNoaWxkcmVuIHJlbWFpbiwgYnV0IG5vIHBhcmVudHMKPiA+ID4g
PiAgICAgS2VybmVsIHBhbmljIC0gbm90IHN5bmNpbmc6IE5vIGludGVycnVwdCBjb250cm9sbGVy
IGZvdW5kLgo+ID4gPiA+Cj4gPiA+ID4gQ29tbWl0IGU5MTAzMzYyMWQ1NmUwNTUgKCJvZi9pcnE6
IFVzZSBpbnRlcnJ1cHRzLWV4dGVuZGVkIHRvIGZpbmQKPiA+ID4gPiBwYXJlbnQiKSBhbHJlYWR5
IGZpeGVkIGEgZmlyc3QgcGFydCwgYnkgY2hlY2tpbmcgZm9yIHRoZSBwcmVzZW5jZSBvZiBhbgo+
ID4gPiA+IGludGVycnVwdHMtZXh0ZW5kZWQgcHJvcGVydHkuICBGaXggdGhlIHNlY29uZCBwYXJ0
IGJ5IG9ubHkgY2FsbGluZwo+ID4gPiA+IG9mX2lycV9maW5kX3BhcmVudCgpIHdoZW4gYW4gaW50
ZXJydXB0cyBwcm9wZXJ0eSBpcyBwcmVzZW50Lgo+ID4gPiA+Cj4gPiA+ID4gU2lnbmVkLW9mZi1i
eTogR2VlcnQgVXl0dGVyaG9ldmVuIDxnZWVydCtyZW5lc2FzQGdsaWRlci5iZT4KPiA+ID4gPiB2
MjoKPiA+ID4gPiAgIC0gU3BsaXQgb2ZmIGZyb20gc2VyaWVzICJbUEFUQ0gvUkZDIDAvMl0gb2Yv
aXJxOiBGaXggcm9vdCBpbnRlcnJ1cHQKPiA+ID4gPiAgICAgY29udHJvbGxlciBoYW5kbGluZyJb
MV0gdG8gcmVsYXggZGVwZW5kZW5jaWVzLAo+ID4gPiA+ICAgLSBEcm9wIFJGQy4KPiA+ID4gPgo+
ID4gPiA+IFsxXSBodHRwczovL2xvcmUua2VybmVsLm9yZy9hbGwvY292ZXIuMTc1OTQ4NTY2OC5n
aXQuZ2VlcnQrcmVuZXNhc0BnbGlkZXIuYmUKPiA+ID4gPiAtLS0KPiA+ID4gPiAgZHJpdmVycy9v
Zi9pcnEuYyB8IDIgKy0KPiA+ID4gPiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAx
IGRlbGV0aW9uKC0pCj4gPiA+ID4KPiA+ID4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9vZi9pcnEu
YyBiL2RyaXZlcnMvb2YvaXJxLmMKPiA+ID4gPiBpbmRleCBiMTc0ZWMyOTY0ODk1NWM2Li41Y2Ix
Y2E4OWMxZDg3MjVkIDEwMDY0NAo+ID4gPiA+IC0tLSBhL2RyaXZlcnMvb2YvaXJxLmMKPiA+ID4g
PiArKysgYi9kcml2ZXJzL29mL2lycS5jCj4gPiA+ID4gQEAgLTYxMyw3ICs2MTMsNyBAQCB2b2lk
IF9faW5pdCBvZl9pcnFfaW5pdChjb25zdCBzdHJ1Y3Qgb2ZfZGV2aWNlX2lkICptYXRjaGVzKQo+
ID4gPiA+ICAgICAgICAgICAgICAgICogYXJlIHRoZSBzYW1lIGRpc3RhbmNlIGF3YXkgZnJvbSB0
aGUgcm9vdCBpcnEgY29udHJvbGxlci4KPiA+ID4gPiAgICAgICAgICAgICAgICAqLwo+ID4gPiA+
ICAgICAgICAgICAgICAgZGVzYy0+aW50ZXJydXB0X3BhcmVudCA9IG9mX3BhcnNlX3BoYW5kbGUo
bnAsICJpbnRlcnJ1cHRzLWV4dGVuZGVkIiwgMCk7Cj4gPiA+ID4gLSAgICAgICAgICAgICBpZiAo
IWRlc2MtPmludGVycnVwdF9wYXJlbnQpCj4gPiA+ID4gKyAgICAgICAgICAgICBpZiAoIWRlc2Mt
PmludGVycnVwdF9wYXJlbnQgJiYgb2ZfcHJvcGVydHlfcHJlc2VudChucCwgImludGVycnVwdHMi
KSkKPiA+ID4gPiAgICAgICAgICAgICAgICAgICAgICAgZGVzYy0+aW50ZXJydXB0X3BhcmVudCA9
IG9mX2lycV9maW5kX3BhcmVudChucCk7Cj4gPiA+ID4gICAgICAgICAgICAgICBpZiAoZGVzYy0+
aW50ZXJydXB0X3BhcmVudCA9PSBucCkgewo+ID4gPiA+ICAgICAgICAgICAgICAgICAgICAgICBv
Zl9ub2RlX3B1dChkZXNjLT5pbnRlcnJ1cHRfcGFyZW50KTsKPiA+ID4gPiAtLQo+ID4gPiA+IDIu
NDMuMAo+ID4gPiA+Cj4gPiA+ID4KPiA+ID4KPiA+ID4gVGhpcyBjaGFuZ2UgaXJxLWxzLWV4dGly
cSBhbmQgY29tbWl0IDZiYTUxYjdiMzRjYSAoIm9mL2lycTogSGFuZGxlCj4gPiA+IGV4cGxpY2l0
IGludGVycnVwdCBwYXJlbnQiKSBkb2VzIG5vdCBoZWxwIHdpdGggdGhlIGlzc3VlLgo+ID4gPgo+
ID4gPiBUaGlzIGlzIGhvdyB0aGUgRFQgbm9kZSBpbiBseDIxNjBhLmR0c2kgbG9va3MgbGlrZToK
PiA+Cj4gPiBscy1leHRpcnEgc3RyaWtlcyBhZ2FpbiEKPiA+Cj4gPiBJIHRoaW5rIHNvbWV0aGlu
ZyBsaWtlIHRoaXMgc2hvdWxkIGZpeCBpdDoKPiA+Cj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9v
Zi9pcnEuYyBiL2RyaXZlcnMvb2YvaXJxLmMKPiA+IGluZGV4IDIyNzExMTBiNWY3Yy4uYzA2Yzc0
YWVmODAxIDEwMDY0NAo+ID4gLS0tIGEvZHJpdmVycy9vZi9pcnEuYwo+ID4gKysrIGIvZHJpdmVy
cy9vZi9pcnEuYwo+ID4gQEAgLTU5Myw3ICs1OTMsOCBAQCB2b2lkIF9faW5pdCBvZl9pcnFfaW5p
dChjb25zdCBzdHJ1Y3Qgb2ZfZGV2aWNlX2lkICptYXRjaGVzKQo+ID4gICAgICAgICAgICAgICAg
ICAqIGFyZSB0aGUgc2FtZSBkaXN0YW5jZSBhd2F5IGZyb20gdGhlIHJvb3QgaXJxIGNvbnRyb2xs
ZXIuCj4gPiAgICAgICAgICAgICAgICAgICovCj4gPiAgICAgICAgICAgICAgICAgZGVzYy0+aW50
ZXJydXB0X3BhcmVudCA9IG9mX3BhcnNlX3BoYW5kbGUobnAsCj4gPiAiaW50ZXJydXB0cy1leHRl
bmRlZCIsIDApOwo+ID4gLSAgICAgICAgICAgICAgIGlmICghZGVzYy0+aW50ZXJydXB0X3BhcmVu
dCAmJiBvZl9wcm9wZXJ0eV9wcmVzZW50KG5wLAo+ID4gImludGVycnVwdHMiKSkKPiA+ICsgICAg
ICAgICAgICAgICBpZiAoIWRlc2MtPmludGVycnVwdF9wYXJlbnQgJiYKPiA+ICsgICAgICAgICAg
ICAgICAgICAgKG9mX3Byb3BlcnR5X3ByZXNlbnQobnAsICJpbnRlcnJ1cHRzIikgfHwKPiA+IG9m
X3Byb3BlcnR5X3ByZXNlbnQobnAsICJpbnRlcnJ1cHQtbWFwIikpCj4gPiAgICAgICAgICAgICAg
ICAgICAgICAgICBkZXNjLT5pbnRlcnJ1cHRfcGFyZW50ID0gb2ZfaXJxX2ZpbmRfcGFyZW50KG5w
KTsKPiA+ICAgICAgICAgICAgICAgICBlbHNlIGlmICghZGVzYy0+aW50ZXJydXB0X3BhcmVudCkK
PiA+ICAgICAgICAgICAgICAgICAgICAgICAgIGRlc2MtPmludGVycnVwdF9wYXJlbnQgPSBvZl9w
YXJzZV9waGFuZGxlKG5wLAo+ID4gImludGVycnVwdC1wYXJlbnQiLCAwKTsKPiA+Cj4gPgo+ID4g
QnV0IHJlYWxseSwgYXQgc29tZSBwb2ludCBpdCBzaG91bGQgYmUgY29udmVydGVkIHRvIGEgcHJv
cGVyIGRyaXZlciBhcwo+ID4gdGhlcmUncyBubyByZWFzb24gZXh0aXJxIG5lZWRzIHRvIGJlIGlu
aXRpYWxpemVkIGVhcmx5Lgo+ID4KPgo+IEkganVzdCB0cmllZCBjb252ZXJ0aW5nIGxzLWV4dGly
cSB0byBhIHByb3BlciBwbGF0Zm9ybSBkcml2ZXIgYW5kIGl0J3MKPiBwcmV0dHkgc3RyYWlnaHRm
b3J3YXJkLiBUaGUgcHJvYmxlbSBpcyBnZXR0aW5nIHRoYXQgZHJpdmVyIHRvIHByb2JlIG9uCj4g
dGhlIGxzLWV4dGlycSBkdCBub2RlIHNpbmNlIG9mX3BsYXRmb3JtX3BvcHVsYXRlKCkgaXMgbm90
IGNhbGxlZCBvbiBpdHMKPiBwYXJlbnQgbm9kZS4KPgo+IEkgd291bGQgYXZvaWQgY2hhbmdpbmcg
dGhlIERUIGFuZCBhZGRpbmcgYSAic2ltcGxlLWJ1cyIgY29tcGF0aWJsZSB0bwo+IHRoZSBwYXJl
bnQgbm9kZXMuIFRoZSBvdGhlciBvcHRpb24gaXMgdG8gYWRkIGFub3RoZXIgc2ltcGxlIGRyaXZl
ciB3aGljaAo+IGp1c3QgY2FsbHMgb2ZfcGxhdGZvcm1fcG9wdWxhdGUoKSBmb3IgYWxsIGNvbXBh
dGlibGUgc3RyaW5ncyBkZWZpbmVkIGluCj4gZnNsLGxheWVyc2NhcGUtc2NmZy55YW1sLgoKVGhl
IHNpbXBsZXN0IHNvbHV0aW9uIG1pZ2h0IGJlIGFkZGluZyAnc3lzY29uJyB0byB0aGUgZGVmYXVs
dCBtYXRjaApsaXN0IGZvciBvZl9wbGF0Zm9ybV9wb3B1bGF0ZSgpLiBUaGF0J3Mga2luZCBvZiBh
IGJpZyBoYW1tZXIgdGhvdWdoCmFuZCBjb3VsZCBicmVhayBzb21ldGhpbmcuIE5vdCBzdXJlLCBi
dXQgSSdtIHdpbGxpbmcgdG8gc3RpY2sgdGhhdCBpbgpsaW51eC1uZXh0IGFuZCBzZWUuCgpBbm90
aGVyIG9wdGlvbiBpcyBoaWphY2sgdGhlIHNpbXBsZS1wbS1idXMgZHJpdmVyIHdoaWNoIGFscmVh
ZHkgZG9lcwpqdXN0IHdoYXQgeW91IHNhaWQuCgpSb2IKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1y
aXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxt
YW4vbGlzdGluZm8vbGludXgtcmlzY3YK
