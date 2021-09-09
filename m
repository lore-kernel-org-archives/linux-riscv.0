Return-Path: <SRS0=EjPk=N7=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 366B5C433F5
	for <linux-riscv@archiver.kernel.org>; Thu,  9 Sep 2021 15:00:38 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D17806113A
	for <linux-riscv@archiver.kernel.org>; Thu,  9 Sep 2021 15:00:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org D17806113A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5nbFAK/+ieTLjgTDg4PSBzCraLnbY4fBfxA3jTYOwBo=; b=QPcZupPfz7/yghmZDRF+EffLcL
	8kb6l2CHRxf+9cnjBOizZPeBqeGvXVPIh691rsHLqDo1hV8U1b2wLIcyzVBYJvm73bKJghg+bXZHl
	Ro7ebcg3QXZl0Q+lQcB4MDm5WCrgrq0wT/XjSUjwgLLrVHIfB0yrqQpzNvj18uoXunrW6clsF8/F4
	eO+NZ3UmZzxkDu8Tu5EoJBQik31pvtbklIh2StV/04iuASCQq+bndjjWuVh/V43AAmMsTgQT3p9fu
	nxy0kjUX0cqlqlOKyDHphIKYIuee6FPZcn6tVpZcHeVbx84tyzZZPm3UOT6E0XxnOmFEfrRJd0rzi
	/aPnEAOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mOLX2-00ACxD-Mf; Thu, 09 Sep 2021 15:00:04 +0000
Received: from mail-oi1-x232.google.com ([2607:f8b0:4864:20::232])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mOLWz-00ACtr-46
 for linux-riscv@lists.infradead.org; Thu, 09 Sep 2021 15:00:03 +0000
Received: by mail-oi1-x232.google.com with SMTP id r26so2847763oij.2
 for <linux-riscv@lists.infradead.org>; Thu, 09 Sep 2021 08:00:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=cdZ5UReirNbJCz4qtRz9jPX8lIr89503B9bA6FIRuzQ=;
 b=jDgnkGSK/AzbQ/fvUe+F8Q6VZgBkRHWd4DcBMpA845U1VP2maB6KuDUGyL8c2z1MQ5
 UX6S2hMX3XaL+wIg8XPiRW3uTqvaEgPp8GwPJPJByHRkVu8WdVGBxNU7ND2J8PWd6MjQ
 1BL0tMyxa7ZdE0Z2Q+WzTnNgCJ+YMSVMHlQ3G1GlF5G2afc7lU4RB3k5FIovm8QarUG7
 RPmR6TFjaMcSuvD67sPx0N8yWJj2K9lVY4kxvs9O3saKM+uEhuFWmi956IZGiUFIdrmY
 hqz6C5u3zKx731XS7IajOTZL1HWrKGy6fsTJ74ufvBqwljrPlIixlbiTt+K2g3iOZX5u
 avbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=cdZ5UReirNbJCz4qtRz9jPX8lIr89503B9bA6FIRuzQ=;
 b=X7NQQDTmqVn7EX/pRaAbWgnxFYBzprGQU6A1c2oT5HicZRee1JRarRf/NMqjtzMoG9
 sCtj0ogxZDOO5oDqqfU7gZLEeqzh+O2dsJUgREuVb6607Dvssu9UKJOr/z8gV8c0iXrK
 TIlcxkOA2U7fSd0u9qbdjAatyo2+6RYDUnyipA6fBiaEbRLSnl4vUeK1PJ1Id3R+4ouD
 wQQVsROqh5Bd2Wz3le+MV0FU+kN5PzCz79vG5cIj5mBmU+QXL3+QYpdx0tSzcjwCwlSj
 2Izf/Mddserps8IvLJEq7EqWZERqKMoMH2DN6gpzZYXEMnJYVj40o+JameI6hsRZZUpC
 Ntpw==
X-Gm-Message-State: AOAM530Sbl9xfWNr+12wMRlfog0YqG/YJ2oPN8P/Q5yrXnxbl9SNN8za
 qfXLMUKcM1Nqy6XLwmYuTl0=
X-Google-Smtp-Source: ABdhPJy29+VUAR+47DHLnfifhIlBecXxb8pFnECJqaJhWQNcxsfS3c0Ish2MaEwbx71o2d1eL5rWmg==
X-Received: by 2002:aca:1709:: with SMTP id j9mr233084oii.120.1631199599971;
 Thu, 09 Sep 2021 07:59:59 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id
 l44sm475368otv.81.2021.09.09.07.59.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 09 Sep 2021 07:59:59 -0700 (PDT)
