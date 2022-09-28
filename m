Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77B4FC32771
	for <linux-riscv@archiver.kernel.org>; Wed, 28 Sep 2022 09:00:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=14w0h8eTdrOND2eHacAzlTGROpWNJ6akC2mnAU/0BLs=; b=nHQM0AzzzA+cPm
	NNN7HaSp6JCDFGfMd++olNhYe1dOK/33Kus7GGcNer9kGuZ567CyTu8MHDuBcoUANE9z2/ukB+0eQ
	0SBSoC0sTNY+IHSBvYX24GATCPBwh6TN5haU2Wiun/J/PZsEUq0QiZkCdUDFTUEhLOqNQxpPAUQ41
	fTvSjMNMmitsxw26nswY0bUDkbWHXPuEx4wKPUJW5SXbCNt0h69gD87ozuCAGGztU0sO4zLuek48X
	mopZ/qySrDhDaaLzo86jDsVGGNHCCZlFpenAqole7N1w8Fw77EE7T15V+f28EyWuR7pq6aBG1H4xq
	AIF8lcM6QewOADj/H/pA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1odSvT-00F3FX-W7; Wed, 28 Sep 2022 09:00:20 +0000
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1odSvR-00F3Cr-Pt
	for linux-riscv@lists.infradead.org; Wed, 28 Sep 2022 09:00:19 +0000
Received: by mail-ed1-x534.google.com with SMTP id z97so16345859ede.8
        for <linux-riscv@lists.infradead.org>; Wed, 28 Sep 2022 02:00:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date;
        bh=NU8AnBmeIJ14DL2Qui9ejktTv9V8UArK0D6jisVgbJ4=;
        b=YZDHwjfe/nIfDR6Yl2r1y6lpAxRaXJ9wmvbPPqd9/uAd4qbYlOywgif1IG1UBkRGLe
         u+Y9D3+evXzlHdi6k0yLtS2+9uA/B8+c0WtUfIsyAz55/7kSPciFXnkmzPgGroz68EBG
         2mExn2cNnG4PtHbAWw0OHwX0jwUVmBkVzrrxUhtGGNiQcwCkpxHN5AHGLvNqTiY9PNRB
         JWmu37EQe5eXYu3fxnRsue3pikle50T9wh6le9ZQ3nGo6A/lZrX1y2MFvFk9Hs15O4Vc
         fMOP76OWeQKouO25jt6HyoqDeamKfAVVnB9JUNEEa8aJc0Xj+KFUKbHEjMGvpeP0TUto
         XiRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
        bh=NU8AnBmeIJ14DL2Qui9ejktTv9V8UArK0D6jisVgbJ4=;
        b=pUnQB5C8kLCK6/qOPUIJn/wFR2YBOQvxzhrpe7xzM5tSdyGysG+ztUeGceXbn4wGvY
         KCtYtWWouGqHJPGSe/Tza++UYuctK1VLx9R8XV1pVJKFC0reyBTrhdG/9bfPkUfgGOb5
         WOAitDHwXfr/SXHmxkzPmYcYFVop8FGXdeFUPMdizHDVS+qJLsFwu7pJge9TuiChgnR2
         MjbhJOFhHjnmMtjLOslwk6U/LVZTGHEM6SMhLPyrh0pfykphf4imfijtzAHEdr0zE1Gg
         9Ql1Fk4I2XS98PGZ4YS3VTUXt0koTMzsGMAAwzvfKjJMkn8pPOeyZZi1l4E3rVVLYhPX
         1zbQ==
X-Gm-Message-State: ACrzQf1HUjjR5yPU5VT21Qg2CGHterv21Cgj9Ln2VJU7tlLna9fcH3Lm
	rI1h9sGQ2pD5Tq1zFv18fTXP8w==
X-Google-Smtp-Source: AMsMyM4AM0H2JjuolWc3Vb/e4g+zQuzzdWHddwXH4HqsIucpwPrNhAY0yhcPuMmHqLBu5MQuGkd8Eg==
X-Received: by 2002:a05:6402:428c:b0:440:8259:7a2b with SMTP id g12-20020a056402428c00b0044082597a2bmr30988999edc.329.1664355613957;
        Wed, 28 Sep 2022 02:00:13 -0700 (PDT)
Received: from localhost (cst2-173-61.cust.vodafone.cz. [31.30.173.61])
        by smtp.gmail.com with ESMTPSA id a8-20020aa7cf08000000b00456ff7d4283sm2992126edy.5.2022.09.28.02.00.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Sep 2022 02:00:13 -0700 (PDT)
Date: Wed, 28 Sep 2022 11:00:12 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Jisheng Zhang <jszhang@kernel.org>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Anup Patel <anup@brainfault.org>,
	Atish Patra <atishp@atishpatra.org>,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	kvm@vger.kernel.org, kvm-riscv@lists.infradead.org
Subject: Re: [PATCH v3 0/3] riscv: kvm: use generic entry for
 TIF_NOTIFY_RESUME and misc
Message-ID: <20220928090012.gjh3ftvkpus5df63@kamzik>
References: <20220925162400.1606-1-jszhang@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220925162400.1606-1-jszhang@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220928_020017_876243_6D27D3A5 
X-CRM114-Status: GOOD (  15.59  )
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

On Mon, Sep 26, 2022 at 12:23:57AM +0800, Jisheng Zhang wrote:
> This series is a preparation series to add PREEMPT_RT support to riscv:
> patch1 adds the missing number of signal exits in vCPU stat
> patch2 switches to the generic guest entry infrastructure
> patch3 select HAVE_POSIX_CPU_TIMERS_TASK_WORK which is a requirement for
> RT
> 
> After these three patches merged, the left RT patches are similar as
> other arch.
> 
> Since v2:
>   - splict the series into two separate ones, one for next another for
>     RT.
> 
> Since v1:
>   - send to related maillist, I press ENTER too quickly when sending v1
>   - remove the signal_pending() handling because that's covered by
>     generic guest entry infrastructure
> 
> Jisheng Zhang (3):
>   RISC-V: KVM: Record number of signal exits as a vCPU stat
>   RISC-V: KVM: Use generic guest entry infrastructure
>   riscv: select HAVE_POSIX_CPU_TIMERS_TASK_WORK
> 
>  arch/riscv/Kconfig                |  1 +
>  arch/riscv/include/asm/kvm_host.h |  1 +
>  arch/riscv/kvm/Kconfig            |  1 +
>  arch/riscv/kvm/vcpu.c             | 18 +++++++-----------
>  4 files changed, 10 insertions(+), 11 deletions(-)
> 
> -- 
> 2.34.1
>

For the series

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
