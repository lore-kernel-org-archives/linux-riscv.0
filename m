Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EEFC6C87FC9
	for <linux-riscv@archiver.kernel.org>; Mon, 28 Jul 2025 12:47:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=m+eeX9NmS+ggEQBU0g6JC/c6AfkCmwvUk+T/mDG9KbI=; b=yWvY6S1b319gXT
	K2AIaETusua9hxW6CbQH7rfCUUDpUWQeNHp4Ey+NKbBhzR3MvqwscbKw5BOuB0YnASQdaGBu6F4Q4
	rKLmUhT+RIAhNJcEnc4JcXd/HZT84gJjfER034ZDeYffrFhSEeeR+qr0CCYD9u+d6wlj20zdRHMBN
	QD0QslK5pYIpmGrA4tPuyIKY1RZ26DpTi7W597I7s0ipjOWwiY39rIbI/XLrjjPnbDhPT8qpJk2KP
	4kSYMoQ3ureIMRyDRT9qacys2F7x6yQz+1FF0zT4IMNWuaQz7OsDZ8M5JtrvH0nugYmjfQlYFyKdP
	iM3Km/WGOy/y8iVIE3bQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugNGK-0000000ESOX-1oWq;
	Mon, 28 Jul 2025 12:47:28 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugNGH-0000000ESO0-37s4
	for linux-riscv@lists.infradead.org;
	Mon, 28 Jul 2025 12:47:26 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 8EFD75C414C;
	Mon, 28 Jul 2025 12:47:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D6A14C4CEE7;
	Mon, 28 Jul 2025 12:47:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753706844;
	bh=8erufKMpAOmnBQJD5AQN3zyqiuSStzu2grxssP0lTyk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fVrLDUF6ALvU1+rw08l0PQQfJJ7diMMEUvcuQzJIilzrRSpYwOlOYK2n15xwoyML4
	 D4v1V5ouoPMP5Uz79ByW5/BerCfgE3utI4NZmRpjthPrhH6zfjhuvxxdwBw/nduyx5
	 BrLlHsjfIfQLUwiEsrKJ7Z00EUM59kWy8WUBrjuxruXI8VGjRYFATJyEOBskkNPuBj
	 cOwpUVMCLcgqoD5XxSL62JtvLUxMBr1zB0b3M8fPyxY2JnP4ebqJETtie1/WquwywI
	 lFApDm1CkeeTMlruPIC1tMlq6jstGhB1R7LebnE8eV6IkSurORWhWXOaOc/cTwOFqR
	 53bl3DIV1aZJA==
Date: Mon, 28 Jul 2025 13:47:14 +0100
From: Will Deacon <will@kernel.org>
To: Sami Tolvanen <samitolvanen@google.com>
Cc: Deepak Gupta <debug@rivosinc.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nicolas.schier@linux.dev>,
	Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@redhat.com>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Vlastimil Babka <vbabka@suse.cz>, Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Monk Chiang <monk.chiang@sifive.com>,
	Kito Cheng <kito.cheng@sifive.com>,
	Justin Stitt <justinstitt@google.com>,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-kbuild@vger.kernel.org, linux-mm@kvack.org,
	llvm@lists.linux.dev, rick.p.edgecombe@intel.com,
	broonie@kernel.org, cleger@rivosinc.com, apatel@ventanamicro.com,
	ajones@ventanamicro.com, conor.dooley@microchip.com,
	charlie@rivosinc.com, samuel.holland@sifive.com, bjorn@rivosinc.com,
	fweimer@redhat.com, jeffreyalaw@gmail.com,
	heinrich.schuchardt@canonical.com, andrew@sifive.com,
	ved@rivosinc.com
Subject: Re: [PATCH 10/11] scs: generic scs code updated to leverage hw
 assisted shadow stack
Message-ID: <aIdxUpSc-Co8wLYE@willie-the-truck>
References: <20250724-riscv_kcfi-v1-0-04b8fa44c98c@rivosinc.com>
 <20250724-riscv_kcfi-v1-10-04b8fa44c98c@rivosinc.com>
 <20250725161327.GC1724026@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250725161327.GC1724026@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250728_054725_863099_937549B0 
X-CRM114-Status: GOOD (  19.13  )
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

On Fri, Jul 25, 2025 at 04:13:27PM +0000, Sami Tolvanen wrote:
> On Thu, Jul 24, 2025 at 04:37:03PM -0700, Deepak Gupta wrote:
> > diff --git a/include/linux/scs.h b/include/linux/scs.h
> > index 4ab5bdc898cf..6ceee07c2d1a 100644
> > --- a/include/linux/scs.h
> > +++ b/include/linux/scs.h
> > @@ -12,6 +12,7 @@
> >  #include <linux/poison.h>
> >  #include <linux/sched.h>
> >  #include <linux/sizes.h>
> > +#include <asm/scs.h>
> >  
> >  #ifdef CONFIG_SHADOW_CALL_STACK
> >  
> > @@ -37,22 +38,45 @@ static inline void scs_task_reset(struct task_struct *tsk)
> >  	 * Reset the shadow stack to the base address in case the task
> >  	 * is reused.
> >  	 */
> > +#ifdef CONFIG_ARCH_HAS_KERNEL_SHADOW_STACK
> > +	task_scs_sp(tsk) = task_scs(tsk) + SCS_SIZE;
> > +#else
> >  	task_scs_sp(tsk) = task_scs(tsk);
> > +#endif
> >  }
> >
> >  static inline unsigned long *__scs_magic(void *s)
> >  {
> > +#ifdef CONFIG_ARCH_HAS_KERNEL_SHADOW_STACK
> > +	return (unsigned long *)(s);
> > +#else
> >  	return (unsigned long *)(s + SCS_SIZE) - 1;
> > +#endif
> >  }
> >  
> >  static inline bool task_scs_end_corrupted(struct task_struct *tsk)
> >  {
> >  	unsigned long *magic = __scs_magic(task_scs(tsk));
> > -	unsigned long sz = task_scs_sp(tsk) - task_scs(tsk);
> > +	unsigned long sz;
> > +
> > +#ifdef CONFIG_ARCH_HAS_KERNEL_SHADOW_STACK
> > +	sz = (task_scs(tsk) + SCS_SIZE) - task_scs_sp(tsk);
> > +#else
> > +	sz = task_scs_sp(tsk) - task_scs(tsk);
> > +#endif
> >  
> >  	return sz >= SCS_SIZE - 1 || READ_ONCE_NOCHECK(*magic) != SCS_END_MAGIC;
> >  }
> >  
> > +static inline void __scs_store_magic(unsigned long *s, unsigned long magic_val)
> > +{
> > +#ifdef CONFIG_ARCH_HAS_KERNEL_SHADOW_STACK
> > +	arch_scs_store(s, magic_val);
> > +#else
> > +	*__scs_magic(s) = magic_val;
> > +#endif
> > +}
> > +
> 
> I'm not a huge fan of all the ifdefs. We could clean this up by
> allowing architectures to simply override some these functions, or at
> least use if (IS_ENABLED(CONFIG...)) instead. Will, any thoughts about
> this?

Yeah, I agree that allowing architectures to provide overrides makes
sense, however I also suspect that some of this needs to be a runtime
decision because not all CPUs will support the hardware-accelerated
feature and will presumably want to fall back on the software
implementation.

Will

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
