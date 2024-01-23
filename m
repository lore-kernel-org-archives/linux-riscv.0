Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 893D6C47258
	for <linux-riscv@archiver.kernel.org>; Tue, 23 Jan 2024 16:36:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=L6LI7B71gd9bn8tHarEJrbW09j0ewL1O3ijEiwTs4a0=; b=nXWS/lwUb8WVCT
	tnbHf+Py2g3Hz/NJRnTGfvEFkQZszLVNQuT5wHq86PSuquUDlSLPfKRpmOCup55+yW34dZsmi7QI3
	/1wyjHNTGJa3cepGwG2wgtn/kyuA51AZN6fQGHf7utQwgby3R4dC37D/JoY5/Alpwv7iCKGmgtT/1
	qnxYnSZj2/xXSarqflh+Q1S7p1dUKtZfVXs6d3Pb9S5mde76E83/25CylXuYfWW/v/gmchbl/EaPI
	6hN12UtdOqoyQBI/cqcMAz3WXi+iecsXq+y1Svv+9eEkaBARv0xe2YLHpElJ/znQse/ymY8p59ZiV
	alT7mAD75MDKx8c9/GpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rSJl2-00HIQZ-2t;
	Tue, 23 Jan 2024 16:36:16 +0000
Received: from mail-yw1-f176.google.com ([209.85.128.176])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rSJkz-00HIQ3-2R
	for linux-riscv@lists.infradead.org;
	Tue, 23 Jan 2024 16:36:15 +0000
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-60032f9e510so8448077b3.2
        for <linux-riscv@lists.infradead.org>; Tue, 23 Jan 2024 08:36:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706027770; x=1706632570;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kiyJdU6PhJ45i7bpAb37xxoLaCkKdVvy6nsNT0rREKI=;
        b=VwDOihKITWnekkjrduViiHXAzNQ6ylHYHy+Oeh5wG6TiWx6JdEKT2nZEdaFhrYOZ2U
         ZqRmCWaJpJWPLRYtffUpTE+f9U3Q9aSQPWncvV0lhk4hf7x4QbHgGjDhiFe9EZbqmGBP
         EdD4PW30OSwYgZx/y6PGDqfDXiuZF+/7bE7HPrnXmNwoJcF+NzkmbXaNxdyKtZnJxY84
         E9e7mbgtBzI+zS8kMBRqQm+w8K9oGx0uh+UtZsjh5SF97L/US8Hv3mt85hK5a+uHMXv9
         Jzl4QvxBFsGM3PIkctke3PuowiB8N2Mt6PLuUlrnVzD9+L7vBqVlPKPF3DR7fE/F+jvO
         /ubA==
X-Gm-Message-State: AOJu0Yx3hvPLSzs5uei5/yt9G6BYtuQ44GmfGSKhRrVmo47nq0NGt52P
	3f7wx5as/kFeWJSiu/rgtRlbnuOmwD9RuZ+D9CW43+RTdgci1vIFrQFnOG79iSM=
X-Google-Smtp-Source: AGHT+IFto0LoyI2gUit27H2WLmdjW5ZYJG2jPP+sJMhnX+5E2jYNwNl14AJbGn64to2ctpT0D4hfjw==
X-Received: by 2002:a0d:f182:0:b0:5ee:6471:53e2 with SMTP id a124-20020a0df182000000b005ee647153e2mr5044798ywf.23.1706027770069;
        Tue, 23 Jan 2024 08:36:10 -0800 (PST)
Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com. [209.85.128.172])
        by smtp.gmail.com with ESMTPSA id m15-20020a0dca0f000000b005ffe7b12fe3sm1677468ywd.85.2024.01.23.08.36.09
        for <linux-riscv@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 Jan 2024 08:36:09 -0800 (PST)
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-600391ec9b2so6851107b3.1
        for <linux-riscv@lists.infradead.org>; Tue, 23 Jan 2024 08:36:09 -0800 (PST)
X-Received: by 2002:a81:4746:0:b0:5fc:d382:4bfc with SMTP id
 u67-20020a814746000000b005fcd3824bfcmr5185832ywa.97.1706027769362; Tue, 23
 Jan 2024 08:36:09 -0800 (PST)
MIME-Version: 1.0
References: <20240123132335.2034611-1-arnd@kernel.org> <1ab7594855718e24ddc629ebbab1edc8bdcd799a.camel@physik.fu-berlin.de>
 <8d37ad26-efdf-4e10-9a72-d49e37de0307@app.fastmail.com> <f00ef92b6ed93babe677e2585a7cad26347d2988.camel@physik.fu-berlin.de>
