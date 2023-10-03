Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D42AE75456
	for <linux-riscv@archiver.kernel.org>; Tue,  3 Oct 2023 12:28:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OUdNM8BgqTyItrmnyPIefeCKV8vmuMHP/OLUlY3gitQ=; b=j+rldoZFxGanFS
	q1IusFsQf64z3Xm2Ef/8GHnrFiuXYK0ttXEEpxZ2LouCeQYCE2PunCG8a46F47yeeNbSpvkNtz5r3
	febnCyGSLyd0n/ZPrLBWSSoIdfQ9O9TpCMEAXvVxtdJr9Ga3qQ3HNtIwHTeFcRWkldmMUDaqu3NxY
	Xqdu3AqH0ZLd0mrkwyJOquER6tUs+4qhs4SFaK8rMUBCjZB1oMvmSrzUVq6POUDGCD/mdU28wJyAy
	7bjuf4tIMEwXZPk8TgZo/LvlHUm4JUnoCgR6DYq1GY8FQcGSpEgq9MJmg6Rs697Cean3vwEz3Npdu
	zBagFpzA/PIWeylSM4Pw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qneW8-00EcBx-0r;
	Tue, 03 Oct 2023 12:28:48 +0000
Received: from mail-yw1-f174.google.com ([209.85.128.174])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qneW4-00EcB3-1Q
	for linux-riscv@lists.infradead.org;
	Tue, 03 Oct 2023 12:28:45 +0000
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-59f4db9e11eso10072347b3.0
        for <linux-riscv@lists.infradead.org>; Tue, 03 Oct 2023 05:28:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696336122; x=1696940922;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cdrE52/yDmlFhN9BdIXTdjHpAQ6B5kQ58qoowkP5X64=;
        b=Mn+5rBOEAuM/8DQdpcya/k7oNIsuVJQowK/mz7W8MeRmkwgnlv6i574PLcJn2aTE1u
         Z2teCydAv+fE90xRRSleA0ZPUUSib9Ub7uQZpYC/CjhIOUpWpNSld8zOQcMwiSHb58bX
         WDamZ0KbzrU1tpygR9YQ4ZxsDMYBr8+W9BQvt3FGPs+xQQsZLPL4FhRKpXiX0Nqw9LOc
         0bO2oj0TH84fQ2NZnUq3Z4m0AyTwAfC/CNt/4udYSID4zQMkmGsXlk6NLK1tM6HT4Vgj
         AnUj5S8Ooc+wsko3dqiuKvRjO8PuCKwPU27BPWLdZ06/bayo4ARe8URGoCcfWJeANlbK
         61Hw==
X-Gm-Message-State: AOJu0YwQ/C19QT7U8qUJ/eK54gpf55NCrSEH2XIGWuEjaOeQNui+LfW5
	5J4HGIxehB/KqqluBnkJbnAGKHbyPcN1KQ==
X-Google-Smtp-Source: AGHT+IFHLy+ok0G8Jncka79s/+CijfbBr3ZueNoOzCva833m4mEUi+OLnWQaeltI5sYUr3Ek6rKmUg==
X-Received: by 2002:a81:6285:0:b0:59f:72b3:e590 with SMTP id w127-20020a816285000000b0059f72b3e590mr13796193ywb.45.1696336122169;
        Tue, 03 Oct 2023 05:28:42 -0700 (PDT)
Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com. [209.85.128.173])
        by smtp.gmail.com with ESMTPSA id d78-20020a814f51000000b0058e430889d5sm345017ywb.10.2023.10.03.05.28.41
        for <linux-riscv@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Oct 2023 05:28:41 -0700 (PDT)
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-5a22f9e2f40so9940597b3.1
        for <linux-riscv@lists.infradead.org>; Tue, 03 Oct 2023 05:28:41 -0700 (PDT)
X-Received: by 2002:a81:8392:0:b0:59f:7f8e:dc4a with SMTP id
 t140-20020a818392000000b0059f7f8edc4amr15076304ywf.22.1696336121420; Tue, 03
 Oct 2023 05:28:41 -0700 (PDT)
