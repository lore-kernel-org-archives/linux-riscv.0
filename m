Return-Path: <SRS0=E2Nt=XW=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 057FFC388F4
	for <infradead-linux-riscv@archiver.kernel.org>; Fri, 27 Sep 2019 22:25:21 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C7FA9217D9
	for <infradead-linux-riscv@archiver.kernel.org>; Fri, 27 Sep 2019 22:25:20 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="DTBsGtva"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C7FA9217D9
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3Yapg7l1znqz+SHehPeGkK5Jn/5SKYEyfR97Ro8y5I4=; b=DTBsGtvaQJ6nRX
	wM565fb2jGIwf8Z78YP3xVxeZJI1iOhB2fe7TI/OF2U0kmXSsTxk/jYKZQBQ2am+ZOtS+cBbwyYqu
	L+MaM0qdOiL1jVsFUdU3ZLJrW5V6VolENe5fUjWoMGhv7YGmPiF253TLSqSjFRWqsp7eTEK7uuj81
	Fd8bYwk4u0NUSwrhaTuGxt3mEnTQq8vxjYKoqJJOe/ZGEJ/t4xiYGq4jzFtQ6XCY8VLSNOOfOkcpK
	gow/c0ShI2cnGRBQ0gP7Kp5JCgHfmgfYRZ8qnCxMOwknnIPvdxP8dmSKF2Lp2YtFyZuN5TwomlLRj
	MohGx8dnwWMop5Krwm/A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.2 #3 (Red Hat Linux))
	id 1iDyfw-0004Fe-HF; Fri, 27 Sep 2019 22:25:20 +0000
Received: from hch by bombadil.infradead.org with local (Exim 4.92.2 #3 (Red
 Hat Linux)) id 1iDyfu-0004FN-Lb; Fri, 27 Sep 2019 22:25:18 +0000
Date: Fri, 27 Sep 2019 15:25:18 -0700
From: Christoph Hellwig <hch@infradead.org>
To: Vincent Chen <vincent.chen@sifive.com>
Subject: Re: [PATCH 1/4] riscv: avoid kernel hangs when trapped in BUG()
Message-ID: <20190927222518.GF4700@infradead.org>
References: <1569199517-5884-1-git-send-email-vincent.chen@sifive.com>
 <1569199517-5884-2-git-send-email-vincent.chen@sifive.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1569199517-5884-2-git-send-email-vincent.chen@sifive.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: linux-riscv@lists.infradead.org, palmer@sifive.com,
 linux-kernel@vger.kernel.org, aou@eecs.berkeley.edu, paul.walmsley@sifive.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Mon, Sep 23, 2019 at 08:45:14AM +0800, Vincent Chen wrote:
> When the CONFIG_GENERIC_BUG is disabled by disabling CONFIG_BUG, if a
> kernel thread is trapped by BUG(), the whole system will be in the
> loop that infinitely handles the ebreak exception instead of entering the
> die function. To fix this problem, the do_trap_break() will always call
> the die() to deal with the break exception as the type of break is
> BUG_TRAP_TYPE_BUG.
> 
> Signed-off-by: Vincent Chen <vincent.chen@sifive.com>

Looks good,

Reviewed-by: Christoph Hellwig <hch@lst.de>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
