Return-Path: <SRS0=l78j=AZ=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 881E8C433EA
	for <linux-riscv@archiver.kernel.org>; Tue, 14 Jul 2020 07:12:22 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 577662076D
	for <linux-riscv@archiver.kernel.org>; Tue, 14 Jul 2020 07:12:22 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="RS/Itq+b"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 577662076D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lst.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Wx1JsZY3iTBAetgxRxEhx9LwTRCbc1NDwPmhKMUaXHs=; b=RS/Itq+bukkP3ZFB4VjmhS8zQ
	EIwMauer1YY0KcSHLZn1jMsI6GXuvw+dRUGjBmZcawTLBHBtZO562byMnNubSZY7bAeh9pQCFWzxG
	RcYXIHHlQDuqJqblEd64UR9OZ/hxQmUa2d83tE/ggeyGwaeLCWLvvLOmMNcWBsnFz1g9CaiKPdaHA
	/xVaB27A8bXHCf2+Q97H9+TfoSCLXLmR4aaGUwKvqRaBPvdxa952hAmXhMaYLM2aj79EgQz6RjWtR
	NbNkHgoGQIDi77cOV8xoA1jFdTswNcKAE6tfTycobhVWpqHi2Wd1hejZGTigSZNcmQ/u/Em2AFxTW
	mYgnKgSoA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jvF6u-00027e-IT; Tue, 14 Jul 2020 07:12:16 +0000
Received: from verein.lst.de ([213.95.11.211])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jvF6s-00026x-L0
 for linux-riscv@lists.infradead.org; Tue, 14 Jul 2020 07:12:15 +0000
Received: by verein.lst.de (Postfix, from userid 2407)
 id DB14B68CFE; Tue, 14 Jul 2020 09:12:11 +0200 (CEST)
Date: Tue, 14 Jul 2020 09:12:11 +0200
From: Christoph Hellwig <hch@lst.de>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH 5/6] uaccess: add force_uaccess_{begin,end} helpers
Message-ID: <20200714071211.GC776@lst.de>
References: <20200710135706.537715-1-hch@lst.de>
 <20200710135706.537715-6-hch@lst.de>
 <20200713122148.GA51007@lakrids.cambridge.arm.com>
 <CAMuHMdUCmEeU0G9wkUxZKm5tC9YoB-KXSSCLKwpSia746Myebw@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAMuHMdUCmEeU0G9wkUxZKm5tC9YoB-KXSSCLKwpSia746Myebw@mail.gmail.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200714_031214_821850_C59E806C 
X-CRM114-Status: GOOD (  17.38  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Mark Rutland <mark.rutland@arm.com>,
 Linux-Arch <linux-arch@vger.kernel.org>, Nick Hu <nickhu@andestech.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-riscv <linux-riscv@lists.infradead.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Greentime Hu <green.hu@gmail.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Andrew Morton <akpm@linux-foundation.org>, Vincent Chen <deanbo422@gmail.com>,
 Linus Torvalds <torvalds@linux-foundation.org>, Christoph Hellwig <hch@lst.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Mon, Jul 13, 2020 at 03:19:42PM +0200, Geert Uytterhoeven wrote:
> > This used to set KERNEL_DS, and now it sets USER_DS, which looks wrong
> > superficially.
> 
> Thanks for noticing, and sorry for missing that myself.
> 
> The same issue is present for SuperH:
> 
>     -               set_fs(KERNEL_DS);
>     +               oldfs = force_uaccess_begin();
> 
> So the patch description should be:
> 
>     "Add helpers to wraper the get_fs/set_fs magic for undoing any damage
>      done by set_fs(USER_DS)."
> 
> and leave alone users setting KERNEL_DS?

Yes, this was broken.  Fixed for the next version.

> > If the new behaviour is fine it suggests that the old behaviour was
> > wrong, or that this is superfluous and could go entirely.
> >
> > Geert?
> 
> Nope, on m68k, TLB cache operations operate on the current address space.
> Hence to flush a kernel TLB entry, you have to switch to KERNEL_DS first.
> 
> If we're guaranteed to be already using KERNEL_DS, I guess the
> address space handling can be removed.  But can we be sure?

We can't be sure yet.  But with a lot of my pending work we should be
able to get there in the not too far future.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
