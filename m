Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BF64EB64DA
	for <linux-riscv@archiver.kernel.org>; Mon, 10 Jul 2023 18:57:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Fvyvss4UywH2XhtxRyxZtf8aoRyjUEa9DapE1Nm2Mk4=; b=bvcHNXpSu/G2pK
	zPVkdaPfzvjsKKwz70s/vZ4kctAksQDKJWGdO4qfppOd8zxjiz6XuWbeocUMreb+dN2w4ofccUvGL
	ar+TSlGbf+GIf+AmkvElDtzNu4P9ygx7IFwePhtQsVN1mT9ZC+4hxPC/JJgYDYWoFqSI/6A5rPmqQ
	AVoHXieCp8DJnQSxpZ6mdpZZr2qh247RdZ+KiWPxhWGD6+Im3XS7U77nVk3OacNwnNDcqP5BEViXw
	bvcTwi6whhsYi4eSr+ktomtbwzAouq1f9cHIpMWBNVfgvl7eqIhGGUYgWkPtDZKgnNcbhczyR11eb
	WRH+fleQcLDkAqmiAaIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qIw4F-00CVWg-2b;
	Mon, 10 Jul 2023 18:57:03 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qIw4C-00CVVt-2y
	for linux-riscv@lists.infradead.org;
	Mon, 10 Jul 2023 18:57:02 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 53F286108F;
	Mon, 10 Jul 2023 18:57:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 62763C433C7;
	Mon, 10 Jul 2023 18:56:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1689015419;
	bh=6a95MaG5wnaCRzHywoqVC7AedCbdkYsnbaua7oz0Ap4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=VV3c4q4fIQk3bJJZurOsgxU3/DA+OO/FKtsTS55crdR3aiz4w7kq002XBpQD/tsIm
	 B5Oj9ayfMXMDyC/qx1mGP6dXGjQlM3grp1pEUSxy/8RnS0+P/kwFG3o6YisGXpAtGU
	 oyk0F6d5zFcRI0sEsJ2Jk4Q7KtmKqWim9Klep9VE9TOkjgQTLJDUVrqX98MmFewXSp
	 2/6Kp8wUnTIEmGYNDRA7+i9PlpkZKNVcqYxPdoHTpFvf2u7ja/iilMCfuZ0arDhHrR
	 l7XgeBJ5DpT2Fuo1kFnY1u76n1iuEbQkXGdG5oxGBhK2YgpMSTsciD8pA7Kt4DDgHz
	 Zv/yR4CZa+o0w==
Date: Mon, 10 Jul 2023 11:56:57 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Peter Zijlstra <peterz@infradead.org>
Cc: kernel test robot <lkp@intel.com>,
	Wander Lairson Costa <wander@redhat.com>, llvm@lists.linux.dev,
	oe-kbuild-all@lists.linux.dev, linux-riscv@lists.infradead.org
Subject: Re: [peterz-queue:sched/maybe 1/14] ERROR: modpost: vmlinux: local
 symbol '__put_task_struct_rcu_cb' was exported
Message-ID: <20230710185657.GA1505918@dev-arch.thelio-3990X>
References: <202307110147.tDoRemZ7-lkp@intel.com>
 <20230710182605.GA3044890@hirez.programming.kicks-ass.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230710182605.GA3044890@hirez.programming.kicks-ass.net>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230710_115701_006114_694E7AF8 
X-CRM114-Status: GOOD (  13.71  )
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

On Mon, Jul 10, 2023 at 08:26:05PM +0200, Peter Zijlstra wrote:
> On Tue, Jul 11, 2023 at 01:48:23AM +0800, kernel test robot wrote:
> > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git sched/maybe
> > head:   69ff1e365682e2d516364c010b51f8a95140cd94
> > commit: eb15cb094ddb0227c9dfe5eb836d1a4357f070fd [1/14] kernel/fork: beware of __put_task_struct calling context
> > config: riscv-randconfig-r042-20230710 (https://download.01.org/0day-ci/archive/20230711/202307110147.tDoRemZ7-lkp@intel.com/config)
> > compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
> > reproduce: (https://download.01.org/0day-ci/archive/20230711/202307110147.tDoRemZ7-lkp@intel.com/reproduce)
> > 
> 
> > >> ERROR: modpost: vmlinux: local symbol '__put_task_struct_rcu_cb' was exported
> 
> The commit above introduces this function:
> 
> +void __put_task_struct_rcu_cb(struct rcu_head *rhp)
> +{
> +       struct task_struct *task = container_of(rhp, struct task_struct, rcu);
> +
> +       __put_task_struct(task);
> +}
> +EXPORT_SYMBOL_GPL(__put_task_struct_rcu_cb);
> 
> How the heck does that become a local symbol?
> 

Looking at the configuration:

CONFIG_32BIT=y
CONFIG_ARCH_RV32I=y

It is highly likely that something is broken with 32-bit RISC-V and
clang, as that is not something we have ever tested. I don't even think
32-bit RISC-V is tested that much even with GCC, so I'm not sure if this
is even worth looking into.

Cheers,
Nathan

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
