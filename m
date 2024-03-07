Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC515C5475B
	for <linux-riscv@archiver.kernel.org>; Thu,  7 Mar 2024 03:19:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nOzFAaO8H2BICRkUwaFJsv1TLxg7zT3677IWaPDvh/o=; b=15vawlAadpaBww
	KtexgjWL3neRgSPICbu2tfkZICDl+5p157+xYCWkIevKOdU71hFCYMMD0jvMh+bFg83aU7ZCEef+i
	I9EsrNyqAXKzy8kQd9xZmAilQ/5TAHjCpZlV2AP3VtZC4WHYHvJ8iXktsiTlr6NZ+ICrEqsy9SEdN
	g8YkP2G+LJFSQDOw4Bf7hADv6sMalXAngcpbrG1Ykgn+RBBvDzXak4sTEGaoxBFjJAqll9rlHS5WC
	cALQ0f/zV2FWjoPnU9/7qzGYVvBfJ5IXFXdOSwBqaFgZJ5/lp8L9kfCproOhpjUEOOCtuyaRT7ITM
	5y+exCv7BZIMGhGL5nCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ri4IJ-00000002oWi-3Kw5;
	Thu, 07 Mar 2024 03:19:43 +0000
Received: from mail-oa1-x2e.google.com ([2001:4860:4864:20::2e])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ri4IF-00000002oU9-0sXB
	for linux-riscv@lists.infradead.org;
	Thu, 07 Mar 2024 03:19:41 +0000
Received: by mail-oa1-x2e.google.com with SMTP id 586e51a60fabf-21fa872dce3so204861fac.2
        for <linux-riscv@lists.infradead.org>; Wed, 06 Mar 2024 19:19:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1709781577; x=1710386377; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XJGvA1f7vKRh3tCkcbglNtzIq8rFLROAN/5bMKhQkTg=;
        b=cVaq6z7Q+pL/PDqAwT1voPxknE9+YYr23UlQ34IOGEoQPMuXIsrvK/h1z+jPqCRldr
         NDK/0QLJbpBmKIuWj4KxsMOojALAR85zz6hBoyn0OHGHfRhsqhxjdGcRwWZA9h9zxETU
         o54IRSCW+a5efrKmP+ybCcgH6SxvmidIkwTpGBhKuGNol3vINRkLYDLm+vvK3ZevSjAi
         QUI+oCiaeFQaEd4CL+NIYzyG289+dchgN1+DHpvhMjvdVGEF0iPqrpqsaZqQevumNVWl
         IrEwFG8+CcYtSsoIKow+7SETb7ttirBZ/y+M4XXzHk2hpi+Y1NxlaYgMWyJmH2CH/Gxy
         3/vQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709781577; x=1710386377;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XJGvA1f7vKRh3tCkcbglNtzIq8rFLROAN/5bMKhQkTg=;
        b=P7kTxmAtTyaplAlgswcApA+sXDexcZ7mQ7WGTAKyF4lsD6+AGXTkkH/crv64KjyhR3
         MEviOfxJoC/Ho3nBHlN24a3Mjr0YYrIPPgbcQE0eiZT9uTy+pIOeFWxyFVQy+OuhS7rm
         u/rgxL4yyGrbffx2MiRtgG65g9gholgjKkK7H66QOqEouekiFkKEYjQZSXqH8WboQGJy
         BdoixqLfbDyPe9SxwZgk1g5sRz5DzzC2rpVRfaPOcf2+GMvunS/GZolf/4H8aZrs23eA
         YyYfWigb5zz9Rn8WZloHnNEkzZ72sHCFubDMBV6C/LhbjX+6u32zK3AufRrQmPLRs0dN
         uEHQ==
X-Forwarded-Encrypted: i=1; AJvYcCWM52FYzrSiBy204AiAEs7S59gETOHH1UbykesjRjIf/2fB4vXYX1t2I5Ahyzr8JWh8dn3duPKU7rqhNq1WohvHEwdcio5kA8pDM9FT1gwf
X-Gm-Message-State: AOJu0YxrDcz4VN1rVn7Br7ZNI0WQL2iI7lZkJaEFe8/d4cpcwnVzd8B0
	ia44YwiKyYa4EtSIDoGbd6UlaF/61Rskiebn7F7LRgTaK9oeUhE7HaBfSQ0sUlMG2p4LCxv0K2x
	Y33PNfiXcnbQwEJDNfDAS3HLWMAQF7xAhiQpFAg==
