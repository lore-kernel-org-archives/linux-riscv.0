Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2471CC6FA8F
	for <linux-riscv@archiver.kernel.org>; Tue, 29 Aug 2023 19:05:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JP2ADZkvQRNyoeeZEitHxQ8gndC1993fhSbXBvUrpsk=; b=Uj9fFYS6nTsdLU
	f2J29YPmqHYH7yQoasorrMxfPmLlgxlgUP8MFcDkNW3U6rU7kCpSGDwWs59zlVSVB9i/FewdTsAaN
	w0ooUrJSyz1v+JQ5XlprfP5LyfPLJGnzyBqDlDIoOhiJDyQvShq+6nQm5uQZ20u6EU6aDBLeU2NYR
	OURK7xsSyeZvjOYRacgZYj/BlCE4LzMWorxf96r+u9YCCQew2++6LejdmXBOuSg5C+QbTK4A93s3w
	prGzgjyDhXaOyOZDBhfQCKwFC/u65sDE0/FTVCttHy2+B0Z71aY+bWTS+uoKo/Ln3Q2lIJNHb1ktU
	JsYCy30qfNuBmNPlt8FA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qb41O-00C6f2-2h;
	Tue, 29 Aug 2023 19:05:02 +0000
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qb41L-00C6db-1T
	for linux-riscv@lists.infradead.org;
	Tue, 29 Aug 2023 19:05:01 +0000
Received: by mail-pj1-x102c.google.com with SMTP id 98e67ed59e1d1-271b0a8e7ecso692566a91.3
        for <linux-riscv@lists.infradead.org>; Tue, 29 Aug 2023 12:04:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20221208.gappssmtp.com; s=20221208; t=1693335897; x=1693940697; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=EkhRA/lQC5h1Knqaf4HRNhdd9OJwWl6v8O5LTA25fgQ=;
        b=ZvuqHNPk87jYzIcEn9qTQbzg0AYjGqzTiTY2l4sMvlPZq8IaUj1AdSaQXOtRM/dZ85
         vb/hWPOTHFw7VnZ4eeZqqj/KvzE8SGoQ+aI6nklMVQYYBkbOEp30ovwvgAhUR/C89H5s
         dIaX4ltAZf9EM45f5DsSGEOzGUOK7z5jun2YZ2yfmjGn56ESwyaimTTt5CGlJ9jXmCSV
         wNs9ZdQBNaJ8LJsdCYUL7SyNt+hrUYWhYO4Ns7MTclnIIMaHID/yOA50HCtZL78TZLVv
         wjsKieyb3uEVOXd9g97zigtXAgbwLJPCEyoNqQKFqGGCZK46Kknmp6ePyfSchP0HHPWb
         oybQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693335897; x=1693940697;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EkhRA/lQC5h1Knqaf4HRNhdd9OJwWl6v8O5LTA25fgQ=;
        b=dMluPpa0/gvSzR+TZElrS8G5AQKnrXhJO3SUZlnLlURUr8Ozyeyb9V2R6updZUJuCv
         hYlDlzsjVN1coJSZYYwNovme4jS4K4V68Y5/kF0B3INLJXhDylZ0WN46NjorZa4Rgke1
         aNtxmyGnYKjRTzAWz3ENxo4HvBNrdCVOCnB2xd8WwehJE91j/qe6vvJ7URL34DfJ9QAD
         0/TUY7CkZZU24VqjpJQ3MAzEjdP/8w2d4gcDl6sFJ4hptvxcDTtpVDz+xbqY//9+TYEo
         lnqMRC3bosCvgd++ev8kdZF9aJAzJkasOvpIVrkJQDyDqvlWyjBkI69cYMNw+Ptqlw3z
         sBtA==
X-Gm-Message-State: AOJu0Yy67cLwLy2oYopQbDDBWzpTZJXvVgWpJ0miYXbbUhDBTiRvQ5k/
	DHVBcTdhhEHq6zLcQZ53FuaG2Q==
X-Google-Smtp-Source: AGHT+IEmWzR2EFRVld8dtFg6O30X0kJHSic7sbU0n0pIaph9jOGM2LqjeEEvBi7SdfgiWpDGjX3Tww==
X-Received: by 2002:a17:90a:e015:b0:270:1611:484b with SMTP id u21-20020a17090ae01500b002701611484bmr105814pjy.41.1693335896703;
        Tue, 29 Aug 2023 12:04:56 -0700 (PDT)
Received: from ghost ([50.221.140.188])
        by smtp.gmail.com with ESMTPSA id gd9-20020a17090b0fc900b0026d034f6badsm9189710pjb.38.2023.08.29.12.04.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Aug 2023 12:04:56 -0700 (PDT)
Date: Tue, 29 Aug 2023 12:04:53 -0700
From: Charlie Jenkins <charlie@rivosinc.com>
To: Nam Cao <namcaov@gmail.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org, guoren@kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH] riscv: kprobes: allow writing to x0
Message-ID: <ZO5BVWFbAwXLf0WS@ghost>
References: <20230829182500.61875-1-namcaov@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230829182500.61875-1-namcaov@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230829_120459_695782_C43A4E8D 
X-CRM114-Status: GOOD (  20.67  )
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

On Tue, Aug 29, 2023 at 08:25:00PM +0200, Nam Cao wrote:
> Instructions can write to x0, so we should simulate these instructions
> normally.
> 
> Currently, the kernel hangs if an instruction who writes to x0 is
> simulated.
> 
> Fixes: c22b0bcb1dd0 ("riscv: Add kprobes supported")
> Cc: stable@vger.kernel.org
> Signed-off-by: Nam Cao <namcaov@gmail.com>
> ---
>  arch/riscv/kernel/probes/simulate-insn.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/riscv/kernel/probes/simulate-insn.c b/arch/riscv/kernel/probes/simulate-insn.c
> index d3099d67816d..6c166029079c 100644
> --- a/arch/riscv/kernel/probes/simulate-insn.c
> +++ b/arch/riscv/kernel/probes/simulate-insn.c
> @@ -24,7 +24,7 @@ static inline bool rv_insn_reg_set_val(struct pt_regs *regs, u32 index,
>  				       unsigned long val)
>  {
>  	if (index == 0)
> -		return false;
> +		return true;
>  	else if (index <= 31)
>  		*((unsigned long *)regs + index) = val;
>  	else
> -- 
> 2.34.1
> 
> 
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv
Thank you for this change. 

simulate_auipc would previously fail with an rd = 0 which made sense
because auipc it is defined as a HINT in the riscv spec when rd = 0,
but QEMU and spike don't say it is an illegal instruction so I think
it is okay to make this change.

Reviewed-by: Charlie Jenkins <charlie@rivosinc.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
