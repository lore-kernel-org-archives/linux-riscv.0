Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04AB8C7EE24
	for <linux-riscv@archiver.kernel.org>; Thu, 11 May 2023 07:44:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ddcESZLK8YQxtNpxi17J1X1I/vYiQvMAOENq/MkRjFg=; b=yhixGymQUPCtZB
	8p6kcarxIFdcGO6FlfNvoooJzvS0LjwaBD5iww0zFFe738Ce1VDgfXMltqtsQpyfj0MMkgLNcsKV1
	PIdzu4y/8pBosZXEnnra05mTSkSKLBa0sLMaMpAE15u7yOcq24fbLWpVOFZcz7jHMScVO7VSj/E/5
	h9mSnu29Ij9Nu6ttoDlxXEznvAgnwukXT3Rn2PzngvHU8sIso39Uxd5vkwA34qgC5eOr2mqa1mSzG
	7GQQ3ylMJSZFIfJE9FGdnkyeBTPDTSz8dPK1VsGjVE0iUmAjNW3ZrPmVOtKgK18EQztt7sjxi4Tze
	1Bc7pdBTbqUj8sZnvCRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1px0yj-008BCK-2W;
	Thu, 11 May 2023 07:44:45 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1px0yh-008BBA-0Y
	for linux-riscv@lists.infradead.org;
	Thu, 11 May 2023 07:44:44 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-3f315712406so273336085e9.0
        for <linux-riscv@lists.infradead.org>; Thu, 11 May 2023 00:44:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1683791080; x=1686383080;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=y7qAtEMxa98mvEq/S2OukRFlZVR9DoGyplQJNjwBgK0=;
        b=R7T1iEjwHEdDoKl7KR+Ybdp7bLhR+D8GLS3jghPvQNi+HgmDCIXWHLlhgmfkvduPel
         M6kDgCRzlUOXQvgLlzJR1wqmCzM7gj+TOztB77TMQidnwbJ0HgDpY8hqZesROdFmOA0O
         1CmhF5zzEiFDxKn7jUbMTXoS3Im6Aviw50gHH1ZZQ4DHmzWZWjfdcxfuA+LIo1emAx3D
         JhMF0W0wU8QBIdFq+uvEwj8AjgYWMEgzd6foHvKW2cvCc19bP3JGrRBPLjFluvHYDRRI
         lhGgL9fdRQX7JjtxMbiUaLwlt+C9EAHIrTlxtobZowdcAWsivQ1/QTdAj6ci8a/Usadu
         3EIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683791080; x=1686383080;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=y7qAtEMxa98mvEq/S2OukRFlZVR9DoGyplQJNjwBgK0=;
        b=lHCzQAWq2vuLsauQxT51m/betRuhjMhuiL1L9Pg1WwLoi1626roLjAQqkPso+ne3lw
         m72Q8n6RRH5bBJHNvcByM8PraYEXun3pxaCAgKzz+bQH4cxmGX30sTY8LHZsUJU3YIfB
         xk8nYTv29Hc8PpPg68P7+3WYbVLPuQF7XpOcDL/Xw04qOtYvlxfFThIUtzloFmtXnhBn
         fW/UzIyiuC8tgLFri2OKsxGCIwbX0ZgMw+riwr/Ktisa1MzFfR7p4avUmxBFvOV+leAS
         H0yJ6/XG05Y5HvBqcF9CzhH9L+yuohj68EJZW2+hANZ6DWoXHEeE/UmcYj/1pr4o4KoH
         b4WQ==
X-Gm-Message-State: AC+VfDwaOoMgLMG5eg2orrf995s7OpFTh90jheyQWv/25L1VQr3OoZ9P
	WYSbc+INq7n477g9FEHyApI22g==
X-Google-Smtp-Source: ACHHUZ6MvbTf3fJCVEA3AWYjhFzyvctocpaef1a+OBd91Ok80ccq383ThuXnoe+ie6dwnbGlU1m45Q==
X-Received: by 2002:a7b:cb93:0:b0:3f4:2374:3511 with SMTP id m19-20020a7bcb93000000b003f423743511mr10333379wmi.10.1683791080630;
        Thu, 11 May 2023 00:44:40 -0700 (PDT)