X-Google-Smtp-Source: AGHT+IFY13j0u68bFIORwkMkdH6ODO/zQ9SH+109GglozC611Ks1AmA61dWksvu8K9ufjtIT4F4LCd6h7ApZ15aRObk=
X-Received: by 2002:a05:6870:4181:b0:220:8c16:fe1b with SMTP id
 y1-20020a056870418100b002208c16fe1bmr7006609oac.40.1709781577510; Wed, 06 Mar
 2024 19:19:37 -0800 (PST)
MIME-Version: 1.0
References: <CAMj1kXH1oMbONoHFMPaatfaqrHNE2ryfrG7kw-7J-eFsuXkK-Q@mail.gmail.com>
 <mhng-c53211c1-4708-459a-bdc5-6e013c2adaee@palmer-ri-x1c9>
 <CAMj1kXEFqMx8qUHQEbg=OqbG-H0Zpj-nWu=a6qhhvNEZPO7f4Q@mail.gmail.com> <CAMj1kXG4SXsBfNqWMRUJ+AVv=6trWUAow-f8Mk5oKCpO=WueFg@mail.gmail.com>
In-Reply-To: <CAMj1kXG4SXsBfNqWMRUJ+AVv=6trWUAow-f8Mk5oKCpO=WueFg@mail.gmail.com>
From: yunhui cui <cuiyunhui@bytedance.com>
Date: Thu, 7 Mar 2024 11:19:26 +0800
Message-ID: <CAEEQ3wkN3HDUuPDfWTn4kTxKH03OaRxBTFru3jJzZgW+BVhABg@mail.gmail.com>
Subject: Re: [External] Re: [PATCH 3/3] efistub: fix missed the initialization
 of gp
To: Ard Biesheuvel <ardb@kernel.org>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu, 
	xuzhipeng.1973@bytedance.com, alexghiti@rivosinc.com, samitolvanen@google.com, 
	bp@alien8.de, xiao.w.wang@intel.com, jan.kiszka@siemens.com, 
	kirill.shutemov@linux.intel.com, nathan@kernel.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-efi@vger.kernel.org, Conor Dooley <conor@kernel.org>, 
	Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240306_191939_620205_C6DC7810 
X-CRM114-Status: GOOD (  47.51  )
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

