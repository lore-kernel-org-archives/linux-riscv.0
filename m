Return-Path: <SRS0=TswT=WO=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 94DB0C3A589
	for <infradead-linux-riscv@archiver.kernel.org>; Sun, 18 Aug 2019 18:19:16 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 659082146E
	for <infradead-linux-riscv@archiver.kernel.org>; Sun, 18 Aug 2019 18:19:16 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="tPUT4gxh"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 659082146E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+mvEBgoeIgGrQVzyJ4J+opgJzh1ATGCZ/e/h3qqZUm4=; b=tPUT4gxh2yHWJg
	xIOPMWjCSFD8+zOI/MUSJ2ZGJqCOEnc2c6oI+OQdtZdu0zESVhf60VRVORaL0gyNNhZMSAc0u4pYh
	0g8dEQGIqsBuAqQiluuRCD20l2gfnjehzBpnL6p5klfy35GLCwxZkqFrr8INgmye4Ew684ospPGKc
	cwrNWcBqqVjTI9M4Jwa9HT3ogxI/67fMHuiExiLOgI8BKulINv6Aj7VGS2XVPOKUhk7b8ZorYXC+R
	B6S0YKS0LfaC1+SggfwA9df1pNjG0sapzJ7pkgSDuSE6wbqHeFd/50xKD4pyGvzXgVGNGnKUARoJs
	bIhUAZgLdiBefN9STbKQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hzPlr-0006mj-Ax; Sun, 18 Aug 2019 18:19:15 +0000
Received: from hch by bombadil.infradead.org with local (Exim 4.92 #3 (Red Hat
 Linux)) id 1hzPlq-0006mQ-4u; Sun, 18 Aug 2019 18:19:14 +0000
Date: Sun, 18 Aug 2019 11:19:14 -0700
From: Christoph Hellwig <hch@infradead.org>
To: Anup Patel <Anup.Patel@wdc.com>
Subject: Re: [PATCH] RISC-V: Fix FIXMAP area corruption on RV32 systems
Message-ID: <20190818181914.GB20217@infradead.org>
References: <20190816114915.4648-1-anup.patel@wdc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190816114915.4648-1-anup.patel@wdc.com>
User-Agent: Mutt/1.11.4 (2019-03-13)
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
Cc: Anup Patel <anup@brainfault.org>, Palmer Dabbelt <palmer@sifive.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Christoph Hellwig <hch@infradead.org>, Atish Patra <Atish.Patra@wdc.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

> +#define FIXADDR_TOP      (VMALLOC_START)

Nit: no need for the braces, the definitions below don't use it
either.

> +#ifdef CONFIG_64BIT
> +#define FIXADDR_SIZE     PMD_SIZE
> +#else
> +#define FIXADDR_SIZE     PGDIR_SIZE
> +#endif
> +#define FIXADDR_START    (FIXADDR_TOP - FIXADDR_SIZE)
> +
>  /*
> - * Task size is 0x4000000000 for RV64 or 0xb800000 for RV32.
> + * Task size is 0x4000000000 for RV64 or 0x9fc00000 for RV32.
>   * Note that PGDIR_SIZE must evenly divide TASK_SIZE.
>   */
>  #ifdef CONFIG_64BIT
>  #define TASK_SIZE (PGDIR_SIZE * PTRS_PER_PGD / 2)
>  #else
> -#define TASK_SIZE VMALLOC_START
> +#define TASK_SIZE FIXADDR_START
>  #endif

Mentioning the addresses is a little weird.  IMHO this would be
a much nicer place to explain the high-level memory layout, including
maybe a little ASCII art.  Also we could have one #ifdef CONFIG_64BIT
for both related values.  Last but not least instead of saying that
something should be dividable it would be nice to have a BUILD_BUG_ON
to enforce it.

Either way we are late in the cycle, so I guess this is ok for now:

Reviewed-by: Christoph Hellwig <hch@lst.de>

But I'd love to see this area improved a little further as it is full
of mine fields.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
