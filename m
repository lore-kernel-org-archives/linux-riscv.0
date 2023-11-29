Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3EE36C10DAA
	for <linux-riscv@archiver.kernel.org>; Wed, 29 Nov 2023 14:44:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lSrFfgj1KQHWUcx8b2z6/AQuZQWYiUcpMBAcjZlLN44=; b=uvIITzHImEDvZF
	vJESKzs8G4gBfS95EUVjIxiPtoup6sRWUbpHxwzZ7tY2G4AbyKaDmPTUmveBSrwfbQGrcpFzJgOzH
	Eg1Hm++j/JCIQzi4+yxJEHcV2cH6LjNgpBKLotissZT4mny7bupFtZPoYsJh/vWVGVeq8iT1ooEZQ
	ej89/RzWJh/H2kHTvBlLVr6S3u5X8lYhQhuYuG2gdcWgAPvP53tQcrggINHrCAtbk6yy1uJ1E9ZtK
	MCduK9py09biP7VeVjrdwysawsjge1AzrpNIX29k0dFVaXnxLGq1GYJWmKOo4x841xBVu3dPDe48K
	ZiumJVfcDbqHV4XgnKYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r8Lnn-008ezX-1O;
	Wed, 29 Nov 2023 14:44:35 +0000
Received: from mail-ua1-x92b.google.com ([2607:f8b0:4864:20::92b])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r8Lna-008epw-32
	for linux-riscv@lists.infradead.org;
	Wed, 29 Nov 2023 14:44:24 +0000
Received: by mail-ua1-x92b.google.com with SMTP id a1e0cc1a2514c-7c45bee5fdaso1721903241.1
        for <linux-riscv@lists.infradead.org>; Wed, 29 Nov 2023 06:44:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701269061; x=1701873861; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BTV80m9sniZZhV3ayqmHUOTEjpARmiBjH4lGv1FbT5I=;
        b=R+4hEwxrArxNvziJDhQwvribyi/W9+F4kWLXDl13BDwTlEU80GNR+maudR3pgibXEl
         Ytawuhn2r66w3MCCn6CKQ7a0l5JYiExZxLf40X0DMgyF/g/B98VsXiKXtJ3J3atSrSZw
         Ell0BXoCEM4vMbYNoEPfaWllgPhr9sVLBhgq4rtLxWXNC/kEG0MZtNpf4/QJhvLDV3jK
         2aExC1dNVTcF+lUVGIxQTz4qg1dsg6R/8z6s68ReIb8kjbfOJUGBuapn+H30hUGk23Pb
         QdZ8YnlpPibjot7jXeff4Il2TpkJkQfUFR26OXW5zMCwgoVWJ8zC5dGuHgtBVZqULtIP
         EFTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701269061; x=1701873861;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BTV80m9sniZZhV3ayqmHUOTEjpARmiBjH4lGv1FbT5I=;
        b=U/U7baYGDhw28zf3JjGtxSE7tulmJ9KzwcWWCxCiZFtS8mZ1WxNS39tLXuAlE5notz
         qASotAt2EoI3vJpbf17KdbQyoTrF2Te78f+7RvcJK7GblQAaZds3m9TYIB33T01zPjKP
         V243XgoJFBIKkUcH6lOobkDgnu50EY08gueIWB3frmF6cYtxpUkmrF9mE84X41ibaSdK
         J0k7p7uHTXqDHm5iFMEnFeQXvl1kZ8bOLLUIVijPlD3QuWLff6TdwtddAIs+NYsuAPf0
         6d2tVANc765noDQABUmttD+9d11PFjrDXflP+HoZgfHKYbmJj1yWV/1C1ccYFafYtYXp
         SODg==
X-Gm-Message-State: AOJu0Yyj5yPYh6PHrZnK+zFfqWzuR0O+BH78JKMgYiq4bQ89+qeDRLub
	FAnkqLnFnkPVfbpqFgXBd8VtjLEX6pILQNrpFMc=
