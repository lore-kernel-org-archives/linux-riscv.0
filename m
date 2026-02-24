Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17B29EFB7E5
	for <linux-riscv@archiver.kernel.org>; Tue, 24 Feb 2026 03:08:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YfmEWyla+h0FD8xRI8RYZDvsm6iY1tlissQqSvL/Bx4=; b=C4A55e1yv1TuMa
	wyDcloNEcvINQzXc/hxrQcfMSod9gD7sPyBkM9ZnJe5yI2VVn2CL8pmwyOxocz7bJM7Rj8Fd2M9rb
	lkwW3NOqpP7V2dR+2epXTBVmcvES/9NNtK/zeJff7NisV8A+rvzahXJeyxCgSbRBXucYxPPNeyNBN
	3YsNQdTWDmruPz1jpEsDnLL2NeJRTJwiOmAsFy4MGddZzP1GvHWrtLP1BhMXaEhjJ1IRPzpEPRzy+
	LNfdyS3gmN4ZAUFojbQFLH9MHricO9PzH5pbAGy/HNM2S+mvlP+++kGa7Tup+zd1IpY5z8kXXyt54
	8LTQxSqZWCxBojTAgkNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuimf-00000001Nzz-23Vt;
	Tue, 24 Feb 2026 03:08:25 +0000
