Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2A3AC04FFE
	for <linux-riscv@archiver.kernel.org>; Wed, 17 Apr 2024 06:04:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DxU/+iHQa8MVCe+0cNIzew9beVSAtGeD4lRXBm5mU10=; b=D5Hy6pg6a6plps
	7SPnCd7XJT3qx4TOBCZGu+Y4+iug7Rfa0y3jqeE9DutryQRfCH6wSYhcX5/Gx+6gcdYTEGIvemudY
	kafw/qZpH3YyhRzec3+EYJPNrYL/imVR5SeZRbnqQrc2AMbPRyA2zl9KbzoqJQ4Q/Jw9qqF9p7rJF
	8pEp3hozQNjTcVA1fkwjDGpzbfbRxG/Wtc+wsMox9tcy4p8iyRLLnCYVLt6E1/cjUnv3bymtvIGwJ
	5McKGFCu5+FmSp7289M9RZ5TGqECY/J+y3Lzs8TpL5F1f/oxqd5x8OsQIU09WISMt7MLm5SdhQrAO
	zug3J3T4HG4nZ4YCkI+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwyP7-0000000Eop8-3rg5;
	Wed, 17 Apr 2024 06:04:21 +0000
Received: from mail-il1-x132.google.com ([2607:f8b0:4864:20::132])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwyP4-0000000EooT-0Mf6
	for linux-riscv@lists.infradead.org;
	Wed, 17 Apr 2024 06:04:20 +0000
Received: by mail-il1-x132.google.com with SMTP id e9e14a558f8ab-36a0bca01e2so24761875ab.3
        for <linux-riscv@lists.infradead.org>; Tue, 16 Apr 2024 23:04:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1713333855; x=1713938655; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=emlaPvn8yP0ZKbzvbtaqbLqnMofLE1ThVdu9UJ+caJI=;
        b=cH6g7vhtMqBR8OMfU/whCNUrbFdnwIb2R6kCCPRdZNa3onrjo24p4qx1/P+U37nQwE
         RuPU8B2kyvDflBcC31lsA097XLyO+hDZsTVGI21I/Or+izsHCO4V5fbu0kOgC49RPxeQ
         0r7fRSEK78lB+EIFAahrenzyJA/Eif+9Dzd5jM2JEHa5ScrqgsLcGdlbUeR9aczU5EOt
         n/py+cByTRyho0AZIG+b/1EcUGYEjkTwmVVQLgx3WyQGPC+Z1okLuQNNGfJnHqUlSx9y
         ul1GuoxoRRZ+VVupfXkAp2ucXKiLJA2EFgOmxfXii3Gx58l+8sdswdFam8FmdontNIAb
         apxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713333855; x=1713938655;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=emlaPvn8yP0ZKbzvbtaqbLqnMofLE1ThVdu9UJ+caJI=;
        b=bezg55s2nT4zp/kWNoJYL2ZMcaStoGf3EKizFR7ZvvGGBaFzwbL/ma+2WjSRjPFuOj
         r59ddxGeEI4KuBVV0KrxTyyVVdzdVxOvskjeCTuuU3T+luh1f9wfaUcES/ZDPgalivIG
         SGv3zPRLenaK4Ln5Ukc24+5Vwq9SrkNQmYeoQNCZGhxOaockPdyWRSZcnL7MU412FAN4
         +YdDT5G1PIidMuodVaVD7WuhBtybRFenbQirdwHCroHWAIrUXuXhJtW6whQucya112Hy
         iRMrjkHqgiUMcUa8GeVvgP7MSZIes9SRL9mrfM9GlC9jh84/I9Sp6mOIFL+NkTgNUMF+
         IL9A==
