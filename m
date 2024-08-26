Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37733C5321D
	for <linux-riscv@archiver.kernel.org>; Mon, 26 Aug 2024 09:16:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=k1HiZ4zCIWNAuG4Sr3R6I5MvQA4bPMPeaB6cAMhHP5Q=; b=oRGScDp/rA7pUb
	5yemI5ZyHy0puf+LXB1QftT3GNnlDA12PQzZZQ30lYZ9rXPb/tMwgTNHJ27SWa2Mipe073TajAaHH
	sYsRUKCs6YxaQ0I3uok1m3JzroR3DUROUrJu/H2uFq6PDF4vZ2APLZDTvP75sKT2EmcmLEJdXtry3
	mj4JEwcYbcI9GHSiieAWi3iAeY0gpUg8+aLmAChmcjOUxWH6nWe2dZS3vp/QDZvieESJ2XXFYkPmF
	+xHjKsFPZrQZN9Fq/GMrdhBvqeiU00uerNgdGKUv9ACC9hlmI5d9aMoLffuYkM+zXlbBtE37dK7f3
	oGZFPrxMKjS9kZ3tXc4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1siVpl-00000006cvt-1iGS;
	Mon, 26 Aug 2024 09:16:21 +0000
Received: from mail-lf1-x134.google.com ([2a00:1450:4864:20::134])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1siVpi-00000006cun-0VVt
	for linux-riscv@lists.infradead.org;
	Mon, 26 Aug 2024 09:16:19 +0000
Received: by mail-lf1-x134.google.com with SMTP id 2adb3069b0e04-5342109d726so2512992e87.0
        for <linux-riscv@lists.infradead.org>; Mon, 26 Aug 2024 02:16:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1724663776; x=1725268576; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Vj9u1E7DvkaaO4ShELzXZnCJcuqvug4oIsq0JHfrSiU=;
        b=yk/b155jhY1C0qt76bXHbLl8LJRmjUkzhz9qr0yKGuTx0ibYlbGluer9YP65ZU+Ysi
         Y1UoFwc3qCfFnT9K6M4Q+x0QLaDqMFW2N2hcobZCgRk4HQkUuoGULVdtqzYQUiZoOqsM
         TyCf6PAmXWVuIzq/joHqnMaY4PS9zZP/mUDXOYxhgihVu4aOIJ8F7kNySbO36Q3bGMoO
         uL6m436rsg+LeqBIocai5yoZZ58GWbxxXktK8hwmIVQDPdUlokk0a9fblb0JyUBf0h2h
         yUkMHWlsdRns1/958mfhbFVj85oZOJaH8FojJwKwDJQyXP2X4SReAnM7PbBPdIHuYVU/
         mL1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724663776; x=1725268576;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Vj9u1E7DvkaaO4ShELzXZnCJcuqvug4oIsq0JHfrSiU=;
        b=svvNbCkw3wbZ02cBl/gnl505YwRtjvF3OtS/pmeJV54M9JqJzPCCfO39UiX/kc6aYh
         t196tSdZ51RWW1k/vau1nkHN2CTrqfrCdvQ3SEsCMizxSyUcwi0o2SIeBdgz+/+oblnV
         GiG85mINMk8atvFggUwLp6qodZR/A4r93EZcuwhxLEtv52f+wiB4zAD9WQ7ElLn798hz
         O8EZc/q8MUyvJcaDYBZl4gh29YQobb5WZ/Ad++lqY3oEfxPijEhnQp9eAe4DpUcAphnA
         DRTuANcYG0KXgzJJbguzL8yA1pvpGCtap4PjgOzYZYyajUJE7IU+JsP23fFUYXcSyFtw
         vslA==
X-Forwarded-Encrypted: i=1; AJvYcCUCam3Ac8xzxcE31wcM/U/0btNADXbPjrSnDEM2j/SNPfQjSR50ELqWLFtBUS27ChqhkScdrvmP4huEcA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yyc1mzB2e9sD/nxapTe3AY2XR/Vln7NX4ea6yAsaMKClWLNTKCU
	DqyKZJgJ0MaG9Q2bOize+1xC0ZS+HigwgmlqyH8iqyHF0FAhL1z7d/3T1Z5qJZiKNz/PWZLYy+2
	Jc5Eu62vmFV8A+UGzimWYBjaFhjW6Es/2ZYJH+Q==