Received: from localhost (cst2-173-16.cust.vodafone.cz. [31.30.173.16])
        by smtp.gmail.com with ESMTPSA id w12-20020a05600c474c00b003f07ef4e3e0sm10730643wmo.0.2023.05.11.00.44.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 May 2023 00:44:40 -0700 (PDT)
Date: Thu, 11 May 2023 09:44:39 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: zhangfei <zhang_fei_0403@163.com>
Cc: linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	aou@eecs.berkeley.edu, palmer@dabbelt.com, paul.walmsley@sifive.com, 
	conor.dooley@microchip.com, zhangfei@nj.iscas.ac.cn
Subject: Re: [PATCH v2 0/2] RISC-V: Optimize memset for data sizes less than
 16 bytes
Message-ID: <20230511-75718c538818fb3e1d924f9a@orel>
References: <20230511012604.3222-1-zhang_fei_0403@163.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230511012604.3222-1-zhang_fei_0403@163.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230511_004443_213604_D3C17459 
X-CRM114-Status: GOOD (  17.31  )
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

On Thu, May 11, 2023 at 09:26:04AM +0800, zhangfei wrote:
> From: zhangfei <zhangfei@nj.iscas.ac.cn>
> 
> At present, the implementation of the memset function uses byte by byte storage 
> when processing tail data or when the initial data size is less than 16 bytes. 
> This approach is not efficient. Therefore, I filled head and tail with minimal 
> branching. Each conditional ensures that all the subsequently used offsets are 
> well-defined and in the dest region. Although this approach may result in 
> redundant storage, compared to byte by byte storage, it allows storage instructions 
> to be executed in parallel, reduces the number of jumps, and ultimately achieves 
> performance improvement.
> 
> I used the code linked below for performance testing and commented on the memset 
> that calls the arm architecture in the code to ensure it runs properly on the 
> risc-v platform.
> 
> [1] https://github.com/ARM-software/optimized-routines/blob/master/string/bench/memset.c#L53
> 
> The testing platform selected RISC-V SiFive U74.The test data is as follows:
> 
> Before optimization
> ---------------------
> Random memset (bytes/ns):
>            memset_call 32K:0.45 64K:0.35 128K:0.30 256K:0.28 512K:0.27 1024K:0.25 avg 0.30
> 
> Medium memset (bytes/ns):
>            memset_call 8B:0.18 16B:0.48 32B:0.91 64B:1.63 128B:2.71 256B:4.40 512B:5.67
> Large memset (bytes/ns):
>            memset_call 1K:6.62 2K:7.02 4K:7.46 8K:7.70 16K:7.82 32K:7.63 64K:1.40
> 
> After optimization
> ---------------------
> Random memset bytes/ns):
>            memset_call 32K:0.46 64K:0.35 128K:0.30 256K:0.28 512K:0.27 1024K:0.25 avg 0.31
> Medium memset (bytes/ns )
>            memset_call 8B:0.27 16B:0.48 32B:0.91 64B:1.64 128B:2.71 256B:4.40 512B:5.67
> Large memset (bytes/ns):
>            memset_call 1K:6.62 2K:7.02 4K:7.47 8K:7.71 16K:7.83 32K:7.63 64K:1.40
> 
> From the results, it can be seen that memset has significantly improved its performance with 
> a data volume of around 8B, from 0.18 bytes/ns to 0.27 bytes/ns.
> 
> The previous work was as follows:
> 1. "[PATCH] riscv: Optimize memset"
>    6d1cbe2e.3c31d.187eb14d990.Coremail.zhangfei@nj.iscas.ac.cn

Cover letters should have a changelog, in this case a couple phrases
stating what's different in v2 vs. v1.

Thanks,
drew

> 
> Thanks,
> Fei Zhang
> 
> Andrew Jones (1):
>   RISC-V: lib: Improve memset assembler formatting
> 
>  arch/riscv/lib/memset.S | 143 ++++++++++++++++++++--------------------
>  1 file changed, 72 insertions(+), 71 deletions(-)
> 
> zhangfei (1):
>   RISC-V: lib: Optimize memset performance
> 
>  arch/riscv/lib/memset.S | 40 +++++++++++++++++++++++++++++++++++++---
>  1 file changed, 37 insertions(+), 3 deletions(-)
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
