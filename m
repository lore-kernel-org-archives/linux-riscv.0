Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F4065C48BC4
	for <linux-riscv@archiver.kernel.org>; Fri, 16 Feb 2024 14:03:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+F4FHAdpHOnA/xcPMn+DeunQpaslmAURfXdGWBCckfg=; b=BRCEjhkHTxk74J
	vu1DN78UYdncVYcfNaWMjGazVoASFqUlRspTUTrDbkwtmsyZtq8byKofszH1NUL9IHJWDxoho5f3I
	i6VBhxJO+3SVmwnTJiCgnQNmtULpJthoN4KXR3FK1eq/OxTlugCWr1CIxDuFlxigeKh0AMKP+8wHv
	QcR2LuL/XZBgGRwCzd0MuBPg+9glADU1iCNPTWzYYzwv6KjEEXsot+IlRQK1VscaIl7U61R+p8Cn/
	dxtdFZjiFayEJEA2hacPibC3TnJO6odRG1mfGC4TMrJWKoF64bSZISe9H7g7OIjDYyUyVaWE+kOHF
	gr9YRw+JwXIh1+9z66Vw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1raynw-00000002WGw-205f;
	Fri, 16 Feb 2024 14:03:04 +0000
Received: from mail-yw1-f175.google.com ([209.85.128.175])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1raynt-00000002WFR-2Qm9
	for linux-riscv@lists.infradead.org;
	Fri, 16 Feb 2024 14:03:02 +0000
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-607e54b6cf5so10155847b3.0
        for <linux-riscv@lists.infradead.org>; Fri, 16 Feb 2024 06:03:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708092178; x=1708696978;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sYIkHfrtyBzrh6C/58ppcoahvJUtd8BAYczbWxm3cHM=;
        b=HeKTzzOvr4Cac7iUbJCXGBO5TUrVFP2BixUfkQiZKv57Wi5UeCTPngeDMqQ/spYpiD
         Y/wNDTwIDeMlqhJA+1mIxfq6BZy1MJ9U0jOEVR47LARRXrSNQXs6rXtKdzIcDX+Hmegw
         an/zD4iloSHN/fqTg1B4Vw3ucyTiLLG1e6SvtzrcX8A28zYnUzrhqHGvJLoJYvwokmzE
         CliysyizkOFMslhl6oT9xI2fckNSqoTJ+d2DKgnfLLixn30np91NWeXgNBnigEIqnKES
         z5JR2v0CbmHQNnE9vT2DuWprzk9eEFELlxch/sSU3gb8ypXSQQDXFCbEdRT8PeifP+Y2
         5I7A==
X-Forwarded-Encrypted: i=1; AJvYcCWASocGsD8wPqus39yaEBcZl7LWEQYH54tK71K4uLp9xIOEVTn0jtJpOAJgBoyU0kl+mYun3n/10kTCejPm3lrrybzQ4dgbKDERRAVsTu/q
X-Gm-Message-State: AOJu0YwJneKM8APJTPH5NZDjZk98mF51Rpjd8BHSGq4DYLFkVs675tYi
	PxohjRKnJFgxryqv6QxGGjjQhd8O021mHebO+s0qqKdKuApGLAhi4pUHolwCyKw=
X-Google-Smtp-Source: AGHT+IFz84SluV5ac3nCmj4n+qFQjdfGp1YnSkeSJhI5msNZMl+FK99wWdXLjaNiAQl07gFha7E/YQ==
X-Received: by 2002:a05:690c:4813:b0:607:a965:a7cc with SMTP id hc19-20020a05690c481300b00607a965a7ccmr5434715ywb.5.1708092178327;
        Fri, 16 Feb 2024 06:02:58 -0800 (PST)
Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com. [209.85.128.174])
        by smtp.gmail.com with ESMTPSA id w189-20020a0dd4c6000000b006077f156d24sm352073ywd.75.2024.02.16.06.02.57
        for <linux-riscv@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 Feb 2024 06:02:57 -0800 (PST)
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-603fd31f5c2so26522617b3.0
        for <linux-riscv@lists.infradead.org>; Fri, 16 Feb 2024 06:02:57 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWsnf0TRHZwzP9yccaFgjymCqkFEgtvs6XAK0ypm7wEwyplwfu/MMknnZkhyE2cDU0uCUsvUtViiz5pTawB99bWUWCAhtMb3+qaP2TiVehZ
