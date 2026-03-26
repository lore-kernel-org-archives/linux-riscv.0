Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3671510A88E0
	for <linux-riscv@archiver.kernel.org>; Thu, 26 Mar 2026 16:46:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OUoVL1YE2Pf9wLadFWBdVrdIe4WtDric75qoI+OFvWg=; b=Z/PEBiXC76jXiZ
	IsmmDfT8bLUlwACbXmwVVcNFk+5PUWno/Cq36Pz+M0vf6D26wEEo8R3STHvUkA0Geq2WvCZAPfTGs
	TlBfjI/ElYumFbyAACmMSe+MczVi2pjJJhrBT6fgqCi2nsPCJW97IJdvXAHj9lTljbS/Wz7+H608r
	zEyIExmIJ+L3CMsr7LIC51u0Nf2juicKpa/fugcA/jPccAoWUqWYLXtLad8Ur/u8ia0qYLodcuKy+
	LhFeOevVpbCXz/4v0Q2AuzSxS3dUXo6iknHF71LOtep/tqOJ50MJbglwOsSbCNXlesLFlK8RKQ2sE
	39IWYKxODD00ZIdi2sXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5nqX-00000005sgm-1U8j;
	Thu, 26 Mar 2026 16:46:13 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5nqN-00000005sg2-3rfU
	for linux-riscv@lists.infradead.org;
	Thu, 26 Mar 2026 16:46:11 +0000
From: Nam Cao <namcao@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1774543525;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=EV379XA4FUKXFVlAJBCkjUAR7vayrSReiUQ3Ml4I9Aw=;
	b=cwu8JR44+W5uNCWaXg80lD2goDd8tUpI6P7bCaBbjj/ZllXh4fOewsU5JcxjhvZB6qWu49
	+w2jZiyqMMVYPYHafh3svZCQbjxhISK3goyTK6q4LgFDiWyupEiksf8AYpvSoSmvkW3ZMl
	ysXCiyrDPB6hot7gJBJwpVyld/yN7Tf26ZatQx3nlUlYhBMEeMd32xUyVY/4ztId+qndeu
	zD+1oFQ05EXKWQHizmspRV8lTOL77b83z2zX7OweEO3XpTZQQg2HPoS+ikRRroyRbnmH4H
	3rHAn3O0ruFy7f5vtK0eIWHitO+SiMZ+Xx+700hJCsUVLOroEtkwsjkEAZX7Eg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1774543525;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=EV379XA4FUKXFVlAJBCkjUAR7vayrSReiUQ3Ml4I9Aw=;
	b=S+FXWy/sflLzh9Npx7QiUw5ilCCH3uA+CfBHd3x0jHTyJtvs2KYFgH/Bld0A/GMsvLP9Qw
	P7r1rWEfyrRdr9Cg==
To: Charles Mirabile <cmirabil@redhat.com>
Cc: alex@ghiti.fr, aou@eecs.berkeley.edu, haxel@fzi.de,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 palmer@dabbelt.com, pjw@kernel.org, vitaly.wool@konsulko.com,
 cmirabil@redhat.com
Subject: Re: [PATCH] riscv: Remove support for XIP kernel
In-Reply-To: <20260320160443.1850701-1-cmirabil@redhat.com>
References: <20260202115403.2119218-1-namcao@linutronix.de>
 <20260320160443.1850701-1-cmirabil@redhat.com>
Date: Thu, 26 Mar 2026 17:45:24 +0100
Message-ID: <87v7eiedzv.fsf@yellow.woof>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260326_094604_118369_4E09A2D2 
X-CRM114-Status: GOOD (  24.27  )
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

Charles Mirabile <cmirabil@redhat.com> writes:
> Chiming in as another voice interested in not scrapping XIP. I think
> RISC-V is an interesting position as an ISA of being able to support
> both desktop/server class high performance designs, but also low cost
> embedded applications. The ability to run linux in M-Mode without an
> MMU, and even XIP directly from storage within one code base just by
> changing configuration options is fantastic and positions linux to be
> the obvious kernel of choice for both kinds of RISC-V implementations.
>
> That being said, it is clear that these use-cases are not being tested
> or maintained. The addition of runtime constant support for RISC-V also
> broke no-mmu which I fixed in:
> 8d90d9872edae ("riscv: fix runtime constant support for nommu kernels")
> and clearly is also XIP which I did not test at the time and did not
> realize. I have a patch to essentially just disable the runtime constants
> logic on RISC-V when CONFIG_XIP_KERNEL is enabled here that should fix it:
> https://lore.kernel.org/lkml/20260320155843.1848180-1-cmirabil@redhat.com

FWIW, the patch looks correct to me. I can test it if we decided to keep XIP.

> That being said, In truth I have not actually built or used an XIP linux
> kernel on RISC-V, so I am not sure I can volunteer to test or maintain it
> at this moment, but I am planning on experimenting with M-Mode noMMU XIP
> linux on the sifive hifive unleashed board with the hope of creating a
> kernel that can act as a linuxboot payload and essentially replace the
> firmware of the device. With the fix I proposed, perhaps it is tenable to
> not remove XIP at this time and go back to the status quo? I understand
> that it is just kicking the can down the road until the next time someone
> makes a change that breaks XIP and no one notices if no one is testing,
> but maybe we can have a conversation about how we could improve the
> situation in the meantime and have an actual plan to catch that before
> such a breaking patch makes it to mainline next time.

I'm not sure if we should be keeping it for the hope that maybe a use
case will appear in the future. We can always revert it back when we do
need it in the future. But for now, it is being maintenance burden with
no benefit.

I presume your experiment does not require the latest kernel, and you can
use the older versions which still support XIP?

Nam


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
