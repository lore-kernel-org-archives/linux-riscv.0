Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 708ABFA373D
	for <linux-riscv@archiver.kernel.org>; Tue,  1 Nov 2022 09:20:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ed0s47MC77vFuGwky8Y4QPxCCUzS0wgFd8TptgwRo6U=; b=oYPaJtUjbz69y8
	s8GrH4uGH1hpAlgdXfEWmIKs0rJs+MEKBFh4JO744FWQZuU7mXBUkTixiIAV/NAlmRHXIXm4NkeEY
	+H7f4xAgzewDnxGT4VwnInm3pDExE0qEIqHsGhLCVTrZ6v+yaekDlEZb2ew0VOF6QTCiWaDpMmwVC
	aXqa8OlT0vnFa/WIE5rLSl3P1upVikaoqhYyN1D7m9dzsE69e0mCP2OOATlD8p2/Wr/nDoB7OOq0m
	Q2HMCJNfE2nbioLm2hUZzzYFMVe34LWbC/K+tK/INGU7ES19RAruNr5m2G7dO4532/QeuQlUBK9Jf
	onf0WB6ypTY0qY/yoJ9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1opnR1-003a8M-F6; Tue, 01 Nov 2022 09:19:51 +0000
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1opnQy-003a5D-Eh
	for linux-riscv@lists.infradead.org; Tue, 01 Nov 2022 09:19:50 +0000
Received: by mail-ej1-x630.google.com with SMTP id k2so35566696ejr.2
        for <linux-riscv@lists.infradead.org>; Tue, 01 Nov 2022 02:19:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=VxyvqSqVgdx1tQ7y6vR7H8NyGf0tUg17P1dTi6A/S0o=;
        b=GhJRea2K0caG3PjN23EC9YGProjYnt8XRg9G98FhXcGu73m45ADaTnlZ+O8DMYtoRT
         0+9omFzWgO4xMFB8T1gh+ZYJsZB33pILRILOXX1F5jORf4izfFmpAHcuORXKnW6QEVTX
         ccK+La+6+MQ8ovXI342wiOV0RfOZvPu9XdSfrGLc0GApZHwbrDcnFDyEp6KS9AhaPVv0
         5y9J4A0Pig2nXrOJzXWJ9oppaJOf03fqJ5vcKTsc5+126tFy101sCjmT3qRRm2Acs8fs
         gqZdVLuLUWdxWU3FEW2RUAqqWJ+gELrsVy05k/iUEdSAR8CVpr5mx2XHa5jGZgzc5fmR
         jfPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VxyvqSqVgdx1tQ7y6vR7H8NyGf0tUg17P1dTi6A/S0o=;
        b=POBDzIH+9H2TdTh3OdcPsHAB4sU84uTVK4xa4CfZarlZbRaEkXpPaSshENCocBEowj
         aVKCwm/Ub+GRn51h337k0XH0pyY4deV8R3jY9U+a9EqDxF3Y2Pf4em7ldwvg8hNJcqKN
         Gd7wjWtAyy6rFmA+YP5synQznWuq7p/oShODha2Fh0jve4c66EWFjDEd3lpNq6LOqODW
         HGldyZJw9IwVmBUGS/Vz8thKN0O2QmuSonXdnTP+Xpg1u6MMHTArXxqjkumgDAMDfKvP
         3pw93RMppi1ziSMdlFnMc3bGVsJwUsQVuiZG8W7pPiBoldF2kzCCJg/5tZBhef7+s2fq
         p5Ng==
X-Gm-Message-State: ACrzQf3VoLC7YP2vtDe/+tIzmxWoBb8klCDotJEAjUO2FY24I35DB7Sj
	7pwkKZgvjtiOfnEQW4IXoLHUEA==
