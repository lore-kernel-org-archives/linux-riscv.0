Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF53EC7EE2E
	for <linux-riscv@archiver.kernel.org>; Sat, 25 Feb 2023 01:51:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=52rPgR6TC5svjIusp4cMhvEGPSZhDn12oAJDcG9JXBA=; b=JTYHWaRkN1FYi8
	9WBBIhb56EYNBU2meIgXhwo7hX0KLLNuyrdoWWdPGqDeMR2mk+2tHtAdTKT+4yZArmRUbO+v3HMrK
	IvjA4Mfc8kakmXmPdjlyj0V4Ll3sx6q2h0qzW9u1gWBUCwb5Ni0RZftgBfIqweUYEhAW9EUsCOo/t
	+6+ksLqt2rbvi6WkK2VEEDoWi76iS7mBVMzlpMHQ05zT3W60LQjYmrYZvmu2e70yvNTul6CIUvQQp
	wGz09o4dcs/3LRycxYKG0MS2d5klSSbguMBHUL7ZuljEnZKUdoaUwQlFvKxQXc+qf6de8ezztvECd
	ZrKhpP8Lvz92ny9ok3LA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pVji7-004ZzX-Hh; Sat, 25 Feb 2023 01:50:51 +0000
Received: from szxga08-in.huawei.com ([45.249.212.255])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pVji3-004ZyE-CL
	for linux-riscv@lists.infradead.org; Sat, 25 Feb 2023 01:50:49 +0000
Received: from kwepemi500013.china.huawei.com (unknown [172.30.72.55])
	by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4PNqQp58rVz16Nfr;
	Sat, 25 Feb 2023 09:48:02 +0800 (CST)
Received: from M910t (10.110.54.157) by kwepemi500013.china.huawei.com
 (7.221.188.120) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.17; Sat, 25 Feb
 2023 09:50:34 +0800
Date: Sat, 25 Feb 2023 09:50:14 +0800
From: Changbin Du <changbin.du@huawei.com>
To: Conor Dooley <conor.dooley@microchip.com>
CC: Changbin Du <changbin.du@huawei.com>, Conor Dooley <conor@kernel.org>,
	<palmer@dabbelt.com>, Palmer Dabbelt <palmerdabbelt@google.com>,
	<linux-riscv@lists.infradead.org>, Steven Rostedt <rostedt@goodmis.org>,
	Changbin Du <changbin.du@gmail.com>, Palmer Dabbelt <palmer@rivosinc.com>,
	Hui Wang <hw.huiwang@huawei.com>
Subject: Re: [PATCH v3] RISC-V: Don't check text_mutex during stop_machine
Message-ID: <20230225015014.2tejwipjqjnagsmb@M910t>
References: <20230215164317.727657-1-conor@kernel.org>
 <20230216113126.kio4uqovoo4p6ubm@M910t>
 <Y/iafgRdYtWCmQZ2@wendy>
 <20230224125857.dbsaj7mv2by66wm3@M910t>
 <Y/i/vkcX5AEQ6qAm@wendy>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Y/i/vkcX5AEQ6qAm@wendy>
X-Originating-IP: [10.110.54.157]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 kwepemi500013.china.huawei.com (7.221.188.120)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230224_175047_789623_63333EED 
X-CRM114-Status: GOOD (  21.23  )
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

On Fri, Feb 24, 2023 at 01:46:38PM +0000, Conor Dooley wrote:
> On Fri, Feb 24, 2023 at 08:58:57PM +0800, Changbin Du wrote:
> > On Fri, Feb 24, 2023 at 11:07:42AM +0000, Conor Dooley wrote:
> > > > > -	lockdep_assert_held(&text_mutex);
> > > > > +	if (!riscv_ftrace_in_stop_machine)
> > > > > +		lockdep_assert_held(&text_mutex);
> > > > >  
> > > > >  	if (across_pages)
> > > > >  		patch_map(addr + len, FIX_TEXT_POKE1);
> > > > This misses this function.
> > > > 
> > > > int patch_text(void *addr, u32 insn)
> > > 
> > > So, with a corresponding rename to the symbol, does the following look
> > > okay to you?
> > > 
> > > diff --git a/arch/riscv/kernel/probes/kprobes.c b/arch/riscv/kernel/probes/kprobes.c
> > > index f21592d20306..433b454e693f 100644
> > > --- a/arch/riscv/kernel/probes/kprobes.c
> > > +++ b/arch/riscv/kernel/probes/kprobes.c
> > > @@ -27,9 +27,15 @@ static void __kprobes arch_prepare_ss_slot(struct kprobe *p)
> > >  
> > >  	p->ainsn.api.restore = (unsigned long)p->addr + offset;
> > >  
> > > +	/*
> > > +	 * kprobes takes text_mutex, but patch_text() calls stop_machine and
> > > +	 * lockdep gets confused by the context in which the lock is taken.
> > > +	 */
> > > +	riscv_patch_in_stop_machine = true;
> > >  	patch_text(p->ainsn.api.insn, p->opcode);
> > >  	patch_text((void *)((unsigned long)(p->ainsn.api.insn) + offset),
> > >  		   __BUG_INSN_32);
> > > +	riscv_patch_in_stop_machine = false;
> > >  }
> > hmm, why not just put 'riscv_patch_in_stop_machine' into patch_text()? Then you
> > just need to modify that function.
> 
> Right, I intentionally didn't do that as `riscv_patch_in_stop_machine`
> skips the lockdep check, which we only want to do for codepaths we know
> the lock will be held for.
> I didn't want to put it in patch_text() so if users of patch_text() that
> do not take the lock are added, they will be caught.
> 
Understood your concern. Then how abount below instead of discrete changes?

int patch_text(void *addr, u32 insn)
 {
+       int ret;
        struct patch_insn patch = {
                .addr = addr,
                .insn = insn,
                .cpu_count = ATOMIC_INIT(0),
        };

-       return stop_machine_cpuslocked(patch_text_cb,
+       lockdep_assert_held(&text_mutex);
+       riscv_patch_in_stop_machine = true
+       ret = stop_machine_cpuslocked(patch_text_cb,
                                       &patch, cpu_online_mask);
+       riscv_patch_in_stop_machine = false;
+       return ret;
 }

> I'm probably just erring on the paranoid/conservative side of things!
-- 
Cheers,
Changbin Du

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
