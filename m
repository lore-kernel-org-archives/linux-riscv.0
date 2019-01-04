Return-Path: <SRS0=RZUB=PM=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.4 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 43FC4C43387
	for <infradead-linux-riscv@archiver.kernel.org>; Fri,  4 Jan 2019 03:14:48 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1E8F920815
	for <infradead-linux-riscv@archiver.kernel.org>; Fri,  4 Jan 2019 03:14:47 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="B/ep/H6j"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1E8F920815
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.crashing.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Mime-Version:References:In-Reply-To:
	Date:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4kL2l4w+I1yGfk/ZnJBRiRtgrlGSjxdLyETjardbtTM=; b=B/ep/H6jttsmWC
	BnxUxqyLCEpuV/zxuwp2SAz/CFrzUzRHBJs41wrd35qW/3jeR+CUytUOPHhfHfgv+BOreT1FsLr6S
	/rnGqW0HFhuA8NbbTlCne/eMDy+uJmypAfl4SZiW2Wgn8w9RZ36J3BiWHLme5Ixyg/CoMD8l28Jlv
	n7iMPLnxI/HmEvln4GWr25OGdLFxx63hEqvxWpiIfeSs78InIvkELIbmwouJO8Oam/YBKqH4JobEg
	OA67x9dEpoNPIsbocj6me3fPgg2iUiRNa9VdLFHjXTH9ESuCgmmkI7Y6bhbEWQtaoEOX3168eTfpt
	rAfgv+WJHym0c9xsG6Ew==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gfFwb-0004o4-OI; Fri, 04 Jan 2019 03:14:45 +0000
Received: from gate.crashing.org ([63.228.1.57])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gfFuS-0002tH-HC
 for linux-riscv@lists.infradead.org; Fri, 04 Jan 2019 03:12:43 +0000
Received: from localhost (localhost.localdomain [127.0.0.1])
 by gate.crashing.org (8.14.1/8.14.1) with ESMTP id x043C6Df010347;
 Thu, 3 Jan 2019 21:12:09 -0600
Message-ID: <18c5803467f84868790442a541f269318395afe7.camel@kernel.crashing.org>
Subject: Re: BUG: FP registers leak across execve
From: Benjamin Herrenschmidt <benh@kernel.crashing.org>
To: Aurelien Jarno <aurelien@aurel32.net>, Palmer Dabbelt <palmer@sifive.com>
Date: Fri, 04 Jan 2019 14:12:06 +1100
In-Reply-To: <20190104013932.ksexuhjssygj4jml@aurel32.net>
References: <20181210221328.fdl2eoe5cqxudgfs@aurel32.net>
 <mhng-3e9bd56b-e190-4b20-b428-dcfb1c0f15f2@palmer-si-x1c4>
 <20190104013932.ksexuhjssygj4jml@aurel32.net>
User-Agent: Evolution 3.30.3 (3.30.3-1.fc29) 
Mime-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190103_191233_345282_586EFC4F 
X-CRM114-Status: GOOD (  14.88  )
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
Cc: linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Fri, 2019-01-04 at 02:39 +0100, Aurelien Jarno wrote:
> On 2019-01-03 15:36, Palmer Dabbelt wrote:
> > On Mon, 10 Dec 2018 14:13:28 PST (-0800), aurelien@aurel32.net wrote:
> > > Hi all,
> > > 
> > > Debugging some glibc testsuite math failures, I have found out that most
> > > of the time, the FP status register and the FP registers are not zeroed
> > > as they should. This can be tested with the attached code. The best way
> > > to reproduce it is to execute from Python (i guess Perl or another
> > > interpreted language that support FP computation should work). When
> > > running an FP computation before calling the program, the result of the
> > > computation can be seen in f10.
> > > 
> > > The zeroing of the FP status happens in kernel/process.c in the
> > > flush_thread function. It seems that the kernel restore that state only
> > > if a context switch happens between flush_thread and the first FP
> > > instruction of the executed program.
> > > 
> > > A possible workaround is to restore of the FP registers in flush_thread,
> > > but that's probably not the best way to do that:
> > > 
> > > 
> > > --- a/arch/riscv/kernel/process.c
> > > +++ b/arch/riscv/kernel/process.c
> > > @@ -93,6 +93,7 @@ void flush_thread(void)
> > >          *      fflags: accrued exceptions cleared
> > >          */
> > >         memset(&current->thread.fstate, 0, sizeof(current->thread.fstate));
> > > +       fstate_restore(current, task_pt_regs(current));
> > >  #endif
> > >  }
> > 
> > Are you running this in QEMU?  IIRC there was a bug here and we might not
> > have the right fix upstream yet.
> 
> I can reproduce the issue in a QEMU 3.1 VM running a 4.20 kernel, but
> also on an HFU board running the original kernel.

You can do that or force a restore in start_thread I think. (powerpc
does all that stuff in start_thread rather than flush_thread but that's
probably not that great an idea).

Cheers,
Ben.


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
