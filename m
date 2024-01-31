Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B291C47DB3
	for <linux-riscv@archiver.kernel.org>; Wed, 31 Jan 2024 18:37:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iF/UaXkIVWqK+hX+HgSjtX8rGQRyOfQRbmo0WHd6Zuk=; b=jqTQxuMvrDhzA9
	+P/48wE4YUAqeMfOh32tdUHdjyZcwwV9hroA3HVIiy/aZcLmgsJEHHvu2HZF37xG6owgVxrob6by7
	UebGXaUOFFDPgLZ9dYJn9XUM1U4f3EUYNMjZOSwWIM865TSdX6CSh6eCjvWrRtifWkm6F4VeG08Le
	e1YfdYt6r4/VZXllCXqXepaN9KxOv+lr4ncxxb/7UDpEm4whX0EjSAJPnhLrMqAWOiEc2nR4cu1px
	o+vhZ6vU3LHkj/Wf1jJVguLb13NUfuBUpt2C9slDEw1aWJOH4UaFFBCY4Ev/+906jhIv/kWUtHQHR
	knAQxLEpA0d19FCje0oA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rVFSE-000000055Fs-345f;
	Wed, 31 Jan 2024 18:36:58 +0000
Received: from mail-vk1-xa2c.google.com ([2607:f8b0:4864:20::a2c])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rVFSC-000000055Ee-2445
	for linux-riscv@lists.infradead.org;
	Wed, 31 Jan 2024 18:36:58 +0000
Received: by mail-vk1-xa2c.google.com with SMTP id 71dfb90a1353d-4b739b49349so46590e0c.1
        for <linux-riscv@lists.infradead.org>; Wed, 31 Jan 2024 10:36:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1706726214; x=1707331014; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=md+5piiWXmKjN01VJwfPkduOvpzQsk5Gbc1LCAGZCHM=;
        b=dfVvoQ0SSFbfePLCeAACQjIbot29+MlEh18FC61zTobzqb1I1q1o7k73tnRnqQz+Ur
         6sFONzDeSi/vqGra7TnSpeGDZXIe/sxEtAxD5WJ7yMn4LLUK8WKx9Dq27sQW1We46uep
         d5B3gW7MHoMs2GV1mN/4Fg5u+Wu0pVD0kh3rFuGQxtNpMS7yIh/HCubjz1rQNgN1pkBc
         4IGuX7UmUvbJYV57eCT2XTknErSHzCOzWr7Ero/R6Co70JM5b/tLV8NE9kwqYYouQ5D4
         JstuA0sP7CucVyPQCWtva8DhoJ7YZOFMTBFech7y0+LIm5XX7z3cr1OWW4NtpyiY94M7
         lqfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706726214; x=1707331014;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=md+5piiWXmKjN01VJwfPkduOvpzQsk5Gbc1LCAGZCHM=;
        b=QjdJZc8KStUT1ss9ZIzv/oA+Ge9X+IYjDIOTcmPb+QL5ZZQG4Q+XuZ0FCEl8yh2l8j
         +YNIEeiWx03ajRJGn0u+rPo1rW78FXTQ6QFTzyRdS0+Ueyy9zjOQZfXx5nlYWC8qtFR6
         S8YfRiJFsk/35NkeTnyaHspXPPPszLIr7Iv5MCr56BwWPxe33IkAYPJ3Fp+2UYGL4zro
         tuhAXyUjNmmMBG5k4YSbXOPJYYTEuYw5EyFbPUDFgCCWAALSUsD6GPG+Zrg7wUopLFmT
         slaOyWKtz7z1dOitLkVvkvpez+dCEcb6h6STyB0iwvpme946P8b2cVefLCMWoiO9Md0C
         bK/w==
X-Gm-Message-State: AOJu0Yyv1fF9ePeoJgVjpOEYfGSzgmMcheVCja+3ovIGw9apiEX0ame5
	6GNyvAhidBZG2IbPOevVYli7EQLDPhoFRhAG/Xcx5AXFzqRuiz2wVTWbSEPYmSEQM6Fvns6wF1Y
	n30dfIefa3Q1Vhz45B/hIR9lm+/E=
X-Google-Smtp-Source: AGHT+IEnW38T9BQmWMOcc/tVl3EFzSGPQf9woPnBE3HaaWWQoeX0PopBSjevHvFAvfx+3jXs6OflFORZ8k7PxaXoMY4=
X-Received: by 2002:a05:6122:1818:b0:4bd:b44c:24c1 with SMTP id
 ay24-20020a056122181800b004bdb44c24c1mr2595166vkb.11.1706726214233; Wed, 31
 Jan 2024 10:36:54 -0800 (PST)
