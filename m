Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45768C677C4
	for <linux-riscv@archiver.kernel.org>; Tue, 10 Jun 2025 22:51:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=K4KaUl9SXrECFHA83+DADpSSJb9kSW/iO/T21rLYMfo=; b=bYklTe9WgjVWs+xfZ3Nv+DD20x
	BXsUCG5A59K3H98rcMjBPMCgB6rRzQYL5TxTWYg+lA3Vzvfer60DYgAplehhkY0AenvUmbJgLluKJ
	1aTyeTEXNxDTnW/VKOeO/7o97hrn05OW82JyjX2gaa1t7ejdcIxCy2cXIJhABNgLTKFgrpel1wKE7
	eZyOB9QVV1nfh6X+NoX9rFGqa6a9zS3FnYjlAm1gF3n4EKV/SkXCMAbsrvmteLJbpZBu4D8FmdMN/
	MikvOhV8FMQqyFb43X0XUDbWbYH64dqFi+nsLnN8/W6n6f1I6GfIcjPIZ8kyxVyVZZVZZjZkGQIyx
	81I3Q/Ng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uP7o6-00000008Jjd-3MYs;
	Tue, 10 Jun 2025 22:51:02 +0000
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uP716-000000089ya-29CE
	for linux-riscv@lists.infradead.org;
	Tue, 10 Jun 2025 22:00:25 +0000
Received: by mail-pf1-x431.google.com with SMTP id d2e1a72fcca58-742c3d06de3so6858281b3a.0
        for <linux-riscv@lists.infradead.org>; Tue, 10 Jun 2025 15:00:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20230601.gappssmtp.com; s=20230601; t=1749592824; x=1750197624; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GrBP6UsoGHLw+5eAdBdYWaCCq8gCbQTY1XMuaiY+2Lw=;
        b=JaZY4h9FMXH1Ms/Snlzx2XZvuIyoz63S5rrJtPJL5bNUafn3pyvmZlDzjnQiYUlDSh
         pw92lcwbUHqK4VhkdjRB5vdaO/WuzjVlmTyzRBRl8aF6MrdPrvnPYVQlO1xCX90bfbVj
         0K9FjqqEDr7UTIy40dlhX6RzfvRRY9AVkmxy98ysdgxJ3ISmBECuxTwJtuzQ5FhVGZMT
         VMD4yo3PQ7IIu56+62MtoJ0dhFRIwG9JkB9lqaGfRsDrK3mvvZomrAQ1XqFBNhp0uQmJ
         ehoaXeNtbPewKnJjT47OGjRuRWwB+YLLTyalfx/hjzdTdlBL507bmA/MNnTpaOfW9UMJ
         PtsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749592824; x=1750197624;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GrBP6UsoGHLw+5eAdBdYWaCCq8gCbQTY1XMuaiY+2Lw=;
        b=FyiliMmzOHGlZfmn27AAghmsgdZAjzKlbkPvtcAqFvDZeUHe8/pVYtujQ39hSbGjBI
         GYjo1GBOE1m+Usydn1mLLfWB+D73nSoS7a5fYQdxiXd9XorI9mbyXyvLZ5Atku4PUAQi
         8KNOHQnWqLKZzyw4m6jOz72iwRkplhdTj72XhsjOy4lW05ZyAhNR6Y5dcZtZqVIYks1w
         EyxRycLhjFW5b3kyVjA85kwYiwPE00qx8Xqtsry00a+oK2lZBuMm08YudCuulIxisJJe
         NsJYHJ8LVkR11QOZ0kFTHTr+zwtESP0MLuaOKjZrYQrEzRGF9Hb7PcFchWnfvsMsyXM0
         KmSQ==
X-Forwarded-Encrypted: i=1; AJvYcCWXGXNiAWQiGGO34iOrAsfR31jACi6ucqt8Hsu+Pdx65DcAuGs/Llm4Yfm1XYu36wQdZvCKlm46SIWlEw==@lists.infradead.org
X-Gm-Message-State: AOJu0YyH6vUWdiokruMi8P2e5zoYgCCX73YdhXKLupblIFbWoSE0Tyty
	SVTQxqlpwwV24xnFKhO3Vs+EEIOAufS0tZsLRWCAaGnLLiXoO9fGNu0zhEKMj7mftKc=
X-Gm-Gg: ASbGnctxs5Hh6Gs+x6Opcs7EoL4TlkVd//gEFHKht1bmnRl/AwHBTRpG4rw5ubRWJdv
	QQeD2TSzsuhi5gMUy4avrJaUEMRb9z6XCZw1B0f5/8PQDMTKSB1J+x23RhgnExc/uN4WBSnWUB7
	YOnqoa6ajCWW99AQ0dQKuODSv6n9GooeZhmsZhzh7uGuzOgaQN7sX/ss9+pNyJ/U03QoXxFDVJ8
	IjsOnVIJCkAAVHszYoeVxPMYhw9/A4b5Bde9haeDVb/uNXpFqR64VnqSAaerbENNVqK8nrCgj6S
	K7c8TKt12c2fybdnX4ZQN79LZlDUARJbY7kmMwe5qgFqi+ufdUCerc/p8eKY
