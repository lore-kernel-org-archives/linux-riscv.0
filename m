Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84D36EE7FF4
	for <linux-riscv@archiver.kernel.org>; Mon, 11 Sep 2023 15:04:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hv5ZR2oem+vpHeF6dGqh4FCaq4cgf6CpJ+ud0DOGAcs=; b=Ufr6sshL7AbvX0
	zddOZJDRI8phTgycqWnOZfQOBjbmFacMOhKYVl+y52xA3vnxHvRxFCYquGOsqRWGMcxCyW7GFbOLx
	BmppfUxpkjlpcRuNzrMERl5Njpcv/ElkTz0kVCX+fhrQWfEOIaGI+wKQxiL6S1FWjn44H85k6FgzO
	izkoC8zDdMcmbxBDP/+bmaOs30X/8R41MiTySV89okPNZ89aunOMp57QqRhzafHPaFzC/FlaEY6PT
	MMtPOkZ6JNY4jWASh7/6gvo4CaOlXJrcpu6mtm2Hek5HeoxqwO5JCOYRlZPRuvdslDEbpNNf/YCUR
	oT1NuPzKnauCQFCBY21Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qfiSh-000oFU-2P;
	Mon, 11 Sep 2023 15:04:27 +0000
Received: from mail-qv1-xf35.google.com ([2607:f8b0:4864:20::f35])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qfiSd-000oCG-2C
	for linux-riscv@lists.infradead.org;
	Mon, 11 Sep 2023 15:04:27 +0000
Received: by mail-qv1-xf35.google.com with SMTP id 6a1803df08f44-655dccc9977so13173906d6.0
        for <linux-riscv@lists.infradead.org>; Mon, 11 Sep 2023 08:04:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1694444658; x=1695049458; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=72EyxoHPMhyqLAN1Oi5hC6bDHujWPuBTVHMDoLceg0U=;
        b=DcFkq2OuIIob6fJIfmyV0GFE+IAM4jphhrjk9mUigPXYApzP+gncPZwRx1Ou26DvFr
         EW3mGtG72TNmr4gMXHaEmL7ywpk/2XDSQ92l6MO8ssGfOJmD6vdwQLltbF/GygjIs7kg
         cqQOOLcpmREyEX6SMYoLoD2Z7tUKJBo0nDFSENI8/CEbd8nJ3gL8tq6QytehTtH5zG34
         weC4uSRPoVSA4jjRGZ7m4YPFJ6EUjoapHLKrPO4ygLKCGkxRg7LxzXGu84yxzYVuF1a1
         B/2aHnpe9bG7zGk7tTdZMO1Aff34pIpvsy1ydcEUS3rEPWs7L7Dh8dSEDn83xU1mb8ta
         voOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694444658; x=1695049458;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=72EyxoHPMhyqLAN1Oi5hC6bDHujWPuBTVHMDoLceg0U=;
        b=ERfCMp2MLL1FZ6+xvkYeExk/kAhksy5PatdrSINRytu8IAlGgI/KZxzOAwhRi28BHb
         PsuGFp5BRkYauFWseVTP2P5HhYYjJwVJGdXDtPtzLxMotGZckcYidV1p+SEXdnsGs+ca
         kJGjBAV9f+ZOMnXx+JUtNeBv+ykeaaEXIJE/kST1R1jq4Ul6ROd0pDA8n8EgvApKHVEf
         Lq8W7h2Ty3rf0tc+N4YRs0suM7SA8ogJE+VK7fV4Bhy1w9819GREGuLX8r9UpmyO/4ft
         XruNKGtvrp6HyiKWrxHdnHSFnPDbX9p1XcNDRHbMf7YqIzU33d92J9gsPZJLhxQzCEm7
         nWuw==
X-Gm-Message-State: AOJu0YyqmKyE/NzjOMZAzZMeUD7Fz2QnF7IgnLJJjkcfTQ3XOj7YXas4
	lx1ZKa7yUlwZR4Aco9t7IbfAo/31dkINolFF6meH2Q==
