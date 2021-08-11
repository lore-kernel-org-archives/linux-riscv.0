Return-Path: <SRS0=vOU+=NC=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4B724C4338F
	for <linux-riscv@archiver.kernel.org>; Wed, 11 Aug 2021 23:38:08 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0AFB26101D
	for <linux-riscv@archiver.kernel.org>; Wed, 11 Aug 2021 23:38:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 0AFB26101D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=y86CFK66s7vjloXjySn3O1661Jmt0ky7fKzvmbsJOoE=; b=OVKtM0ULBsoGWa
	AugKD3ouel+/R/+ZqanWcJQq6b6iLHuRvIhkNPWN6m56z91YENsiBYe+hGOFQ6r5sQm8dtsgYbxOD
	JJgpda5f0WK1HasW2/EDAH+Wct8K2pywIF7I0bPFI7R74QCKEudR38qbAHK2M6AXBb/JFNhwDTQW0
	Ym3qhvgqrBq6ymvJghxDqgoScI6f0TQNEB/zQOI4tLCTGSlhXi3hJLXufZNX37xlfFxn7bXplSSd1
	hjB7Rpf6pJlycJGhmmyWsLxw5gyibr6woZqLB6b+XuhwasIho01w8nrh0wgZKEQr2YSbSXZEVS53K
	dCHBCg/ZuT8OTPEXMFlw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mDxn3-008KtX-8n; Wed, 11 Aug 2021 23:37:41 +0000
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mDxmn-008Kt9-6d
 for linux-riscv@lists.infradead.org; Wed, 11 Aug 2021 23:37:26 +0000
Received: by mail-pj1-x102e.google.com with SMTP id
 lw7-20020a17090b1807b029017881cc80b7so12263715pjb.3
 for <linux-riscv@lists.infradead.org>; Wed, 11 Aug 2021 16:37:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=QuIfA2qSoLvffItEog0Txhua4v5iPaRzueSF+kKPuoo=;
 b=Nro9k9HupQ0Cn+4oIjxpP/aOsJSJiQlbcDnud9jglYKtOK1I0eEvP8zsE4YsrYE+oC
 dM5Y1lSLMwn9dUNR/4gAMeGhFLNJJZytNjNPtQG7PpAd+19TSBqqaOHk6kFCNa8PMfN1
 qbqcUC4EFE6n1Sjxiow8HPGx7L1efNBXBdS+CypfzSEHGUGac6SOX03pwZXxt4L+ENsB
 cxyO7kqlKPER+4C0Tdwncp7J0I6mgCo6s3JJXyQWckpc3SFO29QaGaeOxzRWD8xL8JZv
 0jQw1CufdMFLq7Rr7men3ROWSNuJpj6uXERI28mC64ddXyFjfQr/et1vYzNcGXdNHT7h
 kU1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=QuIfA2qSoLvffItEog0Txhua4v5iPaRzueSF+kKPuoo=;
 b=mXU3la5u3tsTmUEWsrffDpTYfHe/JkK8i58gf6OfpX6I0oSG5XSealFT61za9bCKBc
 mMuPQfcabQzHjZ/1aKijRAfIYre1rxtAeaULGdz+zmlZwgW3EB3n6kGLmkR0x+OeDSOv
 vIdId41h+ZLUmhMCOJcqeZK0ot+y06TTL09isV8nsclpgs1NmG5nCKU0NuoDOYhkzmK+
 aEHF5f+HfH5agE8PPIcEfXKNjC3QP1I8nhVIQ/YO+zfN1uaZcyynqCUo1p5Z1JsmzqaQ
 8Qo/El4J+Zx4udffqIIPmEUDoSFdkyps4WzB3GBxb8LbRabMv5Dn3Ds3yH7YFL3cjKOe
 NkjQ==
X-Gm-Message-State: AOAM5300OkYXBph8pFu6Qelz/ZFB1x0FUvmAA/TT7jSBomRhY3+JPq6U
 p9GdM3ttuajHuzVADorkmD8=
X-Google-Smtp-Source: ABdhPJyQGvRB9kkKj7AWTBgQe9I4K3r9yhn9qQqCihdTFxOmCUbYJm5EuA21UJ9jpeeEICMMJ3sfug==
X-Received: by 2002:a17:902:7889:b029:12b:cf54:4bf1 with SMTP id
 q9-20020a1709027889b029012bcf544bf1mr1194219pll.85.1628725043745; 
 Wed, 11 Aug 2021 16:37:23 -0700 (PDT)
Received: from mail.google.com ([141.164.41.4])
 by smtp.gmail.com with ESMTPSA id n33sm723129pfv.96.2021.08.11.16.37.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Aug 2021 16:37:23 -0700 (PDT)
Date: Thu, 12 Aug 2021 07:37:19 +0800
From: Changbin Du <changbin.du@gmail.com>
To: Changbin Du <changbin.du@gmail.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] riscv: kexec: do not add '-mno-relax' flag if compiler
 doesn't support it
Message-ID: <20210811233719.2thdgy7hqudf7yf4@mail.google.com>
References: <20210722021715.127066-1-changbin.du@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210722021715.127066-1-changbin.du@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210811_163725_308601_ED0BCC9A 
X-CRM114-Status: GOOD (  15.16  )
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

Hello, ping status for this fix. There's a build error with gcc7-.

On Thu, Jul 22, 2021 at 10:17:15AM +0800, Changbin Du wrote:
> The RISC-V special option '-mno-relax' which to disable linker relaxations
> is supported by GCC8+. For GCC7 and lower versions do not support this
> option.
> 
> Fixes: fba8a8674f ("RISC-V: Add kexec support")
> Signed-off-by: Changbin Du <changbin.du@gmail.com>
> ---
>  arch/riscv/kernel/Makefile | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/riscv/kernel/Makefile b/arch/riscv/kernel/Makefile
> index d3081e4d9600..3397ddac1a30 100644
> --- a/arch/riscv/kernel/Makefile
> +++ b/arch/riscv/kernel/Makefile
> @@ -11,7 +11,7 @@ endif
>  CFLAGS_syscall_table.o	+= $(call cc-option,-Wno-override-init,)
>  
>  ifdef CONFIG_KEXEC
> -AFLAGS_kexec_relocate.o := -mcmodel=medany -mno-relax
> +AFLAGS_kexec_relocate.o := -mcmodel=medany $(call cc-option,-mno-relax)
>  endif
>  
>  extra-y += head.o
> -- 
> 2.26.2
> 
> 

-- 
Cheers,
Changbin Du

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
