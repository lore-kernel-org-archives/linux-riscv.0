Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39FC0C4332F
	for <linux-riscv@archiver.kernel.org>; Thu, 29 Dec 2022 16:24:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=rSYs/A6a5dLNbkKDwSvIfXA/KeGA7BNzQhlHxBPGAS8=; b=rFTcdGkAVpAZ9JDCbNrubCVinl
	wdIKwqduBGKncMS3YFH5fPI/yg1CQr15twzQy50IKCC1NQfuL5FEW12AhQMf0Iw+K85BSBaH1fS79
	EOFqL+/k2SrkU22bJgQHWSUhuMCeePa8wTaMSToHGZ6cuQaOq2HnYGRP4uMBBxPJfeid4Zl4fyXvs
	rGGoAWH9zuqVIgQTgcTsuXCpb0CgFDeESXiDSV2hnItpLZITav1JQQpE/OpxrbgJelEsGMj0LhTVy
	mW0vocJxcUmgVRlkm6QHNf57XAOGy29r1yQW5utd1t93f8rEoJ8ZN1FJFe3FlpEQDLK6PXRS6ISdZ
	QBV2YFMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pAvhj-00HQyz-Gw; Thu, 29 Dec 2022 16:24:27 +0000
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pAvfu-00HQ44-Le
	for linux-riscv@lists.infradead.org; Thu, 29 Dec 2022 16:22:38 +0000
Received: by mail-pj1-x102c.google.com with SMTP id fy4so19697756pjb.0
        for <linux-riscv@lists.infradead.org>; Thu, 29 Dec 2022 08:22:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Sx62UHYE4K/1LMVa7vYzyz951aPNbfYDTxkzvJVDcbE=;
        b=1TIHIZwz3shtBg/m9o0Cyfr+vMF6VQ/1tPJF5BjRY9CDbK9j52CaNfbSN14bDlYHkw
         c5gxx/P5B8EKRsE82QS2LHo1Zya2VBLB3HiyW243u+Z6Ffr7DY0GbQfskeigy9DTMVRs
         RZLQrRTnlzpPUcjZzmSLtY0lKbNGtpuHToQpsZ21nPEfz4eI2Ntan8/8ah3yCJryA7qw
         yaFq6JR3QFgCeKN3BDnx78mCx3MzLgFNqEf4TtsytzkgzDMVxGzOzyv2fqAP6b/8XWW3
         eZdL0Qk00p9gZTYoUcszOk2z16rjjyOffrQCszMyGvn/pe3ycC10o+moFXqSjCH8TrEs
         ftcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Sx62UHYE4K/1LMVa7vYzyz951aPNbfYDTxkzvJVDcbE=;
        b=I8Got+UbHlPCma2XpS50JmcMadORjR+IyaiJ/iMABcQkn7z5U9UFeQcmM0F8jBfLap
         HBbJWkrLC5u+CII0czYOqgt7DZXvUpt1KuKlAbBtneYEXRBYeGSQ/6C0eM4ueRQF/yKy
         WqJ+m5KHNHj+VT278GQwN+9zezv0WgeU5w/oZLhd477Z4LHIio0lzT7KaqOOeNODLOg4
         9IK8VkbEMqTmTWw8+BSP4Nu56KgQzBl/bqDsvdYq3JoFESnSTxkZGWBRW0VbleTLZ4ym
         8xl3ys7aMeNbujj1/qGoMzfRoqOeNkLYmhpX2YATCbNxdKxyVaLk0EjMnAuV0JpIRkg5
         1h5g==
X-Gm-Message-State: AFqh2krngJP6Or058J7SNtfqrHpVvv1Bpc3aBnLy9s0SHCU/8DSdqsx3
	vmi08IkdGD8X5uJ93PCgF+ieBA==
