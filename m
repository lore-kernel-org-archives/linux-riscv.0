Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96874C83000
	for <linux-riscv@archiver.kernel.org>; Mon, 30 Jun 2025 06:45:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kYhQu5Zik/NWu+zKhbzJN0iTEFZiZ7dF8NMa1FVzg5o=; b=p5oBT7IEYY3Cb+
	i7HOggmvVvVKX69RSWI540ZDxpyF2H560rp4p5uqp2t1kNRMt5UgfKroqW3QxZUAxArjfJ0IQq7AP
	0KmcYZdwOMZxGj0cjeVjSEcySZCoG4Q2TBOX6+5jg0QC4jlTtb2o/ySjzGTQd1yP+TN6YLy6Bbwkj
	VHVqpF49CwFE99sySBxIxpZ3JKl0NQH6UPbNPJcS0FRI91O4SshcB4EPXaIeBzkEuf7xIac79dr6d
	3oLDwobVun3nbLFg2enb34Fbp4fAAj4GcWcKfFiPUs9K9/vFh+M0sP2hDL/YxiZ2IT1PYGqSSeHlU
	C80bhYlPXvg8N5YtqFgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uW8GT-00000001MxI-3IBs;
	Mon, 30 Jun 2025 06:45:17 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uW8GQ-00000001Mww-419n
	for linux-riscv@lists.infradead.org;
	Mon, 30 Jun 2025 06:45:16 +0000
Date: Mon, 30 Jun 2025 08:45:06 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1751265910;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=QZQltrJmsUv5t75sduP0xOfkCDCGatOPuiFCAR+zNeU=;
	b=OujG/FW7w2zbApKtr9vE6HArhqNcbw3ImwDJDisdlEkk1t2HCMjwtrLRQ1/rs4+17H3YUl
	XxFm/zjgI5M36oDVYIEHXbHI5FFg/VxL4YCbaDiXWa+YngTnTS4VVIxi5/BBYsDf4vAAQG
	mF4uccUOgrl0gFifZlNA5GqOshFS/qqFbCz1GPdN4yNj8I8xn3KMhWObJ8sLblodxz1mTO
	nuBOT/mcXz8YFjXJNOmLeWUh4gf7Ixg3VwtGF+ZHD5uQMSpIUhH50CgWvqUVQsaPLs1V6I
	UdYFwF1415IuLHOUZnrtdqB8wZvKJ0gmYTLIOPtdy7vvVqp55NuD8xUhEyQ7hg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1751265910;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=QZQltrJmsUv5t75sduP0xOfkCDCGatOPuiFCAR+zNeU=;
	b=hCS6zI6mXbfa8ruVxFhSDZbvAzAQ1i0Q2z+VsINTus+7rGoccNHJOH+xaOSwkTTWLOhGwS
	617UoxWjv5els8BQ==
From: Nam Cao <namcao@linutronix.de>
To: kernel test robot <lkp@intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org, Palmer Dabbelt <palmer@dabbelt.com>,
	Alexandre Ghiti <alexghiti@rivosinc.com>,
	linux-riscv@lists.infradead.org
Subject: Re: ld.lld: error: Function Import: link error: linking module flags
 'Code Model': IDs have conflicting values: 'i32 3' from vmlinux.a(init.o at
 899876), and 'i32 1' from vmlinux.a(security.o at 937376)
Message-ID: <20250630064442.M5D7FRfm@linutronix.de>
References: <202506290255.KBVM83vZ-lkp@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <202506290255.KBVM83vZ-lkp@intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250629_234515_172634_50085BAB 
X-CRM114-Status: GOOD (  13.36  )
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

+Cc: linux-riscv@lists.infradead.org

