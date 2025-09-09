Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3778ACAC58E
	for <linux-riscv@archiver.kernel.org>; Tue,  9 Sep 2025 17:26:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WQKrR3u7jpL7QpMOis7dkuWifxXmTC3ozaXmA1yXPZs=; b=spE7zHnWR3+fiG
	1Eff9ehxH/+BJgHJI3XclFJ8PdT/XGSgzTE3Gm1vA8mz8J2g8ph9VAD6U+8jlfiUsSiiAsVL+jBOr
	M45mlGGggl06iAvb8nNwTPJAjoQwPaxhTN7YS8D4f5B4bs5pgzvnYOv8PpcUsZhO5rGGV5eSdWTmw
	NQPeO16m3l45EoSaH35cvwvm3y2nef13z3YORvksU3tScI48ixaQIM428Q1IH1fstOZCB97DUPc7F
	v94QbZ0FI+l8lH/mKk5e6X7Q/X1Qo7ofxo2vbXxuEjdJj2bccgQkPEU8/EgtukM8nJ3NSBrTtPp4k
	iP32E21HRr9GoA371bfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uw26N-000000094ba-0GBy;
	Tue, 09 Sep 2025 17:25:55 +0000
Received: from mail-lj1-x232.google.com ([2a00:1450:4864:20::232])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uw14w-00000008U33-0adj
	for linux-riscv@lists.infradead.org;
	Tue, 09 Sep 2025 16:20:23 +0000
Received: by mail-lj1-x232.google.com with SMTP id 38308e7fff4ca-336dd55aae1so52347551fa.1
        for <linux-riscv@lists.infradead.org>; Tue, 09 Sep 2025 09:20:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1757434820; x=1758039620; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/97m0jy8CzoHwIZcKBQ1zrt0w1+wQwdE+fGFa7+7SJw=;
        b=hVfaTM2jr5UcW3EphSn6SLIqBz5y9oFHzjAIfkQNzIozMbVFiHaPbo8M+7WgPLYVsh
         T8JNFyWmwb0daZ6BZmsh/9tKhT6vZnMMUToXbMpwEaOhJQXoqHTIOu5BMeKKW8Tei6zd
         AiYvAdsQrrknKGyVgEoAmqv7jqTDbeG2YRrONUNAbeGZYwQQ69jwzN1cW3KFsD4bR5rX
         wlaPdPZu30IezctiCpIvsp/T9/Mf+poDaYilfLxnfoBbTmEhCaFht3ld0CNiO65CMDrN
         nnHv8K54IVyauZmQ0BbUX+8LZfGtQQ4GyhFqKKfRfgGvt8G3pIQtkqXlyG3skZ8jTDCP
         vGJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757434820; x=1758039620;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/97m0jy8CzoHwIZcKBQ1zrt0w1+wQwdE+fGFa7+7SJw=;
        b=CKXlvnzMFhk3FxZ6O9clIn4RMw9g1ELEdFO/jnAyidJNFceG4fqI8D0DNU1Eu2oPUI
         /BC5J+b/YuliittKYl9/5jUsnL36Un3H6aA/fTJaJO58NHDbmJWrGc8NQBXkbw2mgdbr
         YVuLylNYSLSuiUP4zKV4pCf41ifeYTuVIKzbW/C1OIhrlPg/ELssPbYzGdSKIEcIxWPR
         WvjBU0w1+9475eDi8HhSGonCPHYGYZnCFd4XvcSrclArMfruKDxrV0+EMudWrzEJ6HH6
         rzTWYUdNMOuXdVlXMQ+IV2jWY4+tpNrZy5e/95acXDAZpNGmhVW30GrZx5azXElZBMNm
         caaQ==
X-Forwarded-Encrypted: i=1; AJvYcCVPfbQ7NWxj6giFTFaQeZRf8xpE0EOKHEWIu1hEq+UoSvjC1c1qKrgJ0Me2jUixD0YPttzMLuFP73bWXg==@lists.infradead.org
X-Gm-Message-State: AOJu0YzvMB4smlx61r7lWom1x+C0k4KTI6AUcpAE7ZPFmIEeqcXx95o9
	PjplXqfhs1bsbLOGto+Jv2Zc13NDUFlIHCoAMIKR63CfHqsHhIPKZxmUzSZajuQKL8pSDL2ajdr
	psfmc7TzTHR5mTgHB1LOZbNRWpfW9aiBPoB6MQMsm7A==
X-Gm-Gg: ASbGncu3PYGQEteNawlpq8j44pQe4zXg7VtXBcWMgh9qZpJqu18J5bFM4oZZaJEVx3O
	7qIS2lEbwmtS2djLUW4rjk3knazTLlM1O1DmELM3b5cHS8TEsCRkeZ1aS6GVXy3Osht0XQXQQsc
	/jFhr3q8AISdeRlMXDNTKevQ4seQryTiOp/JmNtCTXTPnda0SXD2piF1SGdEoJTKDyPGsSmmYc4
	3fnRN0F1+4DmysSQx7qEI0k05d8SvRgbuI07Cnqi58PHeoh5w==
