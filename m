Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0EABBC369AB
	for <linux-riscv@archiver.kernel.org>; Tue, 15 Apr 2025 07:50:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5lfvwmZxV5cJo1rNjvKfLW9TAvUUk44XybLH4169OBI=; b=ebByVhsPUJuD3z
	N3QepwTysMNoOda4SEclAL2E+VKRuFwvY00AHWQDndCzb9O7JJK5vOsVDNDdecS4zykCLN7oWOGN3
	hOfLzV6fBP72NNWXLzcB/e5yNqCW5Y5X5XlpMsrzKdWTHfPGnwZP24mFaBx3S0KwpwP6IYyhR6KGs
	KculIi2pHfuyOD4dGAnx9f/oZQtoFcjx6lcBUvkWAhLNmFfA/thGz/KlXEGwiOqz7Nr11Ietepd90
	R5Yqn6sMbuz1Q0fG3vHqrhOzUMkA/fc89uflcBvAlE11TLhOESTJ5Nlbqql6URGlkmIORptFEvaPp
	fJMdBBZ2IWAWSJcml17Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4b3e-00000004rzI-2ixq;
	Tue, 15 Apr 2025 07:50:14 +0000
Received: from mail-lj1-x22d.google.com ([2a00:1450:4864:20::22d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4apM-00000004pDn-1LeP
	for linux-riscv@lists.infradead.org;
	Tue, 15 Apr 2025 07:35:29 +0000
Received: by mail-lj1-x22d.google.com with SMTP id 38308e7fff4ca-30bfed67e08so51144291fa.2
        for <linux-riscv@lists.infradead.org>; Tue, 15 Apr 2025 00:35:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744702526; x=1745307326; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Z5s8lHjULdMShwAF8jjer9y5ggl6mu2Z2yK+KvFB6hE=;
        b=R+o/BKA+OAi5fE9TJVRP848AOz+obtieFdqotdz/CmvBlbyBdl99uHHePQLcLShQ3D
         BTJ4XMW1HxJ8iTAsdhwoxtNInw7cCyhezWtezw9UH7CWbt73GjATotYxY7Ix3Uofxe/l
         iKnL/MQIqmyZm+cj78qJQAoGxv/tCxfETrjqSljbeRQGSRUAuZvL1Kd1bFIE7qSdl+hh
         edw5jCLmhsUi4b6ZSn/vKSoXfJ2Qi5jkwywdEv74rS1M3u/7IdCVjytI7108ZxImsQKA
         AnPPLrUSF9SiW34bAYcpWyF4b9UZRDK8ZQn/l65PqI/SkvEjLU38VxGo9e1nsDsHF75x
         WGLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744702526; x=1745307326;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Z5s8lHjULdMShwAF8jjer9y5ggl6mu2Z2yK+KvFB6hE=;
        b=cPDgEqVOZNvxfVkd8KJHB5eryJYc1CKHKGqTe2RHK0nZCZouVIxVaKv4tuA2wKWy2D
         usgbihX8r8kIbI6an37xo3fV+o3tB55qR7ijdpHjhgV5qvztWNnCMl3i3UU6nlAg+GPU
         31pU+OMKN+c62hHy5ZhWEJo+dXQ4ztttYBIY75ImYuEdLxPiMc1r7YEHZLhBmxHvImqc
         /TGgfzdZNaTYFwibgRkCaDtY2A4vPzyiIha+H+ibLgX/mowRwT+cwo4Mw4xmdxelX2uD
         Xz1mHsnVyt3DpY5qr1cDfFhY1gWzQXA50hU0xm8sHxpj9JTvxgEclHDLe6DGaUuz5s2e
         r6yg==
X-Forwarded-Encrypted: i=1; AJvYcCX88xmKA/XEEEog6vKiv0jJsO6wKauwxMT0AEvhPweimj5Y9ryLdPCJKgbIp9VfEL8pFE0kffBAt7ptAQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YyG2BGJDgOBAuDH2MhaAYbnReBC79gLAdFdZLM/pJ4VZQwWz768
	ssof56/u4o488SlWUof8whQXq56RiJ9z2bM7wBY0NXKi8mlbAeG2z+gKqEekqrxgHz4W16JqhF9
	AViipymzvOiOrKIenQuzuI77VfVp7/xZ5W9iXaw==
X-Gm-Gg: ASbGncvGPPM2JeFo8tk7+LdSncacjTVfHxWYSPA2HhIhV+LpB2rgeRRPUSbRuJcZRyX
	SBGENXnhqyXcfpyXcrC+5Odeh+nzsb3/m4AartClLD1Wtk7tsfA9HUdfL8O0oSqpp0EdJP+CN67
	mSSl0z/CigaCpHGfOeKP5GC4Vqv4KecF4U
X-Google-Smtp-Source: AGHT+IF/f3ma4C5o9c0efnyvduCTab9wDDK72+7lhXFZsmhgzu8nGsMsG6D4c0qe2PhRQIiyrICHnRVYY1XaZjetoDw=
X-Received: by 2002:a05:651c:30c1:b0:30d:b3d1:a71 with SMTP id
 38308e7fff4ca-31049a80682mr54317271fa.33.1744702526493; Tue, 15 Apr 2025
 00:35:26 -0700 (PDT)
MIME-Version: 1.0
References: <20250412-03-k1-gpio-v8-0-1c6862d272ec@gentoo.org> <20250415023234-GYA29961@gentoo>
In-Reply-To: <20250415023234-GYA29961@gentoo>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 15 Apr 2025 09:35:15 +0200
X-Gm-Features: ATxdqUFrvoN3oToav7nR6RzJi6WKzvpJz5pszWK5ULoM2MOJjET7tU5z2QtEKvY
Message-ID: <CACRpkdZ6A0xORRQBnNNPFcNHg3xL=U3_xAcePmaDN3_ZYMzsaA@mail.gmail.com>
Subject: Re: [PATCH v8 0/5] riscv: spacemit: add gpio support for K1 SoC
To: Yixun Lan <dlan@gentoo.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250415_003528_364476_F73CF9AF 
X-CRM114-Status: UNSURE (   8.73  )
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
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Meng Zhang <zhangmeng.kevin@linux.spacemit.com>, Alex Elder <elder@riscstar.com>, linux-gpio@vger.kernel.org, Bartosz Golaszewski <brgl@bgdev.pl>, linux-kernel@vger.kernel.org, Conor Dooley <conor@kernel.org>, Yangyu Chen <cyy@cyyself.name>, devicetree@vger.kernel.org, Palmer Dabbelt <palmer@dabbelt.com>, Jesse Taube <mr.bossman075@gmail.com>, Jisheng Zhang <jszhang@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>, Inochi Amaoto <inochiama@outlook.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, spacemit@lists.linux.dev, linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gVHVlLCBBcHIgMTUsIDIwMjUgYXQgNDozMuKAr0FNIFlpeHVuIExhbiA8ZGxhbkBnZW50b28u
b3JnPiB3cm90ZToKCj4gSGkgQmFydG9zeiwKPiAgIEkgdGhpbmsgdGhpcyB2ZXJzaW9uIGlzIGdv
b2QgdG8gZ28sIGlmIHlvdSBhZ3JlZSwKPiBjYW4geW91IHRha2UgcGF0Y2ggWzEsMiAvIDVdIHRo
cm91Z2ggZ3BpbyB0cmVlPwoKSSBhZ3JlZSB3aXRoIHRoaXMsIGl0J3MgdGhlIGZpbmFsIHBpZWNl
IG1ha2luZyB1c2Ugb2YgYWxsIHRoZSBuaWNlCmluZnJhc3RydWN0dXJlIHdlIHB1dCBpbiBmb3Ig
dGhyZWVjZWxsIEdQSU8gYW5kIHRocmVlY2VsbApJUlEgc28gbGV0J3MgbWVyZ2UgcGF0Y2hlcyAx
KzIhCgpZb3VycywKTGludXMgV2FsbGVpagoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxp
c3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0
aW5mby9saW51eC1yaXNjdgo=
