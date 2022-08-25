Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C992C04AA5
	for <linux-riscv@archiver.kernel.org>; Thu, 25 Aug 2022 10:56:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sF+lMj6bOcAj+/zqyomrrI8Ath0dGa1ZDhmD2vP2nh0=; b=Eq8345rMB20MU3
	ouCI8JHGAeI9cDqww77p2eKwffD92th0rEOyq6/3mWiML0W9bCZbvou+9YSsTKBOzwJVezGAV+dVc
	RevFz+OMjlNIl5Sv8LUPwsPuvgxwtZhoDDZx33nUcuo7nuv/NqypxPqwproJLMYrYflPNQlYQpSHv
	k5aMAe9HaaeUxIGwjgPd7hC88xys9Dq9qAo10Xhjun++1XrtfpZe7eBWwI0284no+7NA8msO9cKrE
	aJAi0+M/bj9I6CUMzUgnM9dh+efH7UgRSktEcjRq3yPzW4/0fQ4rdviPga+Y0e6ERY5+HLOHg2J46
	I1UFLDXz66R7VX7pnS4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oRAWv-00C9JH-PM; Thu, 25 Aug 2022 10:56:09 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oRAWq-00C95z-Im
	for linux-riscv@lists.infradead.org; Thu, 25 Aug 2022 10:56:08 +0000
Received: by mail-wr1-x431.google.com with SMTP id az27so4085795wrb.6
        for <linux-riscv@lists.infradead.org>; Thu, 25 Aug 2022 03:56:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc;
        bh=dQ5qxruqxh3KGlaUc7JkBGn3OziOOUhgI201fMCzvDs=;
        b=lji9Dlw9/DT4OUH/CFvf/ZgGEOntsizxLFo6C1pjQIwXS5g3/Gd8db2EiO0qcQGDSZ
         FCCUrh+fCVLHxkV7QCxpZRmMU4ZZJejQpZWvVSFbQ5NIKX8VaOv8hpGMjrO0+uuLmmNz
         ToZU7pUVeAV6cnSOcd8RAOeQsG3drNGlkXGht6T2/o0koMAD/OtvAvfS2EvYSAnNsgew
         9M02148CkoJ1QZJcYGTOKAd7j534B3VmQgqaonceW79f1whJU752HEZATPwFJ2baYBOE
         Uil3PTom28+zPUlFfDDxYAfm3qjapKKZHYKvKttketV+G2yMKolYcRWyoZMSceyXOj8v
         ItZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc;
        bh=dQ5qxruqxh3KGlaUc7JkBGn3OziOOUhgI201fMCzvDs=;
        b=O0x0XL6i61QFWuxex/iJWQ0MMLPCCu1ejpXEx/HD92sXnW6DeOyhKw72aBUPcUWScD
         w8F/OZJp6ELe2pHIY9r36UUFWFZml+kOTB8acY7qy1jbjwE+hmSrM/narTGNqjgXM8uv
         Etgf7gSr4D671GvxwQ+xXvQ3Zaupz7SLCoqLAUrQ0QXCe8HL5q+bthSomB9SxlV0rLuQ
         fWw7Y9qx1NDmKEvXDG12vFlDgculFoz5b+3pz4DfMEBfLq5MqPe/2LbJqCSGg1tZUl6x
         D2UaP2DzsWhXv9hzzy+Q/2h4P141whM1655whpeTmIlB2c32nEqOyyk6J9pavnVMbMbn
         5CLw==
X-Gm-Message-State: ACgBeo0tlF+xx0L8krw0oV4M74230DlKXAmnZOY4etgqGEfL65eiYLCC
	v+E0dCGXkA/tDwlgANIyeyDiOw==
X-Google-Smtp-Source: AA6agR7VRGSOjNnHjALlK2/vuTSmeZeoEQ/oNbpPf07thckXdKCJDvdqECp5OgqhKAAGq/RFu6s7Ag==
X-Received: by 2002:a05:6000:2a3:b0:225:7ce8:a318 with SMTP id l3-20020a05600002a300b002257ce8a318mr1294505wry.350.1661424962454;
        Thu, 25 Aug 2022 03:56:02 -0700 (PDT)