X-Google-Smtp-Source: AGHT+IEP/7MkKo7czL7mThajxuutkKh/x1ebSsV0QSfRAVCGaGgrEFrGlRyqUclJ68N87mKHwDeMyBX0EFskxbXmpxY=
X-Received: by 2002:a05:6512:4019:b0:52c:dc06:d4ad with SMTP id
 2adb3069b0e04-5343831fb41mr2840347e87.6.1724663775523; Mon, 26 Aug 2024
 02:16:15 -0700 (PDT)
MIME-Version: 1.0
References: <IA1PR20MB4953DC78BB0FE0C57EA94F91BBB32@IA1PR20MB4953.namprd20.prod.outlook.com>
 <CACRpkdbaDW2=R881G9C=r1iW4YNdYpRZ2kHaN63T7EX1A0xVrA@mail.gmail.com> <IA1PR20MB495368D784BE3F977617BF39BB892@IA1PR20MB4953.namprd20.prod.outlook.com>
In-Reply-To: <IA1PR20MB495368D784BE3F977617BF39BB892@IA1PR20MB4953.namprd20.prod.outlook.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 26 Aug 2024 11:16:04 +0200
Message-ID: <CACRpkdZ5zAgQyo9y_nO8M0Z6b8zqbkg5H_3ceEJN6z6mHL4TOQ@mail.gmail.com>
Subject: Re: [PATCH v4 0/7] riscv: sophgo: Add pinctrl support for CV1800
 series SoC
To: Inochi Amaoto <inochiama@outlook.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Chen Wang <unicorn_wang@outlook.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Jisheng Zhang <jszhang@kernel.org>, Guo Ren <guoren@kernel.org>, 
	Drew Fustini <dfustini@baylibre.com>, Haylen Chu <heylenay@outlook.com>, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240826_021618_204058_2D99C882 
X-CRM114-Status: GOOD (  23.83  )
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