MIME-Version: 1.0
References: <20230929000704.53217-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20230929000704.53217-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20230929000704.53217-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 3 Oct 2023 14:28:29 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWq8R0QtDxNRkask3kipnSXmOzR_TjV3Hy0bkF0378CyQ@mail.gmail.com>
Message-ID: <CAMuHMdWq8R0QtDxNRkask3kipnSXmOzR_TjV3Hy0bkF0378CyQ@mail.gmail.com>
Subject: Re: [PATCH 3/5] riscv: dts: renesas: rzfive-smarc: Enable the blocks
 which were explicitly disabled
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Magnus Damm <magnus.damm@gmail.com>, Conor Dooley <conor+dt@kernel.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, linux-renesas-soc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231003_052844_479662_B91383E4 
X-CRM114-Status: GOOD (  17.55  )
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

SGkgUHJhYmhha2FyLAoKVGhhbmtzIGZvciB5b3VyIHBhdGNoIQoKT24gRnJpLCBTZXAgMjksIDIw
MjMgYXQgMjowN+KAr0FNIFByYWJoYWthciA8cHJhYmhha2FyLmNzZW5nZ0BnbWFpbC5jb20+IHdy
b3RlOgo+IEZyb206IExhZCBQcmFiaGFrYXIgPHByYWJoYWthci5tYWhhZGV2LWxhZC5yakBicC5y
ZW5lc2FzLmNvbT4KPgo+IE5vdyB0aGF0IG5vbmNvaGVyZW50IGRtYSBzdXBwb3J0IGlzIGFkZGVk
IGZvciBSWi9GaXZlIFNvQyBlbmFibGUKPiB0aGUgSVAgYmxvY2tzIHdoaWNoIHdlcmUgZGlzYWJs
ZWQgb24gUlovRml2ZSBTTUFSQy4gTm93IHdpdGggdGhpcwo+IHBhdGNoIHdlIGdldCBzdXBwb3J0
IGZvciB0aGUgYmVsb3cgcGVyaXBoZXJhbHM6Cj4gKiBETUFDCj4gKiBTREhJCj4gKiBVU0IKPiAq
IFJTUEkKPiAqIFNTSQoKYW5kIEV0aGVybmV0PyA7LSkKCj4gU2lnbmVkLW9mZi1ieTogTGFkIFBy
YWJoYWthciA8cHJhYmhha2FyLm1haGFkZXYtbGFkLnJqQGJwLnJlbmVzYXMuY29tPgoKUmV2aWV3
ZWQtYnk6IEdlZXJ0IFV5dHRlcmhvZXZlbiA8Z2VlcnQrcmVuZXNhc0BnbGlkZXIuYmU+CmkuZS4g
d2lsbCBxdWV1ZSBpbiByZW5lc2FzLWRldmVsIGZvciB2Ni43LCB3aXRoICJFdGhlcm5ldCIgYWRk
ZWQuCgpHcntvZXRqZSxlZXRpbmd9cywKCiAgICAgICAgICAgICAgICAgICAgICAgIEdlZXJ0Cgot
LQpHZWVydCBVeXR0ZXJob2V2ZW4gLS0gVGhlcmUncyBsb3RzIG9mIExpbnV4IGJleW9uZCBpYTMy
IC0tIGdlZXJ0QGxpbnV4LW02OGsub3JnCgpJbiBwZXJzb25hbCBjb252ZXJzYXRpb25zIHdpdGgg
dGVjaG5pY2FsIHBlb3BsZSwgSSBjYWxsIG15c2VsZiBhIGhhY2tlci4gQnV0CndoZW4gSSdtIHRh
bGtpbmcgdG8gam91cm5hbGlzdHMgSSBqdXN0IHNheSAicHJvZ3JhbW1lciIgb3Igc29tZXRoaW5n
IGxpa2UgdGhhdC4KICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAtLSBMaW51cyBUb3J2
YWxkcwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGlu
dXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0
cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
