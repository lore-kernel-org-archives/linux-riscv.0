Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6866D1CDD0
	for <linux-riscv@archiver.kernel.org>; Thu,  4 Dec 2025 05:01:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ze6C7pOxfpCYPAmwTPcuHJhyKAo3MfoDglfMzaulHCI=; b=1RCNBS3nkuG3/R
	GMLp6EI7EsICq3BgmGx60pTios07Hmg3pI44C7SI1PmUQt5tWSTVTKFes5YkxMTqLzTTGlwoYx7FE
	M+ioL/Q7JMs482828iCBqh6jNFEg0SoH8BP7j533TXqFUIvWYUBV4FSWOh5mOl9hGxeqANAW6EHgd
	za+w8guZ87Mw7RoCinL2De1E+IZBHIlI/aBJA3RQ++VTln9Z6Bh7XxrYeFbZNPGEtfwwxY9MbafxS
	mjAjOgdpT1qU8lg+FcViz1THS0d9bZMqL9jonRAGl9fHYc1OH1s1IVQKs/akQG3WLbNbV1hNT0j0c
	VCMG5oV9zwWGdiX0+CSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vR1Sg-00000007Tvp-1hiW;
	Thu, 04 Dec 2025 05:01:02 +0000
Received: from mail-oa1-x36.google.com ([2001:4860:4864:20::36])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vR1Sd-00000007TuU-1kY5
	for linux-riscv@lists.infradead.org;
	Thu, 04 Dec 2025 05:01:01 +0000
Received: by mail-oa1-x36.google.com with SMTP id 586e51a60fabf-3ec314aaae5so422666fac.0
        for <linux-riscv@lists.infradead.org>; Wed, 03 Dec 2025 21:00:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1764824452; x=1765429252; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ynb1Pz7S4Rh+mM2HiZZ5on0pKnh8R/gdfodATPNKL0A=;
        b=Pnt72wQxUPHT32UBmZQCqGpMIlEbzsE33E6u+dJUDPTj2YvaXGYxbcl5skaNdFkq2N
         Y/noc7Bp2t/NG4DEkCBmir80t6vYa2+dOesQiX/dT3g3zU62nrhOvP/5FmyI4gjKU8ou
         u8tD6Lq+M/DcRgpbnp+8d7PuA4Mce6MMyH6vEUSSDzRuKK0XNJ2HRDkx25LcfEpKyZ/G
         sKra5jj+d5qTqw0PuCiwzniyiwnqU8/Fi21hDcq0EEkvZGBlpkXef9s+tw26EpPxEdN6
         Bo3QCrSAgmOluQz646ey1+9jZr1+OfuDV5C27xNMB0hyVqTbDBKf6kA6eS/Nsn6G17Hl
         i51A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764824452; x=1765429252;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ynb1Pz7S4Rh+mM2HiZZ5on0pKnh8R/gdfodATPNKL0A=;
        b=Lcsr9thiEeJccQEeF8Kctk5ZeWIDDLVDSuRC2tQ9/4zjGVxo298/02TzLVql5DDiBB
         p3zYDQUDR5u+yLxRXl4uZVypBkW7mIUawA/dFHL28pAQoK1Kz1YPXiDfaA0YeTuSQ8LU
         9Qn9kJU1gw0+xlIRhS5SXt7US859+4eEI5OjSFS2ONtdUNXjgqgBmImnIdqfByJlDZMc
         ueBi0aAmiy1HG1X6yx4EFsPglTtE+OBEi4Glg1S4saGqfj0uhIsmAMOoTgondgLU9xFM
         tvOzHsbg41+HdAHzVMPfc1LKRntLnWNhIwvU34qv+A8Tn65/5AoYajJHIsopMGSmxP5g
         MY5Q==