MIME-Version: 1.0
References: <20240129151618.90922-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20240129151618.90922-3-prabhakar.mahadev-lad.rj@bp.renesas.com> <CAMuHMdV7Q4kMv1pFVNBf5oYF=_W_snp=5GKLpr9+OxeqxywhBw@mail.gmail.com>
In-Reply-To: <CAMuHMdV7Q4kMv1pFVNBf5oYF=_W_snp=5GKLpr9+OxeqxywhBw@mail.gmail.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Wed, 31 Jan 2024 18:36:20 +0000
Message-ID: <CA+V-a8spFYvOo2=9CwM-1EyMA3Xrc_rggUgxDZwZan2ou4SG1A@mail.gmail.com>
Subject: Re: [PATCH 2/5] irqchip/renesas-rzg2l: Add support for RZ/Five SoC
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Thomas Gleixner <tglx@linutronix.de>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, linux-renesas-soc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240131_103656_563396_6B455506 
X-CRM114-Status: GOOD (  29.32  )
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

SGkgR2VlcnQsCgpUaGFuayB5b3UgZm9yIHRoZSByZXZpZXcuCgpPbiBUdWUsIEphbiAzMCwgMjAy
NCBhdCAxMTozOOKAr0FNIEdlZXJ0IFV5dHRlcmhvZXZlbgo8Z2VlcnRAbGludXgtbTY4ay5vcmc+
IHdyb3RlOgo+Cj4gSGkgUHJhYmhha2FyLAo+Cj4gT24gTW9uLCBKYW4gMjksIDIwMjQgYXQgNDox
NuKAr1BNIFByYWJoYWthciA8cHJhYmhha2FyLmNzZW5nZ0BnbWFpbC5jb20+IHdyb3RlOgo+ID4g
RnJvbTogTGFkIFByYWJoYWthciA8cHJhYmhha2FyLm1haGFkZXYtbGFkLnJqQGJwLnJlbmVzYXMu
Y29tPgo+ID4KPiA+IFRoZSBJWDQ1IGJsb2NrIGhhcyBhZGRpdGlvbmFsIG1hc2sgcmVnaXN0ZXJz
IChOTVNLL0lNU0svVE1TSykgYXMgY29tcGFyZWQKPiA+IHRvIHRoZSBSWi9HMkwgKGZhbWlseSkg
U29DLgo+ID4KPiA+IEludHJvZHVjZSBtYXNraW5nL3VubWFza2luZyBzdXBwb3J0IGZvciBJUlEg
YW5kIFRJTlQgaW50ZXJydXB0cyBpbiBJUlFDCj4gPiBjb250cm9sbGVyIGRyaXZlci4gVHdvIG5l
dyByZWdpc3RlcnMsIElNU0sgYW5kIFRNU0ssIGFyZSBkZWZpbmVkIHRvCj4gPiBoYW5kbGUgbWFz
a2luZyBvbiBSWi9GaXZlIFNvQy4gVGhlIGltcGxlbWVudGF0aW9uIHV0aWxpemVzIGEgbmV3IGRh
dGEKPiA+IHN0cnVjdHVyZSwgYHN0cnVjdCByemcybF9pcnFjX2RhdGFgLCB0byBkZXRlcm1pbmUg
bWFzayBzdXBwb3J0IGZvciBhCj4gPiBzcGVjaWZpYyBjb250cm9sbGVyIGluc3RhbmNlLgo+ID4K
PiA+IFNpZ25lZC1vZmYtYnk6IExhZCBQcmFiaGFrYXIgPHByYWJoYWthci5tYWhhZGV2LWxhZC5y
akBicC5yZW5lc2FzLmNvbT4KPgo+IFRoYW5rcyBmb3IgeW91ciBwYXRjaCEKPgo+ID4gLS0tIGEv
ZHJpdmVycy9pcnFjaGlwL2lycS1yZW5lc2FzLXJ6ZzJsLmMKPiA+ICsrKyBiL2RyaXZlcnMvaXJx
Y2hpcC9pcnEtcmVuZXNhcy1yemcybC5jCj4gPiBAQCAtNjYsMTUgKzY4LDI1IEBAIHN0cnVjdCBy
emcybF9pcnFjX3JlZ19jYWNoZSB7Cj4gPiAgICAgICAgIHUzMiAgICAgdGl0c3JbMl07Cj4gPiAg
fTsKPiA+Cj4gPiArLyoqCj4gPiArICogc3RydWN0IHJ6ZzJsX2lycWNfZGF0YSAtIE9GIGRhdGEg
c3RydWN0dXJlCj4gPiArICogQG1hc2tfc3VwcG9ydGVkOiBJbmRpY2F0ZXMgaWYgbWFzayByZWdp
c3RlcnMgYXJlIGF2YWlsYWJsZQo+ID4gKyAqLwo+ID4gK3N0cnVjdCByemcybF9pcnFjX2RhdGEg
ewo+Cj4gVGhpcyBzdHJ1Y3R1cmUgaGFzIHRoZSBzYW1lIG5hbWUgYXMgdGhlIHNpbmdsZSBzdGF0
aWMgc3RydWN0Cj4gcnpnMmxfaXJxY19wcml2IGluc3RhbmNlLCB3aGljaCBpcyBjb25mdXNpbmcu
Cj4KQWdyZWVkLCBJIHdpbGwgcmVuYW1lIGl0IHRvIHJ6ZzJsX2lycWNfb2ZfZGF0YQoKPiA+ICsg
ICAgICAgYm9vbCAgICBtYXNrX3N1cHBvcnRlZDsKPiA+ICt9Owo+ID4gKwo+ID4gIC8qKgo+ID4g
ICAqIHN0cnVjdCByemcybF9pcnFjX3ByaXYgLSBJUlEgY29udHJvbGxlciBwcml2YXRlIGRhdGEg
c3RydWN0dXJlCj4gPiAgICogQGJhc2U6ICAgICAgQ29udHJvbGxlcidzIGJhc2UgYWRkcmVzcwo+
ID4gKyAqIEBkYXRhOiAgICAgIE9GIGRhdGEgcG9pbnRlcgo+ID4gICAqIEBmd3NwZWM6ICAgIElS
USBmaXJtd2FyZSBzcGVjaWZpYyBkYXRhCj4gPiAgICogQGxvY2s6ICAgICAgTG9jayB0byBzZXJp
YWxpemUgYWNjZXNzIHRvIGhhcmR3YXJlIHJlZ2lzdGVycwo+ID4gICAqIEBjYWNoZTogICAgIFJl
Z2lzdGVycyBjYWNoZSBmb3Igc3VzcGVuZC9yZXN1bWUKPiA+ICAgKi8KPiA+ICBzdGF0aWMgc3Ry
dWN0IHJ6ZzJsX2lycWNfcHJpdiB7Cj4gPiAgICAgICAgIHZvaWQgX19pb21lbSAgICAgICAgICAg
ICAgICAgICAgKmJhc2U7Cj4gPiArICAgICAgIGNvbnN0IHN0cnVjdCByemcybF9pcnFjX2RhdGEg
ICAgKmRhdGE7Cj4KPiBSZXBsYWNpbmcgdGhpcyBieSBhIGJvb2wgd291bGQgYXZvaWQgYSBwb2lu
dGVyIGRlcmVmZXJlbmNlIGluIGVhY2ggdXNlciwKPiBhbmQgYWxsb3dzIHlvdSB0byBtYWtlIHJ6
ZzJsX2lycWNfZGF0YSBldGMuIF9faW5pdGNvbnN0Lgo+CkRvIHlvdSBtZWFuIGp1c3QgYWRkICJi
b29sIG1hc2tfc3VwcG9ydGVkIiBoZXJlIGFuZCBnZXQgcmlkIG9mIHN0cnVjdApyemcybF9pcnFj
X2RhdGEgPyBDYW4geW91IHBsZWFzZSBlbGFib3JhdGUgaGVyZS4uCgo+ID4gICAgICAgICBzdHJ1
Y3QgaXJxX2Z3c3BlYyAgICAgICAgICAgICAgIGZ3c3BlY1tJUlFDX05VTV9JUlFdOwo+ID4gICAg
ICAgICByYXdfc3BpbmxvY2tfdCAgICAgICAgICAgICAgICAgIGxvY2s7Cj4gPiAgICAgICAgIHN0
cnVjdCByemcybF9pcnFjX3JlZ19jYWNoZSAgICAgY2FjaGU7Cj4KPiA+IEBAIC0zNzEsOSArNDc1
LDIzIEBAIHN0YXRpYyBpbnQgcnpnMmxfaXJxY19wYXJzZV9pbnRlcnJ1cHRzKHN0cnVjdCByemcy
bF9pcnFjX3ByaXYgKnByaXYsCj4gPiAgICAgICAgIHJldHVybiAwOwo+ID4gIH0KPiA+Cj4gPiAr
c3RhdGljIGNvbnN0IHN0cnVjdCByemcybF9pcnFjX2RhdGEgcnpmaXZlX2lycWNfZGF0YSA9IHsK
PiA+ICsgICAgICAgLm1hc2tfc3VwcG9ydGVkID0gdHJ1ZSwKPiA+ICt9Owo+ID4gKwo+ID4gK3N0
YXRpYyBjb25zdCBzdHJ1Y3QgcnpnMmxfaXJxY19kYXRhIHJ6ZzJsX2lycWNfZGVmYXVsdF9kYXRh
ID0gewo+ID4gKyAgICAgICAubWFza19zdXBwb3J0ZWQgPSBmYWxzZSwKPiA+ICt9Owo+ID4gKwo+
ID4gK3N0YXRpYyBjb25zdCBzdHJ1Y3Qgb2ZfZGV2aWNlX2lkIHJ6ZzJsX2lycWNfbWF0Y2hlc1td
ID0gewo+ID4gKyAgICAgICB7IC5jb21wYXRpYmxlID0gInJlbmVzYXMscjlhMDdnMDQzZi1pcnFj
IiwgLmRhdGEgPSAmcnpmaXZlX2lycWNfZGF0YSB9LAo+ID4gKyAgICAgICB7IH0KPiA+ICt9Owo+
ID4gKwo+ID4gIHN0YXRpYyBpbnQgcnpnMmxfaXJxY19pbml0KHN0cnVjdCBkZXZpY2Vfbm9kZSAq
bm9kZSwgc3RydWN0IGRldmljZV9ub2RlICpwYXJlbnQpCj4gPiAgewo+ID4gICAgICAgICBzdHJ1
Y3QgaXJxX2RvbWFpbiAqaXJxX2RvbWFpbiwgKnBhcmVudF9kb21haW47Cj4gPiArICAgICAgIGNv
bnN0IHN0cnVjdCBvZl9kZXZpY2VfaWQgKm1hdGNoOwo+ID4gICAgICAgICBzdHJ1Y3QgcGxhdGZv
cm1fZGV2aWNlICpwZGV2Owo+ID4gICAgICAgICBzdHJ1Y3QgcmVzZXRfY29udHJvbCAqcmVzZXRu
Owo+ID4gICAgICAgICBpbnQgcmV0Owo+ID4gQEAgLTM5Miw2ICs1MTAsMTIgQEAgc3RhdGljIGlu
dCByemcybF9pcnFjX2luaXQoc3RydWN0IGRldmljZV9ub2RlICpub2RlLCBzdHJ1Y3QgZGV2aWNl
X25vZGUgKnBhcmVudCkKPiA+ICAgICAgICAgaWYgKCFyemcybF9pcnFjX2RhdGEpCj4gPiAgICAg
ICAgICAgICAgICAgcmV0dXJuIC1FTk9NRU07Cj4gPgo+ID4gKyAgICAgICBtYXRjaCA9IG9mX21h
dGNoX25vZGUocnpnMmxfaXJxY19tYXRjaGVzLCBub2RlKTsKPiA+ICsgICAgICAgaWYgKG1hdGNo
KQo+ID4gKyAgICAgICAgICAgICAgIHJ6ZzJsX2lycWNfZGF0YS0+ZGF0YSA9IG1hdGNoLT5kYXRh
Owo+ID4gKyAgICAgICBlbHNlCj4gPiArICAgICAgICAgICAgICAgcnpnMmxfaXJxY19kYXRhLT5k
YXRhID0gJnJ6ZzJsX2lycWNfZGVmYXVsdF9kYXRhOwo+Cj4gSW5zdGVhZCBvZiBtYXRjaGluZyBh
IHNlY29uZCB0aW1lLCBJJ2QgcmF0aGVyIGFkZCBhIHNlY29uZAo+IElSUUNISVBfTUFUQ0goKSBl
bnRyeSB3aXRoIGEgZGlmZmVyZW50IGluaXQgZnVuY3Rpb24sIHBhc3NpbmcgdGhlCj4gYWN0dWFs
IHJ6ZzJsX2lycWNfZGF0YSBwb2ludGVyLgo+Ck9LLCBvciByYXRoZXIganVzdCBwYXNzIHRydWUv
ZmFsc2UgaW5zdGVhZCBvZiByemcybF9pcnFjX29mX2RhdGEgcG9pbnRlci4/CgpDaGVlcnMsClBy
YWJoYWthcgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
bGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcK
aHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