X-Google-Smtp-Source: AGHT+IGCDZngG6ZtwGuhcqjwolhGC3Bvfp2wdcOUa92UIOUe7pr+Bgg29exfKB/1In2II5AeSFKMuEaLbCW3MxZjhBs=
X-Received: by 2002:a05:6122:da5:b0:4ac:5a8:f45b with SMTP id
 bc37-20020a0561220da500b004ac05a8f45bmr21359729vkb.5.1701269061166; Wed, 29
 Nov 2023 06:44:21 -0800 (PST)
MIME-Version: 1.0
References: <20231017104638.201260-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20231017104638.201260-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Wed, 29 Nov 2023 14:43:32 +0000
Message-ID: <CA+V-a8t3sGn83vpgjECf5dw=bbz2yPXpnn+v2Dx2q3yJRPsKgA@mail.gmail.com>
Subject: Re: [PATCH v2 0/3] Add missing port pins for RZ/Five SoC
To: Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	Linus Walleij <linus.walleij@linaro.org>
Cc: Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231129_064422_989486_DFF2273F 
X-CRM114-Status: GOOD (  12.47  )
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

SGkgR2VlcnQsCgpPbiBUdWUsIE9jdCAxNywgMjAyMyBhdCAxMTo0N+KAr0FNIFByYWJoYWthciA8
cHJhYmhha2FyLmNzZW5nZ0BnbWFpbC5jb20+IHdyb3RlOgo+Cj4gRnJvbTogTGFkIFByYWJoYWth
ciA8cHJhYmhha2FyLm1haGFkZXYtbGFkLnJqQGJwLnJlbmVzYXMuY29tPgo+Cj4gSGkgR2VlcnQs
Cj4KPiBUaGlzIHBhdGNoIHNlcmllcyBpbnRlbmRzIHRvIGluY29ycG9yYXRlIHRoZSBhYnNlbnQg
cG9ydCBwaW5zIFAxOSB0byBQMjgsCj4gd2hpY2ggYXJlIGV4Y2x1c2l2ZWx5IGF2YWlsYWJsZSBv
biB0aGUgUlovRml2ZSBTb0MuCj4KPiBDaGVlcnMsCj4gUHJhYmhha2FyCj4KPiBSRkMgLT4gdjI6
Cj4gKiBGaXhlZCByZXZpZXcgY29tbWVudHMgcG9pbnRlZCBieSBHZWVydCAmIEJpanUKPgo+IFJG
QzogaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGttbC8yMDIzMDYzMDEyMDQzMy40OTUyOS0zLXBy
YWJoYWthci5tYWhhZGV2LWxhZC5yakBicC5yZW5lc2FzLmNvbS9ULwo+Cj4gTGFkIFByYWJoYWth
ciAoMyk6Cj4gICBwaW5jdHJsOiByZW5lc2FzOiByemcybDogSW5jbHVkZSBwaW5tYXAgaW4gUlpH
MkxfR1BJT19QT1JUX1BBQ0soKQo+ICAgICBtYWNybwo+ICAgcGluY3RybDogcmVuZXNhczogcGlu
Y3RybC1yemcybDogQWRkIHRoZSBtaXNzaW5nIHBvcnQgcGlucyBQMTkgdG8gUDI4Cj4gICByaXNj
djogZHRzOiByZW5lc2FzOiByOWEwN2cwNDNmOiBVcGRhdGUgZ3Bpby1yYW5nZXMgcHJvcGVydHkK
Pgo+ICBhcmNoL3Jpc2N2L2Jvb3QvZHRzL3JlbmVzYXMvcjlhMDdnMDQzZi5kdHNpIHwgICA0ICsK
PiAgZHJpdmVycy9waW5jdHJsL3JlbmVzYXMvcGluY3RybC1yemcybC5jICAgICB8IDI2MyArKysr
KysrKysrKysrKysrKystLQo+ICAyIGZpbGVzIGNoYW5nZWQsIDI0MiBpbnNlcnRpb25zKCspLCAy
NSBkZWxldGlvbnMoLSkKPgpHZW50bGUgcGluZy4KCkNoZWVycywKUHJhYmhha2FyCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWls
aW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5m
cmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
