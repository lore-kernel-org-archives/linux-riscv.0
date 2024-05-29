Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 613C5C25B75
	for <linux-riscv@archiver.kernel.org>; Wed, 29 May 2024 12:29:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Y/y5XOHzC6PxB1zzRNyiUNu9P/kAgKzZ1SukUlOB0oE=; b=0mrGluouIRD8Q2
	3NlHbIkThkCz1r4lRP4cFXRN2t4ydP5BHwACUcboKS3F93nBwhOKwqZ8IVxmp2hAkY/sewV9BYxbP
	2nMT8q7koKaKHDFwCk1NrexDx/5UPLnc+F/BOild8W98Xuqy0oiFHP9vCe/puYCjdvlZu9nfImzur
	Ga7VyeGitnn8kDNgqf/lqcFYWG49UkqbVNkWL45fehbRjFvPQxBUPdsmoU+NRcxo9OR3fn9JH6DaP
	rWnylRz1YhNuFHKevzkB/tmoY+xzDFXjQN2ce0SviGDDVnn4WmjnUnWUC1hX7NYRmgIEF+Z5I33Sn
	BD37EPFYIweFNf2T1Rxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sCIQj-000000046z5-3cBu;
	Wed, 29 May 2024 12:29:21 +0000
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sCIQh-000000046xQ-02UO
	for linux-riscv@lists.infradead.org;
	Wed, 29 May 2024 12:29:20 +0000
Received: by mail-ej1-x631.google.com with SMTP id a640c23a62f3a-a5a89787ea4so213738366b.2
        for <linux-riscv@lists.infradead.org>; Wed, 29 May 2024 05:29:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1716985754; x=1717590554; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vGOEscTDwTYqe9co9+vKadCnOa5+j3XpvvU3cG9r11k=;
        b=sUMN0mzxUXejExHUN1NPdo/xgBaWbZrgobSIt8ZVcBzopT5+VZJJYsjU4U5WLLdC3F
         IR79nf477kkMVfX8FI8XPgIt//A/SVr4a9KdjcpK01/e/5G2dZUXpOmwUQVEXsPSn3N8
         GQZQb0IZ0E9jVCMrx6c8NuNo32s1FPScZMLaTjNhLaUHArbKKGoJyrIvGdhGuAX8vrmJ
         0AWAJKPzC5RT+fAtZju/wu61V9DthWR9p2TWRuffeDT0yX+JTSGdFC+gKBOvLCWmG0I/
         Md+deufmEiAN/nHoDlYBVawWgrU4Acf3rl2yQhqvjvR8RhK8Xa0I7eWHqv4AF18CB9Pn
         ukRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716985754; x=1717590554;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vGOEscTDwTYqe9co9+vKadCnOa5+j3XpvvU3cG9r11k=;
        b=r8QUvLkstGR0qLaQibkdNswr0U8lm/OoRsp7hIqxI+NY++6GwFYFEopRdRpqz+4kJT
         5TZOQCLTncrpNnHo7rIHohBILwWG9Z4+2fVZQulJVReVmZzTlOSbN4OSEOD/T19DwHNe
         wGi07Xg/gMEjq0HeWj/2F93Fg6+in/e9cSn6xAuo2LMghVZ/xDBba733RjMf7DaBgG9y
         1T31fDSpqDz1wpiMqmDBxW2Ts+xQgePDFaQr6pnRsPZ+J5vOZ1f5MNrQK4aU2Yh8z39P
         bZTVUlXY8TtHQbEHisYUJuU00aFJrL3OB+eUZoXdFb/pQ7q6jBRV0WMnyd8dd7CobMwp
         RFSg==
X-Forwarded-Encrypted: i=1; AJvYcCV5TwbHW3M3Hbj5htDovTVGyXT6Nx41sZ68sqFOh3G1q8eVwlwNp3BuP6TvRKdkQUzhP2dl1NWG9kOYLNlbexE3VRJA9hS9Bu8LW5KYpYIF
X-Gm-Message-State: AOJu0YzfMr3xHQVfuafwZEWgNGjov2KUlAVmwXLTyxEEG3J2e7hFqGFK
	XYPJ9F10+4B2RPcjdg7O/SjnvS9r1m/ddVuk5hloZ+8dVBw98W0rHucRdf02bSXaLUTbm6K3m5Q
	MZyN2Pai4LetEnyBuu+5KplPSH9gKS4R+6t/B/Q==
