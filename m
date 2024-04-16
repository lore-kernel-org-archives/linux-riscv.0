Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E42BC4345F
	for <linux-riscv@archiver.kernel.org>; Tue, 16 Apr 2024 17:00:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VM/zXei4y5Oxsrwd21pq/ILZmqVT2Ml9x4XyNXaG6F0=; b=nA55v7aXhprnj+
	EXIGRrGd2/lqfHJUTwoHjycQcFNg98LdHFdeaE9qMoZ7tbzpvcVrfBbMKZhhJyDH3YtfS9BGTV/6B
	cCs3xXhh9yyR68g7oBDB1nDLey3Qd7euN0Ferlfom2xofWvESVwSEtLvjJ9gWocrcYFmszx6bt1pS
	UQ2qVEHHHch73TA/mmOKWZozP+tPMNRe9s4rWj18ZEyFu9U1XVNJOsRX40pQl8wfGdoHKtvkYRo4j
	4nEg7HG/qUpLYz8LtBvBR3JnndCfe7FlR60fG7ijzsQt7eO3Zslg/3ZP3WoiloR1R0ar+VOTxICNU
	QKA4Hww0fvAJaLOpoIqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwmAb-0000000D5uO-21ds;
	Tue, 16 Apr 2024 17:00:33 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwmAa-0000000D5uE-0c7F
	for linux-riscv@bombadil.infradead.org;
	Tue, 16 Apr 2024 17:00:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=KRNBS/nNdDiPqgsHkyKzXY05QuyaoZshBLw+Rc9FXMA=; b=nt9mrA1vsAaOvdbNnhltvUwu9v
	eWZR64hdT0sHaVKkAKmAe02tetl0haDxBjBnAHLphqFzp/yy5osgH3yZyN6EMx70yH1d9DLHOvVrz
	dlRSWUeki4/Q/6FdINSaH5XHgpn18Dmc7bkQlSk/Sg9c13cunns8wBOiCeumO9xQ5x0BAtn5G/uU/
	xnQs8dh9gnYgu2MH0woQlj+GOoe6kRJfmSNBff0Hup94JBNpjrNs0La/eiMr7DSYEkpv1GiMYVo3T
	yqk61h9eHqECcuvHQGIgfFsTqPQCz0ZDqgjczHx4LBks0gwP9I1Os4OQf9wpGT5Ee1lDF7iiYEL7s
	zChMYYyQ==;
Received: from willy by casper.infradead.org with local (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwmAX-00000000yWu-3TaB;
	Tue, 16 Apr 2024 17:00:29 +0000
Date: Tue, 16 Apr 2024 18:00:29 +0100
From: Matthew Wilcox <willy@infradead.org>
To: Mike Rapoport <rppt@kernel.org>
Cc: Nam Cao <namcao@linutronix.de>,
	=?iso-8859-1?Q?Bj=F6rn_T=F6pel?= <bjorn@kernel.org>,
	Christian Brauner <brauner@kernel.org>,
	Andreas Dilger <adilger@dilger.ca>,
	Al Viro <viro@zeniv.linux.org.uk>,
	linux-fsdevel <linux-fsdevel@vger.kernel.org>,
	Jan Kara <jack@suse.cz>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	linux-riscv@lists.infradead.org, Theodore Ts'o <tytso@mit.edu>,
	Ext4 Developers List <linux-ext4@vger.kernel.org>,
	Conor Dooley <conor@kernel.org>,
	Anders Roxell <anders.roxell@linaro.org>,
	Alexandre Ghiti <alex@ghiti.fr>
Subject: Re: riscv32 EXT4 splat, 6.8 regression?
Message-ID: <Zh6urRin2-wVxNeq@casper.infradead.org>
References: <20240416-deppen-gasleitung-8098fcfd6bbd@brauner>
 <8734rlo9j7.fsf@all.your.base.are.belong.to.us>
 <Zh6KNglOu8mpTPHE@kernel.org>
 <20240416171713.7d76fe7d@namcao>
 <20240416173030.257f0807@namcao>
 <87v84h2tee.fsf@all.your.base.are.belong.to.us>
 <20240416181944.23af44ee@namcao>
 <Zh6n-nvnQbL-0xss@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Zh6n-nvnQbL-0xss@kernel.org>
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

On Tue, Apr 16, 2024 at 07:31:54PM +0300, Mike Rapoport wrote:
> > @@ -238,17 +237,9 @@ static void __init setup_bootmem(void)
> >  	/*
> >  	 * memblock allocator is not aware of the fact that last 4K bytes of
> >  	 * the addressable memory can not be mapped because of IS_ERR_VALUE
> > -	 * macro. Make sure that last 4k bytes are not usable by memblock
> > -	 * if end of dram is equal to maximum addressable memory.  For 64-bit
> > -	 * kernel, this problem can't happen here as the end of the virtual
> > -	 * address space is occupied by the kernel mapping then this check must
> > -	 * be done as soon as the kernel mapping base address is determined.
> > +	 * macro. Make sure that last 4k bytes are not usable by memblock.
> >  	 */
> 
> It's not only memblock, but buddy as well, so maybe
> 
> 	/*
> 	 * The last 4K bytes of the addressable memory can not be used
> 	 * because of IS_ERR_VALUE macro. Make sure that last 4K bytes are
> 	 * not usable by kernel memory allocators.
> 	 */
> 
> > -	if (!IS_ENABLED(CONFIG_64BIT)) {
> > -		max_mapped_addr = __pa(~(ulong)0);
> > -		if (max_mapped_addr == (phys_ram_end - 1))
> > -			memblock_set_current_limit(max_mapped_addr - 4096);
> > -	}
> > +	memblock_reserve(__pa(-PAGE_SIZE), PAGE_SIZE);
> 
> Ack.

Can this go to generic code instead of letting architecture maintainers
fall over it?

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
