Return-Path: <SRS0=xysQ=M7=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EBC12C4338F
	for <linux-riscv@archiver.kernel.org>; Sun,  8 Aug 2021 10:35:48 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A954E61002
	for <linux-riscv@archiver.kernel.org>; Sun,  8 Aug 2021 10:35:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org A954E61002
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=95bt6H3tpVLKAQs2iZ+J9He0CFRbQ4US0pJF+mtKBqQ=; b=HHrdMfkQxLJGEH
	r2GxaSYER8VtSvJY3xVRHsjw5fbWpFJSe85tKtE4etc/gxKiuW7RhgjyAS3louQ/iRfOa5l+un+DC
	vbm1gAv5M6/F32Md+mW4FDpchpj0AfHAqla37qTqp9yftvtTmUQ/Rd0PHgWgUPtOmEF5HIZK3jUTq
	FUI4u6SoLWqctyXxezQUiDJPWwJFaSXd9oLmQezariUwWLZrHKLV+docf625zlBnw98MF6XMXMRsK
	Mt/J8vQVepJtIT5C3zLZ9Fja3LOkGrpIzk7l3wq7LOQ6wC5HpX25fDr9PQGWOml9xVTSHf0nak9Ne
	IHwQsC4SVmDOtwGCoMew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mCg9Q-00Fjm2-DL; Sun, 08 Aug 2021 10:35:28 +0000
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mCg9N-00FjlV-Ud
 for linux-riscv@lists.infradead.org; Sun, 08 Aug 2021 10:35:27 +0000
Received: by mail-pj1-x1034.google.com with SMTP id
 pj14-20020a17090b4f4eb029017786cf98f9so25121686pjb.2
 for <linux-riscv@lists.infradead.org>; Sun, 08 Aug 2021 03:35:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=wxw6Z0ubpq9+grYkt/Nf/F9mfx38V+nnSRHMfmnQeaM=;
 b=pl1sxaoICHTF70QbsMDI8QEdH4AwVUKw/odKwirn15Kcj+Bjp8NC3IcyZ8OddDjGTl
 7jvC8l9Jv+GB6/oMOC9rmihLPremhSSCHdURozFAEpxDyBwlrRUxqRseIFrLyRTXoljT
 6Prx2jK7xiFKNjY5W/QjhCI1U/NsGslUPYarszl+3Q3VfaRUk3IhSuRDyYke4tg8yFTq
 Vs5sBfIz+PhNVXz61jwBOucJ/hN3FAacYociAtWwN5GmQmjEz2hLaOIupenuknp9PFjJ
 umRcoIhVw4P3TixT+SC70cAVgVoXrpGHM8uKxzb8mFYg+JEijPxmoEEAuNC+DQJnnTYz
 LYWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=wxw6Z0ubpq9+grYkt/Nf/F9mfx38V+nnSRHMfmnQeaM=;
 b=byIuG9lhomDpszJ8jhkc/pgWFXGJW0JNru98PvI5CujXgZYyL6f+rfenWmv847HOQH
 iQI3nISY8BybUQuZTIRA6R5O+yx6B94wgyK7UsUEy0zsBnRXAOAK3uSw9r+dw4SPCoMU
 ebEqbEDF5ju2NUKMOh+0sAz52zbynS8yITwox4+qANMZ42Ryual4Bts1QCedOe5qa6Re
 2sfOZHXPQQypG3F9fsgT9EFpnyhslhODci+LhIPgK2IuvhMuVsV/yc/tHr+JgDHCafUZ
 ul0u94CcqUqHinHXI9iPpVhGgvuBXZh6aKZinPXmEoJXzKTMSlojDOfik3wdcNYbtNPo
 Jrrg==
X-Gm-Message-State: AOAM532Jv6GcWp6Im/Pyj/ppvoEpZirzh01M3RX3FkLm88BjZKIAT6/h
 1WTLnrK5rzi1a85PD6wzL8ouOg==
X-Google-Smtp-Source: ABdhPJzVpJXO/+icYyVn9BLh2FYPDXQhKAou26u2YJdc15EIJxy/tSn4Q353gYMV07UfFlDqwB08yA==
X-Received: by 2002:a17:90a:ad07:: with SMTP id
 r7mr1675765pjq.110.1628418924428; 
 Sun, 08 Aug 2021 03:35:24 -0700 (PDT)
Received: from sunil-ThinkPad-T490 ([49.206.3.187])
 by smtp.gmail.com with ESMTPSA id n11sm14827774pjf.17.2021.08.08.03.35.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 08 Aug 2021 03:35:24 -0700 (PDT)
Date: Sun, 8 Aug 2021 16:05:20 +0530
From: Sunil V L <sunilvl@ventanamicro.com>
To: Petr Pavlu <petr.pavlu@suse.com>
Cc: palmer@dabbelt.com, paul.walmsley@sifive.com, aou@eecs.berkeley.edu,
 mick@ics.forth.gr, linux-riscv@lists.infradead.org
Subject: Re: [PATCH] riscv: Fix a number of free'd resources in
 init_resources()
Message-ID: <20210808103520.GA30767@sunil-ThinkPad-T490>
References: <7e3ebd5a-cd41-4591-ba2d-0151fa45e8ea@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <7e3ebd5a-cd41-4591-ba2d-0151fa45e8ea@suse.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210808_033526_047387_90958AF2 
X-CRM114-Status: GOOD (  23.40  )
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

On Sat, Aug 07, 2021 at 07:54:50PM +0200, Petr Pavlu wrote:
> Function init_resources() allocates a boot memory block to hold an array of
> resources which it adds to iomem_resource. The array is filled in from its
> end and the function then attempts to free any unused memory at the
> beginning. The problem is that size of the unused memory is incorrectly
> calculated and this can result in releasing memory which is in use by
> active resources. Their data then gets corrupted later when the memory is
> reused by a different part of the system.
> 
> Fix the size of the released memory to correctly match the number of unused
> resource entries.
> 
> Fixes: ffe0e5261268 ("RISC-V: Improve init_resources()")
> Signed-off-by: Petr Pavlu <petr.pavlu@suse.com>
> ---
>  arch/riscv/kernel/setup.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/riscv/kernel/setup.c b/arch/riscv/kernel/setup.c
> index 18bd0e4bc36c..120b2f6f71bc 100644
> --- a/arch/riscv/kernel/setup.c
> +++ b/arch/riscv/kernel/setup.c
> @@ -229,8 +229,8 @@ static void __init init_resources(void)
>  	}
>  
>  	/* Clean-up any unused pre-allocated resources */
> -	mem_res_sz = (num_resources - res_idx + 1) * sizeof(*mem_res);
> -	memblock_free(__pa(mem_res), mem_res_sz);
> +	if (res_idx >= 0)
> +		memblock_free(__pa(mem_res), (res_idx + 1) * sizeof(*mem_res));
>  	return;
>  
>   error:
I encountered this corruption and your patch came in time. 

Thank you very much!

Reviewed-by: Sunil V L <sunilvl@ventanamicro.com>
Tested-by: Sunil V L <sunilvl@ventanamicro.com>

> -- 
> 2.32.0
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