X-Forwarded-Encrypted: i=1; AJvYcCWgLx+s2j346NAKnN3u6o2NycOx55KLcS/CcZ0Aae/h0Cylkn0+SG6jItwKUa4KFA0mlIL7rv/c7FsN7w==@lists.infradead.org
X-Gm-Message-State: AOJu0Yx6nMrye+edmUdOR0aGajsWlpcNBNqdUC4XqEi8PWXCvv0YR/zo
	aX97gsmWolJum8YpPCdbiPFnKKIhm1a12wS499T45c90DZU/jizkPQkkqrL+Q0BJdcIq7WdRjfX
	zNkosOglzIKNU6bWr07scsByiyxH0WYwhUtXdC2b8Gg==
X-Gm-Gg: ASbGncvHEdovQneG0UX35BlnGJiALXvaEaQgLzOAKGXph98F5J3lv33m0PxQi84/NHb
	2y+EPvkqEvKj45YVa/Mr2mGGROfXfbxI/dKiTFdEHXTHKfMBBi0ycB3bnNnCSHskfLhAZweftRZ
	xH+brMayNoqwHIlpLkDC1FoApEYMRAi6tAWnObFi1noGUalYnO2RSddV4W4SIZa8yOpX4pg2zCs
	oKK24RYzUtu35Bb9eiV5XPfAb+ihLj08lm+1eaqdqZDQtXBAbGibyZAY92svRMN5UX3m1BxoIwP
	LA==
X-Google-Smtp-Source: AGHT+IGs1i5jYMwbaLlrfd7bj2pB6zXQmPz0bH8HdsC7EIxuIEFzisuXnQAnT8qR0b61+0KWK9jUwDlnypRtY3EbS0o=
X-Received: by 2002:a05:6871:7426:b0:3d2:e13c:5ea7 with SMTP id
 586e51a60fabf-3f1693a56e9mr2970174fac.39.1764824452474; Wed, 03 Dec 2025
 21:00:52 -0800 (PST)
MIME-Version: 1.0
References: <20251114033243.76509-1-cuiyunhui@bytedance.com> <CAD=FV=Vh-guJS+5BAqhao9aECtkRFgoqEjpzhuDYEsRVqtVA6w@mail.gmail.com>
In-Reply-To: <CAD=FV=Vh-guJS+5BAqhao9aECtkRFgoqEjpzhuDYEsRVqtVA6w@mail.gmail.com>
From: yunhui cui <cuiyunhui@bytedance.com>
Date: Thu, 4 Dec 2025 13:00:40 +0800
X-Gm-Features: AWmQ_bm8VR4mmm7gM0qxlsCJG381p5n9-XFc6fATbqwFqWlsUG-TXpi8vcKmNZI
Message-ID: <CAEEQ3wmz=CHkbxZwyMHGTSeXj0OFjBskgzyEKeZHk9rNOWge+w@mail.gmail.com>
Subject: Re: [External] Re: [PATCH v6 0/2] Add HARDLOCKUP_DETECTOR_PERF
 support for RISC-V
To: Doug Anderson <dianders@chromium.org>
Cc: akpm@linux-foundation.org, alex@ghiti.fr, anup@brainfault.org, 
	aou@eecs.berkeley.edu, atish.patra@linux.dev, catalin.marinas@arm.com, 
	johannes@sipsolutions.net, lihuafei1@huawei.com, mark.rutland@arm.com, 
	masahiroy@kernel.org, maz@kernel.org, mingo@kernel.org, 
	nicolas.schier@linux.dev, palmer@dabbelt.com, paul.walmsley@sifive.com, 
	suzuki.poulose@arm.com, thorsten.blum@linux.dev, wangjinchao600@gmail.com, 
	will@kernel.org, yangyicong@hisilicon.com, zhanjie9@hisilicon.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251203_210059_761173_88983104 
X-CRM114-Status: GOOD (  15.34  )
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

