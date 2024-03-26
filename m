Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A95EFCD11DD
	for <linux-riscv@archiver.kernel.org>; Tue, 26 Mar 2024 13:18:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:From:Subject:Cc:
	To:Message-Id:Date:Mime-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oRUf07apFaSl/okV3QzW+Xpv9r6StXGN1lc3OysGHRo=; b=Rd5zCxbsCzxn3P
	SjOU/jpuKozjmtfdIdp8sE/KIx5o8yWvSLudkvDiHwX+oYwbGWEia+1TTni610FSuX1JX9vYg8gUd
	Ar0wgMUCeJbyV55WQk4A8UN7gexy+IrJB+AOZT1761a3teRcg4ufcpdJOR/JNM/FolTEZC/Cxqo6b
	fDq1dRjO8nhPJXMJ5RCwenkhMFAawvAH55kogYol5Ycni7dF2rPaL/PumgqMgW5H/jXLwYoj0piPd
	gWRVkV+fK2YqdnHmgY3hImH7TzJ8WWvJxjYWvjzGxLaFK8G6LK9PzuGkixRB14UsXwRbx/b53vyoF
	f/6MQ4MiqYm5+oX1PeVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rp6hN-00000004dr4-3RCd;
	Tue, 26 Mar 2024 13:18:41 +0000
Received: from desiato.infradead.org ([90.155.92.199])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rp6hM-00000004dqI-1081
	for linux-riscv@bombadil.infradead.org;
	Tue, 26 Mar 2024 13:18:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:References:From:Subject:Cc
	:To:Message-Id:Date:Content-Type:Content-Transfer-Encoding:Mime-Version:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=i2rD2cb/DHxjEvNyyKuWcSCX93I4cO9FY2bN1Ho6Q7I=; b=HTEEjUcDS2wpHqmVQuYNjGdlHs
	E7SDrxeXtCfSDpOsGYVIMywSz3aIE86t9Pl4buQjEqBMCPtEthY4cgtKrjrAzVImBVXkrsiZNP2ee
	zBzPg8FUUaVe/OSBBi8sdcaxSkErWJAgDcd1pg47YpCgYH9L4z8ohAedEo/YqSnL2Sts4gBv8fdCx
	YjEiFmHob6xutg52ojAAOiPLQ7OVpMWvir1+16lldzDgSBUtahMFWkVLIx/GdIyb3TkG9ytgopNJ/
	B5EBWTFNBm38kejaFeYvngZhhcBNEHPZKJ6rCvDQcRK8LHSrV53Jv67PTWB7kR4URaVbzQuFQhMDg
	CIP11MRg==;
Received: from dfw.source.kernel.org ([139.178.84.217])
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rp6hI-0000000HBS2-2dPv
	for linux-riscv@lists.infradead.org;
	Tue, 26 Mar 2024 13:18:38 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 86F6C60A7C;
	Tue, 26 Mar 2024 13:18:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C1E86C43390;
	Tue, 26 Mar 2024 13:18:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1711459106;
	bh=G+Hn6cNlyKUyvTsdLqpYQU3MpaSHBX/VmoCrwmgKiuA=;
	h=Date:To:Cc:Subject:From:References:In-Reply-To:From;
	b=Mnj8t6OxtLu5AG5u89v26bd8wmZLcN0UmHvjkWAbtmKZtYzeFLucbhoW0h/+cR4WH
	 Uem+3ticvY2WBlCuBTbWDPMtTqaDWzCzkJd7UwMRGPpsp5Tqr+vLCY4s3Nn5iObh/9
	 6ndmKyH5POpbP/BbyaqBqloIgAPrVvE6f13T5Z8W1iVXCh+ZHMrCyie5kOMtxgMNrM
	 lu/a3BKf0wzlsW8ZU1Z5WyZgaAy2GdqWFUET2XEk6/N2YQKIITonFFq1KwPmNgY7E2
	 TGHWE7+bkMHXID92ze6dpg2dpwb2xbLo3VyUP5jG55oSeCsByjb3u7AHXy1JnQ5FFS
	 lVxeLvshqqILQ==
Mime-Version: 1.0
Date: Tue, 26 Mar 2024 15:18:21 +0200
Message-Id: <D03PM9A6IS79.3D6BW7KBLH9C3@kernel.org>
To: "Jarkko Sakkinen" <jarkko@kernel.org>, "Masami Hiramatsu"
 <mhiramat@kernel.org>
