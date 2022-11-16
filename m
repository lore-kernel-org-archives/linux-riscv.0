Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3612BC4332F
	for <linux-riscv@archiver.kernel.org>; Wed, 16 Nov 2022 08:32:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZRL4qDfOuUxP/kygFE5NQS/nhvB5FGRwVpIDgSB1K/0=; b=Se8ZOduBvssjvN
	gVxQy8JsEZLPhklMZU1pB1MJdE9Vg/NObpT+glM4f33CuOJwbUXY65aBHHDSXoxVcQoEinWGHi8ZI
	BFDcC63Q5P1lUp/U/PAoGo3gPQKjw4cldg5oZm3ashzYN/VPAQGng1qqBJtLzg3e0YEeMw8E815Jg
	QQPavkd3MsQeEIxkpjwYenyaO0xKCzIzqf8MMsRqVYE2y3GvPOxDff3o860Y64ROUQVOtifcnmxsg
	fFKHoUJWojdlZdI4Ckion/LLyPFvOShyJ8XHhD4rx9mNTtZPeBivdHOf0w1W7INeXepJ2K4UthmAn
	W6dDeKCQ4qnGDNSvw/jg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ovDpo-001CjI-Vw; Wed, 16 Nov 2022 08:31:53 +0000
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ovDpm-001Ci8-Mt
	for linux-riscv@lists.infradead.org; Wed, 16 Nov 2022 08:31:52 +0000
Received: by mail-ed1-x52f.google.com with SMTP id v17so25448809edc.8
        for <linux-riscv@lists.infradead.org>; Wed, 16 Nov 2022 00:31:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=tS8PUv2BnXdj/e48EPdxYpNqnXeXFkcZc+zp8GU4rM8=;
        b=WxP/k5h0KFaDpNqAKuCbK/4RmL9nl6s8yMQBNSAoH4fVU3UefxYuMv9sFU4SD3uPrD
         IOdd/yQZI6bTsyxx06Gccek5A4Jp0iPV/3sXWxZKt3vjgxf4eMpNxRtE8Lu8I2znGDMO
         nQpx9tqXAsXa+efpxRxTSr+HpALmUHt081pEoq4uLcu3ymBx6o7BgPIkYFjraGESFuIX
         D7LQPRmh+0b8dW0KI2vJH6TfLXxlmiCoej4TNpHs2/7RoGawxl4mi7JKtP24ONau7geG
         v8l77g+Xp6oKkGjQvWP7fNYsuA8i0r0YWOTfjsA5gCmqPzp3ODHX3KTvK+cxO6yibAkU
         aenQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tS8PUv2BnXdj/e48EPdxYpNqnXeXFkcZc+zp8GU4rM8=;
        b=I5Iu/QJ0xXX88yysLScPW5Phv3T3rpOVAju1wVDHJ6uz+We4k5aZ5Csh/r56HFZgVQ
         TBV2fA1ChWpguc4lg/74bmeC2KJVeYBKrH1EjLZb1ZgDz8gi6fn0zeL8Yq3scMU6Ob7h
         jUBG6lmOfmJDtO3+CdjIMHjK7G4K4GI+wxT78rRSx70EvHlHUZKF18bFz3jPgilN/Fp4
         WGjychi/Xl1SYPGAi8RpLceQU/laECtYbOM9ASWfGNoe+61DmRuhvoxgYfbTqJkZabQU
         HrkPjEx23W6iBKFwzO8Yq42GKkJSc0BGux9Y8ya0zxFZHiEBk8Ksz2E7JfZGchwgEmSo
         kJuA==
X-Gm-Message-State: ANoB5plTj4/0K3PEiDWNsIHndxxbIqfyj7ZXDzTOw1+6wgDahgdH594+
	L87n9UgvjfFHu+7oC3qNxt72CDBJmdeV3g==
X-Google-Smtp-Source: AA0mqf50IR+d7SOS4t8Am3GEziCbduajoKVUKUkZeNsRhaYb9wrRUNXebL3jFpOHEfNq5scEK1l4XA==
X-Received: by 2002:aa7:cb0d:0:b0:463:ba10:9e2d with SMTP id s13-20020aa7cb0d000000b00463ba109e2dmr18134482edt.43.1668587508326;
        Wed, 16 Nov 2022 00:31:48 -0800 (PST)
Received: from localhost (cst2-173-16.cust.vodafone.cz. [31.30.173.16])
        by smtp.gmail.com with ESMTPSA id s26-20020a508d1a000000b0044e01e2533asm7236006eds.43.2022.11.16.00.31.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Nov 2022 00:31:48 -0800 (PST)
