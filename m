Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45E8FC369A2
	for <linux-riscv@archiver.kernel.org>; Wed,  9 Apr 2025 23:18:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4b+h/IZbOx0wWKEq3SFUcQ/h6FJQZAR4ONyq41OoyPM=; b=d6F1Kn4x4xWxXc
	CD1vuue55m6znpD7E24sjdQIGkvbnbeSTvh6d+fX7lC99/TQewWYCK/+9Yw8qJ/DGewPOguZ8pvn4
	kjCTUXrZxDtjMrrW+RUxm7HoDGAfUwpkdV0rIUMb+uKFT+Nq8Zcd2bx45ophwX/b4hMWHblSSfG2B
	TfkEJV2mhXqqQJl5CvFryhIeUM9gu2nwNiyNsbgoB2r8r+8bJRJxMd9xEJMA3N/gkgZxJNBQQUEZT
	uxJcllmS+/8MB6XxZWxSHOPfaJh/81Fzor2VXygyxE6DAxXloSxhnJhSiGgG86NjdK/LdtR6ESxHK
	2axp6K1M1M0nwm+1LC+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2egN-00000008kUX-2Z2p;
	Wed, 09 Apr 2025 23:18:11 +0000
Received: from vmicros1.altlinux.org ([194.107.17.57])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2egK-00000008kU7-0chj
	for linux-riscv@lists.infradead.org;
	Wed, 09 Apr 2025 23:18:10 +0000
Received: from mua.local.altlinux.org (mua.local.altlinux.org [192.168.1.14])
	by vmicros1.altlinux.org (Postfix) with ESMTP id 2701772C8CC;
	Thu, 10 Apr 2025 02:18:03 +0300 (MSK)
Received: by mua.local.altlinux.org (Postfix, from userid 508)
	id 152D97CCB3A; Thu, 10 Apr 2025 02:18:02 +0300 (IDT)
Date: Thu, 10 Apr 2025 02:18:02 +0300
From: "Dmitry V. Levin" <ldv@strace.io>
To: Nathan Chancellor <nathan@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Oleg Nesterov <oleg@redhat.com>,
	Charlie Jenkins <charlie@rivosinc.com>,
	Arnd Bergmann <arnd@arndb.de>, strace-devel@lists.strace.io,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: Re: [PATCH v7 2/6] syscall.h: add syscall_set_arguments()
Message-ID: <20250409231802.GA31728@strace.io>
References: <20250303111910.GA24170@strace.io>
 <20250303112009.GC24170@strace.io>
 <20250408213131.GA2872426@ax162>
 <20250408223611.GA26876@strace.io>
 <20250409003803.GA2876360@ax162>
 <20250409064017.GA30836@strace.io>
 <20250409155207.GA1506425@ax162>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250409155207.GA1506425@ax162>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250409_161808_351233_A8D900EC 
X-CRM114-Status: GOOD (  14.46  )
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

On Wed, Apr 09, 2025 at 08:52:07AM -0700, Nathan Chancellor wrote:
> On Wed, Apr 09, 2025 at 09:40:18AM +0300, Dmitry V. Levin wrote:
> > On Tue, Apr 08, 2025 at 05:38:03PM -0700, Nathan Chancellor wrote:
> > > diff --git a/arch/riscv/include/asm/syscall.h b/arch/riscv/include/asm/syscall.h
> > > index a5281cdf2b10..34313387f977 100644
> > > --- a/arch/riscv/include/asm/syscall.h
> > > +++ b/arch/riscv/include/asm/syscall.h
> > > @@ -69,8 +69,11 @@ static inline void syscall_get_arguments(struct task_struct *task,
> > >  					 unsigned long *args)
> > >  {
> > >  	args[0] = regs->orig_a0;
> > > -	args++;
> > > -	memcpy(args, &regs->a1, 5 * sizeof(args[0]));
> > > +	args[1] = regs->a1;
> > > +	args[2] = regs->a2;
> > > +	args[3] = regs->a3;
> > > +	args[4] = regs->a4;
> > > +	args[5] = regs->a5;
> > >  }
> > >  
> > >  static inline void syscall_set_arguments(struct task_struct *task,
> > > @@ -78,8 +81,11 @@ static inline void syscall_set_arguments(struct task_struct *task,
> > >  					 const unsigned long *args)
> > >  {
> > >  	regs->orig_a0 = args[0];
> > > -	args++;
> > > -	memcpy(&regs->a1, args, 5 * sizeof(regs->a1));
> > > +	regs->a1 = args[1];
> > > +	regs->a2 = args[2];
> > > +	regs->a3 = args[3];
> > > +	regs->a4 = args[4];
> > > +	regs->a5 = args[5];
> > >  }
> > >  
> > >  static inline int syscall_get_arch(struct task_struct *task)
> > 
> > Looks good, thanks.  How do we proceed from this point?
> 
> I can send a standalone patch for syscall_get_arguments() since that is
> an issue present before your series then Andrew could fold in the same
> change for syscall_set_arguments() into your change that introduces it
> so there is no bisect problem?

Fine with me.  Thanks for taking care of this issue.


-- 
ldv

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
