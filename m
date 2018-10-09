Return-Path: <SRS0=n4Ll=MV=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_MUTT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CAC01C64EB8
	for <infradead-linux-riscv@archiver.kernel.org>; Tue,  9 Oct 2018 16:15:55 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8F4EF214DA
	for <infradead-linux-riscv@archiver.kernel.org>; Tue,  9 Oct 2018 16:15:55 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="lheDJxvt"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8F4EF214DA
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lst.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KfFqhLl3j9XqmoNp9CUCbOsH7PsOO5EBWudud8cs+TI=; b=lheDJxvtUv7fkG
	9+wuVur8PLCm9YvTB0tZhj1MPctkPgHo+VArnBWDQCe74JMMlngM+L6fbq/8h1Jrw/UQZsS0feNvV
	ulhKVCCBoarmUv7yHoz378mXtLfdXixBFxVUTlS1xgpxCTL9wjt9jKyxRmyx1pvLqXwAYK2BKky3Y
	NFR/cqA9HBhnVRNCfGKXv5MBbccGQZP0uST3MthJ78TykZPosbQDrT0ef9EXTLyKgbPDb7ow/OIUA
	5EwyEiTk13FM60MbCF5ZZxmJl+pWxshqiHTpVWm3HqsVx79oSNYVISdZxQFCSMOsVuxXckN2QndxN
	WSSnyMI5c9J48Hc1rPyQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1g9ufq-0006Oy-6y; Tue, 09 Oct 2018 16:15:54 +0000
Received: from verein.lst.de ([213.95.11.211] helo=newverein.lst.de)
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1g9ufm-0006Nh-Ab
 for linux-riscv@lists.infradead.org; Tue, 09 Oct 2018 16:15:52 +0000
Received: by newverein.lst.de (Postfix, from userid 2407)
 id 2835268C96; Tue,  9 Oct 2018 18:15:33 +0200 (CEST)
Date: Tue, 9 Oct 2018 18:15:33 +0200
From: Christoph Hellwig <hch@lst.de>
To: palmer@sifive.com
Subject: Re: [PATCH] RISC-V: remove the unused return_to_handler export
Message-ID: <20181009161533.GA21260@lst.de>
References: <20180921064321.21817-1-hch@lst.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20180921064321.21817-1-hch@lst.de>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181009_091550_515773_8FA31D1F 
X-CRM114-Status: GOOD (  12.02  )
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
Cc: linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
Message-ID: <20181009161533.zEKDw5bl7OVxmdXd1XG1WkuhuZL-mv_SufQ5qYQ96rg@z>

ping?

On Fri, Sep 21, 2018 at 08:43:21AM +0200, Christoph Hellwig wrote:
> This export is not only not needed, but also breaks symbol versioning
> due to being an undeclared assembly export.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> ---
>  arch/riscv/kernel/mcount.S | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/arch/riscv/kernel/mcount.S b/arch/riscv/kernel/mcount.S
> index 5721624886a1..8a5593ff9ff3 100644
> --- a/arch/riscv/kernel/mcount.S
> +++ b/arch/riscv/kernel/mcount.S
> @@ -75,7 +75,6 @@ ENTRY(return_to_handler)
>  	RESTORE_RET_ABI_STATE
>  	jalr	a1
>  ENDPROC(return_to_handler)
> -EXPORT_SYMBOL(return_to_handler)
>  #endif
>  
>  #ifndef CONFIG_DYNAMIC_FTRACE
> -- 
> 2.18.0
> 
> 
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv
---end quoted text---

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
