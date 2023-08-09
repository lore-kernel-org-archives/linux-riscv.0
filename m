Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71D50C001B0
	for <linux-riscv@archiver.kernel.org>; Wed,  9 Aug 2023 23:09:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:
	In-Reply-To:Subject:cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=k3JLexyGu5Ni9mV108umR6FS3tvkuIIyfj7Tswer5Dw=; b=ooSlZJySd1VHuz
	1C9JtVNybKgGid1XEY+vHmwF/UnpjQtUEPgRUmsGMKQ8lE8/tfIBFbfy9vczjfPWsuLfgQhI+UaTi
	H0mFDkba1U7/1D1FTYztn+p6KsWGzAr0725OOWWwv4Uop57rg5X5dDaMMUL0gzx1xPwdDYvp/mWne
	uNBJfX7ajpU05/iC0M0zJEksEeqAEjuZYTNnGD3IpzawbI/9uIfw1H0V0ISEHgrmVRPRja6puRfCU
	hW3I2jfkTS2ZGQVmasxu865FZWaxPqA4CkPC+b5z2CvNVSMU8ytWoExIOaIH9SveZ7aA4MI9yDFkg
	ceN710HDPnBa/x0QfrzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qTsIw-0062hy-0U;
	Wed, 09 Aug 2023 23:09:26 +0000
Received: from angie.orcam.me.uk ([2001:4190:8020::34])
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qTsIs-0062hA-1v
	for linux-riscv@lists.infradead.org;
	Wed, 09 Aug 2023 23:09:24 +0000
Received: by angie.orcam.me.uk (Postfix, from userid 500)
	id BB8AF9200C1; Thu, 10 Aug 2023 01:09:17 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by angie.orcam.me.uk (Postfix) with ESMTP id B9C2F9200BF;
	Thu, 10 Aug 2023 00:09:17 +0100 (BST)
Date: Thu, 10 Aug 2023 00:09:17 +0100 (BST)
From: "Maciej W. Rozycki" <macro@orcam.me.uk>
To: Greg Savin <greg.savin@sifive.com>, Greentime Hu <greentime.hu@sifive.com>, 
    Andy Chiu <andy.chiu@sifive.com>
cc: linux-riscv@lists.infradead.org, gdb-patches@sourceware.org, 
    Andrew Burgess <andrew.burgess@embecosm.com>
Subject: Re: [PATCH] RISC-V: support for vector register accesses via ptrace()
 in RISC-V Linux native
In-Reply-To: <CADdv1FqjLPZ-eWOKPv0uZxF-u-SYjn0WJGr3KWW9H06-O0L35w@mail.gmail.com>
Message-ID: <alpine.DEB.2.21.2308092247280.25915@angie.orcam.me.uk>
References: <20230803230110.904724-1-greg.savin@sifive.com> <alpine.DEB.2.21.2308091008500.25915@angie.orcam.me.uk> <CADdv1FqjLPZ-eWOKPv0uZxF-u-SYjn0WJGr3KWW9H06-O0L35w@mail.gmail.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230809_160922_798030_65E81BF1 
X-CRM114-Status: GOOD (  22.47  )
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

On Wed, 9 Aug 2023, Greg Savin wrote:

> The SIGILL guard is being used as a wrapper around determination of the
> VLENB CSR, which is not part of the ptrace() payload for vector registers,
> at least as it exists at head-of-tree Linux kernel.   GDB or gdbserver
> needs to know VLENB in order to construct the architectural feature
> metadata that reports an accurate width for the vector registers.  If not
> for the VLENB determination specifically, and the lack of this information
> via ptrace(), then there would be no motivation for executing a vector
> instruction directly.  It's a workaround, basically.  I guess I could
> inquire in Linux kernel land regarding whether the NT_RISCV_VECTOR ptrace()
> payload could be enhanced to provide VLENB.

 I think the kernel interface needs to be clarified first, before we can 
proceed with the tools side.

 I can see the vector state is carried in a REGSET_V regset, which in turn 
corresponds to an NT_RISCV_VECTOR core file note.  I can see that besides 
the vector data registers only the VSTART, VL, VTYPE, and VCSR vector CSRs
are provided in that regset, and that vector data registers are assigned 
a contiguous space of (32 * RISCV_MAX_VLENB) bytes rather than individual 
slots.

 So how are we supposed to determine the width of the vector registers 
recorded in a core file?  I'd say the RISC-V/Linux kernel regset API is 
incomplete.

 A complete API has to provide `ptrace' and core file access to all the 
relevant registers (vector registers in this case) that can be accessed by 
machine instructions by the debuggee.  That includes read-only registers, 
writes to which via `ptrace' will of course be ignored.  If a register is 
a shadow only and can be reconstructed from another, canonical register 
(e.g. VXRM vs VCSR) then the shadow register can (and best be) omitted of 
course.  Additional artificial OS registers may also have to be provided 
that reflect the relevant privileged state made available to the debuggee 
at run time by OS calls such as prctl(2); this for example might be a mode 
setting which affects the hardware interpretation of a register set that 
debug tools may need to take into account or the person debugging may want 
to check or modify (e.g. REGSET_FP_MODE in the MIPS/Linux port).

 I've added the authors of the Linux kernel code and the RISC-V/Linux 
mailing list to the list of recipients.  Am I missing anything here?

  Maciej

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
