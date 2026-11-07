Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A55D4606A32C
	for <linux-riscv@archiver.kernel.org>; Sat,  7 Nov 2026 11:41:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=JNrLQKj+;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=z5rpejv5
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=6muhzqbfjvsyOMTQPN60217s4Qt3Wg2GMTMk+AqRyTs=; b=JNrLQKj+p9+8DuexLCdVqX3QM7
	x4zpw3ONHjMoOYAvz4hZv0ozZqt9DMFKcSns1mW5eRNzmrKbJr/WdT3nzETEZVTahIagfc8cwS48f
	Fd0d1XX3pNQopx4pu1lrh/AotJUvRuH4TVy3lu/BDYtRuyM+XeeaGDOaZ/3v34ktGefWWKeDi74F7
	EJaN0FML7x2eYgm0bakkiP4lm6+zmYjNCJaB5RM5/1C1VEnpbdyghMAM24sRAYBiOos5DYwRrHmRN
	ztsBleVFqp4PhiYEfc5xedl6uhbV2d3YzTifF4Nu8troDX9+i7hOTuefoXyPeZRzM1+H3ipIUnRnb
	T7Reu0Hw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPenE-0000000EcR5-3zPQ;
	Sat, 07 Nov 2026 11:41:08 +0000
Received: from mail-yw1-x1132.google.com ([2607:f8b0:4864:20::1132])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPenC-0000000EcQP-1Z3d
	for linux-riscv@lists.infradead.org;
	Sat, 07 Nov 2026 11:41:07 +0000
Received: by mail-yw1-x1132.google.com with SMTP id 00721157ae682-8b30cbfa628so16019057b3.0
        for <linux-riscv@lists.infradead.org>; Sat, 07 Nov 2026 03:41:05 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794051664; cv=none;
        d=google.com; s=arc-20260327;
        b=AqO0ayDqORjssbTqx5C67SRnH+rHQhv6vGNAbkD3RwK8IX3eoFbln0tlclH10mEjRV
         YXzEOfit5KD7pza+brj26rnnw0/MtG1TlDvyfTPkc1+dNBAuZBJ/TRqpxwY8Vqx94NRL
         01k8jadEEtJeQCo4Ml9mxQ/w1bP/nzZsB+wUNuReVHel6TnOL6Qxm7+UULQ6rfhoDD4G
         QWX8+4X7AUMvK1PMu0uw1Mj9oZ8OD9Nmv6sr4Siimjwv74N1w2rWy9KdchKZ/JewcZ2R
         l73h1aWkWTpi1fvB0vJMvDr5PH49SHks3IPaye8U0LPDKLyfj7WOWgG12sITNGxmjGaB
         y91A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=6fTH6XXWW1XsqnJehduXCj5gyuC0EEdV5T9p2wxK7S4=;
        fh=pYgADObWzcqytXZzfE74/3l9Ssalbx/e8VzGt5FXuOg=;
        b=MNii5Km3m0ypAf38U3xjXooCUHt0SBDpKPslDEFXHTRYTshZsnrr24/baHEA53+k2h
         E+onSoTMjrDU37CoxqEcQh0Hr42aXlnXlnxS/4tw/kJ1eBDs4+QcSygfD77ZZDSHn1Kw
         BvDkdc7dS2mHavL0hhOOGG273B2dFd9cxygz0ev2LdVKY4AsVV94TzQtsF7it0+xqVkm
         U8fAOJvwN3z4iusuqp/49jlIsyRrbu+kTSoui9NhNPG2baaKBi8kX1Mu2dnuP9Sk7oUe
         eYhRtC6igfukvb8/kc70lDDe5aEq9gZvXgNwZqI14A+qhFg/d6vgGqXlwoQJgqzLYcyl
         JqBA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794051664; x=1794656464; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=6fTH6XXWW1XsqnJehduXCj5gyuC0EEdV5T9p2wxK7S4=;
        b=z5rpejv5S845Fn4tNbtU7i+07oM3q9dfZS280WGdKSj9D4LOiDVLNRbQ7u1FP41XEN
         vACoYsEo3/z95plTdTzEDomLnUVYxoRX7sILoQYJT4fTUEB+QoOOE34U2C424LICFNQk
         IFpF9gdnBE+RaiHNWmq7hFsfm2v82ZYVJP4am5AxdnjYs/ov3l3xpOhuHT0w0b6EG/7Q
         GuVOhRtqP+H9+yKCp08ACalfpbn6R9gpmGTi0yglEQ1nYtaerafx5LhBCcuITYC7bshb
         iht6JEp4jVGPPHfUl/AXw/GJuYbqSCSnyw64uku/uLXKVRTbXYRKKBScnw2SqpLF12u8
         RSSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794051664; x=1794656464;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6fTH6XXWW1XsqnJehduXCj5gyuC0EEdV5T9p2wxK7S4=;
        b=HvkLdgfnKaB2NdihwOIIjXN3ZsQTZ83Z7mVUGJAx+ltcrZtRlig9VplZxbwieHvbw0
         ysHFJFiWAY6Wmix4bzUDOLLD+lB8mdQ8pjOMDgChwiopU4dnObhzXg/Wc9r4wZatb9E8
         ZV2iyqmSKVSKvGYiS7peUYin4vyWZD3Gus1HCxPkUPIyfpSzaCHrHbPsr69asjHci8Tq
         fCUCf9DWkAK3VlcIIxENFbrr/xShP+NQeTCQItcr2cHQRywsVFUx90+Y3eOHCOsn4vDe
         PPlk6oSmzpJoku6MlhVZOOPkBbjNSDVABmcOrRzTQknQbzT/SDncNAhD9/H6P7BM6jqy
         Ubcg==
