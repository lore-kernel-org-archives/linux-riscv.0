Return-Path: <SRS0=jxlM=YA=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C9B10ECE58E
	for <infradead-linux-riscv@archiver.kernel.org>; Mon,  7 Oct 2019 16:10:52 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9A56C21BE5
	for <infradead-linux-riscv@archiver.kernel.org>; Mon,  7 Oct 2019 16:10:52 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="qE4PkFAc"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9A56C21BE5
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MwtOzGvag347OHmd9WsE27XB8lmIwQQAEWV/WViTXvQ=; b=qE4PkFAckX1Lkr
	zbHPCgHuNNKaCNZdA59VynJsb4wACd+YhN2jdZHHx7X8aCjoL7CWzifyNPh7V7BQgqGOfNCX6i8Hj
	88tn9iynMxCcerIytsFhWl7FlY0wVrrOGmf92rnqgzLuG8xoX/zYhXvkxyWS5fr0n+5LFTx/F2bNr
	1TZa1xCBHDt6dkxis0diYbH0bgA7YSKwOoxFMDHTlA9FSy1WnWYgHrVZPgzDosQ63Qh3lk72wVkC3
	MJlwKqtOYq/6zqse84it38G8RgQWX0sbGXGO4D8hORxTRgws4tmnz/ppFyz1RVZ431y3Oo+9MCi/G
	jaHn4eRHCkR9Uz0ln/DA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.2 #3 (Red Hat Linux))
	id 1iHVb1-00079i-9G; Mon, 07 Oct 2019 16:10:51 +0000
Received: from hch by bombadil.infradead.org with local (Exim 4.92.2 #3 (Red
 Hat Linux)) id 1iHVb0-00079G-4w; Mon, 07 Oct 2019 16:10:50 +0000
Date: Mon, 7 Oct 2019 09:10:50 -0700
From: Christoph Hellwig <hch@infradead.org>
To: Paul Walmsley <paul.walmsley@sifive.com>
Subject: Re: [PATCH 4/4] riscv: remove the switch statement in do_trap_break()
Message-ID: <20191007161050.GA20596@infradead.org>
References: <1569199517-5884-1-git-send-email-vincent.chen@sifive.com>
 <1569199517-5884-5-git-send-email-vincent.chen@sifive.com>
 <20190927224711.GI4700@infradead.org>
 <alpine.DEB.2.21.9999.1910070906570.10936@viisi.sifive.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.21.9999.1910070906570.10936@viisi.sifive.com>
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
Cc: aou@eecs.berkeley.edu, palmer@sifive.com, linux-kernel@vger.kernel.org,
 Christoph Hellwig <hch@infradead.org>, Vincent Chen <vincent.chen@sifive.com>,
 linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Mon, Oct 07, 2019 at 09:08:23AM -0700, Paul Walmsley wrote:
>  		force_sig_fault(SIGTRAP, TRAP_BRKPT,
>  				(void __user *)(regs->sepc));

No nee for the extra braces, which also means it all fits onto a single
line.  You could have just copied what I pasted..

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
