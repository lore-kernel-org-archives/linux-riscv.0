Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 029ADC433EF
	for <linux-riscv@archiver.kernel.org>; Tue, 14 Dec 2021 13:15:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DJ2fsK37PEPlnCiuWPo6xEREmRaQLc2Fl84i3DsMqVs=; b=Hh4C35cM19ZyoV
	Iah1zOtzOkzsA4YXdqrW1DZ3UZY1NLdLqabUpKIClK1tI0MUpldhEuKMdX06p+P5MepRJW4zZYUCG
	iOk1gA2IxExGHlRe0Op9pGopN0nEkAWNtcAHqS3pFnWjRop0I4WCWMtZ6gOEC5/YhKEfGrmNHf9Hd
	zbw0Zqnkf3rBCmF/FQwuXU5Tw9pYeOGcyYIQHKxWkyQY8NFWvAiQ+oBDgY6cPIqkK2nVTQXERiZqw
	rH7vDX2MiCO1LLjrMnAd7quddB1eQAZYFNYHKcvztrr5HN6xl5FkWMr6eK8Fm7WTy9PxdvHCm9Q0w
	OqVc5GvzF6lyG8kD02xQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mx7e5-00E7wp-AQ; Tue, 14 Dec 2021 13:15:05 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mx7du-00E7vD-1Y; Tue, 14 Dec 2021 13:14:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=+SjuTfMdZX234WsFLTKgVuTlJHNKJQ6+73Q7tXhFwCc=; b=XK2cZMDZBs7uBis/aCOTIfy5Id
 Woqbhfb9Jy/KCZQKrZRNKBni0OPi2vhjbBCFXVTZZwdfNF56JsdsQ62OYcF94p2H7RI22o/MO9Gze
 79MLQCmvpO5GoJH/Wc3U5bT1kFBO7szsOivwVrpgEe7O/dPOSpHXg5RQnCMxsxVg4sEL5yLxKaGaN
 o2+DlolygGwKfZqa8tJ/Igl2vUcTDqbbAeBp3a6cbU7DI3cqvUrdvjVUunJvazeyk7h1+n8aLITmy
 mHMZsUktXu9JXz8kjVqgNxu5akRJTqIaRWUcQM0R8KY9P3voRZitjZtMGV0nZpFi23pCL7fHt8sO7
 e7KFAFsQ==;
Received: from willy by casper.infradead.org with local (Exim 4.94.2 #2 (Red
 Hat Linux)) id 1mx7do-00DjQw-6u; Tue, 14 Dec 2021 13:14:48 +0000
Date: Tue, 14 Dec 2021 13:14:48 +0000
From: Matthew Wilcox <willy@infradead.org>
To: Tiezhu Yang <yangtiezhu@loongson.cn>
Cc: David Laight <David.Laight@aculab.com>, Dave Young <dyoung@redhat.com>,
 Baoquan He <bhe@redhat.com>, Vivek Goyal <vgoyal@redhat.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, 
 "linux-ia64@vger.kernel.org" <linux-ia64@vger.kernel.org>,
 "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
 "linux-sh@vger.kernel.org" <linux-sh@vger.kernel.org>,
 "x86@kernel.org" <x86@kernel.org>,
 "linux-fsdevel@vger.kernel.org" <linux-fsdevel@vger.kernel.org>,
 "kexec@lists.infradead.org" <kexec@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Xuefeng Li <lixuefeng@loongson.cn>,
 Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: Re: [PATCH v2 0/2] kdump: simplify code
Message-ID: <YbiYyDRW9aB9jFMD@casper.infradead.org>
References: <1639193588-7027-1-git-send-email-yangtiezhu@loongson.cn>
 <0c5cb37139af4f3e85cc2c5115d7d006@AcuMS.aculab.com>
 <YbXhVxRJfjvKw++W@casper.infradead.org>
 <b7a75ae9253445af81ff2fedd5268af4@AcuMS.aculab.com>
 <YbdcKK3Cq6ITTg/l@casper.infradead.org>
 <36440c0f-8b8a-c401-684f-6f54ce9c061e@loongson.cn>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <36440c0f-8b8a-c401-684f-6f54ce9c061e@loongson.cn>
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

On Tue, Dec 14, 2021 at 06:03:11PM +0800, Tiezhu Yang wrote:
> On 12/13/2021 10:43 PM, Matthew Wilcox wrote:
> > On Mon, Dec 13, 2021 at 08:30:33AM +0000, David Laight wrote:
> > > From: Matthew Wilcox
> > > > Sent: 12 December 2021 11:48
> > > > 
> > > > On Sat, Dec 11, 2021 at 05:53:46PM +0000, David Laight wrote:
> > > > > From: Tiezhu Yang
> > > > > > Sent: 11 December 2021 03:33
> > > > > > 
> > > > > > v2:
> > > > > >   -- add copy_to_user_or_kernel() in lib/usercopy.c
> > > > > >   -- define userbuf as bool type
> > > > > 
> > > > > Instead of having a flag to indicate whether the buffer is user or kernel,
> > > > > would it be better to have two separate buffer pointers.
> > > > > One for a user space buffer, the other for a kernel space buffer.
> > > > > Exactly one of the buffers should always be NULL.
> > > > 
> > > > No.  You should be using an iov_iter instead.  See
> > > > https://lore.kernel.org/all/Ya4bdB0UBJCZhUSo@casper.infradead.org/
> > > > for a start on this.
> > > 
> > > iov_iter gets horribly expensive...
> > 
> > Oh, right.  Reading the kcore is a high-performance path, my mistake.
> > 
> 
> Hi,
> 
> Thank you for your discussions.
> 
> The intention of this patchset is to simplify the related code with no
> functional changes and no side effects.
> 
> At this moment, if you are OK, I will send v3 used with inline function
> copy_to_user_or_kernel() to keep it simple, maybe other more changes can
> be done in the future if no any side effect.

That would be pointless.  I already sent a series to remove this,
which you were cc'd on.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
