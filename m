Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F678E75453
	for <linux-riscv@archiver.kernel.org>; Tue,  3 Oct 2023 12:25:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=g+ZgqQPkX+Ko8fa2Hhz/alquNfkKfgiXzeLz52fCOVo=; b=0XmKVB8YXjVhI/
	C1Kb6neXrtYgat9ekbZt/pnbJh7A2f2KSmlhX9rK0PRmeFiAf+TbZEO9mbxgp84E/syFJ32DQ9868
	TD7a3lijsItEelVWTgD2WG/McIRNffYOTtKoFM3Ou/l51EqM0f3/LEX3SvRrru5N8x2pjg86UjAam
	bxHOwnug8v/8TLjtWIBjnCpvXFzxhOLftnqFHD0qI1vgZfdjykXSsmigN5cpUjMRARHJSPzMS+SPf
	xduT9lzPcfpa40amcEZFzJzF9lQIUbvIAntk3xCGbqc0p2frM+Im1kV0p57dEn0PYpbbMndJHV4oD
	q6mJYpo3hZr3e8jKLTUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qneSR-00Ebr2-1V;
	Tue, 03 Oct 2023 12:24:59 +0000
Received: from mail-yb1-f171.google.com ([209.85.219.171])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qneSO-00Ebq9-1Y
	for linux-riscv@lists.infradead.org;
	Tue, 03 Oct 2023 12:24:57 +0000
Received: by mail-yb1-f171.google.com with SMTP id 3f1490d57ef6-d84c24a810dso897944276.2
        for <linux-riscv@lists.infradead.org>; Tue, 03 Oct 2023 05:24:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696335894; x=1696940694;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FM7F2ErDCT18gWR6Yw2KxppndzFMwSzkF3KAWh0GJec=;
        b=DUmXvyvrjQ1LPaO/j6E3fSln+wzE9Z0IXJM11ZK1l71rnPasF1WQxaQVwdEU1Kp+Bd
         fmqPkXqsnPgzmhNRQ12bsFV6ssZZxzq0K/3ewXralnW6HlObVW7YJ2vNpG9U3O71TKi9
         dymwmNLzvj2pCEI8D/aTgVMzBxBnIWjZsz0u0nuy1o1KQpYEa4WH5a1TnbItukUk/5ux
         H1eZu8ev6VdiZ3DRDJ41gzyxin/igPnjeAGqsj+OfOfEgYh8a8RGizrlR7G2Cf4br51r
         q7Q5+QgtUchxtXzaUWdH2o2enwJtjf8PInvvUWlVpk8o5O7RmgtkOYDhOMmLR8/r4yHq
         XCng==
X-Gm-Message-State: AOJu0Yw6iA7TgCRtjNLOP5z20vi8e+y0lg1kFq0ycMZUB+tpzV/IcDKR
	2NNTiG/zIQ7icUP3J3wyGhXn6aLoULXZ0g==
X-Google-Smtp-Source: AGHT+IF3T7F6196Fx/PYqzHL50ORZ9Fa6Fy5E1K1IlehtDyzuvFJRcALI5e8oZVV0QDGO6b0j8a19g==
X-Received: by 2002:a25:d28a:0:b0:d90:a7b9:fed with SMTP id j132-20020a25d28a000000b00d90a7b90fedmr6432098ybg.3.1696335894013;
        Tue, 03 Oct 2023 05:24:54 -0700 (PDT)
Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com. [209.85.128.170])
        by smtp.gmail.com with ESMTPSA id y2-20020a25ad02000000b00d746487d6f7sm370420ybi.35.2023.10.03.05.24.52
        for <linux-riscv@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Oct 2023 05:24:53 -0700 (PDT)
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-579de633419so10333137b3.3
        for <linux-riscv@lists.infradead.org>; Tue, 03 Oct 2023 05:24:52 -0700 (PDT)
X-Received: by 2002:a81:a182:0:b0:59f:5013:b19d with SMTP id
 y124-20020a81a182000000b0059f5013b19dmr13601255ywg.17.1696335892593; Tue, 03
 Oct 2023 05:24:52 -0700 (PDT)
MIME-Version: 1.0
References: <20230929000704.53217-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20230929000704.53217-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20230929000704.53217-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 3 Oct 2023 14:24:40 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXQK=7uaow7Yazusi8vtL+U_fwxBXjH6UFu53XhU31zCg@mail.gmail.com>
Message-ID: <CAMuHMdXQK=7uaow7Yazusi8vtL+U_fwxBXjH6UFu53XhU31zCg@mail.gmail.com>
Subject: Re: [PATCH 2/5] riscv: dts: renesas: r9a07g043f: Add dma-noncoherent property
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Magnus Damm <magnus.damm@gmail.com>, Conor Dooley <conor+dt@kernel.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, linux-renesas-soc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231003_052456_517244_07C82D83 
X-CRM114-Status: GOOD (  14.24  )
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

T24gRnJpLCBTZXAgMjksIDIwMjMgYXQgMjowN+KAr0FNIFByYWJoYWthciA8cHJhYmhha2FyLmNz
ZW5nZ0BnbWFpbC5jb20+IHdyb3RlOgo+IEZyb206IExhZCBQcmFiaGFrYXIgPHByYWJoYWthci5t
YWhhZGV2LWxhZC5yakBicC5yZW5lc2FzLmNvbT4KPgo+IFJaL0ZpdmUgaXMgYSBub25jb2hlcmVu
dCBTb0Mgc28gdG8gaW5kaWNhdGUgdGhpcyBhZGQgZG1hLW5vbmNvaGVyZW50Cj4gcHJvcGVydHkg
dG8gUlovRml2ZSBTb0MgRFRTSS4KPgo+IFNpZ25lZC1vZmYtYnk6IExhZCBQcmFiaGFrYXIgPHBy
YWJoYWthci5tYWhhZGV2LWxhZC5yakBicC5yZW5lc2FzLmNvbT4KClJldmlld2VkLWJ5OiBHZWVy
dCBVeXR0ZXJob2V2ZW4gPGdlZXJ0K3JlbmVzYXNAZ2xpZGVyLmJlPgppLmUuIHdpbGwgcXVldWUg
aW4gcmVuZXNhcy1kZXZlbCBmb3IgdjYuNy4KCkdye29ldGplLGVldGluZ31zLAoKICAgICAgICAg
ICAgICAgICAgICAgICAgR2VlcnQKCi0tIApHZWVydCBVeXR0ZXJob2V2ZW4gLS0gVGhlcmUncyBs
b3RzIG9mIExpbnV4IGJleW9uZCBpYTMyIC0tIGdlZXJ0QGxpbnV4LW02OGsub3JnCgpJbiBwZXJz
b25hbCBjb252ZXJzYXRpb25zIHdpdGggdGVjaG5pY2FsIHBlb3BsZSwgSSBjYWxsIG15c2VsZiBh
IGhhY2tlci4gQnV0CndoZW4gSSdtIHRhbGtpbmcgdG8gam91cm5hbGlzdHMgSSBqdXN0IHNheSAi
cHJvZ3JhbW1lciIgb3Igc29tZXRoaW5nIGxpa2UgdGhhdC4KICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAtLSBMaW51cyBUb3J2YWxkcwoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2
QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9saW51eC1yaXNjdgo=
