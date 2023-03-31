Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FA33C6FD18
	for <linux-riscv@archiver.kernel.org>; Fri, 31 Mar 2023 07:38:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/BtLBNwtNOdvq159neo8tM+xDa8fHR+fqcB89hFw/FU=; b=MiMRZqoGzm2TDw
	KAM8V1o9ikSgPxw2NJwWyEzWg5R88sB5JRSUqgQ6DU5/OvZKRrpOx0KeUbqSESb6nD29X1Tia2DwE
	1aPGXGTP7h/iO8akG6qGkqjieuCj+GFy+vFykrecUO1wQ2lW22FkEvgGh2Ovq1dVpGblZ6oL2WwEv
	c8Pltn2WC5oVEWzfROBY/H/L0QtKEXd9DWZ6wy6IL5dny/PXqjTBtgjl3Q90ssmW350xIAR2DsxnD
	owQEQtqh0l6oIZrzBc8LWd0x2HPIJTAz5Fo9bt97aOUksgAzIAe5Lgd4QntBgpFi3Z+YWGM0h2YBN
	8tu1NCAigea638Cuye2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pi9Kr-006BRV-1L;
	Fri, 31 Mar 2023 07:38:09 +0000
Received: from mail-yw1-f170.google.com ([209.85.128.170])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pi9Kp-006BQv-01
	for linux-riscv@lists.infradead.org;
	Fri, 31 Mar 2023 07:38:08 +0000
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-536af432ee5so401074987b3.0
        for <linux-riscv@lists.infradead.org>; Fri, 31 Mar 2023 00:38:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680248285;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8tPu3wpNf5OOm3sambBzAkZeluIlHnIKjl7VjT4mTMc=;
        b=V8+4myjfxQnz59fwBJ624hwQFFzhfbySEUW6Rn9PNwZdFWo/F1c0UyK5lmuZsT+qqB
         s3uhY7RT8t5kCEHL8l3RyKHC+z9qpBJi3ko8eTiTDRKVhumvBOgZD/zzPFowPCHnuImL
         Iw6iaPgitlArVTwpInwcyiFcQZpIwF+vsTCRuMp46JfVa6IcdsBpKQQaWsKX/OcxTMVw
         IRCoUmYODl3fC2COVt/S0qkYfETJfkK3SWkAcnGGBji2Z7Pm482Wyi/dFsna+igU++nU
         bl5E5d5zNNuKSoOh1KN1xSB/KmjPT1gaecHNLyzPbaIaZVXWjyi99P5rHpsJmLOyQxSB
         442g==
X-Gm-Message-State: AAQBX9f6cegSpN3nrtKXD5ywJ/DD58qiG9w984ml8cUXgmyajuplS2We
	Eyse0hIzVnkYCNyI4KgOKGiYyedV1aYkHrPs
X-Google-Smtp-Source: AKy350Z3qGH1bfZXdN4JOsQV9SJALsQzipcD6FCJZi6qUf9FLdpggvbKnrjZr/76UBIO0wMW9exL+A==
X-Received: by 2002:a0d:ebc5:0:b0:544:8c48:90e8 with SMTP id u188-20020a0debc5000000b005448c4890e8mr25486451ywe.4.1680248284017;
        Fri, 31 Mar 2023 00:38:04 -0700 (PDT)
Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com. [209.85.128.171])
        by smtp.gmail.com with ESMTPSA id r68-20020a81b347000000b00545c81c9f38sm369254ywh.115.2023.03.31.00.38.02
        for <linux-riscv@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 31 Mar 2023 00:38:03 -0700 (PDT)
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-536af432ee5so401072957b3.0
        for <linux-riscv@lists.infradead.org>; Fri, 31 Mar 2023 00:38:02 -0700 (PDT)
X-Received: by 2002:a81:b3c6:0:b0:541:7f69:aa9b with SMTP id
 r189-20020a81b3c6000000b005417f69aa9bmr12427975ywh.4.1680248282389; Fri, 31
 Mar 2023 00:38:02 -0700 (PDT)