SGkgQXJkLAoKT24gVGh1LCBNYXIgNywgMjAyNCBhdCAxMjoxNeKAr0FNIEFyZCBCaWVzaGV1dmVs
IDxhcmRiQGtlcm5lbC5vcmc+IHdyb3RlOgo+Cj4gT24gV2VkLCA2IE1hciAyMDI0IGF0IDE2OjQ0
LCBBcmQgQmllc2hldXZlbCA8YXJkYkBrZXJuZWwub3JnPiB3cm90ZToKPiA+Cj4gPiBPbiBXZWQs
IDYgTWFyIDIwMjQgYXQgMTY6MjEsIFBhbG1lciBEYWJiZWx0IDxwYWxtZXJAZGFiYmVsdC5jb20+
IHdyb3RlOgo+ID4gPgo+ID4gPiBPbiBXZWQsIDA2IE1hciAyMDI0IDA1OjA5OjA3IFBTVCAoLTA4
MDApLCBBcmQgQmllc2hldXZlbCB3cm90ZToKPiA+ID4gPiBPbiBXZWQsIDYgTWFyIDIwMjQgYXQg
MTQ6MDIsIEFyZCBCaWVzaGV1dmVsIDxhcmRiQGtlcm5lbC5vcmc+IHdyb3RlOgo+ID4gPiA+Pgo+
ID4gPiA+PiBPbiBXZWQsIDYgTWFyIDIwMjQgYXQgMTM6MzQsIHl1bmh1aSBjdWkgPGN1aXl1bmh1
aUBieXRlZGFuY2UuY29tPiB3cm90ZToKPiA+ID4gPj4gPgo+ID4gPiA+PiA+IEhpIEFyZCwKPiA+
ID4gPj4gPgo+ID4gPiA+PiA+IE9uIFdlZCwgTWFyIDYsIDIwMjQgYXQgNTozNuKAr1BNIEFyZCBC
aWVzaGV1dmVsIDxhcmRiQGtlcm5lbC5vcmc+IHdyb3RlOgo+ID4gPiA+PiA+ID4KPiA+ID4gPj4g
PiA+IE9uIFdlZCwgNiBNYXIgMjAyNCBhdCAwOTo1NiwgWXVuaHVpIEN1aSA8Y3VpeXVuaHVpQGJ5
dGVkYW5jZS5jb20+IHdyb3RlOgo+ID4gPiA+PiA+ID4gPgo+ID4gPiA+PiA+ID4gPiBDb21wYXJl
ZCB3aXRoIGdjYyB2ZXJzaW9uIDEyLCBnY2MgdmVyc2lvbiAxMyB1c2VzIHRoZSBncAo+ID4gPiA+
PiA+ID4gPiByZWdpc3RlciBmb3IgY29tcGlsYXRpb24gb3B0aW1pemF0aW9uLCBidXQgdGhlIGVm
aXN0dWIgbW9kdWxlCj4gPiA+ID4+ID4gPiA+IGRvZXMgbm90IGluaXRpYWxpemUgZ3AuCj4gPiA+
ID4+ID4gPiA+Cj4gPiA+ID4+ID4gPiA+IFNpZ25lZC1vZmYtYnk6IFl1bmh1aSBDdWkgPGN1aXl1
bmh1aUBieXRlZGFuY2UuY29tPgo+ID4gPiA+PiA+ID4gPiBDby1EZXZlbG9wZWQtYnk6IFpoaXBl
bmcgWHUgPHh1emhpcGVuZy4xOTczQGJ5dGVkYW5jZS5jb20+Cj4gPiA+ID4+ID4gPgo+ID4gPiA+
PiA+ID4gVGhpcyBuZWVkcyBhIHNpZ24tb2ZmLCBhbmQgeW91ciBzaWdub2ZmIG5lZWRzIHRvIGNv
bWUgYWZ0ZXIuCj4gPiA+ID4+ID4gPgo+ID4gPiA+PiA+ID4gPiAtLS0KPiA+ID4gPj4gPiA+ID4g
IGFyY2gvcmlzY3Yva2VybmVsL2VmaS1oZWFkZXIuUyB8IDExICsrKysrKysrKystCj4gPiA+ID4+
ID4gPiA+ICAxIGZpbGUgY2hhbmdlZCwgMTAgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQo+
ID4gPiA+PiA+ID4gPgo+ID4gPiA+PiA+ID4gPiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9rZXJu
ZWwvZWZpLWhlYWRlci5TIGIvYXJjaC9yaXNjdi9rZXJuZWwvZWZpLWhlYWRlci5TCj4gPiA+ID4+
ID4gPiA+IGluZGV4IDUxNWIyZGZiY2E3NS4uZmExN2MwOGMwOTJhIDEwMDY0NAo+ID4gPiA+PiA+
ID4gPiAtLS0gYS9hcmNoL3Jpc2N2L2tlcm5lbC9lZmktaGVhZGVyLlMKPiA+ID4gPj4gPiA+ID4g
KysrIGIvYXJjaC9yaXNjdi9rZXJuZWwvZWZpLWhlYWRlci5TCj4gPiA+ID4+ID4gPiA+IEBAIC00
MCw3ICs0MCw3IEBAIG9wdGlvbmFsX2hlYWRlcjoKPiA+ID4gPj4gPiA+ID4gICAgICAgICAubG9u
ZyAgIF9fcGVjb2ZmX2RhdGFfdmlydF9lbmQgLSBfX3BlY29mZl90ZXh0X2VuZCAgICAgIC8vIFNp
emVPZkluaXRpYWxpemVkRGF0YQo+ID4gPiA+PiA+ID4gPiAgI2VuZGlmCj4gPiA+ID4+ID4gPiA+
ICAgICAgICAgLmxvbmcgICAwICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
Ly8gU2l6ZU9mVW5pbml0aWFsaXplZERhdGEKPiA+ID4gPj4gPiA+ID4gLSAgICAgICAubG9uZyAg
IF9fZWZpc3R1Yl9lZmlfcGVfZW50cnkgLSBfc3RhcnQgICAgICAgICAvLyBBZGRyZXNzT2ZFbnRy
eVBvaW50Cj4gPiA+ID4+ID4gPiA+ICsgICAgICAgLmxvbmcgICBfZWZpc3R1Yl9lbnRyeSAtIF9z
dGFydCAgICAgICAgIC8vIEFkZHJlc3NPZkVudHJ5UG9pbnQKPiA+ID4gPj4gPiA+ID4gICAgICAg
ICAubG9uZyAgIGVmaV9oZWFkZXJfZW5kIC0gX3N0YXJ0ICAgICAgICAgICAgICAgICAvLyBCYXNl
T2ZDb2RlCj4gPiA+ID4+ID4gPiA+ICAjaWZkZWYgQ09ORklHXzMyQklUCj4gPiA+ID4+ID4gPiA+
ICAgICAgICAgLmxvbmcgIF9fcGVjb2ZmX3RleHRfZW5kIC0gX3N0YXJ0ICAgICAgICAgICAgICAg
Ly8gQmFzZU9mRGF0YQo+ID4gPiA+PiA+ID4gPiBAQCAtMTIxLDQgKzEyMSwxMyBAQCBzZWN0aW9u
X3RhYmxlOgo+ID4gPiA+PiA+ID4gPgo+ID4gPiA+PiA+ID4gPiAgICAgICAgIC5iYWxpZ24gMHgx
MDAwCj4gPiA+ID4+ID4gPiA+ICBlZmlfaGVhZGVyX2VuZDoKPiA+ID4gPj4gPiA+ID4gKwo+ID4g
PiA+PiA+ID4gPiArICAgICAgIC5nbG9iYWwgX2VmaXN0dWJfZW50cnkKPiA+ID4gPj4gPiA+ID4g
K19lZmlzdHViX2VudHJ5Ogo+ID4gPiA+PiA+ID4KPiA+ID4gPj4gPiA+IFRoaXMgc2hvdWxkIGdv
IGludG8gLnRleHQgb3IgLmluaXQudGV4dCwgbm90IHRoZSBoZWFkZXIuCj4gPiA+ID4+ID4gPgo+
ID4gPiA+PiA+ID4gPiArICAgICAgIC8qIFJlbG9hZCB0aGUgZ2xvYmFsIHBvaW50ZXIgKi8KPiA+
ID4gPj4gPiA+ID4gKyAgICAgICBsb2FkX2dsb2JhbF9wb2ludGVyCj4gPiA+ID4+ID4gPiA+ICsK
PiA+ID4gPj4gPiA+Cj4gPiA+ID4+ID4gPiBXaGF0IGlzIHN1cHBvc2VkIHRvIGhhcHBlbiBoZXJl
IGlmIENPTkZJR19TSEFET1dfQ0FMTF9TVEFDSz15PyBUaGUgRUZJCj4gPiA+ID4+ID4gPiBzdHVi
IE1ha2VmaWxlIHJlbW92ZXMgdGhlIFNDUyBDRkxBR1MsIHNvIHRoZSBzdHViIHdpbGwgYmUgYnVp
bHQKPiA+ID4gPj4gPiA+IHdpdGhvdXQgc2hhZG93IGNhbGwgc3RhY2sgc3VwcG9ydCwgd2hpY2gg
SSBndWVzcyBtZWFucyB0aGF0IGl0IG1pZ2h0Cj4gPiA+ID4+ID4gPiB1c2UgR1AgYXMgYSBnbG9i
YWwgcG9pbnRlciBhcyB1c3VhbD8KPiA+ID4gPj4gPiA+Cj4gPiA+ID4+ID4gPiA+ICsgICAgICAg
Y2FsbCBfX2VmaXN0dWJfZWZpX3BlX2VudHJ5Cj4gPiA+ID4+ID4gPiA+ICsgICAgICAgcmV0Cj4g
PiA+ID4+ID4gPiA+ICsKPiA+ID4gPj4gPiA+Cj4gPiA+ID4+ID4gPiBZb3UgYXJlIHJldHVybmlu
ZyB0byB0aGUgZmlybXdhcmUgaGVyZSwgYnV0IGFmdGVyIG1vZGlmeWluZyB0aGUgR1AKPiA+ID4g
Pj4gPiA+IHJlZ2lzdGVyLiBTaG91bGRuJ3QgeW91IHJlc3RvcmUgaXQgdG8gaXRzIG9sZCB2YWx1
ZT8KPiA+ID4gPj4gPiBUaGVyZSBpcyBubyBuZWVkIHRvIHJlc3RvcmUgdGhlIHZhbHVlIG9mIHRo
ZSBncCByZWdpc3Rlci4gV2hlcmUgZ3AgaXMKPiA+ID4gPj4gPiBuZWVkZWQsIHRoZSBncCByZWdp
c3RlciBtdXN0IGZpcnN0IGJlIGluaXRpYWxpemVkLiBBbmQgaGVyZSBpcyB0aGUKPiA+ID4gPj4g
PiBlbnRyeS4KPiA+ID4gPj4gPgo+ID4gPiA+Pgo+ID4gPiA+PiBCdXQgaG93IHNob3VsZCB0aGUg
ZmlybXdhcmUga25vdyB0aGF0IEdQIHdhcyBjb3JydXB0ZWQgYWZ0ZXIgY2FsbGluZwo+ID4gPiA+
PiB0aGUga2VybmVsJ3MgRUZJIGVudHJ5cG9pbnQ/IFRoZSBFRkkgc3R1YiBjYW4gcmV0dXJuIHRv
IHRoZSBmaXJtd2FyZQo+ID4gPiA+PiBpZiBpdCBlbmNvdW50ZXJzIGFueSBlcnJvcnMgd2hpbGUg
c3RpbGwgcnVubmluZyBpbiB0aGUgRUZJIGJvb3QKPiA+ID4gPj4gc2VydmljZXMuCj4gPiA+ID4+
Cj4gPiA+ID4KPiA+ID4gPiBBY3R1YWxseSwgSSB3b25kZXIgaWYgR1AgY2FuIGJlIG1vZGlmaWVk
IGF0IGFsbCBiZWZvcmUKPiA+ID4gPiBFeGl0Qm9vdFNlcnZpY2VzKCkuIFRoZSBFRkkgdGltZXIg
aW50ZXJydXB0IGlzIHN0aWxsIGxpdmUgYXQgdGhpcwo+ID4gPiA+IHBvaW50LCBhbmQgc28gdGhl
IGZpcm13YXJlIGlzIGJlaW5nIGNhbGxlZCBiZWhpbmQgeW91ciBiYWNrLCBhbmQgbWlnaHQKPiA+
ID4gPiByZWx5IG9uIEdQIHJldGFpbmluZyBpdHMgb3JpZ2luYWwgdmFsdWUuCj4gPiA+Cj4gPiA+
IFtBIGZldyBvZiB1cyBhcmUgdGFsa2luZyBvbiBJUkMgYXMgSSdtIHdyaXRpbmcgdGhpcy4uLl0K
PiA+ID4KPiA+ID4gVGhlIFVFRkkgc3BlYyBzYXlzICJVRUZJIGZpcm13YXJlIG11c3QgbmVpdGhl
ciB0cnVzdCB0aGUKPiA+ID4gdmFsdWVzIG9mIHRwIGFuZCBncCBub3IgbWFrZSBhbiBhc3N1bXB0
aW9uIG9mIG93bmluZyB0aGUgd3JpdGUgYWNjZXNzIHRvCj4gPiA+IHRoZXNlIHJlZ2lzdGVyIGlu
IGFueSBjaXJjdW1zdGFuY2VzIi4gIEl0J3Mga2luZCBvZiB2YWd1ZSB3aGF0ICJVRUZJCj4gPiA+
IGZpcm13YXJlIiBtZWFucyBoZXJlLCBidXQgSSB0aGluayBpdCdzIHJlYXNvbmFibGUgdG8gYXNz
dW1lIHRoYXQgdGhlCj4gPiA+IGtlcm5lbCAoYW5kIHRodXMgdGhlIEVGSSBzdHViKSBpcyBub3Qg
aW5jbHVkZWQgdGhlcmUuCj4gPiA+Cj4gPiA+IFNvIHVuZGVyIHRoYXQgaW50ZXJwcmV0YXRpb24s
IHRoZSBrZXJuZWwgKGluY2x1ZGluZyB0aGUgRUZJIHN0dWIpIHdvdWxkCj4gPiA+IGJlIGFsbG93
ZWQgdG8gb3ZlcndyaXRlIEdQIHdpdGggd2hhdGV2ZXIgaXQgd2FudHMuCj4gPiA+Cj4gPgo+ID4g
T0ssIHNvIGV2ZW4gaWYgdGhlIFVFRkkgc3BlYyBzZWVtcyB0byBzdWdnZXN0IHRoYXQgdXNpbmcg
R1AgaW4gRUZJCj4gPiBhcHBsaWNhdGlvbnMgc3VjaCBhcyB0aGUgTGludXggRUZJIHN0dWIgc2hv
dWxkIGJlIHNhZmUsIEknZCBzdGlsbCBsaWtlCj4gPiB0byB1bmRlcnN0YW5kIHdoeSB0aGlzIGNo
YW5nZSBpcyBuZWNlc3NhcnkuIFRoZSBwYXRjaGVzIHlvdSBhcmUKPiA+IHJldmVydGluZyBhcmUg
c3VwcG9zZWQgdG8gZW5zdXJlIHRoYXQgYSkgdGhlIGNvbXBpbGVyIGRvZXMgbm90Cj4gPiBnZW5l
cmF0ZSByZWZlcmVuY2VzIHRoYXQgY2FuIGJlIHJlbGF4ZWQgdG8gR1AgYmFzZWQgb25lcywgYW5k
IGIpIG5vCj4gPiBSX1JJU0NWX1JFTEFYIHJlbG9jYXRpb25zIGFyZSBwcmVzZW50IGluIGFueSBv
ZiB0aGUgY29kZSB0aGF0IHJ1bnMgaW4KPiA+IHRoZSBjb250ZXh0IG9mIHRoZSBFRkkgZmlybXdh
cmUuCj4gPgo+ID4gQXJlIHlvdSBzdGlsbCBzZWVpbmcgR1AgYmFzZWQgc3ltYm9sIHJlZmVyZW5j
ZXM/IElzIHRoZXJlIEMgY29kZSB0aGF0Cj4gPiBnZXRzIHB1bGxlZCBpbnRvIHRoZSBFRkkgc3R1
YiB0aGF0IHVzZXMgR1AgYmFzZWQgcmVsb2NhdGlvbnMgcGVyaGFwcz8KPiA+IChzZWUgbGlzdCBi
ZWxvdykuIElmIGFueSBvZiB0aG9zZSBhcmUgaW1wbGVtZW50ZWQgaW4gQywgdGhleSBzaG91bGQK
PiA+IG5vdCBiZSB1c2VkIGJ5IHRoZSBFRkkgc3R1YiBkaXJlY3RseSB1bmxlc3MgdGhleSBhcmUg
Z3VhcmFudGVlZCB0byBiZQo+ID4gdW5pbnN0cnVtZW50ZWQgYW5kIGNhbGxhYmxlIGF0IGFyYml0
cmFyeSBvZmZzZXRzIG90aGVyIHRoYW4gdGhlIG9uZQo+ID4gdGhleSB3ZXJlIGxpbmtlZCB0byBy
dW4gYXQuCj4gPgo+ID4KPiA+IF9fZWZpc3R1Yl9tZW1jbXAgICAgICAgICA9IG1lbWNtcDsKPiA+
IF9fZWZpc3R1Yl9tZW1jaHIgICAgICAgICA9IG1lbWNocjsKPiA+IF9fZWZpc3R1Yl9tZW1jcHkg
ICAgICAgICA9IG1lbWNweTsKPiA+IF9fZWZpc3R1Yl9tZW1tb3ZlICAgICAgICA9IG1lbW1vdmU7
Cj4gPiBfX2VmaXN0dWJfbWVtc2V0ICAgICAgICAgPSBtZW1zZXQ7Cj4gPiBfX2VmaXN0dWJfc3Ry
bGVuICAgICAgICAgPSBzdHJsZW47Cj4gPiBfX2VmaXN0dWJfc3RybmxlbiAgICAgICAgPSBzdHJu
bGVuOwo+ID4gX19lZmlzdHViX3N0cmNtcCAgICAgICAgID0gc3RyY21wOwo+ID4gX19lZmlzdHVi
X3N0cm5jbXAgICAgICAgID0gc3RybmNtcDsKPiA+IF9fZWZpc3R1Yl9zdHJyY2hyICAgICAgICA9
IHN0cnJjaHI7Cj4gPiBfX2VmaXN0dWJfX19tZW1jcHkgICAgICAgPSBtZW1jcHk7Cj4gPiBfX2Vm
aXN0dWJfX19tZW1tb3ZlICAgICAgPSBtZW1tb3ZlOwo+ID4gX19lZmlzdHViX19fbWVtc2V0ICAg
ICAgID0gbWVtc2V0Owo+ID4gX19lZmlzdHViX19zdGFydCAgICAgICAgID0gX3N0YXJ0Owo+ID4g
X19lZmlzdHViX19zdGFydF9rZXJuZWwgID0gX3N0YXJ0X2tlcm5lbDsKPiA+Cj4gPiAoZnJvbSBh
cmNoL3Jpc2N2L2tlcm5lbC9pbWFnZS12YXJzLmgpCj4KPiBVaG0gbmV2ZXIgbWluZCAtIHRoZXNl
IGFyZSBhbGwgZ29uZSBub3csIEkgd2FzIGxvb2tpbmcgYXQgYSB2Ni4xCj4ga2VybmVsIHNvdXJj
ZSB0cmVlLgo+Cj4gU28gdGhhdCBtZWFucyB0aGF0LCBhcyBmYXIgYXMgSSBjYW4gdGVsbCwgdGhl
IG9ubHkga2VybmVsIEMgY29kZSB0aGF0Cj4gZXhlY3V0ZXMgaW4gdGhlIGNvbnRleHQgb2YgdGhl
IEVGSSBmaXJtd2FyZSBpcyBidWlsdCB3aXRoIC1tbm8tcmVsYXgKPiBhbmQgaXMgY2hlY2tlZCBm
b3IgdGhlIGFic2VuY2Ugb2YgUl9SSVNDVl9SRUxBWCByZWxvY2F0aW9ucy4gU28gSSBmYWlsCj4g
dG8gc2VlIHdoeSB0aGVzZSBjaGFuZ2VzIGFyZSBuZWVkZWQuCj4KPiBZdW5odWksIGNvdWxkIHlv
dSBwbGVhc2UgZXhwbGFpbiB0aGUgcmVhc29uIGZvciB0aGlzIHNlcmllcz8KCkZyb20gdGhlIGxv
Z2ljIG9mIGJpbnV0aWxzLCBpZiAiX19nbG9iYWxfcG9pbnRlciQiIGV4aXN0cywgaXQgaXMKcG9z
c2libGUgdG8gdXNlIEdQIGZvciBvcHRpbWl6YXRpb24uIEZvciBSSVNDLVYsICJfX2dsb2JhbF9w
b2ludGVyJCIKd2FzIGludHJvZHVjZWQgaW4gY29tbWl0ICJmYmU5MzRkNjllYjdlIi4gVGhlcmVm
b3JlLCBmb3IgdGhlIHN5c3RlbSBhcwphIHdob2xlLCB3ZSBzaG91bGQga2VlcCB1c2luZyBHUCB1
bmlmb3JtbHkuIFRoZSByb290IGNhdXNlIG9mIHRoaXMKcHJvYmxlbSBpcyB0aGF0IEdQIGlzIG5v
dCBsb2FkZWQsIHJhdGhlciB0aGFuICJPbiBSSVNDLVYsIHdlIGFsc28KYXZvaWQgR1AgYmFzZWQg
cmVsb2NhdGlvbnMuLi4iIGFzIGNvbW1pdCAiZDJiYWY4Y2M4MmMxNyIgc2FpZC4gV2UgbmVlZAp0
byBhZGRyZXNzIHByb2JsZW1zIGhlYWQtb24sIHJhdGhlciB0aGFuIGF2b2lkIHRoZW0uCgpUaGFu
a3MsCll1bmh1aQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5v
cmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNj
dgo=
