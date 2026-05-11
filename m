Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E92FECD37AC
	for <linux-riscv@archiver.kernel.org>; Mon, 11 May 2026 08:02:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=x+Bt6Ih8JG/tHeTZIwaPMgRzngZCNZSZ8PNUwBi1Qe0=; b=e1g35pg9k4mnRn
	D6oJsYqFF5YNOwP+H93nMGfYI3KdU3boX/kgaMnUZx0rwUhM8D4w6eVVTrVBdJSTS5DoPN82uYfZh
	HFIphft2IpK7u9YidWsRp24wxI5MWBdaWsHMV+sWOt4wmJ5jtiXRKbODmS6liYOi8IbuKGKiowheW
	zhePRubO+SLWrCWVGAzvQdsBabcU5lkG1BndNvqxGkxWPqEgh/CPExCzP2xSflm/i0IilQ7XV4wGk
	ZW7HCze6nOUQpbsUdK7ZE/jkA60GCKWvV0RwhO2uxXzCbnE86kAr5CSRAcxbWZPNc2NaCUejLcf+c
	1Vg0cOzxfIrGPW0b9YeQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMLag-0000000Cglx-07X0;
	Mon, 11 May 2026 08:02:14 +0000
Received: from mail-yx1-xb12d.google.com ([2607:f8b0:4864:20::b12d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMLad-0000000CgkG-28hq
	for linux-riscv@lists.infradead.org;
	Mon, 11 May 2026 08:02:13 +0000
Received: by mail-yx1-xb12d.google.com with SMTP id 956f58d0204a3-65c09c1d000so3898875d50.1
        for <linux-riscv@lists.infradead.org>; Mon, 11 May 2026 01:02:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778486530; cv=none;
        d=google.com; s=arc-20240605;
        b=br4ySLDRaQSj94nXImpIKuD88oWxRrrZ+/Uw/IdUjl6dP/TOhKmFd+IEio54aaE7bI
         UXh+Pfkf49I481nVONkYyOE2laH7g8166HNeSTCdZMucgIbNPAoM9zva73hhekPgYv3q
         U8V3qRaLJsfFbOqZX7ka/LuOdrvgdH93AoFtl4UETURlh4RqrxJwcAerL96HqQ9mvlSC
         1adwv809cj7ZpmZ0MsaEqHJBWum+JfkodxVg22Q4OkDxOp1gGx9UqAAolkdMhukpNGoE
         54aPly1UhCcWoYwqEGi2/rRuyD1EKp4uiLxScX6DULhYWT7Mihh+uo3BZEx+xlbSrKiK
         xOUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=sW6azkXa80yI0rJXwT2HYG22XiYQ/sn39R3AWBjjzho=;
        fh=o8U1/+t0xXW9mt+gUVUjCYnJplQr8CjZk7zLKSucOuQ=;
        b=QTb4rn6MtoipNgtUu5JsaAHlEn2dWVeuTW/Cy7NNl81Pk7RIy6bKGddi8yT6EP6EQU
         ANGvUy8edO+ESCGGNWcuD1Wt2DSLZ7ex/QzJUOBqlw6ttB886Hff0fjIb/v76KOo65yg
         Lw6LLz0Ost7FC5qTzxcXnS1s0TT/aSCr4gHUdE5ApZdmXVVlDFmtt7r3qjQ83zwtAXP0
         bIu4+A9dXvMjgjV/PkVvUm5VDrvA22IMnch/5/K8y2kFoCvIQVTs/NhfZlWrqvFI4OIQ
         Jnfz70BgSiFnDSy83w+4W0Zpfdu5N2OAOo2Gl3r+STX9xLFlyk76mYrR6MAl++AwB3Js
         n/0Q==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778486530; x=1779091330; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sW6azkXa80yI0rJXwT2HYG22XiYQ/sn39R3AWBjjzho=;
        b=qaAMd0rRz/e9082a3Gqu/zO/v5QhcIUcZ7tey17YhCKM55kGZBDJAlqfvPIS9hqNsb
         hz/5IfLzmRpRDz80xmpfHCXeGoC/mFdwDdfwLBvja81KxIGNTgPryZdvxoql7SBaa0so
         CRqxP0qEgC8aIB4pqfnt18HN0ggNZTTOrfkhXv8CcUW2CSVa8UGeErMT+yubAtaCLZeW
         7/2PswDue1VRH13++ajyQcqDCSSK15uZxHv6QEDR1B8zaEVhTlZ5KctYXtXMaMprp3Y7
         /pdcEXLyuO8KWF/+bVexnHPI7kERnARqgxDqq3yc2N4R4RKUhpyMfADk6xw2lr5zR5Zk
         7zwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778486530; x=1779091330;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=sW6azkXa80yI0rJXwT2HYG22XiYQ/sn39R3AWBjjzho=;
        b=cDSO24KajyeTXnIMVgBir+MEoZp0JZO4A5IBbB05VL3M0G9LEc6mhoX3cj8PnxCON8
         33ztPS2u9xhX+6nzgPqHmbl6kgFXrdPgN56mGgVyeOd8A/anlJQ9d4ptigTi5YUWrWKB
         /dtHla0+BRKcYdUMxwjDt1e0fgZulY+z7sQCnu6dwebEt8ViAXeCtoHZiA7voPTib6mt
         6hZVNsEfawYiNGTr0o2THjd4CRQTe1EFH0zZS1lcUs7lUSmAJxqVzTb+hBFvbMUxlpzu
         w6xqwKSmCJOEyn1IAHB08DC9o9W0qEgufGxuI1x+694LYL+puuUbE2ucA0vcBEb7q2aq
         ZihA==
X-Forwarded-Encrypted: i=1; AFNElJ/H4qQdsCYRoYhcZauiPY+rjFmJnE0DSZ9+4coWV4JpOP5nYe41n4Z0JpQz5Y9cTNYNHrgyaKY1/pGkCA==@lists.infradead.org
X-Gm-Message-State: AOJu0YwuDZ/crtcmcwNvfnBN2uMQ+klTiCimdQ7YYMnLJI1YJW/Ub8JX
	jIS1pIcOEOvjKg8/IzeOJSnQiVqVQeISeq7xkMhxWeCn2B20xmoOS2yigy1I4HnAAZGf3R8CrJh
	Tolyf+TyBFcnYmdqR8J6REnLwgbA04+4=
X-Gm-Gg: Acq92OFFTIQ5SKe4EQNlvLS65/Kh+S+IA/V0tqsxWSRymxfsuLmjYoCS1YttwZpWi2n
	C5QGU/eN8mqgwv3vZ0F3+pWhSAhH5Iq51ScaV2h0ZVthMNIyxqqrBQG97wgZJij8BD8qILe6PQ+
	YPtZ0wjrPZIpqRlyEqA1HFZmua7j24+bIkZDBZVdlO9AhqCS5m/4V/rRsXx1l2McwDCRc583ASt
	IRfilDmE+qTe8EV0eoe2SredeOVcWxOURnfgQb0vhmbvey59+IQCUF49VYvmLK6jGnbld5POntb
	9O19Ridl
X-Received: by 2002:a05:690e:1905:b0:65c:6ffb:3038 with SMTP id
 956f58d0204a3-65d7e822e64mr13587707d50.17.1778486529994; Mon, 11 May 2026
 01:02:09 -0700 (PDT)
MIME-Version: 1.0
References: <20260413-orangepi-sd-card-uhs-v8-0-c21c40ec16d0@gmail.com>
 <20260413-orangepi-sd-card-uhs-v8-8-c21c40ec16d0@gmail.com>
 <CA+Xcp4nY9GVMOmtMG-PNhY2vqP4Cc_amAMSa+M3vuDjWUkuCHw@mail.gmail.com>
 <CABdCQ=OsPva9=YPdBd=3HW1OO7=_zJtpXjvaiA0WLEDT5Scs_Q@mail.gmail.com>
 <DICDTHYTPDSP.210EBVHTQ6966@linux.dev> <20260508225341-GKB3590877@kernel.org> <20260508231051-GKC3590877@kernel.org>
In-Reply-To: <20260508231051-GKC3590877@kernel.org>
From: Iker Pedrosa <ikerpedrosam@gmail.com>
Date: Mon, 11 May 2026 10:01:58 +0200
X-Gm-Features: AVHnY4Jd8hC8nSk1elUyO1V0E_fXdX8QCiSMcWMOA11otgjNrlNzYjy97ZtHNls
Message-ID: <CABdCQ=NFuW-XBK2zrw2TUFrEg0Q1Wf3_qS28zT3v-Hfud8mkew@mail.gmail.com>
Subject: Re: [PATCH v8 8/9] riscv: dts: spacemit: k1-bananapi-f3: add SD card
 support with UHS modes
To: Yixun Lan <dlan@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260511_010211_554494_3C2420CF 
X-CRM114-Status: GOOD (  19.83  )
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
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Albert Ou <aou@eecs.berkeley.edu>, Michael Opdenacker <michael.opdenacker@rootcommit.com>, Alexandre Ghiti <alex@ghiti.fr>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Troy Mitchell <troy.mitchell@linux.dev>, linux-mmc@vger.kernel.org, Margherita Milani <margherita.milani@amarulasolutions.com>, Ulf Hansson <ulf.hansson@linaro.org>, Adrian Hunter <adrian.hunter@intel.com>, linux-riscv@lists.infradead.org, Palmer Dabbelt <palmer@dabbelt.com>, Javier Martinez Canillas <javierm@redhat.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, spacemit@lists.linux.dev, Paul Walmsley <pjw@kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

RWwgc8OhYiwgOSBtYXkgMjAyNiBhIGxhcyAxOjEwLCBZaXh1biBMYW4gKDxkbGFuQGtlcm5lbC5v
cmc+KSBlc2NyaWJpw7M6Cj4KPgo+IE9uIDIyOjUzIEZyaSAwOCBNYXkgICAgICwgWWl4dW4gTGFu
IHdyb3RlOgo+ID4gSGkgSWtlciwgVHJveSwKPiA+Cj4gLi4KPiA+IEkgd291bGQgb2JqZWN0IHRv
IGFkZCBDT05GSUdfSTJDX0sxIGFzIGhhcmQgZGVwZW5kZW5jeSwgdGhlIHJlYXNvbiBpcwo+ID4g
dGhhdCB0aGUgc3BhY2VtaXQgc2RoY2kgZHJpdmVyIChzZGhjaS1vZi1rMS5jKSBoYXMgbm8gdXNl
ZCBpMmMKPiA+IGFwaS9mdW5jdGlvbiwgaXQncyBqdXN0IG5lZWQgSTJDIGZ1bmN0aW9uIHZpYSBh
biBpbmRpcmVjdCByZXF1aXJlbWVudCwKPiA+IHdoaWNoIHNkaGNpIC0+IHJlZ3VsYXRvcihwMSkg
LT4gaTJjLCBiZXNpZGVzLCBmcm9tIHRoZSBoYXJkd2FyZSBkZXNpZ24KPiA+IHBlcnNwZWN0aXZl
LCBpdCBqdXN0IGhhcHBlbnMgdGhhdCBLMSB1c2UgUDEodmlhIEkyQykgYXMgUE1JQywgaXQncwo+
ID4gdG90YWxseSBwb3NzaWJsZShldmVuIGluIHRoZW9yeSkgdG8gdXNlIG90aGVyIFBNSUMgYXMg
cG93ZXIgc3VwcGx5Cj4gPiBjb250cm9sIHdoaWNoIG1heSBub3QgYmUgSTJDIGludGVyZmFjZSAo
bWF5YmUgdXNlIFNQSSwgZm9yIGV4YW1wbGUpCj4gPgo+ID4gSWYgd2Ugd2FudCB0byBzb2x2ZSB0
aGlzIG1vcmUgZ3JhY2VmdWxseSwgSSdtIGluIGZhdm9yIHRvIGFkZCBleHBsaWN0Cj4gPiBvcHRp
b24gZW5hYmxlZCBpbiBkZWZjb25maWcuLgo+ID4KPiBvciBJIHRoaW5rIGl0J3MgYmV0dGVyIHdl
IGRvIHRoaXMgd2F5Li4KPgo+ICsrKyBiL2RyaXZlcnMvaTJjL2J1c3Nlcy9LY29uZmlnCj4gQEAg
LTc5NCw2ICs3OTQsNyBAQCBjb25maWcgSTJDX0sxCj4gICAgICAgICB0cmlzdGF0ZSAiU3BhY2Vt
aVQgSzEgSTJDIGFkYXB0ZXIiCj4gICAgICAgICBkZXBlbmRzIG9uIEFSQ0hfU1BBQ0VNSVQgfHwg
Q09NUElMRV9URVNUCj4gICAgICAgICBkZXBlbmRzIG9uIE9GCj4gKyAgICAgICBkZWZhdWx0IEFS
Q0hfU1BBQ0VNSVQKClRoYW5rIHlvdSBhbGwgZm9yIHRoZSBmZWVkYmFjayEgSSBhZ3JlZSB0aGF0
IGVuYWJsaW5nIEkyQ19LMSBieQpkZWZhdWx0IG1ha2VzIHNlbnNlIGZvciB0aGUgdXNlciBleHBl
cmllbmNlLgoKVG8ga2VlcCB0aGlzIHBhdGNoc2V0IGZvY3VzZWQgYW5kIGF2b2lkIGNyb3NzLXN1
YnN5c3RlbSBjb21wbGV4aXR5LApJJ2xsIHNlbmQgdGhlIEkyQyBkZWZhdWx0IGNvbmZpZ3VyYXRp
b24gY2hhbmdlIGFzIGEgc2VwYXJhdGUgcGF0Y2ggdG8KdGhlIEkyQyBtYWludGFpbmVycyBhZnRl
ciB0aGlzIHNlcmllcyBsYW5kcy4KClRoaXMgd2F5IHdlIGNhbiBnZXQgdGhlIFNEIGNhcmQgc3Vw
cG9ydCBtZXJnZWQgd2l0aG91dCBkZWxheXMgd2hpbGUKc3RpbGwgc29sdmluZyB0aGUgZGVwZW5k
ZW5jeSBpc3N1ZSBwcm9wZXJseS4KCj4KPgo+IC0tCj4gWWl4dW4gTGFuIChkbGFuKQoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFp
bGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmlu
ZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
