Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF955CA1002
	for <linux-riscv@archiver.kernel.org>; Fri,  5 Sep 2025 02:19:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MAh3O/IxwE0mjOBn0gemEnlTsYZbcrCbeizjQfOZQMI=; b=vxjbzBsuHOlSNh
	DT4+6LBTon/8tDzao++S1TwSwJ20kplhD7oVDBP67/ooRwjfA+/wgn1YF/r7cQUCinGvFz85fvutP
	bMwEkDxItuJmeiZndZw2W57ZK0FQBsMD7r9Xru89Lt4/SN9THrdp5bUou/qlhe+ovsa3d+hoFHTk5
	42ddMfKfYdYHnOlUNy6b0ysjy4GJkIu3BIBY3VqaxGAASq8ANDmG7vG+4HlsBm9arGqWxRM9QmeOs
	eQ9S1JACS9/qG9YXCBJtjBFDYoIWKV7vKhm4rUV4hcnPYWMZ5rVPulb98UxxgyPQjQnHcMQMvRle4
	5ZWc0ZRhW8oZn9lRLucA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuM2H-0000000G0Ue-1Hqx;
	Fri, 05 Sep 2025 02:18:45 +0000
Received: from mail-lf1-x133.google.com ([2a00:1450:4864:20::133])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuFkD-0000000Dwex-1ntu
	for linux-riscv@lists.infradead.org;
	Thu, 04 Sep 2025 19:35:42 +0000
Received: by mail-lf1-x133.google.com with SMTP id 2adb3069b0e04-55f6b0049fbso1671594e87.0
        for <linux-riscv@lists.infradead.org>; Thu, 04 Sep 2025 12:35:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1757014539; x=1757619339; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=32nYEhO3U0uVRAxCwAscIZa3xyyyN4IzR3cTBfcZ/4s=;
        b=lAN7R8U3D7HUfWbFxAANfibSONr7GshZJa3xXBJ4CMe70mHguIC24rTOr1tjbAngu+
         YCcRQ96tSXstlAL+ITu5eipbQ61l8gcfMeLg8MaXQXVrHFUNjSPNTmWdw6lKvwi6RT+Z
         xDcN02iUXanUoBfYwtCi8XF3tqc3JzUK2+ZKxBYrUNUK0Pa1GbNXNab0v6mES9eFeFcG
         jwQahZ5tGd9eVtXp/IpyG7f2w4gflTZfupz4LOz1oLLbo6rqxOgmZgOfhqkiWZYXBFV1
         lJJmrKoTvjOZUleCwx8HDZQSFoM+OJTSP2M0RPhI8ZEJ+83NNMtcXr9PCZObCpVf3pqD
         GblA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757014539; x=1757619339;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=32nYEhO3U0uVRAxCwAscIZa3xyyyN4IzR3cTBfcZ/4s=;
        b=F2EQp0WmLxiDBP5OFpIlCIj/ab3n5obpskrzEkHy89vSlWxcbBQVGL9VoFTO3B0ErB
         /1F6MHSd7A7szL+65nFE0bernrg6MSs/5xUvDE1hqglfQe3rt7dZ7n/Loc9E8b5oC1Ha
         cYtSPLH6PuoFig3K33vraJgCM5VNvwW4iyjcbwUETZAASUwKkIGbNktQbjWnn5JzKJh0
         BZ61nsEXPUNw6tBbNxKpLKyY0kSP86Sj1dS/Z6uNS5MnI0BK8UEtrqoSUAqgEKjF3AZL
         7QP9PbAdXzE9biPUkGLIksDgfhbOV9JGUhYeydKy8i4ezjTzlr364m7RB5wxTenYiIo8
         ZtHQ==
X-Forwarded-Encrypted: i=1; AJvYcCVG3e6132yHdPiVl9c1vhMAzdlZ3y1PsQvebPV7vpfgLi92QG4KLkJ1xko0oa89M7e4YHQdAmSVewpVbQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YxYJTaSwmxCL+ck5NDm/tSPOFZaHxtOZO2yUtMg6FG4s5dKTrTa
	kUeuTUcFT4sXeQisYp/9s6I+Nh7Ki5TGnZzdJFV9JxZ4VStOeMkj6QHKDx3rxTXHR2NiBSfYCon
	yrPr38kj0WtETX7imLSkT6xRJIEduBVeBKLfe/E4ARQ==
X-Gm-Gg: ASbGncsY1GlLHIKrkow8Gqt/+vkz9HViUydsDL5JeTHPKK77HxftAN6RDqMPsOLN6XT
	rVGko7uJpORcLNN1774U2qy5Ri/JmP3IQQAGnR6m359iVl/hiuPa3MaenA2MkGSActIwxBxLMUI
	Ut2cr+YMVGzW8DGaO0PDvOgQupY3ir5lIMdpGzZZsBmrI57AlvdBv8GwMKQFKBGInp/0W9t1RTG
	qMmVs090gYzWfrORw==
X-Google-Smtp-Source: AGHT+IFk6qWrCgBCMUMmRXmwNfVdMojmRglmfhyiJ5psNymemT9FqXab1r+PbaMVvluse9Mju6Gt2tnrWCGHPJdZfDY=
X-Received: by 2002:a05:651c:1079:b0:332:3fd0:15fb with SMTP id
 38308e7fff4ca-336ca5c1a70mr38397421fa.0.1757014539436; Thu, 04 Sep 2025
 12:35:39 -0700 (PDT)
MIME-Version: 1.0
References: <20250903100104.360637-1-hendrik.hamerlinck@hammernet.be>
In-Reply-To: <20250903100104.360637-1-hendrik.hamerlinck@hammernet.be>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 4 Sep 2025 21:35:28 +0200
X-Gm-Features: Ac12FXwi4fLng12UMi28VuiL73WI6CiLUWCY-CJjaRNMNpJieZixpye9Zb1GrH8
Message-ID: <CACRpkdYMHMvFCzcA0G9sj+xSrjXROU4OmnV=x0EPfRBpVycQtg@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: spacemit: fix typo in PRI_TDI pin name
To: Hendrik Hamerlinck <hendrik.hamerlinck@hammernet.be>
Cc: dlan@gentoo.org, skhan@linuxfoundation.org, 
	linux-kernel-mentees@lists.linux.dev, linux-gpio@vger.kernel.org, 
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250904_123541_473724_1916A831 
X-CRM114-Status: UNSURE (   7.69  )
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

T24gV2VkLCBTZXAgMywgMjAyNSBhdCAxMjowMeKAr1BNIEhlbmRyaWsgSGFtZXJsaW5jawo8aGVu
ZHJpay5oYW1lcmxpbmNrQGhhbW1lcm5ldC5iZT4gd3JvdGU6Cgo+IFRoZSBkYXRhc2hlZXQgbGlz
dHMgdGhpcyBzaWduYWwgYXMgUFJJX1RESSwgbm90IFBSSV9EVEkuCj4gRml4IHRoZSBwaW4gbmFt
ZSB0byBtYXRjaCB0aGUgZG9jdW1lbnRhdGlvbiBhbmQgSlRBRyBuYW1pbmcKPiBjb252ZW50aW9u
IChUREkgPSBUZXN0IERhdGEgSW4pLgo+Cj4gU2lnbmVkLW9mZi1ieTogSGVuZHJpayBIYW1lcmxp
bmNrIDxoZW5kcmlrLmhhbWVybGluY2tAaGFtbWVybmV0LmJlPgoKUGF0Y2ggYXBwbGllZCEKCllv
dXJzLApMaW51cyBXYWxsZWlqCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5m
cmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xp
bnV4LXJpc2N2Cg==
