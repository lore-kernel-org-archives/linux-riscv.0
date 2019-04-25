Return-Path: <SRS0=WcIC=S3=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_MUTT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2C560C10F03
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 25 Apr 2019 05:58:03 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 020CE2077C
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 25 Apr 2019 05:58:03 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="GImIb/cq"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 020CE2077C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=su+Dqbb/ITtY5BtvdROO75foLmrgvoUOBp1FO5t3GOs=; b=GImIb/cqto/jx9
	WDWkdmTpclMyDL6xQVmReZwwhNBIej7gXo2wjusJ4cKB5tL7+dB6nrx6PKi4s45Nl5vqmuOhisgxR
	iXx1bou4lmRCoctE6UBZNY4ZPENBwZ4mxxk+usA7lnoBbqBaFV1zoLYUYd1Hwtx4DqFXQAKBYQ97B
	TIqp1LmKvrepiX6lkEBsfa+tfhRSah7ZRCZllBtJ/a4HsAKArEIfxvVn4/mfp9aeslNkicOsjJIjc
	x1nuHhGiF7ZxFq+s7DLYJwM8MPV+kIik3mSIltEfORZhIcn7X8wi7Z2fk23+wuiqNYr1VinIVWtFg
	vEtVan9QMwM0FTRmHs8A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hJXOR-0007y8-FV; Thu, 25 Apr 2019 05:57:59 +0000
Received: from hch by bombadil.infradead.org with local (Exim 4.90_1 #2 (Red
 Hat Linux)) id 1hJXOP-0007xp-PK; Thu, 25 Apr 2019 05:57:57 +0000
Date: Wed, 24 Apr 2019 22:57:57 -0700
From: Christoph Hellwig <hch@infradead.org>
To: Anup Patel <Anup.Patel@wdc.com>
Subject: Re: [PATCH v4 2/3] RISC-V: Add interrupt related SCAUSE defines in
 asm/csr.h
Message-ID: <20190425055757.GA30545@infradead.org>
References: <20190425055015.45487-1-anup.patel@wdc.com>
 <20190425055015.45487-3-anup.patel@wdc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190425055015.45487-3-anup.patel@wdc.com>
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
 Christoph Hellwig <hch@infradead.org>, Atish Patra <Atish.Patra@wdc.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

> +#ifdef CONFIG_64BIT
> +#define SCAUSE_IRQ_FLAG		_AC(0x8000000000000000, UL)
> +#else
> +#define SCAUSE_IRQ_FLAG		_AC(0x80000000, UL)
> +#endif

Please keep the existing defintion that doesn't need an ifdef..

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
