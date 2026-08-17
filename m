Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EDBD1C5DF70
	for <linux-riscv@archiver.kernel.org>; Mon, 17 Aug 2026 09:42:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hOwGWnzvW23sEJclm+wq9vP+qUIjpkaGEBY1L8KOWUs=; b=mOTCLgZL8hcguz
	ht0Tk5Yphj+pupesCHSc11IpcFF1fQjKxMW4wXMiPbsL/OXgs1LEMPOhWKNtKMqd8rRE3E2BMT+Ur
	LA/Rs5ZJUfs1P3Mt9P03dbNDVvgX6Hzu8bHMyWz4VtrMvxFY0epPBh9Gc7CKW+Yp2bK4110Xd8bSI
	dwa5/HmSNvmMh9t4GSbUA0sye4iS5fELoR1sndcHIRJmzt41nxFng0y7E0v5n1Rh6mYZh0yKW/buM
	i3TUUBGFrf2Qe/wFsYyudTcbjeEiyVklqS6z678tHPOmWvIZd5yv9JjS4zHS6pn12QJK8pvn+qbAp
	MXL+DkkLAxE9atNNTdJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvtrL-00000005piX-47Vs;
	Mon, 17 Aug 2026 09:42:23 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvtrK-00000005pi8-3tUM
	for linux-riscv@lists.infradead.org;
	Mon, 17 Aug 2026 09:42:22 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 5C99F43C61
	for <linux-riscv@lists.infradead.org>; Mon, 17 Aug 2026 09:42:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 410DE1F00ACA
	for <linux-riscv@lists.infradead.org>; Mon, 17 Aug 2026 09:42:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786959742;
	bh=Og3F1hcoSP1i8Wy5Bb7spoMaCLZVZhlg3PjenB8r8mE=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=DvSKYBoAIPbl8XdRq0rqT3WZLjZo32J+rUfdbCqEumrc3tdVAFJUIR9vG/grZZqV2
	 GSLYw9jzBABLJ1iTMwLbciOOCwTrcvAoDX194P1W4XSxXenMSbD+Kdv6kE+xgQk2Yr
	 npRTES8efJTH8jL0EgQtlRcNv8Il3fJBiRqQVcvW3CuL6FitAbFOZPx451AzMbb9xh
	 tm4UKPHzZgco28cUjXdDLRZ4Mo7b/IUHH0G8x/hNtM/ZSPkh5Wmk5mijuUa0hF78iu
	 XthYhvKU8C2nkBqqK5JwhRE9YiRj86bVvwqWUYqNSk5Dd/Z30R10eH9xgDkwCtef6k
	 /ec1IGO5hNo9w==
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4955aa106b1so28181205e9.0
        for <linux-riscv@lists.infradead.org>; Mon, 17 Aug 2026 02:42:22 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RpQTzTwgBiKVv6MzBC4vCyxtRd6SYWQ5YpamPQrIckgEf+7/6/0/tFzE/DB1Zhn5Tu3Yw6KjGkPCj17YQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YzhYVogBz/utf0dtbn/vcoRIcvDStBD1RjklwNdO3ljUzoYDXQx
	BauiCGa+lKGU3lX3jjOdp6c7kZRh/9UWmsuZzW4+4G5JTrcvtPCdagPo1w7CpMoQs7jXlT6YBwk
	Oxg6Fdku2yWkJXFIpca2m9UQ47Y2yWww=
X-Received: by 2002:a05:600c:1f91:b0:492:4e09:9fc1 with SMTP id
 5b1f17b1804b1-4998797d111mr316890445e9.15.1786959740872; Mon, 17 Aug 2026
 02:42:20 -0700 (PDT)
MIME-Version: 1.0
References: <20260815015722.1736831-1-guoren@kernel.org> <20260815015722.1736831-2-guoren@kernel.org>
 <bf81034d-7768-40f3-b078-e17ea3a2e665@kernel.org>
In-Reply-To: <bf81034d-7768-40f3-b078-e17ea3a2e665@kernel.org>
From: Guo Ren <guoren@kernel.org>
Date: Mon, 17 Aug 2026 17:42:08 +0800
X-Gmail-Original-Message-ID: <CAJF2gTQGbQ7bUM-itiZhqaPM0-6oy_oV6FrNKfFTgvAV4_YW5A@mail.gmail.com>
X-Gm-Features: AcwNN1U6BH2Dol8M_EReGO3UVP-nQniw1ADupoEfkT0J1wn_e9IOna_-n001IC4
Message-ID: <CAJF2gTQGbQ7bUM-itiZhqaPM0-6oy_oV6FrNKfFTgvAV4_YW5A@mail.gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: vendor-prefixes: Add Xuantie Semiconductor
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: robh@kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org, robh+dt@kernel.org, 
	conor.dooley@microchip.com
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

