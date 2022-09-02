Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCBE2C38145
	for <linux-riscv@archiver.kernel.org>; Fri,  2 Sep 2022 09:50:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7lXhB60MT2gxT0pQy2HeSnpADzfbwL4iCCEYhtJptHg=; b=tLdVHNQwHm72qZ
	DH/+LeCQQnZt5TCxavsVV3+0uAe1br8fqy1YUgnSZrIDwiBx1QPLLx3CZg9DFVOd+TkjtLCrlPPV3
	5cn+BiKcdHGydNznaq+KtEdqnOivWKV9lSrCNzq9rxiahjIOJDVz3941pMZWnYzWX/vJa/aR51xzC
	huoNJMZvsntlv/+0mdVMOTsySFAgfezbCA6MknFKWiYGhM+SFeQ6nareAXPa7B1NcwJENpo5G4X8H
	mAQKSUTZn8uSDTLfzRoTIWK0TO65HspKpLtn1D2tL8x4SfMpqcMUFY8Mb55Fv5Sw6SFC+0p82pfgo
	p9PZOpSWkMdeuf1wBBRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oU3JS-002xLS-IP; Fri, 02 Sep 2022 09:50:10 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oU3JP-002wj2-9r
	for linux-riscv@lists.infradead.org; Fri, 02 Sep 2022 09:50:08 +0000
Received: by mail-wm1-x334.google.com with SMTP id c131-20020a1c3589000000b003a84b160addso2309173wma.2
        for <linux-riscv@lists.infradead.org>; Fri, 02 Sep 2022 02:50:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date;
        bh=Al0u2EnKXEN1We5y1Vdc99pOhODJDsfB1Amsd4z1Fik=;
        b=V8x+m18r1y+Aw5UDzSjg125HFeFtgIqdv9xxGxYLwCcbCzpbBH8FhFYgO2+4SOD5HZ
         I1jwfeN+FfI8OLdlxK61jB2IMF/T83Tzweekx0WiMTLoP6OwYflBNBXKILLqqVuv39Wq
         ArsnwoyhWZi111CPt2s5QCmNFvum+J/G1g3nY8Xac6/l2bw0St/OpFnEf2nq3DK90sXu
         hASysSwGlj6QCpOOk0rdARSt/BKTmLKv8pA6kS1sWvOA9DJPHOtotKOylFRLR56CGkU1
         JGg4pufW9kmhy7vUZaabhbnk59U5slaR4Ch2AwGXzqEwIoX2b/I1WxYMKUsBAfbQh10Q
         9HSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
        bh=Al0u2EnKXEN1We5y1Vdc99pOhODJDsfB1Amsd4z1Fik=;
        b=d1JXBjZ0DEIL0jyIj6oyAKcnnF6uINPAG3+p58QCQyLeB89KqeRYRBE2TBk7LB4Hlp
         ggUVLJfmeH8ReHep4u/VG2q/YcO5N+UD+feuvrS+W9LGwpb5KTzGAleihOGohq5+2EQh
         VhyC3b7yXVNV+M/kJ0UtmtMo3qAJ4tBKg6LrL3iCRdZjn+LHxMPD+iiUWGyDfVWweEU3
         UW30eaefy7wS/f+yR6Z/885QqvR/xCT96K7KajmLNcG1U30c2F+yqPag+/ZdsZJGO1xk
         pAyuint0qO0n18WKRV8c1aigtSLQkPRW9qArcgPY44uNLYHcnxtfXb3RiWkrjFIe8rei
         zyOQ==
X-Gm-Message-State: ACgBeo1r0wT2a8nQSHPDIqt21aSclUlKs4NV3kwm+g24xNfSifeQszA0
	U088zH/kmy/5NgRCLyhlfii9Eg==
X-Google-Smtp-Source: AA6agR4xNc4ZeI5upz/fIRrD5ia2s1reCgd23iplWkpSjKHxsrYNVdUvoMyJ+ILBVSCr0th7052S3A==
X-Received: by 2002:a05:600c:3508:b0:3a6:10a9:8115 with SMTP id h8-20020a05600c350800b003a610a98115mr2304045wmq.164.1662112206863;
        Fri, 02 Sep 2022 02:50:06 -0700 (PDT)
Received: from localhost (cst2-173-67.cust.vodafone.cz. [31.30.173.67])
        by smtp.gmail.com with ESMTPSA id c1-20020a5d4141000000b002258413c310sm1091598wrq.88.2022.09.02.02.50.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Sep 2022 02:50:06 -0700 (PDT)
Date: Fri, 2 Sep 2022 11:50:05 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Heiko Stuebner <heiko@sntech.de>
Cc: paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
	conor.dooley@microchip.com, guoren@kernel.org,
	apatel@ventanamicro.com, atishp@rivosinc.com,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/4] riscv: use BIT macros in t-head errata init
Message-ID: <20220902095005.gbxsrrllfis3yi5g@kamzik>
References: <20220901222744.2210215-1-heiko@sntech.de>
 <20220901222744.2210215-3-heiko@sntech.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220901222744.2210215-3-heiko@sntech.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220902_025007_362140_5058447E 
X-CRM114-Status: GOOD (  14.81  )
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

On Fri, Sep 02, 2022 at 12:27:43AM +0200, Heiko Stuebner wrote:
> Using the appropriate BIT macro makes the code better readable.
> 
> Suggested-by: Conor Dooley <conor.dooley@microchip.com>
> Signed-off-by: Heiko Stuebner <heiko@sntech.de>
> ---
>  arch/riscv/errata/thead/errata.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/riscv/errata/thead/errata.c b/arch/riscv/errata/thead/errata.c
> index bffa711aaf64..a6f4bd8ccf3f 100644
> --- a/arch/riscv/errata/thead/errata.c
> +++ b/arch/riscv/errata/thead/errata.c
> @@ -49,10 +49,10 @@ static u32 thead_errata_probe(unsigned int stage,
>  	u32 cpu_req_errata = 0;
>  
>  	if (errata_probe_pbmt(stage, archid, impid))
> -		cpu_req_errata |= (1U << ERRATA_THEAD_PBMT);
> +		cpu_req_errata |= BIT(ERRATA_THEAD_PBMT);
>  
>  	if (errata_probe_cmo(stage, archid, impid))
> -		cpu_req_errata |= (1U << ERRATA_THEAD_CMO);
> +		cpu_req_errata |= BIT(ERRATA_THEAD_CMO);
>  
>  	return cpu_req_errata;
>  }
> -- 
> 2.35.1
>

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
