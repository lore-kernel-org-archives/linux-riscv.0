Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E45CEB64DA
	for <linux-riscv@archiver.kernel.org>; Sun,  2 Jul 2023 18:45:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VGD09fRJ30FYNJ00zgBnGBRxRW+pXpt/Na5PHVj8qNE=; b=X3N7jOAZf27SfA
	Qugv5RAyAgUXraiGY1yu1iGmrXG9zIyHaN5EvPCYoQeegH77XjqJQg4Kq3iYpGRkSDMr0n72cExCp
	1N+0m0ZyA8l4CVamQLEr+NgkI574Ls5NUtC9f/RMuejohUDkkb2lxhyE+8LNEecegNbFMQSch4brx
	xHlKNPY5UIQiDWUF5z9pd96DIWFXWBwhBiGKQxSjeCanl/qRePykMlzPqTGJxVSUO8KQjvPMGN6aS
	e54OOdGEEOXh04CcBRDDZgVExUF7yqTQIRDNMXVPvQn/co0xw0lqh9YcfstzSA4rSUHoxAmQrsUyw
	B7SxO3cA+WteosmoPg2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qG24G-008Mk8-1d;
	Sun, 02 Jul 2023 18:45:04 +0000
Received: from ded1.1wt.eu ([163.172.96.212] helo=1wt.eu)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qG24C-008Mii-0b
	for linux-riscv@lists.infradead.org;
	Sun, 02 Jul 2023 18:45:02 +0000
Received: (from willy@localhost)
	by pcw.home.local (8.15.2/8.15.2/Submit) id 362IirQm017346;
	Sun, 2 Jul 2023 20:44:53 +0200
Date: Sun, 2 Jul 2023 20:44:53 +0200
From: Willy Tarreau <w@1wt.eu>
To: Zhangjin Wu <falcon@tinylab.org>
Cc: thomas@t-8ch.de, arnd@arndb.de, david.laight@aculab.com,
        linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
        linux-riscv@lists.infradead.org
Subject: Re: [PATCH v5 06/14] tools/nolibc: arch-*.h: clean up multiple
 whitespaces
Message-ID: <20230702184453.GF16233@1wt.eu>
References: <cover.1687957589.git.falcon@tinylab.org>
 <eb4c7a381cf856c9d8e7d679b28507a258cab26a.1687957589.git.falcon@tinylab.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <eb4c7a381cf856c9d8e7d679b28507a258cab26a.1687957589.git.falcon@tinylab.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230702_114500_691005_9E93C4AD 
X-CRM114-Status: GOOD (  14.14  )
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

Hi Zhangjin,

On Wed, Jun 28, 2023 at 09:19:33PM +0800, Zhangjin Wu wrote:
> To align with Linux code style and let scripts/checkpatch.pl happy, the
> multiple whitespaces in arch-<ARCH>.h files are cleaned up.
> 
> Most of them are modified by these commands automatically:
> 
>     $ sed -i -e '/#define my_syscall/,/})/{s/        /\t/g}' tools/include/nolibc/arch-*.h
>     $ sed -i -e '/#define my_syscall/,/})/{s/ *\\$/\t\\/g}' tools/include/nolibc/arch-*.h
> 
> And checked with:
> 
>     $ grep '  *\\$' tools/include/nolibc/arch-*.h

I'm surprised by this one, I never saw checkpatch complain here. For me,
putting a tab after a non-tab is an error. It makes the code harder to
edit and re-align, and diffs are harder to read on lines whose lengths
varies by +/-1 around a multiple of 8 as it makes the post-tab stuff
zigzag. You made me recheck the coding style file, and there's nothing
about alignment there, only about indent (and indent uses tabs here).
There are also other parts which use spaces for alignment (albeit not
that many), so unless there is a solid reason for changing that, I'd
rather not do it, as for me it's the exact opposite of a cleanup as it
will cause me quite some discomfort.

> Besides, more multiple whitespaces are cleaned up:
> 
> - convert "__asm__  volatile" to "__asm__ volatile"

I totally agree on this one, it's very likely the result of a mechanical
change.

> - "foo _num  bar" should be "foo _num bar"

In theory yes, except that for those where it appears it was only to
keep all declarations aligned given that this _num was shorter by one
char than all other local names. Especially when it comes to enumerating
register names, you definitely want to keep them aligned. It's sufficiently
difficult to avoid mistakes there, any help for visual check counts.

Willy

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
