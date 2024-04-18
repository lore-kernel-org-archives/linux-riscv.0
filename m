Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D62C4C4345F
	for <linux-riscv@archiver.kernel.org>; Thu, 18 Apr 2024 09:18:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2e/oSl4URBC69CW63aLdFopY61Tn6ypVF0ZnzOMsXVA=; b=YrWEOOzAbW6Ama
	IjtK/kFjsTDBDJol1MWZ3Uwxhv3gIVnwkjrZOgrQCk/4ktaVl7E7TcbkyGaAJZIyK+6UYNHc4gdo4
	QslvjfS42a9Fh7nQG7ReZoqCsbD424MhJbOaTzTt3eWu494D19o8/wA5qJtl2LV5VSe/2qQeqzMlc
	mUDGPEi39TyVG+salScaER/JOoaO+nvmPagGMSRwQmA+SRsAV7gRzGfpM+v9kuyd6OpO5uIy3/7lY
	Lhzw4gHe+VlbLrxnOtAy2Wd4QpSSJhZ0jeYEHKrpzXb8KVCwjZGMJBhLo8xO8V/KsVyZb6+Ze9xkS
	EgnpSj+9kjAH9VKE+DMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rxNuB-00000001Zjw-3UQA;
	Thu, 18 Apr 2024 09:18:07 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rxNu4-00000001ZgZ-2pdC
	for linux-riscv@lists.infradead.org;
	Thu, 18 Apr 2024 09:18:06 +0000
Date: Thu, 18 Apr 2024 11:17:53 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1713431876;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Oueb3ytqZ96zkn2QKrFrNWUZdLKfS4yQ3a5dkMeXex4=;
	b=kYhmEVhyg3DkkbnTYmIlxS/bFKU84wNu8BpFe4KuGjFRC45Ju9pdzyjfTIiEg9+oAknHqK
	chFRwQ33lTb9Hp9QE54aDK1i9iliWAq4BzCL6P3dVD2wtIn/b/Vezhmi2/S5JMp8Vtm/qf
	PwiUnqvezDYFBv5OAzF3OKQE1kN+JQUnqUkjfMmHCiB7VHEAAxL37u8txbRbfqLmOzUKsK
	JN67eqLCJTC8j3uBGTLQZ3SRw4MLkH5/FER5cSATmZu2Gbxs4THKcExo6fGUzO8a4fmtN8
	tDiauRnpC0R2PkfZDLbrxdR1Aki8epCDaqVjKOuXqsaamIQUeONwF4BvKGDGBQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1713431876;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Oueb3ytqZ96zkn2QKrFrNWUZdLKfS4yQ3a5dkMeXex4=;
	b=Pjd5L9qWrP4A+6OlCBgjPk/bKfRDPSbEyBQGI8KS/tK/1yQbRHFlQx2CK1cL5UpXoDRFRc
	YqcsqTsBuFMHmWAQ==
From: Nam Cao <namcao@linutronix.de>
To: Andreas Dilger <adilger@dilger.ca>
Cc: Mike Rapoport <rppt@kernel.org>, Matthew Wilcox <willy@infradead.org>,
 =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>, Christian Brauner
 <brauner@kernel.org>, Al Viro <viro@zeniv.linux.org.uk>, linux-fsdevel
 <linux-fsdevel@vger.kernel.org>, Jan Kara <jack@suse.cz>, Linux Kernel
 Mailing List <linux-kernel@vger.kernel.org>,
 linux-riscv@lists.infradead.org, Theodore Ts'o <tytso@mit.edu>, Ext4
 Developers List <linux-ext4@vger.kernel.org>, Conor Dooley
 <conor@kernel.org>, Anders Roxell <anders.roxell@linaro.org>, Alexandre
 Ghiti <alex@ghiti.fr>
Subject: Re: riscv32 EXT4 splat, 6.8 regression?
Message-ID: <20240418111753.1c485974@namcao>
In-Reply-To: <1F07FFF3-663B-43D4-A9DA-C89856F2962A@dilger.ca>
References: <20240416-deppen-gasleitung-8098fcfd6bbd@brauner>
	<8734rlo9j7.fsf@all.your.base.are.belong.to.us>
	<Zh6KNglOu8mpTPHE@kernel.org>
	<20240416171713.7d76fe7d@namcao>
	<20240416173030.257f0807@namcao>
	<87v84h2tee.fsf@all.your.base.are.belong.to.us>
	<20240416181944.23af44ee@namcao>
	<Zh6n-nvnQbL-0xss@kernel.org>
	<Zh6urRin2-wVxNeq@casper.infradead.org>
	<Zh7Ey507KXIak8NW@kernel.org>
	<20240417003639.13bfd801@namcao>
	<1F07FFF3-663B-43D4-A9DA-C89856F2962A@dilger.ca>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240418_021800_965115_C8422E0F 
X-CRM114-Status: GOOD (  12.31  )
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

On 2024-04-17 Andreas Dilger wrote:
> On Apr 16, 2024, at 4:36 PM, Nam Cao <namcao@linutronix.de> wrote:
> > However, I am confused about one thing: doesn't this make one page of
> > physical memory inaccessible?
> > 
> > Is it better to solve this by setting max_low_pfn instead? Then at
> > least the page is still accessible as high memory.  
> 
> Is that one page of memory really worthwhile to preserve?  Better to
> have a simple solution that works,

Good point.

> maybe even mapping that page
> read-only so that any code which tries to dereference an ERR_PTR
> address immediately gets a fault?

Not sure about this part: it doesn't really fix the problem, just
changes from subtle crashes into page faults.

Let me send a patch to reserve the page: simple and works for all
architectures.

Best regards,
Nam

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
