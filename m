Return-Path: <SRS0=gFXo=QT=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_MUTT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 05D6CC282C4
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 12 Feb 2019 07:17:30 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C623C2184A
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 12 Feb 2019 07:17:29 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="e1QNIUTG"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C623C2184A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3SmbtiaNAxrKqC1YTZd5EysGLM2I0gKb/abo8jgeaOY=; b=e1QNIUTGMFKvYo
	/zzYjS2Eo4Mlzbg8u7k65kC+G9a1d3yYWsbK6mPs2xF3RwZE63ztKBt2EVKzrcecSgX8tdBOOLqjd
	/aOZRqE6I8s1aWp38or/Rj1BmN86wfg48CF0KUISn0wm1wDV6YqAEIkKPvDc8ah78hddanDlcY58Y
	oadoheAwlovPkYNGGiwND9r3/5+IyumvkpUR6UL0uvwkFXIQPj8nVrjcesuM/MCok4OohozDVeM7i
	VTdqc89LVlxSeCak1N9xVqxC09826aPXUSvdAamaWc+R7iuvBjPF7FoiievFLr1lTMO64Hah4pKyf
	MVXsyWLSi1rVH6nvxtVw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gtSJr-0006wg-Ds; Tue, 12 Feb 2019 07:17:27 +0000
Received: from hch by bombadil.infradead.org with local (Exim 4.90_1 #2 (Red
 Hat Linux)) id 1gtSJq-0006wW-EN; Tue, 12 Feb 2019 07:17:26 +0000
Date: Mon, 11 Feb 2019 23:17:26 -0800
From: Christoph Hellwig <hch@infradead.org>
To: Michael Clark <michaeljclark@mac.com>
Subject: Re: [PATCH 1/3] RISC-V: implement xchg_small and cmpxchg_small for
 char and short
Message-ID: <20190212071726.GA15079@infradead.org>
References: <20190211043829.30096-1-michaeljclark@mac.com>
 <20190211043829.30096-2-michaeljclark@mac.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190211043829.30096-2-michaeljclark@mac.com>
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
Cc: RISC-V Patches <patches@groups.riscv.org>,
 Linux RISC-V <linux-riscv@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

>  
> +extern unsigned long __xchg_relaxed_small(volatile void *ptr, unsigned long new,
> +					  unsigned int size);
> +extern unsigned long __xchg_acquire_small(volatile void *ptr, unsigned long new,

No need for any of the externs on function declarations.

> +++ b/arch/riscv/kernel/cmpxchg.c
> @@ -0,0 +1,118 @@
> +/*
> + * Copyright (C) 2017 Imagination Technologies
> + * Author: Paul Burton <paul.burton@mips.com>
> + *
> + * This program is free software; you can redistribute it and/or modify it
> + * under the terms of the GNU General Public License as published by the
> + * Free Software Foundation;  either version 2 of the  License, or (at your
> + * option) any later version.
> + */

Please use an SPDX tag instead of the GPL boilerplate.

Also this code seems to be entirely generic and very similar to the
mips code.  Did you consider making it a generic library routine
in lib/ instead?

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