X-Forwarded-Encrypted: i=1; AL+hErFRaz16QiuxMS2vL7ePU9gpa//hXkgtSU1eFmse5ajmLyWORv73KgbBpBHmWINzC7cMSPAwWWJmzStVxw==@lists.infradead.org
X-Gm-Message-State: APuU4Z805yZkM+znCU2PKiTAIQaugELvLae0RnEEbPgkALAU2jDU2YKL
	vZAbNJ1J4oDbnNYdGkGxhXiHdZcKyvjUapiQzp1Iaf9oATCKSbMPQtolUtDSnWrEmBBPh+kuNtd
	arwwCdjDTXW9xY3uCx0ug388OPQVYFcs6GYnL
X-Gm-Gg: AYBFou2cPAzr1o9iA2w1vmRNVu6zs3FrGx6s8O52RXEBrwTtJwhpRoAAm33Kn+/6UUj
	jYAdArwn+c75LeuC2Qsp9z66q7YDxJkkr/abnh9AzseQdh2goFbO0UFUY4/WLEGyZPAJ6urPPKM
	ehSi0/oPMmMDQDJdBOhsFni7vfDTw5jMu3096U30yqzORVOiAEDv6sGSrntb55CRkfpF4fY+Bjy
	dFzjgmuvO5eYH1s6851RZsmb3rxSpDQBLHDMJ8rdS+lBC6h1dhQMG8Vw/MKC1FkbuIjHyFV1YNt
	mR/1GuLiDsbkTKhmWF5QrC4gINSWRUwuKPTjWrzpGnec6TVZdkmnrZc3YMwUzop/ODUgrmLmq/I
	Y3npKA16a4jNMz1sJo3Vy/MsABgExVuHzJE15vi4jCllct8WsEqq7KhRMMQsGFu7+TQpVhf9apW
	QjBKXFiZeLZOIfwjjRpBfIYzC3xi94rQkyZFbMGwBrYQy3Vmgrda49edPTXLcGt9xWi/Z3fxL/L
	AqMgS8Fh7KYhusatwk+DeHZPuPfYC4zf9ob+DIizINNYXTM9EVo5G6DKeS1qQ==
X-Received: by 2002:a53:c056:0:20b0:677:c18f:7257 with SMTP id
 956f58d0204a3-67c141e4301mr2310364d50.23.1794051664343; Sat, 07 Nov 2026
 03:41:04 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261105201154.37294-2-matyasdaniel006@gmail.com>
 <874idv2bol.fsf@yellow.woof> <au4J-0GOUuueHLZe@rabbit>
In-Reply-To: <au4J-0GOUuueHLZe@rabbit>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Sat, 7 Nov 2026 13:40:28 +0200
X-Gm-Features: AclHuK9O7PUmgPlP4zevfIOy9d0EnpN6X7geLvTsMFUAaD8AWKettmZPb3yRw48
Message-ID: <CAHp75VedGBBd8qk5fO9-DkGwmuLQk77_igefAwTbrfcPCMW8Fg@mail.gmail.com>
Subject: Re: [RFC] staging: fbtft: Moving fb_ili9341 (and others) to DRM
To: Daniel Matyas <matyasdaniel006@gmail.com>
Cc: Nam Cao <namcao@linutronix.de>, dri-devel@lists.freedesktop.org, 
	linux-staging@lists.linux.dev, Andy Shevchenko <andy@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Alex Lanzano <lanzano.alex@gmail.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Conor Dooley <conor@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, linux-fbdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	devicetree@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261107_034106_444241_C01B8380 
