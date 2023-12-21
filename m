Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D988C35274
	for <linux-riscv@archiver.kernel.org>; Thu, 21 Dec 2023 21:05:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jXi3PCDfptZ2HZTIowHnKEBiAEBFh/8XF5fv7aU6x5k=; b=2p+v0IS4nFpnhq
	4UzI5nHICwtd/rtiY7OSGY5y0ay1CWA3zZhylPQ4HzEVBbEHGEwouU3z2eWCWR3ulIwQszVH/HC0D
	ngLi4H2+kEDddztCok5CaY28Kbc/ZdAosTZGK+rbZC71vrNhN4fNcWlOo6AnOGnv23IIKRyxCCz04
	NCWEDtGeiC3izU9vGlzj4lc++ag3ZWiankbd/mYqPH566nyfVUu704U0ZUSpTqUle+SFfyxKeXZ4F
	K2HVTNE8HG8fAgeeGuS8qaPq/9ofpkTwIWTKnEdiC+lL0PQoJv3/DpPjpfxeZCj5MvvX/gDdECsGP
	aFdfZjYmKuMnM8lx4VMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rGQDx-0046Be-1G;
	Thu, 21 Dec 2023 21:04:57 +0000
Received: from mail-oi1-x22b.google.com ([2607:f8b0:4864:20::22b])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rGQDu-0046An-2Z
	for linux-riscv@lists.infradead.org;
	Thu, 21 Dec 2023 21:04:56 +0000
Received: by mail-oi1-x22b.google.com with SMTP id 5614622812f47-3ba46a19689so992816b6e.3
        for <linux-riscv@lists.infradead.org>; Thu, 21 Dec 2023 13:04:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1703192692; x=1703797492; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=a3iK+XCFKHi89cS9qJf066rKv09q1lojAXsmMshz01Y=;
        b=nqlgs0hkkicxPa4enIFhcUrGGvshAb3ObMBzCu92Vq73xrGHjzEBuBSRDcbKiQi13j
         D9eCPi4WCd3IxqJ/wsf77WmyIvvVmqKrwjT/O/PluPj2CQ7bxe1RB08NODGIftn0e00X
         CnZPLua8jsET6yJXhvN/Di+lPz6FTBxoBC22JqlOgpkBjc+6G/cRKzcC36n1p/HvTlt/
         9mYqCuF1VuhN0/JC19pZkGyR9l210k/rkUh4gWQyJIrUSAgf2CT1sDpFlIdr29Lwwd9V
         jwMbWSMYc3dZBBgk7f8PJq7pTWiKWsJF0OVtckz8yUVa8iXyyLDYgNWqnaDKcTZLsvYd
         74Dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703192692; x=1703797492;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=a3iK+XCFKHi89cS9qJf066rKv09q1lojAXsmMshz01Y=;
        b=bU6EJ8uM1qcAwsX0FngYPL+WLWIEda017kwoG7O7Zlj+K1fNJqnkVEk/Pi/0jAL65B
         kF7GJlhmGD2NPNPzon1TKLqNhGzgYGIULVnDaqbhDaGFldD0pV0pF3if7P6EAOI5hlyy
         k8N2IKrHPR91DJDUoGYXy4EJyIDaUJiZpE8uj59oFJfmkh5N5W6PLL4KXnfNaHUawKRs
         ZW9jNW4Xgk3xC0qzO5AEhbof+zmAwJQPe13QN5zKKvk/uCE67D6ZwzpmXy+goAhoPEMK
         ZpZuYpn6FUuIfHneokVv+ub7JbieupuPZXqy4hciJQQwkLEt7NdTlK2F39efk67Nld5x
         bDow==
X-Gm-Message-State: AOJu0Yzn6MS3SHfMm1j9QiwG/soMwtB1Y6Dj41/Z6M32TLOzRxAa92ls
	xuxcg6SiLopW+UjZmwQp9hEDG6qRp8vvtG54Pn0=