X-Forwarded-Encrypted: i=1; AJvYcCWKbwqz2Gmu7fsublGtHDp9/kV8+daPi7o8ThzogirL2v3jFh4yW4HAjGmGLnixyFo2KhtoNwz5RmnHd+aj6dEzfTM0BCuum65L0nh1ZcXK
X-Gm-Message-State: AOJu0YwOQU43S+uuJj0xdLke5to/PSR0nE99RaY/JHPGRFBXMRYe/OOh
	nKSJfz9uaUL2FFPdRCZLlP9e/ynZZEVXS/NSh405BH2TxMRDn2ylpTuy+TJH2Ez13VLaE/d6tDl
	70vhWkO1+61D+o6mjFY+84B8KEE1yPqCN4Bxc8g==
X-Google-Smtp-Source: AGHT+IFlY+Fttl28efbIUi6jVfI4wTI04bDmnQk+zKphR7HN3pZ9C0TAL7sTYl5WjTiT2L3Bv4yly414b6+rK4o0b8A=
X-Received: by 2002:a92:c542:0:b0:36b:a3:bc93 with SMTP id a2-20020a92c542000000b0036b00a3bc93mr17521625ilj.5.1713333855283;
 Tue, 16 Apr 2024 23:04:15 -0700 (PDT)
MIME-Version: 1.0
References: <CAK9=C2Vsq0iN5FW=zC7+2GHe115TPJOEEPcDCLs_40yBGpbVdw@mail.gmail.com>
 <mhng-3a5fcdd0-0bf4-45d3-aa7d-fffddd852288@palmer-ri-x1c9a>
In-Reply-To: <mhng-3a5fcdd0-0bf4-45d3-aa7d-fffddd852288@palmer-ri-x1c9a>
From: Anup Patel <anup@brainfault.org>
Date: Wed, 17 Apr 2024 11:34:02 +0530
Message-ID: <CAAhSdy0YJ7STirgtZpdBGGBT6HB19CdN_Fe0ywhd8SSF2iXJqg@mail.gmail.com>
Subject: Re: [PATCH] clocksource/drivers/timer-riscv: Drop extra CSR write
To: Palmer Dabbelt <palmer@dabbelt.com>
Cc: apatel@ventanamicro.com, samuel.holland@sifive.com, 
	daniel.lezcano@linaro.org, tglx@linutronix.de, aou@eecs.berkeley.edu, 
	Paul Walmsley <paul.walmsley@sifive.com>, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240416_230418_379898_A6A2276B 
X-CRM114-Status: GOOD (  25.51  )
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

