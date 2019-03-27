Return-Path: <SRS0=wRFB=R6=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_MUTT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 927EAC43381
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 27 Mar 2019 07:08:08 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 57A8020811
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 27 Mar 2019 07:08:08 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="JTsv3KRM"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 57A8020811
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dxV3SFb/d9e5sT1fka0bq0WgfTEJXIB4ksc/pJuPh5I=; b=JTsv3KRMtCMjzO
	Ti/2QI82qJHDDttgWiDWuCjB1q5koFDQLG80DGYMEbMF7L+FCyjZzI3/DwYvGF6ludMR5Y0k3emwG
	tU7QxJFO7c8eOcycmuyhp3XIg/9TkWT0i9DkFvUJ7FORnX8aawJOFTLvwV3phgkr1tFohxyJ/HPZn
	mKamI9mrxHoewWMX9+Q70hPWOF+w+QtmSRuKVu4hNfSfFqtQKougSU8Otp5+x5PmvUO05cj3GjKB/
	dmNLdy1znWsiLjAGSzBnM3VglREZhCHPb1p78A5jgwgMBXe0TVHDLN1IxCl7GD+Bx+uvTX5F20rYk
	EirCa2ze02d8ZbLkAAjg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h92fO-0002cR-TC; Wed, 27 Mar 2019 07:08:06 +0000
Received: from hch by bombadil.infradead.org with local (Exim 4.90_1 #2 (Red
 Hat Linux)) id 1h92fK-0002bz-UR; Wed, 27 Mar 2019 07:08:02 +0000
Date: Wed, 27 Mar 2019 00:08:02 -0700
From: Christoph Hellwig <hch@infradead.org>
To: Gary Guo <gary@garyguo.net>
Subject: Re: [PATCH v4 2/5] riscv: move switch_mm to its own file
Message-ID: <20190327070802.GB3210@infradead.org>
References: <cover.1553647082.git.gary@garyguo.net>
 <862300448c34e225f3fbb4da36ccf18d10753b0b.1553647082.git.gary@garyguo.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <862300448c34e225f3fbb4da36ccf18d10753b0b.1553647082.git.gary@garyguo.net>
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
Cc: Palmer Dabbelt <palmer@sifive.com>, Anup Patel <Anup.Patel@wdc.com>,
 Christoph Hellwig <hch@infradead.org>, Atish Patra <atish.patra@wdc.com>,
 Albert Ou <aou@eecs.berkeley.edu>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

> +#include <linux/mm.h>
> +
> +#include <asm/tlbflush.h>
> +#include <asm/cacheflush.h>

Minor nitpick: no real need for the empty line above.

Otherwise this looks good to me:

Reviewed-by: Christoph Hellwig <hch@lst.de>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
