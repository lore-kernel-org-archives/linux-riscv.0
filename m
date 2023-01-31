Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB432C636CC
	for <linux-riscv@archiver.kernel.org>; Tue, 31 Jan 2023 20:03:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=THXrWoJSAkIe8ZNTLZzDOM1LTUWPqC55xgYXc1KbtOI=; b=D4IPZBr6t0aE4T
	iu8eb/Sfziv2Fx1l06NilRgyGT7YY6MPCMNPMd+m1ezr4G1iqK6FFpL00KD0wKVPal/WOqyGyaBlx
	cBBPOBCpR2DKpH0ZQDVkOAs3tIAA7HMEu76vHgKz63Tc3pHAsP0YfUm2H22BjYruUmt7l4fEfZVfj
	yFMNvLN1UWUcSZdPS7/3uI/5FYVYtOjCzi/TZeCcNP4N3obmKxZ7SYvalTxA6DMmLRKLnIsGK3UJ0
	hrjZ5EukyhEpiHCwYyfTci4vtkRIYY71deWMl03QfgqXu3W5sM2m/HbiInjdNDSS0JHq0S/9l0moW
	41GNxPO3a8LN4O/2Ra9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pMwqT-009CZY-Fj; Tue, 31 Jan 2023 20:03:09 +0000
Received: from zeniv.linux.org.uk ([2a03:a000:7:0:5054:ff:fe1c:15ff])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pMwqP-009CYN-D4
	for linux-riscv@lists.infradead.org; Tue, 31 Jan 2023 20:03:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=linux.org.uk; s=zeniv-20220401; h=Sender:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:In-Reply-To:References;
	bh=wcBJkRF793IhrFvqwpLU4zntoDbJkzMhR1UFYyzCsfo=; b=BFTP6VpnlE8pQa3pDsKLm3Q10X
	Q9Gcdp7Xqeex1PKhqtcPoNe9nPTNJTF0ILbjS7R3tAUBiQe3I8I6NveA94gSYpNFCTShE7F9Mw32X
	sMkSPoX4uQPAO127UmaQN8vg8AelHaryoauasOWusihSupTGmNrqDUfP8WshD8Nu0JamWbe6yjYbE
	+a+/Pupnf8T8mInAf+wq1pKyMzaHiIb837m8C/KGKn5O0TNPKh9nWjv4opaH4Rc6k015fbTgdzd1E
	daMXAIGzgablb7n/2W6yDtHHgnj6NKhMzKfaP8ZV5EJgJf7xa2vYL3l0Z8UsaJzcyzgtcFZwutRlq
	a35LbcuQ==;
Received: from viro by zeniv.linux.org.uk with local (Exim 4.96 #2 (Red Hat Linux))
	id 1pMwqB-005Il7-1l;
	Tue, 31 Jan 2023 20:02:51 +0000
Date: Tue, 31 Jan 2023 20:02:51 +0000
From: Al Viro <viro@zeniv.linux.org.uk>
To: linux-arch@vger.kernel.org
Cc: linux-alpha@vger.kernel.org, linux-ia64@vger.kernel.org,
	linux-hexagon@vger.kernel.org, linux-m68k@lists.linux-m68k.org,
	Michal Simek <monstr@monstr.eu>, Dinh Nguyen <dinguyen@kernel.org>,
	openrisc@lists.librecores.org, linux-parisc@vger.kernel.org,
	linux-riscv@lists.infradead.org, sparclinux@vger.kernel.org,
	Linus Torvalds <torvalds@linux-foundation.org>
Subject: [RFC][PATCHSET] VM_FAULT_RETRY fixes
Message-ID: <Y9lz6yk113LmC9SI@ZenIV>
MIME-Version: 1.0
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230131_120305_463285_CD912C5D 
X-CRM114-Status: GOOD (  10.77  )
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

	Page fault handlers generally react to VM_FAULT_RETRY from
handle_mm_fault() by repeating the whole thing (starting with locking
mmap) with FAULT_FLAG_TRIED added to flags.

	However, there are two cases when that's not the right thing
to do:

1) fault has happened in userland and we have a pending signal.  In that
case we'd better return from fault handler immediately.

2) fault has happened in kernel (e.g. in something like copy_from_user())
and we have a pending *fatal* signal.  Solution is to handle that as if
handle_mm_fault() had failed; we have come from kernel mode, so we'd
better have an exception table entry for the fauling insn.  Find it
and deal with it; from the copy_from_user() (or whatever it was that
triggered our fault) caller's POV it's indistinguishable from running
into an unmapped area, so it will fail.  The process is not going to
survive anyway.

Quietly returning from #PF handler in the second case is asking for
livelock - one common case when handle_mm_fault() returns VM_FAULT_RETRY
is when it needs to wait for page lock and gets hit by a fatal signal.
Running into that in any uaccess primitive will end up repeating the
faulting insn again and again, as long as we hit that case in
handle_mm_fault().  Eventually it might get out (e.g. trylock
manages to get page lock without hitting the "wait for it" codepath),
but it's obviously not a good situation.

On x86 it had been noticed and fixed back in 2014, in 26178ec11ef3 "x86:
mm: consolidate VM_FAULT_RETRY handling".  Some of the other architectures
had it dealt with later - e.g. arm in 2017, the fix is 746a272e44141
"ARM: 8692/1: mm: abort uaccess retries upon fatal signal"; xtensa -
in 2021, the fix is 7b9acbb6aad4f "xtensa: fix uaccess-related livelock
in do_page_fault", etc.

However, it never had been done on a bunch of architectures - the
current mainline still has that bug on alpha, hexagon, itanic, m68k,
microblaze, nios2, openrisc, parisc, riscv and sparc (both sparc32 and
sparc64).  Fixes are trivial, but I've no way to test them for most
of those architectures.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
