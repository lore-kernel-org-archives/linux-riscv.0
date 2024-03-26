Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8EA4CC54E67
	for <linux-riscv@archiver.kernel.org>; Tue, 26 Mar 2024 15:05:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Mime-Version:References:In-Reply-To:
	Message-Id:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hXvxWppAM4xroA/TJTTIMqge+N8zOXkDbZH3cyJFOhI=; b=pOhS8CuXqdT4Cq
	mbv5EyFHpIxEjVNoWGWeTBPts5QcVV4ElTCbGS3Za7JuU7os5MLjrfckt20mu4Y+ayBJnoArCbIgX
	J3SxpNIyOxKNWu6NbTLXvDjG4KI+NZzBVN5TMKI5Gh+RNDNw/FPRjCd565JaiW77DyKU3HQv6Z+oR
	kcSQ4SKXK3/IN5xEXNAAMSvd5/AnZBLGdFzapZrQbJ5w27pqeVC6Z0pvu+uK38cRlU7J2PMZRWnZg
	tPgJRYsUgSLouXNuaVHLAGusP3UHH4PW/K03EgWPJfv/FpwliH6r01TJwr1eFQ4Qv0wgiRI+UWykh
	g3/9Pg1VxziUzBDVjglw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rp8Ml-000000053s7-1NRw;
	Tue, 26 Mar 2024 15:05:31 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rp8Mh-000000053qW-3XNG
	for linux-riscv@lists.infradead.org;
	Tue, 26 Mar 2024 15:05:29 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 2A8BC61259;
	Tue, 26 Mar 2024 15:05:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F0E1CC433F1;
	Tue, 26 Mar 2024 15:05:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1711465525;
	bh=/qmndJDlWupnnpJi65R442kaOqvhHDX628LndcyMGs8=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=c9yMVpI+L1invWuAwwgd4+iMcVeBkKccwiZLj5q45v6lHB4Yo+LFvKNJfp6wGJqGS
	 T5NU0KIKcXNJTidqaVE1V4KsGz+s8Vk9t4M5UPrDzgFqe2DHM1I2MyiTV4ZTcV4jQ1
	 qwh8O/bchWcGVDQgex+cdEi25PRJ9YqfgTNoA1EXYqVcilAUKBYxsEmpO2qll0uLhs
	 au9zOblYVYw0CZAPdfj7/5hR6WyRKTdvUYZgsTWgCQRDTzNt9BeNb6W3tRbiJ8G17M
	 MaEfUW86u/t1oTYAva+0z3ktZeVheXh5CO68B+Z5/KHwFyH9L1YSB8mrhLMNaE7zl2
	 UPm9/VvaazOtA==
Date: Wed, 27 Mar 2024 00:05:20 +0900
From: Masami Hiramatsu (Google) <mhiramat@kernel.org>
To: "Jarkko Sakkinen" <jarkko@kernel.org>
Cc: <linux-riscv@lists.infradead.org>, "Paul Walmsley"
 <paul.walmsley@sifive.com>, "Palmer Dabbelt" <palmer@dabbelt.com>,
 "Albert Ou" <aou@eecs.berkeley.edu>, <linux-kernel@vger.kernel.org>,
 "Luis Chamberlain" <mcgrof@kernel.org>, <linux-modules@vger.kernel.org>,
 "Naveen N . Rao" <naveen.n.rao@linux.ibm.com>, "Anil S Keshavamurthy"
 <anil.s.keshavamurthy@intel.com>, "David S . Miller" <davem@davemloft.net>
Subject: Re: [PATCH v5 1/2] kprobes: textmem API
Message-Id: <20240327000520.ec13b2646ed1cd621e5b1d9d@kernel.org>
In-Reply-To: <D03PM9A6IS79.3D6BW7KBLH9C3@kernel.org>
References: <20240325215502.660-1-jarkko@kernel.org>
	<20240326095836.f43d259b7747269a7c0b9d23@kernel.org>
	<D03AL7A5G3M2.3UK4ASWILGBJS@kernel.org>
	<D03B7XJYRFC1.2L3I2TO5HNQD3@kernel.org>
	<D03PM9A6IS79.3D6BW7KBLH9C3@kernel.org>
