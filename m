Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 409DDC4345F
	for <linux-riscv@archiver.kernel.org>; Mon,  6 May 2024 06:35:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8+kQoN22jpN0cg4HOl0tzDoMPXjSt7Y3WniIqSKaKok=; b=jBYfyMEh8wU9WI
	zaLTZN+BT6aDVE3jLygLKktOMaB4FrM9ZGGvh3SXx6R9uc4+wwNSgy2lYBAmmhQHVdGKCVxC/zk0X
	Y8RHM9NUbNBsXkuPxDKutW4WkHfBEsB/a6sQcpdePU0Id/CyuEEsihY09yWfpl+PQl06fIXbd/W6e
	P7sjLjFyR+0KhO4ggBv7q91bq22JGMPxXF/yvaH5PeXuBcsa1/CtxzcE56jImCUpnxAPHsEof6Ey1
	4axFJ7zEK9BGjPMZk6sRDwuReMH9oUtA8+OYbizyHk96iUn6MVt66gqRVLtRqMEWZTFgfdNjMin0j
	RhpfcK+R7S14H1wR80kQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s3rwa-00000006K7i-2Ymc;
	Mon, 06 May 2024 06:35:24 +0000
Received: from mail-yb1-xb30.google.com ([2607:f8b0:4864:20::b30])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s3rwX-00000006K78-3UO6
	for linux-riscv@lists.infradead.org;
	Mon, 06 May 2024 06:35:23 +0000
Received: by mail-yb1-xb30.google.com with SMTP id 3f1490d57ef6-db4364ecd6aso1356864276.2
        for <linux-riscv@lists.infradead.org>; Sun, 05 May 2024 23:35:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1714977318; x=1715582118; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=F4bCGtNldfkHhz1v+X5T6XqO5NjhSnpFKTEaXpHr2Fk=;
        b=nJyguMYC+95YR7oeWSw+vgpRBSd9pSOB/WR+bIy/sAb07D2jnmZMZvHssDveXpMJQb
         DhbqQMc7H4WFq37VFGjByDZxHzUj+Xa2Z9CUZitADOEiAc/kuuQCtCVd2V2j/33H8JlS
         VSpfI4kM3aPXGUGZ+SW8X2Wz/lYpLpmIWRIkZUceQD1JXTiXVbksq0X2xyo/6RdUtzEL
         ObQct+/OZvZDHR6OXCpScdhN9+zIPxxThZWrCHEBZy8nv1loGB7Ouqmnmf3a4qZ6GMfO
         WBUIt/BcLahmDYBkdBMUzxJB3KBUs9FmrGHFQngfnV+089gC9ixLYFtoi+VvTcTw70xE
         kxtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714977318; x=1715582118;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=F4bCGtNldfkHhz1v+X5T6XqO5NjhSnpFKTEaXpHr2Fk=;
        b=wRToetE5VKtMOA+Nxro0ppar/D8VRXdCGGNdroiku4+F8gph49OPZsiLg0y+JuBJUh
         Mty/YyyYsG1b+bVBRf0QKy6QwzBUzCfo3mtBk+w3ZMk4tTRJ1fRIeL1nqmq9FyN/ERKN
         FL9V9J8Hc0vG3Uw+MMPYOMaKQwzL7qIlST4Ghw1V5HedLmmD8eeYzk20h0PxyGKVOyyc
         W46s6GltstJE0gigS56afyWkrKFnnNQgoJQNEbrv6gnyqqeSmYKwXh8oDpGsKkGcN2du
         W3LzSvhFHHJWZpUDaihhBwWPKKqK46FHqpmJXsSF/KqMuR4zansHgtdrVJVh9H7Sa6Yv
         RsqA==
X-Forwarded-Encrypted: i=1; AJvYcCXNe3CB0jmBuPDD7wikqnylXsX4KCGztK/tpPzsgN38la5bDrOGjy+T6/OlJ4F6I+52mMujbMC+qsF0/EKBWOoJqs/agJTDGSHocorakx2U
X-Gm-Message-State: AOJu0YySJY80coHDBuyQghb891I2FILZYiro7XwGFiF10ZqCOxa7aP+/
	sGdsjDl0gu6Z/fl8RvQeRDlL4ap7YJLZrIYNmyqrevf6n0i02O6Z+JgQsajdBIqm/GXAfn1qI3x
	u1IFeoohJfUgwiPgh288hKDG3qAHzOgyHJCZ1o5OCiAgvTZrI
