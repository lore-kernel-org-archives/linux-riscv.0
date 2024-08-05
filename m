Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2AD73C3DA4A
	for <linux-riscv@archiver.kernel.org>; Mon,  5 Aug 2024 08:00:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BYaeipGm0z/d1A/pC5ZGqKHRzMXGr5PkzxlZD6gb30w=; b=GELWQ96R2IImIA
	TiQ1B+lGpEHXDYXqjGsF47z4enC1B3mrl6Rc4JYqkCQYHxvS/nl2kRu8C6EAoCpmcVRq1QwiGtBVI
	/CQsyf520RWLDqhmHgSi55VRJX/6qgJheO5OoRLBtikcE+i6OfmGOQhi11W2BS9ugYifeypswWQG9
	fb6Madt9ejksCOc6lFl/8AmFhGJDSCjsNjAOpoqofb7kBZ0Z53dcO7LVAk5GlUbOhzIZZsMr7P2Gu
	ng/ZDnJUt6tsiME5X9kinORJ7G3C+A6AdQUpZ5Q+nbK+fKF0emqQwCbVByKqFTshraX94jTNEPH/S
	cbE6e8LDUiSK9SoNB0lQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1saseE-0000000F2Ks-3jKY;
	Mon, 05 Aug 2024 08:00:54 +0000
Received: from mail-lf1-x135.google.com ([2a00:1450:4864:20::135])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1saseC-0000000F2Jw-2efT
	for linux-riscv@lists.infradead.org;
	Mon, 05 Aug 2024 08:00:53 +0000
Received: by mail-lf1-x135.google.com with SMTP id 2adb3069b0e04-52efa9500e0so11898339e87.3
        for <linux-riscv@lists.infradead.org>; Mon, 05 Aug 2024 01:00:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1722844850; x=1723449650; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=V0XBLdWPsEfluunRhLptNbPEUeInLXsANcgHR2jT3fE=;
        b=WOddJ71Qq0HocFhjsQgrHF++LlhqwzbcTPmFD3kbzqTd0gvNbpJZ9tOpUdeWnc1O7u
         Xezw4WTtkH57h+rO+3HVl44eDf2N8lMYJvrP3VTNRGvHGTAwMVUcuCEKiAN5bUVJN9Ir
         DgdiqRvfglaVGn7+FUrHlFMpo0X167evpkmAlHCV95Io5S29QK6UY2SnH5OQw+Zs/Gdm
         UOlHFEsqoAH8/Af4LA3vb62OxKGMJGf3Tmby+3x/Gn/VQNdAnp+d0dJvNNEUynWpCxuR
         K4Vwoh7LOVr7AeyIHnr/1HjGKhcan+zhZbS54gGsKhBuplszIyfLLlapSh5BrdOh/LrI
         1o/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722844850; x=1723449650;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=V0XBLdWPsEfluunRhLptNbPEUeInLXsANcgHR2jT3fE=;
        b=WozhQvkcwHvFogZEkWek71oMS83wf2h46N4Sg+gsiERJkQZADdxUy4qnmUvXmTZUPD
         p3bkaCY1GPhFmI8k0qwezBJXqbZp20jRwF1kDu4kdBeBKbjezBNF4bDEKzibGf05rtJM
         7b/HCw7zH7CsCe6FKa1GYKKeiSb5uTZ4Da0UZl77GO5+cBDJ9FdS3/D4OyqxQSBuldeC
         21zgeCphKRuC6LMi33d61uioe5RASCMKPmyGMXVvulBB3yjGoxjj9iNBQzKJa6rqxqRe
         CbFPx6duEjsXBNhub+DuJq1qtq9ujr1owLdBu0biRWWWeMtSG8cAiVHSllrIDeGj7VCK
         BH3A==
X-Forwarded-Encrypted: i=1; AJvYcCVoDZ/0bMKsCv17kvt5I3MBgRTx0gV2cOgH58qw613T7fZnBXWrGtuMOHVX7ITbgwH48r1TKqR1KD0ZzTiXOZPUAn3HykTLl7MN3tYlE8Ds
X-Gm-Message-State: AOJu0YyrgUlLGYAk3VJwqaRwm4nk9yIZzZJbwViaXlvxh7SpwnpQyewC
	DZY4j/JFy+Vogw9C2Dkuwt5NrSszeUwnfz1eVlLbMHlfDmyvDpkNi55Za8od4EHn/fDQppJwpoq
	CKgbLXNzMEHq88x59Wikq+SHMm9BpXwnnKZPUYw7ZofO3SD4T
X-Google-Smtp-Source: AGHT+IE4e1ypq3XkPGGxUNLRbeIjoKSdEBrPK+4BFko20jBg17ItwlycPxb12bAyuzMocKZw3XI+Eygzrzew8wFEJfQ=
X-Received: by 2002:a05:6512:ba7:b0:52c:9e82:a971 with SMTP id
 2adb3069b0e04-530bb36640fmr7509297e87.7.1722844849933; Mon, 05 Aug 2024
 01:00:49 -0700 (PDT)
MIME-Version: 1.0
References: <20240723-supervise-drown-d5d3b303e7fd@wendy> <20240723-underage-wheat-7dd65c2158e7@wendy>
In-Reply-To: <20240723-underage-wheat-7dd65c2158e7@wendy>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 5 Aug 2024 10:00:38 +0200
Message-ID: <CACRpkda-QEnywHSwMQDMtbP8-rZEbUZT58D+hvXVRdMkFu09wA@mail.gmail.com>
Subject: Re: [RFC v7 4/6] gpio: mpfs: add polarfire soc gpio support
To: Conor Dooley <conor.dooley@microchip.com>
Cc: linux-kernel@vger.kernel.org, conor@kernel.org, 
	Marc Zyngier <maz@kernel.org>, Daire McNamara <daire.mcnamara@microchip.com>, 
	Bartosz Golaszewski <brgl@bgdev.pl>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	linux-riscv@lists.infradead.org, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, Lewis Hanly <lewis.hanly@microchip.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240805_010052_717434_BE75503A 
X-CRM114-Status: UNSURE (   7.94  )
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

T24gVHVlLCBKdWwgMjMsIDIwMjQgYXQgMToyOOKAr1BNIENvbm9yIERvb2xleSA8Y29ub3IuZG9v
bGV5QG1pY3JvY2hpcC5jb20+IHdyb3RlOgoKPiBGcm9tOiBMZXdpcyBIYW5seSA8bGV3aXMuaGFu
bHlAbWljcm9jaGlwLmNvbT4KPgo+IEFkZCBhIGRyaXZlciB0byBzdXBwb3J0IHRoZSBQb2xhcmZp
cmUgU29DIGdwaW8gY29udHJvbGxlcgo+Cj4gU2lnbmVkLW9mZi1ieTogTGV3aXMgSGFubHkgPGxl
d2lzLmhhbmx5QG1pY3JvY2hpcC5jb20+Cj4gU2lnbmVkLW9mZi1ieTogQ29ub3IgRG9vbGV5IDxj
b25vci5kb29sZXlAbWljcm9jaGlwLmNvbT4KCkxvb2tzIGdvb2QgdG8gbWUuClJldmlld2VkLWJ5
OiBMaW51cyBXYWxsZWlqIDxsaW51cy53YWxsZWlqQGxpbmFyby5vcmc+CgpZb3VycywKTGludXMg
V2FsbGVpagoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
bGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcK
aHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
