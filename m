Return-Path: <SRS0=fWiV=JZ=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3C006C433B4
	for <linux-riscv@archiver.kernel.org>; Wed, 28 Apr 2021 03:41:31 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9DA7C6140A
	for <linux-riscv@archiver.kernel.org>; Wed, 28 Apr 2021 03:41:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9DA7C6140A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=KREvKf4iFRybqEiwFi1c41ZRNRPelVkMOiiLJ8jhHHU=; b=d4YQYw3bxq9KZyLNklqcEdZc6
	dPacIk6ka6cKPy+0kJRpMseEucxbex02/1ptrFd2pqYiJs5jFF16bieABV5M9m7LejgV20MxHAITK
	CnPsQglwLzt4TCs7JdCEglWZCwCwGoiB1HLhtm/eaNEa/Ygbz47lj49Sb5PzhM9NqS7+9de+ylOqT
	z75lVLxzLh5M2bNc+IXZZDVfTXgM26sG1XtdtLU8bTumlM5NgvFM1fBgMD8F7O4Aj0pgzSKEuymJq
	qi3IWw2gQWajcSWgP7+Qp8wUXlEAxvO8xu7FPso3NIeeO3DrMbV03VtQrQQdCf1E/1McL54zJrs/r
	9CNM6O9vQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lbb4Z-002gxz-Vv; Wed, 28 Apr 2021 03:41:12 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lbb4V-002gxe-9a
 for linux-riscv@desiato.infradead.org; Wed, 28 Apr 2021 03:41:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Type:Cc:To:Subject:Message-ID
 :Date:From:In-Reply-To:References:MIME-Version:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=unJ/nW7IwIPU8FuEPxu2WTBi2sq/u62GKZm9+1iXWxg=; b=QGVxfbDHIl7MlX41CQCfmj0qEh
 jjzuoi17VzYNSBZI3tK8BNx1nVLm/pXgoA5TYOUddvaf6E9cdra5SxO7vJAj3mIOP5Jcb3GcxuLJA
 rhehOyHiHwmcRsGTrp2q0w24Wjh0inuhdkv7xzdFqqHFqQslL/iT46LboGAUQev6Qe52QWxsgk9/o
 8AzjvCrfODAme4j0uIgyzZ/trbhbCb+jo8+QOB0TEG/yBLocXhiyQ//9QEW/mfkhJtP1/2t6Rzl9K
 nLS2XJ/gDHqOxZDYHFYQ1srLqIzS+J/EUCYxCFBK3G7SnN+67/xOFE5JLpyQx1nPcf8CZeLjbsEcG
 xUD5BUdg==;
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lbb4S-00HA8i-Ci
 for linux-riscv@lists.infradead.org; Wed, 28 Apr 2021 03:41:05 +0000
Received: by mail-wm1-x32a.google.com with SMTP id
 a22-20020a05600c2256b029014294520f18so3552812wmm.1
 for <linux-riscv@lists.infradead.org>; Tue, 27 Apr 2021 20:41:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=unJ/nW7IwIPU8FuEPxu2WTBi2sq/u62GKZm9+1iXWxg=;
 b=QZH1yvadssNTkCLMPr/YyOHxUqvnHGZdJCeQ0QG07wZ0c8v0Tq0mdqoauuoTNo8c5t
 52FJF+EF5/YcdSBwaM+q6wczSHVyrqMzy7KO8c6WMEyJ5VU2ugjm8CcPR2jttv1T/2O6
 OQX7EngW1Kd701aUoIHwM9CM6zKwoGh0O7QqHeOzcDnsSBDAxguVsEwXzdNPa965DUQx
 uNdKG3sM+V3YHeIQciUPGRNi+aEFtzAjLBmOvqJwb43mMmKtUGURK7e1fhZdAufBrwdf
 9VRI74ZT2q5ZsWsHB9vphithqi77n7VEtA8rNG3EUPgub2WbkFATcl1aDrnfbtmPUPpO
 g+gQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=unJ/nW7IwIPU8FuEPxu2WTBi2sq/u62GKZm9+1iXWxg=;
 b=SWqNN81alTZeFV8hfByauXcHWcl9H2kSHXdVbP7DmF8A8GqFhJDZ5GH54zDUl7AfLu
 P9TetkDqHGzsq+RuAUDMuz0U8Aw9evYzLlB5EoYmM5+Je7DFG/TwvsI0kE1uahVBVeIe
 tvctuE5/QUXeLXU/zmc5RJHhMXBEGVJ5B/yU8LAtDDXpXbU8Syau74SQ7E8gFQroSlal
 yr3cMSiFX2IkKX7aKXzTeUwyXf+LI9NVLMY9f7+WsCH/bsPahqyC18K6r1fgeENjiAUH
 g3w6xY+LtIIuQzGrGDUXVXKHcFy1tf515eN3oxAliH+Bbc0jXqS4yY23CjaoLHsFV8in
 SP2w==
X-Gm-Message-State: AOAM531PFKDY0qQnd7NQk6b4hlCilrTwevbB+Luya0uP0Pzu0dAsk80y
 kNUG2scRGd6JobuPTslPSAfJ59YFLRNLe1LUjoqGyA==
