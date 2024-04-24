Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79F04C4345F
	for <linux-riscv@archiver.kernel.org>; Wed, 24 Apr 2024 20:02:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=CscCbExUIVWxKi5ZNPS4mc9E4o/pzLCPJQIJGaYcmZM=; b=mFjkUmuSWBXp36akbtFksd6kRM
	CG3n6Rk6BD6Zg7Tq2HDn+LwPf2tusa3yzRyP5Z4+hp2Muma4uWwgzTHF4BGNwkT7wBqlfDvDrX6Ry
	qqXKsiqYb2ZRNXmimMU7XnmXvOGRwpMe4waNVa2cdtZqIgL8BDK2O2OqXETuBQscUF261Jy5ISsca
	adInCSG7PZaM7LZ9ONtb1V3ywSAeGdjVGXeWtq+/64uMl+pMWZNJD8g/YD73MW9M1FN7VOJbNVcXJ
	gf7HKaLvkF8imytV4On/roT0KscngM6sK23zmKREkRr1QzRtf2xJODXdEp2HOOJkZiGDg/iN27Zyb
	DJRq2VKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rziot-00000005nMf-0gpD;
	Wed, 24 Apr 2024 20:02:19 +0000
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rzioq-00000005nL1-0KUV
	for linux-riscv@lists.infradead.org;
	Wed, 24 Apr 2024 20:02:18 +0000
Received: by mail-pl1-x62b.google.com with SMTP id d9443c01a7336-1e4c4fb6af3so2522235ad.0
        for <linux-riscv@lists.infradead.org>; Wed, 24 Apr 2024 13:02:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20230601.gappssmtp.com; s=20230601; t=1713988933; x=1714593733; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1PMiKR4aPVvVW83OfyGhFvZRNug52G2rTKzNtFX0PpY=;
        b=HcPNCQl/hzKAMWDsU2xGTSPwytCUgxH75c6MaM/GFxE2tSFN+J22Cf05Fk0NJKHwDw
         vLy+vUxHxNBdY5S0at9cvyeq413f2YZfWPpp8gWlhcSKgRPxP62lYruD+z3DHGCJhL9B
         qZt0DDFaUHlwPYNPCH3qLCsl6IKBHhr1HJSnxvChxyJSwQDMm3gyLF4DOysJz2MOH0h3
         MfUpbkZPcO1/GNfyQ6ZJpIjeRhSqjMUS08Rmd0XcFKccQ/vM9fA8amkMuTtW6Gah8a54
         Hrh4khJoqQl50mUi7BecCOQUEeoK5GuXqS8WE2fi9et2wfrYpCS19RkQhS8zn5QvpNtD
         qpsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713988933; x=1714593733;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1PMiKR4aPVvVW83OfyGhFvZRNug52G2rTKzNtFX0PpY=;
        b=tjyEzNNGoBGGDygjuWlgak6rODS4Ld/Pc1RumYM1hprakLMzK3iiIL2vNYkoj6kthJ
         EDgLipGj8lS/+cYBdd3GXpqghZ+/Hq+YLxb7dUCL9Z+pT2fhhoEzrHCIcSqCCXiUpr4e
         OGs76zJQgjOr6ImdlRjnMn4xTgmeF7oazYLZjI/2UCyOsV183Acwdb8KqWzvg176zxv0
         Sdn2f9hYhPxpdqcYgiwmJQBCG5wQHzQIFvpPU6YUaMC5e73z5P2Hwacla9SGFBWSODDG
         uBLdUlgbEwzQhsBbw8QW8WEAfMtbqRVwa62C8aXu0EcP4qA+SUstFiG96754mfGjTHno
         0mlg==
X-Forwarded-Encrypted: i=1; AJvYcCWnCydK6o8dIaW8upk8M7KaF2aWG8y5xtY/kFBZuHF//6N4Uk5+C3XaYQcnJe0R+5XoDctH8OIrKUbwFjEV0zPjHhH8KbF2rfOWWXCm95Fz
X-Gm-Message-State: AOJu0YxFmv+TQI+WxhGinS7rhIy0raM9PqpGmNnTx9DcgGuWWa7oEigI
	NrJ+KhZdeA+jPsj3hatJK5kws3aimyal8ERS1IAtYVOObqdX+fuU7HCX0TczYCk=
X-Google-Smtp-Source: AGHT+IGNe7+hcCK2Yu7QzpuHAbzpCXHusHTOSP45V5t7RI6OE+y2MTETWng8kTxcKbvrNI+OJ4e74A==
X-Received: by 2002:a17:903:124f:b0:1e5:c131:ca0e with SMTP id u15-20020a170903124f00b001e5c131ca0emr1130620plh.6.1713988933046;
        Wed, 24 Apr 2024 13:02:13 -0700 (PDT)
