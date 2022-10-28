Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C185C38A02
	for <linux-riscv@archiver.kernel.org>; Fri, 28 Oct 2022 14:53:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kEDh5u7TOzHkYCGi9TxEmbWcYWEnHS+DWVwdM+/ZIN8=; b=Cf3tgwBFARE3oH
	cxvAVs+UKKaCRRJI6CAJJpQ3zg+kVfYYYK6H2uoeZEfFLCDZdWS5C3kmOeF+2nvlP8HpqMX4QZy3H
	Df5BroMrYTx56KVkVA6E3/XKlejDZjjaXSKay3SUhBUt6wEK7clyD5ddE+ZXbUmlya/jDEFc0NOD9
	UoU6DUpez+5XScYQz1E0egjtz52ZE/gsQ6KRbeg5bcnh9Q+IonUi/LRi6esV/r3nzWP/jOZYkE2al
	4wOOPVQxsLREgM7qkFuzFOpaZgSdbPYDtCxcICgOKa2UifjW/36fXDHefHfKxqw+h8zLB2QvL3t9K
	tiQV3ukwRp4tKlA4amaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ooQjw-000HyD-1u; Fri, 28 Oct 2022 14:53:44 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ooQfr-000G23-R7
	for linux-riscv@lists.infradead.org; Fri, 28 Oct 2022 14:49:33 +0000
Received: by mail-wr1-x432.google.com with SMTP id y16so6870279wrt.12
        for <linux-riscv@lists.infradead.org>; Fri, 28 Oct 2022 07:49:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=5E4EIeOX0t4y7DdSn4WFUgwztRvSs7ahQaMWuzjdKTU=;
        b=ov7R81x03cnvgLNrRFSDCSi/vM34Jwq+cl4sdl4mUZ1qT54CnNxwIXIDwxm6wl0HZ+
         OEshVupgkDCCoWD90y1sYQRUfMabTxaIEkVqokPw4EN8OGYK1AVUDRMoLyjNUcSLsrg+
         BesKvD8vGNC6F1z+DUN84V7CHC7sCAWNAYEtM5mG61+tgoLVX2fM5QRFG2wYRb/INjwh
         rM5gis6INWbvP7Nb/b1xxocqBji1J7TYDvO34U36vvCY85IrbwnMUW4OW5n8KlEtw3h9
         Wmk+AV1aFOr4pjsanmJR3OqiWZG0uCUlA32uJTaZJsDgHgHpvCKCAfy+MsemAzYylgk0
         A19w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5E4EIeOX0t4y7DdSn4WFUgwztRvSs7ahQaMWuzjdKTU=;
        b=1/ESIUTdgUdnfTkOTpqR4i+NetTndMwBJBQ45+1jWO0awBUxG9EFm9HPNtyhqW++zP
         qzCHlch8UDFN1AWCxIPkhv7t1NgtzBtLzmio3zXcChXPY2KBZgeAr+QDWkFZYSMr77sZ
         MAGCEHRkjIayuqxG+sdVhxcioKiOGGLS+9TKUIUnEyftQGZENG9D7CjqRW3yH/niNr4b
         0QZAZZlvLRzG5+B/of+BIgQWwz25yq93jkBD1GIgnG2C6vwr36WOMV+1mm+294Rrji6h
         RYeRyECuJ5XamlqjYnsmxWu8GKS/xnqLiH1kqaR7nCNqxzK2uaZVJu7FgSRgc3nLQMFD
         DAog==
X-Gm-Message-State: ACrzQf39rd6NLWU7gjnyyk8+KpyNDXH+28QbEJdlQOL3KJEj47agTfpY
	QGwM2L2u1UMuWZEg9SIYRk4F/UejdUPN5A==
X-Google-Smtp-Source: AMsMyM6SP3fukh9zHOxX6cmRVpXrTpVJdwD6oWYt4z3U+IjdOHJkzyhnwaNLaTVD3CQwAvMQvKkehw==
X-Received: by 2002:a05:6000:1f8e:b0:236:86de:6fff with SMTP id bw14-20020a0560001f8e00b0023686de6fffmr11003140wrb.387.1666968567342;
        Fri, 28 Oct 2022 07:49:27 -0700 (PDT)
Received: from localhost (cst2-173-61.cust.vodafone.cz. [31.30.173.61])
        by smtp.gmail.com with ESMTPSA id n3-20020a5d6b83000000b00236644228besm3766217wrx.40.2022.10.28.07.49.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Oct 2022 07:49:26 -0700 (PDT)
Date: Fri, 28 Oct 2022 16:49:25 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Jamie Iles <jamie@jamieiles.com>
Cc: linux-riscv@lists.infradead.org
Subject: Re: [PATCH 2/4] RISC-V: reduce mcount save space on RV32
Message-ID: <20221028144925.3wfpsenrt7cql7yt@kamzik>
References: <20221027172435.2687118-1-jamie@jamieiles.com>
 <20221027172435.2687118-3-jamie@jamieiles.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221027172435.2687118-3-jamie@jamieiles.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221028_074931_920938_0FD98CDF 
X-CRM114-Status: GOOD (  16.15  )
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

On Thu, Oct 27, 2022 at 06:24:33PM +0100, Jamie Iles wrote:
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
> index 9cf0904afd6d..4166909ce7b3 100644
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

Shouldn't we only be adjusting sp by 2*SZREG?. Indeed RESTORE_ABI_STATE
below is getting modified that way.

>  
> @@ -25,24 +25,24 @@
>  	 * register if a0 was not saved.
>  	 */
>  	.macro SAVE_RET_ABI_STATE
> -	addi	sp, sp, -32
> -	REG_S	s0, 16(sp)
> -	REG_S	ra, 24(sp)
> -	REG_S	a0, 8(sp)
> +	addi	sp, sp, -4*SZREG
> +	REG_S	s0, 2*SZREG(sp)
> +	REG_S	ra, 3*SZREG(sp)
> +	REG_S	a0, 1*SZREG(sp)
>  	addi	s0, sp, 32

This should be 'addi s0, sp, -4*SZREG'

>  	.endm
>  
>  	.macro RESTORE_ABI_STATE
> -	REG_L	ra, 8(sp)
> -	REG_L	s0, 0(sp)
> -	addi	sp, sp, 16
> +	REG_L	ra, 1*SZREG(sp)
> +	REG_L	s0, 0*SZREG(sp)
> +	addi	sp, sp, 2*SZREG
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
> 2.34.1
>

Thanks,
drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