X-Google-Smtp-Source: AMrXdXvYnhLxrzCb2aN5YpTDnDd0GnWOO+iNqjApUuYsI2vXmwxV66+UBQ+tQedx+jtaCH3pAORaaQ==
X-Received: by 2002:a05:6a20:d80a:b0:af:7c29:8a98 with SMTP id iv10-20020a056a20d80a00b000af7c298a98mr38238468pzb.16.1672330951444;
        Thu, 29 Dec 2022 08:22:31 -0800 (PST)
Received: from localhost ([135.180.226.51])
        by smtp.gmail.com with ESMTPSA id bh1-20020a056a02020100b0049e315c3341sm1351206pgb.61.2022.12.29.08.22.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Dec 2022 08:22:30 -0800 (PST)
Date: Thu, 29 Dec 2022 08:22:30 -0800 (PST)
X-Google-Original-Date: Thu, 29 Dec 2022 08:21:19 PST (-0800)
Subject: Re: [PATCH] clocksource/drivers/riscv: Increase the clock source rating
In-Reply-To: <20221228004444.61568-1-samuel@sholland.org>
CC: daniel.lezcano@linaro.org, tglx@linutronix.de, prabhakar.csengg@gmail.com,
  samuel@sholland.org, aou@eecs.berkeley.edu, Paul Walmsley <paul.walmsley@sifive.com>,
  linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
From: Palmer Dabbelt <palmer@dabbelt.com>
To: samuel@sholland.org
Message-ID: <mhng-e60a7fcd-f497-4bca-8de3-b57e2a2d3532@palmer-ri-x1c9>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221229_082234_869040_74845972 
X-CRM114-Status: GOOD (  24.65  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Tue, 27 Dec 2022 16:44:44 PST (-0800), samuel@sholland.org wrote:
> RISC-V provides an architectural clock source via the time CSR. This
> clock source exposes a 64-bit counter synchronized across all CPUs.
> Because it is accessed using a CSR, it is much more efficient to read
> than MMIO clock sources. For example, on the Allwinner D1, reading the
> sun4i timer in a loop takes 131 cycles/iteration, while reading the
> RISC-V time CSR takes only 5 cycles/iteration.
>
> Adjust the RISC-V clock source rating so it is preferred over the
> various platform-specific MMIO clock sources.
>
> Signed-off-by: Samuel Holland <samuel@sholland.org>
> ---
>
>  drivers/clocksource/timer-riscv.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/clocksource/timer-riscv.c b/drivers/clocksource/timer-riscv.c
> index a0d66fabf073..55dad7965f43 100644
> --- a/drivers/clocksource/timer-riscv.c
> +++ b/drivers/clocksource/timer-riscv.c
> @@ -73,7 +73,7 @@ static u64 notrace riscv_sched_clock(void)
>
>  static struct clocksource riscv_clocksource = {
>  	.name		= "riscv_clocksource",
> -	.rating		= 300,
> +	.rating		= 400,
>  	.mask		= CLOCKSOURCE_MASK(64),
>  	.flags		= CLOCK_SOURCE_IS_CONTINUOUS,
>  	.read		= riscv_clocksource_rdtime,

I've never really understood what we're supposed to do here, it seems 
like we're just picking arbitrary ratings for the various clock drivers 
to get the one we want.  That's really a property of the whole platform, 
though, not the drivers, so trying to encode it as part of the driver 
seems awkward -- if anything I'd expect the ISA clock drivers to be the 
worst on any platform, as otherwise what's the point of adding the 
platform-specific mechanism?

That said, I'm fine with this as long as it's improving things on 
the platforms that actually exist.  IIUC it's only the D1 that has 
multiple clock drivers currently, so if it's good there it's good for 
me.  We'll go crazy trying to reason about all possible future hardware, 
so we can just sort out how to make stuff work as it shows up.  So:

Acked-by: Palmer Dabbelt <palmer@rivosinc.com>
Reviewed-by: Palmer Dabbelt <palmer@rivosinc.com>

I'll let the clock folks chime in, happy to take it through the RISC-V 
tree but unless someone says something I'm going to assume it's aimed 
over there.

Thanks!

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
