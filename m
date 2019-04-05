Return-Path: <SRS0=YX5X=SH=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_MUTT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2865AC4360F
	for <infradead-linux-riscv@archiver.kernel.org>; Fri,  5 Apr 2019 05:54:25 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EB32E217D4
	for <infradead-linux-riscv@archiver.kernel.org>; Fri,  5 Apr 2019 05:54:24 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ORnNaoDn"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EB32E217D4
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AOGw4+jxF3bgjB0uf6gIaC7jXTa80XcXj+nCp+hFQlE=; b=ORnNaoDnqkzAiK
	XPxXr+c7hiFla1FhmazceRbTOVzQu8CymMtBO2khr+Fke9wWaWsKeYlIOgAi3/JSVX4W+P79ppHEd
	lTa2EV8735iJh830Qgk6ag/zWGM8JStp9t6TX7QM7uxqBR9SIRFcaXW3wYn6KDMrURxNJZy3d457j
	IPmUWxA55srMixP8pYjsjAjl022NjuoR0RcJJx/5AOp+dbO0feR6nItR3Pwromdc3810xK2cDuCAF
	7W4rMNwOqBLytQrLB5Xn5wlZ4uuUuobmpA+4F/AlgY+ifQKi55oT70LSU2xq7kbcNcSTbyKdx7Jj0
	u0SFhPmPIrBqU6lcBFqQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hCHo0-0001wq-0P; Fri, 05 Apr 2019 05:54:24 +0000
Received: from hch by bombadil.infradead.org with local (Exim 4.90_1 #2 (Red
 Hat Linux)) id 1hCHnx-0001w0-Ii; Fri, 05 Apr 2019 05:54:21 +0000
Date: Thu, 4 Apr 2019 22:54:21 -0700
From: Christoph Hellwig <hch@infradead.org>
To: Anup Patel <Anup.Patel@wdc.com>
Subject: Re: [PATCH v3] RISC-V: Fix Maximum Physical Memory 2GiB option for
 64bit systems
Message-ID: <20190405055421.GA7087@infradead.org>
References: <20190405054909.3238-1-anup.patel@wdc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190405054909.3238-1-anup.patel@wdc.com>
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

On Fri, Apr 05, 2019 at 05:49:34AM +0000, Anup Patel wrote:
> The Maximum Physical Memory 2GiB option for 64bit systems is currently
> broken because kernel hangs at boot-time when this option is enabled
> and the underlying system has more than 2GiB memory.
> 
> This issue can be easily reproduced on SiFive Unleashed board where
> we have 8GiB of memory.
> 
> This patch fixes above issue by removing unusable memory region in
> setup_bootmem().
> 
> Signed-off-by: Anup Patel <anup.patel@wdc.com>
> Reviewed-by: Christoph Hellwig <hch@lst.de>

Btw, what is the rationale behind even offering the 2GiB option and
the medlow model on 64-bit?  Do we reall have use cases where the
slightly more effient generated code matters so much to keep up
the support burden of this mostly unused and unusual configuration?

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