X-Google-Smtp-Source: AGHT+IEUZcUgQO01TA3QnTE4wGBRJXR3a8c0TbyeunrTHBygIVKvTGF9lNP5Ysmbw0AZg+9ePrkWX8aaxUxn15ecHP0=
X-Received: by 2002:a05:6870:b150:b0:203:a833:237e with SMTP id
 a16-20020a056870b15000b00203a833237emr553136oal.9.1703192692341; Thu, 21 Dec
 2023 13:04:52 -0800 (PST)
MIME-Version: 1.0
References: <20231201131551.201503-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20231201131551.201503-2-prabhakar.mahadev-lad.rj@bp.renesas.com> <CAMuHMdUiaL__+CDaFxRbUFgrz69SYBNfZm4JvY_qQRKLMTCY0w@mail.gmail.com>
In-Reply-To: <CAMuHMdUiaL__+CDaFxRbUFgrz69SYBNfZm4JvY_qQRKLMTCY0w@mail.gmail.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Thu, 21 Dec 2023 21:04:12 +0000
Message-ID: <CA+V-a8tTWf8Kx-Ex=DPsSR2ZWHC29N_pAoEZN1sR5Nqobf139A@mail.gmail.com>
Subject: Re: [PATCH v3 1/3] pinctrl: renesas: rzg2l: Include pinmap in
 RZG2L_GPIO_PORT_PACK() macro
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Linus Walleij <linus.walleij@linaro.org>, 
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-gpio@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231221_130454_860613_F191087A 
X-CRM114-Status: GOOD (  36.40  )
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

