Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FAB5EB64DD
	for <linux-riscv@archiver.kernel.org>; Thu, 13 Jul 2023 12:27:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:
	In-Reply-To:Subject:cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zwfAvXvJwaiTz2x4HexXULpNtkuNc4F9KqISnMb9//c=; b=WvE6Bfm/E6yrLN
	sgAplRKH6QQYPx/JurgSw7Jr8n1h82maWgv9CDIrrKHm66s7aX0lS+wSrYUs3TZhmT9v3EtiaxeUm
	BmSqU7588rQ7ZJ2f581UHRVDBnr1eyZCHIjPNDBp3/5eXfnvU3G7Xj1++ut+UAR/7UiI5Yb2s0MEI
	zk7qC5pO+ZPsIrU0wBlJN073NoICPNF2dHHcqgurJdF9J3iI8rvl4gOjdNZHHMHdKn4MyDK77Bpn2
	9xBNv0y1kWwSvCx3WMQqTpjVwkoxwpTv+j2O+xctL6QYQfRjzG7yLmV97uCR/QShzyxkNGI/FI3+f
	6uC095QcXXKd9yc0YZ0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qJvPy-003Eyd-04;
	Thu, 13 Jul 2023 12:27:34 +0000
Received: from angie.orcam.me.uk ([78.133.224.34])
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qJvPv-003Exi-0b
	for linux-riscv@lists.infradead.org;
	Thu, 13 Jul 2023 12:27:33 +0000
Received: by angie.orcam.me.uk (Postfix, from userid 500)
	id 7CD7492009C; Thu, 13 Jul 2023 14:27:24 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by angie.orcam.me.uk (Postfix) with ESMTP id 77BE092009B;
	Thu, 13 Jul 2023 13:27:24 +0100 (BST)
Date: Thu, 13 Jul 2023 13:27:24 +0100 (BST)
From: "Maciej W. Rozycki" <macro@orcam.me.uk>
To: Palmer Dabbelt <palmer@rivosinc.com>
cc: linux-riscv@lists.infradead.org, bjorn@kernel.org, remi@remlab.net
Subject: Re: [PATCH v3] RISC-V: Document that V registers are clobbered on
 syscalls
In-Reply-To: <20230619190142.26498-1-palmer@rivosinc.com>
Message-ID: <alpine.DEB.2.21.2307130030300.57020@angie.orcam.me.uk>
References: <20230619190142.26498-1-palmer@rivosinc.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230713_052731_408655_370BF3BB 
X-CRM114-Status: GOOD (  15.09  )
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

On Mon, 19 Jun 2023, Palmer Dabbelt wrote:

> This is included in the ISA manual, but it's pretty common for bits of
> the ISA manual that are actually ABI to change.  So let's document it
> explicitly.

 I'm probably coming much too late for this to have any effect, but I find 
this design decision quite odd.  The V extension spec has this note:

"This scheme allows system calls that cause context switches to avoid 
saving and later restoring the vector registers."

however declaring vector registers syscall-clobbered does not actually let 
context switches in a preemptively multitasked OS such as Linux refrain 
from saving/restoring these registers, because switches will quite often 
if not predominantly (depending on application) happen asynchronously in 
response to a hardware interrupt such as a timer tick.  In which case 
vector registers will have to be saved for the old context and loaded for 
the new one anyway, and two variants of the context switch handler will be 
needed to take any performance advantage envisaged by the spec (and then 
the case of a syscall switching to a context previously preempted by a 
hardware interrupt will have to be handled correctly, where we can ignore 
values from the old context, but need to load ones for the new context).

 What has been the usual approach across CPU architectures for decades now 
to reduce expensive moves of extra register files, such as FPU, vector, 
DSP, etc. on context switches is just setting a privileged control bit 
that makes any instruction accessing such a register file trap and then 
the handler loads the file according to its previously saved contents for 
the current context, clears the control bit and restarts the instruction 
that faulted.  Depending on the OS design decision saving for the old 
context is done either in the trap handler beforehand or in the original 
context switch that took control away from the old context.  Consequently 
extra register files are only saved and loaded if ever touched by the 
context concerned, even if contexts are preempted by a hardware interrupt.

 Have I been missing anything here?

 FWIW,

  Maciej

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
