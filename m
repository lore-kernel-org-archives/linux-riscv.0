Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F526D2A541
	for <linux-riscv@archiver.kernel.org>; Wed, 16 Oct 2024 19:25:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dV34hHMnMLYWJWo+UG/KAQagaK2jrC1E4s6u2Vy5Ccg=; b=4cEwX0v9rOJuxB
	4OSIAuLQuFonfiAbCzWxxPJBJ+z+ZyYHgMcMMGqCHaQxecIUj2AwYbWGWo1IoQiruXyEW9eKhSee3
	MlnxFlkW/0NPq9nKrJ2YiUoS3POHbfq8RpWGamHPPgMEcWJoh6B9vqmHOds/DfIk4UIeNSc8qU03K
	Zlq/G2FTsSa6nDJpsxG/mjRMPVDrtHl7WTsi9TcmkLhBlDiTzJ8sDHOVcGDHjtO3RYjm/J/Ed8xrD
	TLigFZu74rb6ivP3f7/Kucis0yWvp25sA+/qxDEOaDIf3LCPowpPL1HsAS9UaTjiFhm30S4RSn6Ke
	rk6u/x8jGy1A+gXQrQCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t19e3-0000000CnC4-2GQO;
	Wed, 16 Oct 2024 19:25:19 +0000
Received: from mail-yw1-x1132.google.com ([2607:f8b0:4864:20::1132])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t19dz-0000000Cn9X-18uK
	for linux-riscv@lists.infradead.org;
	Wed, 16 Oct 2024 19:25:17 +0000
Received: by mail-yw1-x1132.google.com with SMTP id 00721157ae682-6e2e427b07dso2475107b3.1
        for <linux-riscv@lists.infradead.org>; Wed, 16 Oct 2024 12:25:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729106714; x=1729711514; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wNxPrVxXoi2e1Tzvafjzv1SOgOIdTCJ/dCL9LHe1ia4=;
        b=jbTOCzqDyxf9WWkhR5ivZ37y04t5Ej8JB4zSOWY2BXzPmBNAZTPqPppD28IOy7bMMy
         gstz2FJ+Pl2uDDVIWUCR2gtF2AnHU2BDMcMrU2EqM5FzW5e/dVU1f8RpDqZFhOYxc0g9
         YY9V+sQ7Twin9MjS9OzWWRlWeTCpTt25N0CNrOAa8yV/iYHiEG+Z5+1H3XxaqnWxdDb4
         3XX+SIdTk/3EbFMnDLwadZXHd8qKxuiiFuo/YBJN7D2wyHeYrIxwP/85tt4q9GuNSclw
         ZxhpMMpArXkwBWbjUGjm60zwNMT1B0qnykln9XCxgAqMghBuIl9PKwU4mk2xpL+EKdiu
         iDmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729106714; x=1729711514;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wNxPrVxXoi2e1Tzvafjzv1SOgOIdTCJ/dCL9LHe1ia4=;
        b=DCqMhPvBkMyp4qUQKkH6s4DKdbkysvznIrvnJi03/tc5f/1+uiqXfw9V6jfxM3ICzq
         2NDzRVR/C9sMKoxuKk2qSLLtREb6pClx/j5TKD4Qf1h33DZJxpqRaHkbQA7JE0vLq/hC
         n6uREk+48CGbIx8jgOzfFr4bhlGrqyg19wK/93ajddHaogRZouswRNcxg/bk+yKBjLhW
         YMliFl+32ympqKDbAzoGTM6YaERLdoSZAK0bOd7nlnU6fNO9xUsU0LyWTeQyBddEgchU
         vbxF/IQH3jqpxxEYiFzVjuHNp34L8VqsdaGEsVW+uyX71CC3mmX8647dE0XVpcW1Uqdk
         eyBg==
