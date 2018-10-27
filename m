Return-Path: <SRS0=itc2=NH=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_MUTT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D5C98C46475
	for <infradead-linux-riscv@archiver.kernel.org>; Sat, 27 Oct 2018 07:46:18 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8AA3A20856
	for <infradead-linux-riscv@archiver.kernel.org>; Sat, 27 Oct 2018 07:46:18 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="tD4MWbbe"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8AA3A20856
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TeFq+HpaPkEtxDC8aunzuQnObpbKBjWZG/UEthPQ6U4=; b=tD4MWbbeLrL2Wu
	VriDXcv1GWc5jgpkAdqRmph5+U8vzjKBBKJ37XWWHY9H78XqqVO9UQ7KvN+75jl948J03UADQC/26
	YZcpc0SV04knD/Ivd3baWtqN+S5sY05e1wyJKY1NA3uDaS2ZEtr/Gc6wJuc2mbrOxlW292PcCS+Ct
	UFhY+KjZFG/0E9FDR1iiS1cZY5Ca/0veZqPfF8aEhWyX0iUpnzY4IPZHHCLDmVsXKBHTBDPRxlbvJ
	MrAsDM3hIUJ4HNkhnmpB6zvFHgvxKVCJGTejwe5O4khm9uPhMIL4RlnQrlTkVQgl6LxcIiDF2rqyc
	LMehe9955zvDtzOoomuQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gGJIV-0003Yl-M2; Sat, 27 Oct 2018 07:46:15 +0000
Received: from hch by bombadil.infradead.org with local (Exim 4.90_1 #2 (Red
 Hat Linux)) id 1gGJIT-0003YZ-Iv; Sat, 27 Oct 2018 07:46:13 +0000
Date: Sat, 27 Oct 2018 00:46:13 -0700
From: Christoph Hellwig <hch@infradead.org>
To: Palmer Dabbelt <palmer@sifive.com>
Subject: Re: [PATCH 1/2] Move EM_RISCV into elf-em.h
Message-ID: <20181027074613.GA7868@infradead.org>
References: <CAEn-LTqbEmWovu4t7Rs4C211+GRRU4V3B=+WmW0SOhX_b8db5Q@mail.gmail.com>
 <20181024204036.8799-1-palmer@sifive.com>
 <20181024204036.8799-2-palmer@sifive.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20181024204036.8799-2-palmer@sifive.com>
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
Cc: kstewart@linuxfoundation.org, aou@eecs.berkeley.edu, wad@chromium.org,
 paul@paul-moore.com, Greg KH <gregkh@linuxfoundation.org>,
 Wesley Terpstra <wesley@sifive.com>, david.abdurachmanov@gmail.com,
 linux-kernel@vger.kernel.org, eparis@redhat.com, luto@amacapital.net,
 dhowells@redhat.com, linux-audit@redhat.com, pombredanne@nexb.com,
 linux-riscv@lists.infradead.org, tglx@linutronix.de, keescook@chromium.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
Message-ID: <20181027074613.trzpRLel90lNhQBMf-WgYRz9DhXRQez8ndjflnUq17Q@z>

On Wed, Oct 24, 2018 at 01:40:35PM -0700, Palmer Dabbelt wrote:
> This should never have been inside our arch port to begin with, it's
> just a relic from when we were maintaining out of tree patches.
> 
> Signed-off-by: Palmer Dabbelt <palmer@sifive.com>

Looks good, and probably harmless enought that we should pick it up
for this merge window:

Reviewed-by: Christoph Hellwig <hch@lst.de>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
