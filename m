Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B37F0C54E41
	for <linux-riscv@archiver.kernel.org>; Tue,  5 Mar 2024 16:10:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iSDpJd6rAH7o0IZbPKvEcoBG/u/7mCNgbQp+ZFWQDrw=; b=zWWPLh8tqqCGW5
	eC5iWVa/Fe+qNN+mxz5QF9vSYMdzn61uBkqf1yZ7PXw/AFDJAaTdhNCIhsGVcKjnlpaq6cQs6ryaU
	KQc5p8x0BPPmOUCu7bro6/44Ka37HVl8n3LGrWqFhbGbSXobo9hj8Pses5g6s8zvQnLbiaundWcs8
	PskmJnwgmBmnVbGkGdU16ZprPnY7wu9J2NdERcZWv1BXaha7h8/FssdpOhyCWaWFdedBEfL8wIFz8
	BOepCJNFD5EOccR530PyFITlpXxez9lYVZlq5vmqKwioXEm28A8T8b3Tjcdo681246ajfIY/1N2J0
	KwfP1kb5F2zf1rOwlvtg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rhXN7-0000000EQTJ-2VOt;
	Tue, 05 Mar 2024 16:10:29 +0000
Received: from mail-oi1-f175.google.com ([209.85.167.175])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rhXN2-0000000EQPO-2XQm
	for linux-riscv@lists.infradead.org;
	Tue, 05 Mar 2024 16:10:28 +0000
Received: by mail-oi1-f175.google.com with SMTP id 5614622812f47-3c1a1e1e539so696981b6e.1
        for <linux-riscv@lists.infradead.org>; Tue, 05 Mar 2024 08:10:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709655022; x=1710259822;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=713VBddz39OpjY6HlnbJzt3Tjm1gHuO4WD57Deft6JI=;
        b=dcgoVLgkROgRBU0CaSu58uAcK6Y+ZGbVRZ8IeOM1CgfNTdWzUIuEx52I8NF1e6XAf2
         ul8dbBXqF0hNWo8oJXy+f/WGF/+HXg751JV4srlLNY626ZTFU0Bf3f93NHsEKo3U8X6q
         XvY53bIbps6x/oDW0Kx94BYw4xkde01lNa0F2DZAylTRL4c5rMQ8g8XUQqtTs0DXILR8
         wgmqAKTVfwPkHxrPfalydL6U/ARLL+PJWZieDLUX86Qap6Pb5o6I4Oi/eJU5Xyfr2OBC
         tLfFjrxAYPB9VLE1rOnzND15LgYoArF6lKJiOrtivb8GMk8y/+71VsnByCFZeFI4Bnk/
         DRPQ==
X-Forwarded-Encrypted: i=1; AJvYcCUG6r2ZRbeCPEzZClz7Cken/jHpsj9AwvMcdpqhHxeXzoWOvYLVDgBazHY7WIj0WOw6ZkH9uilaPmglrmf9D4hIbWOK9H1RGLKDwNMNrSBM
X-Gm-Message-State: AOJu0YwaQxlSk5Fr3YMPxIsitUaGIi5OiQBHRRIblaCJ7CrAHzIqcZ1f
	BpSt3aY5WIqH5lDDi3Ni7GIeNnmomUO7yYABRTbIz/H9n9icKMj5VGXqPcSx+Ic=
X-Google-Smtp-Source: AGHT+IF0xZOgcRiNg8aUm0NuwDQ5YJMFuonSYm0nga+SNSOAuWRowhaknkdJvyNfArH4H+wzjP1gTg==
X-Received: by 2002:a05:6808:1597:b0:3c1:8493:751f with SMTP id t23-20020a056808159700b003c18493751fmr3031277oiw.9.1709655021419;
        Tue, 05 Mar 2024 08:10:21 -0800 (PST)
Received: from mail-oo1-f54.google.com (mail-oo1-f54.google.com. [209.85.161.54])
        by smtp.gmail.com with ESMTPSA id o24-20020a05680803d800b003c1e99ed5b2sm832387oie.29.2024.03.05.08.10.21
        for <linux-riscv@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 05 Mar 2024 08:10:21 -0800 (PST)
