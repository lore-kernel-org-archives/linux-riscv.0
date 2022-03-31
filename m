Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55FF4C433F5
	for <linux-riscv@archiver.kernel.org>; Thu, 31 Mar 2022 20:28:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=xE3VWkc/nn76jSS5+jkaeRi8lYo4lW4Gr/IyiFhDtCk=; b=DZkD3kxnvt4SNxc7jts7MjYsvg
	t/isJpJ9wiaMoSG75Jbosuv8hAvUFP7EiYN6CaMhogBYNgu7QtMjsLvC0DsoFQhpaPD8hrW14sVE5
	r5tAeV9MmIIXqE6OGvffpYIo/CMjy/Exg7Psyl5TbXmm4bcwIeU/97wCnUGk32oCLsDM61q0DoJ+4
	6AWSXNYQlJ5Xk/VSoVB/RGDaFh3fRN8haRQBBRVJoCwIkizdGR7grILvMTC7iwBkmSzC95a07zMH7
	NhoLPyQlzPhr+4UnEGe2d87+Ne+bHN9wHYvCR5nEv0yqMMs1xssAyiMRTK/1p1E2zndwR8muvKfC+
	8LeIH3AA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1na1Oy-003aFA-81; Thu, 31 Mar 2022 20:28:16 +0000
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1na1Ot-003aBt-BJ
 for linux-riscv@lists.infradead.org; Thu, 31 Mar 2022 20:28:14 +0000
Received: by mail-pj1-x1034.google.com with SMTP id
 h23-20020a17090a051700b001c9c1dd3acbso517671pjh.3
 for <linux-riscv@lists.infradead.org>; Thu, 31 Mar 2022 13:28:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20210112.gappssmtp.com; s=20210112;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=bnq3RGPMzBMV/g9aWknvx9FGXd6IFr5H5AAWOs4ymHk=;
 b=1uYsPp4Tl1AUltqW3P44nhWS7GvP4CJgKOhn+4VSW6tjebojOna8+DqcXGZ9k0L/qg
 /kFWpO1A9VCxXURXGLxWREhOlFDrf7SGsxEcHzf+/1uE2v7LBC1dWVqweOKhApxLgw9D
 amggZOnWK8/4wpWGOGhiK4cjY2SQMXyCD0VEruU0dGq6NnWYK88rwYoSegTMJzw1+tk3
 HxcB/8JTpf60c1hpvFHq7hYKJ2LX9yB1v55R/v8Dni9DydCTumhK63hi5FUT8HXbvn5w
 bDcJd/qTfwfOiArpTbcdXfkKKBEw5RYSV5PG8FRRIY48vM4BJn5dkI4bFNb4KeQt435X
 zj9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=bnq3RGPMzBMV/g9aWknvx9FGXd6IFr5H5AAWOs4ymHk=;
 b=p6Xa0/oeaIlgHuVE6Ilmds43KrouGx2XbzJnXVjYiKyf6/BdWVASuc/VZz0zdHL45x
 qBS/Vwc2K6E+5Wt1M9tsthqxx0GE3+Vpqq8mlWhc8tro6hQMHmHzbnH54BQqqEXsSlqQ
 qN8PpdItmU3iMAehDifCPajqFq/M/5UkSM9GPIX4n3r1WVK8ayGK8Oh+yZ7Q1pYHSivx
 KptrBnAixGTzm8O6hi1FxEh6feu7+FD8A5N4OJR3gPBVBeI8ZOubWUvOQcq9rmfCmWfL
 Ef0+ZwxXOPsYWdyIRrsDcgYDrX+cW91Jy+GBFHhMYvbOjRp6+PG3Gh8YMSXSzEAFjS7J
 wiHw==
X-Gm-Message-State: AOAM531wmq8evBEFyoDZRVtao7vGYa2RI0ubabEaAerVZ8TXJBD0HNtW
 FV3B5meDbfNnE0hppd0gNcLYpg==
X-Google-Smtp-Source: ABdhPJz8WAGQPMzQnR1/kKYbzZSKsNbVNJ28AVKuGN4my5flJHiGhwEnQ3iZcV5Chnf26dEqytnXVg==
X-Received: by 2002:a17:902:f544:b0:154:5ecb:eb24 with SMTP id
 h4-20020a170902f54400b001545ecbeb24mr7143398plf.11.1648758487456; 
 Thu, 31 Mar 2022 13:28:07 -0700 (PDT)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223]) by smtp.gmail.com with ESMTPSA id
 y13-20020a17090a390d00b001c995e0a481sm203407pjb.30.2022.03.31.13.28.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 31 Mar 2022 13:28:06 -0700 (PDT)
Date: Thu, 31 Mar 2022 13:28:06 -0700 (PDT)
X-Google-Original-Date: Thu, 31 Mar 2022 13:04:31 PDT (-0700)
Subject: Re: [PATCH] RISC-V: Declare per cpu boot data as static
In-Reply-To: <20220323171726.1303706-1-atishp@rivosinc.com>
CC: linux-kernel@vger.kernel.org, Atish Patra <atishp@rivosinc.com>,
 lkp@intel.com, 
 aou@eecs.berkeley.edu, atishp@atishpatra.org, anup@brainfault.org,
 damien.lemoal@wdc.com, devicetree@vger.kernel.org, jszhang@kernel.org,
 krzysztof.kozlowski@canonical.com, 
 linux-riscv@lists.infradead.org, Paul Walmsley <paul.walmsley@sifive.com>,
 robh+dt@kernel.org
From: Palmer Dabbelt <palmer@dabbelt.com>
To: Atish Patra <atishp@rivosinc.com>
Message-ID: <mhng-00dae2b9-e45c-43c7-a67d-75c937215a19@palmer-mbp2014>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220331_132811_459025_71AD4FB4 
X-CRM114-Status: GOOD (  16.79  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Wed, 23 Mar 2022 10:17:26 PDT (-0700), Atish Patra wrote:
> The per cpu boot data is only used within the cpu_ops_sbi.c. It can
> be delcared as static.
>
> Fixes: 9a2451f18663 ("RISC-V: Avoid using per cpu array for ordered booting")
>
> Reported-by: kernel test robot <lkp@intel.com>
> Signed-off-by: Atish Patra <atishp@rivosinc.com>
> ---
>  arch/riscv/kernel/cpu_ops_sbi.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/riscv/kernel/cpu_ops_sbi.c b/arch/riscv/kernel/cpu_ops_sbi.c
> index dae29cbfe550..7f2ad008274f 100644
> --- a/arch/riscv/kernel/cpu_ops_sbi.c
> +++ b/arch/riscv/kernel/cpu_ops_sbi.c
> @@ -21,7 +21,7 @@ const struct cpu_operations cpu_ops_sbi;
>   * be invoked from multiple threads in parallel. Define a per cpu data
>   * to handle that.
>   */
> -DEFINE_PER_CPU(struct sbi_hart_boot_data, boot_data);
> +static DEFINE_PER_CPU(struct sbi_hart_boot_data, boot_data);
>
>  static int sbi_hsm_hart_start(unsigned long hartid, unsigned long saddr,
>  			      unsigned long priv)

Thanks, this is on for-next.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
