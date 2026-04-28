Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57545FF8868
	for <linux-riscv@archiver.kernel.org>; Tue, 28 Apr 2026 10:12:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Qq37NY5uAcVxXayLs7fxFrJDpvhBKZ7e8AUWJFn8WxY=; b=Fiy/WxFhG0PLVn
	1FXOu0oWnDU63RWD/pjM4B/6Zyf23dJfwv0R3avXWNduErUMfheGmZtZeIRK7SrSAFN2ol3GVZjvF
	Ss+OPJlj7/f2FJpt+SveWTEIvxn/z9xvB4KFYjSya8nw5AGCNmqVmpEPtOKuk5Du1YRb+HjG0tmSK
	dRXrbbruzJe8REHAzW0ClntY3ImNcgfbQX7B927JmKh9b6ia4COEPysXZcCcrGH7LH+FFkPpkDuDl
	v09UPY5635qqgnkfLN8ckjfnItjOHthqGX3gXS+GmKlvND7BjfTNjwwfHKtdxUg1Gkbh18lck8VJv
	YZpq4UR/lGNMABhXYsTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHfQ8-0000000198A-2ioz;
	Tue, 28 Apr 2026 10:12:00 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHfQ5-0000000197p-2Krs
	for linux-riscv@lists.infradead.org;
	Tue, 28 Apr 2026 10:11:58 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id C93F54491C
	for <linux-riscv@lists.infradead.org>; Tue, 28 Apr 2026 10:11:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 99746C2BCF4
	for <linux-riscv@lists.infradead.org>; Tue, 28 Apr 2026 10:11:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777371116;
	bh=UPlI2MxqqzTG6pcBOvFyr6PFrDiXKqyQQt6AzQK8OV0=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=QQdvSo1GX/av6NCj+u0IHq50CcAgm8bP7marxoZ0L56+DrHND5ObTJ7esO4k5GuQN
	 iYmroHdAUxhuRgwoQPNBRGCiMzSb4F8Q/4MKCn399Xdk3nzi+lq1xl1BYr4nnNyL8Z
	 9MIgxZPkDRn75xpD2qyp1R2JxxuI/96MsqHhk53A10UZZDT1eKCKBTf/ulSrLlQrbX
	 a9A0f1dEvRxHuDU+MTN/Bzi4BkyaSEAtnw7cyO2Z5Hv1XVkwod9sKfTN+i0zX1XEXO
	 z1Ns03esAfb4teowhMr2nSSofuPfApJuG2m/BhmwxWCF5qjyqgRsnaL2uQml/kp8TT
	 gd3NC5IUrK5Pw==
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-38df1889fb9so108732911fa.1
        for <linux-riscv@lists.infradead.org>; Tue, 28 Apr 2026 03:11:56 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ/AD/0SJ0AWK55xFVPI3zomeni425WccxVxysNq+kJBhnx2KnPYPLDJlKL10IcVL6ao4JcDI4M8rx1KHw==@lists.infradead.org
X-Gm-Message-State: AOJu0YySQgIlPuhev2MO1/GnEj1csALmJLzYbtmwyDX9n/7oYVXcJu6+
	BkYT9aKi7wTbS6VeZUfbDRPFf/juJyuXaM+zsN70bPYEWzLjSFlnYjU6qwUOvpAOrMYutXixqYc
	9SmwCBq8f/RRvfFW6vjyFw2uLk+YMlNc=
X-Received: by 2002:a2e:bc11:0:b0:38c:562b:9bb6 with SMTP id
 38308e7fff4ca-39240d1f9bamr8863851fa.15.1777371115274; Tue, 28 Apr 2026
 03:11:55 -0700 (PDT)
MIME-Version: 1.0
References: <20260424111330.702272-1-changhuang.liang@starfivetech.com>
In-Reply-To: <20260424111330.702272-1-changhuang.liang@starfivetech.com>
From: Linus Walleij <linusw@kernel.org>
Date: Tue, 28 Apr 2026 12:11:43 +0200
X-Gmail-Original-Message-ID: <CAD++jL=tvDBWJHRGGJw4nnox_kcJKn5hwvwz9zxadMRedyvRhw@mail.gmail.com>
X-Gm-Features: AVHnY4ITCGaKkSuhjuqaL9_ByANEzbQqR8GldjtDhjgWLlUEHhL6NVnrqMC7umU
Message-ID: <CAD++jL=tvDBWJHRGGJw4nnox_kcJKn5hwvwz9zxadMRedyvRhw@mail.gmail.com>
Subject: Re: [PATCH v1 00/20] Add basic pinctrl drivers for JHB100 SoC
To: Changhuang Liang <changhuang.liang@starfivetech.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Emil Renner Berthing <kernel@esmil.dk>, Paul Walmsley <pjw@kernel.org>, 
	Albert Ou <aou@eecs.berkeley.edu>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Alexandre Ghiti <alex@ghiti.fr>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Bartosz Golaszewski <brgl@kernel.org>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
	Lianfeng Ouyang <lianfeng.ouyang@starfivetech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260428_031157_658871_003CF3AD 
