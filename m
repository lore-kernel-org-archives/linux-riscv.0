Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5EE44C25B74
	for <linux-riscv@archiver.kernel.org>; Mon, 27 May 2024 07:55:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ylzrZ1S9ne9RBOQnRB7jn7W5WrgiIeURVm1XMrooPxA=; b=nNpR+W+leyrfdq
	taCwM9KELxppFtglTzG0C/2JKXTD1kOiA4mzTfB1E53WwfvG3i73JKPUaacPRMO1ftG8+6F17XT4F
	4e17jwPCbO6W0E0094patHQzqJEdmj8gwBRpj4OHS8Pn5KnYyeij3C3ReS8hFlHTYwHqHXSfg7zdr
	TB7uHLKZcIGkpcCldmQeO0Qg3PCw0UPODKCBCQdmW1+UyHErOw2yRupHZ7rcOQCoknatEZJ5NSO/Q
	05wyuyAMw22iNHmcOJ9RlBa/W2s4W17TyP3vwiTN7WgebZwZqglsR7tNJ2BgeZ0X9/LIe3si/+OKx
	wGv9Xjga6HJr2qvONFEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sBVCY-0000000E9Gi-2CwD;
	Mon, 27 May 2024 07:55:26 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sBVCU-0000000E9FC-0GNk
	for linux-riscv@lists.infradead.org;
	Mon, 27 May 2024 07:55:25 +0000
Date: Mon, 27 May 2024 09:55:09 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1716796515;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=sKLDMMmpkw/xVnmbYuN2U0/2lwve2StbFNx8tRxCI8Y=;
	b=jgL+egcVhidOXP7gvLwZPjwWn1g+sGLsniBxOlbTryZtwwA0BM8EwL8Zzsd09lznrR1iFv
	Aw1bg1APHAJ48fEZEi8iGhQsNZfWu7FvuSm4whV58ulRbtQDwlXrFSid5BZSnpbkpHLoxr
	fKZmEweVDjYLxVJjnWRPIYmPVRU0JQbFPrm6pQZM1hrE8GedP3MRXK7oOWLCQYWZVgQEhs
	6OyV7P2OCwp/RkPzzDW6ClMVN6QBo8hNXk1waQwlfI0yfGjAISR+c4W78VnoOz3AITrDA8
	nSqafIE7FKGOPpZXIvJawZA92QvpMjIhzERwPcVs7yROvec7pcS7Op8GrFrOcw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1716796515;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=sKLDMMmpkw/xVnmbYuN2U0/2lwve2StbFNx8tRxCI8Y=;
	b=bCQFDDd/4bG11/BT/TaH2pidb3L1WZ1z8nvI27TJOEf+DqLdenaaTsT46Yk3Pot6gvc9kn
	Ky1F+L/7w1QhFZDQ==
From: Nam Cao <namcao@linutronix.de>
To: Andreas Schwab <schwab@suse.de>
Cc: Palmer Dabbelt <palmer@rivosinc.com>, linux-riscv@lists.infradead.org
Subject: Re: [PATCH] RISC-V: io: Don't have a void* PCI_IOBASE
Message-ID: <20240527075509.gOIDkp3X@linutronix.de>
References: <20240526213617.12890-2-palmer@rivosinc.com>
 <mvm5xuzwvg2.fsf@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <mvm5xuzwvg2.fsf@suse.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240527_005522_269612_0BD0E839 
X-CRM114-Status: GOOD (  11.20  )
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

On Mon, May 27, 2024 at 09:44:13AM +0200, Andreas Schwab wrote:
> On Mai 26 2024, Palmer Dabbelt wrote:
> 
> > I recently started noticing warnings along the lines of
> >
> >     include/asm-generic/io.h:752:2: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
> >             insw(addr, buffer, count);
> >             ^~~~~~~~~~~~~~~~~~~~~~~~~
> >     arch/riscv/include/asm/io.h:105:53: note: expanded from macro 'insw'
> >     #define insw(addr, buffer, count) __insw(PCI_IOBASE + (addr), buffer, count)
> >
> > which are triggered by having PCI_IOBASE be a "void __iomem *".  I'm not
> > quite sure what the right thing to do is here: having it as u8 to make
> > the pointer arithmetic work seems reasonable to me,
> 
> A u8 null pointer is still a null pointer.  Are you sure you are quoting
> the right warning?  AFAICS, PCI_IOBASE is not a null pointer.

Null pointer has nothing to do with this. The warning is about arithmetic
operation on void*, which is undefined behavior.

Compilers usually do arithmetic on void* the same way as for u8*, but that
is not defined by C.

Best regards,
Nam

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
