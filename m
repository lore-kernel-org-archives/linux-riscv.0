Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0C91C3ABA5
	for <linux-riscv@archiver.kernel.org>; Tue, 29 Apr 2025 18:01:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zHn126ttp7bEvWyG13/ZrgUnfc5mkyGojtJtzdG/4BU=; b=Yxhrp5WDAav+qj
	+GlyehaeRPXqW+0MKoCFTMTdRnvZQ52Pa0tQSyDoi3ftalgvst497RZAfHslnLhVIAPCuiPINBsUd
	Nmxy6J+ZsqcVs5K18pDyGOXpX+RsMaMiv8mz7fHYypLJDRYPHVapHuFm/rLSt96WxxwyVvwNDO/g3
	a0+EbxWFO4eZDNT4n12TJugH6QPKGVV/lNhi8ghNHVjk7Hu1KYlJ68bWmkTnntUvBkhZtyVqguwhA
	vy/QdNCPzeG2fqhzljeaABBfinDV6JbdUaEm9zGvzTrz2RYKEt1/hQ6r/9EnIVSMfFs2CWKpjGPwS
	OWtqhsnCQGodbmpBZc5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9pGl-0000000ATLp-1X8b;
	Tue, 29 Apr 2025 18:01:23 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9oD0-0000000AKNS-124m
	for linux-riscv@lists.infradead.org;
	Tue, 29 Apr 2025 16:53:26 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 36B11615EE;
	Tue, 29 Apr 2025 16:52:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B4AA5C4CEEA;
	Tue, 29 Apr 2025 16:53:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1745945605;
	bh=UGcKKVQF62LQ6hsPGiNLBxAkwhPYxGX2ggkQXxOx59E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Scxr8UDB67KnQvqCCXhbOpKdwm1LeY6NpiVlg5X/yFgLDByBaOWBs47ipLZz3NNDm
	 HvP37FmsSysPqVU/Qc0mPX0h9ewOew0mwJWSK/CDnMNK6SqemYFECKMvLJxRmhNjJZ
	 KlffCCx6w7N5Tioo2Smh6ImSxhy0RQwTZrZURImg=
Date: Tue, 29 Apr 2025 18:51:43 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Nam Cao <namcao@linutronix.de>
Cc: stable@vger.kernel.org, Kai Zhang <zhangkai@iscas.ac.cn>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Samuel Holland <samuel.holland@sifive.com>,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH stable v6.6] riscv: kprobes: Fix wrong lengths passed to
 patch_text_nosync()
Message-ID: <2025042957-dazzler-frying-9051@gregkh>
References: <20250429161418.838564-1-namcao@linutronix.de>
 <2025042945-financial-rumbling-bcd0@gregkh>
 <20250429164614.g3w8JJAk@linutronix.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250429164614.g3w8JJAk@linutronix.de>
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

On Tue, Apr 29, 2025 at 06:48:21PM +0200, Nam Cao wrote:
> On Tue, Apr 29, 2025 at 06:31:09PM +0200, Greg Kroah-Hartman wrote:
> > On Tue, Apr 29, 2025 at 06:14:18PM +0200, Nam Cao wrote:
> > > Unlike patch_text(), patch_text_nosync() takes the length in bytes, not
> > > number of instructions. It is therefore wrong for arch_prepare_ss_slot() to
> > > pass length=1 while patching one instruction.
> > > 
> > > This bug was introduced by commit b1756750a397 ("riscv: kprobes: Use
> > > patch_text_nosync() for insn slots"). It has been fixed upstream by commit
> > > 51781ce8f448 ("riscv: Pass patch_text() the length in bytes"). However,
> > > beside fixing this bug, this commit does many other things, making it
> > > unsuitable for backporting.
> > 
> > We would almost always want the original commit, why not just send that
> > instead?  What is wrong with it being in here as-is?
> 
> The original commit is probably fine. But I'm paranoid, because it is not
> completely obvious whether the original commit would break something else
> in v6.6. Because, as mentioned, it does more than just fixing the bug.

You should be more paranoid about creating a one-off change that is NOT
upstream as in our experience, that almost always causes a new problem.

Please just backport the original and submit it after testing it out.

thanks,

greg k-h

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
