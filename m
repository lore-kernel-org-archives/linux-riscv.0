Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64F4ECE79AC
	for <linux-riscv@archiver.kernel.org>; Wed, 20 Sep 2023 08:29:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lERPNe9HiKWfepZKrI3yeJoC3sHfKGzhuYPBpV1CVOE=; b=OcBxhLuOTPIp8M
	ruAdk2uWckepFLChhB/ii9Lp/odTbChYr0AoBbgnjlHociwzw2E6+v2aA/2IWfv+QyTfzBrmAR9sv
	Xl/BzILsU9v3BS5xEIt7ZRbWIJL/kVum3PCCvyNahO5lDxfY0/ADaWqjqgzsJo9zk4qRwCvURmUCs
	yZKXGO6rKCZeDyFbKfMk0TNCOrCRfJXXdYGusN2LWkJI8T3PdteRJ+jUKWo++1F4dvFjpI3SyLr8o
	NHavhC9RvF08szNpcnems3/ijjf2/S9XaGue25KNBx+3LYqXj28IlkACQHYTyoNWmGfAtiCK322XQ
	kqyo1s1+FnmXX6uU3qqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qisa9-002HvX-2t;
	Wed, 20 Sep 2023 08:29:13 +0000
Received: from mail-lf1-x12d.google.com ([2a00:1450:4864:20::12d])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qisa7-002HuP-0w
	for linux-riscv@lists.infradead.org;
	Wed, 20 Sep 2023 08:29:12 +0000
Received: by mail-lf1-x12d.google.com with SMTP id 2adb3069b0e04-50300cb4776so6942430e87.3
        for <linux-riscv@lists.infradead.org>; Wed, 20 Sep 2023 01:29:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1695198547; x=1695803347; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=k0MfWcAb3Afp2pYNnti4RmJ1Qs6ejpeucHp6Vo3y+PE=;
        b=Jy6cXr81hOCsrDFzyoBXy5uovQ22c8RvT/oHfv3+dsezhGfDOEVhlryGMl/iuzMdbj
         2//eUVGczajWoPofhTCCgVdrpUI5uXPZSTvIUQ32/uQ0+I71NcVhI9UsdGuyYRPSRm83
         VLLeKjTryhoTRYXX150JMyH4Af7P77ms8JFrHIpEuagaMJSLhkUHV4yC43V7u9qTADOo
         DPnoDpt2ZNPAZDpW3CqHG1Oi2weeLPKHF6v6obwgQ32HiGZIv7uF8gHENdv7Xw9xJR3x
         sGjF20QvOjaGk7sHFYYaodo4Qo9PWX1D1Pv2A5xW1CQgQWJIFxgUepKfn9QEFTa9XXJT
         k48g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695198547; x=1695803347;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=k0MfWcAb3Afp2pYNnti4RmJ1Qs6ejpeucHp6Vo3y+PE=;
        b=LK53hOlIISYfOHXZKwatPIdVUM5uoB7AwjOPCpd+ULZ2G2iH+7u53nPuiktaknc9+w
         l2fhNe1xHUxzsDzGCmIMceuswuc6J1Zs2FTFASKhvqzKI/agJwg6pl7Za10urUOdJMPl
         tGFAWnYIWT2kZlPDClqPEGh/z4QlrEhACi6Tt9TokA3/0s69vlaU5PUZdp3zo/DmF0cO
         4lk0dCaTl+ReDJ+OoR050bZWvW/E9CqY00J/bOnjriFP/ypCUPDuXw8NTzpf5NN6m5gn
         Xbe7Mu6D5cnnTOLqcOHtLj4lY3uOYE5UttAb6GWY/tMVu3YQQ9M6Rao0Bn6BkLHJpsth
         WRsA==
X-Gm-Message-State: AOJu0Yxab29mdVyYBUr4++eliEMLOwXviLKjcd0vqhHIr89OVvrLiRlG
	RgA2GyT8o9cZowULJ+qJoEmx4w==
X-Google-Smtp-Source: AGHT+IFBXEnma4H6oseO/7HjER06wVXo70jAGnZqCu1JYR1l5pH2Rsc0xFBFHAXJ7nG8F9xDVJ9kUw==
X-Received: by 2002:a19:6905:0:b0:503:26b0:e126 with SMTP id e5-20020a196905000000b0050326b0e126mr1159365lfc.59.1695198547026;
        Wed, 20 Sep 2023 01:29:07 -0700 (PDT)
Received: from localhost (cst2-173-16.cust.vodafone.cz. [31.30.173.16])
        by smtp.gmail.com with ESMTPSA id z11-20020a1c4c0b000000b003fc06169ab3sm1292246wmf.20.2023.09.20.01.29.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Sep 2023 01:29:06 -0700 (PDT)
Date: Wed, 20 Sep 2023 10:29:05 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Xiao Wang <xiao.w.wang@intel.com>
Cc: paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu, 
	ardb@kernel.org, anup@brainfault.org, haicheng.li@intel.com, 
	linux-riscv@lists.infradead.org, linux-efi@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] riscv: Rearrange hwcap.h and cpufeature.h
Message-ID: <20230920-645cd4e9612d83768e596514@orel>
References: <20230920074653.2509631-1-xiao.w.wang@intel.com>
 <20230920074653.2509631-2-xiao.w.wang@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230920074653.2509631-2-xiao.w.wang@intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230920_012911_356673_8CAFA64E 
X-CRM114-Status: GOOD (  11.08  )
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

On Wed, Sep 20, 2023 at 03:46:52PM +0800, Xiao Wang wrote:
> Now hwcap.h and cpufeature.h are mutually including each other, and most of
> the variable/API declarations in hwcap.h are implemented in cpufeature.c,
> so, it's better to move them into cpufeature.h and leave only macros for
> ISA extension logical IDs in hwcap.h.
> 
> BTW, the riscv_isa_extension_mask macro is not used now, so this patch
> removes it.
> 
> Signed-off-by: Xiao Wang <xiao.w.wang@intel.com>


Suggested-by: Andrew Jones <ajones@ventanamicro.com>
Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

Thanks,
drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