Received: from localhost (cst2-173-67.cust.vodafone.cz. [31.30.173.67])
        by smtp.gmail.com with ESMTPSA id u11-20020a05600c210b00b003a531c7aa66sm4816868wml.1.2022.08.25.03.56.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Aug 2022 03:56:01 -0700 (PDT)
Date: Thu, 25 Aug 2022 12:56:00 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Tong Tiangen <tongtiangen@huawei.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Palmer Dabbelt <palmer@rivosinc.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Conor.Dooley@microchip.com,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	wangkefeng.wang@huawei.com, Guohanjun <guohanjun@huawei.com>
Subject: Re: [PATCH -next v2 1/2] riscv: uaccess: rename
 __get/put_user_nocheck to __get/put_mem_nocheck
Message-ID: <20220825105600.ezueddmwehob42rf@kamzik>
References: <20220815032025.2685516-1-tongtiangen@huawei.com>
 <20220815032025.2685516-2-tongtiangen@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220815032025.2685516-2-tongtiangen@huawei.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220825_035604_661081_829708DA 
X-CRM114-Status: GOOD (  17.74  )
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

On Mon, Aug 15, 2022 at 03:20:24AM +0000, Tong Tiangen wrote:
> Current, The helpers __get/put_user_nocheck() is used by get/put_user() and
> __get/put_kernel_nofault(), which is not always uaccess, so the name with
> *user* is not appropriate.
> 
> Also rename xxx_user_xxx to xxx_mem_xx  on the call path of
> __get/put_user_nocheck()
> 
> Only refactor code without any functional changes.
> 
> Signed-off-by: Tong Tiangen <tongtiangen@huawei.com>
> ---
>  arch/riscv/include/asm/uaccess.h | 48 ++++++++++++++++----------------
>  1 file changed, 24 insertions(+), 24 deletions(-)
> 
> diff --git a/arch/riscv/include/asm/uaccess.h b/arch/riscv/include/asm/uaccess.h
> index 855450bed9f5..1370da055b44 100644
> --- a/arch/riscv/include/asm/uaccess.h
> +++ b/arch/riscv/include/asm/uaccess.h
> @@ -50,7 +50,7 @@
>   * call.
>   */
>  
> -#define __get_user_asm(insn, x, ptr, err)			\
> +#define __get_mem_asm(insn, x, ptr, err)			\
>  do {								\
>  	__typeof__(x) __x;					\
>  	__asm__ __volatile__ (					\
> @@ -64,12 +64,12 @@ do {								\
>  } while (0)
>  
>  #ifdef CONFIG_64BIT
> -#define __get_user_8(x, ptr, err) \
> -	__get_user_asm("ld", x, ptr, err)
> +#define __get_mem_8(x, ptr, err) \
> +	__get_mem_asm("ld", x, ptr, err)
>  #else /* !CONFIG_64BIT */
> -#define __get_user_8(x, ptr, err)				\
> +#define __get_mem_8(x, ptr, err)				\
>  do {								\
> -	u32 __user *__ptr = (u32 __user *)(ptr);		\
> +	u32 *__ptr = (u32 *)(ptr);				\

Doesn't casting away __user reduce sparse's utility?

>  	u32 __lo, __hi;						\
>  	__asm__ __volatile__ (					\
>  		"1:\n"						\
> @@ -88,20 +88,20 @@ do {								\
>  } while (0)
>  #endif /* CONFIG_64BIT */
>  
> -#define __get_user_nocheck(x, __gu_ptr, __gu_err)		\
> +#define __get_mem_nocheck(x, __gu_ptr, __gu_err)		\

The patch replaces all get/put_user instances with get/put_mem,
but what about 'gu' and 'pu' instances (which are presumably short
for get/put_user)?

Thanks,
drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
