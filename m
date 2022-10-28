Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24476ECAAA1
	for <linux-riscv@archiver.kernel.org>; Fri, 28 Oct 2022 15:00:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QpUd3uogcUJHeUNPPiTtRIWorVxR/Aemz69R0Xo/3DI=; b=nE+Bo7WUSQCcUj
	rn0cF76vAz9kykFKsXNbmFwjvkkP+PVDDj5UM5UZZjMDLTeAIzYVAui6f6v9LRQZQ/Ey7bYKPEoAi
	OplCq4qEo8TNPDdzQTiNT2DwREzOEZ8RziXD/6Vup8xuK8EWX1JfuWVfJYqIHd6mkv8V9sWtUw7mn
	kP1Z/2BDPS9XzOuIsvuY/KBKHjUPcYyAp6HkwxHNzrNX3k1WGcjuHIlAqP9pdVn72W5+q/M4LmW9R
	3usRTgkkZEnDUIhUMwGfop+YjLecNblHz1hfZG6JD1i+01m2g70afT3JxUDdj7f0P9nsLt7Ch+Shk
	ZMwDu0rMpTMeZPUqLx3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ooQqE-000LLG-Nl; Fri, 28 Oct 2022 15:00:15 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ooQm0-000J9T-Ln
	for linux-riscv@lists.infradead.org; Fri, 28 Oct 2022 14:55:54 +0000
Received: by mail-wm1-x336.google.com with SMTP id az22-20020a05600c601600b003c6b72797fdso3993664wmb.5
        for <linux-riscv@lists.infradead.org>; Fri, 28 Oct 2022 07:55:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=SX+JvJZq8QGPyqpoVacSEIeJEec5gT1hzttfS2gt7E0=;
        b=XYpKgz1QErtgc6w+gyt1Q/k/qqw9GuEuk6jWgxmnaDDXJ0wDhyceSkPwkyEjiP/FI7
         pfUK3e3zBsv/TaHuD2paPAZY2x/z+d/YqcavEsQ+yasw57e8ldclp9ulTFHgt6AiF3DM
         butzDdkeSW0h7RGFDV0yCWrDZLGUR73rdOZbf3aMXGdCAdBrZMKplzrHP1idRMwVTEjo
         zdVx98voul/T3eG10GF/TyRa3/pA9u1MFrZYmpdj3SllQMlMvOzooYoNk2uD+g+vObcl
         uDnTB8GKyAu5TJtYbZFsdlWx8c50GCEaGyFtT17KD1JAVhbRZyIz6qhBlagzIRir+F99
         Tv1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SX+JvJZq8QGPyqpoVacSEIeJEec5gT1hzttfS2gt7E0=;
        b=uYLC2a3hQNVuRXqnJA6Mz+6umI6hXPejATU9kXWv2XwpOwdLXzq2YtZNvWQ6GVUJFA
         AQmJUdhn/d3AqSzk2C4jRHsGOYG9v6AZmhKGustlWZktBIwcGwpbGSzJZfY8YpGjsv8c
         1nbX9jgSHo1D1ygB3ERw/YU/i5SwJPjNMwxtkI8+VBizoC0S8A7Yz6DAWEWFH4TXhraU
         1RBd0PS37YARDYgvx0s8uV0BQ98AUBKAIAiihSJVIDKJsw6mnPr1E9LUb1j9E7yBVTD1
         767plhysdvmTNjxADKC0F3hAIl+OEsqeDFyafiqMNtTq/q/BUisxk0LYeLlwEsep7Nfp
         z1tQ==
X-Gm-Message-State: ACrzQf00g23vLCl53qR22R2vf7GK/pSE0ip5mYaIJbhn0vA+Xp6GWGpT
	XaZ7Rq4WXskc1pFMkC3bq4UHBmAy4AtVNQ==
X-Google-Smtp-Source: AMsMyM6YqhUqArATVcOpQ5nVJLtKSZmEMQ7bcEue8qAfdvNuTZBcNq69TAqGTeVj37aSOw3vAj1Kqg==
X-Received: by 2002:a1c:7c14:0:b0:3b5:1133:d2ed with SMTP id x20-20020a1c7c14000000b003b51133d2edmr9824633wmc.133.1666968948991;
        Fri, 28 Oct 2022 07:55:48 -0700 (PDT)
Received: from localhost (cst2-173-61.cust.vodafone.cz. [31.30.173.61])
        by smtp.gmail.com with ESMTPSA id d12-20020adfe88c000000b0022e3538d305sm4568452wrm.117.2022.10.28.07.55.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Oct 2022 07:55:48 -0700 (PDT)
Date: Fri, 28 Oct 2022 16:55:47 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Jamie Iles <jamie@jamieiles.com>
Cc: linux-riscv@lists.infradead.org
Subject: Re: [PATCH 3/4] RISC-V: preserve a1 in mcount
Message-ID: <20221028145547.37hl3473pw7lxfyv@kamzik>
References: <20221027172435.2687118-1-jamie@jamieiles.com>
 <20221027172435.2687118-4-jamie@jamieiles.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221027172435.2687118-4-jamie@jamieiles.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221028_075552_770046_B289BDFD 
X-CRM114-Status: GOOD (  16.06  )
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

On Thu, Oct 27, 2022 at 06:24:34PM +0100, Jamie Iles wrote:
> The RISC-V ELF psABI states that both a0 and a1 are used for return
> values so we should preserve them both in return_to_handler.  This is
> especially important for RV32 for functions returning a 64-bit quantity
> otherwise the return value can be corrupted and undefined behaviour
> results.
> 
> Signed-off-by: Jamie Iles <jamie@jamieiles.com>
> ---
>  arch/riscv/kernel/mcount.S | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/riscv/kernel/mcount.S b/arch/riscv/kernel/mcount.S
> index 4166909ce7b3..5aa29509f047 100644
> --- a/arch/riscv/kernel/mcount.S
> +++ b/arch/riscv/kernel/mcount.S
> @@ -29,6 +29,7 @@
>  	REG_S	s0, 2*SZREG(sp)
>  	REG_S	ra, 3*SZREG(sp)
>  	REG_S	a0, 1*SZREG(sp)
> +	REG_S	a1, 0*SZREG(sp)
>  	addi	s0, sp, 32
>  	.endm
>  
> @@ -42,6 +43,7 @@
>  	REG_L	ra, 3*SZREG(sp)
>  	REG_L	s0, 2*SZREG(sp)
>  	REG_L	a0, 1*SZREG(sp)
> +	REG_L	a1, 0*SZREG(sp)
>  	addi	sp, sp, 4*SZREG
>  	.endm
>  
> @@ -71,9 +73,9 @@ ENTRY(return_to_handler)
>  	mv	a0, t6
>  #endif
>  	call	ftrace_return_to_handler
> -	mv	a1, a0
> +	mv	a2, a0
>  	RESTORE_RET_ABI_STATE
> -	jalr	a1
> +	jalr	a2
>  ENDPROC(return_to_handler)
>  #endif
>  
> -- 
> 2.34.1
>


Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
