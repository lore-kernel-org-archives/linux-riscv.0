Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB2F2C7EE23
	for <linux-riscv@archiver.kernel.org>; Sat, 29 Apr 2023 20:07:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:In-Reply-To:Subject:
	Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=Hl1DetIMSqb4+naG4uF2NZzU3Cc88aNOjLZu5tT+y6A=; b=4LFiB5wM9LAYA0/sRlMD94UEVw
	KAUt3VqVTnyb74ejyBvDg/o0KhAE3Bv7tSBOZunJ2d1PS1y++UcklCSothFpxHGmTRgVYAnRnejyN
	LShP4XcU1/aWo/7REbu9gHZ3XXa95IpJ4CkFLpXiUZXmodp3Lx3+dipsfQsq0G8D2tagzWgxOfKPg
	q7XBigo2YEXjUCopqMx0+R8D2cca3pu13QpoGKmwurhCoxi8uO2WF9F7p6kaywbyOzUq4a6cY38k2
	sUIYYdnrHgG6pMq+vQe9DG8l0Mw3rheK0kDro71ZcjISvwmqZ75pOCxXHWKR8NieO3/yPQ+ArRPME
	0ApfKZxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1psqqz-00D5Tq-0F;
	Sat, 29 Apr 2023 20:07:33 +0000
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1psqqv-00D5SV-1E
	for linux-riscv@lists.infradead.org;
	Sat, 29 Apr 2023 20:07:31 +0000
Received: by mail-pf1-x436.google.com with SMTP id d2e1a72fcca58-63b46186c03so1439780b3a.3
        for <linux-riscv@lists.infradead.org>; Sat, 29 Apr 2023 13:07:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20221208.gappssmtp.com; s=20221208; t=1682798845; x=1685390845;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=v42Z+4xBk6WHycNm2+Rc8kqKRamZqqwE3/PvX0dQE0w=;
        b=OgnDsZTo4WFQfb0mBwTGl2Gm8e4mJf0aNk/bWJH7Psec71MY6TqeuVMnPmFPb8w8A5
         f8qBiXhudFncs3+J/Z+uy6io79kLBPj/Z3Kd3qDerxomw0K2/sww4AM2rflXGJFxvAml
         yrtT9RXe7QNfdDd9MdBoiDZA2+V/STrGaF82wYQ9FmJ5iGCOzSrXCrPO+2XUPzMbjc7g
         aTaWz5IsKyIHfDiuXV06hE9WeNELTseBJVeL91qg/k7uGj/YmpWg7laHIsB1jm47JWXw
         6b7ojJJRtNKxpqOZhDNQsBuXSqYsR3yD9fYIkR58PflS49psLXtYaFTIRi35IQnStn90
         oMYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682798845; x=1685390845;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=v42Z+4xBk6WHycNm2+Rc8kqKRamZqqwE3/PvX0dQE0w=;
        b=F7swqjX1rqrw4/2qcyLKrZEhXB/spVKziDKz1XJeqB07r7qtfvGqp4cZJTUVfIW3tY
         1+cTNmY8FPJr61yK0NhPRK5gjUscIIr/erLXVLKvwZTF1FgAJ8pco/nQCh+MXQtOqc2T
         LQe/42I9hTyWUeNsDZml7BDkV+xZ50JfWGgBVcyttpllwgr6s+uDG+eInLjUahtY+jMd
         Iar5k46+8szvUrKizt4kXR+jqdBHSrvX4pYhSZtcU2CemMhD1YLRmq5OwCFGAR2w3+dw
         yVCmX9zDFLrqp4IG5AGJs5NLYKcQ5P/CbscNjVL8eM7QeHS0Rkck1p3dtXZHBwGzaMnG
         A5lw==
X-Gm-Message-State: AC+VfDz+ek6g2u1N8+NN/XOC3bu6Ei61hh0ELlxibi8EwzwjCYmir5M7
	QTdwzDvoUC5k8KCOQC+iO9FerQ==
X-Google-Smtp-Source: ACHHUZ4VPcgEpESvEx+CFIa4p4XLLQVkjugt7LPssPD8v9agZo0Un2kC8oEjV0etJAxuOYWpPKiCLA==
X-Received: by 2002:a05:6a21:3a48:b0:ec:707f:7dc7 with SMTP id zu8-20020a056a213a4800b000ec707f7dc7mr9880275pzb.33.1682798845635;
        Sat, 29 Apr 2023 13:07:25 -0700 (PDT)
Received: from localhost ([50.221.140.188])
        by smtp.gmail.com with ESMTPSA id c24-20020a17090ad91800b0023d0d50edf2sm16662431pjv.42.2023.04.29.13.07.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 Apr 2023 13:07:24 -0700 (PDT)
