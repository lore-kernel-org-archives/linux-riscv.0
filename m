Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97BBEC4332F
	for <linux-riscv@archiver.kernel.org>; Fri,  2 Dec 2022 18:03:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=DhkK+ktmllFRSsX9VsUrHgUjX6/LBAtC/qRvh/NEkjg=; b=DY3yYbdD88h/h+pvMvO+5PUSlH
	kekYLns/EFedDFdwZgdYzkxsEoJ8GXADTuIuL8YK5bCFmkU3ofHcva1TS4MRDDADFekNlh8owuPao
	0AsjEy0RXFx9lJzkZTitra9GG/EuBQFFMBpTgvUBuSGydh9GYIcxpBzqCx+Xk5EbdDpta4W+0ylAX
	D7XVvHqBmgfSPzApu5rWxy0YljeZJQuB+fMKgva3Y/S6UISRml+0lEV1vfe9RVWCllSEy7KrOfh5+
	DzAVx5ZzQetQxOQS3+QwqM6sl6XanukkD+LQSR1OJ2wYRQP6U2OxN7ReCzrtmmOuzhw5JotOYOpGz
	biva2BoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p1ANl-000Weg-Tx; Fri, 02 Dec 2022 18:03:29 +0000
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p1ANi-000WdB-Ls
	for linux-riscv@lists.infradead.org; Fri, 02 Dec 2022 18:03:28 +0000
Received: by mail-pf1-x434.google.com with SMTP id c15so5576396pfb.13
        for <linux-riscv@lists.infradead.org>; Fri, 02 Dec 2022 10:03:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1Fj/GOmrzncgAG1HwiGCIj6uObETJ2A+WRaEGkSptgo=;
        b=fIdthOwAqz6rz4ph0qN2N5M8ImkazzFm8W3RM7IIh70xntOL1pP7mfPNyBUCnegxFH
         dwdRVH092Q/RsgF2xSXkKQJM+6+9V1QOBPhnaitJFsNkcWJL4wUuLpohsMEXKuSnaWBu
         kp+wTia6DbZGzzB2a2DGc2ZNYvhewKWVBOIourDOWPuhYjhUj+gDKH4o7ovOk4NSkK5a
         ZL+VE7WSOClVj2/p08efPZPfHfoqWChsY1BomaI4n1xxIuUhzZOT8HI87Dq7tNOzB4M3
         xWTvFDLZQ5qdDQDcd4tnxGKFQZWsVfsadritMvCGliMHfMNQZ+PaZzy94VLxDg/LvwNw
         1S6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1Fj/GOmrzncgAG1HwiGCIj6uObETJ2A+WRaEGkSptgo=;
        b=0/g6D70RpTE8O5gjTUaN1UMw2KeZBTsk82USuYb0ExOl9FVPU23iNUQv1ZZ8YHdmgB
         dK5hmbrH2u0pQDl8EjgR24VnK5Qshr1hwAc6GruXvhJT5gW4A3Vb8/13EtY+PFIeJ8JE
         w/Cry8iArDwaJjNLIAv1ODynWB5+I1LW54rmK0/F56V83ReSDw+TrCXK1JUqhPgFMDHP
         vdjJFmM7KOG8SdkTdtNEKEra38G+7zqqMOIkU6YBk6LV126ClI4w1rT+chVNC09xoS+5
         k6TMnUH6SbP1v5SVWWGWC1U4uTftnKbqLdFSvkbeEOvQKsYgXhURnlwFaJ438fwrgKqZ
         F9jA==
X-Gm-Message-State: ANoB5pnmifzRYZiXb4dPYjex70I8iDQqIViXDfzUSSz7pH/KkZXFagIU
	vryXIQg4zGcRAM1XTjkw0e3TYg==
X-Google-Smtp-Source: AA0mqf6OKlfF860xpvjuMskcHd4UtSYgsGvzT6gTPKffFg+HpkwWymVJj1rCSlnbaq2p434WklJIgg==
X-Received: by 2002:a63:4b0f:0:b0:439:3b80:615d with SMTP id y15-20020a634b0f000000b004393b80615dmr47409964pga.255.1670004203619;
        Fri, 02 Dec 2022 10:03:23 -0800 (PST)
Received: from localhost ([50.221.140.188])
        by smtp.gmail.com with ESMTPSA id j9-20020a654d49000000b0046ae5cfc3d5sm4331272pgt.61.2022.12.02.10.03.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Dec 2022 10:03:23 -0800 (PST)
