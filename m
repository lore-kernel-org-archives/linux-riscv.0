Return-Path: <SRS0=4kCy=UQ=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6CB48C31E49
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 17 Jun 2019 02:41:04 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 436A72085A
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 17 Jun 2019 02:41:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="REq6BFxO"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 436A72085A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:In-Reply-To:Subject:
	Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	 bh=ceAQcgoEGQ+IzcF2K/RY/+04ppzMU7K5OP7btklI2pM=; b=REq6BFxOyLU3Vryfp3TsNfP5g
	9AMpIzRUNz635D1jgu+HRSYM4u0eJxKrBbGoFoJJCou1O8zE4qr5f/3RAIYO7oUyPkjDFeD4Lrvj6
	nDJOMTWpWIywN5snRDrAhWxOzM/n8HgLbLZDlOWYccBOzLRfZQprUTe0M/V7Momb1Ni6fh8zUBTyW
	DLxVxXZn7iMD6m/QmkGJQMNiyssUbbh6xbKRo7TPRprBawudEaNraLW0UmKyPjkshs/vHnqdJK4d4
	1V93Ls/6IVLSqQiDEOsBlttB/uO/3OGPs9fwTpTebhp3yP7ACyF5sIwu1BjBz0piPc42H6ccd6G8O
	PguaLh1oA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hchZt-00031t-L8; Mon, 17 Jun 2019 02:41:01 +0000
Received: from mail-pg1-f195.google.com ([209.85.215.195])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hchZq-00031B-K3
 for linux-riscv@lists.infradead.org; Mon, 17 Jun 2019 02:41:00 +0000
Received: by mail-pg1-f195.google.com with SMTP id s21so4870304pga.12
 for <linux-riscv@lists.infradead.org>; Sun, 16 Jun 2019 19:40:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=kgZqvIzIOJEKTg0Z0V2kP+QkOaKf68E42gggfrpDns8=;
 b=I1OVT02AEWCCE3Xzj8OVmp+ff5DZHtTdEGv3fpqkPyFJsU0TXrn9EpsGitZo14o79l
 m0irijo/TIAhhwoWEDmDNDh+iAE6W9AFMuNZSpja7UIiID6S7u3Om5mLqae+5aDG/6Bu
 0kVvFkItXIE7s1ZNp4sQzQ6oByIBCcGHu1sEQLUF4j0nfQy0aKXUlD3Rj1jia46xWnMy
 yK/kfS8y0amNIsW0QXcMWVsOmhaqDnuuEvDo/oh/+2EYmlao+uT1BsuvWwWNgwDYq5Pp
 IHIgVO8L6+Zy6wVPkADvacRTvY4dczDYuG22B9IqJsKR3rWJsQuzyYJbXGitv5OR/AW8
 RNiw==
X-Gm-Message-State: APjAAAUS0nyETCkGc6VjyqAovPrEv6YARO6iNeExQ+BCOhA4ICj+05NV
 PVJU0IdF5SY276ykPgqhVZnJO6jxaEPxJAmL
X-Google-Smtp-Source: APXvYqy2mPe/YV9DE0P33bR+Pty2qTEng4Uybs1R0Dtt4/lcp7az8hdyx0NzEbWiCor6cGz45ZFtjw==
X-Received: by 2002:aa7:8108:: with SMTP id b8mr112939881pfi.205.1560739254025; 
 Sun, 16 Jun 2019 19:40:54 -0700 (PDT)
Received: from localhost ([14.215.134.187])
 by smtp.gmail.com with ESMTPSA id h2sm8444222pgs.17.2019.06.16.19.40.52
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Sun, 16 Jun 2019 19:40:53 -0700 (PDT)
Date: Sun, 16 Jun 2019 19:40:53 -0700 (PDT)
X-Google-Original-Date: Sun, 16 Jun 2019 19:28:47 PDT (-0700)
Subject: Re: [PATCH] riscv: mm: synchronize MMU after pte change
In-Reply-To: <CALoQrwfqpaTQ=9F7CrLHKo-fJ7oEt45g3tiFG3E5jyAr5zT2Zw@mail.gmail.com>
From: Palmer Dabbelt <palmer@sifive.com>
To: shihpo.hung@sifive.com
Message-ID: <mhng-29050ee2-db7c-4091-a9b4-503447fd25fc@palmer-si-x1e>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190616_194058_663811_A009EF4F 
X-CRM114-Status: GOOD (  15.89  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: linux-riscv@lists.infradead.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Fri, 14 Jun 2019 23:47:24 PDT (-0700), shihpo.hung@sifive.com wrote:
> Because RISC-V compliant implementations can cache invalid entries in TLB,
> an SFENCE.VMA is necessary after changes to the page table.
> This patch adds an SFENCE.vma for the vmalloc_fault path.
>
> Signed-off-by: ShihPo Hung <shihpo.hung@sifive.com>
> Cc: Palmer Dabbelt <palmer@sifive.com>
> Cc: Albert Ou <aou@eecs.berkeley.edu>
> Cc: Paul Walmsley <paul.walmsley@sifive.com>
> Cc: linux-riscv@lists.infradead.org
>
> ---
>  arch/riscv/mm/fault.c | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/arch/riscv/mm/fault.c b/arch/riscv/mm/fault.c
> index 88401d5..3d8fa95 100644
> --- a/arch/riscv/mm/fault.c
> +++ b/arch/riscv/mm/fault.c
> @@ -29,6 +29,7 @@
>
>  #include <asm/pgalloc.h>
>  #include <asm/ptrace.h>
> +#include <asm/tlbflush.h>
>
>  /*
>   * This routine handles page faults.  It determines the address and the
> @@ -281,6 +282,9 @@ asmlinkage void do_page_fault(struct pt_regs *regs)
>         pte_k = pte_offset_kernel(pmd_k, addr);
>         if (!pte_present(*pte_k))
>             goto no_context;
> +
> +       local_flush_tlb_page(addr);
> +
>         return;
>     }
>  }

This needs a comment.  The rationale is essentially the same as
update_mmu_cache().  In this case I don't think we want to directly call
update_mmu_cache(), as if we ever decide that the eager fence over there is
worse for performance (ie, on an implementation that doesn't cache invalid
entries) we could drop that fence but we'll still need this one as I don't see
anything that fixes suprious faults for the vmalloc region.

This should also CC stable.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
