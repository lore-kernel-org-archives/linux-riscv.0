Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A9E6C369A1
	for <linux-riscv@archiver.kernel.org>; Wed,  9 Apr 2025 15:53:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=crxmD7wCH1OVx0QxqUPBGDgDnSQcYd+tftlTW4rzDi4=; b=uyVG0OnKCoVlqO
	/AOCuLXfWHNN16nbyiT2nvsWICJrshe7gxEJqMV2vKWHIBPjznAwEySOr9V0pfOCs5eJ/KP8nsJMS
	wmwboUfRnS2N0f+ldMe6ZaJu7UKVvBKIjpxHB/LnqxpzkVQtWUDjAOaiYG8J9pWI4jZwefMDZ4Whw
	m5ZbSGjLHafLhiKigkoSlnRClXOLHYIgnwDeWo9xRqV8+J4F3KoxUhBzm4WNKauCh+sjXyljNfpBh
	e0JD1Bfu/pPlURcGsQDRptPcDR8MemgMIygvd1qECWKAMppc9oPDONle6VMTDgUg6F8sblsqTgcQj
	RNK7t1TCg9ZfvpHF9YHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2Xk9-00000007mmI-3l1a;
	Wed, 09 Apr 2025 15:53:37 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2Xin-00000007mVJ-0tZL
	for linux-riscv@lists.infradead.org;
	Wed, 09 Apr 2025 15:52:14 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 6D09CA49A85;
	Wed,  9 Apr 2025 15:46:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1A5F5C4CEE3;
	Wed,  9 Apr 2025 15:52:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744213931;
	bh=tLLTz7hDmIxg2zVDjOhyRH3s2MEVGMXH2ddl1AzN+kQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MOB2u/GB6ZTUPw14DQTZvNNvnZCV2wUCLXhKOw/eqp9SPQ3/zjnOu3yzpCpWQXXX0
	 LPyYLK1jLOFWDQsCqVKnaBSSTG3tRxPhhJXXiScyDpCD033uf6yoxSJu3FVs2mOIhN
	 iaZ5L5iKVZy5qJM9ptspfK0UBTEXSWZAm6jLYnlo8Y7XO1SkuGI7kWk0jtMfXusK3g
	 0I6ED+RMH29uPJTVl1qo8ftxRk3Z5eoa+OdDp9TreDTwAdZQrx8hHHMWu2zDTwuvDJ
	 /hP8cx6teMmidGpe8eQexzy5LsY56+JagzN6Cwi9rip3f7fvYILsgGcWgHZffb993F
	 6aSPAKz5+d/3A==
Date: Wed, 9 Apr 2025 08:52:07 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: "Dmitry V. Levin" <ldv@strace.io>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Oleg Nesterov <oleg@redhat.com>,
	Charlie Jenkins <charlie@rivosinc.com>,
	Arnd Bergmann <arnd@arndb.de>, strace-devel@lists.strace.io,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: Re: [PATCH v7 2/6] syscall.h: add syscall_set_arguments()
Message-ID: <20250409155207.GA1506425@ax162>
References: <20250303111910.GA24170@strace.io>
 <20250303112009.GC24170@strace.io>
 <20250408213131.GA2872426@ax162>
 <20250408223611.GA26876@strace.io>
 <20250409003803.GA2876360@ax162>
 <20250409064017.GA30836@strace.io>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250409064017.GA30836@strace.io>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250409_085213_314104_A846F368 
X-CRM114-Status: GOOD (  11.94  )
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

On Wed, Apr 09, 2025 at 09:40:18AM +0300, Dmitry V. Levin wrote:
> On Tue, Apr 08, 2025 at 05:38:03PM -0700, Nathan Chancellor wrote:
> > diff --git a/arch/riscv/include/asm/syscall.h b/arch/riscv/include/asm/syscall.h
> > index a5281cdf2b10..34313387f977 100644
> > --- a/arch/riscv/include/asm/syscall.h
> > +++ b/arch/riscv/include/asm/syscall.h
> > @@ -69,8 +69,11 @@ static inline void syscall_get_arguments(struct task_struct *task,
> >  					 unsigned long *args)
> >  {
> >  	args[0] = regs->orig_a0;
> > -	args++;
> > -	memcpy(args, &regs->a1, 5 * sizeof(args[0]));
> > +	args[1] = regs->a1;
> > +	args[2] = regs->a2;
> > +	args[3] = regs->a3;
> > +	args[4] = regs->a4;
> > +	args[5] = regs->a5;
> >  }
> >  
> >  static inline void syscall_set_arguments(struct task_struct *task,
> > @@ -78,8 +81,11 @@ static inline void syscall_set_arguments(struct task_struct *task,
> >  					 const unsigned long *args)
> >  {
> >  	regs->orig_a0 = args[0];
> > -	args++;
> > -	memcpy(&regs->a1, args, 5 * sizeof(regs->a1));
> > +	regs->a1 = args[1];
> > +	regs->a2 = args[2];
> > +	regs->a3 = args[3];
> > +	regs->a4 = args[4];
> > +	regs->a5 = args[5];
> >  }
> >  
> >  static inline int syscall_get_arch(struct task_struct *task)
> 
> Looks good, thanks.  How do we proceed from this point?

I can send a standalone patch for syscall_get_arguments() since that is
an issue present before your series then Andrew could fold in the same
change for syscall_set_arguments() into your change that introduces it
so there is no bisect problem?

Cheers,
Nathan

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