In-Reply-To: <f00ef92b6ed93babe677e2585a7cad26347d2988.camel@physik.fu-berlin.de>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 23 Jan 2024 17:35:56 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVZp6aM8DmC-VrOqPwh=9DLSDmeDW0k=thOah-Di2Xh5w@mail.gmail.com>
Message-ID: <CAMuHMdVZp6aM8DmC-VrOqPwh=9DLSDmeDW0k=thOah-Di2Xh5w@mail.gmail.com>
Subject: Re: [PATCH] sh: use generic uaccess
To: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Cc: Arnd Bergmann <arnd@arndb.de>, Arnd Bergmann <arnd@kernel.org>, 
	Yoshinori Sato <ysato@users.sourceforge.jp>, Rich Felker <dalias@libc.org>, linux-sh@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240123_083613_793411_C1E575D4 
X-CRM114-Status: GOOD (  21.64  )
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

SGkgQWRyaWFuLAoKT24gVHVlLCBKYW4gMjMsIDIwMjQgYXQgMzoyMOKAr1BNIEpvaG4gUGF1bCBB
ZHJpYW4gR2xhdWJpdHoKPGdsYXViaXR6QHBoeXNpay5mdS1iZXJsaW4uZGU+IHdyb3RlOgo+IE9u
IFR1ZSwgMjAyNC0wMS0yMyBhdCAxNToxNCArMDEwMCwgQXJuZCBCZXJnbWFubiB3cm90ZToKPiA+
IE9uIFR1ZSwgSmFuIDIzLCAyMDI0LCBhdCAxNDo1NSwgSm9obiBQYXVsIEFkcmlhbiBHbGF1Yml0
eiB3cm90ZToKPiA+ID4KPiA+ID4gV291bGRuJ3QgdGhhdCBtYWtlIHRoZXNlIG9wZXJhdGlvbnMg
c2xvd2VyIG9yIGRvIHlvdSB0aGluayB0aGF0IEdDQyBpcyBhYmxlCj4gPiA+IHRvIG9wdGltaXpl
IHRoaXMgd2VsbCBlbm91Z2g/Cj4gPgo+ID4gSXQncyBvbmx5IHNpbmdsZSBsb2FkL3N0b3JlIGlu
c3RydWN0aW9ucywgc28gaXQgc2hvdWxkIG1ha2Ugbm8KPiA+IGRpZmZlcmVuY2UuIElmIGFueXRo
aW5nLCB0aGUgZ2VuZXJpYyBjb2RlIHNob3VsZCBhbGxvdyB0aGUgY29tcGlsZXIKPiA+IHRvIGhh
dmUgYmV0dGVyIHJlZ2lzdGVyIGFsbG9jYXRpb24gYW5kIHByb2R1Y2UgYmV0dGVyIG91dHB1dCB0
aGFuCj4gPiB0aGUgYXNzZW1ibGVyIHZlcnNpb24gKHdoaWNoIGlzIGhvdyB0aGlzIGF2b2lkcyB0
aGUgSUNFKSwgYnV0IGl0J3MKPiA+IHVubGlrZWx5IHRvIGJlIG5vdGljZWFibHkgZWl0aGVyLgo+
Cj4gSSBoYXZlIG5vdCBzZWVuIGFuIElDRSBvbiB2Ni44LXJjMSBzbyBmYXIuIFdoYXQgY29uZmln
IHdhcyBpdCB0aGF0IHRyaWdnZXJlZCBpdD8KCnY2LjgtcmMxL3NoNC1nY2MxMi9zaC1hbGxtb2Rj
b25maWcKdjYuOC1yYzEvc2g0LWdjYzExL3NoLWFsbHllc2NvbmZpZwp2Ni44LXJjMS9zaDQtZ2Nj
MTMvc2gtYWxsbW9kY29uZmlnCnY2LjgtcmMxL3NoNC1nY2MxMy9zaC1hbGx5ZXNjb25maWcKCmUu
Zy4gaHR0cDovL2tpc3NrYi5lbGxlcm1hbi5pZC5hdS9raXNza2IvYnVpbGRyZXN1bHQvMTUxMTEy
MjkvCgpHcntvZXRqZSxlZXRpbmd9cywKCiAgICAgICAgICAgICAgICAgICAgICAgIEdlZXJ0Cgot
LSAKR2VlcnQgVXl0dGVyaG9ldmVuIC0tIFRoZXJlJ3MgbG90cyBvZiBMaW51eCBiZXlvbmQgaWEz
MiAtLSBnZWVydEBsaW51eC1tNjhrLm9yZwoKSW4gcGVyc29uYWwgY29udmVyc2F0aW9ucyB3aXRo
IHRlY2huaWNhbCBwZW9wbGUsIEkgY2FsbCBteXNlbGYgYSBoYWNrZXIuIEJ1dAp3aGVuIEknbSB0
YWxraW5nIHRvIGpvdXJuYWxpc3RzIEkganVzdCBzYXkgInByb2dyYW1tZXIiIG9yIHNvbWV0aGlu
ZyBsaWtlIHRoYXQuCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgLS0gTGludXMgVG9y
dmFsZHMKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxp
bnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0
dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