X-Google-Smtp-Source: AGHT+IEztBpigh5RxbO1CBt/5KgEHGRrHXuTWtPssLeYdALPuaphhHGsx19aeCNSyhIa3AeA3fW9VXpZoFoDSTU49vc=
X-Received: by 2002:a2e:be08:0:b0:337:e3e0:39fc with SMTP id
 38308e7fff4ca-33b51b18984mr33377121fa.21.1757434819790; Tue, 09 Sep 2025
 09:20:19 -0700 (PDT)
MIME-Version: 1.0
References: <20250909-gpio-mmio-gpio-conv-part4-v1-0-9f723dc3524a@linaro.org>
 <20250909-gpio-mmio-gpio-conv-part4-v1-13-9f723dc3524a@linaro.org>
 <aMAP9hAWars0T83r@smile.fi.intel.com> <CAMRc=MeLTGq8Qu2aT43tkt3vaYCSaJPJPLmaUQ1SAyD_OgVr_g@mail.gmail.com>
 <aMAn4MM_Fs8q8qwj@smile.fi.intel.com> <CAMRc=Mdr4oW2d7XZ90rRr_fKC7WToz72v=_kW-s8=Urd0g8k3g@mail.gmail.com>
 <aMAve1MbONmKVjjg@smile.fi.intel.com> <aMAv3STeZUdSQ14p@smile.fi.intel.com>
 <CAMRc=MeA87p0QAzq_3MACQM90MhN0eRccr7u-VzcfyP8b90AaQ@mail.gmail.com>
 <aMAzZAbNwrRTgFi-@smile.fi.intel.com> <CAMRc=Mfn7atHTqKc9nMTQ19ZserqeNi3skb-QhG3CVdEhmr0gg@mail.gmail.com>
 <CAHp75VdDAJO3+NPp29GnqL=C5m7tdWbyYvNFax=Dh+dG49YAnA@mail.gmail.com> <CAHp75VffDLfvdVhnzZk6V6a9eXq4R0ZBYLUw3S=g0ABqozhWFQ@mail.gmail.com>
In-Reply-To: <CAHp75VffDLfvdVhnzZk6V6a9eXq4R0ZBYLUw3S=g0ABqozhWFQ@mail.gmail.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 9 Sep 2025 18:20:07 +0200
X-Gm-Features: Ac12FXz3JLlhRsOgq8cOPinTet2g1mbuWxd9zMtxwsTKBrX27rDe6FL8vxMW4vc
Message-ID: <CAMRc=Mf0sXnak0Ov3bwgv_xVVvw+CxA1iAcvDv+B4a155HZq2w@mail.gmail.com>
Subject: Re: [PATCH 13/15] gpio: sodaville: use new generic GPIO chip API
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Andy Shevchenko <andriy.shevchenko@intel.com>, Linus Walleij <linus.walleij@linaro.org>, 
	Keguang Zhang <keguang.zhang@gmail.com>, Alban Bedel <albeu@free.fr>, Doug Berger <opendmb@gmail.com>, 
	Florian Fainelli <florian.fainelli@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Samuel Holland <samuel.holland@sifive.com>, 
	Yixun Lan <dlan@gentoo.org>, Andy Shevchenko <andy@kernel.org>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250909_092022_196996_C19751D0 
X-CRM114-Status: GOOD (  25.18  )
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

