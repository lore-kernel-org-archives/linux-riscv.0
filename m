Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5194C001DF
	for <linux-riscv@archiver.kernel.org>; Thu,  3 Aug 2023 15:46:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tb4riMBSFNXePbMM255OSJo/amuW27MYzL+YewvgKjc=; b=OjVq9CTQsCSuD/
	fLNCo7buWF13sU4TmgdvE60CGHaa4vLDWG71/vNZIw9f4hAkiFPHGQa5tZ1VWebChqOrmKTunT3H0
	gAtfurVpZ9bVMR3Bi71AYtU6ysNu2VhuWtalis48PDILH9qZdN3ru0W4wGTD9nfbTXEHZjAURGe1j
	n80Paroag7nj+XzvlcmGZPaqAQ5N48CZ19oMEoip/Zo2atTs+GdizBbF34P/aMMa0zrsj6DdV6KDh
	jIyjp5FWOlW74Dtj0O4oqrWX/eOt1oOoIKgYtwylTaPh+bXpL3Z0ceDK2heKNJStAh8oZg7pjVKVM
	NDoOoGheuiweEhCVbIAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qRaWu-00AF0V-2w;
	Thu, 03 Aug 2023 15:46:24 +0000
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qRaWr-00AExe-1b
	for linux-riscv@lists.infradead.org;
	Thu, 03 Aug 2023 15:46:23 +0000
Received: by mail-ed1-x531.google.com with SMTP id 4fb4d7f45d1cf-51e28cac164so4797551a12.1
        for <linux-riscv@lists.infradead.org>; Thu, 03 Aug 2023 08:46:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1691077576; x=1691682376;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=W4fTeL2P8Yv+tDw/vvA4jiimjzUtsJmuMUQjaZcjxkA=;
        b=Vh0Wyic7PtflwEr+T5yKOG8q6hKR0UHdoX5FHJSQHvkqPcc00Pgx5VLHGP9jNP/wCN
         JB8NMQy/EZfAz6SpIqvodOOutaoBSLPEun/+LDcOmRB29kwOoxnSsKzQY02zTl6RJlwI
         tsFvOHj8eFSdpe2fyDZ5IbQCphql6LzCvMvyMSA69xunCGoeQmqsY+hdL7qA/58BPf1w
         f/R/BhBYPhLhRQkig9/vxK6Nq55VoznTvEo7TWAe3KbE2c3tGFf/kleXFkjz032QgzUi
         5THpIV1PGsUsyQssn64a2tbboQnnqloHi5IfO1+QXR+ewcm0+R2X3/21aFTEx/+IgMS/
         UZrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691077576; x=1691682376;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=W4fTeL2P8Yv+tDw/vvA4jiimjzUtsJmuMUQjaZcjxkA=;
        b=QNVgYZPMYV07GamKGz3KZg0kr2xun9f2DPVfEM8IrRdJlVc2dptRM1n/PBcILnxSK5
         ACCPFMGYuwFL8vX1wK7wfOv5NADt6nu87YK/OA0xuPXm2yhs5VWxlGY9sH0WrkdIbodD
         931i5TMUnoVOMdbhv1iemmgPKmFrwe+tn8x36ddqwzFUlKeVCXnwGXIYxgnl+P5sENwt
         ugbI3B0dYUeGzXhLFfpmI+slH63mMRSaI6VKGOGisT5XvvcmNm6q8Eh+JGqyynnOPWw0
         TDCKglEvzoRyauQRzftZNFB+x9n+SG6Mgr9h9Nis4eYJL1qtuEeQdTU21+tvw8SKzzrj
         CCfg==
X-Gm-Message-State: ABy/qLYWN9mqMUrWfkSZq6uQXaSfZMzo5bycAZNq7rchs5U3d3+CT53r
	JVDPoaSKYfD7ZzIKpyxvtYY=
X-Google-Smtp-Source: APBJJlGpCCrBoijXOyRlK610Lg+G+JM7sm4kVHl3xf3UIndFTQtPEvCd26TO3FcbjXknoaEQzUEaKg==
X-Received: by 2002:a05:6402:520e:b0:51d:cf7b:c9f0 with SMTP id s14-20020a056402520e00b0051dcf7bc9f0mr11203868edd.12.1691077575654;
        Thu, 03 Aug 2023 08:46:15 -0700 (PDT)
Received: from andrea (host-82-57-177-142.retail.telecomitalia.it. [82.57.177.142])
        by smtp.gmail.com with ESMTPSA id h21-20020aa7c955000000b005230f52195esm929046edt.44.2023.08.03.08.46.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Aug 2023 08:46:15 -0700 (PDT)
Date: Thu, 3 Aug 2023 17:45:36 +0200
From: Andrea Parri <parri.andrea@gmail.com>
To: mathieu.desnoyers@efficios.com, paulmck@kernel.org,
	paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	mmaas@google.com, hboehm@google.com, striker@us.ibm.com
Subject: Re: [RFC PATCH] membarrier: riscv: Provide core serializing command
Message-ID: <ZMvLoI6PxLR8RJvR@andrea>
References: <20230803040111.5101-1-parri.andrea@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230803040111.5101-1-parri.andrea@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230803_084621_533189_D81B315D 
X-CRM114-Status: GOOD (  24.54  )
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

