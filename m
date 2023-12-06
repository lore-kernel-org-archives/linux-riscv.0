Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7B71C4167B
	for <linux-riscv@archiver.kernel.org>; Wed,  6 Dec 2023 13:13:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oDj8SRgVXYczykSiI55VYqQPrAzMDYBtvNG9RHB165k=; b=Wxs3dMUgZtqyUT
	ciLMUDMUn2ds4GHKe6o8LmHYvv1c3bopeU9v28WpJ/TuQVvPsE00oRRnrXXPDuKxjy2srPNIbR2D7
	fj4F7lr/GXdsQey1MyVaJ7E2cRdtfrRVXR2YS82U2u3D2j25KR7HHK9seye8+ScEnz1vR/cbbzKau
	qP9PbSKBZnVTbtapM5MU8cU87DM0BG4CZdzK8M335HzkONLQ1NEnl9Str2G70aZO6WefAuyi04DNZ
	KtUOjnh2reJkgz7MFpC9MfDCRY/6W7t2a4t4gWvP9HtpiUQuUdpFm8FzGUWhIKHZIId47cdifLFeC
	8nsmFqixINT78DGE310g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rAriW-00AMjJ-0q;
	Wed, 06 Dec 2023 13:13:32 +0000
Received: from mail-yb1-f172.google.com ([209.85.219.172])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rAriT-00AMgu-1D
	for linux-riscv@lists.infradead.org;
	Wed, 06 Dec 2023 13:13:30 +0000
Received: by mail-yb1-f172.google.com with SMTP id 3f1490d57ef6-db539f21712so776795276.1
        for <linux-riscv@lists.infradead.org>; Wed, 06 Dec 2023 05:13:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701868405; x=1702473205;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QpA0ectE+0fOxvKG7PAumxgR/vsxQ2Vp0KirOSeTgT4=;
        b=wCOVquZJnPJvgw64EMlGno/uxenDqRcWLq/UR+w4UWw+lAYZxgyCQaTJc1ixDxOkAF
         t6bmcjXlMRlXYPlzmk0dx66ghaVAUstbXdnexE7t9n49ucp82WiEKBwqcxgmydpCWCIh
         5foDAgzZeUrnjXM26Jvesp/10dtZrPaS3JQomDdBQ06Imh+JkC0984g20VMrwPKrV1rZ
         +vgVztpjfoMNjwK6qeBKU2gzfF62WJjs32iRRaf18VAV2venQefuHUfOZ4NujwZMBPQG
         ZN1E3zbnTT4gVrpWTWdkrYqqZAZLlrQakAtTzGvkIHLxJJR0oFwFEwBiLOyVcF7RtYyJ
         vpWg==
X-Gm-Message-State: AOJu0YwPu4mKjmgWngyw4PGzr4FYPPeWFvnFmQEAOitH3NAePNj5WutK
	JXQ2+1dYIm7dzDiiInXUAu8L2Warmpr0dw==
X-Google-Smtp-Source: AGHT+IFjSKvbfKOO9f0SnOnprd9cbFTaHniYabeDGU8878ThmuYlK9JMC1pAzJ5n97xcjiw4qwpTlQ==
X-Received: by 2002:a25:390:0:b0:db7:dacf:6e2 with SMTP id 138-20020a250390000000b00db7dacf06e2mr549197ybd.38.1701868404910;
        Wed, 06 Dec 2023 05:13:24 -0800 (PST)
Received: from mail-yb1-f174.google.com (mail-yb1-f174.google.com. [209.85.219.174])
        by smtp.gmail.com with ESMTPSA id a198-20020a25cacf000000b00da082362238sm3847743ybg.0.2023.12.06.05.13.22
        for <linux-riscv@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 Dec 2023 05:13:22 -0800 (PST)
Received: by mail-yb1-f174.google.com with SMTP id 3f1490d57ef6-db5e5647c24so744320276.1
        for <linux-riscv@lists.infradead.org>; Wed, 06 Dec 2023 05:13:22 -0800 (PST)
