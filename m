Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A803C47258
	for <linux-riscv@archiver.kernel.org>; Sat, 20 Jan 2024 04:13:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=M9q17UQTst8qLK78o55GtJ00qpxMGApg3Oi2TVjduz4=; b=F4IG15QZXe8+A28PWwx9KYAFAn
	hsyuu+OJiAAz69Exg2Crza9L+HphwPTG4dpj/QXKAn/koiGLBL0V0xK9QHzfffDk4UB19DeTH4hQD
	tLIfZNIsIers9eVYFNmeFDC2FJhMkgbpJfui6DontPVxvqY+qv3RrHK+oGmnzSi1N77RZ2uug+mVC
	9HsDZG1hphVqBmC/3Q43tAA4k8lSB2Tm4gnOw0QVtBHRVj8RA4qXIxfQ2qITyejs6OZxoPkvcNaXO
	yM2uU4Rpke4xfpzFwMxoMKdJL6uWCJnky2iPHcHpH5pRidX3k9N5cm8T/fUJIjNwWdV5SwVinQOgw
	cQElauMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rR2jd-007B45-2s;
	Sat, 20 Jan 2024 04:13:33 +0000
Received: from mail-il1-x136.google.com ([2607:f8b0:4864:20::136])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rR2ja-007B3X-0O
	for linux-riscv@lists.infradead.org;
	Sat, 20 Jan 2024 04:13:32 +0000
Received: by mail-il1-x136.google.com with SMTP id e9e14a558f8ab-3606ef221dbso6446145ab.2
        for <linux-riscv@lists.infradead.org>; Fri, 19 Jan 2024 20:13:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1705724006; x=1706328806; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xEQfFjGG9xeqy4UfcMEbmKUfJ92yD+DVChzT3CuoIZ8=;
        b=EMDT0YKREebo4InXz+c+MBdecXs5b28Y0pvGRtIu/HlQ9Rb3gHTDtSqofhylHjgNkE
         UPJ1AkOq+fComTK6mh7Rm6BzYVAjBXEWB2SKY2tboqySPfeGT2SQYLvns0QfN6wQVueZ
         r8S/rQKxvh2uviYW+TLahzductO+LwqIJfSjlL0OyLRq4w8P66mjQFLb8QjA2eu6Bb6x
         99nFBDCdjSZEzDqZJfTYCYh3CkMRIQB7O+t9NxQyyrrBZ6rEkc3A+PzF7e02SfV8u9zM
         UH072yQzphfN7I3b4P4lHniXL25SphDGequrGMkiJ8y2r+ZzpaPJi5khiVYph2OMyW4a
         47JQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705724006; x=1706328806;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xEQfFjGG9xeqy4UfcMEbmKUfJ92yD+DVChzT3CuoIZ8=;
        b=XLhCazOvYuSuk5UGdNJhnMIKDFAnyJHbfcHudvXpeYt3UnFlolIYZe5kjrHtSa5aIV
         Nm779ZnBGpX6OkDa3lHauy77BPLYUZtrye7Rk0of9xIKaxjrZwSHEzrmtxxHirXzfStg
         6sB+gq3BMa3WbtJnotPopz/S3ByqVAU9laN4hRdqcNb3KZ/+hXvaoJC9N2fumUho3e5P
         B0hK8XCs3BwHurekariPPQH163jwIYIUFmBP0xdt/KmfnHOj65mQSnHNK1ozUr9fCOqy
         YMf5jDB26CGju90Kj6rdzP+BR/uvNpv3U9aZath3CJK1yCteJ7uOL4Q/EfY1lmj18tIo
         4xzw==
X-Gm-Message-State: AOJu0Yw1X/o7n2OL9qVEdoY9zZTVQjpTXt2sJ6UZGlCpXFNMBJFTpCDD
	E7o4WwcRHiqM+gb6y5VSxVhussVH4aPWEyYpqq8QV1AYs7/RHydKFTE1H0pFrzPlGNRgEetlKHW
	i
X-Google-Smtp-Source: AGHT+IHn/lDsj6RpPJ5iOJ3naXMlOTNeOjJPdGGzDt9qU3TE5KrD+gOz+Skv2dSn1c3/Yo+fhVy9cA==
X-Received: by 2002:a92:c70f:0:b0:361:ab5c:210d with SMTP id a15-20020a92c70f000000b00361ab5c210dmr1150792ilp.32.1705724006287;
        Fri, 19 Jan 2024 20:13:26 -0800 (PST)
