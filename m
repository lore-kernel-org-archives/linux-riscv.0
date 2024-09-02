Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9BA9FCD13CF
	for <linux-riscv@archiver.kernel.org>; Mon,  2 Sep 2024 09:51:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sZzD/0ycryyvwpslq9DGkJ0zY5mL7DZwKiAZn1TiwJ8=; b=LqvlADpwikJ/YJ
	7+EKqaks5+IpSsI0LAUbIc38J9tRXJbi/ZuoGK6TEBwBEpBUCKP0s2W+/jPnsDUzFRxFHQhB+QJh1
	k6eUO00dSPjgOpPdR2KHzWKg0AM6FyPnW9YG3bbgbnPhlqKWe0StuCOET5KJsjWY/M+lvvsJ7NtHA
	LiPMfBNqa9kViqV7veAus/QXcoz/BTm1c5ddZdNxdEcDOKbAfpvNZC1KKNMmZLnfzEgczARfuXTEo
	Dxojh1NSxJlicuByHiHNF3RLwFVVv5E5XB+xK7R0BuzZ35L4PE7hmAxh8RXVwqfKMOfyjsY+gu97M
	TF237BxbaDdbncQeXV2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sl3iQ-0000000Dllg-0tLa;
	Mon, 02 Sep 2024 09:51:18 +0000
Received: from mail-lj1-x233.google.com ([2a00:1450:4864:20::233])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sl3hX-0000000DlTS-2v1B
	for linux-riscv@lists.infradead.org;
	Mon, 02 Sep 2024 09:50:25 +0000
Received: by mail-lj1-x233.google.com with SMTP id 38308e7fff4ca-2f3f90295a9so44096541fa.0
        for <linux-riscv@lists.infradead.org>; Mon, 02 Sep 2024 02:50:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1725270622; x=1725875422; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=28McJcVKs42ZY9Sq0kv5hG33Yboh2UqyM8r6czZX88U=;
        b=rSBbqbiMf7aKnn6pdC5hsp39zG9zKPBrSXJXjO9dKuAZCe6HCHCNZoYpwKXSwKWYYa
         8HkM5vg0PuSMhRAtDjKr/wy3LSIezO93XIuGEZeFTFJNkG5kuWmYxwoscRYPSZMY/fAP
         p2hNlUJkGg0M6sT79FIlEAL5v/lkr/XhpIEA7Dxq+5J253mtG9tE/3uFNGg7vwQGG0+a
         jfCXBHG0W3+8dNSi29VSN1NjAKlqX29RYNSe1uUwm3OHe04dyikQ1AKZNQfvUj/gBUtk
         Qt+oJpKKWnqC0mQYNDXUc1fqCkJdzvdbIlj42uX3Mv98WehAM+dmoWV/3AZaEGEhehsP
         JaLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725270622; x=1725875422;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=28McJcVKs42ZY9Sq0kv5hG33Yboh2UqyM8r6czZX88U=;
        b=mwBjUEnQiUa5lZ7K5uYHh4V+KGNAnURDOSTN+HlGqnkCy6WrUyuQB/xid5V5t4NXLJ
         vXdCF39Tbm4giEw9KXJTPwWFh2KuXeJQHbGcmK7giaD/YOWmuHXgiiZRChU9RdInUvmz
         EKPbjhVD2Z22iogJGjgC5aoz3ujjjilmy6qv3QnbZcqsr1sh81+tHom91/yCcvbISOUn
         YMelYBAm7yHerl501YIhNN/WKa2DJm1xlPGKfKcoClMddAsGL3WF3fqCftpdTquJ7Jnd
         GTrb8XS2n7yzR5KSATlroYZwBT6mDocRZIgr4vy4qPhbdNFWAlcFISiUWjKSIH5FO/T/
         M8mw==
X-Forwarded-Encrypted: i=1; AJvYcCXe+78KmsXXDO4HIhUJ74/AlI98R10sZg6xbps/vRBa14kKlrMCX7RwG+I86uUaZISh6DNAUw0KD5ZZ4g==@lists.infradead.org
X-Gm-Message-State: AOJu0YzF8+ebfpLxQN5kNuhazZ9CgRG+oWl3utqNltDmeG8KJMTLcWVb
	dP5FuLsVRaiWUoDxiv+BiBHX049uvpa6M6mz8STcUJMZg65wJm728WoyTxxNDegwdB4R9XI0TNB
	UVZm+Ru7a1J+NH0buWiuLMunZCw8ldLt6TPzKcg==
