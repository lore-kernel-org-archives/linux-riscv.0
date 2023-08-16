Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81901C001E0
	for <linux-riscv@archiver.kernel.org>; Wed, 16 Aug 2023 14:25:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:In-Reply-To:Subject:
	Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=47QwfI1X6K8+XiCjXw4KVW3XZctIlP91IUKXi9FdIhY=; b=vZUGvS+5N//Y5XK5B/ey2Mcm+J
	IeB0AH6f8JHp8KIuog0nDl9hK1tU2uRk53od1310jO7Mbh4vnsMm2TmaEx8o9PFbfUhIPFQK3cMXP
	gHJCG6fYH7vYu3kw9BbBlK0H8TYS8g4NuENXP9Ckal2r0/fS+D9T4TuygY9WDHHhob4K0epzulGAA
	aT+qeKIK3odiB0+yBJfRuTKYM7L4tryRWmSOgbUnvnUJ2H6IObaLrUTc9mRwR0Yxu9BrmJsZg98jr
	+E9F4Uz74TrV0nDblRWrev9VYgdLjcABGwsJRiIrdIvOdEvmCMfepnlSul6r3tLwJx20h3SEsEm2t
	XAt1xIVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qWHSE-004MLW-1Y;
	Wed, 16 Aug 2023 14:24:58 +0000
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qWHSB-004ML4-1n
	for linux-riscv@lists.infradead.org;
	Wed, 16 Aug 2023 14:24:57 +0000
Received: by mail-pj1-x102b.google.com with SMTP id 98e67ed59e1d1-26b47df332eso2051247a91.2
        for <linux-riscv@lists.infradead.org>; Wed, 16 Aug 2023 07:24:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20221208.gappssmtp.com; s=20221208; t=1692195894; x=1692800694;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=P1WGFmUFQbZk1gRHuf5U7fgkfS57PmP0h28a+2hxBjY=;
        b=TyRLJKa3FRbKLMywDuW3EZSOaSUQIruIgQtIvZ92NVMkkM5rR/MwpfvAA8FjAtDW4X
         yNe+1P2ChHs7RznxBsVp1jRBIhMlMJaPFj/YFwYPdKjnykvgOY003h21AolAjtrbnJQl
         t2LL6KbDixm30xvFehhjYS2JBej485WINZu8sMI4JM3HA9D04PwsBiK2o4I4Z3T0XKGZ
         tIAoq0VztDy1Z74F3iYcV+RZoKjyEvKlyeT/kaRCqH/CZ0oXtmuWc3Ms+niqCoYP+wpW
         EpniaXrcdWyDiv0fI4ZWpnFRtVE7OqQYhWpzndgNYGSFRuk2DmioWCZ8rbZN2gNBzd8Y
         uK8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692195894; x=1692800694;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=P1WGFmUFQbZk1gRHuf5U7fgkfS57PmP0h28a+2hxBjY=;
        b=HlxjJP5fAxMvu6mLfx3vPns/HEFk80cGSIDCstH6QugwXMc+JbRjKi0iT/mnJGT3KT
         RJGSlOhOE/V3kHLjLK4akQeCKMXB7CK2d6Gf2bOkrBQvKGMs2E2Gs5R3LWMfj8w6ToLM
         UdxmCHSCvt477q+MIMiTRLO9Tcn8jmZ0LIOvJt0osjHk3WRiOusuMeCuiRvV2icMQPtU
         lCUV29aJ9sZa1luZaZTOYG7yR2TFhrbOzp+2pytvxMA24874k9e+ZmDQ87M4YvpfLkUA
         FSnmqqCqXhCzuA8g1IgK3237XdexN2vqleQNFH3kHhy3/Dl+QJAnDM+r070OzQlJaNrd
         i3ZQ==
X-Gm-Message-State: AOJu0YwI3SDGpvIjfvbDboeQIj19M45/gTjovauIKeGF8r9j5nUsYN/3
	Q8fZItwSzPt7DfCZ7ORssRRLbQ==
X-Google-Smtp-Source: AGHT+IEhASnnPuidtpatB9VyiPbNp+Q1/lOfH92sBonVT/ZVG3ZNut3Q7QzPxS1bxTjDaUN5y/MjHg==
X-Received: by 2002:a17:90b:681:b0:268:15dd:c5c7 with SMTP id m1-20020a17090b068100b0026815ddc5c7mr1328421pjz.40.1692195893982;
        Wed, 16 Aug 2023 07:24:53 -0700 (PDT)
Received: from localhost ([135.180.227.0])
        by smtp.gmail.com with ESMTPSA id fs11-20020a17090af28b00b00263987a50fcsm13247424pjb.22.2023.08.16.07.24.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Aug 2023 07:24:53 -0700 (PDT)
Date: Wed, 16 Aug 2023 07:24:53 -0700 (PDT)
X-Google-Original-Date: Wed, 16 Aug 2023 07:24:51 PDT (-0700)
Subject: Re: [PATCH 0/2] Misc RISC-V timer driver improvements
In-Reply-To: <20230710131902.1459180-1-apatel@ventanamicro.com>
From: Palmer Dabbelt <palmer@dabbelt.com>
To: apatel@ventanamicro.com
Message-ID: <mhng-5adf3416-5d04-4a55-a6bb-1fbe921f9f48@palmer-ri-x1c9>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230816_072455_804563_088F6295 
X-CRM114-Status: GOOD (  14.82  )
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
Cc: apatel@ventanamicro.com, anup@brainfault.org, daniel.lezcano@linaro.org, linux-kernel@vger.kernel.org, Conor Dooley <conor@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>, atishp@atishpatra.org, tglx@linutronix.de, linux-riscv@lists.infradead.org, ajones@ventanamicro.com
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Mon, 10 Jul 2023 06:19:00 PDT (-0700), apatel@ventanamicro.com wrote:
> This series does two improvements to the RISC-V timer driver:
> 1) Keep timer interrupt enable state in-sync with interrupt subsystem
> 2) Increase rating of clock event device when Sstc is available
>
> These patches can also be found in the riscv_timer_imp_v1 branch at:
> https://github.com/avpatel/linux.git
>
> Anup Patel (2):
>   clocksource: timer-riscv: Don't enable/disable timer interrupt
>   clocksource: timer-riscv: Increase rating of clock_event_device for
>     Sstc
>
>  drivers/clocksource/timer-riscv.c | 17 +++++++++++++++--
>  1 file changed, 15 insertions(+), 2 deletions(-)

Acked-by: Palmer Dabbelt <palmer@rivosinc.com>

in case the clock folks want to pick these up.  Otherwise I'll look more 
closely and take them via the RISC-V tree.  Thanks!

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
