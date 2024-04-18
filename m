Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C67AC4345F
	for <linux-riscv@archiver.kernel.org>; Thu, 18 Apr 2024 14:58:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=R0wKdJrhg0858mpEu5sJlbc2JRmDpDNdlIA07ChP0Y8=; b=m5ML4xX0ieOwFa
	DaiHi6JKtcjW3aWVTEOmHxVvNEXUPpYdXwh03Mbk88Xa8E1FPYKmPxLJYL1SKOYqmXZr6MV4pEyEV
	El1mwlVQXbnD3E89kmSHGljwWBf31tl1V0ZGbpp/bjcl1U/zGY8K/KiRDuDXRZpvA1X1uDKR0itdR
	V4gJzNaLg8z1HgbE1STY8ZI0APUcryZaEzRuPE4m/3o0U5UJYAWJQo6AJEYgPODqldPBJoOhcBJ2v
	d9VC068KCg8GTAhNmeWLLUcShPVwtxKNgjv2gMaJdxQ8IewTHrYeEhxb6yjB6oglvB6ZXoHIAfPgO
	/dHx03MgMZgnm2QL9Hlg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rxTCz-00000002iA1-2fg5;
	Thu, 18 Apr 2024 14:57:53 +0000
Received: from mail-yw1-f179.google.com ([209.85.128.179])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rxTCx-00000002i9Y-2UsL
	for linux-riscv@lists.infradead.org;
	Thu, 18 Apr 2024 14:57:52 +0000
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-61ac45807cbso10237657b3.1
        for <linux-riscv@lists.infradead.org>; Thu, 18 Apr 2024 07:57:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713452269; x=1714057069;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tBkk7IToPf8pTng3q6RoyHKsGOCoZ6cSUuNVh7MUIdE=;
        b=xGkLMCqhPg1UGGouL7hLJFoImnJ9XJmTplBOTvsWdBokHqkhxQfS+pNYew3u8WiU46
         iqctBxT+TyCRxKXosjCnix0mf4PUHBdRj2kjHiGyycyqMFAiIAdeZNV5GteSEZV8y8Pm
         lzFGXJT72Qrs+GCn6CVfz7AWbnbkHk6tqfGutFxyap2gWxFP6BF5ZQ5QVyDghCW+3lih
         Qgo6SKTAycRgq5HwTOJF1kofcniko5eE5u+dwUG/BHT6F/l9bLf+yMroV9UgACBCqys4
         b+mdID2iiQBnsGruUY1qxRHEZ6yLQKwDY6g5F5k7okjL4rGFbk0GBFLKKnvmO3/dhSov
         6wFw==
X-Forwarded-Encrypted: i=1; AJvYcCVoczOdcybHoG5qT7i0OsNuccU5tOLxMywr1DyGv1faUki4qYHmriM/63jeHaFrJbUKBpxy8Td+3mj5Io9/4UnFMsQphH2Q4geGRaE9GWjC
X-Gm-Message-State: AOJu0YwJg/cyLalY4x5YV5ZLsBmKq1cAvph9S2LttY5uGn2jKA6NDzXv
	PWdQJ8eZj9ov53g4JzVaAVigmAcX+Q7fkCVKzkcdCuzlpxpp1V4k/Krxla5U
X-Google-Smtp-Source: AGHT+IHiIOBc53KsWbORXWoh9+o2QA++84qM6X2k81YHW+sdKmyktbEltTyLn+GGoJkPT3/yXnr42w==
X-Received: by 2002:a25:69c2:0:b0:dcf:b5b7:c72 with SMTP id e185-20020a2569c2000000b00dcfb5b70c72mr3487228ybc.0.1713452269004;
        Thu, 18 Apr 2024 07:57:49 -0700 (PDT)
Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com. [209.85.128.174])
        by smtp.gmail.com with ESMTPSA id c7-20020a25a2c7000000b00dcbce4abc32sm383768ybn.36.2024.04.18.07.57.48
        for <linux-riscv@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 18 Apr 2024 07:57:48 -0700 (PDT)
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-61ae4743d36so10581997b3.2
        for <linux-riscv@lists.infradead.org>; Thu, 18 Apr 2024 07:57:48 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWNFxMKivrefTARKROX7PqH9FfWH8Lp8C0OQq1LW4EjqTpt30BEF7ahlfwJC9HfBBN7cSnJHNIIzerRe6TznAb3OFWmvotHqOfhVz/LSNLl
