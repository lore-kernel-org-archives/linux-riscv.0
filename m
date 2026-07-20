Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29286C4452A
	for <linux-riscv@archiver.kernel.org>; Mon, 20 Jul 2026 12:43:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dF07e+PJuQTaVywiu+dmAKgpcgI+X3nLN2wVm0livPE=; b=wcg34/e/o0L04K
	sMEOoskk3zlPytPI+5tzWhHd7uuSRV8By+gFP7TVe+NF3ldH7a8ykZf20zQVMJcRyu0edrhsJ3YSL
	x2C5MK/u6prCC2hxClvhbvwr/pi2y8+Y14H0FiTxMq4zmRNkdJ3DUf5MOUnFYis1Bu3zwvuR9ndc7
	DCLJqdX9t3VI20tqZfsMtc0N1sj1fL+DHI69WhxF2XO2UnVrpPeK2iTV/rrLckVJ4KRN3IYo1ZOZh
	IJcZQ+Qcw9RArnJuZSCvqoYk9NyX6X27kxsXwulpwmIr89xVO31wcykitjXlGzNNdGuKhrc3Z+diJ
	bsPUHQ43ZooqMNpMseGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlnL7-00000006it2-0xqa;
	Mon, 20 Jul 2026 12:43:21 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlnL5-00000006isj-1lcj;
	Mon, 20 Jul 2026 12:43:19 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 2233F4304A;
	Mon, 20 Jul 2026 12:43:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C02101F000E9;
	Mon, 20 Jul 2026 12:43:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784551399;
	bh=/iig1PBFdcY5HjlDuDU/ADsRJNO/Hx2Bt7lB9eeE+YM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=C2KGFoH7pJ83K2lvgvwaBViS832LyhVDhzK+gYrDm//Wacyhb8iZjL6FL/5KoOAMm
	 gykvbdJUUb8za46mKM+vvkIg75ktBdDRFMkeQ60bebVECAM8LDq551QWsi39nubm3M
	 f0bijeVlQZ1l1URXOCz12bRAfczsKWTk2v4FkqSsevjPw5CK0fF9tLUvxrlQtJLm9e
	 CQm61a93+a14hp896s1BJ5I03BijR+dPV0Y++8FEUmKQwsku4NPfG9tYKkPhoZCxzE
	 sxkqhBBJeq0tGuVKZ09aiBZId7G9P9Tll+X4kkYj9Q06IJ98xwWPngvKWL8xQV0gAD
	 ACWxcsOpSTR6w==
Date: Mon, 20 Jul 2026 15:43:11 +0300
From: Mike Rapoport <rppt@kernel.org>
To: Simon Horman <horms@kernel.org>
Cc: Pnina Feder <pnina.feder@mobileye.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Baoquan He <baoquan.he@linux.dev>,
	Pasha Tatashin <pasha.tatashin@soleen.com>,
	Pratyush Yadav <pratyush@kernel.org>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Dave Young <ruirui.yang@linux.dev>,
	Jonathan Corbet <corbet@lwn.net>, Alexandre Ghiti <alex@ghiti.fr>,
	kexec@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-mips@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-doc@vger.kernel.org
Subject: Re: [PATCH 0/4] vmcore-tasks: export per-task metadata to vmcoreinfo
Message-ID: <al4X300UObXawEIJ@kernel.org>
References: <20260622211430.4008899-1-pnina.feder@mobileye.com>
 <akybBoCAm-kJbfHL@kernel.org>
 <20260720091927.GA1736709@horms.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260720091927.GA1736709@horms.kernel.org>
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

Hi Simon,

On Mon, Jul 20, 2026 at 10:19:27AM +0100, Simon Horman wrote:
> On Tue, Jul 07, 2026 at 09:21:58AM +0300, Mike Rapoport wrote:
> > On Tue, Jun 23, 2026 at 12:14:26AM +0300, Pnina Feder wrote:
> > > This series extends vmcoreinfo with struct offsets and sizes needed by
> > > the vmcore-tasks userspace tool to extract per-task state from a vmcore
> > > dump without requiring kernel debug symbols (DWARF/BTF).
> > > 
> > > The vmcore-tasks tool reads /proc/vmcore (or a saved vmcore file) and
> > > reconstructs, for each task:
> > >   - task name, pid, state, flags
> > >   - VMA list (start, end, flags, backing file)
> > >   - user register state (saved on the kernel stack at kernel entry)
> > >   - user-space backtrace with VMA/filename mapping
> > >   - kernel dmesg buffer
> > > 
> > > This provides a lightweight post-mortem crash analysis capability for
> > > production environments where full debug info (DWARF/BTF) is not
> > > available.
> > > 
> > > The companion userspace tool is submitted to kexec-tools:
> > >   https://lore.kernel.org/all/20260622205550.1087163-1-pnina.feder@mobileye.com/
> > 
> > Sorry for the delay, this fell between the cracks somehow.
> > 
> > The kernel side looks fine overall, but to merge it there should be an
> > agreement from the userspace side maintainers that vmcore-tasks is
> > something they are wishing to accept.
> 
> Hi Mike, all,
> 
> Sorry for the extended delay.
> 
> I will send some minor feedback to the user-space tool patchset
> but overall, yes, this is something I would be happy to accept.
> 
> I don't want to create a chicken-and-egg type problem here.
> But it's probably worth mentioning that usually features
> hit the kernel before the corresponding code is accepted
> into kexec-tools.

Sorry if I wasn't clear. 

I didn't mean that the feature should be merged into kexec-tools before
merging the kernel bits. I just wanted to make sure there's no fundamental
issue from kexec-tools perspective.

> Let me know how you would like to proceed.

I'm going to wait for Baoquan's review and once that's done I'll pick up
the kernel bits.

-- 
Sincerely yours,
Mike.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
