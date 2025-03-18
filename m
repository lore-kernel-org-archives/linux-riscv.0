Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACF3FC282EC
	for <linux-riscv@archiver.kernel.org>; Tue, 18 Mar 2025 13:12:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1metfd8YHstq93n8PasyT+TGUszQ8iTe1RMyuivT24g=; b=1uhvzaicjHnUEf
	kP/50jj90CRJoBQRqquE1O2hRLUNmnr6rmgrCxEow/sMp1S0Jp5WQ3TjHLnJVetHrE52rKB4zNCXF
	T1cZ1wNw4p0qtPf2I2+HBtXRvDLCf1ZCe8Xobw81KBocGsc0L/Frod0HoiKMbxOUxke9y6bCTE7nV
	dixRMmoLQo7rQin+eM/2kQZOLJ0FovrBCNflDgL+WzgBmG16b0/YGFbD+UNZQGiwaWRhPIv8dT0Zg
	qQjnzEQNZ8JwbIUYIzRkTNuqLGuUl6594KAnm10QWA1V2AboRS7qS/BCSHp4WCI+HIZ/r2Gpne0+G
	10yss6uLZANAwGMq5AgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tuWkD-00000005zFY-06Lp;
	Tue, 18 Mar 2025 13:12:33 +0000
Received: from mail-lj1-x22b.google.com ([2a00:1450:4864:20::22b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tuWkA-00000005zFA-4AI6
	for linux-riscv@lists.infradead.org;
	Tue, 18 Mar 2025 13:12:32 +0000
Received: by mail-lj1-x22b.google.com with SMTP id 38308e7fff4ca-30c0517142bso49723581fa.1
        for <linux-riscv@lists.infradead.org>; Tue, 18 Mar 2025 06:12:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742303549; x=1742908349; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=m+JW0GxcOfEbsGUMfY3A4UKcwqPXUPjKGZHsNwYr1cc=;
        b=v03wVsvRKOM3QXZ2Igji+327vreJge4XXtgtKWedsbOn31H6tbk7YattnJSWfgyUyN
         rb8/OcpNxYw1Paa6XHA3fiQ6oJaYF+RhEWDaBgHuxYV/nO13twXj5vUIh+spwceSSPdF
         CFLG+A22p2TJxt96zw5a3Yzps23Zh8RCWDZXy26UZOZ3zjOlJo1MsWJ5jqPc+zSa7gB6
         6Zymi2LOcCOXHH/x6a1CG+BlUt4t8ndK/e6+dCbHtayA0TbHuPw5uGioJzUt57yR2imR
         oNQ9OW2rWa1ORqmLc30LKbMvf3uExF36vKeijUBuNmDjGpQaY8sJm/b6heMyGyPiT61O
         H7IA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742303549; x=1742908349;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=m+JW0GxcOfEbsGUMfY3A4UKcwqPXUPjKGZHsNwYr1cc=;
        b=v8R/DD0SHPoGt1up3Jeh0Eg32yAU3flAUGJe+us+YGNdopITlRX6z4a5X9NcEvoVRo
         3ohWyovj7bG5ifGIFvM5YLyBbwS9UII8P92RrUrK+sKjmCfuwFjQLfvM0tzzCLEsfXSO
         dPtjC+rhFgoDyW53wQTwEOCg43en3kqVE1mwUgXyofTEQWW7mIdGgR8yK4LcCQmjlqL9
         mYgNrq510t6pfSlPZBJhrsTqSwgN4sdWwwWrL22j/tamXrueoA/YEGksyi6DYO+Qgt6W
         bTAgSYVtlklowWRzVghTIvOjcFNiPyYw88mt0WJl7eptp03gridCLFTmzYhp7t7FV5+d
         jBBQ==
X-Forwarded-Encrypted: i=1; AJvYcCXK1T/bGevJAvmTVZ3xl1X+TTJ2hVuM6T/5cyTrq0GqnHK+pe28YwOyATa3rwzyGMuafWHNP1nXHl76XA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yz9KxduOTKbgbHX2bDbO3ea/BycsXrZJWn22nm6BdcSAeRTHEin
	m7K5O6OPhVJ1jy/jx8k1YYA9xC1VGjBl/rSq1lchp8yF+4Y6roPTsgckOR2NphxwlqpKf7dVxMr
	PJWQS7i8rz7P/KJLCeyoQ1wJj6LwC2n1uMHivng==
X-Gm-Gg: ASbGncvxUsoUOQ6rwsdXmE274e8ODSQMfdeViZAH3OYRKJmuVAIsB9f9YmUNsNKE8Y+
	AE0WHG97qdH59jOSV0ocRt2oXUfWl5B2v69LF5IM1wX1zoWwc+JBaCTS6LHxejq43CHbEPphmE1
	bu6H6Du6/8FuGkabxNpnBIBD8c4g==
X-Google-Smtp-Source: AGHT+IEIZJYLChZDkVJzp8GGSso6tmjT/EGUHPEz7J1GeVHCZp3JY3gZqnIFRPcKetE4CFJOoQCHjU6fqzqdaamtiwE=
X-Received: by 2002:a05:6512:158a:b0:549:4de9:c23 with SMTP id
 2adb3069b0e04-549c38f2271mr7000190e87.9.1742303549003; Tue, 18 Mar 2025
 06:12:29 -0700 (PDT)
MIME-Version: 1.0
References: <6881b8d1ad74ac780af8a974e604b5ef3f5d4aad.1742198691.git.geert+renesas@glider.be>
In-Reply-To: <6881b8d1ad74ac780af8a974e604b5ef3f5d4aad.1742198691.git.geert+renesas@glider.be>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 18 Mar 2025 14:12:17 +0100
X-Gm-Features: AQ5f1JpKtqBl6_xNyjaCM0IP-W12FrKeGTp428YKCDaSR8qMk0mTF6rf_odJg14
Message-ID: <CACRpkdaOv8u1yCLyZs+hKv9h3YDk5PMD=HVpgABMpm=kwO35Sg@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: spacemit: PINCTRL_SPACEMIT_K1 should not default
 to y unconditionally
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Yixun Lan <dlan@gentoo.org>, Conor Dooley <conor.dooley@microchip.com>, 
	Javier Martinez Canillas <javierm@redhat.com>, linux-gpio@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250318_061231_035663_F040E404 
X-CRM114-Status: UNSURE (   6.63  )
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

T24gTW9uLCBNYXIgMTcsIDIwMjUgYXQgOTowNuKAr0FNIEdlZXJ0IFV5dHRlcmhvZXZlbgo8Z2Vl
cnQrcmVuZXNhc0BnbGlkZXIuYmU+IHdyb3RlOgoKPiBNZXJlbHkgZW5hYmxpbmcgY29tcGlsZS10
ZXN0aW5nIHNob3VsZCBub3QgZW5hYmxlIGFkZGl0aW9uYWwKPiBmdW5jdGlvbmFsaXR5Lgo+Cj4g
Rml4ZXM6IDdmZjRmYWJhNjM1NzFjNTEgKCJwaW5jdHJsOiBzcGFjZW1pdDogZW5hYmxlIGNvbmZp
ZyBvcHRpb24iKQo+IFNpZ25lZC1vZmYtYnk6IEdlZXJ0IFV5dHRlcmhvZXZlbiA8Z2VlcnQrcmVu
ZXNhc0BnbGlkZXIuYmU+CgpQYXRjaCBhcHBsaWVkIQoKWW91cnMsCkxpbnVzIFdhbGxlaWoKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2
IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0
cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
