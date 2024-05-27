Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15CE4C25B74
	for <linux-riscv@archiver.kernel.org>; Mon, 27 May 2024 08:03:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gwxxOwgYHvBNfWcupysrMATgUoZtTPz5K4QE8WTO3gE=; b=40gu+Nz5qGvejh
	CTjZIkdhdKDecPLFtPZ6zSuvMs2cVxRz5H3P/96QMaOH1sR0h5KoCtl8YoFCwRVnGunRN+ZzOk+Jd
	eklRF1kI1sld5DPwPJ7pXEKSKIFizaDbCRdLC72/uvhLAXzktu5mlx1QiBZD92FApVnW4OlbO0sE3
	MLK18B5wxRVziQwZgWagqgHJ0c4/mvDHzpwIdbp5Q1LehULnjb1VsLiFeyhAOZqYkSbQO0dl104T4
	sMS71LdB1suRBtRG6Sh3C7P6p0sLJGlCre2+W2q1Snyowy+vlk5ZGHObDAVVX6OBVNv5RS7Kn+bng
	ZFJ4r3C9zgaxeoXkAJgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sBVKf-0000000EAa8-0ZyB;
	Mon, 27 May 2024 08:03:49 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sBVKZ-0000000EAZ1-2sVw
	for linux-riscv@lists.infradead.org;
	Mon, 27 May 2024 08:03:46 +0000
Date: Mon, 27 May 2024 10:03:40 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1716797021;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=O07l7F34rGKPI/JlYfnfn+ksH7jzv3sBlkpBvpJVf6A=;
	b=kR+THNhWaOnQwj5hIFVx8Yd01Ow3q8XNtt/2Z9UM6Uz3qbjtkcUQm8zCpoifQ/WfWCk1zh
	RwlshBcjsuZUu8cpO5wx0oBx9M7qBH5H6TKD/E6Yl9xJyazQ/FaISFlo4ZncVW6wbtCpp4
	AS9ZVjnVICjdVsLDmzXCdR6HUAIorDoOL75dJSWaeaSCEKkdayrIiWOK7Fk9X5h0OOjrQ8
	HlM0O34waUBpzwWcLVJuZyXG1jWtT0D/kE7XqMbSEoeUlqQKSQs1i2qgy9/dHzZzq6T0c4
	89P+7y7Sy7PPJbNs//2K244WXxWPRdPvlU4T2nVN2Q0Fo7b9u7KfpTBHU8g6dg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1716797021;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=O07l7F34rGKPI/JlYfnfn+ksH7jzv3sBlkpBvpJVf6A=;
	b=6125lFefGFAqoXKByolxt5/AEdIyt+maOlbNxKOccuEiZmWwgC9uubZOjdX7c4wDzNegTM
	aCpHsKAw4jZSCpCg==
From: Nam Cao <namcao@linutronix.de>
To: Andreas Schwab <schwab@suse.de>
Cc: Palmer Dabbelt <palmer@rivosinc.com>, linux-riscv@lists.infradead.org
Subject: Re: [PATCH] RISC-V: io: Don't have a void* PCI_IOBASE
Message-ID: <20240527080340.cghUNM1o@linutronix.de>
References: <20240526213617.12890-2-palmer@rivosinc.com>
 <mvm5xuzwvg2.fsf@suse.de>
 <20240527075509.gOIDkp3X@linutronix.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240527075509.gOIDkp3X@linutronix.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240527_010343_897583_9D880192 
X-CRM114-Status: GOOD (  15.43  )
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

On Mon, May 27, 2024 at 09:55:15AM +0200, Nam Cao wrote:
> On Mon, May 27, 2024 at 09:44:13AM +0200, Andreas Schwab wrote:
> > On Mai 26 2024, Palmer Dabbelt wrote:
> > 
> > > I recently started noticing warnings along the lines of
> > >
> > >     include/asm-generic/io.h:752:2: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
> > >             insw(addr, buffer, count);
> > >             ^~~~~~~~~~~~~~~~~~~~~~~~~
> > >     arch/riscv/include/asm/io.h:105:53: note: expanded from macro 'insw'
> > >     #define insw(addr, buffer, count) __insw(PCI_IOBASE + (addr), buffer, count)
> > >
> > > which are triggered by having PCI_IOBASE be a "void __iomem *".  I'm not
> > > quite sure what the right thing to do is here: having it as u8 to make
> > > the pointer arithmetic work seems reasonable to me,
> > 
> > A u8 null pointer is still a null pointer.  Are you sure you are quoting
> > the right warning?  AFAICS, PCI_IOBASE is not a null pointer.
> 
> Null pointer has nothing to do with this. The warning is about arithmetic
> operation on void*, which is undefined behavior.

Wait, I am dumb. It is about null pointer.
Pretend you didn't see my email.

> 
> Compilers usually do arithmetic on void* the same way as for u8*, but that
> is not defined by C.
> 
> Best regards,
> Nam

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