Adding Martin, Hans and Derek to the Cc: list,

  Andrea


On Thu, Aug 03, 2023 at 06:01:11AM +0200, Andrea Parri wrote:
> Signed-off-by: Andrea Parri <parri.andrea@gmail.com>
> Suggested-by: Palmer Dabbelt <palmer@dabbelt.com>
> ---
> For the MEMBARRIER maintainers:  RISC-V does not have "core serializing
> instructions", meaning that there is no occurence of such a term in the
> RISC-V ISA.  The discussion and git history about the SYNC_CORE command
> suggested the implementation below: a FENCE.I instruction "synchronizes
> the instruction and data streams" [1] on a CPU; in litmus parlance,
> 
>   (single-hart test)
> 
>   CPU0
> 
>   UPDATE text   ;
>   FENCE.I       ;
>   EXECUTE text  ;  /* <-- will execute the updated/new text */
> 
> 
>   (message-passing test)
> 
>   CPU0             CPU1
> 
>   UPDATE text   |  IF (flag) {     ;
>   WMB           |    FENCE.I       ;
>   SET flag      |    EXECUTE text  ;  /* execute the new text */
>                 |  }               ;
> 
> 
>   (and many others, including "maybe"s!  ;-) )
> 
> How do these remarks resonate with the semantics of "a core serializing
> instruction" (to be issued before returning to user-space)?
> 
> RISCV maintainers, I'm missing some paths to user-space? (besides xRET)
> 
>   Andrea
> 
> [1] https://github.com/riscv/riscv-isa-manual/blob/main/src/zifencei.adoc
> 
> 
>  .../sched/membarrier-sync-core/arch-support.txt   |  2 +-
>  arch/riscv/Kconfig                                |  2 ++
>  arch/riscv/include/asm/sync_core.h                | 15 +++++++++++++++
>  3 files changed, 18 insertions(+), 1 deletion(-)
>  create mode 100644 arch/riscv/include/asm/sync_core.h
> 
> diff --git a/Documentation/features/sched/membarrier-sync-core/arch-support.txt b/Documentation/features/sched/membarrier-sync-core/arch-support.txt
> index 23260ca449468..a17117d76e6d8 100644
> --- a/Documentation/features/sched/membarrier-sync-core/arch-support.txt
> +++ b/Documentation/features/sched/membarrier-sync-core/arch-support.txt
> @@ -44,7 +44,7 @@
>      |    openrisc: | TODO |
>      |      parisc: | TODO |
>      |     powerpc: |  ok  |
> -    |       riscv: | TODO |
> +    |       riscv: |  ok  |
>      |        s390: |  ok  |
>      |          sh: | TODO |
>      |       sparc: | TODO |
> diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> index 4c07b9189c867..ed7ddaedc692e 100644
> --- a/arch/riscv/Kconfig
> +++ b/arch/riscv/Kconfig
> @@ -27,6 +27,7 @@ config RISCV
>  	select ARCH_HAS_GCOV_PROFILE_ALL
>  	select ARCH_HAS_GIGANTIC_PAGE
>  	select ARCH_HAS_KCOV
> +	select ARCH_HAS_MEMBARRIER_SYNC_CORE
>  	select ARCH_HAS_MMIOWB
>  	select ARCH_HAS_NON_OVERLAPPING_ADDRESS_SPACE
>  	select ARCH_HAS_PMEM_API
> @@ -35,6 +36,7 @@ config RISCV
>  	select ARCH_HAS_SET_MEMORY if MMU
>  	select ARCH_HAS_STRICT_KERNEL_RWX if MMU && !XIP_KERNEL
>  	select ARCH_HAS_STRICT_MODULE_RWX if MMU && !XIP_KERNEL
> +	select ARCH_HAS_SYNC_CORE_BEFORE_USERMODE
>  	select ARCH_HAS_TICK_BROADCAST if GENERIC_CLOCKEVENTS_BROADCAST
>  	select ARCH_HAS_UBSAN_SANITIZE_ALL
>  	select ARCH_HAS_VDSO_DATA
> diff --git a/arch/riscv/include/asm/sync_core.h b/arch/riscv/include/asm/sync_core.h
> new file mode 100644
> index 0000000000000..d3ec6ac47ac9b
> --- /dev/null
> +++ b/arch/riscv/include/asm/sync_core.h
> @@ -0,0 +1,15 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +#ifndef _ASM_RISCV_SYNC_CORE_H
> +#define _ASM_RISCV_SYNC_CORE_H
> +
> +/*
> + * Ensure that a core serializing instruction is issued before returning
> + * to user-mode.  RISC-V implements return to user-space through an xRET
> + * instruction, which is not core serializing.
> + */
> +static inline void sync_core_before_usermode(void)
> +{
> +	asm volatile ("fence.i" ::: "memory");
> +}
> +
> +#endif /* _ASM_RISCV_SYNC_CORE_H */
> -- 
> 2.34.1
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