SGkgR2VlcnQsCgpUaGFuayB5b3UgZm9yIHRoZSByZXZpZXcuCgpPbiBXZWQsIERlYyA2LCAyMDIz
IGF0IDE6MTPigK9QTSBHZWVydCBVeXR0ZXJob2V2ZW4gPGdlZXJ0QGxpbnV4LW02OGsub3JnPiB3
cm90ZToKPgo+IEhpIFByYWJoYWthciwKPgo+IE9uIEZyaSwgRGVjIDEsIDIwMjMgYXQgMjoxNuKA
r1BNIFByYWJoYWthciA8cHJhYmhha2FyLmNzZW5nZ0BnbWFpbC5jb20+IHdyb3RlOgo+ID4gRnJv
bTogTGFkIFByYWJoYWthciA8cHJhYmhha2FyLm1haGFkZXYtbGFkLnJqQGJwLnJlbmVzYXMuY29t
Pgo+ID4KPiA+IEN1cnJlbnRseSB3ZSBhc3N1bWUgYWxsIHRoZSBwb3J0IHBpbnMgYXJlIHNlcXVl
bnRpYWwgaWUgYWx3YXlzIFBYXzAgdG8KPiA+IFBYX24gKG49MS4uNykgZXhpc3QsIGJ1dCBvbiBS
Wi9GaXZlIFNvQyB3ZSBoYXZlIGFkZGl0aW9uYWwgcGlucyBQMTlfMSB0bwo+ID4gUDI4XzUgd2hp
Y2ggaGF2ZSBob2xlcyBpbiB0aGVtLCBmb3IgZXhhbXBsZSBvbmx5IG9uZSBwaW4gb24gcG9ydDE5
IGlzCj4gPiBhdmFpbGFibGUgYW5kIHRoYXQgaXMgUDE5XzEgYW5kIG5vdCBQMTlfMC4gU28gdG8g
aGFuZGxlIHN1Y2ggY2FzZXMKPiA+IGluY2x1ZGUgcGlubWFwIGZvciBlYWNoIHBvcnQgd2hpY2gg
d291bGQgaW5kaWNhdGUgdGhlIHBpbiBhdmFpbGFiaWxpdHkKPiA+IG9uIGVhY2ggcG9ydC4gQXMg
dGhlIHBpbmNvdW50IGNhbiBiZSBjYWxjdWxhdGVkIGJhc2VkIG9uIHBpbm1hcCBkcm9wIHRoaXMK
PiA+IGZyb20gUlpHMkxfR1BJT19QT1JUX1BBQ0soKSBtYWNybyBhbmQgdXBkYXRlIFJaRzJMX0dQ
SU9fUE9SVF9HRVRfUElOQ05UKCkKPiA+IG1hY3JvLgo+ID4KPiA+IFByZXZpb3VzbHkgd2UgaGFk
IGEgbWF4IG9mIDcgcGlucyBvbiBlYWNoIHBvcnQgYnV0IG9uIFJaL0ZpdmUgUG9ydC0yMAo+ID4g
aGFzIDggcGlucywgc28gbW92ZSB0aGUgc2luZ2xlIHBpbiBjb25maWd1cmF0aW9uIHRvIEJJVCg2
MykuCj4gPgo+ID4gU2lnbmVkLW9mZi1ieTogTGFkIFByYWJoYWthciA8cHJhYmhha2FyLm1haGFk
ZXYtbGFkLnJqQGJwLnJlbmVzYXMuY29tPgo+Cj4gVGhhbmtzIGZvciB5b3VyIHBhdGNoIQo+Cj4g
PiAtLS0gYS9kcml2ZXJzL3BpbmN0cmwvcmVuZXNhcy9waW5jdHJsLXJ6ZzJsLmMKPiA+ICsrKyBi
L2RyaXZlcnMvcGluY3RybC9yZW5lc2FzL3BpbmN0cmwtcnpnMmwuYwo+ID4gQEAgLTgwLDE1ICs4
MCwxNyBAQAo+ID4gICAqIG4gaW5kaWNhdGVzIG51bWJlciBvZiBwaW5zIGluIHRoZSBwb3J0LCBh
IGlzIHRoZSByZWdpc3RlciBpbmRleAo+ID4gICAqIGFuZCBmIGlzIHBpbiBjb25maWd1cmF0aW9u
IGNhcGFiaWxpdGllcyBzdXBwb3J0ZWQuCj4gPiAgICovCj4gPiAtI2RlZmluZSBSWkcyTF9HUElP
X1BPUlRfUEFDSyhuLCBhLCBmKSAgKCgobikgPDwgMjgpIHwgKChhKSA8PCAyMCkgfCAoZikpCj4g
PiAtI2RlZmluZSBSWkcyTF9HUElPX1BPUlRfR0VUX1BJTkNOVCh4KSAgKCgoeCkgJiBHRU5NQVNL
KDMwLCAyOCkpID4+IDI4KQo+ID4gKyNkZWZpbmUgUlpHMkxfR1BJT19QT1JUX1BBQ0sobiwgYSwg
ZikgICgoKG4pID4gMCA/ICgodTY0KShHRU5NQVNLX1VMTCgoKG4pIC0gMSArIDI4KSwgMjgpKSkg
OiAwKSB8IFwKPgo+IFRoZSBtYXNrIGNyZWF0aW9uIGNhbiBiZSBzaW1wbGlmaWVkIHRvCj4KPiAg
ICAgKCgxVUxMIDw8IChuKSkgLSAxKSA8PCAyOAo+Ck9LLgoKPiBidXQgc2VlIGJlbG93Li4uCj4K
PiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgKChhKSA8PCAyMCkg
fCAoZikpCj4gPiArI2RlZmluZSBSWkcyTF9HUElPX1BPUlRfR0VUX1BJTk1BUCh4KSAgKCgoeCkg
JiBHRU5NQVNLX1VMTCgzNSwgMjgpKSA+PiAyOCkKPiA+ICsjZGVmaW5lIFJaRzJMX0dQSU9fUE9S
VF9HRVRfUElOQ05UKHgpICAoaHdlaWdodDgoUlpHMkxfR1BJT19QT1JUX0dFVF9QSU5NQVAoKHgp
KSkpCj4KPiBJIHRoaW5rIHdlJ3ZlIHJlYWNoZWQgdGhlIHBvaW50IHdoZXJlIGl0IHdvdWxkIGJl
IGVhc2llciBmb3IgdGhlCj4gY2FzdWFsIHJldmlld2VyIHRvICNkZWZpbmUgUElOX0NGR18qX01B
U0sgZm9yIGFsbCBmaWVsZHMsIGFuZCB1c2UKPiBGSUVMRF97UFJFUCxHRVR9KCkgdG8gcGFjayBy
ZXNwLiBleHRyYWN0IHZhbHVlcy4gIFRoYXQgd291bGQgYWxzbwo+IG1ha2UgaXQgbW9yZSBvYnZp
b3VzIHdoaWNoIGJpdHMgYXJlIGluIHVzZSwgYW5kIGhvdyBtYW55IGJpdHMgYXJlCj4gc3RpbGwg
YXZhaWxhYmxlIGZvciBmdXR1cmUgdXNlLgo+CklmIEkgdXNlIHRoZSBGSUVMRF9QUkVQKCkgbWFj
cm8gbGlrZSBiZWxvdyBJIGdldCBidWlsZCBpc3N1ZXMgYXMgYmVsb3c6CgojZGVmaW5lIFJaRzJM
X0dQSU9fUE9SVF9QSU5fQ05UX01BU0sgICAgR0VOTUFTSygzMSwgMjgpCiNkZWZpbmUgUlpHMkxf
R1BJT19QT1JUX1BJTl9SRUdfTUFTSyAgICBHRU5NQVNLKDI3LCAyMCkKI2RlZmluZSBSWkcyTF9H
UElPX1BPUlRfUElOX0NGR19NQVNLICAgIEdFTk1BU0soMTksIDApCiNkZWZpbmUgUlpHMkxfR1BJ
T19QT1JUX1BBQ0sobiwgYSwgZikKRklFTERfUFJFUChSWkcyTF9HUElPX1BPUlRfUElOX0NOVF9N
QVNLLCBuKSB8IFwKICAgICAgICAgICAgICAgICAgICBGSUVMRF9QUkVQKFJaRzJMX0dQSU9fUE9S
VF9QSU5fUkVHX01BU0ssIGEpIHwgXAogICAgICAgICAgICAgICAgICAgIEZJRUxEX1BSRVAoUlpH
MkxfR1BJT19QT1JUX1BJTl9DRkdfTUFTSywgZikKCgpkcml2ZXJzL3BpbmN0cmwvcmVuZXNhcy9w
aW5jdHJsLXJ6ZzJsLmM6OTE6NDE6IG5vdGU6IGluIGV4cGFuc2lvbiBvZgptYWNybyAnRklFTERf
UFJFUCcKICAgOTEgfApGSUVMRF9QUkVQKFJaRzJMX0dQSU9fUE9SVF9QSU5fQ0ZHX01BU0ssIGYp
CiAgICAgIHwgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIF5+fn5+fn5+
fn4KZHJpdmVycy9waW5jdHJsL3JlbmVzYXMvcGluY3RybC1yemcybC5jOjE0ODY6OTogbm90ZTog
aW4gZXhwYW5zaW9uIG9mCm1hY3JvICdSWkcyTF9HUElPX1BPUlRfUEFDSycKIDE0ODYgfCAgICAg
ICAgIFJaRzJMX0dQSU9fUE9SVF9QQUNLKDYsIDB4MmEsClJaRzNTX01QWEVEX1BJTl9GVU5DUyhB
KSksICAgICAgICAgICAgICAgICAgICAgICAgLyogUDE4ICovCiAgICAgIHwgICAgICAgICBefn5+
fn5+fn5+fn5+fn5+fn5+fgoKRG8geW91IGhhdmUgYW55IHBvaW50ZXJzPwoKQ2hlZXJzLApQcmFi
aGFrYXIKCj4gPgo+ID4gIC8qCj4gPiAtICogQklUKDMxKSBpbmRpY2F0ZXMgZGVkaWNhdGVkIHBp
biwgcCBpcyB0aGUgcmVnaXN0ZXIgaW5kZXggd2hpbGUKPiA+ICsgKiBCSVQoNjMpIGluZGljYXRl
cyBkZWRpY2F0ZWQgcGluLCBwIGlzIHRoZSByZWdpc3RlciBpbmRleCB3aGlsZQo+ID4gICAqIHJl
ZmVyZW5jaW5nIHRvIFNSL0lFTi9JT0xIL0ZJTHh4IHJlZ2lzdGVycywgYiBpcyB0aGUgcmVnaXN0
ZXIgYml0cwo+ID4gICAqIChiICogOCkgYW5kIGYgaXMgdGhlIHBpbiBjb25maWd1cmF0aW9uIGNh
cGFiaWxpdGllcyBzdXBwb3J0ZWQuCj4gPiAgICovCj4gPiAtI2RlZmluZSBSWkcyTF9TSU5HTEVf
UElOICAgICAgICAgICAgICAgQklUKDMxKQo+ID4gKyNkZWZpbmUgUlpHMkxfU0lOR0xFX1BJTiAg
ICAgICAgICAgICAgIEJJVF9VTEwoNjMpCj4gPiAgI2RlZmluZSBSWkcyTF9TSU5HTEVfUElOX1BB
Q0socCwgYiwgZikgKFJaRzJMX1NJTkdMRV9QSU4gfCBcCj4gPiAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICgocCkgPDwgMjQpIHwgKChiKSA8PCAyMCkgfCAoZikpCj4g
PiAgI2RlZmluZSBSWkcyTF9TSU5HTEVfUElOX0dFVF9CSVQoeCkgICAgKCgoeCkgJiBHRU5NQVNL
KDIyLCAyMCkpID4+IDIwKQo+Cj4gTGlrZXdpc2UuCj4KPiA+IEBAIC0xODAsMTIgKzE4MiwxMiBA
QCBzdHJ1Y3QgcnpnMmxfaHdjZmcgewo+ID4KPiA+ICBzdHJ1Y3QgcnpnMmxfZGVkaWNhdGVkX2Nv
bmZpZ3Mgewo+ID4gICAgICAgICBjb25zdCBjaGFyICpuYW1lOwo+ID4gLSAgICAgICB1MzIgY29u
ZmlnOwo+ID4gKyAgICAgICB1NjQgY29uZmlnOwo+ID4gIH07Cj4KPiBUaGUgcmVzdCBMR1RNLiAg
SXQncyBhIHBpdHkgd2UgaGF2ZSB0byBzd2l0Y2ggdG8gNjQgYml0cywgYnV0IEknbQo+IGFmcmFp
ZCB0aGVyZSBpcyBub3QgbXVjaCB3ZSBjYW4gZG8gYWJvdXQgdGhhdC4uLgo+Cj4gR3J7b2V0amUs
ZWV0aW5nfXMsCj4KPiAgICAgICAgICAgICAgICAgICAgICAgICBHZWVydAo+Cj4gLS0KPiBHZWVy
dCBVeXR0ZXJob2V2ZW4gLS0gVGhlcmUncyBsb3RzIG9mIExpbnV4IGJleW9uZCBpYTMyIC0tIGdl
ZXJ0QGxpbnV4LW02OGsub3JnCj4KPiBJbiBwZXJzb25hbCBjb252ZXJzYXRpb25zIHdpdGggdGVj
aG5pY2FsIHBlb3BsZSwgSSBjYWxsIG15c2VsZiBhIGhhY2tlci4gQnV0Cj4gd2hlbiBJJ20gdGFs
a2luZyB0byBqb3VybmFsaXN0cyBJIGp1c3Qgc2F5ICJwcm9ncmFtbWVyIiBvciBzb21ldGhpbmcg
bGlrZSB0aGF0Lgo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgLS0gTGludXMgVG9y
dmFsZHMKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxp
bnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0
dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
