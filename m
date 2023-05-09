Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7CED7C77B75
	for <linux-riscv@archiver.kernel.org>; Tue,  9 May 2023 09:48:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uiLKk8hpFm2kKhBd4vYXPdYpH9p1k2H8AZ8rpvD2hv8=; b=zbQLAbdxYzKHCx
	tcZ9SsmqYmnrMMnbPDSffKh4B/mArl08OiqO6oEHIufoLxlJMKG5DLuCsug15Ft6wBhnECiR+U4/t
	1L/wlMl68RB/szCAjS0mbGSZWF/culRBqz/Uj/lkbgosjmpLgFjqqY1h7kSnWwTe8ynWQZRXrl/iv
	YEem9pGK+vsmB9VrX1owMA8ld98Oi0rw1JyVKXGgBOfMfe10Azg2vhqoHmSiuja1nSub87+fala+E
	47zAKuxMW94SsapcfW8FCHHdlCEX9sUEQVxTUXCkk5WE4WI8U0jCAoFwu2qdME72jn4G6SyGZjtn8
	m/BdPhH/fcO1qh7anQdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pwJxX-002mlI-1F;
	Tue, 09 May 2023 09:48:39 +0000
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pwJxT-002mkL-34
	for linux-riscv@lists.infradead.org;
	Tue, 09 May 2023 09:48:37 +0000
Received: by mail-ej1-x632.google.com with SMTP id a640c23a62f3a-965d2749e2eso756856766b.1
        for <linux-riscv@lists.infradead.org>; Tue, 09 May 2023 02:48:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1683625714; x=1686217714;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=+ssFb5TKrUxDuSwzgf3mFueyqkmtk+lVo5a7Efc/W2I=;
        b=ZN2Nc4KwU1Bj5BSAFhnaSB7vzpHs1RhygZN+XFGK6hQBeLnMiYwvwPAXnsYMiqJHcm
         p5Avtf3vt8Y4M1ljhuJY4Ln3gMYVG7jsegJ0RHNvxURf0hlpLwZueGcJGInAG8o/DEpx
         it6a0EUAy5fX5DjfyZ+qlO6ITrPw0whW+MWWfRWmNA+Rdx0XgpCVPzNndlG2EnyxycPT
         n/qx5p3EDi+udnGMqVQxfwTqIeuqo9wtrHkaGhTl36t8RDumMIFpAccz+H4xw3J0Xa4f
         tR5hRvEoLeSQd7RlB2rJF6Pz4xRdXkzxi/FXfrC0VcYNWsG1552WhKHK1SU8vXmFz6Vz
         VZbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683625714; x=1686217714;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+ssFb5TKrUxDuSwzgf3mFueyqkmtk+lVo5a7Efc/W2I=;
        b=QKnyX4gzPHLuPqZDplmUHGLFPba19g5+Pr6jNc+VLEB0h7oJyVAW6MijIZSAzspERs
         y+FZw34CaVHom5+p2JgrLydwyn5Z6mCmPFK0kFMQYru8o5FahwyyXjoMqEYLn5wzQj2P
         ssQCx0MkDM3cFbInbHM5Tacd/Y11fScjya67zhhnaGPtiu1P4c16j9Mq5STFxvQB1Dj/
         ykCNlQmlZEw6VrvEUbcpwzKcr6UvC4KQN/LNHrNpu+uMwqYeZvv4jdyUCT9uytGIf8AS
         T01Ma/F4zCFDQOdt7AhHBHNnJV9YbJwLxyvv7bZrFRyiha5JlVvv5FGTDhPhbHkPJCjk
         8n9A==
X-Gm-Message-State: AC+VfDzqps+aD9qp1JNEYWlXrbnZwEqfelQeULP3jmKgOB5a+ouRNTRX
	yBSODxYMH70NypAVCZNpkePqqA==
X-Google-Smtp-Source: ACHHUZ4csAwN4H1Mldb1yqeubVyBLjLh5qJMfW88DpJJEltr6uvpRCkmVOXq0ie/fCZXpf1YLvGLNg==
X-Received: by 2002:a17:907:a01:b0:94a:5d5c:fe6f with SMTP id bb1-20020a1709070a0100b0094a5d5cfe6fmr10679597ejc.47.1683625714394;
        Tue, 09 May 2023 02:48:34 -0700 (PDT)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
        by smtp.gmail.com with ESMTPSA id jx6-20020a170907760600b00958434d4ecesm1143737ejc.13.2023.05.09.02.48.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 May 2023 02:48:34 -0700 (PDT)
Date: Tue, 9 May 2023 11:48:33 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: zhangfei <zhang_fei_0403@163.com>
Cc: aou@eecs.berkeley.edu, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org, palmer@dabbelt.com, paul.walmsley@sifive.com, 
	zhangfei@nj.iscas.ac.cn, conor.dooley@microchip.com
