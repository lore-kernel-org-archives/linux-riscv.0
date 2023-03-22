Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F2C5C6FD1C
	for <linux-riscv@archiver.kernel.org>; Wed, 22 Mar 2023 08:04:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mic9NFm6C8q7Xr6CCxTNy0141YCI9FM+5kwaRDQgZH4=; b=Mlg/vj+3eMAHNT
	6yajc3V6gBWhGUfxHMQLFuGIqnr5gNDjiFktYPl2IQ/CqCiOIGPajbAidqm2zFRSQxrlu1vRZRfnm
	OjwdmxylF0R01MtaqJg7dqvmeCB73Dw9Ff2ezKroD/7pZVBeCLpWhC99aZxouMKOVvy1vsGpdYm4R
	0rtE9QEvqW8dXTndAAo2Rd63XLlHYi7iuSSqccmOHfMtUDVMm+fg2D2vAs5Ls570oXEa0vpidMJ6d
	gWVHna/3kFaC1/GOOXWmdSVjnayx/5N4EfSNszQHLKsB0tWTQVLQQVUjch+sVcUM+LOHFvsEolyfE
	GtrJX9zgfIYEZJ0qH7hA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1petRq-00F6Gr-28;
	Wed, 22 Mar 2023 08:03:54 +0000
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1petRn-00F6FU-1D
	for linux-riscv@lists.infradead.org;
	Wed, 22 Mar 2023 08:03:53 +0000
Received: by mail-ed1-x533.google.com with SMTP id w9so69343141edc.3
        for <linux-riscv@lists.infradead.org>; Wed, 22 Mar 2023 01:03:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1679472228;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=8B1WSd3k6agA9hbUjCQewmiIRqo/yemisFVgkiSXre4=;
        b=HqCWuQmjp+ZcwN/bECxezMtIF3T8jGl/lbqqN0mWQaf8maktnH+dhnd9ma3E5fqpvg
         I0iWAOJF533Ec/kd42R14mgLmhr2wA6bof7TUTGMVN8456efNpC73F69fuuu+EVAao7N
         acOSeTzuXKmZfbEDwlr3G1S1o3pFGJoMcJOaOEPaQBzw67D7l1xxxD0BI+KiI3ycaMCa
         PCgUBf3slJHw3Q+vbQC0NSl364/tJbFozZtKx0rtUsF53thED/9gshySgiM9eSlyHGor
         HC4QlUrm0snf1XxDDsozbFxQaXDWo1V69V3qh9wSyiSOHqdRFY/8AF73wlH9GVuKr5Ff
         AAHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679472228;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8B1WSd3k6agA9hbUjCQewmiIRqo/yemisFVgkiSXre4=;
        b=7mzp2KTf1Yl4b1NpgtpvQazVCfpdLPUBAYDSufq5aMlaLvCjkf7ETmdYEfia+QFpdy
         t+OWa3beD+Q/xjK3VaXHJ1rkRfrpUxUV1M6lfBOeqvRn3+a9YMuVuMkT07ubSbtQ/1h+
         sKlwQSDJvy3zhJGSMxe6ZGnGtftqYxGz1j6Tj0CDE/Hqyhy9FRjrBvLuobblSysI/mrx
         qFHwMEE5B76SAYlsebYuCzFNMtrmUFpBIBErsR7F1rAKvAg3ZgEjp8e3s5jHYswoq8yc
         tIYTPFHX7eKdhfJO8N2gec6wG6yWP9VtK19rO4cJZ4cbkYzq7MVDtW+rKJjvVlqYiluI
         235g==
X-Gm-Message-State: AO0yUKXji7QvUzjll8+nqfrUbEv6xmMh6tB123Q1Q51irTPIaPxaGmlF
	0GHZa60L1E8nCTS/A5BqPvsz/A==
X-Google-Smtp-Source: AK7set/tziqBkqV5MUVfuXiEpA1/TgvUj3OA8J9Z0t74heEu+r1qBWrAiad4Ewtgcu4fBrqOVhjvSQ==
X-Received: by 2002:aa7:d04a:0:b0:4ad:5950:3f53 with SMTP id n10-20020aa7d04a000000b004ad59503f53mr5262490edo.7.1679472227769;
        Wed, 22 Mar 2023 01:03:47 -0700 (PDT)
Received: from localhost (cst2-173-16.cust.vodafone.cz. [31.30.173.16])
        by smtp.gmail.com with ESMTPSA id z21-20020a50cd15000000b004acbda55f6bsm7267260edi.27.2023.03.22.01.03.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Mar 2023 01:03:47 -0700 (PDT)
Date: Wed, 22 Mar 2023 09:03:45 +0100
From: Andrew Jones <ajones@ventanamicro.com>
To: Song Shuai <suagrfillet@gmail.com>
Cc: paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
	conor.dooley@microchip.com, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH] riscv: export cpu/freq invariant to scheduler
Message-ID: <20230322080345.j4oi7nz2nz4rk6ib@orel>
References: <20230322061856.2774840-1-suagrfillet@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230322061856.2774840-1-suagrfillet@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230322_010351_422260_E58B9B1B 
X-CRM114-Status: GOOD (  17.01  )
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

On Wed, Mar 22, 2023 at 02:18:56PM +0800, Song Shuai wrote:
> RISC-V now manages CPU topology using arch_topology which provides
> CPU capacity and frequency related interfaces to access the cpu/freq
> invariant in possible heterogeneous or DVFS-enabled platforms.
> 
> Here adds topology.h file to export the arch_topology interfaces for
> replacing the scheduler's constant-based cpu/freq invariant accounting.
> 
> Signed-off-by: Song Shuai <suagrfillet@gmail.com>
> ---
>  arch/riscv/include/asm/topology.h | 19 +++++++++++++++++++
>  1 file changed, 19 insertions(+)
>  create mode 100644 arch/riscv/include/asm/topology.h
> 
> diff --git a/arch/riscv/include/asm/topology.h b/arch/riscv/include/asm/topology.h
> new file mode 100644
> index 000000000000..14bbd2472af6
> --- /dev/null
> +++ b/arch/riscv/include/asm/topology.h
> @@ -0,0 +1,19 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +#ifndef __ASM_RISCV_TOPOLOGY_H
> +#define __ASM_RISCV_TOPOLOGY_H

riscv uses a single leading underscore.

> +
> +#include <linux/arch_topology.h>
> +
> +/* Replace task scheduler's default frequency-invariant accounting */
> +#define arch_scale_freq_tick topology_scale_freq_tick
> +#define arch_set_freq_scale topology_set_freq_scale
> +#define arch_scale_freq_capacity topology_get_freq_scale
> +#define arch_scale_freq_invariant topology_scale_freq_invariant
> +
> +/* Replace task scheduler's default cpu-invariant accounting */
> +#define arch_scale_cpu_capacity topology_get_cpu_scale
> +#define arch_update_cpu_topology topology_update_cpu_topology
> +
> +
> +#include <asm-generic/topology.h>
> +#endif /* __ASM_RISCV_TOPOLOGY_H */
> -- 
> 2.20.1
>

This looks reasonable, at least from a "do what arm64 does" type of
perspective. Why the RFC? Is it not tested?

Also, if you repost, could please neaten it up a bit? Aligning all
the defines would help and removing the extra blank line. Finally,
why wasn't the "/* Enable topology flag updates */" comment also
lifted from arm64 like the others?

Thanks,
drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