Received: from localhost ([192.184.165.199])
        by smtp.gmail.com with ESMTPSA id kx6-20020a170902f94600b001d5f59fe6aasm3743602plb.37.2024.01.19.20.13.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Jan 2024 20:13:25 -0800 (PST)
Date: Fri, 19 Jan 2024 20:13:25 -0800 (PST)
X-Google-Original-Date: Fri, 19 Jan 2024 20:13:22 PST (-0800)
Subject: Re: [PATCH v2] tty: hvc: Fix the RISC-V SBI driver for a refactoring
In-Reply-To: <CAAhSdy0naZf8aKkAH6MgYyLior3rZEjx0WWWgp4Ljakrb5q5XQ@mail.gmail.com>
CC: linux-riscv@lists.infradead.org, Greg KH <gregkh@linuxfoundation.org>,
  jirislaby@kernel.org, Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu,
  ajones@ventanamicro.com, apatel@ventanamicro.com, Atish Patra <atishp@rivosinc.com>,
  linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org
From: Palmer Dabbelt <palmer@rivosinc.com>
To: anup@brainfault.org
Message-ID: <mhng-c6ffd557-de85-4e89-b8aa-c4ac80951e81@palmer-ri-x1c9>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240119_201330_370321_4B7DC75B 
X-CRM114-Status: GOOD (  21.91  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gRnJpLCAxOSBKYW4gMjAyNCAxOTo1OToxMSBQU1QgKC0wODAwKSwgYW51cEBicmFpbmZhdWx0
Lm9yZyB3cm90ZToKPiBPbiBTYXQsIEphbiAyMCwgMjAyNCBhdCA0OjE14oCvQU0gUGFsbWVyIERh
YmJlbHQgPHBhbG1lckByaXZvc2luYy5jb20+IHdyb3RlOgo+Pgo+PiBGcm9tOiBQYWxtZXIgRGFi
YmVsdCA8cGFsbWVyQHJpdm9zaW5jLmNvbT4KPj4KPj4gSSBtaXNzZWQgdGhlIGludC0+c2l6ZV90
IHJlZmFjdG9yaW5nIGluIGYzMmZjYmVkYmU5MiAoInR0eTogaHZjOiBjb252ZXJ0Cj4+IHRvIHU4
IGFuZCBzaXplX3QiKSwgd2hpY2ggY2F1c2VzIHRoZSBuZXdseSB1c2VkIG9wcyBpbiA4OGVhZDY4
ZTc2NGMKPj4gKCJ0dHk6IEFkZCBTQkkgZGVidWcgY29uc29sZSBzdXBwb3J0IHRvIEhWQyBTQkkg
ZHJpdmVyIikgdG8gZmFpbCB0bwo+PiBidWlsZCBkdWUgdG8gYQo+Pgo+PiBsaW51eC9kcml2ZXJz
L3R0eS9odmMvaHZjX3Jpc2N2X3NiaS5jOjU5OjE1OiBlcnJvcjogaW5jb21wYXRpYmxlIGZ1bmN0
aW9uIHBvaW50ZXIgdHlwZXMgaW5pdGlhbGl6aW5nICdzc2l6ZV90ICgqKSh1aW50MzJfdCwgY29u
c3QgdTggKiwgc2l6ZV90KScgKGFrYSAnbG9uZyAoKikodW5zaWduZWQgaW50LCBjb25zdCB1bnNp
Z25lZCBjaGFyICosIHVuc2lnbmVkIGxvbmcpJykgd2l0aCBhbiBleHByZXNzaW9uIG9mIHR5cGUg
J2ludCAodWludDMyX3QsIGNvbnN0IGNoYXIgKiwgaW50KScgKGFrYSAnaW50ICh1bnNpZ25lZCBp
bnQsIGNvbnN0IGNoYXIgKiwgaW50KScpIFstV2luY29tcGF0aWJsZS1mdW5jdGlvbi1wb2ludGVy
LXR5cGVzXQo+PiAgICAgICAgIC5wdXRfY2hhcnMgPSBodmNfc2JpX2RiY25fdHR5X3B1dCwKPj4K
Pj4gRml4ZXM6IGYzMmZjYmVkYmU5MiAoInR0eTogaHZjOiBjb252ZXJ0IHRvIHU4IGFuZCBzaXpl
X3QiKQo+PiBGaXhlczogODhlYWQ2OGU3NjRjICgidHR5OiBBZGQgU0JJIGRlYnVnIGNvbnNvbGUg
c3VwcG9ydCB0byBIVkMgU0JJIGRyaXZlciIpCj4+IExpbms6IGh0dHBzOi8vbG9yZS5rZXJuZWwu
b3JnL3IvMjAyNDAxMTkyMTU2MTIuMjA1MjktMi1wYWxtZXJAcml2b3NpbmMuY29tCj4+IFNpZ25l
ZC1vZmYtYnk6IFBhbG1lciBEYWJiZWx0IDxwYWxtZXJAcml2b3NpbmMuY29tPgo+PiAtLS0KPj4g
Q2hhbmdlcyBzaW5jZSB2MSA8MjAyNDAxMTkyMTU2MTIuMjA1MjktMi1wYWxtZXJAcml2b3NpbmMu
Y29tPjoKPj4gKiBGaXggdGhlIHJldHVybiBhbmQgYXJndW1lbnRzIGNvcnJlY3RseS4KPj4gKiBB
bHNvIGZpeCB0aGUgaHZjX3NiaV9kYmNuX3R0eV97Z2V0LHB1dH0oKS4KPj4gLS0tCj4+ICBkcml2
ZXJzL3R0eS9odmMvaHZjX3Jpc2N2X3NiaS5jIHwgOCArKysrLS0tLQo+PiAgMSBmaWxlIGNoYW5n
ZWQsIDQgaW5zZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMoLSkKPj4KPj4gZGlmZiAtLWdpdCBhL2Ry
aXZlcnMvdHR5L2h2Yy9odmNfcmlzY3Zfc2JpLmMgYi9kcml2ZXJzL3R0eS9odmMvaHZjX3Jpc2N2
X3NiaS5jCj4+IGluZGV4IDJmMzU3MWYxN2VjZC4uZjhjZDMzMTBlZjM1IDEwMDY0NAo+PiAtLS0g
YS9kcml2ZXJzL3R0eS9odmMvaHZjX3Jpc2N2X3NiaS5jCj4+ICsrKyBiL2RyaXZlcnMvdHR5L2h2
Yy9odmNfcmlzY3Zfc2JpLmMKPj4gQEAgLTE1LDcgKzE1LDcgQEAKPj4KPj4gICNpbmNsdWRlICJo
dmNfY29uc29sZS5oIgo+Pgo+PiAtc3RhdGljIGludCBodmNfc2JpX3R0eV9wdXQodWludDMyX3Qg
dnRlcm1ubywgY29uc3QgY2hhciAqYnVmLCBpbnQgY291bnQpCj4+ICtzdGF0aWMgc3NpemVfdCBo
dmNfc2JpX3R0eV9wdXQodWludDMyX3QgdnRlcm1ubywgY29uc3QgdTggKmJ1Ziwgc2l6ZV90IGNv
dW50KQo+PiAgewo+PiAgICAgICAgIGludCBpOwo+Pgo+PiBAQCAtMjUsNyArMjUsNyBAQCBzdGF0
aWMgaW50IGh2Y19zYmlfdHR5X3B1dCh1aW50MzJfdCB2dGVybW5vLCBjb25zdCBjaGFyICpidWYs
IGludCBjb3VudCkKPj4gICAgICAgICByZXR1cm4gaTsKPj4gIH0KPj4KPj4gLXN0YXRpYyBpbnQg
aHZjX3NiaV90dHlfZ2V0KHVpbnQzMl90IHZ0ZXJtbm8sIGNoYXIgKmJ1ZiwgaW50IGNvdW50KQo+
PiArc3RhdGljIHNzaXplX3QgaHZjX3NiaV90dHlfZ2V0KHVpbnQzMl90IHZ0ZXJtbm8sIHU4ICpi
dWYsIHNpemVfdCBjb3VudCkKPgo+IFRoZSBodmNfc2JpX3R0eV9wdXQoKSBhbmQgaHZjX3NiaV90
dHlfZ2V0KCkgZnVuY3Rpb25zIGFyZSBhbHJlYWR5Cj4gdXBkYXRlZCBpbiBMaW51cydzIHRyZWUu
IFdlIG9ubHkgbmVlZCB0byBmaXggaHZjX3NiaV9kYmNuX3R0eV9wdXQoKQo+IGFuZCBodmNfc2Jp
X2RiY25fdHR5X2dldCgpCj4KPiBQbGVhc2UgcmViYXNlIHRoaXMgZml4IHVwb24gTGludXgtNi44
LXJjMSB3aGVuZXZlciB0aGF0IGlzIGF2YWlsYWJsZS4KCllhLCBpdCdzIGtpbmQgb2YgY2x1bmt5
OiB3ZSBhZGRlZCBmdW5jdGlvbnMgYXQgdGhlIHNhbWUgdGltZSBhcyB0aGUgCnJlZmFjdG9yaW5n
LCBzbyB0aGVyZSdzIG5vIGdvb2QgY2xlYW4gdHJlZSB0byBhcHBseSBhIHBhdGNoIHRvLiAgUmln
aHQgCm5vdyBJJ3ZlIGFjdHVhbGx5IGdvdCB0aGlzIGJ1bmRsZWQgdXAgaW50byBhIG1lcmdlLCB0
aGF0J3MgdXN1YWxseSB0aGUgCndvcnN0IG9wdGlvbiBidXQgaXQncyBhYm91dCBhcyBnb29kIGFz
IEkgY291bGQgY29tZSB1cCB3aXRoIC0tIExpbnVzIApzdGlsbCBoYXNuJ3QgbWVyZ2VkIG15IHBh
cnQgMiwgc28gSSdtIGdvaW5nIHRvIHNlbmQgYSBwYXJ0IDMgb25jZSBJIGdldCAKdGhyb3VnaCB0
aGUgdGVzdHMgb24gbXkgZW5kLgoKU28gd2UnbGwgc2VlLCBsaWtlbHkgdG9tb3Jyb3csIGFuZCB0
aGVuIEknbGwgZGVhbCB3aXRoIHRoZSBmYWxsb3V0IGFmdGVyIApyYzEuLi4KCj4KPj4gIHsKPj4g
ICAgICAgICBpbnQgaSwgYzsKPj4KPj4gQEAgLTQ0LDEyICs0NCwxMiBAQCBzdGF0aWMgY29uc3Qg
c3RydWN0IGh2X29wcyBodmNfc2JpX3YwMV9vcHMgPSB7Cj4+ICAgICAgICAgLnB1dF9jaGFycyA9
IGh2Y19zYmlfdHR5X3B1dCwKPj4gIH07Cj4+Cj4+IC1zdGF0aWMgaW50IGh2Y19zYmlfZGJjbl90
dHlfcHV0KHVpbnQzMl90IHZ0ZXJtbm8sIGNvbnN0IGNoYXIgKmJ1ZiwgaW50IGNvdW50KQo+PiAr
c3RhdGljIHNzaXplX3QgaHZjX3NiaV9kYmNuX3R0eV9wdXQodWludDMyX3QgdnRlcm1ubywgY29u
c3QgdTggKmJ1Ziwgc2l6ZV90IGNvdW50KQo+PiAgewo+PiAgICAgICAgIHJldHVybiBzYmlfZGVi
dWdfY29uc29sZV93cml0ZShidWYsIGNvdW50KTsKPj4gIH0KPj4KPj4gLXN0YXRpYyBpbnQgaHZj
X3NiaV9kYmNuX3R0eV9nZXQodWludDMyX3QgdnRlcm1ubywgY2hhciAqYnVmLCBpbnQgY291bnQp
Cj4+ICtzdGF0aWMgc3NpemVfdCBodmNfc2JpX2RiY25fdHR5X2dldCh1aW50MzJfdCB2dGVybW5v
LCB1OCAqYnVmLCBzaXplX3QgY291bnQpCj4+ICB7Cj4+ICAgICAgICAgcmV0dXJuIHNiaV9kZWJ1
Z19jb25zb2xlX3JlYWQoYnVmLCBjb3VudCk7Cj4+ICB9Cj4+IC0tCj4+IDIuNDMuMAo+Pgo+Pgo+
Cj4gUmV2aWV3ZWQtYnk6IEFudXAgUGF0ZWwgPGFudXBAYnJhaW5mYXVsdC5vcmc+Cj4KPiBUaGFu
a3MsCj4gQW51cAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5v
cmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNj
dgo=
