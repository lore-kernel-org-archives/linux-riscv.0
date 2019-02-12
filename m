Return-Path: <SRS0=gFXo=QT=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_MUTT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59029C282C4
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 12 Feb 2019 07:05:23 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 20EF621773
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 12 Feb 2019 07:05:23 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="lc6CNGAU"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 20EF621773
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=H2Yw07A7owm63FnQAlVQFaWvLS/8zHLI6rafK9Amp20=; b=lc6CNGAUNzESwt
	UjGKZr2+We3onx8Qu6SRGse9u0hZgD+/UPyS/7ITcmGaJlGIQDNMYkHWp/Fa2jXMVPnFx/t5eb9WE
	HRiCFz4F9/2VOiT04UJGjNxCJgWHEO69lLRqB8EWDW/Ry9n8+lxJAT2kNN9ER55e3CMyyWkhFDXmv
	mnrKDqaTzfBr6eOrAT9vPL9dd0XONUbi9uQgpAtO6SPAFAXOBrhJEDWnpkE3FF8JxyUZw+9tVd1M2
	I1KtKgG6ikz8TwnNVPqyjV8AHMY07xWXKIdVquEtzbvi4LmuBYIsgNrHv96RbtWEs/2JGu9/6D6JO
	uRK1+xHB2KJ3vRGoxR2w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gtS87-00006t-6e; Tue, 12 Feb 2019 07:05:19 +0000
Received: from hch by bombadil.infradead.org with local (Exim 4.90_1 #2 (Red
 Hat Linux)) id 1gtS85-00006h-Lo; Tue, 12 Feb 2019 07:05:17 +0000
Date: Mon, 11 Feb 2019 23:05:17 -0800
From: Christoph Hellwig <hch@infradead.org>
To: Palmer Dabbelt <palmer@sifive.com>
Subject: Re: [PATCH 0/3] RISC-V: defconfig: Cleanups and Generic PCIe Support
Message-ID: <20190212070517.GA26747@infradead.org>
References: <20190123225025.32052-1-palmer@sifive.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190123225025.32052-1-palmer@sifive.com>
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
Cc: linux-riscv@lists.infradead.org,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Paul Walmsley <paul.walmsley@sifive.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Wed, Jan 23, 2019 at 02:50:22PM -0800, Palmer Dabbelt wrote:
> This bounced around on the mailing list a handful of times.  If there's
> no opposition then I'll go ahead and put this in my next PR.  I know the
> split is a bit pedantic, but since everyone depends on defconfig I want
> to be explicit about the changes.

Looks good:

Reviewed-by: Christoph Hellwig <hch@lst.de>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
