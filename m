Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 475A3C44507
	for <linux-riscv@archiver.kernel.org>; Wed, 15 Jul 2026 01:37:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:
	In-Reply-To:Subject:cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YTer2qphVkN8X3eIFRz497gY+YcxnZLuXynmI3U28bY=; b=MoQD4GtyPkFBI7
	NYsDsCVK86E5OgdFxlct1hRyTjG12IsRwrqYEpXohiJF3K0KKh7B5VUYLGH/QviPnwvlLVPz9ISxQ
	NgcSl6iZt0yeqG5ylzPHCMxmrlF5HEks4KzwT/zia1xrBo7PJHgaLHMprk+V6V4qsuTxNroKJZCrz
	zwQ5tGdleqo079FQv7g1VxrBZhX7iO7W4MAuZkdP4KUnVRhO4Ae4d4M6/J0iNcWp6lUYFt6QTTanK
	qaB1oCvY9LNm6zrTs5iXVQ0jhenfHCqjB86T2FWxXNaKFbIanjihyUIkkl/d7wExCDcmEsbnIeHdZ
	G6whCNTkeImeCocMTpLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjoYe-0000000DZlW-33m6;
	Wed, 15 Jul 2026 01:37:08 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjoYc-0000000DZlN-2Ou8
	for linux-riscv@lists.infradead.org;
	Wed, 15 Jul 2026 01:37:06 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 5A20D600BB;
	Wed, 15 Jul 2026 01:37:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 60DBE1F000E9;
	Wed, 15 Jul 2026 01:37:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784079425;
	bh=9hXZES7boB1AazsyWISWT/pKV6aI6aU3YaJu2A6dM9A=;
	h=Date:From:To:cc:Subject:In-Reply-To:References;
	b=ovoxpEfAm6BRlTFAj8F0Dcxc0hGE0wO2LKOumO8vahRNCvUgxSr+blYzcInG0T2Me
	 A+CfHvczZTGL4+VdLFmP3oBOLW+0afzsaybGZucSLiezkYR5VuHXAtsMJML2AFKNG2
	 ri5a/uSwIPKpBJJDVMN3YUoIV0gqYzf9wIUZp3Jh+VYvpTsvF76oJFjueh/N7BtHdH
	 0HUbLKCkrzBQ4iM4QMinMIcVaeJUx/THVhrDiDyF448pJabUv4xEvUqeFGt9MMty7Y
	 zEI4CIxQrKdQd1UuclmleDvwV0bzV7+wZSly5tFnKlVRrxxYnm+y93HdIWYT8qVAgq
	 bkgCDLYuWelJw==
Date: Tue, 14 Jul 2026 19:37:01 -0600 (MDT)
From: Paul Walmsley <pjw@kernel.org>
To: Aurelien Jarno <aurelien@aurel32.net>
cc: Paul Walmsley <pjw@kernel.org>, Joel Stanley <joel@jms.id.au>, 
    linux-kernel@vger.kernel.org, Palmer Dabbelt <palmer@dabbelt.com>, 
    Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
    Jim Shu <jim.shu@sifive.com>, Zong Li <zong.li@sifive.com>, 
    Deepak Gupta <debug@rivosinc.com>, 
    "open list:RISC-V ARCHITECTURE" <linux-riscv@lists.infradead.org>
Subject: Re: [PATCH] arch/riscv: vdso: remove CFI landing pad from
 rt_sigreturn
In-Reply-To: <alY7HFcSYkXh97Vy@aurel32.net>
Message-ID: <eb8fd632-ca2c-9b65-209c-ce2294929cb9@kernel.org>
References: <20260623204058.498120-1-aurelien@aurel32.net> <fd0c06ce-f842-95cc-c517-7e6fb2c5b2c5@kernel.org> <CACPK8XcJZzynnofpLHsPAD6Lbbjf9=soj+nFhU3ey=3yT2056w@mail.gmail.com> <alY7HFcSYkXh97Vy@aurel32.net>
MIME-Version: 1.0
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

Hi Aurelien, Joel,

On Tue, 14 Jul 2026, Aurelien Jarno wrote:
> On 2026-06-29 17:08, Joel Stanley wrote:
> > On Fri, 26 Jun 2026 at 03:33, Paul Walmsley <pjw@kernel.org> wrote:
> > > On Tue, 23 Jun 2026, Aurelien Jarno wrote:
> > >
> > > > When CONFIG_RISCV_USER_CFI is enabled, the CFI version of the vDSO, has
> > > > a CFI landing pad instruction at the start of __vdso_rt_sigreturn. This
> > > > breaks libgcc's unwinding code which matches on the first two
> > > > instructions. Other unwinders that rely on similar instruction matching
> > > > may also be affected.
> > > >
> > > > Since __vdso_rt_sigreturn is reached as part of signal-return handling
> > > > rather than via an indirect call/jump from userspace, it does not need a
> > > > CFI landing pad. Remove it and restore the instruction sequence expected
> > > > by existing unwinding code.
> > > >
> > > > This matches what was done on arm64 in commit 9a964285572b ("arm64:
> > > > vdso: Don't prefix sigreturn trampoline with a BTI C instruction") for a
> > > > similar issue.
> > > >
> > > > Fixes: 37f57bd3faea ("arch/riscv: compile vdso with landing pad and shadow stack note")
> > > > Co-authored-by: Joel Stanley <joel@jms.id.au>
> > > > Signed-off-by: Aurelien Jarno <aurelien@aurel32.net>
> > >
> > > I'd like to take this one.   But since you're listed as the co-author, I
> > > probably need your Signed-off-by: as well.  Care to reply with it?
> > 
> > Signed-off-by: Joel Stanley <joel@jms.id.au>
> > 
> > Thanks Aurelien for working with me on this one. I saw CFI was
> > disabled in the debian kernel config and wondered why (failing glibc
> > backtrace tests with CFI enabled), and we got to the bottom of it.
> > 
> > This one should go to stable IMO.
> 
> Now that Joel answered with a Signed-off-by, would it be possible to get 
> this merged for 7.2?

Of course; thank you for the reminder.  Thanks for the patch and the 
S-o-b, queued for v7.2-rc with a cc: to stable@vger.


- Paul

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
