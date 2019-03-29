Return-Path: <SRS0=QLKY=SA=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 515F4C43381
	for <infradead-linux-riscv@archiver.kernel.org>; Fri, 29 Mar 2019 20:32:23 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 10B1E2184C
	for <infradead-linux-riscv@archiver.kernel.org>; Fri, 29 Mar 2019 20:32:23 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Zy3RZK2t"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 10B1E2184C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=goodmis.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kZ6feygjLdoRkHSi6o0mBtGNQy8X/yxy938b6SgCkfE=; b=Zy3RZK2titxX/G
	1MP6oZOepUrwMschOjKJ11ZFAg8MCsnXsDIpkJlYDvnOrAPgqlefMj07O+h8JhHVQP0SXjFD3wE2v
	ADbzihWy4w/B21rAjcZukQAtWc2+RuYsfguy97sReJRq8f2LUb9mYGxK7SjEgiCSfA3nHiGASObCH
	glS3GnRZHscbgvQQKQoppUInimp17i76iO4Rr5jObMe4XVzbqAS98c3N/9wozXykczTs+uGldUAYM
	INJU3guobMvnJIGWzhdf80/zfDdOHfERxTLwDv+JWF9qXLi4PI5ysKIlr8tKAA/d7jo7suYdLWaVS
	vbwYJY6FH9VRirlLsSrQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h9yAk-0003gu-8I; Fri, 29 Mar 2019 20:32:18 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h9yAc-0003X9-OX
 for linux-riscv@lists.infradead.org; Fri, 29 Mar 2019 20:32:12 +0000
Received: from gandalf.local.home (cpe-66-24-58-225.stny.res.rr.com
 [66.24.58.225])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 99A97218AC;
 Fri, 29 Mar 2019 20:32:09 +0000 (UTC)
Date: Fri, 29 Mar 2019 16:32:08 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: "Dmitry V. Levin" <ldv@altlinux.org>
Subject: Re: [PATCH] riscv: fix syscall_get_arguments() and
 syscall_set_arguments()
Message-ID: <20190329163208.73f6d9fa@gandalf.local.home>
In-Reply-To: <20190329181109.GA32651@altlinux.org>
References: <20190329171221.GA32456@altlinux.org>
 <20190329131514.3e4ec93e@gandalf.local.home>
 <CAEn-LTpY6Tto1N9irXJeOb4iB=qSYhb=jM0E=Z9ppumbPX6GSw@mail.gmail.com>
 <20190329135635.7e136350@gandalf.local.home>
 <20190329181109.GA32651@altlinux.org>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190329_133210_811743_3E24CD71 
X-CRM114-Status: GOOD (  13.83  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Will Drewry <wad@chromium.org>, Kees Cook <keescook@chromium.org>,
 David Abdurachmanov <david.abdurachmanov@gmail.com>,
 Palmer Dabbelt <palmer@sifive.com>, linux-kernel@vger.kernel.org,
 Andy Lutomirski <luto@amacapital.net>, Ingo Molnar <mingo@redhat.com>,
 linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Fri, 29 Mar 2019 21:11:09 +0300
"Dmitry V. Levin" <ldv@altlinux.org> wrote:

> On Fri, Mar 29, 2019 at 01:56:35PM -0400, Steven Rostedt wrote:
> > On Fri, 29 Mar 2019 18:52:18 +0100
> > David Abdurachmanov <david.abdurachmanov@gmail.com> wrote:
> >   
> > > I have alternative version posted in December part of SECCOMP
> > > patchset which is based on arm64 implementation.
> > > 
> > > http://lists.infradead.org/pipermail/linux-riscv/2018-December/002450.html
> > > 
> > > I noticed that SECCOMP wasn't working properly if filters were
> > > checking syscall arguments, because populated arguments were wrong.
> > > 
> > > Btw, I plan to send v2 of SECCOMP patchset soonish.  
> > 
> > Please do. I want to get my patch series out, which will require these
> > changes.  
> 
> Sorry, I haven't seen the alternative patch posted by David before.
> Apparently, besides fixing the bug it also introduces new sanity checks
> of "i" and "n" arguments in syscall_get_arguments() and
> syscall_set_arguments().
> 
> Given that your patchset removes these arguments completely,
> I see little sense in adding new checks that are going to be removed
> by the subsequent commit in the series.

I agree. I'm going to pull in Dmitry's patches as my patches are going
to rewrite most the code anyway, and no need for the extra churn of the
sanity checks that are going to become irrelevant immediately afterward.

-- Steve

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
