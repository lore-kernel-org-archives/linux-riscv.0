Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7804CC35274
	for <linux-riscv@archiver.kernel.org>; Thu, 21 Dec 2023 12:22:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:
	Mime-Version:References:In-Reply-To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=a7poLAGh6m1DpmhBtHu6tvrxsS4UrlpSUXalaN+sKnM=; b=0i32tTanHi5cYxFDXCc7s4hZQ4
	4ql7skf0DcOqR0lSSpZcHzDH93qiCWpn3DYg2hf+i+nBCVCZlO9+8dKHmQO4vypVs0lJUEhb72YRL
	u0C/iK22pl4SnuzdW8S6EDST8TCZnPR0zqd7aQFoP/ZRvb7FTN0Ccl6F9Q6OwtjxU9ZqyRpUcgMnR
	Ow/5pXilXO/w6kPAno5hLPZdCrcmPkyZBClWI4xauqyz9gWw0q8U/zwQZpmFJabHxi3t4fb56ZIRq
	h0DsuOLIs9OgMQfil6VD5x1o6WhdTYgPNTRV/QHdv7gimgsEnX3Xam6ntckT0jLJzyaz/SOg8j/e2
	fg49MjqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rGI3f-002jpw-1X;
	Thu, 21 Dec 2023 12:21:47 +0000
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rGI3b-002jnZ-1C
	for linux-riscv@lists.infradead.org;
	Thu, 21 Dec 2023 12:21:45 +0000
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id AB0EA3F337
	for <linux-riscv@lists.infradead.org>; Thu, 21 Dec 2023 12:21:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1703161296;
	bh=5yOM88UnN2btzDcnsPnqzcK3v085hMK5F/zsjhGZgro=;
	h=From:In-Reply-To:References:Mime-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type;
	b=UrlAekehBWXVm8o5Ck3NhS03DpNn88aMDuLo2aMDgzztwJFKEk15971ozrYbO4Fjm
	 jLaZ+tS79HsdwdxrqNcjsPT+9wiGz+eprDKRRKGCDb+iTwZWXVrnqEGuWWT3Hsd9Yh
	 bir8dynXQjtmcI1Hl6LxksYlsEP87k0DjBVVl2vApODtuN+AMUOfYgqyH4YTQRXtCe
	 t5+bN4ps6JXj6znmOg4NTd2HPvZx4P4g9GXs2eZpv2VRofGLiREIwDMAw1Jv4oAYxe
	 IpbDuO9I+eSpS5LFH8Lkktvzb+dYEyWCjQJh34hl9lXKdgDj8pofjqDSZ9iBY6ujFV
	 8KxGk1/1Yjjug==
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-42784a4762dso9966351cf.1
        for <linux-riscv@lists.infradead.org>; Thu, 21 Dec 2023 04:21:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703161295; x=1703766095;
        h=content-transfer-encoding:cc:to:subject:message-id:date
         :mime-version:references:in-reply-to:from:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=5yOM88UnN2btzDcnsPnqzcK3v085hMK5F/zsjhGZgro=;
        b=umCO38dP0LQLUIOqANG7vNOgRaPqA9H4CLN4mThi1PXYFro+qphgVAyU17tRz0CD+1
         cyeUyAaC2NA367Drx3i9SW9G9E1dph46G4DEhxIXcY7rdXzB6P7pR+xxaXU8RSMGwowa
         d3xjIWg6tC/3O5vYQKxldyG7vzJmXzQJ3ZBIlEE8ptfIEziOh/9iz73iNH1uVf7cYEuc
         z4moT+rBq4YuN8CtmRHZslceSLomHsdBIXdIoOZDqIPB3EnvwY1UToK64cS5CD+2L4wC
         1Xlif2j/aC8pG+Sr1gffokjL6HBTvK1ElWQUUbCQwJiEJ2pqhiYSZpXaJ6gAMAlPQJ/z
         GBeQ==
X-Gm-Message-State: AOJu0YwzBBmvVECqewqb5y2h8O2d13ZBV6d2TsqCDHYZZInZNtID7qdU
	uoNkjO7l08dLEVirChilLEA6nIgnud+bW1jwzHT2yAAinpessFjcL4FalcaeBLkLqdWvUF+FnlX
	2q97RfS+7chEYjgaznaIyCPmrbT37hgYqAP5TzT8/zdFxecuUzOIPAJPijKFoog==
