Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E6B8C48260
	for <linux-riscv@archiver.kernel.org>; Fri, 16 Feb 2024 14:03:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=W1UwXZnOGbZnqkSLXTNQu44+RMGR84sTc6cynrUK8J4=; b=P8gL5T6CJVQBho
	P27Hws7u+Y37DdCiWAZrRh4JhP2nse5AgLf981zxghoJDo3dJqD6MufLd6sxaTYE8JxlHtNwzp+VA
	G++nEIZOeWMikeJh+cPyIJoRo3vWgx+n6ZcUlNjY5bxYHvW2lzdOHUXxdYXMXkr7RcPsgFDNvX2Jb
	Fu+RSMf4WAsEQVVcdmFa/6R3sz8HlNcFDCAlxTKkreioBsZUUTPHR1yyqeZkEYRv2h7ojKBaYuTul
	167jqPhyg261YgRrDcrnRGazGpBawu1lz5QRtIchVi+ywC81f3qlPNnWYqYaANfY64y0icS9EWdIp
	eq29B39qeFDq93ZxwiTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rayoG-00000002WQU-1ChI;
	Fri, 16 Feb 2024 14:03:24 +0000
Received: from mail-yw1-f172.google.com ([209.85.128.172])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rayoD-00000002WOT-1TZ3
	for linux-riscv@lists.infradead.org;
	Fri, 16 Feb 2024 14:03:22 +0000
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-607cb7c44a7so19370177b3.3
        for <linux-riscv@lists.infradead.org>; Fri, 16 Feb 2024 06:03:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708092199; x=1708696999;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TNBzyjwubkX8/ViTlFw9AawEcEHUoewYtlJeFol6/+E=;
        b=Ac/w1sMtI8saqnAoJgXxriDc/woee4KAUYhigfMv3RgFgi4ordiC8py9OH889ex3v1
         d//teHxXxxui6lOpXVUbXanobQpouQ5UiJ4mLvhmn/o3PP8vEXrku0zzhG5ziwt4NFOo
         w6ehB2ZltD7jmH6dG4CTuzltHAQKHqjynOpJ+LyxDAev0EHCS2I3+5l+fjpNCbbJxobb
         MYltp4ITk8gkafh2o775AWnHrblcGY3jIucuqs8BDbsCbne9hrrREmgYVqHmOiJg2IdX
         wDVAjMN7Q1/DBVFUigpZKaFQqzW7YIDLK8nRVWewolHwR5vjiaWmyVjStWpxPdbsVAPL
         MJwg==
X-Forwarded-Encrypted: i=1; AJvYcCViMmC+x9Dd5zrAp45uoj7fAplWh6eODxBuLz11P6RenO1H1zRNJ4rzvQ0I5CjxL+bQNVF0TRLASKhfpJAruPrzsFElG0T7WyF467ekfeuM
X-Gm-Message-State: AOJu0YxZgu28Dho2dkCuD7jCsI6MU2NqkzZetzH17dtPQQMLvaM9cdpe
	6iwAF6dKb7ljoJ7UOZy5ojaBI+5XsXb+r06p97sDpkMTqbfF17nZSHPK8fOcVGg=
X-Google-Smtp-Source: AGHT+IFDqTXeWDAa/o8hueOYAnF3DgDYEq+LTMp/+sQXRY5ownpGP3t/xhnFnVdEZVh9WqmBe58A1A==
X-Received: by 2002:a81:574a:0:b0:607:899a:7fb8 with SMTP id l71-20020a81574a000000b00607899a7fb8mr4517927ywb.14.1708092199381;
        Fri, 16 Feb 2024 06:03:19 -0800 (PST)
Received: from mail-yb1-f171.google.com (mail-yb1-f171.google.com. [209.85.219.171])
        by smtp.gmail.com with ESMTPSA id x190-20020a0dd5c7000000b00607fd619a78sm211047ywd.37.2024.02.16.06.03.19
        for <linux-riscv@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 Feb 2024 06:03:19 -0800 (PST)
Received: by mail-yb1-f171.google.com with SMTP id 3f1490d57ef6-dcd7c526cc0so2216675276.1
        for <linux-riscv@lists.infradead.org>; Fri, 16 Feb 2024 06:03:19 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWpa85gwHBTM3voE1lmp99EeAVUTeRGgyZ3SziqmICLRcBSqw9o3G8jjYIh2QAwJ6g6f6YWRJB3dDMjpAHXwcdB8e7PL2plvgsb2wJb5kxd
X-Received: by 2002:a25:f903:0:b0:dc6:c617:7ca with SMTP id
 q3-20020a25f903000000b00dc6c61707camr4799409ybe.29.1708092199031; Fri, 16 Feb
 2024 06:03:19 -0800 (PST)
MIME-Version: 1.0
References: <20240208124300.2740313-1-claudiu.beznea.uj@bp.renesas.com> <20240208124300.2740313-5-claudiu.beznea.uj@bp.renesas.com>
In-Reply-To: <20240208124300.2740313-5-claudiu.beznea.uj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 16 Feb 2024 15:03:07 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVnOaPwyBQMxdmTEczSRHKctkaTMzs7KpnfCRoM=0GqfA@mail.gmail.com>
Message-ID: <CAMuHMdVnOaPwyBQMxdmTEczSRHKctkaTMzs7KpnfCRoM=0GqfA@mail.gmail.com>
Subject: Re: [PATCH 04/17] dt-bindings: clock: r9a08g045-cpg: Add power domain IDs
To: Claudiu <claudiu.beznea@tuxon.dev>
Cc: mturquette@baylibre.com, sboyd@kernel.org, robh@kernel.org, 
	krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org, magnus.damm@gmail.com, 
	paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu, 
	linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org, 
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240216_060321_409921_4F7D0DA6 
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
dWpAYnAucmVuZXNhcy5jb20+Cj4KPiBBZGQgcG93ZXIgZG9tYWluIElEcyBmb3IgUlovRzNTIChS
OUEwOEcwNDUpIFNvQy4KPgo+IFNpZ25lZC1vZmYtYnk6IENsYXVkaXUgQmV6bmVhIDxjbGF1ZGl1
LmJlem5lYS51akBicC5yZW5lc2FzLmNvbT4KClJldmlld2VkLWJ5OiBHZWVydCBVeXR0ZXJob2V2
ZW4gPGdlZXJ0K3JlbmVzYXNAZ2xpZGVyLmJlPgoKR3J7b2V0amUsZWV0aW5nfXMsCgogICAgICAg
ICAgICAgICAgICAgICAgICBHZWVydAoKLS0KR2VlcnQgVXl0dGVyaG9ldmVuIC0tIFRoZXJlJ3Mg
bG90cyBvZiBMaW51eCBiZXlvbmQgaWEzMiAtLSBnZWVydEBsaW51eC1tNjhrLm9yZwoKSW4gcGVy
c29uYWwgY29udmVyc2F0aW9ucyB3aXRoIHRlY2huaWNhbCBwZW9wbGUsIEkgY2FsbCBteXNlbGYg
YSBoYWNrZXIuIEJ1dAp3aGVuIEknbSB0YWxraW5nIHRvIGpvdXJuYWxpc3RzIEkganVzdCBzYXkg
InByb2dyYW1tZXIiIG9yIHNvbWV0aGluZyBsaWtlIHRoYXQuCiAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgLS0gTGludXMgVG9ydmFsZHMKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNj
dkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4v
bGlzdGluZm8vbGludXgtcmlzY3YK
