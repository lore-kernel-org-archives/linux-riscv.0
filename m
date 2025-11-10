Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35F35CCFA13
	for <linux-riscv@archiver.kernel.org>; Mon, 10 Nov 2025 16:05:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Y79MvTO6CPTyi+dH5rKwACEch7s3c98wyz3Qiv+TSuA=; b=tfNLAiC7RsNKcR
	EENQ8DZMmD4t1Xde1mny50+aLWUJnT/PnoCPwkS+1JPlBSje2u1baTb/huNO9Jk0KFwWE39MC+ORH
	lBq1fjwroO3a59+b3Qi5juBVBpyNtIGh6WNjp/EfgjhTtBCzX82IqH/toHR4RSMPHK0Lruh1WFQe/
	DqR3EkPMb3QeN1v0uXcpDZEHMtLc7+4hOrhfqjvxIrz5UFhbQmwPofrDxGyOIAl/N2u7p3xeUcx/7
	SO0GdmLqXoT+hvrr4QCPAhrVXs82MXHWpnC7E15YRUtTceBUdRl7lb3Ck/f6u8U+86hDFkB9DyGA2
	ghvZ0wzmYnJ44G0P77XQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIUOj-00000005lNn-1H6n;
	Mon, 10 Nov 2025 16:05:41 +0000
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIUOf-00000005lN6-3tXx
	for linux-riscv@lists.infradead.org;
	Mon, 10 Nov 2025 16:05:39 +0000
Received: by mail-pf1-x435.google.com with SMTP id d2e1a72fcca58-7aad4823079so2863428b3a.0
        for <linux-riscv@lists.infradead.org>; Mon, 10 Nov 2025 08:05:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762790737; x=1763395537; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=TgZgArONH6lr9XvODSMICWYyuVWCZCYNoJZs+MKJ66o=;
        b=NFdEMXqTutVtq4yuS65WDDBCwWY55t9GCXnLsAkUTeDSY5IiAxkatdNtuyftABdOay
         FKvZiRLlcX/U4T1DAXLEQvDM8y6hOFNkdaeJ/MkD/4puzpCAUAoNEEntjm85tUGBeGlK
         Rt4IFu6cWj/3iRIezxxhQhJukkjMk/23IHWwFONjJsF1vts4Xqycn4V1+ADV5o4w2v5R
         tZj+SKd2D+3ZIJKIKPBKxPvRWhywY4FbJyDvKx3TMOIqAI9Q05i7r7ezGFvfTvuwgXBE
         zMiezEljvzHWQ0CNEoibAOM4peBN3OM6ql4iMnbA/Ce3JuhRaTiTjN4cQKvp4+Ovfk3T
         c/xA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762790737; x=1763395537;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TgZgArONH6lr9XvODSMICWYyuVWCZCYNoJZs+MKJ66o=;
        b=bBc/ASCnjY9ghXvfoeoWBa94KKHKmkzvksPTTYSHZgacIfvtaJ8xOuPm0vYtoM3kvi
         77YNrd/gjuUQ9HTn03ZmN/JWv1xhO60hCqONvKNgz7dqcQygCvOuUHQN5NJ8GOHRyT21
         y8hKedKYATB4O5BQ+eakLrvVmFpNv8FGJ9+vx4f6C+4xk/0Cy5w9141uZ+7Tgp75KCBC
         mtiWCrwVZ7EYVnJiWEmebDL5Q4RnEM4v5qUtTkzxYzgU2En8L0/FHPu8zvnkt4gOrQUV
         +gbq8PgNCEkZM62n/V1VeEgAhVPfvnMOLZYF0S7uqAh7KRjB/wjSMy8zzdGAFkZyOyfs
         erIw==
X-Forwarded-Encrypted: i=1; AJvYcCXo5852x371BYZxB7YFxn+TRFszpKbNE7ZEi7AALNJylDajGbdzHsbFKfiMeDp4fHPhc2y4EM78b6byug==@lists.infradead.org
X-Gm-Message-State: AOJu0YwjFT35NXZQSDseOEJpLq4n2qpp7URDvtRPt088MM6p05owd+7j
	h5xGPyP2UxuOeiw9WUgAWbG35gkeSbIzvEln5FPIJqHqb+ZBRC+SKm6k
