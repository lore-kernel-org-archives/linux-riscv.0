Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7D52D3EE64
	for <linux-riscv@archiver.kernel.org>; Thu, 22 Jan 2026 13:23:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fB9eVkVTZgv2ImNV2gr38ucegk3mpQHRHOVUKsMHP+g=; b=VxK+dwEQooAUvZ
	8XjQD6a+BsYPxDJFBVgrJZKDfD7GWAa8yJNun/eT7O3mPt0/kkaiIknvJfgGx6jqPom73K6ygnOWo
	FvWo0yxdWqesNfzQxwnqqeBvzxRETvcBxWbkoX1scKhmKgtQHiMMBNsd3CVTjxu85rPx8s61qr/on
	pLn4FHpn0KYK2bIrtOxEJtKsKZfH2Wid5C3VYEmqTaKmnGNqjrrIxwW8FKcVBS3avXP0VFlN+Ctva
	km+JhnH0j0wt+3hUKhKbEUjoKAEfxoPgU7hptz+f/sHI4jhdQ38/L6C2ITY2QQC8UO4BS9+5baCm2
	tEzlDpN3PyM0/S25tk9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viueE-000000078qZ-2IoX;
	Thu, 22 Jan 2026 13:22:54 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viueC-000000078q2-0QLn
	for linux-riscv@lists.infradead.org;
	Thu, 22 Jan 2026 13:22:53 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 7029D442CD
	for <linux-riscv@lists.infradead.org>; Thu, 22 Jan 2026 13:22:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3E1B5C2BC87
	for <linux-riscv@lists.infradead.org>; Thu, 22 Jan 2026 13:22:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769088171;
	bh=y0PkLqx+vtabPgjqGUzX5K06qpvV+/WhZK31GBxVf4E=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=CGyBNZ/SpgAThPn4InSKrcvQah829DEMbQMzZHHYgWFfe0uYLgG8nHlQ5F+YjF8NQ
	 cAX/neHWFWlpVSglcxILgX117B6UUqa6vdWkKEoPALLRUE5bhaN1U1zsEolROwkVAy
	 conmm4xAaDpPNsNPcDxSMDajMDx8rWbzasL1ryWDDvs9rBd9i8wY4Vp4FdS4UHUM6z
	 wt5QArc7I+I+H7Gic4MD1wCGHe5YQt1V//AEsoPoqYjWy+E3kDNuk1aeKFWrPYxTBa
	 KuoQLt39ZJB0nrdaar942QuFmKbcaBUMlcNPGPvLzUqlGrET7uZKJWig9of3LhAjno
	 jspSYWdq6rJBA==
Received: by mail-oa1-f50.google.com with SMTP id 586e51a60fabf-4042f55de3aso579577fac.1
        for <linux-riscv@lists.infradead.org>; Thu, 22 Jan 2026 05:22:51 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVt193kaTMv9TfxljOTYvojYedhN/l5ZzSn7FDVq0PK3j/lrZdqlFGy8fZYlHTpS2NCAHbUk+a4COJuDg==@lists.infradead.org
X-Gm-Message-State: AOJu0YzOjFwJ/y5d0ysxmt6pCvNuED/BQe2WO4oua/3iCHzcjf+mor9+
	T0/ZN4Hfx1P/gQwPOmtsPAKc2Jyg+hy8gYrU+hcCk/qn9gcqiDhDNZfxCSvjXc1heURtpjSHCuf
	xP6pLf2d96MKv6xb4XCOkWNkNGrWousA=
X-Received: by 2002:a05:6871:2b1c:b0:3ec:4067:c684 with SMTP id
 586e51a60fabf-40882a78429mr1831476fac.3.1769088170247; Thu, 22 Jan 2026
 05:22:50 -0800 (PST)
MIME-Version: 1.0
References: <20260122073446.45628-1-yang.yicong@picoheart.com>
 <20260122073446.45628-2-yang.yicong@picoheart.com> <CAJZ5v0iwfk4hnj7Lf5hq3uo4p+_CT35ZwJUnenLOzOoGqQcsgw@mail.gmail.com>
 <7512bdfc-96ff-480a-a4e2-3b544f86d59d@picoheart.com>
