Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00523C433F5
	for <linux-riscv@archiver.kernel.org>; Mon, 10 Jan 2022 16:30:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vIVUEEGT9sj9bWGs4nqUSTw1Eaaee5JQQFbu6LRWuSY=; b=bEQybLHp9mBxw/
	ob8oRRp/nWNrEQCbfB/ntLF+Zsr+W561vZOi+cbopQnPdbGB1VEo5aFhNy8o4qEd+bxVOf8md0Ttl
	WH8zjy4yNVP5Umgxqa5cGDr/xzLlp9thRRGoezOE1+dyhowW6/Xid1MhRDUEyGDsgBeot6GvDk6KD
	IzJ+61DUh+MYqCsdt/+nqDGHtJWgiaBRBG2N+J/m3nfer/ZpoTW2VTzEeCC5hsqe0maQ86WJKYPUV
	V5qXHhKH7Vu11XDctwTHt8ys994C2hvEP7Sm/O6Yz1uWs95ISGWkjXGxa+og0UOTK8naeWMH/DD2l
	iVYw93vETJhR0+mZxuKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n6xYp-00CMns-5b; Mon, 10 Jan 2022 16:30:19 +0000
Received: from hch by bombadil.infradead.org with local (Exim 4.94.2 #2 (Red
 Hat Linux)) id 1n6xYm-00CMnJ-8F; Mon, 10 Jan 2022 16:30:16 +0000
Date: Mon, 10 Jan 2022 08:30:16 -0800
From: Christoph Hellwig <hch@infradead.org>
To: Arnd Bergmann <arnd@arndb.de>
Cc: Guo Ren <guoren@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Anup Patel <anup.patel@wdc.com>, gregkh <gregkh@linuxfoundation.org>,
 liush <liush@allwinnertech.com>, Wei Fu <wefu@redhat.com>,
 Drew Fustini <drew@beagleboard.org>,
 Wang Junqiang <wangjunqiang@iscas.ac.cn>,
 Christoph Hellwig <hch@infradead.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-riscv <linux-riscv@lists.infradead.org>,
 linux-csky@vger.kernel.org, linux-s390 <linux-s390@vger.kernel.org>,
 sparclinux <sparclinux@vger.kernel.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, inux-parisc@vger.kernel.org,
 "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 the arch/x86 maintainers <x86@kernel.org>,
 Guo Ren <guoren@linux.alibaba.com>, Jeff Layton <jlayton@kernel.org>,
 "J. Bruce Fields" <bfields@fieldses.org>,
 Linux FS-devel Mailing List <linux-fsdevel@vger.kernel.org>
Subject: Re: [PATCH V2 03/17] asm-generic: fcntl: compat: Remove duplicate
 definitions
Message-ID: <YdxfGMDJh2ZVq8jc@infradead.org>
References: <20211228143958.3409187-1-guoren@kernel.org>
 <20211228143958.3409187-4-guoren@kernel.org>
 <CAK8P3a2zn9M6X09WsjJ9HYiS9WnO_YPCvJLSBk+HaH+yZHQqfA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAK8P3a2zn9M6X09WsjJ9HYiS9WnO_YPCvJLSBk+HaH+yZHQqfA@mail.gmail.com>
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

On Mon, Jan 10, 2022 at 02:35:19PM +0100, Arnd Bergmann wrote:
> > +#if !defined(CONFIG_64BIT) || defined(CONFIG_COMPAT)
> >  #ifndef F_GETLK64
> >  #define F_GETLK64      12      /*  using 'struct flock64' */
> >  #define F_SETLK64      13
> 
> The problem here is that include/uapi/ headers cannot contain checks for
> CONFIG_* symbols because those may have different meanings in user space
> compared to kernel.
> 
> This is a preexisting problem in the header, but I think the change
> makes it worse.

FYI, this is what I did in my old branch, which also sidesteps the
duplicate value problem on parisc. The rebase is untested so far,
but I can spend some cycles on finishing it:

http://git.infradead.org/users/hch/misc.git/shortlog/refs/heads/fcntl-asm-generic-cleanup

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
