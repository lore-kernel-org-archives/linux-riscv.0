Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E35B7C6FA82
	for <linux-riscv@archiver.kernel.org>; Fri,  2 Sep 2022 17:59:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3+JVc9ld4SkHQPRlR75+D/OqYBGmfxNu/QFqDbinSdI=; b=ate2fKHE12QXsj
	c7rB94AMZ8boe44nv5dsPO2viERuXyL00PMINMpe9yKSvdZsDdqH5mYyNLAT8oHXInP67tOPL7kWO
	IxjE2+tQ4mIMAivaYeNxiA4x7iQ+nhmzba9ZBiRy84IaI7dQp7YI501Mf4IH7MaVk0araYG6Qdo37
	7SnVbITQ8SdSHDXKXFZE3Ka7OXMjSocpiw6W8SplmZ4ZmKHeVTBiEG16nyPLOT8nmxhadNRxruuIL
	sObocxPHIM0yQWIevOTlhPrqNvaU8GgJiQyudbWZ7rOdGWPcSHAee7keKsIyCjQVVOGhv727WzCAw
	cUtWC2o+Ay6rhg1q4+EA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oUAxC-008gP0-UI; Fri, 02 Sep 2022 17:59:42 +0000
Received: from zeniv.linux.org.uk ([2a03:a000:7:0:5054:ff:fe1c:15ff])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oUAxA-008gKS-6L
	for linux-riscv@lists.infradead.org; Fri, 02 Sep 2022 17:59:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=linux.org.uk; s=zeniv-20220401; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=jDC7BqYo1R92jQlcphXp72QFerhqQBqx/36u1nEWo8I=; b=Pn7d4Cl4P8/i9GBaN50WiffbYK
	TKDYFY8U3yBtZN+zJ+3zSxzCAtxn/lkMvLobXg5x1mq4iN4hxADhMn7S5tEXeirHu2uW70ML6Xh2n
	uQnAcUbaaebbkJ/wa9yjIAz37GOKdKxhWvXubVPc/dFY96cc0QSVBUgEikDzSNGhat3o3gqAgCmjA
	jhdRluR1HqbYhXX2Ov0jDcgZpVAfa5ZyFLZ12uTpr6GRpl3ZUil2SJ9SjjkYy5uXb9AOSIT4bIaC+
	4BQ99DEmyac5wgNxcTIktHmEt3+RODZ83fsAgJCxECMOqKSFbuMsowsT9sH04pA0dCheJ5EzREgWB
	LynoUUFQ==;
Received: from viro by zeniv.linux.org.uk with local (Exim 4.95 #2 (Red Hat Linux))
	id 1oUAx7-00BPZr-1h;
	Fri, 02 Sep 2022 17:59:37 +0000
Date: Fri, 2 Sep 2022 18:59:37 +0100
From: Al Viro <viro@zeniv.linux.org.uk>
To: Andrew Jones <ajones@ventanamicro.com>
Cc: linux-riscv@lists.infradead.org,
	Linus Torvalds <torvalds@linux-foundation.org>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] riscv: fix a nasty sigreturn bug...
Message-ID: <YxJEiSq/CGaL6Gm9@ZenIV>
References: <YU0wDzeS/jXwkAca@zeniv-ca.linux.org.uk>
 <20220902092245.ande6fvievnbn35h@kamzik>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220902092245.ande6fvievnbn35h@kamzik>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220902_105940_297637_7694C89B 
X-CRM114-Status: GOOD (  14.23  )
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

On Fri, Sep 02, 2022 at 11:22:45AM +0200, Andrew Jones wrote:

> So, for riscv, where in do_signal and handle_signal syscall restarting
> is avoided when regs->cause != EXC_SYSCALL and it's common to set cause
> to -1 to avoid it, then it makes sense to set regs->cause != EXEC_SYSCALL
> in rt_sigreturn or in restore_sigcontext, which rt_sigreturn calls, as
> well.
> 
> So the only question I have is whether or not the cause assignment
> is better in restore_sigcontext() like other architectures? At least,
> since rt_sigreturn is the only caller of restore_sigcontext, it can't
> break anything putting it there atm...

	The only reason for doing that in restore_sigcontext() is that for
old architectures there'd been separate sigreturn(2) and rt_sigreturn(2).
Doing that in the helper shared by both avoided duplication; since
there's no such thing on riscv...

	Matter of taste, really - I have a slight preference for doing that
closer to the syscall surface, but it's no more than that.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