Subject: Re: [PATCH 1/2] RISC-V: lib: Improve memset assembler formatting
Message-ID: <20230509-b76dc35d2a84d96806496c8e@orel>
References: <20230505-9ec599a36801972451e8b17f@orel>
 <20230509022207.3700-1-zhang_fei_0403@163.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230509022207.3700-1-zhang_fei_0403@163.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230509_024835_988709_CD81A755 
X-CRM114-Status: GOOD (  21.97  )
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

On Tue, May 09, 2023 at 10:22:05AM +0800, zhangfei wrote:
> From: Andrew Jones <ajones@ventanamicro.com>
> 
> Aligning the first operand of each instructions with a tab is a
> typical style which improves readability. Apply it to memset.S.
> While there, we also make a small grammar change to a comment.
> 
> No functional change intended.
> 
> Signed-off-by: Andrew Jones <ajones@ventanamicro.com>

Please pick up Conor's r-b on this reposting.

Thanks,
drew

> ---
>  arch/riscv/lib/memset.S | 143 ++++++++++++++++++++--------------------
>  1 file changed, 72 insertions(+), 71 deletions(-)
> 
> diff --git a/arch/riscv/lib/memset.S b/arch/riscv/lib/memset.S
> index 34c5360c6705..e613c5c27998 100644
> --- a/arch/riscv/lib/memset.S
> +++ b/arch/riscv/lib/memset.S
> @@ -3,111 +3,112 @@
>   * Copyright (C) 2013 Regents of the University of California
>   */
>  
> -
>  #include <linux/linkage.h>
>  #include <asm/asm.h>
>  
>  /* void *memset(void *, int, size_t) */
>  ENTRY(__memset)
>  WEAK(memset)
> -	move t0, a0  /* Preserve return value */
> +	move	t0, a0			/* Preserve return value */
>  
>  	/* Defer to byte-oriented fill for small sizes */
> -	sltiu a3, a2, 16
> -	bnez a3, 4f
> +	sltiu	a3, a2, 16
> +	bnez	a3, 4f
>  
>  	/*
>  	 * Round to nearest XLEN-aligned address
> -	 * greater than or equal to start address
> +	 * greater than or equal to the start address.
>  	 */
> -	addi a3, t0, SZREG-1
> -	andi a3, a3, ~(SZREG-1)
> -	beq a3, t0, 2f  /* Skip if already aligned */
> +	addi	a3, t0, SZREG-1
> +	andi	a3, a3, ~(SZREG-1)
> +	beq	a3, t0, 2f		/* Skip if already aligned */
> +
>  	/* Handle initial misalignment */
> -	sub a4, a3, t0
> +	sub	a4, a3, t0
>  1:
> -	sb a1, 0(t0)
> -	addi t0, t0, 1
> -	bltu t0, a3, 1b
> -	sub a2, a2, a4  /* Update count */
> +	sb	a1, 0(t0)
> +	addi	t0, t0, 1
> +	bltu	t0, a3, 1b
> +	sub	a2, a2, a4		/* Update count */
>  
>  2: /* Duff's device with 32 XLEN stores per iteration */
>  	/* Broadcast value into all bytes */
> -	andi a1, a1, 0xff
> -	slli a3, a1, 8
> -	or a1, a3, a1
> -	slli a3, a1, 16
> -	or a1, a3, a1
> +	andi	a1, a1, 0xff
> +	slli	a3, a1, 8
> +	or	a1, a3, a1
> +	slli	a3, a1, 16
> +	or	a1, a3, a1
>  #ifdef CONFIG_64BIT
> -	slli a3, a1, 32
> -	or a1, a3, a1
> +	slli	a3, a1, 32
> +	or	a1, a3, a1
>  #endif
>  
>  	/* Calculate end address */
> -	andi a4, a2, ~(SZREG-1)
> -	add a3, t0, a4
> +	andi	a4, a2, ~(SZREG-1)
> +	add	a3, t0, a4
>  
> -	andi a4, a4, 31*SZREG  /* Calculate remainder */
> -	beqz a4, 3f            /* Shortcut if no remainder */
> -	neg a4, a4
> -	addi a4, a4, 32*SZREG  /* Calculate initial offset */
> +	andi	a4, a4, 31*SZREG	/* Calculate remainder */
> +	beqz	a4, 3f			/* Shortcut if no remainder */
> +	neg	a4, a4
> +	addi	a4, a4, 32*SZREG	/* Calculate initial offset */
>  
>  	/* Adjust start address with offset */
> -	sub t0, t0, a4
> +	sub	t0, t0, a4
>  
>  	/* Jump into loop body */
>  	/* Assumes 32-bit instruction lengths */
> -	la a5, 3f
> +	la	a5, 3f
>  #ifdef CONFIG_64BIT
> -	srli a4, a4, 1
> +	srli	a4, a4, 1
>  #endif
> -	add a5, a5, a4
> -	jr a5
> +	add	a5, a5, a4
> +	jr	a5
>  3:
> -	REG_S a1,        0(t0)
> -	REG_S a1,    SZREG(t0)
> -	REG_S a1,  2*SZREG(t0)
> -	REG_S a1,  3*SZREG(t0)
> -	REG_S a1,  4*SZREG(t0)
> -	REG_S a1,  5*SZREG(t0)
> -	REG_S a1,  6*SZREG(t0)
> -	REG_S a1,  7*SZREG(t0)
> -	REG_S a1,  8*SZREG(t0)
> -	REG_S a1,  9*SZREG(t0)
> -	REG_S a1, 10*SZREG(t0)
> -	REG_S a1, 11*SZREG(t0)
> -	REG_S a1, 12*SZREG(t0)
> -	REG_S a1, 13*SZREG(t0)
> -	REG_S a1, 14*SZREG(t0)
> -	REG_S a1, 15*SZREG(t0)
> -	REG_S a1, 16*SZREG(t0)
> -	REG_S a1, 17*SZREG(t0)
> -	REG_S a1, 18*SZREG(t0)
> -	REG_S a1, 19*SZREG(t0)
> -	REG_S a1, 20*SZREG(t0)
> -	REG_S a1, 21*SZREG(t0)
> -	REG_S a1, 22*SZREG(t0)
> -	REG_S a1, 23*SZREG(t0)
> -	REG_S a1, 24*SZREG(t0)
> -	REG_S a1, 25*SZREG(t0)
> -	REG_S a1, 26*SZREG(t0)
> -	REG_S a1, 27*SZREG(t0)
> -	REG_S a1, 28*SZREG(t0)
> -	REG_S a1, 29*SZREG(t0)
> -	REG_S a1, 30*SZREG(t0)
> -	REG_S a1, 31*SZREG(t0)
> -	addi t0, t0, 32*SZREG
> -	bltu t0, a3, 3b
> -	andi a2, a2, SZREG-1  /* Update count */
> +	REG_S	a1,        0(t0)
> +	REG_S	a1,    SZREG(t0)
> +	REG_S	a1,  2*SZREG(t0)
> +	REG_S	a1,  3*SZREG(t0)
> +	REG_S	a1,  4*SZREG(t0)
> +	REG_S	a1,  5*SZREG(t0)
> +	REG_S	a1,  6*SZREG(t0)
> +	REG_S	a1,  7*SZREG(t0)
> +	REG_S	a1,  8*SZREG(t0)
> +	REG_S	a1,  9*SZREG(t0)
> +	REG_S	a1, 10*SZREG(t0)
> +	REG_S	a1, 11*SZREG(t0)
> +	REG_S	a1, 12*SZREG(t0)
> +	REG_S	a1, 13*SZREG(t0)
> +	REG_S	a1, 14*SZREG(t0)
> +	REG_S	a1, 15*SZREG(t0)
> +	REG_S	a1, 16*SZREG(t0)
> +	REG_S	a1, 17*SZREG(t0)
> +	REG_S	a1, 18*SZREG(t0)
> +	REG_S	a1, 19*SZREG(t0)
> +	REG_S	a1, 20*SZREG(t0)
> +	REG_S	a1, 21*SZREG(t0)
> +	REG_S	a1, 22*SZREG(t0)
> +	REG_S	a1, 23*SZREG(t0)
> +	REG_S	a1, 24*SZREG(t0)
> +	REG_S	a1, 25*SZREG(t0)
> +	REG_S	a1, 26*SZREG(t0)
> +	REG_S	a1, 27*SZREG(t0)
> +	REG_S	a1, 28*SZREG(t0)
> +	REG_S	a1, 29*SZREG(t0)
> +	REG_S	a1, 30*SZREG(t0)
> +	REG_S	a1, 31*SZREG(t0)
> +
> +	addi	t0, t0, 32*SZREG
> +	bltu	t0, a3, 3b
> +	andi	a2, a2, SZREG-1		/* Update count */
>  
>  4:
>  	/* Handle trailing misalignment */
> -	beqz a2, 6f
> -	add a3, t0, a2
> +	beqz	a2, 6f
> +	add	a3, t0, a2
>  5:
> -	sb a1, 0(t0)
> -	addi t0, t0, 1
> -	bltu t0, a3, 5b
> +	sb	a1, 0(t0)
> +	addi	t0, t0, 1
> +	bltu	t0, a3, 5b
>  6:
>  	ret
>  END(__memset)
> -- 
> 2.33.0
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
