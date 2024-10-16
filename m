Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1200D2A541
	for <linux-riscv@archiver.kernel.org>; Wed, 16 Oct 2024 19:31:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xZ2V3fuS2fIO8z9kfC8BWa4Rzl9DUB0DmsyWp164LNY=; b=aa6V8ToXEkWffu
	2DK2eFcZEKZAnTSGns/rKhG/rdYf4TMwZyjO3+dojim2sNb6BDjs5Z79tzxkEGygnfddJD/9k/fKC
	bMQE6lEM8U7mhJDHolzt404s0wiMg2SYUckHcqD779NHTSiCZe9Tz6qK8TmKwVekdmOR00zHBxs8h
	yUo9F1mjKtT9SdxuQl33eaHzGOlSIw4XOm6/rbs7mX4bF1H7dW6Lq24zxOQjwYE3N4kXAAW0P7jud
	uEKqZ0JIbrl9JKJwJS8bgog3Ky3fEJ8M8lGMZWVSgI8UnHfT0U3uBmovb1mOxKaEba8lB9ICZ5I6s
	s1ip4SlUj2cBjHEdDuBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t19k9-0000000CoPn-2FfQ;
	Wed, 16 Oct 2024 19:31:37 +0000
Received: from mail-yw1-x1131.google.com ([2607:f8b0:4864:20::1131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t19k6-0000000CoOg-2pAG
	for linux-riscv@lists.infradead.org;
	Wed, 16 Oct 2024 19:31:35 +0000
Received: by mail-yw1-x1131.google.com with SMTP id 00721157ae682-6e3a97a6010so3496247b3.1
        for <linux-riscv@lists.infradead.org>; Wed, 16 Oct 2024 12:31:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729107093; x=1729711893; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HKdeUruuQt6tmnr8RqhBs4A0W9peonkT1mwUkF6kp0Q=;
        b=xlyN/KHsxjoB4zBClEPSyIuyTVzsakR7qvuK4JrSlj4yqsaEmjfEBGQGw997nbBl7O
         oCDIKiPJc3TeIVUBlXHZG0Cm1BwTEzBcAO0ho9UiwIgyKMzc4+qRoagAQBuM+i91SNUy
         K5nBl8Gfz4r2CcUFX3i7Mu7LPAz/G2aoDcTR9gc81CwvsNsaWkLqR4PNIhHmZ818LCSB
         lw2vrAoj6RUGVIjhlbT8xOxvd7Zuu5bSHEtTT7Vxhv8Nlbjd2pzEGTXVrYWw1D1sX6CP
         3e7L11sPiuWZqRRkH6oumWC903o/9NhvKvSYuUJSwcZLd07necmZB1xIZJyzUUD64uwD
         QM3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729107093; x=1729711893;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HKdeUruuQt6tmnr8RqhBs4A0W9peonkT1mwUkF6kp0Q=;
        b=GdXWCI2AFE0ykiDAoMglJTOeE1JTM81iQrCAVbPbpobpodGRua5x8acQRC1fHysG42
         ml3UdvbfRvT/5yzIU3uhd3OzF0Znn/pfpOVAImSFJy3O0F+rLWHzoLBiGq1Bi/4cVcSk
         biXseoUjUCNJeJ1uhD0ARuTTEXBs95eXX3ve1ONY899nBFDk5wrdLpm+b6Ou8nui86z7
         sfR9AjTmKMKrXMt7LiigvxevgfZFWLWSIf+lx3WJh3V3z3EoI9E25j1k1livQKJVjSZl
         0f71b/GPRTtWxuhlV4Krv5pNwWTaFz2Q1zwiYAjHbG6/0bQAT+56jXeXmQzQlsKqqN9I
         ey7Q==
X-Forwarded-Encrypted: i=1; AJvYcCWFmHaNIcLlHoVbyIYSmtUOJoqxVKPnkoVmPL9EJPTCXBd7mI467IHIPYwxakKqOTarVP4Bh4zGm66O7w==@lists.infradead.org
X-Gm-Message-State: AOJu0YyZlsu9krVItwS4x04huaUQ+VZxAONSF6FfDibHalO09RTIQ8W+
	Q7PbQH4hZ4Tap7J3biopb8fY4yYGgbGxZRRjyDM60haZLNY1sopY8/Bkc/NNBeKsj6IPBei3FNv
	SDwWYxn2CeQcZCKVGkWGO1yCJJsLSJWgxmsfC0A==
X-Google-Smtp-Source: AGHT+IEfazOyIOYKe6O7/B0E/863g1TCnOGYzblSEZ50USkJojuTTGw6xgDiEhcc3FeeiHPALgKRQd4IOs6OQp4o8tI=
X-Received: by 2002:a05:690c:6288:b0:6e3:410e:bb84 with SMTP id
 00721157ae682-6e3d40cb773mr54288407b3.20.1729107093430; Wed, 16 Oct 2024
 12:31:33 -0700 (PDT)
MIME-Version: 1.0
References: <20241016155655.334518-1-colin.i.king@gmail.com>
In-Reply-To: <20241016155655.334518-1-colin.i.king@gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 16 Oct 2024 21:31:21 +0200
Message-ID: <CACRpkdYhsnRSOgdrDKp7BNqE4TpY3r--cPByFMsq0VRRjW-sAA@mail.gmail.com>
Subject: Re: [PATCH][next] pinctrl: th1520: Fix potential null pointer
 dereference on func
To: Colin Ian King <colin.i.king@gmail.com>, Kees Cook <kees@kernel.org>
Cc: Drew Fustini <drew@pdp7.com>, Guo Ren <guoren@kernel.org>, Fu Wei <wefu@redhat.com>, 
	Emil Renner Berthing <emil.renner.berthing@canonical.com>, linux-riscv@lists.infradead.org, 
	linux-gpio@vger.kernel.org, kernel-janitors@vger.kernel.org, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241016_123134_763964_27CA852B 
X-CRM114-Status: UNSURE (   7.49  )
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

T24gV2VkLCBPY3QgMTYsIDIwMjQgYXQgNTo1NuKAr1BNIENvbGluIElhbiBLaW5nIDxjb2xpbi5p
LmtpbmdAZ21haWwuY29tPiB3cm90ZToKCj4gVGhlIGluaXRpYWxpemF0aW9uIG9mIG11eHR5cGUg
ZGVmZXJlbmNlcyBwb2ludGVyIGZ1bmMgYmVmb3JlIGZ1bmMKPiBpcyBzYW5pdHkgY2hlY2tlZCB3
aXRoIGEgbnVsbCBwb2ludGVyIGNoZWNrLCBoZW5jZSB3ZSBoYXZlIGEgbnVsbAo+IHBvaW50ZXIg
ZGVmZXJlbmNlIGlzc3VlLiBGaXggdGhpcyBieSBvbmx5IGRlZmVyZW5jaW5nIGZ1bmMgd2l0aAo+
IHRoZSBhc3NpZ25tZW50IHRvIG11eHR5cGUgYWZ0ZXIgZnVuYyBoYXMgYmVlbiBudWxsIHBvaW50
ZXIgY2hlY2tlZC4KPgo+IEZpeGVzOiAxZmMzMGNkOTI3NzAgKCJwaW5jdHJsOiB0aDE1MjA6IEZh
Y3RvciBvdXQgY2FzdHMiKQo+IFNpZ25lZC1vZmYtYnk6IENvbGluIElhbiBLaW5nIDxjb2xpbi5p
LmtpbmdAZ21haWwuY29tPgoKUGF0Y2ggYXBwbGllZCwgYWRkZWQgUmVwb3J0ZWQtYnkgS2VlcyBz
aW5jZSBoZSBtYWlsZWQgYWJvdXQgdGhpcyB0b28uCgpZb3VycywKTGludXMgV2FsbGVpagoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3Yg
bWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3Rz
LmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
