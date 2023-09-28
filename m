Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2936E732C5
	for <linux-riscv@archiver.kernel.org>; Thu, 28 Sep 2023 11:42:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rU0RvaHy47yizdboEE7+fTHLoe8cdk8CDLJJ3aCXRKE=; b=36o4mqtB2PiNON
	l0CsrmwFbExxdyYlfkF3Bu5EgYH9EjBMPi0Cqdu7ofvIiwzyms/rCWNl2W4Qyn5CokE9BwWayP1h7
	yaWU1rsMgWNGjDV8KE2qiCiywZXsDdMkH5mERaacW0nDx46V7Ma16O1yRHdn15XeyKFLDfveGGGTP
	JMNK1m191gC3lxbUFypyFjO1g2RzaN6qFD2hn46Lp0iU12pu2FeM4IO1pWVNtdOAxmN8nK2Tuj3Co
	mcujom/vxPLgyItAGBnl4Q2cErj/lhOs3fw2/KxlHy1QdNnkAPHSyO9TS8LKme1/itwD/PNY6LAo5
	ut6wPqKdv21VAD7A/yZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qlpPi-003KTE-0E;
	Thu, 28 Sep 2023 11:42:38 +0000
Received: from mail-yw1-f173.google.com ([209.85.128.173])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qlpPd-003KPB-37
	for linux-riscv@lists.infradead.org;
	Thu, 28 Sep 2023 11:42:35 +0000
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-5a200028437so33569887b3.1
        for <linux-riscv@lists.infradead.org>; Thu, 28 Sep 2023 04:42:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695901351; x=1696506151;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=P126arM5ynAe8A5WRmgE6i+j3G1VPUvbv1KSB/lujvw=;
        b=CxuLXXmj9CvS5ocXEgKR0KkaW08zjsQoAgZIQ6onYBjAKdsyE4jmIaHSna/HCs3K3x
         YloA5STHjWexVHv13HXY22B8F45K9Zqb3w/QiRgjBp2wKSmbTNS/irkcIHIneGwaTlQn
         23sZxzbxmYbIqi6FWGj/NJi+gLm0jIpSDECSqRPy4l627CGwI+Bur7JHhU3s0pj0yglk
         BAHBQhQ1QKiWsT7EZskJubyU4+IVjLxtaQ04LWt5adLD2PjDpvzHyQTv+jFKiHcnYbbG
         1TTYviAye9C+XF6JFiTbkoGkk9jrZoXk6iP22tAA4NgU2/KDhtQnx4YH/vAAguSXI7d3
         GgDg==
X-Gm-Message-State: AOJu0YzZfnmVuEnAsF3YX9+vzfbFKlhuTgyIFv7CKimwdQ5MMI3ZyYag
	UCzoOaCtsRX+tUtn8PPOITINbQWlViGejQ==
X-Google-Smtp-Source: AGHT+IHS160bELXJf/pXJ/cpwJBFNAGHXX3va5QYf8OCu5SMF164IrY93iLSJgbtQVFuQTq4W3OoYQ==
X-Received: by 2002:a81:6006:0:b0:59b:ec10:915e with SMTP id u6-20020a816006000000b0059bec10915emr889508ywb.30.1695901350982;
        Thu, 28 Sep 2023 04:42:30 -0700 (PDT)
Received: from mail-yb1-f182.google.com (mail-yb1-f182.google.com. [209.85.219.182])
        by smtp.gmail.com with ESMTPSA id i206-20020a8154d7000000b00585f60e970esm4493748ywb.134.2023.09.28.04.42.30
        for <linux-riscv@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 28 Sep 2023 04:42:30 -0700 (PDT)
Received: by mail-yb1-f182.google.com with SMTP id 3f1490d57ef6-d8673a90f56so11098076276.0
        for <linux-riscv@lists.infradead.org>; Thu, 28 Sep 2023 04:42:30 -0700 (PDT)
X-Received: by 2002:a25:e00a:0:b0:d86:357:e314 with SMTP id
 x10-20020a25e00a000000b00d860357e314mr805399ybg.47.1695901349832; Thu, 28 Sep
 2023 04:42:29 -0700 (PDT)
