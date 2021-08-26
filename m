Return-Path: <SRS0=v94U=NR=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8F083C432BE
	for <linux-riscv@archiver.kernel.org>; Thu, 26 Aug 2021 06:47:38 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 530AD610A3
	for <linux-riscv@archiver.kernel.org>; Thu, 26 Aug 2021 06:47:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 530AD610A3
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=FEGeYokBK3Qvs1aI7SldODAuS7I51+U6USyVxflEOXc=; b=ZpG1tMdrsgywKlLbr77cjylBdL
	Vd3dr4vwurQG708P9rSMGw9wGFF58egfTzoqAJH4PgVeJkU4OtBU5EVz0Dx7Hz2Uny/WRGh8tuQlM
	rMGTa7VfEIj7Rndq8Y1xZgdEADPF1L8aeEVfK50+Ig2rDQL3whlnoUmNFST1zhOWRFiWDWOT0wiHq
	ycrwMhAYqeenci0b9MgVLqrBpZhGClEYZYWnuoHYr5zalmIm72la2aFP0p/EUv7fETQkljIeUjmr+
	o6PkoNvIzdzDXi+Ly08KFKOll1YQBF8F5DnkSejDTKGVwvOcsg7F8+r8Z6x5YMPF7h+6pbVgZ1uN8
	bBvHtEeQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mJ9AQ-009JxT-89; Thu, 26 Aug 2021 06:47:14 +0000
Received: from mail-pg1-x536.google.com ([2607:f8b0:4864:20::536])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mJ9AG-009Jsr-9h
 for linux-riscv@lists.infradead.org; Thu, 26 Aug 2021 06:47:05 +0000
Received: by mail-pg1-x536.google.com with SMTP id x4so2290299pgh.1
 for <linux-riscv@lists.infradead.org>; Wed, 25 Aug 2021 23:47:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20150623.gappssmtp.com; s=20150623;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=IfBQ9EQzqzyBufGLfayWB/BJYht5LPZwpL5oj1Hp0nE=;
 b=ko9rI9c02DG8tUV3UZ4LLccgE4AJB8nGYFDS6AJvgTUZUAFTvAVtZ0ZHp1A2xZF6Fl
 cKdhqouTOATo01CqdK27oiKOWDt0xxdqVpDIbYcZcIKSb7vOwK1+T2DhA3ZIrwLq4R9e
 6Ds3ub596c5L7iZNhK5LojA0pvQ3fDGUthgXidz1+G1ABqgFOfa9qaYKYO7/lrzHdYck
 DGX6I4sKPiOPgpf2WIiv2ODwYgArWUF9G+neuqKFxuwZn1qgAcuiV3VPAEvYRT1xjpfJ
 uGid1Aqg1Y5H0ZBIZHedHUeTG3I0/VkxMiTH03yT+hJTJDe2Xf7uqU7kvXEfs6o59Jqh
 dUzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=IfBQ9EQzqzyBufGLfayWB/BJYht5LPZwpL5oj1Hp0nE=;
 b=EBpFCp0mzTP2vAwQATaypaSVrCkNnU82BZtWVaTcN+mxUdgZycA6QuNydAvZQfiouH
 1cVfuD6fZGg/Slc7U8YpkUVx4dELTqKUq4y1TDSPOAhyS39AfY/nP3aWH5Ach1IaidRC
 VFWFZ+sTXoiHT/aDlrVPHjbCgjsn4kz+gzzwbPoaZ+WgiIQjZUGBgvnp2oHUbD8zi3Tr
 77sr/on+5em6I3lgwl6R8oDaGcyo99C8wTPbIvd6w47Gtqo7eoWmta1FRb2qtNAByBE1
 Mr/avHTwnPRrvA0ocoUa03w8HFpfaLqQDiF1rgS9TgD/tFB5bfScIn8BWMAPtzrqIW+D
 MJOw==
X-Gm-Message-State: AOAM531Oh5mwk0R6WIP9wzrF5biZo5Mcv0jTavbz4GoiN/0ZRRd6NKEM
 vKgxz2HuEaMgoTxjFUqXyAKmKS5jOjVXhqPs
X-Google-Smtp-Source: ABdhPJz1Q0tOaDM1WwAdmpawbok0FA0f+AvBAlnQ6E00NrGszhDhvia9YYddDR5U8DMb9twpGx8nWA==
X-Received: by 2002:aa7:8c44:0:b0:3f1:ec34:6438 with SMTP id
 e4-20020aa78c44000000b003f1ec346438mr2278174pfd.6.1629960423223; 
 Wed, 25 Aug 2021 23:47:03 -0700 (PDT)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223])
 by smtp.gmail.com with ESMTPSA id h9sm8334865pjg.9.2021.08.25.23.47.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Aug 2021 23:47:02 -0700 (PDT)
Date: Wed, 25 Aug 2021 23:47:02 -0700 (PDT)
X-Google-Original-Date: Wed, 25 Aug 2021 23:47:00 PDT (-0700)
Subject: Re: [PATCH 0/2] riscv: improve __ex_table section handling
In-Reply-To: <20210809012509.4983c1d6@xhacker>
CC: Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
From: Palmer Dabbelt <palmer@dabbelt.com>
To: jszhang3@mail.ustc.edu.cn
Message-ID: <mhng-1d66757a-1be0-4e46-8bbc-0568ceddfeb3@palmerdabbelt-glaptop>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210825_234704_372334_5737A1D3 
X-CRM114-Status: GOOD (  18.85  )
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

On Sun, 08 Aug 2021 10:25:09 PDT (-0700), jszhang3@mail.ustc.edu.cn wrote:
> From: Jisheng Zhang <jszhang@kernel.org>
>
> Enable BUILDTIME_TABLE_SORT to sort the exception table at build time
> then move exception table to RO_DATA segment.
>
> Jisheng Zhang (2):
>   riscv: Enable BUILDTIME_TABLE_SORT
>   riscv: Move EXCEPTION_TABLE to RO_DATA segment
>
>  arch/riscv/Kconfig                  | 1 +
>  arch/riscv/kernel/vmlinux-xip.lds.S | 1 -
>  arch/riscv/kernel/vmlinux.lds.S     | 4 ++--
>  scripts/sorttable.c                 | 1 +
>  4 files changed, 4 insertions(+), 3 deletions(-)

This seems reasonable, but it's failing for some configurations (at 
least tinyconfig) saying there is no __ex_table.  I'm not entirely sure 
how that comes about, as we've got them for futexes and uaccess.

Maybe the right thing to do here is to fix scripts/sorttable.c so it can 
handle files with nothing to sort?  I think it's just as simple as a 
successful early out like this

diff --git a/scripts/sorttable.h b/scripts/sorttable.h
index a2baa2fefb13..207ddeddb506 100644
--- a/scripts/sorttable.h
+++ b/scripts/sorttable.h
@@ -294,8 +294,9 @@ static int do_sort(Elf_Ehdr *ehdr,
                goto out;
        }
 #endif
+       /* If there is no __ex_table section there is no work do to. */
        if (!extab_sec) {
-               fprintf(stderr, "no __ex_table in file: %s\n", fname);
+               rc = 0;
                goto out;
        }

I'm not entirely sure though -- my logic is essentially just "there's no 
__ex_table, so there's nothing to sort, so just don't try".

All the configurations I can actually boot have an __ex_table, so I'm 
not sure how to test that.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
