Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46B29C00140
	for <linux-riscv@archiver.kernel.org>; Fri, 12 Aug 2022 15:14:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kn+n4nrpkAM8rH4BRh5hvlfF3YE+M90qrjsp+zNx3QM=; b=5D7gdSw9N/D9yx
	3DabtIRhvgIfwMKh51h0SQCPfkm0DDM+kkWxTN/B+wu/uHBu4DUEYNgVVUwEcHbRrusY88G16ADUd
	l0QKJP7q28qLPskdBpphN0lA+rQmRP4eITFgrAq2uHdj2DYwrRJmGj0g1o0grS/0GrgseBdivKts4
	qmD5ZeCt1N4BJW4dt6abVINt4eEPrPvULD76UF8LlgMyd1U1GQ4L4HD6vx32IBFRKIg7Q0aKJ++jF
	XF3zwV8xBpIfE52yIH5cTo7vz5V+JyUIcd10Dei+5ZkM8wwYQkXaCKTaIyKT49S2O/3fLMlZBpeQC
	580OgRPKsKh0Q7PMmdqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oMWMv-009ngf-9r; Fri, 12 Aug 2022 15:14:37 +0000
Received: from mail-yb1-xb2d.google.com ([2607:f8b0:4864:20::b2d])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oMWMU-009kj3-Hi
	for linux-riscv@lists.infradead.org; Fri, 12 Aug 2022 15:14:13 +0000
Received: by mail-yb1-xb2d.google.com with SMTP id e127so1915200yba.12
        for <linux-riscv@lists.infradead.org>; Fri, 12 Aug 2022 08:14:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=yd8VyqhtzyM6ZEInEbfE2JyYiF15nhDBXA4L5TdfTGc=;
        b=btl1BQ9tve0kold0rna8j/CAJg4qB7DnBToqcU+Wc3hkomfOISQ6RPeLPtd7zkxmVY
         bxM2yr8/eZgVG9ntyqbWzxChICoyT05/4048/FSkWfhnmcJz1+VmyxdZpVBM2vWJnDdn
         JEgm2y/hFIiWLYuaJEx1G3uCuUxd861Y76F2CiKOr2PdlbzhRnwuiXjE4KA75GJblmDr
         S/4Gp6qdH8EyjSdKzNC0l85QcW+0nySmf0Xmz4egejqotOM4sD5HsYkFfc9c8w62r9iH
         n9DT9L+1O9kIQNWlYTITS/s4Vh+vQTb7eSiyTroap7toetfFPNbIrHPNTFG1kSd2F/8L
         EnrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=yd8VyqhtzyM6ZEInEbfE2JyYiF15nhDBXA4L5TdfTGc=;
        b=VIW5KfHAkO9iM3OwSvBpGOcdVLTmitXd+HNxyxOMuoXJ/dnR86+GXKhjfQwbZREIb/
         FyGhPjCwM87/v8jVccdMmy4Vpptz5/b9Ai3pBcm0cGHHZzW7ZyP568DnorGqg2nOkXrN
         N4cu1KDBUTK4sMzmM6R1OC2RNIPiQuol/9+f7AQailBIlOA0GkyoThcHnGQVcoMSWxGP
         oJOOOBZU5pC6m9l2K8xUmzhx6t0OVjZvJHd9+lmdq8xdyEwLift7Ocwq4PL2BVOGlvBc
         mRnyHjJrfKpnbrY4+wGCTtwyIb2W0LVmtHOK9RZaZimYBBG6IjYt6OTXkVX29yu6thpI
         FPNw==
X-Gm-Message-State: ACgBeo1xrkIk54smZ7S8Jgz2OrJWJ4xSLIx3UY7jhut96BM0J7Ff+B88
	Wi8SC0szMsirquieTlbqvcCcfpSDztBbvvRfMTyEOA==
X-Google-Smtp-Source: AA6agR6kjJoTpTnW0Prv9OtYmaA3s1f0ypziwCmBUHtJjeUY9lERIPtyC76l7LUh5z6fNhJS8aWMYmuIe1gbafrFKpI=
X-Received: by 2002:a25:abd4:0:b0:67b:db4b:b682 with SMTP id
 v78-20020a25abd4000000b0067bdb4bb682mr3539688ybi.423.1660317247866; Fri, 12
 Aug 2022 08:14:07 -0700 (PDT)
MIME-Version: 1.0
References: <20220812142400.7186-1-palmer@rivosinc.com>
In-Reply-To: <20220812142400.7186-1-palmer@rivosinc.com>
From: Anup Patel <anup@brainfault.org>
Date: Fri, 12 Aug 2022 20:43:54 +0530
Message-ID: <CAAhSdy05ne-q069EwhTrmj+EvCxojOt-cvA1n9uaTuk1aa+P2g@mail.gmail.com>
Subject: Re: [PATCH] RISC-V: Don't truncate a hartid in the cbom-block-size
 mismatch warning
To: Palmer Dabbelt <palmer@rivosinc.com>
Cc: linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220812_081410_820127_B6E9B150 
X-CRM114-Status: GOOD (  16.51  )
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

On Fri, Aug 12, 2022 at 7:54 PM Palmer Dabbelt <palmer@rivosinc.com> wrote:
>
> I forgot to update this when sorting out the 64-bit hartid code.
>
> Fixes: 3aefb2ee5bdd ("riscv: implement Zicbom-based CMO instructions + the t-head variant")
> Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>

Looks good to me.

Reviewed-by: Anup Patel <anup@brainfault.org>

Regards,
Anup

> ---
>  arch/riscv/mm/dma-noncoherent.c | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
>
> diff --git a/arch/riscv/mm/dma-noncoherent.c b/arch/riscv/mm/dma-noncoherent.c
> index cd2225304c82..61a4337cf7b1 100644
> --- a/arch/riscv/mm/dma-noncoherent.c
> +++ b/arch/riscv/mm/dma-noncoherent.c
> @@ -83,8 +83,7 @@ void riscv_init_cbom_blocksize(void)
>         u32 val;
>
>         for_each_of_cpu_node(node) {
> -               unsigned long hartid;
> -               int cbom_hartid;
> +               unsigned long hartid, cbom_hartid;
>
>                 ret = riscv_of_processor_hartid(node, &hartid);
>                 if (ret)
> @@ -103,7 +102,7 @@ void riscv_init_cbom_blocksize(void)
>                         cbom_hartid = hartid;
>                 } else {
>                         if (riscv_cbom_block_size != val)
> -                               pr_warn("cbom-block-size mismatched between harts %d and %lu\n",
> +                               pr_warn("cbom-block-size mismatched between harts %lu and %lu\n",
>                                         cbom_hartid, hartid);
>                 }
>         }
> --
> 2.34.1
>
>
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