X-Received: by 2002:a25:d289:0:b0:db3:523f:2351 with SMTP id
 j131-20020a25d289000000b00db3523f2351mr2026647ybg.10.1701868402141; Wed, 06
 Dec 2023 05:13:22 -0800 (PST)
MIME-Version: 1.0
References: <20231201131551.201503-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20231201131551.201503-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20231201131551.201503-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 6 Dec 2023 14:13:10 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUiaL__+CDaFxRbUFgrz69SYBNfZm4JvY_qQRKLMTCY0w@mail.gmail.com>
Message-ID: <CAMuHMdUiaL__+CDaFxRbUFgrz69SYBNfZm4JvY_qQRKLMTCY0w@mail.gmail.com>
Subject: Re: [PATCH v3 1/3] pinctrl: renesas: rzg2l: Include pinmap in
 RZG2L_GPIO_PORT_PACK() macro
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Linus Walleij <linus.walleij@linaro.org>, 
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-gpio@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231206_051329_418423_D872E2B1 
X-CRM114-Status: GOOD (  26.42  )
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

SGkgUHJhYmhha2FyLAoKT24gRnJpLCBEZWMgMSwgMjAyMyBhdCAyOjE24oCvUE0gUHJhYmhha2Fy
IDxwcmFiaGFrYXIuY3NlbmdnQGdtYWlsLmNvbT4gd3JvdGU6Cj4gRnJvbTogTGFkIFByYWJoYWth
ciA8cHJhYmhha2FyLm1haGFkZXYtbGFkLnJqQGJwLnJlbmVzYXMuY29tPgo+Cj4gQ3VycmVudGx5
IHdlIGFzc3VtZSBhbGwgdGhlIHBvcnQgcGlucyBhcmUgc2VxdWVudGlhbCBpZSBhbHdheXMgUFhf
MCB0bwo+IFBYX24gKG49MS4uNykgZXhpc3QsIGJ1dCBvbiBSWi9GaXZlIFNvQyB3ZSBoYXZlIGFk
ZGl0aW9uYWwgcGlucyBQMTlfMSB0bwo+IFAyOF81IHdoaWNoIGhhdmUgaG9sZXMgaW4gdGhlbSwg
Zm9yIGV4YW1wbGUgb25seSBvbmUgcGluIG9uIHBvcnQxOSBpcwo+IGF2YWlsYWJsZSBhbmQgdGhh
dCBpcyBQMTlfMSBhbmQgbm90IFAxOV8wLiBTbyB0byBoYW5kbGUgc3VjaCBjYXNlcwo+IGluY2x1
ZGUgcGlubWFwIGZvciBlYWNoIHBvcnQgd2hpY2ggd291bGQgaW5kaWNhdGUgdGhlIHBpbiBhdmFp
bGFiaWxpdHkKPiBvbiBlYWNoIHBvcnQuIEFzIHRoZSBwaW5jb3VudCBjYW4gYmUgY2FsY3VsYXRl
ZCBiYXNlZCBvbiBwaW5tYXAgZHJvcCB0aGlzCj4gZnJvbSBSWkcyTF9HUElPX1BPUlRfUEFDSygp
IG1hY3JvIGFuZCB1cGRhdGUgUlpHMkxfR1BJT19QT1JUX0dFVF9QSU5DTlQoKQo+IG1hY3JvLgo+
Cj4gUHJldmlvdXNseSB3ZSBoYWQgYSBtYXggb2YgNyBwaW5zIG9uIGVhY2ggcG9ydCBidXQgb24g
UlovRml2ZSBQb3J0LTIwCj4gaGFzIDggcGlucywgc28gbW92ZSB0aGUgc2luZ2xlIHBpbiBjb25m
aWd1cmF0aW9uIHRvIEJJVCg2MykuCj4KPiBTaWduZWQtb2ZmLWJ5OiBMYWQgUHJhYmhha2FyIDxw
cmFiaGFrYXIubWFoYWRldi1sYWQucmpAYnAucmVuZXNhcy5jb20+CgpUaGFua3MgZm9yIHlvdXIg
cGF0Y2ghCgo+IC0tLSBhL2RyaXZlcnMvcGluY3RybC9yZW5lc2FzL3BpbmN0cmwtcnpnMmwuYwo+
ICsrKyBiL2RyaXZlcnMvcGluY3RybC9yZW5lc2FzL3BpbmN0cmwtcnpnMmwuYwo+IEBAIC04MCwx
NSArODAsMTcgQEAKPiAgICogbiBpbmRpY2F0ZXMgbnVtYmVyIG9mIHBpbnMgaW4gdGhlIHBvcnQs
IGEgaXMgdGhlIHJlZ2lzdGVyIGluZGV4Cj4gICAqIGFuZCBmIGlzIHBpbiBjb25maWd1cmF0aW9u
IGNhcGFiaWxpdGllcyBzdXBwb3J0ZWQuCj4gICAqLwo+IC0jZGVmaW5lIFJaRzJMX0dQSU9fUE9S
VF9QQUNLKG4sIGEsIGYpICAoKChuKSA8PCAyOCkgfCAoKGEpIDw8IDIwKSB8IChmKSkKPiAtI2Rl
ZmluZSBSWkcyTF9HUElPX1BPUlRfR0VUX1BJTkNOVCh4KSAgKCgoeCkgJiBHRU5NQVNLKDMwLCAy
OCkpID4+IDI4KQo+ICsjZGVmaW5lIFJaRzJMX0dQSU9fUE9SVF9QQUNLKG4sIGEsIGYpICAoKChu
KSA+IDAgPyAoKHU2NCkoR0VOTUFTS19VTEwoKChuKSAtIDEgKyAyOCksIDI4KSkpIDogMCkgfCBc
CgpUaGUgbWFzayBjcmVhdGlvbiBjYW4gYmUgc2ltcGxpZmllZCB0bwoKICAgICgoMVVMTCA8PCAo
bikpIC0gMSkgPDwgMjgKCmJ1dCBzZWUgYmVsb3cuLi4KCj4gKyAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAoKGEpIDw8IDIwKSB8IChmKSkKPiArI2RlZmluZSBSWkcyTF9H
UElPX1BPUlRfR0VUX1BJTk1BUCh4KSAgKCgoeCkgJiBHRU5NQVNLX1VMTCgzNSwgMjgpKSA+PiAy
OCkKPiArI2RlZmluZSBSWkcyTF9HUElPX1BPUlRfR0VUX1BJTkNOVCh4KSAgKGh3ZWlnaHQ4KFJa
RzJMX0dQSU9fUE9SVF9HRVRfUElOTUFQKCh4KSkpKQoKSSB0aGluayB3ZSd2ZSByZWFjaGVkIHRo
ZSBwb2ludCB3aGVyZSBpdCB3b3VsZCBiZSBlYXNpZXIgZm9yIHRoZQpjYXN1YWwgcmV2aWV3ZXIg
dG8gI2RlZmluZSBQSU5fQ0ZHXypfTUFTSyBmb3IgYWxsIGZpZWxkcywgYW5kIHVzZQpGSUVMRF97
UFJFUCxHRVR9KCkgdG8gcGFjayByZXNwLiBleHRyYWN0IHZhbHVlcy4gIFRoYXQgd291bGQgYWxz
bwptYWtlIGl0IG1vcmUgb2J2aW91cyB3aGljaCBiaXRzIGFyZSBpbiB1c2UsIGFuZCBob3cgbWFu
eSBiaXRzIGFyZQpzdGlsbCBhdmFpbGFibGUgZm9yIGZ1dHVyZSB1c2UuCgo+Cj4gIC8qCj4gLSAq
IEJJVCgzMSkgaW5kaWNhdGVzIGRlZGljYXRlZCBwaW4sIHAgaXMgdGhlIHJlZ2lzdGVyIGluZGV4
IHdoaWxlCj4gKyAqIEJJVCg2MykgaW5kaWNhdGVzIGRlZGljYXRlZCBwaW4sIHAgaXMgdGhlIHJl
Z2lzdGVyIGluZGV4IHdoaWxlCj4gICAqIHJlZmVyZW5jaW5nIHRvIFNSL0lFTi9JT0xIL0ZJTHh4
IHJlZ2lzdGVycywgYiBpcyB0aGUgcmVnaXN0ZXIgYml0cwo+ICAgKiAoYiAqIDgpIGFuZCBmIGlz
IHRoZSBwaW4gY29uZmlndXJhdGlvbiBjYXBhYmlsaXRpZXMgc3VwcG9ydGVkLgo+ICAgKi8KPiAt
I2RlZmluZSBSWkcyTF9TSU5HTEVfUElOICAgICAgICAgICAgICAgQklUKDMxKQo+ICsjZGVmaW5l
IFJaRzJMX1NJTkdMRV9QSU4gICAgICAgICAgICAgICBCSVRfVUxMKDYzKQo+ICAjZGVmaW5lIFJa
RzJMX1NJTkdMRV9QSU5fUEFDSyhwLCBiLCBmKSAoUlpHMkxfU0lOR0xFX1BJTiB8IFwKPiAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICgocCkgPDwgMjQpIHwgKChiKSA8
PCAyMCkgfCAoZikpCj4gICNkZWZpbmUgUlpHMkxfU0lOR0xFX1BJTl9HRVRfQklUKHgpICAgICgo
KHgpICYgR0VOTUFTSygyMiwgMjApKSA+PiAyMCkKCkxpa2V3aXNlLgoKPiBAQCAtMTgwLDEyICsx
ODIsMTIgQEAgc3RydWN0IHJ6ZzJsX2h3Y2ZnIHsKPgo+ICBzdHJ1Y3QgcnpnMmxfZGVkaWNhdGVk
X2NvbmZpZ3Mgewo+ICAgICAgICAgY29uc3QgY2hhciAqbmFtZTsKPiAtICAgICAgIHUzMiBjb25m
aWc7Cj4gKyAgICAgICB1NjQgY29uZmlnOwo+ICB9OwoKVGhlIHJlc3QgTEdUTS4gIEl0J3MgYSBw
aXR5IHdlIGhhdmUgdG8gc3dpdGNoIHRvIDY0IGJpdHMsIGJ1dCBJJ20KYWZyYWlkIHRoZXJlIGlz
IG5vdCBtdWNoIHdlIGNhbiBkbyBhYm91dCB0aGF0Li4uCgpHcntvZXRqZSxlZXRpbmd9cywKCiAg
ICAgICAgICAgICAgICAgICAgICAgIEdlZXJ0CgotLSAKR2VlcnQgVXl0dGVyaG9ldmVuIC0tIFRo
ZXJlJ3MgbG90cyBvZiBMaW51eCBiZXlvbmQgaWEzMiAtLSBnZWVydEBsaW51eC1tNjhrLm9yZwoK
SW4gcGVyc29uYWwgY29udmVyc2F0aW9ucyB3aXRoIHRlY2huaWNhbCBwZW9wbGUsIEkgY2FsbCBt
eXNlbGYgYSBoYWNrZXIuIEJ1dAp3aGVuIEknbSB0YWxraW5nIHRvIGpvdXJuYWxpc3RzIEkganVz
dCBzYXkgInByb2dyYW1tZXIiIG9yIHNvbWV0aGluZyBsaWtlIHRoYXQuCiAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgLS0gTGludXMgVG9ydmFsZHMKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51
eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21h
aWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
