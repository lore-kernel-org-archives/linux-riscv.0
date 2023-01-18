Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30530C32793
	for <linux-riscv@archiver.kernel.org>; Wed, 18 Jan 2023 15:10:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MSO6UB9E7EA+HWWFHbWLD4yvNBGAFW90mH+pp5Nww1Q=; b=oLUxhVtoRLfF+4
	OJNrimzB4ogLK1VEeJmo23UDCsQAfjiEvrJ0va0HweZfTS67e/W3t3t/sxKU3jjQk7OctM5pFSPcu
	WJTF+Fs3HKt5L35Y31AYnYd4gFM0WEhvzwlDaMojzxQ9LndhuDrUqnxKrgE47YwsGrKasiyVUrH1z
	iV/2l5PFjVaZsrM4h3fgp68sJebLqHELI9Y+SH3Ij2rOoNcx3DpgISrWB827v3NZNAcU/sLQ2eBoJ
	QwUX2wRQ8eQ9AMZVT+OnRQlpC+fbImlrMhtpkcdPey6Tagfi6VaCBrGYCAxqgfx3/Fmby39t8bVEC
	SI4Q5LxqK/gxjqzso2Gg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pIA57-001Vl0-Tb; Wed, 18 Jan 2023 15:10:29 +0000
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pIA55-001Vj5-8D
	for linux-riscv@lists.infradead.org; Wed, 18 Jan 2023 15:10:28 +0000
Received: by mail-wr1-x434.google.com with SMTP id b5so13096480wrn.0
        for <linux-riscv@lists.infradead.org>; Wed, 18 Jan 2023 07:10:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=8DFKlM2u04xyKKPkwUqpeT9TSNXQmJC+1RUsCNx2dvU=;
        b=b7gB2uu69QRp6U0Pm3lWW+xWSt+bhex573Mp53uRauxur25+LsahOKxt+tR2rYFgXK
         7zaBG9IxBKOtTebuuX3MetoV6XtuCV0CpzQnCPEyx5VZRg0tnNGssjiySlVAEIwF7QHy
         /K7CY4wWElKufR7N9VfOPbFiLPPCFmAC6NszHUyDrD9a3sYBaBii4zyIAZIV3h8NTGir
         SHjVN1M35P/JBpAoNd4roXEC5Yir06IvGXcnwDpZCq6/4a1N8CQ3L5a6ZP5RFBaxRryi
         gbATK7nYqho1XrbuzCqpOwCh61z7biAcFgRALElLWvd12LOcZtTbxGKFv9D9FF74Wn9w
         I/7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8DFKlM2u04xyKKPkwUqpeT9TSNXQmJC+1RUsCNx2dvU=;
        b=otDwViCsXA4B9GZV/hBk5ITieOqIRLD02HdmkAAeBhaDVuL54iCfLAIBUnYxIZyZfv
         VElz1ea3qkmrXHDn8tX5vA6V3HD3gIm8xzxs5MygG+zqRrOah5toCVnL1WfHZwvMGZ3M
         eeTDZq0url+0zsCqn6JDHAVXF7DMlzucJhviwZLtvszGSLFTNcwML5MfNvCJGJ3G8d47
         Nh5p3goegv+J7RDUVSXPN+QH8pE+IXzBF4W0HXUXoXm5kdivDB/LLhmoxAEoWXgXCYG7
         NMA9P5LMX5N/+9P2L1wFd+aBvnR4FhBwhjtrdjF/bZRk5YT5MvsvaDvqCPsddGSTASs7
         UB7w==
X-Gm-Message-State: AFqh2kqA3bkFMUuNi2DyRwgwcjjT5NoqThiJ4GSq4ZWHSufQp9rhCCHC
	AodDEdBRTYs6Q81Js8qRcBvlBA==
X-Google-Smtp-Source: AMrXdXtLJovmV5jhq7U+4CI5thVRYz7tgyUr1tPAc/RfXcK02exEVQM15YorTDHFwEzbs3ZLWuPrOw==
X-Received: by 2002:a05:6000:689:b0:2bd:ffad:1bce with SMTP id bo9-20020a056000068900b002bdffad1bcemr7258140wrb.59.1674054622713;
        Wed, 18 Jan 2023 07:10:22 -0800 (PST)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
        by smtp.gmail.com with ESMTPSA id a10-20020adfdd0a000000b002bb6b45ab57sm29570358wrm.85.2023.01.18.07.10.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Jan 2023 07:10:22 -0800 (PST)
Date: Wed, 18 Jan 2023 16:10:21 +0100
From: Andrew Jones <ajones@ventanamicro.com>
To: Heiko Stuebner <heiko@sntech.de>
Cc: linux-riscv@lists.infradead.org, palmer@dabbelt.com,
	christoph.muellner@vrull.eu, philipp.tomsich@vrull.eu,
	abrestic@rivosinc.com, Heiko Stuebner <heiko.stuebner@vrull.eu>
Subject: Re: [PATCH] RISC-V: Fix do_notify_resume / do_work_pending prototype
Message-ID: <20230118151021.2maa253t5c44z4si@orel>
References: <20230118142252.337103-1-heiko@sntech.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230118142252.337103-1-heiko@sntech.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230118_071027_310290_0A258744 
X-CRM114-Status: GOOD (  16.76  )
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

On Wed, Jan 18, 2023 at 03:22:52PM +0100, Heiko Stuebner wrote:
> From: Heiko Stuebner <heiko.stuebner@vrull.eu>
> 
> Commit b0f4c74eadbf ("RISC-V: Fix unannoted hardirqs-on in return to
> userspace slow-path") renamed the do_notify_resume function to
> do_work_pending but did not change the prototype in signal.h
> Do that now, as the original function does not exist anymore.
> 
> Fixes: b0f4c74eadbf ("RISC-V: Fix unannoted hardirqs-on in return to userspace slow-path")
> Signed-off-by: Heiko Stuebner <heiko.stuebner@vrull.eu>
> ---
>  arch/riscv/include/asm/signal.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/riscv/include/asm/signal.h b/arch/riscv/include/asm/signal.h
> index 532c29ef0376..956ae0a01bad 100644
> --- a/arch/riscv/include/asm/signal.h
> +++ b/arch/riscv/include/asm/signal.h
> @@ -7,6 +7,6 @@
>  #include <uapi/asm/ptrace.h>
>  
>  asmlinkage __visible
> -void do_notify_resume(struct pt_regs *regs, unsigned long thread_info_flags);
> +void do_work_pending(struct pt_regs *regs, unsigned long thread_info_flags);
>  
>  #endif
> -- 
> 2.39.0
> 

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