X-Google-Smtp-Source: AMsMyM6UmB2jz1VDu1dYoDIP9ZILO6Mqj1ZOS0mAf+fYqBqMX0BKVoXgTTu1f1ISVXGj7HOslRSU5g==
X-Received: by 2002:a17:906:99c1:b0:6fe:b01d:134 with SMTP id s1-20020a17090699c100b006feb01d0134mr17069970ejn.598.1667294384105;
        Tue, 01 Nov 2022 02:19:44 -0700 (PDT)
Received: from localhost (cst2-173-61.cust.vodafone.cz. [31.30.173.61])
        by smtp.gmail.com with ESMTPSA id x25-20020aa7d399000000b0045c010d0584sm4238587edq.47.2022.11.01.02.19.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Nov 2022 02:19:43 -0700 (PDT)
Date: Tue, 1 Nov 2022 10:19:42 +0100
From: Andrew Jones <ajones@ventanamicro.com>
To: Jisheng Zhang <jszhang@kernel.org>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Conor Dooley <conor.dooley@microchip.com>,
	kernel test robot <lkp@intel.com>
Subject: Re: [PATCH] riscv: vdso: fix section overlapping under some
 conditions
Message-ID: <20221101091942.k7pgcbbkudgjk4ae@kamzik>
References: <20221031175842.1699-1-jszhang@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221031175842.1699-1-jszhang@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221101_021948_524175_0924AEA7 
X-CRM114-Status: GOOD (  23.92  )
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

On Tue, Nov 01, 2022 at 01:58:42AM +0800, Jisheng Zhang wrote:
> lkp reported a build error, I tried the config and can reproduce
> build error as below:
> 
>   VDSOLD  arch/riscv/kernel/vdso/vdso.so.dbg
> ld.lld: error: section .note file range overlaps with .text
> >>> .note range is [0x7C8, 0x803]
> >>> .text range is [0x800, 0x1993]
> 
> ld.lld: error: section .text file range overlaps with .dynamic
> >>> .text range is [0x800, 0x1993]
> >>> .dynamic range is [0x808, 0x937]
> 
> ld.lld: error: section .note virtual address range overlaps with .text
> >>> .note range is [0x7C8, 0x803]
> >>> .text range is [0x800, 0x1993]
> 
> Fix it by removing the hardcoding 0x800 and related comments.
> 
> Link: https://lore.kernel.org/lkml/202210122123.Cc4FPShJ-lkp@intel.com/#r
> Reported-by: kernel test robot <lkp@intel.com>
> Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
> ---
>  arch/riscv/kernel/vdso/vdso.lds.S | 8 +-------
>  1 file changed, 1 insertion(+), 7 deletions(-)
> 
> diff --git a/arch/riscv/kernel/vdso/vdso.lds.S b/arch/riscv/kernel/vdso/vdso.lds.S
> index 01d94aae5bf5..344209d2e128 100644
> --- a/arch/riscv/kernel/vdso/vdso.lds.S
> +++ b/arch/riscv/kernel/vdso/vdso.lds.S
> @@ -31,13 +31,7 @@ SECTIONS
>  
>  	.rodata		: { *(.rodata .rodata.* .gnu.linkonce.r.*) }
>  
> -	/*
> -	 * This linker script is used both with -r and with -shared.
> -	 * For the layouts to match, we need to skip more than enough
> -	 * space for the dynamic symbol table, etc. If this amount is
> -	 * insufficient, ld -shared will error; simply increase it here.
> -	 */
> -	. = 0x800;

Hi Jisheng,

Removing this hard coded value is a good thing, but I don't understand
why, if it was necessary before, that it's no longer necessary. Can you
please explain that in the commit message? If the linker improved in
this regard, then do we need to document a new minimum linker version?

> +	. = ALIGN(16);

Aligning text to a 4-byte boundary makes sense to me, but I don't
understand the 16-byte boundary requirement. Can you please explain
this for my education?

Thanks,
drew

>  	.text		: { *(.text .text.*) }		:text
>  
>  	.data		: {
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
