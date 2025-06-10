Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC742C71133
	for <linux-riscv@archiver.kernel.org>; Wed, 11 Jun 2025 00:54:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/cM4SlH8aAVWZEVfyU/99HdwbYaoqcNd6mBqGPgs3/4=; b=hFjvkF6pfE/nzl
	poFOcAj08vBT0e1eTUhosdX8/H2A5KWgWVMi9YpmYVKfCcH74dcIXqQRCP0yx4YhuOg0dKTQeNxVb
	BmOymgsDbjttEXFylpjXvnsXea4VhfJ1di5IXx/0GFmihsBfQzhIywIFOq/5/PzEGNEt403bfGFqF
	65gmCSbpeq2msjFfM5nFWEWcBSEmv0jFajDM2M5h/fBXndAoiKzUJPmGBeA4mCy5odqXSO4kmTTFN
	z385xWQATIMSYK1MBwpI4xSFGRNDnkMZCVKPbUlENcLbfcQIFp5cr2TKQjy9UqBizWOAWNpO/n2D1
	HwaYb/2RRfXemokwDckQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uP9j9-00000008Vc4-49AI;
	Wed, 11 Jun 2025 00:54:03 +0000
Received: from mail-lf1-x12d.google.com ([2a00:1450:4864:20::12d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uP77F-00000008BHk-2gR0
	for linux-riscv@lists.infradead.org;
	Tue, 10 Jun 2025 22:06:46 +0000
Received: by mail-lf1-x12d.google.com with SMTP id 2adb3069b0e04-55351af2fc6so7162643e87.0
        for <linux-riscv@lists.infradead.org>; Tue, 10 Jun 2025 15:06:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749593204; x=1750198004; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WEjoFKJq1fwhLjJL/1LIboVF8pYHP56Xq9jI3aQ+dvM=;
        b=aPz/QhUiFkpv9RnOsHIKthTQAFt7JEQzmRzeMmZ8RqwxopBY1lXqDlluyCsvU2hsBI
         jp4/5z0pzRTsNfu2yx+Sqpx5YZbi10hJokRA3gdxEwgBc/QjLA1SWDJRb0Xv7kFJ2i0R
         mOZPmytGq66SML3OmsuJRae3/lGWqJtUQDyrPtr8xms5fLwjfgj/MrCgozxmDisZIp9S
         c8/Y1FI1ZGSeFFr/n+pcaAauT5uiqVhOKEaSdNNy7LJ7vCJyZV0fBlq0cVKHaqMjHErD
         /Upad4Eqrs/8gPXTHkWYtTi0VHIYc4dM37ZmEtAVG4LX6MD2ecYhGFmZI8dE4WsItuRA
         dSrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749593204; x=1750198004;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WEjoFKJq1fwhLjJL/1LIboVF8pYHP56Xq9jI3aQ+dvM=;
        b=hGlg5MvpEJ0EnK9lVqUpX+EBm98VJMX2ME/I0O6YK2XCcabTjzIS1Y+n8+rcbqzadR
         P4jpy33WOKgSZBGIHOK8/yh0rAzXPOpkRJOOKmR8bq7XX2tJbXw5W3GMeY5DSRSbekCN
         BVyMEeYGXeIcs5pITWkWiapaLyA5pvKKhpcu1uhU9OoO821Vcr+SF23fIj5+Pi4O7COy
         lQAeE+cbRLWAcIm1t0fjmNmZ+wj8GY3MrpX84dsxZOF1rCu8Eo3bIKbe5QpybwpvPs+H
         +Uck21J3kwqlL9ER8srDwOSmDi/A3nGIcRXrou8lDZkCUUtHW765xHGVMdwUC+oHn1Rs
         oTBw==
X-Forwarded-Encrypted: i=1; AJvYcCXDd5O8hLZTgAYER8nE1rLiR70hhpDp0m1/Il8vU2WluEryEkhGBam2ubjA27CQXj59dCnyADCqLw3L4g==@lists.infradead.org
X-Gm-Message-State: AOJu0Yz2TebwYOnOmFXM5D97fNwe/GgBNY2ivJ4OGcIR6I3b5QWsxTiu
	F4upsSnEUaTWfmq8gL6M6+4cwDw+bE2Cuu3NFd0+s6GUqb6Y/w6h7n8qkhyfuYbSLHPe0mx78mh
	28iqa1gvvgED9ceJOVPhx7NqhSQeOwrUHBDZasqkmYg==
X-Gm-Gg: ASbGncviHkLscRHo6SlcJAWqYAmYT+rTu3B5sGy7TB3ATyViEJaAYBZyKj3TvA4K1Xe
	Z/Rczw5y4Srby9urDMJDK3U6T7pauHdGXXhBwyDh1hXhLWg7slb6Aw0LUAuaavIRgSHna/WtzDb
	23bi+UWkWxDve3RmZi97veu6cHAEKsos8uRM8crARwHhg=
X-Google-Smtp-Source: AGHT+IGlqZqOxo94Fq1AxRXbuSE8IQ4NwQa1mjzmaOgaM7Du8n0a08UJH2Mj9vvFcKeYpn253k3S/NXDYuSRYxggVL8=
X-Received: by 2002:ac2:4c4f:0:b0:553:659c:53fa with SMTP id
 2adb3069b0e04-5539d4be3f5mr111095e87.5.1749593203962; Tue, 10 Jun 2025
 15:06:43 -0700 (PDT)
MIME-Version: 1.0
References: <20250610-gpiochip-set-rv-gpio-v1-0-3a9a3c1472ff@linaro.org> <20250610-gpiochip-set-rv-gpio-v1-8-3a9a3c1472ff@linaro.org>
In-Reply-To: <20250610-gpiochip-set-rv-gpio-v1-8-3a9a3c1472ff@linaro.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 11 Jun 2025 00:06:32 +0200
X-Gm-Features: AX0GCFsQuNMrR1lnqoFxpoWnn4BCOjfc6g0nU8IoyS3i9wf_s_1MzLLDkyq5jQE
Message-ID: <CACRpkdb8GBwtOGQYrVkxiv8ZCjEE6pkQ_kSEutY2jYG0bUbFVg@mail.gmail.com>
Subject: Re: [PATCH 08/12] gpio: nomadik: use new GPIO line value setter callbacks
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: =?UTF-8?B?TWFyZWsgQmVow7pu?= <kabel@kernel.org>, 
	Conor Dooley <conor.dooley@microchip.com>, Daire McNamara <daire.mcnamara@microchip.com>, 
	Daniel Palmer <daniel@thingy.jp>, Romain Perier <romain.perier@gmail.com>, 
	Avi Fishman <avifishman70@gmail.com>, Tomer Maimon <tmaimon77@gmail.com>, 
	Tali Perry <tali.perry1@gmail.com>, Patrick Venture <venture@google.com>, 
	Nancy Yuen <yuenn@google.com>, Benjamin Fair <benjaminfair@google.com>, 
	Grygorii Strashko <grygorii.strashko@ti.com>, Santosh Shilimkar <ssantosh@kernel.org>, 
	Kevin Hilman <khilman@kernel.org>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, openbmc@lists.ozlabs.org, 
	linux-omap@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250610_150645_680025_FBE3B4D2 
X-CRM114-Status: UNSURE (   7.75  )
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

T24gVHVlLCBKdW4gMTAsIDIwMjUgYXQgMjozM+KAr1BNIEJhcnRvc3ogR29sYXN6ZXdza2kgPGJy
Z2xAYmdkZXYucGw+IHdyb3RlOgoKPiBGcm9tOiBCYXJ0b3N6IEdvbGFzemV3c2tpIDxiYXJ0b3N6
LmdvbGFzemV3c2tpQGxpbmFyby5vcmc+Cj4KPiBzdHJ1Y3QgZ3Bpb19jaGlwIG5vdyBoYXMgY2Fs
bGJhY2tzIGZvciBzZXR0aW5nIGxpbmUgdmFsdWVzIHRoYXQgcmV0dXJuCj4gYW4gaW50ZWdlciwg
YWxsb3dpbmcgdG8gaW5kaWNhdGUgZmFpbHVyZXMuIENvbnZlcnQgdGhlIGRyaXZlciB0byB1c2lu
Zwo+IHRoZW0uCj4KPiBTaWduZWQtb2ZmLWJ5OiBCYXJ0b3N6IEdvbGFzemV3c2tpIDxiYXJ0b3N6
LmdvbGFzemV3c2tpQGxpbmFyby5vcmc+CgpSZXZpZXdlZC1ieTogTGludXMgV2FsbGVpaiA8bGlu
dXMud2FsbGVpakBsaW5hcm8ub3JnPgoKWW91cnMsCkxpbnVzIFdhbGxlaWoKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcg
bGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRl
YWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
