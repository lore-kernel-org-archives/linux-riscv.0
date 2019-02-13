Return-Path: <SRS0=7ZJm=QU=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_MUTT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4733BC282C2
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 13 Feb 2019 17:50:20 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1DAE52086C
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 13 Feb 2019 17:50:20 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="EgbZfciu"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1DAE52086C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TP2qlulK8iVkwTxU+19Nm07HTOJx6fERqA2WnBEbEA8=; b=EgbZfciu7ciND+
	79MX78h4ZaFw+TnJBgJEIGXWtKzMMLTzNqsx2C20PLKZLxVJwAsrm/i1YGDAnjo73Oqd5j8MvfIqJ
	ZAkWrlfbbPUE85f8TRy4bAu9Wmotd6EJf8BMQxVZdvuCDDFttE+GhtbLPSQ3hQJRWTwdjHsqsYNk2
	Rli8UJETdBtK/nme5aYKoH0nT3I3uQg6b2Za6uIX0KnLmLqFo7a/I3JzihpoMiw5CKGDfet241VSP
	KZQUU4x2ywtRC2sx7sIMDJxMIhN+Kbx/iCA/Rj+JQPliHUoxApoNIiPSrctMynXLpj24wOTbOWx5t
	/3nJQpiLcov7Lv4FDEsA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gtyfp-0002ke-QW; Wed, 13 Feb 2019 17:50:17 +0000
Received: from hch by bombadil.infradead.org with local (Exim 4.90_1 #2 (Red
 Hat Linux)) id 1gtyfo-0002hA-80; Wed, 13 Feb 2019 17:50:16 +0000
Date: Wed, 13 Feb 2019 09:50:16 -0800
From: Christoph Hellwig <hch@infradead.org>
To: Anup Patel <Anup.Patel@wdc.com>
Subject: Re: [PATCH v6 5/5] RISC-V: Free-up initrd in free_initrd_mem()
Message-ID: <20190213175016.GA4625@infradead.org>
References: <20190213115301.103989-1-anup.patel@wdc.com>
 <20190213115301.103989-6-anup.patel@wdc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190213115301.103989-6-anup.patel@wdc.com>
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

On Wed, Feb 13, 2019 at 11:53:51AM +0000, Anup Patel wrote:
> We should free-up initrd memory in free_initrd_mem() instead
> of doing nothing.
> 
> Signed-off-by: Anup Patel <anup.patel@wdc.com>

Looks good:

Reviewed-by: Christoph Hellwig <hch@lst.de>

Note that I just sent out a series that implements a common
free_initrd_mem, so if that gets merged we can eventually remove this
copy entirely.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
