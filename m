Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5198AC05027
	for <linux-riscv@archiver.kernel.org>; Fri, 20 Jan 2023 15:02:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CCtM8ZLivTQOt1l7wtXEfmaKNYZ4UFrZ/pKEGciKC+4=; b=yfXDVyB3Byiu9t
	8rgLCq7B1hAS7m4eKP84a8d1DEUC/rlu9eiiQTyOS1DxBnzaWqsZ4pFRTyxDWGdVqxEO6rgM+PfRU
	STNfZygMXc413hFamiq0f4uh3gVwVAJK8sJ9vnGnO/XuNp905iErmz+txoW+HFqBsvurL9VQbIIxU
	5TjzFzfhgviaFfWrLi76Tdje7ZJivrEEMGkTvOUkUyLXG9oABTFWaZpyJcP4SWYeyEmvi1ua2I0bx
	GggcVnEvQd25F00D+oW/xNzC4362l+n6kYmxdMGo3D/vwcpVBeJCDCj/1RmNtlWdRk+kCEfiG8Qu/
	ZHXTcHVWhXQ+an287Z2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pIsue-00Asax-RZ; Fri, 20 Jan 2023 15:02:40 +0000
Received: from mail-lj1-x231.google.com ([2a00:1450:4864:20::231])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pIsub-00AsYU-Pm
	for linux-riscv@lists.infradead.org; Fri, 20 Jan 2023 15:02:39 +0000
Received: by mail-lj1-x231.google.com with SMTP id g14so5739329ljh.10
        for <linux-riscv@lists.infradead.org>; Fri, 20 Jan 2023 07:02:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Mcg9opfJQUFxc0b1B3cIoevLaoQT718fiDJwwOS5kNA=;
        b=D63UTsAlAoGXfjt1qLV1AqdorgAmwiu8v0ceaybtPqIMrPRMtddVfFaps4tkiGe7gl
         ovDsQ3/i3AFWs9iuNrb3Ce7LkNjaq5i4vm1C1Vbs5JS/4R8zTpzCpM5Xzx4KsjbrFydN
         0smtm4mSNGNQ8d0Czoq1z7s0rewsveQuRLWDp2Aw6B8ko6ALsapUbFOKjZtKGmzAcF4y
         NW9Sqirav8Yspo6gvowd08po5H7OgP/Q5RzPP5W1i8hOut4VLqmLNE+7F3As61voq/Iv
         u0ua6v1SKeVRcqaskkb6i+sL/rYftC4UUHbSQd71KOkk3/WwDZYON7+2q1QdkuCrHe9m
         yPjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Mcg9opfJQUFxc0b1B3cIoevLaoQT718fiDJwwOS5kNA=;
        b=X8K8h+uMRaO0roZnsUSFRFqWbfUIL7fjndjkuIN+WHy5V9H1X9YUjSAIgx+qfZDfoJ
         KKaqWRuPhSyrhQEV+NhkhoX3Yk89vw7d3bmt24Fw9KJpIFfdED0lYoUXCkrOtjmrwqs0
         Hz13tiDLA7NP8bQZ7YzOcHcmhISBPzCdnO/r7t8hCpOAzBFODbVoGYe7u1fGgkchxpUR
         iGCtO/6S/f2YPCCVznswIsodX/yHG+NVhpOGgocVtvbCetX1x+zdeFF++jySszvyaUf5
         /Dz2TfzeKRZN7cP7999pu81NGDuUrTU0TZ+Q9qD/X7EAVKpILRz5lT0l7X3UqAzODIeb
         hn0w==
X-Gm-Message-State: AFqh2krueua1R/OI0vnxfBPKaaQIxwMinZucSRCUimmGlHgerJ1oP3EE
	bZ9hVutxPtBVRaj2JhhV/UxC2Q==
X-Google-Smtp-Source: AMrXdXuQedc/YMSIS3OpPDTusI8/fOVN4/RHfsTlxSUtQ8xZojO2/S3LJHbMcZKXfoWHG2k7rW9ZXA==
X-Received: by 2002:a2e:b16c:0:b0:28b:8061:1b48 with SMTP id a12-20020a2eb16c000000b0028b80611b48mr3747925ljm.28.1674226954884;
        Fri, 20 Jan 2023 07:02:34 -0800 (PST)
Received: from localhost (cst2-173-16.cust.vodafone.cz. [31.30.173.16])
        by smtp.gmail.com with ESMTPSA id lb19-20020a170907785300b0084d1efe9af6sm17885043ejc.58.2023.01.20.07.02.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Jan 2023 07:02:34 -0800 (PST)
Date: Fri, 20 Jan 2023 16:02:28 +0100
From: Andrew Jones <ajones@ventanamicro.com>
To: Heiko Stuebner <heiko@sntech.de>
Cc: linux-riscv@lists.infradead.org, palmer@dabbelt.com,
	christoph.muellner@vrull.eu, conor@kernel.org,
	philipp.tomsich@vrull.eu, jszhang@kernel.org,
	Heiko Stuebner <heiko.stuebner@vrull.eu>
Subject: Re: [PATCH v5 2/2] RISC-V: add zbb support to string functions
Message-ID: <20230120150228.nexxggusemcntzoc@orel>
References: <20230113212301.3534711-1-heiko@sntech.de>
 <20230113212301.3534711-3-heiko@sntech.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230113212301.3534711-3-heiko@sntech.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230120_070237_890562_6FA6D5D6 
X-CRM114-Status: GOOD (  13.74  )
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

On Fri, Jan 13, 2023 at 10:23:01PM +0100, Heiko Stuebner wrote:
...
> diff --git a/arch/riscv/lib/strcmp.S b/arch/riscv/lib/strcmp.S
> index 8babd712b958..8148b6418f61 100644
> --- a/arch/riscv/lib/strcmp.S
> +++ b/arch/riscv/lib/strcmp.S
> @@ -3,9 +3,14 @@
>  #include <linux/linkage.h>
>  #include <asm/asm.h>
>  #include <asm-generic/export.h>
> +#include <asm/alternative-macros.h>
> +#include <asm/errata_list.h>
>  
>  /* int strcmp(const char *cs, const char *ct) */
>  SYM_FUNC_START(strcmp)
> +
> +	ALTERNATIVE("nop", "j strcmp_zbb", 0, CPUFEATURE_ZBB, CONFIG_RISCV_ISA_ZBB)
> +

I have something similar for Zicboz (which I've just reread as I'm
preparing v2). The difference is that I opted to penalize the non-
optimized version with the unconditional jump and give the optimized
version the nop. To do that here, it'd just need the label changed to
strcmp_basic or whatever, push the "basic" code down into it the new
label, and then put the new zbb code here.

Thanks,
drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