X-Google-Smtp-Source: AGHT+IEQgikhsrsUYBnaJMpD1uGbxEZ77OxlR6yJ2c4VtevK8CwBEfxhj58UbW9AHXXHwN+zwIK7XfHdcV5UtsKrn0U=
X-Received: by 2002:a17:906:a455:b0:a5b:53e2:519e with SMTP id
 a640c23a62f3a-a62642ea4f9mr995846166b.26.1716985753806; Wed, 29 May 2024
 05:29:13 -0700 (PDT)
MIME-Version: 1.0
References: <20240528151052.313031-1-alexghiti@rivosinc.com>
 <20240528151052.313031-3-alexghiti@rivosinc.com> <ZlZurXUUUfXHZJaX@andrea>
In-Reply-To: <ZlZurXUUUfXHZJaX@andrea>
From: Alexandre Ghiti <alexghiti@rivosinc.com>
Date: Wed, 29 May 2024 14:29:02 +0200
Message-ID: <CAHVXubj1RpN80f0vNQwFtaNKORnw2F3yzA1_0txa3A+9-usdFw@mail.gmail.com>
Subject: Re: [PATCH 2/7] riscv: Implement cmpxchg8/16() using Zabha
To: Andrea Parri <parri.andrea@gmail.com>
Cc: Jonathan Corbet <corbet@lwn.net>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, Will Deacon <will@kernel.org>, 
	Waiman Long <longman@redhat.com>, Boqun Feng <boqun.feng@gmail.com>, Arnd Bergmann <arnd@arndb.de>, 
	Leonardo Bras <leobras@redhat.com>, Guo Ren <guoren@kernel.org>, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-arch@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240529_052919_148219_F744D356 
X-CRM114-Status: UNSURE (   9.65  )
X-CRM114-Notice: Please train this message.
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

T24gV2VkLCBNYXkgMjksIDIwMjQgYXQgMTo1NOKAr0FNIEFuZHJlYSBQYXJyaSA8cGFycmkuYW5k
cmVhQGdtYWlsLmNvbT4gd3JvdGU6Cj4KPiA+ICt6YWJoYTogICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFwKPiA+ICsg
ICAgIF9fYXNtX18gX192b2xhdGlsZV9fICggICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICBcCj4gPiArICAgICAgICAgICAgIHByZXBlbmQgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgXAo+ID4gKyAgICAgICAgICAgICAiICAgICAg
IGFtb2NhcyIgY2FzX3NmeCAiICUwLCAlejIsICUxXG4iICAgICAgICAgICAgICAgIFwKPiA+ICsg
ICAgICAgICAgICAgYXBwZW5kICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICBcCj4gPiArICAgICAgICAgICAgIDogIismciIgKHIpLCAiK0EiICgqKHApKSAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgXAo+ID4gKyAgICAgICAgICAgICA6ICJySiIg
KG4pICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFwKPiA+ICsg
ICAgICAgICAgICAgOiAibWVtb3J5Iik7ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICBcCj4KPiBDb3VsZG4ndCBhIHBsYXRmb3JtIGhhdmUgWmFiaGEgYnV0IG5vdCBo
YXZlIFphY2FzPyAgSSBkb24ndCBzZWUgaG93IHRoaXMKPiBhc20gZ290byBjb3VsZCB3b3JrIGlu
IHN1Y2ggY2FzZSwgd2hhdCBhbSBJIG1pc3Npbmc/CgpaYWJoYSBhbW9jYXMuW2J8aF0gaW5zdHJ1
Y3Rpb25zIGFyZSBvbmx5IGltcGxlbWVudGVkIGlmIFphY2FzIGlzCnByZXNlbnQsIGFzIHRoZSBz
cGVjaWZpY2F0aW9uIHN0YXRlczogIklmIFphY2FzIFsyXSBleHRlbnNpb24gaXMgYWxzbwppbXBs
ZW1lbnRlZCwgWmFiaGEgZnVydGhlciBwcm92aWRlcyB0aGUgQU1PQ0FTLltCfEhdIGluc3RydWN0
aW9ucy4iCgpCdXQgdGhlIGNvZGUgeW91IG1lbnRpb24gaXMgb25seSBmb3IgOCBhbmQgMTZiaXQg
b3BlcmF0aW9ucywgc28gSQp0aGluayB3ZSBhcmUgZ29vZCBhbnl3YXk/CgpUaGFua3MsCgpBbGV4
Cgo+Cj4gICBBbmRyZWEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRl
YWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgt
cmlzY3YK