Date: Fri, 02 Dec 2022 10:03:23 -0800 (PST)
X-Google-Original-Date: Fri, 02 Dec 2022 10:03:08 PST (-0800)
Subject: Re: [PATCH V2] selftests/vDSO: Add riscv getcpu & gettimeofday test
In-Reply-To: <20221103080451.1642500-1-guoren@kernel.org>
CC: Arnd Bergmann <arnd@arndb.de>, guoren@kernel.org, shuah@kernel.org,
  linux-arch@vger.kernel.org, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
  linux-kselftest@vger.kernel.org, haocheng.zy@linux.alibaba.com, han_mao@linux.alibaba.com,
  guoren@linux.alibaba.com, Paul Walmsley <paul.walmsley@sifive.com>, enh@google.com
From: Palmer Dabbelt <palmer@dabbelt.com>
To: guoren@kernel.org, skhan@linuxfoundation.org
Message-ID: <mhng-d689ac9f-1a92-43a7-91b4-2be89c388e8d@palmer-ri-x1c9a>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221202_100326_744076_54F425EE 
X-CRM114-Status: GOOD (  17.10  )
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

On Thu, 03 Nov 2022 01:04:51 PDT (-0700), guoren@kernel.org wrote:
> From: Guo Ren <guoren@kernel.org>
>
> Enable vDSO getcpu & gettimeofday test for riscv. But only riscv64
> supports __vdso_gettimeofday and riscv32 is under development.
>
> VERSION
> {
>         LINUX_4.15 {
>         global:
>                 __vdso_rt_sigreturn;
>                 __vdso_gettimeofday;
>                 __vdso_clock_gettime;
>                 __vdso_clock_getres;
>                 __vdso_getcpu;
>                 __vdso_flush_icache;
>         local: *;
>         };
> }
>
> Co-developed-by: haocheng.zy <haocheng.zy@linux.alibaba.com>
> Signed-off-by: haocheng.zy <haocheng.zy@linux.alibaba.com>
> Suggested-by: Mao Han <han_mao@linux.alibaba.com>
> Reviewed-by: Shuah Khan <skhan@linuxfoundation.org>
> Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
> Signed-off-by: Guo Ren <guoren@kernel.org>
> Cc: Paul Walmsley <paul.walmsley@sifive.com>
> Cc: Palmer Dabbelt <palmer@dabbelt.com>
> Cc: Elliott Hughes <enh@google.com>
> ---
>  tools/testing/selftests/vDSO/vdso_test_getcpu.c       | 4 ++++
>  tools/testing/selftests/vDSO/vdso_test_gettimeofday.c | 3 +++
>  2 files changed, 7 insertions(+)
>
> diff --git a/tools/testing/selftests/vDSO/vdso_test_getcpu.c b/tools/testing/selftests/vDSO/vdso_test_getcpu.c
> index fc25ede131b8..1df5d057d79f 100644
> --- a/tools/testing/selftests/vDSO/vdso_test_getcpu.c
> +++ b/tools/testing/selftests/vDSO/vdso_test_getcpu.c
> @@ -14,7 +14,11 @@
>  #include "../kselftest.h"
>  #include "parse_vdso.h"
>
> +#if defined(__riscv)
> +const char *version = "LINUX_4.15";
> +#else
>  const char *version = "LINUX_2.6";
> +#endif
>  const char *name = "__vdso_getcpu";
>
>  struct getcpu_cache;
> diff --git a/tools/testing/selftests/vDSO/vdso_test_gettimeofday.c b/tools/testing/selftests/vDSO/vdso_test_gettimeofday.c
> index 8ccc73ed8240..e411f287a426 100644
> --- a/tools/testing/selftests/vDSO/vdso_test_gettimeofday.c
> +++ b/tools/testing/selftests/vDSO/vdso_test_gettimeofday.c
> @@ -27,6 +27,9 @@
>  #if defined(__aarch64__)
>  const char *version = "LINUX_2.6.39";
>  const char *name = "__kernel_gettimeofday";
> +#elif defined(__riscv)
> +const char *version = "LINUX_4.15";
> +const char *name = "__vdso_gettimeofday";
>  #else
>  const char *version = "LINUX_2.6";
>  const char *name = "__vdso_gettimeofday";

Reviewed-by: Palmer Dabbelt <palmer@rivosinc.com>
Acked-by: Palmer Dabbelt <palmer@rivosinc.com>

Looks like Shauh usually takes patches for this vdso selftest, but happy 
to take it through the RISC-V tree if that's easier.  Either way's fine 
with me, I'm leaving it in patchwork for now as a reminder.

Thanks!

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
