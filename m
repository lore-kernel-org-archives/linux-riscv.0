Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9563EC48260
	for <linux-riscv@archiver.kernel.org>; Fri, 16 Feb 2024 14:02:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=didVb5xvBx7mwEH2a+Fel4FySuAD7gSx4mMYUtk71W0=; b=2+Eo3m8yv/ZQoP
	rmJ4WQUQC4pbqsuB6TYo986U3F7xp+RL64eiOUvcBKL07teWvUaHxZTF7XO+z/5oQWOsKgp5JLBpQ
	R5WHyJiqecJunXaaCpIvpH6zfJtNwk+nsag4TqGEfE5fBICOdA9J9UCVVsUhTcFhDvPm5t7YPY3Zl
	8EkZd8bc+O+/sfMZG/FO+aAMuiR2o45S3O3lRlz2zV/LuTFTFHn0cD+2Lb++0HktLAlyWWboxJoHq
	ePWSx+SVbdCslUK9uegsbrvyxf8Qprb77VWDiV4NjogTNllXGbhXeH66nQfU4ev7ZKeLbQGsoUc7m
	jLcCqgs1OoZAFJzRmf+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rayng-00000002W9G-0U1D;
	Fri, 16 Feb 2024 14:02:48 +0000
Received: from mail-yw1-f173.google.com ([209.85.128.173])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1raynb-00000002W5i-3YVa
	for linux-riscv@lists.infradead.org;
	Fri, 16 Feb 2024 14:02:46 +0000
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-607fc3e69adso6226097b3.0
        for <linux-riscv@lists.infradead.org>; Fri, 16 Feb 2024 06:02:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708092162; x=1708696962;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XvA+n/hlz0w5VlO4pipSSw3lBcaAl9ag73pmB0pWksE=;
        b=VVdV5U68qriPdUKQNwgMi8jdKgzH5u6RQgrWtLxOM4hjigLGfs5gyO+YCavVSvWwLP
         rHE/swNlgpwkp1QqhOYjsIc60aMjhWfip+3TWNRSZM9tac9iS6Ji4HtpS5hI1wxFaom7
         ZVR5HqIRaqFdROf17J2VVNbLqmvH0+zqod4E8v0CU00AmsUlUF/Py+4XesVKqZwpTCjl
         qi/T0C6Y5/9wfhLtP48RA6PVdpBtQ0JSdO+uSYyvKKjxsEOsRw2xOaqlMWc1ah9v4KiA
         TPuaVaWTTzufjNZaPwA4Nr5RBh484ULE6t/8d8MtBLNkGTekZXnqPGdKjilwVbtPezCF
         l7pQ==
X-Forwarded-Encrypted: i=1; AJvYcCV+dy9TSbcq053rNDaPKc3WRW8rJKWy9oSxRmSpa4voCuVYcYtszK5ayAQb8EBbdpswT7iDJG81jPBMW6e49PMJIsk1ubuwWkMhQdKe8Axn
X-Gm-Message-State: AOJu0YxaIX5jVrxmSikliF8m1zeH3Iu+otwV0YBOf8og20Zcr+S9X6Gs
	HW35xf8/HLzqtcfsPGTYoOiNoZzalZ0Z6LT2ER0JDiRkW+Kx0+/97PpO63E7wkc=
X-Google-Smtp-Source: AGHT+IGC8ytRSeJ5kiV2Xa1OQHYOA1dY+b7Gl5BnHMJQMbSWRDY7l4CIK4iGY8K7FbJtERlL1PdL/A==
X-Received: by 2002:a81:a145:0:b0:607:8346:d25c with SMTP id y66-20020a81a145000000b006078346d25cmr5967887ywg.10.1708092162098;
        Fri, 16 Feb 2024 06:02:42 -0800 (PST)
Received: from mail-yb1-f182.google.com (mail-yb1-f182.google.com. [209.85.219.182])
        by smtp.gmail.com with ESMTPSA id l37-20020a81ad25000000b00607fba01268sm254169ywh.50.2024.02.16.06.02.41
        for <linux-riscv@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 Feb 2024 06:02:41 -0800 (PST)
