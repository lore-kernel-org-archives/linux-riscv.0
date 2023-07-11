Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A41C3EB64DD
	for <linux-riscv@archiver.kernel.org>; Tue, 11 Jul 2023 06:50:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZHVzNjVjVfJIEaEE36bogRzDiNTgfKAjJ3kzlUMoZbo=; b=dy41MhP/WINfLJ
	2dLqY6opqoLlMjN0mG3obDqWaXevhXuc77lwGxn7wNHfkmbS1ajYB2Voo+upSnZLO4ITmt3LJHn+w
	UXVdlbSvTLcFCKw08DshJRg0pegyQMQrjcejBung1fJd0BXga6QTolQhCo92of+CNjDO3ayxXwd9E
	yhhOBxorQVhQuBHyT9VPuZDae3reBzIhMYd/QiQ1pi52nCl5bycWLvHqE6xClc828+eLTuDaPeI0O
	yQvRBoxMGAONT1p/D+d2k4DehJp8y2aqMHpvLC9MAeoEs8Q8k+NwIei3YxoHLOMPH3GzUP52Nckoy
	vv9ZJU0hXpOMWFW9mKaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qJ7Cy-00DurU-0f;
	Tue, 11 Jul 2023 06:50:48 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qJ7Cx-00Dur1-0p
	for linux-riscv@bombadil.infradead.org;
	Tue, 11 Jul 2023 06:50:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=HXeqbEbVOU7Bdon0QjJdiA0tnB8X8pJSagSOGu9o28w=; b=B70phc5ZVMlwsDStkeOWpUYO2Y
	lJTrEHwvs9Ss06ItND/O8D9CBQjRYBhxZQN6TGhKd+lhd5IrXFWICxljnZA5S5b3klB+zrpEkKQYr
	I2JoWyT3sr7sZxD2oCloM2Q72pLqSGQM04e6agjUTHHeXOO2RiYdy2QvTnPpb4e7NoadIxQS8/Qz+
	heK9V2DVcsz6XI6UYho4wKUINy6msN6GvUM+GcNgcaPbRJvuPBcTL8bDL8jmtbJ5EqBlSX8odBehC
	qNrrnDWuvHsVlsDaZ0M53AJIsKdqn3YYxWYrXi0v9oB3wD7OOdvpHeJ55hglcornDOYHNJZBKtVuN
	q8mDVqsw==;
Received: from j130084.upc-j.chello.nl ([24.132.130.84] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
	id 1qJ7Cs-00FTrr-Lu; Tue, 11 Jul 2023 06:50:44 +0000
Received: from hirez.programming.kicks-ass.net (hirez.programming.kicks-ass.net [192.168.1.225])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id DCA1B3002B1;
	Tue, 11 Jul 2023 08:50:40 +0200 (CEST)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
	id 90AF9240EBDA8; Tue, 11 Jul 2023 08:50:40 +0200 (CEST)
Date: Tue, 11 Jul 2023 08:50:40 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Nathan Chancellor <nathan@kernel.org>
Cc: kernel test robot <lkp@intel.com>,
	Wander Lairson Costa <wander@redhat.com>, llvm@lists.linux.dev,
	oe-kbuild-all@lists.linux.dev, linux-riscv@lists.infradead.org
Subject: Re: [peterz-queue:sched/maybe 1/14] ERROR: modpost: vmlinux: local
 symbol '__put_task_struct_rcu_cb' was exported
Message-ID: <20230711065040.GA3062772@hirez.programming.kicks-ass.net>
References: <202307110147.tDoRemZ7-lkp@intel.com>
 <20230710182605.GA3044890@hirez.programming.kicks-ass.net>
 <20230710185657.GA1505918@dev-arch.thelio-3990X>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230710185657.GA1505918@dev-arch.thelio-3990X>
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

On Mon, Jul 10, 2023 at 11:56:57AM -0700, Nathan Chancellor wrote:
> On Mon, Jul 10, 2023 at 08:26:05PM +0200, Peter Zijlstra wrote:
> > On Tue, Jul 11, 2023 at 01:48:23AM +0800, kernel test robot wrote:
> > > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git sched/maybe
> > > head:   69ff1e365682e2d516364c010b51f8a95140cd94
> > > commit: eb15cb094ddb0227c9dfe5eb836d1a4357f070fd [1/14] kernel/fork: beware of __put_task_struct calling context
> > > config: riscv-randconfig-r042-20230710 (https://download.01.org/0day-ci/archive/20230711/202307110147.tDoRemZ7-lkp@intel.com/config)
> > > compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
> > > reproduce: (https://download.01.org/0day-ci/archive/20230711/202307110147.tDoRemZ7-lkp@intel.com/reproduce)
> > > 
> > 
> > > >> ERROR: modpost: vmlinux: local symbol '__put_task_struct_rcu_cb' was exported
> > 
> > The commit above introduces this function:
> > 
> > +void __put_task_struct_rcu_cb(struct rcu_head *rhp)
> > +{
> > +       struct task_struct *task = container_of(rhp, struct task_struct, rcu);
> > +
> > +       __put_task_struct(task);
> > +}
> > +EXPORT_SYMBOL_GPL(__put_task_struct_rcu_cb);
> > 
> > How the heck does that become a local symbol?
> > 
> 
> Looking at the configuration:
> 
> CONFIG_32BIT=y
> CONFIG_ARCH_RV32I=y
> 
> It is highly likely that something is broken with 32-bit RISC-V and
> clang, as that is not something we have ever tested. I don't even think
> 32-bit RISC-V is tested that much even with GCC, so I'm not sure if this
> is even worth looking into.

Fair enough; I'll put it on the ignore list. Thanks!

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
