Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E29BC4332F
	for <linux-riscv@archiver.kernel.org>; Fri, 23 Dec 2022 04:12:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KDuPAPo8TahtgqumJOn0nodEvk2axbt4S9xxHZTyb2g=; b=3lyqCxUYspTAWE
	ocSpHJH/PZmipy0i9xdDpLqRSyQhYZQ+nP/XjgXFQWaPkswv9A1JvBz9Ye7qUfxskPWDhLIopKTpH
	F+KOyqovaovjL+Xg3L+WcdC5o+JuWIzqXpubHosmrwDeKzj6Im1pdaj82ISQNA218yqbMNCG4SeNn
	/hxIdw3voRwe5ONxICAzdbswaYciJJzaiGGeu0FWhgXV1nKnSVlBYxxuL8/997EtxNI9SXd74UTQm
	vFTb4EhI6LlUYskBkkyvJiFUlLvHkvYotyoet+XVscePzvqLDXmWu6/z9gWhTVVckw9byD1raez+1
	9BrxvhF2C8x4q2pYdDkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p8ZPT-00367o-TR; Fri, 23 Dec 2022 04:11:51 +0000
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p8ZOn-0035gP-7M
	for linux-riscv@lists.infradead.org; Fri, 23 Dec 2022 04:11:10 +0000
Received: by mail-ed1-x52e.google.com with SMTP id e13so5593734edj.7
        for <linux-riscv@lists.infradead.org>; Thu, 22 Dec 2022 20:10:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=DDJIRU2drmES57oYUNlv6w2Z7XNzbYJ4ME3pRqcx8ks=;
        b=M/aAcfuN+KqkaGqL5MOJrERhTOfdIgOkRefh7fbtU/vjIYnQUHMPxL/VQcUu923rzP
         clZT3pPnGZnbCBrKnfoNVQxoCCrqMgE1CF+pmKF5WLIZ4ZbrUgamzR6+AElGLiGmKa1V
         VVpOzdeNYEyn166M1lKrlfbE9NEM1nn1Lcq5ZlsOuJTgWMUDSNUncK5T4mPZCAUqFOEb
         4hsawg1wzyeIh5+aszdZ2+zcykbYaO+4+XRmMTHmiFP43AfzePG5qat7ex36Q/akE8Gx
         0bKLOsprGfnsOCe2f7AJjCtGFt9PTa/cAil+5VSBXc0JNkleBiXp117rY7ABHmoJnbTG
         kMmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DDJIRU2drmES57oYUNlv6w2Z7XNzbYJ4ME3pRqcx8ks=;
        b=yPE95Rx4x0eH6kV4ctqM8Ek9j4/G5rT4kV4CHUoc0D4O2+FuMwNp3k7ZfOamSYD+6L
         4uKEd6wyqgvQOp4tM8Sess+u+7CBCyn8PnQDaoR70l4HfeGfRBIKAB0guDE9+TvO6mo6
         nptIoVv81pdxe4n4buOR25n/gte4lwmVNsXXCTE/+knaat+yelMKyEbMosvNBFCikTJh
         qHgfT/zHyNoJVtOLTy/9KZo3nhNk3kpdhRLm5eY766pTXqzzq83K6LHbu/aOv1izg7tc
         DgxyJQIdpWbWbzqmQEhOOu0YbOAMJ/BdoK59t9GzL2rKqGA/CZJYIi8ICbGG1GF3ozd+
         hY+g==
X-Gm-Message-State: AFqh2kppZ227eVEs5BNynhQsezAZXg4MPxW1QaVLgdZ+q2B4mtBcL1AJ
	Zz/i1L3WW4TUJqQcdeONowE0V0Dl682Y5fhPxwU=
X-Google-Smtp-Source: AMrXdXvgXvdfvnweasilwTRfhGfNgSEbDOVlCERqKczxj805dUqByh38/Cs9Oc1qUdjeAW1NFwFwqpUdb0yCWvkDowg=
X-Received: by 2002:aa7:da42:0:b0:46c:226e:6ec8 with SMTP id
 w2-20020aa7da42000000b0046c226e6ec8mr762046eds.319.1671768656910; Thu, 22 Dec
 2022 20:10:56 -0800 (PST)
MIME-Version: 1.0
References: <20221211215843.24024-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20221211215843.24024-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Fri, 23 Dec 2022 04:10:17 +0000
Message-ID: <CA+V-a8urku9J3dre00PCDGBSFmFKeNpcZ4ST3bcRuJGFj8f87w@mail.gmail.com>
Subject: Re: [RFC PATCH] clocksource/drivers/riscv: Get rid of
 clocksource_arch_init() callback
To: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Daniel Lezcano <daniel.lezcano@linaro.org>, 
	Thomas Gleixner <tglx@linutronix.de>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Conor Dooley <conor.dooley@microchip.com>, Heiko Stuebner <heiko@sntech.de>
Cc: linux-riscv@lists.infradead.org, Anup Patel <anup@brainfault.org>, 
	linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221222_201109_363355_44E26A2F 
X-CRM114-Status: GOOD (  13.65  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Sun, Dec 11, 2022 at 9:59 PM Prabhakar <prabhakar.csengg@gmail.com> wrote:
>
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Having a clocksource_arch_init() callback always sets vdso_clock_mode to
> VDSO_CLOCKMODE_ARCHTIMER if GENERIC_GETTIMEOFDAY is enabled, this is
> required for the riscv-timer.
>
> This works for platforms where just riscv-timer clocksource is present.
> On platforms where other clock sources are available we want them to
> register with vdso_clock_mode set to VDSO_CLOCKMODE_NONE.
>
> On the Renesas RZ/Five SoC OSTM block can be used as clocksource [0], to
> avoid multiple clock sources being registered as VDSO_CLOCKMODE_ARCHTIMER
> move setting of vdso_clock_mode in the riscv-timer driver instead of doing
> this in clocksource_arch_init() callback as done similarly for ARM/64
> architecture.
>
> [0] drivers/clocksource/renesas-ostm.c
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> ---
>  arch/riscv/Kconfig                | 1 -
>  arch/riscv/kernel/time.c          | 9 ---------
>  drivers/clocksource/timer-riscv.c | 7 +++++++
>  3 files changed, 7 insertions(+), 10 deletions(-)
>
Gentle ping for review.

Cheers,
Prabhakar

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
