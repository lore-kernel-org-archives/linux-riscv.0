Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D73AC54E64
	for <linux-riscv@archiver.kernel.org>; Tue, 26 Mar 2024 02:01:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:From:Subject:
	Cc:Message-Id:Date:Mime-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PKwbtbAbsyX68gPCbpvjQr1tKA7zYP8r6HooOI2KuzQ=; b=V1w839aI+wV7FO
	GAnYCaSX2z0LDn3uEqxcVnNOMszBduGsAr6XspYCsyu+nKKuGC3AY7Mqwd6PFgI6qJALN2+8mAYEL
	+OsF+NYFfmjyTa57Uu03NPOQbRzDyMqAyHmnOzjxtLqzchT/0VRxpP6V5kBtL0IkuweWldizjQmkP
	Si6TB8VitZuoFtPiWF2PqqKcm+CXnlDjJV9VeUNmBePiLoSgwBf1RgzH8Ympzc5og2GO1FVy5a0/8
	D90bGdSTigvf6jV7IcbVX8kuJFYHfe7RM2KTz0X83uVU5LLff+y79Rp9rYny2FgSQH8PSN27a7B0Z
	2YEru7J+ltYSDA8Rj9bQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1row84-00000002if3-2PDS;
	Tue, 26 Mar 2024 02:01:32 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1row81-00000002icq-1TIu
	for linux-riscv@lists.infradead.org;
	Tue, 26 Mar 2024 02:01:30 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 2DC326115B;
	Tue, 26 Mar 2024 02:01:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 78E47C433C7;
	Tue, 26 Mar 2024 02:01:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1711418487;
	bh=MF9ovmrIg6e8IQIMkwaYLFqAcxexDC3fSt0fm0vWIc4=;
	h=Date:Cc:Subject:From:To:References:In-Reply-To:From;
	b=Lhw57AEBPxbjD9GL0sYfWTtjr9JPLANVwg5Yz1VhBT/S50e2etFPWxhogAEkIOW7w
	 c4trvVg5EzC3Xng1V19j2Dm9Yvs33knBUrCaRLqlKh5lpCKfiSULRnnfK970su7Qqa
	 W/VlNom4Hf+B+NR3A8gZ5pDfJuvrir5CEOuQVEhvMxh/DHply97ElQUI2qaCFvjXxH
	 v69BQSz8BF6/g/XGpOUqx7Wlwxz2dSU8gNRRBmcYWDH0/acsGQLVPhwpDs0EIXacI+
	 n1PHMW9iMhAtQfL24uHs7U5cspXL0IC8tZrffj/YxQzXR8I/J0VlMxyYuEnr5XaqI4
	 tqMgvIYyYUWiQ==
Mime-Version: 1.0
Date: Tue, 26 Mar 2024 04:01:23 +0200
Message-Id: <D03B7XJYRFC1.2L3I2TO5HNQD3@kernel.org>
Cc: <linux-riscv@lists.infradead.org>, "Paul Walmsley"
 <paul.walmsley@sifive.com>, "Palmer Dabbelt" <palmer@dabbelt.com>, "Albert
 Ou" <aou@eecs.berkeley.edu>, <linux-kernel@vger.kernel.org>, "Luis
 Chamberlain" <mcgrof@kernel.org>, <linux-modules@vger.kernel.org>, "Naveen
 N . Rao" <naveen.n.rao@linux.ibm.com>, "Anil S Keshavamurthy"
 <anil.s.keshavamurthy@intel.com>, "David S . Miller" <davem@davemloft.net>
Subject: Re: [PATCH v5 1/2] kprobes: textmem API
From: "Jarkko Sakkinen" <jarkko@kernel.org>
To: "Jarkko Sakkinen" <jarkko@kernel.org>, "Masami Hiramatsu"
 <mhiramat@kernel.org>
X-Mailer: aerc 0.17.0
References: <20240325215502.660-1-jarkko@kernel.org>
 <20240326095836.f43d259b7747269a7c0b9d23@kernel.org>
 <D03AL7A5G3M2.3UK4ASWILGBJS@kernel.org>
In-Reply-To: <D03AL7A5G3M2.3UK4ASWILGBJS@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240325_190129_476375_533AB9B5 
X-CRM114-Status: GOOD (  14.92  )
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

On Tue Mar 26, 2024 at 3:31 AM EET, Jarkko Sakkinen wrote:
> > > +#endif /* _LINUX_EXECMEM_H */
> > > diff --git a/kernel/kprobes.c b/kernel/kprobes.c
> > > index 9d9095e81792..87fd8c14a938 100644
> > > --- a/kernel/kprobes.c
> > > +++ b/kernel/kprobes.c
> > > @@ -44,6 +44,7 @@
> > >  #include <asm/cacheflush.h>
> > >  #include <asm/errno.h>
> > >  #include <linux/uaccess.h>
> > > +#include <linux/execmem.h>
> > >  
> > >  #define KPROBE_HASH_BITS 6
> > >  #define KPROBE_TABLE_SIZE (1 << KPROBE_HASH_BITS)
> > > @@ -113,17 +114,17 @@ enum kprobe_slot_state {
> > >  void __weak *alloc_insn_page(void)
> > >  {
> > >  	/*
> > > -	 * Use module_alloc() so this page is within +/- 2GB of where the
> > > +	 * Use alloc_execmem() so this page is within +/- 2GB of where the
> > >  	 * kernel image and loaded module images reside. This is required
> > >  	 * for most of the architectures.
> > >  	 * (e.g. x86-64 needs this to handle the %rip-relative fixups.)
> > >  	 */
> > > -	return module_alloc(PAGE_SIZE);
> > > +	return alloc_execmem(PAGE_SIZE, GFP_KERNEL);
> > >  }
> > >  
> > >  static void free_insn_page(void *page)
> > >  {
> > > -	module_memfree(page);
> > > +	free_execmem(page);
> > >  }
> > >  
> > >  struct kprobe_insn_cache kprobe_insn_slots = {
> > > @@ -1580,6 +1581,7 @@ static int check_kprobe_address_safe(struct kprobe *p,
> > >  		goto out;
> > >  	}
> > >  
> > > +#ifdef CONFIG_MODULES
> >
> > You don't need this block, because these APIs have dummy functions.
>
> Hmm... I'll verify this tomorrow.

It depends on having struct module available given "(*probed_mod)->state".

It is non-existent unless CONFIG_MODULES is set given how things are
flagged in include/linux/module.h.

BR, Jarkko

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