X-Google-Smtp-Source: AGHT+IHzAjC82O5fFXZUuxREWWYMeyebjNflKtG1tJUMYRTIdDHBfO7anU/6cm0HwOYbXK/491VB93Nh9ac09yNZ/4I=
X-Received: by 2002:a05:651c:552:b0:2f0:25dc:1886 with SMTP id
 38308e7fff4ca-2f636a04470mr20450581fa.10.1725270620988; Mon, 02 Sep 2024
 02:50:20 -0700 (PDT)
MIME-Version: 1.0
References: <20240828-dt-bindings-gpio-hog-v1-0-63b83e47d804@linaro.org>
 <20240828-dt-bindings-gpio-hog-v1-2-63b83e47d804@linaro.org> <CACRpkdZzF5yJQnnDsjU8cTr9Fpe7wZZXoW3K-wFYuAq2vv8XxA@mail.gmail.com>
In-Reply-To: <CACRpkdZzF5yJQnnDsjU8cTr9Fpe7wZZXoW3K-wFYuAq2vv8XxA@mail.gmail.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 2 Sep 2024 11:50:08 +0200
Message-ID: <CAMRc=Mcv9nfiG7N-ttS_A=Ay-5Wv2mYpT+41G1u8G4GrMQAuEA@mail.gmail.com>
Subject: Re: [PATCH 2/3] dt-bindings: pinctrl: qcom: add missing type to GPIO hogs
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Emanuele Ghidoli <emanuele.ghidoli@toradex.com>, Bjorn Andersson <andersson@kernel.org>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Daire McNamara <daire.mcnamara@microchip.com>, 
	Kunihiko Hayashi <hayashi.kunihiko@socionext.com>, Masami Hiramatsu <mhiramat@kernel.org>, 
	Maxime Ripard <mripard@kernel.org>, Masahiro Yamada <yamada.masahiro@socionext.com>, 
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	Krzysztof Kozlowski <krzk@kernel.org>, Conor Dooley <conor.dooley@microchip.com>, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240902_025023_759731_1902660E 
X-CRM114-Status: GOOD (  13.20  )
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

T24gU2F0LCBBdWcgMzEsIDIwMjQgYXQgMTI6MzLigK9BTSBMaW51cyBXYWxsZWlqIDxsaW51cy53
YWxsZWlqQGxpbmFyby5vcmc+IHdyb3RlOgo+Cj4gT24gV2VkLCBBdWcgMjgsIDIwMjQgYXQgMTE6
MzbigK9BTSBLcnp5c3p0b2YgS296bG93c2tpCj4gPGtyenlzenRvZi5rb3psb3dza2lAbGluYXJv
Lm9yZz4gd3JvdGU6Cj4KPiA+IEdQSU8gaG9nIG5vZGVzIHNob3VsZCBkZWZpbmUgdHlwZSwgb3Ro
ZXJ3aXNlICJkdW1teS1ob2ciIGJvb2xlYW4KPiA+IHByb3BlcnRpZXMgd291bGQgYmUgYWxsb3dl
ZC4KPiA+Cj4gPiBTaWduZWQtb2ZmLWJ5OiBLcnp5c3p0b2YgS296bG93c2tpIDxrcnp5c3p0b2Yu
a296bG93c2tpQGxpbmFyby5vcmc+Cj4KPiBSZXZpZXdlZC1ieTogTGludXMgV2FsbGVpaiA8bGlu
dXMud2FsbGVpakBsaW5hcm8ub3JnPgo+Cj4gSSBzdXBwb3NlIGl0J3MgYmVzdCBvZiBCYXJ0b3N6
IGFwcGxpZXMgdGhpcyB0byB0aGUgR1BJTyB0cmVlIHdpdGgKPiB0aGUgcmVzdCBvZiB0aGUgc2Vy
aWVzPwo+Cj4gWW91cnMsCj4gTGludXMgV2FsbGVpagoKQWgsIEkgcGlja2VkIHVwIHRoZSBHUElP
IGNoYW5nZXMgc2VwYXJhdGVseS4gTm8gcHJvYmxlbSwgSSdsbCBwaWNrCnRoaXMgb25lIHVwIGFz
IHdlbGwuCgpCYXJ0CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFk
Lm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJp
c2N2Cg==