X-Gm-Gg: ASbGncsytowrALd7bEtYzX3kWOFBQTpMTNn6q6pLBlVJUnOQSIrLwY0blbLHe+dTArq
	mvdxzwt2myYZpBNi9SU91pEK8jvXJ5rWyBz7kG3m3qtDCe5qb13vGiyOs0AAA8yv03mdAfz1jyQ
	df1TvA+vw9SVsVVmp729diRr9SSNZ8Jo5WfkQf5kH4JODu+DOeIf+XWnluxEqZ/w00bEYEXld5Q
	nvlz9xBArCdf9+ezdxpsR9u9xJCp7OdFInWpbNQjJaY36MHrIJvQJzPK2c3CrYwAWiJh8zV8fab
	1QAUh5yUDnKO3t95/MyoW1X5qy2xroZeC8aOZ5ATDkEXTd9ilJ2stScOXm9l4sIXdsdJWQZse+Q
	WYP2PDga4JTiwcmX5p0D0VLMmD6TYR446HbjUeUSM8Pj+zEhSts8oKs80sgUCKbzdVbwC4NGd/g
	QHgB4JYyM=
X-Google-Smtp-Source: AGHT+IF6WNNBzThjDgikYB/HqeiGseOlAPwbhWtHTRN1quM7bZZi7LqL9mv+idqwSvzAApOMFvrtbQ==
X-Received: by 2002:a05:6a20:1584:b0:344:bf35:2bfa with SMTP id adf61e73a8af0-353a31550dfmr9952656637.33.1762790736506;
        Mon, 10 Nov 2025 08:05:36 -0800 (PST)
Received: from localhost ([2408:841b:d00:77aa:3e0a:b50e:a68d:6665])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-ba902207227sm13072965a12.33.2025.11.10.08.05.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Nov 2025 08:05:36 -0800 (PST)
Date: Tue, 11 Nov 2025 00:05:29 +0800
From: Encrow Thorne <jyc0019@gmail.com>
To: Yixun Lan <dlan@gentoo.org>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] clk: spacemit: fix comment typo
Message-ID: <20251110160529.GA18666@hailin-HP-Pavilion-Laptop-14-dv0xxx>
References: <20251029-b4-fix-ccu-mix-typo-v1-1-caddb3580e64@gmail.com>
 <20251029223337-GYA1549833@gentoo.org>
 <20251110141251-GYD1651402@gentoo.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20251110141251-GYD1651402@gentoo.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251110_080537_969277_62EF370F 
X-CRM114-Status: GOOD (  24.68  )
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

