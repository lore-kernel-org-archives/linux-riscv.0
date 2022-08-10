Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DAA01C00140
	for <linux-riscv@archiver.kernel.org>; Wed, 10 Aug 2022 22:02:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=5BeOIlhZCwywP5qwO6qS5o9mz/3g5ZHmaHtL5Tc1KMs=; b=zUgaPJEV9rKTIaVJgWPHdR2YER
	K8ajukX85AZ4/TBlM2+jJ5W14COBb5sVH/yyfRWwL2lHbujIRRRwXTTFuR/LfY41WmBiL6iuLpsPd
	fyBQSjeMiHZ5266u/XaTSObYA+gDpRGBWnDtodMt5jrW+oJ1NiCfLYEk9tEVuDRCIRtrLxCyvk9F1
	bXZqCEbg3HJj/GZjuAl+uNjxfcgxvvjk2ywBiVoISmnBH/dV3IvJh+egRGc8EZ0dxq+x+2CE0ub7d
	3RKYmMqNhrOtQhyLMii7ICUQPBokE2RiT61yeekoajlrmBafGksyVk1ToZHUfxH2u5C6YMO8L2JLC
	JINJJFrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oLtlq-00FZGo-CN; Wed, 10 Aug 2022 22:01:46 +0000
Received: from mail-pg1-x529.google.com ([2607:f8b0:4864:20::529])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oLtln-00FZAm-4S
	for linux-riscv@lists.infradead.org; Wed, 10 Aug 2022 22:01:45 +0000
Received: by mail-pg1-x529.google.com with SMTP id f11so15509772pgj.7
        for <linux-riscv@lists.infradead.org>; Wed, 10 Aug 2022 15:01:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc;
        bh=cXkIXWAtOObzXLLs0JK1VS3v3NYatO+E+AbHXcyxbO8=;
        b=epkd/T3Sdy5WWIAzTsY+RIvIBGCV2pdijlqKEcTRVkcZP2zB4m395tw25c0sfpf8Pf
         qySOZhCgTGtGPbmg5nxge5SjbUwEzi6dhMlwHjce9ku5R8wNIbMzI8Pvcu1vZGAKanyz
         aYcV5hO2V3gxd9Ac8QDwmdx1uOwnShq4GsxCHyeOCPxmTAd8y13dOhMKgRhUb5IeSqFY
         0dBLcoDpuc4l+jIg+MX8++iRWItA0wM1l5M+MHh01SoaLz58ZbLa03nofWSNTx5/5/HB
         GnHMfrV9a/7vzRi8sUbzLzxqDkbMspNbSaxg1kpYGxN1UcJ7a4nm0D09tro/3ICQqY8x
         Q7Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc;
        bh=cXkIXWAtOObzXLLs0JK1VS3v3NYatO+E+AbHXcyxbO8=;
        b=JmvxJq4pxqKYxp4gZ+0t9dFFqtd8xlhH2WUFvA85rfPR4XXcEFMizQY7OFf78coUK/
         c6V2cZYIcQ1vQw1pPMAq/B9kCxZ1/x2RSpASUb8R4abhoWm6hEKwi9h68fPevx/sQKbs
         h5WEZI0vaNJYbnMzmo9cSZ5f/rv1VAf8nC9zeAaO2xOM7ruFR8dojLMBbn/vqN4UbQDn
         kn3lpLcawC9WzRDsDpJ/gkyCDbkrgPA92DMVRRCBA/ZTQBzaRfFfJDidp7stMzh/guoM
         nJLNflwFagwvf/zJCLrUvW7M8R+Pfjw9oePR6ytwkUppSYKbBKu4dV/vcRKYSH0Dv16S
         U7Bg==
X-Gm-Message-State: ACgBeo1tyy5gaQ4XprDyayYdCNEBjLbDw/+gY+8ahCkntNvl207vl+/2
	A8TJKBO7tPFNegLhFj8ADIvQeg==
X-Google-Smtp-Source: AA6agR5tV2c8wULAW9sAh62jzI6dSdkw2SZ+vNp159CGu9SfmAaGbNovIy6f1pGSJm/qnAUDLQfAMg==
X-Received: by 2002:a65:6494:0:b0:419:9527:2a69 with SMTP id e20-20020a656494000000b0041995272a69mr24315484pgv.80.1660168899103;
        Wed, 10 Aug 2022 15:01:39 -0700 (PDT)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net. [76.210.143.223])
        by smtp.gmail.com with ESMTPSA id y8-20020a634948000000b004129741dd9dsm10228669pgk.51.2022.08.10.15.01.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Aug 2022 15:01:38 -0700 (PDT)
Date: Wed, 10 Aug 2022 15:01:38 -0700 (PDT)
X-Google-Original-Date: Wed, 10 Aug 2022 14:19:00 PDT (-0700)
Subject: Re: [PATCH -next] riscv: lib: uaccess: fix CSR_STATUS SR_SUM bit
In-Reply-To: <20220615014714.1650349-1-chenlifu@huawei.com>
CC: Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu,
  akira.tsukamoto@gmail.com, jszhang@kernel.org, wangkefeng.wang@huawei.com,
  linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, alankao@andestech.com, chenlifu@huawei.com
From: Palmer Dabbelt <palmer@dabbelt.com>
To: chenlifu@huawei.com
Message-ID: <mhng-a84e0f82-f7c1-4f91-9cc1-70e3dd9d7e4e@palmer-mbp2014>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220810_150143_371832_C48AE992 
X-CRM114-Status: GOOD (  18.15  )
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

On Tue, 14 Jun 2022 18:47:14 PDT (-0700), chenlifu@huawei.com wrote:
> Since commit 5d8544e2d007 ("RISC-V: Generic library routines and assembly")
> and commit ebcbd75e3962 ("riscv: Fix the bug in memory access fixup code"),
> if __clear_user and __copy_user return from an fixup branch,
> CSR_STATUS SR_SUM bit will be set, it is a vulnerability, so that
> S-mode memory accesses to pages that are accessible by U-mode will success.
> Disable S-mode access to U-mode memory should clear SR_SUM bit.
>
> Fixes: 5d8544e2d007 ("RISC-V: Generic library routines and assembly")
> Fixes: ebcbd75e3962 ("riscv: Fix the bug in memory access fixup code")
>
> Signed-off-by: Chen Lifu <chenlifu@huawei.com>
> ---
>  arch/riscv/lib/uaccess.S | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/arch/riscv/lib/uaccess.S b/arch/riscv/lib/uaccess.S
> index 8c475f4da308..ec486e5369d9 100644
> --- a/arch/riscv/lib/uaccess.S
> +++ b/arch/riscv/lib/uaccess.S
> @@ -173,11 +173,11 @@ ENTRY(__asm_copy_from_user)
>  	ret
>
>  	/* Exception fixup code */
>  10:
>  	/* Disable access to user memory */
> -	csrs CSR_STATUS, t6
> +	csrc CSR_STATUS, t6
>  	mv a0, t5
>  	ret
>  ENDPROC(__asm_copy_to_user)
>  ENDPROC(__asm_copy_from_user)
>  EXPORT_SYMBOL(__asm_copy_to_user)
> @@ -225,10 +225,10 @@ ENTRY(__clear_user)
>  	j 3b
>
>  	/* Exception fixup code */
>  11:
>  	/* Disable access to user memory */
> -	csrs CSR_STATUS, t6
> +	csrc CSR_STATUS, t6
>  	mv a0, a1
>  	ret
>  ENDPROC(__clear_user)
>  EXPORT_SYMBOL(__clear_user)

Thanks, this is on for-next (still for 5.20).

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
