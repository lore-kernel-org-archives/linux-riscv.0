Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC98FE95A91
	for <linux-riscv@archiver.kernel.org>; Mon,  9 Oct 2023 12:16:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SH3DE4AdeQvYlAfAHR85jgGDUm4H3jHmEgrzASpbBs4=; b=X8Lty1nZkgJc8T
	K5iztbM3pezLi5EwQ1gjlnKl7uAEa3ujiYpFrcgjjbN8tMGQBR+UnHjJvu9fXR9gI4Ofb3rYaGLF0
	cRQjQ88P8k/p0X/w+LzLo8bxKbVZKUKcLOnP7V1UzWwdcsPkktrdALk/1CL1ySgYFaAXdAPEpsfdU
	uFBljadZOps0qgnddL5f1dp+gZRQDRkK5Nz/+DGoySno90qNtU+0H8YsEZytOGK/jwFPdMJy3dGKO
	c0TGcCx8A2XahVnIUnJFTF6JoJ7XQXzHRn/fQAV8eI74oWZCtQzeGbfC7Z/PSRSknnuoise5F4wjR
	UCmsin+5t7QdntKq72OQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qppBF-00AeZe-0D;
	Mon, 09 Oct 2023 12:16:13 +0000
Received: from mail-yw1-f170.google.com ([209.85.128.170])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qppB5-00AePl-1E
	for linux-riscv@lists.infradead.org;
	Mon, 09 Oct 2023 12:16:09 +0000
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-5a7af20c488so1026787b3.1
        for <linux-riscv@lists.infradead.org>; Mon, 09 Oct 2023 05:16:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696853760; x=1697458560;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dl00x9F8gW/xdOyelK9eYXeUORxvhqizJLBB30N7AGk=;
        b=eP4WdjjTbBTIoHI+GAQ+PXJQr67GG8miQ34mnt9RNcPfvqTOLTN5OkU0dMVDqR/5UA
         xNKsrU3o1QZYPV08KzpPmS4aiqSlfoxTKZ0FkvZecwotvecPXPVtTJeIchhMjQ91IQEs
         kqqEWEkroQMwJgPhTU5D6TJbLbF9IiBn52mKGngsutt1c3zMk4zjOuAle++TUYWnZYXv
         uHtMKDNgcD3iHpsKfMkRKzJeoE25kSbKyThTOcAKTjr77DAnSwp/OIrdzKlCIsOmNohQ
         t9Y6SodTeM77VHCG7HlXSFvj8C2BRu+XeJbhJ1kOHMXQpUQ1sGNeshpZBGprIsMQayJy
         TACA==
X-Gm-Message-State: AOJu0YwTl6SVDKGus5BPrK4T9iLXR8veatCu4Ds1Y68F5yOZMFBNiSGN
	rTV39+GBIVoq5hYsHEhTSKpLCpynP9q2DA==
X-Google-Smtp-Source: AGHT+IHL6hojyIrCYQHnfRWk/grwtcHqUT1nCrpmNbgyFwzGqEJJ7aLeyNE6zuE6yTjtSmjCDmp6LQ==
X-Received: by 2002:a0d:ef04:0:b0:583:d9de:8509 with SMTP id y4-20020a0def04000000b00583d9de8509mr15910028ywe.27.1696853759970;
        Mon, 09 Oct 2023 05:15:59 -0700 (PDT)
Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com. [209.85.128.171])
        by smtp.gmail.com with ESMTPSA id l17-20020a0de211000000b005a50575b1c8sm3614763ywe.26.2023.10.09.05.15.59
        for <linux-riscv@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Oct 2023 05:15:59 -0700 (PDT)
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-5a505762c9dso54776267b3.2
        for <linux-riscv@lists.infradead.org>; Mon, 09 Oct 2023 05:15:59 -0700 (PDT)
X-Received: by 2002:a0d:d402:0:b0:59b:c847:bce0 with SMTP id
 w2-20020a0dd402000000b0059bc847bce0mr16554853ywd.42.1696853759136; Mon, 09
 Oct 2023 05:15:59 -0700 (PDT)
MIME-Version: 1.0
References: <20231009-approve-verbalize-ce9324858e76@wendy> <20231009-smog-gag-3ba67e68126b@wendy>
In-Reply-To: <20231009-smog-gag-3ba67e68126b@wendy>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 9 Oct 2023 14:15:47 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVc7VOvB86A7-TShhoqut6Y1ZvY0WSC8XpOEv8Bb2bA-Q@mail.gmail.com>
Message-ID: <CAMuHMdVc7VOvB86A7-TShhoqut6Y1ZvY0WSC8XpOEv8Bb2bA-Q@mail.gmail.com>
Subject: Re: [PATCH v3 4/6] riscv: dts: renesas: convert isa detection to new properties
To: Conor Dooley <conor.dooley@microchip.com>
Cc: linux-riscv@lists.indradead.org, conor@kernel.org, 
	Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Chen-Yu Tsai <wens@csie.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Daire McNamara <daire.mcnamara@microchip.com>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Magnus Damm <magnus.damm@gmail.com>, Emil Renner Berthing <kernel@esmil.dk>, 
	Jisheng Zhang <jszhang@kernel.org>, Guo Ren <guoren@kernel.org>, Fu Wei <wefu@redhat.com>, 
	Chen Wang <unicorn_wang@outlook.com>, devicetree@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	linux-renesas-soc@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231009_051603_439398_BE1891FF 