In-Reply-To: <7512bdfc-96ff-480a-a4e2-3b544f86d59d@picoheart.com>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Thu, 22 Jan 2026 14:22:39 +0100
X-Gmail-Original-Message-ID: <CAJZ5v0iUfHQBaXZ65H2nfcwMAyvdw_x5_42z0b8VMvL356kZsA@mail.gmail.com>
X-Gm-Features: AZwV_Qh_oP3VWYUXH5YAMEm8jxBGG_L9hdLOk6iM-ikwfdmczgxAcysS4nDKmBs
Message-ID: <CAJZ5v0iUfHQBaXZ65H2nfcwMAyvdw_x5_42z0b8VMvL356kZsA@mail.gmail.com>
Subject: Re: [PATCH 1/2] ACPI: scan: Use async schedule function for acpi_scan_clear_dep_fn
To: Yicong Yang <yang.yicong@picoheart.com>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, lenb@kernel.org, tglx@kernel.org, 
	gregkh@linuxfoundation.org, dakr@kernel.org, akpm@linux-foundation.org, 
	apatel@ventanamicro.com, pjw@kernel.org, palmer@dabbelt.com, 
	aou@eecs.berkeley.edu, alex@ghiti.fr, geshijian@picoheart.com, 
	weidong.wd@picoheart.com, linux-acpi@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260122_052252_184393_9A025E5B 
X-CRM114-Status: GOOD (  32.10  )
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