Cc: <linux-riscv@lists.infradead.org>, "Paul Walmsley"
 <paul.walmsley@sifive.com>, "Palmer Dabbelt" <palmer@dabbelt.com>, "Albert
 Ou" <aou@eecs.berkeley.edu>, <linux-kernel@vger.kernel.org>, "Luis
 Chamberlain" <mcgrof@kernel.org>, <linux-modules@vger.kernel.org>, "Naveen
 N . Rao" <naveen.n.rao@linux.ibm.com>, "Anil S Keshavamurthy"
 <anil.s.keshavamurthy@intel.com>, "David S . Miller" <davem@davemloft.net>
Subject: Re: [PATCH v5 1/2] kprobes: textmem API
From: "Jarkko Sakkinen" <jarkko@kernel.org>
X-Mailer: aerc 0.17.0
References: <20240325215502.660-1-jarkko@kernel.org>
 <20240326095836.f43d259b7747269a7c0b9d23@kernel.org>
 <D03AL7A5G3M2.3UK4ASWILGBJS@kernel.org>
 <D03B7XJYRFC1.2L3I2TO5HNQD3@kernel.org>
In-Reply-To: <D03B7XJYRFC1.2L3I2TO5HNQD3@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240326_131837_060719_666C7CD8 
X-CRM114-Status: GOOD (  20.25  )
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

On Tue Mar 26, 2024 at 4:01 AM EET, Jarkko Sakkinen wrote:
> On Tue Mar 26, 2024 at 3:31 AM EET, Jarkko Sakkinen wrote:
> > > > +#endif /* _LINUX_EXECMEM_H */
> > > > diff --git a/kernel/kprobes.c b/kernel/kprobes.c
> > > > index 9d9095e81792..87fd8c14a938 100644
> > > > --- a/kernel/kprobes.c
> > > > +++ b/kernel/kprobes.c
> > > > @@ -44,6 +44,7 @@
> > > >  #include <asm/cacheflush.h>
> > > >  #include <asm/errno.h>
> > > >  #include <linux/uaccess.h>
> > > > +#include <linux/execmem.h>
> > > >  
> > > >  #define KPROBE_HASH_BITS 6
> > > >  #define KPROBE_TABLE_SIZE (1 << KPROBE_HASH_BITS)
> > > > @@ -113,17 +114,17 @@ enum kprobe_slot_state {
> > > >  void __weak *alloc_insn_page(void)
> > > >  {
> > > >  	/*
> > > > -	 * Use module_alloc() so this page is within +/- 2GB of where the
> > > > +	 * Use alloc_execmem() so this page is within +/- 2GB of where the
> > > >  	 * kernel image and loaded module images reside. This is required
> > > >  	 * for most of the architectures.
> > > >  	 * (e.g. x86-64 needs this to handle the %rip-relative fixups.)
> > > >  	 */
> > > > -	return module_alloc(PAGE_SIZE);
> > > > +	return alloc_execmem(PAGE_SIZE, GFP_KERNEL);
> > > >  }
> > > >  
> > > >  static void free_insn_page(void *page)
> > > >  {
> > > > -	module_memfree(page);
> > > > +	free_execmem(page);
> > > >  }
> > > >  
> > > >  struct kprobe_insn_cache kprobe_insn_slots = {
> > > > @@ -1580,6 +1581,7 @@ static int check_kprobe_address_safe(struct kprobe *p,
> > > >  		goto out;
> > > >  	}
> > > >  
> > > > +#ifdef CONFIG_MODULES
> > >
> > > You don't need this block, because these APIs have dummy functions.
> >
> > Hmm... I'll verify this tomorrow.
>
> It depends on having struct module available given "(*probed_mod)->state".
>
> It is non-existent unless CONFIG_MODULES is set given how things are
> flagged in include/linux/module.h.

Hey, noticed kconfig issue.

According to kconfig-language.txt:

"select should be used with care. select will force a symbol to a value
without visiting the dependencies."

So the problem here lies in KPROBES config entry using select statement
to pick ALLOC_EXECMEM. It will not take the depends on statement into
account and thus will allow to select kprobes without any allocator in
place.

So to address this I'd suggest to use depends on statement also for
describing relation between KPROBES and ALLOC_EXECMEM. It does not make
life worse than before for anyone because even with the current kernel
you have to select MODULES before you can move forward with kprobes.

BR, Jarkko

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
