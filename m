Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A29B2C636CC
	for <linux-riscv@archiver.kernel.org>; Tue, 31 Jan 2023 21:11:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GGfqLnznw9N7ysaoaXgD9HrJzwpL3+0aBMjmQ2IhNV4=; b=bfs0sfBVkfoSRt
	kKw8gV2SUMF0xF7d2StxkIlQySE818cWYDUY+qT1pGB3/pEm1bjQkoUkZSjzhU25sx88QgW+fIrjs
	Z6rRB/tx6frqYf3Rvyd0nzdwSIHxGKqzoJZm3kPTkx+eesSoVgr4JaUBV3F/B8cTSxQDGieDNgZUu
	vqOqh7TZ+uayTiLu4hjITyWK5nS/XuMkO7lrvGIjBqJj/ePQ4wk78TvMjzZ1Z3QWnphDlMCqu9Lt/
	cQPaSlLli+AS8/KuExs9PSdFwX/FR+V1LaiH4zb9hlmB7gN0upatSlLL21kL2IqyEAs+0XRpAZi6V
	fkhHitH9M4sja1MyA+0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pMxu9-009N0P-1T; Tue, 31 Jan 2023 21:11:01 +0000
Received: from zeniv.linux.org.uk ([2a03:a000:7:0:5054:ff:fe1c:15ff])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pMxu7-009Mye-8c
	for linux-riscv@lists.infradead.org; Tue, 31 Jan 2023 21:11:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=linux.org.uk; s=zeniv-20220401; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=Ax3PgYwLD1J7idHBX3HJFIuaDhcl8qpAf80zjHGbIOE=; b=ijKot8fh7fbodyAsqMzVpj0Cd/
	VRhb3o6VGsSZwFzUgydtCMao2SRAc6OvQbKgKTgF95uP5svS4C/FxCqcqUX86wc84kQEXVbEPB7wS
	rN+Xso/B3SrMGqO5wEnGdYpYTNTo/fdm4TakUXxCmvcsIkqePXpvogyNY4WqFatodwbca/GXe/IZq
	TGTiUMc3omsIAXO69lh7VVjaJ9HjeeYC3SLP2MDqgIcLqjc0YsTzOFdqGG/tpU1bxLpogucTBRm16
	qsgaiC/gb9QmZbQNmm8axQf5ucRwx/M7yQhEY+AOFMpn3cAcoHodK3a6Dtut3nhZNK43ZjcPwYxi3
	AIsaudwg==;
Received: from viro by zeniv.linux.org.uk with local (Exim 4.96 #2 (Red Hat Linux))
	id 1pMxtu-005JJn-1T;
	Tue, 31 Jan 2023 21:10:46 +0000
Date: Tue, 31 Jan 2023 21:10:46 +0000
From: Al Viro <viro@zeniv.linux.org.uk>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Peter Xu <peterx@redhat.com>, linux-arch@vger.kernel.org,
	linux-alpha@vger.kernel.org, linux-ia64@vger.kernel.org,
	linux-hexagon@vger.kernel.org, linux-m68k@lists.linux-m68k.org,
	Michal Simek <monstr@monstr.eu>, Dinh Nguyen <dinguyen@kernel.org>,
	openrisc@lists.librecores.org, linux-parisc@vger.kernel.org,
	linux-riscv@lists.infradead.org, sparclinux@vger.kernel.org
Subject: Re: [RFC][PATCHSET] VM_FAULT_RETRY fixes
Message-ID: <Y9mD1qp/6zm+jOME@ZenIV>
References: <Y9lz6yk113LmC9SI@ZenIV>
 <CAHk-=whf73Vm2U3jyTva95ihZzefQbThZZxqZuKAF-Xjwq=G4Q@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAHk-=whf73Vm2U3jyTva95ihZzefQbThZZxqZuKAF-Xjwq=G4Q@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230131_131059_323780_9C1C565B 
X-CRM114-Status: GOOD (  10.37  )
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

On Tue, Jan 31, 2023 at 12:24:54PM -0800, Linus Torvalds wrote:

> But *if* the alpha code were to just translate it into the
> FAULT_FLAG_xyz namespace, apretty much *all* of the alpha
> do_page_fault() could have been then done by a completely generic
> "generic_page_fault()" that has all of the retry logic, all of the
> si_code logic, etc etc.

Umm...  What about the semantics of get_user() of unmapped address?
Some architectures do quiet EFAULT; some (including alpha) hit
the sucker with SIGBUS, no matter what.

Examples:
arm
        if (likely(!(fault & (VM_FAULT_ERROR | VM_FAULT_BADMAP | VM_FAULT_BADACCESS))))
		return 0;

	/*
	 * If we are in kernel mode at this point, we
	 * have no context to handle this fault with.
	 */
	if (!user_mode(regs))
		goto no_context;
	...
alpha
 do_sigbus:
        mmap_read_unlock(mm);
        /* Send a sigbus, regardless of whether we were in kernel
           or user mode.  */
        force_sig_fault(SIGBUS, BUS_ADRERR, (void __user *) address);
        if (!user_mode(regs))
                goto no_context;
        return;

Are we free to modify that behaviour, or is that part of arch-specific
ABI?

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