T24gTW9uLCBBdWcgMTcsIDIwMjYgYXQgMjowOOKAr1BNIEtyenlzenRvZiBLb3psb3dza2kgPGty
emtAa2VybmVsLm9yZz4gd3JvdGU6Cj4KPiBPbiAxNS8wOC8yMDI2IDAzOjU3LCBHdW8gUmVuIHdy
b3RlOgo+ID4gRnJvbTogIkdVTyBSZW4gKFh1YW5UaWUpIiA8Z3VvcmVuQGtlcm5lbC5vcmc+Cj4g
Pgo+ID4gQWRkIHRoZSB4dWFudGllIHZlbmRvciBwcmVmaXggZm9yIFNoYW5naGFpIFh1YW50aWUg
U2VtaWNvbmR1Y3Rvcgo+ID4gVGVjaG5vbG9neSBDby4sIEx0ZC4sIHdoaWNoIHByb3ZpZGVzIHRo
ZSBYdWFuVGllIHByb2Nlc3NvciBJUC4KPiA+Cj4gPiBUaGUgdmVuZG9yIGluZm9ybWF0aW9uIGlz
IGF2YWlsYWJsZSBmcm9tIHRoZSBYdWFudGllIGRlY2xhcmF0aW9uCj4gPiBwYWdlaSBbMV0uCj4g
Pgo+ID4gWzFdOiBodHRwczovL3d3dy54cnZtLmNvbS9kZWNsYXJhdGlvbgo+ID4KPiA+IENjOiBS
b2IgSGVycmluZyA8cm9iaCtkdEBrZXJuZWwub3JnPgo+ID4gQ2M6IGRldmljZXRyZWUgPGRldmlj
ZXRyZWVAdmdlci5rZXJuZWwub3JnPgo+Cj4gUGxlYXNlIGRyb3AgdGhlIGF1dG9nZW5lcmF0ZWQg
c2NyaXB0cy9nZXRfbWFpbnRhaW5lci5wbCBDQy1lbnRyaWVzIGZyb20KPiBjb21taXQgbXNnLiBU
aGVyZSBpcyBubyBzaW5nbGUgbmVlZCB0byBzdG9yZSBhdXRvbWF0ZWQgb3V0cHV0IG9mCj4gZ2V0
X21haW50YWluZXJzLnBsIGluIHRoZSBnaXQgbG9nLiBJdCBjYW4gYmUgZWFzaWx5IHJlLWNyZWF0
ZWQgYXQgYW55Cj4gZ2l2ZW4gdGltZSwgdGh1cyBpdHMgcHJlc2VuY2UgaW4gdGhlIGdpdCBoaXN0
b3J5IGlzIHJlZHVuZGFudCBhbmQKPiBvYmZ1c2NhdGVzIHRoZSBsb2cuCgpUaGFua3MgZm9yIHBv
aW50aW5nIHRoYXQgb3V0OyBJIHdvdWxkIGRyb3AgdGhlIGF1dG9nZW5lcmF0ZWQKc2NyaXB0cy9n
ZXRfbWFpbnRhaW5lci5wbCBDQyBlbnRyaWVzLgoKPgo+IElmIHlvdSBuZWVkIGl0IGZvciB5b3Vy
IG93biBwYXRjaCBtYW5hZ2VtZW50IHB1cnBvc2VzLCBrZWVwIGl0IHVuZGVyIHRoZQo+IC0tLSBz
ZXBhcmF0b3IuCj4KPgo+ID4gU2lnbmVkLW9mZi1ieTogR1VPIFJlbiAoWHVhblRpZSkgPGd1b3Jl
bkBrZXJuZWwub3JnPgo+ID4gLS0tCj4gPiAgRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRp
bmdzL3ZlbmRvci1wcmVmaXhlcy55YW1sIHwgMiArKwo+Cj4gQW55d2F5IG9kZCBjYy1saXN0Lgo+
Cj4gUGxlYXNlIHVzZSBzY3JpcHRzL2dldF9tYWludGFpbmVycy5wbCB0byBnZXQgYSBsaXN0IG9m
IG5lY2Vzc2FyeSBwZW9wbGUKPiBhbmQgbGlzdHMgdG8gQ0MgKGFuZCBjb25zaWRlciAtLW5vLWdp
dC1mYWxsYmFjayBhcmd1bWVudCwgc28geW91IHdpbGwKPiBub3QgQ0MgcGVvcGxlIGp1c3QgYmVj
YXVzZSB0aGV5IG1hZGUgb25lIGNvbW1pdCB5ZWFycyBhZ28pLiBJdCBtaWdodAo+IGhhcHBlbiwg
dGhhdCBjb21tYW5kIHdoZW4gcnVuIG9uIGFuIG9sZGVyIGtlcm5lbCwgZ2l2ZXMgeW91IG91dGRh
dGVkCj4gZW50cmllcy4gVGhlcmVmb3JlIHBsZWFzZSBiZSBzdXJlIHlvdSBiYXNlIHlvdXIgcGF0
Y2hlcyBvbiByZWNlbnQgTGludXgKPiBrZXJuZWwuCj4KPiBUb29scyBsaWtlIGI0IG9yIHNjcmlw
dHMvZ2V0X21haW50YWluZXIucGwgcHJvdmlkZSB5b3UgcHJvcGVyIGxpc3Qgb2YKPiBwZW9wbGUs
IHNvIGZpeCB5b3VyIHdvcmtmbG93LiBUb29scyBtaWdodCBhbHNvIGZhaWwgaWYgeW91IHdvcmsg
b24gc29tZQo+IGFuY2llbnQgdHJlZSAoZG9uJ3QsIGluc3RlYWQgdXNlIG1haW5saW5lKSBvciB3
b3JrIG9uIGZvcmsgb2Yga2VybmVsCj4gKGRvbid0LCBpbnN0ZWFkIHVzZSBtYWlubGluZSkuIEp1
c3QgdXNlIGI0IGFuZCBldmVyeXRoaW5nIHNob3VsZCBiZQo+IGZpbmUsIGFsdGhvdWdoIHJlbWVt
YmVyIGFib3V0IGBiNCBwcmVwIC0tYXV0by10by1jY2AgaWYgeW91IGFkZGVkIG5ldwo+IHBhdGNo
ZXMgdG8gdGhlIHBhdGNoc2V0LgpPa2F5LCBJJ2xsIHRyeSB0aGF0LgoKLS0KQmVzdCBSZWdhcmRz
CiBHdW8gUmVuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9y
ZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2
Cg==