X-Received: by 2002:a25:aaaa:0:b0:dcc:2f09:4742 with SMTP id
 t39-20020a25aaaa000000b00dcc2f094742mr2918100ybi.51.1713452268112; Thu, 18
 Apr 2024 07:57:48 -0700 (PDT)
MIME-Version: 1.0
References: <20240403203503.634465-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20240403203503.634465-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20240403203503.634465-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 18 Apr 2024 16:57:36 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVmat=o-+_KX+G275SEcdC-OxAjOw5CS-rag9ZxnQFHfg@mail.gmail.com>
Message-ID: <CAMuHMdVmat=o-+_KX+G275SEcdC-OxAjOw5CS-rag9ZxnQFHfg@mail.gmail.com>
Subject: Re: [PATCH v2 3/5] riscv: dts: renesas: r9a07g043f: Add IRQC node to
 RZ/Five SoC DTSI
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	linux-riscv@lists.infradead.org, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240418_075751_656855_C24119BD 
X-CRM114-Status: GOOD (  16.83  )
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

SGkgUHJhYmhha2FyLAoKT24gV2VkLCBBcHIgMywgMjAyNCBhdCAxMDozNuKAr1BNIFByYWJoYWth
ciA8cHJhYmhha2FyLmNzZW5nZ0BnbWFpbC5jb20+IHdyb3RlOgo+IEZyb206IExhZCBQcmFiaGFr
YXIgPHByYWJoYWthci5tYWhhZGV2LWxhZC5yakBicC5yZW5lc2FzLmNvbT4KPgo+IEFkZCB0aGUg
SVJRQyBub2RlIHRvIFJaL0ZpdmUgKFI5QTA3RzA0M0YpIFNvQyBEVFNJLgo+Cj4gU2lnbmVkLW9m
Zi1ieTogTGFkIFByYWJoYWthciA8cHJhYmhha2FyLm1haGFkZXYtbGFkLnJqQGJwLnJlbmVzYXMu
Y29tPgoKVGhhbmtzIGZvciB0aGUgdXBkYXRlIQoKPiAtLS0KPiB2MS0+djIKPiAtIERyb3BwZWQg
dXNpbmcgU09DX1BFUklQSEVSQUxfSVJRKCkgbWFjcm8KCmFuZCBjaGFuZ2UgdGhlIGJ1cy1lcnIg
aW50ZXJydXB0IHRvIGZyb20gRURHRV9SSVNJTkcgdG8gTEVWRUxfSElHSCwKdG8gbWF0Y2ggdGhl
IGRvY3VtZW50YXRpb24gOy0pCgpSZXZpZXdlZC1ieTogR2VlcnQgVXl0dGVyaG9ldmVuIDxnZWVy
dCtyZW5lc2FzQGdsaWRlci5iZT4KaS5lLiB3aWxsIHF1ZXVlIGluIHJlbmVzYXMtZGV2ZWwgZm9y
IHY2LjEwLCB3aXRoIHBhdGNoZXMgNC81IGFuZCA1LzUuCgpHcntvZXRqZSxlZXRpbmd9cywKCiAg
ICAgICAgICAgICAgICAgICAgICAgIEdlZXJ0CgoKLS0KR2VlcnQgVXl0dGVyaG9ldmVuIC0tIFRo
ZXJlJ3MgbG90cyBvZiBMaW51eCBiZXlvbmQgaWEzMiAtLSBnZWVydEBsaW51eC1tNjhrLm9yZwoK
SW4gcGVyc29uYWwgY29udmVyc2F0aW9ucyB3aXRoIHRlY2huaWNhbCBwZW9wbGUsIEkgY2FsbCBt
eXNlbGYgYSBoYWNrZXIuIEJ1dAp3aGVuIEknbSB0YWxraW5nIHRvIGpvdXJuYWxpc3RzIEkganVz
dCBzYXkgInByb2dyYW1tZXIiIG9yIHNvbWV0aGluZyBsaWtlIHRoYXQuCiAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgLS0gTGludXMgVG9ydmFsZHMKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51
eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21h
aWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