T24gVGh1LCBKYW4gMjIsIDIwMjYgYXQgMTo1MOKAr1BNIFlpY29uZyBZYW5nIDx5YW5nLnlpY29u
Z0BwaWNvaGVhcnQuY29tPiB3cm90ZToKPgo+IE9uIDEvMjIvMjYgNzoxOSBQTSwgUmFmYWVsIEou
IFd5c29ja2kgd3JvdGU6Cj4gPiBPbiBUaHUsIEphbiAyMiwgMjAyNiBhdCA4OjM14oCvQU0gWWlj
b25nIFlhbmcgPHlhbmcueWljb25nQHBpY29oZWFydC5jb20+IHdyb3RlOgo+ID4+Cj4gPj4gVGhl
IGRldmljZSBvYmplY3QgcmVzY2FuIGluIGFjcGlfc2Nhbl9jbGVhcl9kZXBfZm4gaXMgc2NoZWR1
bGVkCj4gPj4gaW4gdGhlIHN5c3RlbSB3b3JrcXVldWUgd2hpY2ggaXMgbm90IGd1YXJhbnRlZWQg
dG8gYmUgZmluaXNoZWQKPiA+PiBiZWZvcmUgZW50ZXJpbmcgdXNlcnNwYWNlLiBUaGlzIHdpbGwg
Y2F1c2UgdGhlIHByb2JsZW0gdGhhdAo+ID4+IHNvbWUga2V5IGRldmljZXMgYXJlIG1pc3NlZCB3
aGVuIHRoZSBpbml0IHRhc2sgdHJ5IHRvIGZpbmQgdGhlbSwKPiA+PiBlLmcuIGNvbnNvbGUgZGV2
aWNlcyBhbmQgcm9vdCBkZXZpY2VzIChQQ0llIG52bWUsIGV0YykuCj4gPj4gVGhpcyBpc3N1ZXMg
aXMgbW9yZSBwb3NzYmlsZSB0byBoYXBwZW4gb24gUklTQ1Ygc2luY2UgdGhlc2UKPiA+PiBkZXZp
Y2VzIHVzaW5nIEdTSSBpbnRlcnJ1cHQgbWF5IGRlcGVuZCBvbiBBUExJQyBhbmQgd2lsbCBiZQo+
ID4+IHNjYW5uZWQgaW4gYWNwaV9zY2FuX2NsZWFyX2RlcF9xdWV1ZSgpIGFmdGVyIEFQTElDIGlu
aXRpYWxpemVkLgo+ID4+Cj4gPj4gRml4IHRoaXMgYnkgc2NoZWR1bGluZyB0aGUgYWNwaV9zY2Fu
X2NsZWFyX2RlcF9xdWV1ZSgpIHVzaW5nIGFzeW5jCj4gPj4gc2NoZWR1bGUgZnVuY3Rpb24gcmF0
aGVyIHRoYW4gdGhlIHN5c3RlbSB3b3JrcXVldWUuIFRoZSBkZWZlcnJlZAo+ID4+IHdvcmtzIHdp
bGwgYmUgc3luY2hyb25pemVkIGJ5IGFzeW5jX3N5bmNocm9uaXplX2Z1bGwoKSBiZWZvcmUKPiA+
PiBlbnRlcmluZyBpbml0IHRhc2suCj4gPj4KPiA+PiBVcGRhdGUgdGhlIGNvbW1lbnQgYXMgd2Vs
bC4KPiA+Pgo+ID4+IFNpZ25lZC1vZmYtYnk6IFlpY29uZyBZYW5nIDx5YW5nLnlpY29uZ0BwaWNv
aGVhcnQuY29tPgo+ID4+IC0tLQo+ID4+ICBkcml2ZXJzL2FjcGkvc2Nhbi5jIHwgMzUgKysrKysr
KysrKysrKysrKy0tLS0tLS0tLS0tLS0tLS0tLS0KPiA+PiAgMSBmaWxlIGNoYW5nZWQsIDE2IGlu
c2VydGlvbnMoKyksIDE5IGRlbGV0aW9ucygtKQo+ID4+Cj4gPj4gZGlmZiAtLWdpdCBhL2RyaXZl
cnMvYWNwaS9zY2FuLmMgYi9kcml2ZXJzL2FjcGkvc2Nhbi5jCj4gPj4gaW5kZXggNDE2ZDg3Zjli
ZDEwLi5iZjBkOGJhOWJhMTkgMTAwNjQ0Cj4gPj4gLS0tIGEvZHJpdmVycy9hY3BpL3NjYW4uYwo+
ID4+ICsrKyBiL2RyaXZlcnMvYWNwaS9zY2FuLmMKPiA+PiBAQCAtNSw2ICs1LDcgQEAKPiA+Pgo+
ID4+ICAjZGVmaW5lIHByX2ZtdChmbXQpICJBQ1BJOiAiIGZtdAo+ID4+Cj4gPj4gKyNpbmNsdWRl
IDxsaW51eC9hc3luYy5oPgo+ID4+ICAjaW5jbHVkZSA8bGludXgvbW9kdWxlLmg+Cj4gPj4gICNp
bmNsdWRlIDxsaW51eC9pbml0Lmg+Cj4gPj4gICNpbmNsdWRlIDxsaW51eC9zbGFiLmg+Cj4gPj4g
QEAgLTIzNjUsMzkgKzIzNjYsMzUgQEAgc3RydWN0IGFjcGlfc2Nhbl9jbGVhcl9kZXBfd29yayB7
Cj4gPj4gICAgICAgICBzdHJ1Y3QgYWNwaV9kZXZpY2UgKmFkZXY7Cj4gPj4gIH07Cj4gPj4KPiA+
PiAtc3RhdGljIHZvaWQgYWNwaV9zY2FuX2NsZWFyX2RlcF9mbihzdHJ1Y3Qgd29ya19zdHJ1Y3Qg
KndvcmspCj4gPj4gK3N0YXRpYyB2b2lkIGFjcGlfc2Nhbl9jbGVhcl9kZXBfZm4odm9pZCAqZGV2
LCBhc3luY19jb29raWVfdCBjb29raWUpCj4gPj4gIHsKPiA+PiAtICAgICAgIHN0cnVjdCBhY3Bp
X3NjYW5fY2xlYXJfZGVwX3dvcmsgKmNkdzsKPiA+PiAtCj4gPj4gLSAgICAgICBjZHcgPSBjb250
YWluZXJfb2Yod29yaywgc3RydWN0IGFjcGlfc2Nhbl9jbGVhcl9kZXBfd29yaywgd29yayk7Cj4g
Pj4gKyAgICAgICBzdHJ1Y3QgYWNwaV9kZXZpY2UgKmFkZXYgPSB0b19hY3BpX2RldmljZShkZXYp
Owo+ID4+Cj4gPj4gICAgICAgICBhY3BpX3NjYW5fbG9ja19hY3F1aXJlKCk7Cj4gPj4gLSAgICAg
ICBhY3BpX2J1c19hdHRhY2goY2R3LT5hZGV2LCAodm9pZCAqKXRydWUpOwo+ID4+ICsgICAgICAg
YWNwaV9idXNfYXR0YWNoKGFkZXYsICh2b2lkICopdHJ1ZSk7Cj4gPj4gICAgICAgICBhY3BpX3Nj
YW5fbG9ja19yZWxlYXNlKCk7Cj4gPj4KPiA+PiAtICAgICAgIGFjcGlfZGV2X3B1dChjZHctPmFk
ZXYpOwo+ID4+IC0gICAgICAga2ZyZWUoY2R3KTsKPiA+PiArICAgICAgIGFjcGlfZGV2X3B1dChh
ZGV2KTsKPiA+PiAgfQo+ID4+Cj4gPj4gIHN0YXRpYyBib29sIGFjcGlfc2Nhbl9jbGVhcl9kZXBf
cXVldWUoc3RydWN0IGFjcGlfZGV2aWNlICphZGV2KQo+ID4+ICB7Cj4gPj4gLSAgICAgICBzdHJ1
Y3QgYWNwaV9zY2FuX2NsZWFyX2RlcF93b3JrICpjZHc7Cj4gPj4gLQo+ID4+ICAgICAgICAgaWYg
KGFkZXYtPmRlcF91bm1ldCkKPiA+PiAgICAgICAgICAgICAgICAgcmV0dXJuIGZhbHNlOwo+ID4+
Cj4gPj4gLSAgICAgICBjZHcgPSBrbWFsbG9jKHNpemVvZigqY2R3KSwgR0ZQX0tFUk5FTCk7Cj4g
Pj4gLSAgICAgICBpZiAoIWNkdykKPiA+PiAtICAgICAgICAgICAgICAgcmV0dXJuIGZhbHNlOwo+
ID4+IC0KPiA+PiAtICAgICAgIGNkdy0+YWRldiA9IGFkZXY7Cj4gPj4gLSAgICAgICBJTklUX1dP
UksoJmNkdy0+d29yaywgYWNwaV9zY2FuX2NsZWFyX2RlcF9mbik7Cj4gPj4gICAgICAgICAvKgo+
ID4+IC0gICAgICAgICogU2luY2UgdGhlIHdvcmsgZnVuY3Rpb24gbWF5IGJsb2NrIG9uIHRoZSBs
b2NrIHVudGlsIHRoZSBlbnRpcmUKPiA+PiAtICAgICAgICAqIGluaXRpYWwgZW51bWVyYXRpb24g
b2YgZGV2aWNlcyBpcyBjb21wbGV0ZSwgcHV0IGl0IGludG8gdGhlIHVuYm91bmQKPiA+PiAtICAg
ICAgICAqIHdvcmtxdWV1ZS4KPiA+PiArICAgICAgICAqIEFzeW5jIHNjaGVkdWxlIHRoZSBkZWZl
cnJlZCBhY3BpX3NjYW5fY2xlYXJfZGVwX2ZuKCkgc2luY2U6Cj4gPj4gKyAgICAgICAgKiAtIGFj
cGlfYnVzX2F0dGFjaCgpIG5lZWRzIHRvIGhvbGQgYWNwaV9zY2FuX2xvY2sgd2hpY2ggY2Fubm90
Cj4gPj4gKyAgICAgICAgKiAgIGJlIGFjcXVpcmVkIHVuZGVyIGFjcGlfZGVwX2xpc3RfbG9jayAo
aGVsZCBoZXJlKQo+ID4+ICsgICAgICAgICogLSB0aGUgZGVmZXJyZWQgd29yayBhdCBib290IHN0
YWdlIGlzIGVuc3VyZWQgdG8gYmUgZmluaXNoZWQKPiA+PiArICAgICAgICAqICAgYmVmb3JlIGVu
dGVyaW5nIGluaXQgdGFzayBieSB0aGUgYXN5bmNfc3luY2hyb25pemVfZnVsbCgpCj4gPj4gKyAg
ICAgICAgKiAgIGJhcnJpZXIKPiA+PiArICAgICAgICAqCj4gPj4gKyAgICAgICAgKiBVc2UgX25v
Y2FsbCB2YXJpYW50IHNpbmNlIGl0J2xsIHJldHVybiBvbiBmYWlsdXJlIGluc3RlYWQgb2YKPiA+
PiArICAgICAgICAqIHJ1biB0aGUgZnVuY3Rpb24gc3luY2hyb25vdXNseS4KPiA+PiAgICAgICAg
ICAqLwo+ID4+IC0gICAgICAgcXVldWVfd29yayhzeXN0ZW1fZGZsX3dxLCAmY2R3LT53b3JrKTsK
PiA+PiArICAgICAgIGlmICghYXN5bmNfc2NoZWR1bGVfZGV2X25vY2FsbChhY3BpX3NjYW5fY2xl
YXJfZGVwX2ZuLCAmYWRldi0+ZGV2KSkKPiA+Cj4gPiBJZiB0aGUgcHJvYmxlbSBpcyB0aGF0IHN5
c3RlbV9kZmxfd3EgaXMgdG9vIHNsb3csIHdoeSBkb24ndCB5b3UganVzdAo+ID4gdHJ5IGEgZGVk
aWNhdGVkIHdvcmtxdWV1ZSBmb3IgdGhpcz8KPiA+Cj4gPiBUaGVyZSdzIG5vIG5lZWQgdG8gbW9k
aWZ5IGFsbCBvZiB0aGlzIGNvZGUuCj4gPgo+Cj4gVGhlIHByb2JsZW0gaXMgdGhhdCB0aGVzZSB3
b3JrcyBhcmUgbm90IGZpbmlzaGVkIGJlZm9yZSBlbnRlcmluZyB1c2Vyc3BhY2UsCj4gc28gc29t
ZSBrZXkgZGV2aWNlcyBsaWtlIGNvbnNvbGUgb3IgUENJZSBudm1lIChmb3Igcm9vdCBkZXZpY2Up
IGlzIG5vdCByZWFkeQo+IGluIHRpbWUgdXNlcnNwYWNlIGluaXQgcnVubmluZy4KPgo+IElmIHdl
IHVzZSBhIGRlZGljYXRlZCB3b3JrcXVldWUgd2Ugc3RpbGwgbmVlZCB0byBkbyB0aGUgc3luY2hy
b25pemF0aW9uCj4gc29tZXdoZXJlIGJlZm9yZSBlbnRlcmluZyB0aGUgdXNlcnNwYWNlIHRvIHNv
bHZlIHRoZSBwcm9ibGVtLiBCdXQgdGhhdCdzIGp1c3QKPiB3aGF0IGFzeW5jX3NjaGVkdWxlKiBk
b2VzOiBxdWV1ZSB0aGUgZnVuY3Rpb24gaW4gYXN5bmNfd3EgKGFsc28gYW4gdW5ib3VuZCBvbmUp
Cj4gYW5kIHdhaXQgZmluaXNoIGJlZm9yZSBleGVjdXRlIGluaXQgcHJvY2VzcyBieSBhc3luY19z
eW5jaHJvbml6ZV9mdWxsKCkuIERvZXMKPiBpdCBtYWtlIHNlbnNlPwoKV2VsbCwgcGxlYXNlIHNl
ZSBteSByZXBseSB0byB0aGUgb3RoZXIgbWVzc2FnZS4KCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1y
aXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxt
YW4vbGlzdGluZm8vbGludXgtcmlzY3YK
