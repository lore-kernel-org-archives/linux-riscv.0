Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4ADB4C77B73
	for <linux-riscv@archiver.kernel.org>; Fri, 26 May 2023 18:48:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Nz1V4w85LsIU9Ub+A7ScYOo7D6GpLVY434QFKo5qtD0=; b=SG5fxwt3A4UJqt
	E0KTC1aoi8Ml5zF8EwmInLrwPXdKLFXhSBFDG+gugdzBkb47EfAmKZBCS+eA4AUhmObKqR3AdSQsZ
	GhUSSXz2LKNUqBERCEVrJDwOrrvT9LvX7eULuknV1F7/v3XpP3HXBVP8VzVmsRc+5iAqAAw6Adx1V
	P/F0ywI8yteWw0qJK7ll41g8ZZoWaELPfoJjr8XEFvvkuN6nRDR0+8r1LuVUVEYSYYSyIly6RnYQD
	lCi26w16WBmRUf6z2E4zYqaS+k1MCxOg2S/9XkgiDBJmYXHAQIQpI2/yZr6Nk+lxipX8h4VCA/c6z
	Q21RexOW0W2WalY7Fx3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q2cUX-003Y04-1O;
	Fri, 26 May 2023 18:48:45 +0000
Received: from mail-lj1-x22a.google.com ([2a00:1450:4864:20::22a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q2cUU-003Xyc-0g
	for linux-riscv@lists.infradead.org;
	Fri, 26 May 2023 18:48:44 +0000
Received: by mail-lj1-x22a.google.com with SMTP id 38308e7fff4ca-2af2e1725bdso14873531fa.0
        for <linux-riscv@lists.infradead.org>; Fri, 26 May 2023 11:48:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=atishpatra.org; s=google; t=1685126919; x=1687718919;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8fFXLC7rXbzzICb4uWYgI+q3GvH1gbWqD9s+YhYheVk=;
        b=aP1Z4hqt95NdHijFJEYNYIfnCHGEBewM1z08G57qdP3ITGyEVNuWG/WbMXkcqYjxnf
         SDV+fEzgfPlE9dlUZEG7nuSlarOhFHk+T59T717oX5WqatKbZNhiH24N8ZDMu2LBqTEP
         Mio30kYaI27lIJMXhW3m4yQ29BgFYQ0nTcNYI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685126919; x=1687718919;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8fFXLC7rXbzzICb4uWYgI+q3GvH1gbWqD9s+YhYheVk=;
        b=ClAUNVJ2XybeGai6WzJOca6mbgjFW6HCXa71tRiklK+IeWEZUFIRhxmf5v3DYo2xJO
         oiWdDJWB9Ik9HIrdbZaiwUQmo7LkkSAFozQvA1Ib+k89QgdbZFnRix8hUY3fEJPIEr7t
         MLkvUQYl9dzX/d/JCmZfnRQJ1Ht41+mQ1qUpTLBajomh/b/uTJz8tgO54Lf7o5b5uiw/
         L0L0UOhDhg6XZMAwibVR9X2+b9q2M59UkOzHaf4KnKmHQsaX2+GponPjWDcGZjHWu45V
         6d6vi48o87PDEtAV7wKd2qc8WKI5bxZY/xdyri23QbXrwIVlOokpb+9u8EKiL9PTN3OO
         e6BA==
X-Gm-Message-State: AC+VfDy6R1aCMo99p6A77p3FkQe8gIZQ3JpLno6KRW8bkFap+hAlpD63
	frYy2ALayErD6c2rec1dYHSjNP5CYV2kqGnbhp90
X-Google-Smtp-Source: ACHHUZ7OlOCOqDXJiLiAQrC+hrddLdgM783sV5O9CAZiFex9Fdl67PZ5PunW+TbhFECau3TLYHD0XSbkGkXl1esAO4c=
X-Received: by 2002:a2e:9d8b:0:b0:2af:2786:271d with SMTP id
 c11-20020a2e9d8b000000b002af2786271dmr723853ljj.21.1685126919013; Fri, 26 May
 2023 11:48:39 -0700 (PDT)
MIME-Version: 1.0
References: <20230525-shrapnel-precut-26500fca4a48@wendy> <CAAhSdy3SqeLdAfaojUki=ht21nr4ZUPMkW_t9M6ntQCt6Ds4Nw@mail.gmail.com>
 <20230525-citric-waged-a2f78d27eb0c@wendy> <CAOnJCULfC0jmiucLNMeJZwJf4QbGAN6r4B-ubUbP16KVpxrCfA@mail.gmail.com>
 <20230525-flaring-trading-f2bf0713ae26@spud> <CAOnJCUK_EgX-En1QNS8yX1WA1nj8w2kpvXMQcvgWuR3dvzEQYw@mail.gmail.com>
 <20230525-desecrate-imposing-d97ab34e06ad@spud> <CAOnJCUKfRv68Bh8ue=ZhMGxai9_UEHLpm3553g2c2NXh-RP-TQ@mail.gmail.com>
 <20230525-batting-botch-7e03393a2d97@spud> <CAHVXubiDezbwZO6X2btvgpq-XqHnxZjXzaMnSK2YrHc_ioLx8Q@mail.gmail.com>
 <20230526-steep-omen-a5a46a1086bf@spud> <f82e7d3d-a16d-593e-7513-753b5cbf28af@ghiti.fr>
 <CAAhSdy0_XqiB=1w3hnYkipPj1aF_D=z=MD2fKLxk6rb_iDdBow@mail.gmail.com> <CAHVXubj2oHJGwbfEukxRg58xHyVOieTdCa5wjHsR5XZ8rmxjgg@mail.gmail.com>
In-Reply-To: <CAHVXubj2oHJGwbfEukxRg58xHyVOieTdCa5wjHsR5XZ8rmxjgg@mail.gmail.com>
From: Atish Patra <atishp@atishpatra.org>
Date: Fri, 26 May 2023 11:48:27 -0700
Message-ID: <CAOnJCU+2PHToCSWdauh5CarUa8iNcE4Ugv3gj=TiLVVoevU_iQ@mail.gmail.com>
Subject: Re: Bug report: kernel paniced when system hibernates
To: Alexandre Ghiti <alexghiti@rivosinc.com>
Cc: Anup Patel <anup@brainfault.org>, Alexandre Ghiti <alex@ghiti.fr>, Conor Dooley <conor@kernel.org>, 
	=?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@rivosinc.com>, 
	Conor Dooley <conor.dooley@microchip.com>, Anup Patel <apatel@ventanamicro.com>, robh@kernel.org, 
	jeeheng.sia@starfivetech.com, linux-kernel@vger.kernel.org, 
	palmer@rivosinc.com, leyfoon.tan@starfivetech.com, mason.huo@starfivetech.com, 
	Guo Ren <guoren@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Song Shuai <suagrfillet@gmail.com>, linux-riscv@lists.infradead.org, 
	Andrew Jones <ajones@ventanamicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230526_114842_431309_B348210B 
X-CRM114-Status: GOOD (  32.16  )
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

T24gRnJpLCBNYXkgMjYsIDIwMjMgYXQgODoyMuKAr0FNIEFsZXhhbmRyZSBHaGl0aSA8YWxleGdo
aXRpQHJpdm9zaW5jLmNvbT4gd3JvdGU6Cj4KPiBPbiBGcmksIE1heSAyNiwgMjAyMyBhdCA1OjE3
4oCvUE0gQW51cCBQYXRlbCA8YW51cEBicmFpbmZhdWx0Lm9yZz4gd3JvdGU6Cj4gPgo+ID4gT24g
RnJpLCBNYXkgMjYsIDIwMjMgYXQgODo0MuKAr1BNIEFsZXhhbmRyZSBHaGl0aSA8YWxleEBnaGl0
aS5mcj4gd3JvdGU6Cj4gPiA+Cj4gPiA+Cj4gPiA+IE9uIDI2LzA1LzIwMjMgMTY6NTksIENvbm9y
IERvb2xleSB3cm90ZToKPiA+ID4gPiBPbiBGcmksIE1heSAyNiwgMjAyMyBhdCAwMzoxNDozM1BN
ICswMjAwLCBBbGV4YW5kcmUgR2hpdGkgd3JvdGU6Cj4gPiA+ID4+IEhpIGV2ZXJ5b25lLAo+ID4g
PiA+Pgo+ID4gPiA+PiBPbiBUaHUsIE1heSAyNSwgMjAyMyBhdCAxMToyNOKAr1BNIENvbm9yIERv
b2xleSA8Y29ub3JAa2VybmVsLm9yZz4gd3JvdGU6Cj4gPiA+ID4+PiBPbiBUaHUsIE1heSAyNSwg
MjAyMyBhdCAwMTowNjowNFBNIC0wNzAwLCBBdGlzaCBQYXRyYSB3cm90ZToKPiA+ID4gPj4+PiBP
biBUaHUsIE1heSAyNSwgMjAyMyBhdCAxMTozOeKAr0FNIENvbm9yIERvb2xleSA8Y29ub3JAa2Vy
bmVsLm9yZz4gd3JvdGU6Cj4gPiA+ID4+Pj4+IE9uIFRodSwgTWF5IDI1LCAyMDIzIGF0IDExOjM3
OjQwQU0gLTA3MDAsIEF0aXNoIFBhdHJhIHdyb3RlOgo+ID4gPiA+Pj4+Pgo+ID4gPiA+Pj4+Pj4g
QW55IHRlc3Rpbmcgb2YgaGliZXJuYXRpb24gc3RpbGwgbmVlZHMgdG8gcmV2ZXJ0IHRoZSBwYXRj
aCB1bnRpbCB3ZQo+ID4gPiA+Pj4+Pj4gaGF2ZSB0aGUgcHJvcGVyIGZpeC4KPiA+ID4gPj4+Pj4g
InRoZSBwYXRjaCIgaXMgd2hhdCBleGFjdGx5PyBJIGFzc3VtZSB5b3UgZG9uJ3QgbWVhbiBkZXBl
bmRpbmcgb24KPiA+ID4gPj4+Pj4gTk9OUE9SVEFCTEUsIHNpbmNlIHRoYXQgaXMgYSBLY29uZmln
IG9wdGlvbi4KPiA+ID4gPj4+PiBOb3BlLiBTb3JyeSBJIG1lYW50IHRoZSBjb21taXQKPiA+ID4g
Pj4+Pgo+ID4gPiA+Pj4+IDMzMzUwNjggKCJyaXNjdjogVXNlIFBVRC9QNEQvUEdEIHBhZ2VzIGZv
ciB0aGUgbGluZWFyIG1hcHBpbmciKQo+ID4gPiA+Pj4gQWgsIGlmIHlvdXIgU0JJIGltcGxlbWVu
dGF0aW9uIGlzIG9uZSBvZiB0aGUgYWZmZWN0ZWQgb25lcywgeWVhaC4KPiA+ID4gPj4+IElmIG5v
dCwgeW91IGNhbiBqdXN0IHNldCBOT05QT1JUQUJMRSA6KQo+ID4gPiA+PiBAQmrDtnJuIFTDtnBl
bCBlbWl0dGVkIHRoZSBpZGVhIG9mIGV4Y2x1ZGluZyBmcm9tIHRoZSBoaWJlcm5hdGlvbiBhbGwK
PiA+ID4gPj4gdGhlIG1lbW9yeSBub2RlcyBpbiB0aGUgIi9yZXNlcnZlZC1tZW1vcnkiIG5vZGUK
PiA+ID4gPj4gKGh0dHBzOi8vZWxpeGlyLmJvb3RsaW4uY29tL2xpbnV4L3Y2LjQtcmMxL3NvdXJj
ZS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvcmVzZXJ2ZWQtbWVtb3J5L3Jlc2Vy
dmVkLW1lbW9yeS55YW1sKToKPiA+ID4gPj4gSSBoYXZlIHRvIGFkbWl0IHRoYXQgSSBkb24ndCBz
ZWUgd2h5IGl0IGlzIG5vdCBkb25lIGJ5IGRlZmF1bHQgYnkgdGhlCj4gPiA+ID4+IGtlcm5lbC4K
PiA+ID4gPiBNeSB1bmRlcnN0YW5kaW5nIHdhcyB0aGF0IGl0IHdhcyBwZXJmZWN0bHkgZmluZSB0
byB1c2UgcmVzZXJ2ZWQgbWVtb3J5Cj4gPiA+ID4gbm9kZXMgdG8gZmVuY2Ugb2ZmIHNvbWUgbWVt
b3J5IHRvIHVzZSBpbiBkZXZpY2UgZHJpdmVycyBldGMsIHdoaWNoIHRoZW4KPiA+ID4gPiBtYXkg
bmVlZCB0byBiZSBzYXZlZC9yZXN0b3JlZC4KPiA+ID4KPiA+ID4KPiA+ID4gQWdyZWVkLCBidXQg
SSB3b3VsZCBzYXkgdGhhdCBpdCdzIHVwIHRvIHRoZSBkcml2ZXIgdGhlbiB0byB0YWtlIGNhcmUg
b2YKPiA+ID4gdGhhdCwgc2VlIGh0dHBzOi8vZG9jcy5rZXJuZWwub3JnL2RyaXZlci1hcGkvcG0v
bm90aWZpZXJzLmh0bWwKPiA+Cj4gPiBJIGFncmVlLCBpdCBzaG91bGQgYmUgZHJpdmVycyByZXNw
b25zaWJpbGl0eSB0byBzYXZlL3Jlc3RvcmUgdGhlIGRlZGljYXRlZAo+ID4gcmVzZXJ2ZWQgbWVt
b3J5IHVzZWQgYnkgaXRzZWxmLgo+ID4KPiA+IEFsdGhvdWdoLCBJIHRoaW5rIHdlIHNob3VsZCBh
dCBsZWFzdCBzYXZlL3Jlc3RvcmUgcmVzZXJ2ZWQgbWVtb3J5Cj4gPiByZWdpb25zIGhhdmluZyAi
cmV1c2FibGUiIHByb3BlcnR5IHNldC4KPgoKVGhhdCB3b3VsZCBiZSBjZXJ0YWlubHkgaWRlYWwu
IEhvd2V2ZXIsIHRoYXQgcGllY2Ugb2YgY29kZSBoYXMgYmVlbgpwcmVzZW50IGZvciBhZ2VzIChs
YXN0IGNvbW1pdCB3YXMgaW4gMjAwOCEpLgpUaGVyZSBtYXkgYmUgYSBidW5jaCBvZiBkcml2ZXJz
IHdyaXR0ZW4gd2l0aCB0aGlzIGJ1aWx0aW4gYXNzdW1wdGlvbi4KCj4gR29vZCBwb2ludCEgSSds
bCBwcm9wb3NlIGFuIFJGQyBhbmQgZ2F0aGVyIGZlZWRiYWNrIGZyb20gdGhlIHBlb3BsZSBpbgo+
IGNoYXJnZSBvZiB0aGUgaGliZXJuYXRpb24gcHJvY2Vzcy4KCkhvcGVmdWxseSwgaXQncyBub3Qg
dG9vIGJhZC4KCj4KPiA+Cj4gPiBSZWdhcmRzLAo+ID4gQW51cAo+ID4KPiA+ID4KPiA+ID4KPiA+
ID4gPj4gVW5sZXNzIHRoZXJlIGlzIHN0dWZmIGluIHRoaXMgbm9kZSB0aGF0IG5lZWRzIHRvIGJl
ICJoaWJlcm5hdGVkIiwgSQo+ID4gPiA+PiB0aGluayB0aGF0IHdvdWxkIGJlIGEgdmVyeSBnb29k
IHNvbHV0aW9uIHNpbmNlIHdlIHdvdWxkIG5vdCByZWx5IG9uCj4gPiA+ID4+IHRoZSBuYW1lIG9m
IHRoZSAiaW50ZXJuYWwiIG5vZGVzIG9mICIvcmVzZXJ2ZWQtbWVtb3J5IiAoaS5lLgo+ID4gPiA+
PiAibW1vZGVfcmVzdiIpLgo+ID4gPiA+Pgo+ID4gPiA+PiBJJ20gZGlnZ2luZyBpbnRvIHdoeSBp
dCBpcyBub3QgZG9uZSBieSBkZWZhdWx0LCBqdXN0IHdhbnRlZCB0byBoYXZlCj4gPiA+ID4+IHlv
dXIgZmVlZGJhY2sgYmVmb3JlIHRoZSB3ZWVrLWVuZCA6KQoKCgotLSAKUmVnYXJkcywKQXRpc2gK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJp
c2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9s
aXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
