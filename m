Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F409CDE00D
	for <linux-riscv@archiver.kernel.org>; Thu, 25 Jun 2026 19:50:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:
	In-Reply-To:Subject:cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ueWS0ydr2IFBWRvk35DuLqLbOfz0YwcrM8URzZRsKDU=; b=OBo2uE2P6mgAao
	wU+UV2EqJaB7paFQEoFla8GiN0oUc9eTG7Jykyr97UENiJ+6Jvw064T2cO3vzDapnWVo0nO5GP4mj
	ihbsx0GhGEHH94SDPqWenJN83oEi5Cm3Yhffy7E7CfL+DAzyfPD0Fv3lFCTWWNqk15UtFgalrLGG6
	OCkYlN/7hPso3rUgT3e/4l4pr3RYzJNbCtujTMcGDMclrOj3t3BsA62wVh2KGJaINFBU57jmTpDr9
	FqeNDLU+eswgFZOVtJd/0Y+KoQUc3kbSRKjGE5L6Q55AvlLEYJogCS5kr1zMxFgrzA9S6LSq4zHV7
	WhMtElmqYGrXne3DvPdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcq5y-00000009lg4-3lEb;
	Thu, 25 Jun 2026 19:50:42 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcq5y-00000009lfn-0uCp
	for linux-riscv@lists.infradead.org;
	Thu, 25 Jun 2026 19:50:42 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id A0FDA43234;
	Thu, 25 Jun 2026 19:50:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D14F81F000E9;
	Thu, 25 Jun 2026 19:50:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782417041;
	bh=/O5ie/tD69pnG+vjdpPEN4L7EV1EZMh+H0wu8tdoOWE=;
	h=Date:From:To:cc:Subject:In-Reply-To:References;
	b=TuhmWdTsN9VqMjxcLKeRbMzSuzXDDgkl6Ya/a7e8IsA9er5G0C4C6qH6dKfGliRuL
	 wwpNLTAGL+Qne3yioDecKpccJjbHiQJXh7xkPIIrxMRHidQoRwjdyqtEnErFIBZH1V
	 NOhtOQevnU63tryyICji03ijraZ9JROzmVmm+o7N5u33LG+YH30drSQj1PNJOpSOmq
	 L5LpeAU16x62mUPqe/V+sWFI4qdJfDfUDzmmOFG2YxeisojEeypG9f6YV3TIhFRGmJ
	 ujkl4v5aac0aRlkEfyV/Rh/H085BVxAf2H2bQGsJkUz5/mJHqzTcCxaubRHUCNQuam
	 ZPoHc99TFnbRA==
Date: Thu, 25 Jun 2026 13:50:40 -0600 (MDT)
From: Paul Walmsley <pjw@kernel.org>
To: Nam Cao <namcao@linutronix.de>, samuel.holland@sifive.com, 
    Rui Qi <qirui.001@bytedance.com>, Michael Ellerman <mpe@kernel.org>
cc: palmer@dabbelt.com, pjw@kernel.org, aou@eecs.berkeley.edu, alex@ghiti.fr, 
    conor@kernel.org, linux-riscv@lists.infradead.org, 
    linux-kernel@vger.kernel.org
Subject: Re: [PATCH] riscv: Fix 32-bit call_on_irq_stack() frame pointer
 ABI
In-Reply-To: <87pl1fvwce.fsf@yellow.woof>
Message-ID: <7f93b3b9-4ba5-fb7e-a454-b67536a9351c@kernel.org>
References: <20260624113148.3723541-1-qirui.001@bytedance.com> <2e47388a-8883-4b44-b440-a00b8e622733@kernel.org> <87pl1fvwce.fsf@yellow.woof>
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

On Thu, 25 Jun 2026, Nam Cao wrote:

> Michael Ellerman <mpe@kernel.org> writes:
> > On 24/6/26 9:31 pm, Rui Qi wrote:
> >> call_on_irq_stack() uses struct member offsets to set up its link in the
> >> frame record list. On riscv32, struct stackframe is the wrong size to
> >> maintain stack pointer alignment, so STACKFRAME_SIZE_ON_STACK includes
> >> padding. However, the ABI requires the frame record to be placed
> >> immediately below the address stored in s0, so the padding must come
> >> before the struct members.
> >> 
> >> Fix the layout by making STACKFRAME_FP and STACKFRAME_RA the negative
> >> offsets from s0, instead of the positive offsets from sp.
> >
> > The fact that all uses of the defines need to add back STACKFRAME_SIZE_ON_STACK
> > makes me think the defines don't have the most useful values.
> >
> > If the values were offset + padding then the uses could be left unchanged.
> 
> At the moment we only have only one user which has nothing except the
> stack frame on the stack. Other potential users do not necessarily add back
> STACKFRAME_SIZE_ON_STACK.
> 
> The offset value depends on the function. So I think it's better to
> leave that offset calculation to users.

Since it's a fix, I queued Rui's resend of Samuel's patch for v7.2-rc, 
after cleaning it up along the lines of Nam's suggestions.

Michael, if you think those changes are worth a followup patch for the 
list to consider, maybe you can send it as a separate patch?


- Paul

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
