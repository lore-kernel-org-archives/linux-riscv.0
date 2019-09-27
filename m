Return-Path: <SRS0=E2Nt=XW=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59C5BC4360C
	for <infradead-linux-riscv@archiver.kernel.org>; Fri, 27 Sep 2019 22:24:04 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 238122075D
	for <infradead-linux-riscv@archiver.kernel.org>; Fri, 27 Sep 2019 22:24:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="czt1wli2"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 238122075D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=M6tI9aVDhFOiKN0u6hkxeGN7iBfgYZNBtU/w3QOyJD4=; b=czt1wli2ZRBchN
	9vs3DvWNstBSjhrIa51m5d5Y7fBx3QYYmKNtvw/pGO53IiUOSA69n7M/RC8YJbQ0FmtvPt9iih6Td
	1KMW5tBNJg/XdYe49GirHVEX9w8sdEtBigEFX4dOYPwl7Mwf3mWmCi5tjVY/lnrKnykudfkJ2ZZTs
	d82uyOqnGMHSxMV9ntPDoml1i3bFuv55qwLlTleCArKi1esPjM0HKX9syksbuMJlV5kw3wUW+R2ui
	WbPmj9iMGXJukg3fVcviqx0N+3r797ZMqm1xA8xAbia4FtiOJbJOmQ/Eeno8auyVccS6e2rm8Zhe/
	Z/dukYnda0zEmZBI6sBA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.2 #3 (Red Hat Linux))
	id 1iDyeh-0002wX-OE; Fri, 27 Sep 2019 22:24:03 +0000
Received: from hch by bombadil.infradead.org with local (Exim 4.92.2 #3 (Red
 Hat Linux)) id 1iDyef-0002wN-2O; Fri, 27 Sep 2019 22:24:01 +0000
Date: Fri, 27 Sep 2019 15:24:01 -0700
From: Christoph Hellwig <hch@infradead.org>
To: Palmer Dabbelt <palmer@sifive.com>
Subject: Re: [PATCH] RISC-V: Clear load reservations while restoring hart
 contexts
Message-ID: <20190927222401.GE4700@infradead.org>
References: <20190925001556.12827-1-palmer@sifive.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190925001556.12827-1-palmer@sifive.com>
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
Cc: mark.rutland@arm.com, me@carlosedp.com, linux-kernel@vger.kernel.org,
 joel@sing.id.au, linux-riscv@lists.infradead.org, marco@decred.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Tue, Sep 24, 2019 at 05:15:56PM -0700, Palmer Dabbelt wrote:
> This is almost entirely a comment.  The bug is unlikely to manifest on
> existing hardware because there is a timeout on load reservations, but
> manifests on QEMU because there is no timeout.

Given how many different lines of RISC-V hardware are around how do
you know it doesn't affect any existing hardware?

Except for that the patch looks fine to me:

Reviewed-by: Christoph Hellwig <hch@lst.de>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