Received: by mail-oo1-f54.google.com with SMTP id 006d021491bc7-595aa5b1fe0so521395eaf.2
        for <linux-riscv@lists.infradead.org>; Tue, 05 Mar 2024 08:10:21 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWbffgDrwrsuNsj1k710iU0PyFkqlh/fs2Ze65FDNx6zcHBRHysnyKsjmGKsd/Au75twlf+2kB5y6IgqEHMFGYVwfZ2b6dXCI+ymGOnBskq
X-Received: by 2002:a05:6358:7243:b0:17b:b573:a437 with SMTP id
 i3-20020a056358724300b0017bb573a437mr2777334rwa.8.1709655020927; Tue, 05 Mar
 2024 08:10:20 -0800 (PST)
MIME-Version: 1.0
References: <20240305160046.46337-1-krzysztof.kozlowski@linaro.org>
In-Reply-To: <20240305160046.46337-1-krzysztof.kozlowski@linaro.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 5 Mar 2024 17:10:09 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWRDA9te7PjnP3ibKDKsOakxco1m8-NtUsybi=6kVd0Qw@mail.gmail.com>
Message-ID: <CAMuHMdWRDA9te7PjnP3ibKDKsOakxco1m8-NtUsybi=6kVd0Qw@mail.gmail.com>
Subject: Re: [PATCH] riscv: dts: starfive: jh7100: fix root clock names
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Emil Renner Berthing <kernel@esmil.dk>, Conor Dooley <conor@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, linux-riscv@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240305_081025_195539_317062FD 
X-CRM114-Status: GOOD (  14.12  )
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

T24gVHVlLCBNYXIgNSwgMjAyNCBhdCA1OjAw4oCvUE0gS3J6eXN6dG9mIEtvemxvd3NraQo8a3J6
eXN6dG9mLmtvemxvd3NraUBsaW5hcm8ub3JnPiB3cm90ZToKPiBKSDcxMDAgY2xvY2sgY29udHJv
bGxlciBkcml2ZXIgZGVwZW5kcyBvbiBjZXJ0YWluIHJvb3QgY2xvY2sgbmFtZXMuCj4KPiBSZXBv
cnRlZC1ieTogR2VlcnQgVXl0dGVyaG9ldmVuIDxnZWVydEBsaW51eC1tNjhrLm9yZz4KPiBDbG9z
ZXM6IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2FsbC9DQU11SE1kV3cwZHRlWE8yanc0Y3dHdnpL
Y0w2dm1uYjk2Qz1xZ1BnVXFORE10RjZYMFFAbWFpbC5nbWFpbC5jb20vCj4gRml4ZXM6IGYwMzYw
NjQ3MDg4NiAoInJpc2N2OiBkdHM6IHN0YXJmaXZlOiByZXBsYWNlIHVuZGVyc2NvcmVzIGluIG5v
ZGUgbmFtZXMiKQo+IFNpZ25lZC1vZmYtYnk6IEtyenlzenRvZiBLb3psb3dza2kgPGtyenlzenRv
Zi5rb3psb3dza2lAbGluYXJvLm9yZz4KPgo+IC0tLQo+Cj4gTm90IHRlc3RlZCBvbiBoYXJkd2Fy
ZQoKVGVzdGVkLWJ5OiBHZWVydCBVeXR0ZXJob2V2ZW4gPGdlZXJ0K3JlbmVzYXNAZ2xpZGVyLmJl
PgoKR3J7b2V0amUsZWV0aW5nfXMsCgogICAgICAgICAgICAgICAgICAgICAgICBHZWVydAoKLS0g
CkdlZXJ0IFV5dHRlcmhvZXZlbiAtLSBUaGVyZSdzIGxvdHMgb2YgTGludXggYmV5b25kIGlhMzIg
LS0gZ2VlcnRAbGludXgtbTY4ay5vcmcKCkluIHBlcnNvbmFsIGNvbnZlcnNhdGlvbnMgd2l0aCB0
ZWNobmljYWwgcGVvcGxlLCBJIGNhbGwgbXlzZWxmIGEgaGFja2VyLiBCdXQKd2hlbiBJJ20gdGFs
a2luZyB0byBqb3VybmFsaXN0cyBJIGp1c3Qgc2F5ICJwcm9ncmFtbWVyIiBvciBzb21ldGhpbmcg
bGlrZSB0aGF0LgogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIC0tIExpbnVzIFRvcnZh
bGRzCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51
eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRw
Oi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
