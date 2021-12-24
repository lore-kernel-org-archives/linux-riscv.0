Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69BB7C433F5
	for <linux-riscv@archiver.kernel.org>; Fri, 24 Dec 2021 06:52:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VhSuO5GsUxXrboAVnO/3EmpDkoSi/PKCt3LKc4e6L3k=; b=w9ReMSVT4pGSeF
	uFLKlDv1Uio3p5yjTZga4x+V6CN1OsFXYnVoPrkxrf5o6CDNJRehFNxeexCZnLYADkBKKKkn1zgOk
	EIVALuglIG7CQ170VxrqCKpY7BagIt7Zc1C8QzQxTkNO+NGB4QLg6K5p3EuRKnL6ztT27Nic9yaKX
	J9W8JDQInxUJGAAgLi6itf8E+Jp5vxvcr9XHUrtHgHVQv1jjczJvBAIwqGoGJfHA9CdA1tRa+KMjx
	e6OQrf85V45RDgjcgqSvvlod81B6SnF/+WsWrLE9ee1JAp5WXhKvpKg4ZoL5IFy4sHtUCBVAP4jZP
	QVFrPF3kv5PiCJad6iFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n0eRB-00Doae-NB; Fri, 24 Dec 2021 06:52:21 +0000
Received: from hch by bombadil.infradead.org with local (Exim 4.94.2 #2 (Red
 Hat Linux)) id 1n0eR7-00DoaW-T6; Fri, 24 Dec 2021 06:52:17 +0000
Date: Thu, 23 Dec 2021 22:52:17 -0800
From: Christoph Hellwig <hch@infradead.org>
To: Arnd Bergmann <arnd@arndb.de>
Cc: Guo Ren <guoren@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Anup Patel <anup.patel@wdc.com>, gregkh <gregkh@linuxfoundation.org>,
 liush <liush@allwinnertech.com>, wefu@redhat.com,
 Drew Fustini <drew@beagleboard.org>, wangjunqiang@iscas.ac.cn,
 Wei Wu =?utf-8?B?KOWQtOS8nyk=?= <lazyparser@gmail.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-riscv <linux-riscv@lists.infradead.org>,
 linux-csky@vger.kernel.org, Guo Ren <guoren@linux.alibaba.com>
Subject: Re: [PATCH 01/13] syscalls: compat: Fix the missing part for
 __SYSCALL_COMPAT
Message-ID: <YcVuIdv65utyCK18@infradead.org>
References: <20211221163532.2636028-1-guoren@kernel.org>
 <20211221163532.2636028-2-guoren@kernel.org>
 <CAK8P3a1fC8aro3kHLvGMVDdvVYjaQdxJeGur9ac=11+6=r0Xyg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAK8P3a1fC8aro3kHLvGMVDdvVYjaQdxJeGur9ac=11+6=r0Xyg@mail.gmail.com>
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

On Tue, Dec 21, 2021 at 06:08:45PM +0100, Arnd Bergmann wrote:
> > -__SYSCALL(__NR_ptrace, sys_ptrace)
> > +__SC_COMP(__NR_ptrace, sys_ptrace, compat_sys_ptrace)
> >
> 
> Right. We could merge sys_ptrace and compat_sys_ptrace() by adding
> a in_compat_syscall() check, but either way works.

I think merging them would be very useful, including merging
compat_arch_ptrace into arch_ptrace.  But we can leave that for
later.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
