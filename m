Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 635D8C61CE8
	for <linux-riscv@archiver.kernel.org>; Thu, 12 Jun 2025 04:00:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JCA80BYeTNmBQQXgL6igqEturM5ris2QSXLaRvPd+fM=; b=eXosSpdSrDXJhP
	urV6T+eu36axm/UkEwtLLG7E+CevDbziH8qmMSwgzpkw0Dds3Vy7K+rURdPlvb7MVbLLrR+McgTH0
	Z9JKjN+GqpLbZVYrfd34fKxEER5IeZkhvF48s/iTbs3jsvx6Jty5mNNrnLgM6JzPn2qu449S2c+9/
	AhWONdF/TOSVQ5Uti7k81XuLoXPXc1sCR0QnRFiX7l72AEYnzcxSUWUT5I9tRVbcJr+lR8rxN5zYA
	c8utPZQIEJOuyvnaarotOWSTCdQg5/18Y1/8rA6Y1hoPtLYyMuFTpIIpjIz2FJV+rJpp+P/4chCeS
	TzGtJARo9eTM6m5t2w5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPZ75-0000000C6ZS-10nL;
	Thu, 12 Jun 2025 04:00:27 +0000
Received: from mail-lf1-x130.google.com ([2a00:1450:4864:20::130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPZ73-0000000C6Z4-0mnS
	for linux-riscv@lists.infradead.org;
	Thu, 12 Jun 2025 04:00:26 +0000
Received: by mail-lf1-x130.google.com with SMTP id 2adb3069b0e04-54e98f73850so454519e87.1
        for <linux-riscv@lists.infradead.org>; Wed, 11 Jun 2025 21:00:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1749700823; x=1750305623; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LrZf9tw7ue1AjUWwaIRpX02bUAB62dzm3WhOTiLfKg8=;
        b=ZoILvDs3iaffuVY7Y+eeWHcFQ/tGRN0KJ4V0w3MO8o8nsjkmJ1QkgxN0PlVU5PAKQm
         MoXpc7Uh+zhT6mhUFLZvN2IsoPKcnWMgOZ1Z9onp+jmnXZHJXRmM6xo46WkGUPyV0GB6
         i4qoaL24UfY3nss/4lSZplidYx3p3NfBoT+q4Lk1wQ4PD2mxdDBNIJxkL/7yeG31CLT6
         NEZIdGsSm3SckwKgiOZHYbN7hjKyFn8gVu0FTc+mBNSDXVNzbGbo+MO4rZeDWcyQlFvM
         20sNyEpkMCObvTdnVOE5946VKnz5/N07sJr2PsBJmGxxiylAqG1dagCiEjEV3aZslss6
         XtVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749700823; x=1750305623;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LrZf9tw7ue1AjUWwaIRpX02bUAB62dzm3WhOTiLfKg8=;
        b=XIZk0T69t9R1VCmDWEWR3dJsOCYDGtrD8U2NLwE8x6ApNcA8Dn3KGw3UaJHXo1Hg2E
         fwteEWkoxiREHHoMsJRImmuP+IlqBqMh5sBYg/QdUREfx6+euAd20eEBVuyu6ju0vdoB
         KBdyPL4OM16yc/L6VLiVHc2nftn2IcvgyyWJdhcj4NbE65qVqmm64YnmRzdAJMgImRb5
         zyS0SarCE+Thma6zfRGbNk1txZ08DmaXV1lM/+9dnCXoPdeRpsqxvXXkZSuMO0yaRGNa
         La1fR4Dhz3HEdbI0WOY3Kx7gl8jrtkCypGZuKtpaAKffbtGyp1OaDMbT/hjDUo41aXjT
         1+kQ==
X-Forwarded-Encrypted: i=1; AJvYcCXTrIu6XA0l85LaRsH3KInrKg9Ts6iuEmgOMPxPjdelWhDTPkgfq9ZdlSCxoLX0gSwvG6+NJxBvWWWd6w==@lists.infradead.org
X-Gm-Message-State: AOJu0Yzn5I0k2ba9IGTegjkSQOWlkVPCA3gFnBvqfEVxj7UB246STTUp
	mFR+R6wrLpwnTYeYpC1bxrag0rPURzEqwvNBVyOs6d/FWEodnv6iSL+8WWc7WyVM737km/jLUUf
	ldi02g/VdaN5YOFIzQIzKQFjG6VmohVLLiHn1G0scQQ==
X-Gm-Gg: ASbGnctE8B6NKC+Nb5iIIqz11PpKf48n+cJ1kE8T45HLoWWOY1glsF7Pok3E0rCeAH9
	+aiBVeeEfxJuPbl6taYtZ6CsX+WaEhk/19qOjzlcmCsYoPWqroLJrC48X0di2vlTpeCgDk4nebZ
	dcVWEcOPU6tGtuPtEQ7d93hlxjZONcKSrrdc/ItPPGv4At
X-Google-Smtp-Source: AGHT+IHFiT/1CKTclaeo4nECAjAsNA6jBOPa/LZL3M+Ccdnks+IHwcRkfiDgkJcope9mTG1+XxA4A5iEPu8+KuKIZnw=
X-Received: by 2002:a05:6512:3b0c:b0:553:2450:5895 with SMTP id
 2adb3069b0e04-553a6446c73mr435357e87.4.1749700823052; Wed, 11 Jun 2025
 21:00:23 -0700 (PDT)
MIME-Version: 1.0
References: <20250611062238.636753-1-apatel@ventanamicro.com>
 <20250611062238.636753-9-apatel@ventanamicro.com> <20250611-sprint-playable-07774a23f027@spud>
In-Reply-To: <20250611-sprint-playable-07774a23f027@spud>
From: Anup Patel <apatel@ventanamicro.com>
Date: Thu, 12 Jun 2025 09:30:11 +0530
X-Gm-Features: AX0GCFsKCy8m7CU7KuBd7obZnUUEUh3VEd4feuIdW-8ohTJTYbZ_MYkJD8lCino
Message-ID: <CAK9=C2UwtBhefp_FxwTtDPRyXb2McVdypgh-A9PaQO9288uzMA@mail.gmail.com>
Subject: Re: [PATCH v5 08/23] dt-bindings: clock: Add RPMI clock service
 controller bindings
To: Conor Dooley <conor@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250611_210025_233022_8F2C17DC 
X-CRM114-Status: GOOD (  12.38  )
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
Cc: Jassi Brar <jassisinghbrar@gmail.com>, Atish Patra <atish.patra@linux.dev>, Michael Turquette <mturquette@baylibre.com>, Conor Dooley <conor.dooley@microchip.com>, =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <ukleinek@kernel.org>, linux-riscv@lists.infradead.org, linux-clk@vger.kernel.org, Rob Herring <robh@kernel.org>, Anup Patel <anup@brainfault.org>, Bartosz Golaszewski <brgl@bgdev.pl>, "Rafael J . Wysocki" <rafael@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, Rahul Pathak <rpathak@ventanamicro.com>, devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, Leyfoon Tan <leyfoon.tan@starfivetech.com>, Paul Walmsley <paul.walmsley@sifive.com>, Thomas Gleixner <tglx@linutronix.de>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Mika Westerberg <mika.westerberg@linux.intel.com>, Stephen Boyd <sboyd@kernel.org>, linux-kernel@vger.kernel.org, Samuel Holland <samuel.holland@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Andrew Jones <ajones@ventanamicro.com>, Len Brown <lenb@kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gV2VkLCBKdW4gMTEsIDIwMjUgYXQgOTo0N+KAr1BNIENvbm9yIERvb2xleSA8Y29ub3JAa2Vy
bmVsLm9yZz4gd3JvdGU6Cj4KPiBPbiBXZWQsIEp1biAxMSwgMjAyNSBhdCAxMTo1MjoyM0FNICsw
NTMwLCBBbnVwIFBhdGVsIHdyb3RlOgo+ID4gQWRkIGRldmljZSB0cmVlIGJpbmRpbmdzIGZvciB0
aGUgUlBNSSBjbG9jayBzZXJ2aWNlIGdyb3VwIGJhc2VkCj4gPiBjb250cm9sbGVyIGZvciB0aGUg
c3VwZXJ2aXNvciBzb2Z0d2FyZS4KPiA+Cj4gPiBUaGUgUlBNSSBjbG9jayBzZXJ2aWNlIGdyb3Vw
IGlzIGRlZmluZWQgYnkgdGhlIFJJU0MtViBwbGF0Zm9ybQo+ID4gbWFuYWdlbWVudCBpbnRlcmZh
Y2UgKFJQTUkpIHNwZWNpZmljYXRpb24uCj4gPgo+ID4gU2lnbmVkLW9mZi1ieTogQW51cCBQYXRl
bCA8YXBhdGVsQHZlbnRhbmFtaWNyby5jb20+Cj4gPiBSZXZpZXdlZC1ieTogQ29ub3IgRG9vbGV5
IDxjb25vci5kb29sZXlAbWljcm9jaGlwLmNvbT4KPgo+IE9uIHY0IEkgc2FpZCB0aGUgdGFnIEkg
cHJvdmlkZWQgd2FzIGZvciBhbGwgYmluZGluZyBwYXRjaGVzLgo+IElzIHRoZXJlIGEgcmVhc29u
LCBvdGhlciB0aGFuIHVzaW5nIGI0IHRvIGdyYWIgdGFncywgb3Igbm90IG5vdGljaW5nLAo+IGZv
ciB3aHkgeW91IG9ubHkgYWRkZWQgaXQgaGVyZT8KClllcywgSSB1c2UgYjQgdG8gZ3JhYiB0YWdz
IGJlZm9yZSBhZGRyZXNzaW5nIGNvbW1lbnRzLiBJIHdpbGwKbWFudWFsbHkgYWRkIHlvdXIgUmV2
aWV3ZWQtYnkgaW4gYWxsIGJpbmRpbmcgcGF0Y2hlcyBpbiB0aGUKbmV4dCByZXZpc2lvbi4KClRo
YW5rcywKQW51cAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5v
cmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNj
dgo=