T24gTW9uLCBOb3YgMTAsIDIwMjUgYXQgMTA6MTI6NTFQTSArMDgwMCwgWWl4dW4gTGFuIHdyb3Rl
Ogo+IEhpIEVuY3JvdywKPiAKPiBPbiAwNjozMyBUaHUgMzAgT2N0ICAgICAsIFlpeHVuIExhbiB3
cm90ZToKPiA+IEhpIEVuY3JvdywKPiA+IAo+ID4gT24gMDA6MDUgV2VkIDI5IE9jdCAgICAgLCBF
bmNyb3cgVGhvcm5lIHdyb3RlOgo+ID4gPiBjY3VtaXguaCB3YXMgY29waWVkIGZyb20gY2N1ZGl2
LmggYW5kIHRoZSBjb21tZW50IGFmdGVyICNlbmRpZiB3YXMgbm90Cj4gPiA+IHVwZGF0ZWQuCj4g
PiA+IAo+ID4gPiBUaGlzIHBhdGNoIGZpeGVzIHRoZSBpbmNvcnJlY3QgY29tbWVudCB0byBtYXRj
aCB0aGUgZmlsZW5hbWUuCj4gPiAKPiA+IEp1c3QgZGVzY3JpYmUgaW4gaW1wZXJhdGl2ZSBtb2Rl
LCBzZWUKPiA+IChzaW5jZSB0aGlzIGlzIHRyaXZpYWwsIEkgY291bGQgYW1lbmQgaXQgYmVmb3Jl
IGFwcGx5IHRoZSBwYXRjaCwKPiA+IHNvIG5vIG5lZWQgdG8gcmVzZW5kKQo+ID4gaHR0cHM6Ly9l
bGl4aXIuYm9vdGxpbi5jb20vbGludXgvdjYuMTYvc291cmNlL0RvY3VtZW50YXRpb24vcHJvY2Vz
cy9zdWJtaXR0aW5nLXBhdGNoZXMucnN0I0w5NAo+ID4gCj4gSSBoYXZlIG5vIG90aGVyIGNsb2Nr
IHBhdGNoIHF1ZXVlZCB0aGlzIGN5Y2xlLCBzbyBob3cgYWJvdXQgeW91IHJlc3BpbiBhIHYyCj4g
dGhlbiBsZXQncyBwaW5nIFN0ZXBoZW4gZGlyZWN0bHkgZm9yIGluY2x1c2lvbj8KPiAKPiBmb3Ig
Y29tbWl0IG1lc3NhZ2UsIEknZCBzdWdnZXN0IHNpbXBseSBhcyBiZWxvdyAoc2hvcnQvY2xlYW4s
IGFsc28gZW5vdWdoKToKPiAKPiBGaXggaW5jb3JyZWN0IGNvbW1lbnQgdG8gbWF0Y2ggdGhlIGZp
bGVuYW1lLgo+IAogVGhhbmtzIGZvciB5b3VyIGZlZWRiYWNrLgogSeKAmWxsIHNlbmQgb3V0IHYy
IHNvb24uCgogCQktIEVuY3Jvdwo+ID4gPiAKPiA+ID4gU2lnbmVkLW9mZi1ieTogRW5jcm93IFRo
b3JuZSA8anljMDAxOUBnbWFpbC5jb20+Cj4gPiA+IC0tLQo+ID4gPiAgZHJpdmVycy9jbGsvc3Bh
Y2VtaXQvY2N1X21peC5oIHwgMiArLQo+ID4gPiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9u
KCspLCAxIGRlbGV0aW9uKC0pCj4gPiA+IAo+ID4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9jbGsv
c3BhY2VtaXQvY2N1X21peC5oIGIvZHJpdmVycy9jbGsvc3BhY2VtaXQvY2N1X21peC5oCj4gPiA+
IGluZGV4IDU0ZDQwY2QzOWIyNy4uYzQwNjUwOGUzNTA0IDEwMDY0NAo+ID4gPiAtLS0gYS9kcml2
ZXJzL2Nsay9zcGFjZW1pdC9jY3VfbWl4LmgKPiA+ID4gKysrIGIvZHJpdmVycy9jbGsvc3BhY2Vt
aXQvY2N1X21peC5oCj4gPiA+IEBAIC0yMjAsNCArMjIwLDQgQEAgZXh0ZXJuIGNvbnN0IHN0cnVj
dCBjbGtfb3BzIHNwYWNlbWl0X2NjdV9kaXZfZ2F0ZV9vcHM7Cj4gPiA+ICBleHRlcm4gY29uc3Qg
c3RydWN0IGNsa19vcHMgc3BhY2VtaXRfY2N1X211eF9nYXRlX29wczsKPiA+ID4gIGV4dGVybiBj
b25zdCBzdHJ1Y3QgY2xrX29wcyBzcGFjZW1pdF9jY3VfbXV4X2Rpdl9vcHM7Cj4gPiA+ICBleHRl
cm4gY29uc3Qgc3RydWN0IGNsa19vcHMgc3BhY2VtaXRfY2N1X211eF9kaXZfZ2F0ZV9vcHM7Cj4g
PiA+IC0jZW5kaWYgLyogX0NDVV9ESVZfSF8gKi8KPiA+ID4gKyNlbmRpZiAvKiBfQ0NVX01JWF9I
XyAqLwo+ID4gPiAKPiA+ID4gLS0tCj4gPiA+IGJhc2UtY29tbWl0OiAzYTg2NjA4Nzg4MzlmYWFk
YjRmMWE2ZGQ3MmMzMTc5YzFkZjU2Nzg3Cj4gPiA+IGNoYW5nZS1pZDogMjAyNTEwMjgtYjQtZml4
LWNjdS1taXgtdHlwby0wMzhjMTlmZTMwYzQKPiA+ID4gCj4gPiA+IEJlc3QgcmVnYXJkcywKPiA+
ID4gLS0gCj4gPiA+IEVuY3JvdyBUaG9ybmUgPGp5YzAwMTlAZ21haWwuY29tPgo+ID4gPiAKPiA+
IAo+ID4gLS0gCj4gPiBZaXh1biBMYW4gKGRsYW4pCj4gPiAKPiAKPiAtLSAKPiBZaXh1biBMYW4g
KGRsYW4pCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwps
aW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpo
dHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