Received: by mail-yb1-f182.google.com with SMTP id 3f1490d57ef6-dc6e080c1f0so1933417276.2
        for <linux-riscv@lists.infradead.org>; Fri, 16 Feb 2024 06:02:41 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXKRY9dF3aJiFWMFfUslgA9VvLleZVEWEM7wmlw00VhezQBKdwOB7532Jn8RBLDABc83ppFZYtiydKpuxVwdQLJiRhj7XF3zHroJsooaSu+
X-Received: by 2002:a25:ab86:0:b0:dc7:465a:2cb2 with SMTP id
 v6-20020a25ab86000000b00dc7465a2cb2mr5366370ybi.30.1708092161385; Fri, 16 Feb
 2024 06:02:41 -0800 (PST)
MIME-Version: 1.0
References: <20240208124300.2740313-1-claudiu.beznea.uj@bp.renesas.com> <20240208124300.2740313-3-claudiu.beznea.uj@bp.renesas.com>
In-Reply-To: <20240208124300.2740313-3-claudiu.beznea.uj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 16 Feb 2024 15:02:29 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVJ0OywBOJ16RwXGUCUPNE2aFBiZBrwOuxPgZ_YXi-gkw@mail.gmail.com>
Message-ID: <CAMuHMdVJ0OywBOJ16RwXGUCUPNE2aFBiZBrwOuxPgZ_YXi-gkw@mail.gmail.com>
Subject: Re: [PATCH 02/17] dt-bindings: clock: r9a07g044-cpg: Add power domain IDs
To: Claudiu <claudiu.beznea@tuxon.dev>
Cc: mturquette@baylibre.com, sboyd@kernel.org, robh@kernel.org, 
	krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org, magnus.damm@gmail.com, 
	paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu, 
	linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org, 
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240216_060244_043687_F1D6C343 
X-CRM114-Status: GOOD (  12.10  )
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

T24gVGh1LCBGZWIgOCwgMjAyNCBhdCAxOjQz4oCvUE0gQ2xhdWRpdSA8Y2xhdWRpdS5iZXpuZWFA
dHV4b24uZGV2PiB3cm90ZToKPiBGcm9tOiBDbGF1ZGl1IEJlem5lYSA8Y2xhdWRpdS5iZXpuZWEu
dWpAYnAucmVuZXNhcy5jb20+Cj4KPiBBZGQgcG93ZXIgZG9tYWluIElEcyBmb3IgUlovRzJMIChS
OUEwN0cwNDQpIFNvQy4KPgo+IFNpZ25lZC1vZmYtYnk6IENsYXVkaXUgQmV6bmVhIDxjbGF1ZGl1
LmJlem5lYS51akBicC5yZW5lc2FzLmNvbT4KClJldmlld2VkLWJ5OiBHZWVydCBVeXR0ZXJob2V2
ZW4gPGdlZXJ0K3JlbmVzYXNAZ2xpZGVyLmJlPgoKR3J7b2V0amUsZWV0aW5nfXMsCgogICAgICAg
ICAgICAgICAgICAgICAgICBHZWVydAoKCi0tCkdlZXJ0IFV5dHRlcmhvZXZlbiAtLSBUaGVyZSdz
IGxvdHMgb2YgTGludXggYmV5b25kIGlhMzIgLS0gZ2VlcnRAbGludXgtbTY4ay5vcmcKCkluIHBl
cnNvbmFsIGNvbnZlcnNhdGlvbnMgd2l0aCB0ZWNobmljYWwgcGVvcGxlLCBJIGNhbGwgbXlzZWxm
IGEgaGFja2VyLiBCdXQKd2hlbiBJJ20gdGFsa2luZyB0byBqb3VybmFsaXN0cyBJIGp1c3Qgc2F5
ICJwcm9ncmFtbWVyIiBvciBzb21ldGhpbmcgbGlrZSB0aGF0LgogICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIC0tIExpbnVzIFRvcnZhbGRzCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlz
Y3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