Subject: Re: [PATCH] Enable '-Werror' by default for all kernel builds
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 Christoph Hellwig <hch@infradead.org>, Marco Elver <elver@google.com>
Cc: Nathan Chancellor <nathan@kernel.org>, Arnd Bergmann <arnd@kernel.org>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 llvm@lists.linux.dev, Nick Desaulniers <ndesaulniers@google.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 linux-riscv@lists.infradead.org, Andrey Ryabinin <ryabinin.a.a@gmail.com>,
 Alexander Potapenko <glider@google.com>, Dmitry Vyukov <dvyukov@google.com>,
 Andrey Konovalov <andreyknvl@gmail.com>, kasan-dev@googlegroups.com,
 "Pan, Xinhui" <Xinhui.Pan@amd.com>, amd-gfx@lists.freedesktop.org
References: <20210906142615.GA1917503@roeck-us.net>
 <CAHk-=wgjTePY1v_D-jszz4NrpTso0CdvB9PcdroPS=TNU1oZMQ@mail.gmail.com>
 <YTbOs13waorzamZ6@Ryzen-9-3900X.localdomain>
 <CAK8P3a3_Tdc-XVPXrJ69j3S9048uzmVJGrNcvi0T6yr6OrHkPw@mail.gmail.com>
 <YTkjJPCdR1VGaaVm@archlinux-ax161>
 <75a10e8b-9f11-64c4-460b-9f3ac09965e2@roeck-us.net>
 <YTkyIAevt7XOd+8j@elver.google.com> <YTmidYBdchAv/vpS@infradead.org>
 <a04c4c37-7151-ef7e-09ce-a61ac7b12106@roeck-us.net>
 <78aeab09-de88-966f-9f03-a2d56a0a6064@amd.com>
From: Guenter Roeck <linux@roeck-us.net>
Message-ID: <80a56a5a-5351-1897-b87e-3c3cd84bb13c@roeck-us.net>
Date: Thu, 9 Sep 2021 07:59:56 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <78aeab09-de88-966f-9f03-a2d56a0a6064@amd.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210909_080001_177258_F3C3AE23 
X-CRM114-Status: GOOD (  22.05  )
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

