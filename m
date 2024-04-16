Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50E2DC4345F
	for <linux-riscv@archiver.kernel.org>; Tue, 16 Apr 2024 18:36:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MyiOU/sL83UujhnzUYkzeekXbxGsJ4qr2+Vf2Xfeqwc=; b=Ohsmb+lSRZ8xRg
	Ayr06Z88U+X0EpbdrQaSfZsZEmzKYjE9KqSWGaqRBf12mSL52g/h9pk19md1bqadfNMuRyXZOyJ0G
	kvL0t7eghbUFHJC4PAKSmnqHEPZUvie9qkF788f8qtTCVjKi313YeYG3ynlmx54le/wBrPXPTBrkY
	iXZLneYTGp4ISz0yKVlkVaU5ZXziexnhEGskqRx6Aih2O+f/QlkKRTlgjxtx0Q/aPqZYze0I4WO/T
	ak6omfuASMOnE5r6kGHOcBg2ZNl3rtZVGsJL1XeLXd0EtgMeGpxr3TwDf6r7KZnSNvoSgzNbUmMM/
	Tw4KHUSD71odTYv5hPqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwnf5-0000000DLBY-0PC4;
	Tue, 16 Apr 2024 18:36:07 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwnf0-0000000DLAa-2Pbt
	for linux-riscv@lists.infradead.org;
	Tue, 16 Apr 2024 18:36:06 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id A555A6124B;
	Tue, 16 Apr 2024 18:36:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 165C3C113CE;
	Tue, 16 Apr 2024 18:35:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1713292561;
	bh=RUydQSI9IalFqEGbK9QMhcm64ilwdfZmZE3G8mYwjzg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=B0XOvrLOmIGvtvZ81QXFXzN4kYMmV6ckD/uMbpDkJL8LOZfAKxnJZFm4KYJoTWIoO
	 M8TyNsvhgGRMql9wlIWgnTAj1yJcmch0lIXb0su80K1hgIpyMoUga4NhSei6/A4QCk
	 lc7bJGNPIsemhUlHKhSgp7YZTyvWyEl+9p/aR5FZCziUNaaxjKV5J6CY9Vg7g0tRuw
	 6BE159Fcux3KiPOeKvDdx07Lvy8+3/UBMYMRoW7yUZu5yxKDaYJFE6O04Tjv6grN+z
	 fR1mt4uB/FYFf4+9WdGti/KqrBBHoPa3Dvg2s5jspWiwhLLJ4TP0WNg46JR094OSOl
	 K+Kx+6gKRxQUQ==
Date: Tue, 16 Apr 2024 21:34:51 +0300
From: Mike Rapoport <rppt@kernel.org>
To: Matthew Wilcox <willy@infradead.org>
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
Message-ID: <Zh7Ey507KXIak8NW@kernel.org>
References: <20240416-deppen-gasleitung-8098fcfd6bbd@brauner>
 <8734rlo9j7.fsf@all.your.base.are.belong.to.us>
 <Zh6KNglOu8mpTPHE@kernel.org>
 <20240416171713.7d76fe7d@namcao>
 <20240416173030.257f0807@namcao>
 <87v84h2tee.fsf@all.your.base.are.belong.to.us>
 <20240416181944.23af44ee@namcao>
 <Zh6n-nvnQbL-0xss@kernel.org>
 <Zh6urRin2-wVxNeq@casper.infradead.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Zh6urRin2-wVxNeq@casper.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240416_113602_713823_9C82D332 
X-CRM114-Status: GOOD (  20.65  )
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

On Tue, Apr 16, 2024 at 06:00:29PM +0100, Matthew Wilcox wrote:
> On Tue, Apr 16, 2024 at 07:31:54PM +0300, Mike Rapoport wrote:
> > > @@ -238,17 +237,9 @@ static void __init setup_bootmem(void)
> > >  	/*
> > >  	 * memblock allocator is not aware of the fact that last 4K bytes of
> > >  	 * the addressable memory can not be mapped because of IS_ERR_VALUE
> > > -	 * macro. Make sure that last 4k bytes are not usable by memblock
> > > -	 * if end of dram is equal to maximum addressable memory.  For 64-bit
> > > -	 * kernel, this problem can't happen here as the end of the virtual
> > > -	 * address space is occupied by the kernel mapping then this check must
> > > -	 * be done as soon as the kernel mapping base address is determined.
> > > +	 * macro. Make sure that last 4k bytes are not usable by memblock.
> > >  	 */
> > 
> > It's not only memblock, but buddy as well, so maybe
> > 
> > 	/*
> > 	 * The last 4K bytes of the addressable memory can not be used
> > 	 * because of IS_ERR_VALUE macro. Make sure that last 4K bytes are
> > 	 * not usable by kernel memory allocators.
> > 	 */
> > 
> > > -	if (!IS_ENABLED(CONFIG_64BIT)) {
> > > -		max_mapped_addr = __pa(~(ulong)0);
> > > -		if (max_mapped_addr == (phys_ram_end - 1))
> > > -			memblock_set_current_limit(max_mapped_addr - 4096);
> > > -	}
> > > +	memblock_reserve(__pa(-PAGE_SIZE), PAGE_SIZE);
> > 
> > Ack.
> 
> Can this go to generic code instead of letting architecture maintainers
> fall over it?

Yes, it's just have to happen before setup_arch() where most architectures
enable memblock allocations.

-- 
Sincerely yours,
Mike.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
