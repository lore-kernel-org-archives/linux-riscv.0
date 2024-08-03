Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA35EC3DA4A
	for <linux-riscv@archiver.kernel.org>; Sat,  3 Aug 2024 22:58:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NU5PA3WoAK3dCYMeoza7QNJW5DkBfPo0a4/BvZJ//6o=; b=k+ZKpghkM+VP4r
	TbSnz47rt5YibifdRfjpCo1lmStBGCgSVBRKp/fnQvUIOjH4XdkhFMa+lx63qKY6IoBDaNLn67cBT
	nxXXoKwUIiE8vYhGMW3KvVwmlm84OJMpWJXNqicnsarSrscZTLoAar5swHOIs5lmwkMCJo/BYFFpQ
	1PnrOleTrygKw9yFnXyLE4QgRgwMUBbztpBcm0s9ZdcZHmufcAnfasUTCdhJMCXhRjRMHy7qV1VC/
	mdJ4RrRI7MOHVijkIhA/jzWxMDjI817m3rlYsSegFaosdpq3CXP64tl12ejrsYX5hRaArxyr4sYkQ
	/QPDwyF/PENdKvdU1hRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1saNhp-0000000CFP0-3Oz0;
	Sat, 03 Aug 2024 22:58:33 +0000
Received: from mail-lf1-x12b.google.com ([2a00:1450:4864:20::12b])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1saNhl-0000000CFOC-43X9
	for linux-riscv@lists.infradead.org;
	Sat, 03 Aug 2024 22:58:31 +0000
Received: by mail-lf1-x12b.google.com with SMTP id 2adb3069b0e04-530c2e5f4feso1330684e87.0
        for <linux-riscv@lists.infradead.org>; Sat, 03 Aug 2024 15:58:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1722725907; x=1723330707; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3BRzezbw9GSa3xz41e6WFFbhJ0iTVxVtG439svHu7GQ=;
        b=gyvSQwtrLLclrrtg5PU9dx/gJYTOEgDeKj+dVMhYNtU1oIYHwh2k5QlAD3BtRRAdq5
         42ZbnqqIL0WJZBogV4VWqpbeZ6aLcetYqqYoG0VZJ/pD9sqdQ63769KKR4WGUqZkRgmm
         4wK1X1+ueBZDVCeyZM5NUY+pjqZYVWAV6itFla9NuBZtpa7GETz4Vtdvq1neMzwBLqie
         D367JFwX+DCg5GayJSx4QsZnP0VlGCf42xwqiEM749YOWI1lxkvxBmlfvuWcBtm2IXYR
         jyUsGF+tZQj3iQasTKUD/iNa3KSsDOrCz3V/JTpJRRTjTr1qn6IGu3E55sm6q/Rk1J0f
         R24A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722725907; x=1723330707;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3BRzezbw9GSa3xz41e6WFFbhJ0iTVxVtG439svHu7GQ=;
        b=UOTAhN2vGbr6eom16+bsyA/1PGC3xuFA77UxAl9CJDjhplPSVPfA4Hoys92ZC93Xts
         f89rIdaSJp//abveye+4jIsPKcEvcrOxWRBL3bdI/eHCOCKRVC5jAafG9JN1px9PHIm/
         M0MYga462ZaCYGERiGNwar++y6+s3+WuiTxIvH1xU8riL/hE7OCIxmf3v86oOkJYDq1D
         7SwUveFdc7OozwHgsHoB4o+N9atJ5014Inmifdi6E+x0aVkVHT6PANimOor4KKyEnPSc
         B/YfpiXz5Ztgjnovm9X0eclZe+Ykr/fhOiLZqt2QG0A6AHij58xIzLeCU9vrpcpLs07f
         vM1w==
X-Forwarded-Encrypted: i=1; AJvYcCVbmAUY4I4pycytA0VwUJ2X1bSaX/LtEmMDuILdeOfAVfGHWETbfc7bmIOzv6dK3tyoSHLKY5HlkfN68dT2XOIIhMFbhV0Yv/ejbTGsCfWQ
X-Gm-Message-State: AOJu0Yzgw4xmwnkMCAry3/e9RxhebzsGD7x9SJAEDO9aPdbFlC5FRFQ/
	IbXyuFxEwrIFhgQ+vWYzTkExfHZMWd5AEz9EtYeMxFn6X6HKAVvXsSNf3/GIs0wHDAcu3P7qNMF
	uw+iwJOOxXD8HoZR8MtpPDEODKs0PuwHKzgsPYg==
X-Google-Smtp-Source: AGHT+IE4y9kLkzPoH/zfRiNc8kfa8clmJiMKTLB0WN4Xe+IjU5ivL54qw+cgJYdb+86Oky2eUuqmhbuQKBYEt1uqbzQ=
X-Received: by 2002:a05:6512:2389:b0:52e:9ecd:3465 with SMTP id
 2adb3069b0e04-530bb3b1891mr5046679e87.57.1722725907073; Sat, 03 Aug 2024
 15:58:27 -0700 (PDT)
MIME-Version: 1.0
References: <IA1PR20MB4953DC78BB0FE0C57EA94F91BBB32@IA1PR20MB4953.namprd20.prod.outlook.com>
 <IA1PR20MB4953680DE7977CAD906DBDB4BBB32@IA1PR20MB4953.namprd20.prod.outlook.com>
In-Reply-To: <IA1PR20MB4953680DE7977CAD906DBDB4BBB32@IA1PR20MB4953.namprd20.prod.outlook.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Sun, 4 Aug 2024 00:58:16 +0200
Message-ID: <CACRpkdap4oeG6QRVbSNDK1Y5kT73_VJRgy9EM5Bst08SXmxE8A@mail.gmail.com>
Subject: Re: [PATCH v4 1/7] dt-bindings: pinctrl: Add pinctrl for Sophgo
 CV1800 series SoC.
To: Inochi Amaoto <inochiama@outlook.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Chen Wang <unicorn_wang@outlook.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Jisheng Zhang <jszhang@kernel.org>, Guo Ren <guoren@kernel.org>, 
	Drew Fustini <dfustini@baylibre.com>, Haylen Chu <heylenay@outlook.com>, 
	Liu Gui <kenneth.liu@sophgo.com>, Yixun Lan <dlan@gentoo.org>, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240803_155830_031316_5039EB3C 
X-CRM114-Status: UNSURE (   7.29  )
X-CRM114-Notice: Please train this message.
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

T24gRnJpLCBBdWcgMiwgMjAyNCBhdCAyOjM14oCvQU0gSW5vY2hpIEFtYW90byA8aW5vY2hpYW1h
QG91dGxvb2suY29tPiB3cm90ZToKCj4gQWRkIHBpbmN0cmwgc3VwcG9ydCBmb3IgU29waGdvIENW
MTgwMCBzZXJpZXMgU29DLgo+Cj4gU2lnbmVkLW9mZi1ieTogSW5vY2hpIEFtYW90byA8aW5vY2hp
YW1hQG91dGxvb2suY29tPgoKUm9iIHNhaWQgeW91IGNvdWxkIGFkZCBoaXMgUmV2aWV3IHRhZyBp
ZiB5b3UgZml4ZWQgc29tZSBzbWFsbAppc3N1ZXMgaW4gdjMsIGFyZSB0aGV5IGZpeGVkIHNvIEkg
Y2FuIGFwcGx5IHRoaXMgd2l0aCBoaXMgdGFnPwoKWW91cnMsCkxpbnVzIFdhbGxlaWoKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1h
aWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5p
bmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
