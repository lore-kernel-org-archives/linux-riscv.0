Return-Path: <SRS0=PVrh=R3=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,USER_AGENT_MUTT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C8292C43381
	for <infradead-linux-riscv@archiver.kernel.org>; Sun, 24 Mar 2019 14:57:35 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9316C222C8
	for <infradead-linux-riscv@archiver.kernel.org>; Sun, 24 Mar 2019 14:57:35 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="eUa12rt/"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9316C222C8
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lst.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7GfKrwEYkf0GAS942WCsK+ZXQzWzR57b1zS4eOEjVIA=; b=eUa12rt/tyyAAk
	nn01eZ1+Doge2YwRY2SH0JXvWWj1DBx5DbiB/prHHkUXKTDsWmAJYhdM9uMCClQADqHCgM78+PbLS
	di6OJgHL1pJD120DBsTlfNE5zN33YQ/he1hc6AFGKcr5bdRJ5mMes/brWE7qiN6WmTW5W2xzUpQE+
	ZU83mXLfRty7Re7RVFBSHT5YX8ItcACcFpaAQEfu7rbnD12luEm5PoBE0AtShVk0iu/m1aAkMtmcS
	FDxwn6fjaCl7fOfqUX83LV4yvpRcwJX1izzlG9daMZDa+aH3pIbVno1a2lbdm3Hmm2FH+EqPJD/QI
	pfe/XVni01PTTQaUWeJQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h84Yz-0007Vl-6J; Sun, 24 Mar 2019 14:57:29 +0000
Received: from verein.lst.de ([213.95.11.211] helo=newverein.lst.de)
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h84Yw-0007Uj-4C
 for linux-riscv@lists.infradead.org; Sun, 24 Mar 2019 14:57:28 +0000
Received: by newverein.lst.de (Postfix, from userid 2407)
 id 2F1A568B20; Sun, 24 Mar 2019 15:57:08 +0100 (CET)
Date: Sun, 24 Mar 2019 15:57:08 +0100
From: Christoph Hellwig <hch@lst.de>
To: Anup Patel <Anup.Patel@wdc.com>
Subject: Re: [PATCH] RISC-V: Always compile mm/init.c with cmodel=medany
Message-ID: <20190324145708.GA3355@lst.de>
References: <20190324110804.68555-1-anup.patel@wdc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190324110804.68555-1-anup.patel@wdc.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190324_075726_319749_896E28FE 
X-CRM114-Status: UNSURE (   6.31  )
X-CRM114-Notice: Please train this message.
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
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
 Christoph Hellwig <hch@lst.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Sun, Mar 24, 2019 at 11:08:29AM +0000, Anup Patel wrote:
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> Signed-off-by: Mike Rapoport <rppt@linux.ibm.com>

Huh?  I don't think this is from Mike and me.

> +unsigned long va_pa_offset;
> +EXPORT_SYMBOL(va_pa_offset);
> +unsigned long pfn_base;
> +EXPORT_SYMBOL(pfn_base);

Can you move va_pa_offset and pfn_base next to the swapper_pg_dir
declaration?  Thats where I move them in my current nommu patchset,
as that allows to just have a single CONFIG_NOMMU in mm/init.c.

Otherwise this looks fine to me.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
