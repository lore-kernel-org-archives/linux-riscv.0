Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E8B8CA1013
	for <linux-riscv@archiver.kernel.org>; Thu, 18 Sep 2025 16:48:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=C1cQ3U47//yiHfKSjrj/M8x0LSPcXvXrZyHOm+HPsXk=; b=GHRj7Kvh9FZo/g
	8PkoZe6aj+jnGiqRc6aP+notlr/3AdZI3iCuCuy6n0TnubFfqMWov5lku1wptCFDPCkq/WV02MnSJ
	dVdg6w18CVsgKGttz6Bn656pWaBNs/4F15lUIgXEb1KuM0660SgXxQpnXjxci09b2I5mNsHGerDNr
	rbBzJNW587Q+TRSLSJsMPbMiKoTV+eVyNMKJWQg/2onbNEbDi0gEtO1VhXMHtIVgQoRhg+7gM+N/O
	Hxq5J3eInMXLB36bn209bRap5i1Dttsj86OrKD6sOIidpefQPiEe5vCQsRkKu4eiBFPSX5SvEUsyB
	dhjzAEJKB59gICDgBeaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzHoP-00000000gB5-28WP;
	Thu, 18 Sep 2025 16:48:49 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzHoO-00000000gAp-3lML
	for linux-riscv@lists.infradead.org;
	Thu, 18 Sep 2025 16:48:49 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id D0C99601D5;
	Thu, 18 Sep 2025 16:48:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CDCD4C4CEF1;
	Thu, 18 Sep 2025 16:48:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758214127;
	bh=lcnXAdz6eIiS2i4gNCDuvBwy6QESdH9dXmWvZ7PR3PY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=vJbjFpDbUGXmzxI/0WVwntr23iz5TXsd0ZLzSTe8ZzeO2OXU+LJT/eDbko3nnKBIn
	 4JxfRG1JYEaMBlOo/N7kfP8S2J4W1hK3JRgIBaE/xSARC+DIGIrrziu07F5IO0uKuI
	 rFeK8ELZSO7ukd1mALvEPQjzVQO2fyL1B+qilvsHwz65cPf2+I/He3fFG+iJhg+Cxu
	 Kgq2i2J20NbZ/rjmQDn1O1w6vvdLcGEyzJxkOmLITqqmPUprA20lRSUzCht9MRPu9m
	 qgmYUjS166LupcRcdeN1thxaY4T4pHcHyNWYV1GHbfMwk6qQq20S+UqAIOL35iKRTo
	 2XIWrBRslE7WA==
Date: Thu, 18 Sep 2025 12:48:39 -0400
From: Guo Ren <guoren@kernel.org>
To: Andrea Parri <parri.andrea@gmail.com>
Cc: Xu Lu <luxu.kernel@bytedance.com>, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, paul.walmsley@sifive.com, palmer@dabbelt.com,
	aou@eecs.berkeley.edu, alex@ghiti.fr, ajones@ventanamicro.com,
	brs@rivosinc.com, devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	apw@canonical.com, joe@perches.com
Subject: Re: [PATCH v2 0/4] riscv: Add Zalasr ISA extension support
Message-ID: <aMw3504EwlnDOJI0@gmail.com>
References: <20250902042432.78960-1-luxu.kernel@bytedance.com>
 <aLciY2putG8g2P9F@andrea>
 <aMoyntAydNMtcl+3@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <aMoyntAydNMtcl+3@gmail.com>
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

On Wed, Sep 17, 2025 at 12:01:34AM -0400, Guo Ren wrote:
> On Tue, Sep 02, 2025 at 06:59:15PM +0200, Andrea Parri wrote:
> > > Xu Lu (4):
> > >   riscv: add ISA extension parsing for Zalasr
> > >   dt-bindings: riscv: Add Zalasr ISA extension description
> > >   riscv: Instroduce Zalasr instructions
> > >   riscv: Use Zalasr for smp_load_acquire/smp_store_release
> > 
> > Informally put, our (Linux) memory consistency model specifies that any
> > sequence
> > 
> >   spin_unlock(s);
> >   spin_lock(t);
> > 
> > behaves "as it provides at least FENCE.TSO ordering between operations
> > which precede the UNLOCK+LOCK sequence and operations which follow the
> > sequence".  Unless I missing something, the patch set in question breaks
> > such ordering property (on RISC-V): for example, a "release" annotation,
> > .RL (as in spin_unlock() -> smp_store_release(), after patch #4) paired
> > with an "acquire" fence, FENCE R,RW (as could be found in spin_lock() ->
> > atomic_try_cmpxchg_acquire()) do not provide the specified property.
> > 
> > I _think some solutions to the issue above include:
> > 
> >  a) make sure an .RL annotation is always paired with an .AQ annotation
> >     and viceversa an .AQ annotation is paired with an .RL annotation
> >     (this approach matches the current arm64 approach/implementation);
> > 
> >  b) on the opposite direction, always pair FENCE R,RW (or occasionally
> >     FENCE R,R) with FENCE RW,W (this matches the current approach/the
> >     current implementation within riscv);
> > 
> >  c) mix the previous two solutions (resp., annotations and fences), but
> >     make sure to "upgrade" any releases to provide (insert) a FENCE.TSO.
> I prefer option c) at first, it has fewer modification and influence.
Another reason is that store-release-to-load-acquire would give out a
FENCE rw, rw according to RVWMO PPO 7th rule instead of FENCE.TSO, which
is stricter than the Linux requirement you've mentioned.

> 
> asm volatile(ALTERNATIVE("fence rw, w;\t\nsb %0, 0(%1)\t\n",	\
> -			  SB_RL(%0, %1) "\t\nnop\t\n",		\
> +			  SB_RL(%0, %1) "\t\n fence.tso;\t\n",	\
> 			  0, RISCV_ISA_EXT_ZALASR, 1)		\
> 			  : : "r" (v), "r" (p) : "memory");	\
> 
> I didn't object option a), and I think it could be done in the future.
> Acquire Zalasr extension step by step.
> 
> > 
> > (a) would align RISC-V and ARM64 (which is a good thing IMO), though it
> > is probably the most invasive approach among the three approaches above
> > (requiring certain changes to arch/riscv/include/asm/{cmpxchg,atomic}.h,
> > which are already relatively messy due to the various ZABHA plus ZACAS
> > switches).  Overall, I'm not too exited at the idea of reviewing any of
> > those changes, but if the community opts for it, I'll almost definitely
> > take a closer look with due calm.  ;-)
> > 
> >   Andrea
> > 
> > _______________________________________________
> > linux-riscv mailing list
> > linux-riscv@lists.infradead.org
> > http://lists.infradead.org/mailman/listinfo/linux-riscv
> > 
> 
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
