Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59B5AD6A248
	for <linux-riscv@archiver.kernel.org>; Thu, 14 Nov 2024 22:09:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PK+CU2+eHffUwV4ub8RxBbFlVTTDkSZItdY714O9U2I=; b=vseDrAp6w8lNnC
	S5LuHogN+hEXyr/MBtO8+/6lLXRAKj3RvKk7wSF3RF6Ph8ohP4dIaIXG2Ua/s82afhJkocYXigIBO
	lI+eVB/bGThAc6q1dTpIA5cAruhF2YekyNRr4+rLey9QrxC5PeKRx05D6i5+7zOUJxnbVdnSNlZrl
	XfKDLzPvC/5luCklBH23DNHrK6HtOkNfRQ9gmcQmo3leSZGGeblTLBC98LkWVsR7tRXXUlyVo4sZG
	8oJJuVv+i9fA1a9CaFSYvsBQKvMA3YXjMOSBvBTyeNPpFe/nWu5xbkBBM6OX76HtjJ6GApbNurTeH
	8D6/JVZpZxnNWI1omegQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tBi1H-00000000xE6-0ST6;
	Thu, 14 Nov 2024 22:08:55 +0000
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tBi1E-00000000xDj-3Biz
	for linux-riscv@lists.infradead.org;
	Thu, 14 Nov 2024 22:08:54 +0000
Received: by mail-pf1-x436.google.com with SMTP id d2e1a72fcca58-7242f559a9fso1100951b3a.1
        for <linux-riscv@lists.infradead.org>; Thu, 14 Nov 2024 14:08:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1731622131; x=1732226931; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=xUDNvzxgF3VndexH2nVKPNcxZzxJAzZDJlThFbFobgE=;
        b=WDQeb3kO9DaleatKmJukgDlF9lqJQV2moRXFZA3K41WxDrod0SfxnCXXMalUSAuEob
         sgs8RrWdS466ID7UI1h16YQn9a5pKTWjrSxFYQnAv27R/3FB+T0L9hy/21PjlNlm1ICy
         yQcL3hDtSgj10iB5X4BRW7jCXQFJ8E5UcrupVxNqWSuR/odjkvJiVy5PyKkRMIROfTmE
         fjI9kPQ/3EoHUxcqO3zhjWCZbxoB8U7KUZXwQcnk6/jgSSzFH+XFXfdW2qAZZiH7ZuXy
         bI/kgUcniJn6DRz4tID+NnEDt3G/0tOkNveP3QdiddQTIrrgbOL7Lk6dyMX7AesqYL/E
         a+oQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731622131; x=1732226931;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xUDNvzxgF3VndexH2nVKPNcxZzxJAzZDJlThFbFobgE=;
        b=rjAkHszhOCGFFiCmdMuT0V5Yo4gmpCtA1VzDrsry2cJLYOvRlNuZSDvXMhXc4LSSX1
         MUxzggBJ8IRq3zjVV3CqwqIU45Y3w1ng2zcMvNtiPWMpz0Td3NFCnSCWgTHbeSaSQdVZ
         frB4KOS97vaAT/V5cBIWTgFD5CzbRhPQkqM36+XoPC41RTVKnGi1NrmKkjMlUjlw3g9J
         GJKk5AzCBVbVx1t8fYS9lUAyjk7FxqvzShlAQbWu1I++hfysShHbIvHikX6UUpJ+Nw/q
         CMnEhI1PztSqai+Afvz5+CQx6+6m+X/LBABIhRPGf7+1HKw3lLDKQwb4MRiaYbUvPwGY
         bX5g==
X-Forwarded-Encrypted: i=1; AJvYcCUmGIN2Fa8fYLpUSKhhQkS/8ff/jnJZcQsKCUwfSuUbRM0tWyTmgImfHWVJqmctgWuG9Avu/Jhhagmlow==@lists.infradead.org
X-Gm-Message-State: AOJu0YwbQsHPve1CpqXkAZ2raQz14gYPmLyQIf5FYDeIxSWMSp8pWOpp
	cceMV1Ydat8hzqzIHS37XCDY1AGlLutwDMu5un4DKjHRZjePAquQmOoGcheItRw=
X-Google-Smtp-Source: AGHT+IFYyHyPSValRNfz1mg6pjq8qNxWBVPCofM9xYXccK+5syKbhxhGgqPtxHsSDUH+ph5ZigbeKg==
X-Received: by 2002:a05:6a00:3905:b0:71e:5a1d:ecdc with SMTP id d2e1a72fcca58-72476d17636mr525035b3a.17.1731622130787;
        Thu, 14 Nov 2024 14:08:50 -0800 (PST)
Received: from ghost ([2601:647:6700:64d0:8011:b5fc:6663:cd73])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7247711cdfbsm132024b3a.58.2024.11.14.14.08.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Nov 2024 14:08:50 -0800 (PST)
Date: Thu, 14 Nov 2024 14:08:47 -0800
From: Charlie Jenkins <charlie@rivosinc.com>
To: Chin Yik Ming <yikming2222@gmail.com>
Cc: palmer@dabbelt.com, paul.walmsley@sifive.com, aou@eecs.berkeley.edu,
	alexghiti@rivosinc.com, samuel.holland@sifive.com,
	parri.andrea@gmail.com, atishp@rivosinc.com,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] riscv: Fix a comment typo in set_mm_asid()
Message-ID: <ZzZ072CMku0fsW2x@ghost>
References: <20241114212725.4172401-1-yikming2222@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20241114212725.4172401-1-yikming2222@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241114_140853_061268_44855F75 
X-CRM114-Status: GOOD (  16.18  )
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

On Fri, Nov 15, 2024 at 05:27:25AM +0800, Chin Yik Ming wrote:
> s/verion/version
> 
> Signed-off-by: Chin Yik Ming <yikming2222@gmail.com>
> ---
>  arch/riscv/mm/context.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/riscv/mm/context.c b/arch/riscv/mm/context.c
> index 4abe3de23225..55c20ad1f744 100644
> --- a/arch/riscv/mm/context.c
> +++ b/arch/riscv/mm/context.c
> @@ -158,7 +158,7 @@ static void set_mm_asid(struct mm_struct *mm, unsigned int cpu)
>  	 *
>  	 * - We get a zero back from the cmpxchg and end up waiting on the
>  	 *   lock. Taking the lock synchronises with the rollover and so
> -	 *   we are forced to see the updated verion.
> +	 *   we are forced to see the updated version.
>  	 *
>  	 * - We get a valid context back from the cmpxchg then we continue
>  	 *   using old ASID because __flush_context() would have marked ASID
> -- 
> 2.34.1
> 

Thanks,

Reviewed-by: Charlie Jenkins <charlie@rivosinc.com>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