X-Google-Smtp-Source: AGHT+IEy+PPH0r7bh0RyH/liXMUverdXDjbmX5RZMKLrtXIE9sF+UTS35KMMBa00g3J4ID/JpCvC9ESAIt2ZGXz6O90=
X-Received: by 2002:a0c:b30c:0:b0:64f:4dbe:c675 with SMTP id
 s12-20020a0cb30c000000b0064f4dbec675mr9695545qve.25.1694444657841; Mon, 11
 Sep 2023 08:04:17 -0700 (PDT)
MIME-Version: 1.0
References: <20230909003715.3579761-25-sashal@kernel.org> <mhng-e2cedb63-0933-4752-bfd8-592e4e1f6e2c@palmer-ri-x1c9>
In-Reply-To: <mhng-e2cedb63-0933-4752-bfd8-592e4e1f6e2c@palmer-ri-x1c9>
From: Sami Tolvanen <samitolvanen@google.com>
Date: Mon, 11 Sep 2023 08:03:38 -0700
Message-ID: <CABCJKucm3KjYKgjP9OT4GLe8KZ3QxpRk9GqPD5JgwMaoZumnQQ@mail.gmail.com>
Subject: Re: [PATCH AUTOSEL 6.4 25/25] riscv: Add CFI error handling
To: Palmer Dabbelt <palmer@dabbelt.com>
Cc: sashal@kernel.org, linux-kernel@vger.kernel.org, stable@vger.kernel.org, 
	keescook@chromium.org, Conor Dooley <conor.dooley@microchip.com>, nathan@kernel.org, 
	Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu, ndesaulniers@google.com, 
	peterz@infradead.org, ajones@ventanamicro.com, heiko@sntech.de, 
	prabhakar.mahadev-lad.rj@bp.renesas.com, liaochang1@huawei.com, 
	namcaov@gmail.com, andy.chiu@sifive.com, guoren@kernel.org, 
	alexghiti@rivosinc.com, Bjorn Topel <bjorn@rivosinc.com>, jeeheng.sia@starfivetech.com, 
	jszhang@kernel.org, greentime.hu@sifive.com, masahiroy@kernel.org, 
	apatel@ventanamicro.com, mnissler@rivosinc.com, coelacanthushex@gmail.com, 
	linux-riscv@lists.infradead.org, llvm@lists.linux.dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230911_080423_723499_E6E3C6D9 
X-CRM114-Status: UNSURE (   8.65  )
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

T24gRnJpLCBTZXAgOCwgMjAyMyBhdCA4OjMz4oCvUE0gUGFsbWVyIERhYmJlbHQgPHBhbG1lckBk
YWJiZWx0LmNvbT4gd3JvdGU6Cj4gU2FtaSBwcm9iYWJseSB1bmRlcnN0YW5kcyB0aGUgZGVwZW5k
ZW5jaWVzIGJldHRlciB0aGFuIEkgZG8sIGJ1dCBJIGRvbid0Cj4gdGhpbmsgdGhpcyBvbmUgaXMg
c2FuZSB0byBqdXN0IGJhY2twb3J0IC0tIHRoZXJlJ3MgYSB3aG9sZSBzZXJpZXMgaGVyZSwKPiBh
bmQgSUlSQyB3ZSBoYWQgdG8gc2V0IHVwIHNvbWUgY2xhbmcgYml0cyBmb3IgaXQgdG8gd29yayBj
b3JyZWN0bHkuCgpBZ3JlZWQsIGl0IGRvZXNuJ3QgcmVhbGx5IG1ha2Ugc2Vuc2UgdG8gYmFja3Bv
cnQgdGhpcyBwYXRjaC4KClNhbWkKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5p
bmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8v
bGludXgtcmlzY3YK
