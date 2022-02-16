Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30DD6C433EF
	for <linux-riscv@archiver.kernel.org>; Wed, 16 Feb 2022 16:35:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:
	In-Reply-To:Subject:cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4E97x/XUg6Q6i+QoGcP58HJwZSwt9sI29h2Csh+2QPE=; b=rBRYbwlFwQDa0h
	Fho4lvPB2a6M4OiIQs7tUUgOFvsRHQSJwXPOAVhm8LSKoZFeKjq3AnkXedjdRM3wzNj1suDWmj8Qn
	eGOkPCN02hDKrwvY9hL0Zpd3wobiY5/zbgCS9j1NyEGhCRDb6YP1/XGRsY/qRe1KJprPbEdrgyKhK
	Qu6lDfECjuuC/Seogn10NhYCcSsaBWWj+XFpGUx7eI3VKDxoX6R9Vwado6yXviRwPF3v7aSCc7JAd
	oUspoGko7VGN7fjWbLVzxjdvFdbGSBarn1+Fa+46yighHRmuA4Una044sMoBERR9vgKmRd88k06fH
	IAK07EHjt12zRACVHFxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nKNHA-007jRW-U2; Wed, 16 Feb 2022 16:35:32 +0000
Received: from angie.orcam.me.uk ([78.133.224.34])
 by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nKNGx-007jNy-9b; Wed, 16 Feb 2022 16:35:21 +0000
Received: by angie.orcam.me.uk (Postfix, from userid 500)
 id 9609A92009C; Wed, 16 Feb 2022 17:35:14 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by angie.orcam.me.uk (Postfix) with ESMTP id 8799192009B;
 Wed, 16 Feb 2022 16:35:14 +0000 (GMT)
Date: Wed, 16 Feb 2022 16:35:14 +0000 (GMT)
From: "Maciej W. Rozycki" <macro@orcam.me.uk>
To: Christoph Hellwig <hch@infradead.org>
cc: Sudip Mukherjee <sudipm.mukherjee@gmail.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Guo Ren <guoren@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, 
 Christian Borntraeger <borntraeger@linux.ibm.com>, 
 Alexander Gordeev <agordeev@linux.ibm.com>, 
 Sven Schnelle <svens@linux.ibm.com>, Jeff Dike <jdike@addtoit.com>, 
 Richard Weinberger <richard@nod.at>, 
 Anton Ivanov <anton.ivanov@cambridgegreys.com>, 
 Chris Zankel <chris@zankel.net>, Max Filippov <jcmvbkbc@gmail.com>, 
 linux-arm-kernel@lists.infradead.org, linux-csky@vger.kernel.org, 
 linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org, 
 linux-um@lists.infradead.org, linux-xtensa@linux-xtensa.org, 
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] parport_pc: Also enable driver for PCI systems
In-Reply-To: <Yg0YHHk7NVWjedgn@infradead.org>
Message-ID: <alpine.DEB.2.21.2202161631020.34636@angie.orcam.me.uk>
References: <alpine.DEB.2.21.2202141955550.34636@angie.orcam.me.uk>
 <YgtQkjRe7fbXI/lS@infradead.org>
 <alpine.DEB.2.21.2202150901170.34636@angie.orcam.me.uk>
 <Yg0YHHk7NVWjedgn@infradead.org>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220216_083519_515166_B06D3970 
X-CRM114-Status: UNSURE (   9.96  )
X-CRM114-Notice: Please train this message.
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

On Wed, 16 Feb 2022, Christoph Hellwig wrote:

> > > Instead of adding generic-y just ad a mandatory-y in
> > > include/asm-generic/Kbuild.
> > 
> >  I'm inconvinced.  Not all archs want it, 5 don't.
> 
> Which is exactly what mandatory-y is for.  Provide the asm-generic
> version by default, but let architectures override it.

 I don't think so.  Those 5 architectures don't want it at all; 7 other 
ones have their own versions.

 Otherwise we could blanket-list all asm-generic headers as mandatory-y.

  Maciej

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