X-CRM114-Status: GOOD (  17.17  )
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

SGkgQ29ub3IsCgpPbiBNb24sIE9jdCA5LCAyMDIzIGF0IDExOjQ04oCvQU0gQ29ub3IgRG9vbGV5
IDxjb25vci5kb29sZXlAbWljcm9jaGlwLmNvbT4gd3JvdGU6Cj4gQ29udmVydCB0aGUgUlovRml2
ZSBkZXZpY2V0cmVlcyB0byB1c2UgdGhlIG5ldyBwcm9wZXJ0aWVzCj4gInJpc2N2LGlzYS1iYXNl
IiAmICJyaXNjdixpc2EtZXh0ZW5zaW9ucyIuCj4gRm9yIGNvbXBhdGliaWxpdHkgd2l0aCBvdGhl
ciBwcm9qZWN0cywgInJpc2N2LGlzYSIgcmVtYWlucy4KPgo+IFNpZ25lZC1vZmYtYnk6IENvbm9y
IERvb2xleSA8Y29ub3IuZG9vbGV5QG1pY3JvY2hpcC5jb20+CgpUaGFua3MgZm9yIHlvdXIgcGF0
Y2ghCgo+IC0tLSBhL2FyY2gvcmlzY3YvYm9vdC9kdHMvcmVuZXNhcy9yOWEwN2cwNDNmLmR0c2kK
PiArKysgYi9hcmNoL3Jpc2N2L2Jvb3QvZHRzL3JlbmVzYXMvcjlhMDdnMDQzZi5kdHNpCj4gQEAg
LTI0LDYgKzI0LDkgQEAgY3B1MDogY3B1QDAgewo+ICAgICAgICAgICAgICAgICAgICAgICAgIHJl
ZyA9IDwweDA+Owo+ICAgICAgICAgICAgICAgICAgICAgICAgIHN0YXR1cyA9ICJva2F5IjsKPiAg
ICAgICAgICAgICAgICAgICAgICAgICByaXNjdixpc2EgPSAicnY2NGltYWZkYyI7Cj4gKyAgICAg
ICAgICAgICAgICAgICAgICAgcmlzY3YsaXNhLWJhc2UgPSAicnY2NGkiOwo+ICsgICAgICAgICAg
ICAgICAgICAgICAgIHJpc2N2LGlzYS1leHRlbnNpb25zID0gImkiLCAibSIsICJhIiwgImYiLCAi
ZCIsICJjIiwgInppY250ciIsICJ6aWNzciIsCj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAiemlmZW5jZWkiLCAiemlocG0iOwoKTEdNVCwgc28KUmV2aWV3
ZWQtYnk6IEdlZXJ0IFV5dHRlcmhvZXZlbiA8Z2VlcnQrcmVuZXNhc0BnbGlkZXIuYmU+CgpJIGNv
dWxkIG5vdCByZXZpZXcgdGhlICJ6aSoiIHBhcnRzLCBhcyB0aGUgZG9jdW1lbnRhdGlvbiB0aGF0
IEkgaGF2ZQpkb2VzIG5vdCBtZW50aW9uIHRoZXNlLgoKPiAgICAgICAgICAgICAgICAgICAgICAg
ICBtbXUtdHlwZSA9ICJyaXNjdixzdjM5IjsKPiAgICAgICAgICAgICAgICAgICAgICAgICBpLWNh
Y2hlLXNpemUgPSA8MHg4MDAwPjsKPiAgICAgICAgICAgICAgICAgICAgICAgICBpLWNhY2hlLWxp
bmUtc2l6ZSA9IDwweDQwPjsKCkdye29ldGplLGVldGluZ31zLAoKICAgICAgICAgICAgICAgICAg
ICAgICAgR2VlcnQKCi0tIApHZWVydCBVeXR0ZXJob2V2ZW4gLS0gVGhlcmUncyBsb3RzIG9mIExp
bnV4IGJleW9uZCBpYTMyIC0tIGdlZXJ0QGxpbnV4LW02OGsub3JnCgpJbiBwZXJzb25hbCBjb252
ZXJzYXRpb25zIHdpdGggdGVjaG5pY2FsIHBlb3BsZSwgSSBjYWxsIG15c2VsZiBhIGhhY2tlci4g
QnV0CndoZW4gSSdtIHRhbGtpbmcgdG8gam91cm5hbGlzdHMgSSBqdXN0IHNheSAicHJvZ3JhbW1l
ciIgb3Igc29tZXRoaW5nIGxpa2UgdGhhdC4KICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAtLSBMaW51cyBUb3J2YWxkcwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmlu
ZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9s
aW51eC1yaXNjdgo=
