Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C9C9C433EF
	for <linux-riscv@archiver.kernel.org>; Thu, 10 Mar 2022 08:05:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sNVUTFEzUGTbjfDoP1HK0Gy19p86xT6FALtF5+juFYk=; b=qJvPY1gV41Ax3+
	2zbBINxjOwxUGO3j9ICOU22obD0imzBenhWhmSAo1eOkCx+4GKD110Kj6/3VIurxYWzV6+BXAG+bx
	jZqVKe2Asaml31aYgZp5uuBSJoSLaRB8aBDqdJzJ+P8bdSz2Oox5rWZCsmywdbu0NpCv/XvypQgV4
	iqQRY1DV2SwaqGjnXs4xDyfpnFi3dol8Or8BJ/htx7mq9cgmyMLE2MgxjDmgDxEDRpKfWBxY0JOEr
	+2a5UgcQBUsIf2OUz2C9I9Ocd0MT8iFj+w2K1JZmKnFvqsx1UqDvyZMwnh/b8kJftTsMOdCmYKRCZ
	stiEYGfkkK/sC/jDJ54Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nSDn1-00BpuF-U0; Thu, 10 Mar 2022 08:04:51 +0000
Received: from hch by bombadil.infradead.org with local (Exim 4.94.2 #2 (Red
 Hat Linux)) id 1nSDn0-00Bptl-RQ; Thu, 10 Mar 2022 08:04:50 +0000
Date: Thu, 10 Mar 2022 00:04:50 -0800
From: Christoph Hellwig <hch@infradead.org>
To: Palmer Dabbelt <palmer@dabbelt.com>
Cc: Christoph Hellwig <hch@infradead.org>, michael@michaelkloos.com,
 Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] riscv: Work to remove kernel dependence on the M-extension
Message-ID: <YimxItxjPsPTXeub@infradead.org>
References: <YimjbmdACoQOk+hj@infradead.org>
 <mhng-08a28047-b563-41f4-b705-f27b88554f2c@palmer-mbp2014>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <mhng-08a28047-b563-41f4-b705-f27b88554f2c@palmer-mbp2014>
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Wed, Mar 09, 2022 at 11:34:25PM -0800, Palmer Dabbelt wrote:
> If someone has hardware that lacks M and users care about running Linux on
> that then I'm happy to support it.  I'll still point out the silliness of
> that decision, but if it's too late to change things then I'd rather support
> the hardware.  If it's one of these "fill out every possible allowed ISA
> flavor, even if nobody has one that runs Linux" then I don't see a reason to
> bother -- there's an infinite amount of allowable RISC-V implementations,
> we'll all go crazy chasing them around.

It's not like Linux had required M mode since the RISC-V port was merged
upstream, so any new implementor really should know about it.  And
performance on anything that requires Linux will just be horrible.
I could see a bit of an excuse for a nommu port.

Anyway, this kind of patch really does need to state the why.  And it
better be a really good reason.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