X-Received: by 2002:a05:622a:14c6:b0:425:917c:7536 with SMTP id u6-20020a05622a14c600b00425917c7536mr6534464qtx.119.1703161295579;
        Thu, 21 Dec 2023 04:21:35 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEpMGKr/Zb4NKcCnJdLXeBdkeSOCI9GetmOSTchFTZuRlYVVuqcu2glq8Xby4HmQ5C3aTmS9z58/3PgkaRgvH0=
X-Received: by 2002:a05:622a:14c6:b0:425:917c:7536 with SMTP id
 u6-20020a05622a14c600b00425917c7536mr6534438qtx.119.1703161295305; Thu, 21
 Dec 2023 04:21:35 -0800 (PST)
Received: from 348282803490 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 21 Dec 2023 04:21:34 -0800
From: Emil Renner Berthing <emil.renner.berthing@canonical.com>
In-Reply-To: <CACRpkdZf09uKr+ka0_rsw5kHMjjQbaGypn2fx2-QobLFBKYrtQ@mail.gmail.com>
References: <20231215143906.3651122-1-emil.renner.berthing@canonical.com>
 <20231215143906.3651122-2-emil.renner.berthing@canonical.com> <CACRpkdZf09uKr+ka0_rsw5kHMjjQbaGypn2fx2-QobLFBKYrtQ@mail.gmail.com>
Mime-Version: 1.0
Date: Thu, 21 Dec 2023 04:21:34 -0800
Message-ID: <CAJM55Z8hT_fUAjzNR=7aoWJPU8MMumjdFy74MDD85Yic2Gjg-A@mail.gmail.com>
Subject: Re: [PATCH v1 1/8] dt-bindings: pinctrl: Add thead,th1520-pinctrl bindings
To: Linus Walleij <linus.walleij@linaro.org>, Jisheng Zhang <jszhang@kernel.org>, 
	Guo Ren <guoren@kernel.org>, Drew Fustini <dfustini@baylibre.com>, 
	Emil Renner Berthing <emil.renner.berthing@canonical.com>
Cc: linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	Hoan Tran <hoan@os.amperecomputing.com>, Serge Semin <fancer.lancer@gmail.com>, 
	Bartosz Golaszewski <brgl@bgdev.pl>, Andy Shevchenko <andy@kernel.org>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Fu Wei <wefu@redhat.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231221_042143_696637_E1EBA22D 
X-CRM114-Status: GOOD (  25.80  )
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