X-Mailer: Sylpheed 3.7.0 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Mime-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240326_080528_434585_308581F9 
X-CRM114-Status: GOOD (  27.26  )
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

On Tue, 26 Mar 2024 15:18:21 +0200
"Jarkko Sakkinen" <jarkko@kernel.org> wrote:

> On Tue Mar 26, 2024 at 4:01 AM EET, Jarkko Sakkinen wrote:
> > On Tue Mar 26, 2024 at 3:31 AM EET, Jarkko Sakkinen wrote:
> > > > > +#endif /* _LINUX_EXECMEM_H */
> > > > > diff --git a/kernel/kprobes.c b/kernel/kprobes.c
> > > > > index 9d9095e81792..87fd8c14a938 100644
> > > > > --- a/kernel/kprobes.c
> > > > > +++ b/kernel/kprobes.c
> > > > > @@ -44,6 +44,7 @@
> > > > >  #include <asm/cacheflush.h>
> > > > >  #include <asm/errno.h>
> > > > >  #include <linux/uaccess.h>
> > > > > +#include <linux/execmem.h>
> > > > >  
> > > > >  #define KPROBE_HASH_BITS 6
> > > > >  #define KPROBE_TABLE_SIZE (1 << KPROBE_HASH_BITS)
> > > > > @@ -113,17 +114,17 @@ enum kprobe_slot_state {
> > > > >  void __weak *alloc_insn_page(void)
> > > > >  {
> > > > >  	/*
> > > > > -	 * Use module_alloc() so this page is within +/- 2GB of where the
> > > > > +	 * Use alloc_execmem() so this page is within +/- 2GB of where the
> > > > >  	 * kernel image and loaded module images reside. This is required
> > > > >  	 * for most of the architectures.
> > > > >  	 * (e.g. x86-64 needs this to handle the %rip-relative fixups.)
> > > > >  	 */
> > > > > -	return module_alloc(PAGE_SIZE);
> > > > > +	return alloc_execmem(PAGE_SIZE, GFP_KERNEL);
> > > > >  }
> > > > >  
> > > > >  static void free_insn_page(void *page)
> > > > >  {
> > > > > -	module_memfree(page);
> > > > > +	free_execmem(page);
> > > > >  }
> > > > >  
> > > > >  struct kprobe_insn_cache kprobe_insn_slots = {
> > > > > @@ -1580,6 +1581,7 @@ static int check_kprobe_address_safe(struct kprobe *p,
> > > > >  		goto out;
> > > > >  	}
> > > > >  
> > > > > +#ifdef CONFIG_MODULES
> > > >
> > > > You don't need this block, because these APIs have dummy functions.
> > >
> > > Hmm... I'll verify this tomorrow.
> >
> > It depends on having struct module available given "(*probed_mod)->state".

Ah, indeed. We need module_state() function to avoid it.

> >
> > It is non-existent unless CONFIG_MODULES is set given how things are
> > flagged in include/linux/module.h.
> 
> Hey, noticed kconfig issue.
> 
> According to kconfig-language.txt:
> 
> "select should be used with care. select will force a symbol to a value
> without visiting the dependencies."
> 
> So the problem here lies in KPROBES config entry using select statement
> to pick ALLOC_EXECMEM. It will not take the depends on statement into
> account and thus will allow to select kprobes without any allocator in
> place.

OK, in that case "depend on" is good.

> 
> So to address this I'd suggest to use depends on statement also for
> describing relation between KPROBES and ALLOC_EXECMEM. It does not make
> life worse than before for anyone because even with the current kernel
> you have to select MODULES before you can move forward with kprobes.

Yeah, since ALLOC_EXECMEM is enabled by default.

Thank you!

> 
> BR, Jarkko


-- 
Masami Hiramatsu (Google) <mhiramat@kernel.org>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