MIME-Version: 1.0
References: <20230928104520.24768-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20230928104520.24768-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 28 Sep 2023 13:42:15 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUCc=M0khCyipEBFF+52OvgFQD4bOw=+bo564DvQZTUKA@mail.gmail.com>
Message-ID: <CAMuHMdUCc=M0khCyipEBFF+52OvgFQD4bOw=+bo564DvQZTUKA@mail.gmail.com>
Subject: Re: [PATCH] clocksource/drivers/riscv: Increase the clock_event rating
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Daniel Lezcano <daniel.lezcano@linaro.org>, Thomas Gleixner <tglx@linutronix.de>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Samuel Holland <samuel@sholland.org>, 
	Anup Patel <anup@brainfault.org>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Conor Dooley <conor.dooley@microchip.com>, Biju Das <biju.das.jz@bp.renesas.com>, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-renesas-soc@vger.kernel.org, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230928_044234_024064_0AEB4576 
X-CRM114-Status: GOOD (  18.92  )
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

T24gVGh1LCBTZXAgMjgsIDIwMjMgYXQgMTI6NDXigK9QTSBQcmFiaGFrYXIgPHByYWJoYWthci5j
c2VuZ2dAZ21haWwuY29tPiB3cm90ZToKPiBGcm9tOiBMYWQgUHJhYmhha2FyIDxwcmFiaGFrYXIu
bWFoYWRldi1sYWQucmpAYnAucmVuZXNhcy5jb20+Cj4KPiBSZW5lc2FzIFJaL0ZpdmUgU29DIGhh
cyBPU1RNIGJsb2NrcyB3aGljaCBjYW4gYmUgdXNlZCBmb3IgY2xvY2tfZXZlbnQgYW5kCj4gY2xv
Y2tzb3VyY2UgWzBdLiBUaGUgY2xvY2tfZXZlbnQgcmF0aW5nIGZvciB0aGUgT1NUTSBpcyBzZXQg
MzAwIGJ1dAo+IHdoZXJlYXMgdGhlIHJhdGluZyBmb3IgcmlzY3YtdGltZXIgY2xvY2tfZXZlbnQg
aXMgc2V0IHRvIDEwMCBkdWUgdG8gd2hpY2gKPiB0aGUga2VybmVsIGlzIGNob29zaW5nIE9TVE0g
Zm9yIGNsb2NrX2V2ZW50Lgo+Cj4gQXMgcmlzY3YtdGltZXIgaXMgbXVjaCBtb3JlIGVmZmljaWVu
dCB0aGFuIE1NSU8gY2xvY2tfZXZlbnQsIGluY3JlYXNlIHRoZQo+IHJhdGluZyB0byA0MDAgc28g
dGhhdCB0aGUga2VybmVsIHByZWZlcnMgcmlzY3YtdGltZXIgb3ZlciB0aGUgTU1JTyBiYXNlZAo+
IGNsb2NrX2V2ZW50Lgo+Cj4gWzBdIGRyaXZlcnMvY2xvY2tzb3VyY2UvcmVuZXNhcy1vc3RtLmMK
Pgo+IFNpZ25lZC1vZmYtYnk6IExhZCBQcmFiaGFrYXIgPHByYWJoYWthci5tYWhhZGV2LWxhZC5y
akBicC5yZW5lc2FzLmNvbT4KPiAtLS0KPiBOb3RlLCBJdmUgc2V0IHRoZSByYXRpbmcgc2ltaWxh
ciB0byBSSVNDLVYgY2xvY2tzb3VyY2UsIG9uIEFSTSBhcmNoaXRlY3R1cmUKPiB0aGUgcmF0aW5n
IGZvciBjbGtfZXZlbnQgaXMgc2V0IHRvIDQ1MC4KCk1ha2VzIHNlbnNlLgpSZXZpZXdlZC1ieTog
R2VlcnQgVXl0dGVyaG9ldmVuIDxnZWVydCtyZW5lc2FzQGdsaWRlci5iZT4KCkdye29ldGplLGVl
dGluZ31zLAoKICAgICAgICAgICAgICAgICAgICAgICAgR2VlcnQKCi0tIApHZWVydCBVeXR0ZXJo
b2V2ZW4gLS0gVGhlcmUncyBsb3RzIG9mIExpbnV4IGJleW9uZCBpYTMyIC0tIGdlZXJ0QGxpbnV4
LW02OGsub3JnCgpJbiBwZXJzb25hbCBjb252ZXJzYXRpb25zIHdpdGggdGVjaG5pY2FsIHBlb3Bs
ZSwgSSBjYWxsIG15c2VsZiBhIGhhY2tlci4gQnV0CndoZW4gSSdtIHRhbGtpbmcgdG8gam91cm5h
bGlzdHMgSSBqdXN0IHNheSAicHJvZ3JhbW1lciIgb3Igc29tZXRoaW5nIGxpa2UgdGhhdC4KICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAtLSBMaW51cyBUb3J2YWxkcwoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGlu
ZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJh
ZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