X-Google-Smtp-Source: AGHT+IHwFBLDH7pB4BuNuBdkU/p+O0HvtvUwPbTtHfpWZ5KWh1FNTe4KBMhrRQUWSn6w8OSGytaKBjVYjoN6DHr3YUc=
X-Received: by 2002:a5b:e92:0:b0:deb:7eb7:c9ce with SMTP id
 z18-20020a5b0e92000000b00deb7eb7c9cemr1681261ybr.1.1714977318711; Sun, 05 May
 2024 23:35:18 -0700 (PDT)
MIME-Version: 1.0
References: <20240503111436.113089-1-yuklin.soo@starfivetech.com>
In-Reply-To: <20240503111436.113089-1-yuklin.soo@starfivetech.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 6 May 2024 08:35:07 +0200
Message-ID: <CACRpkdbxzbNedWTpA5i-45AqPc4fA+GeBGkrjrD_OgkxMZRwXw@mail.gmail.com>
Subject: Re: [RFC PATCH v3 0/7] Add Pinctrl driver for Starfive JH8100 SoC
To: Alex Soo <yuklin.soo@starfivetech.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, Hal Feng <hal.feng@starfivetech.com>, 
	Ley Foon Tan <leyfoon.tan@starfivetech.com>, 
	Jianlong Huang <jianlong.huang@starfivetech.com>, Emil Renner Berthing <kernel@esmil.dk>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	Conor Dooley <conor+dt@kernel.org>, Drew Fustini <drew@beagleboard.org>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-riscv@lists.infradead.org, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240505_233521_943563_7FC9D947 
X-CRM114-Status: GOOD (  11.11  )
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

T24gRnJpLCBNYXkgMywgMjAyNCBhdCAxOjE04oCvUE0gQWxleCBTb28gPHl1a2xpbi5zb29Ac3Rh
cmZpdmV0ZWNoLmNvbT4gd3JvdGU6Cgo+IFN0YXJmaXZlIEpIODEwMCBTb0MgY29uc2lzdHMgb2Yg
NCBwaW5jdHJsIGRvbWFpbnMgLSBzeXNfZWFzdCwKPiBzeXNfd2VzdCwgc3lzX2dtYWMsIGFuZCBh
b24uIFRoaXMgcGF0Y2ggc2VyaWVzIGFkZHMgcGluY3RybAo+IGRyaXZlcnMgZm9yIHRoZXNlIDQg
cGluY3RybCBkb21haW5zIGFuZCB0aGlzIHBhdGNoIHNlcmllcyBpcwo+IGRlcGVuZGluZyBvbiB0
aGUgSkg4MTAwIGJhc2UgcGF0Y2ggc2VyaWVzIGluIFsxXSBhbmQgWzJdLgo+IFRoZSByZWxldmFu
dCBkdC1iaW5kaW5nIGRvY3VtZW50YXRpb24gZm9yIGVhY2ggcGluY3RybCBkb21haW4gaGFzCj4g
YmVlbiB1cGRhdGVkIGFjY29yZGluZ2x5Lgo+Cj4gWzFdIGh0dHBzOi8vbG9yZS5rZXJuZWwub3Jn
L2xrbWwvMjAyMzEyMDExMjE0MTAuOTUyOTgtMS1qZWVoZW5nLnNpYUBzdGFyZml2ZXRlY2guY29t
Lwo+IFsyXSBodHRwczovL2xvcmUua2VybmVsLm9yZy9sa21sLzIwMjMxMjA2MTE1MDAwLjI5NTgy
NS0xLWplZWhlbmcuc2lhQHN0YXJmaXZldGVjaC5jb20vCgp2MyBpcyBzdGFydGluZyB0byBsb29r
IHZlcnkgbmljZSwgd2h5IGlzIHRoaXMgcGF0Y2ggc2V0IHN0aWxsIGluICJSRkMiPwoKSSB3b3Vs
ZCBsaWtlIHNvbWUgcHJvcGVyIHJldmlldyBmcm9tIHRoZSBTdGFyRml2ZSBtYWludGFpbmVycwph
dCB0aGlzIHBvaW50IHNvIHdlIGNhbiBnZXQgaXQgZmluaXNoZWQuCgpZb3VycywKTGludXMgV2Fs
bGVpagoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGlu
dXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0
cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