MIME-Version: 1.0
References: <20230330204217.47666-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20230330204217.47666-7-prabhakar.mahadev-lad.rj@bp.renesas.com> <CAMuHMdWz=Vf1svs3TJrCSq8ED0rEy-NURQ++bUspo73zfct50A@mail.gmail.com>
In-Reply-To: <CAMuHMdWz=Vf1svs3TJrCSq8ED0rEy-NURQ++bUspo73zfct50A@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 31 Mar 2023 09:37:50 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXqK7HYEyL3oTbvD-ebOfp7Nd6REpzOTB=26J7g5C1Pqg@mail.gmail.com>
Message-ID: <CAMuHMdXqK7HYEyL3oTbvD-ebOfp7Nd6REpzOTB=26J7g5C1Pqg@mail.gmail.com>
Subject: Re: [PATCH v7 6/6] soc: renesas: Kconfig: Select the required configs
 for RZ/Five SoC
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Arnd Bergmann <arnd@arndb.de>, Conor Dooley <conor.dooley@microchip.com>, 
	Heiko Stuebner <heiko@sntech.de>, Guo Ren <guoren@kernel.org>, 
	Andrew Jones <ajones@ventanamicro.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Samuel Holland <samuel@sholland.org>, linux-riscv@lists.infradead.org, 
	Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230331_003807_043535_AC31DCC3 
X-CRM114-Status: GOOD (  15.33  )
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

T24gRnJpLCBNYXIgMzEsIDIwMjMgYXQgOTozN+KAr0FNIEdlZXJ0IFV5dHRlcmhvZXZlbiA8Z2Vl
cnRAbGludXgtbTY4ay5vcmc+IHdyb3RlOgo+IE9uIFRodSwgTWFyIDMwLCAyMDIzIGF0IDEwOjQy
4oCvUE0gUHJhYmhha2FyIDxwcmFiaGFrYXIuY3NlbmdnQGdtYWlsLmNvbT4gd3JvdGU6Cj4gPiBG
cm9tOiBMYWQgUHJhYmhha2FyIDxwcmFiaGFrYXIubWFoYWRldi1sYWQucmpAYnAucmVuZXNhcy5j
b20+Cj4gPgo+ID4gRXhwbGljaXRseSBzZWxlY3QgdGhlIHJlcXVpcmVkIENhY2hlIG1hbmFnZW1l
bnQgYW5kIEVycmF0YSBjb25maWdzCj4gPiByZXF1aXJlZCBmb3IgdGhlIFJaL0ZpdmUgU29DLgo+
ID4KPiA+IFNpZ25lZC1vZmYtYnk6IExhZCBQcmFiaGFrYXIgPHByYWJoYWthci5tYWhhZGV2LWxh
ZC5yakBicC5yZW5lc2FzLmNvbT4KPiA+IFJldmlld2VkLWJ5OiBDb25vciBEb29sZXkgPGNvbm9y
LmRvb2xleUBtaWNyb2NoaXAuY29tPgo+Cj4gUmV2aWV3ZWQtYnk6IEdlZXJ0IFV5dHRlcmhvZXZl
biA8Z2VlcnQrcmVuZXNhc0BnbGlkZXIuYmU+CgpBY2tlZC1ieTogR2VlcnQgVXl0dGVyaG9ldmVu
IDxnZWVydCtyZW5lc2FzQGdsaWRlci5iZT4KCkdye29ldGplLGVldGluZ31zLAoKICAgICAgICAg
ICAgICAgICAgICAgICAgR2VlcnQKCi0tIApHZWVydCBVeXR0ZXJob2V2ZW4gLS0gVGhlcmUncyBs
b3RzIG9mIExpbnV4IGJleW9uZCBpYTMyIC0tIGdlZXJ0QGxpbnV4LW02OGsub3JnCgpJbiBwZXJz
b25hbCBjb252ZXJzYXRpb25zIHdpdGggdGVjaG5pY2FsIHBlb3BsZSwgSSBjYWxsIG15c2VsZiBh
IGhhY2tlci4gQnV0CndoZW4gSSdtIHRhbGtpbmcgdG8gam91cm5hbGlzdHMgSSBqdXN0IHNheSAi
cHJvZ3JhbW1lciIgb3Igc29tZXRoaW5nIGxpa2UgdGhhdC4KICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAtLSBMaW51cyBUb3J2YWxkcwoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2
QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9saW51eC1yaXNjdgo=
