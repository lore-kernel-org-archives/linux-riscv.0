Return-Path: <SRS0=Tq7r=WZ=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8ABADC3A59F
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 29 Aug 2019 11:01:55 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6165520828
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 29 Aug 2019 11:01:55 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="fFTJZQmR"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6165520828
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lst.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IzZt16HZh3WXjciq37DYEbAoLufAShCu2T4f1+TvaSE=; b=fFTJZQmRVrecTf
	HLweVHCexGJtP2YSaC0optSoplBBikt6j5jhZSWjjf7R5MfYQYkQ14QgXG6kO5VrSiqafoecE9Qoj
	nnznh0ynAISzky/3eiCCnoRbj/AvV63N5K6s4slSbP4Yh2UjGxOKMBwfpme3qJu2hA7ddu5CXW5Vi
	hdaIX0I/ShmVJkMs6yY95F38/1hlnZfgw7Zt444gJyolegPncZur21ZIDnlC1qOkkLsKlNzPVF5Rg
	3WayQbII8ca7V3mkHlns3m6s33m0e2PtWLFo1M+P7/i+ronpwHwTMejLuDuiggRTeM/jn+/DCMRtF
	80bK2x4ubYeh6b4o+pPw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1i3IBe-0004BA-8o; Thu, 29 Aug 2019 11:01:54 +0000
Received: from verein.lst.de ([213.95.11.211])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1i3IBc-0004AR-00
 for linux-riscv@lists.infradead.org; Thu, 29 Aug 2019 11:01:53 +0000
Received: by verein.lst.de (Postfix, from userid 2407)
 id 120E168B20; Thu, 29 Aug 2019 13:01:46 +0200 (CEST)
Date: Thu, 29 Aug 2019 13:01:45 +0200
From: Christoph Hellwig <hch@lst.de>
To: Logan Gunthorpe <logang@deltatee.com>
Subject: Re: [PATCH v6] RISC-V: Implement sparsemem
Message-ID: <20190829110145.GA15360@lst.de>
References: <20190828214054.3562-1-logang@deltatee.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190828214054.3562-1-logang@deltatee.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190829_040152_186683_664BDC08 
X-CRM114-Status: UNSURE (   8.03  )
X-CRM114-Notice: Please train this message.
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
Cc: Rob Herring <robh@kernel.org>, Albert Ou <aou@eecs.berkeley.edu>,
 Andrew Waterman <andrew@sifive.com>, Palmer Dabbelt <palmer@sifive.com>,
 linux-kernel@vger.kernel.org, Mike Rapoport <rppt@linux.ibm.com>,
 Zong Li <zong@andestech.com>, Michael Clark <michaeljclark@mac.com>,
 Olof Johansson <olof@lixom.net>, Greentime Hu <greentime.hu@sifive.com>,
 linux-riscv@lists.infradead.org, Stephen Bates <sbates@raithlin.com>,
 Christoph Hellwig <hch@lst.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

> diff --git a/arch/riscv/include/asm/fixmap.h b/arch/riscv/include/asm/fixmap.h
> index 9c66033c3a54..7b0259c044c9 100644
> --- a/arch/riscv/include/asm/fixmap.h
> +++ b/arch/riscv/include/asm/fixmap.h
> @@ -31,7 +31,7 @@ enum fixed_addresses {
>  };
> 
>  #define FIXADDR_SIZE		(__end_of_fixed_addresses * PAGE_SIZE)
> -#define FIXADDR_TOP		(VMALLOC_START)
> +#define FIXADDR_TOP		(VMEMMAP_START)
>  #define FIXADDR_START		(FIXADDR_TOP - FIXADDR_SIZE)

Note that this actually changes again in the fixes branch that
is targeted for 5.3.  Not actually conflicting your functionality,
but the FIXADDR_TOP definition moves to pgtable.h.

Otherwise this still looks fine.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