On Sun, Jun 29, 2025 at 02:25:33AM +0800, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
> head:   aaf724ed69264719550ec4f194d3ab17b886af9a
> commit: 890ba5be6335dbbbc99af14ea007befb5f83f174 Revert "riscv: Define TASK_SIZE_MAX for __access_ok()"
> date:   5 days ago
> config: riscv-randconfig-001-20250628 (https://download.01.org/0day-ci/archive/20250629/202506290255.KBVM83vZ-lkp@intel.com/config)
> compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project e04c938cc08a90ae60440ce22d072ebc69d67ee8)
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250629/202506290255.KBVM83vZ-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202506290255.KBVM83vZ-lkp@intel.com/
> 
> All errors (new ones prefixed by >>):
> 
>    ld.lld: error: Function Import: link error: linking module flags 'Code Model': IDs have conflicting values: 'i32 3' from vmlinux.a(init.o at 899876), and 'i32 1' from vmlinux.a(net-traces.o at 1014596)
>    ld.lld: error: Function Import: link error: linking module flags 'Code Model': IDs have conflicting values: 'i32 3' from vmlinux.a(init.o at 899876), and 'i32 1' from vmlinux.a(e1000_main.o at 992876)
>    ld.lld: error: Function Import: link error: linking module flags 'Code Model': IDs have conflicting values: 'i32 3' from vmlinux.a(init.o at 899876), and 'i32 1' from vmlinux.a(core.o at 912236)
> >> ld.lld: error: Function Import: link error: linking module flags 'Code Model': IDs have conflicting values: 'i32 3' from vmlinux.a(init.o at 899876), and 'i32 1' from vmlinux.a(security.o at 937376)
> >> ld.lld: error: Function Import: link error: linking module flags 'Code Model': IDs have conflicting values: 'i32 3' from vmlinux.a(init.o at 899876), and 'i32 1' from vmlinux.a(sock.o at 1012256)
>    ld.lld: error: Function Import: link error: linking module flags 'Code Model': IDs have conflicting values: 'i32 3' from vmlinux.a(init.o at 899876), and 'i32 1' from vmlinux.a(ioctl.o at 1015736)
> >> ld.lld: error: Function Import: link error: linking module flags 'Code Model': IDs have conflicting values: 'i32 3' from vmlinux.a(init.o at 899876), and 'i32 1' from vmlinux.a(socket.o at 1012196)
>    ld.lld: error: Function Import: link error: linking module flags 'Code Model': IDs have conflicting values: 'i32 3' from vmlinux.a(init.o at 899876), and 'i32 1' from vmlinux.a(ring_buffer.o at 910076)
>    ld.lld: error: Function Import: link error: linking module flags 'Code Model': IDs have conflicting values: 'i32 3' from vmlinux.a(init.o at 899876), and 'i32 1' from vmlinux.a(hugetlb.o at 919016)
> >> ld.lld: error: Function Import: link error: linking module flags 'Code Model': IDs have conflicting values: 'i32 3' from vmlinux.a(init.o at 899876), and 'i32 1' from vmlinux.a(btf.o at 913916)
>    ld.lld: error: Function Import: link error: linking module flags 'Code Model': IDs have conflicting values: 'i32 3' from vmlinux.a(init.o at 899876), and 'i32 1' from vmlinux.a(page_alloc.o at 918536)
>    ld.lld: error: Function Import: link error: linking module flags 'Code Model': IDs have conflicting values: 'i32 3' from vmlinux.a(init.o at 899876), and 'i32 1' from vmlinux.a(slub.o at 918836)
>    ld.lld: error: Function Import: link error: linking module flags 'Code Model': IDs have conflicting values: 'i32 3' from vmlinux.a(init.o at 899876), and 'i32 1' from vmlinux.a(spi.o at 992036)
>    ld.lld: error: Function Import: link error: linking module flags 'Code Model': IDs have conflicting values: 'i32 3' from vmlinux.a(init.o at 899876), and 'i32 1' from vmlinux.a(vmalloc.o at 918296)
>    ld.lld: error: Function Import: link error: linking module flags 'Code Model': IDs have conflicting values: 'i32 3' from vmlinux.a(init.o at 899876), and 'i32 1' from vmlinux.a(syscall.o at 912296)
>    ld.lld: error: Function Import: link error: linking module flags 'Code Model': IDs have conflicting values: 'i32 3' from vmlinux.a(init.o at 899876), and 'i32 1' from vmlinux.a(trace.o at 910136)
>    ld.lld: error: Function Import: link error: linking module flags 'Code Model': IDs have conflicting values: 'i32 3' from vmlinux.a(init.o at 899876), and 'i32 1' from vmlinux.a(skbuff.o at 1012376)
>    ld.lld: error: Function Import: link error: linking module flags 'Code Model': IDs have conflicting values: 'i32 3' from vmlinux.a(init.o at 899876), and 'i32 1' from vmlinux.a(vmscan.o at 916376)
>    ld.lld: error: Function Import: link error: linking module flags 'Code Model': IDs have conflicting values: 'i32 3' from vmlinux.a(init.o at 899876), and 'i32 1' from vmlinux.a(xprtsock.o at 1024196)
>    ld.lld: error: Function Import: link error: linking module flags 'Code Model': IDs have conflicting values: 'i32 3' from vmlinux.a(init.o at 899876), and 'i32 1' from vmlinux.a(filemap.o at 915776)
>    ld.lld: error: too many errors emitted, stopping now (use --error-limit=0 to see all errors)

I'm not sure what lld is saying here. It seems this problem has always been
there, the revert commit just made it appears more.

These errors should still be investigated, but I think the revert commit is
fine.

I see CONFIG_CMODEL_MEDLOW=y, so probably has something to do with
arch/riscv/mm/init.c is compiled with -mcmodel=medany, while the others are
compiled with -mcmodel=medlow. I leave it to smarter minds..

Nam

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
