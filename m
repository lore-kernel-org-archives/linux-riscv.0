Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B28C3C25B7C
	for <linux-riscv@archiver.kernel.org>; Wed, 29 May 2024 08:04:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=aGDB4wjVYuu4bIrjVvMoPwQXRRdR8rJhc4TUnaqyOSA=; b=JNeoFqZkNjAnT5
	tRvwft/aEtx4Lu9SiAKlIQfFR/Srs6t5tyKwcftteV4R5toJTTxcUmHL2Cr2FAkPc8PJjq7D+a4Ci
	RsUM5mVkcZw1Q2tzoG2PIhF51jVbAQ5yV/U79z3gMbq5/tFtDyzEUOTzhGyoxTGSj2x4m1sFOtI5F
	RhyH/+3fuUxu3CZUQM9IDddUGZz9jCUcv+eHlgduMKdpVEKJc+/pEuHJ3hWTgXewtAgKaSmuRGUKJ
	gbOxhdORlDnHOzeGO/+dRiQ+HL4Ci8KrSY6iTb9krVrFPTswG/uEFnymuXQ2TZjyJPz+/JSd6qWgC
	f8mACMZZbsRrS8LIS5Gg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sCEIU-00000003GNm-2qd7;
	Wed, 29 May 2024 08:04:34 +0000
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sCEIR-00000003GKP-1GEX
	for linux-riscv@lists.infradead.org;
	Wed, 29 May 2024 08:04:33 +0000
Received: by mail-ej1-x630.google.com with SMTP id a640c23a62f3a-a59a609dd3fso114936966b.0
        for <linux-riscv@lists.infradead.org>; Wed, 29 May 2024 01:04:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1716969866; x=1717574666; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iugICvJDzmJo7xGBPHogMYo6Gg3CJ7ooLOOivaduvyI=;
        b=QmnWGGx9nRSt0cL4s0uzk13l9pDpxl3pBRh5NslspzBtilY02BUkWTt3ATwceo9fbM
         DaWTO1Hig+372tMWURDM4+90Et1THpHBSGKjDGnk/4K4g4c90j5GL5h+EaXXp7ssu181
         Xz0ThxSvdJN4Df6Kax6h4QR9/+xNt/2YoOAI1d25bnJVfgwQTEvUWSnpZi5vDoHlPagB
         7ojgK6C/Y298YkkRVLM0HmMHlnZ7EbLwLjLwSqCpsy6SdilSdEYGSspxjmJ+MKmpR/hu
         YhlicBAobq8BYVt5PocJPlgHcx6KTKDcbFH2NWCoEa7C2blJf8pLJCsJtaxWqfJ9S7Co
         VtMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716969866; x=1717574666;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iugICvJDzmJo7xGBPHogMYo6Gg3CJ7ooLOOivaduvyI=;
        b=mVpUgbuBpxg5dhG6X/QOf6CgTlrQ/LYRd+5rpgecRh9gU/FbDJ/LveIKTDVzgpP2KT
         KKoB1QYZZdFSRxtVdb898B2tylL4n5YdDApR/4CTrpJLV3bDOrJL9uYbuPoD6BgFuqM2
         gmUD3MtxI05E5gJt/GilcafcV8GfRFvd5wQb/TpjOSTUGzstgUOKBSpkWCD7egwfiRI7
         Qubn7mK3z0V212fRGId9CK77TrtY4NyWRyRVZ/MuSuBcH0XzK+HZ8RiV9CFnu4tVjtS5
         qrIgkCNCQhpgKqxWve6ZFmoKaD7qzrCnUapN/t1o2tNfiCcCISWI8cybL/ECdxTLk1xD
         wkZA==
X-Forwarded-Encrypted: i=1; AJvYcCXKHW0YfzGPCIoIMm0K6CTf+27aivL7xwe0qJlk0s6R7WhmwzR2jAQMqX+AUajG+tQxry0DTB0R2YgyNc5QhzT7xlkzs0wBIal+ir6s6iwK
X-Gm-Message-State: AOJu0Yz5BsHVdSzV6hCDbKHwytLwjD7DTLxoH9Eye6bToVPcrMMJ7gMP
	Sw7RQmuNBd4Uf4MZ4w50riYlKfbYBsGgb8AVl09s7/Ic3tFXAiFzYn0EbgsmFKyjJNB89BOHjp5
	T4zVl4/0IO1x5TpADLeJACHr4iO8Ac/AIKehcKw==
