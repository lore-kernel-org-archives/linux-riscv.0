Return-Path: <SRS0=8Mks=WS=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 27EA4C3A59E
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 22 Aug 2019 01:51:20 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F20D320673
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 22 Aug 2019 01:51:19 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="hiJU/Pgg"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F20D320673
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lst.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=e3eZctHzytxYkwXmDhtITWFD8JiNjv5YcSq/tBQsOws=; b=hiJU/PggCJi4Mo
	SUUQmgsNtPRVVmjEPpIsvKWVnLk5qrTAIGlqlNSCEbvthMv+muQILc9e8+sTJQZiOQly4P7/FhPlX
	E44WfG+tH8hLtVZmAz02A5F62mBTt0NL6Z5Uz+VLAMCsJCGly/dr/miDhtYF6Mivldy0Lf/xBakl1
	IU3cPXIIr+4xpX5z84d7tcoZpRCY+E6GeeRARSCiIPAvZ9nD9RCOC1ZjK4353B3BWXh+1PIXjeXDh
	drPnVm6BTd4R7K0eEWUud3Px98+N1JSL53WiwsUmZok4u87Nqcy870tz0yaJK9TAeuhWMw/arRUPX
	WjSu2PKvPG2L5GHVwnvA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1i0cFz-0002fk-2T; Thu, 22 Aug 2019 01:51:19 +0000
Received: from verein.lst.de ([213.95.11.211])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1i0cFw-0002fL-Al
 for linux-riscv@lists.infradead.org; Thu, 22 Aug 2019 01:51:17 +0000
Received: by verein.lst.de (Postfix, from userid 2407)
 id 9559C68BFE; Thu, 22 Aug 2019 03:51:13 +0200 (CEST)
Date: Thu, 22 Aug 2019 03:51:13 +0200
From: Christoph Hellwig <hch@lst.de>
To: Atish Patra <atish.patra@wdc.com>
Subject: Re: [PATCH v3 3/3] RISC-V: Do not invoke SBI call if cpumask is empty
Message-ID: <20190822015113.GC11922@lst.de>
References: <20190822004644.25829-1-atish.patra@wdc.com>
 <20190822004644.25829-4-atish.patra@wdc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190822004644.25829-4-atish.patra@wdc.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190821_185116_524243_D24AA561 
X-CRM114-Status: GOOD (  14.00  )
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
Cc: Albert Ou <aou@eecs.berkeley.edu>, Palmer Dabbelt <palmer@sifive.com>,
 linux-kernel@vger.kernel.org, Anup Patel <Anup.Patel@wdc.com>,
 Andreas Schwab <schwab@linux-m68k.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, linux-riscv@lists.infradead.org,
 Christoph Hellwig <hch@lst.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Wed, Aug 21, 2019 at 05:46:44PM -0700, Atish Patra wrote:
> SBI calls are expensive. If cpumask is empty, there is no need to
> trap via SBI as no remote tlb flushing is required.
> 
> Signed-off-by: Atish Patra <atish.patra@wdc.com>
> ---
>  arch/riscv/mm/tlbflush.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/arch/riscv/mm/tlbflush.c b/arch/riscv/mm/tlbflush.c
> index 9f58b3790baa..2bd3c418d769 100644
> --- a/arch/riscv/mm/tlbflush.c
> +++ b/arch/riscv/mm/tlbflush.c
> @@ -21,6 +21,9 @@ static void __sbi_tlb_flush_range(struct cpumask *cmask, unsigned long start,
>  		goto issue_sfence;
>  	}
>  
> +	if (cpumask_empty(cmask))
> +		goto done;

I think this can even be done before the get_cpu to optimize it a little
further.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
