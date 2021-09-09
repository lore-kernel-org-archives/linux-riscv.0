Return-Path: <SRS0=EjPk=N7=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7458CC433EF
	for <linux-riscv@archiver.kernel.org>; Thu,  9 Sep 2021 23:37:40 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 220506113A
	for <linux-riscv@archiver.kernel.org>; Thu,  9 Sep 2021 23:37:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 220506113A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=goodmis.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rQ+iyHB7vw73B1XWB8WBZnquFJ4ACAMczLegc8A+oqI=; b=rKCiOzVv29FJbR
	5+1xBS5f8LrUxFNX4D7/Zlht32IJMNxcJbz0FJFmZzWkbpalHb9c0RmzCgB6FPgoXqqXrRn1g3HSR
	9SGQ6E2/RvVcrLRDrQlBWfepHNk0MHxdV8/VHTEWH4zPYIKHt5tofXilxtnLHza/pySvsUmPwdcJM
	eAsvOy6yladv0Mrpmx7p7W1lpGb9Ta4X2tawgVSo0UacxJ53nmaHQUK1So4P9l7X/QpG7Aiqa2piu
	cPnEV0366VHPF3zueJ5A4coXqUIaW+UMhrAG1/Y8DixqWUX8GNZBpGkPaCdTkyf52r95zjf9L+++G
	Svl2kK9p+GJJlDni6AVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mOTbW-00B9Op-Qp; Thu, 09 Sep 2021 23:37:14 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mOTbJ-00B9NP-JN; Thu, 09 Sep 2021 23:37:03 +0000
Received: from gandalf.local.home (cpe-66-24-58-225.stny.res.rr.com
 [66.24.58.225])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 2AF536108D;
 Thu,  9 Sep 2021 23:36:57 +0000 (UTC)
Date: Thu, 9 Sep 2021 19:36:55 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: Weizhao Ouyang <o451686892@gmail.com>
Cc: Ingo Molnar <mingo@redhat.com>, Russell King <linux@armlinux.org.uk>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Guo Ren <guoren@kernel.org>, Michal Simek <monstr@monstr.eu>, Thomas
 Bogendoerfer <tsbogend@alpha.franken.de>, Nick Hu <nickhu@andestech.com>,
 Greentime Hu <green.hu@gmail.com>, Vincent Chen <deanbo422@gmail.com>,
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>, Helge
 Deller <deller@gmx.de>, Michael Ellerman <mpe@ellerman.id.au>, Benjamin
 Herrenschmidt <benh@kernel.crashing.org>, Paul Mackerras
 <paulus@samba.org>, Paul Walmsley <paul.walmsley@sifive.com>, Palmer
 Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Heiko
 Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, Christian
 Borntraeger <borntraeger@de.ibm.com>, Yoshinori Sato
 <ysato@users.sourceforge.jp>, Rich Felker <dalias@libc.org>, "David S.
 Miller" <davem@davemloft.net>, Thomas Gleixner <tglx@linutronix.de>,
 Borislav Petkov <bp@alien8.de>, x86@kernel.org, "H. Peter Anvin"
 <hpa@zytor.com>, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-csky@vger.kernel.org,
 linux-ia64@vger.kernel.org, linux-mips@vger.kernel.org,
 linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
 linux-sh@vger.kernel.org, sparclinux@vger.kernel.org
Subject: Re: [PATCH v4] ftrace: Cleanup ftrace_dyn_arch_init()
Message-ID: <20210909193655.7bc715af@gandalf.local.home>
In-Reply-To: <20210909090216.1955240-1-o451686892@gmail.com>
References: <20210909090216.1955240-1-o451686892@gmail.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210909_163701_712514_40A1BA38 
X-CRM114-Status: GOOD (  16.16  )
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

On Thu,  9 Sep 2021 17:02:16 +0800
Weizhao Ouyang <o451686892@gmail.com> wrote:

> Most of ARCHs use empty ftrace_dyn_arch_init(), introduce a weak common
> ftrace_dyn_arch_init() to cleanup them.

FYI,

I'm not ignoring this patch. I just wont be able to look at it until the
merge window is over.

-- Steve


> 
> Signed-off-by: Weizhao Ouyang <o451686892@gmail.com>
> Acked-by: Heiko Carstens <hca@linux.ibm.com> (s390)
> Acked-by: Helge Deller <deller@gmx.de> (parisc)
> 
> ---
> Changes in v4:
> -- revert the generic declaration
> 
> Changes in v3:
> -- fix unrecognized opcode on PowerPC
> 
> Changes in v2:
> -- correct CONFIG_DYNAMIC_FTRACE on PowerPC
> -- add Acked-by tag
> 
> ---
>  arch/arm/kernel/ftrace.c        | 5 -----
>  arch/arm64/kernel/ftrace.c      | 5 -----
>  arch/csky/kernel/ftrace.c       | 5 -----
>  arch/ia64/kernel/ftrace.c       | 6 ------
>  arch/microblaze/kernel/ftrace.c | 5 -----
>  arch/nds32/kernel/ftrace.c      | 5 -----
>  arch/parisc/kernel/ftrace.c     | 5 -----
>  arch/riscv/kernel/ftrace.c      | 5 -----
>  arch/s390/kernel/ftrace.c       | 5 -----
>  arch/sh/kernel/ftrace.c         | 5 -----
>  arch/sparc/kernel/ftrace.c      | 5 -----
>  arch/x86/kernel/ftrace.c        | 5 -----
>  kernel/trace/ftrace.c           | 5 +++++
>  13 files changed, 5 insertions(+), 61 deletions(-)
> 
>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