X-Google-Smtp-Source: ABdhPJzI3LHtQ4OsT4z7dItzbxcMlwFjrS5Ewft66N9Bnj+ahbwhYUYdFV/mrMnOfwdZlsG+w0ppsAHoZ3+66SZ6bpk=
X-Received: by 2002:a7b:c348:: with SMTP id l8mr1765461wmj.152.1619581262305; 
 Tue, 27 Apr 2021 20:41:02 -0700 (PDT)
MIME-Version: 1.0
References: <20210428033415.107756-1-palmer@dabbelt.com>
In-Reply-To: <20210428033415.107756-1-palmer@dabbelt.com>
From: Anup Patel <anup@brainfault.org>
Date: Wed, 28 Apr 2021 09:10:51 +0530
Message-ID: <CAAhSdy3Qnx+3tCecXLDw=1m45zMU67n3K4_YTYA2127mZm+Kfg@mail.gmail.com>
Subject: Re: [PATCH] RISC-V: Always define XIP_FIXUP
To: Palmer Dabbelt <palmer@dabbelt.com>
Cc: linux-riscv <linux-riscv@lists.infradead.org>, 
 Paul Walmsley <paul.walmsley@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Andrew Morton <akpm@linux-foundation.org>, Atish Patra <Atish.Patra@wdc.com>, 
 Anup Patel <Anup.Patel@wdc.com>, Kefeng Wang <wangkefeng.wang@huawei.com>, 
 Mike Rapoport <rppt@kernel.org>, Vitaly Wool <vitaly.wool@konsulko.com>, 
 Alexandre Ghiti <alex@ghiti.fr>, Greentime Hu <greentime.hu@sifive.com>,
 0x7f454c46@gmail.com, chenhuang5@huawei.com, 
 "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>,
 kernel-team@android.com, 
 Palmer Dabbelt <palmerdabbelt@google.com>, Guenter Roeck <linux@roeck-us.net>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210427_204104_589920_BAE09081 
X-CRM114-Status: GOOD (  17.65  )
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

On Wed, Apr 28, 2021 at 9:05 AM Palmer Dabbelt <palmer@dabbelt.com> wrote:
>
> From: Palmer Dabbelt <palmerdabbelt@google.com>
>
> XIP depends on MMU, but XIP_FIXUP is defined throughout the kernel in
> order to avoid excessive ifdefs.  This just makes sure to always define
> XIP_FIXIP, which will fix MMU=n builds.
>
> Fixes: 44c922572952 ("RISC-V: enable XIP")
> Reported-by: Guenter Roeck <linux@roeck-us.net>
> Signed-off-by: Palmer Dabbelt <palmerdabbelt@google.com>

Looks good to me.

Reviewed-by: Anup Patel <anup@brainfault.org>

Regards,
Anup

> ---
>  arch/riscv/include/asm/pgtable.h | 24 ++++++++++++------------
>  1 file changed, 12 insertions(+), 12 deletions(-)
>
> diff --git a/arch/riscv/include/asm/pgtable.h b/arch/riscv/include/asm/pgtable.h
> index 2f1384e14e31..fd749351f432 100644
> --- a/arch/riscv/include/asm/pgtable.h
> +++ b/arch/riscv/include/asm/pgtable.h
> @@ -73,18 +73,6 @@
>  #endif
>  #define FIXADDR_START    (FIXADDR_TOP - FIXADDR_SIZE)
>
> -#ifdef CONFIG_XIP_KERNEL
> -#define XIP_OFFSET             SZ_8M
> -#define XIP_FIXUP(addr) ({                                                     \
> -       uintptr_t __a = (uintptr_t)(addr);                                      \
> -       (__a >= CONFIG_XIP_PHYS_ADDR && __a < CONFIG_XIP_PHYS_ADDR + SZ_16M) ?  \
> -               __a - CONFIG_XIP_PHYS_ADDR + CONFIG_PHYS_RAM_BASE - XIP_OFFSET :\
> -               __a;                                                            \
> -       })
> -#else
> -#define XIP_FIXUP(addr)                (addr)
> -#endif /* CONFIG_XIP_KERNEL */
> -
>  #endif
>
>  #ifndef __ASSEMBLY__
> @@ -101,6 +89,18 @@
>  #include <asm/pgtable-32.h>
>  #endif /* CONFIG_64BIT */
>
> +#ifdef CONFIG_XIP_KERNEL
> +#define XIP_OFFSET             SZ_8M
> +#define XIP_FIXUP(addr) ({                                                     \
> +       uintptr_t __a = (uintptr_t)(addr);                                      \
> +       (__a >= CONFIG_XIP_PHYS_ADDR && __a < CONFIG_XIP_PHYS_ADDR + SZ_16M) ?  \
> +               __a - CONFIG_XIP_PHYS_ADDR + CONFIG_PHYS_RAM_BASE - XIP_OFFSET :\
> +               __a;                                                            \
> +       })
> +#else
> +#define XIP_FIXUP(addr)                (addr)
> +#endif /* CONFIG_XIP_KERNEL */
> +
>  #ifdef CONFIG_MMU
>  /* Number of entries in the page global directory */
>  #define PTRS_PER_PGD    (PAGE_SIZE / sizeof(pgd_t))
> --
> 2.31.1.498.g6c1eba8ee3d-goog
>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