T24gU2F0LCBBdWcgMjQsIDIwMjQgYXQgMToyNuKAr1BNIElub2NoaSBBbWFvdG8gPGlub2NoaWFt
YUBvdXRsb29rLmNvbT4gd3JvdGU6Cj4gT24gRnJpLCBBdWcgMjMsIDIwMjQgYXQgMDU6NDQ6MTdQ
TSBHTVQsIExpbnVzIFdhbGxlaWogd3JvdGU6Cj4gPiBPbiBGcmksIEF1ZyAyLCAyMDI0IGF0IDI6
MzTigK9BTSBJbm9jaGkgQW1hb3RvIDxpbm9jaGlhbWFAb3V0bG9vay5jb20+IHdyb3RlOgo+ID4K
PiA+ID4gQWRkIGJhc2ljIHBpbmN0cmwgZHJpdmVyIGZvciBTb3BoZ28gQ1YxODAwIHNlcmllcyBT
b0NzLgo+ID4gPiBUaGlzIHBhdGNoIHNlcmllcyBhaW1zIHRvIHJlcGxhY2UgdGhlIHByZXZpb3Vz
IHBhdGNoIGZyb20gSmlzaGVuZyBbMV0uCj4gPiA+IFNpbmNlIHRoZSBwaW5jdHJsIG9mIGN2MTgw
MCBoYXMgbmVzdGVkIG11eCBhbmQgaXRzIHBpbiBkZWZpbmluYXRpb24KPiA+ID4gaXMgZGlzY3Jl
dGUsIGl0IGlzIG5vdCBzdWl0YWJsZSB0byB1c2UgInBpbmN0cmwtc2luZ2xlIiB0byBjb3ZlciB0
aGUKPiA+ID4gcGluY3RybCBkZXZpY2UuCj4gPiA+Cj4gPiA+IFRoaXMgcGF0Y2ggcmVxdWlyZSBh
bm90aGVyIHBhdGNoIFsyXSB0aGF0IHByb3ZpZGVzIHN0YW5kYXJkIGF0dHJpYnV0ZQo+ID4gPiAi
aW5wdXQtc2NobWl0dC1taWNyb3ZvbHQiCj4gPiA+Cj4gPiA+IE5vdGU6IEFzIGN1cnJlbnQgZG9j
dW1lbnRhdGlvbiBpcyBub3QgZW5vdWdoIHRvIGd1ZXNzIHRoZSBwaW4KPiA+ID4gY29uZmlndXJh
dGlvbiBvZiBIdWFzaGFuIFBpLCBvbmx5IHRoZSBwaW5jdHJsIG5vZGUgaXMgYWRkZWQuCj4gPiA+
Cj4gPiA+IFsxXSBodHRwczovL2xvcmUua2VybmVsLm9yZy9saW51eC1yaXNjdi8yMDIzMTExMzAw
NTcwMi4yNDY3LTEtanN6aGFuZ0BrZXJuZWwub3JnLwo+ID4gPiBbMl0gaHR0cHM6Ly9sb3JlLmtl
cm5lbC5vcmcvYWxsL0lBMVBSMjBNQjQ5NTM0NjI0NjI0NTA3NDIzNEQzMzdBNkJCQUMyQElBMVBS
MjBNQjQ5NTMubmFtcHJkMjAucHJvZC5vdXRsb29rLmNvbS8KPiA+ID4KPiA+ID4gQ2hhbmdlZCBm
cm9tIHYzOgo+ID4gPiAxLiBiaW5kaW5nOiBkcm9wIHVubmVjZXNzYXJ5IHR5cGUKPiA+ID4gMi4g
YmluZGluZzogdXNlIHJpZ2h0IHJlZiBmb3IgcGluIG5vZGUuCj4gPiA+IDMuIGJpbmRpbmc6IHJl
bW92ZSBtaXhlZCBzcGFjZXMgYW5kIHRhYnMuCj4gPgo+ID4gVGhpcyB2NCBsb29rcyBnb29kIHRv
IG1lIGFuZCBoYXMgbmVjZXNzYXJ5IEFDS3MuCj4gPgo+ID4gSXQgY29udGFpbnMgZGV2aWNlIHRy
ZWUgcGF0Y2hlcyB3aGljaCBJIGFtIGlja3kgdG8gbWVyZ2UgYnV0Cj4gPiBJIGNhbiBtZXJnZSB0
aGUgcmVzdCBhbmQgZ2l2ZSB5b3UgYW4gaW1tdXRhYmxlIGJyYW5jaCBpbiB0aGUKPiA+IHBpbmN0
cmwgdHJlZSB0aGF0IHRoZSBBUk0gU29DIG1haW50YWluZXJzIGNhbiBwdWxsIGluIHRvCj4gPiBt
ZXJnZSB0aGUgZGV2aWNlIHRyZWVzLCBkb2VzIHRoaXMgd29yayBmb3IgeW91Pwo+ID4KPiA+IFlv
dXJzLAo+ID4gTGludXMgV2FsbGVpago+Cj4gSGksIExpbnVzCj4KPiBJdCBpcyBPSyBmb3IgbWUs
IFRoYW5rcyBmb3IgdGFraW5nIGl0LgoKT0shIFRoZSBwaW5jdHJsIGJhc2UgcGF0Y2hlcyBhcmUg
bWVyZ2VkIHRvIHRoaXMgaW1tdXRhYmxlIGJyYW5jaDoKaHR0cHM6Ly9naXQua2VybmVsLm9yZy9w
dWIvc2NtL2xpbnV4L2tlcm5lbC9naXQvbGludXN3L2xpbnV4LXBpbmN0cmwuZ2l0L2xvZy8/aD1p
Yi1zb3BoZ28tcGluY3RybAoKVGhlIFNvQyB0cmVlIGNhbiBwdWxsIHRoaXMgaW4gdG8gZ2V0IHRo
ZSBiaW5kaW5nIGZpbGVzLgoKSSBoYXZlIHRoZW4gbWVyZ2VkIHRoaXMgaW50byB0aGUgbWFpbiBw
aW5jdHJsICJkZXZlbCIgYnJhbmNoLgoKWW91cnMsCkxpbnVzIFdhbGxlaWoKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcg
bGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRl
YWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