Received: from mail-yw1-x112a.google.com ([2607:f8b0:4864:20::112a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuimc-00000001NzB-0twa
	for linux-riscv@lists.infradead.org;
	Tue, 24 Feb 2026 03:08:23 +0000
Received: by mail-yw1-x112a.google.com with SMTP id 00721157ae682-798527f822cso11865637b3.3
        for <linux-riscv@lists.infradead.org>; Mon, 23 Feb 2026 19:08:21 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771902500; cv=none;
        d=google.com; s=arc-20240605;
        b=LSV22DJKwOq8fhb9MB5sc4j42RcD/SJf7eZFqIH2vT9RwNN/NO3TSL1+p1soaijR38
         Dg6wcy8VoiVoCM2FE/y65F7rnWKHSWztYSLHdd8ntqbSYnQ7fjyRjHCq22jX9VcxQgHJ
         dlmwkAfsboDUe79LNSCvGfOHzPmEqs5Y3ywNjIDj+WnEm6UYrqVfmK/ugSfu/6jXVOF6
         P7yG+m1iJlaiQBNd6d+wyKdYlsmK09KgWkK3STUq9bPCSe9FrRXNZ7ycNQa/LNNfgTdI
         8aCAstzTtzCQt8ApUcIbjdyfI2vy7ioS97kZNlwN76ylgb4AI11KzzdOXx3/H2PXW0vf
         L85A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=BycvdGp/z9gEQo1VCtrRiWndisDEJHCvcJytLoYubq4=;
        fh=h/4nXLWfohddOtH/5NTVKHnkTwqAGX+Z7gx8ZNZmhm4=;
        b=dznHg2JFqwLMNhawItpBTEi+OdWz70MWvRCVm9JOx9KtfXoudvRh6SCbpqLapSHBHC
         +prkGVo2SYREioMvPoTSPjDQ77/2fC8Z6VQusJCmN4fDzAw9/Q5bCryfVGl11+SYK4z6
         6drIY2/VUWygFOWNI5YQN8yoaZBOrX7sfSfDy6YZCONoTRaNy7Dlgg+FHIZQQBFS4b8a
         J2pWggk+BbzUkuoo/qTDY65HMrL52YMKj8aASel0bAw1h4Z+uZqRayfS+AVIrU8ewb1c
         UiQUzRyl1e1OlzcArh8sp7LoXdJvdqHy9FQD8v08Y0d4xMbxIPick2oNVy5lP5oP5+kG
         zAYw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1771902500; x=1772507300; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BycvdGp/z9gEQo1VCtrRiWndisDEJHCvcJytLoYubq4=;
        b=aLHoUSAH/M4RUbNwtPFtwAc19taIK8fwB1Jzf3oIhMlm3Vc86kVq2n1eyPPI6fzkzj
         W4vBdZQHt/cttashqPc9eLJExrSVIJRBnjgmdWpyhKtCrGnjpKIA5splIKYSwckDTUvS
         hs8u7zcFNWVLcMyRC1IiL4POYfcZRIkWbRgdv4zK977wKrEFoEcupCG1IoHUvoZH9BLY
         bMdF3iGl2frFH5XL0QcNqX30IbgsQenTJvNqj3axnWGfgLOyff87G7Bz7IjzsPjMncsi
         IXBI0tApX8DDCmbPr1ZLAVURayXsQR9JyAddqwXD3kx5mqzdbotQVeZOKbISHVifUwiO
         nvMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771902500; x=1772507300;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=BycvdGp/z9gEQo1VCtrRiWndisDEJHCvcJytLoYubq4=;
        b=BBGgdIfQH0L9OvbX8zMCFYRQgRjauHpkqVa1eUu61Sps34+8N2SXJU9XGhvs7uaSVd
         Jx4I86Iz2BQZ+j8rgRgyLoJRnurJPcmONt+2scnO0Nm2rL/3eQk5kgkrvpGDSfy0moMK
         AAkqfrPXLea8o7pn2T160B37U1QfuGM0Sr2iEmjTGdfsgFCwp42GUWBBRVWtFZyoZkQI
         +1qk0agITB4+htW3iTvtmxGHJZx+yODSj4itvGbZ6o0CeIntdO1N5PE22JQWnaeLWQfN
         KRvwxpD3Q+xzB3Y+CQXmyFnHehJ8NAGk36x4LYbqEdez+cWC2YJT7Pc7xMwLXZdxrmLA
         L5mA==
X-Forwarded-Encrypted: i=1; AJvYcCUETI3mxvzYoEMeLNCIp5H81fYg0CXkNSvdG9ciKz2SY8xuptQVcGWDTurxchqE0FdQk6KifimtToocew==@lists.infradead.org
X-Gm-Message-State: AOJu0Yw6c1FrIQgufS0kpMwkl1zsGHJzvAAAOFS0zhakzi+2KR6s0Xzc
	DLwbHtzRCUc1+uPGLh8Tcgmtc00aAXcoxfx4BJnr7y08ViFX5fOI+TV8oYKjTaPBaw//h7pqTQa
	/nnDIC2WwccQ7kaEgTt+o0+Nl6CQ9vybAw77dr3ogZ/OYBslucvLr3Ck=
X-Gm-Gg: ATEYQzzNtEfznbmvSDwg1t9M/f4eOgGZdUmgPBuYNXrqTBYlZpPi3b0V8BJNNlj2vQS
	pzmLn9zJsZOyNhJfTdHz+/aZtkn9hceYvZf9BbKvqNh0zYQjHW5pf+/VvgqkmpINt3plIcqwe+k
	EtbrWyrUmnbUK4EVUEZMgbkK/opjsoyQRro18ViuaoVvudY7/UxPP/WF52ledFYUhpzvrOe/CdW
	Ocj6ZuhPsjHvm2tU1M8rzs7i2hVmRpCcLK/GfrWyCly5KqRw4NpNyEwV2bYGjyNsNDhy/qoe/lB
	4BciYBReFw==
X-Received: by 2002:a05:690c:4984:b0:794:ffc8:659 with SMTP id
 00721157ae682-79828cf7240mr96664067b3.12.1771902500382; Mon, 23 Feb 2026
 19:08:20 -0800 (PST)
MIME-Version: 1.0
References: <20260108-sifive-pd-drivers-v4-0-2a523d7d51a0@sifive.com>
In-Reply-To: <20260108-sifive-pd-drivers-v4-0-2a523d7d51a0@sifive.com>
From: Nick Hu <nick.hu@sifive.com>
Date: Tue, 24 Feb 2026 11:08:09 +0800
X-Gm-Features: AaiRm51hYev0P2yjDadOZi7PKWo_siHtRuCOZQk8OpSAHm9eqQ7TOSuLU00jpjU
Message-ID: <CAKddAkDKzFewnDVJ8x-oCn=xO72Ps8GevatL3wgmQwiErtqPSA@mail.gmail.com>
Subject: Re: [PATCH v4 0/3] Add SiFive power provider driver
To: "Rafael J. Wysocki" <rafael@kernel.org>, Daniel Lezcano <daniel.lezcano@linaro.org>, 
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Anup Patel <anup@brainfault.org>, 
	Samuel Holland <samuel.holland@sifive.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Cyan Yang <cyan.yang@sifive.com>, Nick Hu <nick.hu@sifive.com>
Cc: linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, 
	linux-riscv@lists.infradead.org, devicetree@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260223_190822_301033_209AA50E 
X-CRM114-Status: GOOD (  21.69  )
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

QW55IGZlZWRiYWNrIG9uIHRoaXM/CgpPbiBUaHUsIEphbiA4LCAyMDI2IGF0IDQ6NTjigK9QTSBO
aWNrIEh1IDxuaWNrLmh1QHNpZml2ZS5jb20+IHdyb3RlOgo+Cj4gVGhpcyBwYXRjaHNldCBpbnRy
b2R1Y2VzIHRoZSBTaUZpdmUgcG93ZXIgcHJvdmlkZXIgZHJpdmVyLCB3aGljaCBzZXRzIHVwIGEK
PiBnZW5lcmljIHBvd2VyIGRvbWFpbiAoZ2VucGQpIHByb3ZpZGVyIHRvIGNvb3JkaW5hdGUgd2l0
aCB0aGUgUklTQy1WIFNCSQo+IENQVSBpZGxlIGRyaXZlci4KPgo+IFRvIGVuYWJsZSB0aGlzIGNv
b3JkaW5hdGlvbiwgc3BsaXQgdGhlIHBvd2VyIGRvbWFpbiBpbml0aWFsaXphdGlvbiBvdXQKPiBv
ZiB0aGUgUklTQy1WIFNCSSBDUFUgaWRsZSBkcml2ZXIuIFRoaXMgYWxsb3dzIGNvb3JkaW5hdGlv
biBiZXR3ZWVuCj4gcG93ZXIgZG9tYWluIG1hbmFnZW1lbnQgYW5kIENQVSBpZGxlIHN0YXRlcyBv
biBTaUZpdmUgcGxhdGZvcm1zLgo+Cj4gQ2hhbmdlcyBpbiB2NDoKPiAtIFNwbGl0IHRoZSBwb3dl
ciBkb21haW4gaW5pdGlhbGl6YXRpb24gb3V0IG9mIHRoZSBSSVNDLVYgU0JJIENQVSBpZGxlCj4g
ICBkcml2ZXIgaW4gUEFUQ0ggMQo+IC0gUmVmaW5lIHRoZSBjb21taXQgbWVzc2FnZXMgb2YgUEFU
Q0ggMSBhbmQgUEFUQ0ggMwo+IC0gUmVuYW1lIGNwdWlkbGUtc2lmaXZlLWRtYy1wZC5jIHRvIGNw
dWlkbGUtc2lmaXZlLWRtYy1kb21haW4uYwo+IC0gUmVuYW1lIFNJRklWRV9ETUNfUERfQ1BVSURM
RSB0byBDT05GSUdfU0lGSVZFX0RNQ19DUFVJRExFX0RPTUFJTgo+Cj4gQ2hhbmdlcyBpbiB2MzoK
PiAtIFVwZGF0ZSB0aGUgZXhwbGFuYXRpb24gZm9yIHRoZSBhYnNlbmNlIG9mIHRoZSBTb0Mtc3Bl
Y2lmaWMgY29tcGF0aWJsZQo+ICAgc3RyaW5nLgo+IC0gRHJvcCB0aGUgc21jMy90bWMzL2NtYzMg
YmluZGluZ3MuCj4gLSBTZXBhcmF0ZSB0aGUgZ2VucGQgaW5pdCBhbmQgdGhlIGlkbGUgZHJpdmVy
IGluaXQuIFRoZSBnZW5wZCByZW1haW5zCj4gICBmdW5jdGlvbmFsIGV2ZW4gd2hlbiB0aGUgaWRs
ZSBzdGF0ZSBpcyBhYnNlbnQuCj4gLSBBZGRyZXNzIHRoZSB3YXJuaW5nIGZyb20gdGhlIGtlcm5l
bCB0ZXN0IHJvYm90Cj4KPiBDaGFuZ2VzIGluIHYyOgo+IC0gQWRkIHRoZSBkcml2ZXIgZm9yIFNp
Rml2ZSBUTUMsIENNQyBhbmQgU01DCj4gLSBEcm9wIHRoZSBgc2lmaXZlLGZlYXR1cmUtbGV2ZWxg
IHByb3BlcnR5Cj4KPiBOaWNrIEh1ICgzKToKPiAgIGR0LWJpbmRpbmdzOiBwb3dlcjogQWRkIFNp
Rml2ZSBEb21haW4gTWFuYWdlbWVudCBjb250cm9sbGVycwo+ICAgY3B1aWRsZTogcmlzY3Ytc2Jp
OiBXb3JrIHdpdGggdGhlIGV4dGVybmFsIHBtZG9tYWluIGRyaXZlcgo+ICAgY3B1aWRsZTogQWRk
IFNpRml2ZSBwb3dlciBwcm92aWRlcgo+Cj4gIC4uLi9kZXZpY2V0cmVlL2JpbmRpbmdzL3Bvd2Vy
L3NpZml2ZSx0bWMueWFtbCB8ICA1OCArKysrKysrKysrCj4gIGRyaXZlcnMvY3B1aWRsZS9LY29u
ZmlnLnJpc2N2ICAgICAgICAgICAgICAgICB8ICAxMSArKwo+ICBkcml2ZXJzL2NwdWlkbGUvTWFr
ZWZpbGUgICAgICAgICAgICAgICAgICAgICAgfCAgIDEgKwo+ICBkcml2ZXJzL2NwdWlkbGUvY3B1
aWRsZS1yaXNjdi1zYmkuYyAgICAgICAgICAgfCAgNDYgKysrKy0tLS0KPiAgZHJpdmVycy9jcHVp
ZGxlL2NwdWlkbGUtcmlzY3Ytc2JpLmggICAgICAgICAgIHwgIDIwICsrKysKPiAgZHJpdmVycy9j
cHVpZGxlL2NwdWlkbGUtc2lmaXZlLWRtYy1wZC5jICAgICAgIHwgMTAyICsrKysrKysrKysrKysr
KysrKwo+ICA2IGZpbGVzIGNoYW5nZWQsIDIyMCBpbnNlcnRpb25zKCspLCAxOCBkZWxldGlvbnMo
LSkKPiAgY3JlYXRlIG1vZGUgMTAwNjQ0IERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5n
cy9wb3dlci9zaWZpdmUsdG1jLnlhbWwKPiAgY3JlYXRlIG1vZGUgMTAwNjQ0IGRyaXZlcnMvY3B1
aWRsZS9jcHVpZGxlLXJpc2N2LXNiaS5oCj4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBkcml2ZXJzL2Nw
dWlkbGUvY3B1aWRsZS1zaWZpdmUtZG1jLXBkLmMKPgo+IC0tCj4gMi4xNy4xCj4KPiBfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+IGxpbnV4LXJpc2N2IG1h
aWxpbmcgbGlzdAo+IGxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKPiBodHRwOi8vbGlz
dHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cj4KPiAtLS0KPiBO
aWNrIEh1ICgzKToKPiAgICAgICBjcHVpZGxlOiByaXNjdi1zYmk6IFNwbGl0IFBNIGRvbWFpbiBp
bml0IG91dCBvZiB0aGUgY3B1aWRsZSBkcml2ZXIKPiAgICAgICBkdC1iaW5kaW5nczogcG93ZXI6
IEFkZCBTaUZpdmUgRG9tYWluIE1hbmFnZW1lbnQgY29udHJvbGxlcnMKPiAgICAgICBjcHVpZGxl
OiBBZGQgU2lGaXZlIHBvd2VyIHByb3ZpZGVyIGRyaXZlcgo+Cj4gIC4uLi9kZXZpY2V0cmVlL2Jp
bmRpbmdzL3Bvd2VyL3NpZml2ZSx0bWMueWFtbCAgICAgIHwgIDU4ICsrKysrKysKPiAgTUFJTlRB
SU5FUlMgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgfCAgIDIgKwo+ICBk
cml2ZXJzL2NwdWlkbGUvS2NvbmZpZy5yaXNjdiAgICAgICAgICAgICAgICAgICAgICB8ICAyNSAr
Ky0KPiAgZHJpdmVycy9jcHVpZGxlL01ha2VmaWxlICAgICAgICAgICAgICAgICAgICAgICAgICAg
fCAgIDIgKwo+ICBkcml2ZXJzL2NwdWlkbGUvY3B1aWRsZS1yaXNjdi1zYmktZG9tYWluLmMgICAg
ICAgICB8IDE3NiArKysrKysrKysrKysrKysrKysrKwo+ICBkcml2ZXJzL2NwdWlkbGUvY3B1aWRs
ZS1yaXNjdi1zYmkuYyAgICAgICAgICAgICAgICB8IDE3OCArKy0tLS0tLS0tLS0tLS0tLS0tLS0K
PiAgZHJpdmVycy9jcHVpZGxlL2NwdWlkbGUtcmlzY3Ytc2JpLmggICAgICAgICAgICAgICAgfCAg
MjkgKysrKwo+ICBkcml2ZXJzL2NwdWlkbGUvY3B1aWRsZS1zaWZpdmUtZG1jLWRvbWFpbi5jICAg
ICAgICB8IDEyNCArKysrKysrKysrKysrKwo+ICA4IGZpbGVzIGNoYW5nZWQsIDQyMyBpbnNlcnRp
b25zKCspLCAxNzEgZGVsZXRpb25zKC0pCj4gLS0tCj4gYmFzZS1jb21taXQ6IGYwYjlkOGViOThk
ZmVlOGQwMDQxOWFhMDc1NDNiZGMyYzFhNDRmYjEKPiBjaGFuZ2UtaWQ6IDIwMjUxMjA3LXNpZml2
ZS1wZC1kcml2ZXJzLTY2ZGU2NTEwOGIxYwo+Cj4gQmVzdCByZWdhcmRzLAo+IC0tCj4gTmljayBI
dSA8bmljay5odUBzaWZpdmUuY29tPgo+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlz
dHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2xpbnV4LXJpc2N2Cg==