X-Received: by 2002:a0d:ca12:0:b0:604:8433:5834 with SMTP id
 m18-20020a0dca12000000b0060484335834mr3367318ywd.9.1708092177370; Fri, 16 Feb
 2024 06:02:57 -0800 (PST)
MIME-Version: 1.0
References: <20240208124300.2740313-1-claudiu.beznea.uj@bp.renesas.com> <20240208124300.2740313-4-claudiu.beznea.uj@bp.renesas.com>
In-Reply-To: <20240208124300.2740313-4-claudiu.beznea.uj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 16 Feb 2024 15:02:45 +0100
X-Gmail-Original-Message-ID: <CAMuHMdV5+tP7+z0_SUfd0vnRao-LwU8uN61Yq59OjUL_ZztujQ@mail.gmail.com>
Message-ID: <CAMuHMdV5+tP7+z0_SUfd0vnRao-LwU8uN61Yq59OjUL_ZztujQ@mail.gmail.com>
Subject: Re: [PATCH 03/17] dt-bindings: clock: r9a07g054-cpg: Add power domain IDs
To: Claudiu <claudiu.beznea@tuxon.dev>
Cc: mturquette@baylibre.com, sboyd@kernel.org, robh@kernel.org, 
	krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org, magnus.damm@gmail.com, 
	paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu, 
	linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org, 
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240216_060301_636950_A9BFA101 
X-CRM114-Status: GOOD (  13.65  )
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

SGkgQ2xhdWRpdSwKCk9uIFRodSwgRmViIDgsIDIwMjQgYXQgMTo0M+KAr1BNIENsYXVkaXUgPGNs
YXVkaXUuYmV6bmVhQHR1eG9uLmRldj4gd3JvdGU6Cj4gRnJvbTogQ2xhdWRpdSBCZXpuZWEgPGNs
YXVkaXUuYmV6bmVhLnVqQGJwLnJlbmVzYXMuY29tPgo+Cj4gQWRkIHBvd2VyIGRvbWFpbiBJRHMg
Zm9yIFJaL1YyTCAoUjlBMDdHMDU0KSBTb0MuCj4KPiBTaWduZWQtb2ZmLWJ5OiBDbGF1ZGl1IEJl
em5lYSA8Y2xhdWRpdS5iZXpuZWEudWpAYnAucmVuZXNhcy5jb20+CgpUaGFua3MgZm9yIHlvdXIg
cGF0Y2ghCgpJIHdhcyBhIGJpdCBzdXJwcmlzZWQgdG8gc2VlIG5vIG5ldyBkZWZpbml0aW9ucyBm
b3IgdGhlIFJaL1YyTCBibG9ja3MKdGhhdCBhcmUgbm90IHByZXNlbnQgb24gUlovRzJMIChlLmcu
IERSUCksIGJ1dCB0aGUgZG9jdW1lbnRhdGlvbiBhZ3JlZXMuCgpSZXZpZXdlZC1ieTogR2VlcnQg
VXl0dGVyaG9ldmVuIDxnZWVydCtyZW5lc2FzQGdsaWRlci5iZT4KCkdye29ldGplLGVldGluZ31z
LAoKICAgICAgICAgICAgICAgICAgICAgICAgR2VlcnQKCgotLQpHZWVydCBVeXR0ZXJob2V2ZW4g
LS0gVGhlcmUncyBsb3RzIG9mIExpbnV4IGJleW9uZCBpYTMyIC0tIGdlZXJ0QGxpbnV4LW02OGsu
b3JnCgpJbiBwZXJzb25hbCBjb252ZXJzYXRpb25zIHdpdGggdGVjaG5pY2FsIHBlb3BsZSwgSSBj
YWxsIG15c2VsZiBhIGhhY2tlci4gQnV0CndoZW4gSSdtIHRhbGtpbmcgdG8gam91cm5hbGlzdHMg
SSBqdXN0IHNheSAicHJvZ3JhbW1lciIgb3Igc29tZXRoaW5nIGxpa2UgdGhhdC4KICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAtLSBMaW51cyBUb3J2YWxkcwoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0
CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5v
cmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