X-Google-Smtp-Source: AGHT+IFllGevFXQlZAeRhC/LJ2atL5zsQ9GAQAUBz61xaiQ/Ef25jeJJ70xcxW+UT9y4LiRUnDhn3w==
X-Received: by 2002:a05:6a00:3d48:b0:740:9c57:3907 with SMTP id d2e1a72fcca58-7486fe83a5bmr529366b3a.19.1749592823472;
        Tue, 10 Jun 2025 15:00:23 -0700 (PDT)
Received: from localhost ([2620:10d:c090:500::7:116a])
        by smtp.gmail.com with UTF8SMTPSA id d2e1a72fcca58-7482b0c0138sm7876880b3a.110.2025.06.10.15.00.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 15:00:22 -0700 (PDT)
Date: Tue, 10 Jun 2025 15:00:22 -0700 (PDT)
X-Google-Original-Date: Tue, 10 Jun 2025 14:58:37 PDT (-0700)
Subject: Re: [PATCH 3/4] raid6: riscv: Allow code to be compiled in userspace
In-Reply-To: <20250610101234.1100660-4-zhangchunyan@iscas.ac.cn>
CC: Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu,
  Alexandre Ghiti <alex@ghiti.fr>, Charlie Jenkins <charlie@rivosinc.com>, song@kernel.org, yukuai3@huawei.com,
  linux-riscv@lists.infradead.org, linux-raid@vger.kernel.org, linux-kernel@vger.kernel.org, zhang.lyra@gmail.com
From: Palmer Dabbelt <palmer@dabbelt.com>
To: zhangchunyan@iscas.ac.cn
Message-ID: <mhng-BE370728-B36C-4BF9-B980-D6AF42A83272@palmerdabbelt-mac>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250610_150024_548207_190CBD8C 
X-CRM114-Status: GOOD (  19.95  )
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

On Tue, 10 Jun 2025 03:12:33 PDT (-0700), zhangchunyan@iscas.ac.cn wrote:
> To support userspace raid6test, this patch adds __KERNEL__ ifdef for kernel
> header inclusions also userspace wrapper definitions to allow code to be
> compiled in userspace.
>
> Signed-off-by: Chunyan Zhang <zhangchunyan@iscas.ac.cn>
> ---
>  lib/raid6/recov_rvv.c |  7 +------
>  lib/raid6/rvv.c       | 11 ++++-------
>  lib/raid6/rvv.h       | 15 +++++++++++++++
>  3 files changed, 20 insertions(+), 13 deletions(-)
>
> diff --git a/lib/raid6/recov_rvv.c b/lib/raid6/recov_rvv.c
> index 500da521a806..8f2be833c015 100644
> --- a/lib/raid6/recov_rvv.c
> +++ b/lib/raid6/recov_rvv.c
> @@ -4,13 +4,8 @@
>   * Author: Chunyan Zhang <zhangchunyan@iscas.ac.cn>
>   */
>
> -#include <asm/vector.h>
>  #include <linux/raid/pq.h>
> -
> -static int rvv_has_vector(void)
> -{
> -	return has_vector();
> -}
> +#include "rvv.h"
>
>  static void __raid6_2data_recov_rvv(int bytes, u8 *p, u8 *q, u8 *dp,
>  				    u8 *dq, const u8 *pbmul,
> diff --git a/lib/raid6/rvv.c b/lib/raid6/rvv.c
> index b193ea176d5d..99dfa16d37c7 100644
> --- a/lib/raid6/rvv.c
> +++ b/lib/raid6/rvv.c
> @@ -9,16 +9,13 @@
>   *	Copyright 2002-2004 H. Peter Anvin
>   */
>
> -#include <asm/vector.h>
> -#include <linux/raid/pq.h>
>  #include "rvv.h"
>
> +#ifdef __KERNEL__
>  #define NSIZE	(riscv_v_vsize / 32) /* NSIZE = vlenb */
> -
> -static int rvv_has_vector(void)
> -{
> -	return has_vector();
> -}
> +#else
> +#define NSIZE  16
> +#endif

and looking at the code a bit more, this makes this VLS when run in 
userspace.  So we etiher need a check for that, or to check VL in the 
loop.

>
>  static void raid6_rvv1_gen_syndrome_real(int disks, unsigned long bytes, void **ptrs)
>  {
> diff --git a/lib/raid6/rvv.h b/lib/raid6/rvv.h
> index 94044a1b707b..595dfbf95d4e 100644
> --- a/lib/raid6/rvv.h
> +++ b/lib/raid6/rvv.h
> @@ -7,6 +7,21 @@
>   * Definitions for RISC-V RAID-6 code
>   */
>
> +#ifdef __KERNEL__
> +#include <asm/vector.h>
> +#else
> +#define kernel_vector_begin()
> +#define kernel_vector_end()
> +#define has_vector()		(1)
> +#endif
> +
> +#include <linux/raid/pq.h>
> +
> +static int rvv_has_vector(void)
> +{
> +	return has_vector();
> +}
> +
>  #define RAID6_RVV_WRAPPER(_n)						\
>  	static void raid6_rvv ## _n ## _gen_syndrome(int disks,		\
>  					size_t bytes, void **ptrs)	\

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
