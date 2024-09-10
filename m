Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FB08ECE564
	for <linux-riscv@archiver.kernel.org>; Tue, 10 Sep 2024 11:58:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0THqPa3kgOaunTwsMzkcAesIPBMsKJ0zk7gT/RHHmY4=; b=f0n+1JFwwhl5eA
	ijuUzN4F9M9qBXUS0GfetHACajiwGWXSffnTIy+b2rXC7H4DJb3cAD4/KZMoDZ+EzHNunBsAKNG56
	7XtOEpArZREWoJ70q0VEfdIJoG6n5HzraGslclnZeqhedZlz9z75mdKm2zzlf3Kpz4I6mzsFpe4/E
	SZAlgL0geCYWN3e56U5LRDbsYb09eoLB5mcFB96zndgjtxovjYrkXrhftLxpaicSYaIjEBKyKFLR5
	DKw+c+6BFFSQfHu1u4oycIMOydapDbsLBC9+by2vzjGSBHb5M/Hry3H+0Y7+n1Z1vPiR2EawJkILU
	+Yv54jUrxsNSEWI+t2rw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1snzVa-00000005SSj-1qnS;
	Tue, 10 Sep 2024 11:58:10 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1snzVX-00000005SRO-2Kgi
	for linux-riscv@lists.infradead.org;
	Tue, 10 Sep 2024 11:58:09 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id D4377A446D3;
	Tue, 10 Sep 2024 11:57:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5333EC4CEC3;
	Tue, 10 Sep 2024 11:58:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1725969486;
	bh=nxm8JGXvA/juyus1Lqfvbv0TjjsNRb50mc0VwIYbggw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Mu2OqBieA010YaJZ9trrWESWcM/unoYGySmVYRZRA7J39DWUTONOtc9N39UmXL0yB
	 vCAY7mKuYmRZjgvwXYk2LEt3H/ksZbWWk4bCXHM2ugkZyQGEnrfm74j17OO3ykiB2b
	 Bsn2siY0eFKHQGUu7VqqaaOXq1idIhXoL64/GUZg=
Date: Tue, 10 Sep 2024 13:58:02 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Alexandre Ghiti <alex@ghiti.fr>
Cc: WangYuli <wangyuli@uniontech.com>, stable@vger.kernel.org,
	sashal@kernel.org, parri.andrea@gmail.com,
	mathieu.desnoyers@efficios.com, palmer@rivosinc.com,
	linux-kernel@vger.kernel.org, paul.walmsley@sifive.com,
	palmer@dabbelt.com, aou@eecs.berkeley.edu, nathan@kernel.org,
	ndesaulniers@google.com, trix@redhat.com,
	linux-riscv@lists.infradead.org, llvm@lists.linux.dev,
	paulmck@kernel.org, mingo@redhat.com, peterz@infradead.org,
	juri.lelli@redhat.com, vincent.guittot@linaro.org,
	dietmar.eggemann@arm.com, rostedt@goodmis.org, bsegall@google.com,
	mgorman@suse.de, bristot@redhat.com, vschneid@redhat.com,
	brauner@kernel.org, arnd@arndb.de
Subject: Re: [PATCH 6.6] membarrier: riscv: Add full memory barrier in
 switch_mm()
Message-ID: <2024091037-errant-countdown-4928@gregkh>
References: <10F34E3A3BFBC534+20240909025701.1101397-1-wangyuli@uniontech.com>
 <2024091002-caution-tinderbox-a847@gregkh>
 <364e0e33-68ad-4f0c-86f1-f6a95def9a30@ghiti.fr>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <364e0e33-68ad-4f0c-86f1-f6a95def9a30@ghiti.fr>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240910_045807_753502_180806C4 
X-CRM114-Status: GOOD (  21.93  )
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

On Tue, Sep 10, 2024 at 01:31:04PM +0200, Alexandre Ghiti wrote:
> Hi Greg,
> 
> On 10/09/2024 09:32, Greg KH wrote:
> > On Mon, Sep 09, 2024 at 10:57:01AM +0800, WangYuli wrote:
> > > From: Andrea Parri <parri.andrea@gmail.com>
> > > 
> > > [ Upstream commit d6cfd1770f20392d7009ae1fdb04733794514fa9 ]
> > > 
> > > The membarrier system call requires a full memory barrier after storing
> > > to rq->curr, before going back to user-space.  The barrier is only
> > > needed when switching between processes: the barrier is implied by
> > > mmdrop() when switching from kernel to userspace, and it's not needed
> > > when switching from userspace to kernel.
> > > 
> > > Rely on the feature/mechanism ARCH_HAS_MEMBARRIER_CALLBACKS and on the
> > > primitive membarrier_arch_switch_mm(), already adopted by the PowerPC
> > > architecture, to insert the required barrier.
> > > 
> > > Fixes: fab957c11efe2f ("RISC-V: Atomic and Locking Code")
> > > Signed-off-by: Andrea Parri <parri.andrea@gmail.com>
> > > Reviewed-by: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
> > > Link: https://lore.kernel.org/r/20240131144936.29190-2-parri.andrea@gmail.com
> > > Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>
> > > Signed-off-by: WangYuli <wangyuli@uniontech.com>
> > > ---
> > >   MAINTAINERS                         |  2 +-
> > >   arch/riscv/Kconfig                  |  1 +
> > >   arch/riscv/include/asm/membarrier.h | 31 +++++++++++++++++++++++++++++
> > >   arch/riscv/mm/context.c             |  2 ++
> > >   kernel/sched/core.c                 |  5 +++--
> > >   5 files changed, 38 insertions(+), 3 deletions(-)
> > >   create mode 100644 arch/riscv/include/asm/membarrier.h
> > Now queued up, thanks.
> 
> 
> The original patch was merged in 6.9 and the Fixes tag points to a commit
> introduced in v4.15. So IIUC, this patch should have been backported
> "automatically" to the releases < 6.9 right? As stated in the documentation
> (process/stable-kernel-rules.html):
> 
> "Note, such tagging is unnecessary if the stable team can derive the
> appropriate versions from Fixes: tags."
> 
> Or did we miss something?

Yes, you didn't tag cc: stable at all in this commit, which is why we
did not see it.  The documentation says that :)

thanks,

greg k-h

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
