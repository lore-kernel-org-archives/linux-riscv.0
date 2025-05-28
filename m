Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8086DC54F30
	for <linux-riscv@archiver.kernel.org>; Wed, 28 May 2025 03:16:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4o+fDTzZ9i7bqpE9/i/m1nBhw3FFwi1Zjv5cgfDlVCc=; b=zvpZ+giq+Cm6pO
	MwYMSFSR57ceuwmOqfxRYtlmvw+mgKDYCrPaKjCao5B0Mn8uOIMFr0IC2i/attQiJDAP2asZjaExS
	Np06xy1hVx4fYTwsj0GRQ0211xIdbBzeutGboA4/542FRhR+NzBX6bh5BircbxHW2z/JK+6Vqscha
	+cNUr64fyxrF9iESJDYbhFk+jNmWwqGgKfToZZ3M+xuEdUDc3S0hdEFALKe5z3FIalYt8bXHJZrGU
	eocTBnslxImTYI8GPQUVvxNtKY8FuhB9UpByQ8iO6D3gJgCn12awDqKf4uSxgVMNhNVDrzJrVFFtM
	CkByoc5552xakWxgTlQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uK7Gp-0000000C21r-1QhF;
	Wed, 28 May 2025 03:15:59 +0000
Received: from mail-yw1-x112d.google.com ([2607:f8b0:4864:20::112d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uK7Gl-0000000C21K-1Uuh
	for linux-riscv@lists.infradead.org;
	Wed, 28 May 2025 03:15:57 +0000
Received: by mail-yw1-x112d.google.com with SMTP id 00721157ae682-70a57a8ffc3so35131627b3.0
        for <linux-riscv@lists.infradead.org>; Tue, 27 May 2025 20:15:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1748402154; x=1749006954; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=O6oO2HlPDXmXr8ML8UMtQX0ZnJHbbpXTwh/3FffHh2s=;
        b=KUZIGKoITLu8DTXUlP/NJxLZypYXIGgAzWHJSd07HhMIalDe0XSCd3X8tXVcXJcdtr
         y0gjeLoO5PoKJkmYzpe5576LRptSMYcsBghR89r81yFWY5MTQe/Xs9eytNo/1kS1UPsW
         nE9N8y6+4ZLZhFO5hWxGjLTNgcORqznpVYc5W5Dof8hjfGeRJTUEcTRaM+IC84vtVMUN
         5GQ5xpoHiUgg3lNQuNJn8lhWsNBKxiXL3fvgIQNv0pvEPiCGbL8NCHNMcYlkUVdu++uT
         ATBkS9qxi56zzWlmOSTmZR18X0L5ynLgbZBqSdSAmu1qWWAjq0nTHmymnpJWzNqq8gII
         zSWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748402154; x=1749006954;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=O6oO2HlPDXmXr8ML8UMtQX0ZnJHbbpXTwh/3FffHh2s=;
        b=M6kj0eA97o7YPG/kUYpZ1ac9Xvyr+KMEwxI2VHWOKUspTumgL5+g3gZANPFtAzgSiw
         SG9C6790/+8SqZKqAic52nsNB6ISgskPCZiKF/8YTRbSrSoKHaaq+0ixwBg5pFS7MKT7
         +Kui+ZgXGCiA7gYbXAtBvfHXpYn/bYSHdj6gB2+GtAiFUBz4GYW9hMrGLdNPuC8RJy1z
         g9A0H1UyIeaHKykunVyqrke6lG4Wh07Mk1MBlBm7SaUoD/tXIPpv7oZ/PrukhVk0gdbV
         R5zWHxB7JIC5fYfJfmi6Z5vDMeWLJR8aBgtt4Ln6JrdcUXuvpOVsul6xgmvXDFz0itay
         gYNg==
X-Forwarded-Encrypted: i=1; AJvYcCXfHtYbB/gZ9RmEHOljz1+qxQZWFDHNZYTJmN7yirkzzCpmk1qrrvVrtAjSRN8cCLVv5pWsqj4xJ3Otnw==@lists.infradead.org
X-Gm-Message-State: AOJu0Yw35ELhLd+lJt6jpKQG1v3ZOh/EsL9jwXM8ovHmtVqr6CtDpUC1
	K+DJalxx335FEQslQjmxJ/lIIkHnKN6JQNsq6YlrJdgrdHVsbU2kAsRAhlfspP2iCs6HL4Z8Vvl
	CF0XzmZr/Po74SnlrJCXJAUeuzpHDEuLhn7JkngSr3w==
X-Gm-Gg: ASbGncse6uGhh487EgnFbNazOK0nylGuqr39VKDltxkr7a9ZR32R5bUm15SoLy08v3O
	jAVjVIBGBsthZbKG3cgZuldoJATi0i0nsQzZWBOX2RgMro4hp3ewhfYPrYHbf6fH70FJkMqcYt5
	TmR2IegDhESegDuXE+Kr9J77p6r6yPUhg7pB1RswCU5NI9kA==
X-Google-Smtp-Source: AGHT+IFuyugK9QJlLjW19pbjFEAGU5G3W6GwoKeE6Fk2k3mBSLoCZhHE8LEA9fZnO2iQ+kzn6bG8RK5UQkVYfmd+6D4=
X-Received: by 2002:a05:6902:2b85:b0:e7d:c415:6fd1 with SMTP id
 3f1490d57ef6-e7dc41570d7mr8183492276.44.1748402153834; Tue, 27 May 2025
 20:15:53 -0700 (PDT)
MIME-Version: 1.0
References: <20250509021605.26764-1-nick.hu@sifive.com> <20250509-small-graceful-limpet-d0ea41@kuoka>
 <CAKddAkAzDGL-7MbroRqQnZzPXOquUMKNuGGppqB-d_XZXbcvBA@mail.gmail.com> <bd001136-eb48-44f0-8724-09eeb022df8e@kernel.org>
In-Reply-To: <bd001136-eb48-44f0-8724-09eeb022df8e@kernel.org>
From: Nick Hu <nick.hu@sifive.com>
Date: Wed, 28 May 2025 11:15:42 +0800
X-Gm-Features: AX0GCFtDGZ1aQRQahvIacjtswXBcdyUBwr2GTfHhybVIimW2KBTO9ISCN2ikdw0
Message-ID: <CAKddAkD_h6Qh-fSMbV6d-QK369pkZcVsQo0Kf9SQkzO64wMqfA@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: power: Add SiFive Domain Management controllers
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Cyan Yang <cyan.yang@sifive.com>, Samuel Holland <samuel.holland@sifive.com>, 
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250527_201555_414120_CF728C42 
X-CRM114-Status: GOOD (  22.28  )
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

T24gTW9uLCBNYXkgMTIsIDIwMjUgYXQgNjozOeKAr1BNIEtyenlzenRvZiBLb3psb3dza2kgPGty
emtAa2VybmVsLm9yZz4gd3JvdGU6Cj4KPiBPbiAxMi8wNS8yMDI1IDA1OjIwLCBOaWNrIEh1IHdy
b3RlOgo+ID4gT24gRnJpLCBNYXkgOSwgMjAyNSBhdCAyOjQw4oCvUE0gS3J6eXN6dG9mIEtvemxv
d3NraSA8a3J6a0BrZXJuZWwub3JnPiB3cm90ZToKPiA+Pgo+ID4+IE9uIEZyaSwgTWF5IDA5LCAy
MDI1IGF0IDEwOjE2OjA0QU0gR01ULCBOaWNrIEh1IHdyb3RlOgo+ID4+PiBTaUZpdmUgRG9tYWlu
IE1hbmFnZW1lbnQgY29udHJvbGxlciBpbmNsdWRlcyB0aGUgZm9sbG93aW5nIGNvbXBvbmVudHMK
PiA+Pj4gLSBTaUZpdmUgVGlsZSBNYW5hZ2VtZW50IENvbnRyb2xsZXIKPiA+Pj4gLSBTaUZpdmUg
Q2x1c3RlciBNYW5hZ2VtZW50IENvbnRyb2xsZXIKPiA+Pj4gLSBTaUZpdmUgQ29yZSBDb21wbGV4
IE1hbmFnZW1lbnQgQ29udHJvbGxlcgo+ID4+Pgo+ID4+PiBUaGVzZSBjb250cm9sbGVycyBjb250
cm9sIHRoZSBjbG9jayBhbmQgcG93ZXIgZG9tYWluIG9mIHRoZQo+ID4+PiBjb3JyZXNwb25kaW5n
IGRvbWFpbi4KPiA+Pj4KPiA+Pj4gU2lnbmVkLW9mZi1ieTogTmljayBIdSA8bmljay5odUBzaWZp
dmUuY29tPgo+ID4+PiBSZXZpZXdlZC1ieTogU2FtdWVsIEhvbGxhbmQgPHNhbXVlbC5ob2xsYW5k
QHNpZml2ZS5jb20+Cj4gPj4+IC0tLQo+ID4+PiAgLi4uL2RldmljZXRyZWUvYmluZGluZ3MvcG93
ZXIvc2lmaXZlLHRtYy55YW1sIHwgODkgKysrKysrKysrKysrKysrKysrKwo+ID4+Cj4gPj4gV2hl
cmUgaXMgYSBwYXRjaCB3aXRoIHRoZSBkcml2ZXIgKHVzZXIgb2YgdGhlIGJpbmRpbmcpPwo+ID4+
Cj4gPiBXZSBhcmUgaG9waW5nIHRoZSBkcml2ZXIgY2FuIGJlIHN1Ym1pdHRlZCBhdCBhIGxhdGVy
IHN0YWdlLgo+ID4gVGhlIGRyaXZlciB0aGF0IGhhbmRsZXMgdGhlIE1NSU8gaXMgaW1wbGVtZW50
ZWQgaW4gT3BlblNCSSBhbmQgZGVwZW5kcwo+ID4gb24gc29tZSBwcmVyZXF1aXNpdGUgcGF0Y2hl
cyBbMV0sIHNvIGl0IHdpbGwgZm9sbG93IGFmdGVyd2FyZC4KPgo+IFRoaXMgcGF0Y2ggYWxvbmUg
bWFrZXMgbGl0dGxlIHNlbnNlIGFuZCBicmluZ3MgbGl0dGxlIGJlbmVmaXQuIFBvc3QgdGhpcwo+
IHdpdGggdXNlci4KPgpUaGFua3MuIFdpbGwgdXBkYXRlIGl0IHdpdGggdGhlIHVzZXIuCgo+IC4u
Lgo+Cj4gPj4+ICsgIHJlZzoKPiA+Pj4gKyAgICBtYXhJdGVtczogMQo+ID4+PiArCj4gPj4+ICsg
IHNpZml2ZSxmZWF0dXJlLWxldmVsOgo+ID4+PiArICAgIGRlc2NyaXB0aW9uOiB8Cj4gPj4+ICsg
ICAgICBTdXBwb3J0ZWQgcG93ZXIgZmVhdHVyZXMuIFRoaXMgcHJvcGVydHkgaXMgYWJzZW50IGlm
IHRoZSBmdWxsIHNldCBvZiBmZWF0dXJlcwo+ID4+PiArICAgICAgaXMgc3VwcG9ydGVkCj4gPj4K
PiA+PiBDb21wYXRpYmxlIGRlZmluZXMgdGhpcy4gRHJvcC4KPiA+Pgo+ID4gVGhlIHByb3BlcnR5
IGRlcGVuZHMgb24gaG93IHRoZSBJUCBpcyBob29rZWQgdXAgdG8gdGhlIHJlc3Qgb2YgdGhlIFNv
Qy4KPiA+IEhhdmluZyB0aGlzIHByb3BlcnR5IHNpbXBsaWZpZXMgdGhlIFNXIGFuZCBhbGxvd3Mg
dXMgdG8gdXNlIGEgc2luZ2xlCj4gPiBmYWxsYmFjayBjb21wYXRpYmxlIHN0cmluZywgc28gd2Ug
cHJlZmVyIHRvIGtlZXAgaXQuCj4KPiBBbmQgd2UgcHJlZmVyIHlvdSB0byBmb2xsb3cgc3RhbmRh
cmQgRFQgcnVsZXMsIHNlZSB3cml0aW5nIGJpbmRpbmdzIG9yCj4gdGFsa3Mgb24gY29uZmVyZW5j
ZXMuCj4KVGhlIENQVSBhbHNvIGV4cG9zZXMgaXRzIEQtY2FjaGUgc2l6ZSwgd2hpY2ggY291bGQg
dGVjaG5pY2FsbHkgYmUKaW5mZXJyZWQgZnJvbSB0aGUgY29tcGF0aWJsZSBzdHJpbmcuIEhvd2V2
ZXIsIGl0IGNob3NlIHRvIHNwZWNpZnkgaXQKZXhwbGljaXRseSB1c2luZyB0aGUgYGQtY2FjaGUt
c2l6ZWAgcHJvcGVydHkgdG8gYWxsb3cgcmV1c2Ugb2YgYQpjb21tb24gaW5pdGlhbGl6YXRpb24g
ZnVuY3Rpb24gYWNyb3NzIGRpZmZlcmVudCBDUFVzLgpTaW1pbGFybHksIHdoaWxlIHRoZSBgc2lm
aXZlLGZlYXR1cmUtbGV2ZWxgIGNvdWxkIGJlIGluZmVycmVkIGZyb20gdGhlCmNvbXBhdGlibGUg
c3RyaW5nLCBkZWZpbmluZyBpdCBhcyBhIHByb3BlcnR5IHdvdWxkIGVuYWJsZSBhbGwKYHNpZml2
ZSx0bWNYYCB1c2VycyB0byBzaGFyZSB0aGUgc2FtZSBvcGVyYXRpb24gY29kZSwgaW1wcm92aW5n
IGNvZGUKcmV1c2UgYW5kIG1haW50YWluYWJpbGl0eS4KCklmIHlvdSBzdGlsbCBkaXNhZ3JlZSB3
aXRoIHRoaXMgYXBwcm9hY2gsIHdl4oCZbGwgZHJvcCB0aGUKYHNpZml2ZSxmZWF0dXJlLWxldmVs
YCBwcm9wZXJ0eSBpbiB0aGUgbmV4dCByZXZpc2lvbi4KTG9va2luZyBmb3J3YXJkIHRvIGhlYXJp
bmcgeW91ciBpbnB1dC4KCkJlc3QgUmVnYXJkcywKTmljawoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4
LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFp
bG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