X-CRM114-Status: GOOD (  19.76  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-0.8 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

T24gRnJpLCBOb3YgNiwgMjAyNiBhdCA3OjEw4oCvUE0gRGFuaWVsIE1hdHlhcyA8bWF0eWFzZGFu
aWVsMDA2QGdtYWlsLmNvbT4gd3JvdGU6Cj4KPiBPbiBUaHUsIE5vdiAwNSwgMjAyNiBhdCAxMDo0
NzowNlBNICswMTAwLCBOYW0gQ2FvIHdyb3RlOgo+ID4gRGFuaWVsIE1hdHlhcyA8bWF0eWFzZGFu
aWVsMDA2QGdtYWlsLmNvbT4gd3JpdGVzOgo+ID4gPiBRdWVzdGlvbnM6Cj4gPiA+ICBhKSBJcyBy
ZW1vdmluZyBmYl9pbGk5MzQxIGFjY2VwdGFibGUsIHBvaW50aW5nIHVzZXJzIG9mIG90aGVyIElM
STkzNDEKPiA+ID4gICAgIG1vZHVsZXMgdG8gcGFuZWwtbWlwaS1kYmk/IFRoZSBLRDIzMyBub2Rl
IHdvdWxkIHRoZW4gaGF2ZSBubyBkcml2ZXIuCj4gPiA+ICBiKSBPciBzaG91bGQgS0QyMzMgcGFu
ZWwgc3VwcG9ydCBnbyBpbnRvIGEgRFJNIGRyaXZlciBmaXJzdD8gSSBkb24ndCBoYXZlCj4gPiA+
ICAgICBpdHMgaW5pdCBzZXF1ZW5jZSBvciBwaHlzaWNhbCBzaXplLCBvciB0aGUgYm9hcmQuLi4K
PiA+ID4gIGMpIElzIHJlbW92YWwgb2YgYWxsIG9mIGZidGZ0IGFscmVhZHkgcGxhbm5lZD8KPiA+
ID4gIGQpIFNldmVyYWwgb3RoZXIgZmJ0ZnQgZHJpdmVycyBoYXZlIGRybSBjb3VudGVycGFydHMu
IFNob3VsZCBJIGluc3BlY3QgdGhvc2UKPiA+ID4gIHRvIHNlZSBpZiByZW1vdmFsIGlzIG5lZWRl
ZD8KPiA+Cj4gPiBJSVJDIHRoZSBtYWluIHJlYXNvbiBmYnRmdCBuZWVkcyB0byBzdGF5IGlzIGJl
Y2F1c2UgaXQgc3VwcG9ydHMgcGFyYWxsZWwKPiA+IGludGVyZmFjZSB3aGljaCBpcyBtaXNzaW5n
IGluIHRoZSBEUk0gZHJpdmVycy4KPiA+Cj4gPiBOYW0KPgo+IFRoYW5rIHlvdSBmb3IgY2xhcmlm
eWluZy4gSG93ZXZlciwgdGhlIGZiX2lsaTkzNDEgZHJpdmVyIHVzZXMgb25seSB0aGUKPiBTUEkg
aW50ZXJmYWNlLgoKT25seSB0d28gZHJpdmVycyB1c2UgdGhhdCBtYWNybywgaW5kZWVkOgpkcml2
ZXJzL3N0YWdpbmcvZmJ0ZnQvZmJfaWxpOTM0MS5jLCBsaW5lIDEzNgpkcml2ZXJzL3N0YWdpbmcv
ZmJ0ZnQvZmJfc2gxMTA2LmMsIGxpbmUgMTczCgo+IElzIGl0IGFscmlnaHQgdGhlbiB0byBtb3Zl
IChvciByZW1vdmUpIHRob3NlIGRyaXZlcnMgdGhhdCBvbmx5IHVzZQo+IFNQSSBpbnRlcmZhY2Ug
YW5kIGhhdmUgRFJNIGNvdW50ZXJwYXJ0cz8KCllvdSBjYW4gc3VnZ2VzdCByZW1vdmluZyBpdCwg
YnV0IGl0IG1pZ2h0IGJyZWFrIHNvbWUgdXNlcnMgKHllcywgSQp1bmRlcnN0YW5kIHRoYXQgRkJU
RlQgaXMgYSBzdGFnaW5nIGRyaXZlciksIGJ1dCBkb2luZyBzdWNoIG9ubHkgZm9yCnR3byBvdXQg
b2YgZG96ZW5zIGRyaXZlcnMgc2VlbXMgdG8gbWUgYSBiaXQgaW5jb25zaXN0ZW50IGFwcHJvYWNo
LgoKPiBGdXJ0aGVybW9yZSwgd291bGQgdGhlcmUgYmUgYSBuZWVkIHRvIGVuYWJsZSBwYXJhbGxl
bCBpbnRlcmZhY2Ugc3VwcG9ydAo+IGluIHRoZSBEUk0gc3Vic3lzdGVtPwoKSWYgeW91IGNhbiBk
byBpdCwgSSB3aWxsIGFncmVlIG9uIHJldGlyaW5nIHRoZSBGQlRGVCBkcml2ZXJzIHRoYXQgd2ls
bApnYWluIHN1Y2ggYSBzdXBwb3J0LiBJIGNhbiB0ZXN0IDgzNDdkIChJSVJDIEkgaGF2ZSB0aGF0
IHBhbmVsIGF0CmhhbmQpLgoKLS0gCldpdGggQmVzdCBSZWdhcmRzLApBbmR5IFNoZXZjaGVua28K
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJp
c2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9s
aXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
