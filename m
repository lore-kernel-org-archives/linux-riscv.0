Return-Path: <SRS0=7ZJm=QU=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_MUTT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 63B42C282C2
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 13 Feb 2019 06:44:24 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 34A5C222BE
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 13 Feb 2019 06:44:24 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="B6ddwkgC"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 34A5C222BE
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sCreTidfHwnvxr8WDqZGlOl8oQH7Pc44nRc/iS3WpUQ=; b=B6ddwkgCPfTsyz
	PoxPb7Sd1jZlovYxMX+qlfxXoaOQ2TffKR6gOC0Irba/0SX7TcMJT78FgMoruv//NBaYIwH+2f7U7
	JGXjKRTRJ9qWBw8+35+/buGoVc4INzCb/L0jiuJEqwMtrrgGSU/n1yqUQin+D5FxfREmg4TIQH3kI
	J6uGiaaB5JLDEg4ZCpl/AsNm5QXtiDl3KaisqphEnxhvZ0xIKoUCQVBazrxqYobGSugqHdP3kqksg
	1tUkEIn0jghjxZTJIRaXhsilZS8xXF4ODqfw/ZnNCC1RV6K/FBgxsYLqanKARfB9QC/K0LCxLKLj1
	ZZgb4fSEFBCXdPGvuDyg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gtoHN-0001v6-ED; Wed, 13 Feb 2019 06:44:21 +0000
Received: from hch by bombadil.infradead.org with local (Exim 4.90_1 #2 (Red
 Hat Linux)) id 1gtoHL-0001uh-Ak; Wed, 13 Feb 2019 06:44:19 +0000
Date: Tue, 12 Feb 2019 22:44:19 -0800
From: Christoph Hellwig <hch@infradead.org>
To: Anup Patel <Anup.Patel@wdc.com>
Subject: Re: [PATCH v4 6/6] RISC-V: Free-up initrd in free_initrd_mem()
Message-ID: <20190213064419.GA27012@infradead.org>
References: <20190213063127.28703-1-anup.patel@wdc.com>
 <20190213063127.28703-7-anup.patel@wdc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190213063127.28703-7-anup.patel@wdc.com>
User-Agent: Mutt/1.9.2 (2017-12-15)
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Albert Ou <aou@eecs.berkeley.edu>, Palmer Dabbelt <palmer@sifive.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Mike Rapoport <rppt@linux.ibm.com>, Christoph Hellwig <hch@infradead.org>,
 Atish Patra <Atish.Patra@wdc.com>, Paul Walmsley <paul.walmsley@sifive.com>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Wed, Feb 13, 2019 at 06:32:24AM +0000, Anup Patel wrote:
> index 9cd583b6d1cd..c22b873de856 100644
> --- a/arch/riscv/kernel/setup.c
> +++ b/arch/riscv/kernel/setup.c
> @@ -97,8 +97,9 @@ static void __init setup_initrd(void)
>  	initrd_end = 0;
>  }
>  
> -void free_initrd_mem(unsigned long start, unsigned long end)
> +void __init free_initrd_mem(unsigned long start, unsigned long end)
>  {
> +	memblock_free(__pa(start), end - start);

I'm pretty sure this should be a call to free_reserved_area instead.

All regions reserved using memblock_reserved and not freed before
initializing the MM are marked reserved and don't have valid page
counts, etc.

So we need the actions in free_reserved_area to actually make the
memory useful.  Now every other architecture except for arm64
seems to do fine without a memblock_free.  I'm not an expert on
memblock (but I've CCed one), but I guess the reason is that once
the kernel has booted we don't really care about freeing memblock
area.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