T24gOS85LzIxIDEyOjMwIEFNLCBDaHJpc3RpYW4gS8O2bmlnIHdyb3RlOgo+IEFtIDA5LjA5LjIx
IHVtIDA4OjA3IHNjaHJpZWIgR3VlbnRlciBSb2VjazoKPj4gT24gOS84LzIxIDEwOjU4IFBNLCBD
aHJpc3RvcGggSGVsbHdpZyB3cm90ZToKPj4+IE9uIFdlZCwgU2VwIDA4LCAyMDIxIGF0IDExOjU4
OjU2UE0gKzAyMDAsIE1hcmNvIEVsdmVyIHdyb3RlOgo+Pj4+IEl0J2QgYmUgZ29vZCB0byBhdm9p
ZC4gSXQgaGFzIGhlbHBlZCB1bmNvdmVyIGJ1aWxkIGlzc3VlcyB3aXRoIEtBU0FOIGluCj4+Pj4g
dGhlIHBhc3QuIE9yIGF0IGxlYXN0IG1ha2UgaXQgZGVwZW5kZW50IG9uIHRoZSBwcm9ibGVtYXRp
YyBhcmNoaXRlY3R1cmUuCj4+Pj4gRm9yIGV4YW1wbGUgaWYgYXJtIGlzIGEgcHJvYmxlbSwgc29t
ZXRoaW5nIGxpa2UgdGhpczoKPj4+Cj4+PiBJJ20gYWxzbyBzZWVpbmcgcXVpdGUgYSBmZXcgc3Rh
Y2sgc2l6ZSB3YXJuaW5ncyB3aXRoIEtBU0FOIG9uIHg4Nl82NAo+Pj4gd2l0aG91dCBDT01QSUxU
X1RFU1QgdXNpbmcgZ2NjIDEwLjIuMSBmcm9tIERlYmlhbi7CoCBJbiBmYWN0IHRoZXJlIGFyZSBh
Cj4+PiBmZXcgd2FybmluZ3Mgd2l0aG91dCBLQVNBTiwgYnV0IHdpdGggS0FTQU4gdGhlcmUgYXJl
IGEgbG90IG1vcmUuCj4+PiBJJ2xsIHRyeSB0byBmaW5kIHNvbWUgdGltZSB0byBkaWcgaW50byB0
aGVtLgo+Pj4KPj4+IFdoaWxlIHdlJ3JlIGF0IGl0LCB3aXRoIC1XZXJyb3Igc29tZXRoaW5nIGxp
a2UgdGhpcyBpcyByZWFsbHkgZnV0aWxlOgo+Pj4KPj4+IGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1k
Z3B1L2FtZGdwdV9vYmplY3QuYzogSW4gZnVuY3Rpb24g4oCYYW1kZ3B1X2JvX3N1cHBvcnRfdXN3
Y+KAmToKPj4+IGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9vYmplY3QuYzo0OTM6
Mjogd2FybmluZzogI3dhcm5pbmcKPj4+IFBsZWFzZSBlbmFibGUgQ09ORklHX01UUlIgYW5kIENP
TkZJR19YODZfUEFUIGZvciBiZXR0ZXIgcGVyZm9ybWFuY2UgdGhhbmtzIHRvIHdyaXRlLWNvbWJp
bmluZyBbLVdjcHAKPj4+IMKgwqAgNDkzIHwgI3dhcm5pbmcgUGxlYXNlIGVuYWJsZSBDT05GSUdf
TVRSUiBhbmQgQ09ORklHX1g4Nl9QQVQgZm9yIGJldHRlciBwZXJmb3JtYW5jZSBcCj4+PiDCoMKg
wqDCoMKgwqAgfMKgIF5+fn5+fn4KPiAKPiBBaCwgeWVzIGdvb2QgcG9pbnQhCj4gCj4+Cj4+IEkg
aGF2ZSBiZWVuIHdvbmRlcmluZyBpZiBhbGwgdGhvc2UgI3dhcm5pbmcgImVycm9ycyIgc2hvdWxk
IGVpdGhlcgo+PiBiZSByZW1vdmVkIG9yIGJlIHJlcGxhY2VkIHdpdGggIiNwcmFnbWEgbWVzc2Fn
ZSIuCj4gCj4gV2VsbCB3ZSBzdGFydGVkIHRvIGFkZCB0aG9zZSB3YXJuaW5ncyBiZWNhdXNlIHBl
b3BsZSBjb21waWxlZCB0aGVpciBrZXJuZWwgd2l0aCBDT05GSUdfTVRSUiBhbmQgQ09ORklHX1g4
Nl9QQVQgYW5kIHdhcyB0aGVuIHdvbmRlcmluZyB3aHkgdGhlIHBlcmZvcm1hbmNlIG9mIHRoZSBk
aXNwbGF5IGRyaXZlciB3YXMgc28gY3JhcHB5Lgo+IAo+IFdoZW4gdGhvc2Ugd2FybmluZyBub3cg
Z2VuZXJhdGUgYW4gZXJyb3Igd2hpY2ggeW91IGhhdmUgdG8gZGlzYWJsZSBleHBsaWNpdGx5IHRo
ZW4gdGhhdCBtaWdodCBub3QgYmUgYmFkIGF0IGFsbC4KPiAKPiBJdCBhdCBsZWFzdCBwb2ludHMg
cGVvcGxlIHRvIHRoaXMgc2V0dGluZyBhbmQgbWFrZXMgaXQgcmVhbGx5IGNsZWFyIHRoYXQgdGhl
eSBhcmUgZG9pbmcgc29tZXRoaW5nIHZlcnkgdW51c3VhbCBhbmQgbmVlZCB0byBrZWVwIGluIG1p
bmQgdGhhdCBpdCBtaWdodCBub3QgaGF2ZSB0aGUgZGVzaXJlZCByZXN1bHQuCj4gCgpUaGF0IHNw
ZWNpZmljIHdhcm5pbmcgaXMgc3Vycm91bmRlZCB3aXRoICIjaWZuZGVmIENPTkZJR19DT01QSUxF
X1RFU1QiCnNvIGl0IGRvZXNuJ3QgcmVhbGx5IG1hdHRlciBiZWNhdXNlIGl0IGRvZXNuJ3QgY2F1
c2UgdGVzdCBidWlsZCBmYWlsdXJlcy4KT2YgY291cnNlLCB3ZSBjb3VsZCBkbyB0aGUgc2FtZSBm
b3IgYW55ICN3YXJuaW5nIHdoaWNoIGRvZXMgbm93CmNhdXNlIGEgdGVzdCBidWlsZCBmYWlsdXJl
LgoKR3VlbnRlcgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5v
cmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNj
dgo=
