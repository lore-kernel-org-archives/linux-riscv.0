Return-Path: <SRS0=VC1f=KB=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C4303C433B4
	for <linux-riscv@archiver.kernel.org>; Thu,  6 May 2021 11:46:30 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6BFF3613D6
	for <linux-riscv@archiver.kernel.org>; Thu,  6 May 2021 11:46:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6BFF3613D6
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=arm.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=v2SX0sPjgo1z414LoHtcI8fJskhrb6KI8cjzL+zPzuc=; b=RqYOXi+gxOXn+oE8n+HnAYFYp
	L9VRxpOtoLDQMa68Aq+rxCB1Cjlf05cZshxSkif7v6RzPFKxgSPMQYVUT5ee7K/Ftzb1Aqr3TtY63
	g8EfAhZykVEg9EDBARyR0gPnox0TieaQtNNJMT59Vr7i8KOGQHvEpxO7V01eva3qTsShSAZQKUg1h
	U7k3bWXdhA3zRCsK6Vl0UqzU90xuGZRJMgDUhrNFygI9M+jOIAN0rXrgjJLX6NxJpFWijZzN0G3En
	VfdB+aHvgmT7aGDV6dhFkNr7gbmaPFMm15yhB0gYR5bbEmq6ei9ZaHeKTDnkO8rV3s/7+94vM9+Kc
	RNTSLDjKw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lecSH-004AHM-NI; Thu, 06 May 2021 11:46:09 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lecSF-004AGp-5S
 for linux-riscv@desiato.infradead.org; Thu, 06 May 2021 11:46:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=Xs7+C6LvvpMJpUtyg6yQ8wUx0LkTp9jdHxKcx7zClsM=; b=3FZvn9oIKhhQ1prt1M/HO7yW87
 mOdWxwrOQ1MdT0+rz282iXn0dsJ4/oOzxeP5YJJiMcpDrheUqxx4kYcR6VmXFdLawuLOyRqnUkyOW
 HdUlVBbWkmfijyXpYKvOEvMDsQK15OQYPdZXd6/QyYIQy2YVgGqbTXa/64Uf7UtJ2MKgBh3is6qCU
 WpmfAS8Dd6YRKRSdaCL/G4asbN4IaHoFCkPVm38dAwYxEWxGIiMjg7g7k4rCzfJnPF5xnNta9HxAD
 +2DZZInArDDSJjnC2unZ/q/BFBRbf4hkwGvzHCLGqKM/ScuARc2jQ8Npzs1WGD+eWvPZlsyf5PUBL
 /ZdqkWeQ==;
Received: from foss.arm.com ([217.140.110.172])
 by bombadil.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
 id 1lecSC-005zq2-6b
 for linux-riscv@lists.infradead.org; Thu, 06 May 2021 11:46:05 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id DE987101E;
 Thu,  6 May 2021 04:45:57 -0700 (PDT)
Received: from C02TD0UTHF1T.local (unknown [10.57.31.158])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 810253F73B;
 Thu,  6 May 2021 04:45:55 -0700 (PDT)
Date: Thu, 6 May 2021 12:45:42 +0100
From: Mark Rutland <mark.rutland@arm.com>
To: Palmer Dabbelt <palmerdabbelt@google.com>
Cc: Guo Ren <guoren@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 linux-riscv <linux-riscv@lists.infradead.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-csky@vger.kernel.org, linux-arch <linux-arch@vger.kernel.org>,
 Guo Ren <guoren@linux.alibaba.com>, Peter Zijlstra <peterz@infradead.org>,
 Anup Patel <anup@brainfault.org>
Subject: Re: [PATCH v3 2/2] riscv: atomic: Using ARCH_ATOMIC in asm/atomic.h
Message-ID: <20210506114542.GA34537@C02TD0UTHF1T.local>
References: <1619009626-93453-2-git-send-email-guoren@kernel.org>
 <mhng-7181822d-02c1-4ef4-b1be-83c1034d79ba@palmerdabbelt-glaptop>
 <CAJF2gTRR2SAA_qfxyeRX5MTJDiVNa1aRDTpX7UJfxR3yjC1T9g@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAJF2gTRR2SAA_qfxyeRX5MTJDiVNa1aRDTpX7UJfxR3yjC1T9g@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210506_044604_316487_57394E2E 
X-CRM114-Status: GOOD (  25.92  )
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

On Thu, May 06, 2021 at 05:42:32PM +0800, Guo Ren wrote:
> Hi Palmer,
> 
> On Thu, May 6, 2021 at 2:03 PM Palmer Dabbelt <palmerdabbelt@google.com> wrote:
> >
> > On Wed, 21 Apr 2021 05:53:46 PDT (-0700), guoren@kernel.org wrote:
> > > From: Guo Ren <guoren@linux.alibaba.com>
> > >
> > > The linux/atomic-arch-fallback.h has been there for a while, but
> > > only x86 & arm64 support it. Let's make riscv follow the
> > > linux/arch/* development trendy and make the codes more readable
> > > and maintainable.
> > >
> > > This patch also cleanup some codes:
> > >  - Add atomic_andnot_* operation
> > >  - Using amoswap.w.rl & amoswap.w.aq instructions in xchg
> > >  - Remove cmpxchg_acquire/release unnecessary optimization
> >
> > Thanks.  I haven't gotten the time to review this properly yet, but I
> > don't really see any issues.  Regardless, it was too late for this merge
> > window anyway -- these sorts of things are a bit subtle and require a
> > proper look, right at the end of the cycle things are just a bit too
> > hectic.
> >
> > I'll take a look once things calm down a bit, there's still some fixes
> > out that I'd like to look at first.
> >
> > I'm also only getting patch 2, and your lore link points to a different
> > patch set.
> Mark Rutland is preparing a new patchset to let ARCH_ATOMIC become the
> default for all arch. I'm waiting for his patchset and atop my
> modification on it.
> https://lore.kernel.org/linux-riscv/CAJF2gTS9y1QZx-8pu2NW22xs1Gky0y4Hs31Wrn7gZg3FiAq8NA@mail.gmail.com/
> 
> So, please abandon the patch, I'll send a new version patchset based
> on Mark's work.

For context, the series is basically ready now, but I'm intending to
rebase it atop v5.13-rc1 before posting (e.g. since s390 just moved to
ARCH_ATOMIC), and plan to post that early next week.

If you want an early look, my atomics/arch-atomic branch on kernel.org
has the WIP (atop v5.12):

  https://git.kernel.org/pub/scm/linux/kernel/git/mark/linux.git/log/?h=atomics/arch-atomic
  git://git.kernel.org/pub/scm/linux/kernel/git/mark/linux.git atomics/arch-atomic

.. and the riscv-specific changes are just renames:

  https://git.kernel.org/pub/scm/linux/kernel/git/mark/linux.git/commit/?h=atomics/arch-atomic&id=3f7f7201eb4f4548cfb609019e7110b30ae598fc

Thanks,
Mark.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