X-CRM114-Status: GOOD (  14.54  )
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

SGkgQ2hhbmdodWFuZywKCnRoYW5rcyBmb3IgeW91ciBwYXRjaCEKCk9uIEZyaSwgQXByIDI0LCAy
MDI2IGF0IDE6MTPigK9QTSBDaGFuZ2h1YW5nIExpYW5nCjxjaGFuZ2h1YW5nLmxpYW5nQHN0YXJm
aXZldGVjaC5jb20+IHdyb3RlOgoKPiBUaGUgSkhCMTAwIFNvQyBoYXMgMTMgcGluY3RybCBkb21h
aW5zIC0gc3lzMCwgc3lzMGgsIHN5czEsIHN5czIsIHBlcjAsIHBlcjEsCj4gcGVyMiwgcGVyMnBv
aywgcGVyMywgYWRjMCwgYWRjMSwgZW1tYywgYW5kIHZnYS4KPgo+IEluIHRoZSBjdXJyZW50IHNl
cmllcywgd2Ugd2lsbCBvbmx5IGFkZCB0aGUgZm9sbG93aW5nIHBpbmN0cmw6Cj4gIC0gc3lzMCwg
c3lzMGgsIHN5czEsIHN5czIKPiAgLSBwZXIwLCBwZXIxLCBwZXIyLCBwZXIycG9rLCBwZXIzCj4K
PiBUaGUgcmVtYWluaW5nIHBpbmN0cmwgd2lsbCBiZSBpbXBsZW1lbnRlZCBpbiBmdXR1cmUgc2Vy
aWVzLgo+Cj4gVGhpcyBzZXJpZXMgZGVwZW5kcyBvbiB0aGUgc2VyaWVzOgo+IGh0dHBzOi8vbG9y
ZS5rZXJuZWwub3JnL2FsbC8yMDI2MDQwMjEwNTUyMy40NDc1MjMtMS1jaGFuZ2h1YW5nLmxpYW5n
QHN0YXJmaXZldGVjaC5jb20vCgooLi4uKQoKPiAgLi4uL3N0YXJmaXZlL3BpbmN0cmwtc3RhcmZp
dmUtamhiMTAwLmMgICAgICAgIHwgMTgyMSArKysrKysrKysrKysrKysrKwoKVGhhdHMgYSBiaWcg
cGF0Y2guCgpJIG5lZWQgYSBtb3RpdmF0aW9uIHdoeSB0aGUgZXhpc3RpbmcgY29kZSBpbiBwaW5j
dHJsLXN0YXJmaXZlLWpoNzExMC5jCmFuZCBwaW5jdHJsLXN0YXJmaXZlLWpoNzEwMC5jIGNhbm5v
dCBiZSByZWZhY3RvcmVkLCByZXB1cnBvc2VkIGFuZApyZS11c2VkIG9mIHRoaXMgaGFyZHdhcmUg
aXMgcmVsYXRlZCB0byB0aGUgb2xkIGhhcmR3YXJlPwoKV2UgZG9uJ3Qgd2FudCBzZXZlcmFsIGNv
cGllcyBvZiBlc3NlbnRpYWxseSB0aGUgc2FtZSBkcml2ZXIsIHRoYXQKd2F5IHdlIGdldCBtYWlu
dGVuYW5jZSBvdmVybG9hZC4KClNvIHRoZSBmaXJzdCBxdWVzdGlvbiBhYm91dCB0aGlzIHBhdGNo
IHNldCBpcyBpZiBhIGNvbXBsZXRlbHkgbmV3CmRyaXZlciBpcyByZWFsbHkgbmVlZGVkLgoKQSBz
ZWNvbmQgcXVlc3Rpb24gcmVnYXJkcyAiYmFua3MiIGluIHRoZSBHUElPIGNvbnRyb2xsZXIuClRo
ZSBjYWxsYmFja3Mgb2Zmc2V0cyBhcmUgZXhlbnNpdmVseSAvMzIgJTMyIE1PRDplZCB0byBjbGFt
cAp0byAzMmJpdCB3b3Jkcy4gU2hvdWxkIHRoaXMgcmF0aGVyIGJlIHJlZmxlY3RlZCBpbiB0aGUg
ZGV2aWNlCnRyZWUgbW9kZWwgYXMgYSAzLWNlbGwgR1BJTyA8JmdwaW8gYmFuayBudW0gZmxhZ3M+
IHJhdGhlcgp0aGFuIDItY2VsbCA8JmdwaW8gbnVtIGZsYWdzPj8gRG9pbmcgdGhpcyBtYWtlcyBp
dCBwb3NzaWJsZQp0byB1c2UgZ3Bpb2xpYiBoZWxwZXJzLgoKWW91cnMsCkxpbnVzIFdhbGxlaWoK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJp
c2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9s
aXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
