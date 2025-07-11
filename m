Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 087E8C83F1A
	for <linux-riscv@archiver.kernel.org>; Fri, 11 Jul 2025 17:11:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=450QT0kZCtnIUVMgkV6hUVfu7d21dXKJ4aF7NrnOgQY=; b=0ix+IWBXbSbrSq
	txjXX0ifp/ooNxPcFCYrO+/m6MsDv65U1Q/zE7+uBp7TIHC6XDW/zES96eE7k44Ui6aNEJwQT4Txw
	Enix6nc1zMfAoGPttTfG5aWW8/eL9o/QhQwded4nOdcyS7rQetzkmSaIACRr8SH7pqPdrVLXNlfwe
	2Md/zcwP2dBjAJRXZgj3bZA2EcufNOw13rx5vivAoecIZMx3ETgGgxqhrdxtNz5KX170xMiH2+Zhg
	pW8u81B8FunUGolYfwtG+rsqtgGqJcokLfVwBQ90MVqkOzO77o74qKHkso/0MgeToJfm+lR/06+JL
	lCUlYMZ5gWH3469I1iCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uaHH5-0000000FMu9-14Dg;
	Fri, 11 Jul 2025 17:11:03 +0000
Received: from mail-il1-x12e.google.com ([2607:f8b0:4864:20::12e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uaGXr-0000000FH8b-0dAU
	for linux-riscv@lists.infradead.org;
	Fri, 11 Jul 2025 16:24:20 +0000
Received: by mail-il1-x12e.google.com with SMTP id e9e14a558f8ab-3df3ce3ec91so8902405ab.2
        for <linux-riscv@lists.infradead.org>; Fri, 11 Jul 2025 09:24:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1752251058; x=1752855858; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZrIf+wWA/D3VVdudVKE3VUjB5xcAA2WL2BSQ0S3Af6s=;
        b=Gf8kEuuVbjdVVfIz+RUdSsyjrnuxerQJovA5Bli8ZyJOrDj24I6R+LRJdqI0S21JH/
         q2HD6T4OurdAB7hoYSUK5mfZ6ofj0K0YDB+MqORzrECTDaVA3ocYc2/8wE/Z440L4z3m
         phydamcrrrB+efm6BNNBkF/84B6QkVd76qfGsv+R0c+BUV5FxL5t4LaVOkQ2TBdKnh48
         FLVAaFy9xKszhajmgrJNgPsKyrs227tjupMd6+8JPZ/32yHsUSdICqQSWNNbwoD4BOFa
         x3nxWbClaC1sDMtW7Eq2S0WjA7ib5J2jJdeFOSkSgu5qPBgDtoLwFcnGcyUzZ1Kq0T3w
         4WxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752251058; x=1752855858;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZrIf+wWA/D3VVdudVKE3VUjB5xcAA2WL2BSQ0S3Af6s=;
        b=c+1ghG4dIQ+TLPjWbgLUwKUmVtkzD644iCHBBwxdR4XrMNeGULxMt/eMDAi8g1igR4
         CJ9qI07p2XlCj/LU8M33u0xLbE9Tko4ASMCv85Bgb6kfwvuCwW1Sck/WVu2kly4g8xFH
         6dKpnr9GTkD9vMc3aZaS1nZpqb+beKWMjRhK+VoVcO0iD/ceW3T/a0Rb48/g+RjG5mM8
         pkxmkABoYwkCx4kj595mnvYLtavwLNcLAV+zjdt+6oF8OwqXz6VsOZPQ348vRmxpRH0B
         DBeVF7rETMqQTkBPxRHPTRxr+N0m+TzMoTmis1sUy1IVsGvtRP3wMvo+f80I5XwKYxrz
         mFsg==
X-Forwarded-Encrypted: i=1; AJvYcCVewPnwX6JB8RYcXtaD8R0GLlYBP9KaLVnysjPF+Q0vs09jjOsy7o+SMtxuiaosjBq5Ar1Cv+tBnai4YQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yyj3mwpTpqCKJ9UREKq1p/0Xx/5iNO2ZFXaFZlFTvQ/C0nk6sdu
	vXjRYT4vqRzjCzlF9/O6cyI6MeVmU3li0UkbS8RGO+XEgrDPnBB+4277Vhf2B75EV6c2quTgHMP
	YyAYyzNErNAfeKXWY+/l19157t4knhOAF2OoqqQYiIQ==
X-Gm-Gg: ASbGncsQ21KAkvMbU/L0//JlSCXnlKy9GD3m9tA6sLLaY1HXnODEUP5uYax3q1SWr1D
	XEy1p3yLZvnU6RldKLDpW8Byi+tDzzUeJqoYmSrhBIzNoLehwtJ1j0CFepN+7P3WkngZ2j+Aevs
	AUjz5WthpC8deXa/gWDTeXEQea8EpHXGMDG5aU3jhTvHjx7TO5dJHwBwwLqKQvfl76v6zXJ5jbT
	ai75og=
X-Google-Smtp-Source: AGHT+IEgo0yoNtHXaZRHtcGwnexmwO8T42ro0oy6XMW829CWZxM0G/3ulBECSGHLVGNEjLJFmuCzUmfD9G4uz5kdDa4=
X-Received: by 2002:a05:6e02:1fc4:b0:3de:128d:15c4 with SMTP id
 e9e14a558f8ab-3e253fa39a0mr42624545ab.0.1752251058238; Fri, 11 Jul 2025
 09:24:18 -0700 (PDT)
MIME-Version: 1.0
References: <20250711140013.3043463-1-sunilvl@ventanamicro.com>
In-Reply-To: <20250711140013.3043463-1-sunilvl@ventanamicro.com>
From: Anup Patel <anup@brainfault.org>
Date: Fri, 11 Jul 2025 21:54:07 +0530
X-Gm-Features: Ac12FXwUkiRJWGtrJ4BJLcD_qt-SO7VTbgyLm_cGjFvtWTFEfiq5mlAj0Rq7ox0
Message-ID: <CAAhSdy00ztZoX4LF88RTmnyJwKGWseD5qcHkuBW2w_JP5bBL6Q@mail.gmail.com>
Subject: Re: [PATCH] ACPI: RISC-V: Remove unnecessary CPPC debug message
To: Sunil V L <sunilvl@ventanamicro.com>
Cc: linux-acpi@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, "Rafael J . Wysocki" <rafael@kernel.org>, 
	Len Brown <lenb@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Alexandre Ghiti <alex@ghiti.fr>, Anup Patel <apatel@ventanamicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250711_092419_296845_3E2BCF20 
X-CRM114-Status: GOOD (  15.67  )
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

T24gRnJpLCBKdWwgMTEsIDIwMjUgYXQgNzozMOKAr1BNIFN1bmlsIFYgTCA8c3VuaWx2bEB2ZW50
YW5hbWljcm8uY29tPiB3cm90ZToKPgo+IFRoZSBwcmVzZW5jZSBvciBhYnNlbmNlIG9mIHRoZSBD
UFBDIFNCSSBleHRlbnNpb24gaXMgY3VycmVudGx5IGxvZ2dlZAo+IG9uIGV2ZXJ5IGJvb3QuIFRo
aXMgbWVzc2FnZSBpcyBub3QgcGFydGljdWxhcmx5IHVzZWZ1bCBhbmQgY2FuIGNsdXR0ZXIKPiB0
aGUgYm9vdCBsb2cuIFJlbW92ZSB0aGlzIGRlYnVnIG1lc3NhZ2UgdG8gcmVkdWNlIG5vaXNlIGR1
cmluZyBib290Lgo+Cj4gVGhpcyBjaGFuZ2UgaGFzIG5vIGZ1bmN0aW9uYWwgaW1wYWN0Lgo+Cj4g
U2lnbmVkLW9mZi1ieTogU3VuaWwgViBMIDxzdW5pbHZsQHZlbnRhbmFtaWNyby5jb20+CgpMR1RN
LgoKUmV2aWV3ZWQtYnk6IEFudXAgUGF0ZWwgPGFudXBAYnJhaW5mYXVsdC5vcmc+CgpSZWdhcmRz
LApBbnVwCgo+IC0tLQo+ICBkcml2ZXJzL2FjcGkvcmlzY3YvY3BwYy5jIHwgMiAtLQo+ICAxIGZp
bGUgY2hhbmdlZCwgMiBkZWxldGlvbnMoLSkKPgo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2FjcGkv
cmlzY3YvY3BwYy5jIGIvZHJpdmVycy9hY3BpL3Jpc2N2L2NwcGMuYwo+IGluZGV4IDRjZGZmMzg3
ZGVmZi4uNDQwY2Y5ZmI5MWFhIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvYWNwaS9yaXNjdi9jcHBj
LmMKPiArKysgYi9kcml2ZXJzL2FjcGkvcmlzY3YvY3BwYy5jCj4gQEAgLTM3LDEwICszNyw4IEBA
IHN0YXRpYyBpbnQgX19pbml0IHNiaV9jcHBjX2luaXQodm9pZCkKPiAgewo+ICAgICAgICAgaWYg
KHNiaV9zcGVjX3ZlcnNpb24gPj0gc2JpX21rX3ZlcnNpb24oMiwgMCkgJiYKPiAgICAgICAgICAg
ICBzYmlfcHJvYmVfZXh0ZW5zaW9uKFNCSV9FWFRfQ1BQQykgPiAwKSB7Cj4gLSAgICAgICAgICAg
ICAgIHByX2luZm8oIlNCSSBDUFBDIGV4dGVuc2lvbiBkZXRlY3RlZFxuIik7Cj4gICAgICAgICAg
ICAgICAgIGNwcGNfZXh0X3ByZXNlbnQgPSB0cnVlOwo+ICAgICAgICAgfSBlbHNlIHsKPiAtICAg
ICAgICAgICAgICAgcHJfaW5mbygiU0JJIENQUEMgZXh0ZW5zaW9uIE5PVCBkZXRlY3RlZCEhXG4i
KTsKPiAgICAgICAgICAgICAgICAgY3BwY19leHRfcHJlc2VudCA9IGZhbHNlOwo+ICAgICAgICAg
fQo+Cj4gLS0KPiAyLjQzLjAKPgo+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMu
aW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2xpbnV4LXJpc2N2Cg==