Date: Sat, 29 Apr 2023 13:07:24 -0700 (PDT)
X-Google-Original-Date: Sat, 29 Apr 2023 13:05:52 PDT (-0700)
Subject: Re: [PATCH 1/3] RISC-V: Add Zba extension probing
In-Reply-To: <20230428190609.3239486-2-evan@rivosinc.com>
From: Palmer Dabbelt <palmer@rivosinc.com>
To: Evan Green <evan@rivosinc.com>
Message-ID: <mhng-b5ad6600-acff-44ff-b4c0-ac22fc4f1eb0@palmer-ri-x1c9a>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230429_130729_591639_AC033C2A 
X-CRM114-Status: GOOD (  13.38  )
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
Cc: apatel@ventanamicro.com, aou@eecs.berkeley.edu, linux-kernel@vger.kernel.org, Conor Dooley <conor.dooley@microchip.com>, Evan Green <evan@rivosinc.com>, jszhang@kernel.org, Paul Walmsley <paul.walmsley@sifive.com>, daolu@rivosinc.com, heiko.stuebner@vrull.eu, linux-riscv@lists.infradead.org, ajones@ventanamicro.com
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Fri, 28 Apr 2023 12:06:06 PDT (-0700), Evan Green wrote:
> Add the Zba address bit manipulation extension into those the kernel is
> aware of and maintains in its riscv_isa bitmap.
>
> Signed-off-by: Evan Green <evan@rivosinc.com>
> ---
>
>  arch/riscv/include/asm/hwcap.h | 1 +
>  arch/riscv/kernel/cpu.c        | 1 +
>  arch/riscv/kernel/cpufeature.c | 1 +
>  3 files changed, 3 insertions(+)
>
> diff --git a/arch/riscv/include/asm/hwcap.h b/arch/riscv/include/asm/hwcap.h
> index 9af793970855..fa36db9281ab 100644
> --- a/arch/riscv/include/asm/hwcap.h
> +++ b/arch/riscv/include/asm/hwcap.h
> @@ -44,6 +44,7 @@
>  #define RISCV_ISA_EXT_ZIHINTPAUSE	32
>  #define RISCV_ISA_EXT_SVNAPOT		33
>  #define RISCV_ISA_EXT_ZICBOZ		34
> +#define RISCV_ISA_EXT_ZBA		35
>
>  #define RISCV_ISA_EXT_MAX		64
>  #define RISCV_ISA_EXT_NAME_LEN_MAX	32
> diff --git a/arch/riscv/kernel/cpu.c b/arch/riscv/kernel/cpu.c
> index 3df38052dcbd..2f85b1656557 100644
> --- a/arch/riscv/kernel/cpu.c
> +++ b/arch/riscv/kernel/cpu.c
> @@ -184,6 +184,7 @@ static struct riscv_isa_ext_data isa_ext_arr[] = {
>  	__RISCV_ISA_EXT_DATA(zicbom, RISCV_ISA_EXT_ZICBOM),
>  	__RISCV_ISA_EXT_DATA(zicboz, RISCV_ISA_EXT_ZICBOZ),
>  	__RISCV_ISA_EXT_DATA(zihintpause, RISCV_ISA_EXT_ZIHINTPAUSE),
> +	__RISCV_ISA_EXT_DATA(zba, RISCV_ISA_EXT_ZBA),
>  	__RISCV_ISA_EXT_DATA(zbb, RISCV_ISA_EXT_ZBB),
>  	__RISCV_ISA_EXT_DATA(sscofpmf, RISCV_ISA_EXT_SSCOFPMF),
>  	__RISCV_ISA_EXT_DATA(sstc, RISCV_ISA_EXT_SSTC),
> diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
> index 52585e088873..1a80474e308e 100644
> --- a/arch/riscv/kernel/cpufeature.c
> +++ b/arch/riscv/kernel/cpufeature.c
> @@ -233,6 +233,7 @@ void __init riscv_fill_hwcap(void)
>  				SET_ISA_EXT_MAP("svinval", RISCV_ISA_EXT_SVINVAL);
>  				SET_ISA_EXT_MAP("svnapot", RISCV_ISA_EXT_SVNAPOT);
>  				SET_ISA_EXT_MAP("svpbmt", RISCV_ISA_EXT_SVPBMT);
> +				SET_ISA_EXT_MAP("zba", RISCV_ISA_EXT_ZBA);
>  				SET_ISA_EXT_MAP("zbb", RISCV_ISA_EXT_ZBB);
>  				SET_ISA_EXT_MAP("zicbom", RISCV_ISA_EXT_ZICBOM);
>  				SET_ISA_EXT_MAP("zicboz", RISCV_ISA_EXT_ZICBOZ);

Reviewed-by: Palmer Dabbelt <palmer@rivosinc.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
