Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76520C677C4
	for <linux-riscv@archiver.kernel.org>; Tue, 10 Jun 2025 22:51:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=n9Sc+2thd2K3bqMv4/vJ6QlU7WGMnBc7b2JL7+K02DM=; b=gz/yopWKDPogDKPpoRGYHrkNLb
	SBthhtH1xzlsHwg3igI7LI63J1jiJcDUoVKYS87Jc+5UQeKYWbF5cNFgXWG61Mg8tAFOIidNEqIF6
	0c4nhezqlyoZzOSktf+AEO6dGgLSJ4t5XoEqBEHj44ZPbS2Bc9eS/Xr50r+3SD6GhA7IrxvFJ8sj/
	h05Q1GJ9CN33tSDO7Fm3a+NQYFxJrrgdLFRThAPpf8GljHrMfLkdyPkA8Mo24dNID1xl8P9O55vmX
	sFdx4s84Du12a8Sx5Yq0fVZoGk37CzGTGBs0fqVoLitF8Txm4vNI3c9eCq8eAu6Dly7AlBnaIcFuU
	sT4h6V2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uP7o5-00000008JgK-1R7A;
	Tue, 10 Jun 2025 22:51:01 +0000
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uP6qV-000000088Uw-2VSy
	for linux-riscv@lists.infradead.org;
	Tue, 10 Jun 2025 21:49:28 +0000
Received: by mail-pf1-x436.google.com with SMTP id d2e1a72fcca58-742caef5896so4981303b3a.3
        for <linux-riscv@lists.infradead.org>; Tue, 10 Jun 2025 14:49:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20230601.gappssmtp.com; s=20230601; t=1749592166; x=1750196966; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TjJH9V4U9x9kcVvi7yh3O2o0xgnB/u5infpmLTK6+do=;
        b=wLgg2u2PHVMflvPNmrRqRRZ+MV02YrPHHBPC+QhTHLSRJanaUGEiqpwWVljpy7zhyt
         5X6uSJMH4upoGXeN2YVFiB5/2g2DYwcFvG3gH6HypQ9+jM+msVN6hXLaSS9dNHPx7ePs
         UY7wMVXehdEPTBAIJmr+r13aVS+p3frKOU3ppPbl6wYj/hX+LHqOqFKFxBkguYpy8dAI
         CXcqGf4SYjq9ie0Kjdx8CbqRe/lEVcMRA7inQyNEZ7Q5o3Bh9PkpuFVv1Xcv70wUBqz3
         zb9G7k13bH7uzTTAPVYimHn+Os2mKiQMYwHenQc+KxPpEE1MsIUcJtC+fizAzhKetzM7
         iqDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749592166; x=1750196966;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TjJH9V4U9x9kcVvi7yh3O2o0xgnB/u5infpmLTK6+do=;
        b=dd58XAw3Vgk6O41VhzkfWamr1zZNORh1lVHx1uwrREx1sE1KP9m77YTDoDK4EmOhXW
         T03oJxNUj/vB0F2C53wMAs+PKL5sojurPsA3FT9FtBnk905oVMTPW+10T7ADw9CeigrR
         CS0ZPlz9qQU9EH44vL8ZX9o58qekvJrCZIM8+yHnKiGjGkFKGzLevQQAUdosyN3lwPFT
         ja2zZRd8FRW9g0dRhhEV7JoUXJ2YCP959g9KZFOrmWFWXB9kc9uGfTs5WOWEdV0llBFO
         ZEhCX2vWPx5ZjBlo6QRDADeYww4dDgLBDqGT4tj6sRRapNVnf0BPXE8hOgyBjb/28SOL
         djDw==
X-Forwarded-Encrypted: i=1; AJvYcCU448zmjowzKx7clMsAcpQrMhorMUA6FZ7XrQ2b46uNR54RHFfURUtVQwEHtCP0+RCElhXEzbqddH6L4Q==@lists.infradead.org
X-Gm-Message-State: AOJu0Yw7Ehm3J7Wqda1ZOq2PIRmQvgi801s3jvvuyFxEBKCrx/SFf2pV
	DC5EYbBU+oIIoJ5N8p0cm7dTI3WxL6nLsRAoGJ0kOpRTKgS8uo1gxPVbiwzIa8V4xfA=
X-Gm-Gg: ASbGncvkzZfKuHA3CIOOsLQNP+1bUCJAW4qQYKS4uu7Agy0/zGnRph5Bv4xZA1WbmP2
	TNZWC3qOI4ZAPARAOkuc3f2jPvo8fEOTDZEi9d+E1IZ0XZO4HgI7s+9r4+u0Y7hSyzhfbiBo/Gz
	fDaR9DnCHmy5kMLODM+56ihfWMRUPkl3i/VaQkUy77OxKqkeCzXzF5DNL9PRSiz4O2CdDoJLcUC
	/bnhj5RN8YEtK97MtjpDF132bufeVBnn4uaJMH2r5c48vd37fjRFJMZVY6yB8S+i50aUcC9jnR7
	nh1fD1hPsSOi2alhtalP/1j8beaD7lDI/au9Jbx+jgOLRQUHbDbJUSTJS5HI
X-Google-Smtp-Source: AGHT+IFLPow5jYp5zMiGI3endsHgUoSX1Zhup9/kVCQx41lYvnTsdXa40pifHL03xoD2yGkUfXqlnA==
X-Received: by 2002:a05:6a00:1490:b0:73e:2d7a:8fc0 with SMTP id d2e1a72fcca58-7486cb219b7mr1369977b3a.1.1749592166377;
        Tue, 10 Jun 2025 14:49:26 -0700 (PDT)
Received: from localhost ([2620:10d:c090:500::7:116a])
        by smtp.gmail.com with UTF8SMTPSA id d2e1a72fcca58-7482af7aae7sm7871092b3a.49.2025.06.10.14.49.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 14:49:25 -0700 (PDT)
Date: Tue, 10 Jun 2025 14:49:25 -0700 (PDT)
X-Google-Original-Date: Tue, 10 Jun 2025 14:49:18 PDT (-0700)
Subject: Re: [PATCH 3/4] raid6: riscv: Allow code to be compiled in userspace
In-Reply-To: <20250610101234.1100660-4-zhangchunyan@iscas.ac.cn>
CC: Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu,
  Alexandre Ghiti <alex@ghiti.fr>, Charlie Jenkins <charlie@rivosinc.com>, song@kernel.org, yukuai3@huawei.com,
  linux-riscv@lists.infradead.org, linux-raid@vger.kernel.org, linux-kernel@vger.kernel.org, zhang.lyra@gmail.com
From: Palmer Dabbelt <palmer@dabbelt.com>
To: zhangchunyan@iscas.ac.cn
Message-ID: <mhng-A7AD8208-FB68-4F06-9E71-15DD06E99579@palmerdabbelt-mac>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250610_144927_635433_D68DE844 
X-CRM114-Status: GOOD (  17.91  )
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

This should be gated on something, as we don't have vector everywhere in 
userspace.  We could dynamically check via hwprobe(), that's probably 
best?

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