Received: from localhost ([192.184.165.199])
        by smtp.gmail.com with ESMTPSA id w17-20020a1709027b9100b001e3e222072esm12301319pll.53.2024.04.24.13.02.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Apr 2024 13:02:12 -0700 (PDT)
Date: Wed, 24 Apr 2024 13:02:12 -0700 (PDT)
X-Google-Original-Date: Wed, 24 Apr 2024 13:02:10 PDT (-0700)
Subject: Re: [PATCH v3 RESEND] riscv: select ARCH_HAS_FAST_MULTIPLIER
In-Reply-To: <20240325105823.1483-1-jszhang@kernel.org>
CC: Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu,
  linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, samuel.holland@sifive.com,
  alexghiti@rivosinc.com
From: Palmer Dabbelt <palmer@dabbelt.com>
To: jszhang@kernel.org
Message-ID: <mhng-e1db5617-3379-4205-b502-22b05fb6d07c@palmer-ri-x1c9>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240424_130216_290087_A67CACA1 
X-CRM114-Status: GOOD (  29.60  )
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

On Mon, 25 Mar 2024 03:58:23 PDT (-0700), jszhang@kernel.org wrote:
> Currently, riscv linux requires at least IMA, so all platforms have a
> multiplier. And I assume the 'mul' efficiency is comparable or better
> than a sequence of five or so register-dependent arithmetic
> instructions. Select ARCH_HAS_FAST_MULTIPLIER to get slightly nicer
> codegen. Refer to commit f9b4192923fa ("[PATCH] bitops: hweight()
> speedup") for more details.
>
> In a simple benchmark test calling hweight64() in a loop, it got:
> about 14% performance improvement on JH7110, tested on Milkv Mars.
>
> about 23% performance improvement on TH1520 and SG2042, tested on
> Sipeed LPI4A and SG2042 platform.
>
> a slight performance drop on CV1800B, tested on milkv duo. Among all
> riscv platforms in my hands, this is the only one which sees a slight
> performance drop. It means the 'mul' isn't quick enough. However, the
> situation exists on x86 too, for example, P4 doesn't have fast
> integer multiplies as said in the above commit, x86 also selects
> ARCH_HAS_FAST_MULTIPLIER. So let's select ARCH_HAS_FAST_MULTIPLIER
> which can benefit almost riscv platforms.
>
> Samuel also provided some performance numbers:
> On Unmatched: 20% speedup for __sw_hweight32 and 30% speedup for
> __sw_hweight64.
> On D1: 8% speedup for __sw_hweight32 and 8% slowdown for
> __sw_hweight64.
>
> Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
> Reviewed-by: Samuel Holland <samuel.holland@sifive.com>
> Tested-by: Samuel Holland <samuel.holland@sifive.com>
> Reviewed-by: Alexandre Ghiti <alexghiti@rivosinc.com>
> ---
>  arch/riscv/Kconfig | 1 +
>  1 file changed, 1 insertion(+)
>
> Hi Palmer,
>
> Similar as the pgprot_nx patch, this patch missed two merge window too.
> Feel free to ask me questions if there's something need to be done from
> my side.

Sorry I missed these.  I know they look small and simple, but they're 
the sort of patches that have wide-reaching implications and thus just 
take a long time to review for a tiny diff.  I think they just got lost 
in the shuffle, luckily Alex and Andrea picked up some reviews which 
helps a ton.

Really the best thing to do if you stuff merged is to go review patches 
that are in front of you in the patchwork queue, as that's what blocks 
things from getting merged.  I know that's not the most fun of 
answers...

I picked these up for the tester, the code is pretty simple so hopefully 
everything's OK and they'll show up on for-next proper within a day.

>
> Thanks
>
> since v2:
>  - rebase on v6.8-rc1
>  - collect Reviewed-by and Tested-by tag
>
> since v1:
>  - fix typo in commit msg
>  - add some performance numbers provided by Samuel
>  - collect Reviewed-by and Tested-by tag
>
> diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> index be09c8836d56..aba42b2bf660 100644
> --- a/arch/riscv/Kconfig
> +++ b/arch/riscv/Kconfig
> @@ -23,6 +23,7 @@ config RISCV
>  	select ARCH_HAS_DEBUG_VIRTUAL if MMU
>  	select ARCH_HAS_DEBUG_VM_PGTABLE
>  	select ARCH_HAS_DEBUG_WX
> +	select ARCH_HAS_FAST_MULTIPLIER
>  	select ARCH_HAS_FORTIFY_SOURCE
>  	select ARCH_HAS_GCOV_PROFILE_ALL
>  	select ARCH_HAS_GIGANTIC_PAGE

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
