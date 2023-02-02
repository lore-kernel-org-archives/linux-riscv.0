Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE0F0C636CD
	for <linux-riscv@archiver.kernel.org>; Thu,  2 Feb 2023 00:57:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=k4NEM5DuV/hloIl8Cpk8itopBQQq9qp0yQCY63QvF+Y=; b=Je0MCeYjjRr/wc
	5CITqWG2AptpXCLkHVgJFOrHdqIwynYio3Se4ckPy11OUOVNhY7m1OfP7LUe7d3NbMB/EfRDnBDJe
	HDM99ZAo4061FQcgQQuTl3eUE8Yhqxxj6rK6hb2Z0xFrw5K5IKfvZ3bI6Px5DKCrY7VJ1WKUW8LSL
	RdSx4kPTFrQjZD0VgP5VmAhxT9a5uoeWClPRTk63TzHcWvt7EemCo8X9KY62WyT4Y+ta7urDpsG77
	qCid8Ma65YsqEyP0WU8y4sMOHvJHBJO5kzC2Pju1HBKB5toGMgMFkup8v3SJDERvE56XRYdw8fH1M
	WPijK436diWsKt745PFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pNNuh-00E0lc-Ij; Thu, 02 Feb 2023 00:57:19 +0000
Received: from zeniv.linux.org.uk ([2a03:a000:7:0:5054:ff:fe1c:15ff])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pNNuf-00E0kv-4P
	for linux-riscv@lists.infradead.org; Thu, 02 Feb 2023 00:57:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=linux.org.uk; s=zeniv-20220401; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=JxMhQfqfZFKjqgX5e6WFjusNEH9w7UJyidC9GBl0BFE=; b=j7zrUF5m9QNeSdthOmzY2TpKll
	qPTRkZ/xmNsbI8HChk9xVt34XGsY89y73qsr5zxE8DZeUfti8whyBfVk+Ab+kjUnuReBRNDafmDAX
	/H78PrFrIrMaoRB9EbZbRJ4Zs7Jenz2oKhC7KateHZc+FvE4EURfaz4BFJx0r55ZQo1Vi5FrSgDFI
	yYZWY8336bh2CFJag9KhZHfpHAP/3O0kEIxOVWGnOYTJtYRxmwGwCH3+tArIpGL0USY+brYn81wps
	j1g4I7ez2NpxUerl3TovY+NE3eudMkGv9kBRvPwB8LQ6bXEAiIhDkDZeu/6wMFaHrstuWijmeUQlM
	aZbRGRgw==;
Received: from viro by zeniv.linux.org.uk with local (Exim 4.96 #2 (Red Hat Linux))
	id 1pNNuX-005ZAk-1z;
	Thu, 02 Feb 2023 00:57:09 +0000
Date: Thu, 2 Feb 2023 00:57:09 +0000
From: Al Viro <viro@zeniv.linux.org.uk>
To: Peter Xu <peterx@redhat.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>,
	linux-arch@vger.kernel.org, linux-alpha@vger.kernel.org,
	linux-ia64@vger.kernel.org, linux-hexagon@vger.kernel.org,
	linux-m68k@lists.linux-m68k.org, Michal Simek <monstr@monstr.eu>,
	Dinh Nguyen <dinguyen@kernel.org>, openrisc@lists.librecores.org,
	linux-parisc@vger.kernel.org, linux-riscv@lists.infradead.org,
	sparclinux@vger.kernel.org
Subject: Re: [RFC][PATCHSET] VM_FAULT_RETRY fixes
Message-ID: <Y9sKZTJI7V6qCNRJ@ZenIV>
References: <Y9lz6yk113LmC9SI@ZenIV>
 <CAHk-=whf73Vm2U3jyTva95ihZzefQbThZZxqZuKAF-Xjwq=G4Q@mail.gmail.com>
 <Y9mD1qp/6zm+jOME@ZenIV>
 <CAHk-=wjiwFzEGd_60H3nbgVB=R_8KTcfUJmXy=hSXCvLrXQRFA@mail.gmail.com>
 <Y9mM5wiEhepjJcN0@ZenIV>
 <CAHk-=wjNwwnBckTo8HLSdsd1ndoAR=5RBoZhdOyzhsnDAYWL9g@mail.gmail.com>
 <Y9rCBqwbLlLf1fHe@x1n>
 <Y9rlI6d5J2Y/YNQ+@ZenIV>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Y9rlI6d5J2Y/YNQ+@ZenIV>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230201_165717_230245_735289A2 
X-CRM114-Status: GOOD (  14.37  )
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

On Wed, Feb 01, 2023 at 10:18:11PM +0000, Al Viro wrote:
> 	* logics for stack expansion includes this twist:
>         if (!(vma->vm_flags & VM_GROWSDOWN))
>                 goto map_err;
>         if (user_mode(regs)) {
>                 /* Accessing the stack below usp is always a bug.  The
>                    "+ 256" is there due to some instructions doing
>                    pre-decrement on the stack and that doesn't show up
>                    until later.  */
>                 if (address + 256 < rdusp())
>                         goto map_err;
>         }
>         if (expand_stack(vma, address))
>                 goto map_err;
> That's m68k; ISTR similar considerations elsewhere, but I could be
> wrong.

Hell, yes - 
        if (!(vma->vm_flags & VM_GROWSDOWN))
                goto bad_area;
        if (!(fault_code & FAULT_CODE_WRITE)) {
                /* Non-faulting loads shouldn't expand stack. */
                insn = get_fault_insn(regs, insn);
                if ((insn & 0xc0800000) == 0xc0800000) {
                        unsigned char asi;

                        if (insn & 0x2000)
                                asi = (regs->tstate >> 24);
                        else
                                asi = (insn >> 5);
                        if ((asi & 0xf2) == 0x82)
                                goto bad_area;
                }
        }
        if (expand_stack(vma, address))
                goto bad_area;

Note that it's very much not a bug - it's a nonfaulting (== speculative)
load, and the place where we are heading from bad_area in this case is
this in do_kernel_fault():
        if (!(fault_code & (FAULT_CODE_WRITE|FAULT_CODE_ITLB)) &&
            (insn & 0xc0800000) == 0xc0800000) {
                if (insn & 0x2000)
                        asi = (regs->tstate >> 24);
                else  
                        asi = (insn >> 5);
                if ((asi & 0xf2) == 0x82) {
                        if (insn & 0x1000000) {
                                handle_ldf_stq(insn, regs);
                        } else {
                                /* This was a non-faulting load. Just clear the
                                 * destination register(s) and continue with the next
                                 * instruction. -jj
                                 */
                                handle_ld_nf(insn, regs);
                        }
                        return;

(the name is misguiding - it covers userland stuff as well; in this
particular case the triggering instruction is non-priveleged)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
