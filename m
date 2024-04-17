Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3B4EC4345F
	for <linux-riscv@archiver.kernel.org>; Wed, 17 Apr 2024 18:06:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=C/6X8PD+QefD0tBo525sG56nOyf+IfkKqp1VSwgoSqM=; b=b9PKA61x1sfi1c
	qjLYcdrztvXyM58Q50IK00GBfbXgCM6nFqihRg1SEXnHPi9v90NlyymQdCct04O6QGwJNgjj3t2yT
	WLgZjQ1rbwP0iXZvGsjQ6lSAKK8HopM2cZRianHBP+lBW6oAdCFjQUOWrrOo/5JXoSontTsSRWmAF
	wgYQGBXsxOh/AuqwyKBA6ZlR7QSgvXfwLs1GpWAjH8MOgjcCV+ds7UMX/l0IQHdL9Oyj5p0tnMAz7
	LPhrxneyLGJ+HoRszsuwhmzDc7294nvc/RVHNdZCJNyb901h4Enrv5EzoSteqFcEEKrJxRG5K8d8G
	1FzTLV1FXjMHzeDfYrLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rx9fx-0000000H8CN-49pq;
	Wed, 17 Apr 2024 18:06:29 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rx9ft-0000000H89m-3j4M
	for linux-riscv@lists.infradead.org;
	Wed, 17 Apr 2024 18:06:29 +0000
Date: Wed, 17 Apr 2024 20:06:17 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1713377180;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=pwylh6Dtd2mdV0b8+p19DcG02NblOYqwKMD1VZyGC1o=;
	b=PTnXRkL0Gx3ZvvovCOtl8ojNWOUmAw0Lw3c3YU2zdLPSfYxMnMlL0SvFTTJKO51paktGUV
	RGEh5iibetSJew8rfbQDbYxMPFffMsoVjmnPSMeFkKrqUAEttHCCzIN4d08NeOU8dnEXS6
	tDoJj3Z0v4BSN1CBw6h4fiuzW/JMdPGt7RrAaPnPtGew3KXkHGx9qlYIDVa3+/LSAeysJx
	jylL0OQycAkKMO23FGGqqC0ilWzMUCyIjO6NiMh0QLRJXDeU5WrScnumsF4mZJDaVysAmb
	dYzAzJBTuZCDbDDplVOSCAv7rBJ+AKYUx1sdDUAZwpRE5Wl0W/t0FlhE9HQvZQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1713377180;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=pwylh6Dtd2mdV0b8+p19DcG02NblOYqwKMD1VZyGC1o=;
	b=u0uvNqcxsrxeHeclsTeo2hclmfvQKtnv7ZQIvprFID5UogtYQNXGwTi1vc+sqQegdsu+K4
	43uPtNQkpiHk8KCA==
From: Nam Cao <namcao@linutronix.de>
To: "Theodore Ts'o" <tytso@mit.edu>
Cc: Mike Rapoport <rppt@kernel.org>, Matthew Wilcox <willy@infradead.org>,
 =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>, Christian Brauner
 <brauner@kernel.org>, Andreas Dilger <adilger@dilger.ca>, Al Viro
 <viro@zeniv.linux.org.uk>, linux-fsdevel <linux-fsdevel@vger.kernel.org>,
 Jan Kara <jack@suse.cz>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, linux-riscv@lists.infradead.org, Ext4
 Developers List <linux-ext4@vger.kernel.org>, Conor Dooley
 <conor@kernel.org>, Anders Roxell <anders.roxell@linaro.org>, Alexandre
 Ghiti <alex@ghiti.fr>
Subject: Re: riscv32 EXT4 splat, 6.8 regression?
Message-ID: <20240417200617.2f54bc7b@namcao>
In-Reply-To: <20240417153122.GE2277619@mit.edu>
References: <8734rlo9j7.fsf@all.your.base.are.belong.to.us>
	<Zh6KNglOu8mpTPHE@kernel.org>
	<20240416171713.7d76fe7d@namcao>
	<20240416173030.257f0807@namcao>
	<87v84h2tee.fsf@all.your.base.are.belong.to.us>
	<20240416181944.23af44ee@namcao>
	<Zh6n-nvnQbL-0xss@kernel.org>
	<Zh6urRin2-wVxNeq@casper.infradead.org>
	<Zh7Ey507KXIak8NW@kernel.org>
	<20240417003639.13bfd801@namcao>
	<20240417153122.GE2277619@mit.edu>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240417_110626_104539_7714C148 
X-CRM114-Status: UNSURE (   9.63  )
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

On 2024-04-17 Theodore Ts'o wrote:
> On Wed, Apr 17, 2024 at 12:36:39AM +0200, Nam Cao wrote:
> > 
> > However, I am confused about one thing: doesn't this make one page of
> > physical memory inaccessible?  
> 
> So are these riscv32 systems really having multiple terabytes of
> memory?  Why is this page in the physical memory map in the first
> place?

It's 32 bit, so it doesn't take much to fill up the entire address space.

Here's the memory layout from kernel boot log:

[    0.000000] Virtual kernel memory layout:
[    0.000000]       fixmap : 0x9c800000 - 0x9d000000   (8192 kB)
[    0.000000]       pci io : 0x9d000000 - 0x9e000000   (  16 MB)
[    0.000000]      vmemmap : 0x9e000000 - 0xa0000000   (  32 MB)
[    0.000000]      vmalloc : 0xa0000000 - 0xc0000000   ( 512 MB)
[    0.000000]       lowmem : 0xc0000000 - 0x00000000   (1024 MB)

Note that lowmem occupies the last 1GB, including ERR_PTR (the last
address wraps to zero)

Best regards,
Nam

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