X-Google-Smtp-Source: AGHT+IG6iwinAXXk+z85s+DZ7rCxbual1zF0BnW9/urFx8Jq0vjUfxC8W1lP9e0VTumF0FrEVCZkoP1D8o+mWg7nLg0=
X-Received: by 2002:a17:906:3e4f:b0:a5c:d4b2:6a44 with SMTP id
 a640c23a62f3a-a642d3846f7mr95336266b.16.1716969865779; Wed, 29 May 2024
 01:04:25 -0700 (PDT)
MIME-Version: 1.0
References: <20240528151052.313031-1-alexghiti@rivosinc.com>
 <20240528151052.313031-5-alexghiti@rivosinc.com> <ZlYbupL5XgzgA0MX@andrea>
In-Reply-To: <ZlYbupL5XgzgA0MX@andrea>
From: Alexandre Ghiti <alexghiti@rivosinc.com>
Date: Wed, 29 May 2024 10:04:14 +0200
Message-ID: <CAHVXubgBDxyow3-CFwBrkJ7xoAXCv8Tq7nNTAcvbzbA=TAaf5A@mail.gmail.com>
Subject: Re: [PATCH 4/7] riscv: Implement xchg8/16() using Zabha
To: Andrea Parri <parri.andrea@gmail.com>
Cc: Jonathan Corbet <corbet@lwn.net>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, Will Deacon <will@kernel.org>, 
	Waiman Long <longman@redhat.com>, Boqun Feng <boqun.feng@gmail.com>, Arnd Bergmann <arnd@arndb.de>, 
	Leonardo Bras <leobras@redhat.com>, Guo Ren <guoren@kernel.org>, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-arch@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240529_010431_430741_A05208E7 
X-CRM114-Status: GOOD (  10.42  )
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

SGkgQW5kcmVhLAoKT24gVHVlLCBNYXkgMjgsIDIwMjQgYXQgODowMOKAr1BNIEFuZHJlYSBQYXJy
aSA8cGFycmkuYW5kcmVhQGdtYWlsLmNvbT4gd3JvdGU6Cj4KPiA+IC0jZGVmaW5lIF9fYXJjaF94
Y2hnX21hc2tlZChwcmVwZW5kLCBhcHBlbmQsIHIsIHAsIG4pICAgICAgICAgICAgICAgICBcCj4g
PiArI2RlZmluZSBfX2FyY2hfeGNoZ19tYXNrZWQoc3dhcF9zZngsIHByZXBlbmQsIGFwcGVuZCwg
ciwgcCwgbikgICAgICAgICAgICAgICBcCj4KPiBUaGlzIGFjdHVhbGx5IGluZGljYXRlcyBhIHBy
b2JsZW0gaW4gdGhlIGN1cnJlbnQgKGFrYSwgbm8gWmFiaGEpCj4gaW1wbGVtZW50YXRpb246IHdp
dGhvdXQgeW91ciBzZXJpZXMsIHhjaGcxNigpIGdldHMgbWFwcGVkIHRvCj4KPiAgIGxyLncgICAg
IGEyLChhMykKPiAgIGFuZCAgICAgIGExLGEyLGE1Cj4gICBvciAgICAgICBhMSxhMSxhNAo+ICAg
c2MudyAgICAgYTEsYTEsKGEzKQo+ICAgYm5leiAgICAgYTEsNDNjIDwuTDBeQjE+Cj4KPiB3aGlj
aCBpcyBjbGVhcmx5IHdyb25nLi4uIChvdGhlciAiZnVsbHktb3JkZXJlZCBMUi9TQyBzZXF1ZW5j
ZXMiCj4gaW5zdGVhZCBmb2xsb3cgdGhlIG1hcHBpbmcKPgo+ICAgbHIudyAgICAgYTIsKGEzKQo+
ICAgYW5kICAgICAgYTEsYTIsYTUKPiAgIG9yICAgICAgIGExLGExLGE0Cj4gICBzYy53LnJsICBh
MSxhMSwoYTMpCj4gICBibmV6ICAgICBhMSw0M2MgPC5MMF5CMT4KPiAgIGZlbmNlICAgIHJ3LHJ3
ICApCj4KPiBBIHNpbWlsYXIgY29uc2lkZXJhdGlvbiBmb3IgeGNoZzgoKS4KCk9rLCBJIHdpbGwg
Zml4IHRoYXQgc2VwYXJhdGVseSBhbmQgbWFrZSBpdCBtZXJnZWQgaW4gLXJjMi4KClRoYW5rcywK
CkFrZXgKCj4KPiAgIEFuZHJlYQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmlu
ZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9s
aW51eC1yaXNjdgo=
