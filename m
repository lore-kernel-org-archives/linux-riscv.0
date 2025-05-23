Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5187C3DA6D
	for <linux-riscv@archiver.kernel.org>; Fri, 23 May 2025 11:44:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Mm0yD+Y9dznlDI0Fi6xzy6arCsrSjEPtZdT/eWYMUYA=; b=3tjtOwhPUDGjeq
	jxwnLQiDHRZ8xbRjPpLfg2jZU0LP2SfOQaRreuiXJR+gzhmp83BlPpnTfYzCLBPju29Rpxqy/JUxF
	/ORpAyCymMLhuwP2hsNXFsjVFyalHO9L6DvI+U3J2hg9+b7Otka7ZPmewe2YEgOeUuF0viI+3JuvB
	9tBsptPiJUvoqfXYf2ORj8rjsiFAAl408UCVKPYeN7kMstID94Gj3Z+qF290FIas+ijQaqvG9urec
	mphiLMNotpCd7ekB9IZ9hV0IMBw4s6yiTUxPYYH2gOpmDRB9gmVDn5C344pjE01/UTPgbgF5553e2
	XF8Awqx0OiXGtYndsUrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uIQpP-00000003jhE-1yCT;
	Fri, 23 May 2025 11:44:43 +0000
Received: from mail-lj1-x22a.google.com ([2a00:1450:4864:20::22a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uIQk3-00000003jCG-2CPd
	for linux-riscv@lists.infradead.org;
	Fri, 23 May 2025 11:39:12 +0000
Received: by mail-lj1-x22a.google.com with SMTP id 38308e7fff4ca-30c416cdcc0so86106551fa.2
        for <linux-riscv@lists.infradead.org>; Fri, 23 May 2025 04:39:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1748000349; x=1748605149; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4c6XCcGeGI3Iz42ETVD1kWDpnOaknLRaew23lcoOgaw=;
        b=II+jdLL29JRkyDdHDoCfJEDZkpUFT4vUkJmxRd0OS9FLQQCyW5DSMxNy9+miClJ8KI
         lIEc/C3rlCQSjplF8tMOyW1uRBPEG1hDF8lqncxX4D05tIYk0IuFMbWgjo3X0VQ0uOOK
         S8axmZiZXvQ/5GEJ4oahlfxU7hpjfMPBFZC6iNad3okzIKzdo+j1G/XgXG95iqikXP4H
         vRhUK6BQS4VYdUH30/Zo6vOWMQ48uCWW2wev7rvZV3CDIEuHOzqWfub6jMKnhLXbeh9N
         VDxXwANg9S4yuHKmTcxcxov+26QKM2UA5iBXqWooSji87Rctmvxg0/UE9UYbQcYNQvsO
         sqsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748000349; x=1748605149;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4c6XCcGeGI3Iz42ETVD1kWDpnOaknLRaew23lcoOgaw=;
        b=iMHwfqGHJUmGk42GPbEA6p9tViz+dQe8V51KMr42i8922j5yswP6RV2BwAoWpc0LMz
         ux8YeshHTqKvWdkoF6cBu8fNUQS2vzL9Fcfl1jBi1muLylF1aEMqwN8mTlaS39rRQba2
         jqvtZs7EQQCtgMFfmi4ZPBef/1FBRSBgSHuM0jNI2CzC2BFVqFjdFITItV7VbOwg2a8Y
         M3zed6PwgARk+guZpai1SzyGatyw1Isr23Ly43DNsVnf5GQSSwySXpH12snBv6cKA3o7
         kE+U+wLkuFC+uz96tEXHhUXxD+rWL3VH2MIsTLcZGZeo8f4PBN3Dy3CVEbUCbSi2NOp/
         Z5ag==
X-Forwarded-Encrypted: i=1; AJvYcCWAL/QbYEwZ6dV9Jur3L0Cua7+n+hkr2uEY7mlCJj1rfyHaQINScYLE6l6dhXX6+G0phGzYCa/+t3wS6g==@lists.infradead.org
X-Gm-Message-State: AOJu0YwvaUY8S8W2pHtqMUM6YsbMy5VEsBaSfnbOWEM07JzuPmhSQX4e
	ipKlUJ2pXLKrBdr7RnU2PlAUV8OtO1aeTBF7yUxscbkkNjc6MbImY5XpVWteYPX+HVVe+S1GEq/
	5gfnxW0o12lhCedHvaSAW3yvJ+mFHBGFS0BXagSKzS+DLGerJbq0X
X-Gm-Gg: ASbGncsUZr0aUVOOKBRsuQC+NjmskzjoFyCohIFrcWsvGxf6sGIbwJIJi4w0u1AB9jL
	KRN1byMhweOVXQO+b5rYsUuU1EVU85E5hDkOpl6QsItxVzvy7CskLxrUsC5wd6Gocxs+NXo+rnP
	C9gpni8zsS8mxhzmsmPNdXvTdT/MN5Hv1n
X-Google-Smtp-Source: AGHT+IF2LOIg4O1xHRyi86CCrwvgJ2OS7m73hlziSd4ebNFqUGMO5r7pRVz549vYj95zmX/EW8KpI62SWz8WryNi6o8=
X-Received: by 2002:a05:651c:304f:b0:30b:b956:53e5 with SMTP id
 38308e7fff4ca-328096b7830mr78162091fa.12.1748000349503; Fri, 23 May 2025
 04:39:09 -0700 (PDT)
MIME-Version: 1.0
References: <20250511133939.801777-1-apatel@ventanamicro.com>
 <20250511133939.801777-14-apatel@ventanamicro.com> <aCGaKXOOWyM4JQMg@smile.fi.intel.com>
 <CAK9=C2U1rzSa42qMNqxfTtjAC5RiJrhwg_32_B86nT2+xJ4Qow@mail.gmail.com> <aC3e-IXYb68RoIyu@smile.fi.intel.com>
In-Reply-To: <aC3e-IXYb68RoIyu@smile.fi.intel.com>
From: Anup Patel <apatel@ventanamicro.com>
Date: Fri, 23 May 2025 17:08:57 +0530
X-Gm-Features: AX0GCFuikFsTk4gG8kf6GKZUp9UJZvUrFZuYjcduLBrZd3gwT8GH2kdzFPFBAPw
Message-ID: <CAK9=C2WMxdmGEY=4BSeR_20JXoLkYK-t55qd0K7w=qOqnAkkOQ@mail.gmail.com>
Subject: Re: [PATCH v3 13/23] irqchip: Add driver for the RPMI system MSI
 service group
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250523_043911_564167_17E34E1A 
X-CRM114-Status: GOOD (  14.66  )
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
Cc: Jassi Brar <jassisinghbrar@gmail.com>, Atish Patra <atish.patra@linux.dev>, Michael Turquette <mturquette@baylibre.com>, =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <ukleinek@kernel.org>, linux-riscv@lists.infradead.org, linux-clk@vger.kernel.org, Rob Herring <robh@kernel.org>, Anup Patel <anup@brainfault.org>, Bartosz Golaszewski <brgl@bgdev.pl>, "Rafael J . Wysocki" <rafael@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, Andrew Jones <ajones@ventanamicro.com>, devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, Leyfoon Tan <leyfoon.tan@starfivetech.com>, Paul Walmsley <paul.walmsley@sifive.com>, Thomas Gleixner <tglx@linutronix.de>, Mika Westerberg <mika.westerberg@linux.intel.com>, Stephen Boyd <sboyd@kernel.org>, linux-kernel@vger.kernel.org, Samuel Holland <samuel.holland@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Rahul Pathak <rpathak@ventanamicro.com>, Len Brown <lenb@kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gV2VkLCBNYXkgMjEsIDIwMjUgYXQgNzo0MeKAr1BNIEFuZHkgU2hldmNoZW5rbwo8YW5kcml5
LnNoZXZjaGVua29AbGludXguaW50ZWwuY29tPiB3cm90ZToKPgo+IE9uIFdlZCwgTWF5IDIxLCAy
MDI1IGF0IDA1OjA3OjA1UE0gKzA1MzAsIEFudXAgUGF0ZWwgd3JvdGU6Cj4gPiBPbiBNb24sIE1h
eSAxMiwgMjAyNSBhdCAxMjoyMOKAr1BNIEFuZHkgU2hldmNoZW5rbwo+ID4gPGFuZHJpeS5zaGV2
Y2hlbmtvQGxpbnV4LmludGVsLmNvbT4gd3JvdGU6Cj4gPiA+IE9uIFN1biwgTWF5IDExLCAyMDI1
IGF0IDA3OjA5OjI5UE0gKzA1MzAsIEFudXAgUGF0ZWwgd3JvdGU6Cj4KPiAuLi4KPgo+ID4gPiA+
ICsjaW5jbHVkZSA8bGludXgvYml0ZmllbGQuaD4KPiA+ID4gPiArI2luY2x1ZGUgPGxpbnV4L2Jp
dG9wcy5oPgo+ID4gPiA+ICsjaW5jbHVkZSA8bGludXgvY3B1Lmg+Cj4gPiA+ID4gKyNpbmNsdWRl
IDxsaW51eC9pbnRlcnJ1cHQuaD4KPiA+ID4gPiArI2luY2x1ZGUgPGxpbnV4L2lycWNoaXAuaD4K
PiA+ID4gPiArI2luY2x1ZGUgPGxpbnV4L21haWxib3hfY2xpZW50Lmg+Cj4gPiA+ID4gKyNpbmNs
dWRlIDxsaW51eC9tYWlsYm94L3Jpc2N2LXJwbWktbWVzc2FnZS5oPgo+ID4gPiA+ICsjaW5jbHVk
ZSA8bGludXgvbW9kdWxlLmg+Cj4gPiA+ID4gKyNpbmNsdWRlIDxsaW51eC9tc2kuaD4KPiA+ID4g
PiArI2luY2x1ZGUgPGxpbnV4L29mX2lycS5oPgo+ID4gPiA+ICsjaW5jbHVkZSA8bGludXgvcGxh
dGZvcm1fZGV2aWNlLmg+Cj4gPiA+ID4gKyNpbmNsdWRlIDxsaW51eC9wcmludGsuaD4KPiA+ID4g
PiArI2luY2x1ZGUgPGxpbnV4L3NtcC5oPgo+ID4gPgo+ID4gPiArIHR5cGVzLmgKPiA+ID4KPiA+
ID4gQWN0dWFsbHkgdGhpcyBvbmUgaXMgbW9zdCBjbGVhbiwgdGhlIHJlc3Qgb2YgdGhlIHBhdGNo
ZXMgd2hlcmUgdGhlIG5ldyBjb2RlCj4gPiA+IGlzIGludHJvZHVjZWQgaGFzIHNlbWktcmFuZG9t
IGxpc3Qgb2YgdGhlIGluY2x1c2lvbnMsIHBsZWFzZSwgZm9sbG93IHRoZSBJV1lVCj4gPiA+IHBy
aW5jaXBsZS4KPiA+Cj4gPiBTdXJlLCBJIHdpbGwgc2ltcGxpZnkgdGhlICNpbmNsdWRlcwo+Cj4g
T2gsIElXWVUgKEluY2x1ZGUgV2hhdCBZb3UgVXNlKSBpcyBub3QgYWJvdXQgc2ltcGxpZmljYXRp
b24uIEl0J3MgYWJvdXQKPiBjb21wcmVoZW5zaW9uLiBJdCB1c3VhbGx5IG1lYW5zIHRoYXQgKm1v
cmUqIGhlYWRlcnMgbmVlZCB0byBiZSBpbmNsdWRlZAo+IGFuZCAqb25seSBzb21lKiBvZiB0aGUg
ZXhpc3Rpbmcgd2lsbCBiZSBkcm9wcGVkLgo+CgpPa2F5LCBJIHdpbGwgdXBkYXRlIGFjY29yZGlu
Z2x5LgoKUmVnYXJkcywKQW51cAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmlu
ZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9s
aW51eC1yaXNjdgo=