T24gV2VkLCBBcHIgMTcsIDIwMjQgYXQgNzoyMOKAr0FNIFBhbG1lciBEYWJiZWx0IDxwYWxtZXJA
ZGFiYmVsdC5jb20+IHdyb3RlOgo+Cj4gT24gV2VkLCAxMyBNYXIgMjAyNCAwOTo1NjozNCBQRFQg
KC0wNzAwKSwgYXBhdGVsQHZlbnRhbmFtaWNyby5jb20gd3JvdGU6Cj4gPiBPbiBXZWQsIE1hciAx
MywgMjAyNCBhdCAxOjAz4oCvQU0gU2FtdWVsIEhvbGxhbmQKPiA+IDxzYW11ZWwuaG9sbGFuZEBz
aWZpdmUuY29tPiB3cm90ZToKPiA+Pgo+ID4+IE9uIHJpc2N2MzIsIHRoZSB0aW1lIGNvbXBhcmF0
b3IgdmFsdWUgaXMgc3BsaXQgYWNyb3NzIHR3byBDU1JzLiBXZSB3cml0ZQo+ID4+IGJvdGggd2hl
biBzdG9wcGluZyB0aGUgdGltZXIsIGJ1dCByZWFsaXN0aWNhbGx5IHRoZSB0aW1lIGlzIGp1c3Qg
YXMKPiA+PiB1bmxpa2VseSB0byByZWFjaCAweGZmZmZmZmZmMDAwMDAwMDAgYXMgMHhmZmZmZmZm
ZmZmZmZmZmZmLCBzbyB0aGVyZSBpcwo+ID4+IG5vIG5lZWQgdG8gd3JpdGUgdGhlIGxvdyBDU1Iu
Cj4gPgo+ID4gRXZlbiB0aG91Z2ggdW5saWtlbHksIHRoZXJlIGlzIHN0aWxsIGEgdGhlb3JldGlj
YWwgcG9zc2liaWxpdHkgb2YKPiA+IGNvdW50ZXIgcmVhY2hpbmcgdmFsdWUgMHhmZmZmZmZmZjAw
MDAwMDAwLgo+Cj4gSSBndWVzcyB0aGF0IGRlcGVuZHMgb24gdGhlIHRpbWViYXNlIGZyZXF1ZW5j
eSwgYnV0IGlmIG15IG1hdGggaXMgcmlnaHQKPiB0aGVuIHdlJ3ZlIGdvdCBzb21lIHRpbWVycyB0
aGF0IHdpbGwgb3ZlcmZsb3cgYSAzMi1iaXQgY291bnRlciBpbiAxMAo+IG1pbnV0ZXMgLS0gdGFr
ZSB0aGF0IHdpdGggYSBncmFpbiBvZiBzYWx0IGFzIHRoZXkncmUgYWxsIDY0LWJpdCBzeXN0ZW1z
Cj4gKHdlIGRvbid0IGhhdmUgYW55IDMyLWJpdCBEVHMgdXBzdHJlYW0/KSwgYnV0IGl0IHN0aWxs
IHNlZW1zIHBsYXVzaWJsZQo+IGZvciAzMi1iaXQgb3ZlcmZsb3dzIHRvIGhhcHBlbiBoZXJlIG9u
IHJlYWwgc3lzdGVtcy4KPgo+ID4gVGhlIGdvb2QgdGhpbmcgYWJvdXQgdmFsdWUgMHhmZmZmZmZm
ZmZmZmZmZmZmIGlzIHRoYXQgdGhlIGNvdW50ZXIgd2lsbAo+ID4gaW1tZWRpYXRlbHkgd3JhcCBh
cm91bmQgYWZ0ZXIgcmVhY2hpbmcgaXQuCj4KPiBJJ20gbm90IHN1cmUgaG93IHRoYXQncyBnb29k
PyAgTHVja2lseSB3ZSd2ZSBnb3QgfjEwMCwwMDAgeWVhcnMgdG8KPiBmaWd1cmUgb3V0LCBldmVu
IG9uIHRoZXNlIHN5c3RlbXMgd2l0aCBwcmV0dHkgZmFzdCB0aW1lcnMgOykKClRoZSBSSVNDLVYg
c2VydmVyIHNvYyBzcGVjIG1hbmRhdGVzIHRpbWVyIGZyZXF1ZW5jeSB0byBiZSBhdCBsZWFzdAox
MDAgTUh6IHNvIHdlIGNhbiBjZXJ0YWlubHkgaGF2ZSAxMDBNSHogYXMgdGhlIHRpbWVyIGZyZXF1
ZW5jeQphbmQgYmFzZWQgb24gdGhpcyB0aW1lIENTUiB3aWxsIG92ZXJmbG93IGluIHJvdWdobHkg
NTg0MCB5ZWFycy4gQWxzbywKbm90aGluZyBzdG9wcyBhIFNvQyB2ZW5kb3IgZnJvbSBoYXZpbmcg
YSBHSHogdGltZXIgZnJlcXVlbmN5LgoKSW4gYWRkaXRpb24gdG8gdGltZXIgZnJlcXVlbmN5LCBj
aGFuZ2luZyB0aGUgaW5pdGlhbCB2YWx1ZSBvZiB0aW1lIENTUgpjYW4gYWxzbyBpbXBhY3Qgd2hl
biB0aGUgdGltZSBDU1Igb3ZlcmZsb3dzLiBUaGlzIHBhcnRpY3VsYXJseSBhcHBsaWVzCnRvIHZp
cnR1YWxpemF0aW9uIGJlY2F1c2UgS1ZNIFJJU0MtViBhbGxvd3MgdGhlIEtWTSB1c2VyIHNwYWNl
IHRvb2wKdG8gc2V0IHRoZSBkZXNpcmVkIGluaXRpYWwgdmFsdWUgb2YgdGltZSBDU1IgdmlzaWJs
ZSB0byB0aGUgR3Vlc3QvVk0uCgpGb3IgZXhhbXBsZSwgaWYgdGhlIHRpbWVyIGZyZXF1ZW5jeSBp
cyAxME1IeiBhbmQgS1ZNIHVzZXIgc3BhY2UKdG9vbCBzZXRzIGluaXRpYWwgdGltZSBDU1IgdmFs
dWUgdG8gMHhmZmZmZmZmZl8wMDAwMDAwMCB0aGVuIEd1ZXN0L1ZNCnRpbWUgQ1NSIHdpbGwgb3Zl
cmZsb3cgaW4gcm91Z2hseSA3IG1pbnMuCgpSZWdhcmRzLApBbnVwCgo+Cj4gPiBSZWdhcmRzLAo+
ID4gQW51cAo+ID4KPiA+Cj4gPj4KPiA+PiBTaWduZWQtb2ZmLWJ5OiBTYW11ZWwgSG9sbGFuZCA8
c2FtdWVsLmhvbGxhbmRAc2lmaXZlLmNvbT4KPiA+PiAtLS0KPiA+Pgo+ID4+ICBkcml2ZXJzL2Ns
b2Nrc291cmNlL3RpbWVyLXJpc2N2LmMgfCAzICsrLQo+ID4+ICAxIGZpbGUgY2hhbmdlZCwgMiBp
bnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCj4gPj4KPiA+PiBkaWZmIC0tZ2l0IGEvZHJpdmVy
cy9jbG9ja3NvdXJjZS90aW1lci1yaXNjdi5jIGIvZHJpdmVycy9jbG9ja3NvdXJjZS90aW1lci1y
aXNjdi5jCj4gPj4gaW5kZXggZTY2ZGNiZDY2NTY2Li5lYWFmMDFmM2MzNGIgMTAwNjQ0Cj4gPj4g
LS0tIGEvZHJpdmVycy9jbG9ja3NvdXJjZS90aW1lci1yaXNjdi5jCj4gPj4gKysrIGIvZHJpdmVy
cy9jbG9ja3NvdXJjZS90aW1lci1yaXNjdi5jCj4gPj4gQEAgLTM1LDkgKzM1LDEwIEBAIHN0YXRp
YyBib29sIHJpc2N2X3RpbWVyX2Nhbm5vdF93YWtlX2NwdTsKPiA+PiAgc3RhdGljIHZvaWQgcmlz
Y3ZfY2xvY2tfZXZlbnRfc3RvcCh2b2lkKQo+ID4+ICB7Cj4gPj4gICAgICAgICBpZiAoc3RhdGlj
X2JyYW5jaF9saWtlbHkoJnJpc2N2X3NzdGNfYXZhaWxhYmxlKSkgewo+ID4+IC0gICAgICAgICAg
ICAgICBjc3Jfd3JpdGUoQ1NSX1NUSU1FQ01QLCBVTE9OR19NQVgpOwo+ID4+ICAgICAgICAgICAg
ICAgICBpZiAoSVNfRU5BQkxFRChDT05GSUdfMzJCSVQpKQo+ID4+ICAgICAgICAgICAgICAgICAg
ICAgICAgIGNzcl93cml0ZShDU1JfU1RJTUVDTVBILCBVTE9OR19NQVgpOwo+ID4+ICsgICAgICAg
ICAgICAgICBlbHNlCj4gPj4gKyAgICAgICAgICAgICAgICAgICAgICAgY3NyX3dyaXRlKENTUl9T
VElNRUNNUCwgVUxPTkdfTUFYKTsKPiA+PiAgICAgICAgIH0gZWxzZSB7Cj4gPj4gICAgICAgICAg
ICAgICAgIHNiaV9zZXRfdGltZXIoVTY0X01BWCk7Cj4gPj4gICAgICAgICB9Cj4gPj4gLS0KPiA+
PiAyLjQzLjEKPiA+Pgo+ID4+Cj4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5p
bmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8v
bGludXgtcmlzY3YK