TGludXMgV2FsbGVpaiB3cm90ZToKPiBIaSBFbWlsLAo+Cj4gdGhhbmtzIGZvciB5b3VyIHBhdGNo
IQo+Cj4gT24gRnJpLCBEZWMgMTUsIDIwMjMgYXQgMzozOeKAr1BNIEVtaWwgUmVubmVyIEJlcnRo
aW5nCj4gPGVtaWwucmVubmVyLmJlcnRoaW5nQGNhbm9uaWNhbC5jb20+IHdyb3RlOgo+Cj4gPiAr
ICBUaGUgVEgxNTIwIGhhcyAzIGdyb3VwcyBvZiBwYWRzIGVhY2ggY29udHJvbGxlZCBmcm9tIGRp
ZmZlcmVudCBtZW1vcnkgcmFuZ2VzLgo+ID4gKyAgQ29uZnVzaW5nbHkgdGhlIG1lbW9yeSByYW5n
ZXMgYXJlIG5hbWVkCj4gPiArICAgIFBBRENUUkxfQU9TWVMgIC0+IFBBRCBHcm91cCAxCj4gPiAr
ICAgIFBBRENUUkwxX0FQU1lTIC0+IFBBRCBHcm91cCAyCj4gPiArICAgIFBBRENUUkwwX0FQU1lT
IC0+IFBBRCBHcm91cCAzCj4KPiBSZWFsbHksIGV2ZW4gaW4gdGhlIGRvY3VtZW50YXRpb24/IElm
IHlvdSBsb29rIGF0IHRoZSBsYXlvdXQgb24gdGhlIGFjdHVhbAo+IGNoaXAsIGRvZXMgYSBwYXR0
ZXJuIGVtZXJnZT8KClllcywgdGhlIGRvY3VtZW50YXRpb24gaXMgd2hlcmUgSSBnb3QgdGhpcyBm
cm9tOgpodHRwczovL2dpdC5iZWFnbGVib2FyZC5vcmcvYmVhZ2xldi1haGVhZC9iZWFnbGV2LWFo
ZWFkLy0vYmxvYi9tYWluL2RvY3MvVEgxNTIwJTIwU3lzdGVtJTIwVXNlciUyME1hbnVhbC5wZGYK
ClRoZSBwaW5tdXggY2hhcHRlciBzdGFydGluZyBvbiBwYWdlIDMxIG9ubHkgdGFsa3MgYWJvdXQg
dGhlIDMgcGFkIGdyb3VwcywgYnV0CmlmIHlvdSBtYXRjaCB0aGUgYmFzZSBhZGRyZXNzZXMsIHRh
YmxlIDMtOCBwYWdlIDQ2LCB3aXRoIHRoZSBtZW1vcnkgbWFwLCB0YWJsZQoxLTIgcGFnZSAxLCB0
aGV5IHNhbWUgYmFzZSBhZGRyZXNzZXMgaGF2ZSB0aGUgUEFEQ1RSTCBuYW1lcyBhYm92ZS4KCj4g
SSB0aGluayBzb21lIHVzZSB0aGUgbm9ydGgvc291dGgvZWFzdC93ZXN0IGFzIGdyb3VwIG5hbWVz
IHdpdGggdGhlIEJHQQo+IGNoaXAgZmFjaW5nIHVwIHdpdGggdGhlIHBhY2thZ2UgdGV4dCBjb3Jy
ZWN0bHkgcmVhZGFibGUgdGhlbiBpdCBpcyBhIGJpdAo+IGxpa2UgYSBtYXAuCgpJIGRvbid0IGtu
b3cgaWYgb3Igd2hlcmUgc3VjaCBkb2N1bWVudGF0aW9uIGlzIGF2YWlsYWJsZS4KSmlzaGVuZywg
R3VvIG9yIERyZXcsIGRvIHlvdSBrbm93PwoKPiA+ICsgICAgICAgICAgZnVuY3Rpb246Cj4gPiAr
ICAgICAgICAgICAgJHJlZjogL3NjaGVtYXMvdHlwZXMueWFtbCMvZGVmaW5pdGlvbnMvc3RyaW5n
Cj4gPiArICAgICAgICAgICAgZW51bTogWyAiMCIsICIxIiwgIjIiLCAiMyIsICI0IiwgIjUiIF0K
PiA+ICsgICAgICAgICAgICBkZXNjcmlwdGlvbjogVGhlIG11eCBmdW5jdGlvbiB0byBzZWxlY3Qg
Zm9yIHRoZSBnaXZlbiBwaW5zLgo+Cj4gU28gd2h5IGlzIHRoZSBvcGFxdWUgbmFtZXMgIjAiLCAi
MSIgZXRjIHVzZWQsIGFuZCB0aGV5IHdpbGwgYmUgdGhlIHNhbWUgZm9yCj4gYWxsIHBpbnMgSSBi
ZXQuIE1vc3QgZHJpdmVycyB1c2UgYSBzdHJpbmcgaWRlbnRpZnlpbmcgdGhlIGFjdHVhbCBmdW5j
dGlvbiBoZXJlLgo+IFN1Y2ggYXMgImkyYyIsICJncGlvIiwgZXRjLgo+Cj4gTmFtZXMgdGhhdCBh
cmUganVzdCBmaWd1cmVzIGFyZSAqaW1wb3NzaWJsZSogdG8gdW5kZXJzdGFuZCB3aXRob3V0IGFj
Y2Vzcwo+IHRvIGEgZGF0YXNoZWV0Lgo+Cj4gVGhlIHBvaW50IG9mIGRldmljZSB0cmVlcyBzb3Vy
Y2VzIGFyZSB0byBiZSBodW1hbiByZWFkYWJsZSwgc3RyaW5ncyBvZgo+IG1hZ2ljIG51bWJlcnMg
YXJlIG5vdCBodW1hbiByZWFkYWJsZSBhdCBhbGwuCj4KPiA+ICsgICAgICAgICAgYmlhcy1kaXNh
YmxlOiB0cnVlCj4gPiArCj4gPiArICAgICAgICAgIGJpYXMtcHVsbC11cDoKPiA+ICsgICAgICAg
ICAgICB0eXBlOiBib29sZWFuCj4gPiArCj4gPiArICAgICAgICAgIGJpYXMtcHVsbC1kb3duOgo+
ID4gKyAgICAgICAgICAgIHR5cGU6IGJvb2xlYW4KPiA+ICsKPiA+ICsgICAgICAgICAgZHJpdmUt
c3RyZW5ndGg6Cj4gPiArICAgICAgICAgICAgZW51bTogWyAxLCAyLCAzLCA1LCA3LCA4LCAxMCwg
MTIsIDEzLCAxNSwgMTYsIDE4LCAyMCwgMjEsIDIzLCAyNSBdCj4KPiBtaWxsaWFtcGVyZXM/IFRo
ZW4gdXNlIGRyaXZlLXN0cmVuZ3RoLW1pY3JvYW1wLgo+Cj4gSWYgbm90LCBleHBsYWluIHdoYXQg
ZWFjaCBzZXR0aW5nIG1lYW5zLCBpLmUuIHRoZSBudW1iZXIgb2YgbWF4IG1pY3JvYW1wcy4KCkl0
ICppcyogdGhlIG51bWJlciBvZiBtQS4gSSBjYW4gY2hhbmdlIGl0IHVBIGlmIHRoYXQncyBiZXR0
ZXIuCgo+IEF0IHdoaWNoIHBvaW50IHVzaW5nIGRyaXZlLXN0cmVuZ3RoLW1pY3JvYW1wIGFuZCBh
IHRyYW5zbGF0aW9uIHRhYmxlIGluIHRoZQo+IGRyaXZlciBtYXkgYmUgYSBiZXR0ZXIgaWRlYS4K
ClRoYXQncyB3aGF0IGl0IGRvZXMsIGp1c3Qgd2l0aCBtQS4KCj4gVGhlIG9ubHkgcmVhc29uIHRv
IHVzZSBvcGFxdWUgbnVtYmVycyBpcyBpZiAxLCAyIChldGMpIG1lYW4gc29tZXRoaW5nIGxpa2UK
PiAibnVtYmVyIG9mIGRyaXZlciBzdGFnZXMiIHdpdGggYSBjdXJyZW50IG91dHB1dCB0aGF0IHZh
cmllcyB3aXRoIHRlY2hub2xvZ3kuCj4KPiA+ICsgICAgICAgICAgdGhlYWQsc3Ryb25nLXB1bGwt
dXA6Cj4gPiArICAgICAgICAgICAgb25lT2Y6Cj4gPiArICAgICAgICAgICAgICAtIHR5cGU6IGJv
b2xlYW4KPiA+ICsgICAgICAgICAgICAgIC0gJHJlZjogL3NjaGVtYXMvdHlwZXMueWFtbCMvZGVm
aW5pdGlvbnMvdWludDMyCj4gPiArICAgICAgICAgICAgICAgIGVudW06IFsgMCwgMjEwMCBdCj4g
PiArICAgICAgICAgICAgZGVzY3JpcHRpb246IEVuYWJsZSBvciBkaXNhYmxlIHN0cm9uZyAyLjFr
T2htIHB1bGwtdXAuCj4KPiBKdXN0IHVzZSBiaWFzLXB1bGwtdXAgd2l0aCBhbiBhcmd1bWVudC4K
Pgo+IGJpYXMtcHVsbC11cCA9IDwyMTAwMDAwPjsKPgo+IE5vIGFyZ3VtZW50IHdvdWxkIGJlIHRo
ZSBkZWZhdWx0IHNldHRpbmcuCj4KPiBObyBuZWVkIGZvciBjdXN0b20gYmluZGluZ3MuCj4KPiA+
ICsgICAgICAgIHVhcnQwX3BpbnM6IHVhcnQwLTAgewo+ID4gKyAgICAgICAgICAgIHR4LXBpbnMg
ewo+ID4gKyAgICAgICAgICAgICAgICBwaW5zID0gIlVBUlQwX1RYRCI7Cj4KPiBQaW5zIGhhdmUg
cmVhc29uYWJsZSBuYW1lcywgYnV0Li4uCj4KPiA+ICsgICAgICAgICAgICAgICAgZnVuY3Rpb24g
PSAiMCI7Cj4KPiBXaGF0IGFib3V0IGZ1bmN0aW9uID0gInVhcnRfMCIgaG1tbT8KPgo+IFlvdXJz
LAo+IExpbnVzIFdhbGxlaWoKPgo+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCj4gbGludXgtcmlzY3YgbWFpbGluZyBsaXN0Cj4gbGludXgtcmlzY3ZAbGlz
dHMuaW5mcmFkZWFkLm9yZwo+IGh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlz
dGluZm8vbGludXgtcmlzY3YKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZy
YWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGlu
dXgtcmlzY3YK
