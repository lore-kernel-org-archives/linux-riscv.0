Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C4B2CDB47E
	for <linux-riscv@archiver.kernel.org>; Wed, 18 Oct 2023 17:29:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=m9hsmVbCuJ0JDfyyXYc37VqFlvWJ+nYYFJKxO6g+ie0=; b=a+pCKwHsniwzIb
	t3XtHKG0B50u36a/PPpuPoWCsmTpB7vLZsu2hxd9Ajggu43AwdUWAqjKB7sOhho1flUvAv5zomkG1
	DDaQ9uNXhDYsUtrxbwfgCPpJo7CeSOf7EaREPjexQzYiLgPGMzNngC3PdNT1GURHgi0N9joWoYyaI
	LqbQ3g8856iAKPfS0uJPFDMBguHfsAffbuCr/1pUDfp37VdP/MOSsRWtDnHPPgEEAUsHluDNfIrh1
	YMMgVsGvEfvb/GjDrEprxLOaQPhZuXfoe/fxq15rV/llQK0bfdOrEqOd02Es+n+ztV2nYo1m8ycSB
	gnEg1GtX5XR/nU8pFSIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qtAMD-00FJr5-0a;
	Wed, 18 Oct 2023 17:29:21 +0000
Received: from mail-lj1-x232.google.com ([2a00:1450:4864:20::232])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qtAM9-00FJpC-2l
	for linux-riscv@lists.infradead.org;
	Wed, 18 Oct 2023 17:29:20 +0000
Received: by mail-lj1-x232.google.com with SMTP id 38308e7fff4ca-2c50305c5c4so88107401fa.1
        for <linux-riscv@lists.infradead.org>; Wed, 18 Oct 2023 10:29:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1697650156; x=1698254956; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=c9mW/8DEleFixbtMa99KMZOBUTSC7Ptb45fTVDigBn4=;
        b=2cRHVghD3OzzW9V+cAnay04eH3wZAMj78+maiiCO3o31FIL5lNSxHvzxdYzZemCZ2V
         fSg4e84aHZjAcWs6lmoz5SoOFa+luGBQ9YyGpnZrW8IiDY4W8/3ENR9vAK+lZztDd5qM
         ifVhWxQjDLLH38QKUdLBwCgbr5HOgu7TC1r+x1UoJfs1HhpIKQSpso6eyr2zXnXEpFoE
         kvoRClwmuguuaHxXBAJdFDnsXFOBDbLE4aNN1z0nPepnVNtZFSS9l/eXvIG4BJ0mBQc3
         r1e59LNlKJFN9LKmoh9AFw0BVlJ40+IsFfrC0JZ270wy9lwBmI4cUNS2IWB/WzNGB10m
         2nMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697650156; x=1698254956;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=c9mW/8DEleFixbtMa99KMZOBUTSC7Ptb45fTVDigBn4=;
        b=AbCQlnDwlcCeDuxEFE8E6K4r/TQ4rAaCP93TWLOapmuKox9MnKkUICT6UT6JZ5t8Yw
         egoeR37tY/7gVsWi2FWvsi2BBB7az6d6k8O4XduHrIl7eWZ+GUleqdr0TsHWtTRT1alD
         xtOAZTHJ6lbGyEyunE7G/5NKuybdvvUtj6rDF3Fvr1KHEsZKiJs2MR1ksCQ3XawYaKJ1
         VkrgUSrAV2LMV7IoJJ9b9CK2K4XP2qKFXNljGdt9DlEbG901AWN98khxFnjLPLdIH1rZ
         nvNEsgwNJhFtVN6ZUztjr6Fd5VA92QjwK6FGUREAgAVUhm0QJw4Yntk6ekC+Ln+aFweW
         BGSw==
X-Gm-Message-State: AOJu0Yz6121Bzt7Ad9aCY7o2WEgZ1yaVmzpW8kCwFm5EjfEZcBMQ/KM2
	0Lnk81kZtpXaYLy1Y/quWl99IjGVLXc1fV5NXOKh3A==
X-Google-Smtp-Source: AGHT+IEKxwcNhG7R9mpe5DzutveDAX4kbTZ+kqkFoiHb0qfB741C7dwpjxdZ3dHNWy9wDmKFREgYKiMobD1lxW4k5X8=
X-Received: by 2002:a2e:880d:0:b0:2c0:2ef8:9716 with SMTP id
 x13-20020a2e880d000000b002c02ef89716mr3912537ljh.1.1697650155617; Wed, 18 Oct
 2023 10:29:15 -0700 (PDT)
MIME-Version: 1.0
References: <20231017131456.2053396-1-cleger@rivosinc.com> <20231017131456.2053396-15-cleger@rivosinc.com>
In-Reply-To: <20231017131456.2053396-15-cleger@rivosinc.com>
From: Evan Green <evan@rivosinc.com>
Date: Wed, 18 Oct 2023 10:28:39 -0700
Message-ID: <CALs-Hss8g8+CFd9T1QAPj0eksJmjBi6jL8O1hT2R37PN31WG3w@mail.gmail.com>
Subject: Re: [PATCH v2 14/19] riscv: add ISA extension parsing for Zvfh[min]
To: =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>
Cc: linux-riscv@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	Palmer Dabbelt <palmer@rivosinc.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Albert Ou <aou@eecs.berkeley.edu>, 
	Jonathan Corbet <corbet@lwn.net>, Andrew Jones <ajones@ventanamicro.com>, 
	Conor Dooley <conor@kernel.org>, Samuel Ortiz <sameo@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231018_102917_895396_1197E6BC 
X-CRM114-Status: UNSURE (   7.56  )
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

T24gVHVlLCBPY3QgMTcsIDIwMjMgYXQgNjoxNeKAr0FNIENsw6ltZW50IEzDqWdlciA8Y2xlZ2Vy
QHJpdm9zaW5jLmNvbT4gd3JvdGU6Cj4KPiBBZGQgcGFyc2luZyBmb3IgWnZmaFttaW5dIElTQSBl
eHRlbnNpb25bMV0gd2hpY2ggd2VyZSByYXRpZmllZCBpbgo+IGp1bmUgMjAyMyBhcm91bmQgY29t
bWl0IGUyY2NkMDU0OGQ2YyAoIlJlbW92ZSBkcmFmdCB3YXJuaW5ncyBmcm9tCj4gWnZmaFttaW5d
IikgaW4gcmlzY3Ytdi1zcGVjWzJdLgo+Cj4gTGluazogaHR0cHM6Ly9kcml2ZS5nb29nbGUuY29t
L2ZpbGUvZC8xX1l0NjBIR0FmMXIxaHg3Sm5zSXB0dzBzcWtCZDlCUTgvdmlldyBbMV0KPiBMaW5r
OiBodHRwczovL2dpdGh1Yi5jb20vcmlzY3YvcmlzY3Ytdi1zcGVjL2NvbW1pdHMvZTJjY2QwNTQ4
ZDZjIFsyXQo+IFNpZ25lZC1vZmYtYnk6IENsw6ltZW50IEzDqWdlciA8Y2xlZ2VyQHJpdm9zaW5j
LmNvbT4KClJldmlld2VkLWJ5OiBFdmFuIEdyZWVuIDxldmFuQHJpdm9zaW5jLmNvbT4KCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1h
aWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5p
bmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
