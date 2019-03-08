Return-Path: <SRS0=N7Yn=RL=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,USER_AGENT_MUTT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3FA35C4360F
	for <infradead-linux-riscv@archiver.kernel.org>; Fri,  8 Mar 2019 14:53:07 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 124922087C
	for <infradead-linux-riscv@archiver.kernel.org>; Fri,  8 Mar 2019 14:53:07 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="gQfLaZiP"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 124922087C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Xcz+ZhGBfrZXpfUzpSkILBbmZR4WzcqgXzKjZqJ9Kxc=; b=gQfLaZiPd1Zv9K
	u1DvNISFvDIqyNQ5+Z92UZlWtStVtLvKzA/IzYK1y/UfSy7e0LNNZjm1+bViNmQoRVXxcleVQkOqm
	rH3Xj0piaa2a5r+jRRT7H9CuF7WDSMjpkCm9Xv6EjYqqJieXKiiw8vGCxHWZ8hBqjkbNE1PMeutHl
	TEiQHj6MYB0lKUi0jBTf3WOYPHKvRG42oxwykjpldJw08hXRyahxj4ZwkDKOColI9maJANI2Rddap
	yFpwIEGN2nIwhyc0/BZtTH/kfjvyZWtpIVAPbOrfBnqQPJHIy4WgGB9wesZI8nAmp/XhI7V+w5CEe
	/bsYD2ScLXXfZ7HvMSEQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h2Grw-0003VU-Ct; Fri, 08 Mar 2019 14:53:04 +0000
Received: from hch by bombadil.infradead.org with local (Exim 4.90_1 #2 (Red
 Hat Linux)) id 1h2Gru-0003VH-Fg; Fri, 08 Mar 2019 14:53:02 +0000
Date: Fri, 8 Mar 2019 06:53:02 -0800
From: Christoph Hellwig <hch@infradead.org>
To: Joe Perches <joe@perches.com>
Subject: Re: [PATCH] RISC-V: Use IS_ENABLED(CONFIG_CMODEL_MEDLOW)
Message-ID: <20190308145302.GA13397@infradead.org>
References: <66af3908ab0a63a6768f3d75a87abf4056a9f8cf.camel@perches.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <66af3908ab0a63a6768f3d75a87abf4056a9f8cf.camel@perches.com>
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
Cc: linux-riscv@lists.infradead.org, Palmer Dabbelt <palmer@sifive.com>,
 LKML <linux-kernel@vger.kernel.org>, Albert Ou <aou@eecs.berkeley.edu>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Thu, Mar 07, 2019 at 03:56:34PM -0800, Joe Perches wrote:
> IS_ENABLED should generally use CONFIG_ prefaced symbols and
> it doesn't appear as if there is a CMODEL_MEDLOW define.
> 
> Signed-off-by: Joe Perches <joe@perches.com>

Looks good,

Reviewed-by: Christoph Hellwig <hch@lst.de>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
