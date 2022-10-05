Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5FDFC433F5
	for <linux-riscv@archiver.kernel.org>; Wed,  5 Oct 2022 17:39:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WmhSP0QZeGSrEgy0VFQEyNj6T3cCaZApaAaym034H+U=; b=sN75YAZtpuIhkJ
	yBfg0KZGELEnM6UaQA90cxTPBdt+8/MlyfXqPTpEHaLX4Y3AKE/NYd/uTc+O8WwhMaGyNBK8QMZgi
	T+8KxdfAMwNSEa8ohUrkfg2YQMo5FTDL2mJ3zxsD8ycNpBDpkL6P0sR/V7oNt6P8CofHPy9PSQaD6
	DJIOBy/zcDLVPBhzYVE8LXIepdXwVhqmbOlSUDm8K7E4WQQ6riWfc5tjjOPTt06WQa+MDCwhTO0NR
	z19lEH1T5op5vGJCGQXzGCmO6k7vBW8Jr/mR6xPdbBhxTtEjwx3EyHcqhhaqHCubRZhx2DgYw0Al9
	Kp3hdUY0rBpobVsfvIhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1og8MN-00FQWn-Hx; Wed, 05 Oct 2022 17:39:07 +0000
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1og8MK-00FQW0-Jj
	for linux-riscv@lists.infradead.org; Wed, 05 Oct 2022 17:39:05 +0000
Received: by mail-ej1-x635.google.com with SMTP id kg6so21682228ejc.9
        for <linux-riscv@lists.infradead.org>; Wed, 05 Oct 2022 10:39:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date;
        bh=GEEqv6JUw04KMv9WcWH7KJHOv/rriPAH+GJIx70ffZk=;
        b=VJHkutAH6JmqngkefDS4W1u9yXaZmybou+ReWLPQlhc8KLxKuD+SRbbT2WJ/14Moq4
         vrhDuP5ok6Q89f027q4cD0Eyht3Cd5GqWnpSoTbOJ5VmDahDurYei5TtLFFTFTnURtoO
         gLJ7DYE14hOIkoASC0fk+6Sc6K68Wx3biqMnMXfWI+TqOvYh3oivYbHvpC7prVAd8a9A
         mCgleJ/BJQEp9iMHUfE+2fXLJGlyVr+g/tDgzBMz1IUx/yvXwEDyFMtQattzLD5j2NS1
         mUAGbDleHkHEy+2DFRTL9JGLIozImOudD+c5MNtHUwtxnWSk2L67CNmgactPseB8MEXC
         Mm1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
        bh=GEEqv6JUw04KMv9WcWH7KJHOv/rriPAH+GJIx70ffZk=;
        b=Lx4fkhlM2+TrfYkiXMoP1tgEKL/oH9zSUjwqk27cnyfBzVzlWHFFA1ZebwSiKaJ807
         tvdhKcMjtsQXbeOtpR8+o6US/MlTkQ68zhZ6ZQerWqWhiN6JciWkf7dEQCZWMxkpAjko
         1Ifv58Ned7QiP/nt9EMNW9HiaMa2A5SjUhOLyFp+2qOUITqfQKx/5+UTgTWj0AbGFGbN
         G32xB9BgERhHgI41G8AgSiP7Q7nLq0xNi4XdCsqlkvfufkji//G357Wb+z3wt/W2yIWg
         6z7rJW2OT0iXiljKH7HLuhHKBBRHUdlphPdyOff4ZVJbOy5sRNsFEheJbcnzWc//jWDl
         RB1A==
X-Gm-Message-State: ACrzQf2PVHmY4GJpbSTYqWvBLw3lxzLjbse/+K0Xh/JPv9Ug+4k/0xxe
	2DXbciD+6Ygsws41TbSrAXMRnQ==
X-Google-Smtp-Source: AMsMyM7WyYk0PAsuFDiEHWqpCGiTfNFke7pJfBsSDMFkAL8sbci2aWR5Ojdt0qDVNNr1SysWBO9XAA==
X-Received: by 2002:a17:907:da6:b0:787:baf3:1c79 with SMTP id go38-20020a1709070da600b00787baf31c79mr583903ejc.458.1664991540956;
        Wed, 05 Oct 2022 10:39:00 -0700 (PDT)
Received: from localhost (cst2-173-61.cust.vodafone.cz. [31.30.173.61])
        by smtp.gmail.com with ESMTPSA id kv3-20020a17090778c300b0074a82932e3bsm5552301ejc.77.2022.10.05.10.39.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Oct 2022 10:39:00 -0700 (PDT)
Date: Wed, 5 Oct 2022 19:38:59 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Heiko Stuebner <heiko@sntech.de>
Cc: atishp@atishpatra.org, anup@brainfault.org, will@kernel.org,
	mark.rutland@arm.com, paul.walmsley@sifive.com, palmer@dabbelt.com,
	aou@eecs.berkeley.edu, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org, Conor.Dooley@microchip.com,
	cmuellner@linux.com, samuel@sholland.org
Subject: Re: [PATCH 2/2] drivers/perf: riscv_pmu_sbi: add support for PMU
 variant on T-Head C9xx cores
Message-ID: <20221005173859.apuj4a6iq7fxbffp@kamzik>
References: <20221004203724.1459763-1-heiko@sntech.de>
 <20221004203724.1459763-3-heiko@sntech.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221004203724.1459763-3-heiko@sntech.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221005_103904_670565_A8D6718F 
X-CRM114-Status: GOOD (  17.67  )
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

On Tue, Oct 04, 2022 at 10:37:24PM +0200, Heiko Stuebner wrote:
> With the T-HEAD C9XX cores being designed before or during the ratification
> to the SSCOFPMF extension, it implements functionality very similar but
> not equal to it.
> 
> It implements overflow handling and also some privilege-mode filtering.
> While SSCOFPMF supports this for all modes, the C9XX only implements the
> filtering for M-mode and S-mode but not user-mode.
> 
> So add some adaptions to allow the C9XX to still handle
> its PMU through the regular SBI PMU interface instead of defining new
> interfaces or drivers.
> 
> To work properly, this requires a matching change in SBI, though the actual
> interface between kernel and SBI does not change.
> 
> The main differences are a the overflow CSR and irq number.
> 
> As the reading of the overflow-csr is in the hot-path during irq handling,
> use an errata and alternatives to not introduce new conditionals there.
> 
> Signed-off-by: Heiko Stuebner <heiko@sntech.de>
> ---
>  arch/riscv/Kconfig.erratas           | 13 +++++++++++
>  arch/riscv/errata/thead/errata.c     | 18 +++++++++++++++
>  arch/riscv/include/asm/errata_list.h | 16 +++++++++++++-
>  drivers/perf/riscv_pmu_sbi.c         | 33 +++++++++++++++++++---------
>  4 files changed, 69 insertions(+), 11 deletions(-)

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
