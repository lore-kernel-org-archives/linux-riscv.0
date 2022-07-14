Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94DF0C433EF
	for <linux-riscv@archiver.kernel.org>; Thu, 14 Jul 2022 20:42:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=VopvrpV9r8OO0uYpNLrJx0eOSFOTskG3GzUuKagTCOQ=; b=E6mNS3pHCGP4LfXMi0xbJlzgKq
	dWaWDxhjadXcnyzrN2puCW5ZJQ/17HlxuYIoY0ecoO+lToDEz+ssnmJ3vag71fFNwhokyBzSmxikv
	c0yd4/xtalBJpFpoHwcXVTKAPxgyrcqbTonDyRJRM086Ug/Eo7brUha0DVhETphzx8WfMvGusx8f6
	5dUOZdn+8OuG8qjZnpMCmYWBQtn52AVB6Bqv9ux1gMrjDLUz1uXOQ8xhoE+JO6bLvOee+tsON9v5/
	BHdOpus0AkyrTU+1IZR3QtIU4BQLwBc74cj3zRTK+9DLEO9osd1xEs1gbL6FSJsryA9sseUzDbjKw
	Y7uj6nCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oC5f9-001WMj-4s; Thu, 14 Jul 2022 20:42:19 +0000
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oC5f4-001WLE-FB
	for linux-riscv@lists.infradead.org; Thu, 14 Jul 2022 20:42:15 +0000
Received: by mail-pl1-x62f.google.com with SMTP id r1so1457524plo.10
        for <linux-riscv@lists.infradead.org>; Thu, 14 Jul 2022 13:42:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
        h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
         :content-transfer-encoding;
        bh=i9sGdG3417A1eOqpdbT6ifVp8mm+4ozd4zG0DatTTlw=;
        b=OUSHoNhv6/MBx+TYwGZiXQTMfTIrftxKkt76pX+DLWlN6PHQjqGLZ7CTZ2e2wD2tDM
         ZMkVAZyvbV3fqxcXNj6D6qU8NTlp5hV/QF22B1QyVap62B1KonP+zASMSuWRSaTCHX6K
         R7eWy9MIg2o1mS2BWwYwHjTKPHZgnz4bCDtKNXHjPcqIaBLk/Uv9aX9iZj4vKkuVxYFj
         1XEdUU/pWT6+a0VVNL1N6KFtvusALBKHvFnSjvg1JlZiSYBgjy8qatUInj+CJOK+EgR4
         Swz2H6Cs2kfYOE2sMVF64o9LIelGkIaKH8mBoQdCuCDVrye+eNNJW2aFyBDi1hDX0HEL
         Rk1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
         :mime-version:content-transfer-encoding;
        bh=i9sGdG3417A1eOqpdbT6ifVp8mm+4ozd4zG0DatTTlw=;
        b=3k/rgfHbH2IVbw+Pokof2xCTgOzBs+B3R4L3SXfopENaI8m5QccxQOqgacJARbHvEY
         BTqrpLYHncDPOuaG05z2QZK7bDoX67o8CwGmpDRdwoKlcntLBDIqNh7YpybQYRPHK6Ho
         eFZyen4jE2iGV+y1SLkkweqUdtu2mdqq9lBmlMW7mlNQvidyYP5TVwCUpoHpOlZbDvIA
         3qmJtDG7St0tnlUYtDW5c1qKty8SAIf/weXyJF8Mz/JUI7Exff1ToU9HE+gMVUNTeskI
         rod6rfY81mfeqgZQ/QXQy5BizENY42VDctnsxEVfxl8DQAWGpTS7r9jL78/YpSfK7fQM
         m2rA==
X-Gm-Message-State: AJIora8j/ILCwaaMDim+q0n2iVPAovlyE6ypRn+4upTIp1ygdtSm0Izq
	J7ZanRxuESRLOOphTTZGwR5WvA==
X-Google-Smtp-Source: AGRyM1vRDKVn8+YaomQ2Tg1XNT56RxRqvbrGpZyapzdYs697qfJWvvHi6CACsndZc8FNMXyC5EyoTg==
X-Received: by 2002:a17:902:f710:b0:15f:165f:b50b with SMTP id h16-20020a170902f71000b0015f165fb50bmr9828529plo.158.1657831327611;
        Thu, 14 Jul 2022 13:42:07 -0700 (PDT)
Received: from localhost ([50.221.140.186])
        by smtp.gmail.com with ESMTPSA id y36-20020a634b24000000b0040cfb5151fcsm1777742pga.74.2022.07.14.13.42.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Jul 2022 13:42:06 -0700 (PDT)
Date: Thu, 14 Jul 2022 13:42:06 -0700 (PDT)
X-Google-Original-Date: Thu, 14 Jul 2022 12:26:15 PDT (-0700)
Subject: Re: [PATCH] riscv: config: enable SOC_STARFIVE in defconfig
In-Reply-To: <20220617182424.324276-1-mail@conchuod.ie>
CC: Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu, kernel@esmil.dk,
  geert@linux-m68k.org, linux-riscv@lists.infradead.org, conor.dooley@microchip.com
From: Palmer Dabbelt <palmer@rivosinc.com>
To: mail@conchuod.ie
Message-ID: <mhng-05c71ff0-a8df-4bf8-814a-8af52d0584c9@palmer-ri-x1c9>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220714_134214_523930_C85576A7 
X-CRM114-Status: GOOD (  15.24  )
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

On Fri, 17 Jun 2022 11:24:25 PDT (-0700), mail@conchuod.ie wrote:
> From: Conor Dooley <conor.dooley@microchip.com>
>
> SOC_STARFIVE is the odd one out among the (compatible) SOC_FOO options
> as it is not enabled in the default defconfig. Add it to make catching
> dt regressions etc easier.
>
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> ---
>
> git send-email gave me an error that was unclear as to whether anything
> got sent. Checked lore (and my inbox) but didn't see it come through so
> hopefully this isn't a resend.
>
>  arch/riscv/configs/defconfig | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/arch/riscv/configs/defconfig b/arch/riscv/configs/defconfig
> index 0cc17db8aaba..f8d7d9527c6e 100644
> --- a/arch/riscv/configs/defconfig
> +++ b/arch/riscv/configs/defconfig
> @@ -18,6 +18,7 @@ CONFIG_EXPERT=y
>  CONFIG_PROFILING=y
>  CONFIG_SOC_MICROCHIP_POLARFIRE=y
>  CONFIG_SOC_SIFIVE=y
> +CONFIG_SOC_STARFIVE=y
>  CONFIG_SOC_VIRT=y
>  CONFIG_SMP=y
>  CONFIG_HOTPLUG_CPU=y

Thanks, this is on for-next.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