Date: Wed, 16 Nov 2022 09:31:46 +0100
From: Andrew Jones <ajones@ventanamicro.com>
To: Jamie Iles <jamie@jamieiles.com>
Cc: linux-riscv@lists.infradead.org
Subject: Re: [PATCH v2 2/4] RISC-V: reduce mcount save space on RV32
Message-ID: <20221116083146.w6g6sixfnmg7kr53@kamzik>
References: <20221115200832.706370-1-jamie@jamieiles.com>
 <20221115200832.706370-3-jamie@jamieiles.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221115200832.706370-3-jamie@jamieiles.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221116_003150_769303_5807DCF3 
X-CRM114-Status: GOOD (  18.71  )
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

On Tue, Nov 15, 2022 at 08:08:30PM +0000, Jamie Iles wrote:
> For RV32 we can reduce the size of the ABI save+restore state by using
> SZREG so that register stores are packed rather than on an 8 byte
> boundary.
> 
> Signed-off-by: Jamie Iles <jamie@jamieiles.com>
> ---
>  arch/riscv/kernel/mcount.S | 32 ++++++++++++++++----------------
>  1 file changed, 16 insertions(+), 16 deletions(-)
> 
> diff --git a/arch/riscv/kernel/mcount.S b/arch/riscv/kernel/mcount.S
> index 9cf0904afd6d..613bd07c6268 100644
> --- a/arch/riscv/kernel/mcount.S
> +++ b/arch/riscv/kernel/mcount.S
> @@ -15,8 +15,8 @@
>  
>  	.macro SAVE_ABI_STATE
>  	addi	sp, sp, -16
> -	REG_S	s0, 0(sp)
> -	REG_S	ra, 8(sp)
> +	REG_S	s0, 0*SZREG(sp)
> +	REG_S	ra, 1*SZREG(sp)
>  	addi	s0, sp, 16
>  	.endm
>  
> @@ -25,24 +25,24 @@
>  	 * register if a0 was not saved.
>  	 */
>  	.macro SAVE_RET_ABI_STATE
> -	addi	sp, sp, -32
> -	REG_S	s0, 16(sp)
> -	REG_S	ra, 24(sp)
> -	REG_S	a0, 8(sp)
> -	addi	s0, sp, 32
> +	addi	sp, sp, -4*SZREG
> +	REG_S	s0, 2*SZREG(sp)
> +	REG_S	ra, 3*SZREG(sp)
> +	REG_S	a0, 1*SZREG(sp)

I probably would have taken the opportunity to put these lines
in ascending order by offset, since it looks odd like this.

Anyway,

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>


> +	addi	s0, sp, 4*SZREG
>  	.endm
>  
>  	.macro RESTORE_ABI_STATE
> -	REG_L	ra, 8(sp)
> -	REG_L	s0, 0(sp)
> +	REG_L	ra, 1*SZREG(sp)
> +	REG_L	s0, 0*SZREG(sp)
>  	addi	sp, sp, 16
>  	.endm
>  
>  	.macro RESTORE_RET_ABI_STATE
> -	REG_L	ra, 24(sp)
> -	REG_L	s0, 16(sp)
> -	REG_L	a0, 8(sp)
> -	addi	sp, sp, 32
> +	REG_L	ra, 3*SZREG(sp)
> +	REG_L	s0, 2*SZREG(sp)
> +	REG_L	a0, 1*SZREG(sp)
> +	addi	sp, sp, 4*SZREG
>  	.endm
>  
>  ENTRY(ftrace_stub)
> @@ -101,10 +101,10 @@ ENTRY(MCOUNT_NAME)
>   * prepare_to_return(&ra_to_caller_of_caller, ra_to_caller)
>   */
>  do_ftrace_graph_caller:
> -	addi	a0, s0, -8
> +	addi	a0, s0, -SZREG
>  	mv	a1, ra
>  #ifdef HAVE_FUNCTION_GRAPH_FP_TEST
> -	REG_L	a2, -16(s0)
> +	REG_L	a2, -2*SZREG(s0)
>  #endif
>  	SAVE_ABI_STATE
>  	call	prepare_ftrace_return
> @@ -117,7 +117,7 @@ do_ftrace_graph_caller:
>   * (*ftrace_trace_function)(ra_to_caller, ra_to_caller_of_caller)
>   */
>  do_trace:
> -	REG_L	a1, -8(s0)
> +	REG_L	a1, -SZREG(s0)
>  	mv	a0, ra
>  
>  	SAVE_ABI_STATE
> -- 
> 2.37.2
> 
> 
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