T24gVHVlLCBTZXAgOSwgMjAyNSBhdCA1OjI24oCvUE0gQW5keSBTaGV2Y2hlbmtvCjxhbmR5LnNo
ZXZjaGVua29AZ21haWwuY29tPiB3cm90ZToKPgo+IE9uIFR1ZSwgU2VwIDksIDIwMjUgYXQgNjox
NeKAr1BNIEFuZHkgU2hldmNoZW5rbwo+IDxhbmR5LnNoZXZjaGVua29AZ21haWwuY29tPiB3cm90
ZToKPiA+IE9uIFR1ZSwgU2VwIDksIDIwMjUgYXQgNTowNeKAr1BNIEJhcnRvc3ogR29sYXN6ZXdz
a2kgPGJyZ2xAYmdkZXYucGw+IHdyb3RlOgo+ID4gPiBPbiBUdWUsIFNlcCA5LCAyMDI1IGF0IDQ6
MDLigK9QTSBBbmR5IFNoZXZjaGVua28KPiA+ID4gPGFuZHJpeS5zaGV2Y2hlbmtvQGludGVsLmNv
bT4gd3JvdGU6Cj4gPiA+ID4gT24gVHVlLCBTZXAgMDksIDIwMjUgYXQgMDM6NTY6NDFQTSArMDIw
MCwgQmFydG9zeiBHb2xhc3pld3NraSB3cm90ZToKPiA+ID4gPiA+IE9uIFR1ZSwgU2VwIDksIDIw
MjUgYXQgMzo0N+KAr1BNIEFuZHkgU2hldmNoZW5rbwo+ID4gPiA+ID4gPGFuZHJpeS5zaGV2Y2hl
bmtvQGludGVsLmNvbT4gd3JvdGU6Cj4KPiAuLi4KPgo+ID4gPiA+ID4gPiBUQkgsIEkgdGhpbmsg
dGhvc2UgNiBhbGwgbWFkZSB0aGUgc2FtZSBtaXN0YWtlLCBpLmUuIHRoaW5raW5nIG9mIHRoZSBj
b21wb3VuZAo+ID4gPiA+ID4gPiBsaXRlcmFsIGFzIGEgY2FzdC4gV2hpY2ggaXMgbm90IQo+ID4g
PiA+ID4KPiA+ID4gPiA+IFdoYXQgZG8geW91IHN1Z2dlc3Q/Cj4gPiA+ID4KPiA+ID4gPiBXcml0
ZSBpdCBpbiBsZXNzIG9kZCB3YXkgOi0pCj4gPiA+ID4KPiA+ID4gPiBmb28gPSAoc3RydWN0IGJh
cikgeyAuLi4gfTsKPiA+ID4KPiA+ID4gSSBkb24ndCBnZXQgeW91ciByZWFzb25pbmcuIHR5cGVv
ZigpIGl0c2VsZiBpcyB3ZWxsIGVzdGFibGlzaGVkIGluIHRoZQo+ID4gPiBrZXJuZWwgYW5kIGRv
ZXNuJ3QKPiA+ID4KPiA+ID4gZm9vID0gKHN0cnVjdCBiYXIpeyAuLi4gfTsKPiA+ID4KPiA+ID4g
ZXZhbHVhdGUgdG8gdGhlIHNhbWUgdGhpbmcgYXMKPiA+ID4KPiA+ID4gZm9vID0gKHR5cGVvZihm
b28pKXsgLi4uIH07Cj4gPiA+Cj4gPiA+ID8gSXNuJ3QgaXQgc3RpbGwgdGhlIHNhbWUgY29tcG91
bmQgbGl0ZXJhbD8KPiA+Cj4gPiBJdCBtYWtlcyBpdCBzbywgYnV0IHR5cGVvZigpIHVzdWFsbHkg
aXMgdXNlZCBmb3IgY2FzdHMgYW5kIG5vdCBmb3IKPiA+IGNvbXBvdW5kIGxpdGVyYWxzLiBUaGF0
J3MgKHVzYWdlIHR5cGVvZigpIGZvciBjb21wb3VuZCBsaXRlcmFscykgd2hhdAo+ID4gSSBhbSBh
Z2FpbnN0IGluIHRoaXMgY2FzZS4KPgo+IEZXSVcsIGJyaWVmIGdvb2dsaW5nIHNob3dlZCB0aGF0
IG5vYm9keSAob2theSwgSSBoYXZlbid0IGZvdW5kIHlldAo+IHJlZGRpdC9TTy9HQ0Mgb3IgTExW
TSBkb2N1bWVudGF0aW9uKSB1c2VzIHR5cGVvZigpIGZvciBjb21wb3VuZAo+IGxpdGVyYWxzLiBT
bywgdGhpcyBtYWtlcyBtZSBmZWVsIHJpZ2h0LCB0aGF0IHRoZSBmb3JtIG9mIHR5cGVvZigpIGlz
Cj4gd2VpcmQgYW5kIHdvcmtzIGR1ZSB0byB1bmtub3duIHJlYXNvbnMuIEFueSBwb2ludGVycyB0
byB0aGUKPiBkb2N1bWVudGF0aW9uIHlvdSByZWFkIGFib3V0IGl0Pwo+CgpPayBJJ2xsIGNoYW5n
ZSBpdC4gSSBhbHNvIG5lZWQgdG8gY2hhbmdlIGl0IGluIGV4aXN0aW5nIHBhdGNoZXMgdGhhdAph
bHJlYWR5IGxhbmRlZCBpbiBuZXh0IHRoZW4uCgo+ID4gPiA+ID4gQW5kIGFyZSB3ZSBub3QgYWxs
b3dlZCB0byB1c2UgQzk5IGZlYXR1cmVzIG5vdyBhbnl3YXk/Cj4gPiA+ID4KPiA+ID4gPiBJdCdz
IGZpbmUsIGl0J3Mgbm90IGFib3V0IHRoZSBDIHN0YW5kYXJkIG51bWJlci4KPgo+IEUuZy4sIGh0
dHBzOi8vZ2NjLmdudS5vcmcvb25saW5lZG9jcy9nY2MtMTUuMS4wL2djYy9Db21wb3VuZC1MaXRl
cmFscy5odG1sCj4gKDguMS4wIGlzIHRoZSBzYW1lKS4KPgoKSSBnZXQgaXQsIEkgdW5kZXJzdG9v
ZCBpbmNvcnJlY3RseSBob3cgdGhleSB3b3JrLCBubyBuZWVkIHRvIHJ1YiBpdCBpbi4gOikKCkJh
cnQKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4
LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6
Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