SGkgQW5kcmV3LAoKT24gU2F0LCBOb3YgMTUsIDIwMjUgYXQgMzoyMeKAr0FNIERvdWcgQW5kZXJz
b24gPGRpYW5kZXJzQGNocm9taXVtLm9yZz4gd3JvdGU6Cj4KPiBIaSwKPgo+IE9uIFRodSwgTm92
IDEzLCAyMDI1IGF0IDc6MzPigK9QTSBZdW5odWkgQ3VpIDxjdWl5dW5odWlAYnl0ZWRhbmNlLmNv
bT4gd3JvdGU6Cj4gPgo+ID4gQWZ0ZXIgZGlzY3Vzc2lvbiBbMV0sWzJdLCBoYXJkbG9ja3VwX3Bl
cmYgY2Fubm90IGJlIGNvbXBsZXRlbHkgcmVwbGFjZWQgYnkKPiA+IHRoZSBoYXJkbG9ja3VwX2J1
ZGR5IGFwcHJvYWNoLCBzbyB0aGlzIHBhdGNoIGlzIHN0aWxsIGJlaW5nIHN1Ym1pdHRlZC4KPiA+
Cj4gPiB2MS0+djI6Cj4gPiBUaGUgY29udGVudHMgb2YgYXJjaC9hcm02NC93YXRjaGRvZ19obGQu
YyBhcmUgZGlyZWN0bHkgY29uc29saWRhdGVkIGludG8KPiA+IGtlcm5lbC93YXRjaGRvZ19wZXJm
LmMuCj4gPgo+ID4KPiA+IHYyLT52MzoKPiA+IEFkZCBDT05GSUdfV0FUQ0hET0dfUEVSRl9BREpV
U1RfUEVSSU9EIHRvIGVuY2xvc2UgdGhlIHBlcmlvZCB1cGRhdGUgbG9naWMsCj4gPiBzZWxlY3Qg
aXQgYnkgZGVmYXVsdCBvbiBhcm02NCBhbmQgcmlzY3YsIHdpdGhvdXQgYWZmZWN0aW5nIG90aGVy
IGFyY2hlcwo+ID4gbGlrZSB4ODYgYW5kIFBQQy4KPiA+Cj4gPiB2My0+djQ6Cj4gPiBQbGFjZSB0
aGUgbGluZSAic2VsZWN0IFdBVENIRE9HX1BFUkZfQURKVVNUX1BFUklPRCBpZiBIQVJETE9DS1VQ
X0RFVEVDVE9SX1BFUkYgJiYgQ1BVX0ZSRVEiCj4gPiBpbiB0aGUgS2NvbmZpZyBmaWxlcyBmb3Ig
YXJtNjQgYW5kIHJpc2N2IGluIG9uZSBsaW5lLCB3aXRoIG5vIGxpbmUgYnJlYWtzLgo+ID4KPiA+
IHY0LT52NToKPiA+IFJlbW92ZSBfX3dlYWsgZnJvbSBod19ubWlfZ2V0X3NhbXBsZV9wZXJpb2Qo
KQo+ID4KPiA+IHY1LT52NjoKPiA+IFJlbW92ZWQgdGhlIGRlcGVuZGVuY3kgb24gQ1BVX0ZSRVEg
Zm9yIFdBVENIRE9HX1BFUkZfQURKVVNUX1BFUklPRCBpbiBLY29uZmlnLCB3aGljaCBmaXhlcyB0
aGUKPiA+IGlzc3VlIHJlcG9ydGVkIGF0OiBodHRwczovL2xvcmUua2VybmVsLm9yZy9vZS1rYnVp
bGQtYWxsLzIwMjUxMDI0MDcwMS5lQjZyOTdWMy1sa3BAaW50ZWwuY29tLwo+Cj4gSSBoYXZlbid0
IHRyaWVkIGNvbXBpbGluZyB0aGlzIG15c2VsZiwgYnV0IGl0IHNlZW1zIGxpa2UgYW4gT0sKPiBz
b2x1dGlvbiBmb3IgdGhlIGNvbXBpbGUtdGltZSBlcnJvciB0byBtZS4KPgo+IC1Eb3VnCgpDb3Vs
ZCB5b3UgcGxlYXNlIGhlbHAgcmV2aWV3IGFuZCBtZXJnZSB0aGlzIGFnYWluPyBUaGFuayB5b3Uh
Cgo+CgpUaGFua3MsCll1bmh1aQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmlu
ZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9s
aW51eC1yaXNjdgo=