X-Forwarded-Encrypted: i=1; AJvYcCWxZ5EtbjoU1v6P0soatHOm/5vyZfzxIDZVJbEHwK0NEYcxDtJQgGOM2Fjwdqpajh4Adndbgt+TY+upBw==@lists.infradead.org
X-Gm-Message-State: AOJu0YwV/NaWKz0+DFMIj3BrXlNhUTAtWSHi+MuBsyAn+UYN9gWyu5dW
	2Erlu1TphVVv1a7D840vdymOzTilIYiVSIn0GuE9r6y9YBdfJ4qbFK0hTeERxI+k4FK9BS3RaJv
	4sFdEaDf6Agat4xrPrv7GacRIksRtiwgMt+jyyg==
X-Google-Smtp-Source: AGHT+IFBVw/RdlGqnPnp7qsotKzxhR9ZidNG2YXblCllHBleF/Mnxzr0wnJO+4NvNGIVA03KRekKbqt8X8YZP+lN9oM=
X-Received: by 2002:a05:690c:6703:b0:6e3:3407:8579 with SMTP id
 00721157ae682-6e3643c9b62mr151632797b3.39.1729106713924; Wed, 16 Oct 2024
 12:25:13 -0700 (PDT)
MIME-Version: 1.0
References: <20240723-supervise-drown-d5d3b303e7fd@wendy> <20240723-underage-wheat-7dd65c2158e7@wendy>
 <CACRpkdbRE695f-+do1HYpOZ6e4qxgUBWJzEPO2hTCuZ3xxYHQg@mail.gmail.com> <20241016-shallot-nerd-51eeba039ba0@spud>
In-Reply-To: <20241016-shallot-nerd-51eeba039ba0@spud>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 16 Oct 2024 21:25:01 +0200
Message-ID: <CACRpkdZZeDyHJPZBuqnK1o+nWXgSAgNO7RceYB3Ao4tEOGRpDQ@mail.gmail.com>
Subject: Re: [RFC v7 4/6] gpio: mpfs: add polarfire soc gpio support
To: Conor Dooley <conor@kernel.org>
Cc: Conor Dooley <conor.dooley@microchip.com>, linux-kernel@vger.kernel.org, 
	Marc Zyngier <maz@kernel.org>, Daire McNamara <daire.mcnamara@microchip.com>, 
	Bartosz Golaszewski <brgl@bgdev.pl>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	linux-riscv@lists.infradead.org, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, Lewis Hanly <lewis.hanly@microchip.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241016_122515_341238_8F2C0BBA 
X-CRM114-Status: UNSURE (   9.70  )
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

T24gV2VkLCBPY3QgMTYsIDIwMjQgYXQgMTE6NTbigK9BTSBDb25vciBEb29sZXkgPGNvbm9yQGtl
cm5lbC5vcmc+IHdyb3RlOgoKPiBJIGR1bm5vIGlmIEknbSBtYWtpbmcgYSBtaXN0YWtlIGhlcmUs
IGJ1dCBJIGRvbid0IGtub3cgaWYgdGhlcmUncyBtdWNoCj4gdmFsdWUgaW4gaW1wbGVtZW50aW5n
IHRoaXMgc3VnZ2VzdGlvbiAtIGFzIGZhciBhcyBJIGNhbiB0ZWxsIG9ubHkgdGhlCj4gZ2V0KCkv
c2V0KCkgZnVuY3Rpb25zIGNhbiBiZSByZXBsYWNlZCBieSB3aGF0J3MgcHJvdmlkZWQgYnkgZ3Bp
by1tbWlvLmMuCgpZb3UncmUgbm90IG1ha2luZyBhbnkgbWlzdGFrZSwgeW91IGtub3cgdGhlIGRy
aXZlciBhbmQgaHcgYmV0dGVyCnRoYW4gbWUuCgpKdXN0IHNraXAgdGhlIEdQSU9fTU1JTyBpZiB5
b3UgdGhpbmsgdGhlIHJlc3VsdCB3b3VsZCBsb29rIHVnbHkuCgpZb3UgY2FuIGFkZCBteToKUmV2
aWV3ZWQtYnk6IExpbnVzIFdhbGxlaWogPGxpbnVzLndhbGxlaWpAbGluYXJvLm9yZz4KCllvdXJz
LApMaW51cyBXYWxsZWlqCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFk
ZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4
LXJpc2N2Cg==
